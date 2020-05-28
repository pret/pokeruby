//=========================================================================
//
//
//	イベントフラグ・ワーク操作関連
//
//
//	2001.10.23	GAME FREAK Inc.
//
//	2001.11.07	by tama
//		スクリプト・関数双方からアクセスされるワークの定義をscript.cから移動
//
//=========================================================================


#include "common.h"

#define	EV_FLAG_H_GLOBAL
#include "ev_flag.h"

#include "../script/savework.h"
#include "syswork.h"
#include "sysflag.h"

#include "zukan.h"

//-------------------------------------------------------------------------
//	定義など
//-------------------------------------------------------------------------
enum{
	LOCAL_WORK_SIZE = LOCALWORK15 - LOCALWORK0 + 1,
};

//-------------------------------------------------------------------------
//	変数
//-------------------------------------------------------------------------
// スクリプト内部での処理用
u16 ScriptRegister0 = 0;
u16 ScriptRegister1 = 0;
u16 ScriptRegister2 = 0;
u16 ScriptRegister3 = 0;

// スクリプトとプログラムのデータ交換用
u16 ScriptParameter0 = 0;
u16 ScriptParameter1 = 0;
u16 ScriptParameter2 = 0;
u16 ScriptParameter3 = 0;

// スクリプトでのテンポラリ
u16 ScriptTempWork0 = 0;
u16 ScriptTempWork1 = 0;
u16 ScriptTempWork2 = 0;
u16 ScriptTempWork3 = 0;

// スクリプトに答えを返す汎用ワーク
u16 AnswerWork = 0;

// 話かけた対象のＯＢＪのＩＤ
u16 TargetObjID = 0;

// 話かけた方向を保持するワーク
u16 TalkSiteWork = 0;

static u8 EventCtrlFlag[CTRLFLAG_AREA_MAX] = {};

//=========================================================================
//
//	初期化・リセット操作関連
//
//=========================================================================
extern u16 * const ScriptWorkTable[];
extern u16 * const ScriptWorkTableEnd[];

//-------------------------------------------------------------
//	イベントフラグ・ワークの初期化
//-------------------------------------------------------------
void EventDataInit( void )
{
	memset( Fld.EventFlag, 0x00, sizeof(Fld.EventFlag) );	// セーブフラグ
	memset( Fld.EventWork, 0x00, sizeof(Fld.EventWork) );	// セーブワーク
	memset( EventCtrlFlag, 0x00, sizeof(EventCtrlFlag) );	// 制御フラグ（セーブしない）
}

//-------------------------------------------------------------
//	マップ内限定のフラグをクリアする
//		※マップ遷移タイミングで呼ばれる
//-------------------------------------------------------------
void LocalEventFlagClear( void )
{
	//ローカルフラグのクリア 8*4 = 32個分
	memset( (u8 *)&(Fld.EventFlag[0]), 0x00, 4 );

	//ローカルワークのクリア
	memset( (u8 *)&(Fld.EventWork[0]), 0x00,
			sizeof(Fld.EventWork[0]) * LOCAL_WORK_SIZE );

	EventFlagReset( SYS_ENC_UP_ITEM );
	EventFlagReset( SYS_ENC_DOWN_ITEM );
	EventFlagReset( SYS_USE_WAZA_KAIRIKI );

	//OBJ消去タイミングの制御につかう
	//（戦闘後、画面復帰前にポケモンOBJを消したい場合など）
	EventFlagReset( SYS_CTRL_OBJ_DELETE );
}

//-------------------------------------------------------------
//	一日経過ごとにクリアされるフラグをクリアする
//-------------------------------------------------------------
void OneDayFlagClear( void )
{
	u8 * p;
	p = (u8 *)&(Fld.EventFlag[TIMEFLAG_START/8]);
	memset( p, 0x00, TIMEFLAG_AREA_MAX );
}

//-------------------------------------------------------------
//	ずかんの全国モード、ホウエンモード関連
//-------------------------------------------------------------
#define	ZUKAN_ENABLE_WORD	0x302
#define ZUKAN_ENABLE_BYTE	0xda

//	初期化
void ZukanSpecialFlagInit( void )
{
	u16 * wk = GetEventWorkAdrs( WK_SPECIAL_ZUKAN );

	MyData.Zukan.ZenkokuZukanFlag = 0;
	*wk = 0;
	EventFlagReset( SYS_SPECIAL_ZUKAN );
}

//	セット
void ZukanSpecialFlagSet( void )
{
	u16 * wk = GetEventWorkAdrs( WK_SPECIAL_ZUKAN );

	MyData.Zukan.ZenkokuZukanFlag = ZUKAN_ENABLE_BYTE;
	*wk = ZUKAN_ENABLE_WORD;
	EventFlagSet( SYS_SPECIAL_ZUKAN );
	MyData.Zukan.ListMode = ZLIST_WORLD;
	MyData.Zukan.ListSort = ZSORT_NUM;
	ZukanWorkInit();
}

//	チェック
int ZukanSpecialFlagCheck( void )
{
	if ( MyData.Zukan.ZenkokuZukanFlag != ZUKAN_ENABLE_BYTE ) return FALSE;
	if ( GetEventWorkValue( WK_SPECIAL_ZUKAN ) != ZUKAN_ENABLE_WORD ) return FALSE;
	if ( EventFlagCheck( SYS_SPECIAL_ZUKAN ) == FALSE ) return FALSE;
	return TRUE;
}

