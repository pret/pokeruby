#ifndef __SYSWORK_H__
#define __SYSWORK_H__

//=========================================================================
//	
//
//
//	セーブワーク定義
//
//
//	プログラムからもアクセスされるセーブワークに関しての定義
//
//=========================================================================



#define		LOCALWORK0				(0+SVWK_START)
#define		LOCALWORK1				(1+SVWK_START)
#define		LOCALWORK2				(2+SVWK_START)
#define		LOCALWORK3				(3+SVWK_START)
#define		LOCALWORK4				(4+SVWK_START)
#define		LOCALWORK5				(5+SVWK_START)
#define		LOCALWORK6				(6+SVWK_START)
#define		LOCALWORK7				(7+SVWK_START)
#define		LOCALWORK8				(8+SVWK_START)
#define		LOCALWORK9				(9+SVWK_START)
#define		LOCALWORK10				(10+SVWK_START)
#define		LOCALWORK11				(11+SVWK_START)
#define		LOCALWORK12				(12+SVWK_START)
#define		LOCALWORK13				(13+SVWK_START)
#define		LOCALWORK14				(14+SVWK_START)
#define		LOCALWORK15				(15+SVWK_START)

// 変更可能なＯＢＪキャラ指定
#define		OBJCHRWORK1				(16+SVWK_START)
#define		OBJCHRWORK2				(17+SVWK_START)
#define		OBJCHRWORK3				(18+SVWK_START)
#define		OBJCHRWORK4				(19+SVWK_START)
#define		OBJCHRWORK5				(20+SVWK_START)
#define		OBJCHRWORK6				(21+SVWK_START)
#define		OBJCHRWORK7				(22+SVWK_START)
#define		OBJCHRWORK8				(23+SVWK_START)
#define		OBJCHRWORK9				(24+SVWK_START)
#define		OBJCHRWORK10			(25+SVWK_START)
#define		OBJCHRWORK11			(26+SVWK_START)
#define		OBJCHRWORK12			(27+SVWK_START)
#define		OBJCHRWORK13			(28+SVWK_START)
#define		OBJCHRWORK14			(29+SVWK_START)
#define		OBJCHRWORK15			(30+SVWK_START)
#define		OBJCHRWORK16			(31+SVWK_START)

//リサイクルおやじ用
#define		WK_RECYCLE_GOODS		(32+SVWK_START)

//むしよけが効く間の歩数カウンタ
#define		WK_SPRAY_COUNT			(33+SVWK_START)

//氷を踏んだ回数(ルネジム）
#define		WK_ICE_COUNT			(34+SVWK_START)

//初めてもらったポケモン
#define		WK_FIRST_POKE			(35+SVWK_START)

//マボロシジマの出現制御
#define		WK_MABOROSI_RND_H		(36+SVWK_START)
#define		WK_MABOROSI_RND_L		(37+SVWK_START)

//自分の秘密基地があるマップナンバー
#define		WK_BASE_MAPNO			(38+SVWK_START)

//サイクリングロード当たり回数
#define		WK_CYCLE_ROAD_HIT		(39+SVWK_START)

//サイクリングロード(計測時間)
#define		WK_CYCLE_ROAD_TIME1		(40+SVWK_START)
#define		WK_CYCLE_ROAD_TIME2		(41+SVWK_START)

//なつき度制御用歩数カウント
#define		WK_FRIENDLY_STEP_COUNT	(42+SVWK_START)
//毒ダメージ制御用歩数カウント
#define		WK_POISON_STEP_COUNT	(43+SVWK_START)

// ゲーム内時間再設定許可
// デバッグ機能、ゲーム内では設定できない
#define		WK_GAMETIME_RESET		(44+SVWK_START)

//ナゾの実入手許可ワーク
#define		WK_RAM_SEED_GET			(45+SVWK_START)

//前回時間を計測した時の日数
#define		EV_ONE_DAY_WORK			(64+SVWK_START)

//ファン企画
#define		EV_FAN_WORK				(65+SVWK_START)
#define		EV_FAN_TIME				(66+SVWK_START)

//現在の階(エレベータ用)
#define		WK_ELEVATOR_NO			(67+SVWK_START)

//からくり大王の挑戦レベル
#define		WK_KARAKURI_LEVEL		(68+SVWK_START)

//ポケモンくじのあたり賞品
#define		WK_POKELOT_PRIZE		(69+SVWK_START)

//ずかんの全国モード、ホウエンモード
#define		WK_SPECIAL_ZUKAN		(70+SVWK_START)

//おおきさオヤジの記録
#define		WK_SIZE_KINOKOKO_OYAJI_RECORD	(71+SVWK_START)

//灰をあつめた数
#define		WK_ASH_GATHER_COUNT		(72+SVWK_START)

//評価システム開始日数
#define		WK_HYOUKA_DAYS			(73+SVWK_START)

//アクア号のデモ中の歩数カウンタ
#define		WK_CRUISE_COUNT			(74+SVWK_START)

//ポケモンくじの当選ナンバー用ランダム
#define		WK_POKELOT_RND1			(75+SVWK_START)
#define		WK_POKELOT_RND2			(76+SVWK_START)

//廃止
//#define		WK_EX_SCRIPT1			(77+SVWK_START)
//#define		WK_EX_SCRIPT2			(78+SVWK_START)

//おおきさオヤジの記録
#define		WK_SIZE_NAMAZO_OYAJI_RECORD	(79+SVWK_START)


//#define SYSWORK_MAX			80なので注意！！


#endif	/*__SYSWORK_H__*/


