#ifndef __P_STATUS_H__
#define __P_STATUS_H__


//=========================================================================
//	グローバル変数
//=========================================================================
extern u8 PokeStatusBuf;	//ｽﾃｰﾀｽ画面を閉じたときに最後に何番目を見ていたかが入る


//=========================================================================
//	データ
//=========================================================================

//=========================================================================
//	マクロ関数
//=========================================================================

//----------------------------------------------------------
//	16bit型のwork[0]とwork[+1]に*adrsをｾｯﾄする
//----------------------------------------------------------
#define SetWork_Adrs(pWork, pAdrs)				\
{												\
	((u16*)pWork)[0] = (u16)((u32)pAdrs);		\
	((u16*)pWork)[1] = (u16)((u32)pAdrs >> 16);	\
}
//----------------------------------------------------------
//	*adrsにwork[0],[1]に入っているｱﾄﾞﾚｽをｾｯﾄする(workは16ﾋﾞｯﾄ型)
//----------------------------------------------------------
#define SetAdrs_Work(pWork, pAdrs) 				\
	pAdrs = (void*)((0xffff & ((u16*)pWork)[0]) | (((u16*)pWork)[1] << 16))


//=========================================================================
//	定数定義
//=========================================================================
#define ST_POKE_X	40		//ﾎﾟｹﾓﾝ座標
#define ST_POKE_Y	64
#define ST_POKE_PRI	5		//ｱｸﾀｰﾌﾟﾗｲｵﾘﾃｨ

//-- adrs_typeのフラグ add 2001.08.02(木) --//
#define PP_TYPE		0		//PokemonParam型
#define PSP_TYPE	1		//PokemonPasoParam型

enum{
	LIST_ST = 0,	// ポケモンリスト"つよさをみる"
	LIST_WAZA,		// ポケモンリスト"つかえるわざ"

	NEW_WAZA,		// 技を覚える
	DEL_WAZA,		// 技忘れじいさん
	BTL_WAZA,		// 戦闘"つかえるわざ"

	BOX_ST,			// ボックス"つよさをみる"
	BOX_WAZA,		// ボックス"つかえるわざ"
};

// コンディション
enum {
	ST_NORMAL = 0,	// 正常
	ST_POISON,		// 毒
	ST_PARALYSIS,	// 麻痺
	ST_SLEEP,		// 眠り
	ST_ICE,			// 氷
	ST_BURN,		// 火傷
	ST_POKERUS,		// ポケルス
	ST_HINSI,		// 瀕死
};

//----------------------------------------------------------
//	定型メッセージ座標
//----------------------------------------------------------

//	強さを見る左　-------------------------------
#define ST_MONSNO_X				1
#define ST_MONSNO_Y				2
#define ST_LV_X					1
#define ST_LV_Y					12
#define	ST_ZYOUTAI_X			1
#define	ST_ZYOUTAI_Y			17
#define	ST_CONDITION_X			( 6 * 8 + 16 )
#define	ST_CONDITION_Y			( 18 * 8 )
#define ST_NAME02_X				5
#define ST_NAME02_Y				12

//	強さを見る右１　-----------------------------
#define ST_OYA_X				11
#define ST_OYA_Y				4
#define ST_OYANAME_X			14
#define ST_OYANAME_Y			4
#define ST_ID_X					22
#define ST_ID_Y					4
#define ST_TYPE_X				11
#define ST_TYPE_Y				6
#define ST_SP_X					11
#define ST_SP_Y					9
#define ST_MEMO_X				11
#define ST_MEMO_Y				14

//	強さを見る右２　-----------------------------
#define ST_ITEM_X				11
#define ST_ITEM_Y				4
#define ST_RIBBON_X				21
#define ST_RIBBON_Y				4
#define	PARAM_GX				11
#define	PARAM_GY				7
#define	ST_EXP_X				11
#define	ST_EXP_Y				14

//	使える技左　---------------------------------
#define ST_NAME01_X				1
#define ST_NAME01_Y				1
#define	WAZA_PARAM_GX			2
#define	WAZA_PARAM_GY			15

//	使える技右　---------------------------------
#define ST_WAZA_X				15
#define ST_WAZA_Y				4
#define WAZA_INFO_X				11
#define WAZA_INFO_Y				15
#define ST_WAZA_INTERVAL		2

//	コメント　-----------------------------------
#define	ST_COMMENT_LX			1
#define	ST_COMMENT_RX			0x18
#define	ST_COMMENT_Y			0

//	ページ切り替えカーソル　---------------------
#define	ST_PAGE_CURSOR_LX		( 80 + 4 )
#define	ST_PAGE_CURSOR_RX		( 224 + 8 )
#define	ST_PAGE_CURSOR_Y		( 72 + 8 )

//	ポケモン切り替えカーソル　-------------------
#define	ST_POKE_CURSOR_X		( 32 + 8 )
#define	ST_POKE_CURSOR_UY		( 0 + 8 )
#define	ST_POKE_CURSOR_DY		( 128 + 8 )

//	技選択カーソル　-------------------
#define	ST_WAZA_CURSOR_X		10
#define	ST_WAZA_CURSOR_Y		4

//	ボックスマーク　-------------------
#define	ST_MARK_X	60
#define	ST_MARK_Y	26

//	ボール　---------------------------
#define	P_ST_MONS_BALL_X	16
#define	P_ST_MONS_BALL_Y	120


// アクターNo
enum {
	ST_TYPE_1 = 0,		// 属性１ 
	ST_TYPE_2,			// 属性２
	ST_TYPE_3,			// 属性３
	ST_TYPE_4,			// 属性４
	ST_TYPE_5,			// 属性５

