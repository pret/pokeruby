//=========================================================================
//
//
//	
//=========================================================================

#ifndef SXY_TYPE_H__
#define SXY_TYPE_H__

//=========================================================================
//	定義
//=========================================================================
//ヘッダ定義関連

#define		HEAD_NO_WORK	0		// 特殊イベントなし
#define		HEAD_BG_CHANGE	1		// BG書き換え
#define		HEAD_SCENE_CHK	2		// 条件でスクリプト起動
#define		HEAD_FLAG_CTRL	3		// フラグ制御（マップ切り替え時のみ）
#define		HEAD_OBJ_CTRL	4		// OBJをいろいろ変更
#define		HEAD_INIT_CTRL	5		// マップ初期化ごとのフラグ制御
#define		HEAD_LINK_CTRL	6		// 接続制御（現状、ダイビングのみ）

//BGイベントタイプ定義

#define		BG_ALL_SITE		0	//どこから話しかけても反応
#define		BG_D_SITE		1	//下から話しかけたときのみ反応
#define		BG_U_SITE		2	//上から話しかけたときのみ反応
#define		BG_L_SITE		3	//左から話しかけたときのみ反応
#define		BG_R_SITE		4	//右から話しかけたときのみ反応
#define		BG_FLG_ON		5	//フラグがオンのときのみ反応
#define		BG_FLG_OFF		6	//フラグがオフのときのみ反応
#define		BG_ITEMPICK		7	//隠しアイテム用
#define		BG_BASE			8	//秘密基地用

//特殊接続用定義

#define		SPFIELD_MAP_EXIT02	0x7e	// 秘密基地用特殊接続
#define		SPFIELD_MAP_EXIT01	0x7f	// 通常特殊接続
#define		SPFIELD_MAP			0x7f
#define		SPFIELD				0x7f

#define		NO_EXIT_ID			(-1)	// 出口ＩＤを指定しない場合に使用する

#define		TR_TYPE_NORMAL		0		// 通常トレーナー
#define		TR_TYPE_LEADER		1		// ジムリーダー
#define		TR_TYPE_EVENT		2		// イベント発動など、特別なタイプ
#define		TR_TYPE_FORCE		3		// イベントの流れで強制的に戦闘する場合
#define		TR_TYPE_2VS2		4		// 2vs2対戦タイプ
#define		TR_TYPE_REVENGE		5		// 再戦タイプ
#define		TR_TYPE_EVENT2VS2	6		// 2vs2イベントタイプ
#define		TR_TYPE_REVENGE2VS2	7		// 2vs2再戦タイプ
#define		TR_TYPE_LEADER2VS2	8		// 2vs2のジムリーダー

#endif	/*SXY_TYPE_H__*/

