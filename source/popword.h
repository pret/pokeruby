/***********************************************************************
**	流行語データ（関数宣言など）
***********************************************************************/
#ifndef _POPWORD_H_
#define _POPWORD_H_

#include "popword_data.h"

/*==============================================
== 定数
==============================================*/
// ソートタイプ（PopWord_Sort() で使用）
enum POPWORD_SORT_TYPE {
	POPSORT_NOWPOWER,
	POPSORT_MAXPOWER,
	POPSORT_MIXER,
};

/*==============================================
== 外部関数宣言
==============================================*/
void PopWord_Init(void);
void PopWord_Update(u16 days);
void PopWord_Sort(PopularWord *word, u16 max, u8 type);
u8   PopWord_Add(u16 *word);
void PopWord_SetBuffer(void);
void PopWordMixer(void *adrs, u32 size, u8 id);

#endif /* #ifndef _POPWORD_H_ */
