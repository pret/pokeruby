#ifndef __GAMEDATA_H__
#define __GAMEDATA_H__

//=========================================================================
//
//
//	ゲーム進行用セーブデータの定義
//
//
//=========================================================================

#include "evwkdef.h"			// フラグ領域の定義
#include "evobjsv.def"			// EventOBJ構造体定義
#include "param.h"				// ポケモン関連の定義
#include "mail.h"				// メール関連の定義
#include "popword_data.h"		// 流行語関連の定義
#include "rtc.h"				// ゲーム内時間関連の定義
#include "cube_def.h"			// キューブ関連の定義




//=========================================================================
//	
//	データ定義
//
//=========================================================================

//--------------------------------------------------------------
//	ずかん制御関連
//--------------------------------------------------------------

#define	POKE_ZUKAN_LEN	52		/* 52 x 8 = 416 ≒ KAIHATSU_NUM_MAX */

typedef struct {
	u8 ListSort;
	u8 ListMode;
	u8 ZenkokuZukanFlag;
	u8 dummy;
	u32 UnknownRand;
	u32 PachiRand;
	u32 Rand1;
	u8 zukan_get_flag[ POKE_ZUKAN_LEN ];	//ポケモン捕まえたフラグ
	u8 zukan_see_flag[ POKE_ZUKAN_LEN ];	//ポケモンみつけたフラグ
} ZUKAN_SV_WORK;



/* 性別定義 */
enum{
		MALE,			// おとこのこ
		FEMALE,			// おんなのこ
};


enum{
	SXY_OBJ_MAX	= 64,	// SXYのOBJデータの最大登録数
};

//------------------------------------------------------------------------
// マップ位置
//------------------------------------------------------------------------
typedef struct {
		s8 div_id;
		s8 map_id;
		s8 exit_id;
		s16 x;
		s16 y;
} MapID;

//------------------------------------------------------------------------
// どうぐ関連
//------------------------------------------------------------------------
typedef	struct {

	u16	item;	//アイテム番号
	u16	no;		//個数

}MINEITEM;

#define MY_PCBOX_ITEM_MAX	50
#define MY_NORMAL_ITEM_MAX	20
#define MY_EXTRA_ITEM_MAX	20
#define MY_BALL_ITEM_MAX	16
#define MY_SKILL_ITEM_MAX	64
#define MY_SEED_ITEM_MAX	46


//------------------------------------------------------------------------
//------------------------------------------------------------------------
#define	EXTRA_EVENT_WORK_MAX	20
#define	EXTRA_EVENT_FLAG_MAX	20

//------------------------------------------------------------------------
//	ランキング用カウンタ関連
//------------------------------------------------------------------------
#define SV_RECORD_MAX		50


//------------------------------------------------------------------------
//		タネ関連
//------------------------------------------------------------------------

//うえられたきのみの状態保存ワーク定義
typedef struct SEED_BED_ST {
	u8 type;			// タネの種類
	u8 growth:7;		// 成長段階
	u8 hook:1;			// 成長抑止フラグ
	u16 time;			//	次の成長までの時間
	u8 fruit_count;		// タネのできた個数

	u8 seeds:4;			// タネができた回数
	u8 w_ug_bit:1;		//	水やりビット：植えた直後
	u8 w_hutaba_bit:1;	//	水やりビット：芽の段階
	u8 w_miki_bit:1;	//	水やりビット：幹の段階
	u8 w_hana_bit:1;	//	水やりビット：花の段階

}SEEDBED;

#define SEEDBED_MAX	128



#define		TAG_MSG_SIZE			44

//きのみパラメータ
typedef struct SEED_PARAM_TAG {
	u8 name[SEED_NAME_SIZE+EOM_SIZE];	//名前
	u8 hardness;						//堅さ
	u16 size;							//大きさ
	u8 f_max,f_min;						//花の数（最大、最小）
	const u8 * tag1;					//タグ上段
	const u8 * tag2;					//タグ下段
	u8 speed;							//育つ速度

	u8 karai;				//辛さ
	u8 sibui;				//渋さ
	u8 amai;				//甘さ
	u8 nigai;				//苦さ
	u8 suppai;				//酸っぱさ
	u8 umai;				//旨さ

}SEED_PARAM;

