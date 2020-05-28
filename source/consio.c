//=========================================================================
//
//		コンテスト通信関連関数
//												by matsuda 2001.10.22(月)
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
#include "fld_task.h"
#include "fld_main.h"
#include "multisio.h"
#include "pokesio.h"
#include "cable.h"
#include "consio.h"

//----------------------------------------------------------
//	プロトタイプ宣言
//----------------------------------------------------------
static void SioFlagWait(u8 id);
//static void BreederDataGetWait(u8 id);
void RandTaneTransData(u8 id);
//static void RandTaneTransToSyncWait(u8 id);
//static void RandTaneGetWait(u8 id);
void ContWazaNoSioGet(u8 id);
//static void ContWazaNoGetWait(u8 id);
void EvaluationSioGet(u8 id);
//static void EvaluationGetWait(u8 id);
//static void ContestTypeGetAllWait(u8 id);
//static void WazaNoOkurimakuriEnd(u8 id);
static void Sio10SyncWait(u8 id);
#if CONTEST_SIOINIT_DEL
static void ConnectNumCheck(u8 id);
#endif

//----------------------------------------------------------
//	外部関数宣言
//----------------------------------------------------------
extern void kanshi_network(u8 taskno);
extern void DebugNumPrintInit(u8 pal, u8 select, u8 screen, u8 chara);
extern void kanshi_num_set(u8 w0, u8 w1);

//----------------------------------------------------------
//	外部変数
//----------------------------------------------------------
extern u8 SendPoolBuf[];





//----------------------------------------------------------
//	ツール類
//----------------------------------------------------------

//=========================================================================
//	通信するﾃﾞｰﾀをｾｯﾄして送信する(全員宛に)
// src = 送るﾃﾞｰﾀのｱﾄﾞﾚｽ	size = 転送ﾊﾞｲﾄｻｲｽﾞ
//=========================================================================
static void SetContestSendData(u8 *src, u16 size)
{
	u8 *buff;
	
	buff = &UserWork[0x1e000];
	memcpy(&buff[0], src, size);

	SplitDataSendStart(GetAnotherSendTo(), 
		&UserWork[0x1e000], size);
}

//=========================================================================
//	指定IDからのデータを受信したかﾁｪｯｸ
// connect_id = 送信者の通信ID
// 戻り値：1 = ﾃﾞｰﾀ受信   0 = ﾃﾞｰﾀ非受信
//=========================================================================
static u8 ReceptionDataCheck(u8 connect_id)
{
	u8 send_id;
	
	send_id = 1 << connect_id;
	
	if((SplitDataResult() & send_id) == 0)
		return 0;
	
	SplitDataResultReset2(send_id);
	return 1;
}

//=========================================================================
//	全員分のﾃﾞｰﾀを受信できたかﾁｪｯｸ
//	戻り値: 1 = 全員のﾃﾞｰﾀ受信完了		0 = まだ全員のﾃﾞｰﾀを受信できてない
//=========================================================================
u8 GetAllSendData(void)
{
	int i;
	
	for(i = 0; i < BREEDER_MAX; i++){
		if((SplitDataResult() & (1 << i)) == 0)
			return 0;	//全員分のﾃﾞｰﾀが受信できてないなら終了
	}
	SplitDataResultReset();
	return 1;
}












//=========================================================================
//
//		
//												by matsuda 2002.03.05(火)
//=========================================================================

//----------------------------------------------------------
//	タスクシーケンス
//----------------------------------------------------------

//=========================================================================
//	初期化して自分の通信ID取得
//=========================================================================
#define CONTEST_SIOINIT_DEL		0	//認証処理で接続を切らなくなったので不要な部分削除
void ContestSioInit(u8 id)
{
	u8 i;
	
//	if(ContestTuusin & C_TUUSIN_FLG)

#if CONTEST_SIOINIT_DEL
	PokemonMultiSioInit();
#endif
//	DebugNumPrintInit(0, 0, 31, 2);
//	AddTask(kanshi_network, 1);
	for(i = 0; i < MULTI_SIO_PLAYERS_MAX; i++)
		RecvPoolBuf[i][0] = 0xff;	//とりあえず IDの入るとこだけ
	TaskTable[id].work[0] = 0;
//	TaskTable[id].TaskAdrs = SioFlagWait;
	TaskTable[id].TaskAdrs = Sio10SyncWait;
}

