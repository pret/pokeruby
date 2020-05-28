/*==========================================================================*/
/*	cable.c																	*/
/*																			*/
/*												GameFreak inc.				*/
/*												2001/08/??					*/
/*==========================================================================*/


//選択はキャンセルされました。

//------------------------------------------------------------------------------------
//  デバッグ用の定義
//------------------------------------------------------------------------------------
#define  CABLE_C						//extern宣言を実体化させないための宣言
#define  DEBUG_PRINT					//ﾃﾞﾊﾞｯｸﾞ情報を表示させる宣言
#define  DEBUG_NUMPRINT					//ﾃﾞﾊﾞｯｸﾞ情報を外部から呼び出して表示させる宣言
#define  ERROR_CHECK					//通信エラーが起きた際に即エラー画面に飛ばすかどうか
//#define  USERWORK_TEST

//------------------------------------------------------------------------------
//include
//------------------------------------------------------------------------------
#include "common.h"
#include "evobj.h"


#include "multisio.h"
#include "intr.h"
#include "jiki.h"

#include "print.h"
#include "menu.h"
#include "pokesio.h"
#include "calctool.h"
#include "decord.h"
#include "..\graphic\pokegra.h"
#include "mus_tool.h"
#include "pm_str.h"

#include "task.h"
#include "actor.h"
#include "actanm.h"
#include "Madefine.h"
#include "palanm.h"

#include "seed.h"
#include "cubecase.h"
#include "cube_def.h"
#include "screen.h"
#include "svld_ini.h"
#include "svld_sys.h"
#include "server.h"
#include "fight.h"

#include "ex_load.h"
#include "fld_sio.h"


//----------------------------------------------------------------------------
//  デバッグ表示用の宣言
//----------------------------------------------------------------------------
#ifdef DEBUG_NUMPRINT
#include "numfont.acl"
#include "numfont.ach"
u32 debugnum[MULTI_SIO_PLAYERS_MAX];
u32  DebugWork0;
u32  DebugWork1;
u8   TimerPutFlag = 0;
u8   RenzokuExchangeFlag = 0;
u16  RenzokuExchangeWait = 0;
u16  RenzokuExchangeStat = 0;
u16	 checksumwork[4];
u8	 SioEndFlag;
u8 	 SioMemberNumberCheck;
#endif
u32 	BlendMachineCount = 0;

//----------------------------------------------------------------------------
//  UserWorkを利用するデバッグ定義の宣言
//----------------------------------------------------------------------------


/*/=========================================================================*/
/*	extern 宣言																*/
/*/=========================================================================*/
extern s16  GetPlusLine();
extern s16  GetMinusLine();
extern void SetPlusLine(s16 no);
extern void SetMinusLine(s16 no);
extern void FuncSeed2Cube(u16 *mix, CUBE *newcube, u8 num, u8 *calc);
extern u8   SioStopFlag;
extern u8 	CasetteLanguage;
extern u8 	SoftResetDisable;

extern u8		SaveExtraSector(u8 sector_num, u8 *p);
extern u8		LoadExtraSector(u8 sector_num, u8 *p);

/*/=========================================================================*/
/*	定義																	*/
//==========================================================================*/




//テスト用に送信データのサイズ
#define TESTSEND_SIZE (200)


/*==========================================================================*/
/*  文字列宣言																*/
/*==========================================================================*/
//	#define name value	

//typedef ...


static const u8 setuzoku_text[][12]={
	{se_,tu_,zo_,ku_,spc_,ti_,yyu_,u_,de_,su_,EOM_},		//「接続中です」
	{se_,tu_,zo_,ku_,spc_,de_,ki_,ma_,se_,n_,EOM_},			//「接続できません」
	{ka_,ku_,ni_,n_,spc_,ti_,yyu_,u_,de_,su_,EOM_},			//「確認中です」
	{ka_,ku_,ni_,n_,spc_,de_,ki_,ma_,si_,ta_,EOM_},			//「確認できました」
	{ka_,ku_,ni_,n_,spc_,de_,ki_,ma_,se_,n_,EOM_},			//「確認できません」
	{ka_,ku_,ni_,n_,spc_,wo_,spc_,ka_,ku_,ni_,n_,EOM_},		//「確認を確認」
	{ka_,ku_,ni_,n_,spc_,ha_,spc_,si_,ttu_,pa_,i_,EOM_},	//「確認は失敗」
};

//「つうしんエラーがはっせいしました」
static const u8 err_msg[]={CTRL_,C_BCOL_,COL_NUKE,CTRL_,C_FCOL_,COL_WHITE,tu_,u_,si_,n_,E_,RA_,bou_,ga_,spc_,ha_,ttu_,se_,i_,si_,ma_,si_,ta_,CR_,
							KE_,bou_,BU_,RU_,wo_,spc_,se_,tu_,zo_,ku_,si_,te_,CR_,
							de_,n_,ge_,n_,wo_,spc_,i_,re_,na_,o_,si_,te_,ku_,da_,sa_,i_,EOM_,};

//エラー数字カラー指定コマンド
static const u8 err_num[]={CTRL_,C_BCOL_,COL_NUKE,CTRL_,C_FCOL_,COL_WHITE,EOM_};



//---------------------------------------------------------------------------
//  大量データ送受信管理用ワークstruct定義
//---------------------------------------------------------------------------
typedef struct{
	u16 count;					//現在の送信回数
	u16 max;					//最大送信回数
	u8 *p;						//送信するデータのﾎﾟｲﾝﾀ
	u8  flag;					//作動中かどうかのフラグ
	u8  Id;						//ID（現在未使用）
	u16 etc;					//４バイト境界に合わせるためのつめもの
}NUMEROUS_DATA;


//---------------------------------------------------------------------------
//  プロトタイプ宣言
//---------------------------------------------------------------------------
static NUMEROUS_DATA NumerousInfo;								//自分の送信情報
static NUMEROUS_DATA OtherNumerousInfo[MULTI_SIO_PLAYERS_MAX];	//他人の送信情報
static u32	NumerousWait;						//データ分割送信用ウェイト
static u32 	MultiSioPauseWait;
static u32	MultiSioPauseFlag;					//管理上必要になりました。
static u32	PokemonSioCheckFlag;
static u32  HozonSioFlags;
static u32  HozonRecvSize;
static u32  HozonSendSize;
static u32	count;


u8 MultiSioMainCheck(void);
u8 SioParentConnectCheck(void);
u8 SioChildConnectCheck(void);
void SplitDataResultSet(u8 id);
void kanshi_network(u8 taskno);
void SetSioEndDataStart();
void SetSioPauseStart();
void HusiginaDekigotoGamenMain();

