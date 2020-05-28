//========================================================================================
//										コイン
//								2002/03/29 by nakahiro
//								2002/06/05 by Iwasawa
//								2002/07/17 by tomo(win&etc)
//========================================================================================
#include "common.h"
#include "menu.h"
#include "ev_flag.h"
#include "coin.h"
#include "message.h"


//---------------------------------------
//		ウィンドウ内の所持コイン表示
//	引数：my  = 所持コイン
//		  x,y = ウィンドウ左上座標
//---------------------------------------
void DrawWinCoin( u32 my, u8 x, u8 y )
{
	DrawCoin( my, COIN_KETA_MAX, x+2, y+1 );
}

//---------------------------------------
//		所持コインウィンドウ表示
//	引数：my  = 所持コイン
//		  x,y = ウィンドウ左上座標
//---------------------------------------
void DrawCoinWin( u32 my, u8 x, u8 y )
{
	NMenuWinBoxWrite( x, y, x+9, y+3 );
	DrawWinCoin( my, x, y );
}

//---------------------------------------
//		所持コインウィンドウ削除
//	引数：x,y = ウィンドウ左上座標
//---------------------------------------
void DelCoinWin( u8 x, u8 y )
{
	NMenuBoxClear( x, y, x+9, y+3 );
}

//---------------------------------------
//				コイン表示
//	引数：my   = コイン数
//		  keta = 表示桁数
//		  x,y  = ウィンドウ左上座標
//---------------------------------------
void DrawCoin( u32 my, u8 keta, u8 x, u8 y )
{
	PM_NumMsgSet( StrTempBuffer0, my, NUM_MODE_SPACE, keta );
	NMenuMsgWrite( str_coin_mai, x, y );
}

//---------------------------------------
//			手持ち枚数チェック
//	戻り値 : 手持ちコイン数
//---------------------------------------
u16 G_CheckCoin(void)
{
	return	Fld.my_coin;
}

//---------------------------------------
//			手持ちに加える
//	引数   : u16 coin = 調べる枚数
//	戻り値 : TRUE = 成功　FALSE = 失敗
//---------------------------------------
u8 G_AddCoin( u16 coin )
{
	if( G_CheckCoin() >= MY_COIN_MAX )	return	FALSE;

	if( Fld.my_coin > (u16)( Fld.my_coin + coin ) ){
		Fld.my_coin = MY_COIN_MAX;
		return	TRUE;
	}

	Fld.my_coin += coin;
	if( Fld.my_coin > MY_COIN_MAX )	Fld.my_coin = MY_COIN_MAX;
	return	TRUE;
}

//---------------------------------------
//			手持ちを減らす
//	引数   : u16 coin = 調べる枚数
//	戻り値 : TRUE = 成功　FALSE = 失敗
//---------------------------------------
u8 G_SubCoin( u16 coin )
{
	if( G_CheckCoin() >= coin ){
		Fld.my_coin -= coin;
		return	TRUE;
	}
	return	FALSE;
}