//-- SioInit後、10ｼﾝｸ待つ --//
static void Sio10SyncWait(u8 id)
{
#if CONTEST_SIOINIT_DEL
	if(TaskTable[id].work[0] < 10){
		TaskTable[id].work[0]++;
		return;
	}
	
	if(GetSioRealConnectNumber() < BREEDER_MAX)
		return;

	TaskTable[id].work[0] = 0;
	if(GetMyConnectIsParent())	//親
		TaskTable[id].TaskAdrs = ConnectNumCheck;
	else{						//子
		TaskTable[id].TaskAdrs = SioFlagWait;
//		SePlay(SE_SEIKAI);	//sioﾌﾗｸﾞ待ちになった合図
	}
#else
	TaskTable[id].TaskAdrs = SioFlagWait;
#endif
}

#if CONTEST_SIOINIT_DEL
//-- 親のみ：接続人数ﾁｪｯｸ --//
static void ConnectNumCheck(u8 id)
{
	if(TaskTable[id].work[0]++ == 100)
	{
		MultiSioSignalDecision();
		TaskTable[id].work[0] = 0;
		TaskTable[id].TaskAdrs = SioFlagWait;
	}
}
#endif

//-- 通信ﾌﾗｸﾞが立つまでｳｪｲﾄ --//
static void SioFlagWait(u8 id)
{
	if(pokemon_sio_flag == OFF)
		return;
	
	MyBreederNo = GetSioConnectId();
	if(GetConnectSioMenberNum() == 4)	//4人繋がってるかﾁｪｯｸ
	{
		ContestTuusin = C_TUUSIN_FLG;	//通信ﾌﾗｸﾞON
		ChangeBackTask(id);
	}
}

//=========================================================================
//	全てのﾌﾞﾘｰﾀﾞｰﾃﾞｰﾀを取得する(親、子、共に)
//=========================================================================
void BreederTransData(u8 id)
{
	int i;
	
	switch(TaskTable[id].work[0]){
		case 0:
			if(GetSioConnectId() == 0){
				if(SplitDataSendStatus()){
					memcpy(SendPoolBuf,(u8*)&BreederParam[MyBreederNo],sizeof(BreederData));
					SplitDataExchangeStart(2);
					TaskTable[id].work[0]++;
				}
			}
			else{
				memcpy(SendPoolBuf, (u8*)&BreederParam[MyBreederNo], sizeof(BreederData));
				TaskTable[id].work[0]++;
			}
			break;
		case 1:
			if(GetAllSendData()){
				for(i = 0; i < BREEDER_MAX; i++)
					memcpy(&BreederParam[i], RecvPoolBuf[i], sizeof(BreederData));
				TaskTable[id].work[0]++;
			}
			break;
		default:
			TaskTable[id].work[0] = 0;
			ChangeBackTask(id);
	}
}



//=========================================================================
//	親のﾗﾝﾀﾞﾑのﾀﾈを子に転送する
//=========================================================================
void RandTaneTransData(u8 id)
{
	switch(TaskTable[id].work[0]){
		case 0:
			if(GetSioConnectId() == 0){
				if(SplitDataSendStatus()){
					SetContestSendData((u8*)&r_next, sizeof(r_next));
					TaskTable[id].work[0]++;
				}
			}
			else
				TaskTable[id].work[0]++;
			break;
		case 1:
			if(ReceptionDataCheck(0)){
				memcpy(&r_next, RecvPoolBuf[0], sizeof(r_next));
				memcpy(&temp_rand, RecvPoolBuf[0], sizeof(temp_rand));
				TaskTable[id].work[0]++;
//				SplitDataResultReset();
			}
			break;
		default:
			TaskTable[id].work[0] = 0;
			ChangeBackTask(id);
	}
}