#ifdef PM_DEBUG
extern void SioCheckFlagClear();
extern void SioCheckFlagOn(u8 id);
#endif
//=========================================================================
//	変数
//=========================================================================
//GLOBAL type valiable;
//-------------------- グローバル 変数  ----------------------------

    u16  SendBuf[MULTI_SIO_SEND_MAX];   						// ユーザ送信バッファ
    u16  RecvBuf[MULTI_SIO_RECV_MAX][MULTI_SIO_PLAYERS_MAX];	//通信データ受信バッファ

	u16  RecvPoolBuf[MULTI_SIO_PLAYERS_MAX][SPLITDATA_POOL_SIZE/2];	//NumerousSend用送信バッファ
	u8   SendPoolBuf[SPLITDATA_POOL_SIZE];							//NumerousSend用受信バッファ
	
	u8   Signal;							// 通信状態通知フラグ

	u8   pokemon_sio_flag;				//ポケモン通信フラグ

    u32  SioFlags;                          // 通信状態フラグ
    u32  SioFlagsBak;
	u16  RecvData[MULTI_SIO_PLAYERS_MAX];	//通信によってもらってるキーデータ(0-3)
	
	u8   multisio_start_flag=OFF;			//通信処理開始フラグ（通信OKではなくただ始めるフラグ）
	u8   SendXydataFlag;					//場所交換フラグ
	u8   sio_windowclear_flag;				//接続確認ウインドウ消去フラグ
	u16  keydat;
	u8   TransListNo;						//データ交換コマンドで交換内容を指定(TransList[])
	u8   SioReliableNumber;					//前回の通信で取得した信頼できる接続人数
	u8   SioReliableId;						//全開の通信でしゅとくした信頼できる接続ＩＤ


	u16		PokemonSioNinshouNo;				//通信開始の際に認証（主に部屋を指定）に使用
	u16		PokemonSioCheckCount;
	u8		PokemonSioCheckTask;

	SIOTRAINER_INFO SioTrainerInfo[MULTI_SIO_PLAYERS_MAX];		//通信認証時に取得するトレーナー情報
	SIOTRAINER_INFO ReliableMemberInfo[MULTI_SIO_PLAYERS_MAX];	//一回目の通信認証で取得した信頼できるメンバー
	u8		MultiSioInitialFlag[MULTI_SIO_PLAYERS_MAX];
	u8		MultiSioEndFlag[MULTI_SIO_PLAYERS_MAX];
	u8		MultiSioSynchroFlag[MULTI_SIO_PLAYERS_MAX];

	SIOTRAINER_INFO MyTrainerInfo;
	SEND_SIO_CODE	SendTrainerInfo;

	u32  	SioRecoverWait;
	u8		TestCasetteLanguage;
	u8		SioErrorPermitFlag;								//通信エラー画面に飛ばしていいかフラグ
	u8 		SioErrorFlag;									//通信エラーフラグ
	u8      SplitDataFuncFlag[4];						//データ分割通信処理終了フラグ
#ifdef PM_DEBUG
	u16 SioWatchCount=0;
#endif

//--------------------------------------------------------------------------
//  データ交換（同時送信）用リストデータ構造体
//--------------------------------------------------------------------------
typedef struct{
	const u8  *pointer;
	      u16 size;
}TRANSLIST;

static const u32	TransList[][2]=
{
	{(u32)SendPoolBuf,	200	},
	{(u32)SendPoolBuf,	200	},
	{(u32)SendPoolBuf,	100	},
	{(u32)SendPoolBuf,	220	},	
	{(u32)SendPoolBuf,	40	},

};


//=========================================================================
//  extern変数
//=========================================================================
extern u8    dmy_string[];
extern const ActOamData Oam32x32;
extern u16   ReturnItemNo;

//---------------------- サブルーチン  -----------------------------


//=========================================================================
//  extern関数
//=========================================================================
extern void SetOthersJikiAct( MvCmd *myst, s16 px, s16 py );
extern void make_key_string();
extern void BlendMachineMemberItem(u8 Id, u16 ItemNo);

//=========================================================================
//	関数プロトタイプ
//=========================================================================
//GLOBAL type function(arg...);

void Cable2Main(void);
void BlendMachineFunction_Set();
u16 CheckSumMake(u16 *p, u16 size);
void kanshi_num_set(u32 w0, u32 w1);
void ErrGamenInit();
void ErrGamenMain();



static void RecvDataFunc(u8	Id);
static void	SetSendBuf(u16 command);
//static void counter_kanshi(u8 id);
static void VInterFunc( void );
static void PokemonIdKoukanOya();
static void SetMultiSioMyData();
static void SioErrCheck();
static void NumerousSendFuncEnd();


//static void TestSendDataFunc();

//--------------------------------
//
//--------------------------------
static void FieldCommandExchangeFunc();
//static void 	get_TrainerInfo(u8 w);

static void NumerousInfoInit();
static u8 SetNumerousData(u8 *pointer, u32 size);
static void NumerousSendFunc();
static void NumerousSendFuncInit();


static void SioEndDataWait();
static void SetSioEndDataSend();
static void SioSynchronizeWait();
static void SioSynchronize();


#ifdef DEBUG_NUMPRINT
static void numput(u8 num, u8 x, u8 y);
void numprint(u32 num, u8 x, u8 y, u8 keta);
#endif


//----------------------------------
//通信タスク実行用関数ポインタ		
//----------------------------------
void (*PokemonMultiSioFunc)();



//-----------------------------------------------------------
//    アクターデータ
//-----------------------------------------------------------





//-------------------------------------------------------------------------
//  通信接続前にケーブルの挿入状態から親子を判断
//-------------------------------------------------------------------------
void CheckParent(u8 id)
{
	u16 flag;

	flag = ((SioMultiCnt *)REG_SIOCNT)->SI;

	DelTask(id);
}


static const u8 name_name[]={TE_,SU_,TO_,na_,EOM_};

//-------------------------------------------------------------------------
//
//  ﾃﾞﾊﾞｯｸﾞ用数字列表示ﾙｰﾁﾝ初期化
//
//-------------------------------------------------------------------------
void DebugNumPrintInit(u8 pal, u8 select, u8 screen, u8 chara)
{
//	PaletteWorkSet(numfont_Palette,pal*32,32);
//	PaletteWorkSet(numfont_Palette,pal*(16)*2,2);
//	PaletteWorkSet(&numfont_Palette[15],pal*(16+15)*2,2);
	PaletteWorkSet(numfont_Palette,pal*(16),32);
	DmaArrayCopy(3 , numfont_Character , 	(BG_VRAM+0x4000*chara),16);
	debugnum[0] = screen;
	debugnum[1] = pal;

	switch(select){
		case 1:
		*(vu16 *)REG_BG1CNT = BG_COLOR_16					//16色選択
					| BG_SCREEN_SIZE_0				// スクリーンサイズ
					| BG_PRIORITY_1					//BG優先順位
					| screen << BG_SCREEN_BASE_SHIFT	//スクリーンベースブロック
					| chara << BG_CHAR_BASE_SHIFT ;		//キャラクタベースブロック
		break;
		case 2:
		*(vu16 *)REG_BG2CNT = BG_COLOR_16					//16色選択
					| BG_SCREEN_SIZE_0				// スクリーンサイズ
					| BG_PRIORITY_1					//BG優先順位
					| screen << BG_SCREEN_BASE_SHIFT	//スクリーンベースブロック
					| chara << BG_CHAR_BASE_SHIFT ;		//キャラクタベースブロック
		break;
		case 3:
		*(vu16 *)REG_BG3CNT = BG_COLOR_16					//16色選択
					| BG_SCREEN_SIZE_0				// スクリーンサイズ
					| BG_PRIORITY_1					//BG優先順位
					| screen << BG_SCREEN_BASE_SHIFT	//スクリーンベースブロック
					| chara << BG_CHAR_BASE_SHIFT ;		//キャラクタベースブロック
		break;
	}
}

void DebugNumPrintInit2(u8 pal, u8 select, u8 screen, u8 chara)
{
//	PaletteWorkSet(numfont_Palette,pal*(16)*2,2);
//	PaletteWorkSet(&numfont_Palette[15],pal*(16+15)*2,2);
	PaletteWorkSet(numfont_Palette,pal*(16),32);
	DmaArrayCopy(3 , numfont_Character , 	(BG_VRAM+0x4000*chara),16);
	debugnum[0] = screen;
	debugnum[1] = pal;
	*(RegBGctrl[select]) = BG_COLOR_16
					| BG_SCREEN_SIZE_0				// スクリーンサイズ
					| BG_PRIORITY_0					//BG優先順位
					| screen << BG_SCREEN_BASE_SHIFT	//スクリーンベースブロック
					| chara << BG_CHAR_BASE_SHIFT ;		//キャラクタベースブロック
}

