/********************************************************************/
/*	１つの関数内で行っていたセルマネージャのビット操作を、マクロ化	*/
/*	するためのヘッダ                          				taya	*/
/********************************************************************/
#ifndef _CELL_BITCHK_H_
#define _CELL_BITCHK_H_

#define TRANS_BIT_MACRO_ENABLE  (1)

#if TRANS_BIT_MACRO_ENABLE  // マクロを使う -------------------

extern u8 TransAreaFlag[128];

#define TRANS_BIT_CLEAR(num)  (TransAreaFlag[((num)>>3)] &= ((1<<((num)&7))^0xff))
#define TRANS_BIT_SET(num)    (TransAreaFlag[((num)>>3)] |= (1<<((num)&7)))
#define TRANS_BIT_CHECK(num)  (TransAreaFlag[((num)>>3)] & (1<<((num)&7)))

#else //---------------------- 関数を使う ---------------------

extern u8 TransBitChkSet(u16 num,u8 mode);

#define TRANS_BIT_CLEAR(num)  TransBitChkSet((num), 0)
#define TRANS_BIT_SET(num)    TransBitChkSet((num), 1)
#define TRANS_BIT_CHECK(num)  TransBitChkSet((num), 2)

#endif

#endif /* #ifndef _CELL_BITCHK_H_ */
