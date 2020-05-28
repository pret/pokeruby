//=========================================================================
//
//	pm_print.c
//
//	ポケモンＡＧＢ用メッセージ表示システム
//
//=========================================================================


#include "common.h"
#include "palanm.h"
#include "screen.h"
#include "fight.h"
#include "mus_tool.h"
#include "contest.h"

#define PRINT_H_GLOBAL
#include "print.h"

#include "fcontext.h"

#include "fnt_tenji.h"

//-------------------------------------------------------------------------
//							定義
//-------------------------------------------------------------------------

/* 8x16用シンボル→8x8用シンボル変換用の構造体 */
typedef struct {
	u8 chr1st;
	u8 chr2nd;
}Conv8x8;


//	文字表示メイン遷移状態定義
enum{
		MSG_END,			/* 表示終了(初期状態) */
		MSG_START,			/* 表示開始 */
		MSG_WRITE,			/* MSG表示 */
		MSG_WAIT,			/* ウェイト */
		MSG_TIMEWAIT,		/* 一定時間ウェイト */
		MSG_KEYWAIT,		/* キー入力待ち */
		MSG_CR,				/* 改行 */
		MSG_INDIRECT,		/* 間接文字列参照 */

		MSG_NWAIT,			/* キー待ち→MSGウィンドウクリアで表示再開 */
		MSG_SWAIT,			/* キー待ち→一行スクロールで表示再開 */
		MSG_SEWAIT,			/* SEの鳴り終わりを待つ */
};

//StringPrint からの戻り値定義
enum{
	STRPRT_END = 0,		//終了
	STRPRT_PUT,			//表示
	STRPRT_CTRL,		//制御
};

//送りMSGの制御モード（msg_skip_mode)
enum{
	MSGSKIP_NORMAL = 0,		//通常動作
	MSGSKIP_BATTLE,			//通信時はキーをとらない
	MSGSKIP_FORCE,			//キー送り禁止
	MSGSKIP_CONTEST,		//コンテスト中、通信時はキーを取らない
};

#define LFONT_CHR_USE	2						//通常フォントが占めるキャラ数
#define FDSIZE			(0x08)					//ﾌｫﾝﾄﾃﾞｰﾀｻｲｽﾞ(展開前)
#define FSIZE			(CHRSIZE*LFONT_CHR_USE)	//ﾌｫﾝﾄﾃﾞｰﾀｻｲｽﾞ(展開後)

/* ウィンドウＭＳＧ関連定義 */
#define	WIN_SPC_SZ		0						//ウィンドウで使用する空白キャラ
#define WIN_CSR_CHR_POS	1						//ウィンドウで使用する送りキャラ
#define	WIN_SYS_FONT_SIZE	2				//ウィンドウで使用するシステムキャラサイズ
#define	WIN_LINE1_CHRSTART		( WIN_SYS_FONT_SIZE * LFONT_CHR_USE )
#define	WIN_LINE2_CHRSTART(n)	( WIN_LINE1_CHRSTART + n * LFONT_CHR_USE )

#define Y_CGX_FLAG		(0x0002)	//改行時(CGXｱﾄﾞﾚｽ指定)ﾌﾗｸﾞ

#define	FIXSCRNFONTUSE	2

#define AB_BUTTON	(A_BUTTON | B_BUTTON )
#define COMM_BATTLE_WAIT	(60*1)


#define FIX_SKIPCURSOR	0xfe		/* 固定フォントモード時の送りカーソル位置 */
									/* この制限のためフォントは最大でも0xfd種類まで */




//-------------------------------------------------------------------------
//
//						データ
//
//-------------------------------------------------------------------------

//-----------------------------------------------------------------
//-----------------------------------------------------------------
/* 初期化代入用　TALK_WIN構造体定義 */
static const TALK_WIN TalkWinInitializer =  {
	NULL,				//CONST_FONT_CONTEXT_P  context;
	MSG_END,			//u16		status;		// ｽﾃｰﾀｽ
	0,					//u16		work;		//
	0,					//u8		sw;			// ｽｲｯﾁﾌﾗｸﾞ
	0,					//u8		wait;		// ｳｪｲﾄ

	0,					//u8		mode;		// 文字表示モード
	0,					//u8		font;		// 使用フォント
	0,					//u8		col_f;  	// 色番号(文字)
	0,					//u8		col_b;		// 色番号(背景)
	0,					//u8		col_s;		// 色番号(影)
	0,					//u8		palette;	// パレット

	NULL,				//const u8 *text;		// ﾃｷｽﾄ ﾃﾞｰﾀｱﾄﾞﾚｽ
	0,					//u16		text_p;		// ﾃｷｽﾄ ｵﾌｾｯﾄ

	0,					//u16		cgx_n;		// CGX 位置
	0,					//u16		cgx_np;		// CGX Offset

	0,					//u8		scr_x;		// ｽｸﾘｰﾝX 位置
	0,					//u8		scr_xp;		// ｽｸﾘｰﾝX Offset
	0,					//u8		scr_y;		// ｽｸﾘｰﾝY 位置
	0,					//u8		scr_yp;		// ｽｸﾘｰﾝY Offset

	NULL,				//void *	cgx_adrs;
};

/* 8x16用シンボル→8x8用シンボル変換テーブル */
#include "conv8x8.dat"

#include "..\data\tenji_tbl.dat"

//-----------------------------------------------------------------
//			表示用データ
//-----------------------------------------------------------------
/* 空白キャラ用データ定義 */
static const u8 PM_Print_Blank[8] = {
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
};

/* 文字表示用パレットデータ */

static const u16 PM_Print_Palette[16] = {
0x0000,		//透明色
0x2529,		//黒
0x001F,		//赤
0x03E0,		//緑
0x7C00,		//青
0x03FF,		//黄色
0x7FE0,		//水色
0x7C1F,		//紫
0x675a,0x0000,0x0000,0x779c,0x7fff,0x7f33,0x72ef,0x7fff,
};

/* フォントCGXデータ */
#include "../scaddata/font8x16.dat"		//8x16フォントデータ（fntequ.h の定義と一対一対応）
#include "../scaddata/font8x8.dat"		//8x8フォントデータ（def8x8.h の定義と一対一対応）
#include "../scaddata/font8x8s.ach"		//8x8影付フォントデータ
#include "../scaddata/font8x16s.ach"	//8x16影付フォントデータ
#include "../scaddata/tenji.dat"		//点字キャラクタ

/* MSG送りカーソルCGXデータ */
#include "../scaddata/skip_cur.ach"
#define CHAR_SKIPCURSOR	(u32)skip_cur_Character
#define	BLINK_PAT	(sizeof(skip_cur_Character)/(CHRSIZE*2) )
//#define BLINK_PAT	4			//　送りカーソルアニメのパターン数
#define BLINK_WAIT	6			//　送りカーソルアニメのウェイト



//-------------------------------------------------------------------------
//
//						ローカル変数
//
//-------------------------------------------------------------------------

//-- 文字表示スクリーン制御用変数 --
static const FONT_CONTEXT *	NowContext;

/* ＣＧＸセット用制御構造体 */
static TALK_WIN win_work ={};

/* メッセージ送り制御用フラグ */
static u8 msg_skip_mode;

/* 会話MSGの表示幅指定 */
static u8 talk_msg_width;

//-------------------------------------------------------------------------
//
//						ローカル関数プロトタイプ
//					
//-------------------------------------------------------------------------
static void print_bg_init(const FONT_CONTEXT * context);
static void print_pal_init(const FONT_CONTEXT * context);
static void print_reg_init(const FONT_CONTEXT * context);

static u16 Print8x16FontInit(const FONT_CONTEXT * context, u16 cgx_num);
static u16 Print8x8FontInit(const FONT_CONTEXT * context, u16 cgx_num);
static u16 Print8x8sFontInit(const FONT_CONTEXT * context, u16 cgx_num);
static u16 PrintTenjiFontInit(const FONT_CONTEXT * context, u16 cgx_num);
static void PrintSplitFontSet(const FONT_CONTEXT * context, u16 cgx_num, u8 code );

static u16 PrintFixScrnInit( TALK_WIN * tw ,u16 cgx_num);

static void MsgParamSetMain( TALK_WIN* tw, const u8* msg_adrs, u16 cgx_num, u8 xpos, u8 ypos);

static u8 StringPrint(TALK_WIN * tw);

static void (* const font_print_func[])(TALK_WIN *,int);

static void transcgx_font_print(TALK_WIN * tw, int code);
static void trans_font_print(TALK_WIN * tw, int code);
static void fix_font_print(TALK_WIN * tw, int code);
static void fixscrn_font_print(TALK_WIN * tw, int code );

static void FontCGXSet(int code, u32 cgx_adrs, u8 font, u8 col_f, u8 col_b, u8 col_s);
static void FontSCRSet(TALK_WIN * tw, u16 chip1, u16 chip2);
static u32 GetFontSCRAddr(TALK_WIN * tw);
static void GetFontAdrs( u8 font, u16 code, u32 * adr1, u32 * adr2 );

