//------------------------------------------------------------------------------
//
//	外部データ読みこみ画面
//
//
//
//------------------------------------------------------------------------------


//------------------------------------------------------------------------------
//include
//------------------------------------------------------------------------------
#include "common.h"


#include "multisio.h"
#include "pokesio.h"
#include "cable.h"
#include "intr.h"
#include "jiki.h"

#include "print.h"
#include "menu.h"
#include "calctool.h"
#include "decord.h"
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

#include "ex_load.h"



//------------------------------------------------------------------------------
// extern
//------------------------------------------------------------------------------
extern void CheckParent(u8 id);
extern void TitleInit();
extern const u8 	CasetteLanguage;
extern u8			TestCasetteLanguage;
//------------------------------------------------------------------------------
// プロトタイプ宣言
//------------------------------------------------------------------------------
void HusiginaDekigotoGamenMain();
void HusigiSendGamenMain();
//static u32 checksummake(u32 *p, u32 size);

#ifdef DEBUG_CARD_E
static void DumpKeyControl();
static void DumpPut();
#endif
//------------------------------------------------------------------------------
// 文字列定義
//------------------------------------------------------------------------------

//つうしんたきちゅうです。Bボタンでキャンセルします
static const u8 sio_start[]={
	tu_,u_,si_,n_,spc_,ta_,i_,ki_,spc_,ti_,yyu_,u_,spc_,de_,su_,CR_,
	tenten_,tenten_,B__,BO_,TA_,N_,de_,spc_,KI_,YYA_,N_,SE_,RU_,spc_,si_,ma_,su_,EOM_,
};

//Aボタンでできごとをよみこみます。Bボタンでキャンセルします
static const u8 dekigoto_start[]={
	A__,BO_,TA_,N_,de_,spc_,de_,ki_,go_,to_,wo_,spc_,yo_,mi_,ko_,mi_,ma_,su_,CR_,
	tenten_,tenten_,B__,BO_,TA_,N_,de_,spc_,KI_,YYA_,N_,SE_,RU_,spc_,si_,ma_,su_,EOM_,
};

//できごとをよみこみちゅうです！！
static const u8 now_mes[]={
	de_,ki_,go_,to_,wo_,spc_,yo_,mi_,ko_,mi_,ti_,yyu_,u_,gyoe_,gyoe_,EOM_,
};

//つうしんケーブルをぬかないでください。でんげんをぬかないでください
static const u8 warning_mes[]={
	tu_,u_,si_,n_,KE_,bou_,BU_,RU_,wo_,spc_,nu_,ka_,na_,i_,de_,spc_,ku_,da_,sa_,i_,CR_,
	de_,n_,ge_,n_,wo_,spc_,ki_,ra_,na_,i_,de_,spc_,ku_,da_,sa_,i_,EOM_,
};

//できごとのよみこみがせいじょうに終了しました
static const u8 end_mes[]={
	de_,ki_,go_,to_,no_,spc_,yo_,mi_,ko_,mi_,ga_,CR_,
	se_,i_,zi_,yyo_,u_,ni_,spc_,si_,yyu_,u_,ri_,yyo_,u_,spc_,si_,ma_,si_,ta_,EOM_,
};

//せつぞくできないききのようです。ただしいききとやりなおしてください。
static const u8 illegal_mes[]={
	se_,tu_,zo_,ku_,spc_,de_,ki_,na_,i_,spc_,ki_,ki_,no_,spc_,yo_,u_,de_,su_,CR_,
	ta_,da_,si_,i_,spc_,ki_,ki_,to_,spc_,ya_,ri_,na_,o_,si_,te_,ku_,da_,sa_,i_,EOM_,
};

static const u8 error_mes[]={
	E_,RA_,bou_,ga_,ha_,ttu_,se_,i_,si_,ma_,si_,ta_,CR_,
	si_,yyu_,u_,ri_,yyo_,u_,si_,ma_,su_,EOM_,
};

static const u8 carde_abutton[]={
	A__,BO_,TA_,N_,wo_,spc_,o_,si_,te_,ku_,da_,sa_,i_,EOM_,
};

static const u8 carde_setuzoku[]={
	tu_,na_,ga_,ri_,ma_,si_,ta_,EOM_,
};

static const u8 carde_jusin[]={
	DE_,bou_,TA_,wo_,spc_,zi_,yyu_,si_,n_,si_,ma_,si_,ta_,EOM_,
};

