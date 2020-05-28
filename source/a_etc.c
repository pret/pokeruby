//=========================================================================
//	
//	その他系 技エフェクト	※ツールとか汎用的な動き部分とか・・・かな？
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
#include "task.h"
#include "palanm.h"
#include "client.h"
#include "fight.h"
#include "ef_tool.h"
#include "poketool.h"
#include "decord.h"
#include "cli_def.h"
#include "contest.h"
#include "mus_tool.h"




//=========================================================================
//
//		「ひよこ」
//														by matsuda
//=========================================================================
//----------------------------------------------------------
//	プロトタイプ宣言
//----------------------------------------------------------
static void SeqWazaHiyokoInit(actWork *Xreg);
static void SeqWazaHiyokoMain(actWork *Xreg);

//----------------------------------------------------------
//	定数宣言
//----------------------------------------------------------
#define HIYOKO_FURIHABA_DX	30
#define HIYOKO_FURIHABA_DY	10
#define HIYOKO_ANM			8

//----------------------------------------------------------
//	アクターテーブル
//----------------------------------------------------------
//----------------------------------------------------------
//	ピヨリ
//----------------------------------------------------------
static const actAnm HiyokoAnm1[]={
	{OBJ16_16x16 * 0, HIYOKO_ANM, 0, 0},
	{OBJ16_16x16 * 1, HIYOKO_ANM, 0, 0},
	{OBJ16_16x16 * 0, HIYOKO_ANM, 1, 0},
	{OBJ16_16x16 * 2, HIYOKO_ANM, 0, 0},
	{ACT_ANMLOOP, 0, 0, 0},
};
static const actAnm HiyokoAnm2[]={
	{OBJ16_16x16 * 0, HIYOKO_ANM, 1, 0},
	{OBJ16_16x16 * 1, HIYOKO_ANM, 0, 0},
	{OBJ16_16x16 * 0, HIYOKO_ANM, 0, 0},
	{OBJ16_16x16 * 2, HIYOKO_ANM, 0, 0},
	{ACT_ANMLOOP, 0, 0, 0},};

static const actAnm *const HiyokoAnmTbl[]={
	HiyokoAnm1,
	HiyokoAnm2,
};

const	actHeader ActHiyokoHeader={
	WAZACHR_ID_HIYOKO,
	WAZACHR_ID_HIYOKO,
	&WazaOamDataNormal[1],
	HiyokoAnmTbl,
	0,
	DummyActAffTbl,
	SeqWazaHiyokoInit,
};

//-------------------------------------------------------------
//		アクターシーケンス
//-------------------------------------------------------------
//=========================================================================
//	ﾋﾖｺ
//=========================================================================
//-------------------------------------------------------------
// offset 0:Xoffset 1:Yoffset 2:秒offset 3:回転ｽﾋﾟｰﾄﾞ 4:ﾙｰﾌﾟ回数
//-------------------------------------------------------------
static void SeqWazaHiyokoInit(actWork *Xreg)
{
	Xreg->x += WazaEffWork[0];
	Xreg->y += WazaEffWork[1];
	Xreg->work[0] = WazaEffWork[2];	//秒
	if(MineEnemyCheck(AttackNo))
	{
		Xreg->work[1] = -WazaEffWork[3];
		Xreg->work[4] = 1;
	}
	else
	{
		Xreg->work[1] = WazaEffWork[3];
		Xreg->work[4] = 0;
		ActAnmChg(Xreg, 1);
	}
	Xreg->work[3] = WazaEffWork[4];
	Xreg->move=SeqWazaHiyokoMain;
	SeqWazaHiyokoMain(Xreg);
}

static void SeqWazaHiyokoMain(actWork *Xreg)
{
	Xreg->dx = CosMove(Xreg->work[0], HIYOKO_FURIHABA_DX);
	Xreg->dy = SinMove(Xreg->work[0], HIYOKO_FURIHABA_DY);
	
	if(Xreg->work[0] >= 0 && Xreg->work[0] < 128)
		Xreg->oamData.Priority = 1;
	else
		Xreg->oamData.Priority = 3;
	Xreg->work[0] = 0xff & (Xreg->work[0] + Xreg->work[1]);
	
	Xreg->work[2]++;
	if(Xreg->work[2] == Xreg->work[3])
		DelWazaEffect(Xreg);
}





//=========================================================================
//
//		「カラー加減算系」
//														by matsuda
//=========================================================================
//----------------------------------------------------------
//	プロトタイプ宣言
//----------------------------------------------------------
static void WazaSeqColorWait(actWork *Xreg);
static void WazaSeqColorInit(actWork *Xreg);
static u32 WazaSeqColorInitSub(s16);
static void WazaSeqFlashWait(actWork *Xreg);
static void WazaSeqFlashEnd(actWork *Xreg);
static void WazaSeqColorFlashInit(actWork *Xreg);

static void SeqWazaKiraFlashInit(actWork *Xreg);

void WazaTaskColorFade(u8 taskno);
static void WazaTaskColorFadeWait(u8 taskno);
static void WazaTaskColorFadeMain(u8 taskno, u8 start_evy, u8 end_evy);

static void WazaTaskFlashEnd(u8 id);
static void WazaTaskFlashWait(u8 id);

static void WazaChrFadeRepeatMain(u8 taskno, u8 start_evy, u8 end_evy);
static void WazaChrColorFadeRepeatWait(u8 taskno);


//----------------------------------------------------------
//	定数宣言
//----------------------------------------------------------
#define FLASH_KIRA_WAIT		3

//----------------------------------------------------------
//	アクターテーブル
//----------------------------------------------------------
const	actHeader ActFadeHeader={	//ﾌｪｰﾄﾞ
	0,
	0,
	&DummyActOam,
	DummyActAnmTbl,
	0,
	DummyActAffTbl,
	WazaSeqColorInit,
};
const	actHeader ActFlashHeader={	//ﾌﾗｯｼｭ
	0,
	0,
	&DummyActOam,
	DummyActAnmTbl,
	0,
	DummyActAffTbl,
	WazaSeqColorFlashInit,
};


static const actAnm FlashKiraAnm[]={
	{OBJ16_32x32 * 0, FLASH_KIRA_WAIT, 0, 0},
	{OBJ16_32x32 * 1, FLASH_KIRA_WAIT, 0, 0},
	{OBJ16_32x32 * 2, FLASH_KIRA_WAIT, 0, 0},
	{OBJ16_32x32 * 3, FLASH_KIRA_WAIT, 0, 0},
	{OBJ16_32x32 * 4, FLASH_KIRA_WAIT, 0, 0},
	{ACT_ANMLOOP, 0, 0, 0},
};
static const actAnm *const FlashKiraAnmTbl[]={
		FlashKiraAnm,
};
const	actHeader ActKiraFlashHeader={
	WAZACHR_ID_L_HIKARI,
	WAZACHR_ID_L_HIKARI,
	&WazaOamDataNormal[2],
	FlashKiraAnmTbl,
	0,
	DummyActAffTbl,
	SeqWazaKiraFlashInit,
};


//-------------------------------------------------------------
//		アクターシーケンス
//-------------------------------------------------------------
//----------------------------------------------------------
//	ﾌｪｰﾄﾞﾘｸｴｽﾄ
// offset 0:ﾌｪｰﾄﾞ対象 0bit=背景(土地含む) 1bit=攻撃側ﾎﾟｹﾓﾝ 2bit=防御側ﾎﾟｹﾓﾝ
//					  3bit=攻撃側ﾎﾟｹﾓﾝ相方  4bit=防御側ﾎﾟｹﾓﾝ相方
//					  5bit=ｴﾌｪｸﾄBG1  6bit=ｴﾌｪｸﾄBG2
// 1..:後はPaletteFadeReqのfade_bit以外の引数を順々に指定(wait以降)
//	u8 wait, u8 start_evy, u8 end_evy, u16 next_rgb
//----------------------------------------------------------
static void WazaSeqColorInit(actWork *Xreg)
{
	u32 fade_bit = 0;
	
	fade_bit = WazaSeqColorInitSub(WazaEffWork[0]);
	PaletteFadeReq(fade_bit, WazaEffWork[1],
				WazaEffWork[2], WazaEffWork[3], WazaEffWork[4]);

	Xreg->banish = 1;
	Xreg->move = WazaSeqColorWait;
}

static u32 WazaSeqColorInitSub(s16 fade_flg)
{
	u32 fade_bit = 0;

	u8 haikei,atpoke,depoke,atpoke2,depoke2,eff1,eff2;
	
	haikei = fade_flg&1;
	atpoke = (fade_flg>>1)&1;
	depoke = (fade_flg>>2)&1;
	atpoke2 = (fade_flg>>3)&1;
	depoke2 = (fade_flg>>4)&1;
	eff1 = (fade_flg>>5)&1;
	eff2 = (fade_flg>>6)&1;
	fade_bit = GetBattleFadeBit(haikei,atpoke,depoke,atpoke2,depoke2,eff1,eff2);

	return fade_bit;
}

//----------------------------------------------------------
//	ﾌｪｰﾄﾞが終了するまでWAIT
//----------------------------------------------------------
static void WazaSeqColorWait(actWork *Xreg)
{
	if(FadeData.fade_sw == 0)
		DelWazaEffect(Xreg);
}

//=========================================================================
//	
//=========================================================================
//----------------------------------------------------------
//	ﾌﾗｯｼｭﾘｸｴｽﾄ(2色のｶﾗｰと濃度を指定して、その2色でﾁｶﾁｶさせる)
// offset 0:ﾌｪｰﾄﾞ対象 0bit=背景 1bit=攻撃側ﾎﾟｹﾓﾝ 2bit=攻撃対象ﾎﾟｹﾓﾝ
//					  3bit=攻撃側ﾎﾟｹﾓﾝ相方  4bit=防御側ﾎﾟｹﾓﾝ相方
//					  5bit=ｴﾌｪｸﾄBG1  6bit=ｴﾌｪｸﾄBG2
// 1:wait(ﾌﾗｯｼｭする間隔 ※MAX255)  2:繰り返し回数
// 3:color1 4:color1のevy 5:color2 6:color2のevy
//----------------------------------------------------------
static void WazaSeqColorFlashInit(actWork *Xreg)
{
	u32 fade_bit = 0;
	
	Xreg->work[0] = WazaEffWork[1];
	Xreg->work[1] = WazaEffWork[1];		//BackUp  上位8ﾋﾞｯﾄをﾌﾗｸﾞで使用
	Xreg->work[2] = WazaEffWork[2];
	Xreg->work[3] = WazaEffWork[3];
	Xreg->work[4] = WazaEffWork[4];
	Xreg->work[5] = WazaEffWork[5];
	Xreg->work[6] = WazaEffWork[6];
	Xreg->work[7] = WazaEffWork[0];
	
	fade_bit = WazaSeqColorInitSub(Xreg->work[7]);
//	PaletteFadeReq(fade_bit, 0,	Xreg->work[4], Xreg->work[4], Xreg->work[3]);
	ColorConceChange(fade_bit, WazaEffWork[4], WazaEffWork[3]);

	Xreg->banish = 1;
	Xreg->move = WazaSeqFlashWait;
}

