/********************************************************************/
/*          multi_sio.c                                             */
/*            マルチ通信サンプルプログラム                          */
/*                                            T.Nakano              */
/*          Copyright (C) 1999-2002 NINTENDO Co.,Ltd.  Ver.20020927 */
/********************************************************************/

#include <Agb.h>
#include "multisio.h"

//#define H_BLANK_INTR_ON
//#define DEBUG_USERWORK


/*
#ifdef DEBUG_USERWORK
extern u8 UserWork[];
extern u16 RecvBuf[3][4];
#endif
*/

//#define DEBUG

/*------------------------------------------------------------------*/
/*                       定義                                       */
/*------------------------------------------------------------------*/
//#define REG_RECV_DATA(x)		(REG_SIOMLT_RECV + (x * 0x02))
#define MULTI_SIO_SEND_BUF		(M_s.SendBuf)
#define MULTI_SIO_RECV_BUF		(M_s.RecvBuf)


/*------------------------------------------------------------------*/
/*                       グローバル変数                             */
/*------------------------------------------------------------------*/
u16	ImeBak;				//IMEレジスタのバックアップ
MultiSioArea M_s;		//マルチプレイ通信ワークエリア構造体

static u8	SioIntrCount;			//SIO割り込み監視カウンタ
static u8	CheckSendBufFlag;	//バッファサイズ確認フラグ
static u16	CheckSendData;		//送信データの論理和チェック
static u16	CheckRecvData;		//全受信データの論理和チェック

static u8	SioStartFlag;			//通信開始フラグ
static u8	PlayersNumBak;


/*
u16	debugworkflag;
u16	debugworkcnt;
*/

u8	Send_Buf_Size;		//送信FIFOバッファのたまり（遅延）
u8	Recv_Buf_Size;		//受信FIFOバッファのたまり（遅延）


#ifdef DEBUG
//処理時間計測用
static u16	TmrBuf[256];	//測定タイマー値
static u8	count;			//カウント

#define TIMER0_SET	{								\
	*(vu16 *)REG_TM0CNT_L = 0;				\
	*(vu16 *)REG_TM0CNT_H = 0x0080;		\
}

#define TIMER_STOP	{		\
	TmrBuf[count++]= *(vu16 *)REG_TM0CNT_L;		\
	*(vu16 *)REG_TM0CNT_L = 0;								\
	*(vu16 *)REG_TM0CNT_H = 0;								\
}

#endif //DEBUG

/*------------------------------------------------------------------*/
/*                       通信終了                                   */
/*------------------------------------------------------------------*/
void Multi_SioStop(void)
{
	ImeBak = *(vu16 *)REG_IME;							//IMEの退避
	*(vu16 *)REG_IME = 0;								// IME リセット

	*(vu16 *)REG_IE &= ~(SIO_INTR_FLAG					//SIO割り込み不許可
    				| MULTI_SIO_TIMER_INTR_FLAG);		//タイマー割り込み不許可

	*(vu16 *)REG_IME = ImeBak;							// IMEの復帰

	*(vu16 *)REG_SIOCNT = 0;							//SIO停止
	*(vu16 *)REG_MULTI_SIO_TIMER_H = 0;					//タイマーを停止

    *(vu16 *)REG_IF = (SIO_INTR_FLAG					//直前のSIO割り込み要求をクリア
    				| MULTI_SIO_TIMER_INTR_FLAG);		//直前のタイマー割り込み要求をクリア

//	DmaClear(3, 0, &M_s, sizeof(M_s), 32);
	CpuClear( 0, &M_s, sizeof(M_s), 32);
}


