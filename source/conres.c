//=========================================================================
//
//		コンテスト結果発表画面
//											by matsuda	2001.10.11(木)
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
#include "pokeicon.h"
#include "madefine.h"
#include "wazatool.h"
#include "fld_main.h"
#include "script.h"
#include "objdata.h"
#include "conscr.h"
#include "consio.h"
#include "multisio.h"
#include "pokesio.h"
#include "letter.h"
#include "cable.h"
#include "fan.h"
#include "ef_tool.h"
#include "mus_tool.h"
#include "zukan.h"


//----------------------------------------------------------
//	グローバル変数
//----------------------------------------------------------

//----------------------------------------------------------
//	外部変数
//----------------------------------------------------------
//extern	u8	FightMsgBuf[64];
extern	TALK_WIN	win[4];

//----------------------------------------------------------
//	外部ﾃﾞｰﾀ
//----------------------------------------------------------
extern const u32 DecordAdrs[];
extern const u16 p_icon_Palette[];

//----------------------------------------------------------
//	プロトタイプ宣言
//----------------------------------------------------------
static void	MainContestResult(void);
static void conresult_v_blank_intr(void);
static void InitFadeWaitSeq(u8 id);
static void ContestEndSeq(u8);
static void ContestEndFadeWait(u8);
//static void FadeInWaitSeq(void);
//static void FadeInEndCheck(u8 id);
static void EvaluationGetWait(u8 id);
static void TuusinCheckEnd(u8);
static void EvaluationGetInit(u8 id);
//static void ConnectNumCheck(u8);
//static void Sio10SyncWait(u8 id);
static void SioEndCodeGetWait(u8 id);
static void EvaluationGetWait(u8 id);
//-- 新規 2002.06.24(月) --//
static void PokeIconBgSet(u16 monsno, u8 posno, u8 anmno, u8 scrn_sw, u32);
static void PokeIconBgAllSet(u8 anmno, u8 scrn_sw);
static void PokeIconBgPaletteSet(void);
static void HaikeiScrollTask(u8 id);
static void StarHeartFadeTask(u8 id);
static void HyoudaiWriteScrn(void);
static u8 GetStarNum(u8 brd, u8);
static s8 GetHeartNum(u8 brd, u8);
static void MsgWinObjMake(const u8 *msg, u8);
static void MsgWinObjSet(void);
static void MsgWinObjSlidInSet(s16 x, s16 y, u16 wait, u16 sp);
static void MsgWinObjSlidOutSet(u16 sp);
static void MsgWinObjDefaultSet(actWork *xreg);
static void MsgWinObjSlidInSeq(actWork *xreg);
static void MsgWinObjWaitSeq(actWork *xreg);
static void MsgWinObjSlideOutSeq(actWork *xreg);
static void ItijiSinsaGaugeInit(u8 id);
static void KekkaHappyouMsgSlidIn(u8 id);
static void JyunniScrnWriteSeq(u8 id);
static void ChampWinPaletteAnime(u8 id);
static void ChampWinPaletteAnimeMain(u8 id);
static void PokeSlidInAppear(actWork *xreg);
static void PokeSlideOut(actWork *xreg);
static void KamifubukiTask(u8 id);
static void CresKamifubukiSeq(actWork *xreg);
static void EndKeyWait(u8 id);
static void ChampAppearEffect(u8 id);
static void NijiSinsaMsgInit(u8 id);
static void NijiSinsaGaugeInit(u8 id);
static void JyunniNumPut(u8 id);
static u16 GetMsgWinCenterPos(const u8 *msg);
static void SioWinMsgPut(const u8 *msg);
static void SioWinMsgElase(void);
static void ResultTuusinEndWait(u8 id);
static void PokeIconBGAnmSet(u8 brd, u8 anm_wait);
static void PokeIconBGAnmSeq(u8 id);
static void ResultMeterCalc(void);

static void StarHeartFadeEndCheck(u8 hosi_heart, u8 count);
static void MeterUpDownSeq(u8 id);

//----------------------------------------------------------
//	データ
//----------------------------------------------------------
#include "..\scaddata\kekka_w.ach"
#include "..\scaddata\kekka_w.acl"
#include "conres.dat"

//----------------------------------------------------------
//	メッセージデータ
//----------------------------------------------------------
#include "..\msgdata\conmsg.h"


//----------------------------------------------------------
//	プログラム
//----------------------------------------------------------

//----------------------------------------------------------
//	ﾚｼﾞｽﾀｰ初期化
//----------------------------------------------------------
static void RegisterInit(void)
{
	*(vu16 *)REG_DISPCNT = DISP_MODE_0 | DISP_OBJ_CHAR_1D_MAP;

	PrintScreenInit(CONRES1_TYPE);
	MsgControlInit(&win[0],CONRES1_TYPE);		//ﾒｯｾｰｼﾞ使用BGﾚｼﾞｽﾀ初期化

	//-- 桜吹雪 --//
	*(vu16 *)REG_BG0CNT = BG_SCREEN_SIZE_0 | BG_PRIORITY_0
	| CRES_EFF_SCRN_NO << BG_SCREEN_BASE_SHIFT 
	| CRES_EFF_CHARBASE_NO << BG_CHAR_BASE_SHIFT
	| BG_COLOR_16 | BG_MOS_OFF | BG_LOOP_ON;

	//フォント面
	*(vu16 *)REG_BG1CNT = BG_SCREEN_SIZE_0 | BG_PRIORITY_3
	| CRES_FONT_SCRN_NO << BG_SCREEN_BASE_SHIFT 
	| CRES_FONT_CHARBASE_NO << BG_CHAR_BASE_SHIFT
	| BG_COLOR_16 | BG_MOS_OFF;

	//ｳｨﾝﾄﾞｳ
	*(vu16 *)REG_BG2CNT = BG_SCREEN_SIZE_0 | BG_PRIORITY_3
	| CRES_WIN_SCRN_NO << BG_SCREEN_BASE_SHIFT 
	| CRES_HAIKEI_CHARBASE_NO << BG_CHAR_BASE_SHIFT
	| BG_COLOR_16 | BG_MOS_OFF;

	//背景
	*(vu16 *)REG_BG3CNT = BG_SCREEN_SIZE_0 | BG_PRIORITY_3
	| CRES_HAIKEI_SCRN_NO << BG_SCREEN_BASE_SHIFT 
	| CRES_HAIKEI_CHARBASE_NO << BG_CHAR_BASE_SHIFT
	| BG_COLOR_16 | BG_MOS_OFF | BG_LOOP_ON;

	*(vu16*)REG_MOSAIC = 0;

	*(vu16*)REG_WININ = (WIN_ALL_ON << 8) | WIN_ALL_ON;
	*(vu16*)REG_WINOUT = (WIN_ALL_ON << 8) | (WIN_ALL_ON^(WIN_OBJ_ON|WIN_BG0_ON));

	*(vu16*)REG_WIN0H = 0;
	*(vu16*)REG_WIN0V = 0;
	*(vu16*)REG_WIN1H = 0;
	*(vu16*)REG_WIN1V = 0;

	*(vu16 *)REG_BLDCNT   = 0;	//半透明設定
	*(vu16 *)REG_BLDALPHA = 0;
	*(vu16 *)REG_BLDY	  = 0;

	*(vu16 *)REG_BG0HOFS = 0;
	*(vu16 *)REG_BG0VOFS = 0;
	*(vu16 *)REG_BG1HOFS = 0;
	*(vu16 *)REG_BG1VOFS = 0;
	*(vu16 *)REG_BG2HOFS = 0;
	*(vu16 *)REG_BG2VOFS = 0;
	*(vu16 *)REG_BG3HOFS = 0;
	*(vu16 *)REG_BG3VOFS = 0;

	*(vu16 *)REG_DISPCNT |= DISP_BG0_ON | DISP_BG1_ON | DISP_BG2_ON 
							| DISP_BG3_ON | DISP_OBJ_ON | DISP_WIN01_ON;
	
	ScrX0=0;
	ScrY0=0;
	ScrX1=0;
	ScrY1=0;
	ScrX2=0;
	ScrY2=0;
	ScrX3=0;
	ScrY3=0;
	Win0H = 0;
	Win0V = 0;
	Win1H = 0;
	Win1V = 0;
}

//----------------------------------------------------------
//	初期BGｷｬﾗ、ｽｸﾘｰﾝ、ｶﾗｰ転送
//----------------------------------------------------------
static void BGinit(void)
{
	int i, x;
	u16 heart_scrn, star_scrn;
	s8 star_num, heart_num;
	
	DIV_DMACLEAR(3,0,VRAM,(VRAM_END-VRAM),32);

	//キャラ
	DecordVram((void*)kekka_bg_pch_ADRS, (void*)CRES_HAIKEI_VRAM);	//全部
	
	//スクリーン
	DecordVram((void*)kekka_bg3_psc_ADRS, (void*)CRES_HAIKEI_SCRN);	//背景
	DecordVram((void*)kekka_bg2_psc_ADRS, (void*)CRES_WIN_SCRN);	//ｳｨﾝﾄﾞｳ
	DecordVram((void*)kekka_bg0_psc_ADRS, (void*)CRES_EFF_SCRN);	//紙ふぶき
	HyoudaiWriteScrn();
	
	//パレット
	DecordPaletteWork((void*)kekka_pcl_ADRS, PA_BG0, 0x200);
	PrintPaletteInit(CONRES1_TYPE);	//BGﾊﾟﾚｯﾄ転送でﾌｫﾝﾄﾊﾟﾚｯﾄも上書きされてしまうので

	//-- 星、ハートのキャラを配置 --//
	for(i = 0; i < BREEDER_MAX; i++){
		star_num = GetStarNum(i, 1);
		heart_num = GetHeartNum(i, 1);
		for(x = 0; x < 10; x++){
			if(x < star_num)
				star_scrn = CRES_STAR_FADE;
			else
				star_scrn = CRES_STAR_SPACE;
			
			if(x < abs(heart_num)){
				if(heart_num < 0)
					heart_scrn = CRES_HEARTBL_FADE;
				else
					heart_scrn = CRES_HEART_FADE;
			}
			else
				heart_scrn = CRES_HEART_SPACE;
			
			*(vu16*)(CRES_FONT_SCRN+
				(0x20*(CRES_STAR_Y0+i*3) + CRES_STAR_X0+x)*2) = star_scrn;
			*(vu16*)(CRES_FONT_SCRN+
				(0x20*(CRES_HEART_Y0+i*3) + CRES_HEART_X0+x)*2) = heart_scrn;
		}
	}
}

