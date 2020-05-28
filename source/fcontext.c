//=========================================================================
//
//	fcontext.c
//
//	メッセージ表示コンテキストデータ
//
//=========================================================================

#include "common.h"
#include "print.h"
#include "fcontext.h"
#include "field.h"
//#include "screen.h"

#include "f_pmlist.h"
#include "pokelist.h"

//-------------------------------------------------------------------------
//						定義
//-------------------------------------------------------------------------
/* 標準的な利用での使用リソース　*/
#define FBG_NUMBER		(0)			//使用BGナンバー
#define FCGX_BLOCK		(2)			//ﾌｫﾝﾄ表示用CGXｴﾘｱ指定
#define FSCR_BLOCK		(31)		//ﾌｫﾝﾄ表示用SCRｴﾘｱ指定


//-------------------------------------------------------------------------
//						データ
//-------------------------------------------------------------------------
/* 表示指定：デフォルト設定 */
const FONT_CONTEXT DefaultContext = {
	FBG_NUMBER,			//BGNum 
	FCGX_BLOCK,			//CGXBlockNum 
	FSCR_BLOCK,			//SCRBlockNum 
	0,					//BGpriority
	F_PAL,				//BasePalette
	COL_BLACK,			//BaseFontColor 
	COL_WHITE,			//BaseBGColor 
	COL_DGRAY,			//BaseShadowColor
	FONT8x16TYPE,		//BaseFontType
	TRANSFONTMODE,		//UseMode 
	BASE_CHR_ADRS(FCGX_BLOCK),
						//CGXadrs
	BASE_SCRN_ADRS(FSCR_BLOCK),
						//SCRadrs
	NULL,				//Screen 
};

/* 表示指定：バトル画面用 */
const FONT_CONTEXT FightContext = {
	0,					//BGNum 
	0,					//CGXBlockNum 
	24,					//SCRBlockNum 
	0,					//BGpriority
	0,					//BasePalette
	1,					//BaseFontColor 
	0x0f,				//BaseBGColor 
	COL_DGRAY,			//BaseShadowColor
	FONT8x16sTYPE,		//BaseFontType
	TRANSFONTMODE,		//UseMode 
	BASE_CHR_ADRS(0),
						//CGXadrs
	BASE_SCRN_ADRS(24),
						//SCRadrs
	NULL,				//Screen 
};

/* 表示指定：転送キャラ用 */
const FONT_CONTEXT CGXOnlyContext = {
	0,					//BGNum 
	0,					//CGXBlockNum 
	0,					//SCRBlockNum 
	0,					//BGpriority
	0,					//BasePalette
	COL_BLACK,			//BaseFontColor 
	COL_NUKE,			//BaseBGColor 
	3,//COL_DGRAY,			//BaseShadowColor
	FONT8x8sTYPE,		//BaseFontType
	TRANSCGXMODE,		//UseMode 
	OBJ_MODE0_VRAM,
						//CGXadrs
	0,
						//SCRadrs
	NULL,				//Screen 
};

/* 表示指定：ポケモンリスト用 */
const FONT_CONTEXT PokeListContext = {	//add 01/06/19 by matsuda
	FBG_NUMBER,			//BGNum 
	FCGX_BLOCK,			//CGXBlockNum 
	30,					//SCRBlockNum 
	2,					//BGpriority
	F_PAL,				//BasePalette
	COL_BLACK,			//BaseFontColor 
	COL_NUKE,			//BaseBGColor 
	COL_DGRAY,			//BaseShadowColor
	FONT8x16TYPE,		//BaseFontType
	TRANSFONTMODE,		//UseMode 
	BASE_CHR_ADRS(FCGX_BLOCK),
						//CGXadrs
	BASE_SCRN_ADRS(30),
						//SCRadrs
	NULL,				//Screen 
};

/* 表示指定：ポケモンリスト用 */
const FONT_CONTEXT PokeListContext2 = {	//add 01/06/19 by matsuda
	FBG_NUMBER,			//BGNum 
	LIST8x8_CGX_BLK,	//CGXBlockNum 
	30,					//SCRBlockNum 
	2,					//BGpriority
	F_PAL,				//BasePalette
//	COL_BLACK,			//BaseFontColor 
	COL_WHITE,			//BaseFontColor 
	COL_NUKE,			//BaseBGColor 
//	COL_DGRAY,			//BaseShadowColor
	COL_BLACK,			//BaseShadowColor
	FONT8x8sTYPE,		//BaseFontType
	FIXFONTMODE,		//UseMode 
	BASE_CHR_ADRS(LIST8x8_CGX_BLK),
						//CGXadrs
	BASE_SCRN_ADRS(30),
						//SCRadrs
	NULL,				//Screen 
};

/* 表示指定：フィールドメッセージ設定 */
const FONT_CONTEXT FieldMsgContext = {
	MSG_BG_NO,			//BGNum 
	MSG_CHR_BASE,		//CGXBlockNum 
	MSG_SCRN_BASE,		//SCRBlockNum 
	0,					//BGpriority
	F_PAL,				//BasePalette
	COL_BLACK,			//BaseFontColor 
	0x0c,				//BaseBGColor 
	COL_DGRAY,			//BaseShadowColor
	FONT8x16sTYPE,		//BaseFontType
	FIXSCRNMODE,		//UseMode 
//	TRANSFONTMODE,		//UseMode 
	BASE_CHR_ADRS(MSG_CHR_BASE),
						//CGXadrs
	BASE_SCRN_ADRS(MSG_SCRN_BASE),
						//SCRadrs
	NULL,				//Screen 
};

