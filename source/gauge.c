//----------------------------------------------------------
//
//	ライフバー計算･表示				by matsuda
//
//----------------------------------------------------------
#include "common.h"
#include "actor.h"
#include "actanm.h"
#include "madefine.h"
#include "ef_tool.h"
#include "calctool.h"
#include "gauge.h"

#include "cli_def.h"
#include "decord.h"
#include "cli_num.h"
#include "client_t.h"
#include "print.h"
#include "poketool.h"
#include "client.h"
#include "bss.h"
#include "fight.h"
#include "zukan.h"
#include "server.h"
#include "d_matsu.h"
#include "task.h"

#include "wazatool.h"		//add by soga 2001.09.26
#include "trainer.h"
#include "param.h"
#include "ev_fight.h"
#include "p_status.h"
#include "fightmsg.h"
#include "safari.h"
#include "palanm.h"
#include "monsno.def"
#include "mus_tool.h"

//----------------------------------------------------------
//	プロトタイプ宣言
//----------------------------------------------------------
//s16 GaugeBG(GaugeDataBG *gdata, u16 *HP_Work, u16 *TransPos, u16 *pl_buf);
s16 GaugeBG(GaugeDataBG *gdata, s32 *HP_Work, u16 *TransPos, u16 *pl_buf);
//static void GaugeProcSub(u16 *HP_Work);
//void PutGaugeBG(s16 MaxHP, s16 AfterHP, s16 resultHP, u16 *TransPos, u16 TopChr);
//void PutGaugeBG(GaugeDataBG *gdata, s16 AfterHP, s16 resultHP, u16 *TransPos, u8 Bunsi);
static void PutGaugeBG(GaugeDataBG *gdata, s32 *HP_Work, u16 *TransPos);
static u8 GaugeColChk(s16 MaxHP, s16 resultHP, u16 *pl_buf);
//void PutHPNumber(s16 MaxHP, s16 resultHP, u16 *TransPos);
//void PutNumber(s16 number, u16 *TransPos, u8 yose);

//static void PutGaugeOBJ(GaugeDataOBJ *gdata, GaugeDataOBJ2 *gdata2, u8 Bunsi, u8);
//static s8 PutGaugeProc(GaugeDataOBJ *gdata, GaugeDataOBJ2 *gdata2, u8,u8 *, u8);
//static void GaugeProc(GaugeDataOBJ *gdata, GaugeDataOBJ2 *gdata2, s8 Direction);
//void PutGaugeOBJ(GaugeDataOBJ *gdata, u8 req);
void PutGaugeOBJ(u8 , u8);

//static u8 PutGaugeProc(s16 MaxHP, s16 NowHP, s16 beHP, s32 *HP_Work,
//	 u8 *gauge_chr0, u8 GaugeMax);
//static s16 GaugeProc(s16 MaxHP, s16 NowHP, s16 beHP, s32 *HP_Work, u8 GaugeMax, u16);
static u8 PutGaugeProc(s32 MaxHP, s32 NowHP, s32 beHP, s32 *HP_Work,
	 u8 *gauge_chr, u8 GaugeMax);
static s32 GaugeProc(s32 MaxHP, s32 NowHP, s32 beHP, s32 *HP_Work, u8 GaugeMax, u16 add_dec);

//static void PutGaugePokeList(GaugeDataOBJ *gdata, GaugeDataOBJ2 *gdata2, u8 Bunsi);
//static void ArrowTipSeq(actWork *Xreg);
static void GaugePartsSeq(actWork *Xreg);
static void GaugeSubSeq(actWork *Xreg);
u8 *GetGaugePartsAdrs(u8 parts_id);
//s16 GaugeOBJ(u8 actno, u8 req_data, u16 *pl_buf);
s32 GaugeOBJ(u8 client_no, u8 actno, u8 req_data, u16 *pl_buf);
//static u8 DottoOffsetCalc(s16 nowHP, s16 beHP, s16 MaxHP, u8 GaugeMax);
static u8 DottoOffsetCalc(s32 nowHP, s32 beHP, s32 MaxHP, u8 GaugeMax);
void TemotiBallOff(u8 id);
static void TemotiGaugeSeq(actWork *xreg);
static void TemotiBallSeq(actWork *xreg);
static u8 GetCondID(u8 cond_id, u8 client_no);
void GaugeHPTrans2vs2(u8 actno, s16 hp, u8 flg);
void GaugeStatusTrans(u8 actno);
static void TemotiBallOffMain(u8 id);
static void TemotiBallOutSeq(actWork *xreg);
static void TemotiGaugeOutSeq(actWork *xreg);
static void TemotiBallOffSyokai(u8 id);
static void TemotiBallOffSyokaiEnd(u8 id);
static void TemotiBallNormalSeq(actWork *xreg);

extern	TALK_WIN	FightMsg;
//extern	u8	FightMsgBuf[64];
//extern	const	u8	PokeNameData[][6];
extern int BGNo;	//※暫定
extern const u32 GrowTbl[][101];

//----------------------------------------------------------
//	サブルーチン
//----------------------------------------------------------

//----------------------------------------------------------
//	定数定義
//----------------------------------------------------------
#define DEBUG_DAKUTEN	0//8		//※暫定  8ｷｬﾗ分進めることで名前の文字の下に隠す
#define GAUGE_SOKUDO_TYPE	1	//ｹﾞｰｼﾞの動きかた(0:減速していく、1:常に一定速度)

//-------------------- ｹﾞｰｼﾞのﾄｯﾌﾟｷｬﾗﾅﾝﾊﾞｰ ----------------------------------
#define G_NUM_TOPCHR	20		//数字ﾄｯﾌﾟｷｬﾗ(0,1,2,3,4,5,6,7,8,9 の順で並んでること)
#define G_SPACE_CHR		30		//ｽﾍﾟｰｽ

//----------------------- 絵 --------------------------------
#define GAUGE_DOTTO		8	//ｹﾞｰｼﾞ1ｷｬﾗ8ﾄﾞｯﾄ  ※8ﾄﾞｯﾄ固定
#define GAUGE_MAX		6//8	//ｹﾞｰｼﾞｷｬﾗｸﾀｰ数 両端の絵の部分(2ｷｬﾗ分)除く
#define GAUGE_PARSENT	(GAUGE_DOTTO * GAUGE_MAX)
#define GAUGE_DOTTOMAX	(GAUGE_DOTTO * GAUGE_MAX)

//--------------------- 動き -------------------------
#define DEFAULT_DOWN_PARAM	7//12		//最初の下げ率 (MAX:15) ※ｹﾞｰｼﾞの進むｽﾋﾟｰﾄﾞ
#define KAISOU				DEFAULT_DOWN_PARAM	//何段階下げ率か
					//↑(DEFAULT_DOWN_PARAM以外の値も指定できるが、同じ数字の方がなめらか)
#define DOWN_BUNSI_PARAM	1	//1度に下げていく下げ率
#define DEFAULT_BUNBO		255	//数字が大きいほどｹﾞｰｼﾞがきめこまかく動く(MAX:255)
#define FAST_END			120	//分子がこの数字に達するとｽﾋﾟｰﾄﾞを下げていく

#define NEXT_BUNSI1			(DEFAULT_BUNBO - FAST_END)	//初回から次に移るまでの時間
#define BUNSI_HABA			(FAST_END / KAISOU)	//ｽﾋﾟｰﾄﾞを下げていくときの分子幅

//----------------------- 色 --------------------------------
#define COLOR_POS		159	//ｹﾞｰｼﾞで使用しているﾊﾟﾚｯﾄ位置 (0～255)
#define NORMAL_PARSENT	50	// ﾊﾟｰｾﾝﾃｰｼﾞで記入 45と書いていれば45%以上だとNORMAL状態
#define PINCH_PARSENT	25
#define DANGER_PARSENT	0

#define NORMAL_COLOR	0x7c00	//HPがNORMAL_PARSENT以上の時のｶﾗｰﾃﾞｰﾀ
#define PINCH_COLOR		0x03e0
#define DANGER_COLOR	0x001f

#define ARROW_NEXT_WAIT		40
#define ARROW_NEXT_WAIT2	(ARROW_NEXT_WAIT + 20)

//----------------------------------------------------------
//	誰のｹﾞｰｼﾞﾊﾟｰﾂか
//----------------------------------------------------------
#define MINE_PARTS_1VS1		0
#define MINE_PARTS_2VS2		1
#define ENEMY_PARTS			2

//----------------------------------------------------------
//	データ
//----------------------------------------------------------
//#include "..\scaddata\gauge5b.ach"
#include "gauge.dat"



//==================================================================
//	ゲージの色をﾁｪｯｸして変更
// 引数 : 	gdata->MaxHP:最大HP	AfterHP:ﾀﾞﾒｰｼﾞ後(HPの変更を受けた後)のHP
// 戻り値 : ﾊﾟﾚｯﾄNo(0～15)
//==================================================================
static u8 GaugeColChk(s16 MaxHP, s16 resultHP, u16 *pl_buf)
{
	s16 HP_power;
	u16 color;
	
	HP_power = 100 * (resultHP) / MaxHP;	//resultHPが所有するHPの割合
	
	if(NORMAL_PARSENT < HP_power)
	{
		color = NORMAL_COLOR;
	}
	else if(PINCH_PARSENT < HP_power)
	{
		color = PINCH_COLOR;
	}
	else
	{
		color = DANGER_COLOR;
	}
	
	//SoftFade(pl_buf, 0x0000, COLOR_POS, 1, 16, color);
	return (COLOR_POS >> 4);
}


//==================================================================
//	数字表示
// 引数 : number : 表示する数字(BUFF_MAX桁まで)
//		  *TransPos : 表示する場所(ｽｸﾘｰﾝﾃﾞｰﾀ上の)
//		  gdata->G_NUM_TOPCHR {0,1,2,3,4,5,6,7,8,9}  数字のｷｬﾗﾃﾞｰﾀがあるｷｬﾗｸﾀｰﾈｰﾑ番号
//		  SpcChr : ｽﾍﾟｰｽのｷｬﾗｸﾀｰﾈｰﾑ番号
//		  yose : 0 = 右詰め表示   1 = 左詰め表示
// 戻り値 : なし
//==================================================================
#define BUFF_MAX	4	//最大桁
#define SCREEN_X_SIZE	256	//ｽｸﾘｰﾝXｻｲｽﾞ
#define SCREEN_X	(SCREEN_X_SIZE / 8)	//1ライン上のｽｸﾘｰﾝﾃﾞｰﾀ数

#if 1	//==========================================================
//フォントサイズ8x16用
void PutNumber(s16 number, u16 *TransPos, u8 yose)
{
	s8 count;	//for文でﾏｲﾅｽの値を使用するのでsingedでやること
	s8 pos;
	u8 buff[BUFF_MAX];
	
	for(count = 0; count < BUFF_MAX; count++)
	{
		buff[count] = 0;
	}
	count = BUFF_MAX-1;
	
	while(1)
	{
		if(number > 0)
		{
			buff[count] = number % 10;
			number /= 10;
			count--;
		}
		else
		{
			for(; count > -1; count--)
			{
				buff[count] = 0xff;	//ﾀﾞﾐｰﾃﾞｰﾀ
			}
			if(buff[BUFF_MAX-1] == 0xff)
			{
				buff[BUFF_MAX-1] = 0;	//全部ﾀﾞﾐｰﾃﾞｰﾀだった場合は0を表示させる
			}
			break;
		}
	}
	
	if(yose == 0)
	{				//右詰め
		for(count = 0, pos = 0; count < BUFF_MAX; count++)
		{
			if(buff[pos] == 0xff)
			{
				TransPos[pos] &= 0xfc00;
				TransPos[pos] |= G_SPACE_CHR;

				TransPos[count + SCREEN_X] &= 0xfc00;
				TransPos[count + SCREEN_X] |= G_SPACE_CHR;
			}
			else
			{
				TransPos[pos] &= 0xfc00;
				TransPos[pos] |= (G_NUM_TOPCHR + buff[pos]);

				TransPos[count + SCREEN_X] &= 0xfc00;
				TransPos[count + SCREEN_X] |= (G_NUM_TOPCHR + buff[count] + 0x20);
			}
			pos++;
		}
	}
	else
	{				//左詰め
		for(count = 0; count < BUFF_MAX; count++)
		{
			if(buff[count] == 0xff)
			{
				TransPos[count] &= 0xfc00;
				TransPos[count] |= G_SPACE_CHR;

				TransPos[count + SCREEN_X] &= 0xfc00;
				TransPos[count + SCREEN_X] |= G_SPACE_CHR;
			}
			else
			{
				TransPos[count] &= 0xfc00;
				TransPos[count] |= (G_NUM_TOPCHR + buff[count]);

				TransPos[count + SCREEN_X] &= 0xfc00;
				TransPos[count + SCREEN_X] |= (G_NUM_TOPCHR + buff[count] + 0x20);
			}
		}
	}
}

#else	//============================================================
// フォントサイズ8x8用
void PutNumber(s16 number, u16 *TransPos, u8 yose)
{
	s8 count;	//for文でﾏｲﾅｽの値を使用するのでsingedでやること
	s8 pos;
	u8 buff[BUFF_MAX];
	
	for(count = 0; count < BUFF_MAX; count++)
	{
		buff[count] = 0;
	}
	count = BUFF_MAX-1;
	
	while(1)
	{
		if(number > 0)
		{
			buff[count] = number % 10;
			number /= 10;
			count--;
		}
		else
		{
			for(; count > -1; count--)
			{
				buff[count] = 0xff;	//ﾀﾞﾐｰﾃﾞｰﾀ
			}
			if(buff[BUFF_MAX-1] == 0xff)
			{
				buff[BUFF_MAX-1] = 0;	//全部ﾀﾞﾐｰﾃﾞｰﾀだった場合は0を表示させる
			}
			break;
		}
	}
	
	if(yose == 0)
	{				//右詰め
		for(count = 0, pos = 0; count < BUFF_MAX; count++)
		{
			if(buff[pos] == 0xff)
			{
				TransPos[pos] &= 0xfc00;
				TransPos[pos] |= G_SPACE_CHR;
			}
			else
			{
				TransPos[pos] &= 0xfc00;
				TransPos[pos] |= (G_NUM_TOPCHR + buff[pos]);
			}
			pos++;
		}
	}
	else
	{				//左詰め
		for(count = 0; count < BUFF_MAX; count++)
		{
			if(buff[count] == 0xff)
			{
				TransPos[count] &= 0xfc00;
				TransPos[count] |= G_SPACE_CHR;
			}
			else
			{
				TransPos[count] &= 0xfc00;
				TransPos[count] |= (G_NUM_TOPCHR + buff[count]);
			}
		}
	}
}
#endif	//========================================================

void PutHPNumber(s16 MaxHP, s16 resultHP, u16 *TransPos)
{
	TransPos[4] = G_SPACE_CHR;
	PutNumber(resultHP, TransPos, 0);
	PutNumber(MaxHP, TransPos + 5, 1);
}


























//=========================================================================
//	以下 OBJ用
//=========================================================================
//==================================================================
// ｹﾞｰｼﾞのｷｬﾗは [,0,1,2,3,4,5,6,7,8,], の順に並んで登録されてること
//==================================================================


