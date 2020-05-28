//==================================================================================
//
//
//	8×8固定フォントでのウィンドウ・メッセージ表示ライブラリ
//
//
//==================================================================================
#include "common.h"
#include "print.h"
#include "mus_tool.h"

#define MENUTOOL_H_GLOBAL
#include "menutool.h"

#include "mapbg.h"
#include "window.h"
#include "field.h"
#include "fld_main.h"

TALK_WIN win[4] ={};
TALK_WIN * pWin = NULL;

#define FIX_WIN_START	(SYS_FONT_SIZ+NWIN_CHR_START_NO)
#define LINE_HEIGHT	2

/* カーソル制御構造体 */
typedef struct {
	u8 x,y;
	s8 Pos;
	s8 Start;
	s8 End;
	u8 xsize;				//nohara	02/01/18
	u8 ysize;				//nohara	02/01/18
	u8 StrWidth[7];			//nohara	02/01/18
}CURSOR_CTRL;

static u8 menu_init_seq = 0;

static CURSOR_CTRL	csr;

u16 MenuFontStartNo = 0;	// 文字フォント開始位置
u16 MenuNWinStartNo = 0;	// メニューウィンドウフォント開始位置
u16 MenuKWinStartNo = 0;	// MSGウィンドウフォント開始位置
u16 MenuChrEndNo = 0;		//　フォント終了位置


//==================================================================================
//
//	ウィンドウ・メッセージ描画関連
//
//==================================================================================

//----------------------------------------------------------------------------------
//	初期化処理
//	※フォント、ウィンドウキャラのセット
//	※MSG表示用変数の初期化
//----------------------------------------------------------------------------------
void NMenuScreenInit(CONTEXT_TYPE type)
{
	NMenuScreenInitEx( type, FIX_WIN_START );
};

void NMenuScreenInitStart(CONTEXT_TYPE type )
{
	NMenuScreenInitStartEx( type, FIX_WIN_START );
}

void NMenuScreenInitStartEx(CONTEXT_TYPE type, u16 chr_no)
{
	menu_init_seq = 0;
	MenuFontStartNo = chr_no;
	pWin = &win[0];
	MsgControlInit( pWin, type );
}

int NMenuScreenInitMain( void )
{
	switch ( menu_init_seq ) {
	case 0:
		menu_init_seq++;break;

	case 1:
		MenuNWinStartNo = PRT_SetSplitFontInit( pWin, MenuFontStartNo );
		menu_init_seq++;break;
	
	case 2:
		if ( PRT_SetSplitFontMain() == FALSE ) break;
		menu_init_seq++;break;

	case 3:
		MenuKWinStartNo = NWinFrameInit( MenuNWinStartNo );
		menu_init_seq++;break;
	
	case 4:
		NWinFrameDataSet( pWin );
		MenuChrEndNo = KWinFrameInit( MenuKWinStartNo );
		return TRUE;
	};
	return FALSE;
}

void NMenuScreenInitEx(CONTEXT_TYPE type, u16 chr_no)
{
	pWin = &win[0];
	MsgControlInit( pWin, type );

	MenuFontStartNo = chr_no;
	MenuNWinStartNo = PrintFontInit( pWin, MenuFontStartNo );
	MenuKWinStartNo = NWinFrameInit( MenuNWinStartNo );
	NWinFrameDataSet( pWin );
	MenuChrEndNo = KWinFrameInit( MenuKWinStartNo );
};

void NMenuScreenInitEx2( CONTEXT_TYPE type, u16 chr_no )
{
	pWin = &win[0];
	MsgControlInit( pWin, type );

	MenuNWinStartNo = chr_no;
	MenuKWinStartNo = NWinFrameInit( MenuNWinStartNo );
	NWinFrameDataSet( pWin );
	MenuFontStartNo = KWinFrameInit( MenuKWinStartNo );
	MenuChrEndNo = PrintFontInit( pWin, MenuFontStartNo );
}


void NMenuWindowCharSet( u8 type )
{
	NWinFrameDataCustomSet( pWin, type );
}

void NMenuWindowReset( void )
{
	NWinFrameDataSet( pWin );
}