//RAMきのみデータ
typedef struct {
	SEED_PARAM	param;
	u8 cgx[0x20*36];
	u16 pal[16];
	u8 tag1[TAG_MSG_SIZE+EOM_SIZE];
	u8 tag2[TAG_MSG_SIZE+EOM_SIZE];
	u8 item_param[18];
	u8 item_equip;
	u8 item_power;
	u32 checksum;
}RAM_SEED;



//------------------------------------------------------------------------
//		秘密基地 関連
//------------------------------------------------------------------------

typedef struct{
	u32 p_rnd[TEMOTI_POKEMAX];		/* 個性乱数 */
	u16 waza[4*TEMOTI_POKEMAX];		/* わざ */
	u16 mons_no[TEMOTI_POKEMAX];	/* ポケモンナンバー */
	u16 item[TEMOTI_POKEMAX];		/* どうぐ */
	u8 level[TEMOTI_POKEMAX];		/* レベル */
	u8 exp[TEMOTI_POKEMAX];			/* 努力値の平均 */
}BASE_BATTLE_DATA;					/* お留守番対戦のワーク定義 */


typedef struct {
	u8 pos;								// 秘密基地の場所

	u8 entry_flag:4;					// 登録フラグ
	u8 sex:1;							// 性別
	u8 fight_flag:1;					// 対戦フラグ
	u8 flg:2;							// 登録用フラグ(0:未登録 1:登録)

	u8 name[PERSON_NAME_SIZE];			// 持ち主の名前
	u8 id[4];							// 持ち主のID
	u16 org_count;						// オリジナルカウント(タイムスタンプのようなもの）
	u8 enter_count;						// 訪れた回数
	u8 exchange_item;					// 交換用アイテム（模様替えグッズのみ）

	// 模様替えデータ
	u8 furniture_id[16];				// id
	u8 furniture_pos[16];				// 上位4ビット:x 下位4ビット:y

	BASE_BATTLE_DATA battle;

}SECRET_BASE_DATA;


#define SECRET_BASE_MAX 20

#define	GOODS_DESK_MAX		10		// つくえ
#define	GOODS_CHAIR_MAX		10		// いす
#define	GOODS_PLANT_MAX		10		// 鉢植え
#define	GOODS_ETC_MAX		30		// がらくた
#define	GOODS_MAT_MAX		30		// マット
#define	GOODS_POSTER_MAX	10		// ポスター
#define	GOODS_DOLL_MAX		40		// ぬいぐるみ
#define	GOODS_CUSHION_MAX	10		// クッション

#define	MYROOM_FURNITURE_MAX	12

//------------------------------------------------------------------------
//		 ＴＶイベントワーク
//------------------------------------------------------------------------

typedef struct {
	u8 datatype;				//データタイプ(0=データなし)
	u8 watch_flag;
	u8 dmy[34];
}TV_EVENT;

#define	TV_WORK_MAX		25

typedef struct {
	u8 datatype;
	u8 watch_flag;
	u16 time_count;
}TV_CM;

#define	TVCM_WORK_MAX	16

//--------------------------------------------------------------
//						手紙型(少し特殊)
//					大量発生のイベントデータワーク
//--------------------------------------------------------------
typedef struct{
    u16 pokeno;				// ポケモンの種類
    u8  map_id;				// どこで出現したか
    u8  div_id;				// どこで出現したか

    u8  level;				// どのレベルで出てくるか
    u8  special;			// 特殊能力
    u16 itemno;				// 持っているアイテム

    u16 waza[4];			// 持っている技

    u8  character;			// 性格
    u8  appearance;			// 出現(%)
    u16 time_count;			// イベント終了までの残り時間
}Generating_Event_Work;		// 20byte

//--------------------------------------------------------------
//					インタビュアー&カメラマン
//--------------------------------------------------------------
typedef struct{
    u16 pokeno[2];			// 自分のポケモンの種類

    u16 waza;				// 自分が最後に使った技
	u16 easytalk_no;		// 戦闘後の一言

    u8  worldpos;			// 戦った場所
    u8  battle;				// 戦った回数

    u8  damage_flag:1;		// ノーダメージフラグ
    u8  kizetsu_flag:1;		// 瀕死フラグ
    u8  kaihuku_flag:1;		// 回復アイテムフラグ
    u8  throw_flag:1;		// モンスタボールフラグ
    u8  watch_flag:1;		// フラグ
    u8  work:3;				// 余り

    u8  old_damage_flag:1;	// ノーダメージフラグ
    u8  old_kizetsu_flag:1;	// 瀕死フラグ
    u8  old_kaihuku_flag:1;	// 回復アイテムフラグ
    u8  old_throw_flag:1;	// モンスタボールフラグ
    u8  old_work:4;			// 余り
}TV_CAMERA;					// 12byte