//----------------------------------------------------------
//	ﾙｰﾌﾟ処理
//----------------------------------------------------------
static void WazaSeqFlashWait(actWork *Xreg)
{
	u32 fade_bit = 0;
	
	if(Xreg->work[0] > 0)
		Xreg->work[0]--;
	else if(FadeData.fade_sw)
		return;
	else
	{
		if(Xreg->work[2] == 0)
		{
			Xreg->move = WazaSeqFlashEnd;
			return;
		}
		
		fade_bit = WazaSeqColorInitSub(Xreg->work[7]);
		if(Xreg->work[1] & 0x100)
//			PaletteFadeReq(fade_bit, 0,	Xreg->work[4], Xreg->work[4], Xreg->work[3]);
			ColorConceChange(fade_bit, Xreg->work[4], Xreg->work[3]);
		else
//			PaletteFadeReq(fade_bit, 0,	Xreg->work[6], Xreg->work[6], Xreg->work[5]);
			ColorConceChange(fade_bit, Xreg->work[6], Xreg->work[5]);
	
		Xreg->work[1] ^= 0x100;
		Xreg->work[0] = Xreg->work[1] & 0xff;
		Xreg->work[2]--;
	}
}

//----------------------------------------------------------
//	色を元に戻して終了
//----------------------------------------------------------
static void WazaSeqFlashEnd(actWork *Xreg)
{
	u32 fade_bit = 0;
	
	if(FadeData.fade_sw)
		return;
	fade_bit = WazaSeqColorInitSub(Xreg->work[7]);
//	PaletteFadeReq(fade_bit, 0, 0, 0, 0);
	ColorConceChange(fade_bit, 0, 0);
	DelWazaEffect(Xreg);
}




//=========================================================================
//	ﾌﾗｯｼｭ中に出る星
// offset 0:Xoffset 1:Yoffset
//=========================================================================
static void SeqWazaKiraFlashInit(actWork *Xreg)
{
	Xreg->x += WazaEffWork[0];
	Xreg->y += WazaEffWork[1];
	
	Xreg->work[0] = 0;
	Xreg->work[1] = 10;
	Xreg->work[2] = 8;			//角度増加量
	Xreg->work[3] = 40;			//ﾙｰﾌﾟ回数
	Xreg->work[4] = 0x0070;
	Xreg->work[5] = 0;
	SetWorkSeq(Xreg, W_AffCheckEndSeq);
	Xreg->move = PMObjKaiten2;
	PMObjKaiten2(Xreg);	//このままだと1瞬見えてしまうので、ここで初回のｺｰﾙ
}






//=========================================================================
//	タスクシーケンス
//=========================================================================
//----------------------------------------------------------
//ﾌｪｰﾄﾞﾘｸｴｽﾄ繰り返し(ｶﾗｰと2つの濃度を指定して、その2つの濃度の間でﾌｪｰﾄﾞを繰り返す)
//  ※最初のﾌｪｰﾄﾞはstart_evyが強制で0になります。
//    最後のﾌｪｰﾄﾞはend_evyが強制で0になります。
// offset 0:ﾌｪｰﾄﾞ対象 0bit=背景 1bit=攻撃側ﾎﾟｹﾓﾝ 2bit=攻撃対象ﾎﾟｹﾓﾝ
//					  3bit=攻撃側ﾎﾟｹﾓﾝ相方  4bit=防御側ﾎﾟｹﾓﾝ相方
//					  5bit=ｴﾌｪｸﾄBG1  6bit=ｴﾌｪｸﾄBG2
// 1:wait
// 2:繰り返し回数
// 3:start_evy
// 4:end_evy
// 5:color1(RGB指定)
//----------------------------------------------------------
void WazaTaskColorFade(u8 taskno)
{
	TaskTable[taskno].work[0] = WazaEffWork[0];
	TaskTable[taskno].work[1] = WazaEffWork[1];
	TaskTable[taskno].work[2] = WazaEffWork[2];
	TaskTable[taskno].work[3] = WazaEffWork[3];
	TaskTable[taskno].work[4] = WazaEffWork[4];
	TaskTable[taskno].work[5] = WazaEffWork[5];

	TaskTable[taskno].work[8] = 0;	//ﾌﾗｸﾞで使用
	WazaTaskColorFadeMain(taskno, 0, TaskTable[taskno].work[4]);//最初のstart_evyは0
	TaskTable[taskno].TaskAdrs = WazaTaskColorFadeWait;
}

static void WazaTaskColorFadeMain(u8 taskno, u8 start_evy, u8 end_evy)
{
	u32 fade_bit = 0;

	fade_bit = WazaSeqColorInitSub(TaskTable[taskno].work[0]);
	PaletteFadeReq(fade_bit, TaskTable[taskno].work[1],	
				start_evy, end_evy, TaskTable[taskno].work[5]);
	
	TaskTable[taskno].work[2]--;
	TaskTable[taskno].work[8] ^= 1;
}

static void WazaTaskColorFadeWait(u8 taskno)
{
	u8 start_evy, end_evy;
	
	if(FadeData.fade_sw == 0)
	{
		if(TaskTable[taskno].work[2] > 0)
		{
			if(TaskTable[taskno].work[8] == 0)
			{
				start_evy = TaskTable[taskno].work[3];
				end_evy = TaskTable[taskno].work[4];
			}
			else
			{
				start_evy = TaskTable[taskno].work[4];
				end_evy = TaskTable[taskno].work[3];
			}
			if(TaskTable[taskno].work[2] == 1)
				end_evy = 0;	//元の色に戻して終了するため
			WazaTaskColorFadeMain(taskno, start_evy, end_evy);
		}
		else
			DelTaskEffect(taskno);
	}
}








//=========================================================================
//	タスクシーケンス
//=========================================================================
//----------------------------------------------------------
//ﾌｪｰﾄﾞﾘｸｴｽﾄ繰り返し(ｶﾗｰと2つの濃度を指定して、その2つの濃度の間でﾌｪｰﾄﾞを繰り返す)
// WAZACHR_IDを指定して、そのﾊﾟﾚｯﾄに対してフェードを行う
// 0:WAZACHR_ID
// 1:wait
// 2:繰り返し回数
// 3:start_evy
// 4:end_evy
// 5:color1(RGB指定)
//----------------------------------------------------------
void WazaChrColorFadeRepeat(u8 taskno)
{
	TaskTable[taskno].work[0] = WazaEffWork[0];
	TaskTable[taskno].work[1] = WazaEffWork[1];
	TaskTable[taskno].work[2] = WazaEffWork[2];
	TaskTable[taskno].work[3] = WazaEffWork[3];
	TaskTable[taskno].work[4] = WazaEffWork[4];
	TaskTable[taskno].work[5] = WazaEffWork[5];

	TaskTable[taskno].work[8] = 0;	//ﾌﾗｸﾞで使用
	WazaChrFadeRepeatMain(taskno, 0, TaskTable[taskno].work[4]);//最初のstart_evyは0
	TaskTable[taskno].TaskAdrs = WazaChrColorFadeRepeatWait;
}

static void WazaChrFadeRepeatMain(u8 taskno, u8 start_evy, u8 end_evy)
{
	u32 fade_bit = 0;
	u8 pal_no;
	
	pal_no = ObjPalNumGet(TaskTable[taskno].work[0]);
	fade_bit = 1 << (16 + pal_no);
	PaletteFadeReq(fade_bit, TaskTable[taskno].work[1],	
				start_evy, end_evy, TaskTable[taskno].work[5]);
	
	TaskTable[taskno].work[2]--;
	TaskTable[taskno].work[8] ^= 1;
}

static void WazaChrColorFadeRepeatWait(u8 taskno)
{
	u8 start_evy, end_evy;
	
	if(FadeData.fade_sw == 0)
	{
		if(TaskTable[taskno].work[2] > 0)
		{
			if(TaskTable[taskno].work[8] == 0)
			{
				start_evy = TaskTable[taskno].work[3];
				end_evy = TaskTable[taskno].work[4];
			}
			else
			{
				start_evy = TaskTable[taskno].work[4];
				end_evy = TaskTable[taskno].work[3];
			}
			if(TaskTable[taskno].work[2] == 1)
				end_evy = 0;	//元の色に戻して終了するため
			WazaChrFadeRepeatMain(taskno, start_evy, end_evy);
		}
		else
			DelTaskEffect(taskno);
	}
}






//=========================================================================
//	タスク
//=========================================================================
//----------------------------------------------------------
//	ﾌﾗｯｼｭﾘｸｴｽﾄ2(2色のｶﾗｰと濃度を指定して、その2色でﾁｶﾁｶさせる)
// WAZACHR_IDを指定して、そのﾊﾟﾚｯﾄに対してフラッシュをかける
// offset 0:WAZACHR_ID
// 1:wait(ﾌﾗｯｼｭする間隔 ※MAX255)  2:繰り返し回数
// 3:color1 4:color1のevy 5:color2 6:color2のevy
//----------------------------------------------------------
void WazaTaskWazaChrFlash(u8 id)
{
	u8 pal_no;
	u32 fade_bit = 0;
	
	TaskTable[id].work[0] = WazaEffWork[1];
	TaskTable[id].work[1] = WazaEffWork[1];		//BackUp  上位8ﾋﾞｯﾄをﾌﾗｸﾞで使用
	TaskTable[id].work[2] = WazaEffWork[2];
	TaskTable[id].work[3] = WazaEffWork[3];
	TaskTable[id].work[4] = WazaEffWork[4];
	TaskTable[id].work[5] = WazaEffWork[5];
	TaskTable[id].work[6] = WazaEffWork[6];
	TaskTable[id].work[7] = WazaEffWork[0];
	
	pal_no = ObjPalNumGet(WazaEffWork[0]);
	fade_bit = 1 << (16 + pal_no);
	PaletteFadeReq(fade_bit, 0,	WazaEffWork[4], WazaEffWork[4], WazaEffWork[3]);
	TaskTable[id].TaskAdrs = WazaTaskFlashWait;
}

//----------------------------------------------------------
//	ﾙｰﾌﾟ処理
//----------------------------------------------------------
static void WazaTaskFlashWait(u8 id)
{
	u8 pal_no;
	u32 fade_bit = 0;
	
	if(TaskTable[id].work[0] > 0)
		TaskTable[id].work[0]--;
	else if(FadeData.fade_sw)
		return;
	else
	{
		if(TaskTable[id].work[2] == 0)
		{
			TaskTable[id].TaskAdrs = WazaTaskFlashEnd;
			return;
		}
		
		pal_no = ObjPalNumGet(TaskTable[id].work[7]);
		fade_bit = 1 << (16 + pal_no);
		if(TaskTable[id].work[1] & 0x100)
			PaletteFadeReq(fade_bit, 0,	TaskTable[id].work[4],
					 TaskTable[id].work[4], TaskTable[id].work[3]);
		else
			PaletteFadeReq(fade_bit, 0,	TaskTable[id].work[6],
					 TaskTable[id].work[6], TaskTable[id].work[5]);
	
		TaskTable[id].work[1] ^= 0x100;
		TaskTable[id].work[0] = TaskTable[id].work[1] & 0xff;
		TaskTable[id].work[2]--;
	}
}

