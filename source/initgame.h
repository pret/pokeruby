
#ifndef __INITGAME_H__
#define __INITGAME_H__

//=========================================================================
//	
//=========================================================================

#undef GLOBAL
#ifdef __INITGAME_H_GLOBAL__
#define GLOBAL /*	*/
#else
#define GLOBAL extern
#endif

//=========================================================================
//	定義
//=========================================================================
//#define name value

//typedef ...

//DebugInitGame のタイプ指定
enum{
	DEBUG_START_NORMAL,
	DEBUG_START_FOREIGNER,
};

//=========================================================================
//	変数
//=========================================================================
//GLOBAL type valiable;

extern u8	FirstSaveFlag;			//最初からゲームをはじめたかどうかのフラグ


//デバッグバージョンのみ有効､デバッグモードフラグ
#ifdef	PM_DEBUG
extern u8 DebugMainFlag;
#endif

#ifdef	FESTA_VER_ROM
extern u8 FestaModeFlag;
#endif

//=========================================================================
//	関数プロトタイプ
//=========================================================================
//GLOBAL type function(arg...);

//-----------------------------------------------------------------
//	ID(32ビット長）をセットする
//	<引数>
//		id_value	IDナンバー(u32の値)
//		set_pos		格納場所のアドレス(u8の配列)
//-----------------------------------------------------------------
GLOBAL void ID_Set( u32 id_value, u8 * set_pos );

//-----------------------------------------------------------------
//	ID(u8×4）をコピーする
//	<引数>		to		コピー先アドレス
//				from	コピー元アドレス
//-----------------------------------------------------------------
GLOBAL void ID_Copy( u8 * to, u8 * from );

//	ゲーム進行用ワークエリアの初期化
//	※セーブされないワークの初期化
GLOBAL void InitGameWork( void );

//	プレイヤーシステムセーブデータエリアのクリア
GLOBAL void SysSaveDataInit( void );

//	通常ゲーム開始データを設定
GLOBAL void InitGame( void );

#ifdef	PM_DEBUG
//	デバッグモードでのゲーム開始を設定
GLOBAL void DebugInitGame( int type );
#endif

//	ゲームオーバー時のパラメータ設定
GLOBAL void RestartGame( void );

//	そらをとぶ時のフラグリセット
GLOBAL void InitEventFlagAtFlying( void );

//	テレポート時のフラグリセット
GLOBAL void InitEventFlagAtTeleport( void );

//	あなぬけ時のフラグリセット
GLOBAL void InitEventFlagAtEscape( void );

//	ゲームオーバー時のフラグリセット
GLOBAL void InitEventFlagAtGameOver( void );

//	コンティニュー時のフラグリセット
GLOBAL void InitEventFlagAtContnue( void );


// マップ切替（debug用）
GLOBAL void DebugSetNextMap(void);

//=========================================================================
//=========================================================================

#undef GLOBAL
#endif	/*__INITGAME_H__*/