/*------------------------------------------------------------------*/
/*             マルチプレイ通信初期化                               */
/*------------------------------------------------------------------*/
void Multi_SioInit(void)
{
	ImeBak =  *(vu16 *)REG_IME;							//IMEの退避
	*(vu16 *)REG_IME = 0;								// IME リセット

	*(vu16 *)REG_IE &= ~(SIO_INTR_FLAG					//SIO割り込み不許可
    					| MULTI_SIO_TIMER_INTR_FLAG);	//タイマー割り込み不許可

	*(vu16 *)REG_IME = ImeBak;							// IMEの復帰

	//通信モード設定
	*(vu16 *)REG_RCNT = R_SIO_MASTER_MODE;
	*(vu16 *)REG_SIOCNT = SIO_MULTI_MODE;	//通信モードをマルチプレイモードに設定

	*(vu16 *)REG_SIOCNT |=(SIO_IF_ENABLE	//通信割り込み要求許可
    				 	| SIO_115200_BPS);	//ボーレート設定

	//割り込み許可
	ImeBak = *(vu16 *)REG_IME;				//IMEの退避

	*(vu16 *)REG_IME = 0;					// IME リセット
	*(vu16 *)REG_IE |= SIO_INTR_FLAG;		//SIO割り込み許可

	*(vu16 *)REG_IME = ImeBak;				// IMEの復帰

	*(vu16 *)REG_SIOMLT_SEND = 0;			//送信レジスタ初期化（ボタン連打による誤動作への対策）

//	DmaClear(3, 0, &M_s, sizeof(M_s), 32);
	CpuClear( 0, &M_s, sizeof(M_s), 32);

//	SendBufInit();	//送信バッファの初期化（FIFOバッファを「0」で初期化する場合は実行する必要なし）
//	RecvBufInit();	//受信バッファの初期化（FIFOバッファを「0」で初期化する場合は実行する必要なし）

	//諸変数の初期化
	SioIntrCount = 0;
	CheckSendData = 0;
	CheckRecvData = 0;
	SioStartFlag = 0;
	PlayersNumBak = 0;


	Send_Buf_Size = 0;
	Recv_Buf_Size = 0;
}


/*------------------------------------------------------------------*/
/*                     通信対応ゲーム初期化                         */
/*------------------------------------------------------------------*/
void Multi_SioGameInit(void)
{
	Multi_SioInit();		//通信初期化
	Multi_SioStop();		//通信ストップ
}


/*------------------------------------------------------------------*/
/*                     マルチプレイ通信メイン                       */
/*------------------------------------------------------------------*/
u32 Multi_SioMain(u8 *Signal_ptr, u16 *SendData_ptr, u16 (*RecvData_ptr)[MULTI_SIO_PLAYERS_MAX])
{
	switch(M_s.State){
		case MULTI_SIO_STOP:		//*****通信ストップ*****//

			Multi_SioStop();
			M_s.State = MULTI_SIO_INIT;

			break;

		case MULTI_SIO_INIT:		//*****通信初期化*****//

			if(*Signal_ptr == SIGNAL_DECISION){
				Multi_SioInit();
				M_s.State = MULTI_SIO_CONNECT_CHECK;
			}

			break;

		case MULTI_SIO_CONNECT_CHECK:		//*****接続認識*****//

			switch(*Signal_ptr){
				case SIGNAL_DECISION:
					if((M_s.Type == SIO_MULTI_PARENT) && (M_s.PlayersNum >= 2))
						M_s.Signal = SIGNAL_DECISION;	//親機ならシグナルセット
					break;

				case SIGNAL_CANCEL:
					M_s.State = MULTI_SIO_STOP;
					*(vu16 *)REG_SIOMLT_SEND = 0;		//送信レジスタ初期化
					break;

				default:	ConnectCheck();		//接続チェック
					break;
			}

			break;

		case MULTI_SIO_CONNECT_DECISION:		//*****接続決定*****//

			TimerInit();		//タイマー設定
			M_s.State = MULTI_SIO_MAIN;

		case MULTI_SIO_MAIN:				//*****通信メイン*****//

			PutSendData(SendData_ptr);		//送信データを送信FIFOバッファにセット
			GetRecvData(RecvData_ptr);		//受信側FIFOバッファから受信データを取り出す

/*
#ifdef DEBUG_USERWORK
				if(RecvBuf[0][0]==0xBBBB)
					debugworkflag=1;
				if(debugworkflag)
					debugworkcnt++;
#endif
*/

			break;
	}

	*Signal_ptr = SIGNAL_OFF;	//シグナルOFF

	return		M_s.ID											//接続ID
			|	M_s.PlayersNum << 2								//接続プレイヤー数
			|	(M_s.Type == SIO_MULTI_PARENT) << 5				//接続タイプ
			|	(M_s.State == MULTI_SIO_MAIN) << 6				//通信メイン中か否か
			|	M_s.SkipFrameFlag << 8							//フレームスキップ
			|	M_s.MultiSioVersion << 9							//ROMバージョン
			|	M_s.HardError << 12								//ハードエラー
			|	M_s.CheckSumError << 13							//チェックサムエラー
			|	M_s.OverFlowError << 14							//オーバーフローエラー、1：受信側、2：送信側
			|	(M_s.SioIntervalError==1) << 16						//タイマー設定値エラー（親機）
			|	(M_s.ID >= MULTI_SIO_PLAYERS_MAX) << 17			//接続IDオーバーエラー
			|	(M_s.SioIntervalError==2)<<18;		//SIO割り込み停止エラー（子機）

}


