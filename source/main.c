//******************************************************************
//          main.c                                                  
//                                                                  
//          Copyright (C) 2001 GAME FREAK inc.
//******************************************************************

#include "common.h"
#include "intr.h"

#include "saveload.h"
#include "calctool.h"
#include "multisio.h"
#include "playtime.h"
#include "rtctool.h"
#include "mus_tool.h"

#include "db_watch.h"		//DEBUG_WATCH関連

#include "initgame.h"
#include "evobj.h"
#include "fld_sio.h"
#include "svld_ini.h"
#include "svld_sys.h"
#include "config.h"

//#define DEBUG_KEY_CONTROL

#ifdef DEBUG_KEY_CONTROL
static void INIT_DEBUG_KEY_DATA( void );
static void SET_DEBUG_KEY_DATA( void );
#else
#define INIT_DEBUG_KEY_DATA()
#define SET_DEBUG_KEY_DATA()
#endif

//---------------------- サブルーチン  -----------------------------


void InitKeyRead(void);
void KeyRead(void);

static void MainInit(void);
static void do_main( void );
static void ProcMain(void);
static void init_random(void);

extern void TitleInit(void);
extern void	OPdemoInit(void);

extern void dmaTransInit(void);			//actor.c


extern void multi_sio_func(u16 *key);
extern u8 Signal;
extern u16 SendBuf[MULTI_SIO_SEND_MAX];
extern u16 RecvBuf[MULTI_SIO_RECV_MAX][MULTI_SIO_PLAYERS_MAX];
extern u32 SioFlags;

//------------------------------------------------------------------
//	グローバル変数
//------------------------------------------------------------------
SystemArea sys;

u16	KeyRepeatSpeed;
u16	KeyRepeatStartWait;

u8 speed_up_flag;
u8 SoftResetDisable;

#define CASETTE_SPEED3_1 ( CST_ROM0_1ST_3WAIT | CST_ROM0_2ND_1WAIT | CST_PREFETCH_ENABLE )
//==================================================================
//                      メインルーチン                              
//==================================================================

void AgbMain(void)
{
//-------- 初期化 --------
	RegisterRamReset(RESET_ALL_FLAG);

	*(vu16 *)REG_WAITCNT = CASETTE_SPEED3_1;

	InitKeyRead();							// キーリード初期化
	InterruptInit();						// 割込み初期化
	m4aSoundInit();							// サウンドドライバ初期化
	RTC_Init();								// リアルタイムクロック初期化

	SaveLoadSystemInit();					// フラッシュ制御初期化
	MainInit();								// グローバル変数初期化
	BGM_SystemInit();						// ＢＧＭ制御初期化
	init_random();							// 乱数の初期化(RTCからタネを取得)

	SoftResetDisable = 0;
#if 0	
	InitGameWork();

	//データロード＆データ存在確認
	SaveLoadSysInit();
	PokeAGBLoad(POKEAGB_LDALL);
	if((SaveDataCheckInfo == SVLD_RET_NULL)			//バックアップなし（初期）
	 ||(SaveDataCheckInfo == SVLD_RET_DESTROY)){	//バックアップ完全破壊（復旧不可）
		//セーブ初期化
		SysSaveDataInit();
	}
	pokStereoMono(MyData.sound_mode);		// サウンド設定
#endif

#if 1	//製品版ではＯＮにすること！
	//フラッシュ認証失敗時はゲーム開始をしないで、ユーザーが自発的に電源を切るように誘導
	if(SaveMemType != FLASH_1M_TYPE) MainProcChange( NULL );
#endif

//-------- メイン --------
	speed_up_flag = FALSE;
	INIT_DEBUG_KEY_DATA();

	while(TRUE) {
		DEBUG_WATCH_START();

		KeyRead();							// キー情報取得

		SET_DEBUG_KEY_DATA();

        if(
			(!SoftResetDisable)&&
			(sys.RealCont&A_BUTTON)&&
			(sys.RealCont&B_BUTTON)&&
			(sys.RealCont&SELECT_BUTTON)&&
			(sys.RealCont&START_BUTTON)
			){
			PM_SoftReset();
        }


#if 0
		if ( M_s.RecvBuf.Size >= FLD_RFIFO_LIMIT_VALUE
					&& IsEnableClearRecvFifo() == TRUE ) {
			//単純に2度呼び出すRecv--;Send++;という結果になる
			speed_up_flag = FALSE;
			do_main();
			sys.Trg = 0;
			dmaTransInit();
			do_main();
		} else
#endif
		if ( M_s.SendBuf.Size >= FLD_SFIFO_LIMIT_VALUE
				&& IsEnableClearSendFifo() == TRUE ) {
			// 送信FIFO解消処理のため送信データを生成しない
			speed_up_flag = TRUE;
			do_main();
			speed_up_flag = FALSE;

		}
		else
		{
			speed_up_flag = FALSE;
			do_main();
			if ( M_s.RecvBuf.Size >= FLD_RFIFO_LIMIT_VALUE
					&& IsEnableClearRecvFifo() == TRUE ) {
					
				sys.Trg = 0;
				dmaTransInit();

				//2回目だけ送信データを生成しない
				speed_up_flag = TRUE;
				do_main();
				speed_up_flag = FALSE;
			}
		}

		PlayTimeCount();

		BGM_Main();
		
		DEBUG_WATCH_END();

		V_Wait();							// Vブランク割込終了待ち
    }
}

