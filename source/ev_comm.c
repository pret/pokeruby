//=========================================================================
//
//		通信受付関連
//
//	2001.10.29 GAME FREAK Inc.
//
//=========================================================================

#ifdef  PM_DEBUG
#define DEBUG_NUMPRINT
#endif
#include "common.h"
#include "task.h"
#include "fld_task.h"
#include "script.h"
#include "multisio.h"
#include "pokesio.h"
#include "cable.h"
#include "fight.h"
#include "weather.h"
#include "palanm.h"
#include "fld_main.h"
#include "fld_tool.h"
#include "report.h"
#include "sxytype.h"
#include "print.h"
#include "menutool.h"
#include "syswork.h"
#include "fld_talk.h"
#include "fan.h"
#include "mus_tool.h"
#include "pokescr.h"
#include "saveload.h"
#include "mystatus.h"
#include "score.h"			//UpdateTaisenScore
#include "pokelist.h"		// 2002/05/25 by nakahiro
#include "mystatus.h"
#include "poketool.h"

#define __EV_COMM_H_GLOBAL__
#include "ev_comm.h"

#ifdef PM_DEBUG
u32 AutoKeyTryNum;
u32 AutoResultNum;
u8   GetSioCheckFlag();
u16  VirtualKey;
#endif

enum {
	//通信受付の参加人数定義
	
	MAX_PLAYER_MULTI_BATTLE = 4,
	MIN_PLAYER_MULTI_BATTLE = 4,

	MAX_PLAYER_SINGLE_BATTLE = 2,
	MIN_PLAYER_SINGLE_BATTLE = 2,

	MAX_PLAYER_DOUBLE_BATTLE = 2,
	MIN_PLAYER_DOUBLE_BATTLE = 2,

	MAX_PLAYER_RECORD = 4,
	MIN_PLAYER_RECORD = 2,

	MAX_PLAYER_TRADE	= 2,
	MIN_PLAYER_TRADE	= 2,

	MAX_PLAYER_BLEND = 4,
	MIN_PLAYER_BLEND = 2,

	MAX_PLAYER_CONTEST = 4,
	MIN_PLAYER_CONTEST = 4,
};

enum {
	//SIO初期化後､実際の接続確認をはじめるまでのウェイト
	SIO_CONNECT_WAIT	= 10,
	OYA_TIMEOUT_COUNT   = 10*60,
};

extern void InitFight(void);
extern void PokeAllKaifuku(void);

extern void MultiSioFieldSyncStart(void);
extern u8 SendPoolBuf[];

#ifdef PM_DEBUG
void AddAutoKeyTask();
#endif

//=========================================================================
//
//	通信受付処理
//
//=========================================================================


//=========================================================================
//  
//=========================================================================

static void sio_connect_init_task(u8 no);
static void sio_connect_next_task(u8 no);
static void sio_connect_msgwait_oya_task(u8 no);
static void sio_connect_keywait_task(u8 no);
static void sio_connect_wait_oya_task(u8 no);
static void sio_connect_ask_oya_task(u8 no);
static void sio_connect_wait_ko_task(u8 no);
static void sio_connect_end_wait_task(u8 no);
static void sio_connect_oya_end_start(u8 no);

static void sio_connect_end_task(u8 no);
static void sio_connect_cancel_task(u8 no);
static void sio_connect_error_task(u8 no);
static u8 sio_connect_oya_timeout(u8 no);

static int sio_start_cancel_check( u8 no );
static int sio_start_cancel_check2( u8 no );

extern const u8 msg_reception_wait_p01[];
extern const u8 msg_reception_wait_p02[];
extern const u8 msg_reception_wait_p03[];
extern const u8 msg_reception_wait_p04[];


enum{
	WK_CONNECT_WAIT = 0,
	WK_CONNECT_MIN,
	WK_CONNECT_MAX,
	WK_CONNECT_NOW,
	WK_CONNECT_TIMEOUT,
};

enum{
//	『～にん　せつぞく』の表示関連定義

	SIONUMWIN_X = 18,
	SIONUMWIN_Y = 10,
	SIONUMWIN_X_SIZE = 11,
	SIONUMWIN_Y_SIZE = 4,

	SIONUMWIN_X2 = SIONUMWIN_X+SIONUMWIN_X_SIZE-1,
	SIONUMWIN_Y2 = SIONUMWIN_Y+SIONUMWIN_Y_SIZE-1,

	SIONUMWIN_MSGX	= SIONUMWIN_X + 2,
	SIONUMWIN_MSGY	= SIONUMWIN_Y + 1,
};

static const u8 msg_number_win[] = { I_MSG_,STR_TEMP_BUF0,ni_,n_,spc_,se_,tu_,zo_,ku_,EOM_ };


extern void (*PokemonMultiSioFunc)();
extern  u8	MultiSioInitialFlag[];