//----------------------------------------------------------
//	ブリーダーとポケモンの名前を表示
//----------------------------------------------------------
#define CRES_POKENAME_X	7
#define CRES_BRDNAME_X		12	// "/"とブリーダーの名前
static const u8 RedFont[] = {CTRL_,C_FCOL_,COL_RED,EOM_};
static const u8 sura_msg[] = {sura_,EOM_};
static void BreederNamePut(u8 brd)
{
	u16 y;
	u8 *pmsg;
	
	y = 4;
	y += 3*brd;
	if(brd == MyBreederNo)
		pmsg = PM_strcpy(FightMsgBuf, RedFont);
	else
		pmsg = FightMsgBuf;
	PM_strcpy(pmsg, BreederParam[brd].nickname);
	MsgPrint(&win[0], FightMsgBuf, 
			CRES_POKE_NAMECGX + brd*CRES_POKENAME_LEN, CRES_POKENAME_X, y);
	if(brd == MyBreederNo)
		pmsg = PM_strcpy(FightMsgBuf, RedFont);
	else
		pmsg = FightMsgBuf;
	PM_strcpy(pmsg, sura_msg);
	PM_strcat(pmsg, BreederParam[brd].name);
	MsgPrint(&win[0], FightMsgBuf, CRES_BRD_NAMECGX + brd*CRES_BRDNAME_LEN,
				CRES_BRDNAME_X, y);
}

static void BreederNamePutAll(void)
{
	int i;
	for(i = 0; i < BREEDER_MAX; i++)
		BreederNamePut(i);
}

//=========================================================================
//	初期設定
//=========================================================================
void ContestResultInit(void)
{
	FadeData.trans_stop = 1;
	
//	r_next = temp_rand;
	
	SetVBlankFunc(NULL);
	RegisterInit();
	LasterWorkInit();
	PaletteAnimeInit();
	InitActor();
	InitTask();
	ObjPalManInit();
//	ObjPalManStart=4;				// ﾊﾟﾚｯﾄﾏﾈｰｼﾞｬNo開始
	BGinit();

	PokeIconBgPaletteSet();
	PokeIconBgAllSet(0, 1);
	BreederNamePutAll();

	memset(cres, 0, sizeof(CresSys));	//ｼｽﾃﾑ構造体初期化
	memset(cgraph, 0, sizeof(ConGraph)*BREEDER_MAX);
	
	MsgWinObjSet();
	
	PaletteFadeReq(0xffffffff, 0,16,0,0x0000);
	FadeData.trans_stop = 0;
	
	cres->main_id = AddTask(InitFadeWaitSeq, 5);
	MainProcChange(MainContestResult);
	
	Win1H = (0 << 8) | 240;		//ﾒｯｾｰｼﾞｳｨﾝﾄﾞｳが流れる部分をｳｨﾝﾄﾞｳで覆う
	Win1V = (128 << 8) | 160;
	
	AddTask(HaikeiScrollTask, 20);	//背景スクロール

	ResultMeterCalc();			//ﾒｰﾀｰ計算
	
	MusicPlay(MUS_CON_K);
	SetVBlankFunc(conresult_v_blank_intr);
}

//----------------------------------------------------------
//	メインループ
//----------------------------------------------------------
static void	MainContestResult(void)
{
	JumpActor();
	SetActor();
	MainTask();
	PaletteAnime();
}

//----------------------------------------------------------
//	Vブランク関数
//----------------------------------------------------------
static void conresult_v_blank_intr(void)
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
	actOAMtrans();
	actDMAtrans();
	PaletteFadeTrans();
	LasterVblank();
}


//=========================================================================
//	シーケンス
//=========================================================================

//----------------------------------------------------------
//	ﾌｪｰﾄﾞｲﾝ終了まで待ち
//----------------------------------------------------------
static void InitFadeWaitSeq(u8 id)
{
	if(FadeData.fade_sw == 0)
	{
		if(ContestTuusin & C_TUUSIN_FLG)
		{
			/*
			ScrY1 = 48;
			MsgPrint(&win[0], tuusintyuu_msg, CRES_WINMSG, 1, 0x0f);//0x15);
			UserWork[0] = 0;
			*/
			SioWinMsgPut(tuusin_taiki_msg);
			TaskTable[id].TaskAdrs = EvaluationGetInit;
		}
		else
			TaskTable[id].TaskAdrs = KekkaHappyouMsgSlidIn;
	}
}

//+++++++++++++ 通信 ++++++++++++++++++++++

//----------------------------------------------------------
//	評価値を通信で取得するまでｳｪｲﾄ
//----------------------------------------------------------
static void EvaluationGetInit(u8 id)
{
	u8 task;
	
	if(pokemon_sio_flag == OFF)
		return;
	
	if(GetConnectSioMenberNum() == 4)
	{
	//	task = AddTask(EvaluationSioGet, 0);
	//	ChangeTask(task, EvaluationSioGet, EvaluationGetWait);
		task = AddTask(EvaluationGetWait, 0);//2次審査終了時に通信するように変更したので
		
		TaskTable[id].TaskAdrs = DummyTaskSeq;
	}
}

static void EvaluationGetWait(u8 id)
{
//	ChangeTask(id, SioEndCodeSend, SioEndCodeGetWait);
	ChangeTask(id, ContestStandbyCheck, SioEndCodeGetWait);
}

static void SioEndCodeGetWait(u8 id)
{
	if(SplitDataSendStatus()){
		//PokemonMultiSioEnd();		2002.06.27(木)
		DelTask(id);
		TaskTable[cres->main_id].TaskAdrs = KekkaHappyouMsgSlidIn;
		SioWinMsgElase();
//		FontScrnBoxFill(&win[0], CRES_SPACE, 1, 0x0f, 19, 0x0f+3);//0x15+3);
//		ScrY1 = 0;

	//	ContReceptionBuffClear();
	//	SplitDataResultReset();
	}
}

// ++++++++++++++++++++++++++


//----------------------------------------------------------
//	「けっかはっぴょう」の文字をスライドイン
//----------------------------------------------------------
static void KekkaHappyouMsgSlidIn(u8 id)
{
	u16 x;
	
	if(TaskTable[id].work[MAIN_SEQ] == 0){
		AddTask(StarHeartFadeTask, 20);	//星＆ﾊｰﾄのﾌｪｰﾄﾞ
		MsgWinObjMake(kekkahappyou_msg, cres->win_act);
		x = GetMsgWinCenterPos(kekkahappyou_msg);
		MsgWinObjSlidInSet(x, MSGWINOBJ_DEFAULT_Y, 60*2, MSGWINOBJ_INOUT_SP);
		TaskTable[id].work[MAIN_SEQ]++;
	}
	else if(TaskTable[id].work[MAIN_SEQ] == 1){	//ﾒｯｾｰｼﾞ ｽﾗｲﾄﾞｲﾝ待ち
		if(cres->win_status == WO_TAIKI_OUT){
			TaskTable[id].work[MAIN_TEMP] = 0;
			TaskTable[id].work[MAIN_SEQ]++;
		}
	}
	else if(TaskTable[id].work[MAIN_SEQ] == 2){	//ｽﾗｲﾄﾞｱｳﾄ後、ちょっとｳｪｲﾄ
		if(TaskTable[id].work[MAIN_TEMP]++ == NEXT_MSG_WAIT){
			TaskTable[id].work[MAIN_TEMP] = 0;
			TaskTable[id].work[MAIN_SEQ]++;
		}
	}
	else if(TaskTable[id].work[MAIN_SEQ] == 3){	//「一時審査の結果」のﾒｯｾｰｼﾞ ｽﾗｲﾄﾞｲﾝ
		MsgWinObjMake(itiji_kekka_msg, cres->win_act);
		x = GetMsgWinCenterPos(itiji_kekka_msg);
		MsgWinObjSlidInSet(x, MSGWINOBJ_DEFAULT_Y, 0xffff, MSGWINOBJ_INOUT_SP);
		TaskTable[id].work[MAIN_SEQ]++;
	}
	else if(TaskTable[id].work[MAIN_SEQ] == 4){	//待機になるのを待つ
		if(cres->win_status == WO_TAIKI_IN){
			TaskTable[id].work[MAIN_SEQ] = 0;
			TaskTable[id].TaskAdrs = ItijiSinsaGaugeInit;
		}
	}
}