static void TalkMsgCR(TALK_WIN * tw);
static void	FontSpread(u32 FromAddress, u32 ToAddress, u8 FColorF, u8 FColorB);
static void	FontSpread2(u32 src, u32 dst, u8 ColorF, u8 ColorS, u8 ColorB);

static u32 FixScrn_CGXAdrs(TALK_WIN * tw);
static void FixScrn_FontSCRSet(TALK_WIN * tw);
static u32 FixScrnCGXoffset(TALK_WIN * tw, u8 x, u8 y );

/* MSGデータ取得用マクロ */
#define GETCODE(tw)	( (tw)->text[(tw)->text_p++] )
#define PASSCODE(tw) ( (tw)->text_p++ )

/* フォントキャラのデータアドレス取得用マクロ */

#define FONT8x16DATAADRS(code)	( (u32)(Font8x16Data) + (u32)(code) * FDSIZE * 2 )

#define FONT8x8DATAADRS(code)	( (u32)(Font8x8Data) + (u32)(code) * 8 )

// 下記のような構造で配列しているデータをとりだすため桁で扱いをかえた式になっている
// あ(上）0x0000	い(上）0x0010	う(上)0x0020 ....
// あ(下）0x0200	い(下) 0x0210	う(下)0x0220 ....
#define	FONT8x16sDATAADRS(code)	( (u32)(font8x16s_Character) \
		+ (u32)( (code & 0xfff0) * CHRSIZE * LFONT_CHR_USE + (code & 0xf)*CHRSIZE ) )

#define	FONT8x8sDATAADRS(code)	( (u32)(font8x8s_Character) + (u32)(code) * CHRSIZE )

#define	FONTtenjiDATAADRS(code)	( (u32)(tenji_Character) + (u32)(code) * 8 )


/* フォントキャラのセットアドレス取得用マクロ */
#define LASTCGXNUMBER(tw)		( (tw)->cgx_n + (tw)->cgx_np )
#define LASTCGXADRS(tw)			( (tw)->context->CGXadrs + LASTCGXNUMBER(tw) * CHRSIZE ) 

/* 固定スクリーンのキャラコード計算マクロ */
#define FIXSCRNCODE(tw,x,y)	((tw)->cgx_n + FIXSCRNFONTUSE \
		+ (tw)->scr_x + (tw)->scr_xp + (x) \
		+ ( (tw)->scr_y + (tw)->scr_yp + (y) ) * VX_SIZE )


/* 使用パレット取得用マクロ */
#define PAL_VAL(tw)		( (tw)->palette << BG_SC_PLTT_SHIFT )

static u16 FontBlankCode(TALK_WIN * tw);

static u8 TalkMsgForceSkipCheck( TALK_WIN * tw );
static void TalkMsgWaitInit(TALK_WIN * tw);
static void TalkMsgWaitEnd(TALK_WIN * tw);
static void TalkMsgWaitMain(TALK_WIN * tw);
static u8 TalkMsgWait( TALK_WIN * tw );

static u8 TalkMsgSpeedGet( TALK_WIN * tw );


//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//
//	リソース初期化関連
//
//
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


//=================================================================
//
//	初期化ルーチン
//
//	※パレットアニメに依存しているためPaletteAnimeInitよりあとで
//	　呼ぶ必要がある
//	※内部でスクリーン制御レジスタを設定している
//=================================================================

//-----------------------------------------------------------------
//-----------------------------------------------------------------
void PrintScreenInit(CONTEXT_TYPE type)
{
	NowContext = GetFontContext(type);

	print_reg_init(NowContext);
	print_bg_init(NowContext);
	print_pal_init(NowContext);
}

//-----------------------------------------------------------------
//	VRAMの初期化（空白キャラセット＆スクリーンクリア）
//-----------------------------------------------------------------
void PrintBgInit( CONTEXT_TYPE type )
{
	print_bg_init( GetFontContext(type) );
}

//-----------------------------------------------------------------
//	デフォルトパレットのセット
//-----------------------------------------------------------------
void PrintPaletteInit( CONTEXT_TYPE type )
{
	print_pal_init( GetFontContext(type) );
}

//-----------------------------------------------------------------
//	スクリーンレジスタの初期化
//-----------------------------------------------------------------
void PrintRegisterInit( CONTEXT_TYPE type )
{
	print_reg_init( GetFontContext(type) );
}


//-----------------------------------------------------------------
// スクリーン初期化共通ルーチン
//-----------------------------------------------------------------
static void print_bg_init(const FONT_CONTEXT * context)
{
	CpuFastClear( 0, context->CGXadrs, CHRSIZE );	//空白キャラセット
	CpuFastClear( 0, context->SCRadrs, 32*32*2 );	//スクリーンクリア
}

static void print_pal_init(const FONT_CONTEXT * context)
{
	PaletteWorkSet(PM_Print_Palette,(context->BasePalette)*16,32);
}

static void print_reg_init(const FONT_CONTEXT * context)
{
	*(RegBGHofs[context->BGNum]) = 0;
	*(RegBGVofs[context->BGNum]) = 0;
	*(RegBGctrl[context->BGNum]) =
			BG_COLOR_16											// 16色選択
			| BG_SCREEN_SIZE_0									// ｽｸﾘｰﾝｻｲｽﾞ(256×256)
			| ( context->BGpriority << BG_PRIORITY_SHIFT )		// BG優先順位指定
			| ( context->SCRBlockNum << BG_SCREEN_BASE_SHIFT)	// ｽｸﾘｰﾝﾍﾞｰｽﾌﾞﾛｯｸ 
			| ( context->CGXBlockNum << BG_CHAR_BASE_SHIFT)		// ｷｬﾗｸﾀｰﾍﾞｰｽﾌﾞﾛｯｸ
			;
}

//=================================================================
//	常駐フォント制御関連
//=================================================================

//-----------------------------------------------------------------
//-----------------------------------------------------------------
u16 PrintFontInit(TALK_WIN * tw, u16 cgx_num)
{
	tw->cgx_n = cgx_num;

	switch ( tw->context->UseMode ) {
	case TRANSCGXMODE:
	case TRANSFONTMODE:
		return 0;
	case FIXSCRNMODE:
		return PrintFixScrnInit(tw ,cgx_num);
	case FIXFONTMODE:
		break;
	}

	/* FIXFONTMODE の場合 */
	switch ( tw->context->BaseFontType ) {

	case FONT8x16TYPE:
	case FONT8x16sTYPE:
		return Print8x16FontInit( tw->context, cgx_num );

	case FONT8x8TYPE:
	case FONT8x8RAWTYPE:
		return Print8x8FontInit( tw->context, cgx_num );

	case FONT8x8sTYPE:
	case FONT8x8sRAWTYPE:
		return Print8x8sFontInit( tw->context, cgx_num );

	case FONTTENJITYPE:
		return PrintTenjiFontInit( tw->context, cgx_num );
	}
	return 0;
}


//-----------------------------------------------------------------
//
//	フォントデータの分割転送セット
//
//-----------------------------------------------------------------

static const FONT_CONTEXT * fc;
static u16 cgx_num_sv;
static u16 count_sv;

int PRT_SetSplitFontInit( TALK_WIN * tw, u16 cgx_num )
{
	count_sv = 0;
	fc = tw->context;
	cgx_num_sv = cgx_num;

	tw->cgx_n = cgx_num;

	switch ( tw->context->UseMode ) {
	case TRANSCGXMODE:
	case TRANSFONTMODE:
		return 0;
	case FIXSCRNMODE:
		return PrintFixScrnInit(tw ,cgx_num);
	case FIXFONTMODE:
		break;
	}


	switch ( tw->context->BaseFontType ) {
	case FONT8x16TYPE:
	case FONT8x16sTYPE:
		return 256 * LFONT_CHR_USE;
	case FONT8x8TYPE:
	case FONT8x8RAWTYPE:
	case FONT8x8sTYPE:
	case FONT8x8sRAWTYPE:
		return 256;
	}
	return 0;
}

int PRT_SetSplitFontMain(void)
{
	int i;
	switch ( fc->UseMode ) {
	/* 下記のフォントタイプは初期化のみで転送不要 */
	case TRANSCGXMODE:
	case TRANSFONTMODE:
	case FIXSCRNMODE:
		return TRUE;
	}

	for ( i=count_sv; i<count_sv+16; i++ ) {
		PrintSplitFontSet(fc,cgx_num_sv,i);
	}
	count_sv += 16;
	if ( count_sv == 256 ) {
		return TRUE;		/* 転送終了 */
	} else {
		return FALSE;		/* 転送中 */
	}
}