#ifdef	PM_DEBUG
static u8 SearchNowTask( pTaskFunc adrs)
{
	if( adrs == sio_connect_next_task 			) return 0x01;
	if( adrs == sio_connect_msgwait_oya_task	) return 0x11;
	if( adrs == sio_connect_keywait_task		) return 0x12;
	if( adrs == sio_connect_wait_oya_task		) return 0x13;
	if( adrs == sio_connect_ask_oya_task		) return 0x14;
	if( adrs == sio_connect_wait_ko_task		) return 0x21;
	if( adrs == sio_connect_end_wait_task		) return 0x02;
	if( adrs == sio_connect_end_task			) return 0x03;

	return 0;
}
//-------------------------------------------------------------
//-------------------------------------------------------------
static void debug_connect_watch_task(u8 no)
{
	int i;

	if (TaskTable[TaskTable[no].work[0]].occ == 0) {
		if(TaskTable[no].work[1]==5){
			DelTask(no);
		}
		TaskTable[no].work[1]++;
//		return;
	}
	numprint(Signal, 		2,	0,	2);							//通信ドライバーシグナル

	numprint(SendPoolBuf[0],22,5,4);							//分割送信バッファ
	for(i=0;i<4;i++){
		numprint(MultiSioInitialFlag[i], 5+i*2,0,1);			//通信認証データ受け取りフラグ
		numprint(RecvPoolBuf[i][0],22,6+i,4);					//分割受信バッファ
	}

	numprint(SioFlags, 		15,	0,	8);							//通信ステータス
	numprint(M_s.State, 	2,	10,	2);							//通信ドライバ親子フラグ

	numprint(GetSioConnectId(),  7, 12, 2);						//通信ＩＤ
	numprint(SplitDataResult(),  7, 10, 2);						//分割データ受け取り終了ビットデータ
	numprint(pokemon_sio_flag,	 2, 12, 1);						//ポケモン通信認証済みフラグ
	numprint(AnswerWork, 11, 8, 2);								//スクリプト返り値ワーク
																//接続人数
	numprint(((SioFlags & MULTI_SIO_PLAYERS_NUM_MASK) >> MULTI_SIO_PLAYERS_NUM_SHIFT), 11,10,2);
																//通信ドライバシーケンス
	numprint(MultiSioMainCheck(),													   11,12,1);
																//分割送信許可フラグ
	numprint(SplitDataSendStatus(),														15,10,1);
																//通信受付タスクの現在の状態
	numprint(SearchNowTask(TaskTable[TaskTable[no].work[0]].TaskAdrs),				   15,12,2);
	numprint((u32)PokemonMultiSioFunc, 2,13,8);					//通信用関数ポインタ

	numprint(MultiSioErrorCheck(),	2, 2,1);					//通信エラーフラグ

	for (i=0; i<4; i++) {
		numprint(SioTrainerInfo[i].ninshou,	2+i*6,3,4);			//シーン認証番号
	}
	numprint(*(vu16*)REG_SIOCNT,	2,6,4);						//通信レジスタ


	numprint(GetSioCheckFlag(),         25,3,1);					//トライ回数
}
#endif

//-------------------------------------------------------------
//	通信受付からの接続処理タスクをスタートする
//
//<引数>	min		最低の参加人数
//			max		最大の参加人数
//-------------------------------------------------------------
static void add_sio_connect_task( u8 min, u8 max )
{
	u8 no;

#ifdef PM_DEBUG
	u8 no2;

	DebugNumPrintInit2(
		12,					//palette
		MSG_BG_NO,			//BG
		MSG_SCRN_BASE,		//scrn offset
		MSG_CHR_BASE		//chr offset
	);
#endif

	no = CheckTaskNo(sio_connect_init_task);
	if (no != NOT_EXIST_TASK_ID) return;

	no = AddTask(sio_connect_init_task, TSK_PRI_EFFECT);
	TaskTable[no].work[WK_CONNECT_MIN] = min;
	TaskTable[no].work[WK_CONNECT_MAX] = max;

#ifdef	PM_DEBUG
	no2 = AddTask(debug_connect_watch_task, TSK_PRI_EFFECT);
	TaskTable[no2].work[0] = no;
#endif
}

//-------------------------------------------------------------
//	『～にん　せつぞく』のウィンドウ操作
//-------------------------------------------------------------
//表示
static void put_connect_number_win(int number)
{
	PM_NumMsgSet(StrTempBuffer0, number, NUM_MODE_LEFT, 1);
	NMenuWinBoxWrite(SIONUMWIN_X, SIONUMWIN_Y, SIONUMWIN_X2, SIONUMWIN_Y2);
	NMenuMsgWrite(msg_number_win, SIONUMWIN_MSGX, SIONUMWIN_MSGY);
}

//消去
static void clear_connect_number_win( void )
{
	NMenuBoxClear(SIONUMWIN_X, SIONUMWIN_Y, SIONUMWIN_X2, SIONUMWIN_Y2);
}

//更新
static void update_connect_info(u8 task_no, u8 now)
{
	s16 * wk;
	wk = &TaskTable[task_no].work[WK_CONNECT_NOW];

	//接続人数に変動があったら画面表示変更
	if (now != *wk) {
		if (now < 2) {
			//人数が０～１の場合､ウィンドウは表示しない
			clear_connect_number_win();
		} else {
			put_connect_number_win(now);
		}
		*wk = now;
	}
}

