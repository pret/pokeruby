//=========================================================================
//	
//=========================================================================

#ifndef SCREEN_H
#define SCREEN_H
#undef GLOBAL
#ifdef SCREEN_H_GLOBAL
#define GLOBAL /*	*/
#else
#define GLOBAL extern
#endif

//=========================================================================
//	定義
//=========================================================================
//#define name value

#define TEXT_BG_X_LEN	32
#define TEXT_BG_Y_LEN	32
#define	TEXT_BG_SIZE	( TEXT_BG_X_LEN *TEXT_BG_Y_LEN )

//typedef ...


//=========================================================================
//	変数
//=========================================================================
//	定数
extern vu16 * const RegBGctrl[];		//	ＢＧコントロールレジスタ
extern vu16 * const RegBGHofs[];		//	Ｘ方向ＢＧ表示開始位置指定レジスタ
extern vu16 * const RegBGVofs[];		//	Ｙ方向ＢＧ表示開始位置指定レジスタ
extern const u16 BGvisibleSwitch[];		//	表示コントロール（DISPCNT）書き込み用定数
extern const u16 BGblend2ndValue[];		//	ブレンドレジスタ（BLDCNT）用定数（第二対象面）
extern const u16 BGblend1stValue[];		//	ブレンドレジスタ（BLDCNT）用定数（第一対象面）

//	画面転送用ダミーＢＧ領域
extern u16 dmy_BG[4][ TEXT_BG_SIZE ];

//=========================================================================
//	関数プロトタイプ
//=========================================================================
//GLOBAL type function(arg...);


#undef GLOBAL
#endif	/*SCREEN_H*/