//----------------------------------------------------------
//	色を元に戻して終了
//----------------------------------------------------------
static void WazaTaskFlashEnd(u8 id)
{
	u8 pal_no;
	u32 fade_bit = 0;
	
	if(FadeData.fade_sw)
		return;
	pal_no = ObjPalNumGet(TaskTable[id].work[7]);
	fade_bit = 1 << (16 + pal_no);
	PaletteFadeReq(fade_bit, 0, 0, 0, 0);
	DelTaskEffect(id);
}







//=========================================================================
//	ｶﾗｰ反転
//=========================================================================
//----------------------------------------------------------
//    1 = 反転   0 = 非対象
// offset 0:上位8ﾋﾞｯﾄ=背景		   下位8ﾋﾞｯﾄ=ｹﾞｰｼﾞ
//		  1:上位8ﾋﾞｯﾄ=攻撃側ﾎﾟｹﾓﾝ1 下位8ﾋﾞｯﾄ=攻撃側ﾎﾟｹﾓﾝ2
//		  2:上位8ﾋﾞｯﾄ=防御側ﾎﾟｹﾓﾝ1 下位8ﾋﾞｯﾄ=防御側ﾎﾟｹﾓﾝ2
//		　3:上位8ﾋﾞｯﾄ=攻撃側ｹﾞｰｼﾞ1 下位8ﾋﾞｯﾄ=攻撃側ｹﾞｰｼﾞ2
//		　4:上位8ﾋﾞｯﾄ=防御側ｹﾞｰｼﾞ1 下位8ﾋﾞｯﾄ=防御側ｹﾞｰｼﾞ2
//----------------------------------------------------------
void WazaTaskColorReversal(u8 id)
{
	u32 palbit = 0;
	u8 a_client, d_client;	//attack, defence
//	u8 temp;
	
	a_client = AttackNo;
	d_client = DefenceNo;
	
	if(WazaEffWork[0] & 0x0100)
		palbit |= GetBattleFadeBit(1,0,0,0,0,0,0);

	if(WazaEffWork[1] & 0x0100)
		palbit |= (1 << a_client) << 16;
	
	//if(WazaEffWork[1] & 1)	//攻撃側ﾎﾟｹﾓﾝ2
	
	if(WazaEffWork[2] & 0x0100)
		palbit |= (1 << d_client) << 16;
	
	//if(WazaEffWork[2] & 1)	//防御側ﾎﾟｹﾓﾝ2
	
	ColorReversal(palbit);
	DelTaskEffect(id);
}

//=========================================================================
//	ｶﾗｰ加算		31(5bit)以下を切り捨てたまま加算し続けます
//=========================================================================
//----------------------------------------------------------
//    1 = 加算   0 = 非対象
// offset 0:上位8ﾋﾞｯﾄ=背景		   下位8ﾋﾞｯﾄ=ｹﾞｰｼﾞ
//		  1:上位8ﾋﾞｯﾄ=攻撃側ﾎﾟｹﾓﾝ1 下位8ﾋﾞｯﾄ=攻撃側ﾎﾟｹﾓﾝ2
//		  2:上位8ﾋﾞｯﾄ=防御側ﾎﾟｹﾓﾝ1 下位8ﾋﾞｯﾄ=防御側ﾎﾟｹﾓﾝ2
//		　3:上位8ﾋﾞｯﾄ=攻撃側ｹﾞｰｼﾞ1 下位8ﾋﾞｯﾄ=攻撃側ｹﾞｰｼﾞ2
//		　4:上位8ﾋﾞｯﾄ=防御側ｹﾞｰｼﾞ1 下位8ﾋﾞｯﾄ=防御側ｹﾞｰｼﾞ2
//		  5:ﾊﾟﾚｯﾄ RED   加算数値
//		  5:ﾊﾟﾚｯﾄ GREEN 加算数値
//		  5:ﾊﾟﾚｯﾄ BLUE  加算数値
//----------------------------------------------------------
void WazaTaskColorRandomPlus(u8 id)
{
	u32 palbit = 0;
	u8 a_client, d_client;	//attack, defence
	u8 temp;
	
	if(TaskTable[id].work[0]==0){
		TaskTable[id].work[2] = WazaEffWork[0];	//加減算対象bit指定 BG
		TaskTable[id].work[3] = WazaEffWork[1];	//加減算対象bit指定 MYOBJ
		TaskTable[id].work[4] = WazaEffWork[2];	//加減算対象bit指定 ENEMYOBJ
		TaskTable[id].work[1] = WazaEffWork[3]; //ウェイト数
		TaskTable[id].work[5] = WazaEffWork[4];	//RED加算
		TaskTable[id].work[6] = WazaEffWork[5];	//GREEN加算
		TaskTable[id].work[7] = WazaEffWork[6];	//BLUE加算
	}
	TaskTable[id].work[0]++;
	a_client = AttackNo;
	d_client = DefenceNo;
	
	if(TaskTable[id].work[2] & 0x0100)
		palbit |= 0xffff;
	
	if(TaskTable[id].work[2] & 1)
	{
		temp = ObjPalNumGet(ActWork[ClientGaugeSt[a_client]].actHead->palNo);
		palbit |= (1 << temp) << 16;
	}

	if(TaskTable[id].work[3] & 0x0100)
		palbit |= (1 << a_client) << 16;
	
	
	if(TaskTable[id].work[4] & 0x0100)
		palbit |= (1 << d_client) << 16;
	

	ColorRandomPlus(palbit,TaskTable[id].work[5],TaskTable[id].work[6],TaskTable[id].work[7]);

	if(TaskTable[id].work[0]==TaskTable[id].work[1]){
		ColorRandomPlusEnd(palbit);
		DelTaskEffect(id);
	}
}











//=========================================================================
//
//		「画面揺らしエフェクト」
//														by matsuda
//=========================================================================
//----------------------------------------------------------
//	プロトタイプ宣言
//----------------------------------------------------------
static void DispQuakeInit( actWork * Xreg );
static void DispQuakeMain(actWork *Xreg);
static void PokeQuakeInit(void);

//----------------------------------------------------------
//	定数宣言
//----------------------------------------------------------
enum{
	DISP_H,
	DISP_V,
	POKE_H,
	POKE_V,
};

//----------------------------------------------------------
//	アクターテーブル
//----------------------------------------------------------
const	actHeader ActQuakeHeader={	//揺らし
	0,
	0,
	&DummyActOam,
	DummyActAnmTbl,
	0,
	DummyActAffTbl,
	DispQuakeInit,
};

//-------------------------------------------------------------
//		アクターシーケンス
//-------------------------------------------------------------
//----------------------------------------------------------
//	offset 0:振り幅 1:wait(画面を揺らす間隔) 2:終了までのwait
//         3:対象 0=背景横揺らし 1=背景縦揺らし 2=ﾎﾟｹﾓﾝ横 3=ﾎﾟｹﾓﾝ縦
//		   4:対象2(対象がﾎﾟｹﾓﾝの時だけ必要) 0=攻撃側 1=攻撃対象 2=両方
//----------------------------------------------------------
static void DispQuakeInit( actWork * Xreg )
{
	Xreg->banish = 1;
	Xreg->work[0] = -WazaEffWork[0];
	Xreg->work[1] = WazaEffWork[1];
	Xreg->work[2] = WazaEffWork[1];		//BackUp
	Xreg->work[3] = WazaEffWork[2];

	switch(WazaEffWork[3])
	{
		case DISP_H:		//画面横揺らし
			SetWorkSeq(Xreg, &ScrX3);
			break;
		case DISP_V:		//画面縦揺らし
			SetWorkSeq(Xreg, &ScrY3);
			break;
		case POKE_H:		//ﾎﾟｹﾓﾝ横揺らし
			SetWorkSeq(Xreg, &ActOX);
			break;
		case POKE_V:		//ﾎﾟｹﾓﾝ縦揺らし
		default:
			SetWorkSeq(Xreg, &ActOY);
			break;
	}
	Xreg->work[4] = *(u32*)((void*)(Xreg->work[6] | (Xreg->work[7] << 16)));//BackUp
	Xreg->work[5] = WazaEffWork[3];
	
	if(WazaEffWork[3] == POKE_H || WazaEffWork[3] == POKE_V)
		PokeQuakeInit();
	
	Xreg->move = DispQuakeMain;
//	DispQuakeMain(Xreg);	//呼ばれたのと同時にやる為、初回のをここで呼ぶ
}

//----------------------------------------------------------
//	メイン
//----------------------------------------------------------
static void DispQuakeMain(actWork *Xreg)
{
	u8 i;
	
	if(Xreg->work[3] > 0)
	{
		Xreg->work[3]--;

		if(Xreg->work[1] > 0)
			Xreg->work[1]--;
		else
		{
			Xreg->work[1] = Xreg->work[2];
			*(u32*)((void*)(Xreg->work[6] | (Xreg->work[7] << 16))) += Xreg->work[0];
			Xreg->work[0] = -Xreg->work[0];
		}
	}
	else
	{
		*(u32*)((void*)(Xreg->work[6] | (Xreg->work[7] << 16))) = Xreg->work[4];
		if(Xreg->work[5] == POKE_H || Xreg->work[5] == POKE_V)
		{
			for(i = 0; i < ClientSetMax; i++)
				ActWork[PokemonStruct[i]].scr = 0;
		}
		DelWazaEffect(Xreg);
	}
}

//----------------------------------------------------------
//	揺らし対象がﾎﾟｹﾓﾝの時だけの初期化
//----------------------------------------------------------
static void PokeQuakeInit(void)
{
	ActWork[PokemonStruct[AttackNo]].scr = 0;
	ActWork[PokemonStruct[DefenceNo]].scr = 0;
	
	if(WazaEffWork[4] == 2)
	{
		ActWork[PokemonStruct[AttackNo]].scr = 1;
		ActWork[PokemonStruct[DefenceNo]].scr = 1;
		return;
	}
	
	if(WazaEffWork[4] == 0)
		ActWork[PokemonStruct[AttackNo]].scr = 1;
	else
		ActWork[PokemonStruct[DefenceNo]].scr = 1;
}





//=========================================================================
//
//		背景揺らしエフェクト
//												by matsuda 2002.07.17(水)
//=========================================================================
static void TaskHaikeiQuakeMain(u8 id);