/* 表示指定：フィールドメッセージ設定 */
const FONT_CONTEXT FieldMenuContext = {
	MSG_BG_NO,			//BGNum 
	MSG_CHR_BASE,		//CGXBlockNum 
	MSG_SCRN_BASE,		//SCRBlockNum 
	0,					//BGpriority
	F_PAL,				//BasePalette
	COL_BLACK,			//BaseFontColor 
	COL_WHITE,			//BaseBGColor 
	COL_DGRAY,			//BaseShadowColor
	FONT8x16sTYPE,		//BaseFontType
	FIXSCRNMODE,		//UseMode 
	BASE_CHR_ADRS(MSG_CHR_BASE),
						//CGXadrs
	BASE_SCRN_ADRS(MSG_SCRN_BASE),
						//SCRadrs
	NULL,				//Screen 
};

/* 表示指定：フィールドポケモンリスト内メニュー設定 */
const FONT_CONTEXT MenuPokeListContext = {
	MENUPOKE_BG_NUMBER,			//BGNum 
	MENUPOKE_CGX_BLK,			//CGXBlockNum 
	MENUPOKE_SCRN_BLK,			//SCRBlockNum 
	0,							//BGpriority
	F_PAL,				//BasePalette
	COL_BLACK,			//BaseFontColor 
	COL_WHITE,			//BaseBGColor 
	COL_DGRAY,			//BaseShadowColor
	FONT8x16sTYPE,		//BaseFontType
	FIXFONTMODE,		//UseMode 
	BASE_CHR_ADRS(MENUPOKE_CGX_BLK),
						//CGXadrs
	BASE_SCRN_ADRS(MENUPOKE_SCRN_BLK),
						//SCRadrs
	NULL,				//Screen 
};

/* 表示指定：パソコンボックスメニュー設定 */
const FONT_CONTEXT PasoBoxMenuContext = {      // 01/09/26 taya
	0,                          //BGNum 
	0,                          //CGXBlockNum 
	FSCR_BLOCK,                 //SCRBlockNum 
	0,                          //BGpriority
	F_PAL,                      //BasePalette
	COL_BLACK,                  //BaseBGColor 
	COL_WHITE,                  //BaseFontColor 
	COL_DGRAY,					//BaseShadowColor
	FONT8x16sTYPE,              //BaseFontType
	FIXFONTMODE,                //UseMode 
	BASE_CHR_ADRS(0),           //CGXadrs
	BASE_SCRN_ADRS(FSCR_BLOCK), //SCRadrs
	NULL,                       //Screen 
};

/* 表示指定：パソコンボックスステータス設定 */
const FONT_CONTEXT PasoBoxStatusContext = {      // 01/09/26 taya
	1,                          //BGNum 
	0,                          //CGXBlockNum 
	31,                         //SCRBlockNum 
	1,                          //BGpriority
	1,                          //BasePalette
	1,                  //BaseBGColor 
	15,                  //BaseFontColor 
	14,					//BaseShadowColor
	FONT8x16sTYPE,              //BaseFontType
	FIXFONTMODE,                //UseMode 
	BASE_CHR_ADRS(0),           //CGXadrs
	BASE_SCRN_ADRS(31),         //SCRadrs
	NULL,                       //Screen 
};

/* 表示指定：簡易会話スクロールＢＧ設定 */
const FONT_CONTEXT KaiwaEnableContext = {      // 01/11/30 taya
	3,                          //BGNum 
	0,                          //CGXBlockNum 
	15,                         //SCRBlockNum 
	3,                          //BGpriority
	2,                          //BasePalette
	COL_BLACK,                  //BaseBGColor 
	COL_WHITE,                  //BaseFontColor 
	COL_DGRAY,					//BaseShadowColor
	FONT8x16sTYPE,              //BaseFontType
	FIXFONTMODE,                //UseMode 
	BASE_CHR_ADRS(0),           //CGXadrs
	BASE_SCRN_ADRS(15),         //SCRadrs
	NULL,                       //Screen 
};
const FONT_CONTEXT KaiwaDisableContext = {      // 01/12/11 taya
	3,                          //BGNum 
	0,                          //CGXBlockNum 
	15,                         //SCRBlockNum 
	3,                          //BGpriority
	3,                          //BasePalette
	COL_BLACK,                  //BaseBGColor 
	3,                          //BaseFontColor 
	COL_DGRAY,					//BaseShadowColor
	FONT8x16sTYPE,              //BaseFontType
	FIXFONTMODE,                //UseMode 
	BASE_CHR_ADRS(0),           //CGXadrs
	BASE_SCRN_ADRS(15),         //SCRadrs
	NULL,                       //Screen 
};
const FONT_CONTEXT Kaiwa2Context = {      // 02/08/12 taya
	1,                          //BGNum 
	0,                          //CGXBlockNum 
	14,                         //SCRBlockNum 
	1,                          //BGpriority
	0,                          //BasePalette
	COL_BLACK,                  //BaseBGColor 
	COL_WHITE,                  //BaseFontColor 
	COL_DGRAY,					//BaseShadowColor
	FONT8x16sTYPE,              //BaseFontType
	FIXFONTMODE,                //UseMode 
	BASE_CHR_ADRS(0),           //CGXadrs
	BASE_SCRN_ADRS(14),         //SCRadrs
	NULL,                       //Screen 
};

/* 表示指定：主人公ｽﾃｰﾀｽ設定 0 */
const FONT_CONTEXT MyStatus0Context = {			// 01/07/24 kaga
	0,					//BGNum 
	3,					//CGXBlockNum 
	23,					//SCRBlockNum 
	0,					//BGpriority
	15,					//BasePalette
	COL_BLACK,			//BaseBGColor 
	COL_NUKE,			//BaseFontColor
	COL_DGRAY,			//BaseShadowColor
	FONT8x16sTYPE,		//BaseFontType
	FIXFONTMODE,		//UseMode 
	BASE_CHR_ADRS(3),
						//CGXadrs
	BASE_SCRN_ADRS(23),
						//SCRadrs
	NULL,				//Screen
};