//----------------------------------------------------------------------------------
//	使用コンテキストの切り替え
//	※フォントキャラは事前に呼ばれたNMenuScreenInitでセットされているため
//	　コンテキストでの指定が違ってもキャラやカラーは画面には反映されない
// <引数>
//	type	コンテキストタイプ指定
//----------------------------------------------------------------------------------
void NMenuContextChange( CONTEXT_TYPE type )
{
	MsgControlInit( pWin, type );
};

//----------------------------------------------------------------------------------
//　メッセージの表示
// <引数>
//	msg		メッセージデータへのポインタ
//	x,y		表示位置指定
//----------------------------------------------------------------------------------
void NMenuMsgWrite(const u8 * msg, u8 x, u8 y)
{
	MsgPrint(pWin,msg, MenuFontStartNo, x, y);
};

//----------------------------------------------------------------------------------
//　矩形領域のクリア
// <引数>
//	x1,y1,x2,y2		領域指定
//----------------------------------------------------------------------------------
void NMenuBoxClear(u8 x1, u8 y1, u8 x2, u8 y2)
{
	FontScrnAreaClear( pWin, x1, y1, x2, y2 );
};

//----------------------------------------------------------------------------------
//	矩形領域を空白で描画
// <引数>
//	x1,y1,x2,y2		領域指定
//----------------------------------------------------------------------------------
void NMenuBoxWrite(u8 x1, u8 y1, u8 x2, u8 y2)
{
	FontScrnEasyBoxFill(pWin,x1,y1,x2,y2);
};

//----------------------------------------------------------------------------------
//	スクリーン全体をクリア
//----------------------------------------------------------------------------------
void NMenuScreenClear(void)
{
	NMenuBoxClear( 0,0,29,19);
};

//----------------------------------------------------------------------------------
//	矩形領域にウィンドウ描画
// <引数>
//	x1,y1,x2,y2		領域指定
//----------------------------------------------------------------------------------
void NMenuWinBoxWrite(u8 x1, u8 y1, u8 x2, u8 y2)
{
	NWinFrameWrite(pWin,x1,y1,x2,y2);
};

//----------------------------------------------------------------------------------
//	画面下部にウィンドウで囲まれたメッセージを表示
// <引数>
//	msg		メッセージデータへのポインタ
//----------------------------------------------------------------------------------
void NMenuWinMsgWrite(const u8 * msg)
{
	NMenuWinBoxWrite(2,14,28,19);
	NMenuMsgWrite(msg,3,15);
};

//----------------------------------------------------------------------------------
//　一文字表示
// <引数>
//	code		表示する文字コード
//	x,y		表示位置指定
//----------------------------------------------------------------------------------
void NMenuPutc( u8 code, u8 x, u8 y )
{
	MsgPutc( pWin, code, MenuFontStartNo, x, y);
}

//----------------------------------------------------------------------------------
//	スクリーンコード取得
// <引数>
//	x,y		取得位置指定
//<戻り値>
//			指定位置のスクリーンコード
//----------------------------------------------------------------------------------
u16 NMenuGetCode( u8 x, u8 y )
{
	return FontScrnCodeGet(pWin,x,y);
}

//----------------------------------------------------------------------------------
//	矩形描画（枠のみ）
//<引数>
//	code			描画に使用するコード
//	x1,y1,x2,y2		領域指定
//----------------------------------------------------------------------------------
void NMenuBoxLineDirect( u16 code, u8 x1, u8 y1, u8 x2, u8 y2 )
{
	FontScrnBoxLineDirect( pWin, code, x1,y1,x2,y2);
}

//==================================================================================
//
//	送りメッセージ関連
//
//==================================================================================
//----------------------------------------------------------------------------------
//	会話ウィンドウ表示
//----------------------------------------------------------------------------------
void NMenuTalkWinWrite( void )
{
	KWinFrameWrite( pWin );
};

//----------------------------------------------------------------------------------
//	送りメッセージ表示セット
//	<引数>
//	msg		メッセージデータへのポインタ
//	x,y		表示位置指定
//----------------------------------------------------------------------------------
void NMenuTalkMsgSet(const u8 * msg, u8 x, u8 y)
{
	TalkMsgSet( pWin, msg, MenuFontStartNo, x, y);
};

