//=========================================================================================
//									リサイクルおやじ
//								2002/02/18 by nakahiro
//=========================================================================================
#ifndef __OYAJI03_H__
#define __OYAJI03_H__


#define	RECYCLE_OYAJI_MAX	4
#define	RECYCLE_OYAJI_NAME	11		// 名前のサイズは7+1だけどとりあえず・・・

typedef struct {
	u8	type;
	u8	goods[ RECYCLE_OYAJI_MAX ];
	u8	name[ RECYCLE_OYAJI_NAME * RECYCLE_OYAJI_MAX ];
	u8	flg;
}OYAJIDATA_RECYCLE;

extern void RecycleBoxIn(u8);			// リサイクルボックスへグッズを入れる
extern void InitRecycleWinSelect(void);	// リサイクルグッズ選択職設定
extern void ResetRGGiveFlag(void);		// グッズをあげたフラグ初期化

extern void TradeOyajiMyGoodsSet( u8 id );		// 交換するグッズを選んだ
extern void TradeOyajiMyGoodsCancel( u8 id );	// 交換するグッズを選ばなかった


#endif //__OYAJI03_H__
