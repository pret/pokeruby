//====================================================================
//						ＴＶ企画共通定義
//
//				スクリプトから呼ばれる関数のextern宣言など
//
//
//
/*
			＜PERSON_NAME_SIZEなどのサイズが変更になった時＞
				・手紙、秘密で決まったメンバになっている
				　アドレスがずれるので差分でうめるようにする

*/
//
//====================================================================
#ifndef __TV_DEF_H__
#define __TV_DEF_H__


#define TV_NOTHING			0xff	//無効コード

#define TV_WATCH_FLAG_OFF		0	//見れない状態(見た状態)
#define TV_WATCH_FLAG_ON		1	//見れる状態(まだ見てない状態)
#define TV_WATCH_FLAG_HOLDING	2	//開催当日(ＣＭで使用イベント中)

#define	TV_NODATA_TYPE1			0					//データなし
#define TV_TYPE_START			1					//データタイプ定義のスタート
#define LETTER_TYPE_START	(TV_TYPE_START)			//手紙型のスタート
#define LETTER_TYPE_MAX		(LETTER_TYPE_START+20)	//手紙型の数
#define SEC_TYPE_START		(LETTER_TYPE_MAX)		//秘密型のスタート
#define SEC_TYPE_MAX		(SEC_TYPE_START+20)		//秘密型の数
#define TIME_TYPE_START		(SEC_TYPE_MAX)			//時間型のスタート
#define TIME_TYPE_MAX		(TIME_TYPE_START+20)	//時間型の数
#define TV_TYPE_END			(TIME_TYPE_MAX)			//データタイプ定義の終わり

//手紙型
#define	TV_POKEMON_TYPE1	(LETTER_TYPE_START+0)		//ポケモンアンケート
#define	TV_RECENTLY_TYPE1	(LETTER_TYPE_START+1)		//最近のできごと
#define	TV_CLUB_TYPE1		(LETTER_TYPE_START+2)		//大好きクラブのインタビュー
#define	TV_GYMLEADER_TYPE1	(LETTER_TYPE_START+3)		//GYMLeader戦の後のインタビュー
#define	TV_NAME_TYPE1		(LETTER_TYPE_START+4)		//姓名判断氏
#define	TV_CONTEST_TYPE1	(LETTER_TYPE_START+5)		//コンテスト
#define	TV_TOWER_TYPE1		(LETTER_TYPE_START+6)		//バトルタワー
//秘密型
#define	TV_GETPOKE_TYPE1	(SEC_TYPE_START+0)			//戦闘
#define	TV_SHOP_TYPE1		(SEC_TYPE_START+1)			//ショップ
#define	TV_FAILED_TYPE1		(SEC_TYPE_START+2)			//捕獲失敗
#define	TV_FISHING_TYPE1	(SEC_TYPE_START+3)			//釣りしまくり
#define	TV_ONEDAY_TYPE1		(SEC_TYPE_START+4)			//一日で捕まえた数
//時間型
#define	TV_GENERATING_TYPE1	(TIME_TYPE_START+0)			//大量発生

#ifndef ASM_CPP		/* アセンブラの場合のみこのシンボルが定義される */


//通信タイプ定義
enum{
	NOCOPY_TYPE1 = 0,				//通信しない型
	COPY_TYPE1,						//コピー型
	CUT_TYPE1,						//切り取り型(手紙型)
	CUT_TYPE2,						//切り取り型(秘密型)
	CUT_TIME_TYPE,					//切り取り型(時間型)
	RARE_TYPE1,						//レア(絶対にコピーされる)
};


#define TVDATA_HIMSELF_MAX	5		//TVデータの確保数(自分)
#define TVDATA_PARTNER_MAX	19//20		//TVデータの確保数(相手)
#define TVDATA_MAX	(TVDATA_HIMSELF_MAX+TVDATA_PARTNER_MAX)//TVデータの確保数

#define GENERATING_INCUBATION_TIME		1		//潜伏日数

#define TV_TEMP_WORK		(Fld.tv_event[TVDATA_MAX])	//TVの保存用ワーク
#define TV_SHOP_CREATE_NUM	20		//買い物上手を作る数
									
