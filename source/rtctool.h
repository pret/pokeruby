#ifndef __RTCTOOL_H__
#define __RTCTOOL_H__

//=========================================================================
//	
//
//
//
//=========================================================================

#undef GLOBAL
#ifdef __RTCTOOL_H_GLOBAL__
#define GLOBAL /*	*/
#else
#define GLOBAL extern
#endif

//=========================================================================
//	定義
//=========================================================================
//#define name value

/* RTC_GetStatus 用の定義 */

#define	RTCST_NORMAL				0x0000	/*	正常 */

#define	RTCST_ERR_ACCESS_LOCK		0x0001	/*	アクセスロック */
#define	RTCST_INITIALIZE			0x0002	/*	初期化 */

#define	RTCST_ERR_NO_BACKUP			0x0010	/*	バックアップ異常(あるいは初回起動時 */
#define	RTCST_ERR_LOW_BATTERY		0x0020	/*	電圧低下 */
#define	RTCST_ERR_ILLEGAL_YEAR		0x0040	/*	年データの異常 */
#define	RTCST_ERR_ILLEGAL_MONTH		0x0080	/*	月データの異常 */
#define	RTCST_ERR_ILLEGAL_DAY		0x0100	/*	日データの異常 */
#define	RTCST_ERR_ILLEGAL_HOUR		0x0200	/*	時データの異常 */
#define	RTCST_ERR_ILLEGAL_MINUTE	0x0400	/*	分データの異常 */
#define	RTCST_ERR_ILLEGAL_SECOND	0x0800	/*	秒データの異常 */

#define	RTCST_ERR_MASK				0x0ff0	/*	上記エラーのいずれか */


//=========================================================================
//	変数
//=========================================================================
//GLOBAL type valiable;

//ゲーム内時間格納用変数
extern GAME_TIME GameTime;

//=========================================================================
//	関数プロトタイプ
//=========================================================================
//GLOBAL type function(arg...);

//--------------------------------------------------------------
//	RTCをチェック、異常がある場合は初期化
//--------------------------------------------------------------
GLOBAL void RTC_Init( void );

//--------------------------------------------------------------
//	RTCの状態を返す
//--------------------------------------------------------------
GLOBAL u16 RTC_GetStatus( void );

//--------------------------------------------------------------
//	RTCのリセット呼び出し
//--------------------------------------------------------------
GLOBAL void RTC_Reset(void);

GLOBAL void SetAllGameTime( int day, int hour, int min, int sec );
GLOBAL void SetGameTime( int hour, int min );
GLOBAL void GetGameTime( void );

//--------------------------------------------------------------
//	GAME_TIME構造体の差分を算出
//--------------------------------------------------------------
GLOBAL void CalcGameTimeDiff( GAME_TIME *ans,
		const GAME_TIME *old_time, const GAME_TIME *new_time );

//--------------------------------------------------------------
//	現在時間を秒単位で取得
//	※乱数の初期化に使うつもり
//--------------------------------------------------------------
GLOBAL u32 GetRealTimeMinute(void);

#ifdef	PM_DEBUG

/* デバッグ用文字列生成 */
GLOBAL void RTC_DebugMakeTimeString( u8 * buf );
GLOBAL void RTC_DebugMakeDateString( u8 * buf );
GLOBAL void RTC_DebugMakeDayString( u8 * buf );
GLOBAL void RTC_DebugMakeStatString(u8 * buf);
GLOBAL void MakeTimeString( u8 * buf, int hour, int min, int sec );
GLOBAL void MakeDateString( u8 * buf, int year, int month, int day );

#endif	PM_DEBUG

#undef GLOBAL
#endif	/*__RTCTOOL_H__*/