//----------------------------------------------------------------------------------
//	標準位置への送りメッセージ表示セット
//	<引数>
//	msg		メッセージデータへのポインタ
//----------------------------------------------------------------------------------
void NMenuTalkMsgSetEasy( const u8 * msg )
{
	TalkMsgSet( pWin, msg, MenuFontStartNo, MWIN_MSGXPOS, MWIN_MSGYPOS );
};

//----------------------------------------------------------------------------------
//	続きメッセージ表示セット(2002/4/30 TETSU)
//	<引数>
//	msg		メッセージデータへのポインタ
//----------------------------------------------------------------------------------
void NMenuTalkMsgSetContinue( const u8 * msg )
{
	//とりあえず実験
	ContinueMsgSet( pWin, msg );
};

//----------------------------------------------------------------------------------
//	送りメッセージ表示
//	<戻り値>
//	0			表示中
//	1			指定文字列の表示終了
//----------------------------------------------------------------------------------
u8 NMenuTalkMsgPut( void )
{
	return TalkMsgPut( pWin );
};

//----------------------------------------------------------------------------------
//	メッセージ表示(一文字ごとに返る）
//	※TalkMsg系の制御コードがほとんど使用できないので注意
//	<戻り値>
//	0			表示中
//	1			指定文字列の表示終了
//----------------------------------------------------------------------------------
u8 NMenuTalkMsgPutc( void )
{
	return TalkMsgPutc( pWin );
}

//----------------------------------------------------------------------------------
//	ウィンドウメッセージのクリア
//----------------------------------------------------------------------------------
void NMenuTalkMsgClr( void )
{
	TalkMsgClr( pWin );
}


//==================================================================================
//
//	カーソル選択関連
//
//==================================================================================

//----------------------------------------------------------------------------------
//	縦方向カーソル選択の初期化
// <引数>
//	x,y		カーソル基本位置
//	Max		カーソル選択肢数
//	Pos		カーソル初期選択位置
// <戻り値>
//	カーソル初期選択位置（修正後）
//----------------------------------------------------------------------------------
u8 NMenuVCursorInit(u8 x, u8 y, u8 Max, u8 Pos)
{
	csr.x = x;
	csr.y = y;
	csr.Start = 0;
	csr.End = Max - 1;
	if(Pos < csr.Start || Pos > csr.End) Pos=csr.Start;
	csr.Pos = Pos;
	NMenuVCursorSet(0);
	return Pos;
};

//----------------------------------------------------------------------------------
//	縦方向カーソルの移動 & セット
// <引数>
// mv		カーソル移動値
// <戻り値>
//	カーソル選択位置
//----------------------------------------------------------------------------------
//	縦方向カーソルの移動 & セット(ループあり)
u8 NMenuVCursorSet(s8 mv)
{
	u8	code[]={cursor_,EOM_};

	NMenuBoxWrite( csr.x, csr.y+(csr.Pos * LINE_HEIGHT),
			csr.x, csr.y+1+(csr.Pos * LINE_HEIGHT) );
		
	if( csr.Pos+mv < csr.Start )
		csr.Pos=csr.End;

	else if( csr.Pos+mv > csr.End )
		csr.Pos=csr.Start;

	else
		csr.Pos += mv;

	NMenuMsgWrite(code, csr.x, csr.y+(csr.Pos * LINE_HEIGHT) );

	return csr.Pos;
};

//	縦方向カーソルの移動 & セット(ループなし)
u8 NMenuVCursorSetNoloop(s8 mv)
{
	u8	code[]={cursor_,EOM_};

	NMenuBoxWrite( csr.x, csr.y+(csr.Pos * LINE_HEIGHT),
			csr.x, csr.y+1+(csr.Pos * LINE_HEIGHT) );
		
	if( csr.Pos+mv < csr.Start )
		csr.Pos=csr.Start;

	else if( csr.Pos+mv > csr.End )
		csr.Pos=csr.End;

	else
		csr.Pos += mv;

	NMenuMsgWrite(code, csr.x, csr.y+(csr.Pos * LINE_HEIGHT) );

	return csr.Pos;
};

//----------------------------------------------------------------------------------
//	縦方向カーソルの選択位置を取得
// <戻り値>
//	カーソル選択位置
//----------------------------------------------------------------------------------
u8 NMenuVCursorPosGet(void)
{
	return csr.Pos;
};