//=========================================================================
//「せつぞくじっけん」画面初期化
//=========================================================================
void Cable2MainInit(void)
{
	int i;

	InitActor();				//アクター初期化
	ObjPalManInit();			//OBJパレットマネージャー初期化
	InitTask();


	SetVBlankFunc(VInterFunc);

	PrintScreenInit(FIELD_MENU_TYPE);
	NMenuScreenInit(FIELD_MENU_TYPE);



	NumerousInfoInit();

	PokemonSioNinshouNo = NINSHOU_KOUKAN;
	PokemonMultiSioInit();

	pp_srand(sys.main_timer);
	for(i=0;i<MULTI_SIO_PLAYERS_MAX;i++)
		MyData.ID[i] = pp_rand()%256;

#ifdef DEBUG_NUMPRINT
		DebugNumPrintInit(0,2,4,0);
		
#endif
	

	*(vu16 *)REG_DISPCNT = 	DISP_MODE_0					// BGモード 
                          |	DISP_OBJ_CHAR_1D_MAP		// OBJ1次元ﾏｯﾋﾟﾝｸﾞ
						  | DISP_BG0_ON					// BG0有効
						  | DISP_BG2_ON					// BG2有効
						  | DISP_OBJ_ON;

	AddTask(CheckParent,0);




	MainTask();
	JumpActor();
	SetActor();
	PaletteAnime();
	
	count = 0;
	
	
	SetMultiSioMyData();
	AddTask(kanshi_network,0);
	MainProcChange(Cable2Main);
};


// =================================================================
// SetMyTrainerInfoStandPos
// 概要  : 立ち位置情報をセット
// 引数  : num
// 戻り値: none
// =================================================================
void SetMyTrainerInfoStandPos(u8 num)
{
	MyTrainerInfo.StandPos = num;

}

//=========================================================================
//  自分用データセット
//=========================================================================
static void SetMultiSioMyData()
{
	int i;
	MyTrainerInfo.Id = MyData.ID[0]|MyData.ID[1]<<8|MyData.ID[2]<<16|MyData.ID[3]<<24;		//親機用
	for(i=0;i<11;i++)
		MyTrainerInfo.name[i] = MyData.my_name[i];
	MyTrainerInfo.sex       = MyData.my_sex;
	MyTrainerInfo.ninshou   = PokemonSioNinshouNo;
//	MyTrainerInfo.INCode    = CasetteLanguage+TestCasetteLanguage;			//国際コード埋めこみ
	MyTrainerInfo.INCode    = CasetteLanguage;								//国際コード埋めこみ
	MyTrainerInfo.Version   = CasetteVersion+POKEMON_GENERATION_CODE;		//カセットバージョン
	MyTrainerInfo.ExtraCode = ZUKAN_CODE;
	
	//立ち位置情報がこの前にセットされています。
}

/********************************************************************/
/*                                                                  */
/*				割り込み											*/
/*                                                                  */
/********************************************************************/
static void VInterFunc( void )
{
	actOAMtrans();						//ｱｸﾀｰ転送処理1
	actDMAtrans();						//ｱｸﾀｰ転送処理2
	PaletteFadeTrans();
}


void MultiSioStartFunc()
{
	int i;
	for(i=0;i<MULTI_SIO_SEND_MAX;i++) SendBuf[i] = EMPTY_DATA;	//送信ﾊﾞｯﾌｧは無効ﾃﾞｰﾀで埋めておく
	multisio_start_flag=ON;
	Multi_SioInit();


}


//-------------------------------------------------------------------------
//  通信開始をドライバに伝えるためのタスク
//-------------------------------------------------------------------------
static void MultiSioSignalOn(u8 task)
{
	if(++TaskTable[task].work[0]==WAIT_MULTISIO_START){
		Signal = SIGNAL_DECISION;							//通信認証開始
		DelTask(task);
	}
}
//-------------------------------------------------------------------------
//  ポケモン通信開始関数
//-------------------------------------------------------------------------
void PokemonMultiSioInit()
{
	int i;
	Multi_SioGameInit();
	MultiSioStartFunc();
	PokemonMultiSioFunc = PokemonIdKoukanOya;
	SioStopFlag  = 0;
	SioErrorFlag = 0;
	SioErrorPermitFlag = 0;
	SplitDataResultReset();
#ifdef PM_DEBUG
	CpuClear(0,UserWork,16*0x400,16);
	SioWatchCount=0;
	SioCheckFlagClear();
#endif

	MultiSioPauseWait = 0;
	SendXydataFlag    = 0;
	SioEndFlag = 0;

	pokemon_sio_flag=0;
	for(i=0;i<MULTI_SIO_PLAYERS_MAX;i++){
		MultiSioInitialFlag[i] = 1;
		MultiSioEndFlag[i]     = 0;
	}
	AddTask(MultiSioSignalOn,2);
//	Signal = SIGNAL_DECISION;
}

//-------------------------------------------------------------------------
//  ポケモン通信終了関数
//-------------------------------------------------------------------------
void PokemonMultiSioEnd()
{
	pokemon_sio_flag = 0;
	multisio_start_flag=OFF;
	Multi_SioStop();
//	for(i=0;i<MULTI_SIO_PLAYERS_MAX;i++)
//		MultiSioEndFlag[i] = 0;
}
static u8 mycount;
static u8 othercount[MULTI_SIO_PLAYERS_MAX];

//-------------------------------------------------------------------------
//  通信データ表示ウインドウ
//-------------------------------------------------------------------------
static void MakeCableInfoWindow(u8 x, u8 y, u16 count)
{
	u8  i, result;
	
	if(mycount!=NumerousInfo.count){
		numprint(NumerousInfo.count, 2,3,2);
		mycount = NumerousInfo.count;
	}

	for(i=0;i<4;i++){
		if(othercount[i]!=OtherNumerousInfo[i].count){
			numprint(OtherNumerousInfo[i].count, 2,4+i,2);
			othercount[i] = OtherNumerousInfo[i].count;
		}
	}
	
	result = SplitDataResult();
	if(result==0xf){
		for(i=0;i<4;i++){
			if((result>>i)&1){
				checksumwork[i] = CheckSumMake(RecvPoolBuf[i],OtherNumerousInfo[i].max);
				SplitDataResultReset2(i);
				if(checksumwork[i]!=0x342){
					TimerPutFlag = 0;
					RenzokuExchangeFlag = 0;
				}
			}
		}
		
	}

};



// =================================================================
// mainpadfunc
// 概要  : 「つうしんじっけん２」用パッド処理
// 引数  : none
// 戻り値: none
// =================================================================
static void mainpadfunc()
{
	if(sys.Trg & A_BUTTON){
		Signal = SIGNAL_DECISION;
//		ConnectInfoWindowPut(0, 10, 0);
//		MultiSioStartFunc();
	}
	if(sys.Cont&B_BUTTON){
//		memcpy((u8*)&UserWork[0x4000],ExtraDataStartMugenTicketScript, 
//			(u32)(ExtraDataEndMugenTicketScript-ExtraDataStartMugenTicketScript));
		SetNumerousData((u8*)&UserWork[0x4000],0x2004);
//		TimerPutFlag = 1;
//		RenzokuExchangeFlag=1;
//		SplitDataExchangeStart(0);
	}
	if(sys.Trg&L_BUTTON){
//		SplitDataResultReset();
		PaletteFadeReq(0xffffffff,0,16,0,2);
	}
	if(sys.Trg&START_BUTTON){
		MultiSioErrorPermit(SIO_ERROR_NO_JUMP);

//		for(i=0;i<TESTSEND_SIZE/2;i++)
//		{
//			RecvPoolBuf[0][i] = 0;
//			RecvPoolBuf[1][i] = 0;
//			RecvPoolBuf[2][i] = 0;
//			RecvPoolBuf[3][i] = 0;
//		}
//		Signal = SIGNAL_DECISION;
//		AddTask(ExchangeCampaignFlag,0);
	}
	if(sys.Trg&R_BUTTON){
		PokeAGBSave( POKEAGB_SVFLD );			//セーブ
//		ClearSioTrainerInfo();
	}
	if(sys.Trg&SELECT_BUTTON){
		SetSioEndDataStart();
	}
	if(TimerPutFlag)
//		kanshi_num_set(sys.main_timer,SioMemberNumberCheck);
		kanshi_num_set(sys.main_timer,SioStopFlag|(PokemonMultiSioFunc==NULL)<<4);
}