/*------------------------------------------------------------------*/
/*                        コネクタチェック                          */
/*------------------------------------------------------------------*/
void ConnectCheck(void)
{
	SioMultiCnt SioCntBak = *(SioMultiCnt *)REG_SIOCNT;

	if(!SioCntBak.SI && SioCntBak.SD && !M_s.ID)
			M_s.Type = SIO_MULTI_PARENT;	//親接続
	else
			M_s.Type = SIO_MULTI_CHILD;	//子接続
}


/*------------------------------------------------------------------*/
/*                         タイマー初期化                             */
/*------------------------------------------------------------------*/
void TimerInit(void)
{
	if(M_s.Type){		//親接続
		*(vu16 *)REG_MULTI_SIO_TIMER_L = MULTI_SIO_TIMER_COUNT;		//タイマー値の設定
		*(vu16 *)REG_MULTI_SIO_TIMER_H = (MULTI_SIO_TIMER_PRESCALER	//プリスケーラ値の設定	
										| TMR_IF_ENABLE) >> 16;		//タイマー割り込み要求許可

		ImeBak =  *(vu16 *)REG_IME;									//IMEの退避
		*(vu16 *)REG_IME = 0;										// IME リセット

		*(vu16 *)REG_IE |= MULTI_SIO_TIMER_INTR_FLAG;				//タイマー割り込み許可

		*(vu16 *)REG_IME = ImeBak;									//IME セット
	}
}


/*------------------------------------------------------------------*/
//            送信FIFOバッファに送信データを蓄積                   //
/*------------------------------------------------------------------*/
void PutSendData(u16 *SendData_ptr)
{
	u8	i;
	u8	tail;		//FIFOバッファのしっぽ
//	u16	IeBak;		//割り込み許可フラグのバックアップ

	ImeBak = *(vu16 *)REG_IME;				//IMEの退避
	*(vu16 *)REG_IME = 0;					// IME リセット

	#ifdef H_BLANK_INTR_ON
	IeBak = *(vu16 *)REG_IE;				//IEのバックアップ
	*(vu16 *)REG_IE = H_BLANK_INTR_FLAG;	//H割り込みのみ許可;
	*(vu16 *)REG_IME = 1;					//割り込み許可（H割り込みのみ）
	#endif //H_BLANK_INTR_ON

	if(MULTI_SIO_SEND_BUF.Size < MULTI_SIO_SEND_BUF_SIZE){		//送信FIFOバッファが満杯でなければデータ蓄積
		//FIFOバッファのしっぽを計算
		tail = MULTI_SIO_SEND_BUF.Head + MULTI_SIO_SEND_BUF.Size;
		if(tail>= MULTI_SIO_SEND_BUF_SIZE)
			tail -= MULTI_SIO_SEND_BUF_SIZE;

		//FIFOバッファに蓄積
		for(i = 0; i < MULTI_SIO_SEND_MAX; i ++){
			#ifdef BUFFER_COMP_FUNC_ON
			CheckSendData |= *SendData_ptr;							//送信データの論理和チェック
			#endif //BUFFER_COMP_FUNC_ON

			//********送信FIFOバッファに蓄積********//
			MULTI_SIO_SEND_BUF.Item[i][tail] = *SendData_ptr;

			*SendData_ptr = INVALID_DATA;							//ユーザー送信バッファを初期化
			SendData_ptr ++;
		}

	}else	M_s.OverFlowError = 1;		//送信FIFOバッファのオーバーフロー検出


	#ifdef BUFFER_COMP_FUNC_ON
	if(CheckSendData != 0)
	#endif //BUFFER_COMP_FUNC_ON
	{
		MULTI_SIO_SEND_BUF.Size ++;		//サイズを1つ増やす
		CheckSendData = 0;				//初期化
	}

	#ifdef H_BLANK_INTR_ON
	*(vu16 *)REG_IME = 0;			// IME リセット
	*(vu16 *)REG_IE = IeBak;		//IEを復帰
	#endif //H_BLANK_INTR_ON

	*(vu16 *)REG_IME = ImeBak;		// IMEの復帰

	Send_Buf_Size = MULTI_SIO_SEND_BUF.Size;		//送信データの遅延を見る
}