/* 表示指定：主人公ｽﾃｰﾀｽ設定 1 */
const FONT_CONTEXT MyStatus1Context = {				// 02/04/26 kaga
	0,					//BGNum 
	3,					//CGXBlockNum 
	23,					//SCRBlockNum 
	0,					//BGpriority
	14,					//BasePalette
	COL_BLACK,			//BaseBGColor 
	COL_NUKE,			//BaseFontColor
	COL_DGRAY,			//BaseShadowColor
	FONT8x16sTYPE,		//BaseFontType
	FIXFONTMODE,		//UseMode 
	BASE_CHR_ADRS(3),
						//CGXadrs
	BASE_SCRN_ADRS(23),
						//SCRadrs
	NULL,				//Screen
};

/* 表示指定：バッグ画面 */
const FONT_CONTEXT BagContext = {		// 2001/08/29 by nakahiro
	MSG_BG_NO,			//BGNum 
	MSG_CHR_BASE,		//CGXBlockNum 
	MSG_SCRN_BASE,		//SCRBlockNum 
	0,					//BGpriority
	F_PAL,				//BasePalette
	COL_BLACK,			//BaseFontColor 
	COL_NUKE,			//BaseBGColor 
	COL_DGRAY,			//BaseShadowColor
	FONT8x16sTYPE,		//BaseFontType
	FIXFONTMODE,		//UseMode 
	BASE_CHR_ADRS(MSG_CHR_BASE),
						//CGXadrs
	BASE_SCRN_ADRS(MSG_SCRN_BASE),
						//SCRadrs
	NULL,				//Screen 
};

/* 表示指定：バッグ画面 */
const FONT_CONTEXT BagContext2 = {		// 2002/02/01 by nakahiro
	MSG_BG_NO,			//BGNum 
	MSG_CHR_BASE,		//CGXBlockNum 
	MSG_SCRN_BASE,		//SCRBlockNum 
	1,					//BGpriority
	F_PAL,				//BasePalette
	COL_BLACK,			//BaseFontColor 
	COL_NUKE,			//BaseBGColor 
	COL_DGRAY,			//BaseShadowColor
	FONT8x16sTYPE,		//BaseFontType
	FIXFONTMODE,		//UseMode 
	BASE_CHR_ADRS(MSG_CHR_BASE),
						//CGXadrs
	BASE_SCRN_ADRS(MSG_SCRN_BASE),
						//SCRadrs
	NULL,				//Screen 
};

/* 表示指定：タグ画面 */
const FONT_CONTEXT TagContext = {		// 2002/07/15 by nakahiro
	MSG_BG_NO,			//BGNum 
	MSG_CHR_BASE,		//CGXBlockNum 
	MSG_SCRN_BASE,		//SCRBlockNum 
	1,					//BGpriority
	F_PAL,				//BasePalette
	COL_BLACK,			//BaseFontColor 
	COL_NUKE,			//BaseBGColor 
	COL_DGRAY,			//BaseShadowColor
	FONT8x16sTYPE,		//BaseFontType
	FIXFONTMODE,		//UseMode 
	BASE_CHR_ADRS(MSG_CHR_BASE),
						//CGXadrs
	BASE_SCRN_ADRS(MSG_SCRN_BASE),
						//SCRadrs
	NULL,				//Screen 
};

/* 表示指定：キューブケース */
const FONT_CONTEXT CubeCaseContext = {		// 2002/02/26 by nakahiro
	1,					//BGNum 
	MSG_CHR_BASE,		//CGXBlockNum 
	MSG_SCRN_BASE,		//SCRBlockNum 
	1,					//BGpriority
	F_PAL,				//BasePalette
	COL_BLACK,			//BaseFontColor 
	COL_NUKE,			//BaseBGColor 
	COL_DGRAY,			//BaseShadowColor
	FONT8x16sTYPE,		//BaseFontType
	FIXFONTMODE,		//UseMode 
	BASE_CHR_ADRS(MSG_CHR_BASE),
						//CGXadrs
	BASE_SCRN_ADRS(MSG_SCRN_BASE),
						//SCRadrs
	NULL,				//Screen 
};
const FONT_CONTEXT CubeCaseContext2 = {		// 2002/02/26 by nakahiro
	0,					//使用するＢＧのナンバー
	0,					//使用するキャラのブロック指定
	28,					//使用するスクリーンのブロック指定
	0,					//使用するＢＧの表示優先順位
	13,					//基本使用パレット
	COL_BLACK,			//BaseFontColor 
	COL_WHITE,			//BaseBGColor 
	COL_DGRAY,			//BaseShadowColor
	FONT8x16sTYPE,		//基本フォント
	FIXFONTMODE,		//文字表示モード
	BASE_CHR_ADRS(0),	//使用するキャラのアドレス
	BASE_SCRN_ADRS(28),	//使用するスクリーンのアドレス
	NULL,				//仮想ＶＲＡＭのアドレス（未実装）
};

/* 表示指定：ﾎﾟｹﾓﾝｽﾃｰﾀｽ画面 */
const FONT_CONTEXT PokeStatusContext = {	//add 2001.09.19(水) by matsuda
	FBG_NUMBER,			//BGNum 
	FCGX_BLOCK,			//CGXBlockNum 
	30,					//SCRBlockNum 
	0,					//BGpriority
	F_PAL,				//BasePalette
	COL_BLACK,			//BaseFontColor 
	COL_NUKE,			//BaseBGColor 
	COL_DGRAY,			//BaseShadowColor
	FONT8x16sTYPE,		//BaseFontType
//	TRANSFONTMODE,		//UseMode 
	FIXFONTMODE,		//文字表示モード
	BASE_CHR_ADRS(FCGX_BLOCK),
						//CGXadrs
	BASE_SCRN_ADRS(30),
						//SCRadrs
	NULL,				//Screen 
};
const FONT_CONTEXT PokeStatusContext3 = {	// 2002/04/23 by nakahiro
	FBG_NUMBER,			//BGNum 
	FCGX_BLOCK,			//CGXBlockNum 
	30,					//SCRBlockNum 
	0,					//BGpriority
	F_PAL,				//BasePalette
	COL_WHITE,			//BaseFontColor 
	COL_NUKE,			//BaseBGColor 
	COL_LGRAY,			//BaseShadowColor
	FONT8x16sTYPE,		//BaseFontType
//	TRANSFONTMODE,		//UseMode 
	FIXFONTMODE,		//文字表示モード
	BASE_CHR_ADRS(FCGX_BLOCK),
						//CGXadrs
	BASE_SCRN_ADRS(30),
						//SCRadrs
	NULL,				//Screen 
};