//-------------------------------------------------------------
//	外部データの使用許可関連
//-------------------------------------------------------------
//クリア
void ExDataSpecialFlagInit( void )
{
	EventFlagReset( SYS_EXDATA_ENABLE );
}

//セット
void ExDataSpecialFlagSet( void )
{
	EventFlagSet( SYS_EXDATA_ENABLE );
}

//チェック
int ExDataSpecialFlagCheck( void )
{
	return EventFlagCheck( SYS_EXDATA_ENABLE );
}

//-------------------------------------------------------------
//	ゲーム内時間の再設定許可関連
//-------------------------------------------------------------
#define	RTCRESET_ENABLE_WORD	0x0920

void GameTimeSpecialFlagInit(void)
{
	SetEventWorkValue(WK_GAMETIME_RESET, 0);
	EventFlagReset(SYS_GAMETIME_RESET);
}

void GameTimeSpecialFlagSet(void)
{
	SetEventWorkValue(WK_GAMETIME_RESET, RTCRESET_ENABLE_WORD);
	EventFlagSet(SYS_GAMETIME_RESET);
}

int GameTimeSpecialFlagCheck(void)
{
	if (EventFlagCheck(SYS_GAMETIME_RESET) == FALSE)
		return FALSE;

	if (GetEventWorkValue(WK_GAMETIME_RESET) != RTCRESET_ENABLE_WORD)
		return FALSE;

	return TRUE;
}

//=========================================================================
//	イベントワーク関連
//=========================================================================
//-------------------------------------------------------------
//	u16 サイズのワークアドレスを取得
//	<引数>
//		ワークＩＤ
//		0 -			通常のセーブワーク
//		0x8000-		登録したプログラム上の変数
//	<戻り値>
//		ワークのアドレス
//-------------------------------------------------------------
u16 * GetEventWorkAdrs(u16 id)
{
	if( id < SVWK_START )return NULL;
	if( id < SCWK_START ) return &Fld.EventWork[id - SVWK_START];
	return ScriptWorkTable[ id - SCWK_START ];
}

//-------------------------------------------------------------
//	イベントワークの値を取得
//	<引数>
//			id		ワークＩＤ
//	<戻り値>
//			ワークの値
//-------------------------------------------------------------
u16 GetEventWorkValue(u16 id)
{
	u16 * res;
	res = GetEventWorkAdrs(id);
	if( res == NULL )return id;
	return *res;
}

//-------------------------------------------------------------
//	イベントワークに値をセット
//	<引数>
//			id		ワークＩＤ
//			value	セットする値
//	<戻り値>
//			TRUE	セットできた
//			FALSE	セット失敗
//-------------------------------------------------------------
int SetEventWorkValue( u16 id, u16 value )
{
	u16 * p;
	p = GetEventWorkAdrs( id );
	if ( p == NULL ) return FALSE;
	*p = value;
	return TRUE;
}

//-------------------------------------------------------------
// スクリプトから指定するＯＢＪコードを取得
// <引数>
// 0 - 7
// <戻り値>
// ＯＢＪキャラコード
//-------------------------------------------------------------
u8 GetEvDefineObjCode( u8 no )
{
	return (u8)GetEventWorkValue( OBJCHRWORK1 + no );
}


//=========================================================================
//		イベントフラグ関連
//=========================================================================
//-------------------------------------------------------------
//	イベントフラグのアドレスを取得する
//	<引数>		フラグＩＤ
//	<戻り値>	フラグアドレス
//				NULLの場合→未定義
//-------------------------------------------------------------
static u8 * get_flag_adrs( u16 flag )
{
	if ( flag == 0 ) {
		return NULL;
	} else if ( flag < SCFLG_START ) {
		return &(Fld.EventFlag[flag/8]);
	} else {
		return &(EventCtrlFlag[ (flag-SCFLG_START)/8 ]);
	}
}

//-------------------------------------------------------------
//	イベントフラグをセットする
//	<引数>
//		フラグＩＤ（../script/saveflag.hを参照)
//-------------------------------------------------------------
u8 EventFlagSet(u16 flag)
{
	u8 * p = get_flag_adrs( flag );
	if ( p != NULL ) {
		*p |= 1 << ( flag % 8 );
	}
	return 0;
}

//-------------------------------------------------------------
//	イベントフラグをリセットする
//	<引数>
//		フラグＩＤ（../script/saveflag.hを参照)
//-------------------------------------------------------------
u8 EventFlagReset(u16 flag)
{
	u8 * p = get_flag_adrs( flag );
	if ( p != NULL ) {
		*p &= 0xff ^ (1 << ( flag % 8 ) );
	}
	return 0;
}

//-------------------------------------------------------------
//	イベントフラグをセットする
//	<引数>
//		フラグＩＤ（../script/saveflag.hを参照)
//	<戻り値>
//		ON/OFF
//-------------------------------------------------------------
u8 EventFlagCheck(u16 flag)
{
	u8 * p = get_flag_adrs( flag );
	if ( p != NULL ) {
		if ( *p & ( 1 << ( flag % 8 ) ) ) return ON;
	}
	return OFF;
}