//=========================================================================
//	バトルゲージ
// ｱｸﾀｰ1のﾜｰｸ : user や ｱｸﾀｰ2のactno 等 ｼｽﾃﾑ関係
// ｱｸﾀｰ2のﾜｰｸ : ｹﾞｰｼﾞ用ﾃﾞｰﾀ
//=========================================================================
//----------------------------------------------------------
//	ｹﾞｰｼﾞで使用するｱｸﾀｰ(OBJ)をまとめてAddActorする
//
// 引数: user = 誰のｹﾞｰｼﾞか(0:味方1、1:味方2、2:敵1、3:敵2)
// 戻り値:1番目のｱｸﾀｰ配列番号(2番目のｱｸﾀｰ配列番号は1番目のｱｸﾀｰのwork7に入ってる)
//		  work[5]にはﾊﾟｰﾂのactnoが入る
//        work[6]にはuser,work[7]にはｹﾞｰｼﾞのｶｰｿﾙのactnoが入る(別ﾙｰﾁﾝで)
//----------------------------------------------------------
u8 GaugeActorSet(u8 client_no)
{
	u8 gauge, gauge2, parts;
	u8 parts_offs = 0;
	
	if(FightCheck() == 0)
	{
	#if GAUGE_CHANGE
		gauge = AddActor(&GaugeMineHeader[0], 240, 160, GAUGE_ACT_PRI);
		if(MineEnemyCheck(client_no) == SIDE_MINE)
			SetActOamPat(&ActWork[gauge], &GaugePatMine[0]);
		else
			SetActOamPat(&ActWork[gauge], &GaugePatEnemy[0]);
	#else
		if(MineEnemyCheck(client_no) == SIDE_MINE)
		{
			gauge = AddActor(&GaugeMineHeader[0], 240, 160, GAUGE_ACT_PRI);
			gauge2 = AddActorBottom(&GaugeMineHeader[0], 240, 160, GAUGE_ACT_PRI);
			ActWork[gauge].oamData.Shape = 0;
			ActWork[gauge2].oamData.Shape = 0;
			ActWork[gauge2].oamData.CharNo += 64;
			parts_offs = MINE_PARTS_1VS1;
		}
		else
		{
			gauge = AddActor(&GaugeEnemyHeader[0], 240, 160, GAUGE_ACT_PRI);
			gauge2 = AddActorBottom(&GaugeEnemyHeader[0], 240, 160, GAUGE_ACT_PRI);
			ActWork[gauge2].oamData.CharNo += 32;
			parts_offs = ENEMY_PARTS;
		}
		ActWork[gauge].oamData.AffineParam = gauge2;	//右側のｱｸﾀｰのActNo
		ActWork[gauge2].work[5] = gauge;	//本体のActNo
		ActWork[gauge2].move = GaugeSubSeq;
	#endif
	}
	else
	{
		if(MineEnemyCheck(client_no) == SIDE_MINE)
		{
			gauge = AddActor(&GaugeMineHeader[ClientTypeGet(client_no) >> 1],
				 240, 160, GAUGE_ACT_PRI);
		#if GAUGE_CHANGE
			SetActOamPat(&ActWork[gauge], &GaugePatMine[1]);
		#else
			gauge2 = AddActorBottom(&GaugeMineHeader[ClientTypeGet(client_no) >> 1],
				 240, 160, GAUGE_ACT_PRI);
			ActWork[gauge].oamData.AffineParam = gauge2;
			ActWork[gauge2].work[5] = gauge;	//本体のActNo
			ActWork[gauge2].oamData.CharNo += 32;
			ActWork[gauge2].move = GaugeSubSeq;
			parts_offs = MINE_PARTS_2VS2;
		#endif
		}
		else
		{
			gauge = AddActor(&GaugeEnemyHeader[ClientTypeGet(client_no) >> 1], 
				240, 160, GAUGE_ACT_PRI);
		#if GAUGE_CHANGE
			SetActOamPat(&ActWork[gauge], &GaugePatEnemy[1]);
		#else
			gauge2 = AddActorBottom(&GaugeEnemyHeader[ClientTypeGet(client_no) >> 1], 
				240, 160, GAUGE_ACT_PRI);
			ActWork[gauge].oamData.AffineParam = gauge2;
			ActWork[gauge2].work[5] = gauge;	//本体のActNo
			ActWork[gauge2].oamData.CharNo += 32;
			ActWork[gauge2].move = GaugeSubSeq;
			parts_offs = ENEMY_PARTS;
		#endif
		}
	}
	parts = AddActorBottom(&GaugePartsHeader[ClientType[client_no]], 140, 60, HP_GAUGE_ACT_PRI);
	SetActOamPat(&ActWork[parts], &GaugePatParts[MineEnemyCheck(client_no)]);
	ActWork[parts].oampat_sw = OAMPAT_PRIUNIT;	//ﾊｰﾄﾞﾌﾟﾗｲｵﾘﾃｨ全共通 2002.07.04(木)
	ActWork[parts].oamData.Priority = GAUGE_OAM_PRI;
//	DIV_DMACOPY(3, GetGaugePartsAdrs(GP_HP), (ActWork[parts].oamData.CharNo << 5)
//		+ OBJ_MODE0_VRAM, 0x40, 32);
	CpuCopy(GetGaugePartsAdrs(GP_HP), (ActWork[parts].oamData.CharNo << 5)
		+ OBJ_MODE0_VRAM, 0x40, 32);
	
	ActWork[gauge].work[5] = parts;		//ﾊﾟｰﾂのActNo
	ActWork[gauge].work[6] = client_no;	//所有者
//	ActWork[gauge].work[7] = 0;	 2対2の時、現在表示しているのはｹﾞｰｼﾞか、数値か
	ActWork[gauge].banish = 1;
	ActWork[gauge2].banish = 1;
	
	ActWork[parts].work[5] = gauge;		//本体のActNo
	ActWork[parts].work[6] = parts_offs;
	ActWork[parts].banish = 1;
	return gauge;
}

//add by soga 2002.06.01
u8 GaugeActorSetSafari(void)
{
	u8 gauge, gauge2;
	
	gauge = AddActor(&GaugeSafariHeader, 240, 160, GAUGE_ACT_PRI);
	gauge2 = AddActorBottom(&GaugeSafariHeader, 240, 160, GAUGE_ACT_PRI);
	ActWork[gauge].oamData.Shape = 0;
	ActWork[gauge2].oamData.Shape = 0;
	ActWork[gauge2].oamData.CharNo += 64;
	ActWork[gauge].oamData.AffineParam = gauge2;	//右側のｱｸﾀｰのActNo
	ActWork[gauge2].work[5] = gauge;	//本体のActNo
	ActWork[gauge2].move = GaugeSubSeq;

	return gauge;
}

//----------------------------------------------------------
//	ゲージパーツのｷｬﾗのｱﾄﾞﾚｽを取り出す
//----------------------------------------------------------
u8 *GetGaugePartsAdrs(u8 parts_id)
{
	u16 charno;
	
	charno = parts_id * 0x20;
//	return (u8*)&gauge5b_Character[charno];
	return (u8*)(gauge5b_pch_ADRS+charno);
}


//----------------------------------------------------------
//	ゲージパーツのシーケンス
//----------------------------------------------------------
static void GaugePartsSeq(actWork *Xreg)
{
	u8 hontai;
	
	hontai = Xreg->work[5];
	switch(Xreg->work[6])
	{
		case MINE_PARTS_1VS1:
			Xreg->x = ActWork[hontai].x + 16;	//24;
			Xreg->y = ActWork[hontai].y + 0;	//16;
			break;
		case MINE_PARTS_2VS2:
			Xreg->x = ActWork[hontai].x + 16;	//24;
			Xreg->y = ActWork[hontai].y + 0;	//16;
			break;
		case ENEMY_PARTS:
		default:
			Xreg->x = ActWork[hontai].x + 8;	//24;
			Xreg->y = ActWork[hontai].y + 0;	//16;
	}
	Xreg->dx = ActWork[hontai].dx;
	Xreg->dy = ActWork[hontai].dy;
}

//----------------------------------------------------------
//	本体右側のシーケンス
//----------------------------------------------------------
static void GaugeSubSeq(actWork *Xreg)
{
	u8 hontai;
	
	hontai = Xreg->work[5];
	Xreg->x = ActWork[hontai].x +64;
	Xreg->y = ActWork[hontai].y;
	Xreg->dx = ActWork[hontai].dx;
	Xreg->dy = ActWork[hontai].dy;
}



//----------------------------------------------------------
//						※ｹﾞｰｼﾞOBJ専用
//	ｹﾞｰｼﾞをOBJで出す場合はGaugeDataを引数として渡したりしないで
//  この関数を呼んでデータをｾｯﾄする
//
// 引数:client_no
//	   :actno = ゲージのActNo
//     :beHP = 増減する値
//	   :ｹﾞｰｼﾞがｱｸﾀｰのﾄｯﾌﾟの位置から何ｷｬﾗｸﾀｰ離れた位置からあるか
//     :req_data = 何のﾃﾞｰﾀか(0:HP 1:Exp)
//----------------------------------------------------------
void GaugeDataSet(u8 client_no, u8 actno, s32 MaxHP, s32 NowHP, s32 beHP)
{
	gwork[client_no].actno = actno;
	gwork[client_no].MaxHP = MaxHP;
	gwork[client_no].NowHP = NowHP;
	gwork[client_no].beHP = beHP;
#if GAUGE_SOKUDO_TYPE
	gwork[client_no].HP_Work = HP_WORK_INIT_VALUE;
#else
	gwork[client_no].HP_Work = 0;		//HP_Work初期化
#endif
}

//----------------------------------------------------------
//	ｹﾞｰｼﾞ表示OFF
// actno = 監視用ｱｸﾀｰの配列番号
//----------------------------------------------------------
void GaugeOFF(u8 actno)
{
	ActWork[actno].banish = 1;
	ActWork[ActWork[actno].work[5]].banish = 1;
#if GAUGE_CHANGE == 0
	ActWork[ActWork[actno].oamData.AffineParam].banish = 1;
#endif
}
//----------------------------------------------------------
//	ｹﾞｰｼﾞ表示ON
// actno = 監視用ｱｸﾀｰの配列番号
//----------------------------------------------------------
void GaugeON(u8 actno)
{
	ActWork[actno].banish = 0;
	ActWork[ActWork[actno].work[5]].banish = 0;
#if GAUGE_CHANGE == 0
	ActWork[ActWork[actno].oamData.AffineParam].banish = 0;
#endif
}
//----------------------------------------------------------
//	ｹﾞｰｼﾞ表示位置設定
//----------------------------------------------------------
void GaugePosSet(u8 actno, s16 xpos, s16 ypos)
{
	ActWork[actno].x = xpos;
	ActWork[actno].y = ypos;
//	ActWork[ActWork[actno].work[7]].x = xpos;// + 64;	// + xxx = ﾄﾞｯﾄ数
//	ActWork[ActWork[actno].work[7]].y = ypos+32-8;
}
//----------------------------------------------------------
//	ｹﾞｰｼﾞで使用したｱｸﾀｰ(OBJ)をまとめてDelActorする
//----------------------------------------------------------
void GaugeActorDel(u8 actno)
{
#if GAUGE_CHANGE == 0
	DelActor(&ActWork[ActWork[actno].oamData.AffineParam]);
#endif
	DelActor(&ActWork[ActWork[actno].work[5]]);
	DelActor(&ActWork[actno]);
}
//----------------------------------------------------------
//	ｹﾞｰｼﾞのﾌﾟﾗｲｵﾘﾃｨ変更
// pri = 0(手前)  1(奥)  2(反転)
//----------------------------------------------------------
void GaugePriSet(u8 actno, u8 pri)
{
#if 0	//************************************
	u8 gauge_pri;
	
	switch(pri)
	{
		case 0:	//手前
			gauge_pri = BTL_GAUGE_PRI1;
			break;
		case 1:	//奥
			gauge_pri = BTL_GAUGE_PRI2;
			break;
		case 2:	//反転
		default:
			if(ActWork[actno].pri == BTL_GAUGE_PRI1)
				gauge_pri = BTL_GAUGE_PRI2;
			else
				gauge_pri = BTL_GAUGE_PRI1;
			break;
	}
	ActWork[actno].pri = gauge_pri;
//	ActWork[ActWork[actno].work[7]].pri = gauge_pri;
#endif	//*********************************
}

//=========================================================================
//	戦闘ゲージのプライオリティを操作する	2002.07.06(土) by matsuda
//=========================================================================
void GaugeHardPriSet(u8 hard_pri)
{
	u8 gauge, gauge2, parts;
	int i;
	
	for(i = 0; i < ClientSetMax; i++)
	{	//ｹﾞｰｼﾞの場合は相方が気絶しててもAddはされているので2体目ﾁｪｯｸはしてない
		gauge = ClientGaugeSt[i];		//本体　左側
		gauge2 = ActWork[gauge].oamData.AffineParam;	//本体　右側
		parts = ActWork[gauge].work[5];			//パーツ

		ActWork[gauge].oamData.Priority = hard_pri;
		ActWork[gauge2].oamData.Priority = hard_pri;
		ActWork[parts].oamData.Priority = hard_pri;
	}
}

//----------------------------------------------------------
//	ｹﾞｰｼﾞの初期座標をｾｯﾄ
//----------------------------------------------------------
void GaugeDefaultPosSet(u8 client_no)
{
	u8 xpos = 0, ypos = 0;
	
//	if(FightType == FIGHT_TYPE_1vs1)
	if(FightCheck() == 0)
	{
		if(MineEnemyCheck(client_no))
		{
			xpos = CAI_GAUGE_X;
			ypos = CAI_GAUGE_Y;
		}
		else
		{
			xpos = C_GAUGE_X;
			ypos = C_GAUGE_Y;
		}
	}
	else
	{
		switch(ClientTypeGet(client_no))
		{
			case BSS_CLIENT_MINE:
				xpos = C_GAUGE_X1;
				ypos = C_GAUGE_Y1;
				break;
			case BSS_CLIENT_MINE2:
				xpos = C_GAUGE_X2;
				ypos = C_GAUGE_Y2;
				break;
			case BSS_CLIENT_ENEMY:
				xpos = CAI_GAUGE_X1;
				ypos = CAI_GAUGE_Y1;
				break;
			case BSS_CLIENT_ENEMY2:
				xpos = CAI_GAUGE_X2;
				ypos = CAI_GAUGE_Y2;
				break;
		}
	}
	GaugePosSet(ClientGaugeSt[client_no], xpos, ypos);
}



void GaugeLevelTrans(u8 actno, u8 level)
{
	u8 buff[30] = {CTRL_,C_FCOL_,1,CTRL_,C_BCOL_,0x2};
	u8 i, t;
	u8 pos = 0;
	u8 level_temp;
	u8 trans_num;
	
	level_temp = level;
	t = 0;

#if GAUGE_CHANGE
	if(FightCheck() == 0)
	{
		if(MineEnemyCheck(ActWork[actno].work[6]) == SIDE_MINE)
			pos = MINE_LV_POS;
		else
			pos = ENEMY_LV_POS;
	}
	else
		pos = LVPOS_2VS2;
#else
	if(FightCheck() == 0)
	{
		if(MineEnemyCheck(ActWork[actno].work[6]) == SIDE_MINE)
			pos = MINE_LV_POS;
		else
			pos = ENEMY_LV_POS;
	}else{
		if(MineEnemyCheck(ActWork[actno].work[6]) == SIDE_MINE)
			pos = MINE_LV_POS2;
		else
			pos = ENEMY_LV_POS;
	}
#endif

	if(level == 100)
	{
		PM_NumMsgSet(&buff[6], level, NUM_MODE_LEFT, 3);
		trans_num = 3;
	}
	else
	{
//		DmaTransReq((void*)GetGaugePartsAdrs(GP_CORON),	//”：”転送
//			((ActWork[actno].oamData.CharNo + pos) << 5) + OBJ_MODE0_VRAM, 0x20);
//		DIV_DMACOPY(3, (void*)GetGaugePartsAdrs(GP_CORON),	//”：”転送
//			((ActWork[actno].oamData.CharNo + pos) << 5) + OBJ_MODE0_VRAM, 0x20, 32);
		CpuCopy((void*)GetGaugePartsAdrs(GP_CORON),	//”：”転送
			((ActWork[actno].oamData.CharNo + pos) << 5) + OBJ_MODE0_VRAM, 0x20, 32);
		PM_NumMsgSet(&buff[6], level, NUM_MODE_LEFT, 2);
		if(level < 10)
		{
			buff[7] = spc_;	buff[8] = EOM_;
		}
		trans_num = 2;
		pos++;
	}

	MsgCGXDataSet((void*)GAUGE_DECORD_ADR, buff);
	for(i = 0; i < trans_num; i++)
//		DIV_DMACOPY(3, (void*)GAUGE_DECORD_ADR + i * 0x40 + 0x20,
//			((ActWork[actno].oamData.CharNo + pos+i) << 5) + OBJ_MODE0_VRAM, 0x20, 32);
		CpuCopy((void*)GAUGE_DECORD_ADR + i * 0x40 + 0x20,
			((ActWork[actno].oamData.CharNo + pos+i) << 5) + OBJ_MODE0_VRAM, 0x20, 32);
/*---------------------------
	for(i = 0; i < 3; i++)
	{
		if(1)//MineEnemyCheck(ActWork[actno].work[6]) == SIDE_MINE)
		{
			DmaTransReq((void*)(GAUGE_DECORD_ADR + ((buff[i] + NUM_CHR_OFFSET+1+10) << 5)),
				((ActWork[actno].oamData.CharNo + pos + t) << 5)
					 + OBJ_MODE0_VRAM,
						0x20);
		}
		else	//敵側
		{
			if(i == 0)
			{
				DmaTransReq((void*)(GAUGE_DECORD_ADR + ((buff[i] + NUM_CHR_OFFSET+1+10) << 5)),
					((ActWork[actno].oamData.CharNo + 64+15 + t) << 5)
						 + OBJ_MODE0_VRAM,
							0x20);
			}
			else
			{
				DmaTransReq((void*)(GAUGE_DECORD_ADR + ((buff[i] + NUM_CHR_OFFSET+1+10) << 5)),
					((ActWork[actno].oamData.CharNo + pos + t) << 5)
						 + OBJ_MODE0_VRAM,
							0x20);
			}
		}
		t++;
	}
---------------------------*/
}