const FONT_CONTEXT NameInBG0Context =			// 01/09/28 kaga
{	
	0,					//BGNum 
	0,					//CGXBlockNum 
	31,					//SCRBlockNum 
	0,					//BGpriority
	15,					//BasePalette
	0x01,				//BaseFontColor 
	0x0f,				//BaseBGColor 
	COL_DGRAY,			//BaseShadowColor
	FONT8x16sTYPE,		//BaseFontType
	FIXFONTMODE,		//UseMode 
	BASE_CHR_ADRS(0),
						//CGXadrs
	BASE_SCRN_ADRS(31),
						//SCRadrs
	NULL,				//Screen 
};

const FONT_CONTEXT NameInHiraBG1Context =			// 02/06/08 kaga
{	
	1,					//BGNum 
	0,					//CGXBlockNum 
	16,					//SCRBlockNum 
	1,					//BGpriority
	1,					//BasePalette
	0x01,				//BaseBGColor 
	0x0f,				//BaseFontColor 
	COL_DGRAY,			//BaseShadowColor
	FONT8x16sTYPE,		//BaseFontType
	FIXFONTMODE,		//UseMode 
	BASE_CHR_ADRS(0),
						//CGXadrs
	BASE_SCRN_ADRS(16),
						//SCRadrs
	NULL,				//Screen 
};

const FONT_CONTEXT NameInHiraBG2Context =			// 02/06/08 kaga
{	
	2,					//BGNum 
	0,					//CGXBlockNum 
	16,					//SCRBlockNum 
	2,					//BGpriority
	1,					//BasePalette
	0x01,				//BaseBGColor 
	0x0f,				//BaseFontColor 
	COL_DGRAY,			//BaseShadowColor
	FONT8x16sTYPE,		//BaseFontType
	FIXFONTMODE,		//UseMode 
	BASE_CHR_ADRS(0),
						//CGXadrs
	BASE_SCRN_ADRS(17),
						//SCRadrs
	NULL,				//Screen 
};

const FONT_CONTEXT NameInKanaBG1Context =			// 02/06/08 kaga
{	
	1,					//BGNum 
	0,					//CGXBlockNum 
	17,					//SCRBlockNum 
	1,					//BGpriority
	2,					//BasePalette
	0x01,				//BaseBGColor 
	0x0f,				//BaseFontColor 
	COL_DGRAY,			//BaseShadowColor
	FONT8x16sTYPE,		//BaseFontType
	FIXFONTMODE,		//UseMode 
	BASE_CHR_ADRS(0),
						//CGXadrs
	BASE_SCRN_ADRS(16),
						//SCRadrs
	NULL,				//Screen 
};

const FONT_CONTEXT NameInKanaBG2Context =			// 02/06/08 kaga
{	
	2,					//BGNum 
	0,					//CGXBlockNum 
	17,					//SCRBlockNum 
	2,					//BGpriority
	2,					//BasePalette
	0x01,				//BaseBGColor 
	0x0f,				//BaseFontColor 
	COL_DGRAY,			//BaseShadowColor
	FONT8x16sTYPE,		//BaseFontType
	FIXFONTMODE,		//UseMode 
	BASE_CHR_ADRS(0),
						//CGXadrs
	BASE_SCRN_ADRS(17),
						//SCRadrs
	NULL,				//Screen 
};

const FONT_CONTEXT NameInAbcBG1Context =			// 02/06/08 kaga
{	
	1,					//BGNum 
	0,					//CGXBlockNum 
	17,					//SCRBlockNum 
	1,					//BGpriority
	3,					//BasePalette
	0x01,				//BaseBGColor 
	0x0f,				//BaseFontColor 
	COL_DGRAY,			//BaseShadowColor
	FONT8x16sTYPE,		//BaseFontType
	FIXFONTMODE,		//UseMode 
	BASE_CHR_ADRS(0),
						//CGXadrs
	BASE_SCRN_ADRS(16),
						//SCRadrs
	NULL,				//Screen 
};

const FONT_CONTEXT NameInAbcBG2Context =			// 02/06/08 kaga
{	
	2,					//BGNum 
	0,					//CGXBlockNum 
	17,					//SCRBlockNum 
	2,					//BGpriority
	3,					//BasePalette
	0x01,				//BaseBGColor 
	0x0f,				//BaseFontColor 
	COL_DGRAY,			//BaseShadowColor
	FONT8x16sTYPE,		//BaseFontType
	FIXFONTMODE,		//UseMode 
	BASE_CHR_ADRS(0),
						//CGXadrs
	BASE_SCRN_ADRS(17),
						//SCRadrs
	NULL,				//Screen 
};

const FONT_CONTEXT NameInBG3Context =			// 01/09/28 kaga
{
	3,					//BGNum 
	0,					//CGXBlockNum 
	18,					//SCRBlockNum 
	3,					//BGpriority
	0,					//BasePalette
	0x01,				//BaseBGColor 
	0x0f,				//BaseFontColor 
	COL_DGRAY,			//BaseShadowColor
	FONT8x16sTYPE,		//BaseFontType
	FIXFONTMODE,		//UseMode 
	BASE_CHR_ADRS(0),
						//CGXadrs
	BASE_SCRN_ADRS(18),
						//SCRadrs
	NULL,				//Screen 
};