static const u8 carde_saveng[]={
		SE_,bou_,BU_,de_,ki_,ma_,se_,n_,de_,si_,ta_,EOM_,
};
static const u8 carde_saveok[]={
		SE_,bou_,BU_,de_,ki_,ma_,si_,ta_,EOM_,
};
static const u8 carde_loadng[]={
		RO_,bou_,DO_,de_,ki_,ma_,se_,n_,de_,si_,ta_,EOM_,
};
static const u8 carde_loadok[]={
		RO_,bou_,DO_,de_,ki_,ma_,si_,ta_,EOM_,
};


// =================================================================
// ウインドウの座標定義
// =================================================================
#define MAIN_WINDOW_X1		3  
#define MAIN_WINDOW_Y1		14
#define MAIN_WINDOW_X2		27
#define MAIN_WINDOW_Y2		19

#define CENTER_WINDOW_X1	6
#define CENTER_WINDOW_Y1	5
#define CENTER_WINDOW_X2	23
#define CENTER_WINDOW_Y2	8






// =================================================================
// VInterFunc
// 概要  : Vsync処理
// 引数  : none
// 戻り値: none
// =================================================================
static void VInterFunc( void )
{
	actOAMtrans();						//ｱｸﾀｰ転送処理1
	actDMAtrans();						//ｱｸﾀｰ転送処理2
	PaletteFadeTrans();
}


// =================================================================
// InterNationalCodeCheck
// 概要  : 国際コードを確認する
// 引数  : none
// 戻り値: static u8 1:同じ場合  0:違う場合
// =================================================================
static u8 InterNationalCodeCheck()
{
	return (SioTrainerInfo[0].INCode == SioTrainerInfo[1].INCode);
}

// =================================================================
// HusiginaDekigotoGamenInit
// 概要  : 外部データよみこみ画面初期化
// 引数  : none
// 戻り値: none
// =================================================================
void HusiginaDekigotoGamenInit()
{
	InitActor();				//アクター初期化
	ObjPalManInit();			//OBJパレットマネージャー初期化
	InitTask();


	SetVBlankFunc(VInterFunc);

	PrintScreenInit(FIELD_MENU_TYPE);
	NMenuScreenInit(FIELD_MENU_TYPE);
	NMenuScreenClear();
	

	*(vu16 *)REG_DISPCNT = 	DISP_MODE_0					// BGモード 
                          |	DISP_OBJ_CHAR_1D_MAP		// OBJ1次元ﾏｯﾋﾟﾝｸﾞ
						  | DISP_BG0_ON					// BG0有効
							;

	*(vu16*)REG_BLDCNT = 0;

	AddTask(CheckParent,0);


	BGM_PlayStop();

	MainTask();
	JumpActor();
	SetActor();
	PaletteAnime();

	PaletteWorkClear(0x0000,0,2);
	MainProcChange(HusiginaDekigotoGamenMain);

	
}


// =================================================================
// ExtraDataErrorMesSet
// 概要  : 外部から受け取ったデータを実行後に出すメッセージをセット
// 引数  : buf		:文字列バッファ
//       : error	:実行結果のフラグ
// 戻り値: static
// =================================================================
static u8 ExtraDataErrorMesSet(u8 *buf, int error)
{
	u8 ret;

	ret = 1;
	if(error == EXRUN_RET_NORMAL_END){			//正常終了（メッセージ無し）
		PM_strcpy(buf,end_mes);
		ret = 0;								//セーブ許可
	}

	if(error == EXRUN_RET_NORMAL_MSG_END)		//正常終了（メッセージはスクリプトが入れる)
		ret = 0;								//セーブ許可

	if(error == EXRUN_RET_ERROR_END)			//異常終了（メッセージ無し)
		PM_strcpy(buf,error_mes);


	//このほかのメッセージはスクリプトの方でExpandに格納される
	return ret;
}
enum{
	CARD_E_FADEIN = 0,
	CARD_E_START_MES,
	CARD_E_START_MES_WAIT,
	CARD_E_START_WAIT,
	CARD_E_SIO_START_MES,
	CARD_E_SIO_START,
	CARD_E_SIO_START_WAIT,
	CARD_E_DATA_RECV_MES,
	CARD_E_DATA_RECV,
	CARD_E_DATA_RUN,
	CARD_E_DATA_SAVE,
	CARD_E_DATA_SAVE_WAIT,
	CARD_E_DATA_SAVE_END,
	CARD_E_END_WAIT,
	CARD_E_END_WAIT2,
	CARD_E_FADEOUT,
	CARD_E_FADEOUT_WAIT,
};