#define HPKETA_MAX	3	//最大表示桁数
//	DecordWram((void*)tesnum_pch_ADRS, (void*)GAUGE_DECORD_ADR);
//----------------------------------------------------------
//	転送ｷｬﾗのﾜｰｸﾗﾑへの転送はこれを呼ぶ前にやっておくこと
// flg = 0:現在HP  1:最大HP
//----------------------------------------------------------
void GaugeHPTrans(u8 actno, s16 hp, u8 flg)
{
	u8 buff[20] = {CTRL_,C_FCOL_,1,CTRL_,C_BCOL_,0x2};
	u8 i;//, j = 0;
	u8 pos;
	u8 client_no;
	
	client_no = ActWork[actno].work[6];
	if(FightCheck() == 1 || MineEnemyCheck(client_no) == SIDE_ENEMY){
		GaugeHPTrans2vs2(actno, hp, flg);
		return;
	}

	if(MineEnemyCheck(ActWork[actno].work[6]) == SIDE_MINE)
	{	//味方
		if(flg == 0)
			pos = MINE_HP_POS;
		else
			pos = MINE_HPMAX_POS;
	}
	else{	//敵
		if(flg == 0)
			pos = ENEMY_HP_POS;
		else
			pos = ENEMY_HPMAX_POS;
	}
	
	PM_NumMsgSet(&buff[6], hp, NUM_MODE_SPACE, 3);
	MsgCGXDataSet((void*)GAUGE_DECORD_ADR, buff);
	for(i = 0; i < HPKETA_MAX; i++)
		CpuCopy(GAUGE_DECORD_ADR+0x20 + i*0x40, 
			((ActWork[actno].oamData.CharNo + pos + i) << 5) 
			+ OBJ_MODE0_VRAM, 0x20, 32);
}

//----------------------------------------------------------
//	2対2の時のHP表示(ゲージを消してHPを表示する)
// flg = 0:現在HP  1:最大HP
//----------------------------------------------------------
static const u8 sura_eom_msg[] = {sura_,EOM_};
void GaugeHPTrans2vs2(u8 actno, s16 hp, u8 flg)
{
	u8 buff[20] = {CTRL_,C_FCOL_,1,CTRL_,C_BCOL_,0};	//xf};
	u8 i;//, j = 0;
	u8 pos;
	u8 parts;
	u8 *msg;
	u8 client_no;
	
//	if(FightCheck() == 0)
//		return;
	
	client_no = ActWork[actno].work[6];
	
	if(Climem[client_no].gauge_mode == 0)
		return;
		
	if(flg == 0)
		pos = 0;
	else
		pos = 4;

	parts = ActWork[actno].work[5];
	msg = PM_NumMsgSet(&buff[6], hp, NUM_MODE_SPACE, 3);
	if(flg == 0){
//		msg[0] = sura_;
//		msg[1] = EOM_;
		PM_strcpy(msg, sura_eom_msg);
	}
	MsgCGXDataSet((void*)GAUGE_DECORD_ADR, buff);
	for(i = pos; i < pos + HPKETA_MAX; i++){
		if(i < 3)
			CpuCopy(GAUGE_DECORD_ADR+0x20 + (i-pos)*0x40, 
				((ActWork[parts].oamData.CharNo + 1 + i) << 5) + OBJ_MODE0_VRAM,
				 0x20, 32);
		else
			CpuCopy(GAUGE_DECORD_ADR+0x20 + (i-pos)*0x40, 
				((ActWork[parts].oamData.CharNo + 4 + i - 3) << 5)
				 + OBJ_MODE0_VRAM, 0x20, 32);
	}
	
	if(flg == 0){
		CpuCopy(GAUGE_DECORD_ADR+0x20 + HPKETA_MAX*0x40,
			((ActWork[parts].oamData.CharNo + 4) << 5) + OBJ_MODE0_VRAM,0x20,32);

		//[HP]の[H]の部分が数値表示のまま画面切り替えをすると残って出てくるので
		//ここで消しておく add2002.09.18(水)
		CpuClear(0, OBJ_MODE0_VRAM + ActWork[parts].oamData.CharNo*32, 32, 32);
	}
	else if(MineEnemyCheck(client_no) == SIDE_MINE)
	{	//敵側の表示はﾃﾞﾊﾞｯｸ時のみなのでやらない
		CpuCopy(GetGaugePartsAdrs(GP_HPNUMCLOSE),
			(ActWork[actno].oamData.CharNo+0x34) * 32 + OBJ_MODE0_VRAM, 0x20, 32);
	}
}

extern const u8 * const SeikakuMsgTbl[];

void	GaugeSafariDebugTrans(u8 actno,PokemonParam *PP)
{
	int	i;
	u8 	j;
	u16	k;
	u8	*adr1;
	u32	adr2;
	u8	dakuten;
	u8	chr;
	u8	buff[20] = {CTRL_,C_FCOL_,1,CTRL_,C_BCOL_,0x02};
	u8	parts;
	
	adr1 = (void*)(GAUGE_DECORD_ADR + ((NAME_CHR_OFFSET << 5)
				+ 32 * 6 * 2 * ClientTypeGet(ActWork[actno].work[6])));

	k=5;
	chr=PokeSeikakuGet(PP);

	PM_strcpy(&buff[6],SeikakuMsgTbl[chr]);
	
	MsgCGXDataSet(adr1,buff);	//ﾒｯｾｰｼﾞﾃﾞｰﾀ展開

	for(i = 6, j = 0; j < k; i++)
	{
		if((buff[i] >= ga_ && buff[i] <= bo_)
			|| (buff[i] >= GA_ && buff[i] <= BO_))
		{	//濁点つきのｳｨﾝﾄﾞｳｷｬﾗを送る
			dakuten = GP_DAKUTEN;
		}
		else if((buff[i] >= pa_ && buff[i] <= po_)
			|| (buff[i] >= PA_ && buff[i] <= PO_))
		{	//半濁点つきのｳｨﾝﾄﾞｳｷｬﾗを送る
			dakuten = GP_HANDAKUTEN;
		}
		else
		{	//濁点なしのｳｨﾝﾄﾞｳｷｬﾗを送る
			dakuten = GP_TENNASI;
		}
		CpuCopy(GetGaugePartsAdrs(dakuten), &adr1[j * 0x40], 0x20, 32);
		j++;
	}

	for(i = 1; i < k+1; i++)
	{
		//濁点
		adr2=((ActWork[actno].oamData.CharNo+(i%8)+(0x40*(i/8))) << 5)
			 + OBJ_MODE0_VRAM ;
		CpuCopy(adr1,adr2,0x20,32);
		adr1+=0x20;
		
		//本文
		adr2=((ActWork[actno].oamData.CharNo+8+(i%8)+(0x40*(i/8))) << 5) + OBJ_MODE0_VRAM;
		CpuCopy(adr1,adr2,0x20,32);
		adr1+=0x20;
	}

	parts = ActWork[actno].work[5];
	PM_NumMsgSet(&buff[6],UserWork[SAFARI_GET_COUNT],NUM_MODE_SPACE,2);
	PM_NumMsgSet(&buff[9],UserWork[SAFARI_ESCAPE_COUNT],NUM_MODE_SPACE,2);
	buff[5]=0;
	buff[8]=sura_;

	MsgCGXDataSet((void*)GAUGE_DECORD_ADR, buff);

	for(i = 0; i < 5 ; i++){
		if(i < 2)
			CpuCopy(GAUGE_DECORD_ADR+0x20 + i*0x40, 
				((ActWork[parts].oamData.CharNo + 2 + i) << 5) + OBJ_MODE0_VRAM,
				 0x20, 32);
		else
			CpuCopy(GAUGE_DECORD_ADR+0x20 + i*0x40, 
				((ActWork[parts].oamData.CharNo + 8 + i - 2) << 5)
				 + OBJ_MODE0_VRAM, 0x20, 32);
	}
}

//----------------------------------------------------------
//	2対2の時、これを呼ぶたびにHPとゲージを入れ替えて表示する
//----------------------------------------------------------
void HPNumGaugeChangePut(void)
{
	int i;
	u8 change_flg;
	u8 parts;
	
	for(i = 0; i < ClientSetMax; i++)
	{
		//出現ｴﾌｪｸﾄ中など、同じｹﾞｰｼﾞのﾜｰｸを使用するのと重なると動作がおかしくなるので
		if(ActWork[ClientGaugeSt[i]].move != DummyActMove)
			continue;
	
	#ifdef PM_DEBUG
		if(DebugMainFlag == 0)
	#endif
		{
			if(MineEnemyCheck(i) == SIDE_ENEMY)	//ﾉｰﾏﾙﾌﾟﾚｲ時は敵のHPは出さない
				continue;
		}
	
		if(FightCheck() == 0 && MineEnemyCheck(i) == SIDE_MINE)
			continue;
		
		Climem[i].gauge_mode ^= 1;
		change_flg = Climem[i].gauge_mode;
		
		if(MineEnemyCheck(i) == 0){
			if((FightCheck() == 0)||
			   (FightType&FIGHT_TYPE_SAFARI))
				continue;
				
			if(change_flg == 1){
				parts = ActWork[ClientGaugeSt[i]].work[5];
				CpuClear(0, OBJ_MODE0_VRAM + ActWork[parts].oamData.CharNo*32, 
						8*32, 32);
				GaugeHPTrans2vs2(ClientGaugeSt[i],
					PokeParaGet(&PokeParaMine[SelMonsNo[i]], ID_hp), 0);
				GaugeHPTrans2vs2(ClientGaugeSt[i],
					PokeParaGet(&PokeParaMine[SelMonsNo[i]], ID_hpmax), 1);
			}else{
				GaugeStatusTrans(ClientGaugeSt[i]);
				GaugeTransChrSet(ClientGaugeSt[i], 
					&PokeParaMine[SelMonsNo[i]], G_HPGAUGE);
				CpuCopy(GetGaugePartsAdrs(GP_HPBARCLOSE),
					(ActWork[ClientGaugeSt[i]].oamData.CharNo+0x34) * 32 
					+ OBJ_MODE0_VRAM, 0x20, 32);
			}
		}else{
			if(change_flg == 1){
				if(FightType&FIGHT_TYPE_SAFARI)
					GaugeSafariDebugTrans(ClientGaugeSt[i],&PokeParaEnemy[SelMonsNo[i]]);
				else{
					parts = ActWork[ClientGaugeSt[i]].work[5];
					CpuClear(0, OBJ_MODE0_VRAM + ActWork[parts].oamData.CharNo*32, 
							8*32, 32);
					GaugeHPTrans2vs2(ClientGaugeSt[i],
						PokeParaGet(&PokeParaEnemy[SelMonsNo[i]], ID_hp), 0);
					GaugeHPTrans2vs2(ClientGaugeSt[i],
						PokeParaGet(&PokeParaEnemy[SelMonsNo[i]], ID_hpmax), 1);
				}
			}else{
				GaugeStatusTrans(ClientGaugeSt[i]);
				GaugeTransChrSet(ClientGaugeSt[i], 
					&PokeParaEnemy[SelMonsNo[i]], G_HPGAUGE);
				if(FightType&FIGHT_TYPE_SAFARI)
					GaugeTransChrSet(ClientGaugeSt[i], 
						&PokeParaEnemy[SelMonsNo[i]], G_NAME);
			}
		}
		ActWork[ClientGaugeSt[i]].work[7] ^= 1;
	}
}


//----------------------------------------------------------
// 手持ちﾎﾟｹﾓﾝ数をﾎﾞｰﾙｱｲｺﾝで表示
// 引数:zahyou = 0:ｹﾞｰｼﾞの定位置に出す	1:ClientNoによってｹﾞｰｼﾞの座標を変える
//		syokai = 1:最初のﾄﾚｰﾅｰがｽﾗｲﾄﾞｲﾝして来た時に出る時
//				 0:ポケモン入れ替え時
// 戻り値：ボールを表示しているゲージのActNo
//----------------------------------------------------------
#define TEMOTI_BALL_STWAIT	7	//ﾎﾞｰﾙｷｬﾗが順順に入ってくる間隔

u8 TemotiBallPut(u8 client_no, BallGaugePara *bgd, u8 zahyou, u8 syokai)
{
	s8 kazu;
	int i, s;	//, parts, getid;
	u8 mine_enemy;
	u8 id, actno, ball[6];
	s16 gauge_x, gauge_y;
	s16 gauge_dx, gauge_add;
	
//	if(FightCheck() == 1 || (FightType & FIGHT_TYPE_TRAINER) == 0)
//		return;

	if(zahyou == 0 || ClientTypeGet(client_no) != BSS_CLIENT_ENEMY2){
		if(MineEnemyCheck(client_no) == SIDE_MINE){
			mine_enemy = 0;
			gauge_x = MINE_TEMOTI_GAUGE_X;
			gauge_y = MINE_TEMOTI_GAUGE_Y;
			gauge_dx = TEMOTI_GAUGE_SP * TEMOTI_GAUEG_MOVE_SYNC;
			gauge_add = -TEMOTI_GAUGE_SP;
		}else{
			mine_enemy = 1;
			if(zahyou == 0 || FightCheck() == 0){
				gauge_x = TEMOTI_ENEMY2_X;
				gauge_y = TEMOTI_ENEMY2_Y;
			}
			else{
				gauge_x = ENEMY_TEMOTI_GAUGE_X;
				gauge_y = ENEMY_TEMOTI_GAUGE_Y;
			}
			gauge_dx = -(TEMOTI_GAUGE_SP * TEMOTI_GAUEG_MOVE_SYNC);
			gauge_add = TEMOTI_GAUGE_SP;
		}
	}else{//ENEMY2のみやる※曽我部さんが言った(相手ﾄﾚｰﾅｰのﾎﾟｹﾓﾝ入れ替えの時に使われる)
		mine_enemy = 1;
		gauge_x = TEMOTI_ENEMY2_X;
		gauge_y = TEMOTI_ENEMY2_Y;
		gauge_dx = -(TEMOTI_GAUGE_SP * TEMOTI_GAUEG_MOVE_SYNC);
		gauge_add = TEMOTI_GAUGE_SP;
	}
	
	for(i = 0, kazu = 0; i < TEMOTI_POKEMAX; i++)
	{
		if(bgd[i].hp == 0xffff)
			continue;
		kazu++;
	}
	
	DecordCellSet((void*)&TemotiGaugeCell[mine_enemy]);
	CellSet((CellData*)&TemotiBallCell[mine_enemy]);
	ObjPalSet((PalData*)&TemotiGaugePal[mine_enemy]);
	ObjPalSet((PalData*)&TemotiBallPal[mine_enemy]);
	actno = AddActor(&TemotiGaugeHeader[mine_enemy], gauge_x,gauge_y,TEMOTI_GAUGE_PRI);
	SetActOamPat(&ActWork[actno], &TemotiGaugePatTbl[0]);//mine_enemy]);
	ActWork[actno].dx = gauge_dx;
	ActWork[actno].work[0] = gauge_add;
	if(mine_enemy){
		ActWork[actno].x -= 96;
		ActWork[actno].oamData.AffineParamNo = 8;	//Hflip
	}else
		ActWork[actno].x += 96;
	
	for(i = 0; i < TEMOTI_POKEMAX; i++){
		ball[i] = AddActorBottom(&TemotiBallHeader[mine_enemy],
//			240+8, 160+8, TEMOTI_BALL_PRI);
			gauge_x, gauge_y - 4, TEMOTI_BALL_PRI);
		if(syokai == 0)
			ActWork[ball[i]].move = TemotiBallNormalSeq;
		if(mine_enemy == 0){
			ActWork[ball[i]].dx = 0;
			ActWork[ball[i]].dy = 0;
		}
//		ActWork[ball[i]].dx += 10*i;	//8*i;
		ActWork[ball[i]].work[0] = actno;
		if(mine_enemy == 0){
			ActWork[ball[i]].x += 10*i + 24;
			ActWork[ball[i]].work[1] = TEMOTI_BALL_STWAIT * i + 10;
			ActWork[ball[i]].dx = 120;
		}
		else{
			ActWork[ball[i]].x -= 10*(TEMOTI_POKEMAX-1-i) + 24;
			ActWork[ball[i]].work[1] = TEMOTI_BALL_STWAIT * (TEMOTI_POKEMAX - i) + 10;
			ActWork[ball[i]].dx = -120;
		}
		ActWork[ball[i]].work[2] = mine_enemy;
	}
	
	if(MineEnemyCheck(client_no) == SIDE_MINE){
		//ここもkazuではなく、bgdで取るようにした方がいいけど、
		//入れバグが怖いので、とりあえずはこれで 02/05/02 by matsuda
		for(i = 0; i < TEMOTI_POKEMAX; i++){
			if(FightType&FIGHT_TYPE_4_2vs2){
				if(bgd[i].hp == 0xffff){
					ActWork[ball[i]].oamData.CharNo++;	//BallOFFの表示
					ActWork[ball[i]].work[7] = 1;		//BallOFFの印
				}
				else if(bgd[i].hp == 0)
					ActWork[ball[i]].oamData.CharNo += 3;	//気絶
				else if(bgd[i].condition != 0)
					ActWork[ball[i]].oamData.CharNo += 2;	//ｽﾃｰﾀｽ異常
			}
			else{
				if(i >= kazu){
					ActWork[ball[i]].oamData.CharNo++;	//BallOFFの表示
					ActWork[ball[i]].work[7] = 1;	//BallOFFの印
				}
				else if(bgd[i].hp == 0)
					ActWork[ball[i]].oamData.CharNo += 3;	//気絶
				else if(bgd[i].condition != 0)
					ActWork[ball[i]].oamData.CharNo += 2;	//ｽﾃｰﾀｽ異常
			}
		}
	}else{
		s = TEMOTI_POKEMAX - 1;
		for(i = 0; i < TEMOTI_POKEMAX; i++){
			if(FightType&FIGHT_TYPE_4_2vs2){
				if(bgd[i].hp == 0xffff){
					ActWork[ball[s]].oamData.CharNo++;	//BallOFFの表示
					ActWork[ball[s]].work[7] = 1;	//BallOFFの印
				}
				else if(bgd[i].hp == 0)
					ActWork[ball[s]].oamData.CharNo += 3;	//気絶
				else if(bgd[i].condition != 0)
					ActWork[ball[s]].oamData.CharNo += 2;	//ｽﾃｰﾀｽ異常
				s--;
			}
			else{
				if(i >= kazu){
					ActWork[ball[s]].oamData.CharNo++;	//BallOFFの表示
					ActWork[ball[s]].work[7] = 1;	//BallOFFの印
				}
				else if(bgd[i].hp == 0)
					ActWork[ball[s]].oamData.CharNo += 3;	//気絶
				else if(bgd[i].condition != 0)
					ActWork[ball[s]].oamData.CharNo += 2;	//ｽﾃｰﾀｽ異常
				s--;
			}
		}
	}
	
	id = AddTask(DummyTaskSeq, 5);
	TaskTable[id].work[0] = client_no;
	TaskTable[id].work[1] = actno;
//	TaskTable[id].work[2] = actno[1];
	for(i = 0; i < TEMOTI_POKEMAX; i++)
		TaskTable[id].work[3+i] = ball[i];
	TaskTable[id].work[10] = syokai;
//	SetWork_Adrs(&TaskTable[id].work[14], retadrs);

	SePlayPan(SE_TB_START, 0);
	return id;
}