//------------------------------------------------------------------
//		メインループ処理
//------------------------------------------------------------------


static void do_main( void )
{
	SioFlags    = Multi_SioMain(&Signal,SendBuf, RecvBuf);			//通信処理

	multi_sio_func(&sys.Cont);

	if ( SioFlags & MULTI_SIO_FRAME_SKIP ) {
		if ( IsEnableSkipFieldMain() == TRUE ) {
			//フィールド同期中で全員から無効データを受信した場合、メイン処理をスキップする
			return;
		}
	}
	ProcMain();
}

//------------------------------------------------------------------
//		初期化ルーチン												
//------------------------------------------------------------------

void MainInit(void)
{
	sys.main_timer = 0;
	sys.vsync_counter = 0;
	sys.pFirstProc = NULL;
//	MainProcChange( TitleInit );
	MainProcChange( OPdemoInit );
}

//------------------------------------------------------------------
//		メインループ毎処理											
//------------------------------------------------------------------
void ProcMain(void)
{
	if ( sys.pFirstProc != NULL ) sys.pFirstProc();
	if ( sys.pMainProc != NULL ) sys.pMainProc();
}

//------------------------------------------------------------------
//		プロセス呼び出し関数変更
//------------------------------------------------------------------
void MainProcChange(pFunc func)
{
	sys.pMainProc = func;
	sys.InitSeqWork = 0;			//初期化シーケンス用ワーク
}

//------------------------------------------------------------------
//		乱数の初期化
//	※RTCの経過時間をタネにしている
//------------------------------------------------------------------
static void init_random(void)
{
	u32 seed;

	seed = GetRealTimeMinute();
	seed = (seed >> 16) ^ (seed & 0xffff);
	pp_srand(seed);
}

//==================================================================
//                      サブルーチン                                
//==================================================================

//------------------------------------------------------------------
//                      キー読み込み                                
//------------------------------------------------------------------

void InitKeyRead(void)
{
	KeyRepeatSpeed=KEYREPEATSPEED;			//キーリピートウェイト
	KeyRepeatStartWait=KEYREPEARSTARTWAIT;	//キーリピートが始まるまでのウェイト
    sys.Cont	=	0;
    sys.Trg		=	0;
    sys.Repeat	=	0;
    sys.RealCont=	0;
    sys.RealTrg	=	0;
}

void KeyRead(void)
{
    u16 ReadData;

//	ReadData	=	(*(vu16 *)REG_KEYINPUT ^ 0xffff);
	ReadData	=	(*(vu16 *)REG_KEYINPUT ^ 0x03ff);
	
    sys.RealTrg	=	ReadData & (ReadData ^ sys.RealCont);        // トリガ 入力

    sys.Trg		=	ReadData & (ReadData ^ sys.RealCont);        // トリガ 入力
    sys.Repeat	=	ReadData & (ReadData ^ sys.RealCont);        // リピート 入力

    if((ReadData!=0)&&(sys.Cont==ReadData)){
		if(--sys.RepeatWait==0){
			sys.Repeat		=	ReadData;
			sys.RepeatWait	=	KeyRepeatSpeed;
		}
	}
	else{
		sys.RepeatWait=KeyRepeatStartWait;
	}
    sys.RealCont=	ReadData;                                // ベタ 入力
    sys.Cont	=	ReadData;                                // ベタ 入力

	if(MyData.key_config == CNT_MD_KATATE){					//ゲーム用変換
		if(sys.Trg & L_BUTTON)	sys.Trg	|= A_BUTTON;
		if(sys.Cont & L_BUTTON) sys.Cont |= A_BUTTON;
	}
    if(sys.Trg & sys.TrgFlagMask) sys.TrgFlag = 1;				// 最初のトリガー実行判定
}