//-------------------------------------------------------------
// offset 0:X振り幅(半径)  1:Y振り幅(直径)  2:回数  3:wait
//-------------------------------------------------------------
void TaskHaikeiQuake(u8 id)
{
	TaskTable[id].work[0] = WazaEffWork[0];
	TaskTable[id].work[1] = WazaEffWork[1];
	TaskTable[id].work[2] = WazaEffWork[2];
	TaskTable[id].work[3] = WazaEffWork[3];
	TaskTable[id].work[8] = WazaEffWork[3];	//値保持
	ScrX3 = WazaEffWork[0];
	ScrY3 = WazaEffWork[1];
	TaskTable[id].TaskAdrs = TaskHaikeiQuakeMain;
	TaskTable[id].TaskAdrs(id);
}

static void TaskHaikeiQuakeMain(u8 id)
{
	if(TaskTable[id].work[3] == 0)
	{
		if(ScrX3 == TaskTable[id].work[0])
			ScrX3 = -TaskTable[id].work[0];
		else
			ScrX3 = TaskTable[id].work[0];
		if(ScrY3 == -TaskTable[id].work[1])
			ScrY3 = 0;
		else
			ScrY3 = -TaskTable[id].work[1];
		TaskTable[id].work[3] = TaskTable[id].work[8];
		TaskTable[id].work[2]--;

		if(TaskTable[id].work[2] == 0)
		{
			ScrX3 = 0;
			ScrY3 = 0;
			DelTaskEffect(id);
		}
	}
	else
		TaskTable[id].work[3]--;
}






//=========================================================================
//
//		ヒットマーク
//												by matsuda 2002.01.08(火)
//=========================================================================
static void HitMarkInitSeq(actWork *xreg);
static void HitMarkYflipInitSeq(actWork *xreg);
static void RandomHitMarkInitSeq(actWork *xreg);
static void SearchHitMarkInitSeq(actWork *xreg);
static void XHitMarkInitSeq(actWork *xreg);
static void HitMarkBlinkInit(actWork *xreg);
static void HitMarkBlinkMain(actWork *xreg);


#define HITMARK_AFF		200
#define HITMARK_AFLOOP	4
#define HITMARK_AFSP	(HITMARK_AFF / HITMARK_AFLOOP)
#define HITMARK_WAIT	8

static const actAffAnm HitMarkAff0[] = {
//	{ 拡縮x, 拡縮y, 角度, ｳｪｲﾄ }
//	{0x100 - HITMARK_AFF, 0x100 - HITMARK_AFF, 0, ACT_AFSET},
//	{ HITMARK_AFSP, HITMARK_AFSP, 0, HITMARK_AFLOOP},
//	{0, 0, 0, 7},
	{0,0,0,HITMARK_WAIT},
	{ACT_AFEND,0,0,0},
};
static const actAffAnm HitMarkAff1[] = {
//	{ 拡縮x, 拡縮y, 角度, ｳｪｲﾄ }
	{0xd8,0xd8,0,ACT_AFSET},
	{0,0,0,HITMARK_WAIT},
	{ACT_AFEND,0,0,0},
};
static const actAffAnm HitMarkAff2[] = {
//	{ 拡縮x, 拡縮y, 角度, ｳｪｲﾄ }
	{0xb0,0xb0,0,ACT_AFSET},
	{0,0,0,HITMARK_WAIT},
	{ACT_AFEND,0,0,0},
};
static const actAffAnm HitMarkAff3[] = {
//	{ 拡縮x, 拡縮y, 角度, ｳｪｲﾄ }
	{0x80,0x80,0,ACT_AFSET},
	{0,0,0,HITMARK_WAIT},
	{ACT_AFEND,0,0,0},
};
static const	actAffAnm * const HitMarkAffTbl[] = {
	HitMarkAff0,
	HitMarkAff1,
	HitMarkAff2,
	HitMarkAff3,
};
const actHeader ActHitMarkHeader = {	//ﾉｰﾏﾙﾋｯﾄﾏｰｸ
	WAZACHR_ID_HITMARK,
	WAZACHR_ID_HITMARK,
	&WazaOamDataBldAffine[2],
	DummyActAnmTbl,
	0,
	HitMarkAffTbl,
	HitMarkInitSeq,
};
const actHeader ActHitMarkYflipHeader = {	//ﾉｰﾏﾙﾋｯﾄﾏｰｸ(敵味方でY座標のｵﾌｾｯﾄを反転)
	WAZACHR_ID_HITMARK,
	WAZACHR_ID_HITMARK,
	&WazaOamDataBldAffine[2],
	DummyActAnmTbl,
	0,
	HitMarkAffTbl,
	HitMarkYflipInitSeq,
};
const actHeader ActMizuHitHeader = {	//水系ﾋｯﾄﾏｰｸ
	WAZACHR_ID_MIZUHIT,
	WAZACHR_ID_MIZUHIT,
	&WazaOamDataBldAffine[2],
	DummyActAnmTbl,
	0,
	HitMarkAffTbl,
	HitMarkInitSeq,
};
const actHeader ActRandomHitMarkHeader = {	// 表示位置ﾗﾝﾀﾞﾑﾋｯﾄﾏｰｸ
	WAZACHR_ID_HITMARK,
	WAZACHR_ID_HITMARK,
	&WazaOamDataBldAffine[2],
	DummyActAnmTbl,
	0,
	HitMarkAffTbl,
	RandomHitMarkInitSeq,
};
const actHeader ActSearchHitMarkHeader = {	// 対象追跡ﾋｯﾄﾏｰｸ
	WAZACHR_ID_HITMARK,
	WAZACHR_ID_HITMARK,
	&WazaOamDataBldAffine[2],
	DummyActAnmTbl,
	0,
	HitMarkAffTbl,
	SearchHitMarkInitSeq,
};
const actHeader ActXHitMarkHeader = {	// Ｘ型ヒットマーク
	WAZACHR_ID_XHITMARK,
	WAZACHR_ID_XHITMARK,
	&WazaOamDataBldNormal[2],
	DummyActAnmTbl,
	0,
	DummyActAffTbl,
	XHitMarkInitSeq,
};
const actHeader ActHitMarkBlinkHeader = {	//ﾉｰﾏﾙﾋｯﾄﾏｰｸ(非半透明,点滅Ver)
	WAZACHR_ID_HITMARK,
	WAZACHR_ID_HITMARK,
	&WazaOamDataAffine[2],
	DummyActAnmTbl,
	0,
	HitMarkAffTbl,
	HitMarkBlinkInit,
};

//----------------------------------------------------------
// offset 0:Xoffset  1:Yoffset  2: 0=攻撃側に出す  1=防御側に出す
//		  3:ﾋｯﾄﾏｰｸの大きさ指定(大 0～3 小)
//----------------------------------------------------------
static void HitMarkInitSeq(actWork *xreg)
{
	ActAffAnmChg(xreg, WazaEffWork[3]);
	if(WazaEffWork[2] == 0)
		WazaDefaultPosSet2(xreg, PM_MODE);
	else
		WazaDefaultPosSet1(xreg, PM_MODE);
	xreg->move = W_AffEndWait;
	SetWorkSeq(xreg, DelWazaEffect);
}
//----------------------------------------------------------
// offset 0:Xoffset  1:Yoffset  2: 0=攻撃側に出す  1=防御側に出す
//		  3:ﾋｯﾄﾏｰｸの大きさ指定(大 0～3 小),4:Wait
//		  
//	*AffineAnim終了後、指定したSyncウェイト
//												02.08.27_add_iwasawa
//----------------------------------------------------------
extern void SeqWazaEffectEnd(actWork *xreg);
static void HitMarkWaitInitSeq(actWork *xreg)
{
	ActAffAnmChg(xreg, WazaEffWork[3]);
	if(WazaEffWork[2] == 0)
		WazaDefaultPosSet2(xreg, PM_MODE);
	else
		WazaDefaultPosSet1(xreg, PM_MODE);

	//Waitを保存
	xreg->work[0] = WazaEffWork[4];
	xreg->move = W_AffEndWait;
	SetWorkSeq(xreg, SeqWazaEffectEnd);
}
const actHeader ActHitMarkWaitHeader = {	//ﾉｰﾏﾙﾋｯﾄﾏｰｸ,Wait付き
	WAZACHR_ID_HITMARK,
	WAZACHR_ID_HITMARK,
	&WazaOamDataBldAffine[2],
	DummyActAnmTbl,
	0,
	HitMarkAffTbl,
	HitMarkWaitInitSeq,
};

//----------------------------------------------------------
// offset 0:Xoffset  1:Yoffset  2: 0=攻撃側に出す  1=防御側に出す
//		  3:ﾋｯﾄﾏｰｸの大きさ指定(大 0～3 小)
//----------------------------------------------------------
static void HitMarkYflipInitSeq(actWork *xreg)
{
	if(MineEnemyCheck(AttackNo) && ContestCheck()==0)
		WazaEffWork[1] = -WazaEffWork[1];
	HitMarkInitSeq(xreg);
}

//----------------------------------------------------------
// offset 0:(0:攻撃側  1:防御側)  
//		  1:ﾋｯﾄﾏｰｸの大きさ指定(大 0～3 小  -1:ﾗﾝﾀﾞﾑ)
//----------------------------------------------------------
static void RandomHitMarkInitSeq(actWork *xreg)
{
	if(WazaEffWork[1] == -1){
		WazaEffWork[1] = pp_rand() & 3;
	}
	ActAffAnmChg(xreg, WazaEffWork[1]);

	if(WazaEffWork[0] == 0)
		WazaDefaultPosSet2(xreg, EFF_MODE);
	else
		WazaDefaultPosSet1(xreg, EFF_MODE);

	xreg->dx += ((pp_rand() % 48) - 24);
	xreg->dy += ((pp_rand() % 24) - 12);

//	SetWorkSeq(xreg, DelWazaEffect);
	SetWorkSeq(xreg, W_AffCheckEndSeq);
	xreg->move = W_AffEndWait;
}
//----------------------------------------------------------
// offset 0:(0:攻撃側  1:防御側)  
//        1:xofs  2:yofs
//		  3:ﾋｯﾄﾏｰｸの大きさ指定(大 0～3 小  -1:ﾗﾝﾀﾞﾑ)
//----------------------------------------------------------
static void SearchHitMarkInitSeq(actWork *act)
{
	act->work[0] = W_GetPokeActNo(WazaEffWork[0]);

	act->x = ActWork[act->work[0]].x + ActWork[act->work[0]].dx;
	act->y = ActWork[act->work[0]].y + ActWork[act->work[0]].dy;
	act->dx = WazaEffWork[1];
	act->dy = WazaEffWork[2];

	ActAffAnmChg(act,WazaEffWork[3]);
	SetWorkSeq(act, W_AffCheckEndSeq);
	act->move = W_AffEndWait;
}
//----------------------------------------------------------
// offset 0:Xoffset  1:Yoffset  2: 0=攻撃側に出す  1=防御側に出す
//		  3:表示sync数
//----------------------------------------------------------
static void XHitMarkInitSeq(actWork *xreg)
{
	if(WazaEffWork[2] == 0)
		WazaDefaultPosSet2(xreg, PM_MODE);
	else
		WazaDefaultPosSet1(xreg, PM_MODE);

	xreg->work[0] = WazaEffWork[3];
	SetWorkSeq(xreg,DelWazaEffect);
	xreg->move = W_WaitSeq;
}