void TemotiBallOff(u8 id)
{
	u8 ball[TEMOTI_POKEMAX];
	int i;
	u8 actno;
	u8 syokai;
	u8 client_no;
	
	syokai = TaskTable[id].work[10];
	actno = TaskTable[id].work[1];
	client_no = TaskTable[id].work[0];
	
	for(i = 0; i < TEMOTI_POKEMAX; i++)
		ball[i] = TaskTable[id].work[3+i];
	*(vu16*)REG_BLDCNT = BLD_A_BLEND_MODE | BLD_2ND_ALL;
	*(vu16*)REG_BLDALPHA = 16;
	TaskTable[id].work[15] = 16;
	for(i = 0; i < TEMOTI_POKEMAX; i++)
		ActWork[ball[i]].oamData.ObjMode = 1;
	ActWork[actno].oamData.ObjMode = 1;
	
	if(syokai){
		for(i = 0; i < TEMOTI_POKEMAX; i++){
			if(MineEnemyCheck(client_no)){
				ActWork[ball[TEMOTI_POKEMAX-1-i]].work[1] = TEMOTI_BALL_STWAIT * i;
				ActWork[ball[TEMOTI_POKEMAX-1-i]].work[3] = 0;
				ActWork[ball[TEMOTI_POKEMAX-1-i]].work[4] = 0;
				ActWork[ball[TEMOTI_POKEMAX-1-i]].move = TemotiBallOutSeq;
			}
			else{
				ActWork[ball[i]].work[1] = TEMOTI_BALL_STWAIT * i;
				ActWork[ball[i]].work[3] = 0;
				ActWork[ball[i]].work[4] = 0;
				ActWork[ball[i]].move = TemotiBallOutSeq;
			}
		}
		ActWork[actno].work[0] /= 2;
		ActWork[actno].work[1] = 0;	// add 2002.09.13(金)
		ActWork[actno].move = TemotiGaugeOutSeq;
		SetActOamPat(&ActWork[actno], &TemotiGaugePatTbl[1]);
		TaskTable[id].TaskAdrs = TemotiBallOffSyokai;
	}
	else{
		TaskTable[id].TaskAdrs = TemotiBallOffMain;
	}
}

//-- 初回時の消えるエフェクト(横にｽﾗｲﾄﾞしていく) --//
static void TemotiBallOffSyokai(u8 id)
{
	u8 actno;
	
	actno = TaskTable[id].work[1];

	if(TaskTable[id].work[11]++ % 2 == 0){
		TaskTable[id].work[15]--;
		if(TaskTable[id].work[15] >= 0){
			*(vu16*)REG_BLDALPHA = ((16-TaskTable[id].work[15]) << 8) | TaskTable[id].work[15];
		}
	}
	
	if(TaskTable[id].work[15] == 0)
		TaskTable[id].TaskAdrs = TemotiBallOffSyokaiEnd;
}

static void TemotiBallOffSyokaiEnd(u8 id)
{
	u8 client_no;
	u8 actno;
	u8 ball[TEMOTI_POKEMAX];
	int i;

	TaskTable[id].work[15]--;
	if(TaskTable[id].work[15] == -1){
		client_no = TaskTable[id].work[0];
		actno = TaskTable[id].work[1];
	//	actno2 = TaskTable[id].work[2];
		for(i = 0; i < TEMOTI_POKEMAX; i++)
			ball[i] = TaskTable[id].work[3+i];

		AllDelActor(&ActWork[actno]);
	//	DelActor(&ActWork[actno2]);
		AllDelActor(&ActWork[ball[0]]);
		for(i = 1; i < TEMOTI_POKEMAX; i++)
			DelActor(&ActWork[ball[i]]);
	//	SetAdrs_Work(&TaskTable[id].work[14], ClientSequence[client_no]);
	}
	else if(TaskTable[id].work[15] == -3){	//↑が完全にDelされてないので余計に1SyncWait
		*(vu16*)REG_BLDCNT = 0;
		*(vu16*)REG_BLDALPHA = 0;
		DelTask(id);
	}
}

//-- その場で半透明で消えていく --//
static void TemotiBallOffMain(u8 id)
{
	u8 client_no;
	u8 actno;
	u8 ball[TEMOTI_POKEMAX];
	int i;
	
	TaskTable[id].work[15]--;
	if(TaskTable[id].work[15] >= 0){
		*(vu16*)REG_BLDALPHA = ((16-TaskTable[id].work[15]) << 8) | TaskTable[id].work[15];
		return;
	}
	
	if(TaskTable[id].work[15] == -1){
		client_no = TaskTable[id].work[0];
		actno = TaskTable[id].work[1];
	//	actno2 = TaskTable[id].work[2];
		for(i = 0; i < TEMOTI_POKEMAX; i++)
			ball[i] = TaskTable[id].work[3+i];

		AllDelActor(&ActWork[actno]);
	//	DelActor(&ActWork[actno2]);
		AllDelActor(&ActWork[ball[0]]);
		for(i = 1; i < TEMOTI_POKEMAX; i++)
			DelActor(&ActWork[ball[i]]);
	//	SetAdrs_Work(&TaskTable[id].work[14], ClientSequence[client_no]);
	}
	else if(TaskTable[id].work[15] == -3){	//↑が完全にDelされてないので余計に1SyncWait
		*(vu16*)REG_BLDCNT = 0;
		*(vu16*)REG_BLDALPHA = 0;
		DelTask(id);
	}
}

static void TemotiGaugeSeq(actWork *xreg)
{
	if(xreg->dx != 0)
		xreg->dx += xreg->work[0];
}

//-- 初回時の手持ちゲージが消えていく --//
#define TEMOTI_GAUGE_OUTSP	0x20	//0x18
static void TemotiGaugeOutSeq(actWork *xreg)
{
//	xreg->dx += xreg->work[0];
	xreg->work[1] += TEMOTI_GAUGE_OUTSP;
	if(xreg->work[0] > 0)
		xreg->dx += xreg->work[1] >> 4;
	else
		xreg->dx -= xreg->work[1] >> 4;
	xreg->work[1] &= 0x000f;
}

#define TEMOTI_BALLIN_SP	0x0038		//ﾎﾞｰﾙがｲﾝしてくる速度(下位4ビット小数)
static void TemotiBallSeq(actWork *xreg)
{
	u8 mine_enemy;
	u16 dx;
	s8 pan;
	
	if(xreg->work[1] > 0){
		xreg->work[1]--;
		return;
	}
	
	mine_enemy = xreg->work[2];
	dx = xreg->work[3];
	dx += TEMOTI_BALLIN_SP;
	xreg->work[3] = dx & 0xfff0;
	if(mine_enemy){
		xreg->dx += dx >> 4;
		if(xreg->dx > 0)
			xreg->dx = 0;
	}
	else{
		xreg->dx -= dx >> 4;
		if(xreg->dx < 0)
			xreg->dx = 0;
	}
	
	if(xreg->dx == 0){
		if(mine_enemy)
			pan = WAZA_SE_L;
		else
			pan = WAZA_SE_R;
		if(xreg->work[7])
			SePlayPanCh2(SE_TB_KARA, pan);	//BallOFF
		else
			SePlayPanCh1(SE_TB_KON, pan);
		xreg->move = DummyActMove;
	}
}

static void TemotiBallOutSeq(actWork *xreg)
{
	u8 mine_enemy;
	u16 dx;
	
	if(xreg->work[1] > 0){
		xreg->work[1]--;
		return;
	}
	
	mine_enemy = xreg->work[2];
	dx = xreg->work[3];
	dx += TEMOTI_BALLIN_SP;
	xreg->work[3] = dx & 0xfff0;
	if(mine_enemy){
		xreg->dx += dx >> 4;
	}
	else{
		xreg->dx -= dx >> 4;
	}
	
	if(xreg->dx+xreg->x > 248 || xreg->dx+xreg->x < -8){
		xreg->banish = 1;
		xreg->move = DummyActMove;
	}
}

//-- 初回以外の時の動作 --//
static void TemotiBallNormalSeq(actWork *xreg)
{
	u8 hontai;
	
	hontai = xreg->work[0];
	xreg->dx = ActWork[hontai].dx;
	xreg->dy = ActWork[hontai].dy;
}

















//----------------------------------------------------------
//	名前転送
//----------------------------------------------------------
#define SEIGYO_LEN	6	//ｹﾞｰｼﾞの名前で使用している制御ｺｰﾄﾞの文字数
#define SEIGYO_TOPLEN	3	//名前部分の制御ｺｰﾄﾞ(雄、雌記号の制御ｺｰﾄﾞは含まない)
static const u8 GaugeFontBaseColor_msg[] = {CTRL_,C_BCOL_,0x2,EOM_};
void	GaugePokeNameTrans(u8 actno,PokemonParam *PP)
{
	int	i;
	u8 j;
	u16	k;
	u8	*adr1;
	u32	adr2;
	u8 dakuten;
	u8 offset = 0;
	u8 sex;
	u8	nickname[MONS_NAME_SIZE+EOM_SIZE];
	u16 monsno;
	
	PM_strcpy(FightMsgBuf, GaugeFontBaseColor_msg);
//	adr1=(u8 *)PM_strcpy(&FightMsgBuf[2],PokeNameData[PP->PPP.monsno]);
	PokeParaGet(PP,ID_nickname,(u8 *)&nickname);
	NickNameCutOff(nickname);
	adr1=(u8 *)PM_strcpy(&FightMsgBuf[3],nickname);

//	*adr1++ = FCOL_;
//	*adr1++ = 0xd;//COL_LBLUE;
	*adr1++ = CTRL_;
	*adr1++ = C_FCOL_;
//	*adr1++ = 0xd;
	sex = PokeSexGet(PP);
	monsno = PokeParaGet(PP, ID_monsno);
	if(monsno == MONSNO_NIDORAN_F || monsno == MONSNO_NIDORAN_M){
		if(PM_strcmp(nickname, PokeNameData[monsno]) == 0)
			sex = 100;	//ﾆｯｸﾈｰﾑがﾃﾞﾌｫﾙﾄ名と一緒なら性別を表示しない
	}
	
	switch(sex){
		case	MONS_MALE:
			*adr1++ = 0xb;	//ﾌｫﾝﾄ色
			*adr1=osu_;
			adr1++;
			*adr1=EOM_;
			break;
		case	MONS_FEMALE:
			*adr1++ = 0xa;	//ﾌｫﾝﾄ色
			*adr1=mesu_;
			adr1++;
			*adr1=EOM_;
			break;
		default:
			*adr1++ = 0xb;	//ﾌｫﾝﾄ色
			*adr1 = EOM_;
			break;
	}

//	adr1 = (void*)(GAUGE_DECORD_ADR + ((NAME_CHR_OFFSET << 5)
//				+ 32 * 6 * 2 * ActWork[actno].work[6]));
//				changed by soga 2001.09.26
	adr1 = (void*)(GAUGE_DECORD_ADR + ((NAME_CHR_OFFSET << 5)
				+ 32 * 6 * 2 * ClientTypeGet(ActWork[actno].work[6])));

	k = PM_strlen(FightMsgBuf);
	i = k - SEIGYO_LEN;	//制御コードも1つの文字として数えられてしまうので、その分引く
	j = 0;
	for( ; i < 6; i++, j++)	//6文字に達してないなら後ろはｽﾍﾟｰｽで埋める
	{
		FightMsgBuf[k+j] = spc_;
		FightMsgBuf[k+j+1] = EOM_;
	}
	k=PM_strlen(FightMsgBuf);
	k -= SEIGYO_LEN;//制御コードも1つの文字として数えられてしまうので、その分引く
	
	MsgCGXDataSet(adr1,(u8 *)&FightMsgBuf);	//ﾒｯｾｰｼﾞﾃﾞｰﾀ展開
	for(i = SEIGYO_TOPLEN, j = 0; j < k; i++)
	{
		if((FightMsgBuf[i] >= ga_ && FightMsgBuf[i] <= bo_)
			|| (FightMsgBuf[i] >= GA_ && FightMsgBuf[i] <= BO_))
		{	//濁点つきのｳｨﾝﾄﾞｳｷｬﾗを送る
			dakuten = GP_DAKUTEN;
		}
		else if((FightMsgBuf[i] >= pa_ && FightMsgBuf[i] <= po_)
			|| (FightMsgBuf[i] >= PA_ && FightMsgBuf[i] <= PO_))
		{	//半濁点つきのｳｨﾝﾄﾞｳｷｬﾗを送る
			dakuten = GP_HANDAKUTEN;
		}
		else
		{	//濁点なしのｳｨﾝﾄﾞｳｷｬﾗを送る
			dakuten = GP_TENNASI;
		}
		CpuCopy(GetGaugePartsAdrs(dakuten), &adr1[j * 0x40], 0x20, 32);
		j++;
	}
	
/*-------------------------
	if(MineEnemyCheck(ActWork[actno].work[6]) == SIDE_MINE)
	{
		for(i=0;i<k;i++)
		{
			//本文
			if(i < 5)	//残りは♂♀ﾏｰｸだけなので濁点の処理はしない
			{
				//濁点
				adr2=((ActWork[actno].oamData.CharNo+3+i+DEBUG_DAKUTEN) << 5)
					 + OBJ_MODE0_VRAM ;
				//DmaTransReq(adr1,adr2,0x20);	//change 2001.07.25(水)
				CpuCopy(adr1, adr2, 0x20, 32);
				adr1+=0x20;
				adr2=((ActWork[actno].oamData.CharNo+11+i) << 5) + OBJ_MODE0_VRAM ;
			}
			else
			{
				//濁点
				adr2=((ActWork[actno].oamData.CharNo+32+(i-5)+DEBUG_DAKUTEN) << 5)
					 + OBJ_MODE0_VRAM ;
				//DmaTransReq(adr1,adr2,0x20);	//change 2001.07.25(水)
				CpuCopy(adr1, adr2, 0x20, 32);
				adr1+=0x20;
				adr2=((ActWork[actno].oamData.CharNo+32+8+(i-5)) << 5) + OBJ_MODE0_VRAM ;
			}
			//DmaTransReq(adr1,adr2,0x20);	//change 2001.07.25(水)
			CpuCopy(adr1, adr2, 0x20, 32);
			adr1+=0x20;
		}
	}
	else
	{
	-------------------------------*/
	if(MineEnemyCheck(ActWork[actno].work[6]) == SIDE_MINE && FightCheck() == 0)
	{
		for(i = 0; i < k; i++)
		{
			//濁点
			adr2=((ActWork[actno].oamData.CharNo+2+i+offset+DEBUG_DAKUTEN) << 5)
				 + OBJ_MODE0_VRAM ;
			//DmaTransReq(adr1,adr2,0x20);	//change 2001.07.25(水)
			CpuCopy(adr1,adr2,0x20,32);
			adr1+=0x20;
			
			//本文
			adr2=((ActWork[actno].oamData.CharNo+10+i+offset) << 5) + OBJ_MODE0_VRAM;
			//DmaTransReq(adr1,adr2,0x20);	//change 2001.07.25(水)
			CpuCopy(adr1,adr2,0x20,32);
			adr1+=0x20;
		}
	}
	else
	{
		if(MineEnemyCheck(ActWork[actno].work[6]) == SIDE_MINE)
			offset = 1;
			
		for(i = 0; i < k; i++)
		{
			//濁点
			adr2=((ActWork[actno].oamData.CharNo+1+i+offset+DEBUG_DAKUTEN) << 5)
				 + OBJ_MODE0_VRAM ;
			//DmaTransReq(adr1,adr2,0x20);	//change 2001.07.25(水)
			CpuCopy(adr1,adr2,0x20,32);
			adr1+=0x20;
			
			//本文
			adr2=((ActWork[actno].oamData.CharNo+9+i+offset) << 5) + OBJ_MODE0_VRAM;
			//DmaTransReq(adr1,adr2,0x20);	//change 2001.07.25(水)
			CpuCopy(adr1,adr2,0x20,32);
			adr1+=0x20;
		}
	}
}