/*------------------------------------------------------------------*/
//           受信FIFOバッファから受信データを取り出す
/*------------------------------------------------------------------*/
void GetRecvData(u16 (*RecvData_ptr)[MULTI_SIO_PLAYERS_MAX])
{
	u8	i, j;
//	u16	IeBak;		//割り込み許可フラグのバックアップ

	ImeBak = *(vu16 *)REG_IME;				//IMEの退避
	*(vu16 *)REG_IME = 0;					// IME リセット

	#ifdef H_BLANK_INTR_ON
	IeBak = *(vu16 *)REG_IE;				//IEのバックアップ
	*(vu16 *)REG_IE = H_BLANK_INTR_FLAG;	//H割り込みのみ許可;
	*(vu16 *)REG_IME = 1;					//割り込み許可（H割り込みのみ）
	#endif //H_BLANK_INTR_ON

	if(MULTI_SIO_RECV_BUF.Size == 0){
		for(i = 0; i < MULTI_SIO_RECV_MAX; i++){
			for(j = 0; j < M_s.PlayersNum; j++)
				RecvData_ptr[i][j] = INVALID_DATA;		//ユーザー受信バッファを初期化
		}

		M_s.SkipFrameFlag = 1;		//フレームスキップフラグを立てる

	}else{
		//FIFOバッファからデータを取り出し、ユーザーバッファへ受け渡す
		for(i = 0; i < MULTI_SIO_RECV_MAX; i++){
			for(j = 0; j < M_s.PlayersNum; j ++){
				RecvData_ptr[i][j] = MULTI_SIO_RECV_BUF.Item[j][i][MULTI_SIO_RECV_BUF.Head];	//受信データの取り出し
//				MULTI_SIO_RECV_BUF.Item[j][i][MULTI_SIO_RECV_BUF.Head] = EMPTY_DATA;			//バッファをカラデータで初期化
			}
		}

		MULTI_SIO_RECV_BUF.Size --;		//サイズをデクリメント
		MULTI_SIO_RECV_BUF.Head ++;		//ヘッドを移動

		if(MULTI_SIO_RECV_BUF.Head >= MULTI_SIO_RECV_BUF_SIZE)
			MULTI_SIO_RECV_BUF.Head = 0;

		M_s.SkipFrameFlag = 0;		//フレームスキップフラグをおろす
	}

	#ifdef H_BLANK_INTR_ON
	*(vu16 *)REG_IME = 0;			//IME リセット
	*(vu16 *)REG_IE = IeBak;		//IEを復帰
	#endif //H_BLANK_INTR_ON

	*(vu16 *)REG_IME = ImeBak;		// IMEの復帰
}


/*==================================================================*/
/*==================================================================*/
/*                      割り込み関数                               */
/*==================================================================*/
/*==================================================================*/

/*------------------------------------------------------------------*/
/*                 通信用Vブランク割り込み関数                     */
/*------------------------------------------------------------------*/
void MltSioVblkIntr(void)
{
	if(M_s.Type){			//親側の処理
		switch(M_s.State){
			case MULTI_SIO_MAIN:
				if(M_s.SioIntrCheckFlag <= MULTI_SIO_SEND_MAX){	//1フレーム内に設定回数の通信が終了しているか？
					if(M_s.HardError != 1){
						M_s.SioIntervalError = 1;	//通信間隔設定値エラー
						break;
					}

				}else{
#if 1
					if(M_s.SioIntervalError == 1)	break;		//インターバルエラーが立っていれば、通信を開始しない
#endif
					M_s.SioIntrCheckFlag = 0;		//割り込みチェックフラグ初期化
				}

			case MULTI_SIO_CONNECT_CHECK:
				Multi_SioStart();				//********通信開始********//
				break;

			default:	break;
		}

	}else{	//子機側の処理
		if(M_s.State == MULTI_SIO_MAIN || M_s.State == MULTI_SIO_CONNECT_CHECK){
			if(++SioIntrCount > MULTI_SIO_INTR_TIME_OVER){	//通信割り込みがかからなくなったときの処理
				if(M_s.State == MULTI_SIO_MAIN)
					M_s.SioIntervalError = 2;				//通信メイン中なら通信ストップエラー
				if(M_s.State == MULTI_SIO_CONNECT_CHECK){
					M_s.PlayersNum = 0;	//接続チェック中なら接続人数を0に初期化
					M_s.MultiSioVersion = 0;
				}
			}
		}
	}
}