//----------------------------------------------------------
//	1次審査のゲージ計算
//----------------------------------------------------------
enum{
	ISG_0,
	ISG_1,
	ISG_2,
	ISG_3,
};
static void ItijiSinsaGaugeInit(u8 id)
{
	switch(TaskTable[id].work[MAIN_SEQ]){
		case ISG_0:
			if(cres->gauge_fade == 0){
				StarHeartFadeEndCheck(0, TaskTable[id].work[MAIN_WORK0]++);
				if(cres->meter_eff == 0)
					TaskTable[id].work[MAIN_SEQ] = ISG_2;
				else
					TaskTable[id].work[MAIN_SEQ]++;
			}
			break;
		case ISG_1:
			if(cres->meter_eff == 0)
				TaskTable[id].work[MAIN_SEQ] = ISG_0;
			break;
		case ISG_2:
			MsgWinObjSlidOutSet(MSGWINOBJ_INOUT_SP);
			TaskTable[id].work[MAIN_SEQ] = 0;
			TaskTable[id].work[MAIN_WORK0] = 0;
			TaskTable[id].TaskAdrs = NijiSinsaMsgInit;
			break;
	}
}

//----------------------------------------------------------
//	２次審査のメッセージ表示
//----------------------------------------------------------
static void NijiSinsaMsgInit(u8 id)
{
	u16 x;
	
	if(cres->win_status == WO_TAIKI_OUT){
		if(TaskTable[id].work[MAIN_TEMP]++ == NEXT_MSG_WAIT){
			TaskTable[id].work[MAIN_TEMP] = 0;
			MsgWinObjMake(niji_kekka_msg, cres->win_act);
			x = GetMsgWinCenterPos(niji_kekka_msg);
			MsgWinObjSlidInSet(x, MSGWINOBJ_DEFAULT_Y, 0xffff, MSGWINOBJ_INOUT_SP);
		}
	}
	else if(cres->win_status == WO_TAIKI_IN)
		TaskTable[id].TaskAdrs = NijiSinsaGaugeInit;
}

//----------------------------------------------------------
//	２次審査のゲージ計算
//----------------------------------------------------------
enum{
	NSG_0 = 0,
	NSG_1,
	NSG_2,
};
static void NijiSinsaGaugeInit(u8 id)
{
	switch(TaskTable[id].work[MAIN_SEQ]){
		case NSG_0:
			if(cres->gauge_fade == 0){
				StarHeartFadeEndCheck(1, TaskTable[id].work[MAIN_WORK0]++);
				if(cres->meter_eff == 0)
					TaskTable[id].work[MAIN_SEQ] = NSG_2;
				else
					TaskTable[id].work[MAIN_SEQ]++;
			}
			break;
		case NSG_1:
			if(cres->meter_eff == 0)
				TaskTable[id].work[MAIN_SEQ] = NSG_0;
			break;
		case NSG_2:
			MsgWinObjSlidOutSet(MSGWINOBJ_INOUT_SP);
			TaskTable[id].work[MAIN_SEQ] = 0;
			TaskTable[id].TaskAdrs = JyunniNumPut;
			break;
	}
}

//----------------------------------------------------------
//	最終的なランキングを表示
//----------------------------------------------------------
enum{
	JNP_0 = 0,
	JNP_1,
	JNP_2,
	JNP_3,
	JNP_4,
	JNP_5,
	JNP_6,
};
static void JyunniNumPut(u8 id)
{
	u8 task;
	int i;
	u16 x;
	u8 msgbuf[100];
	
	switch(TaskTable[id].work[MAIN_SEQ]){
		case JNP_0:
			if(cres->win_status == WO_TAIKI_OUT){
				//GetContestJyunni();
				TaskTable[id].work[MAIN_SEQ]++;
			}
			break;
		case JNP_1:	//ちょっとｳｪｲﾄ
			if(TaskTable[id].work[MAIN_TEMP]++ == 30){
				TaskTable[id].work[MAIN_TEMP] = 0;
				TaskTable[id].work[MAIN_SEQ]++;
			}
			break;
		case JNP_2:	//順位を表示していく
			for(i = 0; i < 4; i++){
				task = AddTask(JyunniScrnWriteSeq, 10);
				TaskTable[task].work[0] = ContestJyunni[i];
				TaskTable[task].work[1] = i;
			}
			TaskTable[id].work[MAIN_SEQ]++;
			break;
		case JNP_3:	//優勝者のｳｨﾝﾄﾞｳをﾊﾟﾚｯﾄｱﾆﾒ
			if(cres->jyunni_put == BREEDER_MAX){
				if(TaskTable[id].work[MAIN_TEMP]++ == 30){
					TaskTable[id].work[MAIN_TEMP] = 0;
					AddTask(ChampWinPaletteAnime, 10);
					TaskTable[id].work[MAIN_SEQ]++;

					//-- 優勝ポケモンのアイコンをBGアニメ --//
					for(i = 0; i < BREEDER_MAX; i++)
					{
						if(ContestJyunni[i] == 0)
							break;
					}
					PokeIconBGAnmSet(i, 14);
				}
			}
			break;
		case JNP_4:
			if(TaskTable[id].work[MAIN_TEMP]++ == NEXT_MSG_WAIT){
				TaskTable[id].work[MAIN_TEMP] = 0;
				for(i = 0; i < BREEDER_MAX; i++)
					if(ContestJyunni[i] == 0)
						break;
				PM_strcpy(StrTempBuffer0, BreederParam[i].name);
				PM_strcpy(StrTempBuffer1, BreederParam[i].nickname);
				PM_MsgExpand(msgbuf, yuusyou_msg);
				MsgWinObjMake(msgbuf, cres->win_act);
				x = GetMsgWinCenterPos(msgbuf);
				MsgWinObjSlidInSet(x, MSGWINOBJ_DEFAULT_Y, 0xffff, MSGWINOBJ_INOUT_SP);
				TaskTable[id].work[MAIN_SEQ]++;
			}
			break;
		case JNP_5:
			//if(cres->win_status == WO_TAIKI_IN){
				TaskTable[id].work[MAIN_SEQ] = 0;
				TaskTable[id].TaskAdrs = ChampAppearEffect;
			//}
			break;
	}
}

//----------------------------------------------------------
//	優勝ポケモン登場エフェクト
//----------------------------------------------------------
#define WIN_OPEN_SP		2
#define WIN_OPEN_ADDWAIT	0
#define WIN_OPEN_V		32	//48
#define CRES_POKE_OUT_WAIT	120
static void ChampAppearEffect(u8 id)
{
	int i;
	u16 monsno;
	u8 actno;
	u32 personal_rnd, id_no;
	u8 open;
	u8 close;
	PalData *PD;
	
	switch(TaskTable[id].work[MAIN_SEQ]){
		case 0:
			Win0H = (0<<8) | 240;
			Win0V = (80<<8) | 80;

			for(i = 0; i < BREEDER_MAX; i++)
			{
				if(ContestJyunni[i] == 0)
					break;
			}
			monsno = BreederParam[i].monsno;
			personal_rnd = BreederParam[i].personal_rnd;
			id_no = BreederParam[i].id_no;
			
			//-- ポケモンをセット --//
			DecordPokeCellMakeBuchi(&PM2FObjDataCell[monsno], pm2fpara[monsno].size,
				pm2fpara[monsno].patcnt, &UserWork[0],
				(void*)DecordAdrs[1], monsno, personal_rnd);
			
			//DecordPalSet((PalData*)&PM2NObjDataPal[monsno]);
			PD=(PalData*)PokePalDataGetPara(monsno,id_no,personal_rnd);
			DecordPalSet(PD);

			PokeActHeaderMake(monsno, 1);
			PokeActHeader.palNo = PD->reg_num;
//			actno = AddActor(&PokeActHeader, 240+32, 80+pm2bpara[monsno].patcnt, 10);
			actno = AddActor(&PokeActHeader, 240+32, 80, 10);
			ActWork[actno].work[1] = monsno;
			ActWork[actno].oamData.Priority = 0;
			ActWork[actno].move = PokeSlidInAppear;
			cres->poke_act = actno;
			
			//-- 紙ふぶきをセット --//
			DecordCellSet((void*)&KamifubukiDataCell);
			DecordPalSet((void*)&KamifubukiDataPal);
			AddTask(KamifubukiTask, 10);
			
			TaskTable[id].work[MAIN_SEQ]++;
			break;
		case 1:		//Windowを大きく開いていく
			if(TaskTable[id].work[MAIN_WORK1]++ == WIN_OPEN_ADDWAIT){
				TaskTable[id].work[MAIN_WORK1] = 0;
				TaskTable[id].work[MAIN_WORK0] += WIN_OPEN_SP;
				if(TaskTable[id].work[MAIN_WORK0] > WIN_OPEN_V)
					TaskTable[id].work[MAIN_WORK0] = WIN_OPEN_V;
				open = TaskTable[id].work[MAIN_WORK0];
				Win0V = ((80-open)<<8) | (80+open);

				if(open == WIN_OPEN_V)
					TaskTable[id].work[MAIN_SEQ]++;
			}
			break;
		case 2:
			if(cres->poke_appear == 1)
				TaskTable[id].work[MAIN_SEQ]++;
			break;
		case 3:		//少しｳｪｲﾄしてﾎﾟｹﾓﾝをｽﾗｲﾄﾞｱｳﾄさせる
			if(TaskTable[id].work[MAIN_TEMP]++ == CRES_POKE_OUT_WAIT){
				TaskTable[id].work[MAIN_TEMP] = 0;
				ActWork[cres->poke_act].move = PokeSlideOut;
				TaskTable[id].work[MAIN_SEQ]++;
			}
			break;
		case 4:
			if(cres->poke_appear != 2)
				break;
				
			close = Win0V >> 8;
			close += 2;
			if(close > 80)
				close = 80;
			Win0V = (close << 8) | (80+80-close);
			if(close == 80)
				TaskTable[id].work[MAIN_SEQ]++;
			break;
		case 5:
			if(cres->poke_appear == 2){
				//紙ふぶきを止める(通信用のﾒｯｾｰｼﾞと一緒に出ないようにするため)
				cres->kamifubuki_end = 1;
/*
				//-- 優勝ポケモンのアイコンをBGアニメ --//
				for(i = 0; i < BREEDER_MAX; i++)
				{
					if(ContestJyunni[i] == 0)
						break;
				}
				PokeIconBGAnmSet(i, 14);
*/
				TaskTable[id].work[MAIN_SEQ] = 0;
				TaskTable[id].TaskAdrs = EndKeyWait;
			}
			break;
	}
}