static void PrintSplitFontSet(const FONT_CONTEXT * context, u16 cgx_num, u8 code )
{
	u32 cgx;

	switch ( context->BaseFontType ) {

	case FONT8x16TYPE:
	case FONT8x16sTYPE:
		cgx = context->CGXadrs + (cgx_num * CHRSIZE) + (code * FSIZE);
		FontCGXSet(code, cgx, context->BaseFontType,
				context->BaseFontColor,
				context->BaseBGColor,
				context->BaseShadowColor);
		break;

	case FONT8x8TYPE:
	case FONT8x8RAWTYPE:
		cgx = context->CGXadrs + (code+cgx_num) * CHRSIZE ;
		FontSpread( FONT8x8DATAADRS(code),cgx,
				context->BaseFontColor,
				context->BaseBGColor);
		break;

	case FONT8x8sTYPE:
	case FONT8x8sRAWTYPE:
		cgx = context->CGXadrs + (code+cgx_num) * CHRSIZE ;
		FontSpread2( FONT8x8sDATAADRS(code), cgx,
				context->BaseFontColor,
				context->BaseShadowColor,
				context->BaseBGColor);
		break;
	}
}

//-----------------------------------------------------------------
//-----------------------------------------------------------------
static u16 Print8x16FontInit(const FONT_CONTEXT * context, u16 cgx_num)
{
	int i;
	u32 cgx;

	for ( i=0; i<256; i++ ) {
		cgx = context->CGXadrs + (cgx_num * CHRSIZE) + (i * FSIZE);
		FontCGXSet(i, cgx, context->BaseFontType,
				context->BaseFontColor, context->BaseBGColor, context->BaseShadowColor);
	}
	return i * LFONT_CHR_USE;
}


//-----------------------------------------------------------------
//-----------------------------------------------------------------
static u16 Print8x8FontInit(const FONT_CONTEXT * context, u16 cgx_num)
{
	int i;
	u32 cgx;
	for ( i=0; i<256; i++ ) {
		cgx = context->CGXadrs + (i+cgx_num) * CHRSIZE ;
		FontSpread( FONT8x8DATAADRS(i),cgx,
				context->BaseFontColor, context->BaseBGColor);
	}
	return i;
}

//-----------------------------------------------------------------
//-----------------------------------------------------------------
static u16 Print8x8sFontInit(const FONT_CONTEXT * context, u16 cgx_num)
{
	int i;
	u32 cgx;
	for ( i=0; i<256; i++ ) {
		cgx = context->CGXadrs + (i+cgx_num) * CHRSIZE ;
		FontSpread2( FONT8x8sDATAADRS(i), cgx,
				context->BaseFontColor,
				context->BaseShadowColor,
				context->BaseBGColor);
	}
	return i;
}

//-----------------------------------------------------------------
//-----------------------------------------------------------------
static u16 PrintTenjiFontInit(const FONT_CONTEXT * context, u16 cgx_num)
{
	int i;
	u32 cgx;
	for ( i=0; i<256; i++ ) {
		cgx = context->CGXadrs + (i+cgx_num) * CHRSIZE ;
		FontSpread( FONTtenjiDATAADRS(i),cgx,
				context->BaseFontColor, context->BaseBGColor);
	}
	return i;
}

//-----------------------------------------------------------------
//	固定スクリーンモードのキャラエリア初期化
//-----------------------------------------------------------------
static u16 PrintFixScrnInit( TALK_WIN * tw ,u16 cgx_num)
{
	tw->cgx_n = cgx_num;
	CpuFastClear( 0, tw->context->CGXadrs+tw->cgx_n * CHRSIZE, CHRSIZE );	//空白キャラセット
	FontSpread( (u32)(&PM_Print_Blank), tw->context->CGXadrs + (tw->cgx_n+1)*CHRSIZE,
			tw->context->BaseFontColor, tw->context->BaseBGColor );
	return tw->cgx_n + FIXSCRNFONTUSE + VX_SIZE * VY_SIZE;
}


//=================================================================
//
//	Vsyncでの転送ルーチン
//	※現状ダミーで使用していない
//
//=================================================================
void PrintScreenVsync(void)
{
		// dummy routine
}



//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//
//
//
//
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//=================================================================
//	MSG 出力設定
//=================================================================

//-----------------------------------------------------------------
// MsgControlInit
// TALK_WIN構造体の初期化処理
// <引数>
//		tw		MSG制御構造体
//		n		MSGモードのタイプ
//-----------------------------------------------------------------
void MsgControlInit(TALK_WIN * tw, CONTEXT_TYPE n)
{
	* tw = TalkWinInitializer;
	tw->context = GetFontContext(n);

	tw->mode	= tw->context->UseMode;
	tw->font	= tw->context->BaseFontType;
	tw->col_f	= tw->context->BaseFontColor;  	// 色番号(文字)
	tw->col_b	= tw->context->BaseBGColor;		// 色番号(背景)
	tw->col_s	= tw->context->BaseShadowColor; // 色番号(影)
	tw->palette = tw->context->BasePalette;		// パレット
}


//-----------------------------------------------------------------
// TALK_WIN構造体へのパラメータ設定
//-----------------------------------------------------------------
static void MsgParamSetMain( TALK_WIN* tw, const u8* msg_adrs, u16 cgx_num, u8 xpos, u8 ypos)
{
	tw->status	= MSG_START;			// ｽﾃｰﾀｽ
	tw->work	= 0;
	tw->sw		= 0;					// ｽｲｯﾁﾌﾗｸﾞ
	tw->mode	= tw->context->UseMode;
	tw->font	= tw->context->BaseFontType;
	tw->col_f	= tw->context->BaseFontColor;  	// 色番号(文字)
	tw->col_b	= tw->context->BaseBGColor;		// 色番号(背景)
	tw->col_s	= tw->context->BaseShadowColor; // 色番号(影)
	tw->palette = tw->context->BasePalette;		// パレット

	tw->text	= (u8 *)msg_adrs;		// ﾃｷｽﾄ ﾃﾞｰﾀｱﾄﾞﾚｽ
	tw->text_p	= 0;					// ﾃｷｽﾄ ｵﾌｾｯﾄ

	tw->cgx_n	= cgx_num;		// CGX 位置
	tw->cgx_np	= 0;			// CGX Offset

	tw->scr_x	= xpos;			// 文字ｽｸﾘｰﾝX 位置
	tw->scr_xp	= 0;			// 文字ｽｸﾘｰﾝX Offset
	tw->scr_y	= ypos;			// 文字ｽｸﾘｰﾝY 位置
	tw->scr_yp	= 0;			// 文字ｽｸﾘｰﾝY Offset

	tw->wait	= 0;			// ｳｪｲﾄ
}


//=================================================================
// MsgCGXDataSet
// 指定CGXデータのセットのみをおこなう
//
//	adrs		データを配置する位置へのポインタ
//	msg			メッセージデータへのポインタ
//=================================================================
void MsgCGXDataSet(void * adrs, const u8 * msg)
{
	win_work.context = GetFontContext( CGX_ONLY_TYPE );
	MsgParamSetMain( &win_work, msg, 0, 0, 0 );
	win_work.mode = TRANSCGXMODE;
	win_work.cgx_adrs = adrs;
	MsgPut( &win_work );
}


//=================================================================
//	MsgPutSet
//	文字列表示セットルーチン
//
//	tw			使用するメッセージ構造体
//	msg_adrs	メッセージデータへのポインタ
//	cgx_num		使用キャラ開始位置オフセット
//	xpos		表示Ｘ位置
//	ypos		表示Ｙ位置(8×16サイズフォントの下が基準）
//=================================================================
void MsgPutSet(TALK_WIN* tw, const u8* msg_adrs, u16 cgx_num, u8 xpos, u8 ypos)
{
	MsgParamSetMain(tw, msg_adrs, cgx_num, xpos, ypos);
}


//=================================================================
//	ウィンドウメッセージセットルーチン
//
// <引数>
//	tw			使用するメッセージ構造体
//	msg_adrs	メッセージデータへのポインタ
//	cgx_num		使用キャラ開始位置オフセット
//	xpos,ypos	表示位置
//=================================================================

void TalkMsgSet(TALK_WIN* tw, const u8* msg_adrs, u16 cgx_num, u8 xpos, u8 ypos)
{
	/* 初回のトリガーがくるまで押しっぱなしで送りができないようにする */
	sys.TrgFlagMask = A_BUTTON | B_BUTTON;
	sys.TrgFlag = 0;

	msg_skip_mode = MSGSKIP_NORMAL;
	talk_msg_width = WIN_LINE_SZ;

	MsgParamSetMain(tw, msg_adrs, cgx_num, xpos, ypos);

	if ( tw->mode == TRANSFONTMODE ) {
		FontSpread( (u32)(&PM_Print_Blank), LASTCGXADRS(tw), tw->col_b, tw->col_b );
		FontSpread( FONT8x8DATAADRS(d_cursor_8x8),
				LASTCGXADRS(tw) + CHRSIZE, tw->col_f, tw->col_b );
		tw->cgx_np = WIN_LINE1_CHRSTART;
	}
}



//=================================================================
//	MsgPut
//	MSG出力ルーチン（指定文字列を全て表示してから返ってくる）
//
//	<入力パラメータ>
//	tw			使用するメッセージ構造体
//=================================================================
extern const u8 * GetIndirectString( int i );

