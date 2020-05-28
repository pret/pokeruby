//=========================================================================
//	
//	ステータス異常エフェクト
//													by matsuda
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
#include "fight.h"
#include "palanm.h"
#include "client.h"

#include "decord.h"
#include "calctool.h"
#include "poketool.h"
#include "task.h"
#include "cli_def.h"
#include "ef_tool.h"
#include "a_status.h"


//----------------------------------------------------------
//	プロトタイプ宣言
//----------------------------------------------------------
static void StatusChangeEffectMain(u8 id);
static void StatusHikariSeq(actWork *Xreg);
static void StatusHikariPutWaitSeq(actWork *Xreg);
static void KooriStatusBldInit(u8 id);
static void KooriStatusBldWait(u8 id);
static void KooriStatusBldEnd(u8 id);
static void KooriStatusEnd(u8 id);

//----------------------------------------------------------
//	データ
//----------------------------------------------------------
extern const CellData WazaEffDataCell[];
extern const PalData WazaEffDataPal[];

//----------------------------------------------------------
//	定数宣言
//----------------------------------------------------------
#define ST_EFF_PRI		4	//ｽﾃｰﾀｽ異常ｴﾌｪｸﾄのｱｸﾀｰﾌﾟﾗｲｵﾘﾃｨ
//どく
#define DOKU_FURIHABA	5
#define DOKU_SEC		3
#define DOKU_DY_SP		0x90
#define DOKU_DY_MAX		(-32)
#define DOKU_WAIT		40
//ねむり
#define NEMURI_FURIHABA	5
#define NEMURI_SEC		3
#define NEMURI_DY_SP	0x90
#define NEMURI_DY_MAX	(-32)
#define NEMURI_X_OFFSET	25
#define NEMURI_WAIT		42
//まひ
#define MAHI_NEXT_WAIT	4	//まひのｱﾆﾒ(角度)を変えるまでのｳｪｲﾄ
#define MAHI_NEXT_COUNT	2	//何回ｱﾆﾒをしたら次の場所に移るか
#define MAHI_WAIT		34	//何もしないでいる時間
#define MAHI_DX0		(-10)
#define MAHI_DY0		(-10)
#define MAHI_DX1		(25)
#define MAHI_DY1		(25)
#define MAHI_DX2		(-10)
#define MAHI_DY2		25
#define MAHI_DX3		25
#define MAHI_DY3		(-10)
//やけど
#define YAKEDO_WAIT		37

//----------------------------------------------------------
//	アクターテーブル
//----------------------------------------------------------
//こおり
static const OAMPatData KooriStatusPatData[] =
{
	{-16, -16, 0, 3, 0, 2},	//ｱｸﾀｰ中心からのXoffs,Yoffs, Shape,Size,CharNoOffs, pri
	{-16, 48, 1, 3, 64, 2},
	{48, -16, 2, 3, 96, 2},
	{48, 48, 0, 2, 128, 2},
};
static const OAMPatSt KooriStatusPat = {4, KooriStatusPatData};

const actHeader ActKooriHeader={
	WAZACHR_ID_KOORI,
	WAZACHR_ID_KOORI,
	&WazaOamDataBldNormal[3],
	DummyActAnmTbl,
	0,
	DummyActAffTbl,
//	SeqKooriStatusBldInit,
	DummyActMove,			// 2002.07.17(水)
};