//----------------------------------------------------------
//	結果画面終了のキー待ち
//----------------------------------------------------------
static void EndKeyWait(u8 id)
{
	int i;
	
	if(sys.Trg & A_BUTTON){
		//図鑑に見たフラグセット
		if((ContestTuusin & C_TUUSIN_FLG) == 0){
			for(i = 0; i < BREEDER_MAX; i++){
				ZukanCheck(PokeMonsNo2ZukanNoGet(BreederParam[i].monsno),Z_SEE_SET);
			}
		}

		TaskTable[id].TaskAdrs = TuusinCheckEnd;
	}
}

//----------------------------------------------------------
//	通信か調べてフィールド復帰処理へ進む
//----------------------------------------------------------
static void TuusinCheckEnd(u8 id)
{
	if(ContestTuusin & C_TUUSIN_FLG)
	{
		SioWinMsgPut(tuusin_taiki_msg);
		SetSioEndDataStart();
		TaskTable[id].TaskAdrs = ResultTuusinEndWait;
		//ContestTuusin = 0;	//通信ﾌﾗｸﾞOFF
		//PokemonMultiSioEnd();		最初の通信が終了した時点の所に移動
	}
	else
		TaskTable[id].TaskAdrs = ContestEndSeq;
}

//----------------------------------------------------------
//	通信 終了待ち
//----------------------------------------------------------
static void ResultTuusinEndWait(u8 id)
{
	if(pokemon_sio_flag == 0){
		ContestTuusin = 0;	//通信ﾌﾗｸﾞOFF
		SioWinMsgElase();
		TaskTable[id].TaskAdrs = ContestEndSeq;
	}
}

//----------------------------------------------------------
//	コンテスト終了　ﾌｨｰﾙﾄﾞに復帰
//----------------------------------------------------------
static void ContestEndSeq(u8 id)
{
//	u8 cont_type;
	
	//TVConDataSet(ContestJyunni[MyBreederNo]);	//TVﾃﾞｰﾀ登録
	TVConZyuniSet(ContestJyunni[MyBreederNo]);	//TVﾃﾞｰﾀ登録
	FanPointCalc(FAN_CONTEST_TYPE);			//ﾌｧﾝﾃﾞｰﾀ登録
	PortraitDataSet(ContestRank);			//似顔絵ﾃﾞｰﾀ登録
	//↓UserWorkに美術館ﾃﾞｰﾀ形成。ﾃﾝﾎﾟﾗﾘﾃﾞｰﾀなので自分が優勝してなくても形成してる
	PortraitDataSet(0xfe);
	UserWork[TEMP_PORTRAIT_MSGFLG] = 1;	//現状では特にﾃﾞｰﾀがないので0
	UserWork[TEMP_PORTRAIT_PLACE] = PortraitDataSpaceSearch(0xfe, 0);
	
//	PaletteFadeReq(0xffffffff, 0, 0, 16, 0);
	HardFadeReq(0xff, 0, 0, 16, 0);	//ﾁｬﾝﾋﾟｵﾝｳｨﾝﾄﾞｳがﾊﾟﾚｯﾄｱﾆﾒしてるので
	TaskTable[id].TaskAdrs = ContestEndFadeWait;
}

static void ContestEndFadeWait(u8 id)
{
	if(FadeData.fade_sw == 0)
	{
		if(TaskTable[id].work[MAIN_TEMP] == 0){
			DelTask(cres->champ_winpal_task);
			ColorConceChange(0x0000ffff, 16, 0);
			TaskTable[id].work[MAIN_TEMP]++;
		}
		else if(TaskTable[id].work[MAIN_TEMP] == 1){
			ColorConceChange(0xffff0000, 16, 0);
			TaskTable[id].work[MAIN_TEMP]++;
		}
		else{	//ﾊﾟﾚｯﾄがｿﾌﾄで黒くなってからﾊｰﾄﾞのﾌｪｰﾄﾞをｸﾘｱする
			*(vu16 *)REG_BLDCNT = 0;
			*(vu16 *)REG_BLDY = 0;
	//		sys.pMainProc = ClientPokeListReturn;
			DelTask(id);
			MainProcChange(FieldScriptRecover);
	//		ResetForceEvent();
	//		ContinueFieldScript();
		}
	}
}










//=========================================================================
//
//		メインの流れ以外のシーケンス
//												by matsuda 2002.06.25(火)
//=========================================================================
//----------------------------------------------------------
//	背景面スクロール管理タスク
//----------------------------------------------------------
static void HaikeiScrollTask(u8 id)
{
	ScrX3 += 2;
	ScrY3 += 1;
	if(ScrX3 > 255)
		ScrX3 -= 255;
	if(ScrY3 > 255)
		ScrY3 -= 255;
}

//----------------------------------------------------------
//	星とﾊｰﾄの点滅管理タスク
//----------------------------------------------------------
enum{
	SH_WAIT = 0,
	SH_EVY,
	SH_MUKI,
};
#define SH_FADE_WAIT	1
#define HEART_FADE_PALNO		(PA_BG6+PA_COL8)	//ﾌｪｰﾄﾞさせるﾊｰﾄのﾊﾟﾚｯﾄNo
#define HEARTBL_FADE_PALNO		(PA_BG6+PA_COL14)	//ﾌｪｰﾄﾞさせるﾊｰﾄのﾊﾟﾚｯﾄNo
#define STAR_FADE_PALNO			(PA_BG6+PA_COL11)	//ﾌｪｰﾄﾞさせる星のﾊﾟﾚｯﾄNo
static void StarHeartFadeTask(u8 id)
{
	if(TaskTable[id].work[SH_WAIT]++ == SH_FADE_WAIT){
		TaskTable[id].work[SH_WAIT] = 0;
		if(TaskTable[id].work[SH_MUKI] == 0)
			TaskTable[id].work[SH_EVY]++;
		else
			TaskTable[id].work[SH_EVY]--;
		if(TaskTable[id].work[SH_EVY] == 16)
			TaskTable[id].work[SH_MUKI] = 1;
		else if(TaskTable[id].work[SH_EVY] == 0)
			TaskTable[id].work[SH_MUKI] = 0;
		SoftFade(STAR_FADE_PALNO, 1, TaskTable[id].work[SH_EVY], 0x2ede);//0x02dc);
		SoftFade(HEART_FADE_PALNO, 1, TaskTable[id].work[SH_EVY], 0x7fff);//0x5bff);
		SoftFade(HEARTBL_FADE_PALNO, 1, TaskTable[id].work[SH_EVY], 0x77be);
	}
	
	if(TaskTable[id].work[SH_EVY] == 0)
		cres->gauge_fade = 0;
	else
		cres->gauge_fade = 1;
}



//=========================================================================
//
//		ツール類
//												by matsuda 2002.06.24(月)
//=========================================================================

//=========================================================================
//	ポケモンアイコンをBGVRAMに転送し、ｽｸﾘｰﾝﾃﾞｰﾀをセット
//
// posno = 何番目に配置するか	anmno = 0:1ﾊﾟﾀｰﾝ目のｱﾆﾒ、1:2ﾊﾟﾀｰﾝ目のｱﾆﾒ
// scrn_sw = 0:ｽｸﾘｰﾝﾃﾞｰﾀの書き換えをしない	1:ｽｸﾘｰﾝﾃﾞｰﾀの書き換えをする
// rnd = 個性乱数
//----------------------------------------------------------
static void PokeIconBgSet(u16 monsno, u8 posno, u8 anmno, u8 scrn_sw, u32 rnd)
{
	u16 scrn;
	int x, y;
	u16 scrn_offs;
	
	if(scrn_sw){
//		DIV_DMACOPY(3, 
//			IconCharAdrs[monsno]+anmno*OBJ_SIZE16_32x32+ 0x20*4, //0x20*4=上一行目の空白
//			CRES_FONT_VRAM+OBJ_SIZE16_32x32*posno, OBJ_SIZE16_32x32-0x20*4, 32);
		DIV_DMACOPY(3, 
			GetPokeIconCharAdrs(monsno,rnd)+anmno*OBJ_SIZE16_32x32+ 0x20*4,
			CRES_FONT_VRAM+OBJ_SIZE16_32x32*posno, OBJ_SIZE16_32x32-0x20*4, 32);

		scrn = (CRES_POKEICON_BGPALNO + posno) << 12;	//color
		scrn = (OBJ16_32x32 * posno + CRES_POKEICON_TOPCHRNO) | scrn;
		scrn_offs = 0x20*4+3 + posno*0x20*3;
		for(y = 0; y < (4-1); y++){	//-1 = 上1行は空白なので元から転送してない
			for(x = 0; x < 4; x++){
				*(vu16*)(CRES_FONT_SCRN + (0x20*y + x + scrn_offs)*2) = scrn;
				scrn++;
			}
		}
	}
	else{	//ｽｸﾘｰﾝﾃﾞｰﾀの書き換えを行なわない時はｱﾆﾒなのでﾘｸｴｽﾄで転送する
//		DmaTransReq((void*)IconCharAdrs[monsno]+anmno*OBJ_SIZE16_32x32+ 0x20*4,
//			CRES_FONT_VRAM+OBJ_SIZE16_32x32*posno, OBJ_SIZE16_32x32-0x20*4);
		DmaTransReq((void*)GetPokeIconCharAdrs(monsno,rnd) + anmno*OBJ_SIZE16_32x32+ 0x20*4,
			CRES_FONT_VRAM+OBJ_SIZE16_32x32*posno, OBJ_SIZE16_32x32-0x20*4);
	}
}