//=========================================================================
//	全員のコンテストの種類を取得する
//=========================================================================
void ContestTypeGetAllData(u8 id)
{
	int i;
	
	switch(TaskTable[id].work[0]){
		case 0:
			SendPoolBuf[0] = TaskTable[id].work[9];
			if(GetSioConnectId() == 0){
				if(SplitDataSendStatus()){
					SplitDataExchangeStart(2);
					TaskTable[id].work[0]++;
				}
			}
			else
				TaskTable[id].work[0]++;
			break;
		case 1:
			if(GetAllSendData()){
				for(i = 0; i < BREEDER_MAX; i++)
					TaskTable[id].work[1+i] = RecvPoolBuf[i][0];
				TaskTable[id].work[0]++;
			}
			break;
		default:
			TaskTable[id].work[0] = 0;
			ChangeBackTask(id);
	}
}



//=========================================================================
//	コンテスト開始時に4台同時に開始するため同期を取る
//=========================================================================
void ContestStandbyCheck(u8 id)
{
	switch(TaskTable[id].work[0]){
		//ﾃﾞｰﾀは送信するが受け取りはしない　同期を取るだけなので
		case 0:
			if(SplitDataSendStatus()){
				SetContestSendData((u8*)&MyBreederNo, 1);
				TaskTable[id].work[0]++;
			}
			break;
		case 1:
			if(GetAllSendData()){
				TaskTable[id].work[0]++;
			}
			break;
		default:
			TaskTable[id].work[0] = 0;
			ChangeBackTask(id);
	}
}


//=========================================================================
//	技ﾅﾝﾊﾞｰを取得する
//=========================================================================
void ContWazaNoSioGet(u8 id)
{
	int i;

	switch(TaskTable[id].work[0]){
		case 0:
			if(SplitDataSendStatus()){
				SetContestSendData((u8*)&apsys[MyBreederNo].use_waza, 2);
				TaskTable[id].work[0]++;
			}
			break;
		case 1:
			if(GetAllSendData()){
				for(i = 0; i < BREEDER_MAX; i++)
					memcpy(&apsys[i].use_waza, RecvPoolBuf[i], 2);
				TaskTable[id].work[0]++;
			}
			break;
		default:
			TaskTable[id].work[0] = 0;
			ChangeBackTask(id);
	}
}



