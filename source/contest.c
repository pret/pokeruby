//=========================================================================
//
//		ポケモンコンテスト
//											by matsuda 2001.09.19(水)
//=========================================================================

#include "common.h"
#include "intr.h"
#include "poketool.h"
#include "contest.h"
#include "con_tool.h"
#include "fight.h"
#include "bss.h"
#include "print.h"
#include "decord.h"
#include "palanm.h"
#include "laster.h"
#include "task.h"
#include "actanm.h"
#include "server.h"
#include "agbmons.h"
#include "calctool.h"
#include "waza_eff.h"
#include "con_waza.h"
#include "conres.h"
#include "conscr.h"
#include "script.h"
#include "fld_main.h"
#include "multisio.h"
#include "pokesio.h"
#include "cable.h"
#include "consio.h"
#include "madefine.h"
#include "client.h"
#include "letter.h"
#include "ef_tool.h"
#include "memtool.h"
#include "mus_tool.h"
#include "wazatool.h"
#include "wazano.def"

#include "evobjdat.h"
#include "d_matsu.h"


//-- デバック用 --//
#define MUS_DOUKI_TEST	0	//4人通信時の音楽同期ﾃｽﾄ  0:OFF  1:ON

//----------------------------------------------------------
//	定数
//----------------------------------------------------------
#define BONUS_ICONPUT_WAIT	20	//ﾎﾞｰﾅｽｱｲｺﾝON,OFF後のｳｪｲﾄ

//----------------------------------------------------------
//	グローバル変数
//----------------------------------------------------------
BreederData BreederParam[BREEDER_MAX] = {};	//ﾌﾞﾘｰﾀﾞｰﾃﾞｰﾀ
/*
u8 MyBreederNo = 0;	//自分のﾌﾞﾘｰﾀﾞｰNo(通信するときに自分が何番か入れるようにして)
u8 consys->cursor = 0;	//ｶｰｿﾙ位置情報
u8 consys->turn = 0;	//ﾀｰﾝｶｳﾝﾄ
u16 consys->UseWaza[BREEDER_MAX] = {};	//繰り出す技のﾅﾝﾊﾞｰ
u16 consys->UseWazaOld[BREEDER_MAX] = {};
u8 BreederRanking[BREEDER_MAX] = {};	//各ﾌﾞﾘｰﾀﾞｰの現在の順位
*/
//ContestSys *consys = NULL;
//ContestAPSys *apsys = NULL;
s16 ContBP[BREEDER_MAX] = {};
s16 ContEvaluation[BREEDER_MAX] = {};	//評価値
s16 ContAP[BREEDER_MAX] = {};	//2時審査の最終合計AP値
s16 NijiPoint[BREEDER_MAX] = {};	//2次審査ﾎﾟｲﾝﾄ
u8 ContestJyunni[BREEDER_MAX] = {};//全てのｱﾋﾟｰﾙが終了した時点での最終的な順位(0ｵﾘｼﾞﾝ)
//u8 conkind = 0;		//参加するｺﾝﾃｽﾄのﾃﾞｰﾀ(上位4ﾋﾞｯﾄ=ﾗﾝｸ、下位4ﾋﾞｯﾄ=ｺﾝﾃｽﾄﾀｲﾌﾟ)
					//↑構造体にすると4ﾊﾞｲﾄ取ってしまうので しない
u8 ConTemotiNo = 0;	//自分の手持ちの何番目のﾎﾟｹﾓﾝが参加するか
u8 MyBreederNo = 0;	//自分のﾌﾞﾘｰﾀﾞｰNo(通信するときに自分が何番か入れるようにして)
u8 BrdSort[BREEDER_MAX]={};	//毎ﾀｰﾝﾄｰﾀﾙAP値によって表示場所を変えるので、変更後の場所をここに保存(X番目のﾌﾞﾘｰﾀﾞｰは何番目の位置にあるか)
u8 ContestTuusin = 0;	//通信ﾌﾗｸﾞ
u8 ContestSioOya = 0;	//通信対戦時の親の通信ID

//-- ｽｸﾘﾌﾟﾄとﾌﾟﾛｸﾞﾗﾑ共通で使用するﾊﾞｯﾌｧ(ｽｸﾘﾌﾟﾄの兼ね合い上 u16 限定 --//
u16 ContestKind = 0;	//ｺﾝﾃｽﾄの種類
u16 ContestRank = 0;	//ｺﾝﾃｽﾄのﾗﾝｸ(会場場所でもある)
//※暫定 一次審査のｲﾍﾞﾝﾄでﾗﾝﾀﾞﾑの種の共有が崩れてしまうので別ﾜｰｸに取っておく
//  将来的には2次審査の開始時、結果発表の開始時に種の交換を行うようにする
unsigned long temp_rand;


//----------------------------------------------------------
//	外部変数
//----------------------------------------------------------
//extern	u8	FightMsgBuf[64];

//----------------------------------------------------------
//	外部変数
//----------------------------------------------------------
extern	TALK_WIN	FightMsg;
extern	TALK_WIN	win[4];

//----------------------------------------------------------
//	プロトタイプ宣言
//----------------------------------------------------------
static void contest_v_blank_intr(void);
static void	MainContest(void);
static void WazaSelectSeqInit(u8);
static void WazaSelectSeq(u8);
static void	WazaCsrOn(s8 pos);
static void	WazaCsrOff(s8 pos);
static void TurnHearWaitSeq(u8);
static void TurnHearWait2Seq(u8 id);
static void TurnHearSeq(u8);
static void WazaPutSeq(u8);
static void NextTurnSeq(u8);
void ConWazaMsgPutSeq(u8);
static void ConWazaKekkaMsgWaitSeq(u8);
//static void ConMiteitaMsgPutSeq(u8);
static void NijiSinsaEndSeq(u8);
static void NijiSinsaMsgWaitSeq(u8);
static void FadeWaitSeq(u8);
static void FadeInWaitSeq(void);
//static void FadeInEndCheck(u8 id);
static void ContestSioCheck(u8);
static void StandbyCheckInit(u8 id);
//static void StandbyCheck(u8 id);
static void StandbyCheckEnd(u8 id);
static void WazaNoGetSeq(u8);
static void WazaNoGetWait(u8 id);
static void TuusinWaitFadeOut(u8);
static void MusStartWait(u8 id);
static u8 ContestDraw(u8 *);
static void DrawWait(u8);
static void KekkaMsgPutSeq(u8);
//static void PenaltyCheckSeq2(u8 id);
static void JyunniPutWaitSeq(u8 id);
static void LightingDropped(u8 id);
static void LightingDroppedMain(u8 id);
static void LightingRaised(u8 id);
static void LightingRaisedMain(u8 id);
static void ContestFontPaletteSet(void);
//static void SioFlagWait(u8 id);
//static void StandbyCheck(u8 id);
//static void Sio10SyncWait(u8 id);
static void TuusinWaitFadeReturn(u8 id);
static void ContestFadeWait(u8 id);
static void ContestPokeSlideOut(actWork *xreg);
static void ContestPokeSlideInSeq(actWork *xreg);
static void HeartIconFastMove(u8 id);
static void HeartIconFastMoveWait(u8 id);
static void WazaFlowSeq(u8 id);
static void InfoMaskEffect(u8 id);
static void InfoMaskEffectEnd2nd(u8 id);
static void TurnVoltageGaugePut(u8 id);
static void WazaMaeVoltageOut(u8 id);
static void HeartIconAffAppearWait(u8 id);

//static void TuusinEndInit(u8 id);
//static void TuusinEndWait(u8 id);
static void CurtainOpenSeq(u8 id);
static void MakuOrosuSeq(u8 id);
static void NijisinsaMakuDownEndSeq(u8 id);
void ContWazaCalcDatatWait(u8 id);
static void TotalApCalcSeq(u8 id);
#ifdef PM_DEBUG
static void DebugWazaPut(u8 id);
static void DebugContestWazaEff(u8 id);
#endif

//----------------------------------------------------------
//	外部関数
//----------------------------------------------------------
extern void kanshi_network(u8 taskno);
extern void DebugNumPrintInit(u8 pal, u8 select, u8 screen, u8 chara);

//----------------------------------------------------------
//	データ
//----------------------------------------------------------
#include "breeder.dat"
#include "contest.dat"

//----------------------------------------------------------
//	メッセージデータ
//----------------------------------------------------------
#include "..\msgdata\waza_com.mes"
#include "..\msgdata\contest.mes"
#include "..\msgdata\conmsg.h"


//----------------------------------------------------------
//	プログラム
//----------------------------------------------------------
static void DummySequence(u8 id)
{
}

//----------------------------------------------------------
//	ゲーム開始時にクリアされるワーク
//----------------------------------------------------------
void ContestDataInit(void)
{
	ContestTuusin = 0;
}

//----------------------------------------------------------
//	ﾚｼﾞｽﾀｰ初期化
//----------------------------------------------------------
static void RegisterInit(void)
{
	*(vu16 *)REG_DISPCNT = DISP_MODE_0 | DISP_OBJ_CHAR_1D_MAP;

//	*(vu16 *)REG_IE |= V_BLANK_INTR_FLAG;// | H_BLANK_INTR_FLAG;
	REG_IE_SET( V_BLANK_INTR_FLAG );
	*(vu16 *)REG_STAT = STAT_V_BLANK_IF_ENABLE;// | STAT_H_BLANK_IF_ENABLE;

	//戦闘でｳｨﾝﾄﾞｳ		ｺﾝﾃｽﾄでﾌｫﾝﾄ用
	*(vu16 *)REG_BG0CNT = BG_SCREEN_SIZE_2 | BG_PRIORITY_0
	| 24 << BG_SCREEN_BASE_SHIFT | 0 << BG_CHAR_BASE_SHIFT
	| BG_COLOR_16 | BG_MOS_OFF;

	//戦闘でｴﾌｪｸﾄ用		ｺﾝﾃｽﾄでｴﾌｪｸﾄ用
	*(vu16 *)REG_BG1CNT = BG_SCREEN_SIZE_2 | BG_PRIORITY_1
	| CONWAZA_BG_SCRNBASE << BG_SCREEN_BASE_SHIFT 
	| CONWAZA_BG_CHARBASE << BG_CHAR_BASE_SHIFT
	| BG_COLOR_16 | BG_MOS_OFF;

	//戦闘で背景		ｺﾝﾃｽﾄでｳｨﾝﾄﾞｳ用
	*(vu16 *)REG_BG2CNT = BG_SCREEN_SIZE_2 | BG_PRIORITY_0
	| 28 << BG_SCREEN_BASE_SHIFT | 0 << BG_CHAR_BASE_SHIFT
	| BG_COLOR_16 | BG_MOS_OFF;

	//戦闘で土地		ｺﾝﾃｽﾄで背景
	*(vu16 *)REG_BG3CNT = (CONTEST_HAIKEI_SIZE<<14) | BG_PRIORITY_3
	| 26 << BG_SCREEN_BASE_SHIFT | 0 << BG_CHAR_BASE_SHIFT
	| BG_COLOR_16 | BG_MOS_OFF | (CONTEST_HAIKEI_LOOP<<13);

   	*(vu16 *)REG_BLDCNT   = 0;	//半透明設定
   	*(vu16 *)REG_BLDALPHA = 0;
   	*(vu16 *)REG_BLDY	  = 0;

	*(vu16*)REG_WININ = (WIN_ALL_ON << 8) | WIN_ALL_ON;;		//ｳｨﾝﾄﾞｳ設定
	*(vu16*)REG_WINOUT = (WIN_ALL_ON << 8) | WIN_ALL_ON;

	*(vu16 *)REG_DISPCNT |= DISP_BG0_ON | DISP_BG1_ON | DISP_BG2_ON | DISP_BG3_ON | DISP_OBJ_ON | DISP_WIN01_ON;

	ScrX0=0;
	ScrY0=0;
	ScrX1=0;
	ScrY1=0;
	ScrX2=0;
	ScrY2=0;
	ScrX3=0;
	ScrY3=0;
	Win0H=0;
	Win0V=0;
	Win1H=0;
	Win1V=0;
	//MsgInit(&FightMsg);
}