static void PokeIconBgAllSet(u8 anmno, u8 scrn_sw)
{
	int i;
	for(i = 0; i < BREEDER_MAX; i++)
		PokeIconBgSet(BreederParam[i].monsno, i, anmno, scrn_sw, BreederParam[i].personal_rnd);
}

static void PokeIconBgPaletteSet(void)
{
	int i;
	for(i = 0; i < BREEDER_MAX; i++){
//		PaletteWorkSet(&p_icon_Palette[IconPalAtr[BreederParam[i].monsno] * 16],
//			(CRES_POKEICON_BGPALNO+i)*16, 0x20);
		PaletteWorkSet(
			&p_icon_Palette[IconPalAtr[GetPokeIconCharID(BreederParam[i].monsno, 0x00)] * 16],
			(CRES_POKEICON_BGPALNO+i)*16, 0x20);
	}
}

//=========================================================================
//	メッセージウィンドウ
//=========================================================================
//----------------------------------------------------------
//	メッセージウィンドウ＆メッセージOBJ作成
//----------------------------------------------------------
static const u8 mwo_init_msg[] = {
	CTRL_,C_FCHG_,FONT8x16sTYPE,CTRL_,C_ACOL_,0xf,0x1,0xe,EOM_};

static void MsgWinObjMake(const u8 *msg, u8 actno)
{
	actWork *xreg;
	u16 cellNo[4];
//	u8 msgbuf[100];
	u8 msglen;
	u8 *buff;
	u8 *adrs;
	int i;
	
	xreg = &ActWork[actno];
	cellNo[0] = xreg->oamData.CharNo;
	cellNo[1] = ActWork[xreg->work[0]].oamData.CharNo;
	cellNo[2] = ActWork[xreg->work[1]].oamData.CharNo;
	cellNo[3] = ActWork[xreg->work[2]].oamData.CharNo;
	
	//-- 全ｸﾘｱ --//
	for(i = 0; i < 4; i++)
		DIV_DMACLEAR(3, 0, OBJ_MODE0_VRAM + cellNo[i]*32, OBJ_SIZE16_32x64, 32);
	
	//-- メッセージデータ展開 --//
	buff = PM_strcpy(FightMsgBuf, mwo_init_msg);
	PM_strcpy(buff, msg);
	MsgCGXDataSet((void*)CRES_MSG_DECORD_ADR, FightMsgBuf);
	
	msglen = PM_strlen(msg);
	adrs = (void*)(OBJ_MODE0_VRAM + cellNo[0]*32);
	CpuCopy(&kekka_w_Character[0x20*0], adrs, 0x20, 32);	//枠:上
	CpuCopy(&kekka_w_Character[0x20*4], &adrs[32*8*1], 0x20, 32);
	CpuCopy(&kekka_w_Character[0x20*4], &adrs[32*8*2], 0x20, 32);
	CpuCopy(&kekka_w_Character[0x20*2], &adrs[32*8*3], 0x20, 32);
	for(i = 0; i <= msglen; i++){
		if(i < 7)
			adrs = (void*)(OBJ_MODE0_VRAM + cellNo[0]*32 + 0x20*(i+1));
		else if(i < 7+8)
			adrs = (void*)(OBJ_MODE0_VRAM + cellNo[1]*32 + 0x20*(i-7));
		else if(i < 7+8+8)
			adrs = (void*)(OBJ_MODE0_VRAM + cellNo[2]*32 + 0x20*(i-(7+8)));
		else
			adrs = (void*)(OBJ_MODE0_VRAM + cellNo[3]*32 + 0x20*(i-(7+8+8)));
		
		if(i == msglen)
			break;
		
		CpuCopy(&kekka_w_Character[0x20*6], adrs, 0x20, 32);	//枠:上
		CpuCopy(&kekka_w_Character[0x20*7], &adrs[32*8*3], 0x20, 32);	//枠:下
		CpuCopy(CRES_MSG_DECORD_ADR + 0x40*i, &adrs[32*8*1], 0x20, 32);	//ﾒｯｾｰｼﾞ上段
		CpuCopy(CRES_MSG_DECORD_ADR + 0x40*i+0x20, &adrs[32*8*2], 0x20, 32);//ﾒｯｾｰｼﾞ下段
	}
	CpuCopy(&kekka_w_Character[0x20*1], adrs, 0x20, 32);	//枠:上
	CpuCopy(&kekka_w_Character[0x20*5], &adrs[32*8*1], 0x20, 32);	//枠:下
	CpuCopy(&kekka_w_Character[0x20*5], &adrs[32*8*2], 0x20, 32);	//枠:下
	CpuCopy(&kekka_w_Character[0x20*3], &adrs[32*8*3], 0x20, 32);	//枠:下
}

//----------------------------------------------------------
//	メッセージウィンドウのCell,Pal,Actorのセット
//----------------------------------------------------------
static void MsgWinObjSet(void)
{
	int i;
	actHeader msgHeader;
	u8 actno[8];
	
	memcpy(&msgHeader, &MsgWinObjHeader, sizeof(msgHeader));
	for(i = 0; i < 8; i++)	//画面の端から端まで埋まる分 領域確保
		CellSet(&MsgWinDataCell[i]);
	ObjPalSet(&MsgWinDataPal);
	
	for(i = 0; i < 8; i++){
		actno[i] = AddActor(&msgHeader, MSGWINOBJ_DEFAULT_X, MSGWINOBJ_DEFAULT_Y, 10);
		msgHeader.cellNo++;
	}
	
	//子のActNoを親に持たせる
	ActWork[actno[0]].work[0] = actno[1];
	ActWork[actno[0]].work[1] = actno[2];
	ActWork[actno[0]].work[2] = actno[3];
	
	//通信ﾒｯｾｰｼﾞ用のｳｨﾝﾄﾞｳ
	ActWork[actno[4]].work[0] = actno[5];
	ActWork[actno[4]].work[1] = actno[6];
	ActWork[actno[4]].work[2] = actno[7];
	
	cres->win_act = actno[0];
	cres->win_status = WO_TAIKI_OUT;
	
	cres->siowin_act = actno[4];
	SioWinMsgElase();
}

//----------------------------------------------------------
//	メッセージの長さからｽﾗｲﾄﾞ後、中心に位置するためのX座標を取得する
//----------------------------------------------------------
static u16 GetMsgWinCenterPos(const u8 *msg)
{
	u8 len;
	u16 x;
	
	len = PM_strlen(msg);
	x = 120 - 4*len;
	x -= 8;		//枠の分
	return x;
}

/*-----------
//----------------------------------------------------------
//	子の動作関数	親の座標を追尾する
//----------------------------------------------------------
static void MsgWinObjTailing(actWork *xreg)
{
	xreg->x = ActWork[xreg->work[0]].x + ActWork[xreg->work[0]].dx + 64;
	xreg->y = ActWork[xreg->work[0]].y + ActWork[xreg->work[0]].dy;
}
------------*/

enum{
	MWO_X = 4,
	MWO_WAIT,
	MWO_SP,
	MWO_SPWORK,
};
//----------------------------------------------------------
//	Msgウィンドウを指定座標までｽﾗｲﾄﾞｲﾝさせる
//	wait = 指定座標まで行ったら一定時間待って自動でｽﾗｲﾄﾞｱｳﾄする
//		   (0xffffだと自動ｽﾗｲﾄﾞｱｳﾄはしないで ずっと指定座標で待機)
//	sp = 移動速度(下位8ﾋﾞｯﾄ少数)
//----------------------------------------------------------
static void MsgWinObjSlidInSet(s16 x, s16 y, u16 wait, u16 sp)
{
	actWork *xreg;
	
	xreg = &ActWork[cres->win_act];
	xreg->x = MSGWINOBJ_DEFAULT_X;
	xreg->y = y;
	xreg->dx = 0;
	xreg->dy = 0;
	xreg->work[MWO_X] = x + 32;
	xreg->work[MWO_WAIT] = wait;
	xreg->work[MWO_SP] = sp;
	xreg->work[MWO_SPWORK] = 0;
	xreg->move = MsgWinObjSlidInSeq;

	cres->win_status = WO_SLIDEIN;
}

//----------------------------------------------------------
//	Msgウィンドウを画面外までｽﾗｲﾄﾞｱｳﾄさせる
//	sp = 移動速度(下位8ﾋﾞｯﾄ少数)
//----------------------------------------------------------
static void MsgWinObjSlidOutSet(u16 sp)
{
	actWork *xreg;
	
	xreg = &ActWork[cres->win_act];
	xreg->x += xreg->dx;
	xreg->y += xreg->dy;
	xreg->dx = xreg->dy = 0;

	xreg->work[MWO_SP] = sp;
	xreg->work[MWO_SPWORK] = 0;
	xreg->move = MsgWinObjSlideOutSeq;

	cres->win_status = WO_SLIDEOUT;
}

