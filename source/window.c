//=========================================================================
//
//		window.c
//
//		2001.06.29 
//=========================================================================

#include "common.h"
#include "print.h"
#include "field.h"
#include "palanm.h"

#define WINDOW_H_GLOBAL
#include "window.h"

/* for test routine */
#include "task.h"
#include "fld_main.h"
#include "menu.h"

extern u16 * MsgContextGetSCRadrs( TALK_WIN * tw);
extern u8 * MsgContextGetCGXadrs( TALK_WIN * tw );

//-------------------------------------------------------------------------
//	データ
//-------------------------------------------------------------------------
/*	通常ウィンドウ用データ */
//#include "../scaddata/nwindow1a.ach"
//#include "../scaddata/nwindow1.acl"

//#include "../scaddata/nwin2.ach"
//#include "../scaddata/nwin2.acl"

//#define	NWIN_DATA_NAME	nwindow1b_Character
//#define	NWIN_DATA_NAME	nwindow1a_Character


#include "../scaddata/window01.ach"
#include "../scaddata/window02.ach"
#include "../scaddata/window03.ach"
#include "../scaddata/window04.ach"
#include "../scaddata/window05.ach"
#include "../scaddata/window06.ach"
#include "../scaddata/window07.ach"
#include "../scaddata/window08.ach"
#include "../scaddata/window09.ach"
#include "../scaddata/window10.ach"
#include "../scaddata/window11.ach"
#include "../scaddata/window12.ach"
#include "../scaddata/window13.ach"
#include "../scaddata/window14.ach"
#include "../scaddata/window15.ach"
#include "../scaddata/window16.ach"
#include "../scaddata/window17.ach"
#include "../scaddata/window18.ach"
#include "../scaddata/window19.ach"
#include "../scaddata/window20.ach"

#include "../scaddata/window01.acl"
#include "../scaddata/window02.acl"
#include "../scaddata/window03.acl"
#include "../scaddata/window04.acl"
#include "../scaddata/window05.acl"
#include "../scaddata/window06.acl"
#include "../scaddata/window07.acl"
#include "../scaddata/window08.acl"
#include "../scaddata/window09.acl"
#include "../scaddata/window10.acl"
#include "../scaddata/window11.acl"
#include "../scaddata/window12.acl"
#include "../scaddata/window13.acl"
#include "../scaddata/window14.acl"
#include "../scaddata/window15.acl"
#include "../scaddata/window16.acl"
#include "../scaddata/window17.acl"
#include "../scaddata/window18.acl"
#include "../scaddata/window19.acl"
#include "../scaddata/window20.acl"


/* MSGウィンドウ用データ */

//#include "../scaddata/kwindow1a.ach"
//#define	KWIN_DATA_NAME	kwindow1a_Character

#include "../scaddata/kwindow1b.ach"
#define	KWIN_DATA_NAME	kwindow1b_Character

//-------------------------------------------------------------------------
//	定数定義
//-------------------------------------------------------------------------

/* 会話ウィンドウ用定義 */

#define KWIN_CHR_SIZE	( sizeof(KWIN_DATA_NAME)/CHRSIZE )
#define KWIN_SCRN_DATA_START (SCRX_SZ * MWIN_YPOS)
#define KWIN_SCRN_DATA_SIZE (SCRX_SZ * (VY_SIZE - MWIN_YPOS) )

enum{
	KW_NOTHING = 0,
	KW_LT_OUT,
	KW_TOP_SUB,
	KW_LT_IN,
	KW_TOP_MAIN,
	KW_RT_IN,
	KW_RT_OUT,

	KW_L_OUT,
	KW_SIDE_SUB,
	KW_BLANK,
	KW_R_OUT,

	KW_CORNER_IN,
	KW_SIDE_IN,
	KW_CORNER_OUT,


};


/* 通常ウィンドウ用定義 */

//#define NWIN_CHR_SIZE	( sizeof(NWIN_DATA_NAME)/CHRSIZE )

#define NWIN_PAL_NO	0x0e
#define NWIN_PAL_VAL	(NWIN_PAL_NO << BG_SC_PLTT_SHIFT)

enum{
		WINCHR_LEFTTOP,
		WINCHR_TOP,
		WINCHR_RIGHTTOP,
		WINCHR_LEFT,
		WINCHR_BLANK,
		WINCHR_RIGHT,
		WINCHR_LEFTBTM,
		WINCHR_BTM,
		WINCHR_RIGHTBTM,

		NWIN_CHR_SIZE,			/* 通常ウィンドウのキャラ数 */
};

