//=========================================================================
//
//
//		サファリモード
//
//	
//=========================================================================

#include "common.h"
#include "script.h"
#include "ev_check.h"
#include "server.h"
#include "fld_main.h"
#include "jiki.h"
#include "pm_str.h"
#include "cubecase.h"
#include "fld_task.h"
#include "fld_main.h"
#include "fld_tool.h"
#include "sysflag.h"
#include "record.h"

#define	__SAFARI_H_GLOBAL__
#include "safari.h"


extern const VM_CODE ev_safari_cancel_check[];
extern const VM_CODE ev_safari_end_by_step[];
extern const VM_CODE ev_safari_end_by_ball[];
extern const VM_CODE ev_safari_end_common[];
extern const VM_CODE ev_safari_end_core[];

//=========================================================================
//	定義
//=========================================================================


//=========================================================================
//	変数
//=========================================================================

//サファリボールの数
u8 SafariBallCount = 0;

//サファリでの歩数カウンタ
u16 SafariStepCount = 0;

//=========================================================================
//	関数プロトタイプ
//=========================================================================
//GLOBAL type function(arg...);

static void SafariCubeTableWalk(void);	// キューブ置き場の歩数カウンタ

//-------------------------------------------------------------
//	サファリモードかどうかのチェック
//-------------------------------------------------------------
int IsFieldSafariMode( void )
{
	return EventFlagCheck( SYS_SAFARI_MODE );
}

void SetFieldSafariMode( void )
{
	EventFlagSet( SYS_SAFARI_MODE );
}

void ClearFieldSafariMode( void )
{
	EventFlagReset( SYS_SAFARI_MODE );
}


//-------------------------------------------------------------------------
//	サファリモード開始
//-------------------------------------------------------------------------
void SafariModeStart( void )
{
	IncRecord( CNT_SAFARI );
	SetFieldSafariMode();
	SafariCubeTableInitAll();
	SafariBallCount = SAFARI_BALL_MAX;
	SafariStepCount = SAFARI_STEP_MAX;
}

//-------------------------------------------------------------------------
//	サファリモード終了
//-------------------------------------------------------------------------
void SafariModeEnd( void )
{
	ClearFieldSafariMode();
	SafariCubeTableInitAll();
	SafariBallCount = 0;
	SafariStepCount = 0;
}


//-------------------------------------------------------------------------
//	サファリの歩数チェック
//-------------------------------------------------------------------------
u8 SafariStepCheck( void )
{
	if ( IsFieldSafariMode() == FALSE ) return FALSE;

	SafariCubeTableWalk();		// キューブ置き場の歩数カウンタ

	SafariStepCount --;
	if ( SafariStepCount == 0 ) {
		StartFieldScript( ev_safari_end_by_step );
		return TRUE;
	}
	return FALSE;
}

//-------------------------------------------------------------------------
//	サファリモードをやめるかどうかをたずねるスクリプトを呼び出す
//-------------------------------------------------------------------------
void SafariCancelAskStart( void )
{
	StartFieldScript( ev_safari_cancel_check );
}

//-------------------------------------------------------------------------
//	サファリでのエンカウント戦終了後の処理
//-------------------------------------------------------------------------
void SafariEncountEnd( void )
{
	if ( SafariBallCount != 0 ) {
		MainProcChange( FieldMainRecover );
	}
	else if ( WinLoseFlag == FIGHT_SAFARIBALL_NONE ) {
		DoSpecialScript( ev_safari_end_core );
		SetNextWorldPosition();
		pFieldRecoverFunc = AddFieldEncountEndFadeInTask;//OBJポーズを解除
		MainProcChange( FieldMainInit );
	}
	else if ( WinLoseFlag == FIGHT_ENEMY_GET ) {
		StartFieldScript( ev_safari_end_by_ball );
		StopFieldScript();
		MainProcChange( FieldScriptRecover );
	}
}


//=========================================================================
//	キューブ置き場
//=========================================================================
#define	CUBE_TABLE_MAX	10

typedef struct {
	s16	px;			// X座標
	s16	py;			// Y座標
	s8	map_id;		// マップID
	u8	cnt;		// 歩数カウンタ
	CUBE	cube;	// キューブ
//	u8	type;		// キューブの色
//	s8	param[5];	// 味
}CUBE_TABLE;

static CUBE_TABLE	put_cube[ CUBE_TABLE_MAX ] = {};

