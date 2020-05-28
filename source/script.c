//=========================================================================
//	
//
//	スクリプト制御メイン部分
//
//	2001.11.07 by tama
//		※ここに記述されていたコマンド関数はscrcmd.cに移動した
//=========================================================================


#include "common.h"

#include "vm.h"
#include "map.h"
#include "sxytype.h"
#include "ev_flag.h"
#include "syswork.h"

#define SCRIPT_H_GLOBAL
#include "script.h"


//==============================================================
//	変数
//==============================================================

//	スクリプト状態定義
enum{
	SCRIPT_ON,
	SCRIPT_WAIT,
	SCRIPT_OFF,
};

//	スクリプト状態変数
static u8 field_script_status;

//	仮想マシン用制御構造体
static VM_MACHINE field_script;
static VM_MACHINE special_script;


//	強制イベント制御フラグ
static u8 ForceEventFlag;


extern const VM_CMD ScriptCommand[];	// スクリプトコマンド関数テーブル
extern const VM_CMD ScriptCommandEnd[];	// テーブル最後のアドレス

//==================================================================================
//
//	イベント起動チェック関連
//
//==================================================================================

//--------------------------------------------------------------
//	強制イベントフラグセット（ほかのイベント起動がフックされる）
//--------------------------------------------------------------
void SetForceEvent( void )
{
	ForceEventFlag = TRUE;
}

//--------------------------------------------------------------
//	強制イベントフラグ解除
//--------------------------------------------------------------
void ResetForceEvent( void )
{
	ForceEventFlag = FALSE;
}

//--------------------------------------------------------------
//	強制イベントフラグチェック
//	<戻り値>
//	TRUE	強制イベント中
//	FALSE	強制イベントでない
//--------------------------------------------------------------
u8 CheckForceEvent( void )
{
	return ForceEventFlag;
}



//==================================================================================
//
//	スクリプト制御関連
//
//==================================================================================
//--------------------------------------------------------------
//	スクリプト制御初期化
//--------------------------------------------------------------
void InitFieldScript( void )
{
	VM_Init( &field_script, ScriptCommand, ScriptCommandEnd );
	field_script_status = SCRIPT_OFF;
}

//--------------------------------------------------------------
//	スクリプト制御メイン
//	<戻り値>
//	TRUE	スクリプト実行中
//	FALSE	スクリプト実行終了
//--------------------------------------------------------------
u8 ControlFieldScript( void )
{
	if( field_script_status == SCRIPT_OFF )return FALSE;
	if( field_script_status == SCRIPT_WAIT )return FALSE;
	SetForceEvent();
	if( VM_Control( &field_script ) == FALSE )
	{
		field_script_status = SCRIPT_OFF;
		ResetForceEvent();
		return FALSE;
	};
	return TRUE;
}

//--------------------------------------------------------------
//	スクリプト制御スタート
//	<引数>
//	script	スクリプトデータアドレス
//--------------------------------------------------------------
void StartFieldScript(const VM_CODE * script)
{
		VM_Init( &field_script, ScriptCommand, ScriptCommandEnd );
		VM_Start( &field_script, script );
		SetForceEvent();
		field_script_status = SCRIPT_ON;
}

//--------------------------------------------------------------
//	スクリプト制御停止
//--------------------------------------------------------------
void StopFieldScript( void )
{
	field_script_status = SCRIPT_WAIT;
}

//--------------------------------------------------------------
//	スクリプト制御再開
//	（InitTaskが呼ばれた場合などに復活させる)
//--------------------------------------------------------------
void ContinueFieldScript( void )
{
	field_script_status = SCRIPT_ON;
	SetForceEvent();
}

//--------------------------------------------------------------
//	特殊スクリプト実行
//	<引数>
//	script	スクリプトデータアドレス
//--------------------------------------------------------------
void DoSpecialScript( const VM_CODE * script )
{
	VM_Init( &special_script, ScriptCommand, ScriptCommandEnd );
	VM_Start( &special_script, script );
	while( VM_Control( &special_script ) == TRUE );
}

//=========================================================================
//
//	スクリプトヘッダ処理関連
//
//=========================================================================

//-------------------------------------------------------------
//	ヘッダーデータから指定タイプのものを検索
//-------------------------------------------------------------
static const EV_DATA * search_header_data( u8 key )
{
	const EV_DATA * p;
	u32 adr;

	p = NowMap.Event;
	if ( p == NULL ) return NULL;
	while ( TRUE ) {
		if ( *p == 0 ) return NULL;
		if ( *p == key ) {
			p++;
			adr = *p + ( *(p+1)<<8 ) + ( *(p+2)<<16 ) + ( *(p+3)<<24 );
			return (EV_DATA *) adr;
		}
		p += (1 + 4);
	}
}

//-------------------------------------------------------------
//	ヘッダーデータから指定タイプのものを検索、実行する
//-------------------------------------------------------------
static void do_search_sp_script( u8 key )
{
	const EV_DATA * p;

	p = search_header_data( key );
	if( p == NULL )return;

	DoSpecialScript( p );
}

