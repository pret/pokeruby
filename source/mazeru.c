//=========================================================================
//	
//
//		イベントデータ交換通信システム
//
//
//		2001.10.05 GAME FREAK Inc.
//
//
//
//
//
//
//=========================================================================

#define SIO_INTR_ON										//割り込みONで


#include "common.h"
#include "multisio.h"
#include "pokesio.h"
#include "cable.h"

#include "calctool.h"
#include "screen.h"
#include "print.h"
#include "palanm.h"
#include "actor.h"
#include "task.h"
#include "ev_comm.h"
#include "intr.h"
#include "menu.h"
#include "mus_tool.h"
#include "tv_mix.h"
#include "popword.h"
#include "saveload.h"
#include "sodateya.h"

#include "script.h"
#include "fld_main.h"
#include "syswork.h"

#include "svld_ini.h"

#include "b_tower.h"		//insert by soga 2002.07.10

#include "sysflag.h"
#include "pocketno.h"
#include "item.h"
#include "ex_load.h"

extern void kanshi_network(u8 taskno);

extern u8  SendPoolBuf[];
//=========================================================================
//	定義
//=========================================================================

//#define RECV_BUF_MAX	(SPLITDATA_POOL_SIZE - 32)
#define RECV_BUF_MAX	(200)

#define COMM_MIX_ENTRY_WAIT		30		/* 通信受付時間(秒) */



SODATEYA_MAIL	SodateyaMail = {};


enum{
	COMM_NORMAL   = 0,
	COMM_SUCCESS ,
};




/* バッファアドレス定義 */
#define	MIX_RECV_BUFFER		( (u32)&(UserWork[0x8000]) )
#define	MIX_SEND_BUFFER		( (u32)&(UserWork[0x18000]) )


/*　データの定義 */
static const u32 MIX_BASE_DATA_ADRS =	( (u32)&(Fld.SecretBase) );
#define	MIX_BASE_DATA_SIZE				( (u32)sizeof(Fld.SecretBase) )

static const u32 MIX_TV_DATA_ADRS =		( (u32)&(Fld.tv_event) );
#define MIX_TV_DATA_SIZE				( (u32)sizeof(Fld.tv_event) )

static const u32 MIX_CM_DATA_ADRS =		( (u32)&(Fld.tv_cm) );
#define MIX_CM_DATA_SIZE				( (u32)sizeof(Fld.tv_cm) )

static const u32 MIX_OYAJI_DATA_ADRS	= ((u32)&(Fld.oyaji_work));
#define MIX_OYAJI_DATA_SIZE				( 64)

static const u32  MIX_POPWORD_DATA_ADRS	= ((u32)&(Fld.PopWord));
#define MIX_POPWORD_DATA_SIZE			( (u32)sizeof(Fld.PopWord))

static const u32  MIX_SODATEYA_MAIL_ADRS = ((u32)&(SodateyaMail));
#define MIX_SODATEYA_MAIL_SIZE			( (u32)sizeof(SodateyaMail))

static const u32  MIX_BATTLETOWER_ADRS = ((u32)&(MyData.BattleTowerWork.SBTT_Mine));
#define MIX_BATTLETOWER_DATA_SIZE		( (u32)sizeof(StockBattleTowerTrainer))

#define MIX_SENDITEM_DATA_SIZE			( 4 )

#define MIX_MARGIN_DATA_SIZE				( 100)



#define MIX_BASE_SEND_ADRS			MIX_SEND_BUFFER
#define	MIX_TV_SEND_ADRS			( MIX_BASE_SEND_ADRS + MIX_BASE_DATA_SIZE )
#define MIX_CM_SEND_ADRS			( MIX_TV_SEND_ADRS + MIX_TV_DATA_SIZE )
#define MIX_OYAJI_SEND_ADRS			( MIX_CM_SEND_ADRS + MIX_CM_DATA_SIZE)
#define MIX_POPWORD_SEND_ADRS		( MIX_OYAJI_SEND_ADRS + MIX_OYAJI_DATA_SIZE)
#define MIX_SODATEYA_MAIL_SEND_ADRS	( MIX_POPWORD_SEND_ADRS + MIX_POPWORD_DATA_SIZE)
#define MIX_BATTLETOWER_SEND_ADRS	( MIX_SODATEYA_MAIL_SEND_ADRS + MIX_SODATEYA_MAIL_SIZE)
#define MIX_SENDITEM_SEND_ADRS		( MIX_BATTLETOWER_SEND_ADRS + MIX_BATTLETOWER_DATA_SIZE)

