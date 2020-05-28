
#ifndef __POKELIST_H__
#define __POKELIST_H__


#include "task.h"
#include "param.h"
#include "menu.h"

//----------------------------------------------------------
//	とりあえず	※
//----------------------------------------------------------
#define STOCK_POKE_MAX		TEMOTI_POKEMAX	//手持ちポケモン最大数

//----------------------------------------------------------
//	フォントBG設定
//----------------------------------------------------------
#define LIST8x8_CGX_BLK		1

//----------------------------------------------------------
//	メニュー関連定数
//----------------------------------------------------------
#define MENU_END_X		(240/8)
#define MENU_END_Y		(160/8)

//----------------------------------------------------------
//	構造体宣言
//----------------------------------------------------------
typedef struct{
	u8 menu_max;
	u8 x_len;				//X方向へのﾒｯｾｰｼﾞ長
	const u8 *menu_list;
}MenuListData;

//----------------------------------------------------------
//	外部変数宣言
//----------------------------------------------------------
extern u8 ListStatus;	//ﾎﾟｹﾓﾝﾘｽﾄがどの処理を行って終了したか返す
extern u8 ListBuffer;	//ﾎﾟｹﾓﾝﾘｽﾄの戻り値が入る
extern u8 ListMsgStatus;	//0:ﾒｯｾｰｼﾞ表示中ではない　　1:ﾒｯｾｰｼﾞ表示中

// アイテム使用処理 2002/02/18 by nakahiro
// id = ﾒｲﾝﾀｽｸのID  itemno = ｱｲﾃﾑ番号  ReturnAdrs = 戻り先のｱﾄﾞﾚｽ
extern void (*PokeListItemUseFunc)( u8 id, u16 itemno, pTaskFunc ReturnAdrs );

//----------------------------------------------------------
//	外部関数宣言
//----------------------------------------------------------

//----------------------------------------------------------
//	新規
//----------------------------------------------------------
extern void PokeListGaugeSetAll(void);
extern void PokeNamePutAll(void);
extern void PokeLvPutAll(void);
extern void PokeHpPutAll(void);
extern void PokeMaxHpPutAll(void);
extern u8	PokeListBgSet(u8);
extern u8	PokeCursorSet2(u8,u8);
extern u16	PokeCursorSys(u8 taskno);
extern u16	PokeCursorSys2(u8 taskno);
extern void PokeNowCursorMove2(u8 taskno, s8 move);
extern void PokeNowCursorMove3( u8 taskno, s8 move );
extern void PokeSelectPosJumpKettei( u8 taskno );
extern void PokemonSortInit(u8 taskno);
extern void PokeListWinFixMsgPut2( u8 msg_no, u8 flg );		// 2002/04/10 by nakahiro
extern void PokeListWinClear2(void);		// 2002/04/19 by nakahiro
extern void PokeCursorPosSet(u8 taskno, u8 pos);
extern u8	GetNowCursorPos(u8 taskno);
extern u8	PokeListScrMsgSet(const u8 msg[], u8);
extern void I_MSG_Deployment(u8 id, u32 type);
extern void ItemIconStatusSet(u8 id, u8 pokepos);
extern void ListPokeAddItem(u8 id, u16 itemno, pTaskFunc returnAdrs);
extern void ListPokeAddMailBox(u8 id, pTaskFunc returnAdrs);
extern void ListPokeDecItem(u8 id, pTaskFunc returnAdrs);
extern u8	PokeAddItem(PokemonParam *pp, u16 itemno);
extern void ListPokeDecMail(u8 id, pTaskFunc returnAdrs);
extern void PokeListMenuWinClear(u8 menu_type, const MenuListData *pmd);
extern void PokeListMenuWindowPut(u8, const MenuListData *, const MENU_ITEM *, u8);
extern pTaskFunc ListMenuCall(u8, const MenuListData *pmd, const MENU_ITEM *mi, u8 pos);
extern void ListPokeWazaSet(u8 id, u16 wazano, pTaskFunc returnAdrs);
extern void CubeItemUse(u8 id, u16 itemno, pTaskFunc returnAdrs);			// 02/01/09 by nakahiro
extern void ListPokeNamePut(u8 pos, PokemonParam *pp);
extern void ListPokeLvPut(u8 pos, PokemonParam *pp);
extern void ListPokeHpPut(u8 pos, PokemonParam *pp);
extern void ListPokeMaxHpPut(u8 pos, PokemonParam *pp);
extern void ListGaugeScreenSet(u8 pos, PokemonParam *pp);
extern void PataChrActorSet(u8 taskno, u8 , PokemonParam *pp);