/*------------------------------------------------------------------*/
/*                      タイマー割り込み関数                        */
/*------------------------------------------------------------------*/
void Multi_SioTimerIntr(void)
{
	StopTimer();		//タイマーを停止
	Multi_SioStart();	//通信開始
}


/*------------------------------------------------------------------*/
/*                      通信割り込み関数                            */
/*------------------------------------------------------------------*/
void Multi_SioIntr(void)
{
	M_s.ID = ((SioMultiCnt *)REG_SIOCNT)->ID;	//ID格納

	switch(M_s.State){
		case MULTI_SIO_MAIN:	//マルチプレイ通信メイン
			M_s.HardError = ((SioMultiCnt *)REG_SIOCNT)->Error;	//ハードエラー検出

			SetRecvData();		//受信データの処理
			SetSendData();		//送信データのセット
			SetTimer();		//タイマーのセット

//			SioIntrCount=0;	//SIO割り込みカウント初期化

			break;

		case MULTI_SIO_CONNECT_CHECK:			//接続チェック
			if(MultiSioLinkCheck()){
				if(M_s.Type){
					M_s.State = MULTI_SIO_CONNECT_DECISION;		//親機は通信決定シーケンスへ
					M_s.SioIntrCheckFlag = MULTI_SIO_SEND_MAX;

				}else
					M_s.State = MULTI_SIO_MAIN;					//子機は通信メインへ
			}

		default:	break;
	}

	M_s.SioIntrCheckFlag ++;		//通信割り込みチェックフラグ
	SioIntrCount=0;	//SIO割り込みカウント初期化

	if(M_s.SioIntrCheckFlag == MULTI_SIO_SEND_MAX)
		Recv_Buf_Size = MULTI_SIO_RECV_BUF.Size;	//受信FIFOの遅延を見る
}


/*==================================================================*/
/*                    割り込み関数サブルーチン                     */
/*==================================================================*/

/*------------------------------------------------------------------*/
/*                      通信開始                                   */
/*-----------------------------------------------------------------*/
void Multi_SioStart(void)
{
	*(vu16 *)REG_SIOCNT |= SIO_START;	//通信スタート
}


/*---------------------------------------------------*/
/*             接続チェック                          */
/*---------------------------------------------------*/
u8 MultiSioLinkCheck(void)
{
	u8	i;
	u8	connect_num = 0;		//接続人数
	u16 checkdata_bak = 0xffff;	//プログラムバージョン監視用


	if(M_s.Signal == SIGNAL_DECISION)
		*(vu16 *)REG_SIOMLT_SEND = SIGNAL_DATA;
	else
		*(vu16 *)REG_SIOMLT_SEND = CONNECT_CHECK_DATA;	//接続チェックデータをセット(通信プログラムのバージョン情報）

		*(u64 *)M_s.CheckData = *(u64 *)REG_SIOMLT_RECV;
		*(vu64 *)REG_SIOMLT_RECV = 0;

		M_s.Signal = SIGNAL_OFF;	//シグナルをオフ

/*
	//シグナルデータを受信したらシーケンスを進める
	if(M_s.CheckData[MULTI_SIO_ID0] == SIGNAL_DATA)		return 1;
*/
	for(i = 0; i < MULTI_SIO_PLAYERS_MAX; i ++){		//接続プレイヤー数をチェック
		if((CONNECT_CHECK_DATA&~VERSION_CHECK_MASK)==(M_s.CheckData[i]&~VERSION_CHECK_MASK)
		|| (M_s.CheckData[i]==SIGNAL_DATA) ){
			connect_num ++;

			if((checkdata_bak>M_s.CheckData[i]) && (M_s.CheckData[i] !=0))	//「0」は接続データではない！
				checkdata_bak = M_s.CheckData[i];

		}else if(M_s.CheckData[i] != NOT_CONNECTED_DATA){	//接続ハードに1台でも異なるソフトがつながってた場合は接続人数を0にする
			connect_num = 0;
			break;			//ループ抜け

		}else if(M_s.CheckData[i] == NOT_CONNECTED_DATA){
			// 1P,2P,4P接続にて1P、2Pの接続確立、4Pモニタとなる症状への対処
#if 0
			if( (i==MULTI_SIO_ID3) && (M_s.ID == MULTI_SIO_ID3) ){
				M_s.State = MULTI_SIO_STOP;
				connect_num = 0;
			}
#else
			break;
#endif
//			if(i<3 && M_s.CheckData[i+1] != NOT_CONNECTED_DATA)	connect_num = 0;
//			break;			//ループ抜け
		}
	}

	M_s.PlayersNum = connect_num;		//接続プレイヤー数の決定


	//決定シグナルを受信＆接続人数が前フレームの接続人数と同じ＆接続人数が2人以上ならシーケンスを進める
	if( (M_s.PlayersNum >= 2) && (M_s.PlayersNum == PlayersNumBak)
	&& (M_s.CheckData[MULTI_SIO_ID0] == SIGNAL_DATA) )		return 1;

	if(M_s.PlayersNum>=2)
		M_s.MultiSioVersion = (checkdata_bak&VERSION_CHECK_MASK)+1;
	else
		M_s.MultiSioVersion = 0;


	PlayersNumBak = M_s.PlayersNum;	//接続人数のバックアップ

	return 0;
}