//----------------------------------------------------------
// offset 0:Xoffset  1:Yoffset  2: 0=攻撃側に出す  1=防御側に出す
//		  3:ﾋｯﾄﾏｰｸの大きさ指定(大 0～3 小)
//----------------------------------------------------------
static void HitMarkBlinkInit(actWork *xreg)
{
	ActAffAnmChg(xreg, WazaEffWork[3]);
	if(WazaEffWork[2] == 0)
		WazaDefaultPosSet2(xreg, PM_MODE);
	else
		WazaDefaultPosSet1(xreg, PM_MODE);
	xreg->move = HitMarkBlinkMain;
}

static void HitMarkBlinkMain(actWork *xreg)
{
	xreg->banish ^= 1;
//	if(xreg->affend_sw)
	if(xreg->work[0]++ > HITMARK_WAIT + HITMARK_WAIT/2)
		DelWazaEffect(xreg);
}





//=========================================================================
//
//		New パレットフェード
//												by matsuda 2002.01.18(金)
//=========================================================================
static void ColorFadeMainSeq(u8 id);
static void ColorFadeCommonSeq(u8 id, u32 fade_bit);

//----------------------------------------------------------
//	ﾌｪｰﾄﾞﾘｸｴｽﾄ
// offset 0:ﾌｪｰﾄﾞ対象 0bit=背景(土地含む) 1bit=攻撃側ﾎﾟｹﾓﾝ 2bit=防御側ﾎﾟｹﾓﾝ
//					  3bit=攻撃側ﾎﾟｹﾓﾝ相方  4bit=防御側ﾎﾟｹﾓﾝ相方
//					  5bit=ｴﾌｪｸﾄBG1  6bit=ｴﾌｪｸﾄBG2
//					  ※↓自分選択で攻撃、防御側として取れない時のために追加※
//					  7bit=Mine1  8bit=Mine2	9bit=Enemy1	10bit=Enemy2
// 1:wait
// 2:start_evy
// 3:end_evy
// 4:color1(RGB指定)
//----------------------------------------------------------
void ColorFadeSeq(u8 id)
{
	u32 fade_bit = 0;
	u32 poke_bit = 0;
	u8 mine0=0,mine1=0,enemy0=0,enemy1=0;
	
	fade_bit = WazaSeqColorInitSub(WazaEffWork[0]);
	
	//-- add 2002.09.03(火) --//
	if((WazaEffWork[0] >> 7) & 1)
		mine0 = 1;
	if((WazaEffWork[0] >> 8) & 1)
		mine1 = 1;
	if((WazaEffWork[0] >> 9) & 1)
		enemy0 = 1;
	if((WazaEffWork[0] >> 10) & 1)
		enemy1 = 1;
	poke_bit = GetPokeFadeBit(mine0, mine1, enemy0, enemy1);
	fade_bit |= poke_bit;
	//-- ここまで --//
	
	ColorFadeCommonSeq(id, fade_bit);
}

//----------------------------------------------------------
//	対象以外全てにﾌｪｰﾄﾞﾘｸｴｽﾄ
// offset 0:ﾌｪｰﾄﾞ除外対象 
//(0:攻撃ポケ  1:防御ポケ  2:攻撃ﾎﾟｹ&背景  3:防御ﾎﾟｹ&背景）
//(4:攻撃ﾎﾟｹ＆防御ﾎﾟｹ  5:対象なし)
//(5:攻撃ポケ相方  6:防御ポケ相方）
// 1:wait
// 2:start_evy
// 3:end_evy
// 4:color1(RGB指定)
//----------------------------------------------------------
void ExceptColorFadeSeq(u8 id)
{
	u32 fade_bit;
	u8  client[2];
	u8  i;

	client[1] = 0xff;  // 無効なｸﾗｲｱﾝﾄﾅﾝﾊﾞｰ
	fade_bit = WazaSeqColorInitSub(1);  // 背景
	switch(WazaEffWork[0]){
	case 2:
		fade_bit = 0;
	case 0:
		client[0] = AttackNo;
		break;

	case 3:
		fade_bit = 0;
	case 1:
		client[0] = DefenceNo;
		break;

	case 4:
		client[0]=AttackNo;
		client[1]=DefenceNo;
		break;

	case 5:
		client[0]=0xff;
		break;

	case 6:
		fade_bit = 0;
		client[0] = AttackNo^2;
		break;

	case 7:
		fade_bit = 0;
		client[0] = DefenceNo^2;
	}

	for(i = 0; i < 4; i++){
		if(i != client[0] && i != client[1] && PokeBG2taimeCheck(i)){
			fade_bit |= (0x00010000 << GetClientPokePalNo(i));
		}
	}
	
	ColorFadeCommonSeq(id, fade_bit);
}
//----------------------------------------------------------
//	地形と同じような色になるようにﾌｪｰﾄﾞﾘｸｴｽﾄ（ほごしょく）
// offset 0:ﾌｪｰﾄﾞ対象 0bit=背景(土地含む) 1bit=攻撃側ﾎﾟｹﾓﾝ 2bit=防御側ﾎﾟｹﾓﾝ
//					  3bit=攻撃側ﾎﾟｹﾓﾝ相方  4bit=防御側ﾎﾟｹﾓﾝ相方
//					  5bit=ｴﾌｪｸﾄBG1  6bit=ｴﾌｪｸﾄBG2
// 1:wait
// 2:start_evy
// 3:end_evy
//----------------------------------------------------------
void FieldColorFadeSeq(u8 id)
{
	u32 fade_bit = 0;

	fade_bit = WazaSeqColorInitSub(WazaEffWork[0]);

	switch(GroundNo){
	case GROUND_KUSA:     WazaEffWork[4] = 0x0b0c; break;
	case GROUND_LONGKUSA: WazaEffWork[4] = 0x09e0; break;
	case GROUND_SUNA:     WazaEffWork[4] = 0x2f1e; break;
	case GROUND_MIZU:     WazaEffWork[4] = 0x4800; break;
	case GROUND_UMI:      WazaEffWork[4] = 0x7ecb; break;
	case GROUND_IKE:      WazaEffWork[4] = 0x7ecb; break;
	case GROUND_IWA:      WazaEffWork[4] = 0x2a16; break;
	case GROUND_DOUKUTSU: WazaEffWork[4] = 0x0d2e; break;
	case GROUND_ROOM:     WazaEffWork[4] = 0x7fff; break;
	case GROUND_ALL:      WazaEffWork[4] = 0x7fff; break;

	}

	ColorFadeCommonSeq(id, fade_bit);
}



//----------------------------------------------------------
//	WAZACHR_IDを指定してﾌｪｰﾄﾞﾘｸｴｽﾄ
// offset 0: フェードさせるWAZACHR_ID
// 1:wait
// 2:start_evy
// 3:end_evy
// 4:color1(RGB指定)
//----------------------------------------------------------
void WazaChrColorFade(u8 id)
{
	u8 pal_no;
	u32 fade_bit;
	
	pal_no = ObjPalNumGet(WazaEffWork[0]);
	fade_bit = 1 << (16 + pal_no);
	ColorFadeCommonSeq(id, fade_bit);
}

static void ColorFadeCommonSeq(u8 id, u32 fade_bit)
{
	TaskTable[id].work[0] = fade_bit & 0xffff;
	TaskTable[id].work[1] = fade_bit >> 16;
	TaskTable[id].work[2] = WazaEffWork[1];
	TaskTable[id].work[3] = WazaEffWork[2];
	TaskTable[id].work[4] = WazaEffWork[3];
	TaskTable[id].work[5] = WazaEffWork[4];
	TaskTable[id].work[10] = WazaEffWork[2];
	TaskTable[id].TaskAdrs = ColorFadeMainSeq;
	TaskTable[id].TaskAdrs(id);
}

//とりあえず9からを計算用ﾜｰｸとして使用して、その前のﾜｰｸは↑ので使用にしてる
static void ColorFadeMainSeq(u8 id)
{
	u32 fade_bit;
	u16 src = 0;
	
	if(TaskTable[id].work[9] == TaskTable[id].work[2])
	{
		TaskTable[id].work[9] = 0;
		fade_bit = TaskTable[id].work[0] | (TaskTable[id].work[1] << 16);
		while(fade_bit)
		{
			if(fade_bit & 1)
				SoftFade(src, 16, TaskTable[id].work[10], TaskTable[id].work[5]);
			src += 16;
			fade_bit >>= 1;
		}
		if(TaskTable[id].work[10] < TaskTable[id].work[4])
			TaskTable[id].work[10]++;
		else if(TaskTable[id].work[10] > TaskTable[id].work[4])
			TaskTable[id].work[10]--;
		else
			DelTaskEffect(id);
	}
	else
		TaskTable[id].work[9]++;
}







//=========================================================================
//
//		ハードフェードリクエスト
//												by matsuda 2002.06.08(土)
//=========================================================================
static void WazaHardFadeTaskWait(u8 id);

//----------------------------------------------------------
//	HardFadeReq関数の引数をそのまま指定
//
// 0,fade_bit : 加減算の対象にするBG,OBJを指定(BLDCNTﾚｼﾞｽﾀの第1対象ﾋﾟｸｾﾙに設定するﾋﾞｯﾄ)
//				6,7bit:光度変更ｱｯﾌﾟ、ﾀﾞｳﾝﾋﾞｯﾄ(10:UP	 11:DOWN)
//				5bit:BD(ﾊﾞｯｸｸﾞﾗｳﾝﾄﾞ), 4bit:OBJ, 3:BG3, 2:BG2, 1:BG1, 0:BG0
//
// 1,wait : 値を大きくするとゆっくりﾌｪｰﾄﾞｱｳﾄ、ｲﾝします (MAX:63)
// 2,start_evy : 最初の色の濃度を指定します(0～16)
// 			   0(元の色)～2,3..(中間色)～16(黒、もしくは白)
// 3,end_evy : 最終的な色の濃度を指定します。引数の値は↑と同じです
// 4,reset_flg : ﾌｪｰﾄﾞ終了時にﾚｼﾞｽﾀｰの初期化をするか(0:しない  1:する)
//----------------------------------------------------------
void WazaHardFadeTask(u8 id)
{
	HardFadeReq(WazaEffWork[0],WazaEffWork[1],WazaEffWork[2],
			WazaEffWork[3],WazaEffWork[4]);
	TaskTable[id].TaskAdrs = WazaHardFadeTaskWait;
}

static void WazaHardFadeTaskWait(u8 id)
{
	if(FadeData.fade_sw == 0)
		DelTaskEffect(id);
}








//=========================================================================
//	定期的にポケモン残像を表示するタスク
//
//																	TAYA
//=========================================================================
static void TaskPokeZanzouMain(u8 id);
static void zanzou_actmove(actWork *act);