//現在の文字列をセーブして新規文字列表示
static u8 recursive_msg_put( TALK_WIN * tw , const u8 * next_text )
{
	const u8 * sv_text;
	u16 sv_text_p;
	u8 result;

	sv_text = tw->text;
	sv_text_p = tw->text_p;
	tw->text = next_text;
	tw->text_p = 0;
	tw->status = MSG_WRITE;

	result = MsgPut( tw );

	tw->text = sv_text;
	tw->text_p = sv_text_p;
	tw->status = MSG_WRITE;

	return result;
}

u8 MsgPut(TALK_WIN * tw)
{
	while ( tw->status != MSG_END ) {
		if ( tw->status == MSG_CR ) {
			tw->scr_xp = 0;
			tw->scr_yp += 2;	//Yﾗｲﾝ変更処理
			tw->status = MSG_WRITE;

		} else if( tw->status == MSG_INDIRECT ) {
			recursive_msg_put( tw, GetIndirectString(GETCODE(tw)) );
		}

		StringPrint(tw);
	}
	return 1;
}

//=================================================================
//	ContinueMsgSet(2002/4/30 TETSU)
//
//	<入力パラメータ>
//	tw			使用するメッセージ構造体
//=================================================================
void ContinueMsgSet(TALK_WIN* tw, const u8* msg_adrs)
{
	tw->status	= MSG_WRITE;
	tw->text	= msg_adrs;		// ﾃｷｽﾄ ﾃﾞｰﾀｱﾄﾞﾚｽ
	tw->text_p	= 0;			// ﾃｷｽﾄ ｵﾌｾｯﾄ
	tw->work	= 0;
	tw->sw		= 0;			// ｽｲｯﾁﾌﾗｸﾞ
	tw->wait	= 0;			// ｳｪｲﾄ
}

//=================================================================
//	文字列表示ルーチン（一文字表示するごとに返ってくる）
//	<引数>
//	tw		使用するメッセージ構造体
//	<戻り値>
//	0		表示中
//	1		終了
//=================================================================
u8 TalkMsgPutc( TALK_WIN * tw )
{
	while ( tw->status != MSG_END ) {
		if (tw->status == MSG_CR) {
			tw->scr_xp = 0;
			tw->scr_yp += 2;	//Yﾗｲﾝ変更処理
			tw->status = MSG_WRITE;
		}
		if ( StringPrint(tw) == STRPRT_PUT ) return 0;
	}
	return 1;
}

//=================================================================
//
//	ウィンドウメッセージメイン
//
//=================================================================

//-----------------------------------------------------------------
//	ウィンドウメッセージ制御メイン
//-----------------------------------------------------------------
static u8 talk_msg_main(TALK_WIN * tw)
{
	switch ( tw->status ) {

	case MSG_END:			/*	MSG終了	*/
		return 1;

	case MSG_KEYWAIT:		/*	ボタン待ち	*/
		if ( TalkMsgForceSkipCheck(tw) == TRUE ) {
			tw->wait --;
			if( tw->wait == 0 ) tw->status = MSG_WRITE;
		} else if ( sys.Trg & AB_BUTTON ) {
			SePlay( SE_SELECT );
			tw->status = MSG_WRITE ;
		}
		return 0;

	case MSG_WAIT:			/* ウェイト	*/
		if ( TalkMsgForceSkipCheck(tw) != TRUE ) {
			if ( (sys.Cont & AB_BUTTON) && sys.TrgFlag == 1 ) {
				//ボタン押しで早送り
				tw->wait = 0;
				tw->status = MSG_WRITE;
				break;
			}
		}
		if (tw->wait != 0) { tw->wait --;}
		if (tw->wait != 0) return 0;
		tw->status = MSG_WRITE;
		break;

	case MSG_NWAIT:			/* ボタン待ち→クリア */
		if ( TalkMsgWait(tw) ) {
			TalkMsgClr( tw );
			tw->status = MSG_WRITE;
		}
		return 0;

	case MSG_SWAIT:			/* ボタン待ち→改行スクロール */
		if ( TalkMsgWait(tw) ) {
			TalkMsgCR( tw );
			tw->status = MSG_WRITE;
		}
		return 0;

	case MSG_TIMEWAIT:
		if ( tw->wait != 0 ) tw->wait --;
		if ( tw->wait != 0 ) return 0;
		tw->status = MSG_WRITE;
		break;

	case MSG_INDIRECT:
		PASSCODE(tw);
		tw->status = MSG_WRITE;
		break;

	case MSG_CR:			/* 改行	*/
		TalkMsgCR(tw);
		tw->status = MSG_WRITE;
		return 0;

	case MSG_START:			/*	MSG出力開始	*/
		TalkMsgClr(tw);
	case MSG_WRITE:			/*	MSG出力中	*/
		break;

	case MSG_SEWAIT:		/* SEの鳴り終わりを待つ */
		if ( SeEndCheck() ) return 0;
		tw->status = MSG_WRITE;
		break;

	default:				/*	未定義状態は強制終了	*/
		tw->status = MSG_END;
		return 1;
	}

	StringPrint(tw);

	switch ( tw->status ) {
	case MSG_CR:
	case MSG_SEWAIT:
	case MSG_TIMEWAIT:
		return 0;

	case MSG_KEYWAIT:
	case MSG_NWAIT:
	case MSG_SWAIT:
		if ( TalkMsgForceSkipCheck(tw) == TRUE ) tw->wait = COMM_BATTLE_WAIT;
		return 0;
	case MSG_END:
		return 1;
	}

	tw->status = MSG_WAIT;
	tw->wait = TalkMsgSpeedGet( tw );
	return 0;
}

//-----------------------------------------------------------------
//	ウィンドウメッセージ制御ルーチン
//
//	※1文字表示or1ウェイト毎に返ってくる。
//
// <引数>
//	tw			使用するメッセージ構造体
//
// <戻り値>
//	0			表示中
//	1			指定文字列の表示終了
//-----------------------------------------------------------------
u8 TalkMsgPut( TALK_WIN * tw )
{
	msg_skip_mode = MSGSKIP_NORMAL;
	return talk_msg_main( tw );
}

//-----------------------------------------------------------------
//	バトル用ウィンドウメッセージ制御ルーチン
//	※通信対戦時に文字送りができなくなる以外はTalkMsgPutと同じ機能
//-----------------------------------------------------------------
u8 BattleTalkMsgPut( TALK_WIN * tw)
{
	u8 res;

	msg_skip_mode = MSGSKIP_BATTLE;
	talk_msg_width = 26;
	res = talk_msg_main( tw );
	talk_msg_width = WIN_LINE_SZ;
	msg_skip_mode = MSGSKIP_NORMAL;
	return res;
}

//-----------------------------------------------------------------
//	通信用ウィンドウメッセージ制御ルーチン
//	※常に文字送りが禁止される
//-----------------------------------------------------------------
u8 NoSkipTalkMsgPut( TALK_WIN * tw)
{
	u8 res;

	msg_skip_mode = MSGSKIP_FORCE;
	res = talk_msg_main( tw );
	msg_skip_mode = MSGSKIP_NORMAL;
	return res;
}

//-----------------------------------------------------------------
//	コンテスト用ウィンドウメッセージ制御ルーチン
//-----------------------------------------------------------------
u8 ContestTalkMsgPut( TALK_WIN * tw )
{
	u8 res;

	msg_skip_mode = MSGSKIP_CONTEST;
	talk_msg_width = 16;	//15;	2002.08.19(月) by matsuda
	res = talk_msg_main( tw );
	talk_msg_width = WIN_LINE_SZ;
	return res;
}

//=================================================================
//	MsgPrint
//	文字列セット→表示ルーチン
//	※内部的にはMsgPutSet→MsgPutの呼び出しまで行っている
//
//	<入力パラメータ>
//	tw			使用するメッセージ構造体
//	msg_adrs	メッセージデータへのポインタ
//	cgx_num		使用キャラ開始位置オフセット
//	xpos		表示Ｘ位置
//	ypos		表示Ｙ位置(8×16サイズフォントの下が基準）
//=================================================================
u8 MsgPrint( TALK_WIN* tw, const u8* msg_adrs, u16 cgx_num, u8 xpos, u8 ypos)
{
	MsgPutSet(tw, msg_adrs, cgx_num, xpos, ypos);
	return MsgPut(tw);
}

//=================================================================
//	一文字表示用ルーチン
//	<入力パラメータ>
//	tw			使用するメッセージ構造体
//	code		表示する文字コード
//	cgx_num		使用キャラ開始位置オフセット
//	xpos		表示Ｘ位置
//	ypos		表示Ｙ位置(8×16サイズフォントの下が基準）
//=================================================================
u8 MsgPutc( TALK_WIN* tw, u8 code, u16 cgx_num, u8 xpos, u8 ypos )
{
	u8 dmy_msg[2];
	dmy_msg[0] = code;
	dmy_msg[1] = EOM_;

	MsgParamSetMain( tw, dmy_msg, cgx_num, xpos, ypos );
	return StringPrint(tw);
}