#define MIX_BASE_RECV_ADRS			MIX_RECV_BUFFER
#define	MIX_TV_RECV_ADRS			( MIX_BASE_RECV_ADRS + MIX_BASE_DATA_SIZE )
#define MIX_CM_RECV_ADRS			( MIX_TV_RECV_ADRS + MIX_TV_DATA_SIZE )
#define MIX_OYAJI_RECV_ADRS			( MIX_CM_RECV_ADRS + MIX_CM_DATA_SIZE) 
#define MIX_POPWORD_RECV_ADRS		( MIX_OYAJI_RECV_ADRS + MIX_OYAJI_DATA_SIZE)
#define MIX_SODATEYA_MAIL_RECV_ADRS	( MIX_POPWORD_RECV_ADRS + MIX_POPWORD_DATA_SIZE)
#define MIX_BATTLETOWER_RECV_ADRS	( MIX_SODATEYA_MAIL_RECV_ADRS + MIX_SODATEYA_MAIL_SIZE)
#define MIX_SENDITEM_RECV_ADRS		( MIX_BATTLETOWER_RECV_ADRS + MIX_BATTLETOWER_DATA_SIZE)

#define MIX_SEND_DATA_SIZE		(MIX_BASE_DATA_SIZE + MIX_TV_DATA_SIZE + MIX_CM_DATA_SIZE \
								+ MIX_OYAJI_DATA_SIZE + MIX_POPWORD_DATA_SIZE \
								+ MIX_SODATEYA_MAIL_SIZE + MIX_BATTLETOWER_DATA_SIZE \
								+ MIX_SENDITEM_DATA_SIZE + MIX_MARGIN_DATA_SIZE )

//=========================================================================
//	変数
//=========================================================================

static u8 CommMixResult;



/* メッセージデータ */

//交換中
static const u8 msg_record_exchange[] = {
	RE_,KO_,bou_,DO_,wo_,spc_,ma_,ze_,te_,i_,ma_,su_,EOM_
};

//交換終了
static const u8 msg_end_record_exchange[] = {
	si_,yyu_,u_,ri_,yyo_,u_,spc_,si_,ma_,si_,ta_,
	CR_,
	o_,tu_,ka_,re_,sa_,ma_,de_,si_,ta_,
	EOM_
};

//static const u8 time_over_msg[] = {
//	zi_,ka_,n_,na_,i_,ni_,
//	CR_,
//	se_,tu_,zo_,ku_,spc_,de_,ki_,ma_,se_,n_,de_,si_,ta_,EOM_
//};





//=========================================================================
//	関数プロトタイプ
//=========================================================================
//GLOBAL type function(arg...);

void CommMixMainTask( u8 no );
u16 get_recv_buf_size();


static void CommHelloTask( u8 no );

static void EndKeyWaitTask( u8 no );
static void ResultPutTask( u8 no );




static u32 get_u32_value( s16 * p);
static void set_u32_value( u32 val, s16 * p);
static u8 get_recv_id( void );
static u8 * get_recv_buf_adrs( u8 id );
static void SioSaveTask(u8 no);

static void CommDataSetTask(u8 no);
static void CommGetDataRecvTask(u8 no);


/* 秘密基地データ交換処理ルーチン */
extern void SioAllBaseSet( void* base , u32 size, u8 id);
extern void	BasePokeSet(void);			//手持ちポケモンをセット

// おやじデータ交換ルーチン
static void OyajiMixer(void* adr, u32 size, u8 id);
static void BattleTowerMixer( void* adr, u32 size, u8 id);

static void SioMailMixer(void* adr, u32 size, u8 id, void* adr2);
static void DistributeItem(void* adr, u8 id);

extern void OyajiReset(void);



//	データ交換中のピコピコエフェクト
extern u8 StartRecordExchangeEffect( void );
extern void FinishRecordExchangeEffect( void );

//=========================================================================
//
//	データ交換モードへの遷移
//
//=========================================================================

//-------------------------------------------------------------------------
//	スクリプトからよびだし
//-------------------------------------------------------------------------
void CommMixStart( void )
{
	AddCommEventStartTask(CommMixMainTask);
}

//=========================================================================
//=========================================================================


//-------------------------------------------------------------------------
//	交換データ作成ルーチン
//-------------------------------------------------------------------------
void CommMixSendDataMake( void )
{
	BasePokeSet();		//手持ちポケモンをセット
	TVDataHimselfLetterWatchFlagOff();	//自分ＴＶデータを見た状態にする

	//秘密基地
	memcpy( (u8*)MIX_BASE_SEND_ADRS,    (u8 *)MIX_BASE_DATA_ADRS,    MIX_BASE_DATA_SIZE );
	//TV・CMﾃﾞｰﾀ
	memcpy( (u8*)MIX_TV_SEND_ADRS,      (u8 *)MIX_TV_DATA_ADRS,      MIX_TV_DATA_SIZE );
	memcpy( (u8*)MIX_CM_SEND_ADRS,      (u8 *)MIX_CM_DATA_ADRS,      MIX_CM_DATA_SIZE );
	//おやじ
	memcpy( (u8*)MIX_OYAJI_SEND_ADRS,   (u8 *)MIX_OYAJI_DATA_ADRS,   MIX_OYAJI_DATA_SIZE );
	//流行
	memcpy( (u8*)MIX_POPWORD_SEND_ADRS, (u8 *)MIX_POPWORD_DATA_ADRS, MIX_POPWORD_DATA_SIZE );

	//育て屋メール
	SodateyaMail.SioMail[0] = Fld.SodateyaWork.SioMail[0];
	SodateyaMail.SioMail[1] = Fld.SodateyaWork.SioMail[1];
	PokeAzukeInfoCheck(&Fld.SodateyaWork,&SodateyaMail);
	memcpy( (u8*)MIX_SODATEYA_MAIL_SEND_ADRS, (u8 *)MIX_SODATEYA_MAIL_ADRS, MIX_SODATEYA_MAIL_SIZE );

	//バトルタワー
	memcpy( (u8*)MIX_BATTLETOWER_SEND_ADRS, (u8 *)MIX_BATTLETOWER_ADRS, MIX_BATTLETOWER_DATA_SIZE );

	//配布アイテム
	if(GetSioConnectId() == 0)		//親だけ配れる
		*(u16*)MIX_SENDITEM_SEND_ADRS = GetExItem();
}

