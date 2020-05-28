/***********************************************************************
**	簡易会話入力（外部）
**
**	masao taya
***********************************************************************/
#ifndef _KAIWA_H_
#define _KAIWA_H_

#include "kaiwa_mode.h"



/*=======================================================*/
/* 入力画面初期化関数                                    */
/*                                                       */
/*   mode  ... 入力モード（kaiwa_mode.h）                */
/*   addr  ... 会話コード格納アドレス                    */
/*   ret_func  ... 画面復帰関数                          */
/*   interviewer ... インタビュアータイプ（kaiwa_mode.h）*/
/*                                                       */
/*   ※ addr に格納されているデータを初期状態に反映する  */
/*                                                       */
/*=======================================================*/
void KaiwaInputBegin(u8 mode, u16 *addr, pFunc ret_func, u8 interviewer);


/*=======================================================*/
/* 会話コード→文字列変換関数                            */
/*=======================================================*/
u8 *KaiwaCopyWord(u8 *buf, u16 code);
u8 *KaiwaCopySentence(u8 *buf, u16 *code, u16 x, u16 y);
u16 KaiwaWordLenGet(u16 code);
u8 KaiwaLineOverCheck(const u16 *code, u8 rows, u8 cols, u16 max);

/*=======================================================*/
/* ＴＶ用ワーク初期化関数                                */
/*=======================================================*/
void KaiwaTVWorkInit(u8 mode, u16 num);
void KaiwaWorkInit(u16 *work, u16 size);

/*=======================================================*/
/* ナウイことば関連                                      */
/*=======================================================*/
u8 NowWordFlagCheck(u8 word_no);
void NowWordFlagSet(u8 word_no);
u16 NowWordGetUnknown(void);
u8 KnownNowWordCnt(void);
u16 NowWordGetKnown(void);

/*=======================================================*/
/* 指定カテゴリ内からランダムに単語１つ選ぶ              */
/*=======================================================*/
u16 KaiwaGetRandomWord(u16 category); 
u16 KaiwaGetRandomKnownWord(u16 category);

/*=======================================================*/
/* 指定カテゴリ内の有効な単語数を返す                    */
/*=======================================================*/
u16 KaiwaEnableWordCnt(u8 category);

#endif /* #ifndef _KAIWA_H_ */