//=================================================================
//
//	文字列処理メインルーチン
//
//	※文字処理ごとに上位のルーチンに戻る
//	　上位ルーチンはStringPrintでのtw->statusの変更に
//	　より制御を変える
//
//=================================================================

//-----------------------------------------------------------------
//	制御コード処理
//-----------------------------------------------------------------
static u8 CtrlPrint( TALK_WIN * tw )
{
	u16	musno=0;

	switch ( GETCODE(tw) ) {

	case C_FCOL_:
		tw->col_f = GETCODE(tw);
		return STRPRT_CTRL;

	case C_BCOL_:
		tw->col_b = GETCODE(tw);
		return STRPRT_CTRL;

	case C_SCOL_:
		tw->col_s = GETCODE(tw);
		return STRPRT_CTRL;

	case C_ACOL_:
		tw->col_f = GETCODE(tw);
		tw->col_b = GETCODE(tw);
		tw->col_s = GETCODE(tw);
		return STRPRT_CTRL;

	case C_PAL_:
		tw->palette = GETCODE(tw);
		return STRPRT_CTRL;

	case C_FCHG_:
		tw->font = GETCODE(tw);
		return STRPRT_CTRL;

	case C_FNML_:
		tw->font = tw->context->BaseFontType;
		return STRPRT_CTRL;

	case C_WAIT_:
		tw->status = MSG_TIMEWAIT;
		tw->wait = GETCODE(tw);
		return STRPRT_CTRL;

	case C_TRGWAIT_:
		tw->status = MSG_KEYWAIT;
		return STRPRT_CTRL;

//add by soga 2002.06.12
	case C_SEWAIT_:
		tw->status = MSG_SEWAIT;
		return STRPRT_CTRL;
	case C_MUSPLAY_:
		musno = GETCODE(tw);
		musno |= (GETCODE(tw)<<8);
		MusicPlay(musno);
		return STRPRT_CTRL;
//add by soga 2002.09.29
	case C_SEPLAY_:
		musno = GETCODE(tw);
		musno |= (GETCODE(tw)<<8);
		SePlay(musno);
		return STRPRT_CTRL;

	case C_EXFONT_:
		font_print_func[tw->mode](tw,GETCODE(tw));
		return STRPRT_PUT;

	case C_XCHG_:
		tw->scr_xp += GETCODE(tw);
		return STRPRT_PUT;

	case C_YCHG_:
		tw->scr_yp += GETCODE(tw);
		return STRPRT_PUT;

	case C_CLR_:
		TalkMsgClr(tw);
		return STRPRT_CTRL;

	default:
		return STRPRT_CTRL;
	}
}

//-----------------------------------------------------------------
//-----------------------------------------------------------------
static u8 StringPrint(TALK_WIN * tw)
{
	int code;

	code = GETCODE(tw);

	switch ( code ) {
		case EOM_ :
			tw->status= MSG_END;
			return STRPRT_END;

		case I_MSG_ :
			tw->status = MSG_INDIRECT;
			return STRPRT_CTRL;

		case CR_ :
			tw->status = MSG_CR;
			return STRPRT_CTRL;

		case NORMAL_WAIT_:
			TalkMsgWaitInit(tw);
			tw->status = MSG_NWAIT;
			return STRPRT_CTRL;

		case SCROLL_WAIT_:
			TalkMsgWaitInit(tw);
			tw->status = MSG_SWAIT;
			return STRPRT_CTRL;

		case CTRL_:
			return CtrlPrint(tw);

		default:
			font_print_func[tw->mode](tw,code);
			return STRPRT_PUT;
	}

}


//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//
//	文字描画関連
//
//
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


//=================================================================
//
//	文字表示メインルーチン
//
//=================================================================

static void (* const font_print_func[])(TALK_WIN *,int)  =
{
	trans_font_print,			//TRANSFONTMODE
	fix_font_print,				//FIXFONTMODE
	transcgx_font_print,		//TRANSCGXMODE
	fixscrn_font_print,			//FIXSCRNMODE
};


//-----------------------------------------------------------------
//	キャラデータ転送のみの処理
//-----------------------------------------------------------------
static void transcgx_font_print(TALK_WIN * tw, int code)
{
	FontCGXSet(code,(u32)tw->cgx_adrs,tw->font,tw->col_f,tw->col_b,tw->col_s);
	tw->cgx_adrs += CHRSIZE*LFONT_CHR_USE;
}

//-----------------------------------------------------------------
//	固定スクリーン、キャラ転送で描画
//-----------------------------------------------------------------
static void FixScrnFontCGXSet(int code, u32 cgx_adrs,
		u8 font, u8 col_f, u8 col_b, u8 col_s )
{
	u32 data1,data2;

	GetFontAdrs( font, code, &data1, &data2 );

	switch( font )
	{
	case FONT8x16TYPE:
	case FONT8x8TYPE:
	case FONT8x8RAWTYPE:
	case FONTTENJITYPE:
		FontSpread( data1, cgx_adrs,						col_f, col_b );
		FontSpread( data2, cgx_adrs + CHRSIZE * VX_SIZE,	col_f, col_b );
		break;

	case FONT8x16sTYPE:
	case FONT8x8sTYPE:
	case FONT8x8sRAWTYPE:
		FontSpread2( data1, cgx_adrs,						col_f, col_s, col_b );
		FontSpread2( data2, cgx_adrs + CHRSIZE * VX_SIZE,	col_f, col_s, col_b );
		break;
	}
}

static void FixScrnPrintMain(TALK_WIN * tw, int code)
{
	vu32 cgx_adrs;

	cgx_adrs = FixScrn_CGXAdrs(tw);
	FixScrnFontCGXSet( code ,cgx_adrs, tw->font, tw->col_f, tw->col_b, tw->col_s );
	FixScrn_FontSCRSet(tw);
}


static void fixscrn_font_print(TALK_WIN * tw, int code )
{
	FixScrnPrintMain(tw,code);
	tw->scr_xp++;
}

static void FixScrn_FontSCRSet(TALK_WIN * tw)
{
	u16 data1,data2;

	data1 = FIXSCRNCODE( tw, 0, 0 );
	data2 = FIXSCRNCODE( tw, 0, 1 );
	FontSCRSet( tw, data1, data2 );
}

static u32 FixScrn_CGXAdrs(TALK_WIN * tw)
{
	u16 x,y;

	x = tw->scr_x + tw->scr_xp;
	y = tw->scr_y + tw->scr_yp;

	return FixScrnCGXoffset( tw, x, y );
}

static u32 FixScrnCGXoffset(TALK_WIN * tw, u8 x, u8 y )
{
	return tw->context->CGXadrs + CHRSIZE * (tw->cgx_n + FIXSCRNFONTUSE + x + y * VX_SIZE );
}

//-----------------------------------------------------------------
//	転送フォントで描画
//-----------------------------------------------------------------
static void TransFontPrintMain(TALK_WIN * tw, int code)
{
	u32 cgx_adrs;
	u16 chip;

	cgx_adrs = LASTCGXADRS(tw);
	FontCGXSet(code,cgx_adrs,tw->font,tw->col_f,tw->col_b,tw->col_s);

    chip = LASTCGXNUMBER(tw);
	FontSCRSet(tw, chip, chip+1);
}

static void trans_font_print(TALK_WIN * tw, int code)
{
	TransFontPrintMain(tw,code);
	tw->cgx_np += LFONT_CHR_USE;
	tw->scr_xp++;
}

//-----------------------------------------------------------------
//	常駐フォントで描画
//-----------------------------------------------------------------
static void fix_8x16font_print( TALK_WIN * tw, int code )
{
	u16 chip1,chip2;

	chip1 = tw->cgx_n + code * LFONT_CHR_USE;
	chip2 = chip1 + 1;
	FontSCRSet(tw, chip1, chip2);
}

static void fix_8x8font_print( TALK_WIN * tw, int code )
{
	u16 chip1,chip2;

	chip1 = tw->cgx_n + ConvTo8x8Table[code].chr1st;
	chip2 = tw->cgx_n + ConvTo8x8Table[code].chr2nd;
	FontSCRSet(tw, chip1, chip2);
}

static void fix_8x8rawfont_print( TALK_WIN * tw, int code )
{
	u16 chip1,chip2;

	chip1 = tw->cgx_n + spc_8x8;
	chip2 = tw->cgx_n + code;
	FontSCRSet(tw, chip1, chip2);
}

static void fix_tenjifont_print( TALK_WIN * tw, int code )
{
	u16 chip1,chip2;

	chip1 = tw->cgx_n + BrailleConvTable[code].chr1st;
	chip2 = tw->cgx_n + BrailleConvTable[code].chr2nd;
	FontSCRSet(tw, chip1, chip2);
}

static void (* const fix_font_print_func[])( TALK_WIN * tw, int code ) =
{
	fix_8x16font_print,			//FONT8x16TYPE
	fix_8x8font_print,			//FONT8x8TYPE
	fix_8x8rawfont_print,		//FONT8x8RAWTYPE

	fix_8x16font_print,			//FONT8x16sTYPE
	fix_8x8font_print,			//FONT8x8sTYPE
	fix_8x8rawfont_print,		//FONT8x8sRAWTYPE
	fix_tenjifont_print,		//FONTTENJITYPE
};