//-------------------------------------------------------------
//	初期化
//  0:0=攻撃側  1=防御側
//	1:ウェイトsync数  2:残像の寿命sync数  3:表示個数
//-------------------------------------------------------------
void TaskPokeZanzou(u8 id)
{
	TASK_TABLE *my = &TaskTable[id];

	my->work[0] = WazaEffWork[0];  // 0:攻撃側or防御側
	my->work[1] = 0;               // 1:ｶｳﾝﾀ
	my->work[2] = WazaEffWork[1];  // 2:wait
	my->work[3] = WazaEffWork[2];  // 3:残像の寿命
	my->work[4] = WazaEffWork[3];  // 4:最大表示個数
	my->work[5] = 0;               // 5:現在の表示個数
	my->TaskAdrs = TaskPokeZanzouMain;
}

static void TaskPokeZanzouMain(u8 id)
{
	TASK_TABLE *my = &TaskTable[id];

	if(my->work[4]){
		if(my->work[1]){
			my->work[1]--;
		}else{
			my->work[6] = W_PokeZanzouMake(my->work[0]);
			// 残像ｱｸﾀｰに寿命sync数、ﾀｽｸﾜｰｸのｶｳﾝﾀ位置など情報をセット
			if(my->work[6] >= 0){
				ActWork[my->work[6]].oamData.Priority = (my->work[0])? 1 : 2;
				ActWork[my->work[6]].work[0] = my->work[3];
				ActWork[my->work[6]].work[1] = id;
				ActWork[my->work[6]].work[2] = 5;
				ActWork[my->work[6]].move = zanzou_actmove;
				my->work[5]++;
			}
			my->work[4]--;
			my->work[1] = my->work[2];
		}
	}else{
		if(my->work[5] == 0){
			DelTaskEffect(id);
		}
	}

}
static void zanzou_actmove(actWork *act)
{
	if(act->work[0]){
		act->work[0]--;
	}else{
		TaskTable[act->work[1]].work[act->work[2]]--;
		W_PokeZanzouDel(act);
	}
}












//=========================================================================
//
//		のろいノーマルエフェクト
//												by matsuda 2002.05.21(火)
//=========================================================================
static void StUpEffectMain(u8 id);

//----------------------------------------------------------
//	offset なし
//----------------------------------------------------------
const u16 st_up_color = 0x7fff;

void StUpEffectTask(u8 id)
{
	u8 pokeact, winact;
	u16 monsno;
	WazaBgData wazabg;
	u8 pri_flg = 0;
	
	Win0H = 0;
	Win0V = 0;
	*(vu16*)REG_WININ = (WIN_ALL_ON << 8) | WIN_ALL_ON;
	*(vu16*)REG_WINOUT = (WIN_ALL_ON << 8) | 0x3d;
	*(vu16*)REG_DISPCNT |= DISP_OBJWIN_ON;
	*(vu16*)REG_BLDCNT = BLD_A_BLEND_MODE | BLD_2ND_ALL | BLD_BG1_1ST;
	*(vu16*)REG_BLDALPHA = (0x0c << 8) | 0x8;

	(*(vBgCnt *)REG_BG1CNT).Priority = 0;
	(*(vBgCnt *)REG_BG1CNT).Size = 0;
	(*(vBgCnt *)REG_BG1CNT).Loop = 1;
	if(ContestCheck() == 0)//ｴﾌｪｸﾄの間だけｷｬﾗｸﾀﾍﾞｰｽを変更(ｽｸﾘｰﾝﾃﾞｰﾀの関係で)
		(*(vBgCnt *)REG_BG1CNT).CharBasep = 1;
//ﾌﾟﾗｲｵﾘﾃｨが低いﾎﾟｹﾓﾝが対象の場合、隣のﾎﾟｹﾓﾝにｴﾌｪｸﾄがかぶらないようにﾌﾟﾗｲｵﾘﾃｨを上げる
	if(FightCheck() && ContestCheck()==0)
	{
		if(ClientTypeGet(AttackNo) == BSS_CLIENT_ENEMY2
			|| ClientTypeGet(AttackNo) == BSS_CLIENT_MINE)
		{
			if(PokeBG2taimeCheck(AttackNo^2) == 1){
				ActWork[PokemonStruct[AttackNo^2]].oamData.Priority--;
				(*(vBgCnt *)REG_BG1CNT).Priority = 1;
				pri_flg = 1;
			}
		}
	}

	if(ContestCheck())
		monsno = conpara->monsno;
	else if(MineEnemyCheck(AttackNo))
		monsno = PokeParaGet(&PokeParaEnemy[SelMonsNo[AttackNo]], ID_monsno);
	else
		monsno = PokeParaGet(&PokeParaMine[SelMonsNo[AttackNo]], ID_monsno);
	
	//-- WinObj --//
	pokeact = W_GetPokeActNo(0);
	winact = PokeWinObjMake(AttackNo, pokeact, monsno);
	
	//-- 光エフェクト --//
	GetWazaEffBgAdrs(&wazabg);
	DIV_DMACLEAR(3, 0, wazabg.ScrnAdrs, 0x1000, 32);
	DecordVram((void*)st_up_psc_ADRS, wazabg.ScrnAdrs);
	if(ContestCheck())
		ScrnPalRewrite(wazabg.PlttNo, (u32)wazabg.ScrnAdrs, 0, 0);
	DecordVram((void*)st_up_pch_ADRS, wazabg.CharAdrs);
	//DecordPaletteWork((void*)metaru_pcl_ADRS, wazabg.PlttNo*16, 0x20);
	PaletteWorkSet(&st_up_color, wazabg.PlttNo*16+1, 2);
	ScrX1 = -ActWork[pokeact].x + 32;
//	ScrY1 = -ActWork[pokeact].y + 32-64;
	ScrY1 = -ActWork[pokeact].y + 32;

	TaskTable[id].work[0] = winact;
	TaskTable[id].work[6] = pri_flg;
	TaskTable[id].TaskAdrs = StUpEffectMain;
}

static void StUpEffectMain(u8 id)
{
	u16 palno;
	u8 pokeact;
	WazaBgData wazabg;
	
	TaskTable[id].work[10] += 4;
//	ScrY1 += 4;
	ScrY1 -= 4;
	if(TaskTable[id].work[10] == 64){
		TaskTable[id].work[10] = 0;
//		ScrY1 -= 64;
		ScrY1 += 64;
		if(++TaskTable[id].work[11] == 4){
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
			pokeact = W_GetPokeActNo(0);
			palno = ActWork[pokeact].oamData.Pltt + 16;
			//AffineDelActor(&ActWork[TaskTable[id].work[0]]);
			DelActor(&ActWork[TaskTable[id].work[0]]);
			GetWazaEffBgAdrs(&wazabg);
			DIV_DMACLEAR(3, 0, wazabg.ScrnAdrs, 0x800, 32);
			if(TaskTable[id].work[6] == 1){
				ActWork[PokemonStruct[AttackNo^2]].oamData.Priority++;
			}
			(*(vBgCnt *)REG_BG1CNT).Loop = 0;
			ScrY1 = 0;
			DelTaskEffect(id);
		}
	}
}







//=========================================================================
//
//		ステータス上昇・下降エフェクト
//												by matsuda 2002.05.21(火)
//=========================================================================
static void StatusEffectMain(u8 id);
static void StatusEffectInit(u8 id);
//----------------------------------------------------------
//	offset 0:上昇・下降ﾌﾗｸﾞ(0=上昇、1=下降)
//		   1:どのｽﾃｰﾀｽか(0:攻撃 1:防御 2:命中 3:すばやさ 
//						 4:回避 5:特攻 6:特防 0xff:複合)
//		   2:0=攻撃側に出す	  1=防御側に出す
//		   3:1=相方にも出す	0=相方には出さない
//		   4:0=1段階	1=2段階
//----------------------------------------------------------
#define STATUS_EFF_ADD_Y	3
#define STATUS_EFF_BLDWAIT	1
void StatusEffectTask(u8 id)
{	//1Sync間を空ける
	u8 i;
	for(i = 0; i < 8; i++)
		TaskTable[id].work[i] = WazaEffWork[i];
	TaskTable[id].TaskAdrs = StatusEffectInit;
}

static void StatusEffectInit(u8 id)
{
	u8 pokeact, winact;
	u8 pokeact2=0, winact2=0;
	u16 monsno;
	WazaBgData wazabg;
	u8 client_no;
	u8 aikata = 0;
	s16 work[8];
	int i;
	u8 pri_flg = 0;
	
	for(i = 0; i < 8; i++){
		work[i] = TaskTable[id].work[i];
		TaskTable[id].work[i] = 0;
	}
	
	if(work[2] == 0)
		client_no = AttackNo;
	else
		client_no = DefenceNo;
	aikata = client_no^2;
	
	if(ContestCheck() || (work[3] && PokeBG2taimeCheck(aikata)==0))
		work[3] = 0;
	
	Win0H = 0;
	Win0V = 0;
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
//ﾌﾟﾗｲｵﾘﾃｨが低いﾎﾟｹﾓﾝが対象の場合、隣のﾎﾟｹﾓﾝにｴﾌｪｸﾄがかぶらないようにﾌﾟﾗｲｵﾘﾃｨを上げる
	if(FightCheck() && work[3] == 0)
	{
		if(ClientTypeGet(client_no) == BSS_CLIENT_ENEMY2
			|| ClientTypeGet(client_no) == BSS_CLIENT_MINE)
		{
			if(PokeBG2taimeCheck(aikata) == 1){
				ActWork[PokemonStruct[aikata]].oamData.Priority--;
				(*(vBgCnt *)REG_BG1CNT).Priority = 1;
				pri_flg = 1;
			}
		}
	}
	
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
	if(work[3]){
		pokeact2 = PokemonStruct[aikata];		//W_GetPokeActNo(0);
		winact2 = PokeWinObjMake(aikata, pokeact2, monsno);
	}
	
	//-- 光エフェクト --//
	GetWazaEffBgAdrs(&wazabg);
	//DIV_DMACLEAR(3, 0, wazabg.ScrnAdrs, 0x1000, 32);
	//DecordVram((void*)s_p_psc_ADRS, wazabg.ScrnAdrs);
	if(work[0] == 0)
		DecordVram((void*)s_p_up_psc_ADRS, wazabg.ScrnAdrs);
	else
		DecordVram((void*)s_p_down_psc_ADRS, wazabg.ScrnAdrs);
	if(ContestCheck())
		ScrnPalRewrite(wazabg.PlttNo, (u32)wazabg.ScrnAdrs, 0, 0);
	DecordVram((void*)s_p_pch_ADRS, wazabg.CharAdrs);
	if(work[1] == 0)
		DecordPaletteWork((void*)s_pkoug_pcl_ADRS, wazabg.PlttNo*16, 0x20);
	else if(work[1] == 1)
		DecordPaletteWork((void*)s_pboug_pcl_ADRS, wazabg.PlttNo*16, 0x20);
	else if(work[1] == 2)
		DecordPaletteWork((void*)s_pmei_pcl_ADRS, wazabg.PlttNo*16, 0x20);
	else if(work[1] == 3)
		DecordPaletteWork((void*)s_psuba_pcl_ADRS, wazabg.PlttNo*16, 0x20);
	else if(work[1] == 4)
		DecordPaletteWork((void*)s_pkai_pcl_ADRS, wazabg.PlttNo*16, 0x20);
	else if(work[1] == 5)
		DecordPaletteWork((void*)s_ptkou_pcl_ADRS, wazabg.PlttNo*16, 0x20);
	else if(work[1] == 6)
		DecordPaletteWork((void*)s_ptbou_pcl_ADRS, wazabg.PlttNo*16, 0x20);
	else
		DecordPaletteWork((void*)s_pmult_pcl_ADRS, wazabg.PlttNo*16, 0x20);
	
//	ScrX1 = -ActWork[pokeact].x + 32;
//	ScrY1 = -ActWork[pokeact].y + 32-64;
	ScrX1 = 0;
	ScrY1 = 0;
	if(work[0] == 1){
		ScrX1 += 64;
		TaskTable[id].work[1] = -STATUS_EFF_ADD_Y;
	}
	else
		TaskTable[id].work[1] = STATUS_EFF_ADD_Y;
	
	if(work[4] == 0){
		TaskTable[id].work[4] = 10;//7;	//1段階時のBLDMAX
		TaskTable[id].work[5] = 20;	//wait
	}
	else{
		TaskTable[id].work[4] = 13;//11;	//2段階時のBLDMAX
		TaskTable[id].work[5] = 30;
	}
	
	TaskTable[id].work[0] = winact;
	TaskTable[id].work[2] = work[3];
	TaskTable[id].work[3] = winact2;
	TaskTable[id].work[6] = pri_flg;
	TaskTable[id].work[7] = PokemonStruct[aikata];
	TaskTable[id].TaskAdrs = StatusEffectMain;
	
	if(work[0] == 0)
		SePlayPan(SE_W287, GetSePanAttack(WAZA_SE_L));
	else
		SePlayPan(SE_W287B, GetSePanAttack(WAZA_SE_L));
}