//=========================================================================
//
//		能力アップ・ダウン エフェクト
//												by matsuda 2002.01.09(水)
//=========================================================================
#define ST_HIKARI_MAX	5
#define ST_HIKARI_SP	0x0100	//固定少数
#define ST_HIKARI_BYOUSP	8
#define ST_HIKARI_LOOP	((52 << 8) / ST_HIKARI_SP)	//((64 << 8) / ST_HIKARI_SP)
#define ST_HIKARI_FURIHABA_X	32
#define ST_HIKARI_FURIHABA_Y	8
#define ST_HIKARI_PUTWAIT	21
#define ST_COLOR_LOOP	2
#define ST_COLOR_WAIT	2
const actHeader StatusHikariHeader={
	WAZACHR_ID_KOUKA,
	WAZACHR_ID_KOUKA,
	&WazaOamDataNormal[0],
	DummyActAnmTbl,
	0,
	DummyActAffTbl,
	StatusHikariPutWaitSeq,
};
//----------------------------------------------------------
//	up_down = 1:能力アップ	0:能力ダウン
//----------------------------------------------------------
u8 StatusChangeEffect(u8 client_no, u8 up_down)
{
	u8 i, pokeact, actno, id;
	
	pokeact = PokemonStruct[client_no];
	id = AddTask(StatusChangeEffectMain, 10);
	
	DecordCellSet((CellData*)&WazaEffDataCell[WAZACHR_ID_KOUKA - WAZACHR_ID_FAST_NUMBER]);
	DecordPalSet((PalData*)&WazaEffDataPal[WAZACHR_ID_KOUKA - WAZACHR_ID_FAST_NUMBER]);

	TaskTable[id].work[0] = client_no;	//パレット番号
	if(up_down)
	{	//能力アップ
		TaskTable[id].work[1] = 0x1f;	//変化後の色
		for(i = 0; i < ST_HIKARI_MAX * 2; i++)
		{
			actno = AddActor(&StatusHikariHeader, ActWork[pokeact].x, 
				ActWork[pokeact].y+32, 0);
			ActWork[actno].work[0] = i * (255/ST_HIKARI_MAX);	//秒
			ActWork[actno].work[1] = -ST_HIKARI_SP;				//速度
			ActWork[actno].banish = 1;
			if(i >= ST_HIKARI_MAX)
				ActWork[actno].work[6] = ST_HIKARI_PUTWAIT;	//遅れて出す光
		}
	}
	else
	{	//能力ダウン
		TaskTable[id].work[1] = 0x7c00;
		for(i = 0; i < ST_HIKARI_MAX * 2; i++)
		{
			actno = AddActor(&StatusHikariHeader, ActWork[pokeact].x, 
				ActWork[pokeact].y-32, 0);
			ActWork[actno].work[0] = i * (255/ST_HIKARI_MAX);
			ActWork[actno].work[1] = ST_HIKARI_SP;
			ActWork[actno].banish = 1;
			if(i >= ST_HIKARI_MAX)
				ActWork[actno].work[6] = ST_HIKARI_PUTWAIT;	//遅れて出す光
		}
	}
	ActWork[actno].work[7] = 1;	//最後に登録されたｱｸﾀｰ(親とする)に印をつけとく
	
	return id;
}

static void StatusChangeEffectMain(u8 id)
{
	if(TaskTable[id].work[2] == ST_COLOR_WAIT)
	{
		TaskTable[id].work[2] = 0;
		
		SoftFade(16*16 + TaskTable[id].work[0]*16,16,
			TaskTable[id].work[4], TaskTable[id].work[1]);
		if(TaskTable[id].work[5] == 0)
		{
			if(++TaskTable[id].work[4] > 8)
			{
				//TaskTable[id].work[4]--;
				TaskTable[id].work[5] ^= 1;
			}
		}
		else
		{
			if(--TaskTable[id].work[4] < 0)
			{
				TaskTable[id].work[4]++;
				TaskTable[id].work[5] ^= 1;
				if(++TaskTable[id].work[3] == ST_COLOR_LOOP)
					DelTask(id);
			}
		}
	}
	else
		TaskTable[id].work[2]++;
}

static void StatusHikariPutWaitSeq(actWork *Xreg)
{
	if(Xreg->work[6] == 0)
	{
		Xreg->banish = 0;
		Xreg->move = StatusHikariSeq;
		Xreg->move(Xreg);
	}
	else
		Xreg->work[6]--;
}

static void StatusHikariSeq(actWork *Xreg)
{
	Xreg->dx = CosMove(Xreg->work[0], ST_HIKARI_FURIHABA_X);
	Xreg->dy = SinMove(Xreg->work[0], ST_HIKARI_FURIHABA_Y);
	Xreg->work[0] < 128 ? (Xreg->pri = C_POKE1PRI-1):(Xreg->pri = C_POKE1PRI+1);

	Xreg->work[0] = 0xff & (Xreg->work[0] + ST_HIKARI_BYOUSP);
	Xreg->work[5] += Xreg->work[1];
	Xreg->dy += Xreg->work[5] >> 8;
	
	if(++Xreg->work[2] == ST_HIKARI_LOOP)
	{
		if(Xreg->work[7])	//最後に登録されたｱｸﾀｰならば一緒にセル、ﾊﾟﾚｯﾄも開放する
			AllDelActor(Xreg);
		else
			DelActor(Xreg);
	}
}









//=========================================================================
//
//		氷エフェクト	west.sから呼ばれる
//												by matsuda 2002.07.17(水)
//=========================================================================
//----------------------------------------------------------
//	「こおり」
//----------------------------------------------------------
void KooriStatusEffectTask(u8 id)
{
	s16 xpos, ypos;
	u8 actno;
	
	xpos = GetWazaEffPos(DefenceNo, PM_X) - 32;
	ypos = GetWazaEffPos(DefenceNo, PM_Y) - 36;//32;
	if(ContestCheck())
		xpos -= 6;	//審判に被らないように

	*(vu16*)REG_BLDCNT = BLD_A_BLEND_MODE | BLD_2ND_ALL;
	*(vu16*)REG_BLDALPHA = 0x0 | (16<<8);

	actno = AddActor(&ActKooriHeader, xpos, ypos, ST_EFF_PRI);
//	ActWork[actno].work[0] = client_no;
	SetActOamPat(&ActWork[actno], &KooriStatusPat);
	
	TaskTable[id].work[15] = actno;
	TaskTable[id].TaskAdrs = KooriStatusBldInit;
}