//----------------------------------------------------------
//	技ｴﾌｪｸﾄで変更した背景を元に戻す
//----------------------------------------------------------
void ContestHaikeiRecover(void)
{
	int i;
	
//	DecordVram((void*)contest1_pch_ADRS,(void*)CHAR_BASE0_ADDR);
	DecordVram((void*)con_bg_pch_ADRS,(void*)CHAR_BASE0_ADDR);
	DecordVram((void*)kankyaku_pch_ADRS,(void*)CHAR_BASE0_ADDR+0x2000);
	DecordVram((void*)con_bg1_psc_ADRS,(void*)SCREEN_BASE26_ADDR);
	DecordPaletteWork((void*)contest_pcl_ADRS, PA_BG0,0x200);
	ContestFontPaletteSet();

	// add 2002.07.25(木)
	for(i = 0; i < BREEDER_MAX; i++){
		PaletteWorkSet((void*)&UserWork[CONT_PALETTE_ADRS + 16*(5+i)*2], 
			16*(5+BrdSort[i]), 0x20);
	}
}

//----------------------------------------------------------
//	フォント設定
//----------------------------------------------------------
static void FontInit(void)
{
	PrintScreenInit(CONTEST_TYPE);
	MsgControlInit(&FightMsg,CONTEST_TYPE);
	MsgControlInit(&win[0], CONTEST_TALK_TYPE);
}

//----------------------------------------------------------
//	ｺﾝﾃｽﾄ用標準フォントパレットセット
//----------------------------------------------------------
static const u16 con_graypal = 0x779c;	//前のﾀｰﾝに出した技名を表示する時のﾊﾟﾚｯﾄ
static void ContestFontPaletteSet(void)
{
	u8 i;
	PrintPaletteInit(CONTEST_TYPE);
	PaletteWorkClear(0, PA_BG0, 2);	//ﾊﾞｯｸｸﾞﾗｳﾝﾄﾞを黒にするため
	
	for(i = BLD_PAL; i < BLD_PAL+BREEDER_MAX; i++)	//各ﾌﾞﾘｰﾀﾞｰ毎に黒を持たせる
		PaletteWorkSet(&PaletteWork[16*15+COL_BLACK], 16*15+i, 2);	//↓自分の色は白で上書き

	//緑色の所をﾋﾟﾝｸに変更 2002.07.03(水)
	PaletteWorkClear(0x7e3f, 16*15+COL_GREEN, 2);
}

//----------------------------------------------------------
//	consys構造体初期化
//----------------------------------------------------------
static void ConSysInit(void)
{
	int i;
	
//	consys = (void*)&UserWork[CONT_SYSTEM_ADRS];
//	apsys = (void*)&UserWork[CONT_SYSTEM_ADRS] + sizeof(ContestSys);
	
	//MyBreederNo = 0;
	memset(consys, 0, sizeof(ContestSys));
	for(i = 0; i < BREEDER_MAX; i++)
		consys->waza_msg[i] = 0xff;
	
	for(i = 0; i < BREEDER_MAX; i++)
		memset(&apsys[i], 0, sizeof(ContestAPSys));
	for(i = 0; i < BREEDER_MAX; i++){
		apsys[i].ranking = 0;	//i;
		apsys[i].msgid = 0xff;
		apsys[i].msgid2nd = 0xff;
	}
	memset(CONWAZA, 0, sizeof(WazaKoukaWork));
	memset(CONAI, 0, sizeof(ConAIWorkTbl));
	memset(ccw, 0, sizeof(ContestCalcWork));
	memset(brdsys, 0, sizeof(BrdSysData)*BREEDER_MAX);
	
	if((ContestTuusin & C_TUUSIN_FLG) == 0)
		BreederDataSort(0);
	
	for(i = 0; i < BREEDER_MAX; i++){
		apsys[i].next_sort = 0xff;//BrdSort[i];
		consys->nowturn_sort[i] = BrdSort[i];
	}
	ConWazaBrdSort();
}


//=========================================================================
//	初期設定
//=========================================================================
void InitContest(void)
{
	switch(sys.InitSeqWork){
		case 0:
			SetVBlankFunc(NULL);
			FontInit();		//※PrintScreenInitで指定BGのﾚｼﾞｽﾀを設定してしまうため、
			RegisterInit();		//  RegisiterInitより先に呼んでおくこと！！
			LasterWorkInit();
			PaletteAnimeInit();

			FadeData.trans_stop = 1;
			DIV_DMACLEAR(3,0,VRAM,(VRAM_END-VRAM),32);

			InitActor();
			InitTask();
			ObjPalManInit();
			ObjPalManStart=4;				// ﾊﾟﾚｯﾄﾏﾈｰｼﾞｬNo開始

		//	for(i = 0; i < ClientSetMax; i++)
		//		ClientSequence[i] = DummySequence;

			UserWork[DEBUG_AP] = 0;	//ﾃﾞﾊﾞｯｸﾞ用ﾌﾗｸﾞ初期化  0:通常状態表示  1:AP(ﾃﾞﾊﾞｯｸﾞ)状態表示
			
		//	SetJudgeParam();	//とりあえず今はここで
			PokeAnmNoInit();	//技ｴﾌｪｸﾄのBG落しで使用しているﾜｰｸの初期化
			ConSysInit();
			//GetBreederNo();
			sys.InitSeqWork++;
			break;
		case 1:
			ContestFontPaletteSet();
			sys.InitSeqWork++;
			break;
		case 2:
			if(ContestDraw(&consys->init_counter)){
				consys->init_counter = 0;
				sys.InitSeqWork++;
			}
			break;
		case 3:
			InfoMaskEffectDataSet();
			ScrX1 = 0;
			ScrY1 = 0;
			
		#if CONTEST_DEBUG
			DebugNumPrintInit(0,2,24,0);
			AddTask(kanshi_network,0);
		#endif
			LightFadeReq(B_to_N);
			FadeData.trans_stop = 0;
			
		//	FadeData.trans_stop = 0;
			SetVBlankFunc(contest_v_blank_intr);
			consys->id = AddTask(ContestFadeWait, 10);
			MainProcChange(MainContest);
			break;
	}
}

static void ContestFadeWait(u8 id)
{
	if(FadeData.fade_sw == 0)
		TaskTable[id].TaskAdrs = ContestSioCheck;
}

//=========================================================================
//	コンテスト開始直前の通信ﾁｪｯｸ
//=========================================================================
static void ContestSioCheck(u8 id)
{
//	u8 i;
	
	if(ContestTuusin & C_TUUSIN_FLG)
	{
		if(FadeData.fade_sw == 0)
		{
			//TuusintyuuMsgPut();
			FadeData.trans_stop = 0;
//			MsgPrint(&FightMsg, tuusintyuu_msg, 2, 9,9);
//			MsgPrint(&FightMsg, tuusintyuu_msg, CON_TUUSIN_TAIKI_MSG, 9,9);
			TuusintyuuMsgPut();
//			ActWork[consys->jyunni_icon[3]].dx = 0;
		
			AddTask(StandbyCheckInit, 0);
			TaskTable[id].TaskAdrs = DummySequence;
		}
	}
	else
	{
		TaskTable[id].TaskAdrs = DrawWait;//ContestDraw;
//		MusicPlay(MUS_TEST1);
		//MusicPlay(MUS_CONTEST0); 1次審査会場と同じ曲なので鳴り直させないようにした
	}
}

//----------------------------------------------------------
//	4台全てがｺﾝﾃｽﾄ画面に入るまで待機
//----------------------------------------------------------
#if MUS_DOUKI_TEST
static void TestMusSeq(u8 id)
{
	if(++TaskTable[id].work[0] == 80)
	{
		TaskTable[id].work[0] = 0;
		SePlay(SE_SELECT);
	}
}
#endif

static void StandbyCheckInit(u8 id)
{
	ChangeTask(id, ContestStandbyCheck, StandbyCheckEnd);
}

static void StandbyCheckEnd(u8 id)
{
	u8 wait;

	wait = 1;	//完全通信同期が出来るようになったので
	TaskTable[id].work[0] = wait;
	TaskTable[id].TaskAdrs = MusStartWait;
}
//-- 音楽の同期を取るためにｳｪｲﾄで調整 --//
static void MusStartWait(u8 id)
{
	u8 myid;
	
	TaskTable[id].work[0]--;
	if(TaskTable[id].work[0] > 0)
		return;
	myid = GetSioConnectId();

#if MUS_DOUKI_TEST
	AddTask(TestMusSeq, 2);
#endif
	DelTask(id);
//	FadeData.trans_stop = 1;
//	DIV_DMACLEAR(3, 0, BG_PLTT, 0x200, 32);
	TaskTable[consys->id].TaskAdrs = DrawWait;//ContestDraw;
	r_next = temp_rand;
}


//----------------------------------------------------------
//	画面BG,アクター描画
//	戻り値：0=初期化処理実行中	1=全部展開し終わった
//----------------------------------------------------------
enum{
	DRAW_0 = 0,
	DRAW_1,
	DRAW_2,
	DRAW_3,
	DRAW_4,
	DRAW_5,
	DRAW_6,
};
static u8 ContestDraw(u8 *seq_count)
{
	u16 pal0[16];
	u16 pal1[16];

	switch(*seq_count){
		case DRAW_0:
			FadeData.trans_stop = 1;
			DIV_DMACLEAR(3, 0, VRAM, (VRAM_END-VRAM), 32);
			break;
		case DRAW_1:
			//背景
			DecordVram((void*)con_bg_pch_ADRS,(void*)CHAR_BASE0_ADDR);
			break;
		case DRAW_2:
			//観客
			DecordVram((void*)kankyaku_pch_ADRS,(void*)CHAR_BASE0_ADDR+0x2000);
			DIV_DMACOPY(3, (void*)CHAR_BASE0_ADDR+0x2000, //観客の展開ﾃﾞｰﾀをコピー
					&UserWork[CONT_KANKYAKU_ADRS], 0x2000, 32);
			break;
		case DRAW_3:
			DecordVram((void*)con_bg1_psc_ADRS,(void*)SCREEN_BASE26_ADDR);
			break;
		case DRAW_4:
			//ｳｨﾝﾄﾞｳ
			DecordVram((void*)con_bg2_psc_ADRS, (void*)SCREEN_BASE28_ADDR);
			DIV_DMACOPY(3, (void*)SCREEN_BASE28_ADDR, 
					&UserWork[CONT_BGWIN_SCRN_TEMP],1024*2,32);
			break;
		case DRAW_5:
			//ﾊﾟﾚｯﾄ
			DecordPaletteWork((void*)contest_pcl_ADRS, PA_BG0,0x200);
			//自分用のﾊﾟﾚｯﾄをMyBreederNoの位置に移動
			CpuCopy(&PaletteWork[16*8], pal0, 0x20, 32);
			CpuCopy(&PaletteWork[16*(5+MyBreederNo)], pal1, 0x20, 32);
			CpuCopy(pal1, &PaletteWork[16*8], 0x20, 32);
			CpuCopy(pal0, &PaletteWork[16*(5+MyBreederNo)], 0x20, 32);
			DIV_DMACOPY(3, PaletteWork, &UserWork[CONT_PALETTE_ADRS], 0x200, 32);
			
			ContestFontPaletteSet();
			break;
		case DRAW_6:
			//PutPlayerInfo();
			ReWritePlayerInfo();
		//	TensyonMsgPut();
		//	TensyonNumPut();
			AppealMeterClear();
			PlayerInfoCopy();
			consys->fukidasi_act = JudgeFukidasiActorSet();
			HeartIconAllSet();
			SortIconAllSet();
			VoltageIconActorSet();
			EyeColorTaskSet();
			MeterColorTaskSet();
			
			ClientType[0]=BSS_CLIENT_MINE;
			ClientType[1]=BSS_CLIENT_ENEMY;
			ClientType[2]=BSS_CLIENT_ENEMY2;
			ClientType[3]=BSS_CLIENT_MINE2;
			FightType = 0;
			AttackClient = CONT_MINE_CLIENT;	//ここは固定値でいいはず
			DefenceClient = CONT_ENEMY_CLIENT;	//座標ｹﾞｯﾄのため  詳しくはwazatool.cにあるWazaEffPosのｺﾒﾝﾄ参照
		//	PokemonStruct[AttackClient] = ContestPokeActorSet();
			PokemonStruct[AttackClient] = ContestJudgeActorSet();
			SetEnemyBanishActor();	//敵ﾎﾟｹﾓﾝ代わりに透明ｱｸﾀｰを登録
			
		//	PaletteFadeReq(0xffffffff, 0,16,0,0x0000);

		//	LightFadeReq(B_to_N);
		//	FadeData.trans_stop = 0;
		//	TaskTable[id].TaskAdrs = DrawWait;
			break;
		default:
			*seq_count = 0;
			return 1;
	}
	(*seq_count)++;
	return 0;
}

