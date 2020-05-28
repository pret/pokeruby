//========================================================================================
//									秘密基地エフェクト
//									2002/06/04 by nakahiro
//========================================================================================
#ifndef __FE_BASE_H__
#define __FE_BASE_H__

// セルコード
#define	GOODS_DUMMY			522		// 床
#define	GOODS_DUMMY2		514		// 壁
#define	GOODS_FUSEN1		824		// 赤水風船
#define	GOODS_FUSEN1_B		827		// 赤水風船・壊
#define	GOODS_FUSEN2		828		// 青水風船
#define	GOODS_FUSEN2_B		831		// 青水風船・壊
#define	GOODS_FUSEN3		832		// 黄水風船
#define	GOODS_FUSEN3_B		835		// 黄水風船・壊
#define	GOODS_DORO			552		// 泥団子
#define	GOODS_DORO_B		555		// 泥団子・壊
#define	GOODS_SAND_WALL		646		// 壁


// プロトタイプ宣言
extern void SetBreakGoodsEffect( s16 cell, s16 px, s16 py );	// 水風船・泥団子
extern void BaseBreakDoor( s16 x, s16 y );						// 突き破りドア
extern void BaseSoundMat( s16 code );							// 音マット
extern void BaseKiraKiraMat(void);								// きらきらマット


#endif	/* __FE_BASE_H__ */