/*---------------------------------------------------*/
/*         受信データの処理                          */
/*---------------------------------------------------*/
void SetRecvData(void)
{
	u8	i;
	u8	tail;
	u16	RecvDataBak[4];

	*(u64 *)RecvDataBak = *(u64 *)REG_SIOMLT_RECV;	//受信データのバックアップをとる

	if(M_s.SendCounter == 0)		//ダミー通信
	{
		//各フレーム1回目のダミー通信を利用して、サムチェックを行う
		#ifdef SUM_CHECK_FUNC_ON
		for(i = 0; i < M_s.PlayersNum; i ++){
//			if((M_s.CheckSum != RecvDataBak[i]) && (M_s.CheckSum != 0)){		//チェックサム検証
			if((M_s.CheckSum != RecvDataBak[i]) && SioStartFlag )	M_s.CheckSumError = 1;	//チェックサムエラー
		}
		#endif //SUM_CHECK_FUNC_ON

		M_s.CheckSum = 0;		//初期化
		SioStartFlag = 1;

	}else{			//有効通信
		//受信FIFOバッファのしっぽを算出
		tail = MULTI_SIO_RECV_BUF.Head + MULTI_SIO_RECV_BUF.Size;
		if(tail>=MULTI_SIO_RECV_BUF_SIZE)
			tail -= MULTI_SIO_RECV_BUF_SIZE;

		if(MULTI_SIO_RECV_BUF.Size < MULTI_SIO_RECV_BUF_SIZE){
			for(i = 0; i < M_s.PlayersNum; i ++){			//接続人数分だけループ
				#ifdef SUM_CHECK_FUNC_ON
				//設定回数目の受信データを監視（if文↓をコメントアウトで全受信データサムチェック）
//				if(M_s.RecvCounter == CHECK_SUM_NUMBER)
					M_s.CheckSum += RecvDataBak[i];		//受信データのチェックサム計算
				#endif //SUM_CHECK_FUNC_ON

				//受信データの論理和をとる
				#ifdef BUFFER_COMP_FUNC_ON
				CheckRecvData |= RecvDataBak[i];
				#endif //BUFFER_COMP_FUNC_ON

				//********受信データをFIFOバッファに格納********//
				MULTI_SIO_RECV_BUF.Item[i][M_s.RecvCounter][tail] = RecvDataBak[i];
			}

		}else	M_s.OverFlowError = 2;		//受信FIFOバッファのオーバーフロー検出

		M_s.RecvCounter ++;				//データ受信回数をインクリメント

		//接続ハードからのすべての受信データが0なら受信バッファを１段解消
		if(M_s.RecvCounter == MULTI_SIO_RECV_MAX){
			#ifdef BUFFER_COMP_FUNC_ON
			if(CheckRecvData != 0)
			#endif //BUFFER_COMP_FUNC_ON
			{
				MULTI_SIO_RECV_BUF.Size ++;		//有効データならサイズをインクリメント
				CheckRecvData = 0;				//初期化
			}
		}
	}
}