//-------------------------------------------------------------
//	指定タイプのテーブルを検索、条件をチェックして
//	実行スクリプトのアドレスを返す
//-------------------------------------------------------------
static const VM_CODE * get_enable_script( u8 key )
{
	const EV_DATA * p;
	u32 ret;
	u16 flag1,flag2;

	p = search_header_data( key );
	if ( p == NULL ) return NULL;

	while ( TRUE ) {
		flag1 = *p + ( *(p+1)<<8 );
		if( flag1 == 0 )return NULL;
		p += 2;
		flag2 = *p + ( *(p+1)<<8 );
		p += 2;
		if(  GetEventWorkValue(flag1) ==  GetEventWorkValue(flag2) )
		{
			ret =  *p + ( *(p+1)<<8 ) + ( *(p+2)<<16 ) + ( *(p+3)<<24 ) ;
			return (const VM_CODE *) ret;
		}
		p += 4;
	}
}

//-------------------------------------------------------------
//
//	マップ描画時の特殊処理関連
//
//-------------------------------------------------------------
void BgControlScriptCheck( void )
{
	do_search_sp_script( HEAD_BG_CHANGE );
}

//-------------------------------------------------------------
//
//	マップ遷移時のフラグ制御
//
//-------------------------------------------------------------
void FlagControlScriptCheck( void )
{
	do_search_sp_script( HEAD_FLAG_CTRL );
}

//-------------------------------------------------------------
//
// マップ初期化ごとの特殊処理関連
//
//-------------------------------------------------------------
void InitControlScriptCheck( void )
{
	do_search_sp_script( HEAD_INIT_CTRL );
}

//-------------------------------------------------------------
//
//	リンク制御の特殊処理
//	※現状、ダイビングの特殊接続を実現するためのみ使用
//
//-------------------------------------------------------------
void LinkControlScriptCheck( void )
{
	do_search_sp_script( HEAD_LINK_CTRL );
}

//-------------------------------------------------------------
//
//	シーン発動イベントチェック
//
//-------------------------------------------------------------
u8 SceneEventCheck( void )
{
	const VM_CODE * scr;

	scr = get_enable_script( HEAD_SCENE_CHK );
	if( scr == NULL )return FALSE;

	StartFieldScript( scr );
	return TRUE;
}

//-------------------------------------------------------------
//
//	マップ遷移時のOBJ関連制御
//
//-------------------------------------------------------------
void ObjControlScriptCheck( void )
{
	const VM_CODE * scr;

	scr = get_enable_script( HEAD_OBJ_CTRL );
	if( scr == NULL )return;

	DoSpecialScript( scr );
}

//=========================================================================
//
//		外部スクリプト関連
//
//=========================================================================
	/* とりあえずあいているところを使う */
#define	DATA_STORE_ADRS	(Fld.ExtraScript.work)
enum {
	EX_SCR_SIGN	= 0x33,	//何でもいいがとりあえず識別用コード

	EX_SCR_FLGID = 0,
	EX_SCR_DIVID,
	EX_SCR_MAPID,
	EX_SCR_OBJID,
	EX_SCR_MAINDATA,	//スクリプトデータ開始位置
};

const VM_CODE * ReserveScript = NULL;

//-------------------------------------------------------------
//	外部スクリプトチェックサム算出
//-------------------------------------------------------------
static u32 calc_exscript_checksum( void )
{
	u32 i,sum;
	sum = 0;
	for  (i=0;i<sizeof(DATA_STORE_ADRS); i++ ) {
		sum += DATA_STORE_ADRS[i];
	}
	return sum;
}

//-------------------------------------------------------------
//	外部スクリプトのクリア
//-------------------------------------------------------------
void ClearExScript( void )
{
	CpuClear( 0, (u8 *)&(Fld.ExtraScript), sizeof(Fld.ExtraScript), 32);
}

//-------------------------------------------------------------
//	外部スクリプトのセット
//	<引数>	
//			src				外部スクリプトのアドレス
//			size			外部スクリプトのサイズ
//			div_id	map_id	マップ指定
//			obj_id			そのマップでのＯＢＪＩＤ指定
//-------------------------------------------------------------
int SetExScript( const u8 * src, u16 size, u8 div, u8 map, u8 obj )
{
	u8 * s = Fld.ExtraScript.work;

	ClearExScript();
	if ( size >= EX_SCR_SIZE - EX_SCR_MAINDATA ) return FALSE;

	s[EX_SCR_FLGID] = EX_SCR_SIGN;
	s[EX_SCR_DIVID] = div;
	s[EX_SCR_MAPID] = map;
	s[EX_SCR_OBJID] = obj;

	memcpy( &(s[EX_SCR_MAINDATA]), src, size );

	Fld.ExtraScript.checksum = calc_exscript_checksum();

	return TRUE;
}

//-------------------------------------------------------------
//	ＯＢＪに指定した外部スクリプトのチェック
//	<引数>	obj_id		チェックするＯＢＪのＩＤ
//			org_script	通常起動するはずのスクリプトアドレス
//	<戻り値>	起動するスクリプトアドレス
//-------------------------------------------------------------
const VM_CODE * ExScriptObjCheck( u8 obj_id, const VM_CODE * org_script )
{
	u8 * s = Fld.ExtraScript.work;

	ReserveScript = NULL;

	if ( s[EX_SCR_FLGID] != EX_SCR_SIGN ) return org_script;
	if ( s[EX_SCR_DIVID] != Fld.MapID.div_id ) return org_script;
	if ( s[EX_SCR_MAPID] != Fld.MapID.map_id ) return org_script;
	if ( s[EX_SCR_OBJID] != obj_id ) return org_script;
	if ( calc_exscript_checksum() != Fld.ExtraScript.checksum ) {
		ClearExScript();	//壊れたスクリプトデータを削除
		return org_script;
	}

	ReserveScript = org_script;
	return &(s[EX_SCR_MAINDATA]);
}