//-------------------------------------------------------------------------
//	交換処理よびだしルーチン
//-------------------------------------------------------------------------
void CommMixerCall( u32 id )
{

	SioAllBaseSet( (void*)MIX_BASE_RECV_ADRS,    MIX_SEND_DATA_SIZE, (u8)id);		//秘密基地
	TVDataMixer(   (void *)MIX_TV_RECV_ADRS,     MIX_SEND_DATA_SIZE, (u8)id);		//TV
	CMDataMixer(   (void *)MIX_CM_RECV_ADRS,     MIX_SEND_DATA_SIZE, (u8)id);		//CM
	OyajiMixer(    (void*)MIX_OYAJI_RECV_ADRS,   MIX_SEND_DATA_SIZE, (u8)id);		//おやじ
	PopWordMixer(  (void*)MIX_POPWORD_RECV_ADRS, MIX_SEND_DATA_SIZE, (u8)id);		//流行
	SioMailMixer(  (void*)MIX_SODATEYA_MAIL_RECV_ADRS,
					MIX_SEND_DATA_SIZE,(u8)id, (void *)MIX_TV_RECV_ADRS);			//育て屋にあるメール
	BattleTowerMixer( (void*)MIX_BATTLETOWER_RECV_ADRS,MIX_SEND_DATA_SIZE,(u8)id);	//バトルタワー
	DistributeItem((void*)MIX_SENDITEM_RECV_ADRS, (u8)id);							//配布アイテム

}

//=========================================================================
//=========================================================================

enum{
	WK_STAT = 0,			//状態遷移保持	0
	WK_MAX,					//転送最大回数	1
	WK_ADR,					//アドレス保持	2
	WK_ADR2,				//	同上		3
	WK_CNT,					//転送回数		4
	WK_ID,					//マルチプレイ転送用ＩＤ	5
	WK_MEMBER,				//現在何人で接続しているか	6
	WK_NOWMEMBER,			//現在誰が転送しているか	7
	WK_WAIT,				//ウェイト用カウンタ		8
	WK_SIZE,				//転送データサイズ（デバッグ用）9
	WK_SUBTASK,				//サブタスクNo	10
	WK_PARENTTASK,			//大元の親タスク	11
	WK_FIRSTWAIT,			//最初の初期化を何回かかける	12
	WK_SIO_WAIT,			// 13
	WK_SUBTASK2,			//サブタスクその２ 14
	WK_SE_TASK				//SE鳴らし用
};



//=========================================================================
//
//	データ交換全体制御タスク
//
//＜制御の流れ＞
//	1)CommEventStartTaskで全員が交換処理開始になるのを待つ
//	2)全員がそろったら、このタスクに制御が渡される
//	3)このタスクで交換処理本体の終了を待つ
//	4)終了したらセーブ処理を行う
//	5)フィールド同期状態に復帰、スクリプトに制御を渡してDelTaskする
//=========================================================================
enum{
	SEQ_START = 0,
	SEQ_WATCHDOG,
	SEQ_FADE_OUT,
	SEQ_SAVE,
	SEQ_WAIT,
	SEQ_END,
};

void RecordCornerSeTask( u8 no)
{
	TaskTable[no].work[0]++;
	if(TaskTable[no].work[0]==50){
		SePlay(SE_W213);
		TaskTable[no].work[0] = 0;
	}
}