extern void ListPokeNamePutParam( u8 pos, u8 type, u8 * name );
extern void ListPokeLvPutParam( u8 pos, u8 type, u8 lv );
extern void ListPokeHpPutParam( u8 pos, u8 type, u16 hp );
extern void ListPokeMaxHpPutParam( u8 pos, u8 type, u16 mhp );
extern void ListGaugeScreenSetParam( u8 pos, u8 type, u16 hp, u16 mhp );
extern void PataChrActorSetParam( u8 taskno, u8 pos, u8 type, MultiPokeListData * mpld );

extern void ItemIconActSetParam( u8 id, u8 pos, u16 item );
extern void PokeConditionPutCardMoji( u8 pos, u8 type, u8 condition );

extern void ListPokeNamePut2( u8 pos, u8 type, PokemonParam * pp );
extern void ListPokeLvPut2( u8 pos, u8 type, PokemonParam * pp);
extern void ListPokeHpPut2( u8 pos, u8 type, PokemonParam * pp );
extern void ListPokeMaxHpPut2( u8 pos, u8 type, PokemonParam * pp );
extern void ListGaugeScreenSet2( u8 pos, u8 type, PokemonParam * pp );
extern void PataChrActorSet2( u8 taskno, u8 pos, u8 type, PokemonParam * pp );

extern void ItemIconActorSet(u8 id);
extern void ItmeIconCellPalSet(void);
extern void SwapPokemon(PokemonParam *pPoke1, PokemonParam *pPoke2);
extern void ListPokeItemUse(u8 id, u16 itemno, pTaskFunc returnAdrs);
extern u16	GetWazaNoItem(u16 itemno);
extern u8	TemotiNijyuuCheck( PokemonParam * pp, u16 wazano );
extern void PPRecoverInit( u8 id, u16 itemno, pTaskFunc returnAdrs );		// 02/02/14 by nakahiro
extern void WazaPointUpInit( u8 id, u16 itemno, pTaskFunc returnAdrs );		// 02/02/15 by nakahiro
extern void PokeListLvUpInit( u8 id, u16 itemno, pTaskFunc returnAdrs );	// 02/02/20 by nakahiro
extern void PokeListEvolutionInit( u8 id, u16 item, pTaskFunc returnAdrs );	// 02/04/24 by nakahiro
extern void SetMotasetaMsg( u8 poke, u16 item, u8 clear );
extern u8	DelWazaHidenCheck( u16 waza );

extern u8	SetStatusRecover( u8 cur, u16 item, u8 menu );		// 02/02/21 by nakahiro
extern void PataChrActorSetAll(u8 taskno);

extern u8	PokeListBGCardInit2(u8);
extern void ScrollInPokeListBGCardInit(void);

extern void ListCardMojiAll(u8);
extern void ListCardMoji( u8, u8 );
extern void ListCardSexPut(void);
extern void DrawBG2KETTEI(u8);
extern void DrawBG2MODORU(u8);

extern void StHpAreaClear( u8 pos );

extern u8	MultiCheck(void);

extern void ScrollInPokeListCardMove( u8 id, u16 mons1, u16 mons2 );
extern void SetPokeIconScroll( u8 id, u16 monsno, u8 no );
extern void ScrollInActXPosPlus( u8 id, u8 pos );

extern void PokeCardChangeInit( u8 id );

extern void PokeListSexPut( u8 pos, u8 type, PokemonParam * pp );
extern void PokeListSexPutParam( u16 mons, u8 sex, u8 type, u8 pos, u8 * name );

//----------------------------------------------------------
//	ポケモンのニックネームセット
//	戻り値　EOM_アドレス
//----------------------------------------------------------
extern u8 * PokeNickNameSet( PokemonParam * pp, u8 * str );


//----------------------------------------------------------
//	定数
//----------------------------------------------------------
//ListStatusに入るﾎﾟｹﾓﾝﾘｽﾄの戻り値
enum{
	P_NORMAL,	//特に何もされなかった
	P_CHANGE,	//ﾎﾟｹﾓﾝ入れ替えを行った(戦闘)
};

#define LISTGAUGE_TRANS_ADDR	( (void*)CHAR_BASE1_ADDR + 32 * 256 )
#define LISTGAUGE_CHARSUU		12
#define LISTGAUGE_TOPCHRNO		256

#define	LIST_MOJI_TRANS_ADDR	( LISTGAUGE_TRANS_ADDR + LISTGAUGE_CHARSUU * 0x20 )
#define	LIST_MOJI_TOPCHARNO		( LISTGAUGE_TOPCHRNO + LISTGAUGE_CHARSUU )
#define	LIST_MOJI_CHARSUU		0x46

