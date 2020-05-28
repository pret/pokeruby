#ifndef __EV_FLAG_H__
#define __EV_FLAG_H__

//=========================================================================
//
//	イベントフラグ操作関連
//	
//=========================================================================

#undef GLOBAL
#ifdef EV_FLAG_H_GLOBAL
#define GLOBAL /*	*/
#else
#define GLOBAL extern
#endif

//=========================================================================
//	定義
//=========================================================================
//#define name value

//typedef ...


//=========================================================================
//	変数
//=========================================================================
//GLOBAL type valiable;

// スクリプト内部での処理用
extern u16 ScriptRegister0;
extern u16 ScriptRegister1;
extern u16 ScriptRegister2;
extern u16 ScriptRegister3;

// スクリプトとプログラムのデータ交換用
extern u16 ScriptParameter0;
extern u16 ScriptParameter1;
extern u16 ScriptParameter2;
extern u16 ScriptParameter3;

// スクリプトでのテンポラリ
extern u16 ScriptTempWork0;
extern u16 ScriptTempWork1;
extern u16 ScriptTempWork2;
extern u16 ScriptTempWork3;

// スクリプトに答えを返す汎用ワーク
extern u16 AnswerWork;

// 話かけた対象のＯＢＪのＩＤ
extern u16 TargetObjID;

// 話かけた方向を保持するワーク
extern u16 TalkSiteWork;

//=========================================================================
//	関数プロトタイプ
//=========================================================================
//GLOBAL type function(arg...);

// イベントフラグの操作関連
GLOBAL void EventDataInit( void );		// イベントフラグ・ワークの初期化
GLOBAL void LocalEventFlagClear(void);	// マップ内限定のフラグをクリア
GLOBAL void OneDayFlagClear(void);		// 一日経過限定フラグのクリア

GLOBAL u8 EventFlagSet(u16 flag);		// イベントフラグセット
GLOBAL u8 EventFlagReset(u16 flag);		// イベントフラグりセット
GLOBAL u8 EventFlagCheck(u16 flag);		// イベントフラグチェック、ON/OFFを返す

GLOBAL u16 * GetEventWorkAdrs(u16 id);				// イベントワークアドレスを取得
GLOBAL u16 GetEventWorkValue( u16 id );				// イベントワークの値を取得
GLOBAL int SetEventWorkValue( u16 id, u16 value );	// イベントワークに値をセット

GLOBAL u8 GetEvDefineObjCode( u8 no );	// スクリプトから指定するＯＢＪコードを取得

//	ずかんの全国モード、ホウエンモード関連
GLOBAL void ZukanSpecialFlagInit( void );		//初期化
GLOBAL void ZukanSpecialFlagSet( void );		//セット
GLOBAL int ZukanSpecialFlagCheck( void );		//チェック

//	外部データの使用許可関連
GLOBAL void ExDataSpecialFlagInit( void );		//初期化
GLOBAL void ExDataSpecialFlagSet( void );		//セット
GLOBAL int ExDataSpecialFlagCheck( void );		//チェック

//	ゲーム内時間の再設定許可関連
GLOBAL void GameTimeSpecialFlagInit(void);		//初期化
GLOBAL void GameTimeSpecialFlagSet(void);		//セット
GLOBAL int GameTimeSpecialFlagCheck(void);		//チェック

#undef GLOBAL
#endif	/*__EV_FLAG_H__*/

