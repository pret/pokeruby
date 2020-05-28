/********************************************************************/
/*          multi_sio.h                                             */
/*            マルチ通信サンプルプログラム ヘッダファイル           */
/*                                            T.Nakano              */
/*          Copyright (C) 1999-2002 NINTENDO Co.,Ltd.  Ver.20020927 */
/********************************************************************/

#include <Agb.h>

#ifndef _MULTI_SIO_H
#define _MULTI_SIO_H
#endif //_MULTI_SIO_H


/*==================================================================*/
//				各種機能のON/OFF
/*==================================================================*/
#define SUM_CHECK_FUNC_ON			//サムチェック機能ON（受信データのチェックサムを調べる）
#define CHECK_SUM_NUMBER	0		//チェックサムを調べる通信データ（0～(MULTI_SIO_RECV_MAX-1)）
#define BUFFER_COMP_FUNC_ON		//FIFOバッファ圧縮機能です。
															//データをコマンド送信する場合は、バッファ圧縮機能を使用できます


/*=========================================================*/
/*                  定義                                   */
/*=========================================================*/
//マルチプレイ通信関係
#define MULTI_SIO_SEND_MAX			8					//1フレーム内での有効データ送信回数
#define MULTI_SIO_RECV_MAX			MULTI_SIO_SEND_MAX	//1フレーム内での有効データ受信回数

#define MULTI_SIO_BUF_SIZE			50					//FIFOバッファのサイズ
#define MULTI_SIO_SEND_BUF_SIZE		MULTI_SIO_BUF_SIZE	//送信側FIFOバッファのサイズ
#define MULTI_SIO_RECV_BUF_SIZE		MULTI_SIO_BUF_SIZE	//受信側FIFOバッファのサイズ

#define MULTI_SIO_PLAYERS_MAX		4			// 最大プレイヤー数

#define MULTI_SIO_TIMER_ENABLE	0x0040		//タイマー起動
#define MULTI_SIO_TIMER_START		0x0080		//タイマー割り込み要求許可

#define MULTI_SIO_TIMER_NO			3					// タイマーＮｏ
#define MULTI_SIO_TIMER_INTR_FLAG	(TIMER0_INTR_FLAG << MULTI_SIO_TIMER_NO)	// タイマー割り込みフラグ
#define REG_MULTI_SIO_TIMER			(REG_TM0CNT + MULTI_SIO_TIMER_NO * 4)
#define REG_MULTI_SIO_TIMER_L		REG_MULTI_SIO_TIMER		// タイマーレジスタ
#define REG_MULTI_SIO_TIMER_H		(REG_MULTI_SIO_TIMER + 2)

#define MULTI_SIO_TIMER_PRESCALER		TMR_PRESCALER_64CK	//プリスケーラー設定