#define	LIST_CONDITION_TRANS_ADDR	( LIST_MOJI_TRANS_ADDR + LIST_MOJI_CHARSUU * 0x20 )
#define	LIST_CONDITION_TOPCHARNO	( LIST_MOJI_TOPCHARNO + LIST_MOJI_CHARSUU )
#define	LIST_CONDITION_CHARSUU		0x1b


#define POKELIST_FONT_START	SYS_FONT_SIZ	//ﾌｫﾝﾄｷｬﾗ転送開始位置

#define POKEPATA_PRI		5
#define ITEMICON_PRI		4	//ﾊﾟﾀｷｬﾗよりもﾌﾟﾗｲｵﾘﾃｨを高く

// OBJｶｰｿﾙ
#define POKE_CURSOR_POS_X1	8
#define POKE_CURSOR_POS_Y1	52
#define POKE_CURSOR_POS_X2	92
#define POKE_CURSOR_POS_Y2	12
#define POKE_CURSOR_INTERVAL_OBJ	24

//ｶｰｿﾙ
#define CURSOR_PRI1			7				//ﾒｲﾝｶｰｿﾙ
#define CURSOR_PRI2			(CURSOR_PRI1+1)	//ｻﾌﾞｶｰｿﾙ
#define SUB_CURSOR_DX		(-2)
#define SUB_CURSOR_DY		4


//-- ｱｲﾃﾑｱｲｺﾝのﾊﾟﾀｷｬﾗを基準としたｵﾌｾｯﾄ --//
#define ITEMICON_OFFSET_X	(4)
#define ITEMICON_OFFSET_Y	(10)


// スクロールメッセージウィンドウ座標
#define	SCR_MSG_WINSX	3
#define	SCR_MSG_WINSY	14
#define	SCR_MSG_WINEX	26
#define	SCR_MSG_WINEY	19



//=========================================================================
//	画面下のウィンドウ内、定型メッセージ文 ナンバー
//=========================================================================
enum{
	ERANDE_MSG,
	DOKONI_IDOU_MSG,
	OSIEMASUKA_MSG,
	TUKAIMASUKA_MSG,
	MOTASEMASUKA_MSG,
	DOUSIMASUKA_MSG,		//2001/07/17 by nakahiro
	IAIGIRIERROR_MSG,		//2001/08/01 by nakahiro
	NAMINORIERROR_MSG,		//2001/10/02 by nakahiro
	NAMINORIERROR2_MSG,
	WAZAERROR_MSG,			//2002/02/08 by nakahiro
	WAZARECOVER_MSG,		//2002/02/14 by nakahiro
	WAZAPOINTUP_MSG,		//2002/02/15 by nakahiro
	KUUHAKU_MSG,			//空白
	MOTIMONO_MSG,

	TAISEN_INAI_MSG,
	AZUKERU_POKE_MSG,

	TAIRYOKUNAI_MSG,

	POKE_3_INAI_MSG,
	ONAZI_POKE_MSG,
	ONAJI_ITEM_MSG,

	OBOESASEMASUKA_MSG,

	MSG_NOT_PUT = 0xff,		// 表示しない
};


//=========================================================================
//	カードの上に表示する文字指定
//=========================================================================
#define	CARD_MSG_LEN		7						// 文字列の長さ
#define	CARD_MSG_CHAR		( CARD_MSG_LEN * 2 )	// 文字列のキャラ数

#define	CARD_TUKAENAI		0
#define	CARD_SANKASINAI		( CARD_MSG_LEN * 2 )
#define	CARD_ITIBANME		( CARD_MSG_LEN * 4 )
#define	CARD_NIBANME		( CARD_MSG_LEN * 6 )
#define	CARD_SANBANME		( CARD_MSG_LEN * 8 )
#define	CARD_HUMEI			( CARD_MSG_LEN * 10 )
#define	CARD_OSU			( CARD_MSG_LEN * 12 )
#define	CARD_MESU			( CARD_MSG_LEN * 14 )
#define CARD_DERAREMASU		( CARD_MSG_LEN * 16 )
#define	CARD_DERAREMASEN	( CARD_MSG_LEN * 18 )
#define	CARD_OBOERARERU		( CARD_MSG_LEN * 20 )
#define	CARD_OBOERARENAI	( CARD_MSG_LEN * 22 )
#define	CARD_OBOETERU		( CARD_MSG_LEN * 24 )


//=========================================================================
//	ウィンドウステータス ナンバー
//=========================================================================
enum{	//LS = ﾘｽﾄｽﾃｰﾀｽ
	LS_BATTLE,
	LS_HINSI,
	LS_EGG,
};