//----------------------------------------------------------
//	ポケモンゲット済みマーク表示
//	put_mode = 0:elase 1:write
//----------------------------------------------------------
void GaugeGetBallTrans(u8 actno, u8 put_mode)
{
#ifndef FESTA_VER_ROM
	u8 client_no;
	u16 zukanno;
	u8 parts;
	
//捕獲デモでは、マークはいらない add by soga 2002.06.27
	if(FightType&FIGHT_TYPE_GET_DEMO)
		return;
	if(FightType & FIGHT_TYPE_TRAINER)	//ﾄﾚｰﾅｰ戦でもいらない 2002.08.09(金)
		return;
		
	client_no = ActWork[actno].work[6];
	if(MineEnemyCheck(client_no) == SIDE_MINE)
		return;
	zukanno = PokeMonsNo2ZukanNoGet(
		PokeParaGet(&PokeParaEnemy[SelMonsNo[client_no]], ID_monsno));
	if(ZukanCheck(zukanno, Z_GET_CHK) == 0)
		return;

	parts = ActWork[actno].work[5];
	if(put_mode){
		CpuCopy((void*)GetGaugePartsAdrs(GP_GETBALL),
			((ActWork[parts].oamData.CharNo + 8) << 5) + OBJ_MODE0_VRAM, 0x20, 32);
	}
	else{
		CpuClear(0, 
			((ActWork[parts].oamData.CharNo + 8) << 5) + OBJ_MODE0_VRAM, 0x20, 32);
	}
#endif
}

//----------------------------------------------------------
//	状態異常 表示
//----------------------------------------------------------
//左から 毒、麻痺、眠り、氷、やけど のﾊﾟﾚｯﾄ
static const u16 StPalData[] = {0x6198,0x0ef7,0x4694,0x72d1,0x29dc};

void GaugeStatusTrans(u8 actno)
{
	u8 client_no;
	u32 cond;
	u8 *parts;
	s16 offset;
	u8 parts_act;
	int i;
	u16 trans_pal;
	u8 st_pal = 0;
	
//	if(FightCheck() == 1)
//		return;

	client_no = ActWork[actno].work[6];
	parts_act = ActWork[actno].work[5];
#if GAUGE_CHANGE
	if(MineEnemyCheck(client_no) == SIDE_MINE)
	{
		cond = PokeParaGet(&PokeParaMine[SelMonsNo[client_no]], ID_condition);
		if(FightCheck() == 1)
			offset = 0xb;
		else
			offset = 0;
	}
	else
	{
		cond = PokeParaGet(&PokeParaEnemy[SelMonsNo[client_no]], ID_condition);
		if(FightCheck() == 1)
			offset = 0xb;
		else
			offset = -0x9;	//0x40;
	}
#else
	if(MineEnemyCheck(client_no) == SIDE_MINE){
		cond = PokeParaGet(&PokeParaMine[SelMonsNo[client_no]], ID_condition);
		if(FightCheck() == 0)
			offset = 0x1a;
		else
			offset = 0x12;
	}else{
		cond = PokeParaGet(&PokeParaEnemy[SelMonsNo[client_no]], ID_condition);
		offset = 0x11;
	}
#endif

	if(cond & CONDITION_NEMURI){
		parts = GetGaugePartsAdrs(GetCondID(GP_NEMURI, client_no));
		st_pal = 2;
	}
	else if(cond & CONDITION_DOKU || cond & CONDITION_DOKUDOKU){
		parts = GetGaugePartsAdrs(GetCondID(GP_DOKU, client_no));
		st_pal = 0;
	}
	else if(cond & CONDITION_YAKEDO){
		parts = GetGaugePartsAdrs(GetCondID(GP_YAKEDO, client_no));
		st_pal = 4;
	}
	else if(cond & CONDITION_KOORI){
		parts = GetGaugePartsAdrs(GetCondID(GP_KOORI, client_no));
		st_pal = 3;
	}
	else if(cond & CONDITION_MAHI){
		parts = GetGaugePartsAdrs(GetCondID(GP_MAHI, client_no));
		st_pal = 1;
	}
	else
	{	//状態異常なし
		
	#if GAUGE_CHANGE	//状態異常の表示場所が変わったので
		if(FightCheck() == 0)
		{
			parts = GetGaugePartsAdrs(GP_KUUHAKU);
///			DIV_DMACOPY(3, (void*)parts, 
//				((ActWork[actno].oamData.CharNo + 0x1a+offset) << 5)
//				 + OBJ_MODE0_VRAM, 0x20, 32);
//			DIV_DMACOPY(3, (void*)parts, 
//				((ActWork[actno].oamData.CharNo + 0x1b+offset) << 5)
//				 + OBJ_MODE0_VRAM, 0x20, 32);
//			DIV_DMACOPY(3, (void*)parts, 
//				((ActWork[actno].oamData.CharNo + 0x1c+offset) << 5)
//				 + OBJ_MODE0_VRAM, 0x20, 32);
			CpuCopy((void*)parts, 
				((ActWork[actno].oamData.CharNo + 0x1a+offset) << 5)
				 + OBJ_MODE0_VRAM, 0x20, 32);
			CpuCopy((void*)parts, 
				((ActWork[actno].oamData.CharNo + 0x1b+offset) << 5)
				 + OBJ_MODE0_VRAM, 0x20, 32);
			CpuCopy((void*)parts, 
				((ActWork[actno].oamData.CharNo + 0x1c+offset) << 5)
				 + OBJ_MODE0_VRAM, 0x20, 32);
		}
		else{
			parts = GetGaugePartsAdrs(GP_LV);
//			DIV_DMACOPY(3, (void*)parts, 
//				((ActWork[actno].oamData.CharNo + 0xf) << 5)
//				 + OBJ_MODE0_VRAM, 0x20, 32);
			CpuCopy((void*)parts, 
				((ActWork[actno].oamData.CharNo + 0xf) << 5)
				 + OBJ_MODE0_VRAM, 0x20, 32);
			if(MineEnemyCheck(client_no) == SIDE_MINE)
				GaugeLevelTrans(actno,
					PokeParaGet(&PokeParaMine[SelMonsNo[client_no]], ID_level));
			else
				GaugeLevelTrans(actno,
					PokeParaGet(&PokeParaEnemy[SelMonsNo[client_no]], ID_level));
		}
	#else
		//-- ステータス情報ｸﾘｱ --//
		parts = GetGaugePartsAdrs(GP_KUUHAKU);
		for(i = 0; i < 3; i++){
//			DIV_DMACOPY(3, (void*)parts, 
//				((ActWork[actno].oamData.CharNo + offset+i) << 5)
//						 + OBJ_MODE0_VRAM, 0x20, 32);
			CpuCopy((void*)parts, 
				((ActWork[actno].oamData.CharNo + offset+i) << 5)
						 + OBJ_MODE0_VRAM, 0x20, 32);
		}
		if(Climem[client_no].gauge_mode == 0){
			//-- HPの表示を復帰 --//
//			DIV_DMACOPY(3, GetGaugePartsAdrs(GP_HP), 
//				(ActWork[parts_act].oamData.CharNo << 5) + OBJ_MODE0_VRAM, 0x40, 32);
			CpuCopy(GetGaugePartsAdrs(GP_HP), 
				(ActWork[parts_act].oamData.CharNo << 5) + OBJ_MODE0_VRAM, 0x40, 32);
		}
		
		GaugeGetBallTrans(actno, 1);
	#endif
		return;
	}

#if GAUGE_CHANGE
//	DIV_DMACOPY(3, (void*)parts,
//		((ActWork[actno].oamData.CharNo + 0x1a+offset) << 5) + OBJ_MODE0_VRAM, 0x60,32);
	CpuCopy((void*)parts,
		((ActWork[actno].oamData.CharNo + 0x1a+offset) << 5) + OBJ_MODE0_VRAM, 0x60,32);
	if(FightCheck())
//		DIV_DMACOPY(3, GetGaugePartsAdrs(GP_KUUHAKU),
//			((ActWork[actno].oamData.CharNo + 0xf) << 5) + OBJ_MODE0_VRAM, 0x20, 32);
		CpuCopy(GetGaugePartsAdrs(GP_KUUHAKU),
			((ActWork[actno].oamData.CharNo + 0xf) << 5) + OBJ_MODE0_VRAM, 0x20, 32);
#else
	trans_pal = ActWork[actno].oamData.Pltt * 16 + 0xc + client_no;
//	DIV_DMACOPY(3, (void*)parts, 
//		((ActWork[actno].oamData.CharNo + offset) << 5) + OBJ_MODE0_VRAM, 0x60, 32);
	PaletteWorkClear(StPalData[st_pal], trans_pal+16*16, 2);
	CpuCopy((void*)&PaletteWork[trans_pal+16*16], OBJ_PLTT+trans_pal*2, 2,16);
	CpuCopy((void*)parts, 
		((ActWork[actno].oamData.CharNo + offset) << 5) + OBJ_MODE0_VRAM, 0x60, 32);
	
	if(FightCheck() == 1 || MineEnemyCheck(client_no) == SIDE_ENEMY){
		if(Climem[client_no].gauge_mode == 0){
			//-- HPの表示を消去 --//
//			DIV_DMACOPY(3, GetGaugePartsAdrs(GP_SPACE), 
//				(ActWork[parts_act].oamData.CharNo << 5) + OBJ_MODE0_VRAM, 0x20, 32);
//			DIV_DMACOPY(3, GetGaugePartsAdrs(GP_HPHEAD), 
//				((ActWork[parts_act].oamData.CharNo +1)<< 5)+OBJ_MODE0_VRAM, 0x20, 32);
			CpuCopy(GetGaugePartsAdrs(GP_SPACE), 
				(ActWork[parts_act].oamData.CharNo << 5) + OBJ_MODE0_VRAM, 0x20, 32);
			CpuCopy(GetGaugePartsAdrs(GP_HPHEAD), 
				((ActWork[parts_act].oamData.CharNo +1)<< 5)+OBJ_MODE0_VRAM, 0x20, 32);
		}
	}
	GaugeGetBallTrans(actno, 0);
#endif
}

//----------------------------------------------------------
//	状態異常のパーツ取得のためのIDを取得
//----------------------------------------------------------
static u8 GetCondID(u8 cond_id, u8 client_no)
{
	u8 new_id = cond_id;
	
	switch(cond_id){
		case GP_DOKU:
			if(client_no == 0)
				new_id = GP_DOKU;
			else if(client_no == 1)
				new_id = GP_DOKU1;
			else if(client_no == 2)
				new_id = GP_DOKU2;
			else
				new_id = GP_DOKU3;
			break;
		case GP_MAHI:
			if(client_no == 0)
				new_id = GP_MAHI;
			else if(client_no == 1)
				new_id = GP_MAHI1;
			else if(client_no == 2)
				new_id = GP_MAHI2;
			else
				new_id = GP_MAHI3;
			break;
		case GP_NEMURI:
			if(client_no == 0)
				new_id = GP_NEMURI;
			else if(client_no == 1)
				new_id = GP_NEMURI1;
			else if(client_no == 2)
				new_id = GP_NEMURI2;
			else
				new_id = GP_NEMURI3;
			break;
		case GP_KOORI:
			if(client_no == 0)
				new_id = GP_KOORI;
			else if(client_no == 1)
				new_id = GP_KOORI1;
			else if(client_no == 2)
				new_id = GP_KOORI2;
			else
				new_id = GP_KOORI3;
			break;
		case GP_YAKEDO:
			if(client_no == 0)
				new_id = GP_YAKEDO;
			else if(client_no == 1)
				new_id = GP_YAKEDO1;
			else if(client_no == 2)
				new_id = GP_YAKEDO2;
			else
				new_id = GP_YAKEDO3;
			break;
	}
	return new_id;
}

//----------------------------------------------------------
//	サファリボール転送
//----------------------------------------------------------

void	GaugeSafariBallTrans(u8 actno)
{
	int	i;
	u8 j;
	u16	k;
	u8	*adr1;
	u32	adr2;
	u8 dakuten;
	
	adr1 = (void*)(GAUGE_DECORD_ADR + ((NAME_CHR_OFFSET << 5)
				+ 32 * 6 * 2 * ClientTypeGet(ActWork[actno].work[6])));

//	k=PM_strlen(SafariBallMsg);
	k=7;
	
	MsgCGXDataSet(adr1,(u8 *)&SafariBallMsg);	//ﾒｯｾｰｼﾞﾃﾞｰﾀ展開
	for(i = SEIGYO_TOPLEN, j = 0; j < k; i++)
	{
		if((SafariBallMsg[i] >= ga_ && SafariBallMsg[i] <= bo_)
			|| (SafariBallMsg[i] >= GA_ && SafariBallMsg[i] <= BO_))
		{	//濁点つきのｳｨﾝﾄﾞｳｷｬﾗを送る
			dakuten = GP_DAKUTEN;
		}
		else if((SafariBallMsg[i] >= pa_ && SafariBallMsg[i] <= po_)
			|| (SafariBallMsg[i] >= PA_ && SafariBallMsg[i] <= PO_))
		{	//半濁点つきのｳｨﾝﾄﾞｳｷｬﾗを送る
			dakuten = GP_HANDAKUTEN;
		}
		else
		{	//濁点なしのｳｨﾝﾄﾞｳｷｬﾗを送る
			dakuten = GP_TENNASI;
		}
		CpuCopy(GetGaugePartsAdrs(dakuten), &adr1[j * 0x40], 0x20, 32);
		j++;
	}

	for(i = 3; i < k+3; i++)
	{
		//濁点
		adr2=((ActWork[actno].oamData.CharNo+(i%8)+(0x40*(i/8))) << 5)
			 + OBJ_MODE0_VRAM ;
		CpuCopy(adr1,adr2,0x20,32);
		adr1+=0x20;
		
		//本文
		adr2=((ActWork[actno].oamData.CharNo+8+(i%8)+(0x40*(i/8))) << 5) + OBJ_MODE0_VRAM;
		CpuCopy(adr1,adr2,0x20,32);
		adr1+=0x20;
	}
}