//----------------------------------------------------------
//	Msgｳｨﾝﾄﾞｳの動作ｼｰｹﾝｽをﾀﾞﾐｰにして、表示座標も初期位置に戻す
//----------------------------------------------------------
static void MsgWinObjDefaultSet(actWork *xreg)
{
	xreg->x = MSGWINOBJ_DEFAULT_X;
	xreg->y = MSGWINOBJ_DEFAULT_Y;
	xreg->dx = xreg->dy = 0;
	xreg->move = DummyActMove;

	cres->win_status = WO_TAIKI_OUT;
}

//----------------------------------------------------------
//	ﾒｯｾｰｼﾞｳｨﾝﾄﾞｳ動作ｼｰｹﾝｽ
//----------------------------------------------------------
//-- スライドイン --//
static void MsgWinObjSlidInSeq(actWork *xreg)
{
	int i;
	
	xreg->work[MWO_SPWORK] += xreg->work[MWO_SP];
	xreg->x -= xreg->work[MWO_SPWORK] >> 8;
	xreg->work[MWO_SPWORK] &= 0x00ff;	//小数残してｸﾘｱ
	if(xreg->x < xreg->work[MWO_X])
		xreg->x = xreg->work[MWO_X];
	for(i = 0; i < 3; i++)
		ActWork[xreg->work[i]].x = xreg->x + xreg->dx + 64*(i+1);
	
	if(xreg->x == xreg->work[MWO_X])
		xreg->move = MsgWinObjWaitSeq;
}

//-- ウェイト --//
static void MsgWinObjWaitSeq(actWork *xreg)
{
	cres->win_status = WO_TAIKI_IN;

	if((u16)xreg->work[MWO_WAIT] == 0xffff)
		return;
	
	if(xreg->work[MWO_WAIT]-- == 0)
		MsgWinObjSlidOutSet(xreg->work[MWO_SP]);
}

//-- スライドアウト --//
static void MsgWinObjSlideOutSeq(actWork *xreg)
{
	int i;
	
	xreg->work[MWO_SPWORK] += xreg->work[MWO_SP];
	xreg->x -= xreg->work[MWO_SPWORK] >> 8;
	xreg->work[MWO_SPWORK] &= 0x00ff;
	for(i = 0; i < 3; i++)
		ActWork[xreg->work[i]].x = xreg->x + xreg->dx + 64*(i+1);
	
	if(xreg->x + xreg->dx < -32+(-64*3))
		MsgWinObjDefaultSet(xreg);
}

//----------------------------------------------------------
//	通信ﾒｯｾｰｼﾞｳｨﾝﾄﾞｳ表示
//----------------------------------------------------------
static void SioWinMsgPut(const u8 *msg)
{
	int i;
	actWork *xreg;
	u16 x;
	
	MsgWinObjMake(msg, cres->siowin_act);
	x = GetMsgWinCenterPos(msg);
	
	xreg = &ActWork[cres->siowin_act];
	xreg->x = x + 32;
	xreg->y = MSGWINOBJ_SIOWAIT_Y;
	xreg->banish = 0;
	for(i = 0; i < 3; i++){
		ActWork[xreg->work[i]].x = xreg->x + xreg->dx + 64*(i+1);
		ActWork[xreg->work[i]].y = xreg->y;
		ActWork[xreg->work[i]].banish = 0;
	}
	
	Win0H = (0 << 8) | 240;
	Win0V = ((xreg->y - 16) << 8) | (xreg->y + 16);
	*(vu16*)REG_WININ = (WIN_ALL_ON << 8) | (WIN_ALL_ON^WIN_BG0_ON);
}

//-- 消去 --//
static void SioWinMsgElase(void)
{
	int i;
	actWork *xreg;
	
	xreg = &ActWork[cres->siowin_act];
	xreg->banish = 1;
	for(i = 0; i < 3; i++)
		ActWork[xreg->work[i]].banish = 1;
	Win0H = 0;
	Win0V = 0;
	*(vu16 *)REG_WIN0H = Win0H;
	*(vu16 *)REG_WIN0V = Win0V;
	*(vu16*)REG_WININ = (WIN_ALL_ON << 8) | WIN_ALL_ON;
}

//=========================================================================
//	画面上部の表題のスクリーンを書く
//=========================================================================
#define RANK_LEN	8
#define TYPE_LEN	5
#define CON_LEN		5
enum{
	STYLE_COLOR = 0,
	BEAUTIFUL_COLOR,
	CUTE_COLOR,
	CLEVER_COLOR,
	STRONG_COLOR,
};
static void HyoudaiWriteScrn(void)
{
	u16 x,y;
	s16 x_offs = 0;
	u16 color;
	int i;
	
	//-- ランク --//
	x = 5*2;
	y = 0x20*1*2;
	if(ContestTuusin & C_TUUSIN_FLG){
		x_offs++;
		CpuCopy(CresSio_Map, CRES_WIN_SCRN+x+y, RANK_LEN*2, 16);	//上段 ↓下段
		CpuCopy(&CresSio_Map[RANK_LEN], CRES_WIN_SCRN+x+y+0x40, RANK_LEN*2, 16);
	}
	else if(ContestRank == NORMAL_RANK){
		CpuCopy(CresNormal_Map, CRES_WIN_SCRN+x+y, RANK_LEN*2, 16);
		CpuCopy(&CresNormal_Map[RANK_LEN], CRES_WIN_SCRN+x+y+0x40, RANK_LEN*2, 16);
	}
	else if(ContestRank == SUPER_RANK){
		CpuCopy(CresSuper_Map, CRES_WIN_SCRN+x+y, RANK_LEN*2, 16);
		CpuCopy(&CresSuper_Map[RANK_LEN], CRES_WIN_SCRN+x+y+0x40, RANK_LEN*2, 16);
	}
	else if(ContestRank == HYPER_RANK){
		CpuCopy(CresHyper_Map, CRES_WIN_SCRN+x+y, RANK_LEN*2, 16);
		CpuCopy(&CresHyper_Map[RANK_LEN], CRES_WIN_SCRN+x+y+0x40, RANK_LEN*2, 16);
	}
	else{// if(ContestRank == MASTER_RANK){
		CpuCopy(CresMaster_Map, CRES_WIN_SCRN+x+y, RANK_LEN*2, 16);
		CpuCopy(&CresMaster_Map[RANK_LEN], CRES_WIN_SCRN+x+y+0x40, RANK_LEN*2, 16);
	}
	
	//-- コンテストタイプ(かっこよさ等) --//
	x = 104/8*2;
	x += x_offs*2;
	x_offs = 0;
	if(ContestKind == STYLE_CONTEST){
		color = STYLE_COLOR;
		CpuCopy(CresStyle_Map, CRES_WIN_SCRN+x+y, TYPE_LEN*2, 16);
		CpuCopy(&CresStyle_Map[TYPE_LEN], CRES_WIN_SCRN+x+y+0x40, TYPE_LEN*2, 16);
	}
	else if(ContestKind == BEAUTIFUL_CONTEST){
		color = BEAUTIFUL_COLOR;
		CpuCopy(CresBeautiful_Map, CRES_WIN_SCRN+x+y, TYPE_LEN*2, 16);
		CpuCopy(&CresBeautiful_Map[TYPE_LEN], CRES_WIN_SCRN+x+y+0x40, TYPE_LEN*2, 16);
	}
	else if(ContestKind == CUTE_CONTEST){
		color = CUTE_COLOR;
		x_offs--;
		CpuCopy(CresCute_Map, CRES_WIN_SCRN+x+y, TYPE_LEN*2, 16);
		CpuCopy(&CresCute_Map[TYPE_LEN], CRES_WIN_SCRN+x+y+0x40, TYPE_LEN*2, 16);
	}
	else if(ContestKind == CLEVER_CONTEST){
		color = CLEVER_COLOR;
		x_offs--;
		CpuCopy(CresClever_Map, CRES_WIN_SCRN+x+y, TYPE_LEN*2, 16);
		CpuCopy(&CresClever_Map[TYPE_LEN], CRES_WIN_SCRN+x+y+0x40, TYPE_LEN*2, 16);
	}
	else{// if(ContestKind == STRONG_CONTEST){
		color = STRONG_COLOR;
		CpuCopy(CresStrong_Map, CRES_WIN_SCRN+x+y, TYPE_LEN*2, 16);
		CpuCopy(&CresStrong_Map[TYPE_LEN], CRES_WIN_SCRN+x+y+0x40, TYPE_LEN*2, 16);
	}
	
	//-- コンテスト --//
	x = 152/8*2;
	x += x_offs*2;
	x_offs = 0;
	CpuCopy(CresContest_Map, CRES_WIN_SCRN+x+y, CON_LEN*2, 16);
	CpuCopy(&CresContest_Map[CON_LEN], CRES_WIN_SCRN+x+y+0x40, CON_LEN*2, 16);
	
	//-- カラーアトリビュート変更 --//
	for(i = 0; i < 0x20*4; i++){
		*(vu16*)(CRES_WIN_SCRN + i*2) &= 0x0fff;
		*(vu16*)(CRES_WIN_SCRN + i*2) |= color << 12;
	}
}


//=========================================================================
//	ゲージ計算
//=========================================================================
#define ONE_BP	63	//76	//星1つに対するBP値
#define ONE_AP	80//40	//ﾊｰﾄ1つに対するAP値
#define CRES_GAUGE_MAX	88	//ｹﾞｰｼﾞの最大ドット数
#define ONE_PERSENT_DOTTO	90	// 90=0.9*100	1%で移動するドット数