static void StatusEffectMain(u8 id)
{
	ScrY1 += TaskTable[id].work[1];
	switch(TaskTable[id].work[15]){
		case 0:
			if(TaskTable[id].work[11]++ < STATUS_EFF_BLDWAIT)
				break;
			TaskTable[id].work[11] = 0;
			TaskTable[id].work[12]++;
			*(vu16*)REG_BLDALPHA = ((16-TaskTable[id].work[12])<<8) | TaskTable[id].work[12];
			if(TaskTable[id].work[12] == TaskTable[id].work[4])
				TaskTable[id].work[15]++;
			break;
		case 1:
			TaskTable[id].work[10]++;
			if(TaskTable[id].work[10] == TaskTable[id].work[5])
				TaskTable[id].work[15]++;
			break;
		case 2:
			if(TaskTable[id].work[11]++ < STATUS_EFF_BLDWAIT)
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
				//AffineDelActor(&ActWork[TaskTable[id].work[0]]);
				DelActor(&ActWork[TaskTable[id].work[0]]);
				if(TaskTable[id].work[2]){
					//AffineDelActor(&ActWork[TaskTable[id].work[3]]);
					DelActor(&ActWork[TaskTable[id].work[3]]);
				}
				if(TaskTable[id].work[6] == 1){
					ActWork[TaskTable[id].work[7]].oamData.Priority++;
				}
			//	GetWazaEffBgAdrs(&wazabg);
			//	DIV_DMACLEAR(3, 0, wazabg.ScrnAdrs, 0x800, 32);
				(*(vBgCnt *)REG_BG1CNT).Loop = 0;
				DelTaskEffect(id);
			}
			break;
	}
}








//=========================================================================
//	フラッシュ
//
//																	TAYA
//=========================================================================

static void TaskFlashMain(u8 id);
static void flash_sub(u32 fade_bit, u16 col);

void TaskFlash(u8 id)
{
	u32 fade_bit;

	// ﾎﾟｹﾓﾝを全て黒く
	fade_bit = GetPokeFadeBit(1,1,1,1);
	flash_sub(fade_bit, 0x0000);
	TaskTable[id].work[14] = (fade_bit >> 16);

	// 背景を全て白く（ﾌｪｰﾄﾞﾋﾞｯﾄを保存）
	fade_bit = GetBattleFadeBit(1,0,0,0,0,0,0);
	fade_bit &= 0xffff;
	flash_sub(fade_bit, 0xffff);
	TaskTable[id].work[15] = fade_bit;

	TaskTable[id].work[0] = 0;
	TaskTable[id].work[1] = 0;

	TaskTable[id].TaskAdrs = TaskFlashMain;
}

static void TaskFlashMain(u8 id)
{
	TASK_TABLE *my = &TaskTable[id];

	switch(my->work[0]){
	case 0:
		my->work[1]++;
		if(my->work[1] > 6){
			my->work[1] = 0;
			my->work[2] = 16;
			my->work[0]++;
		}
		break;

	case 1:
		if(++(my->work[1]) > 1)
		{
			u16 i;

			my->work[1] = 0;
			my->work[2]--;
			for(i = 0; i < 16; i++)
			{
				if(my->work[15] & (1<<i))
				{
					SoftFade(i*16, 16, my->work[2], 0xffff);
				}
				if(my->work[14] & (1<<i))
				{
					SoftFade(256+i*16, 16, my->work[2], 0x0000);
				}
			}
			if(my->work[2] == 0)
			{
				my->work[0]++;
			}
		}
		break;

	case 2:
		DelTaskEffect(id);
		break;
	}
}

static void flash_sub(u32 fade_bit, u16 col)
{
	u16 i, pal, p;

	for(i = 0; i < 32; i++){
		if(fade_bit & 1){
			pal = i * 16;
			for(p = pal; p < (pal+16); p++){
				PaletteWorkTrans[p] = col;
			}
		}
		fade_bit >>= 1;
	}
}



//----------------------------------------------------------
//	自分以外ﾌｪｰﾄﾞﾘｸｴｽﾄ
//
//	自分以外のポケモンをフェードさせます。
//
// 0:wait
// 1:start_evy
// 2:end_evy
// 3:color1(RGB指定)
//----------------------------------------------------------
void TaskOtherPokemonFade(u8 id)
{
	u32 fade_bit,i;

	for(fade_bit=0,i=0;i<4;i++)
		if(AttackNo!=i)
			fade_bit |= 1<<(i+16);
	for(i=5;i>0;i--) WazaEffWork[i] = WazaEffWork[i-1];
	ColorFadeCommonSeq(id, fade_bit);
}





//=========================================================================
//
//		背景絵のスクロール制御タスク
//
//	後に続くｴﾌｪｸﾄでWAIT_FLAGが使えるように このタスク自体はすぐにDelされます。
//　変わりにここで別のﾀｽｸがAddされて、そのﾀｽｸでｽｸﾛｰﾙ制御を行います。
//	WazaEffWork[7]に終了ｺｰﾄﾞが入ってくるとそのﾀｽｸはDelされるので、
//	忘れずに終了ｺｰﾄﾞを入れるようにしてください。
//												by matsuda 2002.06.12(水)
//=========================================================================
static void HaikeiMapScrMain(u8 id);

//----------------------------------------------------------
//	offset 0:X方向ｽｸﾛｰﾙ速度(下位8ビット少数)	1:Y方向ｽｸﾛｰﾙ速度(下位8ビット少数)
//		   2:敵味方でｽｸﾛｰﾙ方向の反転を行う(0:行わない　1:行う)
//		　 3:終了ｺｰﾄﾞ(WazaEffWork[7]にこの終了ｺｰﾄﾞが入ってきたら終了します)
//----------------------------------------------------------
void HaikeiMapScrTask(u8 id)
{
	u8 task;
	
	HaikeiBGLoopSizeSet(0);	//背景のBGに対して、回り込みﾌﾗｸﾞ、ｻｲｽﾞをｾｯﾄする
	
	task = AddTask(HaikeiMapScrMain, 5);
	if(WazaEffWork[2] && MineEnemyCheck(AttackNo)){
		WazaEffWork[0] = -WazaEffWork[0];
		WazaEffWork[1] = -WazaEffWork[1];
	}
	TaskTable[task].work[1] = WazaEffWork[0];
	TaskTable[task].work[2] = WazaEffWork[1];
	TaskTable[task].work[3] = WazaEffWork[3];
	TaskTable[task].work[0]++;
	DelTaskEffect(id);
}

static void HaikeiMapScrMain(u8 id)
{
	TaskTable[id].work[10] += TaskTable[id].work[1];
	TaskTable[id].work[11] += TaskTable[id].work[2];
	ScrX3 += TaskTable[id].work[10]>>8;
	ScrY3 += TaskTable[id].work[11]>>8;
	TaskTable[id].work[10] &= 0x00ff;	//小数部分を残してｸﾘｱ
	TaskTable[id].work[11] &= 0x00ff;
	
	if(WazaEffWork[7] == TaskTable[id].work[3]){
		ScrX3 = 0;
		ScrY3 = 0;
		HaikeiBGLoopSizeSet(1);
		DelTask(id);	//west.sのADD_TASK命令でAddされたﾀｽｸではないので普通にDel
	}
}


//=========================================================================
//	MineEnemyCheck(AttackNo)の結果の値をWazaEffWork[7]に入れる
//=========================================================================
void MineEnemyChkTask(u8 id)
{
	WazaEffWork[7] = MineEnemyCheck(AttackNo);
	DelTaskEffect(id);
}
//=========================================================================
//	MineEnemyCheck(DefenceNo)の結果の値をWazaEffWork[7]に入れる
//=========================================================================
void MineEnemyChkTask2(u8 id)
{
	WazaEffWork[7] = MineEnemyCheck(DefenceNo);
	DelTaskEffect(id);
}
//=========================================================================
//	味方への攻撃か？ WazaEffWork[7]へ入れる。 0:敵へ  1:味方へ
//=========================================================================
void TaskPartyAttackChk(u8 id)
{
	WazaEffWork[7] = ((AttackNo^2)==DefenceNo);
	DelTaskEffect(id);
}
//==========================================================================
//  攻撃ﾎﾟｹﾓﾝ以外のﾎﾟｹﾓﾝｱｸﾀｰbanishﾌﾗｸﾞを操作する
//  0:banishフラグにセットする値
//==========================================================================
void W_PokeBanishCtrl(u8 id)
{
	u16 i;

	for(i = 0; i < 4; i++){
		if(i != AttackNo && PokeBG2taimeCheck(i)){
			ActWork[PokemonStruct[i]].banish = WazaEffWork[0];
		}
	}
	DelTaskEffect(id);
}