//-------------------------------------------------------------
//	接続チェック
//-------------------------------------------------------------
static int sio_start_check( u8 min, u8 max )
{
	int num;
	
	switch( PokemonMultiSioCheck() ) {

	case 1:
		num = GetSioRealConnectNumber();
		if ( min <= num && num <= max ) {
			return COMM_RES_OK;			//接続ＯＫ
		} else {
			PM_NumMsgSet( StrTempBuffer0, num, NUM_MODE_LEFT, 1);
			return COMM_RES_WRONG_NUM;	//接続人数が違う
		}

	case 2:
		return COMM_RES_WAIT;			//タイムアウトだが無視して接続待ち

	case 3:
		return COMM_RES_OTHERMODE;		//通信モードが違う

	default:
		return COMM_RES_WAIT;			//接続待ち
	}
}

//-------------------------------------------------------------
//	エラー発生のチェック
//-------------------------------------------------------------
static int sio_error_connect_check(u8 no)
{
	if (MultiSioErrorCheck() == 1) {
		TaskTable[no].TaskAdrs = sio_connect_error_task;
		return TRUE;
	} else {
		return FALSE;
	}
}

//-------------------------------------------------------------
//	Ｂボタンキャンセルチェック＆キャンセル処理
//-------------------------------------------------------------
static int sio_start_cancel_check( u8 no )
{
	if ( sys.Trg & B_BUTTON ) {
		if(MultiSioMainCheck()==0){
			TaskTable[no].TaskAdrs = sio_connect_cancel_task;
			return TRUE;
		}else{
			return FALSE;
		}
	} else {
		return FALSE;
	}
}

//-------------------------------------------------------------
//	Ｂボタンキャンセルチェック＆キャンセル処理
//-------------------------------------------------------------
static int sio_start_cancel_check2( u8 no )
{
	if(MultiSioMainCheck())							//connect_next_taskで通信がメインフローに入っていたら
		MultiSioErrorPermit(SIO_ERROR_NO_JUMP);		//異常な状態。エラー画面に飛ばさないようにする

	if ( sys.Trg & B_BUTTON ) {
		TaskTable[no].TaskAdrs = sio_connect_cancel_task;
		return TRUE;
	} else {
		return FALSE;
	}
}

//-------------------------------------------------------------
//	親の場合のコネクタチェック
//-------------------------------------------------------------
static int sio_parant_connect_check(u8 no)
{
	if (SioParentConnectCheck() == 1) {
		TaskTable[no].TaskAdrs = sio_connect_error_task;
		return TRUE;
	} else {
		return FALSE;
	}
}


void LaterSioExchangeStart(u8 no)
{
	TaskTable[no].work[0]++;
	if(TaskTable[no].work[0]==10){
		SplitDataExchangeStart(2);
		DelTask(no);
	}
}
//-------------------------------------------------------------
//-------------------------------------------------------------

//初期化＆ウェイト
static void sio_connect_init_task(u8 no)
{
	s16 * wk = TaskTable[no].work;

	if ( wk[0] == 0 ) {
		PokemonMultiSioCheckInit();
		ClearSioReliableNumber();
		ClearSioTrainerInfo();
	}
	else if ( wk[0] >= SIO_CONNECT_WAIT ) {
		TaskTable[no].TaskAdrs = sio_connect_next_task;
	}
	wk[0]++;
}

// 親か子かで分岐
static void sio_connect_next_task(u8 no)
{
	u16 real_num;

	real_num = GetSioRealConnectNumber();

	if ( sio_start_cancel_check(no)  == TRUE ) return;			//こっちは通常の接続待機状態の時のキャンセルだが
	if ( sio_start_cancel_check2(no) == TRUE ) return;			//こっちはすでに異常な状態（もう通信メインにフローが移っている)

	if ( real_num > 1 ) {
		//エラーでも制御の強制変更はない
		MultiSioErrorPermit(SIO_ERROR_NO_JUMP);

		TaskTable[no].work[WK_CONNECT_NOW] = 0;

		if ( GetMyConnectIsParent() == 1 ) {
			SePlay( SE_PIN );
			FieldMsgSetNoSkip( msg_reception_wait_p02 );
			TaskTable[no].TaskAdrs = sio_connect_msgwait_oya_task;
		} else {
			SePlay( SE_BOO );
			FieldMsgSetNoSkip( msg_reception_wait_p03 );
//			TaskTable[no].TaskAdrs = sio_connect_msgwait_ko_task;
/*---ここから--2002/09/17 by Mori----*/
			TaskTable[no].TaskAdrs = sio_connect_wait_ko_task;
/*---ここまで--------*/
		}
	}
}

//メッセージ表示待ち（親）
static void sio_connect_msgwait_oya_task(u8 no)
{
	if ( sio_start_cancel_check(no) == TRUE ) return;

	if (sio_parant_connect_check(no) == TRUE) return;

	if (sio_error_connect_check(no) == TRUE) return;

	if ( FieldMsgStatusCheck() == FLDMSG_STAT_OFF ) {
		TaskTable[no].work[WK_CONNECT_NOW] = 0;
		TaskTable[no].TaskAdrs = sio_connect_keywait_task;
	}
}