static void fix_font_print(TALK_WIN * tw, int code)
{
	fix_font_print_func[tw->font](tw,code);
	tw->scr_xp++;
}

//=================================================================
//
//	文字フォント生成ルーチン
//
//=================================================================
static void FontCGXSet(int code, u32 cgx_adrs, u8 font, u8 col_f, u8 col_b, u8 col_s)
{
	u32 data1,data2;

	GetFontAdrs( font, code, &data1, &data2 );

	switch ( font ) {

	case FONT8x16TYPE:
	case FONT8x8TYPE:
	case FONT8x8RAWTYPE:
	case FONTTENJITYPE:
		FontSpread( data1, cgx_adrs,			col_f, col_b );
		FontSpread( data2, cgx_adrs + CHRSIZE,	col_f, col_b );
		break;

	case FONT8x16sTYPE:
	case FONT8x8sTYPE:
	case FONT8x8sRAWTYPE:
		FontSpread2( data1, cgx_adrs,			col_f, col_s, col_b );
		FontSpread2( data2, cgx_adrs + CHRSIZE,	col_f, col_s, col_b );
		break;
	}

}

//-----------------------------------------------------------------
//-----------------------------------------------------------------
static void FontSCRSet(TALK_WIN *tw, u16 chip1, u16 chip2)
{
	u32 set_adrs;

	set_adrs = GetFontSCRAddr(tw);

   	*(u16 *)(set_adrs)			= PAL_VAL(tw) | chip1;
   	*(u16 *)(set_adrs+2*SCRX_SZ)= PAL_VAL(tw) | chip2;
}

//-----------------------------------------------------------------
//-----------------------------------------------------------------
static u32 GetFontSCRAddr(TALK_WIN * tw)
{
	u8 scx,scy;

	scx = tw->scr_x + tw->scr_xp;
	scy	= tw->scr_y + tw->scr_yp;
	return (u32)( tw->context->SCRadrs+2*(SCRX_SZ*scy + scx) ) ;
}

//-----------------------------------------------------------------
//	使用パレットの値を取得する
//-----------------------------------------------------------------
u16	FontPalValue(TALK_WIN * tw)
{
	return PAL_VAL(tw);
}

//-----------------------------------------------------------------
//	フォントアドレス取得
//-----------------------------------------------------------------
static void GetFontAdrs( u8 font, u16 code, u32 * adr1, u32 * adr2 )
{
	switch( font )
	{
	case FONT8x16TYPE:
		*adr1 = FONT8x16DATAADRS( code );
		*adr2 = *adr1 + FDSIZE;
		break;

	case FONT8x8TYPE:
		*adr1 = FONT8x8DATAADRS( ConvTo8x8Table[code].chr1st );
		*adr2 = FONT8x8DATAADRS( ConvTo8x8Table[code].chr2nd );
		break;

	case FONT8x8RAWTYPE:
		*adr1 = FONT8x8DATAADRS( spc_8x8 );
		*adr2 = FONT8x8DATAADRS( code );
		break;

	case FONT8x16sTYPE:
		*adr1 = FONT8x16sDATAADRS( code );
		*adr2 = *adr1 + CHRSIZE * 16;
		break;

	case FONT8x8sTYPE:
		*adr1 = FONT8x8sDATAADRS( ConvTo8x8Table[code].chr1st );
		*adr2 = FONT8x8sDATAADRS( ConvTo8x8Table[code].chr2nd );
		break;

	case FONT8x8sRAWTYPE:
		*adr1 = FONT8x8sDATAADRS( spc_8x8 );
		*adr2 = FONT8x8sDATAADRS( code );
		break;

	case FONTTENJITYPE:
		*adr1 = FONTtenjiDATAADRS( BrailleConvTable[code].chr1st );
		*adr2 = FONTtenjiDATAADRS( BrailleConvTable[code].chr2nd );
		break;

	default:
		return;
	}
}


/************************************************************************/
/*			FontSpread													*/
/*                                                                      */
/*  内容    ：１文字（8*8dot)のｷｬﾗを展開&転送							*/
/*  IN        	u32 FromAddress	:転送元ｱﾄﾞﾚｽ							*/
/*				u32 ToAddress	:転送先ｱﾄﾞﾚｽ							*/
/*            	u8  FColorF		:文字色(0～15)							*/
/*            	u8  FColorB		:背景色(0～15)							*/
/************************************************************************/
static void FontSpread(u32 FromAddress, u32 ToAddress, u8 FColorF, u8 FColorB)
{
    u8  i,j;                    // for文用
    u8  Read;                   // 読み込み用
    u32 Write;                  // 書きこみ用

    for (i=0;i<8;i++) {                                 // 縦8行
        Write = 0x00000000;                             // 書きこみﾃﾞｰﾀｸﾘｱ
        Read  = *(u8 *)(FromAddress + i);               // 8bit読み込み     
        for (j=0;j<8;j++) {                             // 横8列
            if (Read & 0x80)
			{
					Write |= (FColorF<<(4*j)); // 1bit→4bitに展開(16色)文字
			}else{
					Write |= (FColorB<<(4*j)); // 1bit→4bitに展開(16色)背景
			};
            Read <<= 1;
        }
        *(u32 *)(ToAddress + i*4) = Write;              // 32bit書きこみ
    }
}


static u8 conv[CHRSIZE];

static void FontSpread2(u32 src, u32 dst, u8 ColorF, u8 ColorS, u8 ColorB )
{
	int i;
	u8 Read;
	u8 write;

	for ( i=0; i<CHRSIZE; i++ ) {

		Read = ((u8 *)src)[i] & 0xf0;
		if ( Read == 0x0 ) {
			write = ColorB << 4;
		}
		else if ( Read == 0xf0 ) {
			write = ColorF << 4;
		}
		else if ( Read == 0xe0 ) {
			write = ColorS << 4;
		}
		else {
			write = Read & 0xf0;
		}

		Read = ((u8 *)src)[i] & 0x0f;
		if ( Read == 0x0 ) {
			write |= ColorB;
		}
		else if ( Read == 0xf ) {
			write |= ColorF;
		}
		else if (Read == 0xe ) {
			write |= ColorS;
		}
		else {
			write |= Read;
		}
		conv[i] = write;
	}

	CpuCopy(conv,dst,CHRSIZE,32);
}





//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//
//	会話ウィンドウ制御関連サブルーチン
//
//
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//=================================================================
//	会話ウィンドウ:MSG送り速度取得
//=================================================================
static const u8 msg_speed[] = {
	SLOW_MSG_SPEED,
	NORMAL_MSG_SPEED,
	FAST_MSG_SPEED
};

static u8 TalkMsgSpeedGet( TALK_WIN * tw )
{
	if( TalkMsgForceSkipCheck( tw ) ) return NORMAL_MSG_SPEED;
	return msg_speed[ MyData.msg_speed ];
}


//=================================================================
//
//	会話ウィンドウ:改行処理
//	
//	1行目の場合は2行目の先頭に表示位置が変わる
//	2行目の場合は2行目の内容を1行目に移動し、2行目をクリアする
//
//=================================================================

//-----------------------------------------------------------------
//	改行キーの無効チェック
//-----------------------------------------------------------------
static u8 TalkMsgForceSkipCheck( TALK_WIN * tw )
{
	if( msg_skip_mode == MSGSKIP_FORCE )return TRUE;
	if( msg_skip_mode == MSGSKIP_NORMAL )return FALSE;

	if( msg_skip_mode == MSGSKIP_CONTEST ) {
		if( ContestTuusin ) return TRUE;
		return FALSE;
	}

	if( msg_skip_mode == MSGSKIP_BATTLE ) {
		if( FightType & FIGHT_TYPE_TUUSHIN ) return TRUE;
		return FALSE;
	}

	return FALSE;
}

static void TalkMsgCR_TransFont(TALK_WIN * tw);
static void TalkMsgCR_FixFont(TALK_WIN * tw);
static void TalkMsgCR_FixScrn(TALK_WIN * tw);
static void LineMove2( TALK_WIN * tw, u8 width );
static void LineMove( TALK_WIN * tw, u16 width );
//-----------------------------------------------------------------
//
//-----------------------------------------------------------------
static void TalkMsgCR(TALK_WIN * tw)
{
	switch ( tw->mode ) {

	case TRANSFONTMODE:
		TalkMsgCR_TransFont(tw);
		break;
	case FIXFONTMODE:
		TalkMsgCR_FixFont(tw);
		break;
	case TRANSCGXMODE:
		/* ありえない */
		break;
	case FIXSCRNMODE:
		TalkMsgCR_FixScrn(tw);
		break;
	}
}