//----------------------------------------------------------
//	星(一次審査)の数を取得
//	over_check = 1:最大星数を超えてたら最大数で返す
//				 0:最大数を超えててもそのままの数値で返す
//----------------------------------------------------------
static u8 GetStarNum(u8 brd, u8 over_check)
{
	u32 bp, num;
	
	bp = ContBP[brd] << 16;
	num = bp / ONE_BP;
	if((num & 0x0000ffff) > 0)	//小数切り上げ
		num += 0x00010000;
//	if((num & 0x0000ffff) > 0x00008000)
//		num += 0x00010000;		//小数 四捨五入
	num >>= 16;
	if(num == 0 && bp != 0)
		num = 1;
	if(over_check && num > 10)
		num = 10;
	return num;
}

//----------------------------------------------------------
//	ﾊｰﾄ(二次審査)の数を取得
// 黒いﾊｰﾄで表示する場合はマイナスで返す
//	over_check = 1:最大星数を超えてたら最大数で返す
//				 0:最大数を超えててもそのままの数値で返す
//----------------------------------------------------------
static s8 GetHeartNum(u8 brd, u8 over_check)
{
	u32 eval, num;
	s8 ret;
	
//	eval = abs(ContEvaluation[brd]) << 16;
	eval = abs(NijiPoint[brd]) << 16;
	num = eval / ONE_AP;
	if((num & 0x0000ffff) > 0)	//小数切り上げ
		num += 0x00010000;
//	if((num & 0x0000ffff) > 0x00008000)
//		num += 0x00010000;		//小数 四捨五入
	num >>= 16;
	if(num == 0 && eval != 0)
		num = 1;
	if(over_check && num > 10)
		num = 10;
	//if(ContEvaluation[brd] < 0)
	if(NijiPoint[brd] < 0)
		ret = -num;
	else
		ret = num;
	return ret;
}


//=========================================================================
//	各ﾌﾞﾘｰﾀﾞｰの順位をｽｸﾘｰﾝﾃﾞｰﾀに書く
//=========================================================================
#define JYUNNI_PUTWAIT		40
#define JYUNNI_FAST_SCRN	0x5043
static void JyunniScrnWriteSeq(u8 id)
{
	u16 scrn;
	
	if(TaskTable[id].work[10] == 0){
		TaskTable[id].work[11] = (BREEDER_MAX-1-TaskTable[id].work[0]) * JYUNNI_PUTWAIT;
		TaskTable[id].work[10]++;
	}
	else if(TaskTable[id].work[10] == 1){
		if(TaskTable[id].work[11]-- == 0){
			scrn = JYUNNI_FAST_SCRN + TaskTable[id].work[0] * 2;
			*(vu16*)(CRES_WIN_SCRN + (TaskTable[id].work[1]*0x60 + 0x20*5+1)*2) = scrn;
			*(vu16*)(CRES_WIN_SCRN + (TaskTable[id].work[1]*0x60 + 0x20*5+1 + 1)*2) = scrn+1;
			*(vu16*)(CRES_WIN_SCRN + (TaskTable[id].work[1]*0x60 + 0x20*5+1 +0x20)*2) = scrn+0x10;
			*(vu16*)(CRES_WIN_SCRN + (TaskTable[id].work[1]*0x60 + 0x20*5+1 + 0x21)*2) = scrn+0x11;
			
			cres->jyunni_put++;
			DelTask(id);
			SePlay(SE_JYUNI);
		}
	}
}

//=========================================================================
//	優勝したブリーダーのウィンドウをﾊﾟﾚｯﾄｱﾆﾒさせる
//=========================================================================
static const u16 WinPalAnmData[] = {
	0x0000,0x7f74,0x6f8d,0x5fa6,0x4fe0,0x4fe0,0x33ea,0x1bf4,
	0x03ff,0x0abf,0x117f,0x1c3f,0x34fc,0x4dd9,0x6696,0x7f74,
};
#define CHAMP_PALANM_WAIT	0	//4
static void ChampWinPaletteAnime(u8 id)
{
	int champ;
	u16 scrn;
	int x, y;
	
	for(champ = 0; champ < BREEDER_MAX; champ++){
		if(ContestJyunni[champ] == 0)
			break;
	}
	
	for(y = 0; y < 3; y++){
		for(x = 0; x < 240/8; x++){
			scrn = *(vu16*)(CRES_WIN_SCRN + (champ*0x60 + 0x20*4 + x + 0x20*y)*2);
			scrn &= 0x0fff;
			scrn |= 0x9000;	//ﾁｬﾝﾌﾟのｳｨﾝﾄﾞｳをﾊﾟﾚｯﾄｱﾆﾒ用のﾊﾟﾚｯﾄに変更する
			*(vu16*)(CRES_WIN_SCRN + (champ*0x60 + 0x20*4 + x+ 0x20*y)*2) = scrn;
		}
	}
	TaskTable[id].work[10] = champ;
	TaskTable[id].work[12] = 1;
	TaskTable[id].TaskAdrs = ChampWinPaletteAnimeMain;
	cres->champ_winpal_task = id;
}

static void ChampWinPaletteAnimeMain(u8 id)
{
	if(TaskTable[id].work[11]++ == CHAMP_PALANM_WAIT){
		TaskTable[id].work[11] = 0;
		SoftFade(16*9+1, 1, TaskTable[id].work[12], 0x6f8d);
		if(TaskTable[id].work[13] == 0){
			if(++TaskTable[id].work[12] == 16)
				TaskTable[id].work[13] = 1;
		}
		else{
			if(--TaskTable[id].work[12] == 0)
				TaskTable[id].work[13] = 0;
		}
	}
}





//=========================================================================
//
//		ポケモンの動作関数
//												by matsuda 2002.06.26(水)
//=========================================================================
#define POKE_SLIDE_SP	0x0600
//-- ｽﾗｲﾄﾞｲﾝ --//
static void PokeSlidInAppear(actWork *xreg)
{
	if(xreg->work[0] < 10){
		xreg->work[0]++;
		if(xreg->work[0] == 10){
			VoicePlay(xreg->work[1],0);
			xreg->work[1] = 0;
		}
		return;
	}
	
	xreg->work[1] += POKE_SLIDE_SP;
	xreg->x -= xreg->work[1] >> 8;
	xreg->work[1] &= 0x00ff;
	if(xreg->x < 120)
		xreg->x = 120;
	if(xreg->x == 120){
		xreg->move = DummyActMove;
		xreg->work[1] = 0;
		cres->poke_appear = 1;
	}
}

//-- ｽﾗｲﾄﾞｱｳﾄ --//
static void PokeSlideOut(actWork *xreg)
{
	xreg->work[1] += POKE_SLIDE_SP;
	xreg->x -= xreg->work[1] >> 8;
	xreg->work[1] &= 0x00ff;
	if(xreg->x < -32){
		xreg->move = DummyActMove;
		xreg->banish = 1;
		cres->poke_appear = 2;
	}
}


//=========================================================================
//	紙ふぶき
//=========================================================================
//----------------------------------------------------------
//	紙ふぶきアクター管理タスク
//----------------------------------------------------------
#define KAMIFUBUKI_ADD_WAIT		4	//新たに紙ふぶきをAddしていく間隔
#define KAMIFUBUKI_ADD_X		0x0030
#define KAMIFUBUKI_ADD_Y		1
static void KamifubukiTask(u8 id)
{
	u8 actno;
	
	if(TaskTable[id].work[0]++ == KAMIFUBUKI_ADD_WAIT){
		TaskTable[id].work[0] = 0;
		if(cres->kamifubuki_num < 40)	//ｱｸﾀｰがｵｰﾊﾞｰしないようにAddしてる数をﾁｪｯｸ
		{
			actno = AddActor(&CresKamifubukiHeader, 
				(pp_rand() % 240)-20, 80-WIN_OPEN_V-4, 5);
			ActWork[actno].work[0] = pp_rand() % 0x0200;
			ActWork[actno].work[1] = (pp_rand() % 24) + 16;
			ActWork[actno].work[2] = (pp_rand() % 0x0100) + KAMIFUBUKI_ADD_X;
			ActWork[actno].oamData.CharNo += pp_rand() % 17;
			cres->kamifubuki_num++;
		}
	}
	
	if(cres->kamifubuki_end)
		DelTask(id);
}

//----------------------------------------------------------
//	紙ふぶきｱｸﾀｰの動作関数
//----------------------------------------------------------
static void CresKamifubukiSeq(actWork *xreg)
{
	xreg->work[3] += xreg->work[0];
	xreg->dx = SinMove(xreg->work[3] >> 8, xreg->work[1]);
	
	xreg->work[4] += xreg->work[2];
	xreg->x += xreg->work[4] >> 8;
	xreg->work[4] &= 0x00ff;
	xreg->y += KAMIFUBUKI_ADD_Y;
	
	if(cres->kamifubuki_end)
		xreg->banish = 1;
		
	if(xreg->x > 248 || xreg->y > 80+WIN_OPEN_V+4){
		DelActor(xreg);
		cres->kamifubuki_num--;
	}
}


//=========================================================================
//	ポケモンアイコンをアニメさせる
// anm_wait = アニメさせる時のｳｪｲﾄ(数値が大きいほどゆっくりアニメする)
//=========================================================================
static void PokeIconBGAnmSet(u8 brd, u8 anm_wait)
{
	u8 id;
	
	id = AddTask(PokeIconBGAnmSeq, 8);
	TaskTable[id].work[0] = brd;
	TaskTable[id].work[1] = anm_wait;
	TaskTable[id].work[2] = BreederParam[brd].monsno;
}

//----------------------------------------------------------
//	ポケモンアイコンBGアニメ制御タスク
//----------------------------------------------------------
static void PokeIconBGAnmSeq(u8 id)
{
	u8 brd;
	
	brd = TaskTable[id].work[0];
	if(TaskTable[id].work[10]++ == TaskTable[id].work[1]){
		TaskTable[id].work[10] = 0;

		PokeIconBgSet(TaskTable[id].work[2], brd, 
			TaskTable[id].work[11], 0, BreederParam[brd].personal_rnd);
		TaskTable[id].work[11] ^= 1;
	}
}