//=========================================================================
//	ポケモンリストタイプ　※戦闘用
//=========================================================================
enum{
	PLT_NORMAL,					//ノーマル
	PLT_B_USELESS,				//Bキャンセル禁止
	PLT_NOT_CHANGE,				//入れ替え禁止
	PLT_ITEM,					//ｱｲﾃﾑ使用
	PLT_NOT_CHANGE_TOKUSEI,		//特性による入れ替え禁止
};

//=========================================================================
//	タスク、ワーク番号割り振り
//=========================================================================
//--- メイン -----
#define M_PATA_ACTNO0_1		0	//ﾊﾟﾀｷｬﾗのｱｸﾄNo(上位8ﾋﾞｯﾄ0番目、下位8ﾋﾞｯﾄ1番目)
#define M_PATA_ACTNO2_3		1	//ﾊﾟﾀｷｬﾗのｱｸﾄNo(上位8ﾋﾞｯﾄ2番目、下位8ﾋﾞｯﾄ3番目)
#define M_PATA_ACTNO4_5		2
#define M_CURSOR			3	//上位8ﾋﾞｯﾄｶｰｿﾙのactno 下位8ﾋﾞｯﾄ未定
#define M_MENUTYPE			4	//ﾒﾆｭｰﾘｽﾄのﾀｲﾌﾟ
#define M_MENUTYPE_TEMP		5	//ﾒﾆｭｰﾘｽﾄのﾀｲﾌﾟ退避ﾜｰｸ

//--- ソート -----
#define S_BACK_TASKNO		0	//ﾒｲﾝﾀｽｸのﾀｽｸNo保存
#define S_CURSOR1		1	//1つめのｶｰｿﾙのactno
#define S_CURSOR2		2	//2つめのｶｰｿﾙのactno
// ※ NES_SORTｴﾌｪｸﾄ時のみ必要
#define S_ST_END_Y0		3	//上位ｳｨﾝﾄﾞｳ0ｽﾀｰﾄY座標 下位ｴﾝﾄﾞY座標
#define S_ST_END_Y1		4	//上位ｳｨﾝﾄﾞｳ1ｽﾀｰﾄY座標 下位ｴﾝﾄﾞY座標
#define S_WIN0_OFFSET	5	//
#define S_WIN1_OFFSET	6	

//-- ﾎﾟｹﾓﾝにｱｲﾃﾑを持たせる(技ﾏｼﾝと共用)ときのﾀｽｸ --//
#define I_TEMP0			10
#define I_TEMP1			11
#define I_TEMP2			12
#define I_TEMP3			13
#define I_TEMP4			14
#define I_TEMP5			15

//=========================================================================
//	アクター、ワーク番号割り振り
//=========================================================================
//--- ｶｰｿﾙのｱｸﾀｰ ---
#define C_POS			0	//現在のｶｰｿﾙ位置
#define C_OLDPOS		1	//下位8ﾋﾞｯﾄ:ｶｰｿﾙが左側にある時は最後に右側にあった
							//ｶｰｿﾙの場所、ｶｰｿﾙが右側にある時は最後に左側にあったｶｰｿﾙの場所

//=========================================================================
//	初期化関連
//=========================================================================
// 初期化ID
enum {
	FIELD_POKELIST_ID = 0,	// フィールド
	BATTLE_POKELIST_ID,		// バトル
	CONTEST_POKELIST_ID,	// コンテスト
	NAME_POKELIST_ID,		// 姓名判断
	MULTI_POKELIST_ID,		// マルチバトル参加選択
	SCROLL_POKELIST_ID,		// マルチバトル前
	GROW_POKELIST_ID,		// 育て屋
	MANIA_POKELIST_ID,		// 技教えマニア
};

// ポケモンリストレイアウト指定
enum {
	SINGLE_LIST = 0,		// 1vs1 レイアウト
	DOUBLE_LIST,			// 2vs2 レイアウト

	DEFAULT_LIST = 0xff,	// レイアウト変更なし
};

// ポケモンリスト呼び出し
extern void PokeListCallParamSet( u8, u8, void *, u8 );	// 初期化パラメータセット
extern void PokeListCallEx( u8, u8, void *, u8 );		// タスク、メッセージ指定
extern void PokeListCall( u8, u8 );						// ノーマル

extern u8	PokeListInitMain(void);		// 初期化メイン処理
extern void PokeListMain(void);			// メイン処理

extern void PokeListEnd_ContinueScript(u8);	// ポケモンリスト終了 -> フィールド復帰 -> スクリプト復帰