void	GaugeNokoriBallTrans(u8 actno)
{
	int	i;
	u16	k;
	u8	*adr1;
	u32	adr2;

	adr1=PM_strcpy(FightMsgBuf,NokoriMsg);
	adr1=PM_NumMsgSet(adr1,SafariBallCount,NUM_MODE_SPACE,2);
	PM_strcat(adr1,NankoMsg);
	
	adr1 = (void*)(GAUGE_DECORD_ADR + ((NAME_CHR_OFFSET << 5)
				+ 32 * 6 * 2 * ClientTypeGet(ActWork[actno].work[6])));

	k=7;
	
	MsgCGXDataSet(adr1,(u8 *)&FightMsgBuf);	//ﾒｯｾｰｼﾞﾃﾞｰﾀ展開
	adr1+=0x20;
	for(i = 4; i < k+4; i++)
	{
		//本文
		adr2=((ActWork[actno].oamData.CharNo+0x18+(i%8)+(0x40*(i/8))) << 5) + OBJ_MODE0_VRAM;
		CpuCopy(adr1,adr2,0x20,32);
		adr1+=0x40;
	}
}

//==================================================================
//	ｹﾞｰｼﾞの転送ｷｬﾗをｾｯﾄする
// 引数 : actno = ｹﾞｰｼﾞのactno
//        *PokePara = 表示対象のﾎﾟｹﾓﾝのﾊﾟﾗﾒｰﾀのﾎﾟｲﾝﾀ
//        mode = 何を表示するか(gauge.hのenum参照)
// 戻り値 : なし
//==================================================================
void GaugeTransChrSet(u8 actno, PokemonParam *PokePara, u8 mode)
{
	u16 pokeno;
	u8 pokelevel;
	//u16 nowEXP, nextEXP;
	s32 nowEXP, nextEXP;
//	u8 parts;
	u8 client_no;
	
	client_no = ActWork[actno].work[6];
	if(mode == G_ALL){	// add 2002.07.24(水)
		if(FightCheck() == 0 && MineEnemyCheck(client_no) == SIDE_MINE)
			;
		else{
			//レベルアップ時に一瞬[HP]の部分が消えてしまうので削除
//			parts = ActWork[actno].work[5];
//			CpuClear(0, OBJ_MODE0_VRAM + ActWork[parts].oamData.CharNo*32, 8*32, 32);
		}
	}

	if(MineEnemyCheck(ActWork[actno].work[6]) == SIDE_MINE)	//user
	{
		if(mode == G_LV || mode == G_ALL)		//LV
			GaugeLevelTrans(actno, PokeParaGet(PokePara,ID_level));
	#if 1
		if(mode == G_HP || mode == G_ALL)		//HP(数字)
			GaugeHPTrans(actno, PokeParaGet(PokePara,ID_hp), 0);
		if(mode == G_MAXHP || mode == G_ALL)	//MAX HP(数字)
			GaugeHPTrans(actno, PokeParaGet(PokePara,ID_hpmax), 1);
	#endif
		if(mode == G_HPGAUGE || mode == G_ALL)	//HPｹﾞｰｼﾞ
		{
			BattleGaugeTransWram(0);
			GaugeDataSet(client_no, actno, PokeParaGet(PokePara,ID_hpmax), PokeParaGet(PokePara,ID_hp), 0);
			GaugeOBJ(client_no, actno, 0, 0);
		//	GaugeOFF(actno);
		}
		if(FightCheck() == 0 && (mode == G_EXPGAUGE || mode == G_ALL))	//EXPｹﾞｰｼﾞ
		{
			BattleGaugeTransWram(3);
			pokeno = PokeParaGet(PokePara,ID_monsno);
			pokelevel = PokeParaGet(PokePara,ID_level);
			nowEXP = PokeParaGet(PokePara,ID_exp) - GrowTbl[PPD[pokeno].grow][pokelevel];
			nextEXP = GrowTbl[PPD[pokeno].grow][pokelevel + 1] 
						- GrowTbl[PPD[pokeno].grow][pokelevel];
			GaugeDataSet(client_no, actno, nextEXP, nowEXP, 0);
			GaugeOBJ(client_no, actno, 1, 0);
		}
		if(mode == G_NAME || mode == G_ALL)				//NAME
			GaugePokeNameTrans(actno, PokePara);
		if(mode == G_STATUS || mode == G_ALL)			//状態異常
			GaugeStatusTrans(actno);
		if(mode == G_SAFARI)							//サファリボールメッセージ
			GaugeSafariBallTrans(actno);
		if(mode == G_SAFARI || mode == G_SAFARIBALL )	//サファリボール残り個数
			GaugeNokoriBallTrans(actno);
	}
	else
	{
		if(mode == G_LV || mode == G_ALL)		//LV
			GaugeLevelTrans(actno, PokeParaGet(PokePara,ID_level));
	#ifdef PM_DEBUG
		if(DebugMainFlag == 1){	//デバッグ用に敵のHPも数字で見られるようにした
			if(mode == G_HP || mode == G_ALL)		//HP(数字)
				GaugeHPTrans(actno, PokeParaGet(PokePara,ID_hp), 0);
			if(mode == G_MAXHP || mode == G_ALL)	//MAX HP(数字)
				GaugeHPTrans(actno, PokeParaGet(PokePara,ID_hpmax), 1);
		}
	#endif
		if(mode == G_HPGAUGE || mode == G_ALL)	//HPｹﾞｰｼﾞ
		{
			BattleGaugeTransWram(0);
			GaugeDataSet(client_no, actno, PokeParaGet(PokePara,ID_hpmax), PokeParaGet(PokePara,ID_hp), 0);
			GaugeOBJ(client_no, actno, 0, 0);
		//	GaugeOFF(actno);
		}
		if(mode == G_NAME || mode == G_ALL)		//NAME
			GaugePokeNameTrans(actno, PokePara);
	/*	//敵のｹﾞｯﾄ済みﾎﾞｰﾙはｽﾃｰﾀｽ異常で呼ばれるからここではいらないかも
		if(mode == G_GETCHKBALL || mode == G_ALL)	//ｹﾞｯﾄ済みかのﾎﾞｰﾙ
			GaugeGetBallTrans(actno, 1);
	*/
		if(mode == G_STATUS || mode == G_ALL)	//状態異常
			GaugeStatusTrans(actno);
	}
}























//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#if GAUGE_SOKUDO_TYPE

//	↓常に一定速度のバージョン

//=========================================================================
//	バトル画面用ゲージ
// ※あらかじめ転送するｹﾞｰｼﾞｷｬﾗをﾜｰｸﾗﾑに展開しておくこと!!
// req_data = 0:HPｹﾞｰｼﾞ  1:Expｹﾞｰｼﾞ
//=========================================================================
#define BATTLE_GAUGE_HPMAX	6
#define BATTLE_GAUGE_EXPMAX	8
#define BATTLE_GAUGE_MAX	BATTLE_GAUGE_EXPMAX		//ﾊﾞﾄﾙのｹﾞｰｼﾞで一番大きいｹﾞｰｼﾞ

s32 GaugeOBJ(u8 client_no, u8 actno, u8 req_data, u16 *pl_buf)
{
	s32 temp;
	u16 dotto_offset;
	
	if(req_data == 0)
		temp = GaugeProc(gwork[client_no].MaxHP, gwork[client_no].NowHP, gwork[client_no].beHP,
					 &gwork[client_no].HP_Work, BATTLE_GAUGE_HPMAX, 1);
	else{	//EXP
		//EXPｹﾞｰｼﾞは計算数値が大きいので、ﾄﾞｯﾄのｵﾌｾｯﾄから何Syncで終わらせるかを決める
		dotto_offset = DottoOffsetCalc(gwork[client_no].NowHP, gwork[client_no].beHP, gwork[client_no].MaxHP,
				BATTLE_GAUGE_EXPMAX);
		if(dotto_offset == 0)
			dotto_offset = 1;
		dotto_offset = abs(gwork[client_no].beHP / dotto_offset);
		temp = GaugeProc(gwork[client_no].MaxHP, gwork[client_no].NowHP, gwork[client_no].beHP,
				&gwork[client_no].HP_Work, BATTLE_GAUGE_EXPMAX, dotto_offset);
	}
	
	if(req_data == 1 || (req_data == 0 && Climem[client_no].gauge_mode == 0))
		PutGaugeOBJ(client_no, req_data);
	
	if(temp == -1)
		gwork[client_no].HP_Work = 0;
	return temp;
}


//==================================================================
//		ゲージ表示
//
// 引数 : 
// 戻り値 : なし
//==================================================================
void PutGaugeOBJ(u8 client_no, u8 req)
{
	u8 i;
	u8 gauge_chr[BATTLE_GAUGE_MAX];
	u8 parts, parts_num;
	u8 put_dot;
	u8 level;
	
	if(1)//MineEnemyCheck(ActWork[gwork[client_no].actno].work[6]) == SIDE_MINE)	//user
	{
		switch(req)
		{
			case 0:	//HP
				put_dot = PutGaugeProc(gwork[client_no].MaxHP, gwork[client_no].NowHP, gwork[client_no].beHP,
					 &gwork[client_no].HP_Work, gauge_chr, BATTLE_GAUGE_HPMAX);
				
				//※※ここの計算式を変えたらGetGaugeDottoColorも変更すること!!
				if(put_dot > GAUGE_DOTTOMAX / 2)	//2002.07.11(木) by matsuda
					parts_num = GP_HPBAR;
				else if(put_dot > 9)
					parts_num = GP_HPBAR_YELLOW;
				else
					parts_num = GP_HPBAR_RED;
				for(i = 0; i < BATTLE_GAUGE_HPMAX; i++)
				{
					parts = ActWork[gwork[client_no].actno].work[5];
					if(i < 2)
					{
						CpuCopy((void*)(GetGaugePartsAdrs(parts_num) 
							+ (gauge_chr[i] << 5)),
							((ActWork[parts].oamData.CharNo 
							+ 2 + i) << 5) + OBJ_MODE0_VRAM, 0x20, 32);
					}else
					{
						CpuCopy((void*)(GetGaugePartsAdrs(parts_num)
							 + (gauge_chr[i] << 5)),
							 ((ActWork[parts].oamData.CharNo 
							 + 4 + i-2) << 5) + OBJ_MODE0_VRAM, 0x20, 32);
					}
				}
				break;
			case 1:	//Exp
				PutGaugeProc(gwork[client_no].MaxHP, gwork[client_no].NowHP, gwork[client_no].beHP, &gwork[client_no].HP_Work,
					 gauge_chr, BATTLE_GAUGE_EXPMAX);
				level = PokeParaGet(&PokeParaMine[SelMonsNo[client_no]], ID_level);
				if(level == 100){
					for(i = 0; i < BATTLE_GAUGE_EXPMAX; i++)
						gauge_chr[i] = 0;
				}
				for(i = 0; i < BATTLE_GAUGE_EXPMAX; i++)
				{
					if(i < 4){
/*						DIV_DMACOPY(3, 
							(void*)(GetGaugePartsAdrs(GP_EXPBAR) + (gauge_chr[i] << 5)),
							((ActWork[gwork[client_no].actno].oamData.CharNo +0x24 + i) << 5)
							+ OBJ_MODE0_VRAM, 0x20, 32);
*/
						CpuCopy(
							(void*)(GetGaugePartsAdrs(GP_EXPBAR) + (gauge_chr[i] << 5)),
							((ActWork[gwork[client_no].actno].oamData.CharNo +0x24 + i) << 5)
							+ OBJ_MODE0_VRAM, 0x20, 32);
					}else{
/*						DIV_DMACOPY(3, 
							(void*)(GetGaugePartsAdrs(GP_EXPBAR) + (gauge_chr[i] << 5)),
							((ActWork[gwork[client_no].actno].oamData.CharNo +0x60 + i-4) << 5)
							+ OBJ_MODE0_VRAM, 0x20, 32);
*/
						CpuCopy(
							(void*)(GetGaugePartsAdrs(GP_EXPBAR) + (gauge_chr[i] << 5)),
							((ActWork[gwork[client_no].actno].oamData.CharNo +0x60 + i-4) << 5)
							+ OBJ_MODE0_VRAM, 0x20, 32);
					}
				}
				break;
		}
	}
	else
	{
		PutGaugeProc(gwork[client_no].MaxHP, gwork[client_no].NowHP, gwork[client_no].beHP, &gwork[client_no].HP_Work,
				 gauge_chr, BATTLE_GAUGE_HPMAX);

		for(i = 0; i < BATTLE_GAUGE_HPMAX; i++)
		{
			if(i < 4)
			{
				CpuCopy(
					(void*)(GAUGE_DECORD_ADR + ((gauge_chr[i]+HP_CHR_OFFSET) << 5)),
					((ActWork[gwork[client_no].actno].oamData.CharNo 
					+ ENEMY_HPGAUGE_POS1 + i) << 5) + OBJ_MODE0_VRAM, 0x20, 32);
			}
			else
			{
				CpuCopy(
					(void*)(GAUGE_DECORD_ADR + ((gauge_chr[i]+HP_CHR_OFFSET) << 5)),
					((ActWork[gwork[client_no].actno].oamData.CharNo 
					+ ENEMY_HPGAUGE_POS2 + (i-4)) << 5) + OBJ_MODE0_VRAM, 0x20, 32);
			}
		}
	}
}


//==================================================================
//			ゲージ計算		※BG,OBJ共通
//	HP_Work : MaxHPがGaugeMax*8以上なら、現状のｲﾝｸﾘﾒﾝﾄ、ﾃﾞｸﾘﾒﾝﾄされてる値が
//	入ってる。GaugeMax*8未満の時は下位8ﾋﾞｯﾄ少数で上位8ﾋﾞｯﾄにｲﾝｸﾘﾒﾝﾄ、
//	ﾃﾞｸﾘﾒﾝﾄされてる値が入る。
//	add_dec : ｹﾞｰｼﾞを加減算していく値 GaugeDottoがGaugeMax以下の場合は無視する
//
//	戻り値: -1 = 終了	それ以外：計算途中の数字(画面に出す数値)
//==================================================================
static s32 GaugeProc(s32 MaxHP, s32 NowHP, s32 beHP, s32 *HP_Work, u8 GaugeMax, u16 add_dec)
{
//	s16 endHP;
	s32 endHP;	//2002.09.14(土)
	s32 ret;
	u8 GaugeMaxDot;
	s32 add_hp;
	
	GaugeMaxDot = GaugeMax * GAUGE_DOTTO;
	
	//-- HP_WorkとNowHPが同一の時は初回なのでﾜｰｸを初期化 --//
//	if(*HP_Work == NowHP){
//		if(MaxHP < GaugeMaxDot)
//			*HP_Work <<= 8;
//	}
	if(*HP_Work == HP_WORK_INIT_VALUE){
		if(MaxHP < GaugeMaxDot)
			*HP_Work = NowHP << 8;
		else
			*HP_Work = NowHP;
	}

	//-- 終了ﾁｪｯｸ --//
	endHP = NowHP - beHP;
	if(endHP < 0)
		endHP = 0;
	else if(endHP > MaxHP)
		endHP = MaxHP;
	
	if(MaxHP < GaugeMaxDot){			//↓少数部分もﾁｪｯｸ
		if(endHP == (*HP_Work >> 8) && (*HP_Work & 0xff) == 0)
			return (-1);
	}
	else{
		if(endHP == *HP_Work)
			return (-1);
	}
	//-- 終了ﾁｪｯｸ終了 --//
	
	if(MaxHP < GaugeMaxDot){
		add_hp = MaxHP * 0x100 / GaugeMaxDot;
		if(beHP < 0){	//ｹﾞｰｼﾞ回復
			*HP_Work += add_hp;
			ret = *HP_Work >> 8;
			if(ret >= endHP){	//少数を扱っているのでｵｰﾊﾞｰﾌﾛｰﾁｪｯｸ
				*HP_Work = endHP << 8;
				ret = endHP;
			}
		}
		else{					//ｹﾞｰｼﾞ減少
			*HP_Work -= add_hp;
			ret = *HP_Work >> 8;
			if((*HP_Work & 0xff) > 0)	//少数部分があるなら少数繰り上げで表示
				ret++;
			if(ret <= endHP){	//少数を扱っているのでｵｰﾊﾞｰﾌﾛｰﾁｪｯｸ
				*HP_Work = endHP << 8;
				ret = endHP;
			}
		}
	}
	else{
		if(beHP < 0){		//ｹﾞｰｼﾞ回復
			*HP_Work += add_dec;
			if(*HP_Work > endHP)
				*HP_Work = endHP;
		}
		else{				//ｹﾞｰｼﾞ減少
			*HP_Work -= add_dec;
			if(*HP_Work < endHP)
				*HP_Work = endHP;
		}
		ret = *HP_Work;
	}
	return ret;
}