//-------------------------------------------------------------------------
//「せつぞくじっけん」画面メインルーチン
//-------------------------------------------------------------------------
void Cable2Main(void)
{
	

	mainpadfunc();

	MakeCableInfoWindow( 1, 1,0);

	MainTask();
	JumpActor();
	SetActor();
	PaletteAnime();

};


/*==================================================================*/
/*通信ﾒｲﾝ関数														*/
/*==================================================================*/
u16 multi_sio_func(u16	*key)
{
	u8 	i,Id;

	if(multisio_start_flag==OFF) return 0;
	
//    SioFlagsBak = SioFlags;
    

	for(i=0;i<MULTI_SIO_RECV_MAX;i++) SendBuf[i] = INVALID_DATA;

	keydat = *key;									//使うかどうかわからないけどとにかくキーデータを保存
	/*-------通信結果監視処理----------*/
		if(SioFlags&MULTI_SIO_MAIN_SEQ){
		    Id = ((SioMultiCnt *)REG_SIOCNT)->ID;	//IDを一時変数へ
			RecvDataFunc(Id);						//受信処理
			if(PokemonMultiSioFunc!=NULL){			//通信用ﾀｽｸ処理
				(*PokemonMultiSioFunc)();
			}
#ifdef ERROR_CHECK
			SioErrCheck();								//通信エラー・抜き差しエラーチェック
#endif
		}
		
//      SendBuf[0]=keydata;
//        MultiSioSendDataSet((void*)SendBuf);        // マルチプレイ通信 送信データセット


	return SioFlags;
}


// =================================================================
// WaitFirstInfoEnd
// 概要  : 通信全台が初期データを送ってきたかを待つ
// 引数  : Id
// 戻り値: none
// =================================================================
static void WaitFirstInfoEnd(u8 Id)
{
	int i,w;

	w=0;
	MultiSioInitialFlag[Id]=0;
	for(i=0;i<GetSioRealConnectNumber();i++){
		w+=MultiSioInitialFlag[i];
	}
	if(w==0){
		if(pokemon_sio_flag==OFF) pokemon_sio_flag = ON;
	}


}
#ifdef USERWORK_TEST
// =================================================================
// PutUserWorkTest
// 概要  : UserWorkに通信データを展開するテスト
// 引数  : none
// 戻り値: none
// =================================================================
static void PutUserWorkTest()
{
	u16 i,*p;
	if(SioWatchCount<0x400){	
		p = (u16*)&UserWork[16*SioWatchCount];
		for(i=0;i<4;i++){
			p[i*2]   = RecvBuf[0][i];
			p[i*2+1] = RecvBuf[1][i];
		}
		SioWatchCount++;
	}
}
#endif
/*==================================================================*/
/*      通信データの内容によって処理を分岐させる					*/
/*==================================================================*/
static void RecvDataFunc(u8	Id)
{
	u16 w,i,*p;
	SEND_SIO_CODE *ssc;

#ifdef USERWORK_TEST
	PutUserWorkTest();
#endif
	for(w=0;w<4;w++){
		RecvData[w] = INVALID_DATA;
		//未送信データが格納されていたら処理をその回はデータが受信されなかったとして飛ばす
		if(RecvBuf[0][w]==INVALID_DATA)	continue;
			
		switch(RecvBuf[0][w])		//コマンド毎に分岐
		{
			case NINSHOU_REQ:									//ポケモン通信認証コマンドなら
				SetMultiSioMyData();							//SIOTRAINER_INFOの送信準備
				SendTrainerInfo.STInfo = MyTrainerInfo;
				strcpy(SendTrainerInfo.CompanyName1,COMPANY_NAME);
				strcpy(SendTrainerInfo.CompanyName2,COMPANY_NAME);
				SetNumerousData((u8*)&SendTrainerInfo,sizeof(SEND_SIO_CODE));	//SEND_SIO_CODE送信
				break;
			case SEND_KEYDATA:								//送信データはキーデータのみ
					RecvData[w] = RecvBuf[1][w];
				break;

			case SEND_POSITION_DATA:						//このデータは子が受け取る
				SendXydataFlag = ON;
				break;

			case RECV_POSITION_DATA:						//このデータは親が受け取る
				SendXydataFlag = ON;
				break;

			case NUMEROUS_SEND:								//大容量転送コマンド受信
				OtherNumerousInfo[w].count = 0;			
				OtherNumerousInfo[w].max   = RecvBuf[1][w];	//送信バイト数
				OtherNumerousInfo[w].Id    = RecvBuf[2][w];	//送信者のID+0x80
				break;

			case SPLITDATA_SEND:							//大量データ受信
				if(OtherNumerousInfo[w].max>SPLITDATA_POOL_SIZE){				//どデカイ受信処理（カードＥ用）
					p = (u16*)UserWork;
					for(i=0;i<MULTI_SIO_SEND_MAX-1;i++){
						p[OtherNumerousInfo[w].count/2+i] = RecvBuf[1+i][w];	
					}
				}else{
					for(i=0;i<MULTI_SIO_SEND_MAX-1;i++){
						RecvPoolBuf[w][OtherNumerousInfo[w].count/2+i] = RecvBuf[1+i][w];	
					}
				}
				OtherNumerousInfo[w].count+=(MULTI_SIO_SEND_MAX-1)*2;
				if(OtherNumerousInfo[w].count>=OtherNumerousInfo[w].max){
					if(MultiSioInitialFlag[w]==1){
						ssc = (SEND_SIO_CODE*)&RecvPoolBuf[w];
						memcpy((u8*)&SioTrainerInfo[w],(u8*)&(ssc->STInfo),sizeof(SIOTRAINER_INFO));
						if(strcmp(ssc->CompanyName1,COMPANY_NAME) || strcmp(ssc->CompanyName2,COMPANY_NAME)){
							MainProcChange(ErrGamenInit);
						}else{
							WaitFirstInfoEnd(w);
						}
					}else{
						SplitDataResultSet(w);					//終了フラグを立てる
#ifdef PM_DEBUG
						SioCheckFlagOn(w);
#endif
					}
				}
				break;
			case SIO_END_DATA:								//終了同期コマンド
				MultiSioEndFlag[w] = 1;
				break;
			case SEND_SYNCRO_DATA:
				MultiSioSynchroFlag[w] = 1;					//FIFO遅延解消同期コマンド
				break;

			case SEND_ITEM_START:							//ブレンドマシーン用初期化コマンド
					BlendMachineFunction_Set();
				break;

			case SEND_ITEM_DATA:							//ブレンドマシーン用初期化コマンド
				BlendMachineMemberItem(w,RecvBuf[1][w]);
				break;
			case EXCHANGE_DATA:								//データ同時交換開始コマンド
				SplitDataSendStart(0,(u8*)TransList[RecvBuf[1][w]][0],(u16)TransList[RecvBuf[1][w]][1]);
				break;

			case SEND_FLDCMD_DATA:							//動作コード交換コマンド
					RecvData[w] = RecvBuf[1][w];
				break;
		}
	}
	


}