void CommMixMainTask( u8 no )
{
	s16 * twk = TaskTable[no].work;


	switch ( twk[WK_STAT] ) {

	case SEQ_START:
		SetMyTrainerInfoStandPos(ScriptParameter1);			//立ち位置情報を設定
		SetEventWorkValue( LOCALWORK0, 1 );					//一度しか起動しないように制御
		CommMixResult = COMM_NORMAL;
		CommMixSendDataMake();								//交換データ生成
		StartRecordExchangeEffect();						//エフェクト開始
		twk[WK_STAT] = SEQ_WATCHDOG;
		twk[WK_SUBTASK] = AddTask( CommHelloTask, 80 );		//通信タスク設定
		twk[WK_SE_TASK] = AddTask( RecordCornerSeTask,81);	//SE鳴らす
		break;

	case SEQ_WATCHDOG:													
		if( TaskTable[twk[WK_SUBTASK]].occ == 0 )			//レコード通信終了待ち
		{
			twk[WK_STAT] = SEQ_FADE_OUT;					//BGMフェードアウト
//			BGM_FadeOutSet( 3);						
			EventFlagSet(SYS_MIX_RECORD);					//レコードコーナーで通信したことが
															//あるかフラグセット
			FinishRecordExchangeEffect();					//エフェクト終了
			DelTask(twk[WK_SE_TASK]);
		};
		break;

	case SEQ_FADE_OUT:												
//		if(BGM_FadeOutCheck()==TRUE){						//BGMフェードアウト待ち
			twk[WK_SUBTASK] = AddTask(SioSaveTask,10);
			twk[WK_STAT] = SEQ_SAVE;
			SePlay(SE_W226);
//		}
		break;

	case SEQ_SAVE:											//通信ストップ＆セーブ処理
		if(TaskTable[twk[WK_SUBTASK]].occ == 0)
		{
//			BGMFadeInSet( 3);
			twk[WK_STAT] = SEQ_WAIT;
			twk[WK_SUBTASK] = AddNinshouRoomTask();			//歩き回りへ戻る処理
			NMenuTalkMsgClr();
			NMenuMsgWrite( msg_end_record_exchange, 4, 15 );
			twk[WK_WAIT] = 0;
			
		}
		break;

	case SEQ_WAIT:
		if(++twk[WK_WAIT] > 60) twk[WK_STAT] = SEQ_END;
		break;

	case SEQ_END:
		if(TaskTable[twk[WK_SUBTASK]].occ == 0){
			CommEventWaitCancel();							//フィールド通信同期シーケンス切り替え
			NMenuScreenClear();
			DelTask(no);
			ContinueFieldScript();							//スクリプトに制御を移す
		}
		break;
	}
}









//=========================================================================
//
//=========================================================================

//-------------------------------------------------------------------------
//	データ交換制御開始タスク
//-------------------------------------------------------------------------





static void CommHelloTask( u8 no )
{
	u8 test_real_number;
	u8 taskno;

	TASK_TABLE * my = &TaskTable[no];

	switch(my->work[WK_STAT])
	{
	case 0:									//通信初期化
		get_recv_buf_size();
		NMenuTalkWinWrite();
		NMenuMsgWrite( msg_record_exchange, 4, 15 );
		my->work[WK_WAIT] = 60 * COMM_MIX_ENTRY_WAIT;
		my->work[WK_STAT] = 400;
		MultiSioFunctionClear();

//		DebugNumPrintInit(0,1,29,0);
//		AddTask(kanshi_network,0);
//		PokemonMultiSioInit();
		break;
	case 100:
		my->work[WK_FIRSTWAIT]++;			//接続までｳｪｲﾄ
		if(my->work[WK_FIRSTWAIT]>20){
			my->work[WK_FIRSTWAIT]=0;
			my->work[WK_STAT]=101;
		}
		break;
	case 101:
		test_real_number = GetSioRealConnectNumber();
		if ( GetMyConnectIsParent() == 1 ) {
			if ( test_real_number == GetSioReliableNumber() ) {
				SePlay( SE_PIN );
				my->work[WK_STAT]=201;
				my->work[WK_FIRSTWAIT] = 0;
			}
		} else {
			SePlay( SE_BOO );
			my->work[WK_STAT]=301;
		}
		break;		
	case 201:									//親処理
		if ( GetSioReliableNumber() == GetSioRealConnectNumber() ) {
//			if(sys.Trg&A_BUTTON){
			if(++my->work[WK_FIRSTWAIT]>30*GetSioRealConnectNumber()){
				MultiSioSignalDecision();
				my->work[WK_STAT]=1;
			}
		}
		break;
	case 301:
		if ( GetSioReliableNumber() == GetSioRealConnectNumber() ) {
			my->work[WK_STAT]=1;
		}
		break;									//子処理

	case 400:
		my->work[WK_FIRSTWAIT]++;
		if(my->work[WK_FIRSTWAIT]>20){
			my->work[WK_STAT] = 1;
			my->work[WK_FIRSTWAIT] = 0;
		}
		break;

	case 1:									//接続確認
		if( pokemon_sio_flag )
		{
			PM_NumMsgSet( StrTempBuffer0, get_recv_id(), NUM_MODE_ZERO, 2);
			my->work[WK_STAT]=5;
			break;
		};

		//通信が確立しない場合
//		PM_NumMsgSet( StrTempBuffer0, my->work[WK_WAIT]/60, NUM_MODE_ZERO, 3);
//		NMenuMsgWrite( StrTempBuffer0, 3, 17 );
//		my->work[WK_WAIT]--;
//		if( my->work[WK_WAIT] == 0 )		//タイムオーバー処理
//		{
//			NMenuWinMsgWrite( time_over_msg );
//			my->TaskAdrs = EndKeyWaitTask;	//タスクも終了処理へ
//		};
		break;
	case 2:	
																//送信か受信か振り分け
		my->work[WK_MEMBER] = GetSioRealConnectNumber();		//人数確認
		my->work[WK_STAT] = 0;
		my->work[WK_ID] = get_recv_id();						//自分のIDを保存
		my->TaskAdrs = CommDataSetTask;

		set_u32_value( MIX_BASE_SEND_ADRS, &my->work[WK_ADR] );
		taskno = AddTask(CommGetDataRecvTask,80);
		my->work[WK_SUBTASK] = taskno;
		TaskTable[taskno].work[0] = no;
		set_u32_value( MIX_BASE_RECV_ADRS, &TaskTable[taskno].work[5] );
		break;
	case 5:														//接続が確認できない場合は
		if(++my->work[WK_SUBTASK]>60){							//1秒まって再確認
			my->work[WK_SUBTASK] = 0;
			my->work[WK_STAT] = 2;
		}
		break;
	};

}