//=========================================================================
//	ｹﾞｰｼﾞ表示計算	※BG,OBJ共通
//
//  *gauge_chrに表示するｹﾞｰｼﾞの値が入って返る
//    0:空っぽのｹﾞｰｼﾞ  1:1ﾄﾞｯﾄのｹﾞｰｼﾞ 2:2ﾄﾞｯﾄのｹﾞｰｼﾞ ･･･ 8:8ﾄﾞｯﾄ(満ﾀﾝ)のｹﾞｰｼﾞ
//
//	戻り値:表示するドット数
//=========================================================================
static u8 PutGaugeProc(s32 MaxHP, s32 NowHP, s32 beHP, s32 *HP_Work,
	 u8 *gauge_chr, u8 GaugeMax)
{
	u8 i;
	u8 GaugeMaxDot;
	u8 put_dot, dot_ret;		//表示するﾄﾞｯﾄ数
	s32 AfterHP;
	
	AfterHP = NowHP - beHP;
	if(AfterHP < 0)
		AfterHP = 0;
	else if(AfterHP > MaxHP)
		AfterHP = MaxHP;

	GaugeMaxDot = GAUGE_DOTTO * GaugeMax;
	for(i = 0; i < GaugeMax; i++)	//空白ｹﾞｰｼﾞで初期化
		gauge_chr[i] = 0;

	//※※ここのドット取得の計算式を変更したらGetNumDottoの計算式も変更すること!!
	if(MaxHP < GaugeMaxDot)	// by 2002.07.11(木) matsuda
		put_dot = (*HP_Work * GaugeMaxDot / MaxHP) >> 8;
	else
		put_dot = *HP_Work * GaugeMaxDot / MaxHP;
	dot_ret = put_dot;
	//ﾄﾞｯﾄ計算では0でも、実際のHPが1以上あるなら1ﾄﾞｯﾄのｹﾞｰｼﾞを表示する
	if(put_dot == 0 && AfterHP > 0){
		gauge_chr[0] = 1;
		dot_ret = 1;
	}else{
		for(i = 0; i < GaugeMax; i++){
			if(put_dot >= GAUGE_DOTTO){
				gauge_chr[i] = 8;
				put_dot -= GAUGE_DOTTO;
			}
			else{
				gauge_chr[i] = put_dot;
				break;	//ﾄﾞｯﾄが尽きたので抜ける
			}
		}
	}
	return dot_ret;
}




//==================================================================
//			ゲージ計算･表示(BG用)
//
//    ※ HP_Work:ﾜｰｸとして使用 ※初回はHP_WORK_INIT_VALUEを入れておくこと
//
// 引数 : MaxHP:最大HP
//		  NowHP:現在HP(ﾀﾞﾒｰｼﾞを受ける前)
//		  beHP:受けたﾀﾞﾒｰｼﾞ(回復する場合はﾏｲﾅｽで入れる)
//        *HP_Work : 途中経過を保存させる為のﾜｰｸ　※初回は0を入れておくこと!!
//		  *TransPos:ｹﾞｰｼﾞを表示させるｽｸﾘｰﾝﾃﾞｰﾀの座標
//		  TopChr:ｹﾞｰｼﾞのｷｬﾗのﾄｯﾌﾟｱﾄﾞﾚｽ
//		  *pl_buf:ﾊﾟﾚｯﾄﾊﾞｯﾌｧ
// 戻り値 : -1:終了		0以上の数値:ｹﾞｰｼﾞと一緒に表示させる数値の値
//==================================================================
s16 GaugeBG(GaugeDataBG *gdata, s32 *HP_Work, u16 *TransPos, u16 *pl_buf)
{
	s16 temp;
	u16 resultHP;

	temp = GaugeProc(gdata->MaxHP, gdata->NowHP, gdata->beHP, HP_Work, GAUGE_MAX, 1);
	PutGaugeBG(gdata, HP_Work, TransPos);
	
	if(gdata->MaxHP < GAUGE_DOTTO * GAUGE_MAX)
		resultHP = *HP_Work >> 8;
	else
		resultHP = *HP_Work;
	GaugeColChk(gdata->MaxHP, resultHP, pl_buf);
	
//	if(temp == -1)
//		*HP_Work = 0;
	return temp;
}

//==================================================================
//		ゲージ表示(ｽｸﾘｰﾝﾃﾞｰﾀを変更する)
//
// 引数 : GAUGE_TOPCHR:ｹﾞｰｼﾞの最初のｷｬﾗが登録されているｷｬﾗﾅﾝﾊﾞｰ
// 戻り値 : なし
//==================================================================
static void PutGaugeBG(GaugeDataBG *gdata, s32 *HP_Work, u16 *TransPos)
{
	u8 gauge_chr[GAUGE_MAX];
	u16 DummyScrn[GAUGE_MAX];
	u8 i;

	PutGaugeProc(gdata->MaxHP, gdata->NowHP, gdata->beHP, HP_Work, gauge_chr, GAUGE_MAX);
	for(i = 0; i < GAUGE_MAX; i++)
		DummyScrn[i] = (gdata->color << 12) | (gdata->CharNo + gauge_chr[i]);
//	DIV_DMACOPY(3, DummyScrn, TransPos, GAUGE_MAX*2, 16);
	CpuCopy(DummyScrn, TransPos, GAUGE_MAX*2, 16);
}

//=========================================================================
//	ｹﾞｰｼﾞ計算前と計算後の最終的なﾄﾞｯﾄの差分を求める
//=========================================================================
static u8 DottoOffsetCalc(s32 nowHP, s32 beHP, s32 MaxHP, u8 GaugeMax)
{
	s8 now_dotto, end_dotto;
	u8 GaugeMaxDot;
	s32 endHP;
	GaugeMaxDot = GaugeMax * GAUGE_DOTTO;

	endHP = nowHP - beHP;
	if(endHP < 0)
		endHP = 0;
	else if(endHP > MaxHP)
		endHP = MaxHP;
	now_dotto = nowHP * GaugeMaxDot / MaxHP;
	end_dotto = endHP * GaugeMaxDot / MaxHP;
	return (abs(now_dotto - end_dotto));
}

//=========================================================================
//=========================================================================
//=========================================================================
//=========================================================================
//=========================================================================
//=========================================================================
//=========================================================================
//=========================================================================
//=========================================================================
//=========================================================================
#else	//↓最初速く、だんだん減速していくバージョン
//=========================================================================
//=========================================================================
//=========================================================================
//=========================================================================
//=========================================================================
//=========================================================================
//=========================================================================