/*==================================================================*/
//コマンドを送信する
//
//
//  SendBuf[0]:	データの意味を示すコマンドが入る
//  SendBuf[1]: [0]のコマンドによって意味が変わる
//  SendBuf[2]-[]:  だいたい実データが入る
/*==================================================================*/
extern u8 speed_up_flag;
extern u16 my_command;
static void	SetSendBuf(u16 command)
{
	u8 i;

	switch(command){
		case NINSHOU_REQ:						//認証ﾘｸｴｽﾄ
			SendBuf[0] = command;
			SendBuf[1] = PokemonSioNinshouNo;
			break;
		case SEND_KEYDATA:						//ｷｰﾃﾞｰﾀ送信
			SendBuf[0] = command;
			SendBuf[1] = sys.Cont;
			break;
		case SEND_POSITION_DATA:				//主人公座標ﾃﾞｰﾀ
			SendBuf[0] = command;
			break;
		case SEND_SYNCHRO_KEYDATA:				//同期版ｷｰﾃﾞｰﾀ
			SendBuf[0] = command;
			SendBuf[1] = 0;
			break;
		case TESTDATA_SEND:						//テストデータ送信
			SendBuf[0] = command;
			for(i=0;i<5;i++)
				SendBuf[1+i] = 0xee;
			break;
		case RECV_POSITION_DATA:				//ｷｰ操作同期時の初期座標交換ｺﾏﾝﾄﾞ
			SendBuf[0] = command;
			break;	
		case NUMEROUS_SEND:						//大容量転送コマンド
			SendBuf[0] = command;
			SendBuf[1] = NumerousInfo.max;
			SendBuf[2] = NumerousInfo.Id+0x80;
			break;
		case SEND_ITEM_START:					//アイテム交換開始コマンド（きのみブレンダー）
			SendBuf[0] = command;
			break;
		case SEND_ITEM_DATA:					//アイテム交換コマンド（きのみブレンダー）
			SendBuf[0] = command;
			SendBuf[1] = ReturnItemNo;
			break;
		case EXCHANGE_DATA:						//大量データ交換開始コマンド
			SendBuf[0] = command;
			SendBuf[1] = TransListNo;
			break;
		case SIO_END_DATA:							//通信終了コマンド
			SendBuf[0] = command;
			break;
		case SEND_SYNCRO_DATA:
			SendBuf[0] = command;
			break;
		case SEND_FLDCMD_DATA:					//動作コード交換コマンド
			if(my_command!=INVALID_DATA &&
					speed_up_flag == FALSE ){
				SendBuf[0] = command;
				SendBuf[1] = my_command;
			}
	}
}

/*==================================================================*/
/*		    フィールド通信ルーチンに切り替える						*/
/*==================================================================*/
void MultiSioFieldSyncStart()
{
	PokemonMultiSioFunc = FieldCommandExchangeFunc;
}

// =================================================================
// IsMultiSioFieldSyncMode
// 概要  : フィールド同期モードか
// 引数  : none
// 戻り値: int	TRUEかFALSE
// =================================================================
int IsMultiSioFieldSyncMode()
{
	if ( PokemonMultiSioFunc == FieldCommandExchangeFunc )
		return TRUE;
	else 
		return FALSE;
}

/*------------------------------------------------------------------*/
/*	フィールドプレイヤーの動作コード交換処理						*/
/*------------------------------------------------------------------*/
static void FieldCommandExchangeFunc()
{
	if ( pokemon_sio_flag == ON ) {
		SetSendBuf( SEND_FLDCMD_DATA ); //動作コード交換コマンド
	}
}


// =================================================================
// BlendMachineFunctionClear
// 概要  : 通信用関数ポインタをクリアする(きのみブレンダー用)
// 引数  : none
// 戻り値: none
// =================================================================
void BlendMachineFunctionClear()
{
	PokemonMultiSioFunc = NULL;
}

// =================================================================
// MultiSioFunctionClear
// 概要  : PokemonMultiSioFuncにNULLを代入する
// 引数  : none
// 戻り値: none
// =================================================================
void MultiSioFunctionClear()
{
	PokemonMultiSioFunc = NULL;
}

/*----------------------------------------------------------------------------------*/
/*  現在通信接続している人数を返します。											*/
/*																					*/
/*																					*/
/*  pokemon_sio_flagが1になった事を確認してから実行してください.					*/
/*----------------------------------------------------------------------------------*/
u8 GetConnectSioMenberNum()
{
		return ((SioFlags & MULTI_SIO_PLAYERS_NUM_MASK) >> MULTI_SIO_PLAYERS_NUM_SHIFT);
}

/*----------------------------------------------------------------------------------*/
/*	通信モード確認処理初期化														*/
/*----------------------------------------------------------------------------------*/
void PokemonMultiSioCheckInit()
{
	PokemonSioCheckFlag  = 0;
	PokemonSioCheckCount = 0;
	PokemonMultiSioInit();
}

/*----------------------------------------------------------------------------------*/
/*	通信モード確認処理（違う場面で通信が行われないようにするためにﾁｪｯｸ)				*/
/*----------------------------------------------------------------------------------*/
u8 PokemonMultiSioCheck()
{
	int i,w;
	w = 0;
	if(pokemon_sio_flag==1){							//通信確立した

		if(GetConnectSioMenberNum()==0){
			SioErrorFlag = 1;
			PokemonMultiSioEnd();
		}
		for(i=0;i<GetConnectSioMenberNum();i++)			//通信モードは一緒か？
			if(SioTrainerInfo[i].ninshou == SioTrainerInfo[0].ninshou) w++;
		if(w==GetConnectSioMenberNum()){
			PokemonSioCheckFlag = 1;						//通信モードも一緒
		}else{
			PokemonSioCheckFlag = 3;						//通信モードが違う
		}
		
	}else{
		if(++PokemonSioCheckCount>10*60){				//タイムアウト
			PokemonSioCheckFlag = 2;
		}
	}
	return PokemonSioCheckFlag;
}


/*----------------------------------------------------------------------------------*/
/*  他の接続しているメンバーと認証番号がか？*/
/*----------------------------------------------------------------------------------*/
u8 PokemonNinshouNoCheck()
{
	u8 ret,i,w;

	ret = 0;
	w   = 0;
	for(i=0;i<GetConnectSioMenberNum();i++){				//通信モードは一緒か？
		if(SioTrainerInfo[i].ninshou == SioTrainerInfo[0].ninshou) 
			w++;
	}
	if(w==GetConnectSioMenberNum()){
		ret = 1;
		PokemonSioCheckFlag = 1;						//通信モードも一緒
	}else{
		ret = 0;
		PokemonSioCheckFlag = 3;						//通信モードが違う
	}

	return ret;
}



/*----------------------------------------------------------------------------------*/
/*  通信の初期化時に取得した相手トレーナーIDを返す									*/
/*----------------------------------------------------------------------------------*/
u32 GetSioTrainerId(u8 id)
{
	return SioTrainerInfo[id].Id;

}


// =================================================================
// ClearSioTrainerInfo
// 概要  : 通信開始時の認証データをクリア
// 引数  : none
// 戻り値: none
// =================================================================
void ClearSioTrainerInfo()
{
	int i;
	for(i=0;i<MULTI_SIO_PLAYERS_MAX;i++){
		memset(&SioTrainerInfo[i],0,sizeof(SIOTRAINER_INFO));
	}
}
/*==================================================================*/
/*  大量データ転送処理初期化										*/
/*==================================================================*/
static void NumerousInfoInit()
{
	NumerousInfo.flag  = 0;
	NumerousInfo.count = 0;
	NumerousInfo.max   = 0;
	NumerousInfo.p	   = NULL;
	
}


/*==================================================================*/
/*  大量データ転送処理開始											*/
/*==================================================================*/
static u8 SetNumerousData(u8 *pointer, u32 size)
{
	if(NumerousInfo.flag) return 0;

	NumerousInfo.Id = GetSioConnectId();
	NumerousInfo.flag  = 1;
	NumerousInfo.max   = size;
	NumerousInfo.count = 0;

	if(size>SPLITDATA_POOL_SIZE){
		NumerousInfo.p 		= pointer;
	}else{
		if(SendPoolBuf!=pointer)
			memcpy(SendPoolBuf,pointer,size);
		NumerousInfo.p     = SendPoolBuf;
	}
	
	SetSendBuf(NUMEROUS_SEND);
	PokemonMultiSioFunc = NumerousSendFuncInit;
	NumerousWait = 0;
	return 1;
}

// =================================================================
// NumerousSendFuncInit
// 概要  : データ分割送信ルーチン初期化
// 引数  : none
// 戻り値: none
// =================================================================
static void NumerousSendFuncInit()
{
	if(++NumerousWait>2){
		PokemonMultiSioFunc = NumerousSendFunc;
	}
}


