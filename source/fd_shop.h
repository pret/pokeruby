/* ショップで使用するワークをまとめたもの */
typedef struct{
	pFunc EndFunc;		// 終了時に呼ばれるルーチンを格納
	u16 const * item;	// 売り物データ
	u8	max;			// 品数
	u8	pos;
	u8	pos_max;
	u8	scr;
	u8	type;			// ショップタイプ
	u8	buy_max;		// 買える最大数


}SHOP_WORK;

enum {
	FRIEND_SHOP = 0,	// フレンドリィショップ
	GOODS_SHOP,			// グッズショップ
	FLOWER_SHOP,		// フラワーショップ
};

extern void ShopRecycleEnd(u8);
extern void ShopNoGoods(u8);