//-------------------------------------------------------------------------
//	変数定義
//-------------------------------------------------------------------------

static u16 NWinChrStartNo;

static u16 KWinChrStartNo;

//-------------------------------------------------------------------------
//	プロトタイプ宣言
//-------------------------------------------------------------------------

const NWIN_DATA NWinDataTable[] = {
	{ window01_Character, window01_Palette },
	{ window02_Character, window02_Palette },
	{ window03_Character, window03_Palette },
	{ window04_Character, window04_Palette },
	{ window05_Character, window05_Palette },
	{ window06_Character, window06_Palette },
	{ window07_Character, window07_Palette },
	{ window08_Character, window08_Palette },
	{ window09_Character, window09_Palette },
	{ window10_Character, window10_Palette },
	{ window11_Character, window11_Palette },
	{ window12_Character, window12_Palette },
	{ window13_Character, window13_Palette },
	{ window14_Character, window14_Palette },
	{ window15_Character, window15_Palette },
	{ window16_Character, window16_Palette },
	{ window17_Character, window17_Palette },
	{ window18_Character, window18_Palette },
	{ window19_Character, window19_Palette },
	{ window20_Character, window20_Palette },
};


//=========================================================================
//
//	汎用ウィンドウ
//
//=========================================================================

const NWIN_DATA * get_nwin_type( u8 type );
static void set_nwin_char( u8 type, u32 adrs );
static void set_nwin_pltt( u8 type, u8 number );
static void NWinFrameWriteMain(u16 * scrn, u16 code, u8 x1, u8 y1, u8 x2, u8 y2);

//-------------------------------------------------------------------------
//	ウィンドウ設定初期化
//	＜引数＞
//		cgx_num		windowキャラ開始位置
//	＜戻り値＞
//		windowキャラ開始位置＋windowキャラ数
//-------------------------------------------------------------------------
u16 NWinFrameInit(u16 cgx_num )
{
		NWinChrStartNo = cgx_num;
		return NWinChrStartNo + NWIN_CHR_SIZE;
};

//-------------------------------------------------------------------------
//	ウィンドウリソース転送処理
//	＜引数＞
//		tw		MSG制御構造体（キャラセット位置を確定するために必要）
//-------------------------------------------------------------------------
void NWinFrameDataSet(TALK_WIN * tw)
{
	u32 adrs = (u32)MsgContextGetCGXadrs(tw) + (NWinChrStartNo * CHRSIZE);
	set_nwin_char( MyData.window_type, adrs );
	set_nwin_pltt( MyData.window_type, NWIN_PAL_NO );
}

//insert by soga 2002.07.15 パレットも指定したい！
void NWinFrameDataSetFight(TALK_WIN * tw,u8 palno)
{
	u32 adrs = (u32)MsgContextGetCGXadrs(tw) + (NWinChrStartNo * CHRSIZE);
	set_nwin_char( MyData.window_type, adrs );
	set_nwin_pltt( MyData.window_type, palno );
}

//-------------------------------------------------------------------------
//	ウィンドウリソース転送処理(ウィンドウキャラ指定あり）
//	＜引数＞
//		tw		MSG制御構造体（キャラセット位置を確定するために必要）
//		type	ウィンドウの種類
//-------------------------------------------------------------------------
void NWinFrameDataCustomSet( TALK_WIN * tw, u8 type )
{
	u32 adrs = (u32)MsgContextGetCGXadrs(tw) + (NWinChrStartNo * CHRSIZE);
	set_nwin_char( type, adrs );
	set_nwin_pltt( type, NWIN_PAL_NO );
}

//-------------------------------------------------------------------------
//	ウィンドウ描画処理
//	＜引数＞
//		tw				MSG制御構造体（スクリーンアドレスを確定するために必要）
//		x1,y1,x2,y2		矩形位置指定
//-------------------------------------------------------------------------
void NWinFrameWrite(TALK_WIN * tw, u8 x1, u8 y1, u8 x2, u8 y2)
{
	NWinFrameWriteMain(MsgContextGetSCRadrs(tw)
			,NWinChrStartNo,x1,y1,x2,y2);
		
};

//------------------------------------------------------------------------
//------------------------------------------------------------------------
//ウィンドウの種類→データアドレス構造体に
const NWIN_DATA * get_nwin_type( u8 type )
{
	if ( type >= NELEMS(NWinDataTable) ) return &NWinDataTable[0];
	return &(NWinDataTable[ type ]);
}
//ウィンドウキャラセット
static void set_nwin_char( u8 type, u32 adrs )
{
	CpuFastCopy( (get_nwin_type(type))->char_addr, adrs, NWIN_CHR_SIZE*CHRSIZE );
}