//200分の1の確率(65535/200 = 327)
#define TV_GENERATING_START_ON	327		//大量発生が発生する値(以下で発生)
#define TV_GETPOKE_START_ON		65535	//捕まえたポケモン
#define TV_CONTEST_START_ON		65535	//コンテスト勝利
//3分の1の確率(65535/3 = 21845)
#define TV_SHOP_START_ON		21845	//買い物上手
#define TV_FAILED_START_ON		65535	//捕獲失敗
#define TV_ONEDAY_START_ON		65535	//一日に捕まえた数

#define GENERATING_TIME			2		//大量発生している日数
#define TV_ONEDAY_CREATE_NUM	20		//一日に捕まえたを作成する数
#define TV_FAILED_CREATE_NUM	3		//捕獲失敗を作成するボールを投げた数

//(秘密型)姓名判断氏
enum{
	TV_NAME_NTOP = 0,
	TV_NAME_NLAST,
	TV_NAME_TOP,
	TV_NAME_LAST,
};
enum{
	TV_NAME_MY = 0,
	TV_NAME_NICK,
	TV_NAME_POKE,
};


//====================================================================
//						ＴＶ企画構造体
//====================================================================

//--------------------------------------------------------------
//							手紙型
//
//				ポケモンアンケート・さいきんのできごと
//--------------------------------------------------------------
typedef struct{
    u8  datatype;			// データタイプ(0=データなし) 
	u8	watch_flag;			// TVが見れるか

    u16 inside_data;	    // 内部データ(ピカチュウについて等)

	u16  easytalk[6];		// 簡易文章

    u8  player_name[PERSON_NAME_SIZE+EOM_SIZE];    // プレイヤーの名前
    u8  work[8];			// 余り


	//ここから下は手紙型同じ
    u8  data_id[2];			// TVデータ識別ID
	u8  before_id[2];		// 前のトレーナーのID
}TV_Letter_Work;			// 36byte


//--------------------------------------------------------------
//							手紙型
//
//				大好きクラブのインタビューのワーク
//--------------------------------------------------------------
typedef struct{
    u8  datatype;			// データタイプ(0=データなし) 
	u8	watch_flag;			// TVが見れるか

    u16 pokeno;				// 先頭にいるポケモンの種類

    u8  friend:4;		    // なつき度(上位4ビットを保存する)
	u8  ans:4;				// 質問に対しての答え

    u8  player_name[PERSON_NAME_SIZE+EOM_SIZE];    // プレイヤーの名前
	u8  work2[3];			// 余り
    u8  nickname[MONS_NAME_SIZE+EOM_SIZE];		// ニックネーム

	u8  work;				// 余り

    u16 easytalk_no[2];		// 簡易会話一言

	//ここから下は手紙型同じ
    u8  data_id[2];			// TVデータ識別ID
	u8  before_id[2];		// 前のトレーナーのID
}TV_Club_Work;				// 36byte


//--------------------------------------------------------------
//							手紙型
//
//					ジムリーダー戦後のワーク
//--------------------------------------------------------------
typedef struct{
    u8  datatype;			// データタイプ(0=データなし) 
	u8	watch_flag;			// TVが見れるか

    u16 easytalk_no;		// 簡易会話一言

	u8  bad;				// 瀕死になった回数
	u8  turn;				// ターン数

    u16 pokeno;				// ジムリーダーを倒したポケモン
    u16 waza;				// 最後に使った技

	u8  worldpos;			// ジムリーダーのシティ名

    u8  player_name[PERSON_NAME_SIZE+EOM_SIZE];    // プレイヤーの名前
	u8  work2[3];			// 余り
    u8  ans;				// 質問に対しての答え
	u8  work[9];			// 余り

	//ここから下は手紙型同じ
    u8  data_id[2];			// TVデータ識別ID
	u8  before_id[2];		// 前のトレーナーのID
}TV_GYM_Work;				// 36byte


//--------------------------------------------------------------
//							手紙型
//
//						姓名判断氏のワーク
//--------------------------------------------------------------
typedef struct{
    u8  datatype;			// データタイプ(0=データなし) 
	u8	watch_flag;			// TVが見れるか

    u16 pokeno;		        // ポケモンの種類

    u8  nickname[MONS_NAME_SIZE+EOM_SIZE];		// ニックネーム
    u8  player_name[PERSON_NAME_SIZE+EOM_SIZE];    // プレイヤーの名前
    u8  work2[3];			// 余り

	u8  r_q_no[2];			// ランダムな質問ナンバーを保存
	u16	r_pokeno;			// ランダムなポケモンナンバーを保存

    u8  work[2];			// 余り

	//ここから下は手紙型同じ
    u8  data_id[2];			// TVデータ識別ID
    u8  before_id[2];		// 前のトレーナーID
}TV_Name_Work;				// 36byte