//------------------------------------------------------------------------
//		絵描きイベント関連
//------------------------------------------------------------------------
typedef struct {
	u32 personal_rnd;							//個性乱数
	u32 idno;									//ポケモンＩＤ
	u16 monsno;									//ポケモンナンバー
	u8	pict_type;								//絵の種類
	u8	nickname[MONS_NAME_SIZE+EOM_SIZE];		//ポケモンの名前
	u8	oyaname[PERSON_NAME_SIZE+EOM_SIZE];		//親の名前
}PORTRAIT_DATA;

#define	PORTRAIT_MAX	13


//------------------------------------------------------------------------
//------------------------------------------------------------------------

//--------------------------------------------------------------
//	トレーナー再戦	関連
//--------------------------------------------------------------
#define	REVENGER_MAX			100

//--------------------------------------------------------------
//	育て屋　関連
//--------------------------------------------------------------

typedef struct{									//レコードコーナー対応メール構造体
	MAIL_DATA	Mail;								//メールデータ
	u8 oyaname[PERSON_NAME_SIZE+EOM_SIZE];			//メールの持ち主の名前
	u8 pokename[MONS_NAME_SIZE+EOM_SIZE];			//メールのついてたポケモンの名前
}SIO_MAIL_DATA;

typedef struct{									//育て屋構造体
	PokemonPasoParam	Pokemon[2];					//預けられるポケモン
	SIO_MAIL_DATA		SioMail[2];					//レコードコーナー対応メール構造体
	u32					WalkCount[2];				//歩数カウント
	u16					Egg;						//タマゴ(0=無し 0以外=有り=乱数のタネ
	u8					EggCount;					//タマゴ孵化カウント
}SODATEYA_WORK;


//--------------------------------------------------------------
//	通信対戦結果関連
//--------------------------------------------------------------
#define	TAISEN_SCORE_MAX	5

typedef struct {
	u8 name[PERSON_NAME_SIZE];
	u16	id;
	u16 win;
	u16 lose;
	u16 draw;
}TAISEN_SCORE;

typedef struct {
	TAISEN_SCORE score[TAISEN_SCORE_MAX];
	u16 total_win;
	u16 total_lose;
	u16 total_draw;
}SCORE_TABLE;


//--------------------------------------------------------------
//	木の実ブレンダー関連
//--------------------------------------------------------------
#define BPM_TYPE_MAX		3

//--------------------------------------------------------------
//	追加リボン関連
//--------------------------------------------------------------
#define EXTRA_RIBBON_MAX	11		// 追加リボンの数


//--------------------------------------------------------------
//	バトルタワー　関連
//--------------------------------------------------------------
typedef struct {
	StockBattleTowerTrainer	SBTT_Mine;	//ストックトレーナー自分
	StockBattleTowerTrainer	SBTT[5];	//ストックトレーナー（5人分）
	StockBattleTowerTVData	SBTTVD;		//バトルタワーのTV企画用のストックデータ
	StockBattleCardETrainer	SBTT_CardE;	//カードｅからのストックデータ

	u8	BattleTowerLevel	:1;			//バトルタワーのレベル
	u8	BattleTowerSaved	:1;			//セーブ済みかどうか
	u8						:6;
	u8	BattleTowerWinLoseFlag;		//バトルタワーでの戦闘結果フラグ
	u8	BattleTowerSeqNo[2];
	u16	BattleTowerRound[2];		//今何人目？
	u16	BattleTowerStage[2];		//今何周目？
	u16	BattleTowerWinRecord[2];	//連勝記録
	u8	BattleTowerTrainerNo;		//バトルタワートレーナーナンバー
	u8	BattleTowerSelectPoke[3];	//選択したポケモンの位置
	u16	BattleTowerItemNo;			//連勝でもらえるアイテムナンバー
	u8	TrainerNoStock[6];			//対戦したトレーナーナンバーのストック

	u16	BattleTowerKachi;			//バトルタワーでの勝ち数
	u16	BattleTowerKachinuki;		//バトルタワーでの連勝数
	u16	BattleTowerRensyouNow[2];	//バトルタワーでの連勝数（現在or前回）

	u8	BattleTowerInterviewLevel;	//バトルタワーのレベル（インタービュー用）
	u8	work[3];					//4バイト境界補正（一応）

	u8	dummy[2000-40-(sizeof(StockBattleTowerTrainer)*7)-sizeof(StockBattleTowerTVData)];
} BATTLE_TOWER_WORK;