const FONT_CONTEXT BlendMachineContext =		//2001.12.25 Mori
{
	0,					//BGNum 
	3,			//CGXBlockNum 
	FSCR_BLOCK,			//SCRBlockNum 
	0,					//BGpriority
	F_PAL,				//BasePalette
	0x1,				//BaseFontColor 
	0x0f,				//BaseBGColor 
	COL_DGRAY,			//BaseShadowColor
	FONT8x16sTYPE,		//BaseFontType
	TRANSFONTMODE,		//UseMode 
	BASE_CHR_ADRS(3),
						//CGXadrs
	BASE_SCRN_ADRS(FSCR_BLOCK),
						//SCRadrs
	NULL,				//Screen 
	

};
const FONT_CONTEXT KoukanContext =		//2001.10.2 Mori
{
	0,					//BGNum 
	FCGX_BLOCK,			//CGXBlockNum 
	FSCR_BLOCK,			//SCRBlockNum 
	0,					//BGpriority
	F_PAL,				//BasePalette
	0x0f,				//BaseFontColor 
	0x00,				//BaseBGColor 
//	COL_DGRAY,			//BaseShadowColor
	1,					//BaseShadowColor
	FONT8x16sTYPE,		//BaseFontType
	TRANSFONTMODE,
//	FIXFONTMODE,		//UseMode 
	BASE_CHR_ADRS(FCGX_BLOCK),
						//CGXadrs
	BASE_SCRN_ADRS(FSCR_BLOCK),
						//SCRadrs
	NULL,				//Screen 
	

};

const FONT_CONTEXT CommMixContext = {
	MSG_BG_NO,			//BGNum 
	MSG_CHR_BASE,		//CGXBlockNum 
	MSG_SCRN_BASE,		//SCRBlockNum 
	0,					//BGpriority
	F_PAL,				//BasePalette
	COL_BLACK,			//BaseFontColor 
	COL_WHITE,			//BaseBGColor 
	COL_DGRAY,			//BaseShadowColor
	FONT8x16sTYPE,		//BaseFontType
	FIXFONTMODE,		//UseMode 
	BASE_CHR_ADRS(MSG_CHR_BASE),
						//CGXadrs
	BASE_SCRN_ADRS(MSG_SCRN_BASE),
						//SCRadrs
	NULL,				//Screen 
};

/* 表示指定：ｺﾝﾃｽﾄ結果発表画面1 */
const FONT_CONTEXT ConResultContext1 = {	// 2001.10.12(金) by matsuda
	1,					//BGNum 
	0,					//CGXBlockNum 
	24,					//SCRBlockNum 
	3,					//BGpriority
	F_PAL,				//BasePalette
	COL_BLACK,			//BaseFontColor 
	COL_NUKE,			//BaseBGColor 
	COL_DGRAY,			//BaseShadowColor
	FONT8x16sTYPE,		//BaseFontType
	TRANSFONTMODE,		//UseMode 
	BASE_CHR_ADRS(0),
						//CGXadrs
	BASE_SCRN_ADRS(24),
						//SCRadrs
	NULL,				//Screen 
};

/* 表示指定：ｺﾝﾃｽﾄ結果発表画面2 */
const FONT_CONTEXT ConResultContext2 = {	// 2001.10.12(金) by matsuda
	0,					//BGNum 
	0,					//CGXBlockNum 
	30,					//SCRBlockNum 
	0,					//BGpriority
	F_PAL,				//BasePalette
	COL_WHITE,			//BaseFontColor 
	COL_NUKE,			//BaseBGColor 
	COL_DGRAY,			//BaseShadowColor
	FONT8x16sTYPE,		//BaseFontType
	TRANSFONTMODE,		//UseMode 
	BASE_CHR_ADRS(0),
						//CGXadrs
	BASE_SCRN_ADRS(30),
						//SCRadrs
	NULL,				//Screen 
};

/* 表示指定：ｺﾝﾃｽﾄ2次審査画面用 */
const FONT_CONTEXT ContestContext = {		//add by matsuda 2001.11.09(金)
	0,					//BGNum 
	0,					//CGXBlockNum 
	24,					//SCRBlockNum 
	0,					//BGpriority
	F_PAL,				//BasePalette
	COL_WHITE,			//BaseFontColor 
	COL_NUKE,			//BaseBGColor 
	COL_DGRAY,			//BaseShadowColor
	FONT8x16sTYPE,		//BaseFontType
	TRANSFONTMODE,		//UseMode 
	BASE_CHR_ADRS(0),
						//CGXadrs
	BASE_SCRN_ADRS(24),
						//SCRadrs
	NULL,				//Screen 
};

/* 表示指定：ｺﾝﾃｽﾄ2次審査画面、メッセージ送り用 */
const FONT_CONTEXT ContestTalkContext = {		//add by matsuda 2001.11.09(金)
	0,					//BGNum 
	0,					//CGXBlockNum 
	24,					//SCRBlockNum 
	0,					//BGpriority
	F_PAL,				//BasePalette
	COL_BLACK,			//BaseFontColor 
	COL_NUKE,			//BaseBGColor 
	COL_DGRAY,			//BaseShadowColor
	FONT8x16sTYPE,		//BaseFontType
	TRANSFONTMODE,		//UseMode 
	BASE_CHR_ADRS(0),
						//CGXadrs
	BASE_SCRN_ADRS(24),
						//SCRadrs
	NULL,				//Screen 
};