//-------------------------------------------------------------------------
//	キューブ置き場のデータを初期化
//-------------------------------------------------------------------------
void SafariCubeTableInit( u8 no )
{
	memset( &put_cube[no], 0, sizeof(CUBE_TABLE) );
}
// 全部
void SafariCubeTableInitAll(void)
{
	memset( put_cube, 0, sizeof(CUBE_TABLE)*CUBE_TABLE_MAX );
}

//-------------------------------------------------------------------------
//	キューブ置き場にキューブが置かれているか
//	置かれている   : AnswerWork = i
//	置かれていない : AnswerWork = 0xffff
//-------------------------------------------------------------------------
// 目の前
void SafariCubeTableCheck(void)
{
	u16	i;
	s16	x,y;

	GetHeroFrontCellPos( &x, &y );

	for( i=0; i<CUBE_TABLE_MAX; i++ ){
		if( Fld.MapID.map_id == put_cube[i].map_id &&
			put_cube[i].px == x && put_cube[i].py == y )
		{
			AnswerWork = i;
			PM_strcpy( StrTempBuffer0, cube_name[ put_cube[i].cube.type ] );
			return;
		}
	}
	AnswerWork = 0xffff;
}
// 5歩以内
void SafariCubeTableCheck2(void)
{
	u16	i;
	s16	x,y;

	GetHeroCellPos( &x, &y );

	for( i=0; i<CUBE_TABLE_MAX; i++ ){
		if( Fld.MapID.map_id == put_cube[i].map_id ){
			x = x - put_cube[i].px;
			y = y - put_cube[i].py;
			if( x < 0 )	x *= (-1);
			if( y < 0 )	y *= (-1);
			if( x + y <= 5 ){
				AnswerWork = i;
				return;
			}
		}
	}
	AnswerWork = 0xffff;
}

//-------------------------------------------------------------------------
//	キューブ置き場のキューブのパラメータを取得
//	戻り値 : 置かれている   = キューブデータのアドレス
//		   : 置かれていない = NULL
//-------------------------------------------------------------------------
// 目の前
CUBE * SafariCubeTableGet(void)
{
	SafariCubeTableCheck();

	if( AnswerWork == 0xffff )	return	NULL;

	return	&put_cube[AnswerWork].cube;
}
// 5歩以内
CUBE * SafariCubeTableGet2(void)
{
	SafariCubeTableCheck2();

	if( AnswerWork == 0xffff )	return	NULL;

	return	&put_cube[AnswerWork].cube;
}

//-------------------------------------------------------------------------
//	キューブ置き場にキューブをセット
//	引数 : no = 手持ちキューブの番号
//-------------------------------------------------------------------------
void SafariCubeTableSet( u8 no )
{
	u8	i;
	s16	x,y;

	for( i=0; i<CUBE_TABLE_MAX; i++ ){
		if( put_cube[i].map_id == 0 &&
			put_cube[i].px == 0 && put_cube[i].py == 0 )
		{
			GetHeroFrontCellPos( &x, &y );
			put_cube[i].map_id = Fld.MapID.map_id;
			put_cube[i].cube   = Fld.MyCube[no];
			put_cube[i].cnt    = 100;
			put_cube[i].px     = x;
			put_cube[i].py     = y;
			return;
		}
	}
}

//-------------------------------------------------------------------------
//	キューブ置き場の歩数カウンタ
//-------------------------------------------------------------------------
static void SafariCubeTableWalk(void)
{
	u8	i;

	for( i=0; i<CUBE_TABLE_MAX; i++ ){
		if( put_cube[i].cnt != 0 ){
			put_cube[i].cnt--;
			if( put_cube[i].cnt == 0 )
				SafariCubeTableInit(i);
		}
	}
}

//-------------------------------------------------------------------------
//	デバッグ用キューブ情報取得
//	<戻り値>	FALSE		キューブが存在しない
//				TRUE		キューブあり
//	StrTempBuffer0 = 名前、StrTempBuffer1 = 残り歩数
//-------------------------------------------------------------------------
int DebugSafariCubeInfo( void )
{
	SafariCubeTableCheck();
	if ( AnswerWork == 0xffff ) {
		return FALSE;
	}
	PM_NumMsgSet( StrTempBuffer1, put_cube[AnswerWork].cnt, NUM_MODE_ZERO, 3 );
	return TRUE;
}