/*プリスケーラー設定64CK時のタイマー間隔表*/
//#define MULTI_SIO_TIMER_COUNT_TMP	(79)	// タイマーカウント暫定値(設定値0.3ms）
//#define MULTI_SIO_TIMER_COUNT_TMP	(105)	// タイマーカウント暫定値(設定値0.4ms）
//#define MULTI_SIO_TIMER_COUNT_TMP	(131)	// タイマーカウント暫定値(設定値0.5ms）
//#define MULTI_SIO_TIMER_COUNT_TMP	(157)	// タイマーカウント暫定値(設定値0.6ms）
//#define MULTI_SIO_TIMER_COUNT_TMP	(178)	// タイマーカウント暫定値(設定値0.7ms）
#define MULTI_SIO_TIMER_COUNT_TMP	(196)	// タイマーカウント暫定値(設定値0.75ms）
//#define MULTI_SIO_TIMER_COUNT_TMP	(210)	// タイマーカウント暫定値(設定値0.8ms）
//#define MULTI_SIO_TIMER_COUNT_TMP	(236)	// タイマーカウント暫定値(設定値0.9ms）
//#define MULTI_SIO_TIMER_COUNT_TMP	(262)	// タイマーカウント暫定値(設定値1.0ms）
//#define MULTI_SIO_TIMER_COUNT_TMP	(288)	// タイマーカウント暫定値(設定値1.1ms）
//#define MULTI_SIO_TIMER_COUNT_TMP	(314)	// タイマーカウント暫定値(設定値1.2ms）
//#define MULTI_SIO_TIMER_COUNT_TMP	(341)	// タイマーカウント暫定値(設定値1.3ms）
//#define MULTI_SIO_TIMER_COUNT_TMP	(367)	// タイマーカウント暫定値(設定値1.4ms）
//#define MULTI_SIO_TIMER_COUNT_TMP	(393)	// タイマーカウント暫定値(設定値1.5ms）
//#define MULTI_SIO_TIMER_COUNT_TMP	(419)	// タイマーカウント暫定値(設定値1.6ms）
//#define MULTI_SIO_TIMER_COUNT_TMP	(445)	// タイマーカウント暫定値(設定値1.7ms）
//#define MULTI_SIO_TIMER_COUNT_TMP	(472)	// タイマーカウント暫定値(設定値1.8ms）
//#define MULTI_SIO_TIMER_COUNT_TMP	(498)	// タイマーカウント暫定値(設定値1.9ms）
//#define MULTI_SIO_TIMER_COUNT_TMP	(524)	// タイマーカウント暫定値(設定値2.0ms）
//#define MULTI_SIO_TIMER_COUNT_TMP	(655)	// タイマーカウント暫定値(設定値2.5ms）
//#define MULTI_SIO_TIMER_COUNT_TMP	(798)	// タイマーカウント暫定値(設定値3.0ms）
//#define MULTI_SIO_TIMER_COUNT_TMP	(917)	// タイマーカウント暫定値(設定値3.5ms）
//#define MULTI_SIO_TIMER_COUNT_TMP	(1048)	// タイマーカウント暫定値(設定値4.0ms）
//#define MULTI_SIO_TIMER_COUNT_TMP	(1180)	// タイマーカウント暫定値(設定値4.5ms）


#define MULTI_SIO_TIMER_COUNT_MAX	0xffff		// タイマーカウント最大値
#define MULTI_SIO_TIMER_COUNT		(MULTI_SIO_TIMER_COUNT_MAX - MULTI_SIO_TIMER_COUNT_TMP)

#if	MULTI_SIO_TIMER_COUNT_TMP > MULTI_SIO_TIMER_COUNT_MAX
	#error	MULTI_SIO_TIMER_COUNT is too long.
#endif


//≪予約≫通信データ//
#define FORBIDDEN_DATA			0xffff	//禁止データ(変更不可）
#define NOT_CONNECTED_DATA		0xffff	//未接続(変更不可）
#define EMPTY_DATA				0xefff	//からデータ
//#define INVALID_DATA			0xdfff	//無効データ
#define INVALID_DATA			0		//無効データ
#define SIGNAL_DATA				0x8fff	//汎用シグナルデータ
//#define RESTART_DATA			0x3fff	//通信再開データ
//#define END_DATA				0x5fff	//エンドデータ


//≪接続データ≫
//CONNECT_CHECK_DATAにソフト固有の認証コードを設定してください。
//16ビットのうち下位2ビットはバージョンコードとなっています。
//最初のバージョンは最下位ビットを0とし、通信部分のバージョンがあがるごとに
//1、2と変更してください。接続認証で同じゲームと判断するのは
//一番最初のバージョンから3バージョンまでとなっています。
//接続チェックデータ
#define CONNECT_CHECK_DATA		0xB9A0	//接続チェックデータ	2002/10/07変更
#define VERSION_CHECK_MASK		0x0003


/*=========================================================*/
/*                  構造体                                 */
/*=========================================================*/
//送信側FIFOバッファ構造体
typedef struct
{
	u16 Item[MULTI_SIO_SEND_MAX]		//バッファの中身
			[MULTI_SIO_BUF_SIZE];
	u8  Head;							//データの先頭
	u8  Size;							//バッファに入っているデータの個数

} SendFifoBuf;