/* 表示指定：技リスト画面用 */
const FONT_CONTEXT WazaListContext = {		//add by matsuda 2001.11.13(火)
	0,					//BGNum 
	0,					//CGXBlockNum 
	30,					//SCRBlockNum 
	0,					//BGpriority
	F_PAL,				//BasePalette
	COL_BLACK,			//BaseFontColor 
	COL_NUKE,			//BaseBGColor 
	COL_DGRAY,			//BaseShadowColor
	FONT8x16sTYPE,		//BaseFontType
	TRANSFONTMODE,		//UseMode 
	BASE_CHR_ADRS(0),
						//CGXadrs
	BASE_SCRN_ADRS(30),
						//SCRadrs
	NULL,				//Screen 
};

/* 表示指定：図鑑画面用 */
const FONT_CONTEXT ZukanMainContext = {		//add by TETSU
	3,					//BGNum 
	2,					//CGXBlockNum 
	15,					//SCRBlockNum 
	0,					//BGpriority
	F_PAL,				//BasePalette
	COL_BLACK,			//BaseFontColor 
	COL_WHITE,			//BaseBGColor 
	COL_DGRAY,			//BaseShadowColor
	FONT8x16sTYPE,		//BaseFontType
	FIXFONTMODE,		//UseMode 
	BASE_CHR_ADRS(2),
						//CGXadrs
	BASE_SCRN_ADRS(15),
						//SCRadrs
	NULL,				//Screen 
};

/* 表示指定：図鑑ﾘｽﾄ用 */
const FONT_CONTEXT ZukanListContext = {		//add by TETSU
	2,					//BGNum 
	2,					//CGXBlockNum 
	14,					//SCRBlockNum 
	2,					//BGpriority
	F_PAL,				//BasePalette
	COL_BLACK,			//BaseFontColor 
	COL_NUKE,			//BaseBGColor 
	COL_DGRAY,			//BaseShadowColor
	FONT8x16sTYPE,		//BaseFontType
	FIXFONTMODE,		//UseMode 
	BASE_CHR_ADRS(2),
						//CGXadrs
	BASE_SCRN_ADRS(14),
						//SCRadrs
	NULL,				//Screen 
};

/* トレナビ用 */
const FONT_CONTEXT TNaviContext = {		// 2002/02/08 taya
	3,					//BGNum 
	0,					//CGXBlockNum 
	30,					//SCRBlockNum 
	3,					//BGpriority
	2,					//BasePalette
	0x01,				//BaseFontColor 
	0x0f,				//BaseBGColor 
	0x08,				//BaseShadowColor
	FONT8x16sTYPE,		//BaseFontType
	FIXFONTMODE,		//UseMode 
	BASE_CHR_ADRS(0),	//CGXadrs
	BASE_SCRN_ADRS(30),	//SCRadrs
	NULL,				//Screen 
};
const FONT_CONTEXT TNavi2Context = {	// 2002/02/23  taya
	0,					//BGNum 
	0,					//CGXBlockNum 
	31,					//SCRBlockNum 
	1,					//BGpriority
	15,					//BasePalette
	0x01,				//BaseFontColor 
	0x0f,				//BaseBGColor 
	0x08,				//BaseShadowColor
	FONT8x16sTYPE,		//BaseFontType
	FIXFONTMODE,		//UseMode 
	BASE_CHR_ADRS(0),	//CGXadrs
	BASE_SCRN_ADRS(31),	//SCRadrs
	NULL,				//Screen 
};
const FONT_CONTEXT TNavi3Context = {	// 2002/02/27  taya
	2,					//BGNum 
	0,					//CGXBlockNum 
	30,					//SCRBlockNum 
	2,					//BGpriority
	15,					//BasePalette
	0x01,				//BaseFontColor 
	0x00,				//BaseBGColor 
	0x08,				//BaseShadowColor
	FONT8x16sTYPE,		//BaseFontType
	FIXFONTMODE,		//UseMode 
	BASE_CHR_ADRS(0),	//CGXadrs
	BASE_SCRN_ADRS(30),	//SCRadrs
	NULL,				//Screen 
};
const FONT_CONTEXT TNavi4Context = {	// 2002/07/04 taya
	3,					//BGNum 
	0,					//CGXBlockNum 
	30,					//SCRBlockNum 
	3,					//BGpriority
	2,					//BasePalette
	0x01,				//BaseFontColor 
	0x00,				//BaseBGColor 
	0x08,				//BaseShadowColor
	FONT8x16sTYPE,		//BaseFontType
	FIXFONTMODE,		//UseMode 
	BASE_CHR_ADRS(0),	//CGXadrs
	BASE_SCRN_ADRS(30),	//SCRadrs
	NULL,				//Screen 
};

/* ｽﾛｯﾄ用 */
const FONT_CONTEXT SlotContext =			// 02/02/19 kaga
{
	0,					//BGNum 
	2,					//CGXBlockNum 
	31,					//SCRBlockNum 
	0,					//BGpriority
	15,					//BasePalette
	COL_BLACK,			//BaseFontColor 
	COL_WHITE,			//BaseBGColor 
	COL_DGRAY,			//BaseShadowColor
	FONT8x16sTYPE,		//BaseFontType
	FIXFONTMODE,		//UseMode 
	BASE_CHR_ADRS(2),
						//CGXadrs
	BASE_SCRN_ADRS(31),
						//SCRadrs
	NULL,				//Screen 
};

/* ｽﾛｯﾄ用 */
const FONT_CONTEXT SlotInfoContext =			// 02/08/06 kaga
{
	0,					//BGNum 
	2,					//CGXBlockNum 
	31,					//SCRBlockNum 
	0,					//BGpriority
	13,					//BasePalette
	COL_BLACK,			//BaseFontColor 
	COL_WHITE,			//BaseBGColor 
	COL_DGRAY,			//BaseShadowColor
	FONT8x16sTYPE,		//BaseFontType
	FIXFONTMODE,		//UseMode 
	BASE_CHR_ADRS(2),
						//CGXadrs
	BASE_SCRN_ADRS(31),
						//SCRadrs
	NULL,				//Screen 
};