// Ａボタンで通信開始（※親のみ）
static void sio_connect_keywait_task(u8 no)
{
	u16 real_num;
	s16 * twk;

	twk = TaskTable[no].work;
	real_num = GetSioRealConnectNumber();

	if (sio_start_cancel_check(no) == TRUE) return;

	if (sio_parant_connect_check(no) == TRUE) return;

	if (sio_error_connect_check(no) == TRUE) return;

	//接続人数に変動があったら画面表示変更
	update_connect_info(no, real_num);

	if ((sys.Trg & A_BUTTON) == 0) return;
	if (real_num >= twk[WK_CONNECT_MIN]) {
		SetSioReliableNumber(real_num);
		clear_connect_number_win();
		PM_NumMsgSet(StrTempBuffer0, real_num, NUM_MODE_LEFT, 1);
		FieldMsgSetNoSkip( msg_reception_wait_p04 );
		TaskTable[no].TaskAdrs = sio_connect_ask_oya_task;
//		SePlay(SE_SELECT);
//		MultiSioSignalDecision();
//		TaskTable[no].TaskAdrs = sio_connect_wait_oya_task;
	}
}

//確認ＭＳＧ表示＆決定待ち
static void sio_connect_ask_oya_task(u8 no)
{
	if (sio_start_cancel_check(no) == TRUE) return;
	if (sio_parant_connect_check(no) == TRUE) return;
	if (sio_error_connect_check(no) == TRUE) return;

	if (FieldMsgStatusCheck() != FLDMSG_STAT_OFF) return;

	if (GetSioReliableNumber() != GetSioRealConnectNumber()) {
		//人数が変動した場合
		FieldMsgSetNoSkip( msg_reception_wait_p02 );
		TaskTable[no].TaskAdrs = sio_connect_msgwait_oya_task;
		return;
	}
	if (sys.Cont & B_BUTTON) {
		//Ｂボタンキャンセルの場合
		FieldMsgSetNoSkip( msg_reception_wait_p02 );
		TaskTable[no].TaskAdrs = sio_connect_msgwait_oya_task;
		return;
	}
	if (sys.Cont & A_BUTTON) {
		//Ａボタンで決定した場合
		SePlay(SE_SELECT);
		MultiSioSignalDecision();
		TaskTable[no].TaskAdrs = sio_connect_wait_oya_task;
	}
}

// 認証処理待ち(親)
static void sio_connect_wait_oya_task(u8 no)
{
	u8 min,max;

	min = TaskTable[no].work[WK_CONNECT_MIN];
	max = TaskTable[no].work[WK_CONNECT_MAX];

//	if ( sio_start_cancel_check(no) == TRUE ) return;
//	if (sio_parant_connect_check(no) == TRUE) return;

	if (sio_error_connect_check(no) == TRUE) return;
	if (sio_connect_oya_timeout(no) == TRUE) return;	//親のみのタイムアウトエラーあり

	if (GetSioRealConnectNumber() != GetSioReliableNumber()) {
		//通信開始後でも人数が変動したらエラーにする
		TaskTable[no].TaskAdrs = sio_connect_error_task;
		return;
	}

	AnswerWork = sio_start_check(min,max);								//接続認証結果取得
	if ( AnswerWork != COMM_RES_WAIT ) {
		TaskTable[no].TaskAdrs = sio_connect_oya_end_start;
	}
}



// 認証処理待ち(子)
static void sio_connect_wait_ko_task(u8 no)
{
	u8 min,max;

	min = TaskTable[no].work[WK_CONNECT_MIN];
	max = TaskTable[no].work[WK_CONNECT_MAX];

	if ( sio_start_cancel_check(no) == TRUE ) return;

//	if (sio_child_connect_check(no) == TRUE) return;

	if (sio_error_connect_check(no) == TRUE) return;

#ifdef PM_DEBUG
	update_connect_info(no, GetSioRealConnectNumber());
#endif

	AnswerWork = sio_start_check(min,max);
	if ( AnswerWork != COMM_RES_WAIT ) {
	if(AnswerWork==COMM_RES_OTHERMODE){
		SetSioEndDataStart();									//通信終了処理開始
		FieldMsgClear();
		TaskTable[no].TaskAdrs = sio_connect_end_task;
	}else{
		comm_player_num = GetSioRealConnectNumber();
		comm_my_id = GetSioConnectId();
		SetSioReliableNumber(comm_player_num);
		SetTrainerCardWorkPlayer((TRCARD*)SendPoolBuf);			//トレーナーカードの準備
		TaskTable[no].TaskAdrs = sio_connect_end_wait_task;
	}
	}
}

// 認証処理待ち終了後の遷移(親のみ
static void sio_connect_oya_end_start(u8 no)
{
	if (sio_error_connect_check(no) == TRUE) return;

	if(AnswerWork==COMM_RES_OTHERMODE){
		SetSioEndDataStart();									//通信終了処理開始
		FieldMsgClear();
		TaskTable[no].TaskAdrs = sio_connect_end_task;
	}else{
		comm_player_num = GetSioRealConnectNumber();
		comm_my_id = GetSioConnectId();
		SetSioReliableNumber(comm_player_num);
		SetTrainerCardWorkPlayer((TRCARD*)SendPoolBuf);			//トレーナーカードの準備
		TaskTable[no].TaskAdrs = sio_connect_end_wait_task;
//		AddTask(LaterSioExchangeStart,80);
		SplitDataExchangeStart(2);
	}
}