//受信側FIFOバッファ構造体
typedef struct
{
	u16 Item[MULTI_SIO_PLAYERS_MAX]
			[MULTI_SIO_RECV_MAX]
			[MULTI_SIO_BUF_SIZE];	//バッファの中身
	u8  Head;							//データの先頭
	u8  Size;							//バッファに入っているデータの個数

} RecvFifoBuf;


// マルチプレイ通信ワークエリア構造体
typedef struct
{
	u8  Type;				//接続関係（親か子か）
	u8  State;				//通信関数の状態
	u8	ID;					//接続ID
	u8	PlayersNum;			//接続プレイヤー数

	u16 CheckData[4];		//接続チェックデータ

//↑これより上にメンバを追加しないでください！！

	u8	SkipFrameFlag;		//フレームスキップフラグ
	s8	SioIntrCheckFlag;	//通信割り込みチェックフラグ
//	s8	SioStopFlag;		//通信停止フラグ（通信停止時に割り込みを禁止する場合に使用）
	u8	Signal;				//汎用シグナル
	u8	MultiSioVersion;	//通信プログラムのバージョン

	u8	HardError;			//ハードエラーフラグ
	u8	CheckSumError;		//チェックサムエラーフラグ
	u8	OverFlowError;		//バッファのオーバーフローフラグ
	u8	SioIntervalError;	//タイマー間隔設定値のエラーフラグ

	u16	CheckSum;			//チェックサム

	u8	SendCounter;		//データ送信回数
	u8	RecvCounter;		//データ受信回数

	SendFifoBuf SendBuf;	//送信FIFOバッファ
	RecvFifoBuf RecvBuf;	//受信FIFOバッファ

} MultiSioArea;


/*=========================================================*/
/*                  変数                                   */
/*=========================================================*/
extern	u16 ImeBak;				//IMEレジスタのバックアップ
extern	MultiSioArea M_s;		//マルチプレイ通信ワークエリア構造体

extern u8	Send_Buf_Size;
extern u8	Recv_Buf_Size;


/*==================================================================*/
/*==================================================================*/
/*                  マルチプレイ通信                                */
/*==================================================================*/
/*==================================================================*/

/*------------------------------------------------------------------*/
/*                       通信終了                                   */
/*------------------------------------------------------------------*/
extern	void Multi_SioStop(void);

//通信割り込み、タイマー割り込みを禁止し、通信モードをから抜けます。


/*------------------------------------------------------------------*/
/*             マルチプレイ通信初期化                               */
/*------------------------------------------------------------------*/
extern	void Multi_SioInit(void);

//通信モード、割り込み許可等を設定し、諸変数を初期化します。


/*------------------------------------------------------------------*/
/*                     通信対応ゲーム初期化                         */
/*------------------------------------------------------------------*/
extern	void Multi_SioGameInit(void);

//接続認識時に電源オン、オフしたときなどの
//不安定な挙動を取り除きます。
//メインループに入る前に呼び出してください。

/*------------------------------------------------------------------*/
/*             マルチプレイ通信メイン                               */
/*------------------------------------------------------------------*/
extern	u32 Multi_SioMain(u8 *Signal_ptr, u16 *SendData_ptr, u16 (*RecvData_ptr)[MULTI_SIO_PLAYERS_MAX]);

//親接続、子接続を判別、タイマーの設定、タイマー割り込みの
//許可など、通信における初期設定を行います。
//通信中は、送信FIFOバッファへのデータの蓄積、受信バッファからの
//データの取り出しを行います。メインプログラムの先頭で呼び出してください。

//戻り値にある「ROMバージョン」は、接続されているROMのうちで
//最も古いバージョンナンバーを返します。つまりVer1とVer0のROMが
//通信にて使用されいる場合、戻り値はVer0があることを示す「1」を
//返します。※戻り値は「1から4」です。「0」が返ってくる場合は
//接続認証できていないことを示します。

#define MULTI_SIO_INTR_TIME_OVER	10

//引数
//・u8  *Signal_ptr			シグナルデータポインタ
//メインプログラムからのシグナルで、通信関数のシーケンスを進めます。
#define SIGNAL_OFF				0	//シグナルOFF
#define SIGNAL_DECISION		1	//決定ボタン
#define SIGNAL_CANCEL			2	//キャンセルボタン

