//==========================================================
//					アイテムデータ
//							2001/08/27	by nakahiro
//==========================================================

#include "common.h"
//#include "print.h"
#include "screen.h"		// dmy_BG 参照のため

// アイテム画面用ダミーＢＧ定義
#define BG1_data	(dmy_BG[1])
#define BG2_data	(dmy_BG[2])
#define BG3_data	(dmy_BG[3])

//アイテムデータ
// item.h に移動

//手持ちアイテムデータ
// ※gamedata.h のMINEITEMを参照

//アイテムリスト
typedef struct {

	u8	max;		//コマンド数
	const u8 *com;	//コマンド

}ITEMLIST;

//ポケットデータ
typedef struct {

	MINEITEM	*item;	//アイテムデータ
	const u8	max;	//最大数

}POCKET;

// バッグ用カウンタ
typedef struct {
	u8	pos;		// アイテム選択カーソルポイント
	u8	scr;		// スクロールカウンター
	u8	item_max;	// 所持アイテム種類数
	u8	pos_max;	// カーソルポイント最大数
}BAG_STATUS;

extern void ItemBGBoxWrite(u16 *,u8,u8,u8,u8,u16);	//BGを指定のキャラで塗りつぶす

extern void EndBagItemError(u8);	//エラー後の復帰処理（バッグ）
extern void EndFldItemError(u8);	//エラー後の復帰処理（フィールド）