//=========================================================================
//
//		くりぬきエフェクト共通ルーチン
//												by matsuda 2002.07.29(月)
//=========================================================================
static void KurinukiEffectMain(u8 id);
//----------------------------------------------------------
//	id = タスクのID
//	x_sp = X速度	y_sp = Y速度	固定小数
//	put_client = 対象のクライアントNo
//	partner = 1=相方にも出す	0=相方には出さない
//	bld_max = BLD_MAX	bld_wait = BLD_WAIT		max_wait = BLDがMaxに到達してる間のｳｪｲﾄ
//	chr_adrs = キャラのｱﾄﾞﾚｽ	scrn_adrs=ｽｸﾘｰﾝﾃﾞｰﾀのｱﾄﾞﾚｽ	palette_adrs=ﾊﾟﾚｯﾄのｱﾄﾞﾚｽ
//----------------------------------------------------------
void KurinukiEffectSet(u8 id, s16 x_sp, s16 y_sp, u8 put_client, u8 partner, u8 bld_max, u8 bld_wait, u8 max_wait, void *chr_adrs, void *scrn_adrs, void *palette_adrs)
{
	u8 pokeact, winact;
	u8 pokeact2=0, winact2=0;
	u16 monsno;
	WazaBgData wazabg;
	u8 aikata = 0;
	
	aikata = put_client^2;
	
	if(ContestCheck() || (partner && PokeBG2taimeCheck(aikata)==0))
		partner = 0;
	
	Win0H = 0;
	Win0V = 0;
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
		if(MineEnemyCheck(put_client))
			monsno = PokeParaGet(&PokeParaEnemy[SelMonsNo[put_client]], ID_monsno);
		else
			monsno = PokeParaGet(&PokeParaMine[SelMonsNo[put_client]], ID_monsno);
	}

	//-- WinObj --//
	pokeact = PokemonStruct[put_client];		//W_GetPokeActNo(0);
	winact = PokeWinObjMake(put_client, pokeact, monsno);
	if(partner){
		pokeact2 = PokemonStruct[aikata];		//W_GetPokeActNo(0);
		winact2 = PokeWinObjMake(aikata, pokeact2, monsno);
	}
	
	//-- 光エフェクト --//
	GetWazaEffBgAdrs(&wazabg);
	//DIV_DMACLEAR(3, 0, wazabg.ScrnAdrs, 0x1000, 32);
	DecordVram(scrn_adrs, wazabg.ScrnAdrs);
	if(ContestCheck())
		ScrnPalRewrite(wazabg.PlttNo, (u32)wazabg.ScrnAdrs, 0, 0);
		
	DecordVram(chr_adrs, wazabg.CharAdrs);
	DecordPaletteWork(palette_adrs, wazabg.PlttNo*16, 0x20);
	
//	ScrX1 = -ActWork[pokeact].x + 32;
//	ScrY1 = -ActWork[pokeact].y + 32-64;
	ScrX1 = 0;
	ScrY1 = 0;
	TaskTable[id].work[1] = y_sp;
	TaskTable[id].work[4] = bld_max;
	TaskTable[id].work[5] = max_wait;
	TaskTable[id].work[6] = bld_wait;
	
	TaskTable[id].work[0] = winact;
	TaskTable[id].work[2] = partner;
	TaskTable[id].work[3] = winact2;
	TaskTable[id].TaskAdrs = KurinukiEffectMain;
}

static void KurinukiEffectMain(u8 id)
{
	TaskTable[id].work[13] += abs(TaskTable[id].work[1]);
	if(TaskTable[id].work[1] < 0)
		ScrY1 -= TaskTable[id].work[13] >> 8;
	else
		ScrY1 += TaskTable[id].work[13] >> 8;
	TaskTable[id].work[13] &= 0x00ff;
	
	switch(TaskTable[id].work[15]){
		case 0:
			if(TaskTable[id].work[11]++ < TaskTable[id].work[6])
				break;
			TaskTable[id].work[11] = 0;
			TaskTable[id].work[12]++;
			*(vu16*)REG_BLDALPHA = ((16-TaskTable[id].work[12])<<8) | TaskTable[id].work[12];
			if(TaskTable[id].work[12] == TaskTable[id].work[4])
				TaskTable[id].work[15]++;
			break;
		case 1:
			TaskTable[id].work[10]++;
			if(TaskTable[id].work[10] == TaskTable[id].work[5])
				TaskTable[id].work[15]++;
			break;
		case 2:
			if(TaskTable[id].work[11]++ < TaskTable[id].work[6])
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
				//AffineDelActor(&ActWork[TaskTable[id].work[0]]);
				DelActor(&ActWork[TaskTable[id].work[0]]);
				if(TaskTable[id].work[2]){
				//	AffineDelActor(&ActWork[TaskTable[id].work[3]]);
					DelActor(&ActWork[TaskTable[id].work[3]]);
				}
			//	GetWazaEffBgAdrs(&wazabg);
			//	DIV_DMACLEAR(3, 0, wazabg.ScrnAdrs, 0x800, 32);
				(*(vBgCnt *)REG_BG1CNT).Loop = 0;
				DelTaskEffect(id);
			}
			break;
	}
}











//=========================================================================
//
//		現在の地形NoをWazaEffWork[0]にセットする
//												by matsuda 2002.08.01(木)
//=========================================================================
void WorkSetGroundNo(u8 id)
{
	WazaEffWork[0] = GroundNo;
	DelTaskEffect(id);
}



//=========================================================================
//
//	技エフェクト時のパレットをUserWorkに退避する
//
//	WazaEffWork[0]: 0=背景	1=攻撃側ポケモン	2:防御側ポケモン
//	WazaEffWork[1]: パレット16色単位でUserWorkの何本目に送るか
//=========================================================================
void TaskWazaEffectPalPush(u8 id)
{
	u32 work,flag;
	flag = 0;
	if(WazaEffWork[0]==0){
		work = GetBattleFadeBit(1, 0, 0, 0, 0, 0, 0);		//背景のパレットナンバーを取得
		while((work&1)==0){
			work  = work>>1;
			flag++; 
		}
	}else if(WazaEffWork[0]==1){
		flag = AttackNo+16;
	}else if(WazaEffWork[0]==2){
		flag = DefenceNo+16;
	}
	memcpy(&UserWork[WAZAEFF_USERWORK+WazaEffWork[1]*32],&PaletteWork[flag*16],32);
	DelTaskEffect(id);
}

//=========================================================================
//
//	技エフェクト時のパレットをUserWorkに退避する
//
//	WazaEffWork[0]: 0=背景	1=攻撃側ポケモン	2:防御側ポケモン
//	WazaEffWork[1]: パレット16色単位でUserWorkの何本目から戻すか
//=========================================================================
void TaskWazaEffectPalPop(u8 id)
{
	u32 work,flag;
	flag = 0;
	if(WazaEffWork[0]==0){
		work = GetBattleFadeBit(1, 0, 0, 0, 0, 0, 0);		//背景のパレットナンバーを取得
		while((work&1)==0){
			work  = work>>1;
			flag++; 
		}
	}else if(WazaEffWork[0]==1){
		flag = AttackNo+16;
	}else if(WazaEffWork[0]==2){
		flag = DefenceNo+16;
	}
	memcpy(&PaletteWork[flag*16],&UserWork[WAZAEFF_USERWORK+WazaEffWork[1]*32],32);
	DelTaskEffect(id);
}

//=========================================================================
//
//	技エフェクト時のパレットをPaletteWorkTransからPaletteWorkにコピーする
//
//	WazaEffWork[0]: 0=背景	1=攻撃側ポケモン	2:防御側ポケモン
//
//=========================================================================
void TaskWazaEffectPalMoveTrans(u8 id)
{
	u32 work,flag;
	flag = 0;
	if(WazaEffWork[0]==0){
		work = GetBattleFadeBit(1, 0, 0, 0, 0, 0, 0);		//背景のパレットナンバーを取得
		while((work&1)==0){
			work  = work>>1;
			flag++; 
		}
	}else if(WazaEffWork[0]==1){
		flag = AttackNo+16;
	}else if(WazaEffWork[0]==2){
		flag = DefenceNo+16;
	}
	memcpy(&PaletteWork[flag*16],&PaletteWorkTrans[flag*16],32);
	DelTaskEffect(id);
}




//=========================================================================
//
//		コンテストだったらWazaEffWork[7]に1をｾｯﾄする
//												by matsuda 2002.08.28(水)
//=========================================================================
void ContestChkTask(u8 id)
{
	if(ContestCheck())
		WazaEffWork[7] = 1;
	else
		WazaEffWork[7] = 0;
	DelTaskEffect(id);
}



//=========================================================================
//
//		横取り用にAttackNo,DefenceNoをｾｯﾄ
//												by matsuda 2002.08.30(金)
//=========================================================================
void YokodoriClientSet(u8 id)
{
	AttackNo = DefenceClient;
	DefenceNo = TsuikaClient;
	DelTaskEffect(id);
}

//----------------------------------------------------------
//	よこどり：パーティアタックチェック
//	パーティアタック時はWazaEffWork[7]に1が入る。通常時は0
//----------------------------------------------------------
void YokodoriPartyAttackChk(u8 id)
{
	if(MineEnemyCheck(AttackNo) == MineEnemyCheck(DefenceNo))
		WazaEffWork[7] = 1;
	else
		WazaEffWork[7] = 0;
	DelTaskEffect(id);
}


//=========================================================================
//
//		DefenceNoにDefenceClientを入れる(FightEffectで使用)
//												by matsuda 2002.08.30(金)
//=========================================================================
void DefenceNoClientSet(u8 id)
{
	DefenceNo = DefenceClient;
	DelTaskEffect(id);
}


//=========================================================================
//
//		泥棒、欲しがる用の追加効果で発生する袋ｴﾌｪｸﾄ用にAttack、Defenceをｾｯﾄ
//												by matsuda 2002.08.30(金)
//=========================================================================
void AttackDefenceNoSet(u8 id)
{
	AttackNo = AttackClient;
	DefenceNo = TsuikaClient;
	DelTaskEffect(id);
}




//=========================================================================
//	Climemのバニッシュ情報を一時的に強制バニッシュにさせる(元の値は退避)
//	WazaEffWork[7]に0x1000が入ってきたら元に戻す
//=========================================================================
static void AttackClimemWait(u8 id);

void AttackClimemBanish(u8 id)
{
	if(ContestCheck()){
		DelTaskEffect(id);
		return;
	}
	TaskTable[id].work[0] = Climem[AttackNo].act_banish;
	Climem[AttackNo].act_banish = 1;
	TaskTable[id].TaskAdrs = AttackClimemWait;
	WazaEffectCount--;	//WAIT_FLAGが効けるようにｶｳﾝﾀｰはDec
}

static void AttackClimemWait(u8 id)
{
	if(WazaEffWork[7] == 0x1000){
		Climem[AttackNo].act_banish = TaskTable[id].work[0];
		DelTask(id);	//WazaEffectCountは既にDecしてあるので普通にﾀｽｸDel
	}
}