//ウィンドウパレットセット
static void set_nwin_pltt( u8 type, u8 number )
{
	PaletteWorkSet( (get_nwin_type(type))->pltt_addr, number * 16, 32 );
}

//ウィンドウ描画
static void NWinFrameWriteMain(u16 * scrn, u16 code, u8 x1, u8 y1, u8 x2, u8 y2)
{
		u8 x,y;
		u8 xstart,xend,ystart,yend;

		xstart	= ( x1 < x2 ) ? x1 : x2 ;
		xend	= ( x1 < x2 ) ? x2 : x1 ;
		ystart	= ( y1 < y2 ) ? y1 : y2 ;
		yend	= ( y1 < y2 ) ? y2 : y1 ;
		
		/* 左上 */
		scrn[ystart * SCRX_SZ + xstart ] = (code+WINCHR_LEFTTOP) | NWIN_PAL_VAL;

		/* 上辺 */
		for(x = xstart + 1 ; x < xend ; x++)
				scrn[ystart * SCRX_SZ + x ] = (code+WINCHR_TOP) | NWIN_PAL_VAL;

		/* 右上 */
		scrn[ystart * SCRX_SZ + xend ] = (code+WINCHR_RIGHTTOP) | NWIN_PAL_VAL;

		for(y = ystart + 1; y < yend ; y++)
		{
			/* 左辺 */
			scrn[ y * SCRX_SZ + xstart ] = (code+WINCHR_LEFT) | NWIN_PAL_VAL;

			/* 中 */
			for(x = xstart + 1 ; x < xend ; x++)
				scrn[ y * SCRX_SZ + x ] = (code+WINCHR_BLANK) | NWIN_PAL_VAL;

			/* 右辺 */
			scrn[ y * SCRX_SZ + xend ] = (code+WINCHR_RIGHT) | NWIN_PAL_VAL;
		};

		/* 左下 */
		scrn[yend * SCRX_SZ + xstart ] = (code+WINCHR_LEFTBTM) | NWIN_PAL_VAL;

		/* 下辺 */
		for(x = xstart + 1 ; x < xend ; x++)
				scrn[yend * SCRX_SZ + x ] = (code+WINCHR_BTM) | NWIN_PAL_VAL;

		/* 右下 */
		scrn[yend * SCRX_SZ + xend ] = (code+WINCHR_RIGHTBTM) | NWIN_PAL_VAL;
};


//=========================================================================
//
//	フィールド会話ウィンドウ
//
//=========================================================================

static void set_kwin_screen( TALK_WIN * tw, u8 sx, u8 sy, u8 width, u8 height );

//-------------------------------------------------------------------------
//	会話ウィンドウメッセージ初期化処理
//	＜引数＞
//		cgx_num		キャラデータ開始位置
//-------------------------------------------------------------------------
u16 KWinFrameInit( u16 cgx_num )
{
	KWinChrStartNo = cgx_num;
	return KWinChrStartNo + KWIN_CHR_SIZE;
};

//-------------------------------------------------------------------------
//	会話ウィンドウメッセージセット
//	＜引数＞
//		tw			MSG制御構造体
//		msg_adrs	メッセージデータへのポインタ
//-------------------------------------------------------------------------
void KWinMsgSet(TALK_WIN * tw, const u8 * msg_adrs)
{
	TalkMsgSet( tw, msg_adrs, KWinChrStartNo+KWIN_CHR_SIZE,
			MWIN_MSGXPOS, MWIN_MSGYPOS );
};

//-------------------------------------------------------------------------
//	会話ウィンドウ生成処理
//	＜引数＞
//		tw			MSG制御構造体(キャラ位置、スクリーン位置の確定に必要)
//-------------------------------------------------------------------------
void KWinFrameWrite(TALK_WIN * tw)
{
	KWinFrameChrSet(tw);
	KWinFrameScrnWrite(tw);
};