static void DrawWait(u8 id)
{
	FadeData.trans_stop = 0;
	if(FadeData.fade_sw == 0){
		//TaskTable[id].TaskAdrs = TurnHearSeq;
		TaskTable[id].work[0] = 0;
		TaskTable[id].work[1] = 0;
		TaskTable[id].TaskAdrs = CurtainOpenSeq;
	}
}

//----------------------------------------------------------
//	コンテストの幕を上げる
//----------------------------------------------------------
static void CurtainOpenSeq(u8 id)
{
	switch(TaskTable[id].work[0]){
		case 0:
			if(TaskTable[id].work[1]++ > 60){
				TaskTable[id].work[1] = 0;
				SePlayPan(SE_C_MAKU_U, 0);
				TaskTable[id].work[0]++;
			}
			break;
		case 1:
			ScrY1 += CURTAIN_SP;
			if((s16)ScrY1 > 160)
				TaskTable[id].work[0]++;
			break;
		case 2:
			InfoMaskEffectDataClear();
			TaskTable[id].work[0]++;
			break;
		case 3:
			(*(vBgCnt *)REG_BG0CNT).Priority = 0;
			(*(vBgCnt *)REG_BG2CNT).Priority = 0;
			VoltageGaugeSlidIn();
			TaskTable[id].work[0]++;
			break;
		case 4:
		default:
			if(consys->voltage_slide_eff == 0){
				TaskTable[id].work[0] = 0;
				TaskTable[id].work[1] = 0;
				TaskTable[id].TaskAdrs = TurnHearSeq;
			}
			break;
	}
}



//----------------------------------------------------------
//	メインループ
//----------------------------------------------------------
static void	MainContest(void)
{
#ifdef PM_DEBUG
	if(DebugMainFlag == 1){
		if(sys.Trg == SELECT_BUTTON)	//デバッグ用
			DebugAPPut();
	}
#endif
	JumpActor();
	MainTask();
	SetActor();
	PaletteAnime();
}

//----------------------------------------------------------
//	Vブランク関数
//----------------------------------------------------------
static void contest_v_blank_intr(void)
{
	*(vu16 *)REG_BG0HOFS = ScrX0;
	*(vu16 *)REG_BG0VOFS = ScrY0;
	*(vu16 *)REG_BG1HOFS = ScrX1;
	*(vu16 *)REG_BG1VOFS = ScrY1;
	*(vu16 *)REG_BG2HOFS = ScrX2;
	*(vu16 *)REG_BG2VOFS = ScrY2;
	*(vu16 *)REG_BG3HOFS = ScrX3;
	*(vu16 *)REG_BG3VOFS = ScrY3;
	*(vu16 *)REG_WIN0H = Win0H;
	*(vu16 *)REG_WIN0V = Win0V;
	*(vu16 *)REG_WIN1H = Win1H;
	*(vu16 *)REG_WIN1V = Win1V;
	PaletteFadeTrans();
	actOAMtrans();
	actDMAtrans();
	LasterVblank();
}

//=========================================================================
//	技選択前のメッセージ　”XX 回目のアピールです！”
//=========================================================================
static void TurnHearSeq(u8 id)
{
	u8 *msg;
//	u8 i;
	
	ScrY0 = 0;
	ScrY2 = 0;

	DebugAPUpdatingCheckPut();

	//毎ﾀｰﾝの最初の状態のﾊﾟﾚｯﾄを保存
	DIV_DMACOPY(3, PaletteWork, &UserWork[CONT_TURN_PLTT], 0x400, 32);

	msg = PM_NumMsgSet(FightMsgBuf, consys->turn+1, NUM_MODE_LEFT, 1);
	if(YasumiTurnCheck(MyBreederNo) == 0)
		PM_strcpy(msg, turn_msg);
	else
		PM_strcpy(msg, fusanka_msg);
	
	ContestTalkMsgClear();
	PM_MsgExpand(MsgExpandBuffer, FightMsgBuf);
	TalkMsgSet(&win[0], MsgExpandBuffer, CON_MSG, CON_TALKMSG_X, CON_TALKMSG_Y);
//	MsgPrint(&FightMsg, FightMsgBuf, CON_MSG, CON_TALKMSG_X, CON_TALKMSG_Y);
	TaskTable[id].TaskAdrs = TurnHearWaitSeq;
}

static void TurnHearWaitSeq(u8 id)
{
	if(ContestTalkMsgPut(&win[0]) == 1)
		TaskTable[id].TaskAdrs = TurnHearWait2Seq;
}

static void TurnHearWait2Seq(u8 id)
{
	if(sys.Trg & A_BUTTON || sys.Trg == B_BUTTON)
	{
		SePlay(SE_SELECT);
		if(YasumiTurnCheck(MyBreederNo) == 0)
		{
			HearIconEva(1);
			TaskTable[id].TaskAdrs = WazaSelectSeqInit;
		}
		else
			TaskTable[id].TaskAdrs = WazaNoGetSeq;//WazaPutSeq;
	}
}

//=========================================================================
//	技選択
//=========================================================================
static const u8 WazaComboFont[] = {CTRL_,C_FCOL_,COL_GREEN,CTRL_,C_SCOL_,COL_RED,EOM_};
static const u8 WazaPenaltyFont[] = {CTRL_, C_FCOL_, COL_DGRAY, EOM_};

static void WazaSelectSeqInit(u8 id)
{
	u8 i;
	u16 wazano;
	u8 msgbuf[30];
	u8 *pmsg;
	
	ScrY0 = 0x00a0;
	ScrY2 = 0x00a0;

	FontScrnBoxFill(&FightMsg, MSG_CLEAR_NO,
		C_WazaList[0][0], C_WazaList[0][1], C_WazaList[0][0]+8, C_WazaList[0][1]+8);
	
	
	for(i = 0; i < 4; i++)
	{
		wazano = BreederParam[MyBreederNo].waza[i];
		
		MsgPrint(&FightMsg, WazaNameData[wazano],
			CON_WAZALIST + CON_WAZANAME_LEN * i,
				C_WazaList[i][0], C_WazaList[i][1]);
		
		pmsg = msgbuf;
		//-- ｺﾝﾎﾞ成立ﾏｰｸ表示 --//
		if(apsys[MyBreederNo].use_wazaold != 0 && Combo1TermCheck(MyBreederNo) 
				&& ComboCheck(apsys[MyBreederNo].use_wazaold, wazano)
				&& apsys[MyBreederNo].combo1_flg)
		{	//ｺﾝﾎﾞ成立技は赤文字
			pmsg = PM_strcpy(msgbuf, WazaComboFont);
		}
		else if(wazano != 0 && apsys[MyBreederNo].use_wazaold == wazano && ConWazaTbl[wazano].apno != 3)
			pmsg = PM_strcpy(msgbuf, WazaPenaltyFont);	//ﾍﾟﾅﾙﾃｨ色
		
		PM_strcpy(pmsg, WazaNameData[wazano]);
		MsgPrint(&FightMsg, msgbuf,
			CON_WAZALIST + CON_WAZANAME_LEN * i,
				C_WazaList[i][0], C_WazaList[i][1]);
	}
//	MsgPrint(&FightMsg, sura_msg, CON_ICON_SRA, 13, 20+11);
	WazaCsrOn(consys->cursor);
	PutWazaComment(BreederParam[MyBreederNo].waza[consys->cursor]);
	
	//VoltageGaugeBanish();
	
	TaskTable[id].TaskAdrs = WazaSelectSeq;
}

//----------------------------------------------------------
//	技選択メイン
//----------------------------------------------------------
static void WazaSelectSeq(u8 id)
{
	u8 *msg;
	u8 cursor_max = 0;
	int i;
	
	for(i = 0; i < 4; i++){
		if(BreederParam[MyBreederNo].waza[i] != 0)
			cursor_max++;
	}
	
//	if(sys.Repeat & A_BUTTON){
	if(sys.Trg & A_BUTTON){
		SePlay(SE_SELECT);
		TaskTable[id].TaskAdrs = WazaNoGetSeq;//WazaPutSeq;
	}
	else{
		switch(sys.Repeat)
		{
	/*		case A_BUTTON:
				SePlay(SE_SELECT);
				TaskTable[id].TaskAdrs = WazaNoGetSeq;//WazaPutSeq;
				break;
	*/		case B_BUTTON:
				SePlay(SE_SELECT);
				HearIconEva(0);
				FontScrnBoxFill(&FightMsg, MSG_CLEAR_NO, C_WazaList[0][0], 
					C_WazaList[0][1], C_WazaList[0][0]+8, C_WazaList[0][1]+8);
				//VoltageGaugePut();

				msg = PM_NumMsgSet(FightMsgBuf, consys->turn+1, NUM_MODE_LEFT, 1);
				if(YasumiTurnCheck(MyBreederNo) == 0)
					PM_strcpy(msg, turn_msg);
				else
					PM_strcpy(msg, fusanka_msg);
				
				ContestTalkMsgClear();
				PM_MsgExpand(MsgExpandBuffer, FightMsgBuf);
				MsgPrint(&win[0], MsgExpandBuffer, CON_MSG, 
						CON_TALKMSG_X, CON_TALKMSG_Y);
				ScrY0 = 0;
				ScrY2 = 0;

				//TaskTable[id].TaskAdrs = TurnHearSeq;
				TaskTable[id].TaskAdrs = TurnHearWait2Seq;
				break;
			case L_KEY:
			case R_KEY:
	//			SePlay(SE_SELECT);
				break;
			case U_KEY:
				WazaCsrOff(consys->cursor);
				if(consys->cursor == 0)
					consys->cursor = cursor_max-1;
				else
					consys->cursor--;
				WazaCsrOn(consys->cursor);
				WazaCommentClear();
				PutWazaComment(BreederParam[MyBreederNo].waza[consys->cursor]);
				if(cursor_max > 1)	//技が一つしかない時は鳴らさない
					SePlay(SE_SELECT);
				break;
			case D_KEY:
				WazaCsrOff(consys->cursor);
				if(consys->cursor == cursor_max-1)
					consys->cursor = 0;
				else
					consys->cursor++;
				WazaCsrOn(consys->cursor);
				WazaCommentClear();
				PutWazaComment(BreederParam[MyBreederNo].waza[consys->cursor]);
				if(cursor_max > 1)	//技が一つしかない時は鳴らさない
					SePlay(SE_SELECT);
				break;
		#ifdef PM_DEBUG
			//-- デバックメニュー --//
			case START_BUTTON:
				if(DebugMainFlag == 1){
					if(ContestTuusin & C_TUUSIN_FLG)
						break;
					TaskTable[id].work[0] = 0;
					TaskTable[id].work[1] = BreederParam[MyBreederNo].waza[0];
					TaskTable[id].TaskAdrs = DebugContestWazaEff;
				}
				break;
		#endif
		}
	}
}