//・u16 *SendData_ptr	ユーザ送信バッファポインタ
//FileName[MULTI_SIO_SEND_MAX]の形で
//指定してください。（“FileName”は変更可）
//※*SendData_ptrで指定されるユーザバッファは、メインプログラムの
// 初期化時に「通信に使用しない値」で初期化しておいてください。


//・u16 (*RecvData_ptr)[MULTI_SIO_PLAYERS_MAX]	ユーザ受信バッファポインタ
//FileName[MULTI_SIO_RECV_MAX][MULTI_SIO_PLAYERS_MAX]の形で
//指定してください。（“FileName”は変更可）


//戻り値
#define MULTI_SIO_ID_MASK						0x00000003	//IDマスク
#define MULTI_SIO_PLAYERS_NUM_MASK	0x0000001c	//接続プレーヤー数マスク
#define MULTI_SIO_VERSION_MASK			0x00000e00	//ROMバージョンマスク（4バージョンまで）

#define MULTI_SIO_ID_SHIFT						0
#define	MULTI_SIO_PLAYERS_NUM_SHIFT		2
#define MULTI_SIO_VERSION_SHIFT				9

#define MULTI_SIO_PARENT								0x00000020	//親接続
#define MULTI_SIO_MAIN_SEQ							0x00000040	//通信メイン中
#define MULTI_SIO_FRAME_SKIP						0x00000100	//フレームスキップ
#define MULTI_SIO_HARD_ERROR						0x00001000	//ハードエラー
#define MULTI_SIO_CHECKSUM_ERROR				0x00002000	//チェックサムエラー
#define MULTI_SIO_SEND_OVER_FLOW_ERROR	0x00004000	//送信側FIFOオーバーフローエラー
#define MULTI_SIO_RECV_OVER_FLOW_ERROR	0x00008000	//受信側FIFOオーバーフローエラー
#define MULTI_SIO_INTERVAL_ERROR				0x00010000	//タイマー間隔設定値エラー
#define MULTI_SIO_ID_OVER_ERROR					0x00020000	//接続IDオーバーエラー
#define MULTI_SIO_INTR_STOP_ERROR				0x00040000	//SIO割り込み停止エラー

//通信関数の状態(M_s.Stateの値）
enum
{ MULTI_SIO_STOP, MULTI_SIO_INIT, MULTI_SIO_CONNECT_CHECK,
 MULTI_SIO_CONNECT_DECISION, MULTI_SIO_MAIN };


/*==================================================================*/
/*             マルチプレイ通信サブルーチン                         */
/*==================================================================*/

//マルチプレイ通信サブルーチンについては、すべてMultiSioMain内で
//呼び出されているため、個別に呼び出す必要はありません。

/*------------------------------------------------------------------*/
/*                         接続認識                                 */
/*------------------------------------------------------------------*/
extern	void ConnectCheck(void);

//親機、子機接続を判別したり、接続人数を出したり
//接続状況をチェックします。

#define MULTI_SIO_ID0		0
#define MULTI_SIO_ID1		1
#define MULTI_SIO_ID2		2
#define MULTI_SIO_ID3		3


/*------------------------------------------------------------------*/
/*                         タイマー初期化                             */
/*------------------------------------------------------------------*/
extern	void TimerInit(void);

//親機のみタイマー割り込みを許可し、タイマー時間などを設定します。


/*------------------------------------------------------------------*/
/*             送信FIFOバッファに送信データを蓄積                   */
/*------------------------------------------------------------------*/
extern	void PutSendData(u16 *SendData_ptr);

//送信FIFOバッファへのデータの蓄積を行います。
//マルチプレイ通信メインで呼び出しています。
//ユーザー送信バッファからデータを受け取り、送信側FIFOバッファに
//データを蓄積した後 ユーザーバッファを「INVALID_DATA」で初期化します。


//引数
//・u16 *SendData_ptr	ユーザ送信バッファポインタ


/*------------------------------------------------------------------*/
/*             受信FIFOバッファから受信データを取得                 */
/*------------------------------------------------------------------*/
extern	void GetRecvData(u16 (*RecvData_ptr)[MULTI_SIO_PLAYERS_MAX]);