//--------------------------------------------------------------
//							手紙型
//
//						コンテストのワーク
//--------------------------------------------------------------
typedef struct{
    u8  datatype;			// データタイプ(0=データなし) 
	u8	watch_flag;			// TVが見れるか

    u16 pokeno;				// ポケモンの種類

    u16 easytalk_no[2];		// 簡易会話一言

    u8  nickname[MONS_NAME_SIZE+EOM_SIZE];		// ニックネーム

    u8  type:3;				// コンテストタイプ
    u8  rank:2;				// コンテストランク
    u8  zyuni:2;			// 順位
    u8  work:1;				// 余り

    u16 waza;				// 最後に使った技

    u8  player_name[PERSON_NAME_SIZE+EOM_SIZE];    // プレイヤーの名前
	u8	work2[2];			//

	//ここから下は手紙型同じ
    u8  data_id[2];			// TVデータ識別ID
    u8  before_id[2];		// 前のトレーナーID
}TV_Con_Work;				// 36byte


//--------------------------------------------------------------
//							手紙型
//
//				バトルタワー後のインタビューのワーク
//--------------------------------------------------------------
typedef struct{
    u8  datatype;			// データタイプ(0=データなし) 
	u8	watch_flag;			// TVが見れるか

    u8  player_name[PERSON_NAME_SIZE+EOM_SIZE];		// プレイヤーの名前
    u16 pokeno;				// ポケモンの種類

    u8  enemy_name[PERSON_NAME_SIZE+EOM_SIZE];		// 相手の名前
    u16 enemy_pokeno;		// 最後に対戦したポケモンの種類

    u16 win;				// 連勝数
    u16 easytalk_no;		// 簡易会話一言

    u8  level;				// レベル
    u8  ans;				// 受け答えデータ
    u8  win_flag;			// 勝ち負けフラグ

	u8	work[3];			// 余り

	//ここから下は手紙型同じ
    u8  data_id[2];			// TVデータ識別ID
    u8  before_id[2];		// 前のトレーナーID
}TV_Tower_Work;				// 36byte


//--------------------------------------------------------------
//						手紙型(少し特殊)
//
//						大量発生のワーク
//--------------------------------------------------------------
typedef struct{
    u8  datatype;			// データタイプ(0=データなし) 
	u8	watch_flag;			// TVが見れるか

    u8  special;			// 特殊能力
    u8  character;			// 性格

    u16 waza[4];			// 持っている技

    u16 pokeno;				// ポケモンの種類
    u16 itemno;				// 持っているアイテム

    u8  map_id;				// どこで出現したか
    u8  div_id;				// どこで出現したか
    u8  rare;				// レア度
    u8  appearance;			// 出現(%)

    u8  level;				// どのレベルで出てくるか
    u8  batch;				// バッチ数
    u16 time_count;			// 潜伏日数

    u8  work[8];			// 余り

	//ここから下は手紙型同じ
    u8  data_id[2];			// TVデータ識別ID
    u8  before_id[2];		// 前のトレーナーID
}TV_Generating_Work;		// 36byte


//--------------------------------------------------------------
//							秘密型
//
//					捕まえたポケモンの紹介のワーク
//--------------------------------------------------------------
typedef struct{
    u8  datatype;			// データタイプ(0=データなし) 
	u8	watch_flag;			// TVが見れるか

	u8  work[2];			// 余り

    u8  nickname[MONS_NAME_SIZE+EOM_SIZE];		// ニックネーム
    u8  ball_type;			// 投げたボールの種類
    u16 get_pokeno;			// 捕まえたポケモンの種類

    u8  ball_count;			// ボールを投げた回数


	//ここから下は秘密型同じ
    u8  player_name[PERSON_NAME_SIZE+EOM_SIZE];    // プレイヤーの名前
	u8	work3[3];			//
    u8  data_id[2];			// TVデータ識別ID
    u8  before_id[2];		// 前のトレーナーID
    u8  trainer_id[2];		// TVデータ製作者ID(トレーナーID)
}TV_Sec_Btl_Work;			// 36byte