//----------------------------------------------------------
//	技ｴﾌｪｸﾄを見るためのデバッグメニュー
//----------------------------------------------------------
#ifdef PM_DEBUG
static void DebugContestWazaEff(u8 id)
{
	u8 buff[100];
	
	switch(TaskTable[id].work[0]){
		case 0:
			FontScrnBoxFill(&FightMsg, MSG_CLEAR_NO,
				C_WazaList[0][0], C_WazaList[0][1], C_WazaList[0][0]+8, 
				C_WazaList[0][1]+8);
			MsgPrint(&FightMsg, WazaNameData[TaskTable[id].work[1]],
				CON_WAZALIST + CON_WAZANAME_LEN * 0,
					C_WazaList[0][0], C_WazaList[0][1]);
			PM_NumMsgSet(buff, TaskTable[id].work[1], NUM_MODE_ZERO, 3);
			MsgPrint(&FightMsg, buff,
				CON_WAZALIST + CON_WAZANAME_LEN * 1,
					C_WazaList[1][0], C_WazaList[1][1]);
			WazaCommentClear();
			PutWazaComment(TaskTable[id].work[1]);
			TaskTable[id].work[0]++;
			break;
		case 1:
			switch(sys.Repeat){
				case L_KEY:
					TaskTable[id].work[1]--;
					if(TaskTable[id].work[1] < 1)
						TaskTable[id].work[1] = WAZANO_MAX;
					TaskTable[id].work[0]--;
					break;
				case L_BUTTON:
					TaskTable[id].work[1] -= 10;
					if(TaskTable[id].work[1] < 1)
						TaskTable[id].work[1] = WAZANO_MAX;
					TaskTable[id].work[0]--;
					break;
				case R_KEY:
					TaskTable[id].work[1]++;
					if(TaskTable[id].work[1] > WAZANO_MAX)
						TaskTable[id].work[1] = 1;
					TaskTable[id].work[0]--;
					break;
				case R_BUTTON:
					TaskTable[id].work[1] += 10;
					if(TaskTable[id].work[1] > WAZANO_MAX)
						TaskTable[id].work[1] = 1;
					TaskTable[id].work[0]--;
					break;
				case START_BUTTON:
				case SELECT_BUTTON:
					ScrY0 = 0x0;
					ScrY2 = 0x0;
					VoltageGaugeSlidOut();
					TaskTable[id].work[0] = 0;
					TaskTable[id].TaskAdrs = DebugWazaPut;
					break;
				case B_BUTTON:
					ScrY0 = 0x00a0;
					ScrY2 = 0x00a0;
					BreederParam[MyBreederNo].waza[0] = TaskTable[id].work[1];
					TaskTable[id].work[0] = 0;
					TaskTable[id].work[1] = 0;
					TaskTable[id].work[2] = 0;
					TaskTable[id].work[3] = 0;
					TaskTable[id].TaskAdrs = WazaSelectSeqInit;
					break;
			}
	}
}

static void DebugWazaPut(u8 id)
{
	u8 poke;
	int i;
	
	switch(TaskTable[id].work[0]){
		case 0:
			for(i = 0; i < CLIENT_MAX; i++)
				BattlePokeAnmNo[i] = 0;
			memset(conpara, 0, sizeof(ConWazaEffParam));
			ConWazaEffParaSet(MyBreederNo);
			poke = ContestPokeActorSet2(BreederParam[MyBreederNo].monsno, BreederParam[MyBreederNo].id_no, BreederParam[MyBreederNo].personal_rnd);
			ActWork[poke].dx = CONTEST_SLIDE_INIT_DX;
			ActWork[poke].move = ContestPokeSlideInSeq;
			TaskTable[id].work[2] = poke;
			PokemonStruct[AttackClient] = poke;
			TaskTable[id].work[3] = 0;
			TaskTable[id].work[0]++;
			consys->eff_loop = 0;
			break;
		case 1:
			poke = TaskTable[id].work[2];
			if(ActWork[poke].move == DummyActMove){
//				if(TaskTable[id].work[3]++ == 20)	//ちょっとｳｪｲﾄを入れる
				{
					apsys[MyBreederNo].use_waza = TaskTable[id].work[1];
					ContestWazaEffectWorkSet(MyBreederNo);
					ConWazaEffParaSet(MyBreederNo);
					SetRangeClient(TaskTable[id].work[1]);
					WazaEffectSet(TaskTable[id].work[1]);

					TaskTable[id].work[3] = 0;
					TaskTable[id].work[0]++;
				}
			}
			break;
		case 2:
			WazaEffectSequence();
			if(WazaEffectFlag == 0){
				ContestWazaEffectWorkClear(MyBreederNo);

				//-- ｴﾌｪｸﾄ繰り返しﾁｪｯｸ --//
				if(consys->eff_loop){
					TaskTable[id].work[10] = 0;
					TaskTable[id].work[0] = 20;
					break;
				}

				TaskTable[id].work[0]++;
			}
			break;
		case 3:
			if(TaskTable[id].work[3]++ == 20){
				poke = TaskTable[id].work[2];
				ActWork[poke].move = ContestPokeSlideOut;
				VoltageGaugeSlidIn();
				TaskTable[id].work[3] = 0;
				TaskTable[id].work[0]++;
			}
			break;
		case 4:
			poke = TaskTable[id].work[2];
			if(ActWork[poke].banish){
				AffineDelActor(&ActWork[poke]);
				DelActor(&ActWork[poke]);
				TaskTable[id].work[0] = 0;
				TaskTable[id].TaskAdrs = DebugContestWazaEff;
				ScrY0 = 0x00a0;
				ScrY2 = 0x00a0;
			}
			break;
		case 20:
			if(TaskTable[id].work[10]++ > 30){
				TaskTable[id].work[10] = 0;
				TaskTable[id].work[0] = 1;
			}
			break;
	}
}
#endif	//PM_DEBUG	-----------------------------------------------


//----------------------------------------------------------
//	カーソル選択ツール
//----------------------------------------------------------
static void	WazaCsrOn(s8 pos)
{
//	*(vu16 *)(BG_VRAM+CSR_SCR*0x800+1*2+ (0x20+pos*2)*0x40)=0x3006;
	*(vu16 *)(SCREEN_BASE28_ADDR+1*2+ (0x1f+pos*2)*0x40)=0x0001;
	*(vu16 *)(SCREEN_BASE28_ADDR+1*2+ (0x20+pos*2)*0x40)=0x0002;
}

static void	WazaCsrOff(s8 pos)
{
//	*(vu16 *)(BG_VRAM+CSR_SCR*0x800+1*2+(0x20+pos*2)*0x40)=0x3005;
	*(vu16 *)(SCREEN_BASE28_ADDR+1*2+(0x1f+pos*2)*0x40)=MENUWIN_CLEAR_SCRN;
	*(vu16 *)(SCREEN_BASE28_ADDR+1*2+(0x20+pos*2)*0x40)=MENUWIN_CLEAR_SCRN;
}


//=========================================================================
//	他ﾌﾞﾘｰﾀﾞｰが出した技ﾅﾝﾊﾞｰを取得する
//=========================================================================
static void WazaNoGetSeq(u8 id)
{
	u8 taskno;
	
	if(ContestTuusin & C_TUUSIN_FLG)
	{
//		for(i = 0; i < BREEDER_MAX; i++)
//			apsys[i].use_wazaold = apsys[i].use_waza;
		apsys[MyBreederNo].use_waza = UseWorkGet(MyBreederNo);
		taskno = AddTask(ContWazaNoSioGet, 0);
		ChangeTask(taskno, ContWazaNoSioGet, WazaNoGetWait);
		TaskTable[id].TaskAdrs = DummySequence;
		TuusintyuuMsgPut();
		HearIconEva(0);
	}
	else
	{
		UseWorkGetAll();
//		TaskTable[id].TaskAdrs = WazaPutSeq;
		TaskTable[id].TaskAdrs = LightingDropped;
	}
}

//----------------------------------------------------------
//	通信で4体分の技Noが送られてくるまで待機
//----------------------------------------------------------
static void WazaNoGetWait(u8 id)
{
	DelTask(id);
//	TaskTable[consys->id].TaskAdrs = WazaPutSeq;
	TaskTable[consys->id].TaskAdrs = LightingDropped;
}

//=========================================================================
//	照明を落とす
//=========================================================================
static void LightingDropped(u8 id)
{
	ContestTalkMsgClear();
	ScrY0 = 0;
	ScrY2 = 0;
	HearIconEva(0);

	DIV_DMACOPY(3, PaletteWorkTrans, 
		&UserWork[CONT_TURNFADE_PLTT], 0x400, 32);	//ﾌｪｰﾄﾞ後の色を保存
	PaletteWorkSet((u16*)&UserWork[CONT_TURN_PLTT], 0, 0x400);	//変わったﾊﾟﾚｯﾄを元に戻す
	
	TaskTable[id].work[0] = 0;
	TaskTable[id].work[1] = 0;
	TaskTable[id].TaskAdrs = LightingDroppedMain;
}

static void LightingDroppedMain(u8 id)
{
	if(++TaskTable[id].work[0] < 3)
		return;
	TaskTable[id].work[0] = 0;
	TaskTable[id].work[1]++;

	if(TaskTable[id].work[1] == LIGHT_EVY)
	{
		//DIV_DMACOPY(3, PaletteWorkTrans, PaletteWork, 0x200, 32); del 2002.09.01(日)
		VoltageGaugeSlidOut();
		HeartIconAffEffSet(HEART_AFF_SMALL);
		TaskTable[id].TaskAdrs = WazaMaeVoltageOut;
	}
}

static void WazaMaeVoltageOut(u8 id)
{
	if(consys->voltage_slide_eff == 0 && consys->heart_aff_eff == 0)
		TaskTable[id].TaskAdrs = WazaPutSeq;
}


//=========================================================================
//	技エフェクトを呼び出す
//=========================================================================
enum{
	WAZA_CALC = 0,
	SIO_WAZADATA_GET_WAIT,
	YASUMI_CHECK,// = 0,
	POKE_SLIDEIN,
	POKE_SLIDEIN_WAIT,
	WAZAPUT_MSG,
	WAZAPUT_MSG_WAIT,
	WAZAEFF_SET,
	WAZAEFF_WAIT,
	WAZAEFF_WAIT_LOOP,
	POKE_SLIDEOUT,
	POKE_SLIDEOUT_WAIT,
	BASIC_METER_START,
	BASIC_METER_WAIT,
	COMBO_CHECK,
	COMBO_MSG_WAIT,
	COMBO_METER_WAIT,
	PENALTY_CHECK,
	PENALTY_METER_WAIT,
	PENALTY_MSG_WAIT,
	WINLIGHT_DROP,
	NEXT_WAIT,
	NEXT_BRD,
	WAZABRD_MSG_CHECKSET,
	WAZABRD_MSG_WAIT,
	ETC_BRD_MSG_CHECKSET_INIT,
	ETC_BRD_MSG_CHECKSET,
	ETC_BRD_MSG_WAIT,
	ETC_BRD_METER,
	ETC_BRD_METERWAIT,
	NEXT_ETCBRD_MSG,
	YASUMI_MSG,
	KINTYOU_OR_YASUMI_MSGWAIT,
	KINTYOU_MSGPUT,
	KINTYOU_MSG_WAIT,
	BONUS_FUKIDASI_CHECK,
	BONUS_FUKIDASI_WAIT,
	BONUS_ICON_CHECK,
	BONUS_ICON_WAIT,
	ETC_BONUS_ICON_CHECK,
	ETC_BONUS_ICON_WAIT,
	TENSYON_CHECK,
	TENSYON_MSG_WAIT,
	TENSYON_METER_WAIT,
	TENSYON_ICON_WAIT,
	COMBO_ICON_WAIT,
	PENALTY_ICON_WAIT,
	NEXT_SORTPRINT,
	NEXT_SORTCHECK,
	NEXT_ICONWAIT,
	WAZAKOUKA_ICON_CHECK,
	WAZABRD_YASUMI_MSG_CHECK,
	WAZABRD_YASUMIMSG_WAIT,
	TENSYON_DOWN_EFFECT,
	TENSYON_UP_EFFECT,
	TENSYON_GAUGE_OUT,
	TENSYON_GAUGE_OUT_WAIT,
	TENSYON_INVALID,
	TENSYON_INVALID_MSG,
	TENSYON_INVALID_MSG2,
};