static void sio_connect_end_wait_task(u8 no)
{
	u8 i;
	TRCARD	*p;

	if (sio_error_connect_check(no) == TRUE) return;

	if((SplitDataResult()==GetConnectMemberBitData())){			//全員のデータが届いたか？
		for(i=0;i<GetConnectSioMenberNum();i++){
			p = (TRCARD*)RecvPoolBuf[i];						//トレーナーカード情報をコピー
			MultiTrainerCard[i] = *p;
		}
		MultiSioErrorPermit(SIO_ERROR_PERMIT_JUMP);
		SplitDataResultReset();									
		FieldMsgClear();											//「つうしんかいしをまっています」を消去
		if(AnswerWork==COMM_RES_OK){								//正常に接続か？
			if(PokemonSioNinshouNo==NINSHOU_BLEND_ENTER){			//ブレンドマシーンの時は
				clear_connect_number_win();
				ContinueFieldScript();
				DelTask(no);
			}else{
//				SetSioEndDataStart();								//通信終了処理開始
//				TaskTable[no].TaskAdrs = sio_connect_end_task;
/*---ここから--2002/09/17 by Mori----*/
				clear_connect_number_win();
				ContinueFieldScript();
				DelTask(no);
/*---ここまで------*/
			}
		}else{													//間違ってたら
			SetSioEndDataStart();									//通信終了処理開始
			TaskTable[no].TaskAdrs = sio_connect_end_task;
		}
	}
}	

static void sio_connect_end_task(u8 no)
{
	if(pokemon_sio_flag==0){
		clear_connect_number_win();
		ContinueFieldScript();
		DelTask(no);
	}
}

static void sio_connect_cancel_task(u8 no)
{
	AnswerWork = COMM_RES_CANCEL;
	clear_connect_number_win();
	FieldMsgClear();			//MSG表示中にキャンセルしたときのため
	ContinueFieldScript();
	DelTask(no);
}

static void sio_connect_error_task(u8 no)
{
	AnswerWork = COMM_RES_ERROR;
	clear_connect_number_win();
	FieldMsgClear();			//MSG表示中にエラーになったときのため
	ContinueFieldScript();
	DelTask(no);
}


// =================================================================
// sio_connect_oya_timeout
// 概要  : 親が接続状態に入ったときに子機からの応答がなかったタイムアウトエラー
// 引数  : no	taskno
// 戻り値: u8   TRUE=TIMEOUT  FALSE
// =================================================================
static u8 sio_connect_oya_timeout(u8 no)
{
	TaskTable[no].work[WK_CONNECT_TIMEOUT]++;
	if(TaskTable[no].work[WK_CONNECT_TIMEOUT] > OYA_TIMEOUT_COUNT){
		TaskTable[no].TaskAdrs  = sio_connect_error_task;
		return TRUE;
	}
	return FALSE;
}
//-------------------------------------------------------------
//	通信対戦の接続処理開始
//-------------------------------------------------------------
void ConnectBattleSio( void )
{
	u8 min, max;

	//とりあえずのデフォルト値
	min = MIN_PLAYER_SINGLE_BATTLE;
	max = MAX_PLAYER_SINGLE_BATTLE;

	switch ( ScriptParameter0 ) {
	case COMM_ID_1VS1BATTLE:
		min = MIN_PLAYER_SINGLE_BATTLE;
		max = MAX_PLAYER_SINGLE_BATTLE;
		PokemonSioNinshouNo = NINSHOU_BATTLE1VS1;
		break;
	case COMM_ID_2VS2BATTLE:
		min = MIN_PLAYER_DOUBLE_BATTLE;
		max = MAX_PLAYER_DOUBLE_BATTLE;
		PokemonSioNinshouNo = NINSHOU_BATTLE2VS2;
		break;
	case COMM_ID_4BATTLE:
		min = MIN_PLAYER_MULTI_BATTLE;
		max = MAX_PLAYER_MULTI_BATTLE;
		PokemonSioNinshouNo = NINSHOU_BATTLE_MULTI;
		break;
	}
	add_sio_connect_task(min,max);
}

//-------------------------------------------------------------
//	通信交換の接続処理開始
//-------------------------------------------------------------
void ConnectTradeSio( void )
{
	PokemonSioNinshouNo = NINSHOU_KOUKANENTER;
	FightType           = 0;
	add_sio_connect_task(MIN_PLAYER_TRADE, MAX_PLAYER_TRADE);
}

//-------------------------------------------------------------
//	レコードコーナーの接続処理開始
//-------------------------------------------------------------
void ConnectRecordSio( void )
{
//	AddAutoKeyTask();
	AnswerWork          = 0;
	PokemonSioNinshouNo = NINSHOU_RECORD_ENTER;
	FightType           = 0;
	add_sio_connect_task(MIN_PLAYER_RECORD, MAX_PLAYER_RECORD);
}

//-------------------------------------------------------------
//	ブレンドマシーンの接続処理開始
//-------------------------------------------------------------
void ConnectBlendSio( void )
{
	PokemonSioNinshouNo = NINSHOU_BLEND_ENTER;
	FightType           = 0;
	add_sio_connect_task(MIN_PLAYER_BLEND, MAX_PLAYER_BLEND);
}

