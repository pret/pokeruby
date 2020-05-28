#ifndef	__SYSFLAG_H__
#define	__SYSFLAG_H__

#include "evwkdef.h"

//-------------------------------------------------------------
//	システム定義のフラグ（セーブするもの）
//-------------------------------------------------------------
// SYSFLAG_STARTはevwkdef.hで定義

#define	SYS_POKEMON_GET			(SYSFLAG_START+ 0)		/* ポケモンを捕まえた */
#define	SYS_ZUKAN_GET			(SYSFLAG_START+ 1)		/* ずかんをもらった */
#define	SYS_POKEGEAR_GET		(SYSFLAG_START+ 2)		/* トレナビをもらった */
//#define	SYS_MENU_HOOK			(SYSFLAG_START+ 3)		/* メニューを出さない */
#define	SYS_GAME_CLEAR			(SYSFLAG_START+ 4)		/* ゲームをクリアした */
#define SYS_KAIWA_USED			(SYSFLAG_START+ 5)		/* 簡易会話を使った */
#define SYS_NOW_OYAJI_MEET		(SYSFLAG_START+ 6)		/* ナウいオヤジにあった */
#define	SYS_BATCH01_GET			(SYSFLAG_START+ 7)		/* バッチ01もらった */
#define	SYS_BATCH02_GET			(SYSFLAG_START+ 8)		/* バッチ02もらった */
#define	SYS_BATCH03_GET			(SYSFLAG_START+ 9)		/* バッチ03もらった */
#define	SYS_BATCH04_GET			(SYSFLAG_START+ 10)		/* バッチ04もらった */
#define	SYS_BATCH05_GET			(SYSFLAG_START+ 11)		/* バッチ05もらった */
#define	SYS_BATCH06_GET			(SYSFLAG_START+ 12)		/* バッチ06もらった */
#define	SYS_BATCH07_GET			(SYSFLAG_START+ 13)		/* バッチ07もらった */
#define	SYS_BATCH08_GET			(SYSFLAG_START+ 14)		/* バッチ08もらった */

#define	SYS_T101_ARRIVE		(SYSFLAG_START+ 15)	/* ミシロに到着した */
#define	SYS_T102_ARRIVE		(SYSFLAG_START+ 16)	/* コトキに到着した */
#define	SYS_T103_ARRIVE		(SYSFLAG_START+ 17)	/* ムロに到着した */
#define	SYS_T104_ARRIVE		(SYSFLAG_START+ 18)	/* フエンに到着した */
#define	SYS_T105_ARRIVE		(SYSFLAG_START+ 19)	/* ハジツゲに到着した */
#define	SYS_T106_ARRIVE		(SYSFLAG_START+ 20)	/* シダケに到着した */
#define	SYS_T107_ARRIVE		(SYSFLAG_START+ 21)	/* キナギに到着した */

#define	SYS_C101_ARRIVE		(SYSFLAG_START+ 22)	/* トウカに到着した */
#define	SYS_C102_ARRIVE		(SYSFLAG_START+ 23)	/* カイナに到着した */
#define	SYS_C103_ARRIVE		(SYSFLAG_START+ 24)	/* キンセツに到着した */
#define	SYS_C104_ARRIVE		(SYSFLAG_START+ 25)	/* カナズミに到着した */
#define	SYS_C105_ARRIVE		(SYSFLAG_START+ 26)	/* ヒワマキに到着した */
#define	SYS_C106_ARRIVE		(SYSFLAG_START+ 27)	/* ミナモに到着した */
#define	SYS_C107_ARRIVE		(SYSFLAG_START+ 28)	/* トクサネに到着した */
#define	SYS_C108_ARRIVE		(SYSFLAG_START+ 29)	/* ルネに到着した */
#define	SYS_C109_ARRIVE		(SYSFLAG_START+ 30)	/* サイユウに到着した */

#define SYS_USE_WAZA_FLASH		(SYSFLAG_START+ 40)	/* フラッシュ使用中 */
#define SYS_USE_WAZA_KAIRIKI	(SYSFLAG_START+ 41)	/* かいりき使用中 */
#define SYS_WEATHER_CTRL	(SYSFLAG_START+ 42)	/* 大雨中 */
#define SYS_CYCLING_ROAD	(SYSFLAG_START+ 43) /* サイクリングロードにいる */
#define SYS_SAFARI_MODE		(SYSFLAG_START+ 44) /* サファリモードかどうか */
#define	SYS_CRUISE_MODE		(SYSFLAG_START+ 45) /* 船移動デモモードかどうか */

#define SYS_TV_HOME			(SYSFLAG_START+ 48)	/* 自宅TV見れるか */
#define SYS_TV_WATCH		(SYSFLAG_START+ 49)	/* 部屋でTVを見たか */
#define SYS_TV_START		(SYSFLAG_START+ 50)	/* TV企画スタート */

