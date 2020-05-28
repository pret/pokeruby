
//=========================================================================
//	
//=========================================================================

#ifndef F_PMLIST_H
#define F_PMLIST_H
#undef GLOBAL
#ifdef F_PMLIST_H_GLOBAL
#define GLOBAL /*	*/
#else
#define GLOBAL extern
#endif

//=========================================================================
//	定義
//=========================================================================
//#define name value

//typedef ...

#define MENUPOKE_BG_NUMBER	2
#define MENUPOKE_CGX_BLK	2
#define MENUPOKE_SCRN_BLK	15

// 道具の種類
enum {
	DUMMY_ITEM = 0,		// ダミー
	SKILL_ITEM,			// 技マシン
	EVO_ITEM,			// 進化アイテム
};

// アイテム使用処理の種類
enum {
	PM_ITEM_USE_MODE = 0,			// つかう
	PM_ITEM_PUT_MODE,				// もたせる
	PM_ITEM_CUBE_USE_MODE,			// キューブをつかう
	PM_ITEM_MAIL_BOX_MODE,			// メールボックスからメールをもたせる
	PM_ITEM_USE_ALLDETH_RCV_MODE,	// 全員瀕死回復アイテム使用
};

//=========================================================================
//	変数
//=========================================================================
//GLOBAL type valiable;
extern u8	FPokeNo;	//選択されたポケモン


//=========================================================================
//	関数プロトタイプ
//=========================================================================
//GLOBAL type function(arg...);
extern void ReturnFldPokeSora(void);	//「そらをとぶ」キャンセル・ポケモンリストに復帰
extern u16 GetHidenMonsNo(void);		// ポケモンナンバーを返す



#undef GLOBAL
#endif	/*F_PMLIST_H*/