// =================================================================
// CommParendTask2
// 概要  : データをセットしつづける
//		 : 親はデータ交換コマンドも発行する
// 引数  : no
// 戻り値: none
// =================================================================
static void CommDataSetTask(u8 no)
{
	TASK_TABLE *my;
	u8 * src;


	my = &TaskTable[no];
	switch(my->work[0])
	{
		case 0:										//データ送信用に準備
			src = (u8*)(get_u32_value(&my->work[WK_ADR]) + RECV_BUF_MAX * my->work[WK_CNT]);
			memcpy( SendPoolBuf, src, RECV_BUF_MAX );

			my->work[0]++;
			break;
		case 1:
			if(GetSioConnectId()==0){				//親ならデータ交換開始を通知
				SplitDataExchangeStart(1);
			}
			my->work[0]++;
			break;
		case 2:
			break;
		case 3:										//データが取得終了したらここにくるので
													//カウントを進めて次の送信準備へ
			my->work[WK_CNT]++;						
			if(my->work[WK_CNT]==((MIX_SEND_DATA_SIZE/RECV_BUF_MAX)+1)){
				my->work[0]++;		
			}else{
				my->work[0]=0;
			}
			break;
		case 4:										//おしまい
			if( TaskTable[my->work[WK_SUBTASK]].occ == 0 )
			{
				my->TaskAdrs=ResultPutTask;
			}
			break;
	
	}
}

// =================================================================
// CommGetDataRecvTask
// 概要  : 受信したデータを格納しつづける（親子関係無く処理）
// 引数  : no
// work0 :CommDataSetTaskのタスク番号
// work1 :親の受信回数
// work2 :子１
// work3 :子２
// work4 :子３
// work5 :受信ﾊﾞｯﾌｧアドレス
// 戻り値: none
// =================================================================
static void CommGetDataRecvTask(u8 no)
{
	u8 result,i,end;
	TASK_TABLE * my;
	u32 work;
	u8 * src;
	u8 * dst;

	my = &TaskTable[no];
	result = SplitDataResult();
	end = 0;

	if(result==GetConnectMemberBitData()){					//全員受信したか
		for(i=0;i<GetConnectSioMenberNum();i++){			//受信終了かチェック
			if((result>>i)&1){
				dst = (u8 *)( get_u32_value( &my->work[5] ) + RECV_BUF_MAX * my->work[i+1] + i * MIX_SEND_DATA_SIZE);
				src = (u8 *)&(get_recv_buf_adrs(i)[0]);
				if((RECV_BUF_MAX*(my->work[i+1]+1))>MIX_SEND_DATA_SIZE){
					work = MIX_SEND_DATA_SIZE - (RECV_BUF_MAX*(my->work[i+1]));
					memcpy( dst, src, work );
				}else{
					memcpy( dst, src, RECV_BUF_MAX );
				}
				SplitDataResultReset2(i);					//受信フラグをID別にリセット
				my->work[i+1]++;							//受信カウンタをインクリメント
				if(my->work[i+1]==((MIX_SEND_DATA_SIZE/RECV_BUF_MAX)+1)){
					end++;
				}
			}
		}
		TaskTable[my->work[0]].work[0]++;
	}
	if(end==GetConnectSioMenberNum()) DelTask(no);

}



//=========================================================================
//=========================================================================

static void end_watch_task( u8 no )
{
	TASK_TABLE * my = &TaskTable[no];

	if ( TaskTable[my->work[WK_SUBTASK]].occ == 0 ) DelTask( no );
}

//-------------------------------------------------------------------------
//-------------------------------------------------------------------------
static void EndKeyWaitTask( u8 no )
{
	TASK_TABLE * my = &TaskTable[no];
	my->TaskAdrs = end_watch_task;
	if( CommMixResult == COMM_SUCCESS ) CommMixerCall(TaskTable[no].work[WK_ID]);
	
}

//-------------------------------------------------------------------------
//-------------------------------------------------------------------------
static void ResultPutTask( u8 no )
{
	TaskTable[no].TaskAdrs = EndKeyWaitTask;

	CommMixResult = COMM_SUCCESS;
};



