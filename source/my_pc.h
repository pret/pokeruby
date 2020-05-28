//========================================================================================
//									自分のパソコン処理
//								　2002/06/25 by nakahiro
//========================================================================================
#ifndef	_MY_PC_H
#define _MY_PC_H


typedef struct {

	u8	pos;		// 選択位置
	u8	pos_max;	// 選択カーソル最大値
	u8	scr;		// スクロールカウンター
	u8	max;		// アイテム個数

	u8	type;		// 道具預かりのメニュータイプ
	u8	cng_pos;	// 交換位置
	u8	cng_flg;	// 交換用フラグ

	u16	num;		// 個数

}MYPC_DATA;

#define	MYPC_SYS	( (MYPC_DATA *)&UserWork[ 0x1fe00] )


extern void MyPC_ReturnMenu( u8 id );		// メニュー選択へ戻る
extern void MyPC_ItemPutReturn(void);		// バッグから復帰
extern void MyPC_DefItemSet(void);			// デフォルトアイテムセット
extern void MyPC_MailPokeSetReturn(void);	// ポケモンリストからの戻り先


#endif	// _MY_PC_H
