//=========================================================================
//	
//	ノーマル系 技エフェクト
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
#include "mus_tool.h"



//----------------------------------------------------------
//	プロトタイプ宣言
//----------------------------------------------------------




//=========================================================================
//
//		「はたく」
//														by matsuda
//=========================================================================
//----------------------------------------------------------
//	プロトタイプ宣言
//----------------------------------------------------------

void SeqWazaHitchrMain(actWork *);
static void SeqWazaTstHitInit(actWork *Xreg);
static void SeqWazaHatakuHitInit(actWork *Xreg);

const	ActOamData	WazaOamData;
const	actHeader	ActHitchrHeader;

#define	VANISH_WAIT		0x08
#define	KIZETSU_WAIT	0x02

//-- NEW はたくｷｬﾗ 2001.08.23(木) --//
static const actAnm HatakuHitAnm0[]={
		{OBJ16_32x32*4,3,0,0},
		{OBJ16_32x32*5,3,0,0},
		{OBJ16_32x32*6,3,0,0},
		{OBJ16_32x32*7,6,0,0},
		{ACT_ANMEND,0,0,0}
};
static const actAnm HatakuHitAnm1[]={
		{OBJ16_32x32*4,3,1,0},
		{OBJ16_32x32*5,3,1,0},
		{OBJ16_32x32*6,3,1,0},
		{OBJ16_32x32*7,6,1,0},
		{ACT_ANMEND,0,0,0}
};
static const actAnm *const HatakuHitAnmTbl[]={
		HatakuHitAnm0,
		HatakuHitAnm1,
};
const	actHeader ActHatakuHitHeader={
	WAZACHR_ID_BINTA,
	WAZACHR_ID_BINTA,
	&WazaOamDataNormal[2],
	HatakuHitAnmTbl,
	0,
	DummyActAffTbl,
	SeqWazaHatakuHitInit,
};

//-- つるのムチ --//
const	actHeader TurunoMutiHeader={
	WAZACHR_ID_TURUNOMUTI,
	WAZACHR_ID_TURUNOMUTI,
	&WazaOamDataNormal[2],
	HatakuHitAnmTbl,
	0,
	DummyActAffTbl,
	SeqWazaHatakuHitInit,
};


//----------------------------------------------------

#define TST_HITANM_WAIT		4
const actAnm TstHitAnm[]={
		{OBJ16_32x32*0,TST_HITANM_WAIT,0,0},
		{OBJ16_32x32*1,TST_HITANM_WAIT,0,0},
		{OBJ16_32x32*2,TST_HITANM_WAIT,0,0},
		{OBJ16_32x32*3,TST_HITANM_WAIT,0,0},
		{OBJ16_32x32*4,TST_HITANM_WAIT+1,0,0},
		{ACT_ANMEND,0,0,0}
};
const actAnm *const TstHitAnmTbl[]={
		TstHitAnm,
};

const actHeader ActTstHitRHeader = {	//add matsuda 01/06/19
	WAZACHR_ID_TSTHIT_R,
	WAZACHR_ID_TSTHIT_R,
	&WazaOamDataNormal[2],
	TstHitAnmTbl,
	0,
	DummyActAffTbl,
	SeqWazaTstHitInit,
};
const actHeader ActTstHitBHeader = {	//add matsuda 01/06/19
	WAZACHR_ID_TSTHIT_B,
	WAZACHR_ID_TSTHIT_B,
	&WazaOamDataNormal[2],
	TstHitAnmTbl,
	0,
	DummyActAffTbl,
	SeqWazaTstHitInit,
};

//-------------------------------------------------------------
//		アクターシーケンス
//-------------------------------------------------------------
void SeqWazaHitchrMain(actWork *Xreg)
{
		if(Xreg->anmend_sw==1){
			DelWazaEffect(Xreg);
		}
}

//----------------------------------------------------------
//	
//----------------------------------------------------------
static void SeqWazaTstHitInit(actWork *Xreg)
{
	if(MineEnemyCheck(AttackNo))
	{
		Xreg->x-=WazaEffWork[0];
		Xreg->y+=WazaEffWork[1];
	}
	else
	{
		Xreg->x+=WazaEffWork[0];
		Xreg->y+=WazaEffWork[1];
	}
	Xreg->move = W_AnmEndWait;
	SetWorkSeq(Xreg, DelWazaEffect);
}


//----------------------------------------------------------
//	offset 0:Xoffset  1:Yoffset
//----------------------------------------------------------
static void SeqWazaHatakuHitInit(actWork *Xreg)
{
	if(MineEnemyCheck(AttackNo) == SIDE_MINE)
		ActAnmChg(Xreg,1);
	Xreg->move=SeqWazaHitchrMain;
	EffXpositionSet(Xreg, WazaEffWork[0]);
	Xreg->y+=WazaEffWork[1];
}












//=========================================================================
//
//		「ふくろだたき」
//														by nohara
//=========================================================================
//----------------------------------------------------------
//	プロトタイプ宣言
//----------------------------------------------------------
void SeqWazaHukuroInit(actWork *Xreg);

//----------------------------------------------------------
//	ふくろだたき
//----------------------------------------------------------
static const actAffAnm hukuro_aff_anm0[] = {
//	{ 拡縮x, 拡縮y, 角度, ｳｪｲﾄ }
	{ 0x100, 0x100, 0, ACT_AFSET },		// 0
	{ACT_AFEND,0,0,0},					// ﾙｰﾌﾟ , 戻り先
};
static const actAffAnm hukuro_aff_anm1[] = {
//	{ 拡縮x, 拡縮y, 角度, ｳｪｲﾄ }
	{ 0x100, 0x100, 32, ACT_AFSET },	// 32 
	{ACT_AFEND,0,0,0},					// ﾙｰﾌﾟ , 戻り先
};
static const actAffAnm hukuro_aff_anm2[] = {
//	{ 拡縮x, 拡縮y, 角度, ｳｪｲﾄ }
	{ 0x100, 0x100, 64, ACT_AFSET },	// 64
	{ACT_AFEND,0,0,0},					// ﾙｰﾌﾟ , 戻り先
};
static const actAffAnm hukuro_aff_anm3[] = {
//	{ 拡縮x, 拡縮y, 角度, ｳｪｲﾄ }
	{ 0x100, 0x100, 96, ACT_AFSET },	// 96
	{ACT_AFEND,0,0,0},					// ﾙｰﾌﾟ , 戻り先
};
static const actAffAnm hukuro_aff_anm4[] = {
//	{ 拡縮x, 拡縮y, 角度, ｳｪｲﾄ }
	{ 0x100, 0x100, 128, ACT_AFSET },	// 128 
	{ACT_AFEND,0,0,0},					// ﾙｰﾌﾟ , 戻り先
};
static const actAffAnm hukuro_aff_anm5[] = {
//	{ 拡縮x, 拡縮y, 角度, ｳｪｲﾄ }
	{ 0x100, 0x100, 160, ACT_AFSET },	// 160 
	{ACT_AFEND,0,0,0},					// ﾙｰﾌﾟ , 戻り先
};
static const actAffAnm hukuro_aff_anm6[] = {
//	{ 拡縮x, 拡縮y, 角度, ｳｪｲﾄ }
	{ 0x100, 0x100, 192, ACT_AFSET },	// 192 
	{ACT_AFEND,0,0,0},					// ﾙｰﾌﾟ , 戻り先
};
static const actAffAnm hukuro_aff_anm7[] = {
//	{ 拡縮x, 拡縮y, 角度, ｳｪｲﾄ }
	{ 0x100, 0x100, 224, ACT_AFSET },	// 224 
	{ACT_AFEND,0,0,0},					// ﾙｰﾌﾟ , 戻り先
};
static const	actAffAnm * const hukuro_aff_tbl[] = {
	hukuro_aff_anm0,
	hukuro_aff_anm1,
	hukuro_aff_anm2,
	hukuro_aff_anm3,
	hukuro_aff_anm4,
	hukuro_aff_anm5,
	hukuro_aff_anm6,
	hukuro_aff_anm7,
};
const actHeader ActHukuroHeader = 
{
	WAZACHR_ID_KAKUTOU,
	WAZACHR_ID_KAKUTOU,
	&WazaOamDataAffine[2],
	DummyActAnmTbl,
	ACT_NTRANS,		//非転送アニメ
	hukuro_aff_tbl,
	SeqWazaHukuroInit,
};

//-------------------------------------------------------------
// ふくろだたき
//-------------------------------------------------------------
void SeqWazaHukuroInit(actWork *Xreg)
{
	Xreg->x += WazaEffWork[0];
	Xreg->y += WazaEffWork[1];

	Xreg->work[0] = WazaEffWork[2];		//loop
	Xreg->work[1] = WazaEffWork[3];		//work[2]は計算用
	Xreg->work[3] = WazaEffWork[4];		//work[4]も
	Xreg->work[5] = WazaEffWork[5];		//表示on,offの間隔

	ActAffAnmChg(Xreg,WazaEffWork[6]);

	SetWorkSeq(Xreg, W_AffCheckEndSeq);
	Xreg->move=W_ParallelMoveSeq2;
}












//=========================================================================
//
//		「いあいぎり」
//														by matsuda
//=========================================================================
//----------------------------------------------------------
//	プロトタイプ宣言
//----------------------------------------------------------
void SeqWazaIaigiriMain(actWork *Xreg);
void SeqWazaIaigiriInit(actWork *Xreg);
void SeqWazaIaigiriMInit(actWork *Xreg);
void SeqWazaIaigiriFlash(actWork *Xreg);

//----------------------------------------------------------
//	定数定義
//----------------------------------------------------------
#define FLASH_COUNT		1
#define FLASH_LOOP		10

//----------------------------------------------------------
//	アクターテーブル
//----------------------------------------------------------
static const actAnm IaigiriAnm[]={
		{OBJ16_32x32*0,5,0,0},
		{OBJ16_32x32*1,5,0,0},
		{OBJ16_32x32*2,5,0,0},
		{OBJ16_32x32*3,5,0,0},
		{ACT_ANMEND,0,0,0}
};

static const actAnm *const IaigiriAnmTbl[]={
		IaigiriAnm,
};

const	actHeader ActIaigiriHeader={
	WAZACHR_ID_KIRISAKU2,
	WAZACHR_ID_KIRISAKU2,
	&WazaOamDataBldNormal[2],
	IaigiriAnmTbl,
	0,
	DummyActAffTbl,
	SeqWazaIaigiriInit,
};
const	actHeader ActIaigiriMHeader={
	WAZACHR_ID_KIRISAKU2,
	WAZACHR_ID_KIRISAKU2,
	&WazaOamDataBldNormal[2],
	IaigiriAnmTbl,
	0,
	DummyActAffTbl,
	SeqWazaIaigiriMInit,
};


//アニメーションデータフォーマット
/*
	s16 pat;	        //ｷｬﾗｸﾀｰﾃﾞｰﾀﾅﾝﾊﾞｰ
	u8 	wait:6;		//ｳｪｲﾄ
	u8 	hrev:1;		//H反転
	u8 	vrev:1;		//V反転
*/

//----------------------------------------------------------
//	0:Xoffset	1:Yoffset	2:左右反転ﾌﾗｸﾞ(0 or 1)
//----------------------------------------------------------
#define IAIGIRI_DX	(-0x0400)
#define IAIGIRI_DY	(-IAIGIRI_DX)
#define IAIGIRI_GENSOKU	0x0018
void SeqWazaIaigiriInit(actWork *Xreg)
{
	Xreg->x = GetWazaEffPos(DefenceNo, EFF_X);
	Xreg->y = GetWazaEffPos(DefenceNo, EFF_Y);
	if(MineEnemyCheck(DefenceNo) == SIDE_MINE)
		Xreg->y += MINE_SIDE_OFFSET_Y;
	Xreg->move = SeqWazaIaigiriMain;
	if(WazaEffWork[2] == 0)
		Xreg->x+=WazaEffWork[0];
	else
	{
		Xreg->x-=WazaEffWork[0];
		Xreg->Hflip = 1;
	}
	Xreg->y+=WazaEffWork[1];
	Xreg->work[1] += IAIGIRI_DX;
	Xreg->work[2] += IAIGIRI_DY;
	Xreg->work[5] = WazaEffWork[2];
	if(WazaEffWork[2] == 1)
		Xreg->work[1] = -Xreg->work[1];
}
//----------------------------------------------------------
//	いあいぎりの座標を相方にも設定できるようにしたもの
//	0:Xoffset	1:Yoffset	2:左右反転ﾌﾗｸﾞ(0 or 1)
//	3:(0:ディフェンス,1:相方,2:センター)
//----------------------------------------------------------
void SeqWazaIaigiriMInit(actWork *Xreg)
{
	s16	dx = 0,dy = 0;
	
	switch(WazaEffWork[3]){
	case 1:		//ディフェンスの相方に
		dx = GetWazaEffPos(DefenceNo^2,EFF_X);
		dy = GetWazaEffPos(DefenceNo^2,EFF_Y);
		break;
	case 2:		//2匹のセンターに
		dx = GetWazaEffPos(DefenceNo,EFF_X);
		dy = GetWazaEffPos(DefenceNo,EFF_Y);
		if(PokeBG2taimeCheck(DefenceNo^2) != 0){	//2vs2で相方がいれば真中に
			dx = (GetWazaEffPos(DefenceNo^2, EFF_X)+dx)/2;
			dy = (GetWazaEffPos(DefenceNo^2, EFF_Y)+dy)/2;
		}
		break;
	case 0:		//通常どおり、ディフェンスに
	default:
		dx = GetWazaEffPos(DefenceNo,EFF_X);
		dy = GetWazaEffPos(DefenceNo,EFF_Y);
		break;
	}
	
	Xreg->x = dx;
	Xreg->y = dy;
	if(MineEnemyCheck(DefenceNo) == SIDE_MINE)
		Xreg->y += MINE_SIDE_OFFSET_Y;
	Xreg->move = SeqWazaIaigiriMain;
	if(WazaEffWork[2] == 0)
		Xreg->x+=WazaEffWork[0];
	else
	{
		Xreg->x-=WazaEffWork[0];
		Xreg->Hflip = 1;
	}
	Xreg->y+=WazaEffWork[1];
	Xreg->work[1] += IAIGIRI_DX;
	Xreg->work[2] += IAIGIRI_DY;
	Xreg->work[5] = WazaEffWork[2];
	if(WazaEffWork[2] == 1)
		Xreg->work[1] = -Xreg->work[1];
}

void SeqWazaIaigiriMain(actWork *Xreg)
{
	Xreg->work[3] += Xreg->work[1];
	Xreg->work[4] += Xreg->work[2];
	if(Xreg->work[5] == 0)
		Xreg->work[1] += IAIGIRI_GENSOKU;
	else
		Xreg->work[1] -= IAIGIRI_GENSOKU;
	Xreg->work[2] -= IAIGIRI_GENSOKU;
	Xreg->dx = Xreg->work[3] >> 8;
	Xreg->dy = Xreg->work[4] >> 8;
	
	if(++Xreg->work[0] == 20)
	{
		SetWorkSeq(Xreg, DelWazaEffect);
		Xreg->work[0] = 3;
		Xreg->move = W_WaitSeq;

//		DelWazaEffect(Xreg);
	}
/*
	if(Xreg->work[7] == 4)
	{
		Xreg->work[0] = AddActor(&ActIaigiriHeader, Xreg->x-16, Xreg->y+16, 1);
		ActWork[Xreg->work[0]].move = DummyActMove;
	}
	else if(Xreg->work[7] == 8)
	{
		Xreg->work[1] = AddActor(&ActIaigiriHeader, Xreg->x-32, Xreg->y+32, 1);
		ActWork[Xreg->work[1]].move = DummyActMove;
	}
	else if(Xreg->work[7] == 9){
		Xreg->move = SeqWazaIaigiriFlash;
	}
	
	Xreg->work[7]++;
*/
}

void SeqWazaIaigiriFlash(actWork *Xreg)
{
	if(Xreg->work[2] > FLASH_COUNT)
	{
		if(Xreg->work[3] & 1)
		{
			Xreg->banish = 0;
			ActWork[Xreg->work[0]].banish = 0;
			ActWork[Xreg->work[1]].banish = 0;
		}
		else
		{
			Xreg->banish = 1;
			ActWork[Xreg->work[0]].banish = 1;
			ActWork[Xreg->work[1]].banish = 1;
		}
		Xreg->work[2] = 0;
		Xreg->work[3]++;
	}
	else
		Xreg->work[2]++;
	
	if(Xreg->work[3] == FLASH_LOOP)
	{
		DelActor(&ActWork[Xreg->work[0]]);
		DelActor(&ActWork[Xreg->work[1]]);
		DelWazaEffect(Xreg);
	}
}













//=========================================================================
//
//		「ほろびのうた」
//														by matsuda
//=========================================================================
//----------------------------------------------------------
//	プロトタイプ宣言
//----------------------------------------------------------
static void SeqWazaHorobiInit(actWork *Xreg);
static void SeqWazaHorobiMain(actWork *Xreg);

//----------------------------------------------------------
//	定数宣言
//----------------------------------------------------------
//「ほろびのうた」
#define HOROBI_FURIHABA_DX	100
#define HOROBI_FURIHABA_DY	20
#define HOROBI_DESCENT		130	//下降する速度

//----------------------------------------------------------
//	アクターテーブル
//----------------------------------------------------------
//----------------------------------------------------------
//	ほろびのうた
//----------------------------------------------------------
static const actAnm OnpuAnm0[]={
	{OBJ16_16x16 * 0, 1, 0, 0},
	{ACT_ANMEND, 0, 0, 0},
};
static const actAnm OnpuAnm1[]={
	{OBJ16_16x16 * 1, 1, 0, 0},
	{ACT_ANMEND, 0, 0, 0},
};
static const actAnm OnpuAnm2[]={
	{OBJ16_16x16 * 2, 1, 0, 0},
	{ACT_ANMEND, 0, 0, 0},
};
static const actAnm OnpuAnm3[]={
	{OBJ16_16x16 * 3, 1, 0, 0},
	{ACT_ANMEND, 0, 0, 0},
};
static const actAnm OnpuAnm4[]={
	{OBJ16_16x16 * 4, 1, 0, 0},
	{ACT_ANMEND, 0, 0, 0},
};
static const actAnm OnpuAnm5[]={
	{OBJ16_16x16 * 5, 1, 0, 0},
	{ACT_ANMEND, 0, 0, 0},
};
static const actAnm OnpuAnm6[]={
	{OBJ16_16x16 * 0, 1, 0, 1},
	{ACT_ANMEND, 0, 0, 0},
};
static const actAnm OnpuAnm7[]={
	{OBJ16_16x16 * 1, 1, 0, 1},
	{ACT_ANMEND, 0, 0, 0},
};
static const actAnm OnpuAnm8[]={
	{OBJ16_16x16 * 2, 1, 0, 1},
	{ACT_ANMEND, 0, 0, 0},
};
static const actAnm OnpuAnm9[]={
	{OBJ16_16x16 * 3, 1, 0, 1},
	{ACT_ANMEND, 0, 0, 0},
};
static const actAnm *const OnpuAnmTbl[]={
	OnpuAnm0,
	OnpuAnm1,
	OnpuAnm2,
	OnpuAnm3,
	OnpuAnm4,
	OnpuAnm5,
	OnpuAnm6,
	OnpuAnm7,
	OnpuAnm8,
	OnpuAnm9,
};
const	actHeader ActHorobiHeader={
	WAZACHR_ID_ONPU,
	WAZACHR_ID_ONPU,
	&WazaOamDataNormal[1],
	OnpuAnmTbl,
	0,
	DummyActAffTbl,
	SeqWazaHorobiInit,
};

//-------------------------------------------------------------
//		アクターシーケンス
//-------------------------------------------------------------

//=========================================================================
//	ほろびのうた
//=========================================================================
//----------------------------------------------------------
//	offset 0:Xoffset 1:Yoffset 2:秒offset 3:回転ｽﾋﾟｰﾄﾞ
//         4:ﾙｰﾌﾟ回数  5:使用する音符のｸﾞﾗﾌｨｯｸ
//----------------------------------------------------------
static void SeqWazaHorobiInit(actWork *Xreg)
{
	Xreg->work[0] = WazaEffWork[2];	//秒
	if(MineEnemyCheck(AttackNo))
	{
		Xreg->x -= WazaEffWork[0];
//		Xreg->work[1] = -WazaEffWork[3];
	}
	else
	{
		Xreg->x += WazaEffWork[0];
//		Xreg->work[1] = WazaEffWork[3];
	}
	ActAnmChg(Xreg, WazaEffWork[5]);
	Xreg->work[1] = -WazaEffWork[3];
	Xreg->y += WazaEffWork[1];
	Xreg->work[3] = WazaEffWork[4];
	Xreg->move=SeqWazaHorobiMain;
	SeqWazaHorobiMain(Xreg);
}

static void SeqWazaHorobiMain(actWork *Xreg)
{
	Xreg->dx = CosMove(Xreg->work[0], HOROBI_FURIHABA_DX);
	Xreg->dy = SinMove(Xreg->work[0], HOROBI_FURIHABA_DY);

	Xreg->work[0] < 128 ? (Xreg->pri = 0):(Xreg->pri = 14);
	
	Xreg->work[0] = 0xff & (Xreg->work[0] + Xreg->work[1]);
	Xreg->work[5] += HOROBI_DESCENT;
	Xreg->dy += Xreg->work[5] >> 8;
	
	Xreg->work[2]++;
	if(Xreg->work[2] == Xreg->work[3])
		DelWazaEffect(Xreg);
}



















//=========================================================================
//
//		まもる
//												by matsuda 2002.08.02(金)
//=========================================================================
static void MamoruInit(actWork *xreg);
static void MamoruMain(actWork *xreg);

const actHeader MamoruHeader = 
{
	WAZACHR_ID_MAMORU,
	WAZACHR_ID_MAMORU,
	&WazaOamDataBldNormal[3],
	DummyActAnmTbl,
	ACT_NTRANS,		//非転送アニメ
	DummyActAffTbl,
	MamoruInit,
};

//----------------------------------------------------------
//	0:Xoffset	1:Yoffset	2:Delするまでのｳｪｲﾄ
//----------------------------------------------------------
#define MAMORU_COLOR_WAIT	1
#define MAMORU_BLD_WAIT		1
#define MAMORU_ADD_X		0x0060
static void MamoruInit(actWork *xreg)
{
	if(ContestCheck())
		WazaEffWork[1] += 8;	//審判に被らないように
	//WazaDefaultPosSet2(xreg, EFF_MODE);
	xreg->x = GetWazaEffPos2(AttackNo, EFF_X) + WazaEffWork[0];
	xreg->y = GetWazaEffPos2(AttackNo, EFF_Y) + WazaEffWork[1];
	if(MineEnemyCheck(AttackNo) == SIDE_MINE || ContestCheck())
		xreg->oamData.Priority = GetPokeBGPri(AttackNo) + 1;
	else
		xreg->oamData.Priority = GetPokeBGPri(AttackNo);
	xreg->work[0] = WazaEffWork[2];
	xreg->work[2] = ObjPalNumGet(WAZACHR_ID_MAMORU) * 16 + 16*16;

	xreg->work[7] = 16;
	*(vu16*)REG_BLDCNT = BLD_A_BLEND_MODE | BLD_2ND_ALL;
	*(vu16*)REG_BLDALPHA = (xreg->work[7] << 8) | (16-xreg->work[7]);

	xreg->move = MamoruMain;
}

static void MamoruMain(actWork *xreg)
{
	int i;
	u16 temp;
	
	xreg->work[5] += MAMORU_ADD_X;
	xreg->dx = -(xreg->work[5] >> 8);
	
	if(++xreg->work[1] > MAMORU_COLOR_WAIT){
		xreg->work[1] = 0;
		
		temp = PaletteWorkTrans[xreg->work[2]+1];
		for(i = 0; i < 6 ; i++)
			PaletteWorkTrans[xreg->work[2]+1+i]
				 = PaletteWorkTrans[xreg->work[2]+1+i+1];
		PaletteWorkTrans[xreg->work[2]+7] = temp;
	}
	
	if(xreg->work[7] > 6 && xreg->work[0] > 0){
		if(++xreg->work[6] > MAMORU_BLD_WAIT){
			xreg->work[6] = 0;
			xreg->work[7]--;
			*(vu16*)REG_BLDALPHA = (xreg->work[7] << 8) | (16-xreg->work[7]);
		}
	}
	
	if(xreg->work[0] > 0)
		xreg->work[0]--;
	else{
		if(++xreg->work[6] > MAMORU_BLD_WAIT){
			xreg->work[6] = 0;
			xreg->work[7]++;
			*(vu16*)REG_BLDALPHA = (xreg->work[7] << 8) | (16-xreg->work[7]);
			if(xreg->work[7] == 16){
				xreg->banish = 1;
				xreg->move = W_BldClearEnd;
			}
		}
	}
}












//=========================================================================
//
//		「ミルクのみ」
//																	taya
//=========================================================================
#define MILK_YOFS      (-24)

static void MilkActMove(actWork *act);
static void milk_hosei(actWork *act, s16 x, s16 y);
//----------------------------------------------------------
//	ミルクびん（ﾜｰｸ設定不要）
//----------------------------------------------------------

static void MilkActInit(actWork *act)
{
	act->x = GetWazaEffPos(DefenceNo, PM_X);
	act->y = GetWazaEffPos(DefenceNo, PM_Y) + MILK_YOFS;

	act->work[0] = 0;  // 0:ｼｰｹﾝｽ
	act->work[1] = 0;  // 1:ｶｳﾝﾀ
	act->work[2] = 0;  // 2:ｶｳﾝﾀ

	act->work[3] = 0;  // 3:ｶｳﾝﾀ
	act->work[4] = 0;  // 4:角度


	act->work[6] = 0x00;  // 6:eva
	act->work[7] = 0x10;  // 7:evb

	*(vu16*)REG_BLDCNT = BLD_A_BLEND_MODE | BLD_2ND_ALL;
	*(vu16*)REG_BLDALPHA = (act->work[7] << 8) | act->work[6];

	act->move = MilkActMove;
}

static void MilkActMove(actWork *act)
{
	switch(act->work[0]){
	case 0:
		if(++(act->work[2]) > 0){
			act->work[2] = 0;
			act->work[1]++;
			if(act->work[1] & 1){
				if(act->work[6] < 0x10) act->work[6]++;
			}else{
				if(act->work[7] > 0x00) act->work[7]--;
			}
			*(vu16*)REG_BLDALPHA = (act->work[7] << 8) | act->work[6];
			if(act->work[6] == 0x10 && act->work[7] == 0x00)
			{
				act->work[1] = 0;
				act->work[0]++;
			}
		}
		break;

	case 1:
		if(++(act->work[1]) > 8){
			act->work[1] = 0;
			ActAffAnmChg(act, 1);
			act->work[0]++;


		}
		break;

	case 2:

		milk_hosei(act, 16, 4);
		if(++(act->work[1]) > 2)
		{
			act->work[1] = 0;
			act->y++;
		}
		if(++(act->work[2]) > 29){
			if(act->work[2] & 1){
				if(act->work[6] > 0x00) act->work[6]--;
			}else{
				if(act->work[7] < 0x10) act->work[7]++;
			}
			*(vu16*)REG_BLDALPHA = (act->work[7] << 8) | act->work[6];
			if(act->work[6] == 0x00 && act->work[7] == 0x10)
			{
				act->work[1] = 0;
				act->work[2] = 0;
				act->work[0]++;
			}
		}
		break;

	case 3:
		act->banish = 1;  // 半透明レジスタを初期化しても見えないように
		act->work[0]++;
		break;

	case 4:
		*(vu16*)REG_BLDCNT = 0;
		*(vu16*)REG_BLDALPHA = 0;
		DelWazaEffect(act);
		break;
	}
}
// ミルクビンの傾きに合わせてdx,dy補正
static void milk_hosei(actWork *act, s16 x, s16 y)
{
	if(act->work[3] < 12)
	{
		act->work[4] += 2;
	}

	if(act->work[3] >= 18 && act->work[3] < 42)
	{
		act->work[4] -= 2;
	}

	if(act->work[3] >= 48)
	{
		act->work[4] += 2;
	}

	act->dx = act->work[4] / 9;
	act->dy = act->work[4] / 14;
	if(act->dy < 0){
		act->dy *= -1;
	}

	act->work[3]++;
	if(act->work[3] >= 60)
	{
		act->work[3] = 0;
	}
}

static const actAffAnm MilkAffAnm0[]=
{
	{ 0x100, 0x100, 0, ACT_AFSET, },
	{ ACT_AFEND, 0, 0,  },
};
static const actAffAnm MilkAffAnm1[]=
{
	{ 0x00, 0x00, 2, 12 },
	{ 0x00, 0x00, 0, 6 },
	{ 0x00, 0x00,-2, 24 },
	{ 0x00, 0x00, 0, 6 },
	{ 0x00, 0x00, 2, 12 },
	{ ACT_AFLOOP, 0, 0, 0 },
};
static const actAffAnm * const MilkAffAnmTbl[] = {
	MilkAffAnm0,
	MilkAffAnm1,
};

const actHeader ActMilkHeader = {
	WAZACHR_ID_MILK,
	WAZACHR_ID_MILK,
	&WazaOamDataBldAffine[2],
	DummyActAnmTbl,
	0,
	MilkAffAnmTbl,
	MilkActInit,
};