//--------------------------------------------------------------
//	移動ポケモン　関連
//--------------------------------------------------------------
typedef struct {
	u8 dummy[28];
} MOVING_POKEMON;

//--------------------------------------------------------------
//	外部追加スクリプト関連
//--------------------------------------------------------------
#define	EX_SCR_SIZE		1000
typedef struct {
	u32 checksum;
	u8	work[EX_SCR_SIZE];
} EXTRA_SCRIPT_WORK;

//--------------------------------------------------------------
//	配布アイテム関連
//--------------------------------------------------------------
#define	EX_ITEM_MAX		3
typedef struct {
	u8 type;
	u8 count;
	u16 number;
} EXTRA_ITEM;

typedef struct {
	u32 checksum;
	EXTRA_ITEM item[EX_ITEM_MAX];
} EXTRA_ITEM_WORK;

//=========================================================================
//	
// プレイヤーシステムデータ
//
//=========================================================================

typedef struct PersonalData{
		u8 my_name[PERSON_NAME_SIZE+EOM_SIZE];			//	自分の名前
		u8 my_sex;					//	自分の性別
		u8 save_flag;				//	セーブしたかどうかのフラグ
		u8 ID[4];					//	ＩＤナンバー

		u16 playtime_h;				//	プレイ時間（時）
		u8 playtime_m;				//	プレイ時間（分）
		u8 playtime_s;				//	プレイ時間（秒）
		u8 playtime_ms;				//	プレイ時間（1/60秒）

		u8 key_config;				//	オプションのキー設定
		u16 msg_speed:3;			//	ＭＳＧ送りの早さ
		u16 window_type:5;			//	システムウィンドウの種類
		u16 sound_mode:1;			//	ステレオ・モノラル切り替え
		u16 btl_type:1;				//	「かちぬき」「いれかえ」
		u16 btl_eff_sw:1;			//	戦闘エフェクトの有無
		u16 tnavi_zoom:1;			//	トレナビマップモード

		ZUKAN_SV_WORK Zukan;

		GAME_TIME dst_time;				//	DST設定（海外版のみ使用）
		GAME_TIME diff_time;			//	RTCとの時間差
		GAME_TIME save_time;			//	セーブ時のゲーム内時間

		BATTLE_TOWER_WORK BattleTowerWork;
}SYS_SAVE_DATA;


//=========================================================================
//
//		ゲーム進行データ本体
//
//=========================================================================

