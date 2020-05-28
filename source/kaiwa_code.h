/***********************************************************************
**	簡易会話（カテゴリ名）
**
**	Masao Taya
**
***********************************************************************/
#ifndef _KAIWA_WORD_H_
#define _KAIWA_WORD_H_

/*============================================*/
/*	単語カテゴリ                              */
/*============================================*/
enum KAIWA_WORD_CATEGORY {
	KWC_POKEMON,    // ポケモン      00
	KWC_TRAINER,    // トレーナー    01
	KWC_STATUS,     // ステータス    02
	KWC_BATTLE,     // バトル        03
	KWC_AISATU,     // あいさつ      04
	KWC_HITO,       // ひと          05
	KWC_KOE,        // こえ          06
	KWC_KAIWA,      // かいわ        07
	KWC_MUSUBI,     // むすび        08
	KWC_KIMOTI,     // きもち        09
	KWC_JOUTAI,     // じょうたい    0a
	KWC_KOUDOU,     // こうどう      0b
	KWC_SEIKATU,    // せいかつ      0c
	KWC_SYUMI,      // しゅみ        0d
	KWC_JIKAN,      // じかん        0e
	KWC_AREKORE,    // あれこれ      0f
	KWC_KURIKAESI,  // くりかえし    10
	KWC_EVENT,      // イベント      11
	KWC_WAZA1,      // わざ１        12
	KWC_WAZA2,      // わざ２        13
	KWC_NOW,        // ナウいことば  14
	KWC_POKEMON2,   // ポケモン２    15

	KWC_MAX,
};
#define KWC_BEGIN   (KWC_POKEMON)
#define KWC_BORDER  (KWC_EVENT)     // 隠しカテゴリの開始位置
#define KWC_HIDDEN_CNT  (KWC_MAX-KWC_BORDER)

/*============================================*/
/*	マクロ・定数                              */
/*============================================*/
#define CODE_TO_CATEGORY(code)  (((code)>>9)&0x7f)
#define CODE_TO_WORD(code)      ((code)&0x1ff)
#define MAKE_CODE(c,w)          ((((c)&0x7f)<<9)|((w)&0x1ff))

#endif /* #ifndef _KAIWA_WORD_H_ */