static void WazaPutSeq(u8 id)
{
	if(++TaskTable[id].work[0] < 20)
		return;
	
	consys->wazaput_count = 0;
	//技ｴﾌｪｸﾄでﾗﾝﾀﾞﾑが使用される場合があるので、通信時の種の共有の為退避させておく
	consys->r_next = r_next;
	TaskTable[id].work[0] = WAZA_CALC;	//YASUMI_CHECK;
	TaskTable[id].TaskAdrs = WazaFlowSeq;
}

static void WazaFlowSeq(u8 id)
{
	int i, t;
	u8 wazabrd, poke, winact;
	s8 flg;
//	s16 penalty_ap, comboAP;
//	u8 combo;
	s8 seflg;
	u8 taskno;
	u16 wazano;
	
	wazabrd = consys->wazabrd;

	switch(TaskTable[id].work[0]){
		case WAZA_CALC:
			DebugAPUpdatingCheckPut();
			for(i = 0; consys->wazaput_count != CONWAZA->Sort[i]; i++)
				;
			consys->wazabrd = i;
			wazabrd = consys->wazabrd;
			
			if(ContestTuusin & C_TUUSIN_FLG){
				consys->sio_wazacalc = 1;
				if(ContestSioOyaCheck()){
					ContestWazaCalc(consys->wazabrd);//	親がまとめて計算 2002.08.07(水)
				}
				taskno = AddTask(ContWazaCalcDataSioGet, 0);
				ChangeTask(taskno, ContWazaCalcDataSioGet, ContWazaCalcDatatWait);
				//TaskTable[id].TaskAdrs = DummySequence;
				TuusintyuuMsgPut();
				TaskTable[id].work[0] = SIO_WAZADATA_GET_WAIT;
			}
			else{
				ContestWazaCalc(consys->wazabrd);//	親がまとめて計算 2002.08.07(水)
				TaskTable[id].work[0] = YASUMI_CHECK;
			}
			break;
		case SIO_WAZADATA_GET_WAIT:
			if(consys->sio_wazacalc == 0){
				TaskTable[id].work[0] = YASUMI_CHECK;
			}
			break;
		case YASUMI_CHECK:
			if(apsys[wazabrd].yasumi_turn || apsys[wazabrd].endAppeal_flg){
			//if(pccw[consys->wazabrd].yasumi){
				TaskTable[id].work[0] = YASUMI_MSG;
				break;
			}
			
			ContestTalkMsgClear();

			WazaPutBrdWinLight(wazabrd, 0);
//			WazaKubunIconPut(apsys[wazabrd].use_waza, wazabrd);
			
			TaskTable[id].work[10] = 0;
			TaskTable[id].work[0] = POKE_SLIDEIN;
			break;
		case POKE_SLIDEIN:	//ﾎﾟｹﾓﾝをｽﾗｲﾄﾞｲﾝさせる　通常処理(技が出せる)
			//ﾎﾟｹﾓﾝの座標取得のために必要なデータをｾｯﾄ
			for(i = 0; i < CLIENT_MAX; i++)
				BattlePokeAnmNo[i] = 0;
			memset(conpara, 0, sizeof(ConWazaEffParam));
			ConWazaEffParaSet(consys->wazabrd);
			poke = ContestPokeActorSet2(BreederParam[consys->wazabrd].monsno, BreederParam[consys->wazabrd].id_no, BreederParam[consys->wazabrd].personal_rnd);
			ActWork[poke].dx = CONTEST_SLIDE_INIT_DX;
			ActWork[poke].move = ContestPokeSlideInSeq;
			TaskTable[id].work[2] = poke;
			PokemonStruct[AttackClient] = poke;

			winact = BreederWindowObjSet(consys->wazabrd);
			BrdWinWazaPutEffSet(winact, 0);

			TaskTable[id].work[0] = POKE_SLIDEIN_WAIT;
			break;
		case POKE_SLIDEIN_WAIT:	//ｽﾗｲﾄﾞｲﾝ終了待ち
			poke = TaskTable[id].work[2];
			if(ActWork[poke].move == DummyActMove && brdsys[wazabrd].win_eff == 0)
				TaskTable[id].work[0] = WAZAPUT_MSG;
			break;
		case WAZAPUT_MSG:
			if(apsys[wazabrd].miss_flg){
			//if(ccw[wazabrd].kintyou){
				TaskTable[id].work[0] = KINTYOU_MSGPUT;
				break;
			}
			
			//技計算
//			ContestWazaCalc(consys->wazabrd);//	親がまとめて計算 2002.08.07(水)

			ContestTalkMsgClear();
			PM_strcpy(StrTempBuffer0, BreederParam[wazabrd].nickname);
			if(apsys[wazabrd].use_waza <= WAZANO_MAX){
				PM_strcpy(StrTempBuffer1, WazaNameData[apsys[wazabrd].use_waza]);
			}
			else{	//未知の技Noの場合はタイプを表示
				PM_strcpy(StrTempBuffer1, ConTypeWazaMsgTbl[apsys[wazabrd].con_type]);
			}
			PM_MsgExpand(MsgExpandBuffer, wazaput_msg);
			TalkMsgSet(&win[0], MsgExpandBuffer, CON_MSG, 
				CON_TALKMSG_X, CON_TALKMSG_Y);
			TaskTable[id].work[0] = WAZAPUT_MSG_WAIT;
			break;
		case WAZAPUT_MSG_WAIT:
			if(ContestTalkMsgPut(&win[0])){
				consys->eff_loop = 0;
				TaskTable[id].work[0] = WAZAEFF_SET;
			}
			break;
		case WAZAEFF_SET:
			wazano = GetContWazaNo(apsys[consys->wazabrd].use_waza);
			ContestWazaEffectWorkSet(consys->wazabrd);
			ConWazaEffParaSet(consys->wazabrd);
			SetRangeClient(wazano);
			WazaEffectSet(wazano);
			
			//VoltageIconAnmSet(TensyonCheck(apsys[consys->wazabrd].use_waza));
			TaskTable[id].work[0] = WAZAEFF_WAIT;
			break;
		case WAZAEFF_WAIT:
			WazaEffectSequence();
			if(WazaEffectFlag == 0){
				ContestWazaEffectWorkClear(wazabrd);
				
				//-- ｴﾌｪｸﾄ繰り返しﾁｪｯｸ --//
				if(consys->eff_loop){
					TaskTable[id].work[10] = 0;
					TaskTable[id].work[0] = WAZAEFF_WAIT_LOOP;
					break;
				}
				
				//ｺﾝﾎﾞのOFFだけﾁｪｯｸ。ONはｺﾝﾎﾞ吹き出しを表示した後にﾁｪｯｸする
				//if(ConWazaTbl[apsys[wazabrd].use_waza].combo1 == 0)
				if(apsys[wazabrd].combo1_flg == 0)
					EyeColorFadeStop(wazabrd);
				
				//-- 妨害を受けた時のアイコンを表示 --//
				BougaiReceiveIconPut();
				
				TaskTable[id].work[0] = WAZABRD_MSG_CHECKSET;//POKE_SLIDEOUT_WAIT;
			}
			break;
		case WAZAEFF_WAIT_LOOP:
			if(TaskTable[id].work[10]++ > 30){
				TaskTable[id].work[10] = 0;
				TaskTable[id].work[0] = WAZAEFF_SET;
			}
			break;
		case WAZABRD_MSG_CHECKSET:
			TaskTable[id].work[1] = 0;
			if(apsys[wazabrd].msgid != 0xff){
				AppealMsgSet(wazabrd, apsys[wazabrd].msgid);
				apsys[wazabrd].msgid = 0xff;//ﾒｯｾｰｼﾞはもうｾｯﾄしたのでﾜｰｸの方はｸﾘｱしてしまう
				TaskTable[id].work[0] = WAZABRD_MSG_WAIT;
			}else if(apsys[wazabrd].msgid2nd != 0xff){
				//msgid2ndに入っているﾃﾞｰﾀはwazabrdの効果技が不発に終った時のﾒｯｾｰｼﾞ
				//なので、誰かに効果技ﾒｯｾｰｼﾞが入ってる場合は表示しない
				for(i = 0; i < BREEDER_MAX; i++){
					if(i != wazabrd){
						if(apsys[i].msgid != 0xff)
							break;
					}
				}
				if(i == BREEDER_MAX){
					AppealMsgSet(wazabrd, apsys[wazabrd].msgid2nd);
					apsys[wazabrd].msgid2nd = 0xff;//ﾒｯｾｰｼﾞはもうｾｯﾄしたのでﾜｰｸの方はｸﾘｱしてしまう
					TaskTable[id].work[0] = WAZABRD_MSG_WAIT;
				}else
					TaskTable[id].work[0] = NEXT_SORTCHECK;
			}else
				TaskTable[id].work[0] = NEXT_SORTCHECK;
			break;
		case WAZABRD_MSG_WAIT:
			if(ContestTalkMsgPut(&win[0]))
				TaskTable[id].work[0] = WAZABRD_MSG_CHECKSET;//NEXT_SORTCHECK
			break;
		case NEXT_SORTCHECK:
			if(apsys[wazabrd].now_nextsort == 1)
				JudgeFukidasiSet(NEXTSORT_FAST_TYPE);
			else if(apsys[wazabrd].now_nextsort == 2)
				JudgeFukidasiSet(NEXTSORT_LAST_TYPE);
			else if(apsys[wazabrd].now_nextsort == 3)
				JudgeFukidasiSet(NEXTSORT_QUES_TYPE);
			else{
				TaskTable[id].work[0] = NEXT_SORTPRINT;
				break;
			}
			TaskTable[id].work[0] = NEXT_ICONWAIT;
			break;
		case NEXT_ICONWAIT:
			if(consys->fukidasi_eff == 0)
				TaskTable[id].work[0] = NEXT_SORTPRINT;
			break;
		case NEXT_SORTPRINT:
			NextSortPrint(1);
			TaskTable[id].work[0] = BASIC_METER_START;
			break;
		case BASIC_METER_START:		//-- ﾒｰﾀｰ作動 --//
			AppealHeartTaskSet(0, apsys[wazabrd].ap, wazabrd);
			TaskTable[id].work[0] = BASIC_METER_WAIT;
			break;
		case BASIC_METER_WAIT:		//ﾒｰﾀｰ動作終了待ち
			if(brdsys[consys->wazabrd].meter_eff == 0){
				TaskTable[id].work[0] = BONUS_FUKIDASI_CHECK;	//BONUS_ICON_CHECK;
			}
			break;
		case BONUS_FUKIDASI_CHECK:
			if(apsys[wazabrd].bonus_flg == 1)
				JudgeFukidasiSet(BONUS_TYPE);
			TaskTable[id].work[0] = BONUS_FUKIDASI_WAIT;
			break;
		case BONUS_FUKIDASI_WAIT:
			if(consys->fukidasi_eff == 0)
				TaskTable[id].work[0] = BONUS_ICON_CHECK;
			break;
		case BONUS_ICON_CHECK:
			flg = BonusIconPut(wazabrd, 1);
			if(flg){
				TaskTable[id].work[10] = 0;
				TaskTable[id].work[0] = BONUS_ICON_WAIT;
			}else
				TaskTable[id].work[0] = WAZAKOUKA_ICON_CHECK;
			break;
		case BONUS_ICON_WAIT:
			if(++TaskTable[id].work[10] > BONUS_ICONPUT_WAIT){
				TaskTable[id].work[10] = 0;
				TaskTable[id].work[0] = WAZAKOUKA_ICON_CHECK;
			}
			break;
		case WAZAKOUKA_ICON_CHECK:
			//WazaKoukaIconPutAll();
			seflg = WazaKoukaIconPut(wazabrd);
			if(seflg)
				SePlay(SE_C_PASI);
			TaskTable[id].work[0] = ETC_BRD_MSG_CHECKSET_INIT;
			break;
		case ETC_BRD_MSG_CHECKSET_INIT:
			TaskTable[id].work[1] = 0;
			TaskTable[id].work[0] = ETC_BRD_MSG_CHECKSET;
			break;
		case ETC_BRD_MSG_CHECKSET:
			t = 0;
			flg = 0;
			for(i = TaskTable[id].work[1]; i < BREEDER_MAX; i++){
				flg = 0;
				for(t = 0; t < BREEDER_MAX; t++){
					if(t == wazabrd || BrdSort[t] != i)
						continue;
					if(apsys[t].msgid != 0xff){
						flg = 1;
						break;
					}
				}
				if(flg)
					break;
			}
			if(flg){
				TaskTable[id].work[1] = BrdSort[t];
				AppealMsgSet(t, apsys[t].msgid);
				apsys[t].msgid = 0xff;//ﾒｯｾｰｼﾞはもうｾｯﾄしたのでﾜｰｸの方はｸﾘｱしてしまう
				TaskTable[id].work[0] = ETC_BRD_MSG_WAIT;
			}else{
				TaskTable[id].work[1] = 0;
				TaskTable[id].work[10] = 0;
				TaskTable[id].work[0] = WAZABRD_YASUMI_MSG_CHECK;
				WazaKoukaIconPutAll();	//add 2002.05.22(水)
			}
			break;
		case ETC_BRD_MSG_WAIT:
			if(ContestTalkMsgPut(&win[0]))
				//TaskTable[id].work[0] = ETC_BRD_MSG_CHECKSET;
				TaskTable[id].work[0] = ETC_BRD_METER;
			break;
		case ETC_BRD_METER:
			for(i = 0; TaskTable[id].work[1] != BrdSort[i]; i++)
				;
			AppealHeartTaskSet(apsys[i].ap + apsys[i].bougai, -apsys[i].bougai, i);
			TaskTable[id].work[0] = ETC_BRD_METERWAIT;
			break;
		case ETC_BRD_METERWAIT:
			for(i = 0; TaskTable[id].work[1] != BrdSort[i]; i++)
				;
			if(brdsys[i].meter_eff == 0)
				TaskTable[id].work[0] = ETC_BONUS_ICON_CHECK;
			break;
		case ETC_BONUS_ICON_CHECK:
			for(i = 0; TaskTable[id].work[1] != BrdSort[i]; i++)
				;
			flg = BonusIconPut(i, 1);
			if(flg){
				TaskTable[id].work[10] = 0;
				TaskTable[id].work[0] = ETC_BONUS_ICON_WAIT;
			}else
				TaskTable[id].work[0] = NEXT_ETCBRD_MSG;
			break;
		case ETC_BONUS_ICON_WAIT:
			if(++TaskTable[id].work[10] > BONUS_ICONPUT_WAIT){
				TaskTable[id].work[10] = 0;
				TaskTable[id].work[0] = NEXT_ETCBRD_MSG;
			}
			break;
		case NEXT_ETCBRD_MSG:
			//WazaKoukaIconPutAll();
			for(i = 0; i < BREEDER_MAX; i++){
				if(BrdSort[i] == TaskTable[id].work[1])
					break;
			}
			
			seflg = WazaKoukaIconPut(i);
			if(seflg)
				SePlay(SE_C_PASI);
			else
				SePlay(SE_C_SYU);
				
			if(apsys[i].combo1_del){
				EyeColorFadeStop(i);
				apsys[i].combo1_del = 0;
			}

			TaskTable[id].work[1]++;
			TaskTable[id].work[0] = ETC_BRD_MSG_CHECKSET;
			break;
		case WAZABRD_YASUMI_MSG_CHECK:
			if(TaskTable[id].work[10]++ < 10)
				break;	//ｱｲｺﾝを貼り付けた時のSEが鳴ってるせいで吹き出しSEが鳴らないことがあるのでちょっとｳｪｲﾄ
			TaskTable[id].work[10] = 0;

			if(apsys[wazabrd].yasumi_turn || apsys[wazabrd].next_yasumi_turn){
				ContestTalkMsgClear();
				PM_strcpy(StrTempBuffer0, BreederParam[wazabrd].nickname);
				PM_MsgExpand(MsgExpandBuffer, TugiYasumi_msg);
				TalkMsgSet(&win[0], MsgExpandBuffer, CON_MSG, 
					CON_TALKMSG_X, CON_TALKMSG_Y);
			}
			TaskTable[id].work[0] = WAZABRD_YASUMIMSG_WAIT;
			break;
		case WAZABRD_YASUMIMSG_WAIT:
			if(ContestTalkMsgPut(&win[0])){
				if(apsys[wazabrd].combo_hassei == 0)
					TaskTable[id].work[0] = PENALTY_CHECK;
				else
					TaskTable[id].work[0] = COMBO_CHECK;
			}
			break;
		case COMBO_CHECK:	//コンボ効果のある技なら効果のメッセージ表示
//			flg = ComboCheck(apsys[wazabrd].use_wazaold, apsys[wazabrd].use_waza);
			flg = apsys[wazabrd].combo_level;
			if(apsys[wazabrd].combo_level){
				//コンボ成立
				ContestTalkMsgClear();
				if(flg == 1)
					TalkMsgSet(&win[0], Combo1_msg, CON_MSG,
						CON_TALKMSG_X,CON_TALKMSG_Y);
				else if(flg == 2)
					TalkMsgSet(&win[0], Combo2_msg, CON_MSG,
						CON_TALKMSG_X,CON_TALKMSG_Y);
				else
					TalkMsgSet(&win[0], Combo3_msg, CON_MSG,
						CON_TALKMSG_X,CON_TALKMSG_Y);
				JudgeFukidasiSet(COMBO2_TYPE);
				TaskTable[id].work[10] = 0;
				TaskTable[id].work[0] = COMBO_ICON_WAIT;//COMBO_MSG_WAIT;
				//apsys[wazabrd].combo1_flg = 0;
			}
			else{
				//ｺﾝﾎﾞ1発生
				//apsys[wazabrd].combo1_flg = 1;
				ContestTalkMsgClear();
				PM_strcpy(StrTempBuffer0, BreederParam[wazabrd].nickname);
				PM_MsgExpand(MsgExpandBuffer, Combo_msg);
				TalkMsgSet(&win[0], MsgExpandBuffer,
					CON_MSG,CON_TALKMSG_X,CON_TALKMSG_Y);
				JudgeFukidasiSet(COMBO1_TYPE);
				TaskTable[id].work[10] = 0;
				TaskTable[id].work[0] = COMBO_ICON_WAIT;//COMBO_MSG_WAIT;
			}
			break;
		case COMBO_ICON_WAIT:
			if(consys->fukidasi_eff == 0){
				//ｺﾝﾎﾞ点滅チェック
				EyeColorStatusCheckSet(consys->wazabrd);
				TaskTable[id].work[0] = COMBO_MSG_WAIT;
			}
			break;
		case COMBO_MSG_WAIT:
			if(ContestTalkMsgPut(&win[0]) && ++TaskTable[id].work[10] > 50)
			{
				if(apsys[wazabrd].combo1_flg == 0){
				//	combo = ComboCheck(apsys[wazabrd].use_wazaold, apsys[wazabrd].use_waza);
				//	comboAP = apsys[wazabrd].found_ap * combo;
					AppealHeartTaskSet(apsys[wazabrd].ap, 
								apsys[wazabrd].comboAP, wazabrd);
					//微妙
					//apsys[wazabrd].ap += comboAP;
					apsys[wazabrd].ap += apsys[wazabrd].comboAP;
					
					//apsys[wazabrd].combo_conti_flg = 1;
				}
				TaskTable[id].work[0] = COMBO_METER_WAIT;
			}
			break;
		case COMBO_METER_WAIT:
			if(brdsys[wazabrd].meter_eff == 0){
				TaskTable[id].work[10] = 0;
				//ContestTalkMsgClear();
				TaskTable[id].work[0] = PENALTY_CHECK;
			}
			break;
		case PENALTY_CHECK:		//-- 同一技 連続使用ﾁｪｯｸ --//
			if(apsys[wazabrd].penalty)
			{	//ﾍﾟﾅﾙﾃｨ発生
				ContestTalkMsgClear();
				PM_strcpy(StrTempBuffer0, BreederParam[wazabrd].nickname);
				PM_MsgExpand(MsgExpandBuffer, Penalty_msg);
				TalkMsgSet(&win[0], MsgExpandBuffer, CON_MSG, 
					CON_TALKMSG_X, CON_TALKMSG_Y);
				
				TaskTable[id].work[10] = 0;
			#if 1	//ﾍﾟﾅﾙﾃｨではふきだしを出さないようになった
				JudgeFukidasiSet(PENALTY_TYPE);
				TaskTable[id].work[0] = PENALTY_ICON_WAIT;	//PENALTY_MSG_WAIT;
			#else
				TaskTable[id].work[0] = PENALTY_MSG_WAIT;
			#endif
			}
			else
			{	//ﾍﾟﾅﾙﾃｨなし
				TaskTable[id].work[0] = TENSYON_CHECK;	//POKE_SLIDEOUT;
			}
			break;
		case PENALTY_ICON_WAIT:
			if(consys->fukidasi_eff == 0)
				TaskTable[id].work[0] = PENALTY_MSG_WAIT;
			break;
		case PENALTY_MSG_WAIT:
			if(ContestTalkMsgPut(&win[0]))	// && ++TaskTable[id].work[10] > 50)
			{
//				penalty_ap = (apsys[wazabrd].conti_count + 1) * 10;
				AppealHeartTaskSet(apsys[wazabrd].ap,-apsys[wazabrd].penaltyAP,wazabrd);
//				apsys[wazabrd].sub_ap -= penalty_ap;

				//微妙
				//apsys[wazabrd].ap -= penalty_ap;
				apsys[wazabrd].ap -= apsys[wazabrd].penaltyAP;
				
				TaskTable[id].work[0] = PENALTY_METER_WAIT;
			}
			break;
		case PENALTY_METER_WAIT:	//-- ﾒｰﾀｰ下げ終了待ち --//
			DebugAPUpdatingCheckPut();
			if(brdsys[wazabrd].meter_eff == 0){
				TaskTable[id].work[10] = 0;
				ContestTalkMsgClear();
				TaskTable[id].work[0] = TENSYON_CHECK;	//POKE_SLIDEOUT;
			}
			break;
		case TENSYON_CHECK:
			if(ccw->tensyon_stop){
				if(wazabrd != ccw->tensyon_stop_brd){
					TaskTable[id].work[0] = TENSYON_INVALID;
					break;
				}
			}

			//flg = TensyonCheck(apsys[wazabrd].use_waza);
			flg = ccw->tensyon_updown;
			//if(flg <= 0 && apsys[wazabrd].tensyon_up){	2002.08.23(金)
			if(apsys[wazabrd].tensyon_up){
				flg = TENSYON_GAUGE_UP;
				PM_strcpy(StrTempBuffer2, 	//技名
					WazaNameData[apsys[wazabrd].use_waza]);
			}
			else{
				PM_strcpy(StrTempBuffer2, 	//ﾀｲﾌﾟ名
					TensyonKindMsgTbl[ConWazaTbl[apsys[wazabrd].use_waza].con_type]);
			}

			if(flg > 0 && apsys[wazabrd].penalty)
				flg = 0;	//ﾍﾟﾅﾙﾃｨが発生している場合はﾃﾝｼｮﾝｱｯﾌﾟは無効
			
			ContestTalkMsgClear();
			PM_strcpy(StrTempBuffer0, BreederParam[wazabrd].nickname);
			consys->tensyon += flg;
			if(consys->tensyon < 0)
				consys->tensyon = 0;
				
			if(flg == 0){
				//テンション変化なし
				TaskTable[id].work[0] = TENSYON_GAUGE_OUT;
				break;
			}
			else if(flg < 0)
				PM_MsgExpand(MsgExpandBuffer, TensionDown_msg);
			else if(flg > 0 && consys->tensyon < TENSYON_MAX)
				PM_MsgExpand(MsgExpandBuffer, TensionUp_msg);
			else{// if(flg > 0 && consys->tensyon >= TENSYON_MAX)
				PM_MsgExpand(MsgExpandBuffer, TensionMax_msg);
				//TensyonMaxPalAnmSet();
			}
			
			//TensyonNumPut();
			TalkMsgSet(&win[0], MsgExpandBuffer, CON_MSG, 
				CON_TALKMSG_X, CON_TALKMSG_Y);
			
			TaskTable[id].work[10] = 0;
			TaskTable[id].work[11] = 0;

			if(flg < 0)
				TaskTable[id].work[0] = TENSYON_DOWN_EFFECT;
			else
				TaskTable[id].work[0] = TENSYON_UP_EFFECT;
			break;
		case TENSYON_DOWN_EFFECT:
			switch(TaskTable[id].work[10]){
				case 0:
					KankyakuColorFadeSet(-1, 1);
					JinglePlay(MUS_ME_ZANNEN);	//add 2002.09.01(日)
					TaskTable[id].work[10]++;
					break;
				case 1:
					if(consys->kankyaku_color_eff == 0){
						if(ContestTalkMsgPut(&win[0])){
							VoltageGaugeSlidPut(-1);
							TaskTable[id].work[10]++;
						}
					}
					break;
				case 2:
					if(consys->voltage_eff == 0){
						if(TaskTable[id].work[11]++ < 30)
							break;
						TaskTable[id].work[11] = 0;
						KankyakuColorFadeSet(-1, -1);
						TaskTable[id].work[10]++;
					}
					break;
				case 3:
					if(FadeData.fade_sw == 0){
						TaskTable[id].work[10] = 0;
						TaskTable[id].work[11] = 0;
						TaskTable[id].work[0] = TENSYON_METER_WAIT;
					}
					break;
			}
			break;
		case TENSYON_UP_EFFECT:
			switch(TaskTable[id].work[10]){
				case 0:
					if(ContestTalkMsgPut(&win[0])){
						KankyakuColorFadeSet(1, 1);
						TaskTable[id].work[10]++;
					}
					break;
				case 1:
					if(consys->kankyaku_color_eff == 0){
						KankyakuAnmSet();
						SePlay(SE_W227B);
						VoltageGaugeSlidPut(1);
						TaskTable[id].work[10]++;
					}
					break;
				case 2:
					if(consys->voltage_eff == 0){
						if(TaskTable[id].work[11]++ < 30)
							break;
							
						TaskTable[id].work[11] = 0;
						AppealHeartTaskSet(apsys[wazabrd].ap,
							ccw->tensyonAdd, wazabrd);
						apsys[wazabrd].ap += ccw->tensyonAdd;
						TaskTable[id].work[10]++;
					}
					break;
				case 3:
					if(brdsys[wazabrd].meter_eff == 0 && consys->kankyaku_anm==0){
						KankyakuColorFadeSet(1, -1);
						TaskTable[id].work[10]++;
					}
					break;
				case 4:
					if(FadeData.fade_sw == 0){
						TaskTable[id].work[10] = 0;
						TaskTable[id].work[11] = 0;
						TaskTable[id].work[0] = TENSYON_METER_WAIT;
					}
					break;
			}
			break;
		case TENSYON_METER_WAIT:
			if(brdsys[wazabrd].meter_eff == 0){
				ContestTalkMsgClear();
//				if(consys->tensyon >= TENSYON_MAX){
//					consys->tensyon = 0;
//					TensyonNumPut();
//				}
				TaskTable[id].work[0] = TENSYON_GAUGE_OUT;
			}
			break;
		case TENSYON_INVALID:	//テンション無効時のメッセージ表示
			ContestTalkMsgClear();
			PM_strcpy(StrTempBuffer2, BreederParam[ccw->tensyon_stop_brd].nickname);
			PM_strcpy(StrTempBuffer0, BreederParam[wazabrd].nickname);
			PM_strcpy(StrTempBuffer1, WazaNameData[apsys[wazabrd].use_waza]);
			PM_MsgExpand(MsgExpandBuffer, Mituduketeiru_msg);
			TalkMsgSet(&win[0], MsgExpandBuffer, CON_MSG, 
				CON_TALKMSG_X, CON_TALKMSG_Y);
			TaskTable[id].work[0] = TENSYON_INVALID_MSG;
			break;
		case TENSYON_INVALID_MSG:
			if(ContestTalkMsgPut(&win[0])){
				ContestTalkMsgClear();
				PM_MsgExpand(MsgExpandBuffer, Mewomukerare_msg);
				TalkMsgSet(&win[0], MsgExpandBuffer, CON_MSG, 
					CON_TALKMSG_X, CON_TALKMSG_Y);
				TaskTable[id].work[0] = TENSYON_INVALID_MSG2;
			}
			break;
		case TENSYON_INVALID_MSG2:
			if(ContestTalkMsgPut(&win[0])){
				ContestTalkMsgClear();
				TaskTable[id].work[0] = TENSYON_GAUGE_OUT;
			}
			break;
		case KINTYOU_MSGPUT:
			//ｺﾝﾎﾞの点滅ﾁｪｯｸ
			if(apsys[wazabrd].combo1_flg)
				apsys[wazabrd].combo1_flg = 0;
			EyeColorStatusCheckSet(wazabrd);
			
			PM_strcpy(StrTempBuffer0, BreederParam[wazabrd].nickname);
			PM_strcpy(StrTempBuffer1, WazaNameData[apsys[wazabrd].use_waza]);
			PM_MsgExpand(MsgExpandBuffer, Kintyou_msg);
			TalkMsgSet(&win[0], MsgExpandBuffer, CON_MSG, 
				CON_TALKMSG_X, CON_TALKMSG_Y);
			TaskTable[id].work[0] = KINTYOU_MSG_WAIT;
			break;
		case KINTYOU_MSG_WAIT:
			if(ContestTalkMsgPut(&win[0]))
				TaskTable[id].work[0] = TENSYON_GAUGE_OUT;
			break;
		case TENSYON_GAUGE_OUT:
			VoltageGaugeSlidOut();
			TaskTable[id].work[0] = TENSYON_GAUGE_OUT_WAIT;
			break;
		case TENSYON_GAUGE_OUT_WAIT:
			if(consys->voltage_slide_eff == 0){
				if(consys->tensyon >= TENSYON_MAX){
					consys->tensyon = 0;
					TensyonNumPut();
				}
				TaskTable[id].work[0] = POKE_SLIDEOUT;
			}
			break;
		case POKE_SLIDEOUT:
			poke = TaskTable[id].work[2];
			ActWork[poke].move = ContestPokeSlideOut;
			TaskTable[id].work[0] = POKE_SLIDEOUT_WAIT;
			break;
		case POKE_SLIDEOUT_WAIT:
			poke = TaskTable[id].work[2];
			if(ActWork[poke].banish){
				AffineDelActor(&ActWork[poke]);
				DelActor(&ActWork[poke]);
				//TaskTable[id].work[0] = WINLIGHT_DROP;
				TaskTable[id].work[0] = WINLIGHT_DROP;
			}
			break;
		case WINLIGHT_DROP:
			//技を出していたﾌﾞﾘｰﾀﾞｰのｳｨﾝﾄﾞｳの色を照明を落とした時の色に戻す
			//WazaPutBrdWinLight(TaskTable[id].work[1], 1);
			for(i = 0; i < BREEDER_MAX; i++)//ﾍﾟﾅﾙﾃｨ2で複数のｳｨﾝﾄﾞｳが明るくなるので
				WazaPutBrdWinLight(i, 1);	//全部ここで暗くしてしまう

			TaskTable[id].work[10] = 0;
			TaskTable[id].work[0] = NEXT_WAIT;
			break;
		
		/*&&&&&&&&&&&&&&&&&&休み時OK&&&&&&&&&&&&&&&&&&&&&&&&*/
		case YASUMI_MSG:	//休みの時
			ContestTalkMsgClear();
			PM_strcpy(StrTempBuffer0, BreederParam[wazabrd].nickname);
			PM_MsgExpand(MsgExpandBuffer, miteita_msg);
			TalkMsgSet(&win[0], MsgExpandBuffer,
				CON_MSG,CON_TALKMSG_X,CON_TALKMSG_Y);
			TaskTable[id].work[0] = KINTYOU_OR_YASUMI_MSGWAIT;
			break;
		case KINTYOU_OR_YASUMI_MSGWAIT:
			if(ContestTalkMsgPut(&win[0]))
				TaskTable[id].work[0] = NEXT_WAIT;
			break;
		case NEXT_WAIT:	//次のﾌﾞﾘｰﾀﾞｰの処理に行く前に、少し間を空ける
			if(++TaskTable[id].work[10] < 30)
				return;
			TaskTable[id].work[10] = 0;
			TaskTable[id].work[0] = NEXT_BRD;
			break;
		/*&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&*/
		case NEXT_BRD:
			if(++consys->wazaput_count == BREEDER_MAX){
				
				//TotalAPCalc();
				
				TaskTable[id].work[0] = 0;
				TaskTable[id].work[1] = 0;
				TaskTable[id].work[2] = 0;
				//TaskTable[id].TaskAdrs = HeartIconFastMove;
				TaskTable[id].TaskAdrs = TotalApCalcSeq;
			}else
				TaskTable[id].work[0] = WAZA_CALC;	//YASUMI_CHECK;
			VoltageIconAnmSet(0);
			break;
	}
}