//----------------------------------------------------------------------------------
//	簡単な縦方向カーソルの制御
//	上キー(上移動）、下キー（下移動）、Ａボタン（決定）、Ｂボタン（キャンセル）
//
// <戻り値>
//	CURSOR_CANCEL_VALUE		キャンセルされた
//	CURSOR_DEFAULT_VALUE	まだ選択されていない
//	0 ～					決定された選択位置
//----------------------------------------------------------------------------------
//	簡単な縦方向カーソルの制御(ループあり)
s8 NMenuVCursorControl(void)
{
	if( sys.Trg & A_BUTTON ){
		SePlay(SE_SELECT);
		return csr.Pos;
	};
	if( sys.Trg & B_BUTTON ){
		return CURSOR_CANCEL_VALUE;
	};
	if( sys.Trg & U_KEY ){
		SePlay(SE_SELECT);
		NMenuVCursorSet(-1);
		return CURSOR_DEFAULT_VALUE;
	};
	if( sys.Trg & D_KEY ){
		SePlay(SE_SELECT);
		NMenuVCursorSet(1);
		return CURSOR_DEFAULT_VALUE;
	};

	return CURSOR_DEFAULT_VALUE;
};

//	簡単な縦方向カーソルの制御(ループなし)
s8 NMenuVCursorControlNoloop(void)
{
	u8	pos_bak;

	pos_bak = csr.Pos;

	if( sys.Trg & A_BUTTON ){
		SePlay(SE_SELECT);
		return csr.Pos;
	};
	if( sys.Trg & B_BUTTON ){
		return CURSOR_CANCEL_VALUE;
	};
	if( sys.Trg & U_KEY ){
		if(pos_bak != NMenuVCursorSetNoloop(-1))	SePlay(SE_SELECT);
		return CURSOR_DEFAULT_VALUE;
	};
	if( sys.Trg & D_KEY ){
		if(pos_bak != NMenuVCursorSetNoloop(1))		SePlay(SE_SELECT);
		return CURSOR_DEFAULT_VALUE;
	};
	return CURSOR_DEFAULT_VALUE;
};

//u8 xsize;
//u8 ysize;
//----------------------------------------------------------------------------------
//	縦横方向カーソルの移動 & セット			2001/08/28 by nakahiro
// <引数>
// m		カーソル移動値
// <戻り値>
//	カーソル選択位置
//----------------------------------------------------------------------------------
//
//
u8 NMenuHVCursorSet( s8 m )
{
	u8	code[] = { cursor_,EOM_ };
	u8	v_max;

/*	NMenuBoxWrite( csr.x+( (csr.Pos>>1) * 6), csr.y+( (csr.Pos % 2) * LINE_HEIGHT),
		csr.x+( (csr.Pos>>1) * 6), csr.y+1+( (csr.Pos % 2) * LINE_HEIGHT) );
*/
	v_max = ( csr.End + 1 ) >> 1;

	NMenuBoxWrite( csr.x+csr.Pos/v_max*6, csr.y+csr.Pos%v_max*LINE_HEIGHT,
		csr.x+csr.Pos/v_max*6, csr.y+1+csr.Pos%v_max*LINE_HEIGHT );

	if( csr.Pos+m < csr.Start )
		csr.Pos=csr.End;

	else if( csr.Pos+m > csr.End )
		csr.Pos=csr.Start;

	else
		csr.Pos += m;

//	NMenuMsgWrite(code, csr.x+( (csr.Pos>>1) * 6), csr.y+( (csr.Pos % 2) * LINE_HEIGHT) );
	NMenuMsgWrite(code, csr.x+csr.Pos/v_max*6, csr.y+csr.Pos%v_max*LINE_HEIGHT );

	return csr.Pos;
};

/********************************************/
//プロトタイプ宣言
/********************************************/
u8 NMenuHVCursorSet2(s8 m);
u8 NMenuHVCursorKeyChk();
s8 YesNoHVSelectMain(void);
void NMenuHVWinSet(u8 x, u8 y, u8 Max, const MENU_ITEM * menu, u8 arrange);
u8 NMenuHVCursorInit(u8 x, u8 y, u8 Max, u8 Pos, u8 arrange);
void NMenuHVStrSet(u8 x, u8 y, u8 Max, const MENU_ITEM * menu, u8 arrange);
void HVSelectInit(u8 x, u8 y, u8 Max, u8 Pos, const MENU_ITEM * menu, u8 arrange);