#ifdef	DEBUG_KEY_CONTROL

//==================================================================
//
//	キーデータ操作
//
//	※デバッグ用に特定のキーを押した状態を生成しつづける
//==================================================================

static u8 debug_key_mode = 0;

static unsigned long debug_rand_next = 0;

enum{
	DEBUGKEY_NO_MODE = 0,
	DEBUGKEY_A_TRIGER,
	DEBUGKEY_B_TRIGER,
	DEBUGKEY_RANDOM_UD,
	DEBUGKEY_RANDOM_LR,
	DEBUGKEY_START_TRIGER,
	DEBUGKEY_SELECT_TRIGER,
};

//------------------------------------------------------------------
//------------------------------------------------------------------


static u16 debug_rand(void)
{
    debug_rand_next = debug_rand_next *1103515245L + 12345;
    return (u16)(debug_rand_next / 65536L) % 32768U;
}

static void debug_srand(u16 seed)
{
    debug_rand_next = seed;
}

//------------------------------------------------------------------
//------------------------------------------------------------------

static void INIT_DEBUG_KEY_DATA( void )
{
	debug_key_mode = DEBUGKEY_NO_MODE;
}

//------------------------------------------------------------------
//	キーデータ変更処理メイン
//------------------------------------------------------------------
static void SET_DEBUG_KEY_DATA( void )
{
	if ( (sys.Cont&L_BUTTON) && (sys.Cont&R_BUTTON) ) {
		if ( sys.Cont & B_BUTTON ) {
			debug_srand( pp_rand() );
			debug_key_mode = DEBUGKEY_NO_MODE;
		}
		else if ( sys.Cont & A_BUTTON ) {
			debug_srand( pp_rand() );
			debug_key_mode = DEBUGKEY_A_TRIGER;
		}
		else if ( sys.Cont & U_KEY ) {
			debug_key_mode = DEBUGKEY_RANDOM_UD;
		}
		else if ( sys.Cont & L_KEY ) {
			debug_key_mode = DEBUGKEY_RANDOM_LR;
		}
		else if ( sys.Cont & START_BUTTON ) {
			debug_key_mode = DEBUGKEY_START_TRIGER;
		}
		else if ( sys.Cont & SELECT_BUTTON ) {
			debug_key_mode = DEBUGKEY_B_TRIGER;
			//debug_key_mode = DEBUGKEY_SELECT_TRIGER;
		}
	}

	switch ( debug_key_mode ) {

	case DEBUGKEY_NO_MODE:
		break;

	case DEBUGKEY_A_TRIGER:
		sys.Trg = A_BUTTON;
		sys.Cont = 0;
		break;

	case DEBUGKEY_B_TRIGER:
		if (debug_rand() & 0x1100) {
			sys.Trg = B_BUTTON;
		} else {
			sys.Trg = 0;
		}
		sys.Cont = 0;
		break;

	case DEBUGKEY_RANDOM_UD:
		sys.Trg = 0;
	//	if ( sys.vsync_counter % 64 < 32 ) {
		if ( debug_rand() & 0x100 ) {
			sys.Cont = U_KEY;
		} else {
			sys.Cont = D_KEY;
		}
		sys.Trg = B_BUTTON;
		break;

	case DEBUGKEY_RANDOM_LR:
		sys.Trg = 0;
	//	if ( sys.vsync_counter % 64 < 32 ) {
		if ( debug_rand() & 0x200 ) {
			sys.Cont = L_KEY;
		} else {
			sys.Cont = R_KEY;
		}
		break;

	case DEBUGKEY_START_TRIGER:
		sys.Trg = START_BUTTON;
		sys.Cont = 0;
		break;

	case DEBUGKEY_SELECT_TRIGER:
		if ( debug_rand() & 0x200 ) {
			sys.Trg = SELECT_BUTTON;
		} else {
			sys.Trg = START_BUTTON;
		}
		sys.Cont = 0;
		break;
	}
}

#endif