//=========================================================================
//	評価値、ContAP値、2次審査ﾎﾟｲﾝﾄ、ｺﾝﾃｽﾄ順位、を取得する
//=========================================================================
enum{
	EVALUATION_TRANS = 0,
	EVALUATION_WAIT,
	EVALUATION_ENDWAIT,
	CONTAP_TRANS,
	CONTAP_WAIT,
	CONTAP_ENDWAIT,
	NIJIPOINT_TRANS,
	NIJIPOINT_WAIT,
	NIJIPOINT_ENDWAIT,
	JYUNNI_TRANS,
	JYUNNI_WAIT,
	JYUNNI_ENDWAIT,
};
#define EVALUATION_TRANS_WAIT	10
void EvaluationSioGet(u8 id)
{
	switch(TaskTable[id].work[0]){
		case EVALUATION_TRANS:		//評価値を転送
			if(SplitDataSendStatus()){	//全員ﾃﾞｰﾀを送るけど取得するのは親のﾃﾞｰﾀだけ
				SetContestSendData((u8*)ContEvaluation, 2*BREEDER_MAX);
				TaskTable[id].work[0]++;
			}
			break;
		case EVALUATION_WAIT:
			if(GetAllSendData()){
				memcpy(ContEvaluation, RecvPoolBuf[ContestSioOya], 2*BREEDER_MAX);
				TaskTable[id].work[0]++;
			}
			break;
		case EVALUATION_ENDWAIT:
		case CONTAP_ENDWAIT:
		case NIJIPOINT_ENDWAIT:
		case JYUNNI_ENDWAIT:
			if(TaskTable[id].work[1]++ > EVALUATION_TRANS_WAIT){
				TaskTable[id].work[1] = 0;
				TaskTable[id].work[0]++;
			}
			break;
		case CONTAP_TRANS:		//ContAPを転送
			if(SplitDataSendStatus()){	//全員ﾃﾞｰﾀを送るけど取得するのは親のﾃﾞｰﾀだけ
				SetContestSendData((u8*)ContAP, 2*BREEDER_MAX);
				TaskTable[id].work[0]++;
			}
			break;
		case CONTAP_WAIT:
			if(GetAllSendData()){
				memcpy(ContAP, RecvPoolBuf[ContestSioOya], 2*BREEDER_MAX);
				TaskTable[id].work[0]++;
			}
			break;
		case NIJIPOINT_TRANS:		//NijiPointを転送
			if(SplitDataSendStatus()){	//全員ﾃﾞｰﾀを送るけど取得するのは親のﾃﾞｰﾀだけ
				SetContestSendData((u8*)NijiPoint, 2*BREEDER_MAX);
				TaskTable[id].work[0]++;
			}
			break;
		case NIJIPOINT_WAIT:
			if(GetAllSendData()){
				memcpy(NijiPoint, RecvPoolBuf[ContestSioOya], 2*BREEDER_MAX);
				TaskTable[id].work[0]++;
			}
			break;
		case JYUNNI_TRANS:		//ContestJyunniを転送
			if(SplitDataSendStatus()){	//全員ﾃﾞｰﾀを送るけど取得するのは親のﾃﾞｰﾀだけ
				SetContestSendData((u8*)ContestJyunni, BREEDER_MAX);
				TaskTable[id].work[0]++;
			}
			break;
		case JYUNNI_WAIT:
			if(GetAllSendData()){
				memcpy(ContestJyunni, RecvPoolBuf[ContestSioOya], BREEDER_MAX);
				TaskTable[id].work[0]++;
			}
			break;
		default:
			TaskTable[id].work[0] = 0;
			ChangeBackTask(id);
	}
}


//=========================================================================
//	技の計算結果の各種ﾌﾗｸﾞが入った構造体を取得する
//=========================================================================
enum{
	APSYS_TRANS = 0,
	APSYS_WAIT,
	APSYS_ENDWAIT,
	CONWAZA_TRANS,
	CONWAZA_WAIT,
	CONWAZA_ENDWAIT,
	CCW_TRANS,
	CCW_WAIT,
	CCW_ENDWAIT,
	BRDSORT_TRANS,
	BRDSORT_WAIT,
	BRDSORT_ENDWAIT,
};
#define CONWAZA_TRANS_WAIT	10	//次のﾃﾞｰﾀ送信までに少しｳｪｲﾄを入れる
void ContWazaCalcDataSioGet(u8 id)
{
	switch(TaskTable[id].work[0]){
		case APSYS_TRANS:		//apsysを転送
			if(SplitDataSendStatus()){	//全員ﾃﾞｰﾀを送るけど取得するのは親のﾃﾞｰﾀだけ
				SetContestSendData((u8*)apsys, sizeof(ContestAPSys)*BREEDER_MAX);
				TaskTable[id].work[0]++;
			}
			break;
		case APSYS_WAIT:
			if(GetAllSendData()){
				memcpy(apsys, RecvPoolBuf[ContestSioOya], 
					sizeof(ContestAPSys)*BREEDER_MAX);
				TaskTable[id].work[0]++;
			}
			break;
		case APSYS_ENDWAIT:
		case CONWAZA_ENDWAIT:
		case CCW_ENDWAIT:
		case BRDSORT_ENDWAIT:
			if(TaskTable[id].work[1]++ > CONWAZA_TRANS_WAIT){
				TaskTable[id].work[1] = 0;
				TaskTable[id].work[0]++;
			}
			break;
		case CONWAZA_TRANS:		//CONWAZAを転送
			if(SplitDataSendStatus()){	//全員ﾃﾞｰﾀを送るけど取得するのは親のﾃﾞｰﾀだけ
				SetContestSendData((u8*)CONWAZA, sizeof(WazaKoukaWork));
				TaskTable[id].work[0]++;
			}
			break;
		case CONWAZA_WAIT:
			if(GetAllSendData()){
				memcpy(CONWAZA, RecvPoolBuf[ContestSioOya], sizeof(WazaKoukaWork));
				TaskTable[id].work[0]++;
			}
			break;
		case CCW_TRANS:		//ccwを転送
			if(SplitDataSendStatus()){	//全員ﾃﾞｰﾀを送るけど取得するのは親のﾃﾞｰﾀだけ
				SetContestSendData((u8*)ccw, sizeof(ContestCalcWork));
				TaskTable[id].work[0]++;
			}
			break;
		case CCW_WAIT:
			if(GetAllSendData()){
				memcpy(ccw, RecvPoolBuf[ContestSioOya], sizeof(ContestCalcWork));
				TaskTable[id].work[0]++;
			}
			break;
		case BRDSORT_TRANS:		//BrdSortを転送
			if(SplitDataSendStatus()){	//全員ﾃﾞｰﾀを送るけど取得するのは親のﾃﾞｰﾀだけ
				SetContestSendData((u8*)BrdSort, BREEDER_MAX);
				TaskTable[id].work[0]++;
			}
			break;
		case BRDSORT_WAIT:
			if(GetAllSendData()){
				memcpy(BrdSort, RecvPoolBuf[ContestSioOya], BREEDER_MAX);
				TaskTable[id].work[0]++;
			}
			break;
		default:
			TaskTable[id].work[0] = 0;
			ChangeBackTask(id);
	}
}