/* 色変えように通常のｺﾒﾝﾄでもかこっとく

//==================================================================
//			ゲージ計算･表示(OBJ用)
//
//    ※ HP_Work:ﾜｰｸとして使用 ※0だとﾜｰｸの初期化が行われる 初回は0を入れておくこと
//
// 引数 : MaxHP:最大HP
//		  NowHP:現在HP(ﾀﾞﾒｰｼﾞを受ける前)
//		  beHP:受けたﾀﾞﾒｰｼﾞ(回復する場合はﾏｲﾅｽで入れる)
//        *HP_Work : ﾜｰｸのｱﾄﾞﾚｽ(ｹﾞｰｼﾞの途中経過のﾃﾞｰﾀが入る)
//								上位0～3ﾋﾞｯﾄ 下げ率、 4～7 ﾌﾗｸﾞ、 8～15 分子 で使用する
//		  *TransPos:ｹﾞｰｼﾞを表示させるｽｸﾘｰﾝﾃﾞｰﾀの座標
//		  TopChr:ｹﾞｰｼﾞのｷｬﾗのﾄｯﾌﾟｱﾄﾞﾚｽ
//		  *pl_buf:ﾊﾟﾚｯﾄﾊﾞｯﾌｧ
// 戻り値 : -1:終了		0以上の数値:ｹﾞｰｼﾞと一緒に表示させる数値の値
//==================================================================

//=========================================================================
//	バトル画面用ゲージ
// ※あらかじめ転送するｹﾞｰｼﾞｷｬﾗをﾜｰｸﾗﾑに展開しておくこと!!
// req_data = 0:HPｹﾞｰｼﾞ  1:Expｹﾞｰｼﾞ
//=========================================================================
#define BATTLE_GAUGE_HPMAX	6
#define BATTLE_GAUGE_EXPMAX	8
#define BATTLE_GAUGE_MAX	BATTLE_GAUGE_EXPMAX		//ﾊﾞﾄﾙのｹﾞｰｼﾞで一番大きいｹﾞｰｼﾞ
s16 GaugeOBJ(u8 actno, u8 req_data, u16 *pl_buf)
{
	GaugeDataOBJ *gdata;
	GaugeDataOBJ2 gdata2;
	
//	gdata = (GaugeDataOBJ *)&ActWork[ActWork[actno].work[7]].work[0];
	gdata = (GaugeDataOBJ *)&ActWork[actno].work[0];
	
	if(((gdata->HP_Work) & 0x00ff) == DEFAULT_BUNBO)	//終了ﾁｪｯｸ
	{	//ここでﾁｪｯｸしているのは全ての数字を戻り値として返す為1週させている
		gdata->HP_Work = 0;
		return -1;	//全てのｹﾞｰｼﾞを終了し終わった
	}
	
	if(gdata->beHP < 0)	//回復	ｹﾞｰｼﾞ増やす
	{
		GaugeProc(gdata, &gdata2, 1);
		PutGaugeOBJ(gdata, &gdata2, ((gdata->HP_Work) & 0x00ff), req_data);
	}
	else	//ﾀﾞﾒｰｼﾞ  ｹﾞｰｼﾞ減らす
	{
		GaugeProc(gdata, &gdata2, -1);
		PutGaugeOBJ(gdata, &gdata2, DEFAULT_BUNBO - ((gdata->HP_Work) & 0x00ff), req_data);
	}
	
//	GaugeColChk(gdata->MaxHP, resultHP, pl_buf);	いまはｶﾗｰ変更しない
	
	if(gdata->beHP == 0)
	{	//beHPが0ならば今のｹﾞｰｼﾞを表示するだけなので今回のﾙｰﾌﾟで終わりにする
		gdata->HP_Work = ((gdata->HP_Work) & 0xff00) | DEFAULT_BUNBO;
	}
	return gdata2.resultHP;
}

//==================================================================
//		ゲージ表示
//
// 引数 : 
// 戻り値 : なし
//==================================================================
static void PutGaugeOBJ(GaugeDataOBJ *gdata, GaugeDataOBJ2 *gdata2, u8 Bunsi, u8 req)
{
	u8 i;
	u8 gauge_chr[BATTLE_GAUGE_MAX];
	u8 parts;

//	i = PutGaugeProc(gdata, gdata2, Bunsi, gauge_chr, GaugeMax);
//	if(i == 1)
//	{
//		return;
//	}
	
#if 0
	if((ActWork[gdata->actno].work[6] & 1) == 0)	//user
#else	//changed by soga 2001.09.26
	if(1)//MineEnemyCheck(ActWork[gdata->actno].work[6]) == SIDE_MINE)	//user
#endif
	{
		switch(req)
		{
			case 0:	//HP
				i = PutGaugeProc(gdata, gdata2, Bunsi, gauge_chr, BATTLE_GAUGE_HPMAX);
				if(i == 1)
				{
					return;
				}
				
				for(i = 0; i < BATTLE_GAUGE_HPMAX; i++)
				{
					parts = ActWork[gdata->actno].work[5];
					if(i < 2)
					{
						DmaTransReq(
							(void*)(GetGaugePartsAdrs(GP_HPBAR) + (gauge_chr[i] << 5)),
							((ActWork[parts].oamData.CharNo 
							+ 2 + i) << 5) + OBJ_MODE0_VRAM, 0x20);
					}else
					{
						DmaTransReq(
							(void*)(GetGaugePartsAdrs(GP_HPBAR) + (gauge_chr[i] << 5)),
							((ActWork[parts].oamData.CharNo 
							+ 8 + i-2) << 5) + OBJ_MODE0_VRAM, 0x20);
					}
				}
				break;
			case 1:	//Exp
				i = PutGaugeProc(gdata, gdata2, Bunsi, gauge_chr, BATTLE_GAUGE_EXPMAX);

				for(i = 0; i < BATTLE_GAUGE_EXPMAX; i++)
				{
					if(i == 0 && gauge_chr[0] == 1)	//EXPはHPｹﾞｰｼﾞよりも1/2のため
						gauge_chr[0] = 2;	//実際のｹﾞｰｼﾞ値が0でないなら最低1ﾒﾓﾘは表示
					gauge_chr[i] /= 2;
					DmaTransReq(
						(void*)(GetGaugePartsAdrs(GP_EXPBAR) + (gauge_chr[i] << 5)),
						((ActWork[gdata->actno].oamData.CharNo +0x33 + i) << 5)
						+ OBJ_MODE0_VRAM, 0x20);
				}
				break;
		}
	}
	else
	{
		i = PutGaugeProc(gdata, gdata2, Bunsi, gauge_chr, BATTLE_GAUGE_HPMAX);
		if(i == 1)
		{
			return;
		}

		for(i = 0; i < BATTLE_GAUGE_HPMAX; i++)
		{
			if(i < 4)
			{
				DmaTransReq(
					(void*)(GAUGE_DECORD_ADR + ((gauge_chr[i]+HP_CHR_OFFSET) << 5)),
						((ActWork[gdata->actno].oamData.CharNo 
							+ ENEMY_HPGAUGE_POS1 + i) << 5) + OBJ_MODE0_VRAM, 0x20);
			}
			else
			{
				DmaTransReq(
					(void*)(GAUGE_DECORD_ADR + ((gauge_chr[i]+HP_CHR_OFFSET) << 5)),
						((ActWork[gdata->actno].oamData.CharNo 
							+ ENEMY_HPGAUGE_POS2 + (i-4)) << 5) + OBJ_MODE0_VRAM, 0x20);
			}
		}
	}
}





//=========================================================================
//	ｹﾞｰｼﾞ表示計算
//   ※GaugeProcは下げ率からﾊﾟﾗﾒｰﾀｰの加減算された値を求める
//     PutGaugeProcはGaugeProcから求め出された値をｹﾞｰｼﾞという絵に表すための計算
//
//  *gauge_chrに表示するｹﾞｰｼﾞの値が入って返る
//    0:空っぽのｹﾞｰｼﾞ  1:1ﾄﾞｯﾄのｹﾞｰｼﾞ 2:2ﾄﾞｯﾄのｹﾞｰｼﾞ ･･･ 8:8ﾄﾞｯﾄ(満ﾀﾝ)のｹﾞｰｼﾞ
//=========================================================================
static s8 PutGaugeProc(GaugeDataOBJ *gdata, GaugeDataOBJ2 *gdata2, u8 Bunsi, 
								u8 *gauge_chr, u8 GaugeMax)
{
	u8 i;
	u8 gauge_power, HP_power, Now_power, temp;
	u8 GaugeParsent;
	
	GaugeParsent = GAUGE_DOTTO * GaugeMax;
	
	for(i = 0; i < GaugeMax; i++)	//空白ｹﾞｰｼﾞで初期化
	{
		gauge_chr[i] = 0;
	}

#if 0	//EXPｹﾞｰｼﾞが0から増えていく場合などにおいて1に至るまでの途中経過が出ないので
	if(gdata2->resultHP == 0)
	{
		return 1;	//強制終了
	}
#endif
	
	if(gdata->NowHP > gdata2->AfterHP)
	{	//↓ｹﾞｰｼﾞが動かない部分が所有するHPの割合
		Now_power = PERCENT_CONV(gdata2->AfterHP, gdata->MaxHP, 100);
//		Now_power = 100 * gdata2->AfterHP / gdata->MaxHP;
		HP_power = PERCENT_CONV(gdata->NowHP, gdata->MaxHP, 100);
//		HP_power = 100 * gdata->NowHP / gdata->MaxHP;
		HP_power -= Now_power;				//ｹﾞｰｼﾞが変動する部分が所有するHPの割合
	}
	else
	{
		//ｹﾞｰｼﾞが動かない部分が所有するHPの割合
		Now_power = PERCENT_CONV(gdata->NowHP, gdata->MaxHP, 100);
		HP_power = PERCENT_CONV(gdata2->AfterHP, gdata->MaxHP, 100);
	//	Now_power= 100 * gdata->NowHP / gdata->MaxHP;//ｹﾞｰｼﾞが動かない部分が所有するHPの割合
	//	HP_power = 100 * gdata2->AfterHP / gdata->MaxHP;
		HP_power -= Now_power;				//ｹﾞｰｼﾞが変動する部分が所有するHPの割合
	}
	//DEFAULT_BUNBO分のBunsiを100%分のBunsiに変える
	temp = PERCENT_CONV(Bunsi, DEFAULT_BUNBO, 100);
	//Bunsiからｹﾞｰｼﾞが表示される部分までの%を求める
	HP_power = PERCENT_CONV(temp, 100, HP_power);
//	temp = 100 * Bunsi / DEFAULT_BUNBO;	//DEFAULT_BUNBO分のBunsiを100%分のBunsiに変える
//	HP_power = HP_power * temp / 100;	//Bunsiからｹﾞｰｼﾞが表示される部分までの%を求める
	HP_power += Now_power;	//表示するﾊﾟｰｾﾝﾃｰｼﾞ

	
	for(i = 1; i <= GaugeMax; i++)
	{
		gauge_power = 100 * i / GaugeMax;	//ｹﾞｰｼﾞｶｳﾝﾄまでが所有するHPの割合量
		
		if(HP_power < gauge_power)
		{
			//iｷｬﾗ数までに余ってしまった数を求める(1ｷｬﾗまるまるを埋められない端数)
			HP_power -= 100 * (i - 1) / GaugeMax;	//何%余ってるのか
			HP_power = GaugeParsent * HP_power / 100;
			
			if(i == 1 && HP_power == 0 && gdata2->AfterHP > 0)
			{	//ﾊﾟｰｾﾝﾃｰｼﾞでは0でも、実際のHPが1以上あるなら1ﾄﾞｯﾄのｹﾞｰｼﾞを表示する
				gauge_chr[i-1] = 1;
			}
			else
			{	//通常
				gauge_chr[i-1] = HP_power;
			}
			break;
		}
		else
		{
			gauge_chr[i-1] = 8;
		}
	}
	
	return 0;	//正常終了
}



//=========================================================================
//	BG,OBJ共通計算ルーチン
//=========================================================================

//==================================================================
//			ゲージ計算
//	Direction:ｹﾞｰｼﾞを動かす正負の向き(1 か -1)  ※ 0禁止!!
//==================================================================
static void GaugeProc(GaugeDataOBJ *gdata, GaugeDataOBJ2 *gdata2, s8 Direction)
{
	GaugeProcSub(&gdata->HP_Work);
	
	if(Direction > 0)	//ｹﾞｰｼﾞ回復
	{
		if(gdata->NowHP + (-gdata->beHP) > gdata->MaxHP)
		{
			gdata->beHP = -(gdata->MaxHP - gdata->NowHP);
		}
		gdata2->AfterHP = gdata->NowHP + (-gdata->beHP);
		
		gdata2->resultHP = gdata->NowHP + (-gdata->beHP) 
								* (gdata->HP_Work&0x00ff) / DEFAULT_BUNBO;
		if(gdata2->resultHP > gdata->MaxHP)
		{
			gdata2->resultHP = gdata->MaxHP;
		}
	}
	else				//ｹﾞｰｼﾞ減らす
	{
		if(gdata->NowHP - gdata->beHP < 0)
		{
			gdata->beHP = gdata->NowHP;
		}
		gdata2->AfterHP = gdata->NowHP - gdata->beHP;

		gdata2->resultHP = gdata->NowHP - gdata->beHP
								* (gdata->HP_Work&0x00ff) / DEFAULT_BUNBO;
		if(gdata2->resultHP < gdata2->AfterHP)
		{
			gdata2->resultHP = gdata2->AfterHP;
		}
	}
}
//=========================================================================
//		ｹﾞｰｼﾞの下げ(上げ)率取得
//=========================================================================
static void GaugeProcSub(u16 *HP_Work)
{
	u8 param, flg, bunsi;
	
	if(*HP_Work == 0)	//ﾜｰｸ初期化
	{
		*HP_Work = DEFAULT_DOWN_PARAM << 12;//8;	//最初の下げ率をｾｯﾄ
	}

	bunsi = (*HP_Work) & 0x00ff;
	flg = (((*HP_Work) & 0x0f00) >> 8);
	param = (*HP_Work) >> 12;	//下げ率
	
	if(bunsi > NEXT_BUNSI1)
	{
		if(flg == 0)	//ﾌﾗｸﾞﾁｪｯｸ
		{
			param -= DOWN_BUNSI_PARAM;
			flg++;
		}
		else if(param > 1 && (bunsi >= (NEXT_BUNSI1 + BUNSI_HABA * flg)))
		{
			if(param - DOWN_BUNSI_PARAM < 1)
			{
				param = 1;
			}
			else
			{
				param -= DOWN_BUNSI_PARAM;
				flg++;
			}
		}
	}
	
	flg &= 0xf;
	bunsi &= 0xff;
	param &= 0xf;
	
	if(bunsi + param > DEFAULT_BUNBO)
	{
		bunsi = DEFAULT_BUNBO;
	}
	else
	{
		bunsi += param;
	}
	
	*HP_Work = ((param << 12) | (flg << 8) | bunsi);
}



//==================================================================
//			ゲージ計算･表示(BG用)
//
//    ※ HP_Work:ﾜｰｸとして使用 ※0だとﾜｰｸの初期化が行われる 初回は0を入れておくこと
//
// 引数 : MaxHP:最大HP
//		  NowHP:現在HP(ﾀﾞﾒｰｼﾞを受ける前)
//		  beHP:受けたﾀﾞﾒｰｼﾞ(回復する場合はﾏｲﾅｽで入れる)
//        *HP_Work : ﾜｰｸのｱﾄﾞﾚｽ(ｹﾞｰｼﾞの途中経過のﾃﾞｰﾀが入る)
//								上位0～3ﾋﾞｯﾄ 下げ率、 4～7 ﾌﾗｸﾞ、 8～15 分子 で使用する
//		  *TransPos:ｹﾞｰｼﾞを表示させるｽｸﾘｰﾝﾃﾞｰﾀの座標
//		  TopChr:ｹﾞｰｼﾞのｷｬﾗのﾄｯﾌﾟｱﾄﾞﾚｽ
//		  *pl_buf:ﾊﾟﾚｯﾄﾊﾞｯﾌｧ
// 戻り値 : -1:終了		0以上の数値:ｹﾞｰｼﾞと一緒に表示させる数値の値
//==================================================================
//s16 GaugeBG(s16 MaxHP, s16 NowHP, s16 beHP, u16 *HP_Work, 
//										u16 *TransPos, u16 TopChr, u16 *pl_buf)
s16 GaugeBG(GaugeDataBG *gdata, u16 *HP_Work, u16 *TransPos, u16 *pl_buf)
{
	s16 AfterHP, resultHP;
	u8 temp;

	
	if(((*HP_Work) & 0x00ff) == DEFAULT_BUNBO)	//終了ﾁｪｯｸ
	{	//ここでﾁｪｯｸしているのは全ての数字を戻り値として返す為1週させている
		return -1;	//全てのｹﾞｰｼﾞを終了し終わった
	}
	
	
	if(gdata->beHP < 0)	//回復	ｹﾞｰｼﾞ増やす
	{
		if(gdata->NowHP + (-gdata->beHP) > gdata->MaxHP)
						// -gdata->beHP = -(-gdata->beHP) = 正の数値のgdata->beHP
		{
			gdata->beHP = -(gdata->MaxHP - gdata->NowHP);
		}
		AfterHP = gdata->NowHP + (-gdata->beHP);
		
//fff		GaugeProcSub(HP_Work);				//←↓今回のﾙｰﾌﾟで表示するｹﾞｰｼﾞ
		resultHP = gdata->NowHP + (-gdata->beHP) * (*HP_Work&0x00ff) / DEFAULT_BUNBO;
		if(resultHP > gdata->MaxHP)
		{
			resultHP = gdata->MaxHP;
		}
		
		PutGaugeBG(gdata, AfterHP, resultHP, TransPos, ((*HP_Work) & 0x00ff));
	}
	else	//ﾀﾞﾒｰｼﾞ  ｹﾞｰｼﾞ減らす
	{
		if(gdata->NowHP - gdata->beHP < 0)
		{
			gdata->beHP = gdata->NowHP;
		}
		AfterHP = gdata->NowHP - gdata->beHP;	//ﾀﾞﾒｰｼﾞ後のHP
				
//fff		GaugeProcSub(HP_Work);				//←↓今回のﾙｰﾌﾟで表示するｹﾞｰｼﾞ
		resultHP = gdata->NowHP - gdata->beHP * (*HP_Work&0x00ff) / DEFAULT_BUNBO;
		if(resultHP < AfterHP)
		{
			resultHP = AfterHP;
		}
		
		temp = DEFAULT_BUNBO - ((*HP_Work) & 0x00ff);
		PutGaugeBG(gdata, AfterHP, resultHP, TransPos, temp);
	}
	
//	temp = DEFAULT_BUNBO - ((*HP_Work) & 0x00ff);
//	PutGaugeBG(gdata->MaxHP, AfterHP, resultHP, TransPos, GAUGE_TOPCHR, gdata->NowHP, temp);
	GaugeColChk(gdata->MaxHP, resultHP, pl_buf);
	
	if(gdata->beHP == 0)
	{	//beHPが0ならば今のｹﾞｰｼﾞを表示するだけなので今回のﾙｰﾌﾟで終わりにする
		*HP_Work = ((*HP_Work) & 0xff00) | DEFAULT_BUNBO;
	}
	return resultHP;
}


//==================================================================
//		ゲージ表示(ｽｸﾘｰﾝﾃﾞｰﾀを変更する)
//
// 引数 : GAUGE_TOPCHR:ｹﾞｰｼﾞの最初のｷｬﾗが登録されているｷｬﾗﾅﾝﾊﾞｰ
// 戻り値 : なし
//==================================================================
void PutGaugeBG(GaugeDataBG *gdata, s16 AfterHP, s16 resultHP, u16 *TransPos, u8 Bunsi)
{
	u8 gauge_count;
	u8 i;
	u8 gauge_power, HP_power, Now_power, temp;
//	u8 put_work;
	u16 DummyScrn[GAUGE_MAX];
	vu8 dma_wait;
	
	gauge_count = 0;
	
	for(i = 0; i < GAUGE_MAX; i++)	//ｹﾞｰｼﾞ部分を一度空白ｹﾞｰｼﾞで初期化
	{
//		TransPos[i] = (gdata->color << 12) | gdata->CharNo;
		DummyScrn[i] = (gdata->color << 12) | gdata->CharNo;
	}

//	TransPos[0] &= 0xfc00;			//ｹﾞｰｼﾞの端の絵の部分
//	TransPos[0] |= GAUGE_TOPCHR;
//	TransPos[GAUGE_MAX+1] &= 0xfc00;
//	TransPos[GAUGE_MAX+1] |= GAUGE_TOPCHR + 10;	//下が <= なので
	
	if(resultHP == 0)
	{
		DIV_DMACOPY(3, DummyScrn, TransPos, GAUGE_MAX*2, 16);
		dma_wait = 0;	dma_wait = 0;
		return;
	}
	
//	HP_power = 100 * (resultHP) / gdata->MaxHP;	//resultHPが所有するHPの割合
	if(gdata->NowHP > AfterHP)
	{
		Now_power = 100 * AfterHP / gdata->MaxHP;	//ｹﾞｰｼﾞが動かない部分が所有するHPの割合
		HP_power = 100 * gdata->NowHP / gdata->MaxHP;
		HP_power -= Now_power;				//ｹﾞｰｼﾞが変動する部分が所有するHPの割合
	}
	else
	{
		Now_power = 100 * gdata->NowHP / gdata->MaxHP;	//ｹﾞｰｼﾞが動かない部分が所有するHPの割合
		HP_power = 100 * AfterHP / gdata->MaxHP;
		HP_power -= Now_power;				//ｹﾞｰｼﾞが変動する部分が所有するHPの割合
	}
	temp = 100 * Bunsi / DEFAULT_BUNBO;	//DEFAULT_BUNBO分のBunsiを100%分のBunsiに変える
	HP_power = HP_power * temp / 100;	//Bunsiからｹﾞｰｼﾞが表示される部分までの%を求める
	HP_power += Now_power;	//表示するﾊﾟｰｾﾝﾃｰｼﾞ

	
	for(gauge_count = 1; gauge_count <= GAUGE_MAX; gauge_count++)
	{
		gauge_power = 100 * gauge_count / GAUGE_MAX;	//ｹﾞｰｼﾞｶｳﾝﾄまでが所有するHPの割合量
		
		if(HP_power < gauge_power)
		{
			//gauge_countｷｬﾗ数までに余ってしまった数を求める(1ｷｬﾗまるまるを埋められない端数)
			HP_power -= 100 * (gauge_count - 1) / GAUGE_MAX;	//何%余ってるのか
			HP_power = GAUGE_PARSENT * HP_power / 100;
			
			if(gauge_count == 1 && HP_power == 0 && AfterHP > 0)
			{	//ﾊﾟｰｾﾝﾃｰｼﾞでは0でも、実際のHPが1以上あるなら1ﾄﾞｯﾄのｹﾞｰｼﾞを表示する
				//TransPos[0] &= 0xfc00;
				//TransPos[0] |= gdata->CharNo + 1;
				DummyScrn[0] &= 0xfc00;
				DummyScrn[0] |= gdata->CharNo + 1;
			}
			else
			{	//通常
				//TransPos[gauge_count-1] &= 0xfc00;//-1=gauge_countが1から始まっているため
				//TransPos[gauge_count-1] |= (gdata->CharNo + HP_power);	//put_work);
				DummyScrn[gauge_count-1] &= 0xfc00;//-1=gauge_countが1から始まっているため
				DummyScrn[gauge_count-1] |= (gdata->CharNo + HP_power);	//put_work);
			}
			break;
		}
		else
		{
			//TransPos[gauge_count-1] &= 0xfc00;
			//TransPos[gauge_count-1] |= gdata->CharNo + 8;
			DummyScrn[gauge_count-1] &= 0xfc00;
			DummyScrn[gauge_count-1] |= gdata->CharNo + 8;
		}
	}
	DIV_DMACOPY(3, DummyScrn, TransPos, GAUGE_MAX*2, 16);
	dma_wait = 0;	dma_wait = 0;
}

*/

#endif


//=========================================================================
//=========================================================================
//=========================================================================
//=========================================================================
//=========================================================================
//=========================================================================
//=========================================================================
//=========================================================================
//=========================================================================
//=========================================================================
//=========================================================================
//=========================================================================
//=========================================================================
//=========================================================================
//=========================================================================
//=========================================================================
//=========================================================================
//=========================================================================



//----------------------------------------------------------
//	現在HPと最大HP、ｹﾞｰｼﾞの最大ﾄﾞｯﾄ数を渡して、今のHPだと何ﾄﾞｯﾄなのかを返す
//----------------------------------------------------------
u8 GetNumDotto(s16 NowHP, s16 MaxHP, u8 GaugeMaxDot)
{
	u8 put_dot;
	
	put_dot = NowHP * GaugeMaxDot / MaxHP;
	if(put_dot == 0 && NowHP > 0)	//ﾄﾞｯﾄ計算では0でも実際のHPが1以上なら1ﾄﾞｯﾄにする
		put_dot = 1;
	return put_dot;
}

//----------------------------------------------------------
//	HPｹﾞｰｼﾞのｶﾗｰを取得する
//	戻り値: 0=ﾄﾞｯﾄなし	1=赤	2=黄	3=緑	4=HPが満タン
//----------------------------------------------------------
u8 GetGaugeDottoColor(s16 NowHP, s16 MaxHP)
{
	u8 put_dot;
	u8 ret;
	
	if(NowHP == MaxHP)
		return 4;
	
	put_dot = GetNumDotto(NowHP, MaxHP, GAUGE_DOTTOMAX);
	if(put_dot > GAUGE_DOTTOMAX / 2)
		ret = 3;	//緑
	else if(put_dot > 9)
		ret = 2;	//黄
	else if(put_dot > 0)
		ret = 1;	//赤
	else
		ret = 0;	//HPが0の時
	
	return ret;
}