/*==================================================================*/
/*	データ分割送信メイン											*/
/*==================================================================*/
static void NumerousSendFunc()
{
	int i;
	u8 *p;
	
	p = NumerousInfo.p;				//表記上ポインタをあてる

	SendBuf[0] = SPLITDATA_SEND;

	for(i=0;i<(MULTI_SIO_SEND_MAX-1);i++){
		SendBuf[1+i] = p[NumerousInfo.count+1+i*2]<<8|p[NumerousInfo.count+0+i*2];
//		SendBuf[2] = p[NumerousInfo.count+3]<<8|p[NumerousInfo.count+2];
	}
	NumerousInfo.count+=(MULTI_SIO_SEND_MAX-1)*2;

	if(NumerousInfo.max<=NumerousInfo.count){	//送信回数送ったら終了
		NumerousInfo.flag  = 0;
		PokemonMultiSioFunc = NumerousSendFuncEnd;
	}
}

// =================================================================
// NumerousSendFuncEnd
// 概要  : データ分割送信終了
// 引数  : none
// 戻り値: none
// =================================================================
static void NumerousSendFuncEnd()
{
	PokemonMultiSioFunc = NULL;
}

/*------------------------------------------------------------------*/
//　最初にデータを交換した後、キーデータの共有をする
//  
//  ReturnItemNoに選択したたね番号が入ってる（でも多分リストの番号）;
/*------------------------------------------------------------------*/
static void BlendMachine_Func()
{
	u8 Id;
	
	
	Id = GetSioConnectId();
														//通信開始時の一回目で行う処理(ｱｸﾀｰ追加等)
//	if((pokemon_sio_flag==ON)&&(SendXydataFlag<5)){	//５回連続で選択アイテムナンバーを送ってます。
//		SetSendBuf(SEND_ITEM_DATA);
//		SendXydataFlag++;
//	}else{
			SetSendBuf(SEND_KEYDATA);				//ｷｰﾃﾞｰﾀ送信
//	}
	BlendMachineCount++;

}
/*------------------------------------------------------------------*/
//  ﾌﾞﾚﾝﾄﾞﾏｼｰﾝ用通信関数
/*------------------------------------------------------------------*/
void BlendMachineFunction_Set()
{
	BlendMachineCount   = 0;
	PokemonMultiSioFunc = BlendMachine_Func;
}


u32 GetBlendMachineCount()
{
	return BlendMachineCount;
}
void BlendMachineStartSend()
{
	SetSendBuf(SEND_ITEM_START);
}

/*------------------------------------------------------------------*/
/*    通信時にIDを返す*/
//
//
//    通信終了時に取得されるIDを返す
/*------------------------------------------------------------------*/
u8 GetSioConnectId()
{
	return ((SioMultiCnt *)REG_SIOCNT)->ID;
}

/*----------------------------------------------------------------------------------*/
/*自分以外の送信先を取得する*/
//
//
//返り値：自分以外の送信先
/*----------------------------------------------------------------------------------*/
u8 GetAnotherSendTo()
{
	return (0x0f^(0x01<<GetSioConnectId()));	//自分のIDを取得してXORする（上位は無視される）
}

/*----------------------------------------------------------------------------------*/
/*データ分割転送開始コマンド発行関数												*/
//
//入力
//  SendTo: 送信IDをBIT単位で指定（0-3bitがそのままIDの指定となる）	＠＠　現在意味なし
//          bitが立っている場合は送信する							＠＠
//  buf:	送信データ格納ポインタ
//  size:	送信データサイズ（最高256ﾊﾞｲﾄ）
//	
//返り値
//  登録成功の場合はSUCCESS,通信実行中はBUSY（再登録が必要）
/*----------------------------------------------------------------------------------*/
u8 SplitDataSendStart(u8 SendTo, u8 *buf,u16 size)
{
	return SetNumerousData(buf, size);
	
}


/*----------------------------------------------------------------------------------*/
/*データ分割交換開始コマンド発行関数												*/
//
//入力
//  No：データ交換リスト参照番号
//	    pokesio.h内のTransListNo[][2]の何番のリストを使用するかを指定
//	    TransListはﾎﾟｲﾝﾀとｻｲｽﾞを指定している配列
//	
//返り値
//  登録成功の場合はSUCCESS,通信実行中はBUSY（再登録が必要）
/*----------------------------------------------------------------------------------*/
u8 SplitDataExchangeStart(u8 No)
{
	if(PokemonMultiSioFunc==NULL){
		TransListNo = No;
		SetSendBuf(EXCHANGE_DATA);
		
		return 1;
	}
	return 0;
}
/*----------------------------------------------------------------------------------*/
/*  SplitDataSendStartを宣言できるかどうか											*/
/*----------------------------------------------------------------------------------*/
u8 SplitDataSendStatus()
{
	return (PokemonMultiSioFunc==NULL);
}

/*----------------------------------------------------------------------------------*/
/*データ分割通信時のフラグを返す													*/
/*																					*/
/*	0:処理中または処理無し	1:処理終了												*/
/*----------------------------------------------------------------------------------*/
u8 SplitDataResult()
{
//	return SplitDataFuncFlag;
	return (SplitDataFuncFlag[3]<<3)|(SplitDataFuncFlag[2]<<2)|(SplitDataFuncFlag[1]<<1)|SplitDataFuncFlag[0];
}


/*----------------------------------------------------------------------------------*/
/*  データ分割通信終了をセット														*/
/*----------------------------------------------------------------------------------*/
void SplitDataResultSet(u8 id)
{
//	SplitDataFuncFlag |= 1<<id;		
	SplitDataFuncFlag[id] = 1;
}
/*----------------------------------------------------------------------------------*/
/*  データ分割通信時のフラグをリセットする											*/
/*----------------------------------------------------------------------------------*/
void SplitDataResultReset()
{
	int i;
	for(i=0;i<4;i++)
		SplitDataFuncFlag[i] = 0;
//	SplitDataFuncFlag = 0;		
}

/*----------------------------------------------------------------------------------*/
/*  データ分割通信時のフラグをID単位でリセットする									*/
/*----------------------------------------------------------------------------------*/
void SplitDataResultReset2(u8 id)
{
//	if((SplitDataFuncFlag&(1<<id)))
//		SplitDataFuncFlag ^= 1<<id; 
	if(SplitDataFuncFlag[id])
		SplitDataFuncFlag[id] = 0;
}

/*----------------------------------------------------------------------------------*/
/*  親の場合に通信開始のフラグをセットする*/
/*----------------------------------------------------------------------------------*/
void MultiSioSignalDecision()
{
	if(SioFlags&MULTI_SIO_PARENT){
		if(((SioFlags&MULTI_SIO_PLAYERS_NUM_MASK)>>MULTI_SIO_PLAYERS_NUM_SHIFT)>1){
			Signal = SIGNAL_DECISION;
		}
	}
}

/*----------------------------------------------------------------------------------*/
/*  チェックサム作成																*/
/*																					*/
/*  u16の配列をsizeの回数足し算して進めた値をチェックサムとして返します。			*/
/*  p     : u16の配列																*/
/*  size  : サイズ																	*/
/*  返り値: チェックサム															*/
/*----------------------------------------------------------------------------------*/
u16 CheckSumMake(u16 *p, u16 size)
{
	u16 i,checksum;
	
	checksum = 0;				//チェックサムの初期値は０から始めてます
	for(i=0;i<size/2;i++){
		checksum += p[i];
	}
	
	return checksum;
}

#ifdef DEBUG_NUMPRINT
/*================================================================================*/
/*デバッグ用数字put*/
/*================================================================================*/
static void numput(u8 num, u8 x, u8 y)
{
	u16 *p;
	
	p = (u16*)(BG_VRAM+0x800*debugnum[0]);
	p[y*32+x] = (u16)((debugnum[1]<<12)|(num+1));
}