#define SYS_POPWORD_INPUT   (SYSFLAG_START+51)  /* 流行語を教えた */
#define SYS_MIX_RECORD      (SYSFLAG_START+52)  /* レコードコーナー通信をした */
#define SYS_CLOCK_SET		(SYSFLAG_START+53)	/* 時計をセットした */

#define SYS_SPECIAL_ZUKAN	(SYSFLAG_START+54)	/* ずかんの全国、ホウエンモード */

#define SYS_CAVE_SHIP		(SYSFLAG_START+55)	/* 洞窟に入った：ちんぼつせん */
#define SYS_CAVE_WONDER		(SYSFLAG_START+56)	/* 洞窟に入った：ふしぎなどうくつ */
#define SYS_CAVE_BATTLE		(SYSFLAG_START+57)	/* 洞窟に入った：バトルタワー */

#define	SYS_ASASE_TIDE		(SYSFLAG_START+58)	/* 浅瀬の洞窟が満潮かどうか */

#define	SYS_RIBBON_GET      (SYSFLAG_START+59)  /* リボンをもらったことがあるか？ */

/* それぞれの施設を訪れたことがあるか？ */
#define SYS_ARRIVE_FROWERSHOP      (SYSFLAG_START+60)  // フラワーショップ
#define SYS_ARRIVE_HAGIHOUSE       (SYSFLAG_START+61)  // ハギろうじんのいえ
#define SYS_ARRIVE_JUNKSHIP        (SYSFLAG_START+62)  // すてられぶね
#define SYS_ARRIVE_MARINEHOUSE     (SYSFLAG_START+63)  // うみのいえ
#define SYS_ARRIVE_NEWKINSETSU     (SYSFLAG_START+64)  // ニューキンセツ
#define SYS_ARRIVE_GENKIHOUSE      (SYSFLAG_START+65)  // げんきになるいえ
#define SYS_ARRIVE_KARAKURIYASHIKI (SYSFLAG_START+66)  // カラクリやしき
#define SYS_ARRIVE_BATTLEFAMILY    (SYSFLAG_START+67)  // バトルいっか
#define SYS_ARRIVE_GRASSSHOP       (SYSFLAG_START+68)  // ガラスざいくのみせ
#define SYS_ARRIVE_MAYUMIHOUSE     (SYSFLAG_START+69)  // マユミのいえ
#define SYS_ARRIVE_POKEMONBREEDER  (SYSFLAG_START+70)  // ポケモンそだてや
#define SYS_ARRIVE_SUBMARINECAVE   (SYSFLAG_START+71)  // かいていどうくつ
#define SYS_ARRIVE_BATTLETOWER     (SYSFLAG_START+72)  // バトルタワー
#define SYS_ARRIVE_ISLAND          (SYSFLAG_START+73)  // みなみのことう
#define SYS_ARRIVE_FIREROAD        (SYSFLAG_START+74)  // ほのおのぬけみち

#define SYS_PASO_MAYUMI		       (SYSFLAG_START+75)  // マユミのパソコンになる

#define	SYS_EXDATA_ENABLE			(SYSFLAG_START+76)	//『ふしぎなできごと』フラグ

#define	SYS_ENC_UP_ITEM				(SYSFLAG_START+77)	//しろいビードロを使った
#define	SYS_ENC_DOWN_ITEM			(SYSFLAG_START+78)	//くろいビードロを使った

#define	SYS_TENJI_ANAWOHORU			(SYSFLAG_START+79)	//点字の洞窟「あなをほる」使用した
#define	SYS_TENJI_KAIRIKI			(SYSFLAG_START+80)	//点字の洞窟「かいりき」使用した
#define	SYS_TENJI_WAIT				(SYSFLAG_START+81)	//点字の洞窟 待った
#define	SYS_TENJI_SORAWOTOBU		(SYSFLAG_START+82)	//点字の洞窟「そらをとぶ」使用した

#define	SYS_KOKORO_EVENT			(SYSFLAG_START+83)	//南の孤島イベント許可フラグ

/* それぞれの施設を訪れたことがあるか？ */
#define SYS_ARRIVE_LEAGUE			(SYSFLAG_START+84)  // ポケモンリーグ
#define SYS_ARRIVE_YOKOANA			(SYSFLAG_START+85)  // こじまのよこあな
#define SYS_ARRIVE_ISEKI			(SYSFLAG_START+86)  // さばくいせき
#define SYS_ARRIVE_KASEKIMANIA		(SYSFLAG_START+87)  // かせきマニアの家
#define SYS_ARRIVE_IWATO			(SYSFLAG_START+88)  // ひでりのいわと
#define SYS_ARRIVE_KODAIDUKA		(SYSFLAG_START+89)  // こだいづか
#define SYS_ARRIVE_TUMESYO			(SYSFLAG_START+90)  // さぎょういんつめしょ
#define SYS_ARRIVE_HUNTER			(SYSFLAG_START+91)  // ハンターのこや
#define SYS_ARRIVE_SEKISITSU		(SYSFLAG_START+92)  // おふれのせきしつ