//--------------------------------------------------------------
//							秘密型
//
//					今日の買い物上手のワーク
//--------------------------------------------------------------
typedef struct{
    u8  datatype;			// データタイプ(0=データなし) 
	u8	watch_flag;			// TVが見れるか

    u8  bargain_flag;		// 大安売りの時か
    u8  work[3];			// 余り

    u16 itemno[3];			// アイテムの種類
    u16 num[3];				// 買ったアイテムの数

    u8  worldpos;			// どこか

	//ここから下は秘密型同じ
    u8  player_name[PERSON_NAME_SIZE+EOM_SIZE];    // プレイヤーの名前
	u8	work3[3];			//
    u8  data_id[2];			// TVデータ識別ID
    u8  before_id[2];		// 前のトレーナーID
    u8  trainer_id[2];		// TVデータ製作者ID
}TV_Sec_Shop_Work;			// 36byte


//--------------------------------------------------------------
//							秘密型
//
//						捕獲失敗のワーク
//--------------------------------------------------------------
typedef struct{
    u8  datatype;			// データタイプ(0=データなし) 
	u8	watch_flag;			// TVが見れるか

    u8  work[10];			// 余り

    u16 pokeno;				// ポケモンの種類
    u16 failed_pokeno;		// 逃げた(倒した)ポケモンの種類

    u8  ball_count;			// ボールを投げた回数
    u8  failed_flag;		// 逃げたか倒したかフラグ
	u8	worldpos;			// 何番道路か

	//ここから下は秘密型同じ
    u8  player_name[PERSON_NAME_SIZE+EOM_SIZE];    // プレイヤーの名前
	u8	work3[3];			//
    u8  data_id[2];			// TVデータ識別ID
    u8  before_id[2];		// 前のトレーナーID
    u8  trainer_id[2];		// TVデータ製作者ID(トレーナーID)
}TV_Sec_Get_Failed_Work;	// 36byte


//--------------------------------------------------------------
//							秘密型
//
//						釣りしまくりのワーク
//--------------------------------------------------------------
typedef struct{
    u8  datatype;			// データタイプ(0=データなし) 
	u8	watch_flag;			// TVが見れるか

	u8	true_count;			// 連続成功回数
	u8	false_count;		// 連続失敗回数

    u16 pokeno;				// 釣ったポケモンの種類

    u8  work[13];			// 余り

	//ここから下は秘密型同じ
    u8  player_name[PERSON_NAME_SIZE+EOM_SIZE];    // プレイヤーの名前
	u8	work3[3];			//
    u8  data_id[2];			// TVデータ識別ID
    u8  before_id[2];		// 前のトレーナーID
    u8  trainer_id[2];		// TVデータ製作者ID(トレーナーID)
}TV_Sec_Fishing_Work;		// 36byte

//--------------------------------------------------------------
//							秘密型
//
//					一日で捕まえた数のワーク
//--------------------------------------------------------------
typedef struct{
    u8  datatype;			// データタイプ(0=データなし) 
	u8	watch_flag;			// TVが見れるか

    u16 count;				// 捕まえた数

    u16 get_pokeno;			// 最後に捕まえたポケモンの種類
    u16 walk_count;			// その日歩いた歩数

    u16 pokeno;				// 最後に使用していたポケモンの種類
    u8  worldpos;			// 最後に捕まえた場所

    u8  work[8];			// 余り

	//ここから下は秘密型同じ
    u8  player_name[PERSON_NAME_SIZE+EOM_SIZE];    // プレイヤーの名前
	u8	work3[3];			//
    u8  data_id[2];			// TVデータ識別ID
    u8  before_id[2];		// 前のトレーナーID
    u8  trainer_id[2];		// TVデータ製作者ID(トレーナーID)
}TV_Sec_OneDay_Work;		// 36byte


//--------------------------------------------------------------------
//					スクリプトから呼ばれる
//--------------------------------------------------------------------
//tv.c
extern void InterViewSet();			//インタビューよびだし


//--------------------------------------------------------------------
//				
//--------------------------------------------------------------------
extern s8 tv_akino;					//ＴＶデータの空いてる場所
extern pFunc InterViewEndFunc;		//終了時に呼ばれるルーチンを格納


#endif	/*ASM_CPP*/
#endif	/*__TV_DEF_H__*/