//-------------------------------------------------------------
//	コンテストの接続処理開始
//-------------------------------------------------------------
void ConnectContestSio(void)
{
	PokemonSioNinshouNo = NINSHOU_CONTEST;
	FightType           = 0;
	add_sio_connect_task(MIN_PLAYER_CONTEST, MAX_PLAYER_CONTEST);
}

//=========================================================================
//
//	通信部屋に入った時の認証処理
//
//=========================================================================
static void room_ninshou_init_task(u8 no);
static void room_ninshou_next_task(u8 no);
static void room_ninshou_wait_task(u8 no);
static void room_ninshou_check_task(u8 no);

//-------------------------------------------------------------
//-------------------------------------------------------------
u8 AddNinshouRoomTask(void)
{
	if ( CheckTask(room_ninshou_init_task) ) return -1;

	switch ( ScriptParameter0 ) {
	case COMM_ID_1VS1BATTLE:
		PokemonSioNinshouNo = NINSHOU_BATTLE1VS1;
		break;
	case COMM_ID_2VS2BATTLE:
		PokemonSioNinshouNo = NINSHOU_BATTLE2VS2;
		break;
	case COMM_ID_4BATTLE:
		PokemonSioNinshouNo = NINSHOU_BATTLE_MULTI;
		break;
	case COMM_ID_TRADE:
		PokemonSioNinshouNo = NINSHOU_KOUKAN;
		break;
	case COMM_ID_RECORD:
		PokemonSioNinshouNo = NINSHOU_RECORD_CORNER;
		break;
	}
	return AddTask( room_ninshou_init_task, TSK_PRI_EFFECT );
}

//-------------------------------------------------------------
//-------------------------------------------------------------
// 初期化＆ウェイト
static void room_ninshou_init_task( u8 no )
{
	s16 * wk = TaskTable[no].work;

	if (wk[0] == 0 ) {
		PokemonMultiSioInit();
		ClearSioTrainerInfo();
		AddTask(JidouNinshouWatchDog, 80);
	}
	else if (wk[0] >= SIO_CONNECT_WAIT) {
		TaskTable[no].TaskAdrs = room_ninshou_next_task;
	}

	wk[0]++;
}

// IDが親か子かで分岐
static void room_ninshou_next_task( u8 no )
{
	//２人以上接続になるのを待つ
	if (GetSioRealConnectNumber() <= 1)
		return;

	if (GetMyConnectIsParent() == 1) {
		TaskTable[no].TaskAdrs = room_ninshou_wait_task;
	} else {
		TaskTable[no].TaskAdrs = room_ninshou_check_task;
	}
}

// 人数がそろうのを待つ（※親のみ）
static void room_ninshou_wait_task( u8 no )
{
	if ( GetSioReliableNumber() == GetSioRealConnectNumber() ) {
		MultiSioSignalDecision();
		TaskTable[no].TaskAdrs = room_ninshou_check_task;
	}
}

// 認証処理待ち
static void room_ninshou_check_task( u8 no )
{
	if ( pokemon_sio_flag == 1 && PokemonNinshouNoCheck() == 1 ) {
		CheckMyTrainerInfo();					//つなぎかえ対策
		MultiSioFieldSyncStart();
		DelTask(no);
	}
}



//=========================================================================
//	通信前のセーブ処理
//	※現状ダミーです
//=========================================================================
void ConnectSave( void )
{
	ReportSequenceStart();
}


#define COMM_BATTLE_START_WAIT (20)
//=========================================================================
//
//	ポケモン対戦モードへの遷移
//
//=========================================================================
static void comm_battle_start_task( u8 no )
{
	TASK_TABLE * my;
	my = &TaskTable[no];
	switch ( my->work[0] ) {
	case 0:
		FieldFadeControl(FIELD_FADE_OUT, 0);
		PokemonSioNinshouNo = NINSHOU_BATTLEROOM;
		MultiSioFunctionClear();	//通信用タスクをクリア
									//この後、フェードアウト中はINVALID_DATAを送受信する
									//→フィールド動作中に累積したFIFOが解消される
		my->work[0]++;
		break;
	case 1:
		if( FadeData.fade_sw == 0 )
			my->work[0]++;
		break;
	case 2:							//FIFO解消のためにウェイト
		my->work[1]++;
		if(my->work[1] > COMM_BATTLE_START_WAIT) my->work[0]++;
		break;
	case 3:
		SetSioEndDataStart();
		my->work[0]++;
		break;
	case 4:
		if(pokemon_sio_flag==0){
			my->work[0]++;
		}
		break;
	case 5:
		if (SioTrainerInfo[0].Id & 1) {
			FightBGMSet2(MUS_BATTLE32);
		} else {
			FightBGMSet2(MUS_BATTLE20);
		}

		switch ( ScriptParameter0 ) {
		case COMM_ID_1VS1BATTLE:
			FightType = FIGHT_TYPE_TUUSHIN | FIGHT_TYPE_TRAINER | FIGHT_TYPE_1vs1;
			break;
		case COMM_ID_2VS2BATTLE:
			FightType = FIGHT_TYPE_TUUSHIN | FIGHT_TYPE_TRAINER | FIGHT_TYPE_2vs2;
			break;
		case COMM_ID_4BATTLE:
 			SortSelectPokemon();	//手持ちポケモン並び替え
			FightType = FIGHT_TYPE_2vs2 | FIGHT_TYPE_TRAINER |
				FIGHT_TYPE_TUUSHIN | FIGHT_TYPE_4_2vs2;
			break;
		}
		MainProcChange( InitFight );
		sys.pReturnProc = CommBattleEnd;
		DelTask(no);
		break;
	}
}