/* 肖像画用 */
const FONT_CONTEXT ConPicContext =			// 02/02/27 Tomo
{
	1,					//BGNum 
	1,					//CGXBlockNum 
	10,					//SCRBlockNum 
	1,					//BGpriority
	14,					//BasePalette
	COL_BLACK,			//BaseFontColor
	COL_NUKE,			//BaseBGColor 
	COL_DGRAY,			//BaseShadowColor
	FONT8x16sTYPE,		//BaseFontType
	TRANSFONTMODE,		//UseMode 
	BASE_CHR_ADRS(1),
						//CGXadrs
	BASE_SCRN_ADRS(10),
						//SCRadrs
	NULL,				//Screen 
};


/*  こうかんデモ用	*/
const FONT_CONTEXT KoukanDemoContext =		//2002.07.01 mori
{
	0,					//BGNum 
	3,			//CGXBlockNum 
	FSCR_BLOCK,			//SCRBlockNum 
	0,					//BGpriority
	F_PAL,				//BasePalette
	0x0f,				//BaseFontColor 
	0x00,				//BaseBGColor 
	COL_DGRAY,			//BaseShadowColor
	FONT8x16sTYPE,		//BaseFontType
	TRANSFONTMODE,
//	FIXFONTMODE,		//UseMode 
	BASE_CHR_ADRS(3),
						//CGXadrs
	BASE_SCRN_ADRS(FSCR_BLOCK),
						//SCRadrs
	NULL,				//Screen 
	

};


/* 表示指定：殿堂入り用 */
const FONT_CONTEXT DendouContext = {		//add by TETSU
	0,					//BGNum 
	2,					//CGXBlockNum 
	15,					//SCRBlockNum 
	0,					//BGpriority
	F_PAL,				//BasePalette
	COL_WHITE,			//BaseFontColor 
	COL_NUKE,			//BaseBGColor 
	COL_DGRAY,			//BaseShadowColor
	FONT8x16sTYPE,		//BaseFontType
	FIXFONTMODE,		//UseMode 
	BASE_CHR_ADRS(2),
						//CGXadrs
	BASE_SCRN_ADRS(15),
						//SCRadrs
	NULL,				//Screen 
};

/* 表示指定：殿堂入り用2 */
const FONT_CONTEXT DendouContext2 = {		//add by TETSU
	0,					//BGNum 
	2,					//CGXBlockNum 
	15,					//SCRBlockNum 
	0,					//BGpriority
	F_PAL,				//BasePalette
	COL_BLACK,			//BaseFontColor 
	COL_WHITE,			//BaseBGColor 
	COL_DGRAY,			//BaseShadowColor
	FONT8x16sTYPE,		//BaseFontType
	FIXFONTMODE,		//UseMode 
	BASE_CHR_ADRS(2),
						//CGXadrs
	BASE_SCRN_ADRS(15),
						//SCRadrs
	NULL,				//Screen 
};

/* 表示指定：通信対戦ウィンドウ用1 */
const FONT_CONTEXT TuushinWindow1 = {		//add by soga
	1,					//BGNum 
	1,					//CGXBlockNum 
	28,					//SCRBlockNum 
	0,					//BGpriority
	5,					//BasePalette
	0x0d,				//BaseFontColor 
	0x0e,				//BaseBGColor 
	0x0f,				//BaseShadowColor
	FONT8x16sTYPE,		//BaseFontType
	TRANSFONTMODE,		//UseMode 
	BASE_CHR_ADRS(1),	//CGXadrs
	BASE_SCRN_ADRS(28), //SCRadrs
	NULL,				//Screen 
};

/* 表示指定：通信対戦ウィンドウ用2 */
const FONT_CONTEXT TuushinWindow2 = {		//add by soga
	2,					//BGNum 
	1,					//CGXBlockNum 
	30,					//SCRBlockNum 
	0,					//BGpriority
	5,					//BasePalette
	0x0d,				//BaseFontColor 
	0x0e,				//BaseBGColor 
	0x0f,				//BaseShadowColor
	FONT8x16sTYPE,		//BaseFontType
	TRANSFONTMODE,		//UseMode 
	BASE_CHR_ADRS(1),	//CGXadrs
	BASE_SCRN_ADRS(30), //SCRadrs
	NULL,				//Screen 
};

/* 表示指定：スタッフロール用 */
const FONT_CONTEXT StaffRollContext = {		//add by TETSU
	0,					//BGNum 
	2,					//CGXBlockNum 
	28,					//SCRBlockNum 
	0,					//BGpriority
	8,					//BasePalette
	0x01,				//BaseFontColor 
	0x00,				//BaseBGColor 
	0x02,				//BaseShadowColor
	FONT8x16sTYPE,		//BaseFontType
	FIXFONTMODE,		//UseMode 
	BASE_CHR_ADRS(2),	//CGXadrs
	BASE_SCRN_ADRS(28), //SCRadrs
	NULL,				//Screen 
};

/* コンテキストをまとめた構造体 */

typedef const struct {
	CONST_FONT_CONTEXT_P context;
	CONTEXT_TYPE id;
}CONTEXT_ENTRY;