//----------------------------------------------------------------------------------
//	縦横方向カーソルの移動 & セット			02/01/17 nohara
// <引数>
// m		カーソル移動値
// <戻り値>
//	カーソル選択位置
//----------------------------------------------------------------------------------
u8 NMenuHVCursorSet2(s8 m)
{
	u8	code[]={cursor_,EOM_};

	//カーソル制御
	if( (csr.Pos+m) <= csr.End )
	{
		if( NMenuHVCursorKeyChk() == 1 )	return csr.Pos;
	}else
	{
		return csr.Pos;
	}

	//移動前のカーソル位置クリア
	if( (csr.End+1) / csr.xsize == 0 )
	{
		NMenuBoxWrite( csr.x+csr.StrWidth[csr.Pos % csr.xsize], 
			csr.y+( ( (csr.Pos / csr.xsize) % csr.ysize) * LINE_HEIGHT),
			csr.x+csr.StrWidth[csr.Pos % csr.xsize],
			csr.y+1+( ( (csr.Pos / csr.xsize) % csr.ysize) * LINE_HEIGHT) );
	}else
	{
		NMenuBoxWrite( csr.x+csr.StrWidth[csr.Pos % csr.xsize], 
			csr.y+( ( (csr.Pos / csr.xsize) % csr.ysize) * LINE_HEIGHT),
			csr.x+csr.StrWidth[csr.Pos % csr.xsize],
			csr.y+1+( (csr.Pos / csr.xsize) * LINE_HEIGHT) );
	}

	//カーソル移動
	csr.Pos += m;

	//カーソル表示
	if( (csr.End+1) / csr.xsize == 0 )
	{
		NMenuMsgWrite(code, csr.x+csr.StrWidth[csr.Pos % csr.xsize],
			csr.y+( ( (csr.Pos / csr.xsize   ) % csr.ysize) * LINE_HEIGHT) );
	}else
	{
		NMenuMsgWrite(code, csr.x+csr.StrWidth[csr.Pos % csr.xsize],
			csr.y+( (csr.Pos / csr.xsize   ) * LINE_HEIGHT) );
	}

	return csr.Pos;
};

//----------------------------------------------------------------------------------
//	縦横カーソル制御					02/01/17 nohara
// <戻り値>
//	0=移動できる
//	1=移動できない
//----------------------------------------------------------------------------------
u8 NMenuHVCursorKeyChk()
{
	if( sys.Trg & U_KEY ){
		if( csr.Pos < csr.xsize ) return 1;
	}
	if( sys.Trg & D_KEY ){
		if( csr.Pos >= (csr.End+1 - csr.xsize) ) return 1;
	}
	if( sys.Trg & L_KEY ){
		if( ( (csr.Pos-(csr.Pos % csr.xsize)) % csr.xsize) == 1 || csr.Pos == 0 
				|| (csr.Pos % csr.xsize == 0) ) return 1;
	}
	if( sys.Trg & R_KEY ){
		if( (csr.Pos % csr.xsize) == (csr.xsize - 1) ) return 1;
	}

	return 0;
}

//----------------------------------------------------------------------------------
//	縦横方向カーソル選択の初期化		02/01/17 nohara
// <引数>
//	x,y		カーソル基本位置
//	Max		カーソル選択肢数
//	Pos		カーソル初期選択位置
//	arrange	項目の並べ方
// <戻り値>
//	カーソル初期選択位置（修正後）
//----------------------------------------------------------------------------------
u8 NMenuHVCursorInit(u8 x, u8 y, u8 Max, u8 Pos, u8 arrange)
{
	//カーソル構造体にセット
	NMenuVCursorInit(x,y,Max,Pos);
	csr.xsize = arrange;
	csr.ysize = (Max / arrange);
	return Pos;
}