//=========================================================================
//	カーソル位置
//=========================================================================
enum {
	PL_POS_POKE0 = 0,
	PL_POS_POKE1,
	PL_POS_POKE2,
	PL_POS_POKE3,
	PL_POS_POKE4,
	PL_POS_POKE5,
	PL_POS_KETTEI,		// 決定
	PL_POS_MODORU,		// もどる
};

//=========================================================================
//	アイテム効果チェック
//=========================================================================
extern u8 ItemRecoverCheck( u16 item );

enum {
	ITEM_TYPE_BTL_ST_UP = 0,	// 戦闘用ステータスアップ系
	ITEM_TYPE_LV_UP,			// LvUp系
	ITEM_TYPE_HP_RCV,			// HP回復
	ITEM_TYPE_DOKU_RCV,			// 毒回復
	ITEM_TYPE_NEMURI_RCV,		// 眠り回復
	ITEM_TYPE_YAKEDO_RCV,		// 火傷回復
	ITEM_TYPE_KOORI_RCV,		// 氷回復
	ITEM_TYPE_MAHI_RCV,			// 麻痺回復
	ITEM_TYPE_KONRAN_RCV,		// 混乱回復
	ITEM_TYPE_MEROMERO_RCV,		// メロメロ回復
	ITEM_TYPE_ALLDETH_RCV,		// 全員瀕死回復
	ITEM_TYPE_ALL_ST_RCV,		// ステータス異常全快
	ITEM_TYPE_ATC_UP,			// ドーピングアイテム 攻撃努力値UP
	ITEM_TYPE_HP_UP,			// ドーピングアイテム HP努力値UP
	ITEM_TYPE_SPA_UP,			// ドーピングアイテム 特攻努力値UP
	ITEM_TYPE_SPD_UP,			// ドーピングアイテム 特防努力値UP
	ITEM_TYPE_AGL_UP,			// ドーピングアイテム 素早さ努力値UP
	ITEM_TYPE_DEF_UP,			// ドーピングアイテム 防御努力値UP
	ITEM_TYPE_EVO,				// 進化アイテム
	ITEM_TYPE_PP_UP,			// PPUp
	ITEM_TYPE_PP_3UP,			// PP3Up
	ITEM_TYPE_PP_RCV,			// PP回復

	ITEM_TYPE_ETC,				// その他
};


//=========================================================================
//	ポケモンリスト　ワーク（ユーザーワーク使用）
//=========================================================================
// メイン処理用
typedef struct {
	PokemonParam	TempParam[6];	// ListRow用展開場所（汎用）100h x 6 = 600h

	// 初期設定用
	u8	init_id;			// 初期化ID
	u8	init_msg;			// 初期メッセージ
	void (*MainTask)(u8);	// メインタスク
	u8	task_id;			// メインタスクのID

	// 処理用
	u8	card_flg;	// カード転送フラグ
	u8	menu_flg;	// 初期化時にメニューを開くか（フィールド以外はカーソル位置）
					// ↓フィールドでの番号
					// 0 = 開かない
					// 1 = つよさをみる
					// 2 = つかえるわざ
					// 3 = もちもの
					// 4 = メール

	u8	btl_tower;	// バトルタワー用のフラグ

	s16	work[16];	// 汎用ワーク
}POKELIST;

// アイテム使用用
typedef struct {
	PokemonParam * pp;		// カーソル位置のポケモンデータ

	u8	main_id;			// メインタスクのID
	u8	cursor;				// 選択されたポケモンの位置
	u16	item;				// アイテム番号
	u16	new_waza;			// 新規に覚える技

	s32	gauge_work;			// HPゲージ用ワーク

	pTaskFunc	returnAdrs;	// 戻り先タスクアドレス
	pTaskFunc	SubReturn;	// HP回復などの戻り先タスクアドレス
}POKE_ITEM_USE;

// 複数のポケモン選択用
typedef struct {
	u8	main_id;	// メインタスクのID
	u8	cur[2];		// カーソルのアクター番号
	u8	act[2];		// アイコンのアクター番号
	u8	move[2];	// 移動している場所
	s16	m_cnt[2];	// 移動カウンター

	void (*UseTask)(u8);	// ポケモン切り替え時のタスクを保存

}POKE_CARD;


#define P_LIST	( (POKELIST *)&UserWork[ 0x1b000 ] )
#define P_ITEM	( (POKE_ITEM_USE *)&UserWork[ 0x1c000 ] )
#define	P_CARD	( (POKE_CARD *)&UserWork[ 0x1000 ] )


#endif //__POKELIST_H__