static u8 SioWait = 0;

// =================================================================
// HusiginaDekigotoGamenMain
// 概要  : 外部データ読みこみメイン
// 引数  : none
// 戻り値: none
// =================================================================
void HusiginaDekigotoGamenMain()
{
	u16 error;
//	u32 *p;
	switch(sys.InitSeqWork){
		case CARD_E_FADEIN:								//フェードイン
			NMenuWinBoxWrite( MAIN_WINDOW_X1, MAIN_WINDOW_Y1, MAIN_WINDOW_X2, MAIN_WINDOW_Y2 );
			PaletteFadeReq(0xffffffff,0,16,0,0);
			sys.InitSeqWork++;
			break;
		case CARD_E_START_MES:							//つうしんたいきちゅう
			if( FadeData.fade_sw == 0 ){
				NMenuTalkMsgSetEasy(sio_start);
				sys.InitSeqWork++;
			}
			break;
		case CARD_E_START_MES_WAIT:						
			if(NMenuTalkMsgPut()){
				sys.InitSeqWork++;
				PokemonSioNinshouNo = NINSHOU_CARD_E;
				PokemonMultiSioInit();
			}
			break;
		case CARD_E_START_WAIT:							//できごとをよみこみます
			if(SioFlags&MULTI_SIO_PARENT){
				if(((SioFlags&MULTI_SIO_PLAYERS_NUM_MASK)>>MULTI_SIO_PLAYERS_NUM_SHIFT)>1){
					SePlay(SE_PIN);
					NMenuTalkMsgSetEasy(dekigoto_start);
					sys.InitSeqWork++;
				}
			}
			if(sys.Trg&B_BUTTON){							//Bボタンでキャンセル
				SePlay(SE_SELECT);
				PokemonMultiSioEnd();
				sys.InitSeqWork = CARD_E_FADEOUT;
			}
			break;
		case CARD_E_SIO_START_MES:						//
			if(NMenuTalkMsgPut()){
				sys.InitSeqWork++;
			}
			break;

		case CARD_E_SIO_START:							//Aボタンで読みこみ開始（通信開始）
			if(GetSioRealConnectNumber()==2){
				if(sys.Trg & A_BUTTON){
					SePlay(SE_SELECT);
					MultiSioSignalDecision();
					NMenuWinBoxWrite( CENTER_WINDOW_X1, CENTER_WINDOW_Y1, CENTER_WINDOW_X2, CENTER_WINDOW_Y2 );
					NMenuMsgWrite(now_mes,7,6);
					sys.InitSeqWork++;
				}else if(sys.Trg & B_BUTTON){
					SePlay(SE_SELECT);
					PokemonMultiSioEnd();
					sys.InitSeqWork = CARD_E_FADEOUT;
				}
			}else{
				ExtraDataErrorMesSet( MsgExpandBuffer ,EXRUN_RET_ERROR_END);//エラーメッセージセット
				NMenuTalkMsgSetEasy( MsgExpandBuffer );			//処理終了メッセージ表示
				sys.InitSeqWork = CARD_E_END_WAIT;		//エラー終了		
			}
			break;
		case CARD_E_SIO_START_WAIT:						//通信接続確認
			if(MultiSioMainCheck()){
				if(pokemon_sio_flag){
				
					if(PokemonMultiSioCheck()==3){			//認証確認
						SetSioEndDataStart();
						NMenuBoxClear( CENTER_WINDOW_X1, CENTER_WINDOW_Y1, CENTER_WINDOW_X2, CENTER_WINDOW_Y2 );
						ExtraDataErrorMesSet( MsgExpandBuffer ,EXRUN_RET_ERROR_END);//エラーメッセージセット
						NMenuTalkMsgSetEasy( MsgExpandBuffer );			//処理終了メッセージ表示
						sys.InitSeqWork = CARD_E_END_WAIT;		//エラー終了		

					}else{
						if(InterNationalCodeCheck()){				//国際コードが違ったら通信接続切断
							NMenuTalkMsgSetEasy(warning_mes);		//エラーなし
							sys.InitSeqWork++;
						}else{
							PokemonMultiSioEnd();
							NMenuBoxClear( CENTER_WINDOW_X1, CENTER_WINDOW_Y1, CENTER_WINDOW_X2, CENTER_WINDOW_Y2 );
							ExtraDataErrorMesSet( MsgExpandBuffer ,EXRUN_RET_ERROR_END);//エラーメッセージセット
							NMenuTalkMsgSetEasy( MsgExpandBuffer );			//処理終了メッセージ表示
							sys.InitSeqWork = CARD_E_END_WAIT;		//エラー終了
						}
					}
				}
			}else if(sys.Trg & B_BUTTON){				//通信は始まってない
				SePlay(SE_SELECT);
				PokemonMultiSioEnd();
				sys.InitSeqWork = CARD_E_FADEOUT;
			}
			break;
		case CARD_E_DATA_RECV_MES:						
			if(NMenuTalkMsgPut()){						//メッセージ表示待ち
				sys.InitSeqWork++;
			}
			break;
		case CARD_E_DATA_RECV:
			if(SplitDataResult()){						//データ到着待ち
				SplitDataResultReset();
//				putchecksum(1, 16, (u16*)&UserWork[0]);
				sys.InitSeqWork++;
			}
			break;
		case CARD_E_DATA_RUN:							//受け取ったデータを実行
			sys.InitSeqWork++;
			break;
		case CARD_E_DATA_SAVE:
			SetSioEndDataStart();
			sys.InitSeqWork++;
			break;
		case 	CARD_E_DATA_SAVE_WAIT:
			if(pokemon_sio_flag==0){
#ifdef DEBUG_CARD_E
			NMenuBoxClear(0,0,31,19);
#else
//				p = (u32*)&UserWork[0x2000];
//				if(checksummake((u32*)UserWork,0x2000)==*p){				//チェックサムチェック
					error = RunExtraData( UserWork );
					CpuClear(0,UserWork,2004,32);							//スクリプト実行したら即消去
					if(ExtraDataErrorMesSet( MsgExpandBuffer ,error) == 0)	//エラーメッセージセット
						PokeAGBSave( POKEAGB_SVALL );						//エラーが無かったらセーブ
//				}else{
//					ExtraDataErrorMesSet( MsgExpandBuffer ,EXRUN_RET_ERROR_END);//エラーメッセージセット
//				}
#endif
				sys.InitSeqWork++;
			}
			break;
		case CARD_E_DATA_SAVE_END:


#ifdef DEBUG_CARD_E
				DumpKeyControl();
				DumpPut();
#else
				NMenuTalkMsgSetEasy( MsgExpandBuffer );			//処理終了メッセージ表示
				sys.InitSeqWork++;
#endif
			break;
		case CARD_E_END_WAIT:
			if(NMenuTalkMsgPut()){
				sys.InitSeqWork++;
				SioWait = 0;
			}
			break;
		case CARD_E_END_WAIT2:
			if(sys.Trg & A_BUTTON){
				SePlay(SE_SELECT);
				sys.InitSeqWork++;
			}
			break;
		case CARD_E_FADEOUT:							//フェードアウト
			PaletteFadeReq(0xffffffff,0,0,16,0);
			sys.InitSeqWork++;
			break;
		case CARD_E_FADEOUT_WAIT:						//終わり→タイトルへ
			if( FadeData.fade_sw == 0 ){
				PM_SoftReset();
//				MainProcChange( TitleInit ) ;
			}
			break;
	}
	if(SioFlags&MULTI_SIO_MAIN_SEQ){
		if(GetMyConnectIsParent()==0){			//子接続ならブチ切り
			PokemonMultiSioEnd();
			NMenuBoxClear( CENTER_WINDOW_X1, CENTER_WINDOW_Y1, CENTER_WINDOW_X2, CENTER_WINDOW_Y2 );
			ExtraDataErrorMesSet( MsgExpandBuffer ,EXRUN_RET_ERROR_END);//エラーメッセージセット
			NMenuTalkMsgSetEasy( MsgExpandBuffer );			//処理終了メッセージ表示
			sys.InitSeqWork = CARD_E_END_WAIT;		//エラー終了
		}
	}

	MainTask();
	JumpActor();
	SetActor();
	PaletteAnime();
}