//=========================================================================
//	全員のコンテストサーバーのVersionを取得する
//=========================================================================
void ContestVersionGetAllData(u8 id)
{
	int i;
	
	switch(TaskTable[id].work[0]){
		case 0:
			SendPoolBuf[0] = CONTEST_VERSION;
			if(GetSioConnectId() == 0){
				if(SplitDataSendStatus()){
					SplitDataExchangeStart(2);
					TaskTable[id].work[0]++;
				}
			}
			else
				TaskTable[id].work[0]++;
			break;
		case 1:
			if(GetAllSendData()){
				for(i = 0; i < BREEDER_MAX; i++)
					TaskTable[id].work[5+i] = RecvPoolBuf[i][0];
				TaskTable[id].work[0]++;
			}
			break;
		default:
			TaskTable[id].work[0] = 0;
			ChangeBackTask(id);
	}
}

//=========================================================================
//	一次審査の計算結果を転送する
//=========================================================================
void ContBPAllTransData(u8 id)
{
	switch(TaskTable[id].work[0]){
		case 0:
			if(SplitDataSendStatus()){	//全員ﾃﾞｰﾀを送るけど取得するのは親のﾃﾞｰﾀだけ
				SetContestSendData((u8*)ContBP, 8);
				TaskTable[id].work[0]++;
			}
			break;
		case 1:
			if(GetAllSendData()){
				memcpy(ContBP, RecvPoolBuf[ContestSioOya], 8);
				TaskTable[id].work[0]++;
			}
			break;
		default:
			TaskTable[id].work[0] = 0;
			ChangeBackTask(id);
			break;
	}
}

//=========================================================================
//	初回のBrdSortデータを転送する
//=========================================================================
void BrdSortInitAllTransData(u8 id)
{
	switch(TaskTable[id].work[0]){
		case 0:
			if(SplitDataSendStatus()){	//全員ﾃﾞｰﾀを送るけど取得するのは親のﾃﾞｰﾀだけ
				SetContestSendData((u8*)BrdSort, BREEDER_MAX);
				TaskTable[id].work[0]++;
			}
			break;
		case 1:
			if(GetAllSendData()){
				memcpy(&BrdSort, RecvPoolBuf[ContestSioOya], BREEDER_MAX);
				TaskTable[id].work[0]++;
			}
			break;
		default:
			TaskTable[id].work[0] = 0;
			ChangeBackTask(id);
			break;
	}
}