// =============================================
// get_u32_value
// 概要  : アドレスを渡した場所から32ﾋﾞｯﾄデータを取得
// 引数  : p
// 戻り値: static u32
// =============================================
static u32 get_u32_value( s16 * p)
{
	return  (u16)*p | ( (u16)*(p+1) << 16 );
}

// =============================================
// set_u32_value
// 概要  : 渡した場所に32ﾋﾞｯﾄﾃﾞｰﾀをｾｯﾄ
// 引数  : val
//       : p
// 戻り値: static void
// =============================================
static void set_u32_value( u32 val, s16 * p)
{
	*p = (s16)(val & 0xffff);
	*(p+1) = (s16)( (val >> 16) & 0xffff );
}

// =============================================
// get_recv_id
// 概要  : 通信IDを取得
// 引数  : none
// 戻り値: static u8
// =============================================
static u8 get_recv_id( void )
{
	return GetSioConnectId();
};

// =============================================
// get_recv_buf_adrs
// 概要  : 自分が取得すべきデータアドレスを算出
// 引数  : id
// 戻り値: static u8 *
// =============================================
static u8 * get_recv_buf_adrs( u8 id )
{
	return(u8 *)&(RecvPoolBuf[id][0]);
}


u32 mix_buf_size;

// =============================================
// get_recv_buf_size
// 概要  : レコードコーナーが扱うデータのバイト数を取得
// 引数  : none
// 戻り値: u16
// =============================================
u16 get_recv_buf_size()
{
	mix_buf_size = MIX_SEND_DATA_SIZE;
	return MIX_SEND_DATA_SIZE;									//データ全体の大きさ
//	return MIX_POPWORD_RECV_ADRS	- MIX_BASE_RECV_ADRS;		//流行データのオフセット
	
}


static const u8 koukantbl2[2]={			//交換用ﾃｰﾌﾞﾙ（超テキトー）
		1,0				
	};
static const u8 koukantbl3[2][3]={
		{1,2,0,},{2,0,1,},
	};
static const u8 koukantbl4[9][4]={
		{ 1,0,3,2,},{ 3,0,1,2,},{ 2,0,3,1,},
		{ 1,3,0,2,},{ 2,3,0,1,},{ 3,2,0,1,},
		{ 1,2,3,0,},{ 2,3,1,0,},{ 3,2,1,0,},
	};



// =================================================================
// MakeKoukanTable
// 概要  : 交換入れ替え用のテーブル作成
// 引数  : tbl
// 戻り値: none
// =================================================================
static void MakeKoukanTable(u8 *tbl)
{
	u32 key,num,i;
	num = GetConnectSioMenberNum();		//人数
	
	switch(num){						//交換してる人数によって混ぜ方を替える
		case 2:
			for(i=0;i<2;i++) 
				tbl[i] = koukantbl2[i];
			break;
		case 3:
//			w = pp_rand()%2;
			key = GetSioTrainerId(0)%2;			//親のIDを取得して混ぜ合わせの種を取得
			for(i=0;i<3;i++) 			//３人の時は最大２パターン
				tbl[i] = koukantbl3[key][i];
			break;
		case 4:
//			w = pp_rand()%9;
			key = GetSioTrainerId(0)%9;			//親のIDを取得して混ぜ合わせの種を取得
			for(i=0;i<4;i++) 			//４人の時は最大９パターン
				tbl[i] = koukantbl4[key][i];
			break;
	}
	
}
// =================================================================
// OyajiMixer
// 概要  : おやじデータ交換処理
// 引数  : adr		ﾃﾞｰﾀｱﾄﾞﾚｽの先頭
//       : size		何バイト毎に配置されているかのサイズ
//       : id		自分のID
// 戻り値: none
// =================================================================
static void OyajiMixer(void* adr, u32 size,u8 id)
{
	u8  koukantbl[4];
	
	MakeKoukanTable(koukantbl);

	memcpy((u8*)adr+size*id,(u8*)MIX_OYAJI_DATA_ADRS,64);	//自分のデータをコピー
	
	memcpy((u8*)MIX_OYAJI_DATA_ADRS, 
		(u8*)(adr+size*koukantbl[id]),MIX_OYAJI_DATA_SIZE);		//混ざったデータを受け取る
	OyajiReset();											//おやじ初期化

}


static u8  testkoukantbl[4];

// =================================================================
// BattleTowerMixer
// 概要  : バトルタワーデータ交換処理
// 引数  : adr		バトルタワーデータID0のアドレス
//       : size		レコードコーナーデータの大きさ
//       : id		自分のID
// 戻り値: none
// =================================================================
static void BattleTowerMixer( void* adr, u32 size, u8 id)
{
	
	MakeKoukanTable(testkoukantbl);
	

	//自分のIDのバトルタワーデータを他人のIDのバトルタワーデータで潰す
	memcpy((u8*)adr+size*id, 
		(u8*)(adr+size*testkoukantbl[id]),MIX_BATTLETOWER_DATA_SIZE);

	//曽我部さんに自分のIDのアドレスにある、他人から貰ったバトルタワーデータを渡す
	BattleTowerStockData(adr+size*id);
}