//=========================================================================
//	メーター計算
//=========================================================================
static void ResultMeterCalc(void)
{
	s16 top_eval;
	u8 top_brd;
	s32 itiji, niji;
	u32 itiji_dotto, niji_dotto;
	int brd;
	s16 dotto1, dotto2;
	
	//-- 基本最大値取得 --//
	top_eval = ContEvaluation[0];
	top_brd = 0;
	for(brd = 1; brd < BREEDER_MAX; brd++){
		if(top_eval < ContEvaluation[brd]){
			top_eval = ContEvaluation[brd];
			top_brd = brd;
		}
	}

	//-- 最大評価値がﾏｲﾅｽの時は一番評価値が低いのを最大として再取得する --//
	if(top_eval < 0){
		top_eval = ContEvaluation[0];
		top_brd = 0;
		for(brd = 1; brd < BREEDER_MAX; brd++){
			if(top_eval > ContEvaluation[brd]){
				top_eval = ContEvaluation[brd];
				top_brd = brd;
			}
		}
	}

	for(brd = 0; brd < BREEDER_MAX; brd++){
		//-- 一次審査のパーセンテージを取得 --//
		itiji = (ContBP[brd] * 1000) / abs(top_eval);
		if((itiji % 10) >= 5)	//四捨五入
			itiji += 10;
		cgraph[brd].itiji = itiji / 10;
		
		//-- 二次審査のパーセンテージを取得 --//
		niji = (abs(NijiPoint[brd]) * 1000) / abs(top_eval);
		if((niji % 10) >= 5)	//四捨五入
			niji += 10;
		cgraph[brd].niji = niji / 10;
		if(NijiPoint[brd] < 0)
			cgraph[brd].niji_mainasu = 1;	//ﾏｲﾅｽﾌﾗｸﾞ

#if 0	//ｵｰﾊﾞｰﾌﾛｰを起こしたので　2002.10.11(金)
		//-- 一次審査ポイントが所有するドット数を取得 --//
		itiji_dotto = (CRES_GAUGE_MAX << 16) * cgraph[brd].itiji / 100;
		if((itiji_dotto & 0x0000ffff) >= 0x00008000)	//四捨五入
			itiji_dotto += 0x00010000;
		cgraph[brd].itiji_dotto = itiji_dotto >> 16;
		
		//-- 二次審査ポイントが所有するドット数を取得 --//
		niji_dotto = (CRES_GAUGE_MAX << 16) * cgraph[brd].niji / 100;
		if((niji_dotto & 0x0000ffff) >= 0x00008000)		//四捨五入
			niji_dotto += 0x00010000;
		cgraph[brd].niji_dotto = niji_dotto >> 16;
#else
		//-- 一次審査ポイントが所有するドット数を取得 --//
		itiji_dotto = (CRES_GAUGE_MAX << 8) * cgraph[brd].itiji / 100;
		if((itiji_dotto & 0x00ff) >= 0x0080)	//四捨五入
			itiji_dotto += 0x0100;
		cgraph[brd].itiji_dotto = itiji_dotto >> 8;
		
		//-- 二次審査ポイントが所有するドット数を取得 --//
		niji_dotto = (CRES_GAUGE_MAX << 8) * cgraph[brd].niji / 100;
		if((niji_dotto & 0x00ff) >= 0x0080)		//四捨五入
			niji_dotto += 0x0100;
		cgraph[brd].niji_dotto = niji_dotto >> 8;
#endif

		//-- ハート、星の数を取得 --//
		cgraph[brd].itiji_starnum = GetStarNum(brd, 1);
		cgraph[brd].niji_heartnum = abs(GetHeartNum(brd, 1));
		
		//-- ﾄﾞｯﾄﾁｪｯｸ 優勝以外のﾎﾟｹﾓﾝは最終的なﾒｰﾀｰはMaxにならないようにする --//
		if(ContestJyunni[brd] != 0){
			dotto1 = cgraph[brd].itiji_dotto;
			dotto2 = cgraph[brd].niji_dotto;
			if(cgraph[brd].niji_mainasu)
				dotto2 = -dotto2;
			if(dotto1 + dotto2 == CRES_GAUGE_MAX){
				if(dotto2 > 0)		//二次審査が＋ﾎﾟｲﾝﾄなら二次審査のﾄﾞｯﾄ優先で下げる
					cgraph[brd].niji_dotto--;
				else if(dotto1 > 0)	//万が一にでも0だった場合の為にﾏｲﾅｽﾁｪｯｸしておく
					cgraph[brd].itiji_dotto--;
			}
		}
	}
}


//=========================================================================
//	現在ｶｳﾝﾀを参照して、ﾌｪｰﾄﾞしている星、ﾊｰﾄをﾌｪｰﾄﾞしないものに置き換えて
//	ﾒｰﾀｰを上げる
// hosi_heart = 0:星 1:ﾊｰﾄ		count = 後ろからいくつめの星を消すか
//=========================================================================
static void StarHeartFadeEndCheck(u8 hosi_heart, u8 count)
{
	int i;
	u8 task;
	u8 se_up = 0, se_down = 0;
	u16 fix_scrn;
	u8 star;
	s8 heart;
	u32 now_dotto;
	
	if(hosi_heart == 0){
		for(i = 0; i < BREEDER_MAX; i++){
			star = cgraph[i].itiji_starnum;
			if(count < star){
				*(vu16*)(CRES_FONT_SCRN+
					(0x20*(CRES_STAR_Y0+i*3) 
					+ CRES_STAR_X0 + star - count-1)*2) = CRES_STAR_FIX;
				
				//メーター上昇ﾀｽｸｾｯﾄ
				task = AddTask(MeterUpDownSeq, 10);
				now_dotto = (cgraph[i].itiji_dotto << 16) 
					/ cgraph[i].itiji_starnum * (count+1);
				if((now_dotto & 0x0000ffff) >= 0x00008000)
					now_dotto += 0x00010000;	//四捨五入
				TaskTable[task].work[0] = i;
				TaskTable[task].work[1] = now_dotto >> 16;
				cres->meter_eff++;
				se_up++;
			}
		}
	}
	else{	//ﾊｰﾄ
		for(i = 0; i < BREEDER_MAX; i++){
			heart = cgraph[i].niji_heartnum;
			if(cgraph[i].niji_mainasu)
				fix_scrn = CRES_HEARTBL_FIX;
			else
				fix_scrn = CRES_HEART_FIX;
			
			if(count < heart){
				*(vu16*)(CRES_FONT_SCRN+
					(0x20*(CRES_HEART_Y0+i*3) 
					+ CRES_HEART_X0 + heart - count-1)*2) = fix_scrn;
				task = AddTask(MeterUpDownSeq, 10);
				now_dotto = (cgraph[i].niji_dotto << 16) 
					/ cgraph[i].niji_heartnum * (count+1);
				if((now_dotto & 0x0000ffff) >= 0x00008000)
					now_dotto += 0x00010000;	//四捨五入
				TaskTable[task].work[0] = i;
				if(cgraph[i].niji_mainasu){
					TaskTable[task].work[2] = 1;
					se_down++;
				}
				else
					se_up++;
				if(cgraph[i].niji_mainasu)
					TaskTable[task].work[1] =(-(now_dotto >> 16))+cgraph[i].itiji_dotto;
				else
					TaskTable[task].work[1] = (now_dotto >> 16) + cgraph[i].itiji_dotto;
				cres->meter_eff++;
			}
		}
	}
	
	if(se_down)
		SePlay(SE_BOO);
	if(se_up)
		SePlay(SE_PIN);
}


//----------------------------------------------------------
//	各ﾌﾞﾘｰﾀﾞｰのﾒｰﾀｰを上げる
//----------------------------------------------------------
#define METER_FAST_X	7
#define METER_FAST_Y	6
#define METER_DOTTO_SCRN0	0x504c
#define METER_DOTTO_SCRN4	0x505b
static void MeterUpDownSeq(u8 id)
{
	u8 brd, add;
	int i;
	u16 scrn;
	s16 now_dotto;
	s16 mainus;
	u8 skip = 0, end = 0;
	
	brd = TaskTable[id].work[0];
	now_dotto = TaskTable[id].work[1];
	mainus = TaskTable[id].work[2];
	
	if(mainus && cres->meter[brd] <= 0)
		skip = 1;
	else if(mainus == 0 && cres->meter[brd] >= CRES_GAUGE_MAX)
		skip = 1;
	
	if(cres->meter[brd] == now_dotto)
		end = 1;
	
	if(end == 0){
		if(skip)
			cres->meter[brd] = now_dotto;
		else if(mainus)
			cres->meter[brd]--;
		else
			cres->meter[brd]++;
	}
	
	if(skip == 0 && end == 0){
		for(i = 0; i < (CRES_GAUGE_MAX / 8); i++){
			if(cres->meter[brd] >= 8*(i+1))
				add = 8;
			else{
				if(cres->meter[brd] >= 8*i)
					add = cres->meter[brd] % 8;
				else
					add = 0;
			}
			
			if(add < 4)
				scrn = METER_DOTTO_SCRN0 + add;
			else
				scrn = METER_DOTTO_SCRN4 + (add - 4);
			
			*(vu16*)(CRES_WIN_SCRN+
				(0x20*(METER_FAST_Y + brd*3) + METER_FAST_X + i)*2) = scrn;
		}
	}
	
	if(end){
		cres->meter_eff--;
		DelTask(id);
	}
}