//----------------------------------------------------------------------------------
//縦横ウィンドウ表示(ウィンドウのみ)	02/01/17	nohara
// <引数>
//	x,y		左上の座標
//	Max		カーソル選択肢数
//	menu	文字列
//	arrange	項目の並べ方
//----------------------------------------------------------------------------------
void NMenuHVWinSet(u8 x, u8 y, u8 Max, const MENU_ITEM * menu, u8 arrange)
{
	u8 i,j,y2;
	u16 kazu=0;


	//初期化
	for( i=0; i < 7; i++ )
		csr.StrWidth[i] = 0;


	//最大文字数取得
	for( i=0; i < arrange ; i++ )
	{
		for( j=0; (i+j) < Max ; j+=arrange )
		{
			kazu=PM_strlen( menu[i+j].msg );
			if( csr.StrWidth[i+1] < kazu ) 
				csr.StrWidth[i+1]=kazu;
		}
	}


	//計算をしないように幅を足していく
	for( i=1; i < arrange+1 ; i++ )
		csr.StrWidth[i] += csr.StrWidth[i-1]+2;

	csr.StrWidth[arrange] -= 2;	//調整

	if(  ( (Max >> 1) >= arrange && (Max & 0x01) == 0 ) 
			|| arrange == 1 || arrange == Max )
	{
		y2=y+( (Max / arrange)*2+1 );
	}else
	{
		y2=y+( (Max / arrange + 1)*2+1 );	//余りが出たら１段足す
	}

	//ウィンドウ表示
	NMenuWinBoxWrite( x, y, x+csr.StrWidth[arrange]+1+1, y2 );

	return;
}

//----------------------------------------------------------------------------------
//縦横ウィンドウ表示(文字列のみ)			02/01/17	nohara
// <引数>
//	x,y		左上の座標
//	Max		カーソル選択肢数
//	menu	文字列
//	arrange	項目の並べ方
//----------------------------------------------------------------------------------
void NMenuHVStrSet(u8 x, u8 y, u8 Max, const MENU_ITEM * menu, u8 arrange)
{
	u8 i,j,k;
	u16 kazu=0;


	//初期化
	for( i=0; i < 7; i++ )
		csr.StrWidth[i] = 0;


	//最大文字数取得
	for( i=0; i < arrange ; i++ )
	{
		for( j=0; (i+j) < Max ; j+=arrange )
		{
			kazu=PM_strlen( menu[i+j].msg );
			if( csr.StrWidth[i+1] < kazu ) 
				csr.StrWidth[i+1]=kazu;
		}
	}


	//計算をしないように幅を足していく
	for( i=1; i < arrange+1 ; i++ )
		csr.StrWidth[i] += csr.StrWidth[i-1]+2;

	csr.StrWidth[arrange] -= 2;	//調整

	//文字列表示
	for( i=0; i < arrange ; i++ )
	{
		for( k=0, j=0; (i+j) < Max ; j+=arrange, k++ )
		{
			NMenuMsgWrite( menu[i+j].msg,
				x+csr.StrWidth[i % arrange],y+(k*2));
		}
	}

	return;
}

//----------------------------------------------------------------------------------
//縦横ウィンドウセット(ウィンドウ表示、カーソル初期化、文字列表示)	02/01/17 nohara
// <引数>
//	x,y		左上の座標
//	Max		カーソル選択肢数
//	Pos		カーソル初期選択位置
//	menu	文字列
//	arrange	項目の並べ方
//----------------------------------------------------------------------------------
void HVSelectInit(u8 x, u8 y, u8 Max, u8 Pos, const MENU_ITEM * menu, u8 arrange)
{
	NMenuHVWinSet(x,y,Max,menu,arrange);
	NMenuHVCursorInit(x+1,y+1,Max,Pos,arrange);
	NMenuHVStrSet(x+2,y+1,Max,menu,arrange);
}