//-------------------------------------------------------------------------
//	会話ウィンドウスクリーンセット
//-------------------------------------------------------------------------
static u16 GetKwinChr(u16 code, u8 x, u8 y, u8 width, u8 height)
{
	if( y == 0 )	/* 最上段 */
	{
		if( x == 0 )return KW_LT_OUT + code;
		if( x == 1 )return KW_TOP_SUB+code;
		if( x == 2 )return KW_LT_IN+code;
		if( x == 3+width+0 )return (KW_RT_IN+code);
		if( x == 3+width+1 )return (KW_TOP_SUB+code);
		if( x == 3+width+2 )return (KW_RT_OUT+code);
		return KW_TOP_MAIN+code;

	}else if ( y == 1 )
	{
		if( x == 0 ) return KW_L_OUT+code;
		if( x == 1 ) return KW_CORNER_OUT+code;
		if( x == 2 ) return KW_CORNER_IN+code;
		if( x == 3+width+0 ) return (KW_CORNER_IN+code)|BG_SC_H_FLIP;
		if( x == 3+width+1 ) return (KW_CORNER_OUT+code)|BG_SC_H_FLIP;
		if( x == 3+width+2 ) return KW_R_OUT+code;
		return KW_BLANK+code;

	}else if( y == height ) /* 最下段 - １ */
	{
		if( x == 0 ) return (KW_L_OUT+code)|BG_SC_V_FLIP;
		if( x == 1 ) return (KW_CORNER_OUT+code)|BG_SC_V_FLIP;
		if( x == 2 ) return (KW_CORNER_IN+code)|BG_SC_V_FLIP;
		if( x == 3+width+0 ) return (KW_CORNER_IN+code)|BG_SC_H_FLIP|BG_SC_V_FLIP;
		if( x == 3+width+1 ) return (KW_CORNER_OUT+code)|BG_SC_H_FLIP|BG_SC_V_FLIP;
		if( x == 3+width+2 ) return (KW_R_OUT+code)|BG_SC_V_FLIP;
		return KW_BLANK+code;

	}else if( y == height + 1 )	/* 最下段 */
	{
		if( x == 0 )return (KW_LT_OUT+code)| BG_SC_V_FLIP;
		if( x == 1 )return (KW_TOP_SUB+code)| BG_SC_V_FLIP;
		if( x == 2 )return (KW_LT_IN+code)| BG_SC_V_FLIP;
		if( x == 3+width+0 )return (KW_RT_IN+code)| BG_SC_V_FLIP;
		if( x == 3+width+1 )return (KW_TOP_SUB+code)| BG_SC_V_FLIP;
		if( x == 3+width+2 )return (KW_RT_OUT+code)| BG_SC_V_FLIP;
		return (KW_TOP_MAIN+code)| BG_SC_V_FLIP;

	}else{	/* 中 */
		if( x == 0 )return KW_L_OUT+code;
		if( x == 1 )return KW_SIDE_SUB+code;
		if( x == 2 )return KW_SIDE_IN+code;
		if( x == 3+width+0 )return (KW_SIDE_IN+code)|BG_SC_H_FLIP;
		if( x == 3+width+1 )return (KW_SIDE_SUB+code)|BG_SC_H_FLIP;
		if( x == 3+width+2 )return KW_R_OUT+code;
		return KW_BLANK+code;
	};
	return KW_BLANK+code;
};

static void set_kwin_screen( TALK_WIN * tw, u8 sx, u8 sy, u8 width, u8 height )
{
	u8 x,y;
	u16 * scrn;
	u16 code;

	code = FontPalValue(tw) | KWinChrStartNo ;
	scrn = MsgContextGetSCRadrs(tw);

	for( y=0 ; y<height+2 ; y++ )
	{
		for( x=0 ; x<3+width+3 ; x++ )
		{
			scrn[ sx + x + ( sy + y ) * SCRX_SZ ] =
				FontPalValue(tw) | GetKwinChr(code,x,y,width,height);
		};
	};
};

void KWinFrameScrnWrite(TALK_WIN * tw)
{
	set_kwin_screen(tw, MWIN_XPOS, MWIN_YPOS, WIN_LINE_SZ, WIN_LINE_NUM);
}

//-------------------------------------------------------------------------
//	会話ウィンドウのキャラデータセット
//-------------------------------------------------------------------------
void KWinFrameChrSet(TALK_WIN * tw)
{
	u8 * dst;

	dst = MsgContextGetCGXadrs(tw);
	CpuFastCopy( KWIN_DATA_NAME, &dst[KWinChrStartNo * CHRSIZE], KWIN_CHR_SIZE * CHRSIZE );
}

//-------------------------------------------------------------------------
//	会話ウィンドウの消去
//	＜引数＞
//		tw			MSG制御構造体
//-------------------------------------------------------------------------
void KWinFrameClear(TALK_WIN * tw)
{
	u8 i;
	u16 * dst;

	dst = &(MsgContextGetSCRadrs(tw))[KWIN_SCRN_DATA_START];
	for( i=0 ; i<KWIN_SCRN_DATA_SIZE ; i++ )
	{
		dst[i] = FontPalValue(tw) | CLR_CHR_NO ;
	};
};