/*================================================================================*/
/*デバッグ用数字print*/
/*================================================================================*/
void numprint(u32 num, u8 x, u8 y, u8 keta)
{
	int i;
	u8  work[16];
	
	for(i=0;i<keta;i++){
		work[i] = num&0xf;
		num    /= 0x10;
	}
	for(i=keta-1;i>=0;i--){
		numput(work[i],x,y);
		x++;
	}
}

static void PokemonIdKoukanOya()
{
	if(SioFlags&MULTI_SIO_PARENT)
		SetSendBuf(NINSHOU_REQ);
	PokemonMultiSioFunc = NULL;
}


#endif



/*----------------------------------------------------------------------------------*/
/*  状態表示*/
/*----------------------------------------------------------------------------------*/
void kanshi_network(u8 taskno)
{

#ifdef DEBUG_NUMPRINT
	int i;
	numprint(Signal, 		2,	1,	2);
	numprint(SioFlags, 		15,	1,	8);
	numprint(M_s.State, 	2,	10,	2);
	numprint(((SioFlags & MULTI_SIO_PLAYERS_NUM_MASK) >> MULTI_SIO_PLAYERS_NUM_SHIFT), 15,10,2);
	numprint(GetSioConnectId(), 15,12,2);
	numprint(Send_Buf_Size,	25,	1,	2);
	numprint(Recv_Buf_Size,	25,	2,	2);

	numprint(SplitDataResult(),15,5,2);
	numprint(DebugWork0,		2,12,8);
	numprint(DebugWork1,	2,13,8);

	numprint(SioParentConnectCheck(),	25,5,1);
	numprint(SioChildConnectCheck(),	25,6,1);
	numprint(MultiSioMainCheck(),		25,7,1);
	numprint(MultiSioErrorCheck(),		25,8,1);

	for(i=0;i<4;i++)
		numprint(checksumwork[i], 10,4+i,4);
#if	defined(FIELD_TUUSHIN_DEBUG) && defined(PM_DEBUG)
	for(i=0;i<4;i++)
		numprint(debug_player_cmd[i],20,12+i,4);
#endif

//	numprint(RecvBuf[1][0],3,5,4);
//	numprint(RecvBuf[1][1],3,6,4);
//	numprint(RecvBuf[1][2],3,7,4);
//	numprint(RecvBuf[1][3],3,8,4);
#endif
}

#ifdef DEBUG_NUMPRINT
// =============================================
// kanshi_num_set
// 概要  : 監視関数kanshi_networkで表示数字をｾｯﾄする
// 引数  : w0	
//       : w1
// 戻り値: none
// =============================================
void kanshi_num_set(u32 w0, u32 w1)
{
	DebugWork0 = w0;
	DebugWork1 = w1;
}
#endif


// =================================================================
// GetConnectMemberBitData
// 概要  : 現在接続中の人数をﾋﾞｯﾄであらわした数で返す
// 引数  : none
// 戻り値: u8(0とかfとか)
// =================================================================
u8 GetConnectMemberBitData()
{
	int i;
	u8  ret;
	
	ret = 0;



//	for(i=0;i<GetConnectSioMenberNum();i++){
	for(i=0;i<SioReliableNumber;i++){
		ret |= 1<<i;
	}

	return ret;
}

/*----------------------------------------------------------------------------------*/
/*  現在接続している人数を保持する													*/
/*----------------------------------------------------------------------------------*/
void SetSioReliableNumber(u8 num)
{
	int i;

	SioReliableNumber = num;				//接続人数の保存
	SioReliableId	  = GetSioConnectId();	//自分のＩＤの保存

	for(i=0;i<4;i++){					//接続メンバーの情報を保存
		ReliableMemberInfo[i] = SioTrainerInfo[i];
	}
}

/*----------------------------------------------------------------------------------*/
/*  接続していた人数を返す															*/
/*----------------------------------------------------------------------------------*/
u8 GetSioReliableNumber()
{
	return SioReliableNumber;
}


/*----------------------------------------------------------------------------------*/
/*  接続していたＩＤを返す															*/
/*----------------------------------------------------------------------------------*/
u8 GetSioReliableId()
{
	return SioReliableId;
}
/*----------------------------------------------------------------------------------*/
/*  保持しているメンバーの情報が再接続時にあっているか確認する						*/
/*----------------------------------------------------------------------------------*/
u8 CheckSioReliableMember()
{
	int i,w;

	w = 0;
	for(i=0;i<SioReliableNumber;i++){
		if( SioTrainerInfo[i].Id == ReliableMemberInfo[i].Id)
//		&& PM_strcmp(SioTrainerInfo[i].name,ReliableMemberInfo[i].name)==0)
		{
			w++;
		}
	}
	if(w==SioReliableNumber) return 1;
	return 0;

}

// =================================================================
// CheckMyTrainerInfo
// 概要  : ID、名前情報を前回通信時と変わっていないかチェック
//			自動認証用
// 引数  : none
// 戻り値: u8
// =================================================================
void CheckMyTrainerInfo()
{
	u8 id;

	for(id = 0;id<SioReliableNumber;id++){
		if( ReliableMemberInfo[id].Id != SioTrainerInfo[id].Id
			|| PM_strcmp(ReliableMemberInfo[id].name,SioTrainerInfo[id].name)!=0){
	
			SioErrorFlag = 1;
			PokemonMultiSioEnd();
			MainProcChange(ErrGamenInit);
		}
	}
}

/*----------------------------------------------------------------------------------*/
/*  現在接続している人数をｸﾘｱする													*/
/*----------------------------------------------------------------------------------*/
void ClearSioReliableNumber()
{
	SioReliableNumber = 0;
	SioReliableId	  = 0;
}


/*----------------------------------------------------------------------------------*/
/*  現在(リアルタイムで)接続している人数を返す										*/
/*----------------------------------------------------------------------------------*/
u8 GetSioRealConnectNumber()
{
	return ((SioFlags & MULTI_SIO_PLAYERS_NUM_MASK) >> MULTI_SIO_PLAYERS_NUM_SHIFT);
}


/*----------------------------------------------------------------------------------*/
/*  親接続か子接続か																*/
/*----------------------------------------------------------------------------------*/
u8 GetMyConnectIsParent()
{
	return ((SioFlags&MULTI_SIO_PARENT)!=0);
}

/*----------------------------------------------------------------------------------*/
/*  通信用FIFOﾊﾞｯﾌｧｸﾘｱ中かどうかを返す												*/
/*																					*/
/*  1:ｸﾘｱしてﾎﾟｰｽﾞがかかっている途中												*/
/*  0:通信回復																		*/
/*----------------------------------------------------------------------------------*/
u8 GetPokemonSioPauseFlag()
{
	return MultiSioPauseFlag;
}


// =================================================================
// SetEndDataStart
// 概要  : 終了コマンド発行を開始する
// 引数  : none
// 戻り値: none
// =================================================================
void SetSioEndDataStart()
{
	if(PokemonMultiSioFunc!=NULL) return;
	PokemonMultiSioFunc = SetSioEndDataSend;
	SioEndFlag = 0;
}

// =================================================================
// SetSioEndDataSend
// 概要  : 受信バッファが０になるのを確認したら終了コードを送信
// 引数  : none
// 戻り値: none
// =================================================================
static void SetSioEndDataSend()
{
	if(Recv_Buf_Size==0){						//なにもデータを送信しないでFIFOがクリアされるのを待つ
		SetSendBuf(SIO_END_DATA);
		PokemonMultiSioFunc = SioEndDataWait;
	}
}
// =================================================================
// SetSioEndData
// 概要  : 終了コマンドを発行しつづける・みんなEND_DATAになったらフラグ立てる
// 引数  : none
// 戻り値: none
// =================================================================
static void SioEndDataWait()
{
	int i,num,work;
	
	num = GetConnectSioMenberNum();

	work = 0;
	for(i=0;i<num;i++){						//通信している全員からエンドデータがくるのを待つ
		if(MultiSioEndFlag[i]) work++;
	}
	if(work==num){							//全員分受け取ったら通信切断
		FightType &= (FIGHT_TYPE_TUUSHIN_OK ^ 0xffff);		//通信戦闘用のフラグクリア
		SioStopFlag = 1;					//この1sync内に起きる通信エラーフラグは無視
		PokemonMultiSioEnd();
		PokemonMultiSioFunc = NULL;
		SioEndFlag = 1;						
	}
}