// =================================================================
// SioMailCheck
// 概要  : 育て屋メールワークにメールがあるかないか
// 引数  : smd
// 戻り値: u8
// =================================================================
u8 SioMailCheck(SIO_MAIL_DATA *smd)
{
	return smd->Mail.design_no;
}

// =================================================================
// SodateyaMailExchange
// 概要  : 育て屋メールを入れかえる
// 引数  : adr
//       : size
//       : a
//       : b
// 戻り値: none
// =================================================================
static void SodateyaMailExchange(void* adr, u32 size, u8 tbl[4][2], u8 a, u8 b)
{
	SODATEYA_MAIL	*smd1,*smd2;
	SIO_MAIL_DATA	work;

	smd1 = (SODATEYA_MAIL*)(adr+size*tbl[a][0]);			//一旦保存するためにaのポインタ充てる
	work = smd1->SioMail[tbl[a][1]];							//指定のメールを保存

	smd2 = (SODATEYA_MAIL*)(adr+size*tbl[b][0]);			//bのポインタを充てる

	smd1->SioMail[tbl[a][1]] = smd2->SioMail[tbl[b][1]];		//aの場所にbのメールをコピー
	smd2->SioMail[tbl[b][1]] = work;
}



static const u8 koukan3tbl2[3][2]={
	{0,1},{1,2},{2,0},	//４人でレコードに行って実際に３人しか交換できないこともありそうなので
						//{0,1}の交換も残す
};
static const u8 koukan4tbl2[3][2][2] = {
	{
		{ 0, 1,},		//これだと２人で交換するのと同じなのでこの取り合わせはやめる
		{ 2, 3,},
	},

	{
		{ 0, 2},
		{ 1, 3},
	},
	{
		{ 0, 3},
		{ 2, 1},
	},
};


// =================================================================
// GetKeyNumberSodateyaMail
// 概要  : 育て屋メールの乱数用にＴＶデータをu8で256バイト分足した数字を返す
// 引数  : adrs
// 戻り値: static u8
// =================================================================
static u8 GetKeyNumberSodateyaMail(void *adrs)
{
	u8 *p, ret;
	int i;

	p = (u8*)adrs;
	
	ret = 0;
	for(i=0;i<256;i++) ret += p[i];
	
	return ret;
}
// =================================================================
// SioMailMixer
// 概要  : 育て屋に預けられているメールを勝手に交換する
// 引数  : adr	育て屋メールデータ
//       : size 次の人のデータへのバイト数
//       : id	自分のＩＤ
//		 : adr2 親のＴＶデータのアドレス
// 戻り値: none
// =================================================================
static void SioMailMixer(void* adr, u32 size, u8 id, void* adr2)
{
	SODATEYA_MAIL	*smd;
	u8 check[4];		//メールを持ってるかフラグ（0xff=無し,0か1=交換するために指定されたメール）
	u8 member;			//通信で接続している人数
	u8 mailnum;			//メールを持っている人数
	u8 pokenum[4];		//ポケモンを預けているフラグ(0=いない	1,2=ポケモンの数)
	u8 takenum;			//ポケモンを預けている人の数
	u8 fig;
	u16 randbak,i,w;
	u8 koukan_a,koukan_b;
	u8 *siomailadr[4];
	u8 now_my_id;

	u8 permit[4][2];		//メールを入れ替えてもいい場所を示すフラグ
	u8 exchangable;
    u8 ablemail[4][2];
	u8 mail1,mail2;

	randbak = pp_rand();					//ランダムを保存

	pp_srand(SioTrainerInfo[0].Id);			//親のＩＤでランダムを初期化
	member = GetConnectSioMenberNum();		//人数

	for(i=0;i<4;i++){						//ワーク初期化
		check[i] = 0xff;
		pokenum[i] = 0;
		permit[i][0] = 0;
		permit[i][1] = 0;
	}

	mailnum = 0;
	takenum = 0;
	exchangable = 0;

	for(i=0;i<member;i++){
		smd = (SODATEYA_MAIL*)(adr+size*i);			
		if(smd->PokeNum==0) continue;
		for(w=0;w<smd->PokeNum;w++){
			if(smd->PokeFlag[w]==0){		//アイテムを持っていないかメール
				permit[i][w] = 1;			//交換してもいい
				exchangable++;
			}
		}
	}
	w = 0;
	for(i=0;i<member;i++){					//メール交換ができるIDの人を探す
		smd = (SODATEYA_MAIL*)(adr+size*i);			
		if(permit[i][0]==1 || permit[i][1]==1){
			takenum++;
		}
		if(permit[i][0]==1 && permit[i][1]==0){	//[0]=ID　の [1]=番目のメールを交換するか
			ablemail[w][0] = i;                         //上詰めのリストにする
			ablemail[w][1] = 0;
			w++;
		}else if(permit[i][0]==0 && permit[i][1]==1){
			ablemail[w][0] = i;
			ablemail[w][1] = 1;
			w++;
		}else if(permit[i][0]==1 && permit[i][1]==1){	//両方OKの時はメールを持ってる人を優先
			ablemail[w][0] = i;							//両方とももってたるか両方とも持ってないならランダム
			mail1 = SioMailCheck(&smd->SioMail[0]);
			mail2 = SioMailCheck(&smd->SioMail[1]);
			if((mail1==NON_ITEM && mail2==NON_ITEM) || (mail1!=NON_ITEM && mail2!=NON_ITEM)){
				ablemail[w][1] = pp_rand()%2;
			}else if(mail1!=NON_ITEM && mail2==NON_ITEM){
				ablemail[w][1] = 0;
			}else if(mail1==NON_ITEM && mail2!=NON_ITEM){
				ablemail[w][1] = 1;
			}
			w++;
		}
	}
	


	for(i=0;i<4;i++){
		smd = (SODATEYA_MAIL*)adr+size*id;
		siomailadr[i] = (u8*)smd;
	}
	now_my_id = id;

//	fig = SioTrainerInfo[0].Id%3;			
	fig = GetKeyNumberSodateyaMail(adr2)%3;	//入れかえるための乱数を取る
	switch(takenum){						//ポケモンを預けているトレーナーの数によって混ぜ方を替える
		case 2:
			SodateyaMailExchange(adr, size, ablemail, 0,1);			//2人預けていれば
			break;
		case 3:														//3人預けていれば
//			SodateyaMailExchange(adr,size,change,koukan3tbl2[fig][0],koukan3tbl2[fig][1]);
			koukan_a = koukan3tbl2[fig][0];
			koukan_b = koukan3tbl2[fig][1];
			SodateyaMailExchange(adr,size,ablemail,koukan_a,koukan_b);
			break;
		case 4:														//4人預けていれば
			SodateyaMailExchange(adr, size,ablemail,koukan4tbl2[fig][0][0],koukan4tbl2[fig][0][1]);
			SodateyaMailExchange(adr, size,ablemail,koukan4tbl2[fig][1][0],koukan4tbl2[fig][1][1]);
			break;
	}

	//交換した結果を自分の育て屋メールに戻す（入れ替わってないこともある）
	smd = (SODATEYA_MAIL*)(adr+size*id);
	Fld.SodateyaWork.SioMail[0] = smd->SioMail[0];
	Fld.SodateyaWork.SioMail[1] = smd->SioMail[1];
	

	
	pp_srand(randbak);
}