#define KOORI_PALANM_WAIT	13//25
#define KOORI_PALANM_CHG	3
#define KOORI_BLD			9	//(9*2)
#define KOORI_PALANM_ENDWAIT	(37)
//----------------------------------------------------------
//	半透明でフェードインさせる
//----------------------------------------------------------
static void KooriStatusBldInit(u8 id)
{
	u8 ev;
	
	if(TaskTable[id].work[1]++ == KOORI_BLD)
	{
		TaskTable[id].TaskAdrs = KooriStatusBldWait;
		TaskTable[id].work[1] = 0;
	}
	else
	{
		ev = TaskTable[id].work[1];// / 2;
		*(vu16*)REG_BLDALPHA = ev | ((16-ev)<<8);
	}
}

static void KooriStatusBldWait(u8 id)
{
	u8 palno;
	u16 color;
	
	palno = ObjPalNumGet(WAZACHR_ID_KOORI);
	if(TaskTable[id].work[1]++ > KOORI_PALANM_WAIT)
	{
		if(++TaskTable[id].work[2] == KOORI_PALANM_CHG)
		{
			color = PaletteWorkTrans[16*16+16*palno+0xd];
			PaletteWorkTrans[16*16+16*palno+0xd] = PaletteWorkTrans[16*16+16*palno+0xe];
			PaletteWorkTrans[16*16+16*palno+0xe] = PaletteWorkTrans[16*16+16*palno+0xf];
			PaletteWorkTrans[16*16+16*palno+0xf] = color;
			TaskTable[id].work[2] = 0;
			if(++TaskTable[id].work[3] == 3)
			{
				TaskTable[id].work[3] = 0;
				TaskTable[id].work[1] = 0;
				if(++TaskTable[id].work[4] == 2)
				{
					TaskTable[id].work[1] = KOORI_BLD;
					TaskTable[id].TaskAdrs = KooriStatusBldEnd;
				}
			}
		}
	}
}

static void KooriStatusBldEnd(u8 id)
{
	u8 ev;
	
	if(TaskTable[id].work[1]-- == 0)
	{
		TaskTable[id].TaskAdrs = KooriStatusEnd;
		TaskTable[id].work[1] = 0;
	}
	else
	{
		ev = TaskTable[id].work[1];// / 2;
		*(vu16*)REG_BLDALPHA = ev | ((16-ev)<<8);
	}
}

static void KooriStatusEnd(u8 id)
{
	u8 client_no;
	u8 actno;
	
	client_no = DefenceNo;
	TaskTable[id].work[1]++;
	if(TaskTable[id].work[1] == KOORI_PALANM_ENDWAIT)
	{
		actno = TaskTable[id].work[15];
		AffineDelActor(&ActWork[actno]);
		DelActor(&ActWork[actno]);
	}
	else if(TaskTable[id].work[1] == KOORI_PALANM_ENDWAIT+2){
		*(vu16*)REG_BLDCNT = 0;
		*(vu16*)REG_BLDALPHA = 0;
		DelTaskEffect(id);
		//CliSys[client_no].status_eff = 0;
	}
}










//=========================================================================
//
//		ステータス上昇・下降エフェクト	west.sから呼ばれる
//												by matsuda 2002.07.18(木)
//=========================================================================
enum{
	KOUGEKI = 0,
	BOUGYO,
	MEITYUU,
	SPEED,
	KAIHI,
	TOKUKOU,
	TOKUBOU,
	FUKUGOU = 0xff,
};
enum{
	UP,
	DOWN,
};

extern void StatusEffectTask(u8 id);

