//=========================================================================================
//					bag,fd_shop,base,f_pmlistなどで使用している便利な関数
//									2002/01/09 by nakahiro
//=========================================================================================
#ifndef	ITEMTOOL_H
#define ITEMTOOL_H

// 2択処理データ
typedef struct {

	void (*set_func)(u8);		//決定
	void (*cancel_func)(u8);	//キャンセル

}SELECT_ITEM;

// LR Mode Key Check
enum {
	NOT_LR_MODE = 0,	// Not LR Mode / Not LR Button
	LRM_L,				// L Button Press
	LRM_R,				// R Button Press
};

// マークアクター番号
enum {
	MARK_ACT_U_CURSOR = 0,
	MARK_ACT_D_CURSOR,
	MARK_ACT_L_CURSOR,
	MARK_ACT_R_CURSOR,
	MARK_ACT_MARK1,
	MARK_ACT_MARK2,

	MARK_ACT_MAX,
};

extern u8	LR_TrgCheck(void);
extern u8	LR_RepeatCheck(void);
extern void BGDataInit(void);							// BGデータ初期化
extern void SetTalkMsg(u8,const u8 *,void *,u16);		// 送りメッセージセット
extern void SelectToolInit(u8,const SELECT_ITEM *);		// はい・いいえ処理
extern void PalChangeMojiPut( const u8 *, u8, u8, u8 );	// 指定パレットでフォント表示
extern void PalChangeNumPut( u32, u8, u8, u8, u8, u8 );	// 指定パレットで数値表示
extern void PalChangeCursorPut( u8, u8, u8 );			// 指定パレットのカーソルを表示
extern void ItemToolAGBRegInit(void);					// レジスタ初期化
extern void InitHVBlankFunc(void);						// HVBlank初期化
extern void MakeRAMKinomiName( u8 * str );				// RAM木の実名前作成
extern u8	ItemToolSioCheck(void);						// 通信チェック
extern void ScrActInit(void);							// アクター番号初期化
extern void MarkActInit( u8 * act, u8 max );			// アクター番号初期化
extern void AddMarkActor( u8 id, u8 * act, s16 x, s16 y );	// マークアクターセット
extern void DelMarkActor( u8 * act );						// マークアクター削除
extern void DelMarkActorAll( u8 * act, u8 max );
extern void AddScrCurActor( u8 id, s16 x, s16 y );	// スクロールカーソルアクターセット
extern void BanishScrCurActor( u8 id, u8 flg );		// スクロールカーソルアクター表示切替
extern void DelScrCurActor( u8 id );				// スクロールカーソルアクター削除
extern void AddMarkPal(void);						// マークパレットセット
extern void DelMarkPal(void);						// マークパレット削除
extern void ScrCurActAnmStop( u8 id );				// スクロールカーソルアニメストップ
extern void ScrCurActAnmPlay( u8 id );				// アニメ再開
extern void ScrCurActAnmInit( u8 id );				// アニメクリア
extern void ScrCurActAnmStopInit( u8 id );			// アニメストップ＆クリア
extern void ScrCurActPrioritySet( u8 id, u8 pri );	// スクロールカーソル表示優先

extern u8 ChangeRoomRAMKinomiCheck( u16 item );		// 交換部屋での「ナゾのみ」チェック
extern u8 SioMailNotCheck( u16 item );				// 通信時メールを持てないチェック

extern u8 ScrActNo[];	// マークアクター番号



#endif	// ITEMTOOL_H