//-----------------------------------------------------------------
//	改行の制御
//	※　１行目の場合は２行目から書き始めるようにする
//	　　２行目の場合は使用しているキャラ領域をフリップし、
//		２行目を１行目に移動する
//-----------------------------------------------------------------
//-----------------------------------------------------------------
//-----------------------------------------------------------------
static void TalkMsgCR_TransFont(TALK_WIN * tw)
{
	//1行目か?
	if (tw->scr_yp == 0) {
		tw->cgx_np = WIN_LINE2_CHRSTART(talk_msg_width);
		tw->scr_xp = 0;
		tw->scr_yp += 2;
	} else {
		if ( tw->sw & Y_CGX_FLAG ) {
			tw->cgx_np = WIN_LINE2_CHRSTART(talk_msg_width);
		} else {
			tw->cgx_np = WIN_LINE1_CHRSTART;
		}

		tw->sw ^= Y_CGX_FLAG;

		tw->scr_xp = 0;
		LineMove( tw, talk_msg_width );
	}
}

//-----------------------------------------------------------------
//-----------------------------------------------------------------
static void TalkMsgCR_FixFont(TALK_WIN * tw)
{		
	//1行目か?
	if ( tw->scr_yp == 0 ) {
		tw->scr_xp = 0;
		tw->scr_yp += 2;
	} else {
		tw->sw ^= Y_CGX_FLAG;
		tw->scr_xp = 0;
		LineMove( tw, talk_msg_width );
	}
}

//-----------------------------------------------------------------
//-----------------------------------------------------------------
static void TalkMsgCR_FixScrn(TALK_WIN * tw)
{
	//1行目か?
	if ( tw->scr_yp == 0 ) {
		tw->scr_xp = 0;
		tw->scr_yp += 2;
	} else {
		tw->sw ^= Y_CGX_FLAG;
		tw->scr_xp = 0;
		LineMove2( tw, talk_msg_width );
	}
}


//-----------------------------------------------------------------
//	固定フォントモード、転送フォントモード用
//-----------------------------------------------------------------
static void LineMove( TALK_WIN * tw, u16 width )
{
	int i;
	u16 * scrn;
	u16 set_code;

	set_code = FontPalValue(tw) | FontBlankCode(tw);
	scrn = (u16 *) ( GetFontSCRAddr(tw) );
	scrn -= SCRX_SZ*2;			// line1上段をポイントする

	CpuCopy( &scrn[SCRX_SZ*2], &scrn[SCRX_SZ*0], width*2, 16);	//line2上段→line1上段へ転送
	CpuCopy( &scrn[SCRX_SZ*3], &scrn[SCRX_SZ*1], width*2, 16);	//line2上段→line1上段へ転送

	for ( i=0; i<width; i++ ) {
		scrn[ i + SCRX_SZ*2 ] = set_code;
		scrn[ i + SCRX_SZ*3 ] = set_code;
   	}
}

//-----------------------------------------------------------------
// 固定スクリーンモード用
//-----------------------------------------------------------------
static void LineMove2( TALK_WIN * tw, u8 width )
{
	u32 up_adr,dw_adr,base_adr;

	dw_adr = FixScrn_CGXAdrs(tw);						//line2上段
	up_adr = dw_adr - 2 * VX_SIZE * CHRSIZE;			//line1上段
	CpuCopy( dw_adr, up_adr, (width * CHRSIZE), 32);

	dw_adr = FixScrn_CGXAdrs(tw) + VX_SIZE * CHRSIZE;	//line2下段
	up_adr = dw_adr - 2 * VX_SIZE * CHRSIZE;			//line1下段
	CpuCopy( dw_adr, up_adr, (width * CHRSIZE), 32);

	FixScrnPrintMain( tw, spc_ );						//ひとつだけ空白を表示、あとはコピーする
	base_adr = FixScrn_CGXAdrs(tw);
	CpuCopy( base_adr, base_adr+CHRSIZE, CHRSIZE*(width-1), 32 );
	CpuCopy( base_adr, base_adr+CHRSIZE*VX_SIZE, CHRSIZE*width, 32 );
}

//=================================================================
//
//	会話ウィンドウ:会話ウィンドウのクリア
//
//=================================================================
//-----------------------------------------------------------------
//-----------------------------------------------------------------
static void TalkMsgClrMain( TALK_WIN * tw, u8 width );
static void TalkMsgClr_FixScrn( TALK_WIN * tw, u8 width );
static void FixScrnCodeSetRect( TALK_WIN * tw, u8 x1, u8 y1, u8 x2, u8 y2 );
//-----------------------------------------------------------------
//-----------------------------------------------------------------
void TalkMsgClr(TALK_WIN * tw)
{
	switch ( tw->mode ) {

	case TRANSFONTMODE: 
		TalkMsgClrMain(tw, talk_msg_width);
		tw->cgx_np = WIN_LINE1_CHRSTART;
		break;

	case FIXFONTMODE:
		TalkMsgClrMain(tw, talk_msg_width);
		break;

	case FIXSCRNMODE:
		TalkMsgClr_FixScrn(tw, talk_msg_width);
		break;

	case TRANSCGXMODE:
		/* ありえない */
		break;
	}
}

//-----------------------------------------------------------------
//	ウィンドウメッセージのクリア
//	※空白文字でウィンドウメッセージ表示領域をクリアする
//-----------------------------------------------------------------
static void TalkMsgClrMain( TALK_WIN * tw, u8 width )
{
	u16 * scr;
	u16 code;
	u8 x,y;

	tw->scr_xp = 0;
	tw->scr_yp = 0;
	tw->sw = 0;

	scr = (u16 *) ( GetFontSCRAddr(tw) );
	code = FontPalValue(tw) | FontBlankCode(tw);

	for ( y=0; y<4; y++ ) {
		for ( x=0; x<width ;x++ ) {
			scr[SCRX_SZ * y + x] = code;
		}
	}
}

//-----------------------------------------------------------------
//	固定スクリーンモード用
//	※空白キャラをセットする
//-----------------------------------------------------------------
static void TalkMsgClr_FixScrn( TALK_WIN * tw, u8 width )
{
	u32 cgx;

	tw->scr_xp = 0;
	tw->scr_yp = 0;
	tw->sw = 0;

	FixScrnPrintMain( tw, spc_ );
	cgx = FixScrn_CGXAdrs(tw);
	CpuCopy( cgx, cgx+CHRSIZE, CHRSIZE*(width-1), 32 );
	CpuCopy( cgx, cgx+CHRSIZE*VX_SIZE*1, CHRSIZE*width, 32 );
	CpuCopy( cgx, cgx+CHRSIZE*VX_SIZE*2, CHRSIZE*width, 32 );
	CpuCopy( cgx, cgx+CHRSIZE*VX_SIZE*3, CHRSIZE*width, 32 );

	FixScrnCodeSetRect( tw, tw->scr_x, tw->scr_y, tw->scr_x + width, tw->scr_y + 4 );
}

static void FixScrnCodeSetRect( TALK_WIN * tw, u8 x1, u8 y1, u8 x2, u8 y2 )
{
	u8 x,y;
	u16 pal;
	u16 base_code;
	u16 * base_scrn;

	pal = FontPalValue(tw);
	base_scrn = (u16 *)( tw->context->SCRadrs + 2 * ( y1 * SCRX_SZ + x1 ) );
	base_code = tw->cgx_n + FIXSCRNFONTUSE + x1 + y1 * VX_SIZE;

	for ( y=0 ; y < y2-y1 ; y++ ) {
		for ( x=0 ; x<x2-x1 ; x++ ) {
			base_scrn[ y * SCRX_SZ + x ] = ( base_code + x + VX_SIZE * y ) | pal;
		}
	}
}



//=================================================================
//
//　会話ウィンドウ:ＭＳＧ送りプロンプト処理
//
//=================================================================

//-----------------------------------------------------------------
//	送りマークアニメ
//-----------------------------------------------------------------
static void TalkMsgBlinkOn(TALK_WIN * tw)
{
	u8 pat;
	u32 cgx_adrs, dat_adrs;
	u16 chip;

	if (TalkMsgForceSkipCheck(tw) == TRUE)
		return;

	pat = ( tw->work >> 8 ) & 0x0f;
	dat_adrs = CHAR_SKIPCURSOR + pat * CHRSIZE * 2;

	switch ( tw->mode ) {

	case TRANSFONTMODE:
		cgx_adrs = LASTCGXADRS(tw);
		FontSpread2( dat_adrs, cgx_adrs, 
				tw->col_f, tw->col_s, tw->col_b );
		FontSpread2( dat_adrs + CHRSIZE, cgx_adrs + CHRSIZE, 
				tw->col_f, tw->col_s, tw->col_b );

		chip = LASTCGXNUMBER(tw);
		FontSCRSet(tw, chip, chip+1);
		break;

	case FIXFONTMODE:
		switch ( tw->font ) {

		case FONT8x16TYPE:
		case FONT8x16sTYPE:
			chip = tw->cgx_n + FIX_SKIPCURSOR * LFONT_CHR_USE;
			break;

		case FONT8x8RAWTYPE:
		case FONT8x8sRAWTYPE:
		case FONT8x8TYPE:
		case FONT8x8sTYPE:
		case FONTTENJITYPE:
		default:
			chip = tw->cgx_n + FIX_SKIPCURSOR;
			break;
		}
		cgx_adrs = tw->context->CGXadrs + chip * CHRSIZE;
		FontSpread2( dat_adrs, cgx_adrs, 
				tw->col_f, tw->col_s, tw->col_b );
		FontSpread2( dat_adrs + CHRSIZE, cgx_adrs + CHRSIZE, 
				tw->col_f, tw->col_s, tw->col_b );
		FontSCRSet(tw, chip, chip+1);
		break;

	case TRANSCGXMODE:
		/* ありえない */
		break;
	
	case FIXSCRNMODE:
		cgx_adrs = FixScrn_CGXAdrs(tw);
		FontSpread2( dat_adrs, cgx_adrs, 
				tw->col_f, tw->col_s, tw->col_b );
		FontSpread2( dat_adrs + CHRSIZE, cgx_adrs + CHRSIZE * VX_SIZE, 
				tw->col_f, tw->col_s, tw->col_b );
		FixScrn_FontSCRSet(tw);
		break;
	}
}