void FeStatusEffectTask(u8 id)
{
	u8 updown, type, dankai = 0;
//	u8 target;
	
	switch(BtlWork->work[0]){
		case COND2_POWUP:				//攻撃力アップ
			updown = UP;	type = KOUGEKI;
			break;
		case COND2_DEFUP:				//防御力アップ
			updown = UP;	type = BOUGYO;
			break;
		case COND2_AGIUP:				//素早さアップ
			updown = UP;	type = SPEED;
			break;
		case COND2_SPEPOWUP:			//特攻アップ
			updown = UP;	type = TOKUKOU;
			break;
		case COND2_SPEDEFUP:			//特防アップ
			updown = UP;	type = TOKUBOU;
			break;
		case COND2_HITUP:				//命中率アップ
			updown = UP;	type = MEITYUU;
			break;
		case COND2_AVOIDUP:				//回避率アップ
			updown = UP;	type = KAIHI;
			break;
		
		case COND2_POWDOWN:				//攻撃力ダウン
			updown = DOWN;	type = KOUGEKI;
			break;
		case COND2_DEFDOWN:				//防御力ダウン
			updown = DOWN;	type = BOUGYO;
			break;
		case COND2_AGIDOWN:				//素早さダウン
			updown = DOWN;	type = SPEED;
			break;
		case COND2_SPEPOWDOWN:			//特攻ダウン
			updown = DOWN;	type = TOKUKOU;
			break;
		case COND2_SPEDEFDOWN:			//特防ダウン
			updown = DOWN;	type = TOKUBOU;
			break;
		case COND2_HITDOWN:				//命中率ダウン
			updown = DOWN;	type = MEITYUU;
			break;
		case COND2_AVOIDDOWN:			//回避率ダウン
			updown = DOWN;	type = KAIHI;
			break;
			
		case COND2_POWUP2:				//攻撃力アップ(2段階)
			updown = UP;	type = KOUGEKI;	dankai = 1;
			break;
		case COND2_DEFUP2:				//防御力アップ(2段階)
			updown = UP;	type = BOUGYO;	dankai = 1;
			break;
		case COND2_AGIUP2:				//素早さアップ(2段階)
			updown = UP;	type = SPEED;	dankai = 1;
			break;
		case COND2_SPEPOWUP2:			//特攻アップ(2段階)
			updown = UP;	type = TOKUKOU;	dankai = 1;
			break;
		case COND2_SPEDEFUP2:			//特防アップ(2段階)
			updown = UP;	type = TOKUBOU;	dankai = 1;
			break;
		case COND2_HITUP2:				//命中率アップ(2段階)
			updown = UP;	type = MEITYUU;	dankai = 1;
			break;
		case COND2_AVOIDUP2:				//回避率アップ(2段階)
			updown = UP;	type = KAIHI;	dankai = 1;
			break;

		case COND2_POWDOWN2:				//攻撃力ダウン
			updown = DOWN;	type = KOUGEKI;	dankai = 1;
			break;
		case COND2_DEFDOWN2:				//防御力ダウン
			updown = DOWN;	type = BOUGYO;	dankai = 1;
			break;
		case COND2_AGIDOWN2:				//素早さダウン
			updown = DOWN;	type = SPEED;	dankai = 1;
			break;
		case COND2_SPEPOWDOWN2:			//特攻ダウン
			updown = DOWN;	type = TOKUKOU;	dankai = 1;
			break;
		case COND2_SPEDEFDOWN2:			//特防ダウン
			updown = DOWN;	type = TOKUBOU;	dankai = 1;
			break;
		case COND2_HITDOWN2:				//命中率ダウン
			updown = DOWN;	type = MEITYUU;	dankai = 1;
			break;
		case COND2_AVOIDDOWN2:			//回避率ダウン
			updown = DOWN;	type = KAIHI;	dankai = 1;
			break;
		
		//複合
//		case COND2_GENSHINOCHIKARA:
//			updown = UP;	type = FUKUGOU;	dankai = 0;
//			break;
		case COND2_MULTIUP:
			updown = UP;	type = FUKUGOU;	dankai = 0;
			break;
		case COND2_MULTIUP2:
			updown = UP;	type = FUKUGOU;	dankai = 1;
			break;
		case COND2_MULTIDOWN:
			updown = DOWN;	type = FUKUGOU;	dankai = 0;
			break;
		case COND2_MULTIDOWN2:
			updown = DOWN;	type = FUKUGOU;	dankai = 1;
			break;
		default:
			DelTaskEffect(id);
			return;
	}

	WazaEffWork[0] = updown;
	WazaEffWork[1] = type;
	WazaEffWork[2] = 0;
	WazaEffWork[3] = 0;
	WazaEffWork[4] = dankai;
	TaskTable[id].TaskAdrs = StatusEffectTask;
	TaskTable[id].TaskAdrs(id);
}







//=========================================================================
//
//		仮で技エフェクトの追加効果エフェクトと同じものをあてる
//												by matsuda 2002.05.30(木)
//=========================================================================
extern u32 StatusEffSeqTbl[];

static void StatusEffectEndCheck(u8 id);

void SetStatusEffect(u8 client_no, u8 condition_no)
{
	u8 id;
	
	AttackNo = client_no;
	DefenceNo = client_no;
	
	WazaEffectCommonSet(StatusEffSeqTbl, condition_no, 0);
	id = AddTask(StatusEffectEndCheck, 10);
	TaskTable[id].work[0] = client_no;
}

static void StatusEffectEndCheck(u8 id)
{
	WazaEffectSequence();
	if(WazaEffectFlag == 0){
		CliSys[TaskTable[id].work[0]].status_eff = 0;
		DelTask(id);
	}
}

