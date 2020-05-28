//=========================================================================
//								所持金関連
//									2001/09/27 by nakahiro
//=========================================================================
#include "common.h"
#include "MaDefine.h"
#include "menu.h"
#include "actor.h"
#include "actanm.h"
#include "ev_flag.h"
#include "gold.h"
#include "decord.h"
#include "message.h"

//-------------------------------------------------------------------------
//								所持金チェック
//	引数  ：my    = チェック場所
//			check = チェック金額
//	戻り値：TRUE  = 足りている
//			FALSE = 足りない
//-------------------------------------------------------------------------
u8 CheckGold( u32 my, u32 check )
{
	if( my >= check )	return	TRUE;
	return	FALSE;
}

//-------------------------------------------------------------------------
//								所持金を増やす
//	引数：*my = 増やす場所
//		  add = 増やす金額
//-------------------------------------------------------------------------
void AddGold( u32 *my, u32 add )
{
	if( *my > (u32)( *my + add ) ){
		*my = GOLD_MAX;
		return;
	}

	*my += add;
	if( *my > GOLD_MAX )	*my = GOLD_MAX;
}

//-------------------------------------------------------------------------
//								所持金を減らす
//	引数：*my = 減らす場所
//		  sub = 減らす金額
//-------------------------------------------------------------------------
void SubGold( u32 *my, u32 sub )
{
	if( *my < sub )	*my = 0;
	else			*my -= sub;
}

//-------------------------------------------------------------------------
//								金額表示
//	引数：my   = 金額
//		  keta = 表示桁数
//		  x,y  = ウィンドウ左上座標
//-------------------------------------------------------------------------
void DrawGold( u32 my, u8 keta, u8 x, u8 y )
{
	PM_NumMsgSet( StrTempBuffer0, my, NUM_MODE_SPACE, keta );
	NMenuMsgWrite( str_yen, x, y );
}

//--------------------------------
//		"おこずかい"アクター
//--------------------------------
#define	CELLID_OKOZUKAI		10018
#define	PALID_OKOZUKAI		10018

static u8	act_no = 0;

static const ActOamData gold_oam =
{
	0,		//Vﾎﾟｼﾞｼｮﾝ
	0,		//拡大縮小ﾓｰﾄﾞ設定
	0,		//OBJﾓｰﾄﾞ設定(NORMAL)
	0,		//ﾓｻﾞｲｸ設定(OFF)
	0,		//ｶﾗｰﾓｰﾄﾞ設定(16色)
	1,		//OBJ形状設定(正方形)
	0,		//Hﾎﾟｼﾞｼｮﾝ
	0,		//拡大縮小ﾊﾟﾗﾒｰﾀﾅﾝﾊﾞｰ設定
	2,		//OBJサイズ設定	16x16
	0,		//ｷｬﾗｸﾀｰ数
	0,		//表示ﾌﾟﾗｲｵﾘﾃｨｰ設定(第3優先)
	0,		//ﾊﾟﾚｯﾄﾅﾝﾊﾞｰ
	0,		//AffineParam
};
static const actAnm gold_anm[] =
{
	{ OBJ16_32x16 * 0, 0, 0, 0 },
	{ ACT_ANMEND, 0, 0, 0},
};
static const actAnm * const GoldAnmTbl[] = 
{
	gold_anm,
};

static const actHeader ActGoldHeader =
{
	CELLID_OKOZUKAI,
	PALID_OKOZUKAI,
	&gold_oam,
	GoldAnmTbl,
	0,
	DummyActAffTbl,
	DummyActMove,
};

static const CellData OkozukaiCell = {
	(void *)gold_pch_ADRS, OBJ_SIZE16_32x16, CELLID_OKOZUKAI
};

static const PalData OkozukaiPal = { (void *)shopwin_pcl_ADRS, PALID_OKOZUKAI };




//-------------------------------------------------------------------------
//						ウィンドウ内の所持金表示
//	引数：my  = 所持金
//		  x,y = ウィンドウ左上座標
//-------------------------------------------------------------------------
void DrawWinOkozukai( u32 my, u8 x, u8 y )
{
	DrawGold( my, GOLD_KETA_MAX, x+6, y+1 );
}

//-------------------------------------------------------------------------
//							所持金ウィンドウ表示
//	引数：my  = 所持金
//		  x,y = ウィンドウ左上座標
//-------------------------------------------------------------------------
void DrawGoldWin( u32 my, u8 x, u8 y )
{
	NMenuWinBoxWrite( x, y, x+13, y+3 );
	DrawWinOkozukai( my, x, y );

	DecordCellSet( (CellData *)&OkozukaiCell );
	DecordPalSet( (PalData *)&OkozukaiPal );

	act_no = AddActor( &ActGoldHeader, x*8+19, y*8+11, 0 );
}

//-------------------------------------------------------------------------
//							所持金ウィンドウ削除
//	引数：x,y = ウィンドウ左上座標
//-------------------------------------------------------------------------
void DelOkozukaiWin( u8 x, u8 y )
{
	AllDelActor( &ActWork[act_no] );
	ObjPalRegNumDel( PALID_OKOZUKAI );

	NMenuBoxClear( x, y, x+13, y+3 );
}

// =================================================================
// CheckMyGold
// 概要  : 自分の手持ちのお金が足りているか(スクリプト用)
// 引数  : 無し（ただし比較する金額がScriptParameter1に入っている）
// 戻り値: u8 TRUE=足りてる	FALSE=足りてない
// =================================================================
u8 CheckMyGold(void)
{
	return CheckGold(Fld.my_gold,ScriptParameter1);
}

// =================================================================
// SubMyGold
// 概要  : 自分の手持ちのお金から金額分引く(スクリプト用)
// 引数  : 無し（ただし差し引く金額がScriptParameter1に入っている）
// 戻り値: none
// =================================================================
void SubMyGold(void)
{
	SubGold( &Fld.my_gold, ScriptParameter1 );
}