//-- 技データ計算結果の通信終了待ち --//
void ContWazaCalcDatatWait(u8 id)
{
	consys->sio_wazacalc = 0;
	DelTask(id);
}


//-- 敵の技を出す時にｽﾗｲﾄﾞしてくる動き --//
static void ContestPokeSlideInSeq(actWork *xreg)
{
	if(xreg->dx != 0)
		xreg->dx += CONTEST_SLIDEIN_SP;
	else{
		if(xreg->work[0]++ == CONTEST_SLIDE_WAIT){
			xreg->work[0] = 0;
			xreg->move = DummyActMove;
		}
	}
}

static void ContestPokeSlideOut(actWork *xreg)
{
	xreg->dx += CONTEST_SLIDEOUT_SP;
	if(xreg->x + xreg->dx < -32){
		xreg->move = DummyActMove;
		xreg->banish = 1;
	}
}






//=========================================================================
//	ターン終了時のトータルAPを計算
//=========================================================================
enum{
	TOTAL_AP_CALC_INIT,
	SIO_TOTAL_AP_GET_WAIT,
	TOTAL_AP_CALC_END,
};
static void TotalApCalcSeq(u8 id)
{
	u8 taskno;
	
	switch(TaskTable[id].work[0]){
		case TOTAL_AP_CALC_INIT:
			if(ContestTuusin & C_TUUSIN_FLG){
				consys->sio_wazacalc = 1;
				if(ContestSioOyaCheck()){
					TotalAPCalc();	//親がまとめて計算 2002.08.07(水)
					GetTurnKekkaMsgID();
				}
				taskno = AddTask(ContWazaCalcDataSioGet, 0);
				ChangeTask(taskno, ContWazaCalcDataSioGet, ContWazaCalcDatatWait);
				TuusintyuuMsgPut();
				TaskTable[id].work[0] = SIO_TOTAL_AP_GET_WAIT;
			}
			else{
				TotalAPCalc();
				GetTurnKekkaMsgID();
				TaskTable[id].work[0] = TOTAL_AP_CALC_END;
			}
			break;
		case SIO_TOTAL_AP_GET_WAIT:
			if(consys->sio_wazacalc == 0){
				TaskTable[id].work[0] = TOTAL_AP_CALC_END;;
			}
			break;
		case TOTAL_AP_CALC_END:
			TaskTable[id].work[0] = 0;
			TaskTable[id].TaskAdrs = HeartIconFastMove;
			break;
	}

}