/*---------------------------------------------------------*/
/*           送信データセット                              */
/*---------------------------------------------------------*/
void SetSendData(void)
{
	if(M_s.SendCounter == MULTI_SIO_SEND_MAX){		//送信最終回
		#ifdef SUM_CHECK_FUNC_ON
		*(vu16 *)REG_SIOMLT_SEND = M_s.CheckSum;	//サムチェックデータを送信レジスタにセットする
		#endif //SUM_CHECK_FUNC_ON

		//設定回数の送信データセットが終わったらFIFOバッファ操作
		if(CheckSendBufFlag == 0){
			MULTI_SIO_SEND_BUF.Size --;		//サイズを減らす
			MULTI_SIO_SEND_BUF.Head ++;

			if(MULTI_SIO_SEND_BUF.Head >= MULTI_SIO_SEND_BUF_SIZE)	//ヘッドをずらす
				MULTI_SIO_SEND_BUF.Head = 0;

		}else	CheckSendBufFlag = 0;	//フラグの初期化

	}else{								//有効送信データセット
		if(CheckSendBufFlag == 0){	//送信FIFOバッファのサイズを見る(通常はM_s.SendCounter==0のときだけにチェックすればいいが、通信停止によるカウンタのずれ補正に対処するために毎回チェックしている）
			if(MULTI_SIO_SEND_BUF.Size == 0)	CheckSendBufFlag = 1;	//送信データが蓄積されていない
		}

		if(CheckSendBufFlag)
			*(vu16 *)REG_SIOMLT_SEND = INVALID_DATA;	//送信データの蓄積がない場合は無効データをセット
		else{
			//********送信データを送信レジスタにセット********//
			*(vu16 *)REG_SIOMLT_SEND = MULTI_SIO_SEND_BUF.Item[M_s.SendCounter][MULTI_SIO_SEND_BUF.Head];	//送信データをセット
//			MULTI_SIO_SEND_BUF.Item[M_s.SendCounter][MULTI_SIO_SEND_BUF.Head] = EMPTY_DATA;					//バッファをカラデータで初期化
		}

		M_s.SendCounter ++;			//有効送信データ セット回数をインクリメント
	}
}


/*----------------------------------------------------------*/
/*                   タイマーストップ                       */
/*----------------------------------------------------------*/
void StopTimer(void)
{
	if(M_s.Type){
		*(vu16 *)REG_MULTI_SIO_TIMER_H &= ~MULTI_SIO_TIMER_START;	//タイマーを止める
		*(vu16 *)REG_MULTI_SIO_TIMER_L = MULTI_SIO_TIMER_COUNT;		//タイマー値 再設定（いらないかも？）
	}
}


/*------------------------------------------------------------------*/
/*                     タイマーセット                              */
/*-----------------------------------------------------------------*/
void SetTimer(void)
{
	if(M_s.RecvCounter == MULTI_SIO_RECV_MAX){
		M_s.SendCounter = 0;		//送信回数を0に戻す
		M_s.RecvCounter = 0;		//受信回数を0に戻す

	}else if(M_s.Type){			//親機ならタイマーを再スタート
		*(vu16 *)REG_MULTI_SIO_TIMER_H |= MULTI_SIO_TIMER_START;
	}
}


/*------------------------------------------------------------------*/
/*                      バッファの初期化                            */
/*------------------------------------------------------------------*/
//送信バッファの初期化
void SendBufInit(void)
{
	u8	i, j;

	MULTI_SIO_SEND_BUF.Size = 0;
	MULTI_SIO_SEND_BUF.Head = 0;

	for(i = 0; i < MULTI_SIO_SEND_MAX; i++){
		for(j = 0; j < MULTI_SIO_SEND_BUF_SIZE; j ++)
			MULTI_SIO_SEND_BUF.Item[i][j] = EMPTY_DATA;		//カラ データを入れる
	}
}


//受信バッファの初期化
void RecvBufInit(void)
{
	u8	i, j, k;

	MULTI_SIO_RECV_BUF.Size = 0;
	MULTI_SIO_RECV_BUF.Head = 0;

	for(i = 0; i < MULTI_SIO_PLAYERS_MAX; i ++){
		for(j = 0; j < MULTI_SIO_RECV_MAX; j ++){
			for(k = 0; k < MULTI_SIO_RECV_BUF_SIZE; k ++)
				MULTI_SIO_RECV_BUF.Item[i][j][k] = EMPTY_DATA;		//カラ データを入れる
		}
	}
}