#ifdef PM_DEBUG

static const u8 send_start_mes[]={			//説明
	KA_,bou_,DO_,E__,no_,spc_,hu_,ri_,wo_,spc_,si_,ma_,su_,EOM_,
};
static const u8 send_start2_mes[]={			//説明2
	sa_,yu_,u_,de_,spc_,se_,n_,ta_,ku_,
	A__,BO_,TA_,N_,de_,spc_,so_,u_,si_,n_,EOM_,
};

static const u8 send_now_mes[]={				//送信中です。
	so_,u_,si_,n_,ti_,yyu_,u_,de_,su_,EOM_,
};


static const u8 send_end_msg[]={			//送信終了
	so_,u_,si_,n_,si_,yyu_,u_,ri_,yyo_,u_,si_,ma_,si_,ta_,EOM_,
};


//static const u8 data_msg[][10]={			//選択項目
//	{TI_,KE_,TTU_,TO_,spc_,spc_,EOM_,},
//	{PO_,KE_,MO_,N_,spc_,spc_,EOM_,},
//	{RI_,BO_,N_,spc_,spc_,spc_,EOM_,},
//	{ZU_,KA_,N_,spc_,spc_,spc_,EOM_,},
//	{WA_,bou_,DO_,spc_,spc_,spc_,EOM_,},
//};