#define SYS_MOVE_POKE_NEWS			(SYSFLAG_START+93)  // ＴＶで移動ポケモンニュース流れる

/* それぞれの施設を訪れたことがあるか？ */
#define SYS_ARRIVE_SORANOHASHIRA	(SYSFLAG_START+94)  // そらのはしら

#define SYS_ASASE_ITEM				(SYSFLAG_START+95)  // 浅瀬の洞窟アイテム戻す許可フラグ
#define SYS_B_DASH					(SYSFLAG_START+96)  // Bダッシュ許可フラグ

#define	SYS_CTRL_OBJ_DELETE			(SYSFLAG_START+97)	// OBJを消すタイミングの制御に使用する
														// ※マップ遷移時にクリアされる

#define	SYS_GAMETIME_RESET			(SYSFLAG_START+98)	// ゲーム内時間再設定許可
														// デバッグ機能、ゲーム内では設定できない

#define SYS_ARRIVE_KINOMIMEIJIN 	(SYSFLAG_START+99)   // きのみ名人の家を訪れたことがあるか？

//-------------------------------------------------------------
//	時間経過イベントのフラグ
//	※システムにより一日一度クリアされる
//-------------------------------------------------------------
// TIMEFLAG_START はevwkdef.hで定義
#define TMFLG_SEED_ZYOURO		(TIMEFLAG_START+ 0)		/* タネの水やり */
#define TMFLG_SEED_PRESENT		(TIMEFLAG_START+ 1)		/* タネのプレゼント */
#define	TMFLG_ORUSUBAN_BATTLE	(TIMEFLAG_START+ 2)		/* お留守番対戦 */
#define TMFLG_POPWORD_CHANGE	(TIMEFLAG_START+ 3)		/* 流行語の変動 */
#define TMFLG_POPWORD_INPUT		(TIMEFLAG_START+ 4)		/* 流行語の変更 */
#define	TMFLG_WEATHER			(TIMEFLAG_START+ 5)		/* 天候の変動 */
#define	TMFLG_BATTLETOWER		(TIMEFLAG_START+ 6)		/* バトルタワー */
#define TMFLG_RECORDCORNER		(TIMEFLAG_START+ 7)		/* レコードコーナー */
#define TMFLG_CONTEST			(TIMEFLAG_START+ 8)		/* コンテスト */
#define TMFLG_MUSHITORI			(TIMEFLAG_START+ 9)		/* 虫取り大会 */
#define TMFLG_POKEMON_LOT		(TIMEFLAG_START+10)		/* ポケモンくじをチェックしたかどうか */
#define TMFLG_SEED_PRESENT_02	(TIMEFLAG_START+11)		/* タネのプレゼント(ロード１１４) */
#define TMFLG_SEED_PRESENT_03	(TIMEFLAG_START+12)		/* タネのプレゼント(ロード１１１) */
#define TMFLG_SEED_PRESENT_04	(TIMEFLAG_START+13)		/* タネのプレゼント(ロード１２３) */
#define TMFLG_SEED_PRESENT_05	(TIMEFLAG_START+14)		/* タネのプレゼント(ロード１２０) */
#define TMFLG_SEED_PRESENT_06	(TIMEFLAG_START+15)		/* タネのプレゼント(ミナモ) */
#define TMFLG_SEED_PRESENT_07	(TIMEFLAG_START+16)		/* タネのプレゼント(花屋) */
#define TMFLG_SEED_PRESENT_08	(TIMEFLAG_START+17)		/* タネのプレゼント(ロード１２３) */
#define TMFLG_SEED_PRESENT_09	(TIMEFLAG_START+18)		/* タネのプレゼント(ルネ) */
#define TMFLG_WAZA_PRESENT		(TIMEFLAG_START+19)		/* 技のプレゼント */




//-------------------------------------------------------------
//	システム定義のフラグ（セーブしないもの）
//-------------------------------------------------------------
#define	CTRL_FLAG_START	SCFLG_START
#define	CTRL_MAPNAME_HIDE	(CTRL_FLAG_START+ 0)		/* マップ名表示の制御 */
#define	CTRL_BGM_CHANGE		(CTRL_FLAG_START+ 1)		/* BGM切り替えの制御 */

#endif	/* __SYSFLAG_H__ */