// =================================================================
// DistributeItem
// 概要  : アイテムを配る
// 引数  : adr
//       : id
// 戻り値: none
// =================================================================
static void DistributeItem(void* adr, u8 id)
{
	u16 *item;
	if(id==0) return;		//親が配るので親はもらわない

	item = (u16*)adr;
	if(*item!=0){
		if(GetPocketNo(*item)==IMPORTANT_POCKET){
			//大事な道具の場合
			if(ItemCheck( *item, 1 )==FALSE && PCBoxItemCheck(*item,1)==FALSE && AddItem(*item,1)){
				SetEventWorkValue( LOCALWORK1, *item );		//スクリプトにもらったアイテムを通知する
				PM_strcpy(StrTempBuffer0,SioTrainerInfo[0].name);
				if(*item == ITEM_MUGENNOTIKETTO) EventFlagSet(SYS_KOKORO_EVENT);	//むげんのチケット専用処理
			}else{
				SetEventWorkValue(LOCALWORK1,0);
			}
		}else{
			//普通の道具の場合（配るか分からないけど）
			if(AddItem(*item,1) == TRUE){
				SetEventWorkValue( LOCALWORK1, *item );		//スクリプトにもらったアイテムを通知する
				PM_strcpy(StrTempBuffer0,SioTrainerInfo[0].name);
			}else{
				SetEventWorkValue(LOCALWORK1,0);
			}
		}
	}
}

// =================================================================
// SioSaveTask
// 概要  : 通信ストップ後セーブを行うタスク
// 引数  : none
// 戻り値: none
// =================================================================
static void SioSaveTask(u8 no)
{
	TASK_TABLE * my = &TaskTable[no];
	
	switch(my->work[0]){
			case 0:										//
				my->work[0]++;
				break;
			case 1:										//
					my->work[0]++;
				break;
			case 2:

				SetCommSaveFlag();
//				PokeAGBSave( POKEAGB_SVFLD );			
				PokeAGBSaveFieldDivInit();				//セーブ開始
				my->work[0]++;
				break;
				
			case 3:
				if(PokeAGBSaveFieldDiv()){				//セーブ終わるまで呼ぶ
					ClearCommSaveFlag();
					my->work[0]++;
					my->work[1] = 0;
				}
				break;
			case 4:										//待ち
				if(++my->work[1]>10){
					SetSioEndDataStart();
					my->work[0]++;
				}
				break;
			case 5:
				if(pokemon_sio_flag==0){				//通信終了待機
					DelTask(no);				
				}
				break;
	}
}