// =================================================================
// SelectSendData
// 概要  : タスク関数--送信するデータの選択・決定
// 引数  : no
// 戻り値: none
// =================================================================
static void SelectSendData(u8 no)
{
	u32 sendsize = 0;
	
	if(TaskTable[no].work[0]==0){
		NMenuWinBoxWrite(4,4,11,7);
//		NMenuMsgWrite(data_msg[TaskTable[no].work[1]], 5, 5);
		NMenuMsgWrite(ExDataMaker[TaskTable[no].work[1]].title, 5, 5);
		TaskTable[no].work[0]++;
	}

	if(sys.Trg&L_KEY){
		if(TaskTable[no].work[1]==0){
			TaskTable[no].work[1] = SizeOfExDataMaker-1;
		}else{
			TaskTable[no].work[1]--;
		}
		TaskTable[no].work[0] = 0;
	}
	if(sys.Trg&R_KEY){
		if(TaskTable[no].work[1]==SizeOfExDataMaker-1){
			TaskTable[no].work[1] = 0;
		}else{
			TaskTable[no].work[1]++;
		}
		TaskTable[no].work[0] = 0;
	}
	
	if(sys.Trg&A_BUTTON){
		sendsize = (u32)(ExDataAdrs[TaskTable[no].work[1]][1]-ExDataAdrs[TaskTable[no].work[1]][0]);
		(*(ExDataMaker[TaskTable[no].work[1]].make_func))(&UserWork[0x4000]);
//		memcpy(&UserWork[0x4000],ExDataAdrs[TaskTable[no].work[1]][0],sendsize);
		sys.InitSeqWork++;
		DelTask(no);
	}
}


// =================================================================
// HusiginaDekigotoGamenInit
// 概要  : 外部データよみこみにデータを送る画面初期化
// 引数  : none
// 戻り値: none
// =================================================================
void HusigiSendGamenInit()
{
	InitActor();				//アクター初期化
	ObjPalManInit();			//OBJパレットマネージャー初期化
	InitTask();


	SetVBlankFunc(VInterFunc);

	PrintScreenInit(FIELD_MENU_TYPE);
	NMenuScreenInit(FIELD_MENU_TYPE);
	NMenuScreenClear();
	

	*(vu16 *)REG_DISPCNT = 	DISP_MODE_0					// BGモード 
                          |	DISP_OBJ_CHAR_1D_MAP		// OBJ1次元ﾏｯﾋﾟﾝｸﾞ
						  | DISP_BG0_ON					// BG0有効
							;

	*(vu16*)REG_BLDCNT = 0;

	AddTask(CheckParent,0);


	BGM_PlayStop();

	MainTask();
	JumpActor();
	SetActor();
	PaletteAnime();

	PaletteWorkClear(0x0000,0,2);
	MainProcChange(HusigiSendGamenMain);

}