//=========================================================================
//	まず技を出した時点でのトータルAPをハートメーターで表示する
//=========================================================================
static void HeartIconFastMove(u8 id)
{
	//同一技使用で、他のﾌﾞﾘｰﾀﾞｰも下がってる可能性があるので全員分動かす
	NextSortPrint(0);	//ﾊｰﾄｱｲｺﾝを動かすためにここで表示を消す
	TaskTable[id].work[0] = 0;
	TaskTable[id].work[1] = 0;
	TaskTable[id].TaskAdrs = HeartIconAffAppearWait;
}

static void HeartIconAffAppearWait(u8 id)
{
	switch(TaskTable[id].work[0]){
		case 0:		//ｿｰﾄｱｲｺﾝが消えて、ちょっとしてからﾊｰﾄｱｲｺﾝを出す
			if(++TaskTable[id].work[1] > 20){
				HeartIconAffEffSet(HEART_AFF_BIG);
				TaskTable[id].work[1] = 0;
				TaskTable[id].work[0]++;
			}
			break;
		case 1:
			if(consys->heart_aff_eff == 0){
				if(++TaskTable[id].work[1] > 20){	//動き出すまでに少しｳｪｲﾄ
					TaskTable[id].work[1] = 0;
					TaskTable[id].work[0]++;
				}
			}
			break;
		case 2:
			SetHeartIconMoveAll();
			TaskTable[id].work[0] = 0;
			TaskTable[id].work[1] = 0;
			TaskTable[id].TaskAdrs = HeartIconFastMoveWait;
			break;
	}
}