static CONTEXT_ENTRY ContextEntryTable[] = {

	{ &DefaultContext		,DEFAULT_TYPE	},
	{ &FightContext			,FIGHT_TYPE		},
	{ &PokeListContext		,POKELIST_TYPE	},
	{ &PokeListContext2		,POKELIST2_TYPE	},
	{ &FieldMsgContext		,FIELD_MSG_TYPE	},
	{ &CGXOnlyContext		,CGX_ONLY_TYPE	},
	{ &FieldMenuContext		,FIELD_MENU_TYPE},
	{ &MenuPokeListContext	,MENUPOKE_TYPE	},
	{ &PasoBoxMenuContext	,PASOBOXMENU_TYPE   }, // 2001/09/26  taya
	{ &PasoBoxStatusContext	,PASOBOXSTATUS_TYPE }, // 2001/09/26  taya
	{ &MyStatus0Context		,MYSTATUS0_TYPE	},
	{ &MyStatus1Context		,MYSTATUS1_TYPE },
	{ &BagContext			,BAG_TYPE		},	// 2001/08/29 by nakahiro
	{ &BagContext2			,BAG_TYPE2		},	// 2002/02/01 by nakahiro
	{ &PokeStatusContext	,POKESTATUS_TYPE},	// 2001.09.19(水) by matsuda
	{ &PokeStatusContext3	,POKESTATUS_TYPE3},	// 2002/04/23 by nakahiro
	{ &NameInBG0Context		,NAMEIN_BG0_TYPE },	// 2002/06/08 kaga
	{ &NameInHiraBG1Context	,NAMEIN_HIRA_BG1_TYPE },
	{ &NameInHiraBG2Context	,NAMEIN_HIRA_BG2_TYPE },
	{ &NameInKanaBG1Context	,NAMEIN_KANA_BG1_TYPE },
	{ &NameInKanaBG2Context	,NAMEIN_KANA_BG2_TYPE },
	{ &NameInAbcBG1Context	,NAMEIN_ABC_BG1_TYPE },
	{ &NameInAbcBG2Context	,NAMEIN_ABC_BG2_TYPE },
	{ &NameInBG3Context		,NAMEIN_BG3_TYPE },
	{ &KoukanContext		,KOUKAN_TYPE	},	//2001.10.2 by Mori
	{ &CommMixContext		,COM_MIX_TYPE	},
	{ &ConResultContext1	,CONRES1_TYPE	},	// 2001.10.12(金) by matsuda
	{ &ConResultContext2	,CONRES2_TYPE	},	// 2001.10.12(金) by matsuda
	{ &ContestContext		,CONTEST_TYPE	},	// 2001.11.09(金) by matsuda
	{ &ContestTalkContext		,CONTEST_TALK_TYPE	},	// 2002.07.12(金) by matsuda
	{ &WazaListContext		,WAZALIST_TYPE	},	// 2001.11.13(火) by matsuda
	{ &ZukanMainContext		,ZUKANMAIN_TYPE	},	// by TETSU
	{ &ZukanListContext		,ZUKANLIST_TYPE	},	// by TETSU
	{ &KaiwaEnableContext	,KAIWA_TYPE		},  // 2001/11/30  taya
	{ &KaiwaDisableContext	,KAIWADISABLE_TYPE	},	// 2001/12/11  taya
	{ &BlendMachineContext	,BLENDMACHINE_TYPE	},	// 2001/12/25  mori
	{ &TNaviContext			,TNAVI_TYPE		},	// 2002/02/08 taya
	{ &TNavi2Context		,TNAVI2_TYPE	},	// 2002/02/23 taya
	{ &TNavi3Context		,TNAVI3_TYPE	},	// 2002/02/27 taya
	{ &SlotContext			,SLOT_TYPE		},
	{ &SlotInfoContext		,SLOT_INFO_TYPE },
	{ &CubeCaseContext      ,CUBECASE_TYPE  },	// 2002/02/26 by nakahiro
	{ &CubeCaseContext2     ,CUBECASE_TYPE2 },	// 2002/02/26 by nakahiro
	{ &ConPicContext		,CON_PIC_TYPE	},	//2002/02/27 tomo
	{ &KoukanDemoContext    ,KOUKANDEMO_TYPE},	//2002/07/01 mori
	{ &DendouContext		,DENDOU_TYPE	},	//2002/7/3 tetsu
	{ &DendouContext2		,DENDOU2_TYPE	},	//2002/7/3 tetsu
	{ &TNavi4Context		,TNAVI4_TYPE	},	// 2002/02/27 taya
	{ &TagContext			,TAG_TYPE		},	// 2002/07/15 by nakahiro
	{ &TuushinWindow1		,TUUSHINWIN1_TYPE	},	// 2002/08/15 by soga
	{ &TuushinWindow2		,TUUSHINWIN2_TYPE	},	// 2002/08/15 by soga
	{ &Kaiwa2Context		,KAIWA2_TYPE },		// 2002/08/12  taya
	{ &StaffRollContext		,STAFFROLL_TYPE },	// 2002/08/22  tetsu
	{ NULL					,-1},
};


//=========================================================================
//
//=========================================================================

//-------------------------------------------------------------------------
//	コンテキスト指定ＩＤからコンテキストへのポインタを取得
//-------------------------------------------------------------------------
CONST_FONT_CONTEXT_P GetFontContext(CONTEXT_TYPE type)
{
	CONTEXT_ENTRY * p = ContextEntryTable;

	while( p->context != NULL )
	{
		if( p->id == type )return p->context;
		p++;
	};
	return NULL;
};

//-------------------------------------------------------------------------
//	スクリーンデータアドレスをＭＳＧ構造体から取得する
//	<引数>
//	tw		MSG制御構造体
//	<戻り値>
//	スクリーンデータセットアドレス
//-------------------------------------------------------------------------
u16 * MsgContextGetSCRadrs( TALK_WIN * tw )
{
		return (u16 *)tw->context->SCRadrs;
}

//-------------------------------------------------------------------------
//	キャラデータアドレスをＭＳＧ構造体から取得する
//	<引数>
//	tw		MSG制御構造体
//	<戻り値>
//	キャラデータセットアドレス
//-------------------------------------------------------------------------
u8 * MsgContextGetCGXadrs( TALK_WIN * tw )
{
		return (u8 *)tw->context->CGXadrs;
};