//----------------------------------------------------------------------------------
//	縦横選択ウィンドウの制御			02/01/17 nohara
// <戻り値>
//	CURSOR_CANCEL_VALUE		キャンセルされた
//	CURSOR_DEFAULT_VALUE	まだ選択されていない
//	0 ～					決定された選択位置
//----------------------------------------------------------------------------------
s8 HVSelectMain(void)
{
	if( sys.Trg & A_BUTTON ){
		SePlay(SE_SELECT);
		return NMenuVCursorPosGet();
	};
	if( sys.Trg & B_BUTTON ){
		return CURSOR_CANCEL_VALUE;
	};
	if( sys.Trg & U_KEY ){
		SePlay(SE_SELECT);
		NMenuHVCursorSet2(-csr.xsize);
		return CURSOR_DEFAULT_VALUE;
	};
	if( sys.Trg & D_KEY ){
		SePlay(SE_SELECT);
		NMenuHVCursorSet2(csr.xsize);
		return CURSOR_DEFAULT_VALUE;
	};
	if( sys.Trg & L_KEY ){
		SePlay(SE_SELECT);
		NMenuHVCursorSet2(-1);
		return CURSOR_DEFAULT_VALUE;
	};
	if( sys.Trg & R_KEY ){
		SePlay(SE_SELECT);
		NMenuHVCursorSet2(1);
		return CURSOR_DEFAULT_VALUE;
	};

	return CURSOR_DEFAULT_VALUE;
};

//----------------------------------------------------------------------------------
//	指定した要素数の文字幅を取得		02/01/17 nohara
// <戻り値>
//	文字幅
//----------------------------------------------------------------------------------
u8 NMenuStrWidthGet(u8 no)
{
	return csr.StrWidth[no];
}

//==================================================================================
//
//	メニュー生成関連
//
//==================================================================================

//----------------------------------------------------------------------------------
//	固定リストの表示
// <引数>
//	x,y		表示基本位置指定
//	Max		表示項目数
//	menu	項目データへのポインタ
//----------------------------------------------------------------------------------
void NMenuFixListWrite(u8 x, u8 y, u8 Max, const MENU_ITEM * menu)
{
	u8	i;
	for( i=0;i<Max;i++){
		NMenuMsgWrite( menu[i].msg, x, y+(i*LINE_HEIGHT) );
	}
};

//----------------------------------------------------------------------------------
//	リストから項目を取得して表示する
// <引数>
//	x,y		表示基本位置指定
//	Max		表示項目数
//	menu	項目データへのポインタ
//	List	構成する項目ナンバーリスト
//----------------------------------------------------------------------------------
void NMenuFreeListWrite(u8 x, u8 y, u8 Max, const MENU_ITEM * menu, const u8 * List)
{
	u8	i;
	for( i=0;i<Max;i++){
		NMenuMsgWrite( ( menu[List[i]] ).msg, x, y+(i*LINE_HEIGHT) );
	}
};


//==================================================================================
//
//		はい/いいえ 選択ウィンドウ関係
//
//==================================================================================

// はい・いいえウィンドウ用データ

static const u8 yes_msg[] = {ha_,i_,EOM_};
static const u8 no_msg[] = {i_,i_,e_,EOM_};

const MENU_ITEM	yesno_msg[]=
{
	{ yes_msg,	NULL },	//00:はい
	{ no_msg,	NULL }	//01:いいえ
};

#define YESNO_SELECT_MAX	NELEMS(yesno_msg)


//----------------------------------------------------------------------------------
//	はい・いいえ選択文字セット
// <引数>
//	x,y		表示位置指定
//----------------------------------------------------------------------------------
void YesNoSelectStrInit(u8 x, u8 y)
{
	NMenuFixListWrite(x+YESNOMSG_OFFX,y+YESNOMSG_OFFY,YESNO_SELECT_MAX,yesno_msg);
	NMenuVCursorInit(x+YESNOCSR_OFFX,y+YESNOCSR_OFFY,YESNO_SELECT_MAX,0);
}

//----------------------------------------------------------------------------------
//	はい・いいえ選択ウィンドウセット
// <引数>
//	x,y		表示位置指定
//----------------------------------------------------------------------------------
void YesNoSelectInit(u8	x, u8 y)
{
	NMenuWinBoxWrite( x, y, x+YESNOWIN_OFFX, y+YESNOWIN_OFFY );
	YesNoSelectStrInit(x,y);
}

//----------------------------------------------------------------------------------
//	はい・いいえ選択ウィンドウの制御
// <戻り値>
//	CURSOR_CANCEL_VALUE		キャンセルされた
//	CURSOR_DEFAULT_VALUE	まだ選択されていない
//	CURSOR_YES_VALUE		はいを選択
//	CURSOR_NO_VALUE			いいえを選択
//----------------------------------------------------------------------------------
s8 YesNoSelectMain(void)
{
	return NMenuVCursorControlNoloop();
}