//=========================================================================
//	キラキラエフェクト
// offset 0:Xoffset 1:Yoffset 2: (0=攻撃側に出す  1=防御側に出す)
//		  3:X方向へ進むｽﾋﾟｰﾄﾞ(固定少数)   4:Y方向へ進むｽﾋﾟｰﾄﾞ(固定少数)
//		  5:Delするまでのwait
//=========================================================================
static void SeqWazaKirakira2Init(actWork *Xreg)
{
	if(WazaEffWork[2] == 0)
		EffPositionReset(Xreg);
	EffXpositionSet(Xreg, WazaEffWork[0]);
	Xreg->y += WazaEffWork[1];
	
	Xreg->work[0] = WazaEffWork[5];
	Xreg->work[1] = WazaEffWork[3];
	Xreg->work[2] = WazaEffWork[4];
	SetWorkSeq(Xreg, DelWazaEffect);
	Xreg->move = W_ParallelMove2Seq;
}
//=========================================================================
//	キラキラエフェクト:マルチ対応バージョン
// offset 0:Xoffset 1:Yoffset 2: (0=攻撃側に出す  1=防御側に出す)
//		  3:X方向へ進むｽﾋﾟｰﾄﾞ(固定少数)   4:Y方向へ進むｽﾋﾟｰﾄﾞ(固定少数)
//		  5:Delするまでのwait,6:Mode(EFF_MODE,PM_MODE)
//		  
//	add 0207029	by iwasawa
//=========================================================================
#define M2P_DISPCHK	(1)	//2Pが画面内にいるかチェック
static void SeqWazaKirakira2MInit(actWork *Xreg)
{
	u8	client = 0;
	
	if(WazaEffWork[2] == 0)	client = AttackNo;
	else					client = DefenceNo;

#if M2P_DISPCHK
	if(FightCheck() && PokeBG2taimeCheck(client^2)){	//2vs2&&相方が画面にいる
#else	
	if(FightCheck() && ClientPokeExistCheck(client^2)){	//2vs2&&相方が生きている
#endif		
		GetCenterEffPos(client,WazaEffWork[6],&(Xreg->x),&(Xreg->y));
		EffXpositionSet(Xreg, WazaEffWork[0]);
		Xreg->y += WazaEffWork[1];
	}
	else{
		if(WazaEffWork[6] == EFF_MODE){
			Xreg->x = GetWazaEffPos(client,EFF_X);
			Xreg->y = GetWazaEffPos(client,EFF_Y)+WazaEffWork[1];
		}else{
			Xreg->x = GetWazaEffPos(client,PM_X);
			Xreg->y = GetWazaEffPos(client,PM_Y)+WazaEffWork[1];
		}
		EffXpositionSet(Xreg, WazaEffWork[0]);
	}

#if 0
	//コンテスト中はプライオリティを上げる
	if(ContestCheck()) Xreg->oamData.Priority = 1;
#endif

	Xreg->work[0] = WazaEffWork[5];
	Xreg->work[1] = WazaEffWork[3];
	Xreg->work[2] = WazaEffWork[4];
	SetWorkSeq(Xreg, DelWazaEffect);
	Xreg->move = W_ParallelMove2Seq;
}
//----------------------------------------------------------
//	キラキラしたエフェクト		add 2001.08.21(火)
//----------------------------------------------------------
#define KIRA_ANM_WAIT		7

static const actAnm Kira2_anm0[] =
{
	{OBJ16_32x32 * 0, KIRA_ANM_WAIT, 0, 0},
	{OBJ16_32x32 * 1, KIRA_ANM_WAIT, 0, 0},
	{OBJ16_32x32 * 2, KIRA_ANM_WAIT, 0, 0},
	{OBJ16_32x32 * 3, KIRA_ANM_WAIT, 0, 0},
	{OBJ16_32x32 * 4, KIRA_ANM_WAIT, 0, 0},
	{OBJ16_32x32 * 5, KIRA_ANM_WAIT, 0, 0},
	{OBJ16_32x32 * 6, KIRA_ANM_WAIT, 0, 0},
	{OBJ16_32x32 * 7, KIRA_ANM_WAIT, 0, 0},
	{ACT_ANMLOOP, 0, 0, 0},
};
static const actAnm * const Kira2AnmTbl[] = 
{
	Kira2_anm0,
};
const	actHeader ActKirakira2Header={
	WAZACHR_ID_KIRAKIRA2,
	WAZACHR_ID_KIRAKIRA2,
	&WazaOamDataNormal[2],
	Kira2AnmTbl,
	0,
	DummyActAffTbl,
	SeqWazaKirakira2Init,
};
//add 020729	by iwasawa
const actHeader ActKirakira2MHeader = {
	WAZACHR_ID_KIRAKIRA2,
	WAZACHR_ID_KIRAKIRA2,
	&WazaOamDataNormal[2],
	Kira2AnmTbl,
	0,
	DummyActAffTbl,
	SeqWazaKirakira2MInit,
};

//=========================================================================
//
//		「ねむる」
//														by mori
//=========================================================================
//----------------------------------------------------------
//	プロトタイプ宣言
//----------------------------------------------------------
static void SeqWazaHanaChoutinInit( actWork * Xreg );
static void SeqWazaHanaChoutin( actWork * Xreg );
static void SeqWazaZzzzInit( actWork *Xreg);
static void SeqWazaZzzz( actWork * Xreg );

//----------------------------------------------------------
//	定数宣言
//----------------------------------------------------------

//----------------------------------------------------------
//	アクターテーブル
//----------------------------------------------------------
static const actAnm HanaChoutinAnm1[]={
		{OBJ16_16x16*0,10,0,0},
		{OBJ16_16x16*1,10,0,0},
		{OBJ16_16x16*2,10,0,0},
		{OBJ16_16x16*3,10,0,0},
		{OBJ16_16x16*4,90,0,0},
		{OBJ16_16x16*4,5,0,0},
		{OBJ16_16x16*5,5,0,0},
		{OBJ16_16x16*6,15,0,0},
		{ACT_ANMEND,0,0,0}
};

static const actAnm HanaChoutinAnm2[]={
		{OBJ16_16x16*0,10,1,0},
		{OBJ16_16x16*1,10,1,0},
		{OBJ16_16x16*2,10,1,0},
		{OBJ16_16x16*3,10,1,0},
		{OBJ16_16x16*4,90,1,0},
		{OBJ16_16x16*4,5,1,0},
		{OBJ16_16x16*5,5,1,0},
		{OBJ16_16x16*6,15,1,0},
		{ACT_ANMEND,0,0,0}
};

static const actAnm *const HanaChoutinAnmTbl[]={
	HanaChoutinAnm1,
	HanaChoutinAnm2,
};


const	actHeader ActHanaChoutinHeader={
	WAZACHR_ID_HANA_C,
	WAZACHR_ID_HANA_C,
	&WazaOamDataNormal[1],
	HanaChoutinAnmTbl,
	0,
	DummyActAffTbl,
	SeqWazaHanaChoutinInit,

};



static const actAnm ZzzzAnm[]={
		{OBJ16_32x32*0,40,0,0},
		{ACT_ANMEND,0,0,0}
};



static const actAnm *const ZzzzAnmTbl[]={
	ZzzzAnm,
};

//----------------------------------------------------------
//	「Ｚｚｚ」
//----------------------------------------------------------
#define ZZZ_LOOP		(24)
#define ZZZ1_THETA		(1)
#define ZZZ2_THETA		(-6)
#define ZZZ1_AFF		(8)
#define ZZZ2_AFF		(-5)
#define ZZZ_AFF_LOOP	(5)

static const actAffAnm ZzzAffAnm0[]=			//「ねむる」&「ねむり」状態の「Ｚｚｚ」
{
	{ 20, 20, -30,			ACT_AFSET},
	{ ZZZ1_AFF, ZZZ1_AFF, ZZZ1_THETA, ZZZ_LOOP},
	{ ACT_AFEND, 0, 0,  },
	{ACT_AFcLOOP,0,0,0},
	{ 0, 0, ZZZ1_THETA, ZZZ_LOOP},
	{ACT_AFcLOOP,10,0,0},
  	
};

static const actAffAnm ZzzAffAnm1[]=			//「ねむる」&「ねむり」状態の「Ｚｚｚ」
{
	{ 20, 20, 30,			ACT_AFSET},
	{ ZZZ1_AFF, ZZZ1_AFF, -ZZZ1_THETA, ZZZ_LOOP},
	{ ACT_AFEND, 0, 0,  },
	{ACT_AFcLOOP,0,0,0},
	{ 0, 0, -ZZZ1_THETA, ZZZ_LOOP},
	{ACT_AFcLOOP,10,0,0},
  	
};

static const	actAffAnm * const ZzzAffTbl[] = {
	ZzzAffAnm0,
	ZzzAffAnm1,
};

const	actHeader ActZzzzHeader={
	WAZACHR_ID_ZZZ2,
	WAZACHR_ID_ZZZ2,
	&WazaOamDataAffine[2],
	ZzzzAnmTbl,
	0,
	ZzzAffTbl,
	SeqWazaZzzzInit,

};



//---------------------------------------------------------------
//	アクターシーケンス
//---------------------------------------------------------------
//----------------------------------------------------------
// はなちょうちんが飛ぶ		初期化
// WazaEffWork[0]:	
// WazaEffWork[1]:	
//----------------------------------------------------------
static void SeqWazaHanaChoutinInit( actWork * Xreg )
{
	EffPositionReset(Xreg);
#if 0
	if((AttackNo & 1) == 0){	//自分側
		Xreg->x += WazaEffWork[0];
		Xreg->y += WazaEffWork[1];
	}else{									//相手側
		Xreg->x -= WazaEffWork[0];
		Xreg->y += WazaEffWork[1];
		ActAnmChg(Xreg,1);
	}
#else	//changed by soga 2001.09.25
	if(MineEnemyCheck(AttackNo) == SIDE_MINE){	//自分側
		Xreg->x += WazaEffWork[0];
		Xreg->y += WazaEffWork[1];
	}else{									//相手側
		Xreg->x -= WazaEffWork[0];
		Xreg->y += WazaEffWork[1];
		ActAnmChg(Xreg,1);
	}
#endif
	Xreg->move = SeqWazaHanaChoutin;
	
}

//----------------------------------------------------------
// はなちょうちんが飛ぶ
//----------------------------------------------------------
static void SeqWazaHanaChoutin( actWork * Xreg )
{
	u16	w;
	Xreg->work[0]++;

	if(Xreg->work[0]>30){
		Xreg->dy=-(Xreg->work[0]-30)/3;
		w = Xreg->work[1]*4;
		Xreg->dx=SinMove(w,3);
		Xreg->work[1]++;
	}
	if(Xreg->anmend_sw)
		DelWazaEffect(Xreg);
	
}


//----------------------------------------------------------
// Ｚｚｚマークが飛ぶ	初期化
//WazaEffWork[0]:	X
//WazaEffWork[1]:	Y
//WazaEffWork[2]:	0:左手　1:右手
//----------------------------------------------------------
static void SeqWazaZzzzInit( actWork * Xreg )
{
	EffPositionReset(Xreg);
	if(MineEnemyCheck(AttackNo) == SIDE_MINE){		//自分
		Xreg->x += WazaEffWork[0];
		Xreg->y += WazaEffWork[1];
		Xreg->work[3] = 1;
	}else{											//相手
		Xreg->x -= WazaEffWork[0];
		Xreg->y += WazaEffWork[1];
		Xreg->work[3] = -1;
		ActAffAnmChg(Xreg,1);
	}

	Xreg->move = SeqWazaZzzz;
}

//----------------------------------------------------------
// Ｚｚｚマークが飛ぶ
//----------------------------------------------------------
static void SeqWazaZzzz( actWork * Xreg )
{

	Xreg->dy = -(Xreg->work[0]/40);
	Xreg->dx =  Xreg->work[4]/10;
	Xreg->work[4] += 2*Xreg->work[3];
	Xreg->work[0] += Xreg->work[1];

	Xreg->work[1]++;

	if(Xreg->work[1]>60)
		W_AffCheckEndSeq(Xreg);
}














//=========================================================================
//
//		ロックオン
//												by matsuda 2002.05.13(月)
//=========================================================================
static void RockOnInit(actWork *xreg);
static void RockOnMain(actWork *xreg);
static void RockOnEndCheck(actWork *xreg);
static void RockOnSetMain(actWork *xreg);
static void RockOnFlash(actWork *xreg);
static void RockOnTenmetuWait(actWork *xreg);
static void RockOnTenmetu(actWork *xreg);
static void RockOn2Init(actWork *xreg);

//-- 中の小さい照準 --//
const	actHeader RockOnHeader={
	WAZACHR_ID_ROCKON,
	WAZACHR_ID_ROCKON,
	&WazaOamDataNormal[2],
	DummyActAnmTbl,
	0,
	DummyActAffTbl,
	RockOnInit,
};

//-- 外側の照準 --//
const	actHeader RockOn2Header={
	WAZACHR_ID_ROCKON,
	WAZACHR_ID_ROCKON,
	&WazaOamDataNormal[1],
	DummyActAnmTbl,
	0,
	DummyActAffTbl,
	RockOn2Init,
};

//----------------------------------------------------------
//	offset:なし
// 0xffffがWazaEffWork[7]に入ると、点滅を開始して終了
//----------------------------------------------------------
#define ROCKON_WAIT_MOVE	1	//動き出すまでのｳｪｲﾄ
#define ROCKON_MOVE_SYNC	8	//0x0600	//動く早さ
#define ROCKON_SET_WAIT		10	//動きが終了して照準がｾｯﾄされるまでのｳｪｲﾄ
#define ROCKON_CENTERMOVE_SYNC	6	//照準がｾｯﾄされる速度

#define ROCKON_OUTOFFS_X	8	//ｾｯﾄされたときのﾎﾟｹﾓﾝ中心からのXOFFSET
#define ROCKON_OUTOFFS_Y	8

#define ROCKON_TENMETU		3	//照準が点滅する速度

#define ROCKON_END_TBL	4
static const s8 RockOnMoveOffset[ROCKON_END_TBL][2] = {	//移動ｵﾌｾｯﾄ座標
	{64, 64},
	{0, -64},
	{-64,64},
	{32,-32},
};
static void RockOnInit(actWork *xreg)
{
	xreg->x -= 32;
	xreg->y -= 32;
	xreg->work[0] = 20;
	xreg->move = W_WaitSeq;
	SetWorkSeq(xreg, RockOnMain);
}

static void RockOnMain(actWork *xreg)
{
	switch(xreg->work[5] & 1){
		case 0:
			xreg->work[0] = ROCKON_WAIT_MOVE;
			xreg->move = W_WaitSeq;
			SetWorkSeq(xreg, RockOnMain);
			break;
		case 1:
			xreg->x += xreg->dx;
			xreg->y += xreg->dy;
			xreg->dx = xreg->dy = 0;
			xreg->work[0] = ROCKON_MOVE_SYNC;
			xreg->work[2] = xreg->x + RockOnMoveOffset[xreg->work[5]>>8][0];
			xreg->work[4] = xreg->y + RockOnMoveOffset[xreg->work[5]>>8][1];
			xreg->move = W_StraightSyncMove;
			SetWorkSeq(xreg, RockOnEndCheck);
			xreg->work[5] += 0x0100;

			SePlayPan(SE_W199, GetWazaEffSePan(WAZA_SE_R));
			break;
	}
	xreg->work[5] ^= 1;
}

static void RockOnEndCheck(actWork *xreg)
{
	if((xreg->work[5] >> 8) == ROCKON_END_TBL)
	{
		xreg->work[0] = ROCKON_SET_WAIT;
		xreg->move = W_WaitSeq;
		SetWorkSeq(xreg, RockOnSetMain);
	}
	else
		xreg->move = RockOnMain;
}

static void RockOnSetMain(actWork *xreg)
{
	s16 offsetX, offsetY;
	
	if(xreg->oamData.AffineParam == 0){
		xreg->work[0] = ROCKON_CENTERMOVE_SYNC / 2;
		xreg->work[1] = 0;
		xreg->work[2] = 0;
		xreg->move = W_WaitSeq;
		SetWorkSeq(xreg, RockOnFlash);
	}else{
		switch(xreg->oamData.AffineParam){
			case 1:	//左上
				offsetX = -ROCKON_OUTOFFS_X;
				offsetY = -ROCKON_OUTOFFS_Y;
				break;
			case 2:	//左下
				offsetX = -ROCKON_OUTOFFS_X;
				offsetY = ROCKON_OUTOFFS_Y;
				break;
			case 3:	//右上
				offsetX = ROCKON_OUTOFFS_X;
				offsetY = -ROCKON_OUTOFFS_Y;
				break;
			case 4:	//右下
			default:
				offsetX = ROCKON_OUTOFFS_X;
				offsetY = ROCKON_OUTOFFS_Y;
				break;
		}
		xreg->x += xreg->dx;
		xreg->y += xreg->dy;
		xreg->dx = xreg->dy = 0;
		xreg->work[0] = ROCKON_CENTERMOVE_SYNC;
		xreg->work[2] = GetWazaEffPos(DefenceNo, PM_X) + offsetX;
		xreg->work[4] = GetWazaEffPos(DefenceNo, PM_Y) + offsetY;
		xreg->move = W_StraightSyncMove;
		SetWorkSeq(xreg, RockOnTenmetuWait);
	}
}

static void RockOnFlash(actWork *xreg)
{
	u32 fade_bit;
	u8 palno;
	
	if(xreg->work[2] == 0){
		xreg->work[1] += 3;
		if(xreg->work[1] > 16)
			xreg->work[1] = 16;
	}else{
		xreg->work[1] -= 3;
		if(xreg->work[1] < 0)
			xreg->work[1] = 0;
	}
	fade_bit = GetBattleFadeBit(1,1,1,1,1,0,0);
	ColorConceChange(fade_bit, xreg->work[1], 0x7fff);
	if(xreg->work[1] == 16){
		xreg->work[2]++;
		palno = xreg->oamData.Pltt;		//ﾛｯｸｵﾝを赤色に
		PaletteWorkSet(&PaletteWork[16*16+palno*16+8], 16*16+palno*16+1, 4);

		SePlayPan(SE_W043, GetWazaEffSePan(WAZA_SE_R));
	}
	else if(xreg->work[1] == 0)
		xreg->move = RockOnTenmetuWait;
}

static void RockOnTenmetuWait(actWork *xreg)
{
	if((u16)WazaEffWork[7] == 0xffff){
		xreg->work[0] = xreg->work[1] = 0;
		xreg->move = RockOnTenmetu;
	}
}

static void RockOnTenmetu(actWork *xreg)
{
	if(xreg->work[0] % ROCKON_TENMETU == 0){
		xreg->work[1]++;
		xreg->banish ^= 1;
	}
	xreg->work[0]++;
	if(xreg->work[1] == 8)
		DelWazaEffect(xreg);
}

//----------------------------------------------------------
//	外側の照準
//	0:照準のどこの位置をしめすか(0:禁止、1:左上、2:左下、3:右上、4:右下)
//----------------------------------------------------------
static void RockOn2Init(actWork *xreg)
{
	xreg->oamData.AffineParam = WazaEffWork[0];
	if(WazaEffWork[0] == 1){
		xreg->x -= 24;
		xreg->y -= 24;
	}else if(WazaEffWork[0] == 2){
		xreg->x -= 24;
		xreg->y += 24;
		//xreg->Vflip = 1;
		xreg->oamData.AffineParamNo = 16;
	}else if(WazaEffWork[0] == 3){
		xreg->x += 24;
		xreg->y -= 24;
		//xreg->Hflip = 1;
		xreg->oamData.AffineParamNo = 8;
	}else{
		xreg->x += 24;
		xreg->y += 24;
//		xreg->Hflip = 1;
//		xreg->Vflip = 1;
		xreg->oamData.AffineParamNo = 24;
	}
	xreg->oamData.CharNo += 0x10;
	xreg->move = RockOnInit;
	xreg->move(xreg);
}








/*=======================================================================*/
/*  ずつき                                                       taya    */
/*=======================================================================*/
//-------------------------------------
//  定数
//-------------------------------------
#define ZUTUKI_BACK_SYNC  (6)
#define ZUTUKI_BACK_SPD   (2)
#define ZUTUKI_FWD_SYNC   (4)
#define ZUTUKI_FWD_SPD    (3)

#define ZUTUKI_DOWN_SYNC  (4)
#define ZUTUKI_DOWN_THETA (0x300)
#define ZUTUKI_UP_SYNC    (3)
#define ZUTUKI_UP_THETA   (0x400)

#define ZUTUKI_WAIT_SYNC  (8)

//-------------------------------------
//  関数プロトタイプ
//-------------------------------------
static void SeqWazaZutukiInit(actWork *Xreg);
static void SeqWazaZutukiBack(actWork *Xreg);
static void SeqWazaZutukiHeadDown(actWork *Xreg);
static void SeqWazaZutukiFwd(actWork *Xreg);
static void SeqWazaZutukiHeadUp(actWork *Xreg);
static void SeqWazaZutukiHeadUpWait(actWork *Xreg);
static void SeqWazaZutukiDel(actWork *Xreg);

//------------------------------------
// アクター
//------------------------------------
const actHeader ActZutukiHeader={
	0,
	0,
	&DummyActOam,
	DummyActAnmTbl,
	0,
	DummyActAffTbl,
	SeqWazaZutukiInit,
};
//-------------------------------------------------------------
//	アクターシーケンス
//-------------------------------------------------------------
//----------------------------------------------
//	初期化（WazaEffWork[0]の値で動作指定）
//  0 ... 後ろに下がる＆頭を下げる
//	1 ... 前に進む
//	2 ... 頭を上げる
//----------------------------------------------
static void SeqWazaZutukiInit(actWork *Xreg)
{
	Xreg->banish = 1;
	Xreg->work[0] = 0;
	switch(WazaEffWork[0]){
	case 0: Xreg->move = SeqWazaZutukiBack; break;
	case 1: Xreg->move = SeqWazaZutukiFwd;  break;
	case 2: Xreg->move = SeqWazaZutukiHeadUpWait;  break;
	default: Xreg->move = SeqWazaZutukiDel;  break;
	}
}
/*-- うしろに下がる --*/
static void SeqWazaZutukiBack(actWork *Xreg)
{
	Xreg->work[0] = ZUTUKI_BACK_SYNC;
	Xreg->work[1] = MineEnemyCheck(AttackNo)? ZUTUKI_BACK_SPD : -ZUTUKI_BACK_SPD;
	Xreg->work[2] = 0;
	Xreg->work[3] = PokemonStruct[AttackNo];
	SetWorkSeq(Xreg, SeqWazaZutukiHeadDown);
	Xreg->move = W_PokeParallelMoveSeq;
}
/*-- 頭を下げる --*/
static void SeqWazaZutukiHeadDown(actWork *Xreg)
{
	if(Xreg->work[0] == 0){
		Xreg->work[3] = PokemonStruct[AttackNo];
		PokeKakusyukuInit(Xreg->work[3], 0);
		Xreg->work[6] = MineEnemyCheck(AttackNo);
		Xreg->work[4] = (Xreg->work[6])? ZUTUKI_DOWN_THETA : -ZUTUKI_DOWN_THETA;
		Xreg->work[5] = 0;
	}

	Xreg->work[5] += Xreg->work[4];
	PokeKakusyukuSet(Xreg->work[3], 0x100, 0x100, Xreg->work[5]);

//	if(Xreg->work[6] == 0){
		W_AdjustKaitenYPos(Xreg->work[3]);
//	}

	if(++(Xreg->work[0]) >= ZUTUKI_DOWN_SYNC){
		Xreg->work[0] = 0;
		Xreg->move = SeqWazaZutukiDel;
	}
}
/*-- 前に進む --*/
static void SeqWazaZutukiFwd(actWork *Xreg)
{
	Xreg->work[0] = ZUTUKI_FWD_SYNC;
	Xreg->work[1] = MineEnemyCheck(AttackNo)? -ZUTUKI_FWD_SPD : ZUTUKI_FWD_SPD;
	Xreg->work[2] = 0;
	Xreg->work[3] = PokemonStruct[AttackNo];
	SetWorkSeq(Xreg, SeqWazaZutukiDel);
	Xreg->move = W_PokeParallelMoveSeq;
}
/*-- 頭を上げる前のウェイト --*/
static void SeqWazaZutukiHeadUpWait(actWork *Xreg)
{
	if(++(Xreg->work[0]) > 8){
		Xreg->work[0] = 0;
		Xreg->move = SeqWazaZutukiHeadUp;
	}
}
/*-- 頭を上げる --*/
static void SeqWazaZutukiHeadUp(actWork *Xreg)
{
	if(Xreg->work[0] == 0){
		Xreg->work[3] = PokemonStruct[AttackNo];
		Xreg->work[6] = MineEnemyCheck(AttackNo);
		if(MineEnemyCheck(AttackNo)){
			Xreg->work[4] = -ZUTUKI_UP_THETA;
			Xreg->work[5] = ZUTUKI_DOWN_THETA * ZUTUKI_DOWN_SYNC;
		}else{
			Xreg->work[4] = ZUTUKI_UP_THETA;
			Xreg->work[5] = -ZUTUKI_DOWN_THETA * ZUTUKI_DOWN_SYNC;
		}
	}

	Xreg->work[5] += Xreg->work[4];
	PokeKakusyukuSet(Xreg->work[3], 0x100, 0x100, Xreg->work[5]);
//	if(Xreg->work[6] == 0){
		W_AdjustKaitenYPos(Xreg->work[3]);
//	}

	if(++(Xreg->work[0]) >= ZUTUKI_UP_SYNC){
		PokeKakusyukuEnd(Xreg->work[3]);
		Xreg->move = SeqWazaZutukiDel;
	}
}
/*-- アクター削除 --*/
static void SeqWazaZutukiDel(actWork *Xreg)
{
//		AffineDelActor(Xreg);
		DelWazaEffect(Xreg);
}



/*=======================================================================*/
/*                                                                       */
/*  つのでつく                                                           */
/*                                                               taya    */
/*=======================================================================*/
//-------------------------------------
//  定数
//-------------------------------------
#define TUNODETUKU_ROLL_SYNC   (4)
#define TUNODETUKU_ROLL_THETA  (0x200)

//-------------------------------------
//  関数プロトタイプ
//-------------------------------------
void SeqWazaTunodetukuCtrlInit(actWork *Xreg);
void SeqWazaTunodetukuCtrl(actWork *Xreg);

//------------------------------------
// アクター
//------------------------------------
const actHeader ActTunodeTukuCtrlHeader = {
	0,
	0,
	&DummyActOam,
	DummyActAnmTbl,
	0,
	DummyActAffTbl,
	SeqWazaTunodetukuCtrlInit,
};
//==============================================
//	初期化
//==============================================
void SeqWazaTunodetukuCtrlInit(actWork *Xreg)
{
	Xreg->work[0] = 0;
	Xreg->move = SeqWazaTunodetukuCtrl;
}
//==============================================
//	メイン
//==============================================
void SeqWazaTunodetukuCtrl(actWork *Xreg)
{
	switch(Xreg->work[0]){
	case 0:
		Xreg->work[1] = 0;
		Xreg->work[2] = PokemonStruct[AttackNo];
		Xreg->work[3] = MineEnemyCheck(AttackNo);
		Xreg->work[4] = (Xreg->work[3])? TUNODETUKU_ROLL_THETA : -TUNODETUKU_ROLL_THETA;
		Xreg->work[5] = 0;
		PokeKakusyukuInit(Xreg->work[2], 0);
		Xreg->work[0]++;
		/* FALLTHRU */
	case 1:
		Xreg->work[5] += Xreg->work[4];
		PokeKakusyukuSet(Xreg->work[2], 0x100, 0x100, Xreg->work[5]);
		W_AdjustKaitenYPos(Xreg->work[2]);
		if(++(Xreg->work[1]) >= TUNODETUKU_ROLL_SYNC){
			Xreg->work[1] = 0;
			Xreg->work[4] *= -1;
			Xreg->work[0]++;
		}
		break;

	case 2:
		Xreg->work[5] += Xreg->work[4];
		PokeKakusyukuSet(Xreg->work[2], 0x100, 0x100, Xreg->work[5]);
		W_AdjustKaitenYPos(Xreg->work[2]);
		if(++(Xreg->work[1]) >= TUNODETUKU_ROLL_SYNC){
			PokeKakusyukuEnd(Xreg->work[2]);
			DelWazaEffect(Xreg);
		}
		break;
	}
}


//=========================================================================
//	「ロケットずつき」
//
//															by taya
//=========================================================================
#define RZ_BACK_SYNC   (8)
#define RZ_BACK_SPD    (3)
#define RZ_FWD_SYNC    (3)
#define RZ_FWD_SPD     (8)
#define RZ_LEANDOWN_SYNC   (8)
#define RZ_LEANDOWN_THETA  (192)
//#define RZ_LEANDOWN_SYNC   (12)
//#define RZ_LEANDOWN_THETA  (128)
#define RZ_BURU_CNT    (8)
#define RZ_BURU_WAIT   (1)
#define RZ_BURU_WIDTH  (2)
#define RZ_WAIT_SYNC   (12)

static void TaskRocketZutuki1st(u8 id);
static void TaskRocketZutuki2nd(u8 id);

//======================================================
//	WazaEffWork[0]で動作指定
//	0:後ろに下がり、頭突きを食らわすまで
//	1:その場で傾きを元に戻す
//======================================================
void TaskRocketZutuki(u8 id)
{
	TaskTable[id].work[0] = PokemonStruct[AttackNo];
	TaskTable[id].work[1] = MineEnemyCheck(AttackNo);
	TaskTable[id].work[2] = 0;

	switch(WazaEffWork[0]){
	case 0:
		TaskTable[id].work[2] = 0;
		TaskTable[id].work[3] = RZ_BACK_SYNC;
		TaskTable[id].work[4] = 0;
		TaskTable[id].work[5] = RZ_BACK_SPD;
		if(TaskTable[id].work[1] == 0){
			TaskTable[id].work[5] *= -1;
		}
		TaskTable[id].TaskAdrs = TaskRocketZutuki1st;
		break;

	case 1:
		TaskTable[id].work[3] = RZ_LEANDOWN_SYNC;
		TaskTable[id].work[4] = RZ_LEANDOWN_THETA * RZ_LEANDOWN_SYNC;
		TaskTable[id].work[5] = RZ_LEANDOWN_THETA;
		if(TaskTable[id].work[1] == 0){
			TaskTable[id].work[4] *= -1;
			TaskTable[id].work[5] *= -1;
		}
		TaskTable[id].TaskAdrs = TaskRocketZutuki2nd;
		break;

	default:
		DelTaskEffect(id);
		break;
	}
}
//================================================
//	0:ｱｸﾀｰﾅﾝﾊﾞ  1:ｼｰｹﾝｽﾅﾝﾊﾞ  
//================================================
static void TaskRocketZutuki1st(u8 id)
{
	TASK_TABLE *my = &TaskTable[id];
	switch(my->work[2]){
	// 後ろへ下がる
	case 0:
		if(my->work[3]){
			my->work[4] += my->work[5];
			ActWork[my->work[0]].dx = my->work[4];
			my->work[3]--;
		}else{
			my->work[3] = RZ_LEANDOWN_SYNC;
			my->work[4] = 0;
			my->work[5] = (my->work[1]==0)? -RZ_LEANDOWN_THETA : RZ_LEANDOWN_THETA;
			PokeKakusyukuInit(my->work[0], 0);
			my->work[2]++;
		}
		break;

	// 傾く
	case 1:
		if(my->work[3]){
			my->work[4] += my->work[5];
			PokeKakusyukuSet(my->work[0], 0x100, 0x100, my->work[4]);
			W_AdjustKaitenYPos(my->work[0]);
			my->work[3]--;
		}else{
			my->work[3] = RZ_BURU_CNT;
			my->work[4] = ActWork[my->work[0]].dx;
			my->work[5] = (my->work[1]==0)? RZ_BURU_WIDTH : -RZ_BURU_WIDTH;
			my->work[6] = RZ_BURU_WAIT;
			my->work[2]++;
		}
		break;

	// 震える
	case 2:
		if(my->work[3]){
			if(my->work[6]){
				my->work[6]--;
				break;
			}

			if(my->work[3] & 1){
				ActWork[my->work[0]].dx = my->work[4] + my->work[5];
			}else{
				ActWork[my->work[0]].dx = my->work[4] - my->work[5];
			}

			my->work[6] = RZ_BURU_WAIT;
			my->work[3]--;
		}else{
			ActWork[my->work[0]].dx = my->work[4];
			my->work[3] = RZ_WAIT_SYNC;
			my->work[2]++;
		}
		break;

	// 静止
	case 3:
		if(my->work[3]){
			my->work[3]--;
		}else{
			my->work[3] = RZ_FWD_SYNC;
			my->work[4] = ActWork[my->work[0]].dx;
			my->work[5] = (my->work[1]==0)? RZ_FWD_SPD : -RZ_FWD_SPD;
			my->work[2]++;
		}
		break;

	// 発射（前へ）
	case 4:
		if(my->work[3]){
			my->work[4] += my->work[5];
			ActWork[my->work[0]].dx = my->work[4];
			my->work[3]--;
		}else{
			DelTaskEffect(id);
		}
		break;

	}
}
static void TaskRocketZutuki2nd(u8 id)
{
	TASK_TABLE *my = &TaskTable[id];
	if(my->work[3]){
		my->work[4] -= my->work[5];
		PokeKakusyukuSet(my->work[0], 0x100, 0x100, my->work[4]);
		W_AdjustKaitenYPos(my->work[0]);
		my->work[3]--;
	}else{
		PokeKakusyukuEnd(my->work[0]);
		DelTaskEffect(id);
	}

}


//=========================================================================
//	「きりさく」「みねうち」
//
//																by taya
//=========================================================================
#define KIRISAKU_ANM_WAIT    (4)
#define MINEUCHI_DEFAULT_XOFS  (-48)
#define MINEUCHI_MOVE_SYNC     (12)
#define MINEUCHI_MOVE_SPD      (8)

static void KirisakuActInit(actWork *act);
static void KirisakuTenmetuActMove(actWork *act);
static void MineuchiActInit(actWork *act);
static void MineuchiAnmWait(actWork *act);
static void MineuchiMoveWait(actWork *act);
static void MineuchiZanzouActInit(actWork *act);

static const actAnm KirisakuAnm0[] =
{
	{OBJ16_32x32 * 0, KIRISAKU_ANM_WAIT, 0, 0},
	{OBJ16_32x32 * 1, KIRISAKU_ANM_WAIT, 0, 0},
	{OBJ16_32x32 * 2, KIRISAKU_ANM_WAIT, 0, 0},
	{OBJ16_32x32 * 3, KIRISAKU_ANM_WAIT, 0, 0},
	{ACT_ANMEND, 0, 0, 0},
};
static const actAnm KirisakuAnm1[] =
{
	{OBJ16_32x32 * 3, KIRISAKU_ANM_WAIT, 0, 0},
	{ACT_ANMEND, 0, 0, 0},
};

static const actAnm * const KirisakuAnmTbl[] = 
{
	KirisakuAnm0,
	KirisakuAnm1,
};

// きりさく
const actHeader KirisakuHeader = 
{
	WAZACHR_ID_KIRISAKI,
	WAZACHR_ID_KIRISAKI,
	&WazaOamDataNormal[2],
	KirisakuAnmTbl,
	ACT_NTRANS,
	DummyActAffTbl,
	KirisakuActInit,
};
// みねうち（本体）
const actHeader MineuchiHeader = 
{
	WAZACHR_ID_MINEUCHI,
	WAZACHR_ID_MINEUCHI,
	&WazaOamDataNormal[2],
	KirisakuAnmTbl,
	ACT_NTRANS,
	DummyActAffTbl,
	MineuchiActInit,
};
// みねうち（残像）
const actHeader MineuchiZanzouHeader = 
{
	WAZACHR_ID_MINEUCHI,
	WAZACHR_ID_MINEUCHI,
	&WazaOamDataNormal[2],
	KirisakuAnmTbl,
	ACT_NTRANS,
	DummyActAffTbl,
	MineuchiZanzouActInit,
};

//----------------------------------------------
//	「きりさく」初期化
//	0:（0:攻撃側  1:防御側）
//	1: X offset  2: Y offset
//----------------------------------------------
static void KirisakuActInit(actWork *act)
{
	if(WazaEffWork[0] == 0){
		act->x = GetWazaEffPos(AttackNo, PM_X) + WazaEffWork[1];
		act->y = GetWazaEffPos(AttackNo, PM_Y) + WazaEffWork[2];
	}else{
		act->x = GetWazaEffPos(DefenceNo, PM_X) + WazaEffWork[1];
		act->y = GetWazaEffPos(DefenceNo, PM_Y) + WazaEffWork[2];
	}
	act->work[0] = 0;
	act->work[1] = 0;
	SetWorkSeq(act, KirisakuTenmetuActMove);
	act->move = W_AnmEndWait;
}
//----------------------------------------------
//	「みねうち（本体）」初期化（ワーク初期化不要）
//----------------------------------------------
static void MineuchiActInit(actWork *act)
{
	act->x = GetWazaEffPos(DefenceNo, PM_X) + MINEUCHI_DEFAULT_XOFS;
	act->y = GetWazaEffPos(DefenceNo, PM_Y);

	SetWorkSeq(act, MineuchiAnmWait);
	act->move = W_AnmEndWait;
}
//----------------------------------------------
//	「みねうち（残像）」初期化
//	0: X offset
//----------------------------------------------
static void MineuchiZanzouActInit(actWork *act)
{
	act->x = GetWazaEffPos(DefenceNo, PM_X) + MINEUCHI_DEFAULT_XOFS + WazaEffWork[0];
	act->y = GetWazaEffPos(DefenceNo, PM_Y);

	ActAnmChg(act, 1);
	act->work[0] = 0;
	act->work[1] = 0;
	act->move = KirisakuTenmetuActMove;
}
//----------------------------------------------
//	「みねうち」本体アニメ後
//----------------------------------------------
static void MineuchiAnmWait(actWork *act)
{
	if(++(act->work[0]) > 8){
		act->work[0] = MINEUCHI_MOVE_SYNC;
		act->work[1] = MINEUCHI_MOVE_SPD;
		act->work[2] = 0;
		SetWorkSeq(act, MineuchiMoveWait);
		act->move = W_ParallelMoveSeq;
	}
}
//----------------------------------------------
//	「みねうち」本体移動後
//----------------------------------------------
static void MineuchiMoveWait(actWork *act)
{
	act->work[0] = 0;
	act->work[1] = 0;
	act->move = KirisakuTenmetuActMove;
}
//----------------------------------------------
//	点滅→消去
//----------------------------------------------
static void KirisakuTenmetuActMove(actWork *act)
{
	if(++(act->work[0]) > 1){
		act->work[0] = 0;
		act->banish = !(act->banish);
		if(++(act->work[1]) > 8){
			DelWazaEffect(act);
		}
	}
}


//=========================================================================
//	「こらえる」（きあいアクター）
//
//																by taya
//=========================================================================
#define KORAERU_ANM_WAIT  (4)

static void KoraeruActInit(actWork *act);
static void KoraeruActMove(actWork *act);

static const actAnm koraeru_anm[] =
{
	{OBJ16_16x32 * 0, KORAERU_ANM_WAIT,   0, 0},
	{OBJ16_16x32 * 1, KORAERU_ANM_WAIT*3, 0, 0},
	{OBJ16_16x32 * 2, KORAERU_ANM_WAIT  , 0, 0},
	{OBJ16_16x32 * 3, KORAERU_ANM_WAIT  , 0, 0},
	{ACT_ANMEND, 0, 0, 0},
};
static const actAnm * const koraeru_anmtbl[] = 
{
	koraeru_anm,
};

const actHeader ActKoraeruHeader = {
	WAZACHR_ID_KORAERU,
	WAZACHR_ID_KORAERU,
	&WazaOamDataNormal[10],
	koraeru_anmtbl,
	ACT_NTRANS,
	DummyActAffTbl,
	KoraeruActInit,
};
//======================================================
//	初期化
//	0:（0:攻撃側  1:防御側）  1:Xofs  2:Yofs 3:上昇速度
//======================================================
static void KoraeruActInit(actWork *act)
{
	if(WazaEffWork[0] == 0){
		act->x = GetWazaEffPos(AttackNo, EFF_X) + WazaEffWork[1];
		act->y = GetWazaEffPos(AttackNo, EFF_Y) + WazaEffWork[2];
	}else{
		act->x = GetWazaEffPos(DefenceNo, EFF_X) + WazaEffWork[1];
		act->y = GetWazaEffPos(DefenceNo, EFF_Y) + WazaEffWork[2];
	}

	act->work[0] = 0;
	act->work[1] = WazaEffWork[3];
	act->move = KoraeruActMove;
}
static void KoraeruActMove(actWork *act)
{
	if(++(act->work[0]) > act->work[1]){
		act->work[0] = 0;
		act->y--;
	}
	act->y -= act->work[0];
	if(act->anmend_sw){
		DelWazaEffect(act);
	}
}


//=========================================================================
//	「かくばる」
//
//																by taya
//=========================================================================
static void KakubaruActInit(actWork *act);
static void KakubaruActMove(actWork *act);
extern void SePlayPan( u16 no, s8 pan );

#define KAKUBARU_ANM_WAIT	(6)

static const actAnm kakubaru_anm[] =
{
	{OBJ16_32x32 * 0, KAKUBARU_ANM_WAIT*3, 0, 0},

	{OBJ16_32x32 * 0, KAKUBARU_ANM_WAIT*1, 0, 0},
	{OBJ16_32x32 * 1, KAKUBARU_ANM_WAIT*3, 0, 0},
	{OBJ16_32x32 * 0, KAKUBARU_ANM_WAIT*1, 0, 0},

	{OBJ16_32x32 * 1, KAKUBARU_ANM_WAIT*1, 0, 0},
	{OBJ16_32x32 * 2, KAKUBARU_ANM_WAIT*3, 0, 0},
	{OBJ16_32x32 * 1, KAKUBARU_ANM_WAIT*1, 0, 0},

	{OBJ16_32x32 * 2, KAKUBARU_ANM_WAIT*1, 0, 0},
	{OBJ16_32x32 * 3, KAKUBARU_ANM_WAIT*3, 0, 0},
	{OBJ16_32x32 * 2, KAKUBARU_ANM_WAIT*1, 0, 0},

	{OBJ16_32x32 * 3, KAKUBARU_ANM_WAIT*1, 0, 0},
	{OBJ16_32x32 * 4, KAKUBARU_ANM_WAIT*3, 0, 0},
	{OBJ16_32x32 * 3, KAKUBARU_ANM_WAIT*1, 0, 0},

	{OBJ16_32x32 * 4, KAKUBARU_ANM_WAIT*9, 0, 0},

	{ACT_ANMEND, 0, 0, 0},
};
static const actAnm * const kakubaru_anmtbl[] = 
{
	kakubaru_anm,
};

const actHeader ActKakubaruHeader = {
	WAZACHR_ID_KAKUBARU,
	WAZACHR_ID_KAKUBARU,
	&WazaOamDataNormal[2],
	kakubaru_anmtbl,
	ACT_NTRANS,
	DummyActAffTbl,
	KakubaruActInit,
};

static void KakubaruActInit(actWork *act)
{
	act->x = GetWazaEffPos(AttackNo, PM_X);
	act->y = GetWazaEffPos(AttackNo, PM_Y) - 12;

	act->work[0] = 0;  // 0:点滅ｶｳﾝﾀ
	act->work[1] = 2;  // 1:点滅ｳｪｲﾄ
	act->work[2] = 0;  // 2:ｻﾌﾞｶｳﾝﾀ

	act->work[3] = 0;  // 3:SEｶｳﾝﾀ
	act->work[4] = 0;  // 3:SEｻﾌﾞｶｳﾝﾀ
	act->work[5] = GetWazaEffSePan(WAZA_SE_L);  // 4:SE PAN

	act->move = KakubaruActMove;
}
static void KakubaruActMove(actWork *act)
{
	if(++(act->work[0]) >= act->work[1]){
		act->banish = !(act->banish);
		if(act->banish==0)
		{
			act->work[4]++;
			if((act->work[4] & 1)==0){
				SePlayPan(SE_W207B, act->work[5]);
			}
		}
		act->work[0] = 0;

		if(++(act->work[2]) > 1){
			act->work[2] = 0;
			act->work[1] ++;
		}
	}

	if(act->anmend_sw){
		if((act->work[1] > 16) && (act->banish == 1)){
			DelWazaEffect(act);
			return;
		}
///		if(++(act->work[2]) > 1){
//			act->work[2] = 0;
//			act->work[1]++;
//		}
	}
}

//=========================================================================
//
//		「たまなげ」
//														by matsuda
//=========================================================================
//----------------------------------------------------------
//	定数宣言
//----------------------------------------------------------
#define ANM_WAIT_T	3

//----------------------------------------------------------
//	アクターテーブル
//----------------------------------------------------------
const	actHeader ActTamanageHeader={
	WAZACHR_ID_BOURU,
	WAZACHR_ID_BOURU,
	&WazaOamDataNormal[0],
	DummyActAnmTbl,
	0,
	DummyActAffTbl,
	W_StraightMoveInit,
};

static const actAnm SmokeAnm0[]={
		{OBJ16_32x32*0,ANM_WAIT_T,0,0},
		{OBJ16_32x32*1,ANM_WAIT_T,0,0},
		{OBJ16_32x32*2,ANM_WAIT_T,0,0},
		{OBJ16_32x32*3,ANM_WAIT_T,0,0},
		{OBJ16_32x32*4,ANM_WAIT_T,0,0},
		{ACT_ANMEND,0,0,0}
};
static const actAnm *const SmokeAnmTbl[]={
		SmokeAnm0,
};
const	actHeader ActSmokeHeader={
	WAZACHR_ID_BOMB,
	WAZACHR_ID_BOMB,
	&WazaOamDataNormal[2],
	SmokeAnmTbl,
	0,
	DummyActAffTbl,
	W_AnmAffWaitDel,
};












//=========================================================================
//
//		テクスチャー
//												by matsuda 2002.06.03(月)
//=========================================================================
static void TextyarInit(actWork *xreg);

#define TEXTYAR_ANMWAIT		5
static const actAnm TextyarAnm0[]={
	{OBJ16_8x8 * 3, TEXTYAR_ANMWAIT, 0, 0},
	{OBJ16_8x8 * 2, TEXTYAR_ANMWAIT, 0, 0},
	{OBJ16_8x8 * 1, TEXTYAR_ANMWAIT, 0, 0},
	{OBJ16_8x8 * 0, TEXTYAR_ANMWAIT, 0, 0},
	{ACT_ANMEND, 0, 0, 0},
};
static const actAnm *const TextyarAnmTbl[]={
	TextyarAnm0,
};
static const actAffAnm TextyarAff0[] =
{
	{0x0200, 0x0200, 0, ACT_AFSET},
	{ACT_AFEND,0,0,0},
};
static const actAffAnm * const TextyarAffTbl[] = {	//ﾃｸｽﾁｬｰ2と共通
	TextyarAff0,
};
const	actHeader TextyarHeader={
	WAZACHR_ID_TEXTYAR,
	WAZACHR_ID_TEXTYAR,
	&WazaOamDataBldAffine2[0],
	TextyarAnmTbl,
	0,
	TextyarAffTbl,
	TextyarInit,
};

//----------------------------------------------------------
//	0:Xoffset	1:Yoffset
//	WazaEffWork[7]に0xffffが入ってきたらDelする
//----------------------------------------------------------
static void TextyarInit(actWork *xreg)
{
	if(xreg->work[0] == 0){
		xreg->x = GetWazaEffPos(AttackNo, EFF_X) + WazaEffWork[0];
		xreg->y = GetWazaEffPos(AttackNo, EFF_Y) + WazaEffWork[1];
		if(ContestCheck())
			xreg->y += 10;	//審査員に被らないように座標を下げる
		xreg->work[0]++;
	}
	
	if((u16)WazaEffWork[7] == 0xffff)
		DelWazaEffect(xreg);
}

//----------------------------------------------------------
//	テクスチャーを半透明で徐々に消していく
//	テクスチャーのアクターを消すためにWazaEffWork[7]に終了ｺｰﾄﾞのｾｯﾄも行っている
//----------------------------------------------------------
#define TEX_BLD_WAIT	3
void TextyarBldTask(u8 id)
{
	if(TaskTable[id].work[2] == 1){
		WazaEffWork[7] = (s16)0xffff;
		TaskTable[id].work[2]++;
	}
	else if(TaskTable[id].work[2] == 2)
		DelTaskEffect(id);
	else if(TaskTable[id].work[0]++ == TEX_BLD_WAIT){
		TaskTable[id].work[0] = 0;
		TaskTable[id].work[1]++;
		*(vu16*)REG_BLDALPHA = (TaskTable[id].work[1]<<8) | (16-TaskTable[id].work[1]);
		if(TaskTable[id].work[1] == 16)
			TaskTable[id].work[2]++;
	}
}














//=========================================================================
//
//		テクスチャー2
//												by matsuda 2002.06.03(月)
//=========================================================================
static void Textyar2Init(actWork *xreg);
static void Textyar2Main(actWork *xreg);

static const actAnm Textyar2Anm0[]={
	{OBJ16_8x8 * 0, TEXTYAR_ANMWAIT, 0, 0},
	{OBJ16_8x8 * 1, TEXTYAR_ANMWAIT, 0, 0},
	{OBJ16_8x8 * 2, TEXTYAR_ANMWAIT, 0, 0},
	{OBJ16_8x8 * 3, TEXTYAR_ANMWAIT, 0, 0},
	{ACT_ANMEND, 0, 0, 0},
};
static const actAnm *const Textyar2AnmTbl[]={
	Textyar2Anm0,
};
const	actHeader Textyar2Header={
	WAZACHR_ID_TEXTYAR,
	WAZACHR_ID_TEXTYAR,
	&WazaOamDataBldAffine2[0],
	Textyar2AnmTbl,
	0,
	TextyarAffTbl,
	Textyar2Init,
};

//----------------------------------------------------------
//	0:Xoffset	1:Yoffset	2:動き出すまでのｳｪｲﾄ
//----------------------------------------------------------
#define TEX2_MOVESYNC		30
static void Textyar2Init(actWork *xreg)
{
//	xreg->x = GetWazaEffPos(DefenceNo, EFF_X) + WazaEffWork[0];
//	xreg->y = GetWazaEffPos(DefenceNo, EFF_Y) + WazaEffWork[1];
	WazaDefaultPosSet1(xreg, EFF_MODE);
	xreg->anm_pause = 1;
	xreg->work[0] = WazaEffWork[2];
	xreg->move = Textyar2Main;
}

static void Textyar2Main(actWork *xreg)
{
	if(xreg->work[0]){
		xreg->work[0]--;
		return;
	}
	
	xreg->anm_pause = 0;
	xreg->work[0] = TEX2_MOVESYNC;
	xreg->work[2] = GetWazaEffPos(AttackNo, PM_X);
	xreg->work[4] = GetWazaEffPos(AttackNo, PM_Y);
	xreg->move = W_StraightSyncMove;
	SetWorkSeq(xreg, DelWazaEffect);
}

//----------------------------------------------------------
//	ﾃｸｽﾁｬｰ2でBLDを管理するタスク
//----------------------------------------------------------
#define TEX2_BLDWAIT		3
void Textyar2BldControl(u8 id)
{
	if(TaskTable[id].work[0]++ == TEX2_BLDWAIT){
		TaskTable[id].work[0] = 0;
		TaskTable[id].work[1]++;
		*(vu16*)REG_BLDALPHA = ((16-TaskTable[id].work[1])<<8) | TaskTable[id].work[1];
		if(TaskTable[id].work[1] == 16)
			DelTaskEffect(id);
	}
}




















//=========================================================================
//
//		「つきのひかり」
//														by mori
//=========================================================================
//----------------------------------------------------------
//	プロトタイプ宣言
//----------------------------------------------------------
static void SeqWazaMoonInit( actWork * Xreg );
static void SeqWazaMoon( actWork * Xreg );

//----------------------------------------------------------
//	定数宣言
//----------------------------------------------------------

//----------------------------------------------------------
//	アクターテーブル
//----------------------------------------------------------
const	actHeader ActMoonHeader={
	WAZACHR_ID_MOON,
	WAZACHR_ID_MOON,
//	&WazaOamDataNormal[3],
	&WazaOamDataBldNormal[3],
	DummyActAnmTbl,
	0,
	DummyActAffTbl,
	SeqWazaMoonInit,

};

#define MOONLIGHT_ANM_WAIT  (8)
static const actAnm MoonLightAnm[]={
	{OBJ16_16x16*0,MOONLIGHT_ANM_WAIT,0,0},
	{OBJ16_16x16*1,MOONLIGHT_ANM_WAIT,0,0},
	{OBJ16_16x16*2,MOONLIGHT_ANM_WAIT,0,0},
	{OBJ16_16x16*3,MOONLIGHT_ANM_WAIT,0,0},
	{ACT_ANMLOOP,0,0,0}
};

static const actAnm *const MoonLightAnmTbl[]={
	MoonLightAnm,
};

static void MoonLightActInit(actWork *act);

const actHeader ActMoonLightHeader = {
	WAZACHR_ID_MOONLIGHT,
	WAZACHR_ID_MOONLIGHT,
	&WazaOamDataNormal[1],
	MoonLightAnmTbl,
	0,
	DummyActAffTbl,
	MoonLightActInit,
};


static const actAnm PikariAnm[]={
		{OBJ16_32x32*0,2,0,0},
		{OBJ16_32x32*1,2,0,0},
		{OBJ16_32x32*2,2,0,0},
		{OBJ16_32x32*3,3,0,0},
		{OBJ16_32x32*4,5,0,0},
		{OBJ16_32x32*5,3,0,0},
		{OBJ16_32x32*6,2,0,0},
		{OBJ16_32x32*0,2,0,0},
		{ACT_ANMEND,0,0,0}
};

static const actAnm *const PikariAnmTbl[]={
		PikariAnm,
};

const	actHeader ActPikariHeader={
	WAZACHR_ID_PIKARI,
	WAZACHR_ID_PIKARI,
	&WazaOamDataNormal[2],
	PikariAnmTbl,
	0,
	DummyActAffTbl,
	W_AnmAffWaitDel,
};


//----------------------------------------------------------
//　ゲージを消す
//  WazaEffWork[0]:自分のゲージを消す
//  WazaEffWork[1]:相手のゲージを消す
//----------------------------------------------------------
void TaskGaugeOff(u8 taskno)
{
	u8 i;
	
	for(i = 0; i < ClientSetMax; i++)
	{
		if(WazaEffWork[0]==1 && MineEnemyCheck(i) == 0){
			GaugeOFF(ClientGaugeSt[i]);
		}
		if(WazaEffWork[1]==1 && MineEnemyCheck(i) == 1){
			GaugeOFF(ClientGaugeSt[i]);
		}
	}
	DelTaskEffect(taskno);
}

//----------------------------------------------------------
//　ゲージを復活させる
//----------------------------------------------------------
void TaskGaugeOn(u8 taskno)
{
	u8 i;
	
	for(i = 0; i < ClientSetMax; i++)
		GaugeON(ClientGaugeSt[i]);
	DelTaskEffect(taskno);
}


//---------------------------------------------------------------
//	アクターシーケンス
//---------------------------------------------------------------
//----------------------------------------------------------
//　月がでる(消える)
//  WazaEffWork[0]:Ｘ座標
//  WazaEffWork[1]:Ｙ座標
//----------------------------------------------------------
static void SeqWazaMoonInit( actWork * act )
{
	// ｺﾝﾃｽﾄ時は仮想敵位置に出す
	if(ContestCheck()){
		act->x = CON_DEFENCE_X;
		act->y = CON_DEFENCE_Y;
	}else{
		act->x = WazaEffWork[0];
		act->y = WazaEffWork[1];
	}

	act->oamData.Shape = 0;
	act->oamData.Size = 3;
//	act->oamData.Priority = 0;
	act->work[0] = 0;

	act->move = SeqWazaMoon;
}

//----------------------------------------------------------
//　月
//----------------------------------------------------------
static void SeqWazaMoon( actWork * act )
{
	// 全体ﾌｪｰﾄﾞﾀｽｸがwork[0]を１にするまで待つ
	if(act->work[0]){
		DelWazaEffect(act);
	}
}
static void MoonLightActMove(actWork *act);
#define MOONLIGHT_MOVEWIDTH  (0)
static void MoonLightActInit(actWork *act)
{
	act->x = GetWazaEffPos(AttackNo, PM_X) + WazaEffWork[0];
	act->y = WazaEffWork[1];
	act->work[0] = 0;
	act->work[1] = 0;
	act->work[2] = 0;
	act->work[3] = 0;
	act->work[4] = 1;
	act->move = MoonLightActMove;
}
static void MoonLightActMove(actWork *act)
{
	if(++(act->work[1]) >= 2){
		act->work[1] = 0;
		if(act->work[2] < 120){
			act->y++;
			act->work[2]++;
		}
	}

#if MOONLIGHT_MOVEWIDTH
	if(++(act->work[3]) > 10){
		act->work[3] = 0;
		act->dx += act->work[4];
		if(act->dx == MOONLIGHT_MOVEWIDTH || act->dx == -(MOONLIGHT_MOVEWIDTH)){
			act->work[4] *= -1;
		}
	}
#endif

	// 全体ﾌｪｰﾄﾞﾀｽｸがwork[0]を１にするまで待つ
	if(act->work[0]){
		DelWazaEffect(act);
	}
}

//----------------------------------------------------------
//  全体フェードタスク
//----------------------------------------------------------
#define TUKI_BGCOL_BEGIN  (0x0000)  // フェード開始時の背景ＢＧ色
#define TUKI_FADE_COL     (0x7fbb)
#define TUKI_FADE_WAIT    (0)
#define TUKI_COL_SHIFT    (3)

#define GET_R(c)    ((c)&0x1f)
#define GET_G(c)    (((c)>>5)&0x1f)
#define GET_B(c)    (((c)>>10)&0x1f)
#define RGB(r,g,b)  ((r)|((g)<<5)|((b)<<10))

#define TUKI_SR  GET_R(TUKI_BGCOL_BEGIN)
#define TUKI_SG  GET_G(TUKI_BGCOL_BEGIN)
#define TUKI_SB  GET_B(TUKI_BGCOL_BEGIN)
#define TUKI_ER  GET_R(TUKI_FADE_COL)
#define TUKI_EG  GET_G(TUKI_FADE_COL)
#define TUKI_EB  GET_B(TUKI_FADE_COL)

static void TaskTukinoHikariFadeMain(u8 id);

void TaskTukinoHikariFade(u8 id)
{
//	GetBattleFadeBit(haikei,atpoke,depoke,atpoke2,depoke2,eff1,eff2);
	u32 fade_bit, reverse_fadebit;

// すでにブラックアウトされている背景は独自にフェードを行う
	reverse_fadebit = GetBattleFadeBit(1,0,0,0,0,0,0);
	reverse_fadebit &= 0xffff;
	TaskTable[id].work[0] = 0;   // 0:ｼｰｹﾝｽ
	TaskTable[id].work[1] = 0;   // 1:ｶｳﾝﾀ
	TaskTable[id].work[2] = 0;   // 2:evyｶｳﾝﾀ
	TaskTable[id].work[3] = reverse_fadebit;   // 3:ﾌｪｰﾄﾞﾋﾞｯﾄ
	TaskTable[id].work[4] = TUKI_SR << TUKI_COL_SHIFT; // 4:R値
	TaskTable[id].work[5] = TUKI_SG << TUKI_COL_SHIFT; // 5:G値
	TaskTable[id].work[6] = TUKI_SB << TUKI_COL_SHIFT; // 6:B値
	TaskTable[id].work[7] = ((TUKI_ER - TUKI_SR) << TUKI_COL_SHIFT) / 16; // 7:R増加量
	TaskTable[id].work[8] = ((TUKI_EG - TUKI_SG) << TUKI_COL_SHIFT) / 16; // 8:G増加量
	TaskTable[id].work[9] = ((TUKI_EB - TUKI_SB) << TUKI_COL_SHIFT) / 16; // 9:B増加量

// それ以外はフェードルーチンに任せる
//  u32 GetBattleFadeBit(u8 haikei, u8 atpoke, u8 depoke, u8 atpoke2, u8 depoke2, u8 eff1, u8 eff2)
	// パレット復元時のﾌｪｰﾄﾞﾋﾞｯﾄをワークに保存しておく
	fade_bit = GetPokeFadeBit(1,1,1,1);
	reverse_fadebit |= fade_bit;
	Divide32(&(TaskTable[id].work[14]), &(TaskTable[id].work[15]), reverse_fadebit);
	// 月・光などのｱｸﾀｰﾊﾟﾚｯﾄもﾌｪｰﾄﾞﾋﾞｯﾄに追加
	fade_bit |= (0x00010000 << ObjPalNumGet(WAZACHR_ID_MOON));
	fade_bit |= (0x00010000 << ObjPalNumGet(WAZACHR_ID_MOONLIGHT));

	PaletteFadeReq(fade_bit, TUKI_FADE_WAIT, 0, 16, TUKI_FADE_COL);

	TaskTable[id].TaskAdrs = TaskTukinoHikariFadeMain;
	TaskTable[id].TaskAdrs(id);
}
static void TaskTukinoHikariFadeMain(u8 id)
{
	TASK_TABLE *my = &TaskTable[id];

	switch(my->work[0]){
	case 0:
		if(++(my->work[1]) > TUKI_FADE_WAIT){
			u16 col, bit, col_no, i, j;
			my->work[1] = 0;
			my->work[2]++;
			if(my->work[2] < 16){
				u16 r,g,b;
				my->work[4] += my->work[7];
				my->work[5] += my->work[8];
				my->work[6] += my->work[9];
				r = my->work[4] >> TUKI_COL_SHIFT;
				g = my->work[5] >> TUKI_COL_SHIFT;
				b = my->work[6] >> TUKI_COL_SHIFT;
				col = RGB(r,g,b);
			}else{
				col = TUKI_FADE_COL;
				my->work[0]++;
			}
			bit = 1;
			col_no = 0;
			for(i = 0; i < 16; i++){
				if(my->work[3] & bit){
					for(j = 1; j < 16; j++){
						PaletteWorkTrans[col_no + j] = col;
					}
				}
				bit <<= 1;
				col_no += 16;
			}
		}
		break;

	case 1:
		if(FadeData.fade_sw == 0){
			u8 i;

			// 月などのアクター消去
			for(i = 0; i < ACT_MAX; i++){
				if(ActWork[i].actHead == &ActMoonHeader ||
				   ActWork[i].actHead == &ActMoonLightHeader
				){
					ActWork[i].work[0] = 1;
				}
			}

			my->work[1] = 0;
			my->work[0]++;

		}
		break;

	case 2:
		// ホワイトアウト状態のまま少しウェイト
		if(++(my->work[1]) > 30){
			u32 fade_bit;

			// 復元リクエスト
			fade_bit = Unite32(my->work[14], my->work[15]);
			PaletteFadeReq(fade_bit, TUKI_FADE_WAIT, 16, 0, TUKI_FADE_COL);
			my->work[0]++;
		}
		break;

	case 3:
		if(FadeData.fade_sw == 0){
			DelTaskEffect(id);
		}
		break;
	}
}









//=========================================================================
//	「つのでつく」「みだれづき」「つのドリル」
//	（つのアクターの動作）
//															by taya
//=========================================================================
#define TUNO_XOFS   (40)
#define TUNO_YOFS   (20)

static void SeqWazaTunoInit(actWork *Xreg);
static void SeqWazaTunoMove(actWork *Xreg);


const actHeader ActTunoHeader={
	WAZACHR_ID_TUNO,
	WAZACHR_ID_TUNO,
	&WazaOamDataNormal[2],
	DummyActAnmTbl,
	0,
	DummyActAffTbl,
	SeqWazaTunoInit,
};

//----------------------------------------------------------
// 初期化
// 0: 表示XOffset	1: 表示YOffset
// 2: 移動 sync 数（2 ～ 127）
//----------------------------------------------------------
static void SeqWazaTunoInit(actWork *Xreg)
{
	if(WazaEffWork[2] < 2){ WazaEffWork[2] = 2; }
	if(WazaEffWork[2] > 127){ WazaEffWork[2] = 127; }

	Xreg->work[0] = 0;
	Xreg->work[1] = WazaEffWork[2];

	Xreg->x = GetWazaEffPos(DefenceNo, PM_X) + WazaEffWork[0];
	Xreg->y = GetWazaEffPos(DefenceNo, PM_Y) + WazaEffWork[1];
	Xreg->work[6] = Xreg->x;
	Xreg->work[7] = Xreg->y;

	if(ContestCheck()){
		Xreg->oamData.AffineParamNo = 0x08;
		Xreg->x += TUNO_XOFS;
		Xreg->y += TUNO_YOFS;
		Xreg->work[2] = Xreg->x << 7;
		Xreg->work[3] = -(TUNO_XOFS << 7) / Xreg->work[1];
		Xreg->work[4] = Xreg->y << 7;
		Xreg->work[5] = -(TUNO_YOFS << 7) / Xreg->work[1];
	}else{
		// 敵に攻撃
		if(MineEnemyCheck(AttackNo)==SIDE_MINE){
			Xreg->x -= TUNO_XOFS;
			Xreg->y += TUNO_YOFS;
			Xreg->work[2] = Xreg->x << 7;
			Xreg->work[3] = (TUNO_XOFS << 7) / Xreg->work[1];
			Xreg->work[4] = Xreg->y << 7;
			Xreg->work[5] = -(TUNO_YOFS << 7) / Xreg->work[1];

		// 自分に攻撃
		}else{
			Xreg->x += TUNO_XOFS;
			Xreg->y -= TUNO_YOFS;
			Xreg->work[2] = Xreg->x << 7;
			Xreg->work[3] = -(TUNO_XOFS << 7) / Xreg->work[1];
			Xreg->work[4] = Xreg->y << 7;
			Xreg->work[5] = (TUNO_YOFS << 7) / Xreg->work[1];
			Xreg->oamData.AffineParamNo = 0x18;
//			ActAnmChg(Xreg,1);
		}
	}
	Xreg->move = SeqWazaTunoMove;

}
static void SeqWazaTunoMove(actWork *Xreg)
{
	Xreg->work[2] += Xreg->work[3];
	Xreg->work[4] += Xreg->work[5];
	Xreg->x = Xreg->work[2] >> 7;
	Xreg->y = Xreg->work[4] >> 7;

	Xreg->work[1]--;
	if(Xreg->work[1] == 1){
		Xreg->x = Xreg->work[6];
		Xreg->y = Xreg->work[7];
	}
	if(Xreg->work[1] == 0){
		DelWazaEffect(Xreg);
	}
}

//=========================================================================
//	「かげぶんしん」
//
//															by taya
//=========================================================================
#define KAGEBUNSIN_PALID  (WAZACHR_ID_SPOON)  // 重複しないであろうＩＤを使用
#define KAGEBUNSIN_DX_MIN  (-40)
#define KAGEBUNSIN_DX_MAX  (40)
static void TaskKageBunsinMain(u8 id);
static void kagebunsin_actmove(actWork *act);

//==============================================
//	初期化タスク（ワーク初期化不要）
//==============================================
void TaskKageBunsin(u8 id)
{
	TASK_TABLE *my = &TaskTable[id];
	u16 kage_palno, poke_palno;
	s16 actno;
	u16 i;

	my->work[0] = W_GetPokeActNo(0);  // 0:ﾎﾟｹﾓﾝｱｸﾀｰﾅﾝﾊﾞ
	my->work[1] = ObjPalNumSet(KAGEBUNSIN_PALID); // 1:残像ﾊﾟﾚｯﾄﾅﾝﾊﾞ

	kage_palno = 256 + (my->work[1]) * 16;
	poke_palno = (ActWork[my->work[0]].oamData.Pltt + 16) * 16;

	for(i = 1; i < 16; i++){
		PaletteWork[kage_palno + i] = PaletteWork[poke_palno + i];
	}
	SoftFade(kage_palno, 16, 0x0b, 0x0000);

	my->work[3] = 0; // 3:残像ｱｸﾀｰ数
	for(i = 0; i < 2; i++){
		actno = W_PokeZanzouMake(0);
		if(actno < 0){ break; }
		ActWork[actno].oamData.Pltt = my->work[1];
		ActWork[actno].work[0] = 0;  // 0:ｶｳﾝﾀ
		ActWork[actno].work[1] = i * 128;  // 1:初期角度
		ActWork[actno].work[2] = id;  // 2:ﾀｽｸID
		ActWork[actno].move = kagebunsin_actmove;
		my->work[3]++;
	}

	my->TaskAdrs = TaskKageBunsinMain;

	if(GetPokeBGNo(AttackNo) == 1){
		*(vu16*)REG_DISPCNT &= (~DISP_BG1_ON);
	}else{
		*(vu16*)REG_DISPCNT &= (~DISP_BG2_ON);
	}

}
//==============================================
//	メインタスク
//==============================================
static void TaskKageBunsinMain(u8 id)
{
	TASK_TABLE *my = &TaskTable[id];

	// 影分身アクターが消えるのを待ってるだけ
	if(my->work[3] == 0){
		if(GetPokeBGNo(AttackNo) == 1){
			*(vu16*)REG_DISPCNT |= DISP_BG1_ON;
		}else{
			*(vu16*)REG_DISPCNT |= DISP_BG2_ON;
		}

		ObjPalRegNumDel(KAGEBUNSIN_PALID);
		DelTaskEffect(id);
	}
}
//==============================================
//	影分身ｱｸﾀｰ動作関数
//==============================================
static void kagebunsin_actmove(actWork *act)
{
	if(++(act->work[3]) > 1){
		act->work[3] = 0;
		act->work[0]++;
	}

//	if(act->work[0] > 128){
	if(act->work[0] > 64){
		TaskTable[act->work[2]].work[3]--;
		W_PokeZanzouDel(act);
		return;
	}

	act->work[4] = (sin_cos_table[act->work[0]] / 6);   // 半径
	act->work[5] = (sin_cos_table[act->work[0]] / 13);  // 速度
	act->work[1] += act->work[5];
	act->work[1] &= 0xff;

	act->dx = SinMove(act->work[1], act->work[4]);
}



//=========================================================================
//	いかりのまえば（歯型アクター）
//
//															by taya
//=========================================================================
#define HAGATA_WAIT  (2)

static void IkariMaebaInit(actWork *act);

static const actAnm HagataAnm[] =
{
	{OBJ16_32x32 * 0, HAGATA_WAIT, 0, 0},
	{OBJ16_32x32 * 1, HAGATA_WAIT, 0, 0},
	{OBJ16_32x32 * 2, HAGATA_WAIT, 0, 0},
	{OBJ16_32x32 * 3, HAGATA_WAIT, 0, 0},
	{ACT_ANMEND, 0, 0, 0},
};
static const actAnm * const HagataAnmTbl[] = 
{
	HagataAnm,
};

const actHeader ActIkariMaebaHeader = {
	WAZACHR_ID_HAGATA,
	WAZACHR_ID_HAGATA,
	&WazaOamDataNormal[2],
	HagataAnmTbl,
	0,
	DummyActAffTbl,
	IkariMaebaInit,
};

//==============================================
//	初期化（ワーク設定不要）
//==============================================
static void IkariMaebaInit(actWork *act)
{
	SetWorkSeq(act, DelWazaEffect);
	act->move = W_AnmEndWait;
}
















//=========================================================================
//
//		「うたう」
//														by mori
//=========================================================================
//----------------------------------------------------------
//	プロトタイプ宣言
//----------------------------------------------------------
static void SeqWazaUtauInit( actWork * Xreg );
static void SeqWazaUtau( actWork * Xreg );

//----------------------------------------------------------
//	定数宣言
//----------------------------------------------------------

//----------------------------------------------------------
//	アクターテーブル
//----------------------------------------------------------
static const actAnm UtauAnm1[]={
		{OBJ16_16x16*0,10,0,0},
		{ACT_ANMEND,0,0,0}
};

static const actAnm UtauAnm2[]={
		{OBJ16_16x16*1,10,0,0},
		{ACT_ANMEND,0,0,0}
};
static const actAnm UtauAnm3[]={
		{OBJ16_16x16*2,105,0,0},
		{ACT_ANMEND,0,0,0}
};
static const actAnm UtauAnm4[]={
		{OBJ16_16x16*3,10,0,0},
		{ACT_ANMEND,0,0,0}
};
static const actAnm UtauAnm5[]={
		{OBJ16_16x16*4,10,0,0},
		{ACT_ANMEND,0,0,0}
};
static const actAnm UtauAnm6[]={
		{OBJ16_16x16*5,10,0,0},
		{ACT_ANMEND,0,0,0}
};
static const actAnm UtauAnm7[]={
		{OBJ16_16x16*0,10,0,1},
		{ACT_ANMEND,0,0,0}
};
static const actAnm UtauAnm8[]={
		{OBJ16_16x16*1,10,0,1},
		{ACT_ANMEND,0,0,0}
};

static const actAnm *const UtauAnmTbl[]={
	UtauAnm1,
	UtauAnm2,
	UtauAnm3,
	UtauAnm4,
	UtauAnm5,
	UtauAnm6,
	UtauAnm7,
	UtauAnm8,
};

#define UTAU_AFF_RATIO  (0x0c)
#define UTAU_AFF_WAIT   (16)
static const actAffAnm UtauAffAnm[] = {	//上
//	{ 拡縮x, 拡縮y, 角度, ｳｪｲﾄ }
	{ UTAU_AFF_RATIO,  UTAU_AFF_RATIO, 0, UTAU_AFF_WAIT},
	{-UTAU_AFF_RATIO, -UTAU_AFF_RATIO, 0, UTAU_AFF_WAIT},
	{ACT_AFLOOP, 0, 0, 0 },
};


static const actAffAnm * const UtauAffTbl[] = {
	UtauAffAnm,
};

const	actHeader ActUtauHeader={
	WAZACHR_ID_ONPU,
	WAZACHR_ID_ONPU,
//	&WazaOamDataNormal[1],
	&WazaOamDataAffine2[1],
	UtauAnmTbl,
	0,
	UtauAffTbl,
	SeqWazaUtauInit,

};

#define UTAU_PALID_1  (WAZACHR_ID_ONPU)      // 本来のＩＤ
#define UTAU_PALID_2  (WAZACHR_ID_SPOON)     // 絶対に重複しないＩＤ×３
#define UTAU_PALID_3  (WAZACHR_ID_KAKUBARU)  //
#define UTAU_PALID_4  (WAZACHR_ID_TAMAGO)    //
#define UTAU_PAL_MAX  (4)       // 使用するパレット数
#define UTAU_COL_MAX  (5)       // パレット１本あたりの有効色数
#define UTAU_COLCHANGE_WAIT  (12)  // カラーチェンジの間隔（Vsync数）

static const u16 UtauPalData[UTAU_PAL_MAX][UTAU_COL_MAX+1] = {
	{ UTAU_PALID_1, 0x7fff, 0x735f, 0x6adf, 0x623f, 0x59bf },
	{ UTAU_PALID_2, 0x7fff, 0x6bf9, 0x57f4, 0x43ef, 0x33ea },
	{ UTAU_PALID_3, 0x7fff, 0x63ff, 0x47ff, 0x2bff, 0x0fff },
	{ UTAU_PALID_4, 0x7fff, 0x7f9a, 0x7f55, 0x7f10, 0x7ecc },
};

//----------------------------------------------------------
//	パレット登録するだけのタスク
//（CHAR_SETの後で呼び出すこと！）
//----------------------------------------------------------
void TaskUtauPalReg(u8 id)
{
	u16 i, j, palno;

	// 本来のＩＤは既にパレットが登録されているので
	// 色データを書き換えるだけ
	palno = ObjPalNumGet(UtauPalData[0][0]);
	if(palno != 0xff){
		palno = 256 + palno*16;
		for(j = 1; j < (UTAU_COL_MAX+1); j++){
			PaletteWorkTrans[palno+j] = UtauPalData[0][j];
		}
	}

	// それ以外のＩＤはパレット登録してから
	// 色データを書き込む
	for(i = 1; i < UTAU_PAL_MAX; i++){
		palno = ObjPalNumSet(UtauPalData[i][0]);
		if(palno != 0xff){
			palno = 256 + palno*16;
			for(j = 1; j < (UTAU_COL_MAX+1); j++){
				PaletteWorkTrans[palno+j] = UtauPalData[i][j];
			}
		}
	}

	DelTaskEffect(id);
}
//----------------------------------------------------------
//	パレット削除するだけのタスク
//----------------------------------------------------------
void TaskUtauPalDel(u8 id)
{
	u16 i;

	for(i = 1; i < UTAU_PAL_MAX; i++){
		ObjPalRegNumDel(UtauPalData[i][0]);
	}

	DelTaskEffect(id);
}

//----------------------------------------------------------
// 音符が飛ぶ		初期化
// WazaEffWork[0]:	ｱﾆﾒﾅﾝﾊﾞ
// WazaEffWork[1]:	ﾊﾟﾚｯﾄﾅﾝﾊﾞ
// WazaEffWork[2]:  ﾊﾟﾚｯﾄを変えるwait（０ならずっと同じ色）
//----------------------------------------------------------
static void utau_getspeed(s16 x, s16 y, s16 *dx, s16 *dy, s8 ratio);

static void SeqWazaUtauInit( actWork * Xreg )
{
	s16 ex, ey;
	u8 palno;

	EffPositionReset(Xreg);
	ActAnmChg(Xreg,	WazaEffWork[0]);
	palno = ObjPalNumGet(UtauPalData[WazaEffWork[1]][0]);
	if(palno != 0xff){
		Xreg->oamData.Pltt = palno;
	}

	Xreg->work[1] = WazaEffWork[1];
	Xreg->work[2] = 0;
	Xreg->work[3] = WazaEffWork[2];

	if(ContestCheck()){
		ex = CON_DEFENCE_X;
		ey = CON_DEFENCE_Y;
	}else{
		ex = GetWazaEffPos(DefenceNo,PM_X);
		ey = GetWazaEffPos(DefenceNo,PM_Y);
	}


	Xreg->work[4] = Xreg->x << 4;
	Xreg->work[5] = Xreg->y << 4;

	utau_getspeed(ex-Xreg->x, ey-Xreg->y, &(Xreg->work[6]), &(Xreg->work[7]), 40);

	Xreg->move = SeqWazaUtau;
}
// 移動距離に関わらず速度を一定にする
static void utau_getspeed(s16 x, s16 y, s16 *dx, s16 *dy, s8 xratio)
{
	s32 Ratio;

	if(x < 0){
		xratio *= -1;
	}

	Ratio = (x << 8) / xratio;
	if(Ratio == 0){
		Ratio = 1;
	}

	*dx = ((x << 8) / Ratio );
	*dy = ((y << 8) / Ratio );

}
//----------------------------------------------------------
// 音符が飛ぶ
//----------------------------------------------------------
static void SeqWazaUtau( actWork * Xreg )
{
	s16 y;
	u16	w;
	Xreg->work[0]++;

	w = (Xreg->work[0]*5)%256;

	Xreg->work[4] += Xreg->work[6];
	Xreg->work[5] += Xreg->work[7];
	Xreg->x = Xreg->work[4] >> 4;
	Xreg->y = Xreg->work[5] >> 4;

	Xreg->dy=SinMove(w,15);

	y = Xreg->dy + Xreg->y;
	if(Xreg->x < -16 || Xreg->x > 256
	|| Xreg->y < -16 || Xreg->y > 128)
	{
		W_AffCheckEndSeq(Xreg);
		return;
	}


	if(Xreg->work[3]){
		if(++(Xreg->work[2]) > Xreg->work[3]){
			u8 palno;
			Xreg->work[2] = 0;
			if(++(Xreg->work[1]) >= UTAU_PAL_MAX){
				Xreg->work[1] = 0;
			}
			palno = ObjPalNumGet(UtauPalData[Xreg->work[1]][0]);
			if(palno != 0xff){
				Xreg->oamData.Pltt = palno;
			}

		}
	}


}



//=========================================================================
//	フラフラダンスの音符
//
//																by taya
//=========================================================================
static void FuraOnpuActMove(actWork *act);

//========================================
//  0:ｱﾆﾒﾅﾝﾊﾞｰ  1:xofs  2:yofs
//=======================================
static void FuraOnpuActInit(actWork *act)
{
	// 敵側ならxofs反転
	if(MineEnemyCheck(AttackNo)==SIDE_ENEMY){
		WazaEffWork[1] *= -1;
	}

	act->x = GetWazaEffPos(AttackNo, PM_X) + WazaEffWork[1];
	act->y = GetWazaEffPos(AttackNo, PM_Y) + WazaEffWork[2];
	ActAnmChg(act, WazaEffWork[0]);

	act->work[2] = 0;
	act->work[3] = 0;
	act->work[4] = (act->x << 4);
	act->work[5] = (act->y<< 4);
	act->work[6] = (WazaEffWork[1] << 4) / 5;
	act->work[7] = ((WazaEffWork[2]*8) << 4) / 5;

	act->move = FuraOnpuActMove;
}

static void FuraOnpuActMove(actWork *act)
{
	act->work[4] += act->work[6];
	act->work[5] += act->work[7];
	act->x = act->work[4] >> 4;
	act->y = act->work[5] >> 4;

	if(act->work[0] > 5)
	{
		if(act->work[3] == 0)
		{
			act->work[2] = (act->work[2] + 16) & 0xff;
			act->dx = CosMove(act->work[2], 18);
			act->dy = SinMove(act->work[2], 18);
			if(act->work[2] == 0)
			{
				act->work[3] = 1;
			}
		}
	}

	if(++(act->work[0]) == 48){
//		DelWazaEffect(act);
		W_AffCheckEndSeq(act);
	}
}

const	actHeader FuraOnpuHeader={
	WAZACHR_ID_ONPU,
	WAZACHR_ID_ONPU,
//	&WazaOamDataNormal[1],
	&WazaOamDataAffine2[1],
	UtauAnmTbl,
	0,
//	DummyActAffTbl,
	UtauAffTbl,
	FuraOnpuActInit,
};


















//=========================================================================
//
//		はらだいこ
//												by matsuda 2002.05.20(月)
//=========================================================================
static void HaraDaikoInit(actWork *xreg);
static void HaraOnpuInit(actWork *xreg);
static void HaraOnpuMain(actWork *xreg);

const actHeader HirateHeader = //平手
{
	WAZACHR_ID_HIRATE2,
	WAZACHR_ID_HIRATE2,
	&WazaOamDataNormal[2],
	DummyActAnmTbl,
	ACT_NTRANS,
	DummyActAffTbl,
	HaraDaikoInit,
};

#define HARAONPU_DEFAULT_AFF	0xa0
#define HARAONPU_ADDAFF			0x4
static const actAffAnm HaraOnpuAff0[] = {
//	{ 拡縮x, 拡縮y, 角度, ｳｪｲﾄ }
	{HARAONPU_DEFAULT_AFF, HARAONPU_DEFAULT_AFF, 0, ACT_AFSET},
	{HARAONPU_ADDAFF, HARAONPU_ADDAFF, 0, 1},
	{ACT_AFLOOP, 1, 0, 0 },
};
static const actAffAnm * const HaraOnpuAffTbl[] = {
	HaraOnpuAff0,
};
const actHeader HaraOnpuHeader = //音符
{
	WAZACHR_ID_ONPU,
	WAZACHR_ID_ONPU,
	&WazaOamDataAffine2[1],
	UtauAnmTbl,
	ACT_NTRANS,
	HaraOnpuAffTbl,
	HaraOnpuInit,
};

//----------------------------------------------------------
//	0:左、右どちらに出すか(0:左	1:右)
//----------------------------------------------------------
#define HARADAIKO_WAIT	8
#define HARADAIKO_LEFT_OFFSET	(-16)
#define HARADAIKO_RIGHT_OFFSET	(-HARADAIKO_LEFT_OFFSET)
#define HARADAIKO_Y_OFFSET		8
static void HaraDaikoInit(actWork *xreg)
{
	s16 offsetX;
	
	if(WazaEffWork[0] == 1){
		xreg->oamData.AffineParamNo = 8;	//Hflip ON
		offsetX = HARADAIKO_RIGHT_OFFSET;
	}else
		offsetX = HARADAIKO_LEFT_OFFSET;
	xreg->x = GetWazaEffPos(AttackNo, PM_X) + offsetX;
	xreg->y = GetWazaEffPos(AttackNo, PM_Y) + HARADAIKO_Y_OFFSET;
	
	xreg->work[0] = HARADAIKO_WAIT;
	xreg->move = W_WaitSeq;
	SetWorkSeq(xreg, DelWazaEffect);
}

//----------------------------------------------------------
//	0:左、右どちらに出すか(0:左	1:右)
//	1:ｱﾆﾒNo		2:ﾊﾟﾚｯﾄNo	3:初期角度
//----------------------------------------------------------
#define HARAONPU_OFFSET_X	32
#define HARAONPU_OFFSET_Y	(-40)
#define HARAONPU_SYNC		40
#define HARAONPU_FURIHABA_X	8
#define HARAONPU_FURIHABA_Y	4
#define HARAONPU_ADDSEC		8
static void HaraOnpuInit(actWork *xreg)
{
	s16 offsetX;
	u8 palno;
	
	EffPositionReset(xreg);
	xreg->y += 8;
	ActAnmChg(xreg,	WazaEffWork[1]);
	palno = ObjPalNumGet(UtauPalData[WazaEffWork[2]][0]);
	if(palno != 0xff)
		xreg->oamData.Pltt = palno;
	
	if(WazaEffWork[0] == 0)
		offsetX = -HARAONPU_OFFSET_X;
	else
		offsetX = HARAONPU_OFFSET_X;
	xreg->work[0] = HARAONPU_SYNC;
	xreg->work[1] = xreg->x;
	xreg->work[2] = xreg->x + offsetX;
	xreg->work[3] = xreg->y;
	xreg->work[4] = xreg->y + HARAONPU_OFFSET_Y;
	W_GetStraightSyncParam(xreg);
	
	xreg->work[5] = WazaEffWork[3];
	xreg->move = HaraOnpuMain;
}

static void HaraOnpuMain(actWork *xreg)
{
	s16 sinX;
	
	if(W_ParallelSync(xreg) == 0){
		sinX = SinMove(xreg->work[5], HARAONPU_FURIHABA_X);
		if(xreg->dx < 0)
			sinX = -sinX;
		xreg->dx += sinX;
		xreg->dy += SinMove(xreg->work[5], HARAONPU_FURIHABA_Y);
		xreg->work[5] = 0xff & (xreg->work[5] + HARAONPU_ADDSEC);
	}else
		DelWazaEffect(xreg);
}




















//=========================================================================
//
//		「ゆびをふる」「ちょうはつ」「このゆびとまれ」
//		「うそなき」
//																	TAYA
//=========================================================================

//==========================================================
// 共通位置セット（フキダシと同じ座標にするため）
// client  ｸﾗｲｱﾝﾄNo
// act     位置ｾｯﾄするｱｸﾀｰﾎﾟｲﾝﾀ
//==========================================================
static void  fukidashi_pos_set(u8 client, actWork *act)
{
	if(MineEnemyCheck(client)==SIDE_MINE){
		act->x = W_GetPokeSize(client, POKESIZE_RIGHT) + 8;
	}else{
		act->x = W_GetPokeSize(client, POKESIZE_LEFT) - 8;
	}
	act->y = GetWazaEffPos(client, PM_Y) - (W_GetPokeSize(client, POKESIZE_HEIGHT) / 4);
}

//==========================================================
//	フキダシ
//	0:(0:攻撃側 1:防御側)  1:何sync表示するか？
//==========================================================
#define FUKIDASI_ANM_WAIT  (2)

static const actAnm FukidasiAnm_mine_in[] =
{
	{OBJ16_32x32 * 0, FUKIDASI_ANM_WAIT, 1, 0},
	{OBJ16_32x32 * 1, FUKIDASI_ANM_WAIT, 1, 0},
	{OBJ16_32x32 * 2, FUKIDASI_ANM_WAIT, 1, 0},
	{OBJ16_32x32 * 3, FUKIDASI_ANM_WAIT, 1, 0},
	{ACT_ANMEND, 0, 0, 0 },
};
static const actAnm FukidasiAnm_mine_out[] =
{
	{OBJ16_32x32 * 3, FUKIDASI_ANM_WAIT, 1, 0},
	{OBJ16_32x32 * 2, FUKIDASI_ANM_WAIT, 1, 0},
	{OBJ16_32x32 * 1, FUKIDASI_ANM_WAIT, 1, 0},
	{OBJ16_32x32 * 0, FUKIDASI_ANM_WAIT, 1, 0},
	{ACT_ANMEND, 0, 0, 0 },
};
static const actAnm FukidasiAnm_enemy_in[] =
{
	{OBJ16_32x32 * 0, FUKIDASI_ANM_WAIT, 0, 0},
	{OBJ16_32x32 * 1, FUKIDASI_ANM_WAIT, 0, 0},
	{OBJ16_32x32 * 2, FUKIDASI_ANM_WAIT, 0, 0},
	{OBJ16_32x32 * 3, FUKIDASI_ANM_WAIT, 0, 0},
	{ACT_ANMEND, 0, 0, 0 },
};
static const actAnm FukidasiAnm_enemy_out[] =
{
	{OBJ16_32x32 * 3, FUKIDASI_ANM_WAIT, 0, 0},
	{OBJ16_32x32 * 2, FUKIDASI_ANM_WAIT, 0, 0},
	{OBJ16_32x32 * 1, FUKIDASI_ANM_WAIT, 0, 0},
	{OBJ16_32x32 * 0, FUKIDASI_ANM_WAIT, 0, 0},
	{ACT_ANMEND, 0, 0, 0 },
};

static const actAnm * const FukidasiAnmTbl[] = 
{
	FukidasiAnm_mine_in,
	FukidasiAnm_enemy_in,
	FukidasiAnm_mine_out,
	FukidasiAnm_enemy_out,
};

static void FukidasiActInit(actWork *act);
static void FukidasiActMove(actWork *act);

const actHeader ActFukidashiHeader = {
	WAZACHR_ID_FUKIDASI,
	WAZACHR_ID_FUKIDASI,
	&WazaOamDataNormal[2],
	FukidasiAnmTbl,
	ACT_NTRANS,
	DummyActAffTbl,
	FukidasiActInit,
};

static void FukidasiActInit(actWork *act)
{
	u8 client, anmno;

	client = (WazaEffWork[0] == 0)? AttackNo : DefenceNo;

	fukidashi_pos_set(client, act);

	anmno = (MineEnemyCheck(client)==SIDE_MINE)? 0 : 1;
	act->work[0] = WazaEffWork[1];
	act->work[1] = anmno + 2;
	ActAnmChg(act, anmno);

	SetWorkSeq(act, FukidasiActMove);
	act->move = W_AnmEndWait;
}
static void FukidasiActMove(actWork *act)
{
	if(--(act->work[0]) == 0){
		SetWorkSeq(act, DelWazaEffect);
		ActAnmChg(act, act->work[1]);
		act->move = W_AnmEndWait;
	}
}

//==========================================================
//	ゆびをふる
//==========================================================
static const actAffAnm YubiWoFuruAffAnm0[] = {
	{  0x10,  0x10, 0, ACT_AFSET },
	{  0x1e,  0x1e, 0, 8         },  // ここで0x100にする
	{ ACT_AFEND, 0, 0, 0 },
};
static const actAffAnm YubiWoFuruAffAnm1[] = {
	{  0x00,  0x00,  4, 11       },
	{  0x00,  0x00, -4, 11       },
	{ ACT_AFcLOOP, 2, 0, 0       },
	{ -0x1e, -0x1e, 0, 8         },
	{ACT_AFEND,0,0,0},               // (8+16+8) + (11*2*3) = 98
};

static const actAffAnm YubiWoFuruAffAnm[] = {
//	{ 拡縮x, 拡縮y, 角度, ｳｪｲﾄ }
	{  0x10,  0x10, 0, ACT_AFSET },
	{  0x1e,  0x1e, 0, 8         },  // ここで0x100にする
	{  0x00,  0x00, 0, 16        },
	{ ACT_AFcLOOP, 0, 0, 0       },
	{  0x00,  0x00,  4, 11       },
	{  0x00,  0x00, -4, 11       },
	{ ACT_AFcLOOP, 2, 0, 0       },
	{ -0x1e, -0x1e, 0, 8         },
	{ACT_AFEND,0,0,0},               // (8+16+8) + (11*2*3) = 98
};

static const actAffAnm * const YubiWoFuruAffAnmTbl[] = {
	YubiWoFuruAffAnm0,
	YubiWoFuruAffAnm1,
};

static void YubiWoFuruActInit(actWork *act);

const actHeader ActYubiWoFuruHeader = 
{
	WAZACHR_ID_YUBI,
	WAZACHR_ID_YUBI,
	&WazaOamDataAffine2[2],
	DummyActAnmTbl,
	ACT_NTRANS,
	YubiWoFuruAffAnmTbl,
	YubiWoFuruActInit,
};

//----------------------------------------------------------
//	0:(0:攻撃側  1:防御側）
//----------------------------------------------------------
static void YubiWoFuruActWait(actWork *act);

static void YubiWoFuruActInit(actWork *act)
{
	u8 client = (WazaEffWork[0] == 0)? AttackNo : DefenceNo;

	fukidashi_pos_set(client, act);

	act->work[0] = 0;
	SetWorkSeq(act, YubiWoFuruActWait);
	act->move = W_AffEndWait;
}
static void YubiWoFuruActWait(actWork *act)
{
	if(++(act->work[0]) > 16)
	{
		ActAffAnmChg(act,1);
		SetWorkSeq(act, W_AffCheckEndSeq);
		act->move = W_AffEndWait;
	}
}
//==========================================================
//	このゆびとまれ
//	0:(0:攻撃側  1:防御側)
//==========================================================
#define KONOYUBI_YPOS_MIN  (10)
static void KonoyubiActMove(actWork *act);
static void KonoyubiActWait(actWork *act);

static void KonoyubiActInit(actWork *act)
{
	u8 client;

	client = (WazaEffWork[0] == 0)? AttackNo : DefenceNo;
	act->x = GetWazaEffPos(client, EFF_X);
	act->y = W_GetPokeSize(client, POKESIZE_TOP);
	if(act->y < KONOYUBI_YPOS_MIN){
		act->y = KONOYUBI_YPOS_MIN;
	}
	act->work[0] = 1;  // 0:回る回数
	act->work[1] = 0;  // 1:ｶｳﾝﾀ
	act->work[2] = act->pri;     // 2:表ﾌﾟﾗｲｵﾘﾃｨ
	act->work[3] = act->pri+4; // 3:裏ﾌﾟﾗｲｵﾘﾃｨ
	act->work[4] = 0;   // 4:ｳｪｲﾄｶｳﾝﾀ
	SetWorkSeq(act, KonoyubiActWait);
	act->move = W_AffEndWait;
}
static void KonoyubiActWait(actWork *act)
{
	if(++(act->work[4]) > 12)
	{
		act->move = KonoyubiActMove;
	}
}
static void KonoyubiActMove(actWork *act)
{
	act->work[1] += 4;
	if(act->work[1] >= 255)
	{
		if(--(act->work[0]) == 0){
			act->dx = 0;
			act->move = YubiWoFuruActWait;
			return;
		}
		act->work[1] &= 255;
	}
	if(act->work[1] >= 80)
	{
		act->pri = act->work[3];
	}
	if(act->work[1] >= 160)
	{
		act->pri = act->work[2];
	}
	act->dx = (sin_cos_table[act->work[1]] >> 3);
	act->dx += (act->dx >> 1);
}

const actHeader ActKonoyubiHeader = 
{
	WAZACHR_ID_YUBI,
	WAZACHR_ID_YUBI,
//	&WazaOamDataAffine2[2],
	&WazaOamDataAffine[2],
	DummyActAnmTbl,
	ACT_NTRANS,
	YubiWoFuruAffAnmTbl,
	KonoyubiActInit,
};


//==========================================================
//	ちょうはつ
//==========================================================
#define CHOHATU_ANMWAIT  (4)

static const actAnm ChohatuAnmStopMine[] =
{
	{OBJ16_32x32 * 0, 1, 0, 0},
	{ACT_ANMEND, 0, 0, 0 },
};
static const actAnm ChohatuAnmStopEnemy[] =
{
	{OBJ16_32x32 * 0, 1, 1, 0},
	{ACT_ANMEND, 0, 0, 0 },
};
static const actAnm ChohatuAnmMine[] =
{
	{OBJ16_32x32 * 0, CHOHATU_ANMWAIT, 0, 0},
	{OBJ16_32x32 * 1, CHOHATU_ANMWAIT, 0, 0},
	{OBJ16_32x32 * 2, CHOHATU_ANMWAIT, 0, 0},
	{OBJ16_32x32 * 1, CHOHATU_ANMWAIT, 0, 0},
	{OBJ16_32x32 * 0, CHOHATU_ANMWAIT, 0, 0},
	{OBJ16_32x32 * 1, CHOHATU_ANMWAIT, 0, 0},
	{OBJ16_32x32 * 2, CHOHATU_ANMWAIT, 0, 0},
	{ACT_ANMEND, 0, 0, 0 },
};
static const actAnm ChohatuAnmEnemy[] =
{
	{OBJ16_32x32 * 0, CHOHATU_ANMWAIT, 1, 0},
	{OBJ16_32x32 * 1, CHOHATU_ANMWAIT, 1, 0},
	{OBJ16_32x32 * 2, CHOHATU_ANMWAIT, 1, 0},
	{OBJ16_32x32 * 1, CHOHATU_ANMWAIT, 1, 0},
	{OBJ16_32x32 * 0, CHOHATU_ANMWAIT, 1, 0},
	{OBJ16_32x32 * 1, CHOHATU_ANMWAIT, 1, 0},
	{OBJ16_32x32 * 2, CHOHATU_ANMWAIT, 1, 0},
	{ACT_ANMEND, 0, 0, 0 },
};
static const actAnm * const ChohatuAnmTbl[] = 
{
	ChohatuAnmStopMine,
	ChohatuAnmStopEnemy,
	ChohatuAnmMine,
	ChohatuAnmEnemy,
};

static void ChohatuActInit(actWork *act);
static void ChohatuActAfEnd(actWork *act);
static void ChohatuActAnmEnd(actWork *act);

const actHeader ActChohatuHeader = 
{
	WAZACHR_ID_CHOUHATU,
	WAZACHR_ID_CHOUHATU,
	&WazaOamDataNormal[2],
	ChohatuAnmTbl,
	ACT_NTRANS,
	DummyActAffTbl,
	ChohatuActInit,
};

//----------------------------------------------------------
//	0:(0:攻撃側  1:防御側）
//----------------------------------------------------------
static void ChohatuActInit(actWork *act)
{
	u8 client;

	client = (WazaEffWork[0] == 0)? AttackNo : DefenceNo;

	fukidashi_pos_set(client, act);

	if(MineEnemyCheck(client) == SIDE_MINE)
	{
		ActAnmChg(act, 0);
		act->work[0] = 2;
	}else{
		ActAnmChg(act, 1);
		act->work[0] = 3;
	}

	act->move = ChohatuActAfEnd;
}
static void ChohatuActAfEnd(actWork *act)
{
	if(++(act->work[1]) > 10)
	{
		act->work[1] = 0;
		ActAnmChg(act, act->work[0]);
		SetWorkSeq(act, ChohatuActAnmEnd);
		act->move = W_AnmEndWait;
	}
}
static void ChohatuActAnmEnd(actWork *act)
{
	if(++(act->work[1]) > 5)
	{
		DelWazaEffect(act);
	}
}



//----------------------------------------------------------
//	プロトタイプ宣言
//----------------------------------------------------------
static void SeqWazaYubiwoFuruInit(actWork *Xreg);

//----------------------------------------------------------
//	定数宣言
//----------------------------------------------------------

//----------------------------------------------------------
//	アクターテーブル
//----------------------------------------------------------
const actHeader ActYubiHeader = 
{
	WAZACHR_ID_YUBI,
	WAZACHR_ID_YUBI,
	&WazaOamDataNormal[2],
	DummyActAnmTbl,
	ACT_NTRANS,
	DummyActAffTbl,
	SeqWazaYubiwoFuruInit,
};




//-- 星 --//
static const actAnm YubiHosi_anm0[] =
{
	{OBJ16_16x16 * 1, 1, 0, 0},
	{ACT_ANMEND, 0, 0, 0},
};
static const actAnm * const YubiHosiAnmTbl[] = 
{
	YubiHosi_anm0,
};



//-------------------------------------------------------------
//		アクターシーケンス
//-------------------------------------------------------------

//-------------------------------------------------------------
// offset 0:Xｵﾌｾｯﾄ  1:Yｵﾌｾｯﾄ	2:X振り幅	3:Y振り幅
//		  4:回転速度   5:終了までのｳｪｲﾄ
//-------------------------------------------------------------
static void SeqWazaYubiwoFuruInit(actWork *Xreg)
{
	EffPositionReset(Xreg);
	EffXpositionSet(Xreg, WazaEffWork[0]);
	Xreg->y += WazaEffWork[1];

	Xreg->work[1] = WazaEffWork[2];
	Xreg->work[2] = WazaEffWork[4];
	Xreg->work[3] = WazaEffWork[5];
	Xreg->work[4] = WazaEffWork[3];
	
	SetWorkSeq(Xreg, W_AffCheckEndSeq);
	Xreg->move = PMObjKaiten4;
	Xreg->move(Xreg);
}
//==========================================================
//	うそなき（の音符）  0:(0:攻撃側 1:防御側) 
//==========================================================
static void UsonakiOnpuActMove(actWork *act);

static void UsonakiOnpuActInit(actWork *act)
{
	u8 client = (WazaEffWork[0]==0)? AttackNo : DefenceNo;

	fukidashi_pos_set(client, act);

	act->work[0] = 0;
	act->work[1] = 0;
	act->move = UsonakiOnpuActMove;
}
static void UsonakiOnpuActMove(actWork *act)
{
	switch(act->work[0]){
	case 0:
		act->dy -= 3;
		act->work[1]++;
		if(act->work[1] == 6){
			act->work[0]++;
		}
		break;
	case 1:
		act->dy += 3;
		act->work[1]--;
		if(act->work[1] == 0){
			act->work[0]++;
		}
		break;

	case 2:
		if(++(act->work[1]) == 64){
			DelWazaEffect(act);
		}
		break;
	}
}

const actHeader UsonakiOnpuHeader = {
	WAZACHR_ID_ONPU,
	WAZACHR_ID_ONPU,
	&WazaOamDataNormal[1],
	DummyActAnmTbl,
	ACT_NTRANS,
	DummyActAffTbl,
	UsonakiOnpuActInit,
};















//=========================================================================
//
//		「たたきつける」
//														by nohara
//=========================================================================
//----------------------------------------------------------
//	プロトタイプ宣言
//----------------------------------------------------------
//たたきつける
void SeqWazaTatakiInit(actWork *Xreg);	//相手側

//----------------------------------------------------------
//	たたきつける
//----------------------------------------------------------
const	actHeader ActTatakiHeader={
	0,
	0,
	&DummyActOam,
	DummyActAnmTbl,
	0,
	DummyActAffTbl,
	SeqWazaTatakiInit,
};

void SeqWazaKageMove(actWork *Xreg)
{
	//残像
	ActWork[Xreg->work[2]].dx+=Xreg->work[1];
	Xreg->work[1] *= -1;

	if( Xreg->work[0] == 0 )		
	{
		ActWork[Xreg->work[2]].dx=0;
		W_AffCheckEndSeq(Xreg);
	}

	Xreg->work[0]--;		
}

//-------------------------------------------------------------
//  たたきつける(相手)
//-------------------------------------------------------------
void SeqWazaTatakiInit(actWork *Xreg)
{
	u8 SelectStruct;

	Xreg->x = GetWazaEffPos(AttackNo, PM_X);
	Xreg->y = GetWazaEffPos(AttackNo, PM_Y);
	SelectStruct = PokemonStruct[DefenceNo];
	if(MineEnemyCheck(AttackNo))
		Xreg->x -= WazaEffWork[0];
	else
		Xreg->x += WazaEffWork[0];

	Xreg->y += WazaEffWork[1];

	Xreg->work[0] = WazaEffWork[2];		//LOOP
	Xreg->work[1] = WazaEffWork[3];		//振り幅
	Xreg->work[2] = SelectStruct;		//

	Xreg->move=SeqWazaKageMove;

	Xreg->banish=1;
}








//=========================================================================
//
//		からにこもる
//												by matsuda 2002.01.21(月)
//=========================================================================
static void KaraniKomoruInit(actWork *xreg);
static void KaraniKomoruMove(actWork *xreg);
static void KaraniKomoruWait(actWork *xreg);

extern const actAffAnm * const KamitukuAffTbl[];

const	actHeader ActKaraniKomoruHeader={
	WAZACHR_ID_KARA3,
	WAZACHR_ID_KARA3,
	&WazaOamDataBldAffine[3],
	DummyActAnmTbl,
	0,
	KamitukuAffTbl,
	KaraniKomoruInit,
};

//=========================================================================
//	offset	0:始点Xoffset  1:始点Yoffset 
//			2:動作開始までのwait	3:終点到達までのSync回数	4:Delまでのwait
//=========================================================================
#define KARANIKOMORU_DY		15

static void KaraniKomoruInit(actWork *xreg)
{
	WazaDefaultPosSet2(xreg, PM_MODE);
	xreg->work[0] = WazaEffWork[2];
	xreg->work[1] = WazaEffWork[3];
	xreg->work[5] = WazaEffWork[4];
	xreg->move = W_WaitSeq;
	SetWorkSeq(xreg, KaraniKomoruMove);
}

static void KaraniKomoruMove(actWork *xreg)
{
	xreg->work[0] = xreg->work[1];
	xreg->work[2] = xreg->x;
	xreg->work[4] = xreg->y + KARANIKOMORU_DY;
	xreg->move = W_StraightSyncMove;
	SetWorkSeq(xreg, KaraniKomoruWait);
}

static void KaraniKomoruWait(actWork *xreg)
{
	if(xreg->work[5] == 0)
		DelWazaEffect(xreg);
	else
		xreg->work[5]--;
}

//=========================================================================
//
//		しゃがんで回転させて・・
// offset なし
//												by matsuda 2002.05.09(木)
//=========================================================================
static void KaranikomoruMainSeq(u8 id);
#define SYAGAMI_WAIT	30
#define KARA_ADD_THETA	0x00b0
#define KARA_THETA_END	(KARA_ADD_THETA * 22)
#define KARA_ADD_POKE_Y	1

void KaranikomoruTask(u8 id)
{
	u8 pokeact;
	
	pokeact = PokemonStruct[AttackNo];
	PokeKakusyukuInit(pokeact, 0);
	
//	if(MineEnemyCheck(AttackNo) == 0){
//		DelTaskEffect(id);
//		return;
//	}
	TaskTable[id].TaskAdrs = KaranikomoruMainSeq;
}

static void KaranikomoruMainSeq(u8 id)
{
	u8 pokeact;
	s16 theta;
	
	pokeact = PokemonStruct[AttackNo];
	if(MineEnemyCheck(AttackNo) == 0)
		theta = -TaskTable[id].work[0];
	else
		theta = TaskTable[id].work[0];
	PokeKakusyukuSet(pokeact, 0x0100, 0x0100, theta);
	
	if(TaskTable[id].work[1] == 0){
		TaskTable[id].work[0] += KARA_ADD_THETA;
		ActWork[pokeact].dy += KARA_ADD_POKE_Y;
	}else if(TaskTable[id].work[1] == 1){
		TaskTable[id].work[3]++;
		if(TaskTable[id].work[3] == SYAGAMI_WAIT)
			TaskTable[id].work[1] = 2;
		return;
	}else{
		TaskTable[id].work[0] -= KARA_ADD_THETA;
		ActWork[pokeact].dy -= KARA_ADD_POKE_Y;
	}
	
	//if(MineEnemyCheck(AttackNo) == 0)
		W_AdjustKaitenYPos(pokeact);	//敵も味方も下げる
	
//	TaskTable[id].work[3] += TaskTable[id].work[1];
//	ActWork[pokeact].dy = TaskTable[id].work[3] >> 8;
	if(TaskTable[id].work[0] == KARA_THETA_END || TaskTable[id].work[0] == 0){
		if(TaskTable[id].work[1] == 2){
			PokeKakusyukuEnd(pokeact);
			DelTaskEffect(id);
		}else
			TaskTable[id].work[1]++;
	}
}














//=========================================================================
//
//		爆発ｴﾌｪｸﾄ
//												by matsuda 2002.02.13(水)
//=========================================================================
#define BAKUHATU_ANMWAIT	3
#define BAKUHATU_DEFAULTAFF	0x50
#define BAKUHATU_LOOP		(BAKUHATU_ANMWAIT * (4+2))	//+2=最初のｱﾆﾒが*3なので
#define BAKUHATU_ADDAFF		((0x100-BAKUHATU_DEFAULTAFF) / BAKUHATU_LOOP)
static const actAnm BakuhatuAnm0[]={
		{OBJ16_32x32*0,BAKUHATU_ANMWAIT*3,0,0},
		{OBJ16_32x32*1,BAKUHATU_ANMWAIT,0,0},
		{OBJ16_32x32*2,BAKUHATU_ANMWAIT,0,0},
		{OBJ16_32x32*3,BAKUHATU_ANMWAIT,0,0},
		{ACT_ANMEND,0,0,0}
};
static const actAnm *const BakuhatuAnmTbl[]={
		BakuhatuAnm0,
};

static const actAffAnm BakuhatuAff0[] = {
//	{ 拡縮x, 拡縮y, 角度, ｳｪｲﾄ }
	{BAKUHATU_DEFAULTAFF, BAKUHATU_DEFAULTAFF,0,ACT_AFSET},
	{BAKUHATU_ADDAFF, BAKUHATU_ADDAFF, 0,BAKUHATU_LOOP},
	{ACT_AFEND,0,0,0},
};
static const	actAffAnm * const BakuhatuAffTbl[] = {
	BakuhatuAff0,
};

const	actHeader ActBakuhatuHeader={
	WAZACHR_ID_BAKUHATU,
	WAZACHR_ID_BAKUHATU,
	&WazaOamDataAffine[2],
	BakuhatuAnmTbl,
	0,
	BakuhatuAffTbl,
	W_AnmAffWaitDel,
};












//=========================================================================
//
//		がなり系エフェクト
//												by matsuda 2002.02.19(火)
//=========================================================================
static void SeqWazaGanariInit(actWork *Xreg);

#define GANARI_ANMWAIT	3

//----------------------------------------------------------
//	アクターテーブル
//----------------------------------------------------------
static const actAnm GanariAnm0_0[]={
	{OBJ16_32x16*0,GANARI_ANMWAIT,1,0},
	{OBJ16_32x16*1,GANARI_ANMWAIT,1,0},
	{OBJ16_32x16*2,GANARI_ANMWAIT,1,0},
	{OBJ16_32x16*3,GANARI_ANMWAIT,1,0},
	{OBJ16_32x16*4,GANARI_ANMWAIT,1,0},
	{OBJ16_32x16*5,GANARI_ANMWAIT,1,0},
	{OBJ16_32x16*6,GANARI_ANMWAIT,1,0},
	{ACT_ANMcLOOP, 1,0,0},
	{ACT_ANMEND,0,0,0}
};
static const actAnm *const GanariAnmTbl[]={
	GanariAnm0_0,
};
const	actHeader ActGanariHeader={
	WAZACHR_ID_GANARI,
	WAZACHR_ID_GANARI,
	&WazaOamDataNormal[6],
	GanariAnmTbl,
	0,
	DummyActAffTbl,
	SeqWazaGanariInit,
};


//-------------------------------------------------------------
//		アクターシーケンス
//-------------------------------------------------------------

//-------------------------------------------------------------
// offset 0:Xｵﾌｾｯﾄ  1:Yｵﾌｾｯﾄ	2:上下反転ﾌﾗｸﾞ(0:上　1:下)
//-------------------------------------------------------------
static void SeqWazaGanariInit(actWork *xreg)
{
	EffPositionReset(xreg);
	EffXpositionSet(xreg, WazaEffWork[0]);
	xreg->y += WazaEffWork[1];
	
	if(MineEnemyCheck(AttackNo))
	{
		xreg->Hflip = 1;
		if(WazaEffWork[2])
			xreg->Vflip = 1;
	}
	else
	{
		if(WazaEffWork[2])
			xreg->Vflip = 1;
	}
	
	xreg->move = W_AnmEndWait;
	SetWorkSeq(xreg, DelWazaEffect);
}













//=========================================================================
//
//		つるぎのまい
//												by matsuda 2002.02.20(水)
//=========================================================================
static void TuruginoMaiMain(actWork *xreg);
static void TuruginoMaiInit(actWork *xreg);

#define TURUGI_DEFAULT_AFF	0xf0
#define TURUGI_AFFLOOP		12
#define TURUGI_ADDAFF		(TURUGI_DEFAULT_AFF / TURUGI_AFFLOOP)
#define TURUGI_WAIT			32
static const actAffAnm TuruginoMaiAff0[] = {
//	{ 拡縮x, 拡縮y, 角度, ｳｪｲﾄ }
	{ 0x100-TURUGI_DEFAULT_AFF, 0x100, 0, ACT_AFSET },
	{ TURUGI_ADDAFF, 0, 0, TURUGI_AFFLOOP},
	{0,0,0,TURUGI_WAIT},	//wait
	{ACT_AFEND,0,0,0},
};
static const	actAffAnm * const TuruginoMaiAffTbl[] = {
	TuruginoMaiAff0,
};
const	actHeader ActTuruginoMaiHeader={
	WAZACHR_ID_TURUGI,
	WAZACHR_ID_TURUGI,
	&WazaOamDataBldAffine[11],
	DummyActAnmTbl,
	0,
	TuruginoMaiAffTbl,
	TuruginoMaiInit,
};

//----------------------------------------------------------
//	0:Xoffset	1:Yoffset
//----------------------------------------------------------
#define TURUGINOMAI_SYNC	6
#define TURUGINOMAI_DY	32
static void TuruginoMaiInit(actWork *xreg)
{
	WazaDefaultPosSet2(xreg, EFF_MODE);
	xreg->move = W_AffEndWait;
	SetWorkSeq(xreg, TuruginoMaiMain);
}

static void TuruginoMaiMain(actWork *xreg)
{
	xreg->work[0] = TURUGINOMAI_SYNC;
	xreg->work[2] = xreg->x;
	xreg->work[4] = xreg->y - TURUGINOMAI_DY;
	xreg->move = W_StraightSyncMove;
	SetWorkSeq(xreg, DelWazaEffect);
}












//=========================================================================
//
//		ソニックブーム
//												by matsuda 2002.02.20(水)
//=========================================================================
static void SonicBoomInit(actWork *xreg);

const	actHeader ActSonicBoomHeader={
	WAZACHR_ID_SONIC,
	WAZACHR_ID_SONIC,
//	&WazaOamDataBldNormal[6],
	&WazaOamDataBldAffine2[6],
	DummyActAnmTbl,
	0,
	DummyActAffTbl,
	SonicBoomInit,
};

//----------------------------------------------------------
//	offset	0:Xoffset	1:Yoffset	2:終点Xoffset	3:終点Yoffset	4:SyncNum
//	(終点に限っては敵、味方でｵﾌｾｯﾄの反転を行わない)
//----------------------------------------------------------
static void SonicBoomInit(actWork *xreg)
{
	u16 kakudo;
	s16 defence_x, defence_y;
	
//	WazaDefaultPosSet2(xreg, PM_MODE);
	
	if(ContestCheck()){
		WazaEffWork[2] = -WazaEffWork[2];
	}
	else if(MineEnemyCheck(AttackNo)){
		WazaEffWork[2] = -WazaEffWork[2];
		WazaEffWork[1] = -WazaEffWork[1];	//始点、終点のY座標を反転
		WazaEffWork[3] = -WazaEffWork[3];
	}
	WazaDefaultPosSet2(xreg, PM_MODE);
	defence_x = GetWazaEffPos(DefenceNo, PM_X) + WazaEffWork[2];
	defence_y = GetWazaEffPos(DefenceNo, PM_Y) + WazaEffWork[3];

	kakudo = GetKakudo2(defence_x - xreg->x, defence_y - xreg->y);
	kakudo -= 0x1000;//0x2000;	//元の絵が斜めなので真横にする為のｵﾌｾｯﾄ
	if(ContestCheck())
		kakudo -= 0x6000;	//ｺﾝﾃｽﾄではなんかちゃんと表示されないので特別補正
	KakusyukuSet(xreg, 0, 0x0100,0x0100, kakudo);
	
	xreg->work[0] = WazaEffWork[4];
	xreg->work[2] = defence_x;
	xreg->work[4] = defence_y;
	xreg->move = W_StraightSyncMove;
	SetWorkSeq(xreg, DelWazaEffect);
}

//====================================================================
//	314:エアカッター
//
//											add 02.08.02.	by iwasawa
//====================================================================
extern void SeqWazaEffectEnd(actWork *xreg);
extern s16 fix_inverse( s16 b );
extern s16 fix_mul( s16 a, s16 b );
static void SeqAirCutterMove1(actWork *);
const	actHeader ActAirCutterHeader={
	WAZACHR_ID_SONIC,
	WAZACHR_ID_SONIC,
	&WazaOamDataBldNormal[6],
	DummyActAnmTbl,
	0,
	DummyActAffTbl,
	SeqAirCutterMove1,
};

#define AC_CNT		0
#define AC_STAT		1
#define AC_WORK		2
#define AC_WAIT		3
#define AC_DIR		4
#define AC_SYNC		5
#define AC_SYNC2	6
#define AC_VX		7
#define AC_VY		8
#define AC_SX		9
#define AC_SY		10
#define AC_EX		11
#define AC_EY		12
#define AC_ACT0		13
#define AC_ACT1		14
#define AC_ACT2		15

#define ACO_CNT		0
#define ACO_WORK0	1
#define ACO_WORK1	2
#define ACO_TASK	7

//アクター
static void SeqAirCutterWait(actWork* xreg)
{
	if(xreg->work[ACO_CNT]-- > 0) return;

	TaskTable[xreg->work[ACO_TASK]].work[AC_STAT]--;
	DelActor(xreg);
}
static void SeqAirCutterMove2(actWork* xreg)
{
	TASK_TABLE *task = &(TaskTable[xreg->work[ACO_TASK]]);

	//現在の速度
	if(xreg->work[0] > task->work[AC_SYNC]){
		xreg->work[5] += xreg->work[3];
		xreg->work[6] += xreg->work[4];
	}else{
		xreg->work[5] -= xreg->work[3];
		xreg->work[6] -= xreg->work[4];
	}
	//現在のオフセット
	xreg->work[1] += xreg->work[5];
	xreg->work[2] += xreg->work[6];
	if(task->work[AC_VX] & 0x0001){
		xreg->dx  = -((u16)xreg->work[1]>>8);
	}else{
		xreg->dx  = ((u16)xreg->work[1]>>8);
	}
	if(task->work[AC_VY] & 0x0001){
		xreg->dy  = -((u16)xreg->work[2] >> 8);
	}else{
		xreg->dy  = ((u16)xreg->work[2]>>8);
	}
	if(xreg->work[ACO_CNT]-- > 0) return;
	
	xreg->work[ACO_CNT] = 30;
	xreg->move = SeqAirCutterWait;
}
static void SeqAirCutterMove1(actWork* xreg)
{
	u16	dx = 0,dy = 0;
	s16 t0 = 0;
	
	TASK_TABLE *task = &(TaskTable[xreg->work[ACO_TASK]]);

	//現在のオフセット
	xreg->work[1] += (task->work[AC_VX]&0xFFFE);
	xreg->work[2] += (task->work[AC_VY]&0xFFFE);
	if(task->work[AC_VX] & 0x0001){
		xreg->dx  = -((u16)xreg->work[1]>>8);
	}else{
		xreg->dx  = ((u16)xreg->work[1]>>8);
	}
	if(task->work[AC_VY] & 0x0001){
		xreg->dy  = -((u16)xreg->work[2] >> 8);
	}else{
		xreg->dy  = ((u16)xreg->work[2]>>8);
	}
	if(xreg->work[ACO_CNT]-- > 0) return;

	xreg->work[ACO_CNT] = 8;//task->work[AC_SYNC2];	//カウンタ復帰
	t0 = task->work[AC_SYNC] = (xreg->work[ACO_CNT]>>1);
	t0 = fix_inverse((t0*t0)<<8);
	
	//現在位置補正
	xreg->x += xreg->dx;
	xreg->y += xreg->dy;
	xreg->dx = xreg->dy = 0;

	//加速度を求める
	if(task->work[AC_EX] >= xreg->x) dx = (u16)(task->work[AC_EX]-xreg->x)<<8;
	else							 dx = (u16)(xreg->x - task->work[AC_EX])<<8;
	if(task->work[AC_EY] >= xreg->y) dy = (u16)(task->work[AC_EY]-xreg->y)<<8;
	else							 dy = (u16)(xreg->y - task->work[AC_EY])<<8;

	xreg->work[1] = xreg->work[2] = 0;
	xreg->work[5] = xreg->work[6] = 0;
	xreg->work[3] = fix_mul(fix_mul((s16)dx,t0),fix_inverse(0x01C0));
	xreg->work[4] = fix_mul(fix_mul((s16)dy,t0),fix_inverse(0x01C0));
	
	xreg->move = SeqAirCutterMove2;
}

//アクターがすべてDelされるまで待つ
static void TaskAirCutterWait(u8 id)
{
	if(TaskTable[id].work[AC_STAT] != 0) return;
	DelTaskEffect(id);	
}
//アクターのADD
static void TaskAirCutterAddAct(u8 id)
{
	u8	no = 0;
	s8	pan = 0;
	actWork *act = NULL;
	
	if(TaskTable[id].work[AC_CNT]-- > 0) return;
	
	//Add
	no = AddActor(	&ActAirCutterHeader,
					TaskTable[id].work[AC_SX],
					TaskTable[id].work[AC_SY],
					(u8)TaskTable[id].work[AC_WORK]-TaskTable[id].work[AC_STAT]);
	act = &(ActWork[no]);

	//Flip設定
	switch(TaskTable[id].work[AC_DIR])
	{
	case 1:	//Defenceが手前
		act->oamData.AffineParamNo |= 0x18;	//H,VﾌﾘｯﾌﾟON
		break;
	case 2:	//コンテスト
		act->oamData.AffineParamNo = 0x08;	//H,VﾌﾘｯﾌﾟON
		break;
	default:
		break;
	}
		
	act->work[ACO_CNT] = TaskTable[id].work[AC_SYNC]-
						 TaskTable[id].work[AC_SYNC2];
	act->work[ACO_TASK] = (s16)((u16)id);

	//アクターIDの保存
	TaskTable[id].work[AC_ACT0+TaskTable[id].work[AC_STAT]] = no;
	TaskTable[id].work[AC_CNT] = TaskTable[id].work[AC_WAIT];
	TaskTable[id].work[AC_STAT]++;
	
	pan = GetWazaEffSePan(-63);
	SePlayPan(SE_W059B, pan);

	if(TaskTable[id].work[AC_STAT] < 3) return;

	TaskTable[id].TaskAdrs = TaskAirCutterWait;
}
//---------------------------------------------------------------------
//	0:xoffset 1:yoffset 2:xV
//	3:WAIT,4:SoftPriority
//----------------------------------------------------------------------
void TaskAirCutterInit(u8 id)
{
	u8	flag = 0;
	s16 sx = 0,sy = 0,dx = 0,dy = 0;
	s16	ofs = 0;

	//ディフェンスがどちら側にいるか？
	if(ContestCheck()){						//コンテストのとき
		TaskTable[id].work[AC_DIR] = 2;
		flag = 2;
		
		WazaEffWork[0] = -WazaEffWork[0];	//オフセット変換
		
		//速度を変換
		if(WazaEffWork[2] & 0x0001)	WazaEffWork[2] &= 0xFFFE;
		else						WazaEffWork[2] |= 0x0001;
	}
	else if(!(ClientType[DefenceNo] & 1)){	//手前
		TaskTable[id].work[AC_DIR] = 1;
		WazaEffWork[0] = -WazaEffWork[0];	//オフセット変換
		WazaEffWork[1] = -WazaEffWork[1];

		//速度を変換
		if(WazaEffWork[2] & 0x0001)	WazaEffWork[2] &= 0xFFFE;
		else						WazaEffWork[2] |= 0x0001;
		
	}

	//始点を求める
	sx = TaskTable[id].work[AC_SX] = GetWazaEffPos(AttackNo,EFF_X);
	sy = TaskTable[id].work[AC_SY] = GetWazaEffPos(AttackNo,EFF_Y);
	
	//終点を求める
	if((FightType & FIGHT_TYPE_2vs2) && PokeBG2taimeCheck(DefenceNo^2))
	{
		//2vs2&&相方が画面内に存在するとき
		GetCenterEffPos(DefenceNo,EFF_MODE,&dx,&dy);
	}
	else
	{
		dx = GetWazaEffPos(DefenceNo,EFF_X);
		dy = GetWazaEffPos(DefenceNo,EFF_Y);
	}
	dx = TaskTable[id].work[AC_EX] = dx+WazaEffWork[0];
	dy = TaskTable[id].work[AC_EY] = dy+WazaEffWork[1];

	//Xに対してかけるSyncを保存
	if(dx >= sx)	ofs = dx-sx;
	else			ofs = sx-dx;
	TaskTable[id].work[AC_SYNC]	= fix_mul(ofs,fix_inverse(WazaEffWork[2]&0xFFFE));
	TaskTable[id].work[AC_SYNC2]= fix_mul(TaskTable[id].work[AC_SYNC],0x0080);	//1/3
	TaskTable[id].work[AC_VX] = WazaEffWork[2];	//Xの速度保存
	
	//Yの速度を求める
	if(dy >= sy){
		TaskTable[id].work[AC_VY] = fix_mul(dy-sy,fix_inverse(TaskTable[id].work[AC_SYNC]));
		TaskTable[id].work[AC_VY] &= 0xFFFE;
	}else{
		TaskTable[id].work[AC_VY] = fix_mul(sy-dy,fix_inverse(TaskTable[id].work[AC_SYNC]));
		TaskTable[id].work[AC_VY] |= 0x0001;
	}

	//Waitを保存
	TaskTable[id].work[AC_WAIT] = WazaEffWork[3];

	//アクターのソフトプライオリティを保存
	if(WazaEffWork[4] & 0x80){
		//Defence
		WazaEffWork[4] ^= 0x80;
		if(WazaEffWork[4] >= 64){
			(u16)TaskTable[id].work[AC_WORK] = (u16)(GetPokeSoftPri(DefenceNo) + (WazaEffWork[4] - 64));
		}
		else{
			(u16)TaskTable[id].work[AC_WORK] = (u16)(GetPokeSoftPri(DefenceNo)-WazaEffWork[4]);
		}
	}else{
		//Attack
		if(WazaEffWork[4] >= 64){
			(u16)TaskTable[id].work[AC_WORK] = (u16)(GetPokeSoftPri(DefenceNo) + (WazaEffWork[4] - 64));
		}
		else{
			(u16)TaskTable[id].work[AC_WORK] = (u16)(GetPokeSoftPri(DefenceNo)-WazaEffWork[4]);
		}
	}
	if(TaskTable[id].work[AC_WORK] < 3) TaskTable[id].work[AC_WORK] = 3;
	
	TaskTable[id].TaskAdrs = TaskAirCutterAddAct;
}


//=========================================================================
//
//		ちょうおんぱ
//												by matsuda 2002.02.20(水)
//=========================================================================
#define TYOUONPA_DEFAULT_AFF	0xe0
#define TYOUONPA_ADD_AFF		7
static const actAffAnm TyouOnpaAff0[] = {
//	{ 拡縮x, 拡縮y, 角度, ｳｪｲﾄ }
	{ 0x100-TYOUONPA_DEFAULT_AFF, 0x100-TYOUONPA_DEFAULT_AFF, 0, ACT_AFSET },
	{TYOUONPA_ADD_AFF, TYOUONPA_ADD_AFF, 0, 200},
	{ACT_AFEND,0,0,0},
};

static const actAffAnm TyouOnpaAff1[]={
	{5,5,0,10},
	{-10,-10,0,10},
	{10,10,0,10},
	{-10,-10,0,10},
	{10,10,0,10},
	{-10,-10,0,10},
	{10,10,0,10},
	{ACT_AFEND,0,0,0},
};
const	actAffAnm * const TyouOnpaAffTbl[] = {
	TyouOnpaAff0,
	TyouOnpaAff1,
	
};

const	actHeader ActTyouOnpaHeader={
	WAZACHR_ID_ONPA,
	WAZACHR_ID_ONPA,
	&WazaOamDataAffine2[10],
	DummyActAnmTbl,
	0,
	TyouOnpaAffTbl,
	W_StraightMoveInit,
};

//-- 「いやなおと」 --//
const	actHeader IyanaotoHeader={
	WAZACHR_ID_ONPA_DB,
	WAZACHR_ID_ONPA_DB,
	&WazaOamDataAffine2[10],
	DummyActAnmTbl,
	0,
	TyouOnpaAffTbl,
	W_StraightMoveInit,
};

//-- きんぞくおん --//
const	actHeader KinzokuonHeader={
	WAZACHR_ID_KINZOKUON,
	WAZACHR_ID_KINZOKUON,
	&WazaOamDataAffine2[11],
	DummyActAnmTbl,
	0,
	TyouOnpaAffTbl,
	W_StraightMoveInit,
};


/*---------みずのはどう-----------*/
extern void ActMizunoHadouMoveInit(actWork *xreg);

const	actHeader ActMizunoHadouHeader={
	WAZACHR_ID_MIZUONPA,
	WAZACHR_ID_MIZUONPA,
	&WazaOamDataAffine2[10],
	DummyActAnmTbl,
	0,
	&TyouOnpaAffTbl[1],
	ActMizunoHadouMoveInit,
};












//=========================================================================
//
//		タマゴばくだん
//												by matsuda 2002.03.20(水)
//=========================================================================
const	actHeader TamagoBakudanHeader={
	WAZACHR_ID_TAMAGO,
	WAZACHR_ID_TAMAGO,
	&WazaOamDataNormal[1],
	DummyActAnmTbl,
	0,
	DummyActAffTbl,
	W_YamanariInitSeq,
};













//=========================================================================
//
//		きあいだめ
//												by matsuda 2002.03.20(水)
//=========================================================================
static void KiaidameSeq(actWork *xreg);
static void KiaidameMain(actWork *xreg);

const actHeader KiaidameHeader={
	WAZACHR_ID_KIAI2,
	WAZACHR_ID_KIAI2,
	&WazaOamDataBldNormal[3],
	DummyActAnmTbl,
	0,
	DummyActAffTbl,
	KiaidameSeq,
};

//----------------------------------------------------------
//	0:Xoffset	1:Yoffset
//----------------------------------------------------------
#define KIAIDAME_PALWAIT	1
static void KiaidameSeq(actWork *xreg)
{
	u8 pal_no;
	
	WazaDefaultPosSet2(xreg, EFF_MODE);
	pal_no = ObjPalNumGet(KiaidameHeader.palNo);
	xreg->work[0] = pal_no * 16 + 16*16;
	xreg->move = KiaidameMain;
}

static void KiaidameMain(actWork *xreg)
{
	int i;
	u16 temp_color;
	u16 palno;
	
	if(xreg->work[1]++ == KIAIDAME_PALWAIT)
	{
		xreg->work[1] = 0;
		
		palno = xreg->work[0];
		temp_color = PaletteWorkTrans[palno + 8];
		for(i = 8; i < 16; i++)
			PaletteWorkTrans[palno+i] = PaletteWorkTrans[palno+i+1];
		PaletteWorkTrans[palno+15] = temp_color;
		
		if(++xreg->work[2] == 24)	//ﾊﾟﾚｯﾄｱﾆﾒを2週したかﾁｪｯｸ
			DelWazaEffect(xreg);
	}
}











//=========================================================================
//
//		ネコにこばん
//												by matsuda 2002.03.27(水)
//=========================================================================
static void KobanInit(actWork *xreg);
static void KobanBaundInit(actWork *xreg);
static void KobanBaundMain(actWork *xreg);

static const actAnm KobanAnm0[]={
	{OBJ16_16x16*2, 1, 0,0},
	{ACT_ANMEND,0,0,0}
};
static const actAnm *const KobanAnmTbl[]={
		KobanAnm0,
};
static const actAffAnm KobanAff0[] = {
//	{ 拡縮x, 拡縮y, 角度, ｳｪｲﾄ }
	{ 0, 0, 10, 1},
	{ACT_AFLOOP,0,0,0},
};
static const	actAffAnm * const KobanAffTbl[] = {
	KobanAff0,
};

//-- 直線移動 --//
const	actHeader ActKobanHeader={
	WAZACHR_ID_KOBAN2,
	WAZACHR_ID_KOBAN2,
	&WazaOamDataAffine[1],
	KobanAnmTbl,
	0,
	DummyActAffTbl,
	KobanInit,
};

//-- 当たったあとの転がる処理 --//
const	actHeader ActKobanBaundHeader={
	WAZACHR_ID_KOBAN2,
	WAZACHR_ID_KOBAN2,
	&WazaOamDataAffine[1],
	KobanAnmTbl,
	0,
	KobanAffTbl,
	KobanBaundInit,
};

//----------------------------------------------------------
//	offset	0:Xoffset	1:Yoffset	2:終点Xoffset	3:終点Yoffset	4:速度X
//----------------------------------------------------------
static void KobanInit(actWork *xreg)
{
	u16 kakudo;
	s16 defence_x, defence_y;
	
	WazaDefaultPosSet2(xreg, PM_MODE);
	defence_x = GetWazaEffPos(DefenceNo, PM_X);
	defence_y = GetWazaEffPos(DefenceNo, PM_Y) + WazaEffWork[3];
	if(MineEnemyCheck(AttackNo))
		WazaEffWork[2] = -WazaEffWork[2];
	defence_x += WazaEffWork[2];
	
	kakudo = GetKakudo2(defence_x - xreg->x, defence_y - xreg->y);
	kakudo -= 0x4000;	//元の絵が縦なので真横にする為のｵﾌｾｯﾄ
	KakusyukuSet(xreg, 0, 0x0100,0x0100, kakudo);
	
	xreg->work[0] = WazaEffWork[4];
	xreg->work[2] = defence_x;
	xreg->work[4] = defence_y;
	xreg->move = W_StraightSpMove;
	SetWorkSeq(xreg, DelWazaEffect);
}

//----------------------------------------------------------
//	offset なし
//----------------------------------------------------------
#define KOBAN_BAUND_ADDX	0x0080
#define KOBAN_FURIHABA_Y	(-16)
#define KOBAN_ADD_SEC		5
#define KOBAN_DEFAULT_Y		8
static void KobanBaundInit(actWork *xreg)
{
	xreg->work[2] = KOBAN_FURIHABA_Y;
	xreg->y += KOBAN_DEFAULT_Y;
	xreg->move = KobanBaundMain;
}

static void KobanBaundMain(actWork *xreg)
{
	xreg->work[0] += KOBAN_BAUND_ADDX;
	xreg->dx = xreg->work[0] >> 8;
	if(MineEnemyCheck(AttackNo) == 0)
		xreg->dx = -xreg->dx;
	xreg->dy = SinMove(xreg->work[1], xreg->work[2]);
	xreg->work[1] += KOBAN_ADD_SEC;
	if(xreg->work[1] >= 127){
		xreg->work[1] = 0;
		xreg->work[2] /= 2;
		xreg->work[3]++;
		if(xreg->work[3] == 2)
			DelWazaEffect(xreg);
	}
}


















//=========================================================================
//
//		タネマシンガン
//												by matsuda 2002.07.17(水)
//=========================================================================
static void TaneMasinganInit(actWork *xreg);
static void TaneMasinganFlick(actWork *xreg);
static void TaneMasinganFlickMain(actWork *xreg);

static const actAffAnm TaneMasinganAff0[] = {
//	{ 拡縮x, 拡縮y, 角度, ｳｪｲﾄ }
	{ 0, 0, 20, 1},
	{ACT_AFLOOP,0,0,0},
};
static const	actAffAnm * const TaneMasinganAffTbl[] = {
	TaneMasinganAff0,
};
const	actHeader TaneMasinganHeader={
	WAZACHR_ID_YADORIGI,
	WAZACHR_ID_YADORIGI,
	&WazaOamDataAffine[1],
	DummyActAnmTbl,
	0,
	TaneMasinganAffTbl,
	TaneMasinganInit,
};

//----------------------------------------------------------
//	0:Xoffset	1:Yoffset
//----------------------------------------------------------
#define TANE_MASINGAN_SYNC	20
static void TaneMasinganInit(actWork *xreg)
{
	WazaDefaultPosSet2(xreg, PM_MODE);
	xreg->work[0] = TANE_MASINGAN_SYNC;
	xreg->work[2] = GetWazaEffPos(DefenceNo, PM_X);
	xreg->work[4] = GetWazaEffPos(DefenceNo, PM_Y);
	xreg->move = W_StraightSyncMove;
	xreg->aff_pause = 1;
	SetWorkSeq(xreg, TaneMasinganFlick);
}

static void TaneMasinganFlick(actWork *xreg)
{
	int i;
	
	SePlayPan(SE_W030, GetWazaEffSePan(WAZA_SE_R));
	xreg->x += xreg->dx;
	xreg->y += xreg->dy;
	xreg->dx = xreg->dy = 0;
	for(i = 0; i < 8; i++)
		xreg->work[i] = 0;
	xreg->work[6] = -12 - (pp_rand() % 8);			//振り幅
	xreg->work[7] = 0x00a0 + (pp_rand() % 0x00a0);	//速度
	xreg->move = TaneMasinganFlickMain;
	xreg->aff_pause = 0;
}

#define TANEMASINE_ADD_SEC	8
static void TaneMasinganFlickMain(actWork *xreg)
{
	xreg->work[0] += xreg->work[7];
	xreg->dx = xreg->work[0] >> 8;
	if(xreg->work[7] & 1)
		xreg->dx = -xreg->dx;
	xreg->dy = SinMove(xreg->work[1], xreg->work[6]);
	xreg->work[1] += TANEMASINE_ADD_SEC;
	if(xreg->work[1] >= 127){
		xreg->work[1] = 0;
		xreg->work[2] /= 2;
		xreg->work[3]++;
		if(xreg->work[3] == 1)
			DelWazaEffect(xreg);
	}
}














//=========================================================================
//
//		かまいたち
//												by matsuda 2002.03.28(木)
//=========================================================================
static void KamaitatiInit(actWork *xreg);

#define KAMAITATI_DEFAULT_AFF	(0xb0)
#define KAMAITATI_AFFLOOP		40
#define KAMAITATI_ADDAFF		(KAMAITATI_DEFAULT_AFF / KAMAITATI_AFFLOOP)
static const actAffAnm KamaitatiAff0[] = {
//	{ 拡縮x, 拡縮y, 角度, ｳｪｲﾄ }
	{ 0x10, 0x100, 0, ACT_AFSET },
	{ KAMAITATI_ADDAFF, 0, 0, KAMAITATI_AFFLOOP},
	{ACT_AFEND,0,0,0},
};
static const	actAffAnm * const KamaitatiAffTbl[] = {
	KamaitatiAff0,
};
const	actHeader KamaitatiHeader={
	WAZACHR_ID_KAZE,
	WAZACHR_ID_KAZE,
	&WazaOamDataAffine[11],
	DummyActAnmTbl,
	0,
	KamaitatiAffTbl,
	KamaitatiInit,
};

//----------------------------------------------------------
//	0:Xoffset	1:Yoffset	2:X振り幅	3:Y振り幅
//	4:初期角度	5:秒速度	6:DelするまでのWait
//----------------------------------------------------------
static void KamaitatiInit(actWork *xreg)
{
	WazaDefaultPosSet2(xreg, EFF_MODE);
	if(MineEnemyCheck(AttackNo) == SIDE_MINE)
		xreg->y += MINE_SIDE_OFFSET_Y + 8;
	xreg->work[0] = WazaEffWork[4];
	xreg->work[1] = WazaEffWork[2];
	xreg->work[2] = WazaEffWork[5];
	xreg->work[3] = WazaEffWork[6];
	xreg->work[4] = WazaEffWork[3];
	xreg->move = PMObjKaiten;
	SetWorkSeq(xreg, DelWazaEffect);
	xreg->move(xreg);
}














//=========================================================================
//
//		はさむ
//												by matsuda 2002.03.28(木)
//=========================================================================
static void HasamuInit(actWork *xreg);
static void HasamuEnd(actWork *xreg);

#define HASAMU_ANMWAIT	3
static const actAnm HasamuAnm0[]={
	{OBJ16_32x32*0,HASAMU_ANMWAIT,0,0},
	{OBJ16_32x32*1,HASAMU_ANMWAIT,0,0},
	{OBJ16_32x32*2,20,0,0},
	{ACT_ANMEND,0,0,0}
};
static const actAnm HasamuAnm1[]={
	{OBJ16_32x32*0,HASAMU_ANMWAIT,1,1},
	{OBJ16_32x32*1,HASAMU_ANMWAIT,1,1},
	{OBJ16_32x32*2,20,1,1},
	{ACT_ANMEND,0,0,0}
};
static const actAnm *const HasamuAnmTbl[]={
	HasamuAnm0,
	HasamuAnm1,
};
const	actHeader HasamuHeader={
	WAZACHR_ID_KIRISAKU2,
	WAZACHR_ID_KIRISAKU2,
	&WazaOamDataBldNormal[2],
	HasamuAnmTbl,
	0,
	DummyActAffTbl,
	HasamuInit,
};

//----------------------------------------------------------
//	0:上下(0=上 1=下)
//----------------------------------------------------------
#define HASAMU_X	32
#define HASAMU_Y	(-32)
#define HASAMU_SYNC	6
static void HasamuInit(actWork *xreg)
{
	s16 StartX, StartY;
	s16 EndX, EndY;
	
//	WazaDefaultPosSet1(xreg, PM_MODE);
	StartX = HASAMU_X;
	StartY = HASAMU_Y;
	EndX = 16;
	EndY = -16;
	if(WazaEffWork[0]){
		StartX = -StartX;
		StartY = -StartY;
		EndX = -EndX;
		EndY = -EndY;
		ActAnmChg(xreg, 1);
	}
	xreg->x += StartX;
	xreg->y += StartY;
	xreg->work[0] = HASAMU_SYNC;
	xreg->work[2] = GetWazaEffPos(DefenceNo, PM_X) + EndX;
	xreg->work[4] = GetWazaEffPos(DefenceNo, PM_Y) + EndY;
	xreg->move = W_StraightSyncMove;
	SetWorkSeq(xreg, HasamuEnd);
}

static void HasamuEnd(actWork *xreg)
{
	if(xreg->anmend_sw == 1)
		DelWazaEffect(xreg);
}













//=========================================================================
//
//		ハサミギロチン
//												by matsuda 2002.03.28(木)
//=========================================================================
static void GirotinInit(actWork *xreg);
static void GirotinFast(actWork *xreg);
static void GirotinWait(actWork *xreg);
static void GirotinEnd(actWork *xreg);

#define GIROTIN_ANMWAIT	2
static const actAnm GirotinAnm0[]={
	{OBJ16_32x32*0,GIROTIN_ANMWAIT,0,0},
	{OBJ16_32x32*1,GIROTIN_ANMWAIT,0,0},
	{OBJ16_32x32*2,1,0,0},
	{ACT_ANMEND,0,0,0}
};
static const actAnm GirotinAnm1[]={
	{OBJ16_32x32*0,GIROTIN_ANMWAIT,1,1},
	{OBJ16_32x32*1,GIROTIN_ANMWAIT,1,1},
	{OBJ16_32x32*2,1,1,1},
	{ACT_ANMEND,0,0,0}
};
static const actAnm *const GirotinAnmTbl[]={
	GirotinAnm0,
	GirotinAnm1,
};
const	actHeader GirotinHeader={
	WAZACHR_ID_KIRISAKU2,
	WAZACHR_ID_KIRISAKU2,
	&WazaOamDataBldNormal[2],
	GirotinAnmTbl,
	0,
	DummyActAffTbl,
	GirotinInit,
};

//----------------------------------------------------------
//	0:上下(0=上 1=下)
//----------------------------------------------------------
#define GIROTIN_X	32
#define GIROTIN_Y	(-32)
#define GIROTIN_SYNC	6
#define GIROTIN_BURU_WAIT	50
#define GIROTIN_BURU_X		2
#define GIROTIN_BURU_Y		(-2)
static void GirotinInit(actWork *xreg)
{
	s16 StartX, StartY;
	s16 EndX, EndY;
	
//	WazaDefaultPosSet1(xreg, PM_MODE);
	StartX = GIROTIN_X;
	StartY = GIROTIN_Y;
	EndX = 16;
	EndY = -16;
	if(WazaEffWork[0]){
		StartX = -StartX;
		StartY = -StartY;
		EndX = -EndX;
		EndY = -EndY;
		ActAnmChg(xreg, WazaEffWork[0]);
	}
	xreg->x += StartX;
	xreg->y += StartY;
	xreg->work[0] = GIROTIN_SYNC;
	xreg->work[1] = xreg->x;
	xreg->work[2] = GetWazaEffPos(DefenceNo, PM_X) + EndX;
	xreg->work[3] = xreg->y;
	xreg->work[4] = GetWazaEffPos(DefenceNo, PM_Y) + EndY;
	W_GetStraightSyncParam(xreg);
	xreg->work[5] = WazaEffWork[0];
	xreg->work[6] = xreg->work[0];
	xreg->move = GirotinFast;
}

static void GirotinFast(actWork *xreg)
{
	if(W_ParallelSync(xreg) == 0)
		return;
		
	if(xreg->anmend_sw == 1){
		ActAnmOffsChg(xreg, 0);
		xreg->anm_pause = 1;
		xreg->x += xreg->dx;
		xreg->y += xreg->dy;
		xreg->dx = GIROTIN_BURU_X;
		xreg->dy = GIROTIN_BURU_Y;
		xreg->work[0] = xreg->work[6];
		xreg->work[1] ^= 1;		//正負反転
		xreg->work[2] ^= 1;
		xreg->work[3] = xreg->work[4] = 0;
		xreg->move = GirotinWait;
	}
}

static void GirotinWait(actWork *xreg)
{
	if(xreg->work[3]){
		xreg->dx = -xreg->dx;
		xreg->dy = -xreg->dy;
	}
	xreg->work[3] ^= 1;
	
	if(xreg->work[4]++ == GIROTIN_BURU_WAIT){
		xreg->dx = xreg->dy = 0;
		xreg->work[3] = xreg->work[4] = 0;
		xreg->anm_pause = 0;
		ActAnmChg(xreg, xreg->work[5]^1);
		xreg->move = GirotinEnd;
	}
}

static void GirotinEnd(actWork *xreg)
{
	if(W_ParallelSync(xreg))
		DelWazaEffect(xreg);
}














//=========================================================================
//
//		かなしばり
//												by matsuda 2002.03.29(金)
//=========================================================================
static void KanasibariMain(u8 id);

//----------------------------------------------------------
//	オフセットなし
//----------------------------------------------------------
#define KANASIBARI_AFF	0xd0
#define KANASIBARI_WAIT	80
void KanasibariTask(u8 id)
{
	u8 pokeact;
	
	pokeact = W_GetPokeActNo(1);
//	ActWork[pokeact].banish = 0;
	PokeKakusyukuInit(pokeact, 1);
	PokeKakusyukuSet(pokeact, KANASIBARI_AFF, KANASIBARI_AFF, 0);
	W_ColorMonotone(ActWork[pokeact].oamData.Pltt + 16, 0);
	TaskTable[id].work[0] = KANASIBARI_WAIT;
	TaskTable[id].TaskAdrs = KanasibariMain;
}

static void KanasibariMain(u8 id)
{
	u8 pokeact;
	
	if(TaskTable[id].work[0]-- == 0){
		pokeact = W_GetPokeActNo(1);
		PokeKakusyukuEnd(pokeact);
		W_ColorMonotone(ActWork[pokeact].oamData.Pltt+16, 1);
		DelTaskEffect(id);
	}
}













//=========================================================================
//	ちいさくなる
//																by TAYA
//=========================================================================
#define TIISAKU_RATIO_ADD (40)
#define TIISAKU_AFF_SYNC  (32)
#define TIISAKU_ZANZOUPRI_MIN  (10)
#define TIISAKU_ZANZOUACTNO_WORK   (7)
static void TaskTiisakuNaruMain(u8 id);
static void tiisaku_zanzou_add(TASK_TABLE *my, u8 id);
static void tiisaku_zanzou_actmove(actWork *act);

//=======================================================
//	初期化タスク
//=======================================================
void TaskTiisakuNaru(u8 id)
{
	TASK_TABLE *my = &TaskTable[id];

	// ＯＢＪを下、ＢＧを上に置いてＢＧ半透明化
	my->work[0] = W_GetPokeActNo(0);    // 0:ﾎﾟｹﾓﾝｱｸﾀｰﾅﾝﾊﾞ
	PokeKakusyukuInit(my->work[0], 0);

	my->work[1] = 0;  // 1:ｼｰｹﾝｽ
	my->work[2] = 0;  // 2:ｶｳﾝﾀ
	my->work[3] = 0;  // 3:残像ﾌﾟﾗｲｵﾘﾃｨ
	my->work[4] = 0x100;  // 4:倍率
	my->work[5] = 0;  // 5:ﾙｰﾌﾟｶｳﾝﾀ
	my->work[6] = 0;  // 6:残像ｶｳﾝﾀ
	my->work[7] = GetPokeSoftPri(AttackNo);  // 7:本体ﾌﾟﾗｲｵﾘﾃｨ
	

	my->TaskAdrs = TaskTiisakuNaruMain;
}
//=======================================================
//	メインタスク
//=======================================================
static void TaskTiisakuNaruMain(u8 id)
{
	TASK_TABLE *my = &TaskTable[id];

	switch(my->work[1]){
	case 0:
		if(my->work[2] == 0
		|| my->work[2] == 3
		|| my->work[2] == 6
		){
			tiisaku_zanzou_add(my, id);
		}

		my->work[2]++;
		my->work[4] += TIISAKU_RATIO_ADD;
		PokeKakusyukuSet(my->work[0], my->work[4], my->work[4], 0);
		PokeKakusyukuYHosei(my->work[0]);

		if(my->work[2] == TIISAKU_AFF_SYNC){
			my->work[5]++;
			my->work[1]++;
		}
		break;

	// 残像が消えるまで待ち
	case 1:
		if(my->work[6] == 0){
			if(my->work[5] == 3){
				my->work[2] = 0;
				my->work[1] = 3;
			}else{
				my->work[2] = 0;
				my->work[3] = 0;
				my->work[4] = 0x100;
				PokeKakusyukuSet(my->work[0], 0x100, 0x100, 0);
				PokeKakusyukuYHosei(my->work[0]);
				my->work[1] = 2;
			}
		}
		break;

	// ループ前に、ポケモンが原寸に戻るのを1sync待ち
	case 2:
		my->work[1] = 0;
		break;

	case 3:
		if(++(my->work[2]) > 32){
			my->work[2] = 0;
			my->work[1]++;
		}
		break;

	case 4:
		my->work[2] += 2;
		my->work[4] -= (TIISAKU_RATIO_ADD * 2);
		PokeKakusyukuSet(my->work[0], my->work[4], my->work[4], 0);
		PokeKakusyukuYHosei(my->work[0]);
		if(my->work[2] == TIISAKU_AFF_SYNC){
			my->work[2] = 0;
			my->work[1]++;
		}
		break;

	case 5:
		PokeKakusyukuEnd(my->work[0]);
		ActWork[my->work[15]].dy = 0;
		DelTaskEffect(id);
		break;
	}
}

static void tiisaku_zanzou_add(TASK_TABLE *my, u8 id)
{
	s16 actno, affno;

	actno = W_PokeZanzouMake(0);
	if(actno < 0){ return; }

	affno = AffineWorkNumGet();
	if(affno == 0xff){
		W_PokeZanzouDel(&ActWork[actno]);
		return;
	}

	ActWork[actno].oamData.ObjMode = 1;
	ActWork[actno].oamData.AffineMode = 3;
	ActWork[actno].aff_pause = 1;
	ActWork[actno].oamData.AffineParamNo = affno;
//	ActWork[actno].oamData.Priority = 2;
	ActWork[actno].pri = my->work[7] - my->work[3];
	my->work[3]++;
	my->work[6]++;
	ActWork[actno].work[0] = 16;
	ActWork[actno].work[1] = id;
	ActWork[actno].work[2] = 6;
	ActWork[actno].move = tiisaku_zanzou_actmove;
	PokeKakusyukuSet(actno, my->work[4], my->work[4], 0);
	ActWork[actno].oamData.AffineMode = 1;  // 倍角オフ
	actCenterCalc(&ActWork[actno], ActWork[actno].oamData.Shape,
			ActWork[actno].oamData.Size, ActWork[actno].oamData.AffineMode);

}

static void tiisaku_zanzou_actmove(actWork *act)
{
	act->work[0]--;
	if(act->work[0] == 0){
		TaskTable[act->work[1]].work[act->work[2]]--;
		AffineWorkNumDel(act->oamData.AffineParamNo);
		W_PokeZanzouDel(act);
	}
}

//=========================================================================
//	はねる
//																by TAYA
//=========================================================================
#define HANERU_SYNC         (8)

static const actAffAnm HaneruAffAnm[] = {
	{ -0x06,  0x04, 0, HANERU_SYNC },
	{  0x0a, -0x0a, 0, HANERU_SYNC },
	{ -0x04,  0x06, 0, HANERU_SYNC },
	{ ACT_AFEND, 0, 0, 0 },
};

static void TaskHaneruMain(u8 id);

//=======================================================
//	初期化タスク
//	0:(0:攻撃側  1:防御側）  1:はねる回数
//=======================================================
void TaskHaneru(u8 id)
{
	TASK_TABLE *my = &TaskTable[id];

	if(WazaEffWork[1] == 0){
		DelTaskEffect(id);
		return;
	}

	my->work[0] = W_GetPokeActNo(WazaEffWork[0]);  // 0:ﾎﾟｹﾓﾝｱｸﾀｰﾅﾝﾊﾞ
	my->work[1] = 0;                               // 1:進捗
	my->work[2] = WazaEffWork[1];                  // 2:はねる回数
	my->work[3] = 0;                               // 3:ｶｳﾝﾀ
	my->work[4] = 0;                               // 4:Y offset

	SetPokeKakusyukuAnm(my, my->work[0], HaneruAffAnm);

	my->TaskAdrs = TaskHaneruMain;
}

//=======================================================
//	メインタスク
//=======================================================
static void TaskHaneruMain(u8 id)
{
	TASK_TABLE *my = &TaskTable[id];

	switch(my->work[1]){
	case 0:
		PokeKakusyukuAnm(my);
		my->work[4] += 3;
		ActWork[my->work[0]].dy += ((my->work[4]));
		if(++(my->work[3]) >= HANERU_SYNC){
			my->work[3] = 0;
			my->work[1]++;
		}
		break;

	case 1:
		PokeKakusyukuAnm(my);
		ActWork[my->work[0]].dy += my->work[4];
		if(++(my->work[3]) >= HANERU_SYNC){
			my->work[3] = 0;
			my->work[1]++;
		}
		break;

	case 2:
		if(my->work[4]){
			ActWork[my->work[0]].dy -= 2;
			my->work[4] -= 2;
		}else{
			my->work[1]++;
		}
		break;

	case 3:
		if(!PokeKakusyukuAnm(my)){
			my->work[2]--;
			if(my->work[2] == 0){
				ActWork[my->work[0]].dy = 0;
				DelTaskEffect(id);
			}else{
				SetPokeKakusyukuAnm(my, my->work[0], HaneruAffAnm);
				my->work[1] = 0;
			}
		}
		break;
	}
}


//=========================================================================
//	いばる
//																	TAYA
//=========================================================================
static const actAffAnm IbaruAffAnm[] = {
	{ -0x04, -0x05, 0, 12 },
	{  0x00,  0x00, 0, 24 },
	{  0x04,  0x05, 0, 12 },
	{ ACT_AFEND, 0, 0, 0 },
};

static void TaskIbaruMain(u8 id);

//==============================================
//	拡大動作 - 初期化タスク
//==============================================
void TaskIbaru(u8 id)
{
	SetPokeKakusyukuAnm(&TaskTable[id], W_GetPokeActNo(0), IbaruAffAnm);
	TaskTable[id].TaskAdrs = TaskIbaruMain;
}
//==============================================
//	拡大動作 - メインタスク
//==============================================
static void TaskIbaruMain(u8 id)
{
	if(!PokeKakusyukuAnm(&TaskTable[id])){
		DelTaskEffect(id);
	}
}

//==============================================
//	はないきアクター
//==============================================
static void IbaruHanaikiActInit(actWork *act);

static const actAnm IbaruHanaikiAnm0[]={
		{OBJ16_16x16*0,4,1,0},
		{OBJ16_16x16*1,40,1,0},
		{OBJ16_16x16*2,4,1,0},
		{OBJ16_16x16*3,4,1,0},
		{ACT_ANMEND,0,0,0}
};
static const actAnm IbaruHanaikiAnm1[]={
		{OBJ16_16x16*0,4, 0,0},
		{OBJ16_16x16*1,40,0,0},
		{OBJ16_16x16*2,4, 0,0},
		{OBJ16_16x16*3,4, 0,0},
		{ACT_ANMEND,0,0,0}
};
static const actAnm *const IbaruHanaikiAnmTbl[]={
	IbaruHanaikiAnm0,
	IbaruHanaikiAnm1,
};

const actHeader ActIbaruHanaikiHeader = {
	WAZACHR_ID_HANAIKI,
	WAZACHR_ID_HANAIKI,
	&WazaOamDataNormal[1],
	IbaruHanaikiAnmTbl,
	0,
	DummyActAffTbl,
	IbaruHanaikiActInit,
};

static void IbaruHanaikiActInit(actWork *act)
{
	if(MineEnemyCheck(AttackNo) == 0){
		ActAnmChg(act, 0);
		act->x = GetWazaEffPos(AttackNo,PM_X) + 32;
		act->work[1] = 0x40;
	}else{
		ActAnmChg(act, 1);
		act->x = GetWazaEffPos(AttackNo,PM_X) - 32;
		act->work[1] = -(0x40);
	}
	act->y = GetWazaEffPos(AttackNo,PM_Y);

	act->work[0] = 52;
	act->work[2] = 0x00;
	act->work[3] = 0;
	act->work[4] = 0;
	SetWorkSeq(act,DelWazaEffect);
	act->move = W_ParallelMove2Seq;
}

//==============================================
//	いかりアクター
//==============================================
#define IKARIMARK_YPOS_MIN  (8)

static void IbaruIkariActInit(actWork *act);

static const actAffAnm IbaruIkariAffAnm[] = {
	{  0x0B, 0x0B,   0,  8 },
	{ -0x0B, -0x0B,  0,  8 },
	{ACT_AFEND, 0, 0, 0 },
};
static const actAffAnm *const IbaruIkariAffAnmTbl[] = {
	IbaruIkariAffAnm,
};

const actHeader ActIbaruIkariHeader = {
	WAZACHR_ID_IKARI,
	WAZACHR_ID_IKARI,
	&WazaOamDataAffine[1],
	DummyActAnmTbl,
	0,
	IbaruIkariAffAnmTbl,
	IbaruIkariActInit,
};

//----------------------------------------------
//	初期化
//	0（0:攻撃側  1:防御側）
//	1:X offset  2:Y offset
//----------------------------------------------
static void IbaruIkariActInit(actWork *act)
{
	u8 client = (WazaEffWork[0]==0)? AttackNo : DefenceNo;

	if(MineEnemyCheck(client) == SIDE_ENEMY){
		WazaEffWork[1] *= -1;
	}

	act->x = GetWazaEffPos(client, PM_X) + WazaEffWork[1];
	act->y = GetWazaEffPos(client, PM_Y) + WazaEffWork[2];

	if(act->y < IKARIMARK_YPOS_MIN)
	{
		act->y = IKARIMARK_YPOS_MIN;
	}

	SetWorkSeq(act, W_AffCheckEndSeq);
	act->move = W_AffEndWait;
}


//=========================================================================
//	あばれる
//
//																by TAYA
//=========================================================================
#define ABARE_1ST_XRATIO  (0xb0)
#define ABARE_1ST_YRATIO  (0x140)
#define ABARE_2ND_XRATIO  (0x140)
#define ABARE_2ND_YRATIO  (0xb0)
#define ABARE_SYNC        (14)
#define ABARE_REPEAT      (3)

static const actAffAnm AbareruAffAnm[] = {
	{ -0x0A,  0x09,   0,  ABARE_SYNC / 2 },
	{  0x14, -0x14,   0,  ABARE_SYNC / 2 },
	{ -0x14,  0x14,   0,  ABARE_SYNC / 2 },
	{  0x0a, -0x09,   0,  ABARE_SYNC / 2 },
	{ ACT_AFcLOOP,   ABARE_REPEAT-1, 0, 0 },
	{ACT_AFEND, 0, 0, 0 },
};


static void TaskAbareruAffineMain(u8 id);

//=======================================================
//	拡縮：初期化タスク（ワーク設定不要）
//=======================================================
void TaskAbareruAffine(u8 id)
{
	TASK_TABLE *my = &TaskTable[id];

	my->work[0] = W_GetPokeActNo(0);
	my->work[1] = 0;

	SetPokeKakusyukuAnm(my, my->work[0], AbareruAffAnm);
	TaskTable[id].TaskAdrs = TaskAbareruAffineMain;
}
//=======================================================
//	拡縮：メインタスク
//=======================================================
static void TaskAbareruAffineMain(u8 id)
{
	if(!PokeKakusyukuAnm(&TaskTable[id])){
		DelTaskEffect(id);
	}
}
//=======================================================
//	移動：初期化タスク（ワーク設定不要）
//=======================================================
#define ABARE_SPEED  (4)
static void TaskAbareruMoveMain(u8 id);

void TaskAbareruMove(u8 id)
{
	TASK_TABLE *my = &TaskTable[id];

	my->work[0] = W_GetPokeActNo(0);
	my->work[1] = 0;
	my->work[2] = ABARE_SPEED;
	my->work[3] = ABARE_SYNC / 2;
	my->work[4] = ABARE_REPEAT;
	my->work[5] = ActWork[my->work[0]].x;
	my->work[6] = ActWork[my->work[0]].y;
	my->work[7] = 0;
	my->work[8] = 0;
	my->work[9] = 2;


	if(MineEnemyCheck(AttackNo) == SIDE_ENEMY){
		my->work[2] *= -1;
	}

	my->TaskAdrs = TaskAbareruMoveMain;
}
//=======================================================
//	移動：メインタスク
//=======================================================
static void TaskAbareruMoveMain(u8 id)
{
	TASK_TABLE *my = &TaskTable[id];

#if 1
	if(++(my->work[7]) > 2){
		my->work[7] = 0;
		my->work[8]++;
		if(my->work[8] & 1){
			ActWork[my->work[0]].y += my->work[9];
		}else{
			ActWork[my->work[0]].y -= my->work[9];
		}
	}
#endif

	switch(my->work[1]){
	case 0:
		ActWork[my->work[0]].x += my->work[2];
		if(--(my->work[3]) == 0){
			my->work[3] = ABARE_SYNC;
			my->work[1] = 1;
		}
		break;

	case 1:
		ActWork[my->work[0]].x -= my->work[2];
		if(--(my->work[3]) == 0){
			my->work[3] = ABARE_SYNC / 2;
			my->work[1] = 2;
		}
		break;

	case 2:
		ActWork[my->work[0]].x += my->work[2];
		if(--(my->work[3]) == 0){
			if(--(my->work[4])){
				my->work[3] = ABARE_SYNC / 2;
				my->work[1] = 0;
			}else{
				if(my->work[8] & 1){
					ActWork[my->work[0]].y -= my->work[9];
				}
				DelTaskEffect(id);
			}
		}
		break;
	}

}


//=========================================================================
//	スケッチ
//
//																by TAYA
//=========================================================================
#define SKETCH_BEGIN_WAIT    (20)
#define SKETCH_PENMOVE_WAIT  (16)
#define SKETCH_WAIT  (4)

static void TaskSketchMain(u8 id);

//===============================================
//	初期化タスク（ワーク設定不要）
//===============================================
void TaskSketch(u8 id)
{
	TASK_TABLE *my = &TaskTable[id];
	LasterData  LD;
	s16 i;

	my->work[0] = GetPokeShadowYPos(DefenceNo)+32;
	my->work[1] = SKETCH_WAIT;
	my->work[2] = 0;
	my->work[3] = 0;

	my->work[4] = 0;
	my->work[5] = 0;

	my->work[15] = W_GetPokeSize(DefenceNo, POKESIZE_HEIGHT);

	if(GetPokeBGNo(DefenceNo) == 1)
	{
		my->work[6] = ScrX1;
		LD.DestAdrs = (void*)REG_BG1HOFS;
	}
	else
	{
		my->work[6] = ScrX2;
		LD.DestAdrs = (void*)REG_BG2HOFS;
	}

	for(i = my->work[0] - 64; i <= my->work[0]; i++)
	{
		if(i >= 0){
			LasterBuffer[0][i] = my->work[6] + 240;
			LasterBuffer[1][i] = my->work[6] + 240;
		}
	}

	LD.DMAControl = H_DMA_ENABLE16;
	LD.TransType = LASTER_NORMAL;
	LD.LoopCount = 0;
	LasterDmaSet(LD);

	my->TaskAdrs = TaskSketchMain;

}
//===============================================
//	メインタスク
//===============================================
static void TaskSketchMain(u8 id)
{
	TASK_TABLE *my = &TaskTable[id];

	switch(my->work[4]){
	case 0:
		if(++(my->work[5]) > SKETCH_BEGIN_WAIT){
			my->work[4]++;
		}
		break;

	case 1:
		if(++(my->work[1]) >= SKETCH_WAIT){
			my->work[1] = 0;

			my->work[2] = my->work[3] & 3;
			my->work[5] = my->work[0] - my->work[3];

			switch(my->work[2]){
			case 0:  break;
			case 1:  my->work[5] -= 2; break;
			case 2:  my->work[5] += 1; break;
			case 3:  my->work[5] += 1; break;
			}

			if(my->work[5] >= 0){
				LasterBuffer[0][my->work[5]] = my->work[6];
				LasterBuffer[1][my->work[5]] = my->work[6];
			}

			if(++(my->work[3]) >= my->work[15]){
				LasterSys.TransType=LASTER_END;
				DelTaskEffect(id);
			}
		}
		break;
	}
}

//========================================================
//	ペンアクター
//========================================================
#define SKETCH_PEN_SPEED  (16)

static void SketchActMoveInit(actWork *act);
static void SketchActMove(actWork *act);

const actHeader ActSketchHeader = {
	WAZACHR_ID_PEN,
	WAZACHR_ID_PEN,
	&WazaOamDataNormal[2],
	DummyActAnmTbl,
	0,
	DummyActAffTbl,
	SketchActMoveInit,
};
//===============================================
//	初期化（ワーク設定不要）
//===============================================
static void SketchActMoveInit(actWork *act)
{
	act->x = GetWazaEffPos(DefenceNo, EFF_X) - 16;
	act->y = GetPokeShadowYPos(DefenceNo) + 16;

	act->work[0] = 0;  // 0:ｼｰｹﾝｽ
	act->work[1] = 0;  // 1:ｶｳﾝﾀ
	act->work[2] = 0;  // 2:ｻﾌﾞｶｳﾝﾀ
	act->work[3] = SKETCH_PEN_SPEED;
	act->work[4] = 0;
//	act->work[5] = 64 + 2;  // 5:上昇幅（本来は絵のｻｲｽﾞによって変える）
	act->work[5] = W_GetPokeSize(DefenceNo,POKESIZE_HEIGHT)+2;  // 5:上昇幅
	act->work[6] = GetWazaEffSePan(WAZA_SE_R);  // 6:SE PAN

	
	act->move = SketchActMove;
}
//===============================================
//	メイン
//===============================================
static void SketchActMove(actWork *act)
{
	switch(act->work[0]){
	// 点滅ﾌｪｰﾄﾞｲﾝ
	case 0:
		if(++(act->work[2]) > 1){
			act->work[2] = 0;
			act->banish = !(act->banish);
		}
		if(++(act->work[1]) > SKETCH_PENMOVE_WAIT){
			act->banish = 0;
			act->work[0]++;
		}
		break;

	// 横にサササッと動きつつ、ゆっくり上昇
	case 1:
		if(++(act->work[1]) >= SKETCH_WAIT){
			if(act->work[2] < act->work[5]){
				act->work[1] = 0;
				act->y--;
				act->work[2]++;
				if((act->work[2] % 10) == 0){
					SePlayPan(SE_W166, act->work[6]);
				}
			}
		}
//		act->work[4] = (act->work[4] + 3) & 0xff;
//		act->work[3] = sin_cos_table[act->work[4]] >> 3;
//		act->dx = act->work[3];
		act->work[4] += act->work[3];
		if(act->work[4] >= 32){
			act->work[4] = 64 - (act->work[4]);
			act->work[3] *= -1;
		}else if(act->work[4] <= -32){
			act->work[4] = -64 - (act->work[4]);
			act->work[3] *= -1;
		}
		act->dx = act->work[4];

		if(act->work[5] == act->work[2]){// && act->work[3] == 2){
			act->work[1] = 0;
			act->work[2] = 0;
			act->work[0]++;
		}
		break;

	// 点滅ﾌｪｰﾄﾞｱｳﾄ
	case 2:
		if(++(act->work[2]) > 1){
			act->work[2] = 0;
			act->banish = !(act->banish);
		}
		if(++(act->work[1]) > SKETCH_PENMOVE_WAIT){
			act->banish = 0;
			DelWazaEffect(act);
		}
		break;
	}
}












//=========================================================================
//
//		いびき
//												by matsuda 2002.05.21(火)
//=========================================================================
const	actHeader IbikiHeader={
	WAZACHR_ID_Z,
	WAZACHR_ID_Z,
	&WazaOamDataNormal[2],
	DummyActAnmTbl,
	0,
	DummyActAffTbl,
	W_OffsetSpaceMove,
};











//=========================================================================
//
//		だいばくはつ
//												by matsuda 2002.05.21(火)
//=========================================================================
#define DAIBAKUHATU_ANMWAIT		5
static const actAnm DaibakuhatuAnm0[]={
	{OBJ16_32x32*0,DAIBAKUHATU_ANMWAIT, 0,0},
	{OBJ16_32x32*1,DAIBAKUHATU_ANMWAIT, 0,0},
	{OBJ16_32x32*2,DAIBAKUHATU_ANMWAIT, 0,0},
	{OBJ16_32x32*3,DAIBAKUHATU_ANMWAIT, 0,0},
	{ACT_ANMEND,0,0,0}
};
static const actAnm *const DaibakuhatuAnmTbl[]={
	DaibakuhatuAnm0,
};
const	actHeader DaibakuhatuHeader={
	WAZACHR_ID_DAIBAKUHATU,
	WAZACHR_ID_DAIBAKUHATU,
	&WazaOamDataNormal[2],
	DaibakuhatuAnmTbl,
	0,
	DummyActAffTbl,
	W_AnmAffWaitDel,
};











//=========================================================================
//
//		タマゴうみ
//												by matsuda 2002.05.23(木)
//=========================================================================
static void TamagoUmiInit(actWork *xreg);
static void TamagoUmiMain(actWork *xreg);
static void TamagoUmiUpSeq(actWork *xreg);
static void TamagoUmiBldWait(actWork *xreg);
static void TamagoUmiDelWait(actWork *xreg);
static void TamagoUmiDelSeq(actWork *xreg);
static void TamagoUmiAffMoveWait(actWork *xreg);
static void TamagoUmiAffMove(actWork *xreg);

#define TAMAGOUMI_THETA		(-8)
#define TAMAGOUMI_AFFWAIT	2
static const actAffAnm TamagoUmiAff0[] = {
//	{ 拡縮x, 拡縮y, 角度, ｳｪｲﾄ }
	{ 0, 0, TAMAGOUMI_THETA, TAMAGOUMI_AFFWAIT},
	{0,0, -TAMAGOUMI_THETA, TAMAGOUMI_AFFWAIT*2},
	{ 0, 0, TAMAGOUMI_THETA, TAMAGOUMI_AFFWAIT},
	{ACT_AFLOOP,0,0,0},
};
static const actAffAnm TamagoUmiAff1[] = {
//	{ 拡縮x, 拡縮y, 角度, ｳｪｲﾄ }
	{0x0100,0x0100,0,ACT_AFSET},
	{ACT_AFEND,0,0,0},
};
static const actAffAnm TamagoUmiAff2[] = {
//	{ 拡縮x, 拡縮y, 角度, ｳｪｲﾄ }
	{-0x8,0x4,0,8},
//	{0,0,0,3},
	{ACT_AFcLOOP, 0,0,0},	//ラベル定義
	{0x10,-0x8,0,8},
//	{0,0,0,3},
	{-0x10,0x8,0,8},
//	{0,0,0,3},
	{ACT_AFcLOOP,1,0,0},
	{0x0100,0x0100,0,ACT_AFSET},
	{0,0,0,15},
	{ACT_AFEND,0,0,0},
};
static const	actAffAnm * const TamagoUmiAffTbl[] = {
	TamagoUmiAff0,
	TamagoUmiAff1,
	TamagoUmiAff2,
};
const	actHeader TamagoUmiHeader={
	WAZACHR_ID_TAMAGO2,
	WAZACHR_ID_TAMAGO2,
	&WazaOamDataBldAffine2[2],
	DummyActAnmTbl,
	0,
	TamagoUmiAffTbl,
	TamagoUmiInit,
};

//-- 波紋 --//
#define HAMON_AFFLOOP	30
#define HAMON_AFF		((0x200-0x10) / HAMON_AFFLOOP)
#define HAMON_AFFLOOP2	45
#define HAMON_AFF2		((0x200-0x10) / HAMON_AFFLOOP2)
static const actAffAnm HamonAff0[] = {
//	{ 拡縮x, 拡縮y, 角度, ｳｪｲﾄ }
	{0x10, 0x10, 0, ACT_AFSET},
	{HAMON_AFF, HAMON_AFF, 0, HAMON_AFFLOOP},
	{ACT_AFEND,1,0,0},
};
static const actAffAnm HamonAff1[] = {  // 0 の倍速
	{0x10, 0x10, 0, ACT_AFSET},
	{HAMON_AFF*2, HAMON_AFF*2, 0, HAMON_AFFLOOP/2},
	{ACT_AFEND,1,0,0},
};
static const actAffAnm HamonAff2[] = {	//HyperVoice用
	{0x10,0x10,0,ACT_AFSET},
	{HAMON_AFF2,HAMON_AFF2,0,HAMON_AFFLOOP2},
	{ACT_AFEND,1,0,0},
};
static const	actAffAnm * const HamonAffTbl[] = {
	HamonAff0,
	HamonAff1,
	HamonAff2,	//add_020826_iwasawa
};
const	actHeader HamonHeader={
	WAZACHR_ID_HAMON,
	WAZACHR_ID_HAMON,
//	&WazaOamDataBldAffine2[3],
	&WazaOamDataAffine2[3],
	DummyActAnmTbl,
	0,
	HamonAffTbl,
	W_AnmAffWaitDel,
};

// 縮む波紋
static const actAffAnm Hamon2Aff[] = {
//	{ 拡縮x, 拡縮y, 角度, ｳｪｲﾄ }
	{0x200, 0x200, 0, ACT_AFSET},
	{-HAMON_AFF, -HAMON_AFF, 0, HAMON_AFFLOOP},
	{ACT_AFEND,1,0,0},
};
static const	actAffAnm * const Hamon2AffTbl[] = {
	Hamon2Aff,
};
const actHeader  Hamon2Header = {
	WAZACHR_ID_HAMON,
	WAZACHR_ID_HAMON,
	&WazaOamDataBldAffine2[3],
	DummyActAnmTbl,
	0,
	Hamon2AffTbl,
	W_AnmAffWaitDel,
};
//==============================================
//	波紋：マルチ対応
//	0:Xoffset  1:Yoffset  2: 0=攻撃側に出す  1=防御側に出す
//	 3:座標ﾓｰﾄﾞ(0:PMﾓｰﾄﾞ1:EFFﾓｰﾄﾞ)
//	↑(0～3は W_AnmAffWaitDel でそのまま使う）
//==============================================
static void HamonMultiActInit(actWork *act)
{
	u8	client = 0,mode;
	s16	cx = 0,cy = 0,dx = 0;
	
	if(WazaEffWork[2] == 0)	client = AttackNo;
	else					client = DefenceNo;
	
	mode = WazaEffWork[3]^1;
#if M2P_DISPCHK
	if(FightCheck() && PokeBG2taimeCheck(client^2)){	//2vs2&&相方が画面にいる
#else	
	if(FightCheck() && ClientPokeExistCheck(client^2)){	//2vs2&&相方が生きている
#endif		
		GetCenterEffPos(client,mode,&cx,&cy);
		
		if(mode == EFF_MODE){
			dx = GetWazaEffPos(client,EFF_X);
		}else{
			dx = GetWazaEffPos(client,PM_X);
		}
		if(MineEnemyCheck(client)){
			WazaEffWork[0] -= cx - dx-WazaEffWork[0];
		}
		else{
			WazaEffWork[0] -= dx-cx+WazaEffWork[0];
		}
	}
	act->move = W_AnmAffWaitDel;
	act->move(act);
}
const actHeader  HamonMHeader = {
	WAZACHR_ID_HAMON,
	WAZACHR_ID_HAMON,
	&WazaOamDataBldAffine2[3],
	DummyActAnmTbl,
	0,
	HamonAffTbl,
	HamonMultiActInit,
};

//==============================================
//	相手に向かって移動する波紋：マルチ対応
//	0:sync	1:Xoffset0  2:Yoffset0, 3:Xoffset1, 4:Yoffset1,
//	5: 0=攻撃→防御  1=防御→攻撃
//	6:座標ﾓｰﾄﾞ(1:PMﾓｰﾄﾞ0:EFFﾓｰﾄﾞ)
//==============================================
static void HamonMoveActMain(actWork *act)
{
	if(!W_ParallelSync(act)) return;
	AffineDelActor(act);
	DelWazaEffect(act);
}
static void HamonMoveActInit(actWork *act)
{
	u8	client = 0,enemy = 0,mode_x = 0,mode_y = 0;
	s16	sx = 0,sy = 0,ex =0,ey = 0;
	
	if(WazaEffWork[5] == 0){
		client = AttackNo;
		enemy = DefenceNo;
	}
	else{
		client = DefenceNo;
		enemy = AttackNo;
	}

	//PM_MODE or EFF_MODE?
	if(WazaEffWork[6] == EFF_MODE){
		mode_x = EFF_X;
		mode_y = EFF_Y;
	}else{
		mode_x = PM_X;
		mode_y = PM_Y;
	}

	//プライオリティを決める
	//始点を求める
	if(MineEnemyCheck(client)){
		sx = GetWazaEffPos(client,mode_x)+WazaEffWork[0];

		if(PokeBG2taimeCheck(enemy^2))
			act->pri = ActWork[PokemonStruct[enemy^2]].pri-1;
		else
			act->pri = ActWork[PokemonStruct[enemy]].pri-1;
	}
	else{
		sx = GetWazaEffPos(client,mode_x)-WazaEffWork[0];

		if(sys.FieldBattleFlag){
			if(PokeBG2taimeCheck(client^2)){
				if(ActWork[PokemonStruct[client]].x < ActWork[PokemonStruct[client^2]].x)
					act->pri = ActWork[PokemonStruct[client^2]].pri+1;
				else
					act->pri = ActWork[PokemonStruct[client]].pri-1;
			}else{
				act->pri = ActWork[PokemonStruct[client]].pri-1;
			}
		}else{
			act->pri = ActWork[PokemonStruct[client]].pri-1;
		}
	}
	sy = GetWazaEffPos(client,mode_y)+WazaEffWork[1];
	
	//終点を求める
	if(sys.FieldBattleFlag && PokeBG2taimeCheck(enemy^2)){	//2vs2&&相方が画面内にいる
		GetCenterEffPos(enemy,WazaEffWork[6],&ex,&ey);
	}else{
		ex = GetWazaEffPos(enemy,mode_x);
		ey = GetWazaEffPos(enemy,mode_y);
	}
	if(MineEnemyCheck(enemy))
		ex += WazaEffWork[3];
	else
		ex -= WazaEffWork[3];
	ey += WazaEffWork[4];

	act->x = act->work[1] = sx;
	act->y = act->work[3] = sy;
	act->work[2] = ex;
	act->work[4] = ey;
	
	act->work[0] = WazaEffWork[0];
	W_GetStraightSyncParam(act);
	
	act->move = HamonMoveActMain;
	act->move(act);
}
const actHeader  HamonMoveHeader = {
	WAZACHR_ID_HAMON,
	WAZACHR_ID_HAMON,
	&WazaOamDataBldAffine2[3],
	DummyActAnmTbl,
	0,
	&(HamonAffTbl[2]),
	HamonMoveActInit,
};

//==============================================
//	色つき波紋（ソフトフェードさせます）
//	0:Xoffset  1:Yoffset  2: 0=攻撃側に出す  1=防御側に出す
//	 3:座標ﾓｰﾄﾞ(0:PMﾓｰﾄﾞ1:EFFﾓｰﾄﾞ)
//	↑(0～3は W_AnmAffWaitDel でそのまま使う）
//	4:色  5:evy
//==============================================
static void HamonColorActInit(actWork *act)
{
	u16 colno;

	colno = ObjPalNumGet(WAZACHR_ID_HAMON);
	if(colno != 0xff)
	{
		colno = 256 + colno * 16 + 1;
		SoftFade(colno, 15, WazaEffWork[5], WazaEffWork[4]);
	}
	ActAffAnmChg(act,1);
	act->move = W_AnmAffWaitDel;
	act->move(act);
}
const	actHeader HamonColorHeader={
	WAZACHR_ID_HAMON,
	WAZACHR_ID_HAMON,
	&WazaOamDataBldAffine2[3],
	DummyActAnmTbl,
	0,
	HamonAffTbl,
//	W_AnmAffWaitDel,
	HamonColorActInit
};

//----------------------------------------------------------
//	0:Xoffset	1:Yoffset	2: 0=上の殻 1=下の殻
//----------------------------------------------------------
#define TAMAGOUMI_X_SP		0x00a0
#define TAMAGOUMI_Y_SP		0x0380
#define TAMAGOUMI_SUB_SP_Y	(-0x0020)
#define TAMAGOUMI_UP_SYNC		8
#define TAMAGOUMI_AFFMOVE_WAIT	20
static void TamagoUmiInit(actWork *xreg)
{
	s16 x_sp;
	
	WazaDefaultPosSet2(xreg, EFF_MODE);
	if(MineEnemyCheck(AttackNo))
		x_sp = -TAMAGOUMI_X_SP;
	else
		x_sp = TAMAGOUMI_X_SP;
	xreg->work[0] = TAMAGOUMI_Y_SP;
	xreg->work[1] = x_sp;
	xreg->work[7] = WazaEffWork[2];
	xreg->move = TamagoUmiMain;
}

static void TamagoUmiMain(actWork *xreg)
{
	s16 x_sp;
	
	xreg->dy -= xreg->work[0] >> 8;
	xreg->dx = xreg->work[1] >> 8;
	xreg->work[0] += TAMAGOUMI_SUB_SP_Y;
	if(MineEnemyCheck(AttackNo))
		x_sp = -TAMAGOUMI_X_SP;
	else
		x_sp = TAMAGOUMI_X_SP;
	xreg->work[1] += x_sp;
	if(xreg->dy > 0){
		xreg->y += xreg->dy;
		xreg->x += xreg->dx;
		xreg->dx = xreg->dy = 0;
		xreg->work[0] = 0;
		ActAffAnmChg(xreg, 1);	//正面静止状態に戻す
		xreg->move = TamagoUmiAffMoveWait;
	}
}

static void TamagoUmiAffMoveWait(actWork *xreg)
{
	if(xreg->work[0]++ < TAMAGOUMI_AFFMOVE_WAIT)
		return;
	ActAffAnmChg(xreg, 2);
	xreg->move = TamagoUmiAffMove;
}

static void TamagoUmiAffMove(actWork *xreg)
{
	if(xreg->affend_sw == 0)
		return;
	
	ActAffAnmChg(xreg, 1);
	xreg->work[0] = 0;
	if(xreg->work[7] == 0){
		xreg->oamData.CharNo += 16;		//上の殻
		xreg->move = TamagoUmiUpSeq;
	}
	else{
		xreg->oamData.CharNo += 32;		//下の殻
		xreg->move = TamagoUmiDelWait;
	}
}

static void TamagoUmiUpSeq(actWork *xreg)
{
	xreg->dy -= 2;
	if(xreg->work[0]++ == TAMAGOUMI_UP_SYNC){
		xreg->work[0] = 16;
		xreg->work[1] = 0;
		*(vu16*)REG_BLDCNT = BLD_A_BLEND_MODE | BLD_2ND_ALL;
		*(vu16*)REG_BLDALPHA = xreg->work[0];
		xreg->move = TamagoUmiBldWait;
	}
}

static void TamagoUmiBldWait(actWork *xreg)
{
	if(xreg->work[1]++ % 3 == 0){
		xreg->work[0]--;
		*(vu16*)REG_BLDALPHA = ((16-xreg->work[0]) << 8) | xreg->work[0];
		if(xreg->work[0] == 0)
			xreg->move = TamagoUmiDelWait;
	}
}

//-- WazaEffWork[7]に0xffffが入ってくるまで待機 --//
static void TamagoUmiDelWait(actWork *xreg)
{
	if((u16)WazaEffWork[7] == 0xffff){
		xreg->banish = 1;
		if(xreg->work[7] == 0)
			xreg->move = TamagoUmiDelSeq;
		else
			xreg->move = DelWazaEffect;
	}
}

static void TamagoUmiDelSeq(actWork *xreg)
{
	*(vu16*)REG_BLDCNT = 0;
	*(vu16*)REG_BLDALPHA = 0;
	DelWazaEffect(xreg);
}





//=========================================================================
//	しんそく
//
//																	TAYA
//=========================================================================

//======================================================
//	攻撃側が消える
//======================================================
static void TaskSinsokuVanishMain(u8 id);

static const actAffAnm sinsoku_vanish_aff[] = {
	{ 0x60, -0x0d, 0, 8 },		// 0
	{ACT_AFEND,0,0,0},
};

void TaskSinsokuVanish(u8 id)
{
	TASK_TABLE *my = &TaskTable[id];

	my->work[0] = W_GetPokeActNo(0);
	SetPokeKakusyukuAnm(my, my->work[0], sinsoku_vanish_aff);
	my->TaskAdrs = TaskSinsokuVanishMain;
}
static void TaskSinsokuVanishMain(u8 id)
{
	TASK_TABLE *my = &TaskTable[id];

	if(!PokeKakusyukuAnm(my)){
		ActWork[my->work[0]].dy = 0;
		ActWork[my->work[0]].banish = 1;
		DelTaskEffect(id);
	}
}

//======================================================
//	防御側ダメージ
//======================================================
#define SINSOKU_BURE_WIDTH (6)
#define SINSOKU_BURE_WAIT  (1)
#define SINSOKU_BURE_CNT   (5)
#define SINSOKU_MOVE_WIDTH (8)
#define SINSOKU_MOVE_CNT   (3)
static void TaskSinsokuDamageMain(u8 id);

void TaskSinsokuDamage(u8 id)
{
	TASK_TABLE *my = &TaskTable[id];

	my->work[0] = 0;
	my->work[1] = 0;
	my->work[2] = 0;
	my->work[3] = 0;

	my->work[12] = SINSOKU_MOVE_CNT;
	if(MineEnemyCheck(DefenceNo) == SIDE_MINE){
		my->work[13] = -1;
		my->work[14] = SINSOKU_MOVE_WIDTH;
	}else{
		my->work[13] = 1;
		my->work[14] = -SINSOKU_MOVE_WIDTH;
	}
	my->work[15] = W_GetPokeActNo(1);
	my->TaskAdrs = TaskSinsokuDamageMain;
}
static void TaskSinsokuDamageMain(u8 id)
{
	TASK_TABLE *my = &TaskTable[id];

	switch(my->work[0]){
	case 0:
		ActWork[my->work[15]].dx += my->work[14];
		my->work[1] = 0;
		my->work[2] = 0;
		my->work[3] = 0;
		my->work[0]++;
		break;

	case 1:
		if(++(my->work[1]) > SINSOKU_BURE_WAIT){
			my->work[1] = 0;
			my->work[2]++;
			if(my->work[2] & 1){
				ActWork[my->work[15]].dx += SINSOKU_BURE_WIDTH;
			}else{
				ActWork[my->work[15]].dx -= SINSOKU_BURE_WIDTH;
			}
			if(++(my->work[3]) >= SINSOKU_BURE_CNT){
				if(my->work[2] & 1){
					ActWork[my->work[15]].dx -= SINSOKU_BURE_WIDTH;
				}
				my->work[0]++;
			}
		}
		break;

	case 2:
		if(--(my->work[12])){
			my->work[0] = 0;
		}else{
			my->work[0]++;
		}
		break;

	case 3:
		ActWork[my->work[15]].dx += my->work[13];
		if(ActWork[my->work[15]].dx == 0){
			DelTaskEffect(id);
		}
		break;
	}
}
//======================================================
//	攻撃側が現れる
//======================================================
static void TaskSinsokuAppearMain(u8 id);

void TaskSinsokuAppear(u8 id)
{
	TASK_TABLE *my = &TaskTable[id];

	my->work[0] = 0;
	my->work[1] = 0;
	my->work[2] = 0;
	my->work[3] = 0;
	my->work[4] = 1;


	my->work[13] = 14;
	my->work[14] = 2;
	my->work[15] = W_GetPokeActNo(0);
	my->TaskAdrs = TaskSinsokuAppearMain;
}

static void TaskSinsokuAppearMain(u8 id)
{
	TASK_TABLE *my = &TaskTable[id];

	switch(my->work[0]){
	case 0:
		if(++(my->work[1]) > my->work[4]){
			my->work[1] = 0;
			my->work[2]++;
			if(my->work[2] & 1){
				ActWork[my->work[15]].banish = 0;
			}else{
				ActWork[my->work[15]].banish = 1;
			}
			if(++(my->work[3]) >= my->work[13]){
				my->work[4]++;
				if(my->work[4] < my->work[14]){
					my->work[1] = 0;
					my->work[2] = 0;
					my->work[3] = 0;
				}else{
					ActWork[my->work[15]].banish = 0;
					DelTaskEffect(id);
				}
			}
		}
		break;
	}

}
//======================================================
//	煙が現れる
//======================================================
#define SINSOKU_KEMURI_MAX        (4)  // 何箇所に出す？
#define SINSOKU_KEMURI_ADD_WAIT   (4)  // 次を出すまでのWAIT
#define SINSOKU_KEMURI_LOOP       (6)  // 何回繰り返す？

#define SINSOKU_KEMURI_ANMWAIT  (3)

static const actAnm SinsokuKemuriAnm[] =
{
	{OBJ16_16x16 * 0, SINSOKU_KEMURI_ANMWAIT, 0, 0},
	{OBJ16_16x16 * 1, SINSOKU_KEMURI_ANMWAIT, 0, 0},
	{OBJ16_16x16 * 2, SINSOKU_KEMURI_ANMWAIT, 0, 0},
	{OBJ16_16x16 * 1, SINSOKU_KEMURI_ANMWAIT, 0, 0},
	{OBJ16_16x16 * 0, SINSOKU_KEMURI_ANMWAIT, 0, 0},
	{ACT_ANMEND, 0, 0, 0},
};
static const actAnm * const SinsokuKemuriAnmTbl[] = {
	SinsokuKemuriAnm,
};
static void sinsoku_kemuri_actmove(actWork *act);

static const actHeader SinsokuKemuriHeader={
	WAZACHR_ID_KEMURI,
	WAZACHR_ID_KEMURI,
	&WazaOamDataNormal[1],
	SinsokuKemuriAnmTbl,
	0,
	DummyActAffTbl,
	sinsoku_kemuri_actmove,
};

static const s8 kemuri_ofs_tbl[SINSOKU_KEMURI_MAX][2] = {
	{  30, 28 },
	{ -20, 24 },
	{  16, 26 },
	{ -10, 28 },
};

static void TaskSinsokuKemuriAddMain(u8 id);

void TaskSinsokuKemuriAdd(u8 id)
{
	TASK_TABLE *my = &TaskTable[id];

	my->work[0] = 0;
	my->work[1] = SINSOKU_KEMURI_ADD_WAIT;
	my->work[2] = 0;
	my->work[3] = 0;

	my->work[4] = 0;
	my->work[5] = 0;
	my->work[6] = 0;
	my->work[7] = 0;
	my->work[8] = 0;

	my->work[13] = 0;
	my->work[14] = GetWazaEffPos(AttackNo, EFF_X);
	my->work[15] = GetWazaEffPos(AttackNo, EFF_Y);

	my->TaskAdrs = TaskSinsokuKemuriAddMain;
}
static void TaskSinsokuKemuriAddMain(u8 id)
{
	TASK_TABLE *my = &TaskTable[id];

	switch(my->work[8]){
	case 0:
		if(++(my->work[4]) > 1){
			my->work[4] = 0;
			my->work[5] = (my->work[5] + 1) & 1;
			if(++(my->work[6]) > 20){
				if(my->work[7] == 0){
					my->work[4] = 0;
					my->work[6] = 0;
					my->work[8] = 1;
				}else{
					my->work[8] = 2;
				}
			}
		}
		break;

	case 1:
		my->work[5] = 0;
		if(++(my->work[4]) > 20){
			my->work[7] = 1;
			my->work[8] = 0;
		}
		break;

	case 2:
		my->work[5] = 1;
		break;
	}


	switch(my->work[0]){
	case 0:
		if(++(my->work[1]) > SINSOKU_KEMURI_ADD_WAIT){
			u8 actno;
			my->work[1] = 0;
			actno = AddActor(&SinsokuKemuriHeader, my->work[14], my->work[15], 0);
			if(actno != ACT_MAX){
				ActWork[actno].work[0] = id;
				ActWork[actno].work[1] = 13;
				ActWork[actno].dx = kemuri_ofs_tbl[my->work[2]][0];
				ActWork[actno].dy = kemuri_ofs_tbl[my->work[2]][1];
				my->work[13]++;

				if(++(my->work[2]) >= SINSOKU_KEMURI_MAX){
					my->work[2] = 0;
					if(++(my->work[3]) >= SINSOKU_KEMURI_LOOP){
						my->work[0]++;
					}
				}
			}
		}
		break;

	case 1:
		if(my->work[13] == 0)
		{
			DelTaskEffect(id);
		}
		break;
	}
}

static void sinsoku_kemuri_actmove(actWork *act)
{
	act->banish = TaskTable[act->work[0]].work[5];
	if(act->anmend_sw){
		TaskTable[act->work[0]].work[act->work[1]]--;
		DelActor(act);
	}
}

















//=========================================================================
//
//		いやしのすず
//												by matsuda 2002.05.29(水)
//=========================================================================
#define BELL_ANMWAIT	6
#define BELL_CORNER_ANMWAIT	15	//端っこでベルが鳴ってる時のｱﾆﾒｳｪｲﾄ
static const actAnm BellAnm0[]={
	{OBJ16_32x32*0,BELL_ANMWAIT,0,0},
	{OBJ16_32x32*1,BELL_ANMWAIT,0,0},
	{OBJ16_32x32*2,BELL_CORNER_ANMWAIT,0,0},
	{OBJ16_32x32*1,BELL_ANMWAIT,0,0},
	{OBJ16_32x32*0,BELL_ANMWAIT,0,0},
	{OBJ16_32x32*1,BELL_ANMWAIT,1,0},
	{OBJ16_32x32*2,BELL_CORNER_ANMWAIT,1,0},
	{OBJ16_32x32*1,BELL_ANMWAIT,1,0},

	{OBJ16_32x32*0,BELL_ANMWAIT,0,0},
	{OBJ16_32x32*1,BELL_ANMWAIT,0,0},
	{OBJ16_32x32*2,BELL_CORNER_ANMWAIT,0,0},
	{OBJ16_32x32*1,BELL_ANMWAIT,0,0},
	{OBJ16_32x32*0,BELL_ANMWAIT,0,0},
	{ACT_ANMEND,0,0,0}
};
static const actAnm *const BellAnmTbl[]={
	BellAnm0,
};
const	actHeader BellHeader={
	WAZACHR_ID_BELL2,
	WAZACHR_ID_BELL2,
	&WazaOamDataNormal[2],
	BellAnmTbl,
	0,
	DummyActAffTbl,
	W_AnmAffWaitDel,
};


//=========================================================================
//	音符
//=========================================================================
static void OnpuInit(actWork *xreg);

//----------------------------------------------------------
//	音符のパレットを全てｾｯﾄする
//（CHAR_SETの後で呼び出すこと！）
//----------------------------------------------------------
#define ONPU_PAL_NUM	5	//音符のパレット本数
const u16 OnpuPalID[ONPU_PAL_NUM] = {	//音符のPalID
	WAZACHR_ID_ONPU2,		//正規のPalID
	WAZACHR_ID_FAST_NUMBER-1,
	WAZACHR_ID_FAST_NUMBER-2,
	WAZACHR_ID_FAST_NUMBER-3,
	WAZACHR_ID_FAST_NUMBER-4,
};
void OnpuPalSetTask(u8 id)
{
	int i;
	u8 palno[ONPU_PAL_NUM];
	
	palno[0] = ObjPalNumGet(WAZACHR_ID_ONPU2);	//正規のパレット
	for(i = 1; i < ONPU_PAL_NUM; i++){
		palno[i] = ObjPalNumSet(WAZACHR_ID_FAST_NUMBER-i);//絶対にかぶらないIDを指定
	}
	
	DecordWram((void*)s_onpu_pcl_ADRS, &UserWork[WAZAEFF_USERWORK]);	//ﾊﾟﾚｯﾄﾃﾞｰﾀ展開
	for(i = 0; i < ONPU_PAL_NUM; i++)
		PaletteWorkSet((u16*)&UserWork[WAZAEFF_USERWORK+0x20*i],16*16+palno[i]*16,0x20);
	DelTaskEffect(id);
}

//----------------------------------------------------------
//	音符のパレットを全てDelする(正規のパレットだけはDelしない)
//----------------------------------------------------------
void OnpuPalDelTask(u8 id)
{
	int i;
	
	for(i = 0; i < ONPU_PAL_NUM; i++)
		ObjPalRegNumDel(OnpuPalID[i]);
	DelTaskEffect(id);
}

//----------------------------------------------------------
//	音符のアニメNoとパレットを指定して変更する
//	AnmNo：何番目のｱﾆﾒを使用するか
//	ColorNo：何番目のｶﾗｰを使用するか
//----------------------------------------------------------
void SetOnpuAnm(actWork *xreg, u8 AnmNo, u8 ColorNo)
{
	u16 charNo_offset;
	
	if(ColorNo & 1)
		charNo_offset = OBJ16_16x16 * 8;
	else
		charNo_offset = 0;
	xreg->oamData.CharNo += OBJ16_16x16 * AnmNo + charNo_offset;
	xreg->oamData.Pltt = ObjPalNumGet(OnpuPalID[ColorNo / 2]);
}

//----------------------------------------------------------
//	「いやしのすず」の音符
//----------------------------------------------------------
const	actHeader OnpuHeader={
	WAZACHR_ID_ONPU2,
	WAZACHR_ID_ONPU2,
	&WazaOamDataNormal[1],
	DummyActAnmTbl,
	0,
	DummyActAffTbl,
	OnpuInit,
};

//----------------------------------------------------------
//	0:始点Xoffset	1:終点Yoffset	2:終点Xoffset	3:終点Yoffset
//	4:SyncNum	5:AnmNo		6:ColorNo
//----------------------------------------------------------
static void OnpuInit(actWork *xreg)
{
	WazaDefaultPosSet2(xreg, EFF_MODE);
	if(MineEnemyCheck(AttackNo))
		WazaEffWork[2] = -WazaEffWork[2];
	xreg->work[0] = WazaEffWork[4];
	xreg->work[2] = GetWazaEffPos(AttackNo, EFF_X)+WazaEffWork[2];
	xreg->work[4] = GetWazaEffPos(AttackNo, EFF_Y)+WazaEffWork[3];
	xreg->move = W_StraightSyncMove;
	SetWorkSeq(xreg, DelWazaEffect);
	
	SetOnpuAnm(xreg, WazaEffWork[5], WazaEffWork[6]);
}


















//=========================================================================
//
//		あまえる
//												by matsuda 2002.05.31(金)
//=========================================================================
static void HeartInit(actWork *xreg);

const	actHeader HeartHeader={
	WAZACHR_ID_HEART2,
	WAZACHR_ID_HEART2,
	&WazaOamDataNormal[1],
	DummyActAnmTbl,
	0,
	DummyActAffTbl,
	HeartInit,
};

//----------------------------------------------------------
//	0:Xoffset	1:Yoffset
//----------------------------------------------------------
#define AMAERU_FURIHABA		8
#define AMAERU_ADDSEC		7
#define AMAERU_DY			-0x0080
#define AMAERU_ENDWAIT		60
static void HeartInit(actWork *xreg)
{
	if(xreg->work[0]++ == 0)
		WazaDefaultPosSet2(xreg, EFF_MODE);
	
	xreg->dx = SinMove(xreg->work[1], AMAERU_FURIHABA);
	xreg->dy = xreg->work[2] >> 8;
	xreg->work[1] = 0xff & (xreg->work[1] + AMAERU_ADDSEC);
	xreg->work[2] += AMAERU_DY;
	
	if(xreg->work[0] == AMAERU_ENDWAIT)
		DelWazaEffect(xreg);
}












//=========================================================================
//
//		ねこだまし
//												by matsuda 2002.05.31(金)
//=========================================================================
static void NekoDamasiMain(u8 id);
static void NekoDamasiWhite(u8 id);
//----------------------------------------------------------
//		画面をｳｨﾝﾄﾞｳで真っ黒にする
//	offset なし
//----------------------------------------------------------
#define NEKODAMASI_WIN_SP	13	//背景を閉じる速度

void NekoDamasiTask(u8 id)
{
	s16 Right, Left;
	
	Right = ContestCheck() ? CONTEST_RIGHTEND : 240;
	Left = 0;
	
	Win0H = (Left<<8) | Right;
	Win0V = (0<<8) | 160;
	*(vu16*)REG_WIN0H = Win0H;
	*(vu16*)REG_WIN0V = Win0V;
	*(vu16*)REG_WININ = (WIN_ALL_ON << 8) | (WIN_ALL_ON ^ WIN_BLEND_ON);//BLEND無効
	*(vu16*)REG_WINOUT = (WIN_ALL_ON << 8) | WIN_ALL_ON;
	*(vu16 *)REG_BLDCNT = BLD_BG3_1ST | BLD_DOWN_MODE;
	*(vu16 *)REG_BLDY = 16;		//ｳｨﾝﾄﾞｳの外は真っ黒にする
	
	TaskTable[id].work[0] = Left;
	TaskTable[id].work[1] = Right;
	TaskTable[id].TaskAdrs = NekoDamasiMain;
}

static void NekoDamasiMain(u8 id)
{
	TaskTable[id].work[0] += NEKODAMASI_WIN_SP;
	TaskTable[id].work[1] -= NEKODAMASI_WIN_SP;
	if(TaskTable[id].work[0] >= TaskTable[id].work[1])
	{
		Win0H = 0;
		TaskTable[id].TaskAdrs = NekoDamasiWhite;
	}
	else
		Win0H = (TaskTable[id].work[0]<<8) | TaskTable[id].work[1];
}

static void NekoDamasiWhite(u8 id)
{
	u32 fade_bit;
	
	if(TaskTable[id].work[10]++ == 4){
		TaskTable[id].work[11] = BLD_BG3_1ST | BLD_UP_MODE;
		DmaTransReq((u8*)&TaskTable[id].work[11], REG_BLDCNT, 2);
		//*(vu16 *)REG_BLDCNT = BLD_BG3_1ST | BLD_UP_MODE;
		fade_bit = GetBattleFadeBit(1, 0, 0, 0, 0, 0, 0);
		ColorConceChange(fade_bit, 16, 0x7fff);
	}
	else if(TaskTable[id].work[10] > 4)
	{
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
//	ポケモンをびっくりさせる
//----------------------------------------------------------
#define BIKKURI_AFF_X	10
#define BIKKURI_AFF_Y	13
#define BIKKURI_AFFLOOP	10
static const actAffAnm BikkuriAffAnm[] = {
	{BIKKURI_AFF_X, -BIKKURI_AFF_Y, 0, BIKKURI_AFFLOOP},
	{-BIKKURI_AFF_X, BIKKURI_AFF_Y, 0, BIKKURI_AFFLOOP},
	{ACT_AFEND,0,0,0},
};

#define BIKKURI_DX		4
void PokeBikkuri(u8 id)
{
	u8 pokeact;
	
	pokeact = W_GetPokeActNo(1);
	if(TaskTable[id].work[0]++ == 0){
		SetPokeKakusyukuAnm(&TaskTable[id], W_GetPokeActNo(1), BikkuriAffAnm);
		ActWork[pokeact].dx = BIKKURI_DX;
	}
	else{
		ActWork[pokeact].dx = -ActWork[pokeact].dx;
		if(PokeKakusyukuAnm(&TaskTable[id]) == 0){
			ActWork[pokeact].dx = 0;
			ActWork[pokeact].dy = 0;
			DelTaskEffect(id);
		}
	}
}

void PokeBikkuriJibun(u8 id)
{
	u8 pokeact;
	
	pokeact = W_GetPokeActNo(0);
	if(TaskTable[id].work[0]++ == 0){
		SetPokeKakusyukuAnm(&TaskTable[id], W_GetPokeActNo(0), BikkuriAffAnm);
		ActWork[pokeact].dx = BIKKURI_DX;
	}
	else{
		ActWork[pokeact].dx = -ActWork[pokeact].dx;
		if(PokeKakusyukuAnm(&TaskTable[id]) == 0){
			ActWork[pokeact].dx = 0;
			ActWork[pokeact].dy = 0;
			DelTaskEffect(id);
		}
	}
}

















//=========================================================================
//
//		メロメロ
//												by matsuda 2002.05.31(金)
//=========================================================================
static void MeromeroMain(actWork *xreg);
static void MeromeroInit(actWork *xreg);
void MeroHeartInit(actWork *xreg);
static void MeromeroHaikeiMain(u8 id);
static void HeartUpInit(actWork *xreg);
static void HeartUpMain(actWork *xreg);

const	actHeader MeromeroHeader={
	WAZACHR_ID_HEART3,
	WAZACHR_ID_HEART3,
	&WazaOamDataNormal[1],
	DummyActAnmTbl,
	0,
	DummyActAffTbl,
	MeromeroInit,
};

//-- はじけるハート --//
const	actHeader MeroHeartHeader={
	WAZACHR_ID_HEART3,
	WAZACHR_ID_HEART3,
	&WazaOamDataNormal[1],
	DummyActAnmTbl,
	0,
	DummyActAffTbl,
	MeroHeartInit,
};

//-- 上昇するハート --//
const actHeader HeartUpHeader={
	WAZACHR_ID_HEART3,
	WAZACHR_ID_HEART3,
	&WazaOamDataNormal[1],
	DummyActAnmTbl,
	0,
	DummyActAffTbl,
	HeartUpInit,
};

//----------------------------------------------------------
//	0:Xoffset	1:Yoffset
//----------------------------------------------------------
#define MEROMERO_SYNC	95
#define MEROMERO_FURIHABA	14
#define MEROMERO_ADDSEC		4
static void MeromeroInit(actWork *xreg)
{
	WazaDefaultPosSet2(xreg, PM_MODE);
	xreg->work[0] = MEROMERO_SYNC;
	xreg->work[1] = xreg->x;
	xreg->work[2] = GetWazaEffPos(DefenceNo, PM_X);
	xreg->work[3] = xreg->y;
	xreg->work[4] = GetWazaEffPos(DefenceNo, PM_Y);
	W_GetStraightSyncParam(xreg);
	xreg->move = MeromeroMain;
}

static void MeromeroMain(actWork *xreg)
{
	if(W_ParallelSync(xreg) == 0){
		xreg->dy += SinMove(xreg->work[5], MEROMERO_FURIHABA);
		xreg->work[5] = 0xff & (xreg->work[5] + MEROMERO_ADDSEC);
	}
	else
		DelWazaEffect(xreg);
}


//----------------------------------------------------------
//	はじけるハート
//	0:移動速度(固定少数)	1:振り幅Y
//----------------------------------------------------------
#define MEROHEART_ADDSEC	3
void MeroHeartInit(actWork *xreg)
{
	if(xreg->work[0] == 0){
		xreg->work[1] = WazaEffWork[0];
		xreg->work[2] = WazaEffWork[1];
		xreg->work[0]++;
		return;
	}
	
	xreg->work[4] += xreg->work[1];
	xreg->dx = xreg->work[4] >> 8;
	xreg->dy = SinMove(xreg->work[3], xreg->work[2]);
	xreg->work[3] = 0xff & (xreg->work[3] + MEROHEART_ADDSEC);
	if(xreg->work[3] > 100){
		xreg->banish = xreg->work[3]%2;
	}
	
	if(xreg->work[3] > 120)
		DelWazaEffect(xreg);
}




//----------------------------------------------------------
//	上昇するハート
//	0:Xpos		1:上昇速度(固定少数)	2:ｴﾌｪｸﾄ開始までのｳｪｲﾄ
//----------------------------------------------------------
#define HEARTUP_DX	4
#define HEARTUP_ADDSEC	3
static void HeartUpInit(actWork *xreg)
{
	xreg->x = WazaEffWork[0];
	xreg->y = 160;
	xreg->work[0] = WazaEffWork[2];
	xreg->work[1] = WazaEffWork[1];
	xreg->move = W_WaitSeq;
	SetWorkSeq(xreg, HeartUpMain);
}

static void HeartUpMain(actWork *xreg)
{
	s16	y = 0;
	
	xreg->work[2] += xreg->work[1];
	xreg->dy = -(((u16)xreg->work[2]) >> 8);
	
	xreg->dx = SinMove(xreg->work[3], HEARTUP_DX);
	xreg->work[3] = 0xff & (xreg->work[3] + HEARTUP_ADDSEC);
	
	y = xreg->y+xreg->dy;
	if(y > 72) return;
	xreg->banish = xreg->work[3]%2;
	
//	if(xreg->y + xreg->dy < -16)	//chg_02.08.28_iwasawa
	if(y > 64) return;				//画面半分で消す
	DelWazaEffect(xreg);
}


//----------------------------------------------------------
//	フェードインしてくるメロメロ用の背景
//	offset	なし
//----------------------------------------------------------
#define MERO_HAIKEI_CHGWAIT		3	//背景ﾌｪｰﾄﾞｲﾝ、ｱｳﾄ時のｳｪｲﾄ
#define MERO_HAIKEI_ENDWAIT		140	//背景ﾌｪｰﾄﾞｱｳﾄするまでのｳｪｲﾄ
void MeromeroHaikeiTask(u8 id)
{
	WazaBgData wazabg;
	
	*(vu16*)REG_BLDCNT = BLD_A_BLEND_MODE | BLD_2ND_ALL | BLD_BG1_1ST;
	*(vu16*)REG_BLDALPHA = 16 << 8;

	(*(vBgCnt *)REG_BG1CNT).Priority = 3;
	(*(vBgCnt *)REG_BG1CNT).Size = 0;
	
	if(ContestCheck() == 0)//ｴﾌｪｸﾄの間だけｷｬﾗｸﾀﾍﾞｰｽを変更(ｽｸﾘｰﾝﾃﾞｰﾀの関係で)
		(*(vBgCnt *)REG_BG1CNT).CharBasep = 1;
	ScrX1 = 0;
	ScrY1 = 0;
	*(vu16 *)REG_BG1HOFS = ScrX1;
	*(vu16 *)REG_BG1VOFS = ScrY1;
	GetWazaEffBgAdrs(&wazabg);
	DIV_DMACLEAR(3, 0, wazabg.ScrnAdrs, 0x1000, 32);
	DecordVram((void*)s_meromro_psc_ADRS, wazabg.ScrnAdrs);
	DecordVram((void*)s_meromero_pch_ADRS, wazabg.CharAdrs);
	DecordPaletteWork((void*)s_meromero_pcl_ADRS, wazabg.PlttNo*16, 0x20);
	if(ContestCheck())
		ScrnPalRewrite(wazabg.PlttNo, (u32)wazabg.ScrnAdrs, 0, 0);

	TaskTable[id].TaskAdrs = MeromeroHaikeiMain;
}

static void MeromeroHaikeiMain(u8 id)
{
	WazaBgData wazabg;

	switch(TaskTable[id].work[12])
	{
		case 0:
			if(TaskTable[id].work[10]++ == MERO_HAIKEI_CHGWAIT){
				TaskTable[id].work[10] = 0;
				
				TaskTable[id].work[11]++;
				*(vu16*)REG_BLDALPHA = 
					(16-TaskTable[id].work[11])<<8 | TaskTable[id].work[11];
				if(TaskTable[id].work[11] == 16){
					TaskTable[id].work[12]++;
					TaskTable[id].work[11] = 0;
				}
			}
			break;
		case 1:
			if(TaskTable[id].work[11]++ == MERO_HAIKEI_ENDWAIT){
				TaskTable[id].work[11] = 16;
				TaskTable[id].work[12]++;
			}
			break;
		case 2:
			if(TaskTable[id].work[10]++ == MERO_HAIKEI_CHGWAIT){
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
		case 3:
			GetWazaEffBgAdrs(&wazabg);
			DIV_DMACLEAR(3, 0, wazabg.CharAdrs, 0x2000, 32);
			DIV_DMACLEAR(3, 0, wazabg.ScrnAdrs, 0x800, 32);
			if(ContestCheck() == 0)
				(*(vBgCnt *)REG_BG1CNT).CharBasep = 0;
			TaskTable[id].work[12]++;
		case 4:
			*(vu16*)REG_BLDCNT = 0;
			*(vu16*)REG_BLDALPHA = 0;
			(*(vBgCnt *)REG_BG1CNT).Priority = EFF_BG1_PRI;
			DelTaskEffect(id);
			break;
	}
}


//----------------------------------------------------------
//	フェードインしてくるこわいかおの背景
//
//	半透明の優先度がゲージと会話ウインドウの下・ポケモンと背景の上
//	offset	なし
//----------------------------------------------------------
static void KowaikaoHaikeiMain(u8 id);
void KowaikaoHaikeiTask(u8 id)
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
	if(ContestCheck()){
		DecordVram((void*)skowakao3_psc_ADRS, wazabg.ScrnAdrs);
	}else{
		if(MineEnemyCheck(DefenceNo)==SIDE_ENEMY){
			DecordVram((void*)skowakao1_psc_ADRS, wazabg.ScrnAdrs);
		}else{
			DecordVram((void*)skowakao2_psc_ADRS, wazabg.ScrnAdrs);
		}
	}
	DecordVram((void*)s_kowakao_pch_ADRS, wazabg.CharAdrs);
	DecordPaletteWork((void*)s_kowakao_pcl_ADRS, wazabg.PlttNo*16, 0x20);
	if(ContestCheck())
		ScrnPalRewrite(wazabg.PlttNo, (u32)wazabg.ScrnAdrs, 0, 0);

	TaskTable[id].TaskAdrs = KowaikaoHaikeiMain;
}


#define KOWAIKAO_HAIKEI_CHGWAIT	1
#define KOWAIKAO_HAIKEI_ENDWAIT	20

static void KowaikaoHaikeiMain(u8 id)
{
	WazaBgData wazabg;

	switch(TaskTable[id].work[12])
	{
		case 0:
			if(TaskTable[id].work[10]++ == KOWAIKAO_HAIKEI_CHGWAIT){
				TaskTable[id].work[10] = 0;
				
				TaskTable[id].work[11]++;
				*(vu16*)REG_BLDALPHA = 
					(16-TaskTable[id].work[11])<<8 | TaskTable[id].work[11];
				if(TaskTable[id].work[11] == 14){
					TaskTable[id].work[12]++;
					TaskTable[id].work[11] = 0;
				}
			}
			break;
		case 1:

			if(TaskTable[id].work[11]++ == KOWAIKAO_HAIKEI_ENDWAIT){
				TaskTable[id].work[11] = 14;
				TaskTable[id].work[12]++;
			}
			break;
		case 2:
			if(TaskTable[id].work[10]++ == KOWAIKAO_HAIKEI_CHGWAIT){
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
		case 3:
			GetWazaEffBgAdrs(&wazabg);
			DIV_DMACLEAR(3, 0, wazabg.CharAdrs, 0x2000, 32);
			DIV_DMACLEAR(3, 0, wazabg.ScrnAdrs, 0x800, 32);
			if(ContestCheck() == 0)
				(*(vBgCnt *)REG_BG1CNT).CharBasep = 0;
			TaskTable[id].work[12]++;
		case 4:
			*(vu16*)REG_BLDCNT = 0;
			*(vu16*)REG_BLDALPHA = 0;
			(*(vBgCnt *)REG_BG1CNT).Priority = EFF_BG1_PRI;
			DelTaskEffect(id);
			break;
	}
}



















//=========================================================================
//
//		めざめるパワー
//												by matsuda 2002.06.03(月)
//=========================================================================
static void MezameruInit(actWork *xreg);
static void MezameruOpen(actWork *xreg);
static void MezameruOpenMove(actWork *xreg);
static void MezameruOpenMoveMain(actWork *xreg);
static void MezameruOpenMove2(actWork *xreg);	//add_02.08.27_iwasawa
static const actAffAnm MezameruAff0[] = {
//	{ 拡縮x, 拡縮y, 角度, ｳｪｲﾄ }
	{0x80, 0x80, 0, ACT_AFSET},
	{0x8,0x8,0,1},
	{ACT_AFLOOP,1,0,0},
};
static const	actAffAnm * const MezameruAffTbl[] = {
	MezameruAff0,
};
const	actHeader MezameruHeader={
	WAZACHR_ID_POWER,
	WAZACHR_ID_POWER,
	&WazaOamDataAffine[1],
	DummyActAnmTbl,
	0,
	MezameruAffTbl,
	MezameruInit,
};

//-- 画面外へ飛び散る --//
const	actHeader Mezameru2Header={
	WAZACHR_ID_POWER,
	WAZACHR_ID_POWER,
	&WazaOamDataAffine2[1],
	DummyActAnmTbl,
	0,
	MezameruAffTbl,
	MezameruOpenMove,
};

//-- 「はきだす」 --//	←指定した角度へ、指定したSync移動する
static const actAffAnm HakidasuAff0[] = {
//	{ 拡縮x, 拡縮y, 角度, ｳｪｲﾄ }
	{0x80, 0x80, 0, ACT_AFSET},
	{0x8,0x8,0,1},
	{ACT_AFLOOP,1,0,0},
};
static const	actAffAnm * const HakidasuAffTbl[] = {
	HakidasuAff0,
};
const	actHeader HakidasuHeader={
	WAZACHR_ID_HAKIDASU,
	WAZACHR_ID_HAKIDASU,
	&WazaOamDataAffine2[0],
	DummyActAnmTbl,
	0,
	HakidasuAffTbl,
	MezameruOpenMove2,
};

//----------------------------------------------------------
//	0:SyncNum	1:初期角度
//	WazaEffWork[7]に0xffffが入ってきたら終了
//----------------------------------------------------------
#define MEZAMERU_ADD_X		0x0400
#define MEZAMERU_ADD_Y		0x0100
#define MEZAMERU_ADDSEC		9
static void MezameruInit(actWork *xreg)
{
	xreg->x = GetWazaEffPos(AttackNo, PM_X);
	xreg->y = GetWazaEffPos(AttackNo, PM_Y);
	
	xreg->aff_pause = 1;
	
	xreg->work[0] = WazaEffWork[0];
	xreg->work[1] = WazaEffWork[1];

	// taya 02/08/28
	xreg->work[7] = GetPokeSoftPri(AttackNo);

	xreg->move = MezameruOpen;
	xreg->move(xreg);
}

static void MezameruOpen(actWork *xreg)
{
	// taya 02/08/28
	if(xreg->work[1] >= 64 && xreg->work[1] < 192){
		xreg->pri = xreg->work[7]+1;
	}else{
		xreg->pri = xreg->work[7]-1;
	}

	xreg->dx = SinMove(xreg->work[1], xreg->work[2]>>8);
	xreg->dy = CosMove(xreg->work[1], xreg->work[3]>>8);
	xreg->work[1] = 0xff & (xreg->work[1] + MEZAMERU_ADDSEC);
	
	if(xreg->work[5] == 0){
		xreg->work[2] += MEZAMERU_ADD_X;
		xreg->work[3] += MEZAMERU_ADD_Y;
		if(++xreg->work[4] == xreg->work[0]){
			xreg->work[4] = 0;
			xreg->work[5] = 1;
		}
	}
	else if(xreg->work[5] == 1){
		xreg->work[2] -= MEZAMERU_ADD_X;
		xreg->work[3] -= MEZAMERU_ADD_Y;
		if(++xreg->work[4] == xreg->work[0]){
			xreg->work[5] = 2;
			return;
		}
	}

	if((u16)WazaEffWork[7] == 0xffff)
		DelWazaEffect(xreg);
}

//----------------------------------------------------------
//	0:飛び散る方向(角度)
//----------------------------------------------------------
#define MEZAMERU_SPX		10
#define MEZAMERU_SPY		7
static void MezameruOpenMove(actWork *xreg)
{
	xreg->x = GetWazaEffPos(AttackNo, PM_X);
	xreg->y = GetWazaEffPos(AttackNo, PM_Y);
	xreg->work[0] = SinMove(WazaEffWork[0], MEZAMERU_SPX);
	xreg->work[1] = CosMove(WazaEffWork[0], MEZAMERU_SPY);
	xreg->move = MezameruOpenMoveMain;
}

static void MezameruOpenMoveMain(actWork *xreg)
{
	xreg->dx += xreg->work[0];
	xreg->dy += xreg->work[1];
	if(xreg->x+xreg->dx > 256 || xreg->x+xreg->dx < -16 || 
			xreg->y+xreg->dy > 160 || xreg->y+xreg->dy < -16)
		DelWazaEffect(xreg);
}
//---------------------------------------------------
//	指定した角度へ、指定したSync、移動しつづける
//
//	0:飛び散る方向(角度),1:移動しつづけるSync
//
//					02.08.27_add_iwasawa_for_Hakidasu
//---------------------------------------------------
static void MezameruOpenMove2Main(actWork *xreg)
{
	xreg->dx += xreg->work[0];
	xreg->dy += xreg->work[1];
	if(xreg->work[3]++ < xreg->work[2]) return;
	
	DelWazaEffect(xreg);
}
static void MezameruOpenMove2(actWork *xreg)
{
	xreg->x = GetWazaEffPos(AttackNo, PM_X);
	xreg->y = GetWazaEffPos(AttackNo, PM_Y);
	xreg->work[0] = SinMove(WazaEffWork[0], MEZAMERU_SPX);
	xreg->work[1] = CosMove(WazaEffWork[0], MEZAMERU_SPY);
	xreg->work[2] = WazaEffWork[1];
	xreg->move = MezameruOpenMove2Main;	
}
//=========================================================================
//
//		こわいかお
//												by mori 2002.06.03(金)
//=========================================================================

//-----------------きらりアクター-----------------------
static const actAnm KirariAnm[] = 
{
	{OBJ16_16x16 * 0, 4, 0, 0},
	{OBJ16_16x16 * 1, 4, 0, 0},
	{OBJ16_16x16 * 2, 4, 0, 0},
	{OBJ16_16x16 * 1, 4, 0, 0},
	{OBJ16_16x16 * 0, 4, 0, 0},
	{ACT_ANMEND, 0, 0, 0},
};
static const actAnm * const KirariAnmTbl[] = {
	KirariAnm,
};
static void KirariInit_actmove(actWork *act);

const actHeader KirariActHeader={
	WAZACHR_ID_KIRARI,
	WAZACHR_ID_KIRARI,
	&WazaOamDataNormal[1],		//16x16
	KirariAnmTbl,
	0,
	DummyActAffTbl,
	KirariInit_actmove,
};

static void Kirari_actmove(actWork *act)
{
	
	if(act->anmend_sw){
		DelWazaEffect(act);
	}
}


static void KirariInit_actmove(actWork *act)
{
	
//	act->dx = WazaEffWork[0];
//	act->dy = WazaEffWork[1];

	WazaDefaultPosSet2(act,PM_MODE);

	act->move = Kirari_actmove;
}






//=========================================================================
//
//		天使のキッス
//												by mori 2002.06.03(金)
//=========================================================================

//-----------------天使アクター-----------------------
static const actAnm AngelAnm[] = 
{
	{OBJ16_32x32 * 0, 24, 0, 0},
	{ACT_ANMEND, 0, 0, 0},
};
static const actAnm * const AngelAnmTbl[] = {
	AngelAnm,
};
static void Angel_actmove(actWork *act);

const actHeader ActAngelHeader={
	WAZACHR_ID_ANGEL,
	WAZACHR_ID_ANGEL,
	&WazaOamDataNormal[2],		//16x16
	AngelAnmTbl,
	0,
	DummyActAffTbl,
	Angel_actmove,
};

static void Angel_actmove(actWork *act)
{
	u16 work;
	if(act->work[0]==0){
		act->x = act->x + WazaEffWork[0];
		act->y = act->y + WazaEffWork[1];
	}		

	act->work[0]++;
	work = (act->work[0]*10)&0xff;
	act->dx = SinMove(work,80)>>8;
	if(act->work[0]<80){
		act->dy = (act->work[0]/2)+(CosMove(work,80)>>8);
	}
	if(act->work[0]>90){
		act->work[2]++;
		act->dx -= act->work[2]/2;
	}
	if(act->work[0]>100){
		DelWazaEffect(act);
	}
}







//----------------------------------------------------------
//	はじけてへなへなと落ちるハート
//	0:移動速度(固定少数)	1:振り幅Y
//----------------------------------------------------------
#define HENAHEART_ADDSEC	3

static void HenaHeart(actWork *xreg)
{
	xreg->work[5]++;
	xreg->dx = SinMove(xreg->work[3], 5);
	xreg->dy = xreg->work[5]/2;
	xreg->work[3] = 0xff & (xreg->work[3] + HENAHEART_ADDSEC);

	if(xreg->work[5] > 20){
		xreg->banish = xreg->work[5]%2;
	}
	
	if(xreg->work[5] > 30)
		DelWazaEffect(xreg);
	
}

static void HenaHeartInit(actWork *xreg)
{
	if(xreg->work[0] == 0){
		xreg->work[1] = WazaEffWork[0];
		xreg->work[2] = WazaEffWork[1];
		xreg->work[0]++;
		return;
	}
	
	xreg->work[4] += xreg->work[1];
	xreg->dx = xreg->work[4] >> 8;
	xreg->dy = SinMove(xreg->work[3], xreg->work[2]);
	xreg->work[3] = 0xff & (xreg->work[3] + HENAHEART_ADDSEC);
	if(xreg->work[3]>70){
		xreg->move = HenaHeart;
		xreg->x = xreg->x + xreg->dx;
		xreg->y = xreg->y + xreg->dy;
		xreg->dx = 0;
		xreg->dy = 0;
		xreg->work[3] = pp_rand()%180;
	}
}


//=========================================================================
//
//		悪魔のキッス
//												by mori 2002.06.03(金)
//=========================================================================
//-- はじける黒いハート (悪魔のキッスにて使用)--
const	actHeader DevilHeartHeader={
	WAZACHR_ID_HEART1,
	WAZACHR_ID_HEART1,
	&WazaOamDataNormal[1],
	DummyActAnmTbl,
	0,
	DummyActAffTbl,
	HenaHeartInit,
};



//-----------------悪魔アクター-----------------------
static const actAnm AkumaAnm1[] = 
{
	{OBJ16_32x32 * 0, 3, 0, 0},
	{ACT_ANMLOOP, 0, 0, 0},
};
static const actAnm AkumaAnm2[] = 
{
	{OBJ16_32x32 * 1, 3, 0, 0},
	{ACT_ANMLOOP, 0, 0, 0},
};

static const actAnm * const AkumaAnmTbl[] = {
	AkumaAnm1,
	AkumaAnm2,
};
static void Akuma_actmove(actWork *act);

const actHeader ActAkumaHeader={
	WAZACHR_ID_DEVIL,
	WAZACHR_ID_DEVIL,
	&WazaOamDataNormal[2],		//16x16
	AkumaAnmTbl,
	0,
	DummyActAffTbl,
	Akuma_actmove,
};

static void Akuma_actmove(actWork *act)
{
	if(act->work[3]==0){
		act->x = act->x + WazaEffWork[0];
		act->y = act->y + WazaEffWork[1];
		ActAnmChg(act,0);
		act->pri = GetPokeSoftPri(DefenceNo) - 1;
		act->work[2] = 1;
	}
	act->work[0] +=act->work[2];
	act->work[1] = act->work[0]*4%256;
	if(act->work[1]<0) act->work[1] = 0;
//	act->dx = CosMove(work,30-act->work[0]*2);
//	act->dy = SinMove(work,25-act->work[0]/2);
	act->dx = CosMove(act->work[1],30-act->work[0]/4);
	act->dy = SinMove(act->work[1],10-act->work[0]/8);

	if(act->work[1]>128 && act->work[2] > 0){
		act->work[2] =-1;
	}
	if(act->work[1]==0 && act->work[2] < 0){
		act->work[2] = 1;
	}

	act->work[3]++;
	if(act->work[3]<10 || act->work[3]>80){
		act->banish = act->work[0]%2;
	}else{
		act->banish = 0;
	}

	if(act->work[3]>90){
		DelWazaEffect(act);
	}
}

















//=========================================================================
//
//		みだれひっかき
//												by matsuda 2002.06.03(月)
//=========================================================================
static void MidareHikkakiInit(actWork *xreg);

#define HIKKAKI_ANMWAIT		4
static const actAnm HikkakiAnm0[]={
	{OBJ16_32x32*0,HIKKAKI_ANMWAIT,0,0},
	{OBJ16_32x32*1,HIKKAKI_ANMWAIT,0,0},
	{OBJ16_32x32*2,HIKKAKI_ANMWAIT,0,0},
	{OBJ16_32x32*3,HIKKAKI_ANMWAIT,0,0},
	{ACT_ANMEND,0,0,0}
};
static const actAnm HikkakiAnm1[]={
	{OBJ16_32x32*0,HIKKAKI_ANMWAIT,1,0},
	{OBJ16_32x32*1,HIKKAKI_ANMWAIT,1,0},
	{OBJ16_32x32*2,HIKKAKI_ANMWAIT,1,0},
	{OBJ16_32x32*3,HIKKAKI_ANMWAIT,1,0},
	{ACT_ANMEND,0,0,0}
};
static const actAnm *const HikkakiAnmTbl[]={
	HikkakiAnm0,
	HikkakiAnm1,
};
const	actHeader HikkakiHeader={
	WAZACHR_ID_HIKKAKI,
	WAZACHR_ID_HIKKAKI,
	&WazaOamDataNormal[2],
	HikkakiAnmTbl,
	0,
	DummyActAffTbl,
	MidareHikkakiInit,
};

//----------------------------------------------------------
//	offset	0:Xoffset	1:Yoffset	2:左右どちらのアニメか(0 or 1)
//----------------------------------------------------------
static void MidareHikkakiInit(actWork *xreg)
{
	if(xreg->work[0] == 0){
		xreg->x += WazaEffWork[0];
		xreg->y += WazaEffWork[1];
		ActAnmChg(xreg, WazaEffWork[2]);
		xreg->work[0]++;
	}
	else if(xreg->anmend_sw)
		DelWazaEffect(xreg);
}





//=========================================================================
//
//	わるあがき
//																	TAYA
//=========================================================================
#define AGAKI_ANMWAIT  (8)
static const actAnm AgakiAnm0[] = 
{
	{OBJ16_32x32 * 0, AGAKI_ANMWAIT, 0, 0},
	{OBJ16_32x32 * 1, AGAKI_ANMWAIT, 0, 0},
	{OBJ16_32x32 * 2, AGAKI_ANMWAIT, 0, 0},
	{OBJ16_32x32 * 1, AGAKI_ANMWAIT, 0, 0},
	{ACT_ANMEND, 0, 0, 0},
};
static const actAnm AgakiAnm1[] = 
{
	{OBJ16_32x32 * 1, AGAKI_ANMWAIT, 1, 0},
	{OBJ16_32x32 * 2, AGAKI_ANMWAIT, 1, 0},
	{OBJ16_32x32 * 1, AGAKI_ANMWAIT, 1, 0},
	{OBJ16_32x32 * 0, AGAKI_ANMWAIT, 1, 0},
	{ACT_ANMEND, 0, 0, 0},
};
static const actAnm * const AgakiAnmTbl[] = {
	AgakiAnm0,
	AgakiAnm1,
};

static void AgakiActInit(actWork *act);
static void AgakiActMove(actWork *act);

const actHeader AgakiHeader={
	WAZACHR_ID_AGAKI,
	WAZACHR_ID_AGAKI,
	&WazaOamDataNormal[2],
	AgakiAnmTbl,
	0,
	DummyActAffTbl,
	AgakiActInit,
};

//================================================
//	0:(0:攻撃側  1:防御側)  1:(0:右側  1:左側)
//	2:ﾙｰﾌﾟ回数
//================================================
static void AgakiActInit(actWork *act)
{
	if(WazaEffWork[2] == 0)
	{
		DelWazaEffect(act);
		return;
	}

	if(WazaEffWork[0] == 0){
		act->x = GetWazaEffPos(AttackNo, PM_X);
		act->y = GetWazaEffPos(AttackNo, PM_Y);
	}else{
		act->x = GetWazaEffPos(DefenceNo, PM_X);
		act->y = GetWazaEffPos(DefenceNo, PM_Y);
	}

	// ↓本当はポケモンの大きさによって変えたい
	if(WazaEffWork[1] == 0){
		act->x += 32;
	}else{
		act->x -= 32;
	}

	act->work[0] = WazaEffWork[2];
	act->work[1] = WazaEffWork[1];
	ActAnmChg(act, WazaEffWork[1]);
	act->move = AgakiActMove;
}

static void AgakiActMove(actWork *act)
{
	if(act->anmend_sw)
	{
		if(--(act->work[0])){
			ActAnmChg(act, act->work[1]);
		}else{
			DelWazaEffect(act);
		}
	}
}










//=========================================================================
//
//	さわぐ
//																	TAYA
//=========================================================================
#define SAWAGU_AFF_SYNC  (4)
static const actAffAnm SawaguAffAnm[] = {
	{ -0x0c,  0x08, 0, SAWAGU_AFF_SYNC },
	{  0x14, -0x14, 0, SAWAGU_AFF_SYNC },
	{ -0x08,  0x0c, 0, SAWAGU_AFF_SYNC },
	{ACT_AFEND,0,0,0},					// ﾙｰﾌﾟ , 戻り先
};

static void TaskSawaguMain(u8 id);

//==========================================
//	ポケモン拡縮動作
//	0:(0:攻撃側 1:防御側)
//==========================================
void TaskSawagu(u8 id)
{
	u8 actno = W_GetPokeActNo(WazaEffWork[0]);

	SetPokeKakusyukuAnm(&TaskTable[id], actno, SawaguAffAnm);
	TaskTable[id].TaskAdrs = TaskSawaguMain;
}
static void TaskSawaguMain(u8 id)
{
	if(!PokeKakusyukuAnm(&TaskTable[id]))
	{
		DelTaskEffect(id);
	}
}
//==========================================
//	音符マーク
//	0:(0:攻撃側 1:防御側) 
//	1:XOFS  2:YOFS（XOFSは敵・味方で反転する）
//	3:ｱﾆﾒﾅﾝﾊﾞｰ
//==========================================
static void SawaguOnpuActInit(actWork *act);
static void SawaguOnpuActMove(actWork *act);

const actHeader ActSawaguHeader = {
	WAZACHR_ID_SAWAGU,
	WAZACHR_ID_SAWAGU,
	&WazaOamDataNormal[2],
	DummyActAnmTbl,
	0,
	DummyActAffTbl,
	SawaguOnpuActInit,
};


static void SawaguOnpuActInit(actWork *act)
{
	u8 client;

	client = (WazaEffWork[0] == 0)? AttackNo : DefenceNo;
	if(MineEnemyCheck(client) == SIDE_ENEMY){
		WazaEffWork[1] *= -1;
	}

	act->x = GetWazaEffPos(client, PM_X) + WazaEffWork[1];
	act->y = GetWazaEffPos(client, PM_Y) + WazaEffWork[2];

	act->work[0] = 0;
	act->work[1] = act->x << 3;
	act->work[2] = act->y << 3;
	act->work[3] = (WazaEffWork[1] << 3) / 8;
	act->work[4] = (WazaEffWork[2] << 3) / 8;

	act->oamData.CharNo += (OBJ16_32x32 * WazaEffWork[3]);
	act->move = SawaguOnpuActMove;
}

static void SawaguOnpuActMove(actWork *act)
{
	act->work[1] += act->work[3];
	act->work[2] += act->work[4];
	act->x = (act->work[1] >> 3);
	act->y = (act->work[2] >> 3);
	if(++(act->work[0]) > 16)
	{
		DelWazaEffect(act);
	}
}

//=========================================================================
//
//	ほろびの歌
//												by mori 2002.06.03(月)
//=========================================================================

static void HorobiOnpuInit(actWork *act);
static void HorobiOnpuTochuu(actWork *act);
static void HorobiOnpuMain(actWork *act);
static void HorobiOnpu2Init(actWork *act);


static const actAffAnm HorobiOnpuAff0[] = {
//	{ 拡縮x, 拡縮y, 角度, ｳｪｲﾄ }
	{0,0,0,5,},
	{ACT_AFEND, 0, 0, 0 },
};
static const actAffAnm HorobiOnpuAff1[] = {
//	{ 拡縮x, 拡縮y, 角度, ｳｪｲﾄ }
	{0,0,-8,16,},
	{ACT_AFEND, 1, 0, 0 },
};
static const actAffAnm HorobiOnpuAff2[] = {
//	{ 拡縮x, 拡縮y, 角度, ｳｪｲﾄ }
	{0,0, 8,16,},
	{ACT_AFEND, 1, 0, 0 },
};


static const actAffAnm * const HorobiOnpuAffTbl[] = {
	HorobiOnpuAff0,
	HorobiOnpuAff1,
	HorobiOnpuAff2,
};

const actHeader HorobiOnpuHeader = //音符
{
	WAZACHR_ID_ONPU2,
	WAZACHR_ID_ONPU2,
	&WazaOamDataAffine[1],
	UtauAnmTbl,
	ACT_NTRANS,
	HorobiOnpuAffTbl,
	HorobiOnpuInit,
};

const actHeader HorobiOnpu2Header = //音符
{
	WAZACHR_ID_ONPU2,
	WAZACHR_ID_ONPU2,
	&WazaOamDataAffine[1],
	UtauAnmTbl,
	ACT_NTRANS,
	HorobiOnpuAffTbl,
	HorobiOnpu2Init,
};


//----------------------------------------------------------
//  アクターシーケンス
//----------------------------------------------------------
static void HorobiOnpu2Init(actWork *act)
{
	u8 work;
	if(act->work[0]==0){
		act->work[1] = 120-WazaEffWork[0];
		act->banish  = 1;
	}
	act->work[0]++;
	if(act->work[0] == act->work[1]){
		work = act->oamData.Pltt;
		W_ColorMonotone(work+16, 0);	//音符灰色に
	}
	if(act->work[0]==act->work[1]+80){
		DelWazaEffect(act);
	}
}


//----------------------------------------------------------
//	[0] = 音符が落ちるまでのＶＳｙｎｃ数
//----------------------------------------------------------
static void HorobiOnpuInit(actWork *act)
{
	u16 w;

	if(act->work[0]==0){
		act->x = 120;
		act->y = -15 + WazaEffWork[0]/2;
		ActAnmChg(act,WazaEffWork[1]);
		act->work[5] = 120;
		act->work[3] = WazaEffWork[2];
//		act->work[6] = act->work[3];
	}
	act->work[0]++;
	act->work[1] = act->work[0]/2;
	
	w = (act->work[0]*3+act->work[3])&0xff;
	act->work[6] += 10;
	act->work[6] &= 0xff;

	act->dx = CosMove(w,100);
	act->dy = act->work[1]+SinMove(w,10)+CosMove(act->work[6],4);
	
	if(act->work[0] > act->work[5]){
		act->move = HorobiOnpuTochuu;
		act->work[0] = 0;
		DxDyAddClear(act);
		act->work[2] = 5;
		act->work[4] = 0;
		act->work[3] = 0;
		ActAffAnmChg(act,	1);
	}
}
static void HorobiOnpuTochuu(actWork *act)
{
	if(++act->work[0]>10){
		act->work[0] = 0;
		act->move = HorobiOnpuMain;
	}
}

static void HorobiOnpuMain(actWork *act)
{
	act->work[3] += act->work[2];
	act->dy = act->work[3];
	act->work[2] ++;
	
	if(act->work[3]>48 && act->work[2]>0){
		act->work[2] = -5 + act->work[4];
//		act->banish = act->work[2]%2;
		act->work[4]++;
	}
	
	if(act->work[4]>3){
		act->banish = act->work[2]%2;
		DelWazaEffect(act);
	}
	if(act->work[4]==4){
		DelWazaEffect(act);
	}
}
















//=========================================================================
//
//		しんぴのまもり
//												by matsuda 2002.07.05(金)
//=========================================================================
static void SinpiInit(actWork *xreg);
static const actAffAnm sinpi_aff_anm0[] = {
//	{ 拡縮x, 拡縮y, 角度, ｳｪｲﾄ }
	{ 0x100, 0x100, 0, ACT_AFSET },		// 0 
	{ACT_AFEND,0,0,0},					// ﾙｰﾌﾟ , 戻り先
};
static const actAffAnm sinpi_aff_anm1[] = {
//	{ 拡縮x, 拡縮y, 角度, ｳｪｲﾄ }
	{ 0x200, 0x100, 0, ACT_AFSET },		// x*2 
	{ACT_AFEND,0,0,0},					// ﾙｰﾌﾟ , 戻り先
};
static const	actAffAnm * const sinpi_aff_tbl[] = {
	sinpi_aff_anm0,
	sinpi_aff_anm1,
};
const	actHeader SinpiHeader={
	WAZACHR_ID_MAMORI,
	WAZACHR_ID_MAMORI,
	&WazaOamDataBldAffine2[7],
	DummyActAnmTbl,
	0,
	sinpi_aff_tbl,
	SinpiInit,
};

//----------------------------------------------------------
//	offset	なし
//----------------------------------------------------------
#define SINPI_MOVE_SYNC		13
static void SinpiInit(actWork *xreg)
{
#if M2P_DISPCHK	
	if((FightType & FIGHT_TYPE_2vs2) && PokeBG2taimeCheck(AttackNo^2)){
#else
	if((FightType & FIGHT_TYPE_2vs2) && ClientPokeExistCheck(AttackNo^2)){
#endif		
		GetCenterEffPos(AttackNo,EFF_MODE,&(xreg->x),&(xreg->y));
		xreg->y += 40;
		ActAffAnmChg(xreg,1);
	}else{
		xreg->x = GetWazaEffPos(AttackNo, EFF_X);
		xreg->y = GetWazaEffPos(AttackNo, EFF_Y) + 40;
	}
	xreg->work[0] = SINPI_MOVE_SYNC;
	xreg->work[2] = xreg->x;
	xreg->work[4] = xreg->y - 72;
	xreg->move = W_StraightSyncMove;
	SetWorkSeq(xreg, DelWazaEffect);
}








//=========================================================================
//
//		れんぞくぎり
//												by matsuda 2002.09.13(金)
//=========================================================================
//----------------------------------------------------------
//	連続切りｶｳﾝﾄが偶数か奇数かチェック
//	WazaEffWork[7]に結果を代入(0:偶数、1:奇数)
//----------------------------------------------------------
void RenzokugiriGuusuuKisuuCheck(u8 id)
{
	WazaEffWork[7] = pwkc->renzokugiricnt & 1;
	DelTaskEffect(id);
}

//----------------------------------------------------------
//	連続切りｶｳﾝﾄをWazaEffWork[7]に代入する
//----------------------------------------------------------
void GetRenzokugiriCunt(u8 id)
{
	WazaEffWork[7] = pwkc->renzokugiricnt;
	DelTaskEffect(id);
}

