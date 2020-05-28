//=========================================================================================
//										秘密基地
//												2001/10/04 by nakahiro
//=========================================================================================
#ifndef	__BASE_H__
#define __BASE_H__


#include "sxy.h"
#include "ev_check.h"	/* EV_POS定義参照のため */

extern void ChangeBaseCell(const SXY_DATA *);			// マップ切り替え時の基地確認
extern void SetBaseGoods(u8);							// グッズを配置する
extern void BaseOut(void);								// 基地を出てマップへ復帰
extern u8 * MakeBaseName(u8 *);							// 基地の名前作成
extern void BaseDoorIn( EV_POS *, const SXY_DATA *);	// 十字キーで基地の中へ
extern void GetBaseNo(EV_POS *,const SXY_DATA *);		// 基地番号取得
extern void OrusubanBattle(void);						// お留守番キャラ対戦
extern u8	TalkBaseDoorCheck(void);					// 話しかけの確認
extern void MyBaseCheck(void);							// 自分の基地のありなしチェック
extern u8	GetNameEndPos(u8 *);						// 基地の名前データの最後尾を取得

extern void SetDummyOrusubanData(u8);			// ダミーお留守番キャラセット

// 基地の入り口セル
typedef struct{
	const u16	before;	// 元のセル
	const u16	after;	// 作成後のセル
}BaseExit;


#endif /*__BASE_H__*/