// =================================================================
// SetSioSynchronize
// 概要  : 通信同期開始ルーチン
// 引数  : none
// 戻り値: none
// =================================================================
void SetSioSynchronize()
{
	if(PokemonMultiSioFunc == NULL){
		PokemonMultiSioFunc = SioSynchronizeWait;
	}
	SioEndFlag=0;
}


// =================================================================
// SioSynchronizeWait
// 概要  : 
// 引数  : none
// 戻り値: none
// =================================================================
static void SioSynchronizeWait()
{
	if(Recv_Buf_Size==0){					//なにもデータを送信せずFIFOが解消されるのを待つ
		SetSendBuf(SEND_SYNCRO_DATA);
		PokemonMultiSioFunc = SioSynchronize;
	}
}

// =================================================================
// SioSynchronize
// 概要  : 通信同期待ち
// 引数  : none
// 戻り値: none
// =================================================================
static void SioSynchronize()
{
	u8 num,i,w;

	num = GetConnectSioMenberNum();			//全員から同期コマンドが送られてきたら終了
	for(i=0;i<num;i++){
		if(MultiSioSynchroFlag[i] == 0){
			break;
		}
	}
	if(i==num){
		for(w=0;w<4;w++)
		MultiSioSynchroFlag[w] = 0;			//同期フラグクリア
		PokemonMultiSioFunc = NULL;
	}

}


#ifdef ERROR_CHECK


// =================================================================
// SioErrCheck
// 概要  : 通信エラーを受け取ったらエラー告知画面に飛ばす
// 引数  : none
// 戻り値: none
// =================================================================
static void SioErrCheck()
{
	if(multisio_start_flag==OFF) return;
	if(SioFlags&(MULTI_SIO_HARD_ERROR|MULTI_SIO_CHECKSUM_ERROR|MULTI_SIO_SEND_OVER_FLOW_ERROR|
				MULTI_SIO_RECV_OVER_FLOW_ERROR|MULTI_SIO_INTERVAL_ERROR|MULTI_SIO_ID_OVER_ERROR
				|MULTI_SIO_INTR_STOP_ERROR)){

		if(SioErrorPermitFlag==SIO_ERROR_PERMIT_JUMP){						//通信エラー画面にとばしていい
			HozonSioFlags = SioFlags;
			HozonRecvSize = Recv_Buf_Size;
			HozonSendSize = Send_Buf_Size;
			MainProcChange(ErrGamenInit);
		}											
		SioErrorFlag = 1;
		PokemonMultiSioEnd();
	}
	
}

// =================================================================
// ErrGamenInit
// 概要  : 通信エラー画面初期化
// 引数  : none
// 戻り値: none
// =================================================================
void ErrGamenInit()
{
	InitActor();				//アクター初期化
	ObjPalManInit();			//OBJパレットマネージャー初期化
	FadeWorkInit();				//パレットアニメ関係の情報を初期化
	PaletteWorkClear(0,0,2);	//パレットワークの初期化
	InitTask();


	SetVBlankFunc(VInterFunc);

	PrintScreenInit(FIELD_MENU_TYPE);
	NMenuScreenInit(FIELD_MENU_TYPE);
	NMenuScreenClear();
	
	*(vu16 *)REG_BLDALPHA = 0;
	*(vu16 *)REG_BG0VOFS  = 0;
	*(vu16 *)REG_BG0HOFS  = 0;

	*(vu16 *)REG_DISPCNT = 	DISP_MODE_0					// BGモード 
                          |	DISP_OBJ_CHAR_1D_MAP		// OBJ1次元ﾏｯﾋﾟﾝｸﾞ
						  | DISP_BG0_ON					// BG0有効
							;
	SoftResetDisable = 0;					//ソフトリセット処理を有効に

	AddTask(CheckParent,0);


	BGM_PlayStop();

	MainTask();
	JumpActor();
	SetActor();
	PaletteAnime();
	
	MainProcChange(ErrGamenMain);

	
}

static const u8 spc_msg[]={spc_,EOM_,};

// =================================================================
// ErrGamenMain
// 概要  : 通信エラー画面メイン
// 引数  : none
// 戻り値: none
// =================================================================
void ErrGamenMain()
{
	u8 strbuf[30];
	u8 numbuf[30];
	switch(sys.InitSeqWork){
		case 0:
			NMenuMsgWrite(err_msg,7,7);

#ifdef PM_DEBUG
				PM_strcpy(strbuf,err_num);
				PM_HexNumMsgSet(numbuf, HozonSioFlags, NUM_MODE_ZERO, 8);
				PM_strcat(strbuf,numbuf);
				PM_strcat(strbuf,spc_msg);
				PM_HexNumMsgSet(numbuf, HozonSendSize, NUM_MODE_ZERO, 2);
				PM_strcat(strbuf,numbuf);
				PM_strcat(strbuf,spc_msg);
				PM_HexNumMsgSet(numbuf, HozonRecvSize, NUM_MODE_ZERO, 2);
				PM_strcat(strbuf,numbuf);
				NMenuMsgWrite(strbuf,2,15);
#endif
			break;
		case 30:
			SePlay(SE_BOO);
			break;
		case 60:
			SePlay(SE_BOO);
			break;
		case 90:
			SePlay(SE_BOO);
			break;
	}

	if(sys.InitSeqWork!=200) sys.InitSeqWork++;
}
#else
void ErrGamenInit(){}
#endif



// =================================================================
// SioParentConnectCheck
// 概要  : ケーブルが抜かれていないかチェック（通信の親の場合のみ）
// 引数  : none
// 戻り値: u8	0:正常		1:異常（抜かれた）
// =================================================================
u8 SioParentConnectCheck(void)
{
//	return !(SioFlags&MULTI_SIO_PARENT);
	return ((*(vu16*)REG_SIOCNT&(1<<2)) != 0);
}

// =================================================================
// SioChildConnectCheck
// 概要  : ケーブルが差し替えられていないかチェック（子の場合のみ）
// 引数  : none
// 戻り値: 0:正常		1:子供のはずなのに親のコネクタが差しこまれた
// =================================================================
u8 SioChildConnectCheck(void)
{
//	u8 flag = 0;
//	if((*(vu16*)REG_SIOCNT & (1<<3))!=0){
//		if( (*(vu16*)REG_SIOCNT & (1<<2))==0) flag = 1;
//	}
//	return flag;
	return (  (*(vu16*)REG_SIOCNT & (1<<3))!=0 &&  (*(vu16*)REG_SIOCNT&(1<<2))==0);
}

// =================================================================
// MultiSioMainCheck
// 概要  : 通信メイン中かチェック
// 引数  : none
// 戻り値: 0:通信無し		1:通信中
// =================================================================
u8 MultiSioMainCheck(void)
{
	return ((SioFlags&MULTI_SIO_MAIN_SEQ)!=0);
}

// =================================================================
// MultiSioErrorPermit
// 概要  : 通信エラーが起きたときにエラー画面に飛ばすかどうかを許可
// 引数  : flag	
//		SIO_ERROR_PERMIT_JUMP:通信エラー画面に飛ばす(デフォルト)
//		SIO_ERROR_NO_JUMP	 :飛ばさない(ﾌﾗｸﾞ検出は可能)
// 戻り値: none
// =================================================================
void MultiSioErrorPermit(u8 flag)
{
	SioErrorPermitFlag = flag;
}

// =================================================================
// MultiSioErrorCheck
// 概要  : 通信エラーが起きたかどうかを返す
// 引数  : none
// 戻り値: u8	0:エラー無し	1:エラー発生
// =================================================================
u8 MultiSioErrorCheck(void)
{
	return SioErrorFlag;
}