static void HeartIconFastMoveWait(u8 id)
{
	if(CheckHeartIconMoveAll())
		TaskTable[id].TaskAdrs = LightingRaised;	//WinLightDrop;
}

//=========================================================================
//	照明をあげる
//=========================================================================
static void LightingRaised(u8 id)
{
	DIV_DMACOPY(3, &UserWork[CONT_TURN_PLTT], PaletteWork, 0x400, 32);
	TaskTable[id].work[0] = 0;
	TaskTable[id].work[1] = LIGHT_EVY;
	TaskTable[id].TaskAdrs = LightingRaisedMain;
}

static void LightingRaisedMain(u8 id)
{
	if(++TaskTable[id].work[0] < 3)
		return;
	TaskTable[id].work[0] = 0;
	TaskTable[id].work[1]--;

	if(TaskTable[id].work[1] == 0)
		TaskTable[id].TaskAdrs = KekkaMsgPutSeq;	//AppealKoukaInitSeq;
}

//=========================================================================
//	今のターンのアピール結果をﾒｯｾｰｼﾞで表示
//=========================================================================
static void KekkaMsgPutSeq(u8 id)
{
	u8 kekka_msg;
//	int i;
	
//	if(YasumiTurnCheck(MyBreederNo))
	kekka_msg = apsys[MyBreederNo].kekka_msgid;
	ContestTalkMsgClear();
	PM_strcpy(StrTempBuffer0, BreederParam[MyBreederNo].nickname);
//	MsgPrint(&FightMsg, TurnKekkaMsgTbl[kekka_msg],
//				CON_MSG, CON_TALKMSG_X, CON_TALKMSG_Y);
	PM_MsgExpand(MsgExpandBuffer, TurnKekkaMsgTbl[kekka_msg]);
	TalkMsgSet(&win[0], MsgExpandBuffer,
				CON_MSG, CON_TALKMSG_X, CON_TALKMSG_Y);

	TaskTable[id].TaskAdrs = ConWazaKekkaMsgWaitSeq;
}

static void ConWazaKekkaMsgWaitSeq(u8 id)
{
	if(ContestTalkMsgPut(&win[0]) == 1)
//	if(sys.Trg & A_BUTTON)
	{
//		AppealMeterClear();
//		MeterColorClearAll();
		TaskTable[id].work[0] = 0;
		TaskTable[id].TaskAdrs = NextTurnSeq;
		DebugAPUpdatingCheckPut();
	}
}

//=========================================================================
//	次のﾀｰﾝへ
//=========================================================================
static void NextTurnSeq(u8 id)
{
	if(TaskTable[id].work[0]++ < 30)
		return;	//改行送りの選択音が、幕下ろしのSEと被ってしまうのでちょっとｳｪｲﾄ
	TaskTable[id].work[0] = 0;
	
	/*---
	for(i = 0; i < BREEDER_MAX; i++)
	{
		PutRankingMes(i, COL_BLUE);
		PutRankingNo(i, COL_PURPLE);
	}
	--------*/
	SetHeartIconMoveAll();	//←ここは今は実際はなくてもいいっぽいね 2002.04.27(土)
							//もうちょい上の方でやってるやつだけど動きは完了してる
	TaskTable[id].TaskAdrs = JyunniPutWaitSeq;
}

static void JyunniPutWaitSeq(u8 id)
{
	if(CheckHeartIconMoveAll() == 0)
		return;
	TaskTable[id].work[0] = 0;
	TaskTable[id].TaskAdrs = InfoMaskEffect;
}

//----------------------------------------------------------
//	プレイヤー情報書き換えｴﾌｪｸﾄ
//----------------------------------------------------------
static void InfoMaskEffect(u8 id)
{
	InfoMaskEffectDataSet();
	TaskTable[id].TaskAdrs = DownMoveEffect;
}

void InfoMaskEffectEnd(u8 id)
{
	InfoMaskEffectDataClear();
	TaskTable[id].TaskAdrs = InfoMaskEffectEnd2nd;
}

static void InfoMaskEffectEnd2nd(u8 id)
{
	(*(vBgCnt *)REG_BG0CNT).Priority = 0;
	(*(vBgCnt *)REG_BG2CNT).Priority = 0;

	consys->turn++;
	if(consys->turn == END_TURN)
		TaskTable[id].TaskAdrs = NijiSinsaEndSeq;
	else{
//		TaskTable[id].TaskAdrs = TurnHearSeq;
		VoltageGaugeSlidIn();
		TaskTable[id].TaskAdrs = TurnVoltageGaugePut;
	}
}

static void TurnVoltageGaugePut(u8 id)
{
	if(consys->voltage_slide_eff == 0)
		TaskTable[id].TaskAdrs = TurnHearSeq;
}

//=========================================================================
//	二次審査(ｱﾋﾟｰﾙﾀｲﾑ)終了
//=========================================================================
static void NijiSinsaEndSeq(u8 id)
{
	int i;
	
	ScrY0 = 0;
	ScrY2 = 0;
	for(i = 0; i < BREEDER_MAX; i++)
		ContAP[i] = apsys[i].total_ap;
	GetEvaluationValueAll();
	ContestTalkMsgClear();
	
	//TVConWazaSet(apsys[MyBreederNo].use_waza);	//←↓changed 2002.02.14(木)
	TVConWazaSet(apsys[MyBreederNo].use_wazaold);
	
	temp_rand = r_next;
	
	PM_MsgExpand(MsgExpandBuffer, syuuryou_msg);
	TalkMsgSet(&win[0], MsgExpandBuffer, CON_MSG, CON_TALKMSG_X, CON_TALKMSG_Y);
//	MsgPrint(&FightMsg, syuuryou_msg, CON_MSG, CON_TALKMSG_X, CON_TALKMSG_Y);
	TaskTable[id].work[2] = 0;
	TaskTable[id].TaskAdrs = NijiSinsaMsgWaitSeq;
}

static void NijiSinsaMsgWaitSeq(u8 id)
{
//	if(ContestTalkMsgPut(&win[0]) == 1 && ++TaskTable[id].work[2] > 110)
//	if(sys.Trg & A_BUTTON)
	if(ContestTalkMsgPut(&win[0]) == 1)
	{
		InfoMaskEffectDataSet();
		ScrX1 = 0;
		ScrY1 = 160;
		SePlayPan(SE_C_MAKU_D, 0);
		TaskTable[id].work[0] = 0;
		TaskTable[id].TaskAdrs = MakuOrosuSeq;
	}
}

//-- 幕を下ろす --//
static void MakuOrosuSeq(u8 id)
{
	ScrY1 -= CURTAIN_SP;
	if((s16)ScrY1 < 0)
		ScrY1 = 0;
	if(ScrY1 == 0){
		TaskTable[id].TaskAdrs = NijisinsaMakuDownEndSeq;
		TaskTable[id].work[0] = 0;
	}
}

static void NijisinsaMakuDownEndSeq(u8 id)
{
	if(TaskTable[id].work[0]++ < 50)
		return;
	TaskTable[id].work[0] = 0;
	
	if(ContestTuusin & C_TUUSIN_FLG)
		TaskTable[id].TaskAdrs = TuusinWaitFadeOut;
	else
	{
		PaletteFadeReq(0xffffffff, 0, 0, 16,0x0000);
		TaskTable[id].TaskAdrs = FadeWaitSeq;
	}
}

static void TuusinWaitFadeOut(u8 id)
{
	u8 taskno;
	
//	taskno = AddTask(ContestStandbyCheck, 0);
//	ChangeTask(taskno, ContestStandbyCheck, TuusinWaitFadeReturn);
	taskno = AddTask(EvaluationSioGet, 0);
	ChangeTask(taskno, EvaluationSioGet, TuusinWaitFadeReturn);
	TaskTable[id].TaskAdrs = DummySequence;
	TuusintyuuMsgPut();
	HearIconEva(0);
}

static void TuusinWaitFadeReturn(u8 id)
{
	DelTask(id);
	PaletteFadeReq(0xffffffff, 0, 0, 16,0x0000);
	TaskTable[consys->id].TaskAdrs = FadeWaitSeq;
}

/*-------------常にｵﾝﾗｲﾝに変更したためDel 2002.08.09(金) ------------
static void TuusinEndInit(u8 id)
{
	SetSioEndDataStart();
	TaskTable[id].TaskAdrs = TuusinEndWait;
}

static void TuusinEndWait(u8 id)
{
	if(pokemon_sio_flag == 0){
		DelTask(id);
		PaletteFadeReq(0xffffffff, 0, 0, 16,0x0000);
		TaskTable[consys->id].TaskAdrs = FadeWaitSeq;
	}
}
-------------------------------------*/

static void FadeWaitSeq(u8 id)
{
	if(FadeData.fade_sw == 0)
	{
		DelTask(id);
//		sys.pMainProc = ContestResultInit;
		pFieldRecoverFunc = FadeInWaitSeq;
		MainProcChange(FieldMainRecover);
	}
}

//-- ﾌｨｰﾙﾄﾞに画面が戻ったらﾌｪｰﾄﾞｲﾝさせる --//
static void FadeInWaitSeq(void)
{
	ResetForceEvent();
	ContinueFieldScript();
}