//=========================================================================
//	ポケモン対戦モードからの復帰処理
//=========================================================================
void CommBattleEnd( void )
{
	MapBGM_Init();				// BGM Noをクリア、最初から鳴るように
 
 	RecoverPokeParaMine();		//手持ちポケモン＆どうぐを
 	RecoverTemotiItem();		//通信開始前の状態にする
 
	FanCommBattleWinLoseChk();	//「ファン」処理
	if ( ScriptParameter0 != COMM_ID_4BATTLE ) {
		UpdateTaisenScore( comm_my_id ^ 1 );
	}
	
	sys.pReturnProc = FieldCommRecover;
	MainProcChange(CommBattleSaveInit);
//	MainProcChange( FieldCommRecover );
}

//=========================================================================
//	通信部屋から出るときによばれる処理
//	※戻り先をセット、対戦部屋の場合はポケモンやどうぐを元に戻す
//=========================================================================
void CommExitSet( void )
{
	if (ScriptParameter0 == COMM_ID_1VS1BATTLE ||
			ScriptParameter0 == COMM_ID_2VS2BATTLE ||
			ScriptParameter0 == COMM_ID_4BATTLE ) {
		RecoverPokeParaMine();		//手持ちポケモン＆どうぐを
		RecoverTemotiItem();		//通信開始前の状態にする
	}
	NextMapSetBySpID( SPFIELD_MAP_EXIT01 );
}

//=========================================================================
//	通信部屋から出るときによばれる処理
//	※通信時のフィールド制御メインを終了待ち状態に切り替える
//=========================================================================
void CommExitWait( void )
{
	CommExitWaitStart();
}

//=========================================================================
//
//	通信イベント開始処理
//	※通信部屋内での所定位置について
//	　通信イベント開始を待っているときの制御
//
//=========================================================================


enum{
	MAIN_START,			//開始
	MAIN_STARTMSG_PUT,	//MSG表示待ち→設定
	MAIN_WATCHDOG,		//全プレイヤー状態監視
	MAIN_END,			//終了
};


enum{
	WK_STAT,
	WK_MODE,
};


//-------------------------------------------------------------
//-------------------------------------------------------------
static void CommEventStartTask( u8 no )
{
	TASK_TABLE * my;
	my = &TaskTable[no];

	switch( my->work[WK_STAT] ) {

	case MAIN_START:
		FieldMsgSet( msg_reception_wait_p01 );
		my->work[WK_STAT] = MAIN_STARTMSG_PUT;
		break;

	case MAIN_STARTMSG_PUT:
		if ( FieldMsgWait() == FALSE ) break;

		CommEventWaitStart();		//通信同期シーケンス切り替え
		 /* 立ち位置情報を通信システムにわたす */
		SetMyTrainerInfoStandPos( ScriptParameter1 );
		my->work[WK_STAT] = MAIN_WATCHDOG;
		break;

	case MAIN_WATCHDOG:

		switch ( CommEventWaitCheck() ) {
		case 0:					//待ち状態
			break;
		case 1:					//開始
			FieldMsgClear();
			my->work[WK_STAT] = 0;
			ChangeBackTask(no);
			break;
		case 2:					//キャンセル
			my->work[WK_STAT] = MAIN_END;
			break;
		}
		break;

	case MAIN_END:
		CommEventWaitCancel();		//通信同期シーケンス切り替え
		FieldMsgClear();
		NMenuScreenClear();
		DelTask(no);
		ContinueFieldScript();
		break;
	}
}

//=========================================================================
//=========================================================================
//-------------------------------------------------------------
//	通信イベント開始待ちセット
//	<引数>	func	開始時に制御をわたすタスク
//-------------------------------------------------------------
void AddCommEventStartTask( pTaskFunc func )
{
	u8 no;
	no = AddTask( CommEventStartTask, TSK_PRI_EFFECT );
	ChangeTask( no, CommEventStartTask, func );
	StopFieldScript();
}

extern void KoukanMainInit();
extern u8 exchange_pokemon[];
//=========================================================================
//
//	ポケモンこうかん画面への遷移
//
//=========================================================================
static void comm_start_task( u8 no )
{
	TASK_TABLE * my;
	my = &TaskTable[no];
	switch( my->work[0] )
	{
	case 0:
		SetForceEvent();
		FieldFadeControl(FIELD_FADE_OUT, 0);
		MultiSioFunctionClear();				//通信用タスクをクリア
		my->work[0]++;
		break;
	case 1:
		if( FadeData.fade_sw == 0 ) my->work[0]++;
		break;
	case 2:
		exchange_pokemon[0]= 0;
		exchange_pokemon[1] = 0;
		m4aMPlayAllStop();
		SetSioEndDataStart();					//通信終了同期処理スタート
		my->work[0]++;
		break;
	case 3:
		if(pokemon_sio_flag==0){				//通信終了待ち
			MainProcChange(KoukanMainInit);
			DelTask(no);
		}
		break;
	};
};

