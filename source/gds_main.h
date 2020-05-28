//=========================================================================================
//									秘密基地グッズ処理
//						base_gds.c を分割	2002/02/07 by nakahiro
//=========================================================================================
#ifndef	GDS_MAIN_H
#define GDS_MAIN_H

//=========================================================================================
//									シンボル定義
//=========================================================================================
#define	GOODS_MAX		32		// グッズ所持最大数

#define	YESNO_WINX		20
#define	YESNO_WINY		8

#define	MARK_OBJ_PAL	6		// マークのOBJパレット番号

// OBJサイズ
#define	size_16x16		0
#define	size_32x16		1
#define	size_48x16		2
#define	size_64x32		3
#define	size_32x32		4
#define	size_16x32		5
#define	size_16x48		6
#define	size_32x64		7
#define	size_48x48		8
#define	size_48x32		9

// もようがえタスクワーク番号
#define	CELL_POSX		0		// セル書き換え場所
#define	CELL_POSY		1		// 
#define	FADE_WORK		2		// フェード処理番号
#define	HERO_POSX		3		// 主人公の位置
#define	HERO_POSY		4		// 
#define	GOODS_H			5		// グッズ幅
#define	GOODS_V			6		// グッズ高さ
#define	RETURN_ADR_H	8
#define	RETURN_ADR_L	9
#define	BUTTON_FLG		10		// ボタンのフラグ
#define	SCENE_NO		11		// シーン番号
#define	MENU_NO			12		// メニュー番号
#define	NEXT_GG			13		//

// グッズタイプ
#define FLOOR			0
#define WALK			1
#define CORNER			2
#define WALL			3
#define DESK_TOP		4

// 保存場所
enum {
	GOODS_DESK_FOLDER = 0,	// つくえ
	GOODS_CHAIR_FOLDER,		// いす
	GOODS_PLANT_FOLDER,		// 鉢植え
	GOODS_ETC_FOLDER,		// がらくた
	GOODS_MAT_FOLDER,		// マット
	GOODS_POSTER_FOLDER,	// ポスター
	GOODS_DOLL_FOLDER,		// ぬいぐるみ
	GOODS_CUSHION_FOLDER,	// クッション
};

#define	GOODS_NAME_SIZE		10
#define	GOODS_NAME_LEN		( GOODS_NAME_SIZE + EOM_SIZE )


// グッズデータ
typedef struct {
	const u8    id;						// グッズ番号
	const u8	name[ GOODS_NAME_LEN ];	// グッズ名
	const u8	type;					// タイプ
	const u8	size;					// サイズ
	const u8	box;					// 保存場所
	const u16	price;					// 値段
	const u8 *  msg;					// 説明メッセージ
	const u16 *	cell;					// 使用セルデータ
}GoodsData;

// グッズOBJデータ
typedef struct {
	const GoodsData	* goods;	// グッズデータ
	u16		new_cell[ 64 ];		// セル作成場所
	u8		CharData[ 64*8*4 ];	// キャラ展開場所
	u16		PalData[ 16 ];		// パレット展開場所
}GoodsOBJ;

// BGセルからOBJを作成するためのテーブル
typedef struct {
	const u8 * ptn;		// 代入先の配列番号
	const u8 * num;		// 参照先の配列番号
	const u8 * pls;		// セル内のキャラ番号
	u8	loop;			// ループ回数
}BgObjTbl;

// サイズごとのデータ
typedef struct {
	u8	type;		// OBJ形状
	u8	size;		// OBJサイズ
	u8	posX;		// 初期Y座標
	u8	posY;		// 初期Y座標
}GoodsSizeData;

// 回収するグッズのデータ
typedef struct {
	u8	num;
	u8	Xsize;
	u8	Ysize;
	u16	flg;
}GetGoodsData;

//=========================================================================================
//									プロトタイプ宣言
//=========================================================================================
extern void RearrangeInit2(u8);				// メニュー選択初期設定
extern void RearrangeTaskInit(u8);			// メニュー選択初期設定
extern void RearrangeTaskMain(u8);			// メニュー選択
extern void RaarrangeParamInt(void);
extern void ReturnGoodsSelectWin(u8);		// グッズ選択ウィンドウへ戻る
extern void GoodsSelectInit(u8);			// グッズ選択初期設定
extern void GoodsSelectParamInit(u8);
extern void GoodsSelectTask(u8);			// グッズ選択
extern void SelectGoodsParamInit(u8);		// グッズ選択用パラメータ設定
extern void DelGoodsWindow(void);			// グッズウィンドウ削除
extern void DelGoodsTypeInfoWin(void);		// 種類名・グッズ説明ウィンドウ消去
extern u8	GoodsPutCheck(void);			// 選択したグッズが置かれているか
extern void SelectGoodsPutNot(u8);			// 置かれている
extern void SetPutGoodsNo(u8);				// 置かれているグッズを記憶
extern void NoGoods(u8);					// グッズを所持していないとき
extern void NoGoods2(u8);					// グッズを所持していないとき
extern void DelGoodsParamSet(u8);			// グッズを消したときのパラメータ再設定
extern void GoodsFuncGlobalPosition(u8);	// 検索基準位置設定
extern void SetHeroGlobalPosition(u8);		// セルを書き換えて主人公を中心へ
extern void DrawGoodsType( u8 id );			// 種類表示
extern void GoodsTypeSelectInit( u8 id );	// 種類選択初期設定
extern void MyRoomRearrangeInit( u8 id );	// 自宅模様替え処理初期設定

extern void TradeOyajiMyGoodsSelectInit( u8 id );	// 交換おやじ・項目選択へ
extern void GetGoodsTypeStr( u8 * str, u8 no );		// 交換おやじ・項目文字列取得


//=========================================================================================
//									グローバル変数
//=========================================================================================
extern const GoodsData base_goods[];
extern u8	goods_max;				// 所持グッズ数
extern u8	set_goods[];			// 置かれてるグッズを記憶（基地）
extern u8	set_room[];				// 置かれてるグッズを記憶（自分の部屋）
extern u8	select_goods_pos;		// pos + scr
extern u8	type_pos;				// 種類のカーソル位置
extern u8	mark_act[];				// 配置済みアクター番号

extern u8 * GoodsType;			// 選択するグッズのポインタ


#endif	// GDS_MAIN_H