//受信FIFOバッファへから受信データの取り出しを行います。
//マルチプレイ通信メインで呼び出しています。
//受信側FIFOバッファにデータが蓄積されていないときは
//ユーザー受信バッファに「INVALID_DATA」を渡します。


//引数
//・u16 (*RecvData_ptr)[MULTI_SIO_PLAYERS_MAX]	ユーザ受信バッファポインタ


/*==================================================================*/
/*==================================================================*/
/*                      割り込み関数                               */
/*==================================================================*/
/*==================================================================*/

/*------------------------------------------------------------------*/
/*                      Vブランク割り込み関数                       */
/*------------------------------------------------------------------*/
extern	void MltSioVblkIntr(void);

//通信を開始します。
//Vブランクの先頭で呼び出してください。


/*------------------------------------------------------------------*/
/*                      タイマー割り込み関数                           */
/*------------------------------------------------------------------*/
extern	void Multi_SioTimerIntr(void);

//設定時間が経過したら、タイマーを止め、タイマーを再設定し
//通信を開始します。


/*------------------------------------------------------------------*/
/*                      通信割り込み関数                           */
/*------------------------------------------------------------------*/
extern	void Multi_SioIntr(void);

//受信データのFIFOバッファへの蓄積、送信データのセット、
//タイマーの制御を行います。



/*==================================================================*/
/*                  割り込み関数サブルーチン                       */
/*==================================================================*/

//割り込み関数サブルーチンは上記の割り込み関数内で呼び出されます。
//個別に呼び出す必要はありません。

/*------------------------------------------------------------------*/
/*                      通信開始                                   */
/*-----------------------------------------------------------------*/
extern	void Multi_SioStart(void);

//通信を開始します。

/*---------------------------------------------------*/
/*         接続チェック                          */
/*---------------------------------------------------*/
extern	u8 MultiSioLinkCheck(void);

//接続チェックデータをやり取りし、接続状態をチェックします。

/*---------------------------------------------------*/
/*         受信データの処理                          */
/*---------------------------------------------------*/
extern	void SetRecvData(void);

//受信データを処理します。
//各フレーム 1回目の通信はプログラムの実行に不必要なデータをやり取りする
//ダミー通信であるため、受信したデータは受信FIFOバッファには蓄積しません。

//ダミー通信で受信されるデータは、前フレームの送受信データの
//「チェックサムデータ」で（サムチェック機能ONのとき）、
//自機のチェックサムデータを受信した他機のチェックサムデータを検証し
//値が異なればチェックサムエラーフラグを立てます。


/*---------------------------------------------------*/
//          送信データセット                         //
/*---------------------------------------------------*/
extern	void SetSendData(void);

//送信データをセットします。
//設定回数の通信終了後、最後の送信データセットタイミング時に
//そのフレーム内で受信した総受信データのサムチェックデータを
//セットし（サムチェック機能ONのとき）、次フレームの
//ダミー通信時にて整合性がとれているかを検証します。


/*---------------------------------------------------*/
//                タイマーをストップ                 //
/*---------------------------------------------------*/
extern	void StopTimer(void);

//タイマーをとめ、タイマー時間を再設定します。

/*---------------------------------------------------*/
//               タイマーのセット                    //
/*---------------------------------------------------*/
extern	void SetTimer(void);

//親機で、設定回数の通信が完了していない場合はタイマーをスタートします。
//設定回数の通信が完了している場合は、親機、子機ともに送信回数、
//受信回数を0にもどします。


/*==================================================================*/
/*==================================================================*/
/*                  FIFOバッファ                                    */
/*==================================================================*/
/*==================================================================*/

/*------------------------------------------------------------------*/
/*                      バッファの初期化                          */
/*------------------------------------------------------------------*/
extern	void RecvBufInit(void);

//受信バッファを初期化します。
//FIFOバッファの中身には空（カラ）データ「EMPTY_DATA」を入れます。

extern	void SendBufInit(void);

//送信バッファを初期化します。
//FIFOバッファの中身には空（カラ）データ「EMPTY_DATA」を入れます。