//-----------------------------------------------------------------
//	送りマーク消去
//-----------------------------------------------------------------
static void TalkMsgBlinkOff(TALK_WIN * tw)
{
	if (TalkMsgForceSkipCheck(tw) == TRUE)
		return;

	switch ( tw->mode ) {

	case TRANSFONTMODE:
		TransFontPrintMain(tw,spc_);
		break;
	case FIXFONTMODE:
		fix_font_print_func[tw->font](tw,spc_);
		break;
	case TRANSCGXMODE:
		/* ありえない */
		break;
	case FIXSCRNMODE:
		FixScrnPrintMain(tw,spc_);
		break;
	}
}


//-----------------------------------------------------------------
//	送りマーク初期化
//-----------------------------------------------------------------
static void TalkMsgWaitInit(TALK_WIN * tw)
{
	tw->work = 0;
	TalkMsgBlinkOn(tw);
}

//-----------------------------------------------------------------
//	送りマーク終了
//-----------------------------------------------------------------
static void TalkMsgWaitEnd(TALK_WIN * tw)
{
	tw->work = 0;
	TalkMsgBlinkOff(tw);
}

//-----------------------------------------------------------------
//	送りマーク制御
//-----------------------------------------------------------------
static void TalkMsgWaitMain(TALK_WIN * tw)
{
	u8 wait,pat;

	wait = tw->work & 0x0f;
	pat = (tw->work >> 8 ) & 0x0f;

	wait ++;
	if ( wait == BLINK_WAIT ) {
		wait = 0;
		pat ++;
		if( pat >= BLINK_PAT ) pat = 0;
		tw->work = wait | (pat << 8 );
		TalkMsgBlinkOn(tw);
	}
	tw->work = wait | (pat << 8 );
}

//-----------------------------------------------------------------
//	キー待ち＆送りマーク制御
//-----------------------------------------------------------------
static u8 TalkMsgWait( TALK_WIN * tw )
{
	if ( TalkMsgForceSkipCheck(tw) ) {
		tw->wait --;
		if ( tw->wait == 0 ) {
			TalkMsgWaitEnd(tw);
			return TRUE;
		} else {
			TalkMsgWaitMain(tw);
			return FALSE;
		}

	} else {

		if ( sys.Trg & AB_BUTTON ) {
			SePlay( SE_SELECT );
			TalkMsgWaitEnd(tw);
			return TRUE;
		} else {
			TalkMsgWaitMain(tw);
			return FALSE;
		}
	}
}


//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//
//
//
//
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//=================================================================
//
//	フォント表示ＢＧ上での消去・塗りつぶし処理
//
//=================================================================
//-----------------------------------------------------------------
//	指定位置のスクリーンデータを取得する
//	<引数>
//	tw			使用するメッセージ構造体
//	x,y			座標
//	<戻り値>
//	指定位置のスクリーンデータの値
//-----------------------------------------------------------------
u16 FontScrnCodeGet( TALK_WIN * tw, u8 x, u8 y )
{
	u16 * pos = (u16 *)(tw->context->SCRadrs);
	return pos[x + y * SCRX_SZ];
}

//-----------------------------------------------------------------
//	矩形描画（枠のみ）
//<引数>
//	code			描画に使用するコード（※パレットNoも必要）
//	x1,y1,x2,y2		領域指定
//	
//-----------------------------------------------------------------
void FontScrnBoxLineDirect( TALK_WIN* tw, u16 code, u8 x1, u8 y1, u8 x2, u8 y2 )
{
	u8 x,y;
	u16 * pos = (u16 *)(tw->context->SCRadrs);

	for ( y=y1; y<=y2 ;y++ ) {
		if ( y == y1 || y == y2 ) {
			for( x=x1; x<=x2; x++) pos[x + y * SCRX_SZ] = code;
		} else {
			pos[x1 + y * SCRX_SZ] = code;
			pos[x2 + y * SCRX_SZ] = code;
		}
	}
}
//-----------------------------------------------------------------
//	矩形描画（枠のみ）
//<引数>
//	code			描画に使用するコード
//	x1,y1,x2,y2		領域指定
//-----------------------------------------------------------------
void FontScrnBoxLine( TALK_WIN* tw, u16 code, u8 x1, u8 y1, u8 x2, u8 y2 )
{
	code |= PAL_VAL(tw);
	FontScrnBoxLineDirect(tw,code,x1,y1,x2,y2);
}

//-----------------------------------------------------------------
// 指定したスクリーンエリアを指定コードで塗りつぶす
//
//	<入力パラメータ>
//	tw			使用するメッセージ構造体
//	code		塗りつぶすスクリーンコード（※パレットNoも必要）
//	x1,y1		左上座標
//	x2,y2		右下座標
//-----------------------------------------------------------------
void FontScrnBoxFillDirect( TALK_WIN * tw, u16 code, u8 x1, u8 y1, u8 x2, u8 y2 )
{
	u8 x,y;
	u16 * pos = (u16 *)(tw->context->SCRadrs);

	for( x=x1; x<=x2; x++) {
		for ( y=y1; y<=y2 ;y++ ) {
			pos[x + y * SCRX_SZ] = code;
		}
	}
}

//-----------------------------------------------------------------
// FontScrnBoxFill
// 指定したスクリーンエリアを指定コードで塗りつぶす
//
//	<入力パラメータ>
//	tw			使用するメッセージ構造体
//	code		塗りつぶすスクリーンコード
//	x1,y1		左上座標
//	x2,y2		右下座標
//-----------------------------------------------------------------
void FontScrnBoxFill( TALK_WIN * tw ,u16 code, u8 x1, u8 y1, u8 x2, u8 y2)
{
	code |= PAL_VAL(tw);
	FontScrnBoxFillDirect(tw,code,x1,y1,x2,y2);
}

//-----------------------------------------------------------------
//	指定エリアのクリア
//-----------------------------------------------------------------
void FontScrnAreaClear(TALK_WIN * tw, u8 x1, u8 y1, u8 x2, u8 y2)
{
	FontScrnBoxFill(tw, CLR_CHR_NO, x1, y1, x2, y2);
}

//-----------------------------------------------------------------
// FontScrnEasyBoxFill
// 指定エリア塗りつぶし簡易版
//
// ※モードにより動作がちがう
// 固定フォントモード:		塗りつぶしコードは空白キャラを使用する
// 転送フォントモード:		塗りつぶしコードは自動的に最初に登録したキャラを使用する
//
//	<入力パラメータ>
//	tw				使用するメッセージ構造体
//	x1,y1,x2,y2		矩形範囲指定
//-----------------------------------------------------------------
void FontScrnEasyBoxFill( TALK_WIN * tw, u8 x1, u8 y1, u8 x2, u8 y2)
{
	u16 code;

	code = FontBlankCode(tw);
	FontScrnBoxFill(tw,code, x1, y1, x2, y2);
}

//-----------------------------------------------------------------
//	空白コードを取得する
// ※モードにより動作がちがう
// 固定フォントモード:		登録済み空白キャラ
// 転送フォントモード:		自動的に最初に登録したキャラ
//-----------------------------------------------------------------
static u16 FontBlankCode(TALK_WIN * tw)
{
	switch ( tw->mode ) {
	case TRANSFONTMODE:
			return tw->cgx_n;

	case FIXFONTMODE:
			switch( tw->font )
			{
			case FONT8x16TYPE:
			case FONT8x16sTYPE:
				return tw->cgx_n + spc_;
			case FONT8x8TYPE:
			case FONT8x8RAWTYPE:
			case FONT8x8sTYPE:
			case FONT8x8sRAWTYPE:
				return tw->cgx_n + spc_8x8;
			case FONTTENJITYPE:
				return tw->cgx_n + TENJI0000_;
			};
			break;

	case TRANSCGXMODE:
			return 0;

	case FIXSCRNMODE:
			return tw->cgx_n + 1;

	default:
			return 0;
	}
	return 0;		/*念のため*/
}

//=================================================================
//=================================================================