// =================================================================
// HusiginaDekigotoGamenMain
// 概要  : 外部データ送信メイン
// 引数  : none
// 戻り値: none
// =================================================================
void HusigiSendGamenMain()
{
//	u32 *p;
	switch(sys.InitSeqWork){
		case 0:								//フェードイン
			NMenuWinBoxWrite( 3, 14, 27, 19 );
			PaletteFadeReq(0xffffffff,0,16,0,0);
			sys.InitSeqWork++;
			break;
		case 1:							//「カードＥのふりをします」
			if( FadeData.fade_sw == 0 ){
				if(sys.Cont & R_BUTTON){
					TestCasetteLanguage += 1;
				}
				NMenuTalkMsgSet(send_start_mes,4,15);
				sys.InitSeqWork++;
			}
			break;
		case 2:						
			if(NMenuTalkMsgPut()){
				sys.InitSeqWork++;
				PokemonSioNinshouNo = NINSHOU_CARD_E;
				PokemonMultiSioInit();
			}
			break;
		case 3:
			if(pokemon_sio_flag){
				sys.InitSeqWork++;
				NMenuTalkMsgSet(send_start2_mes,4,15);
			}
			break;
		case 4:
			if(NMenuTalkMsgPut()){
				AddTask(SelectSendData,10);
				sys.InitSeqWork++;
			}
			break;
		case 5:
			break;
		case 6:
			NMenuTalkMsgSet(send_now_mes,4,15);
//			putchecksum();
//			p = (u32*)&UserWork[0x4000+0x2000];
//			*p = checksummake((u32*)&UserWork[0x4000], 0x2000);
			SplitDataSendStart(0,(u8*)&UserWork[0x4000],0x2004);
			sys.InitSeqWork++;
			break;
		case 7:
			NMenuTalkMsgPut();
			if(SplitDataSendStatus()){
				sys.InitSeqWork++;
			}
			break;
		case 8:
			SetSioEndDataStart();
			sys.InitSeqWork++;
			break;
		case 9:
			if(pokemon_sio_flag==0){
				NMenuBoxWrite(4,15,26,18);
				NMenuMsgWrite(send_end_msg, 4,15);	
				sys.InitSeqWork++;
			}
			break;
		case 10:							//フェードアウト
			if(sys.Trg&A_BUTTON){
				PaletteFadeReq(0xffffffff,0,0,16,0);
				sys.InitSeqWork++;
			}
			break;
		case 11:						//終わり→タイトルへ
			if( FadeData.fade_sw == 0 ){
				MainProcChange( TitleInit ) ;
			}
		
	}
	MainTask();
	JumpActor();
	SetActor();
	PaletteAnime();
}


#endif

// =================================================================
// checksummake
// 概要  : 
// 引数  : p
// 戻り値: static u32
// =================================================================
static u32 checksummake(u32 *p, u32 size)
{
	u32 i,w;
	
	w = 0;
	for(i=0; i<(size/4); i++){
		w += p[i];
	}
	
	return w;
}

#ifdef DEBUG_CARD_E



static u32 dumpstart=0;

// =================================================================
// putchecksum
// 概要  : 
// 引数  : x
//       : y
//       : p
// 戻り値: none
// =================================================================
static void putchecksum(u8 x, u8 y, u16 *p)
{
	u8 strbuf[20];

	PM_HexNumMsgSet(strbuf, checksummake(p,0x2000), NUM_MODE_ZERO, 8);
	NMenuMsgWrite(strbuf,x,y);

}

// =================================================================
// DumpPut
// 概要  : ダンプ表示
// 引数  : none
// 戻り値: none
// =================================================================
static void DumpPut()
{
	u8 strbuf[20];
	int i,w;

	for(i=0;i<8;i++){
		PM_HexNumMsgSet(strbuf, dumpstart+i*8, NUM_MODE_ZERO, 4);
		NMenuMsgWrite(strbuf,0,i*2);
	}

	for(w=0;w<8;w++){
		for(i=0;i<8;i++){
			PM_HexNumMsgSet(strbuf, UserWork[dumpstart+i+w*8], NUM_MODE_ZERO, 2);
			NMenuMsgWrite(strbuf,6+i*3,w*2);
		}
	}
}

// =================================================================
// DumpKeyControl
// 概要  : ダンプ画面キーコントロール処理
// 引数  : none
// 戻り値: none
// =================================================================
static void DumpKeyControl()
{
	if(sys.Repeat&U_KEY){
		dumpstart-=8;
		sys.InitSeqWork--;
	}else if(sys.Repeat&D_KEY){
		dumpstart+=8;
		sys.InitSeqWork--;
	}else if(sys.Repeat&L_KEY){
		dumpstart-=64;
		sys.InitSeqWork--;
	}else if(sys.Repeat&R_KEY){
		dumpstart+=64;
		sys.InitSeqWork--;
	}else if(sys.Repeat&L_BUTTON){
		dumpstart-=0x400;
		sys.InitSeqWork--;
	}else if(sys.Repeat&R_BUTTON){
		dumpstart+=0x400;
		sys.InitSeqWork--;
	}
	if(sys.Trg&SELECT_BUTTON){
		putchecksum(10, 16, (u16*)&UserWork[0x2000]);
	}
}


#endif