//-------------------------------------------------------------
//	交換開始イベント
//-------------------------------------------------------------
void AddFadeToKoukanEventTask(void);
static void change_to_trade_task(u8 no)
{
	AddFadeToKoukanEventTask();
	DelTask(no);
}

void AddCommTradeStartTask( void )
{
	AddCommEventStartTask( change_to_trade_task );
}

void AddFadeToKoukanEventTask( void )
{
	AddTask( comm_start_task, 80 );
}

//-------------------------------------------------------------------------
//	交換開始
//-------------------------------------------------------------------------
void ChangeToKoukan( void )
{
	AddFadeToKoukanEventTask();
	StopFieldScript();
}

//-------------------------------------------------------------
//	対戦開始イベント
//-------------------------------------------------------------

//通常の対戦開始イベント
void AddCommBattleStartTask( void )
{
	PokemonSioNinshouNo = NINSHOU_BATTLEROOM;
	AddCommEventStartTask( comm_battle_start_task );
}


//-------------------------------------------------------------
//	レコードコーナー開始イベント
//-------------------------------------------------------------
extern void CommMixMainTask(u8);
void AddCommRecordStartTask( void )
{
	u8 no;
	no = AddTask( CommEventStartTask, TSK_PRI_EFFECT );
	ChangeTask( no, CommEventStartTask, CommMixMainTask );
	StopFieldScript();
}

//-------------------------------------------------------------
//	トレーナーカードの表示
//-------------------------------------------------------------
void CommTrainerCard( void )
{
	SetTrainerCardFriend( ScriptParameter2, FieldScriptRecover );
}

static const u8 rank_string[][5] = {
	{ BU_,RO_,N_,ZU_,EOM_ },
	{ KA_,TTU_,PA_,bou_,EOM_ },
	{ SI_,RU_,BA_,bou_,EOM_ },
	{ GO_,bou_,RU_,DO_,EOM_ },
};

//-------------------------------------------------------------
//	他のプレーヤーのトレーナーカード表示設定
//	<引数>	no		話し掛ける相手の通信ID
//-------------------------------------------------------------
int CommSetTalkTrainerInfo( u8 no )
{
	u8 rank;

	ScriptParameter2 = no;
	PM_strcpy( StrTempBuffer0, SioTrainerInfo[no].name );

	rank = GetMultiTrainerCardStar(no);
	if ( rank == 0 ) {
		return 0;
	} else {
		PM_strcpy( StrTempBuffer1, rank_string[rank-1] );
		return 1;
	}
}
extern void ErrGamenInit();

#define JIDOU_NINSHOU_TIMEOUT	(5*60)
// =================================================================
// JidouNinshouWatchDog
// 概要  : 自動認証の際に５秒以上経過した場合は通信エラーとする処理
// 引数  : no	タスクＩＤ
// 戻り値: none
// =================================================================
void JidouNinshouWatchDog(u8 no)
{
	TASK_TABLE *my;
	my = &TaskTable[no];

	my->work[0]++;
	
	if(my->work[0] > JIDOU_NINSHOU_TIMEOUT){			//タイムアウト処理
		PokemonMultiSioEnd();
		MainProcChange(ErrGamenInit);
		DelTask(no);
	}
	if(pokemon_sio_flag){								//通信接続認証が終了したら自分消去
		DelTask(no);
	}
}

#ifdef PM_DEBUG
void AutoKeyTask(u8 no);

// =================================================================
// AddAutoKeyTask
// 概要  : 自動キー押し処理の登録
// 引数  : none
// 戻り値: none
// =================================================================
void AddAutoKeyTask()
{
	if(CheckTask(AutoKeyTask) == 0){
		AddTask(AutoKeyTask,80);
	}
	AutoKeyTryNum++;
}

// =================================================================
// AutoKeyTask
// 概要  : 自動キー押し処理（0.5秒に一回Aボタンを押します
// 引数  : no
// 戻り値: none
// =================================================================
void AutoKeyTask(u8 no)
{
	TaskTable[no].work[0]++;
	if(TaskTable[no].work[0] == 30){
		TaskTable[no].work[0] = 0;
		VirtualKey |= A_BUTTON;
	}
}
#endif

// =================================================================
// NextTuushinSetudanTask
// 概要  : 通信切断待ちタスク
// 引数  : no
// 戻り値: none
// =================================================================
void NextTuushinSetudanTask(u8 no)
{
	if(pokemon_sio_flag==0){
		ContinueFieldScript();
		DelTask(no);
	}
}

// =================================================================
// TuusinSetuDanTask
// 概要  : 通信切断開始タスク
// 引数  : no
// 戻り値: none
// =================================================================
void TuusinSetuDanTask(u8 no)
{
	SetSioEndDataStart();
	TaskTable[no].TaskAdrs = NextTuushinSetudanTask;
}


#ifdef PM_DEBUG
u8 SioCheckFlag = 0;

void SioCheckFlagClear()
{
	SioCheckFlag = 0;
}
void SioCheckFlagOn(u8 id)
{
	SioCheckFlag |= (1<<id);
}
u8   GetSioCheckFlag()
{
	return SioCheckFlag;
}
#endif