	POKE_CURSOR_U,		// ポケモン切り替えカーソル上
	POKE_CURSOR_D,		// ポケモン切り替えカーソル下

	PAGE_CURSOR_L,		// ページ切り替えカーソル左
	PAGE_CURSOR_R,		// ページ切り替えカーソル右

	WAZA_CURSOR_L,		// 技選択カーソル左
	WAZA_CURSOR_N1,		// 技選択カーソル中
	WAZA_CURSOR_N2,		// 技選択カーソル中
	WAZA_CURSOR_N3,		// 技選択カーソル中
	WAZA_CURSOR_N4,		// 技選択カーソル中
	WAZA_CURSOR_N5,		// 技選択カーソル中
	WAZA_CURSOR_N6,		// 技選択カーソル中
	WAZA_CURSOR_N7,		// 技選択カーソル中
	WAZA_CURSOR_N8,		// 技選択カーソル中
	WAZA_CURSOR_R,		// 技選択カーソル右

	WAZA_CURSOR_DL,		// 技選択カーソル左（ダミー）
	WAZA_CURSOR_DN1,	// 技選択カーソル中（ダミー）
	WAZA_CURSOR_DN2,	// 技選択カーソル中（ダミー）
	WAZA_CURSOR_DN3,	// 技選択カーソル中（ダミー）
	WAZA_CURSOR_DN4,	// 技選択カーソル中（ダミー）
	WAZA_CURSOR_DN5,	// 技選択カーソル中（ダミー）
	WAZA_CURSOR_DN6,	// 技選択カーソル中（ダミー）
	WAZA_CURSOR_DN7,	// 技選択カーソル中（ダミー）
	WAZA_CURSOR_DN8,	// 技選択カーソル中（ダミー）
	WAZA_CURSOR_DR,		// 技選択カーソル右（ダミー）

	ST_IZYOU,			// ステータス異常

	ST_ACT_END,
};


//=========================================================================
//	外部関数宣言
//=========================================================================
extern void PokeStatusCall2( void *, u8, u8, pFunc, u8 );
extern void PokeNewWazaSet( void *, u8, u8, pFunc, u16 );
extern u8	GetNewWazaSelectPos(void);
extern u8	GetPokeConditionParam( u32 con );
extern u8	GetPokeCondition( PokemonParam * pp );


//=========================================================================
//	UserWorkにｽﾃｰﾀｽ画面で使用するｼｽﾃﾑﾜｰｸを切る
//=========================================================================
//-- ｼｽﾃﾑ構造体	 ※UserWork上に切るので4ﾊﾞｲﾄ境界はあんまり考えてない --//
typedef struct{

	void * ppArray;		// ﾎﾟｹﾓﾝﾊﾟﾗﾒｰﾀの大元のｱﾄﾞﾚｽ
	pFunc  ReturnAdrs;	// ｽﾃｰﾀｽ画面から抜けたときにｾｯﾄする関数を保存

	u8	type;			// ステータス画面のタイプ（呼ばれた場所）

	u8	put_no;			// 現在何番目のﾎﾟｹﾓﾝを見ているか
	u8	poke_max;		// 何番目までﾎﾟｹﾓﾝのﾃﾞｰﾀがあるか
	u8	page;			// 現在表示しているｽﾃｰﾀｽのﾍﾟｰｼﾞ(仮想ｶｰｿﾙ)
	u8	pokeact;		// 表示してるポケモンのActNo
	u8	ballact;		// 捕まえたボールのActNo
	u8	adrs_type;		// PP_ARRAYのｱﾄﾞﾚｽ種類(PP_TYPE:PokemonParam, PSP_TYPE:PokemonPasoParam)
	u8	id;				// ﾒｲﾝﾀｽｸのﾀｽｸNo
	PokemonParam pp;	// ﾎﾟｹﾓﾝﾊﾟﾗﾒｰﾀｰのﾃﾝﾎﾟﾗﾘ(分割転送用に追加 2002.03.15(金))
	u8	div_count;		// 分割転送用ｶｳﾝﾀ(sys.InitSeqWorkだけでは足りない所で使用)

	u8	page_init;		// 初期ページ番号
	u8	page_max;		// 最終ページ番号
	u8	page_loop;		// ページループ		0 = END, 1 = LOOP

	u8	change_lock;	// ポケモン切り替え許可		0 = change, 1 = lock

	u8	waza_pos;		// 選択中の技の位置
	u8	waza_pos2;		// 入れ替える技
	u8	waza_lock;		// 入れ替え禁止

	u16	new_waza;		// 新規の技番号

	u8	comment1;		// 説明メッセージ番号（左）
	u8	comment2;		// 説明メッセージ番号（右）

	u8	bg_flg;			// BG1とBG2の表示優先　0 = BG1 , 1 = BG2

	void (*PokeTask)(u8);	// ポケモン切り替え時のタスクを保存
//	void (*WazaTask)(u8);	// 技選択画面のタスクを保存

}P_StatusSys;

#define P_STATUS_USERADRS	0x18000		//ｼｽﾃﾑ構造体として使用するUserWorkの添え字

//-- ｼｽﾃﾑ構造体にｱｸｾｽする時に使用するマクロ --//
#define P_SYSTEM	((P_StatusSys*)&UserWork[P_STATUS_USERADRS])

#define	P_ST_ACT	( &UserWork[ P_STATUS_USERADRS+0x2000 ] )	// アクターNo格納場所


#endif