typedef struct {

		s16 MapXpos;					//仮想マップ内のＸ位置
		s16 MapYpos;					//仮想マップ内のＹ位置
		MapID MapID;					//マップID
		MapID ContinueMapID;			//前のマップＩＤ
		MapID SpMapID;					//特殊接続先のマップＩＤ
		MapID TelMapID;					//テレポートなどの戻り先ＩＤ
		MapID EscMapID;					//あなをほるなどの戻り先ＩＤ
		u16 MapMusicNo;					//現在の音楽
		u8 WeatherValue;				//現在の天候
		u8 WeatherCycle;				//現在の天候周期
		u8 Brightness;					//現在の明るさ
		u16 MapScreenNo;				//現在のマップスクリーン


		u16 VirtualMapSv[256];		//仮想マップセーブ
		u8 PokeCountTemoti;									//手持ちポケモンの数
		PokemonParam PokeParaTemoti[TEMOTI_POKEMAX];		//手持ちポケモンデータ

		u32	my_gold;					//手持ちのお金
		u16	my_coin;					//手持ちのコイン

		u16	cnv_btn;	//便利ﾎﾞﾀﾝに登録されたｱｲﾃﾑ番号

		MINEITEM MyPCBoxItem[ MY_PCBOX_ITEM_MAX ];		//パソコンに預けた道具
		MINEITEM MyNormalItem[ MY_NORMAL_ITEM_MAX ];	//手持ちの普通の道具
		MINEITEM MyExtraItem[ MY_EXTRA_ITEM_MAX];		//手持ちの大切な道具
		MINEITEM MyBallItem[ MY_BALL_ITEM_MAX];			//手持ちのﾓﾝｽﾀｰﾎﾞｰﾙ
		MINEITEM MySkillItem[ MY_SKILL_ITEM_MAX];		//手持ちの技マシン
		MINEITEM MySeedItem[ MY_SEED_ITEM_MAX];			//手持ちのたね

		CUBE MyCube[ MY_CUBE_MAX ];						//手持ちのキューブ

		u8 zukan_see_flag2[ POKE_ZUKAN_LEN ];			//ポケモンみつけたフラグその２

		u16 NormalBPMRecord[ BPM_TYPE_MAX ];			//ブレンドマシーン最高速度
		u16 SioBPMRecord[ BPM_TYPE_MAX ];

		u16 RevengeStepCount;							//トレーナー再戦
		u8 RevengeFlag[ REVENGER_MAX ];

		EventOBJ EvObj[EV_OBJ_MAX];						//フィールドOBJ情報
		evObjData SvSxyObj[SXY_OBJ_MAX];				//そのマップのSXY情報

		u8 EventFlag[ EVFLAG_AREA_MAX ];				//イベントフラグ
		u16 EventWork[ EVWORK_AREA_MAX ];				//イベントワーク
		u32	Record[ SV_RECORD_MAX ];					//ランキング用カウンタ

		SEEDBED	SeedBed[ SEEDBED_MAX ];					//フィールドのタネのデータ
		SECRET_BASE_DATA SecretBase[ SECRET_BASE_MAX ];	//秘密基地のデータ

		u8 MyRoomFurnitureID[ MYROOM_FURNITURE_MAX ];	//自宅の模様替え情報:種類
		u8 MyRoomFurniturePos[ MYROOM_FURNITURE_MAX ];	//自宅の模様替え情報:位置

		u8 FurnitureDesk[ GOODS_DESK_MAX ];				// 模様替えグッズ：つくえ
		u8 FurnitureChair[ GOODS_CHAIR_MAX ];			// 模様替えグッズ：いす
		u8 FurniturePlant[ GOODS_PLANT_MAX ];			// 模様替えグッズ：鉢植え
		u8 FurnitureEtc[ GOODS_ETC_MAX ];				// 模様替えグッズ：がらくた
		u8 FurnitureMat[ GOODS_MAT_MAX ];				// 模様替えグッズ：マット
		u8 FurniturePoster[ GOODS_POSTER_MAX ];			// 模様替えグッズ：ポスター
		u8 FurnitureDoll[ GOODS_DOLL_MAX ];				// 模様替えグッズ：ぬいぐるみ
		u8 FurnitureCushion[ GOODS_CUSHION_MAX ];		// 模様替えグッズ：クッション

		TV_EVENT	tv_event[ TV_WORK_MAX ];			//ＴＶイベントのデータ
		TV_CM		tv_cm[ TVCM_WORK_MAX ];				//ＴＶイベント(ＣＭ）のデータ
		Generating_Event_Work tv_encount;				//大量発生用のデータ
		TV_CAMERA	tv_camera;							//ＴＶカメラのデータ

		u16 kaiwa_self[6];			//	簡易会話データ：自己紹介
		u16 kaiwa_battle[6];		//	簡易会話データ：対戦開始
		u16 kaiwa_win[6];			//	簡易会話データ：対戦勝ち
		u16 kaiwa_lose[6];			//	簡易会話データ：対戦負け

		MAIL_DATA	MailData[MAIL_STOCK_MAX];			//メール

		u8 kaiwa_word_flag[8];      //  簡易会話用隠しワードフラグ
		u8 oyaji_work[64];			//	7人のオヤジ用ワークエリア
		PopularWord PopWord[POPWORD_MAX];
		PORTRAIT_DATA PortraitData[PORTRAIT_MAX];		//似顔絵データ用ワーク

		SODATEYA_WORK SodateyaWork;						//育て屋用ワーク

		SCORE_TABLE TaisenScoreTable;					//通信対戦結果用ワーク

		u8 ExRibbonNo[EXTRA_RIBBON_MAX];

		u8 ExtraEventWork[ EXTRA_EVENT_WORK_MAX ];
		u8 ExtraEventFlag[ EXTRA_EVENT_FLAG_MAX ];

		MOVING_POKEMON MovingPokemon;

		RAM_SEED RamSeed;

		EXTRA_SCRIPT_WORK	ExtraScript;				//外部追加スクリプト
		EXTRA_ITEM_WORK		ExtraItem;					//配布用データ

		u8 zukan_see_flag3[ POKE_ZUKAN_LEN ];			//ポケモンみつけたフラグその３

}FIELD_SAVE_DATA;



#endif	/*__GAMEDATA_H__*/

