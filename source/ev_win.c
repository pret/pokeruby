//=========================================================================
//
//				スクリプトからのウィンドウ制御
//
//=========================================================================
#include "common.h"
#include "print.h"
#include "field.h"
#include "task.h"
#include "palanm.h"
#include "menutool.h"
#include "script.h"
#include "fld_task.h"
#include "mus_tool.h"
#include "decord.h"
#include "sysflag.h"
#include "message.h"


//-------------------------------------------------------------------------
//								定義
//-------------------------------------------------------------------------
#define	ANS_NOTHING		0xff			//こたえがない状態
#define ANS_CANCEL		127				//Bキャンセル


//-------------------------------------------------------------------------
//							プロトタイプ宣言
//-------------------------------------------------------------------------
static void ev_win_task(u8 no);
static void yes_no_task(u8 no);
static void EvWinInit(u8,u8,u8,const MENU_ITEM *,u8,u8);
static void EvMenuInit(u8,u8,u8,const MENU_ITEM *,u8);
u8 AddScriptEvHVWinTask(u8,u8,u8,u8,u8);
static void ev_HV_win_task(u8 no);
static void EvWinParameterSet(u8,u8,u8,u8,u8,u8);


//-------------------------------------------------------------------------
//					スクリプトウィンドウ　メッセージデータ
//-------------------------------------------------------------------------
const MENU_ITEM	Hagi_Menu01[]=
{
	{ str_touka,	NULL },	//00:トウカ
	{ str_kaina,	NULL },	//01:カイナ
	{ str_yameru,	NULL }	//02:やめる
};

const MENU_ITEM	contest_menu01[]=
{
	{ ev_win_msg05,	NULL },	//00:さんかする
	{ ev_win_msg06,	NULL },	//01:せつめいをきく
	{ str_yameru,	NULL }	//02:やめる
};

const MENU_ITEM	contest_menu02[]=
{
	{ ev_win_msg08,	NULL },	//00:ポケモンコンテストって？
	{ ev_win_msg09,	NULL },	//01:コンテストのしゅるい
	{ ev_win_msg10,	NULL },	//02:ランクについて
	{ str_yameru,	NULL }	//03:やめる
};

const MENU_ITEM	contest_menu03[]=
{
	{ ev_win_msg12,	NULL },	//00:かっこよさコンテスト
	{ ev_win_msg13,	NULL },	//01:うつくしさコンテスト
	{ ev_win_msg14,	NULL },	//02:かわいさコンテスト
	{ ev_win_msg15,	NULL },	//03:かしこさコンテスト
	{ ev_win_msg16,	NULL },	//04:たくましさコンテスト
	{ str_yameru,	NULL }	//05:やめる
};

const MENU_ITEM MineBoardMenu[] =
{
	{ str_moyougae, NULL },	//00:もようがえ
	{ str_hikkosi,  NULL },	//01:ひっこし
	{ str_t_list,   NULL },	//02:とうろく　リスト
	{ str_yameru, NULL }	//03:やめる
};

const MENU_ITEM MineBoardMenu2[] =
{
	{ str_moyougae, NULL },	//00:もようがえ
	{ str_hikkosi,  NULL },	//01:ひっこし
	{ str_yameru, NULL }	//03:やめる
};

const MENU_ITEM OtherBoardMenu[] =
{
	{ str_touroku,  NULL },	//00:とうろく
	{ str_t_list,   NULL },	//01:とうろく　リスト
	{ str_t_list_s, NULL },	//01:とうろく　せつめい
	{ str_yameru,   NULL }	//02:やめる
};

const MENU_ITEM Bicycle_Menu01[] =
{
	{ str_mahha,  NULL },	//00:マッハ
	{ str_daato,  NULL },	//01:ダート
};

const MENU_ITEM BlackBoard_Menu01[] =
{
	{ str_doku,  NULL },	//00:どく
	{ str_mahi,  NULL },	//01:まひ
	{ str_nemuri,  NULL },	//02:ねむり
	{ str_yakedo,  NULL },	//03:やけど
	{ str_koori,  NULL },	//04:こおり
	{ str_yameru, NULL }	//05:やめる
};

const MENU_ITEM	Hagi_Menu02[]=
{
	{ str_muro,	NULL },		//00:ムロ
	{ str_yameru, NULL }	//01:やめる
};

const MENU_ITEM	museum_Menu01[]=
{
	{str_mimasita,	NULL },	//00:みました
	{str_korekara,	NULL }	//01:これから
};

const MENU_ITEM comm_battle_Menu01[]=
{
	{str_yes,		NULL },
	{str_no,		NULL },
	{ev_win_msg06,	NULL },
};

const MENU_ITEM comm_battle_Menu02[]=
{
	{str_s_battle,	NULL },
	{str_d_battle,	NULL },
	{str_m_battle,	NULL },
	{str_yameru,	NULL },
};

const MENU_ITEM kusunoki_Menu01[] =
{
	{ str_misiro,	NULL },	//00:ミシロ
	{ str_kaina,	NULL },	//01:カイナ
	{ str_minamo,	NULL },	//02:ミナモ
};

const MENU_ITEM introduce_Menu01[]=
{
	{str_yes,		NULL },	//00:はい
	{str_no,		NULL },	//01：いいえ
	{ ev_win_msg06,	NULL },	//02：せつめいをきく
};

const MENU_ITEM BattleTowerMenu[] =
{
	{ str_btmenu00,	NULL },	//00:ちょうせんする
	{ str_btmenu01,	NULL },	//01:せつめいをきく
	{ str_yameru,	NULL }	//02:やめる
};

const MENU_ITEM BattleTowerLevelMenu[] =
{
	{ str_btlvmenu00,	NULL },	//00:レベル50
	{ str_btlvmenu01,	NULL },	//01:レベル100
	{ str_yameru,		NULL }	//02:やめる
};

const MENU_ITEM KarakuriQuizMenu11[] =
{
	{ str_quiz11_01,	NULL },	//00:タネボー
	{ str_quiz11_02,	NULL },	//01:ツチニン
	{ str_quiz11_03,	NULL }	//02:ポチエナ
};

const MENU_ITEM KarakuriQuizMenu12[] =
{
	{ str_quiz12_01,	NULL },	//00:ツチニン
	{ str_quiz12_02,	NULL },	//01:ハスボー
	{ str_quiz12_03,	NULL }	//02:タネボー
};

const MENU_ITEM KarakuriQuizMenu13[] =
{
	{ str_quiz13_01,	NULL },	//00:キノココ
	{ str_quiz13_02,	NULL },	//01:ツチニン
	{ str_quiz13_03,	NULL }	//02:アメタマ
};

const MENU_ITEM KarakuriQuizMenu21[] =
{
	{ str_quiz21_01,	NULL },	//00:ジュモリ
	{ str_quiz21_02,	NULL },	//01:アチャモ
	{ str_quiz21_03,	NULL }	//02:ミズゴロウ
};

const MENU_ITEM KarakuriQuizMenu22[] =
{
	{ str_quiz22_01,	NULL },	//00:ジグザグマ
	{ str_quiz22_02,	NULL },	//01:キノココ
	{ str_quiz22_03,	NULL }	//02:パッチール
};

const MENU_ITEM KarakuriQuizMenu23[] =
{
	{ str_quiz23_01,	NULL },	//00:キノココ
	{ str_quiz23_02,	NULL },	//01:ジグザグマ
	{ str_quiz23_03,	NULL }	//02:ケムッソ
};

const MENU_ITEM KarakuriQuizMenu31[] =
{
	{ str_quiz31_01,	NULL },	//00:モンスターボール
	{ str_quiz31_02,	NULL },	//01:いいキズぐすり
	{ str_quiz31_03,	NULL }	//02:おなじねだん
};

const MENU_ITEM KarakuriQuizMenu32[] =
{
	{ str_quiz32_01,	NULL },	//00:１３５えん
	{ str_quiz32_02,	NULL },	//01:１５５えん
	{ str_quiz32_03,	NULL }	//02:１７５えん
};

const MENU_ITEM KarakuriQuizMenu33[] =
{
	{ str_quiz33_01,	NULL },	//00:たかくなる
	{ str_quiz33_02,	NULL },	//01:やすくなる
	{ str_quiz33_03,	NULL }	//02:おなじねだん
};

const MENU_ITEM KarakuriQuizMenu41[] =
{
	{ str_quiz41_01,	NULL },	//00:オス
	{ str_quiz41_02,	NULL },	//01:メス
	{ str_quiz41_03,	NULL }	//02:どっちでもない
};

const MENU_ITEM KarakuriQuizMenu42[] =
{
	{ str_quiz42_01,	NULL },	//00:だんせい
	{ str_quiz42_02,	NULL },	//01:じょせい
	{ str_quiz42_03,	NULL }	//02:おなじかず
};

const MENU_ITEM KarakuriQuizMenu43[] =
{
	{ str_quiz43_01,	NULL },	//00:だんせい
	{ str_quiz43_02,	NULL },	//01:じょせい
	{ str_quiz43_03,	NULL }	//02:きまってない
};

const MENU_ITEM KarakuriQuizMenu51[] =
{
	{ str_quiz51_01,	NULL },	//00:６だい
	{ str_quiz51_02,	NULL },	//01:８だい
	{ str_quiz51_03,	NULL }	//02:１０だい
};

const MENU_ITEM KarakuriQuizMenu52[] =
{
	{ str_quiz52_01,	NULL },	//00:ひとり
	{ str_quiz52_02,	NULL },	//01:ふたり
	{ str_quiz52_03,	NULL }	//02:さんにん
};

const MENU_ITEM KarakuriQuizMenu53[] =
{
	{ str_quiz53_01,	NULL },	//00:６つ
	{ str_quiz53_02,	NULL },	//01:７つ
	{ str_quiz53_03,	NULL }	//02:８つ
};

const MENU_ITEM VendingMachineMenu[] =
{
	{ str_VM01_01,	NULL },	//00:おいしいみず　２００円
	{ str_VM01_02,	NULL },	//02:サイコソーダ　３００円
	{ str_VM01_03,	NULL },	//03:ミックスオレ　３５０円
	{ str_yameru,	NULL },	//04:やめる
};

const MENU_ITEM KazenoMenu01[] =
{
	{ str_hasirikata,	NULL },	//00:はしりかた
	{ str_magarukotsu,	NULL },	//01:まがるコツ
	{ str_sunanosaka,	NULL },	//02:すなのさか
	{ str_yameru,		NULL }	//03:やめる
};

const MENU_ITEM KazenoMenu02[] =
{
	{ str_uirii,		NULL },	//00:ウィリー
	{ str_danieru,		NULL },	//01:ダニエル
	{ str_jump,			NULL },	//02:ジャンプ
	{ str_yameru,		NULL }	//03:やめる
};

const MENU_ITEM TVTowerMenu01[] =
{
	{ str_manzoku,		NULL },	//00:まんぞく
	{ str_human,		NULL },	//01:ふまん
};

const MENU_ITEM SinkaiItemMenu[] =
{
	{ str_kiba,		NULL },	//00:しんかいのキバ
	{ str_uroko,	NULL },	//01:しんかいのウロコ
	{ str_yameru,	NULL },	//02:やめる
};

const MENU_ITEM PekoMenu[] =
{
	{ str_aoibi,		NULL },		//00あおいビードロ
	{ str_kiirobi,		NULL },		//01きいろいビードロ
	{ str_akaibi,		NULL },		//02あかいビードロ
	{ str_shiroibi,		NULL },		//03しろいビードロ
	{ str_kuroibi,		NULL },		//04くろいビードロ
	{ str_garasunoisu,	NULL },		//05ガラスのいす
	{ str_garasunotukue,NULL },		//06ガラスのつくえ
	{ str_yameru,		NULL },		//07:やめる
};

const MENU_ITEM KeihinMenu[] =
{
	{ str_item_keihin01,		NULL },	//00:ジュモリドール
	{ str_item_keihin02,		NULL },	//01:アチャモドール
	{ str_item_keihin03,		NULL },	//02:ミズゴロウドール
	{ str_yameru,	NULL },				//06:やめる
};

const MENU_ITEM KeihinWazaMenu[] =
{
	{ str_waza_keihin01,		NULL },	//00:技マシン３２
	{ str_waza_keihin02,		NULL },	//01:技マシン２９
	{ str_waza_keihin03,		NULL },	//02:技マシン３５
	{ str_waza_keihin04,		NULL },	//03:技マシン２４
	{ str_waza_keihin05,		NULL },	//04:技マシン１３
	{ str_yameru,	NULL },				//05:やめる
};

const MENU_ITEM KeihinCoinMenu[] =
{
	{ str_coin_50,		NULL },			//00:５０まい
	{ str_coin_500,		NULL },			//01:５００まい
	{ str_yameru,	NULL },				//02:やめる
};

const MENU_ITEM TsuriMenu[] =
{
	{ str_tsuri_batugun,		NULL },			//00:ばつぐん
	{ str_tsuri_anmari,			NULL },			//01:あんまり
};

const MENU_ITEM Renrakusen_Menu[] =
{
	{ str_minamo,	NULL },						//00:ミナモ
	{ str_tower,	NULL },						//01:バトルタワー
	{ str_yameru,	NULL },						//04:やめる
};

const MENU_ITEM	TowerHune_Menu01[]=
{
	{ str_kaina,	NULL },	//00:カイナ
	{ str_minamo,	NULL },	//01:ミナモ
	{ str_yameru,	NULL }	//02:やめる
};

const MENU_ITEM	RightLeftMenu[]=
{
	{ str_right,		NULL },					//00:右
	{ str_left,		NULL },						//01:左
};

const MENU_ITEM Renrakusen2_Menu[] =
{
	{ str_kaina,	NULL },						//00:カイナ
	{ str_tower,	NULL },						//01:バトルタワー
	{ str_yameru,	NULL },						//04:やめる
};

const MENU_ITEM Elevator_Menu[] =
{
	{ str_1kai,	NULL },							//00:１かい
	{ str_2kai,	NULL },							//01:２かい
	{ str_3kai,	NULL },							//02:３かい
	{ str_4kai,	NULL },							//03:４かい
	{ str_5kai,	NULL },							//04:５かい
};

const MENU_ITEM TreasureExchangeMenuRNNN[] =
{
	{ str_hunter_item_r,	NULL },			//00:あかいかけら
	{ str_yameru,			NULL },			//01:やめる
};

const MENU_ITEM TreasureExchangeMenuNYNN[] =
{
	{ str_hunter_item_y,	NULL },			//00:きろいのかけら
	{ str_yameru,			NULL },			//01:やめる
};

const MENU_ITEM TreasureExchangeMenuRYNN[] =
{
	{ str_hunter_item_r,	NULL },			//00:あかいかけら
	{ str_hunter_item_y,	NULL },			//01:きろいのかけら
	{ str_yameru,			NULL },			//02:やめる
};

const MENU_ITEM TreasureExchangeMenuNNBN[] =
{
	{ str_hunter_item_b,	NULL },			//00:あおいかけら
	{ str_yameru,			NULL },			//01:やめる
};

const MENU_ITEM TreasureExchangeMenuRNBN[] =
{
	{ str_hunter_item_r,	NULL },			//00:あかいかけら
	{ str_hunter_item_b,	NULL },			//01:あおいかけら
	{ str_yameru,			NULL },			//02:やめる
};

const MENU_ITEM TreasureExchangeMenuNYBN[] =
{
	{ str_hunter_item_y,	NULL },			//00:きろいのかけら
	{ str_hunter_item_b,	NULL },			//01:あおいかけら
	{ str_yameru,			NULL },			//02:やめる
};

const MENU_ITEM TreasureExchangeMenuRYBN[] =
{
	{ str_hunter_item_r,	NULL },			//00:あかいかけら
	{ str_hunter_item_y,	NULL },			//01:きろいのかけら
	{ str_hunter_item_b,	NULL },			//02:あおいかけら
	{ str_yameru,			NULL },			//03:やめる
};

const MENU_ITEM TreasureExchangeMenuNNNG[] =
{
	{ str_hunter_item_g,	NULL },			//00:みどりのかけら
	{ str_yameru,			NULL },			//01:やめる
};

const MENU_ITEM TreasureExchangeMenuRNNG[] =
{
	{ str_hunter_item_r,	NULL },			//00:あかいかけら
	{ str_hunter_item_g,	NULL },			//01:みどりのかけら
	{ str_yameru,			NULL },			//02:やめる
};

const MENU_ITEM TreasureExchangeMenuNYNG[] =
{
	{ str_hunter_item_y,	NULL },			//00:きろいのかけら
	{ str_hunter_item_g,	NULL },			//01:みどりのかけら
	{ str_yameru,			NULL },			//02:やめる
};

const MENU_ITEM TreasureExchangeMenuRYNG[] =
{
	{ str_hunter_item_r,	NULL },			//00:あかいかけら
	{ str_hunter_item_y,	NULL },			//01:きろいのかけら
	{ str_hunter_item_g,	NULL },			//02:みどりのかけら
	{ str_yameru,			NULL },			//03:やめる
};

const MENU_ITEM TreasureExchangeMenuNNBG[] =
{
	{ str_hunter_item_b,	NULL },			//00:あおいかけら
	{ str_hunter_item_g,	NULL },			//01:みどりのかけら
	{ str_yameru,			NULL },			//02:やめる
};

const MENU_ITEM TreasureExchangeMenuRNBG[] =
{
	{ str_hunter_item_r,	NULL },			//00:あかいかけら
	{ str_hunter_item_b,	NULL },			//01:あおいかけら
	{ str_hunter_item_g,	NULL },			//02:みどりのかけら
	{ str_yameru,			NULL },			//03:やめる
};

const MENU_ITEM TreasureExchangeMenuNYBG[] =
{
	{ str_hunter_item_y,	NULL },			//00:きろいのかけら
	{ str_hunter_item_b,	NULL },			//01:あおいかけら
	{ str_hunter_item_g,	NULL },			//02:みどりのかけら
	{ str_yameru,			NULL },			//03:やめる
};

const MENU_ITEM TreasureExchangeMenuRYBG[] =
{
	{ str_hunter_item_r,	NULL },			//00:あかいかけら
	{ str_hunter_item_y,	NULL },			//01:きろいのかけら
	{ str_hunter_item_b,	NULL },			//02:あおいかけら
	{ str_hunter_item_g,	NULL },			//03:みどりのかけら
	{ str_yameru,			NULL },			//04:やめる
};

const MENU_ITEM	Dummy_Menu[]=
{
	{ str_yameru,	NULL }	//00:やめる
};

typedef struct{
	const MENU_ITEM * const	buf;
	u8	max;						//MENU_ITEMの中身の数
}EvWinMenuWork;

const EvWinMenuWork ev_win[]={
	{Hagi_Menu01,			NELEMS(Hagi_Menu01)},
	{Dummy_Menu,			NELEMS(Dummy_Menu)},
	{contest_menu01,		NELEMS(contest_menu01)},
	{contest_menu02,		NELEMS(contest_menu02)},
	{contest_menu03,		NELEMS(contest_menu03)},
	{MineBoardMenu2,		NELEMS(MineBoardMenu2)},		//2002/08/13 by nakahiro
	{MineBoardMenu,			NELEMS(MineBoardMenu)},			//2001/10/16 by nakahiro
	{OtherBoardMenu,		NELEMS(OtherBoardMenu)},
	{Dummy_Menu,			NELEMS(Dummy_Menu)},
	{Dummy_Menu,			NELEMS(Dummy_Menu)},
	{Dummy_Menu,			NELEMS(Dummy_Menu)},
	{Dummy_Menu,			NELEMS(Dummy_Menu)},
	{Bicycle_Menu01,		NELEMS(Bicycle_Menu01)},
	{BlackBoard_Menu01,		NELEMS(BlackBoard_Menu01)},
	{Hagi_Menu02,			NELEMS(Hagi_Menu02)},
	{Dummy_Menu,			NELEMS(Dummy_Menu)},
	{museum_Menu01,			NELEMS(museum_Menu01)},
	{comm_battle_Menu01,	NELEMS(comm_battle_Menu01)},
	{comm_battle_Menu02,	NELEMS(comm_battle_Menu02)},
	{kusunoki_Menu01,		NELEMS(kusunoki_Menu01)},
	{introduce_Menu01,		NELEMS(introduce_Menu01)},
	{Dummy_Menu,			NELEMS(Dummy_Menu)},
	{Dummy_Menu,			NELEMS(Dummy_Menu)},
	{BattleTowerMenu,		NELEMS(BattleTowerMenu)},
	{BattleTowerLevelMenu,		NELEMS(BattleTowerLevelMenu)},
	{KarakuriQuizMenu11,	NELEMS(KarakuriQuizMenu11)},
	{KarakuriQuizMenu12,	NELEMS(KarakuriQuizMenu12)},
	{KarakuriQuizMenu13,	NELEMS(KarakuriQuizMenu13)},
	{KarakuriQuizMenu21,	NELEMS(KarakuriQuizMenu21)},
	{KarakuriQuizMenu22,	NELEMS(KarakuriQuizMenu22)},
	{KarakuriQuizMenu23,	NELEMS(KarakuriQuizMenu23)},
	{KarakuriQuizMenu31,	NELEMS(KarakuriQuizMenu31)},
	{KarakuriQuizMenu32,	NELEMS(KarakuriQuizMenu32)},
	{KarakuriQuizMenu33,	NELEMS(KarakuriQuizMenu33)},
	{KarakuriQuizMenu41,	NELEMS(KarakuriQuizMenu41)},
	{KarakuriQuizMenu42,	NELEMS(KarakuriQuizMenu42)},
	{KarakuriQuizMenu43,	NELEMS(KarakuriQuizMenu43)},
	{KarakuriQuizMenu51,	NELEMS(KarakuriQuizMenu51)},
	{KarakuriQuizMenu52,	NELEMS(KarakuriQuizMenu52)},
	{KarakuriQuizMenu53,	NELEMS(KarakuriQuizMenu53)},
	{Dummy_Menu,			NELEMS(Dummy_Menu)},
	{Dummy_Menu,			NELEMS(Dummy_Menu)},
	{VendingMachineMenu,	NELEMS(VendingMachineMenu)},
	{KazenoMenu01,			NELEMS(KazenoMenu01)},
	{KazenoMenu02,			NELEMS(KazenoMenu02)},
	{TVTowerMenu01,			NELEMS(TVTowerMenu01)},
	{SinkaiItemMenu,		NELEMS(SinkaiItemMenu)},
	{PekoMenu,				NELEMS(PekoMenu)},
	{KeihinMenu,			NELEMS(KeihinMenu)},
	{KeihinCoinMenu,		NELEMS(KeihinCoinMenu)},
	{TsuriMenu,				NELEMS(TsuriMenu)},
	{Dummy_Menu,			NELEMS(Dummy_Menu)},
	{Renrakusen_Menu,		NELEMS(Renrakusen_Menu)},
	{TowerHune_Menu01,		NELEMS(TowerHune_Menu01)},
	{RightLeftMenu,			NELEMS(RightLeftMenu)},
	{KeihinWazaMenu,		NELEMS(KeihinWazaMenu)},
	{Renrakusen2_Menu,		NELEMS(Renrakusen2_Menu)},
	{Elevator_Menu,			NELEMS(Elevator_Menu)},
	{TreasureExchangeMenuRNNN,	NELEMS(TreasureExchangeMenuRNNN)},
	{TreasureExchangeMenuNYNN,	NELEMS(TreasureExchangeMenuNYNN)},
	{TreasureExchangeMenuRYNN,	NELEMS(TreasureExchangeMenuRYNN)},
	{TreasureExchangeMenuNNBN,	NELEMS(TreasureExchangeMenuNNBN)},
	{TreasureExchangeMenuRNBN,	NELEMS(TreasureExchangeMenuRNBN)},
	{TreasureExchangeMenuNYBN,	NELEMS(TreasureExchangeMenuNYBN)},
	{TreasureExchangeMenuRYBN,	NELEMS(TreasureExchangeMenuRYBN)},
	{TreasureExchangeMenuNNNG,	NELEMS(TreasureExchangeMenuNNNG)},
	{TreasureExchangeMenuRNNG,	NELEMS(TreasureExchangeMenuRNNG)},
	{TreasureExchangeMenuNYNG,	NELEMS(TreasureExchangeMenuNYNG)},
	{TreasureExchangeMenuRYNG,	NELEMS(TreasureExchangeMenuRYNG)},
	{TreasureExchangeMenuNNBG,	NELEMS(TreasureExchangeMenuNNBG)},
	{TreasureExchangeMenuRNBG,	NELEMS(TreasureExchangeMenuRNBG)},
	{TreasureExchangeMenuNYBG,	NELEMS(TreasureExchangeMenuNYBG)},
	{TreasureExchangeMenuRYBG,	NELEMS(TreasureExchangeMenuRYBG)},
};

//-------------------------------------------------------------------------
//						　文字列の取得用メッセージ
//					ev_win.hにナンバーの定義が書いてある
//-------------------------------------------------------------------------
const u8 * const msg_data_buf[]={
	  str_kakoyosa,
	  str_utukusisa,
	  str_kaiwasa,
	  str_kasikosa,
	  str_takumasisa,
	  str_nomaru,
	  str_suupaa,
	  str_haipaa,
	  str_masutaa,
	  str_kakoii,
	  str_utukusii,
	  str_kawaii,
	  str_kasikosouna,
	  str_takumasii,
	  str_dougu,
	  str_taisetunamono,
	  str_booru,
	  str_wazamashin,
	  str_kinomi,
};


//=========================================================================
//
//					   セレクトウィンドウ
//
//=========================================================================

//-------------------------------------------------------------------------
//
//				セレクトウィンドウ 制御タスクの起動
//
//-------------------------------------------------------------------------
u8 AddScriptEvWinTask(u8 x, u8 y, u8 mojino, u8 check)
{
	if( CheckTask(ev_win_task) == TRUE ) return FALSE;
	AnswerWork = ANS_NOTHING;
	EvWinInit(x, y, ev_win[mojino].max, ev_win[mojino].buf, check, 0);
	return TRUE;
};

//-------------------------------------------------------------------------
//
//				セレクトウィンドウ 制御タスクの起動
//
//				カーソルの初期位置指定
//
//-------------------------------------------------------------------------
u8 AddScriptEvWinCsrTask(u8 x, u8 y, u8 mojino, u8 check, u8 csr)
{
	if( CheckTask(ev_win_task) == TRUE ) return FALSE;
	AnswerWork = ANS_NOTHING;
	EvWinInit(x, y, ev_win[mojino].max, ev_win[mojino].buf, check, csr);
	return TRUE;
};

u16 evwin_strlen_chk( const u8 * );
//--------------------------------------------------------------------
//			特殊コードが含まれている文字列の長さを取得する
//
//			現状	MY_NAME_BUFのみ対応
//
//	戻り値　文字列の長さ
//--------------------------------------------------------------------
u16 evwin_strlen_chk( const u8 *p_str )
{
	u16 count = 0;

	while(*p_str != EOM_)
	{
		//特殊コードだったら
		if( *p_str == I_MSG_ )
		{
			p_str++;
			if( *p_str == MY_NAME_BUF )
			{
				count+=PM_strlen( MyData.my_name );
				p_str++;
			}else
			{
				//とりあえずなし
			}
		}else
		{
			p_str++; 
			count++;
		}

	};

	return count;
}

//-------------------------------------------------------------------------
//-------------------------------------------------------------------------
static void EvWinInit(u8 x, u8 y, u8 max, const MENU_ITEM * menu, u8 check, u8 csr)
{
	u8 i,x2,y2;
	u16 kazu,ret;

	//最大文字数取得
	ret = evwin_strlen_chk( menu[0].msg );
	//ret = PM_strlen( menu[0].msg );
	for( kazu=0,i=1; i < max ;i++)
	{
		kazu = evwin_strlen_chk( menu[i].msg );
		//kazu = PM_strlen( menu[i].msg );
		if( ret < kazu ) 
			ret=kazu;
	}

	x2=(u8)ret;
	x2=x2+x+1+1;	//カーソル分+1
	y2=y+(max*2+1);

	NMenuWinBoxWrite( x, y, x2, y2 );
	NMenuFixListWrite(x+2,y+1,max,menu);
	NMenuVCursorInit(x+1,y+1,max,csr);
	EvWinParameterSet(x,y,x2,y2,check,max);	//パラメータをタスクワークにセット
};

//--------------------------------------------------------------------
//					パラメータをタスクワークにセット
//--------------------------------------------------------------------
static void EvWinParameterSet(u8 x, u8 y, u8 x2, u8 y2, u8 check, u8 max)
{
	u8 no;
	no = AddTask(ev_win_task,80);

	TaskTable[no].work[0] = x;			//workに値保存
	TaskTable[no].work[1] = y;
	TaskTable[no].work[2] = x2;
	TaskTable[no].work[3] = y2;

	TaskTable[no].work[4] = check;		//Bキャンセル有りか

	if( max >= 4 )	TaskTable[no].work[5] = 1;		//選択ループ有り
	else TaskTable[no].work[5] = 0;					//選択ループ無し
};

//-------------------------------------------------------------------------
//				セレクトウィンドウ 	制御タスクの本体
//-------------------------------------------------------------------------
static void ev_win_task(u8 no)
{
	u8 x,y,x2,y2;
	s8 ans;

	//フェード終了待ち
	if(FadeData.fade_sw)	return;

	if( TaskTable[no].work[5] == 0 ) 
		ans = NMenuVCursorControlNoloop();		//カーソルのループ無し
	else
		ans = NMenuVCursorControl();		//カーソルのループ有り

	switch( ans )
	{
	case CURSOR_DEFAULT_VALUE:
		return;

	case CURSOR_CANCEL_VALUE:		//-1	(Bキャンセル)

		//0=Bキャンセル有効	 1以上=Bキャンセル無効
		if( TaskTable[no].work[4] == 0 ) 
		{
			SePlay(SE_SELECT);
			AnswerWork = ANS_CANCEL;
			break;
		}
		return;

	default:
		AnswerWork = (u16)ans;
	};

	x  = TaskTable[no].work[0];
	y  = TaskTable[no].work[1];
	x2 = TaskTable[no].work[2];
	y2 = TaskTable[no].work[3];
	NMenuBoxClear( x, y, x2, y2 );
	DelTask(no);
	ContinueFieldScript();
};


//-------------------------------------------------------------------------
//
//				セレクトメニュー(ウィンドウなし) 制御タスクの起動
//
//-------------------------------------------------------------------------
u8 AddScriptEvMenuTask(u8 x, u8 y, u8 mojino, u8 check)
{
	if( CheckTask(ev_win_task) == TRUE ) return FALSE;
	AnswerWork = ANS_NOTHING;
	EvMenuInit(x, y, ev_win[mojino].max, ev_win[mojino].buf, check);
	return TRUE;
};

//-------------------------------------------------------------------------
//-------------------------------------------------------------------------
static void EvMenuInit(u8 x, u8 y, u8 max, const MENU_ITEM * menu, u8 check)
{
	u8 i,x2,y2;
	u16 kazu,ret;

	//最大文字数取得
	ret = evwin_strlen_chk( menu[0].msg );
	//ret=PM_strlen( menu[0].msg );
	for( kazu=0,i=1; i < max ;i++)
	{
		kazu = evwin_strlen_chk( menu[i].msg );
		//kazu=PM_strlen( menu[i].msg );
		if( ret < kazu ) 
			ret=kazu;
	}

	x2=(u8)ret;
	x2=x2+x+1+1;	//カーソル分+1
	y2=y+(max*2+1);

	NMenuFixListWrite(x+1,y,max,menu);
	NMenuVCursorInit(x,y,max,0);
	EvWinParameterSet(x,y,x2,y2,check,max);	//パラメータをタスクワークにセット
};


//=========================================================================
//
//	スクリプトからのはい・いいえの制御
//
//=========================================================================

//-------------------------------------------------------------------------
//	はい・いいえ制御タスクの起動
//-------------------------------------------------------------------------
u8 AddScriptYesNoTask(u8 x, u8 y)
{
	u8 no;
	if( CheckTask(yes_no_task) == TRUE ) return FALSE;
	AnswerWork = ANS_NOTHING;
	YesNoSelectInit(x,y);
	no = AddTask(yes_no_task,80);
	TaskTable[no].work[0] = x;
	TaskTable[no].work[1] = y;
	return TRUE;
};

//-------------------------------------------------------------------------
//	終了監視ルーチン
//-------------------------------------------------------------------------
u8 EvWaitYesNoEnd(void)
{
	if( AnswerWork == ANS_NOTHING )return FALSE;
	return TRUE;
};

//-------------------------------------------------------------------------
//	はい・いいえ制御タスク本体
//-------------------------------------------------------------------------
static void yes_no_task(u8 no)
{
	u8 x,y;

	if ( TaskTable[no].work[2] <= 4 ) {
		TaskTable[no].work[2] ++;
		return;
	}
	//フェード終了待ち
	//if(FadeData.fade_sw)	return;

	//switch( YesNoSelectMain() )
	switch( NMenuVCursorControlNoloop() )		//カーソルループなし
	{
	case CURSOR_DEFAULT_VALUE:
		return;

	case CURSOR_NO_VALUE:
	case CURSOR_CANCEL_VALUE:
		SePlay(SE_SELECT);
		AnswerWork = FALSE;
		break;

	case CURSOR_YES_VALUE:
		AnswerWork = TRUE;
		break;
	};

	x = TaskTable[no].work[0];
	y = TaskTable[no].work[1];
	NMenuBoxClear( x, y, x+6, y+5 );
	DelTask(no);
	ContinueFieldScript();
};


//-------------------------------------------------------------------------
//
//					縦横ウィンドウ 制御タスクの起動
//
//-------------------------------------------------------------------------
u8 AddScriptEvHVWinTask(u8 x, u8 y, u8 mojino, u8 check, u8 arrange)
{
	u8 no,haba,y2=0;

	if( CheckTask(ev_HV_win_task) == TRUE ) return FALSE;
	AnswerWork = ANS_NOTHING;

	HVSelectInit(x,y,ev_win[mojino].max,0,ev_win[mojino].buf,arrange);
	
	no = AddTask(ev_HV_win_task,80);

	//Yの幅を求める
	if(  ( (ev_win[mojino].max >> 1) >= arrange 
			&& (ev_win[mojino].max & 0x01) == 0 ) 
			|| arrange == 1 || ev_win[mojino].max == arrange )
		y2=y+( (ev_win[mojino].max / arrange)*2+1 );
	else
		y2=y+( (ev_win[mojino].max / arrange + 1)*2+1 );

	haba = NMenuStrWidthGet(arrange);

	TaskTable[no].work[0] = x;			//workに値保存
	TaskTable[no].work[1] = y;
	TaskTable[no].work[2] = x+haba+1+1;
	TaskTable[no].work[3] = y2;

	TaskTable[no].work[4] = check;		//Bキャンセル有りか

	return TRUE;
};

//-------------------------------------------------------------------------
//				縦横ウィンドウ 	制御タスクの本体
//-------------------------------------------------------------------------
static void ev_HV_win_task(u8 no)
{
	u8 x,y,x2,y2;
	s8 ans;

	//フェード終了待ち
	//if(FadeData.fade_sw)	return;
	
	ans = HVSelectMain();
	switch( ans )
	{
	case CURSOR_DEFAULT_VALUE:
		return;

	case CURSOR_CANCEL_VALUE:		//-1	(Bキャンセル)

		//0=Bキャンセル有効	 1以上=Bキャンセル無効
		if( TaskTable[no].work[4] == 0 ) 
		{
			SePlay(SE_SELECT);
			AnswerWork = ANS_CANCEL;
			break;
		}

		return;

	default:
		AnswerWork = (u16)ans;
	};

	x  = TaskTable[no].work[0];
	y  = TaskTable[no].work[1];
	x2 = TaskTable[no].work[2];
	y2 = TaskTable[no].work[3];
	NMenuBoxClear( x, y, x2, y2 );
	DelTask(no);
	ContinueFieldScript();
};

//====================================================================
//
//					パソコンメニュー表示
//		
//====================================================================
u8 AddScriptPasoMenu();
void PasoMenuWriteInit();

#define PASO_MENU_X		0
#define PASO_MENU_Y		0
#define PASO_MENU_MAX	5

extern	u8 msg_paso_start[];

u8 AddScriptPasoMenu()
{
	if( CheckTask(ev_win_task) == TRUE ) return FALSE;
	AnswerWork = ANS_NOTHING;
	//StopFieldScript();
	PasoMenuWriteInit();
	return TRUE;
}

void PasoMenuWriteInit()
{
	u8 max,menu=0;
	u16 ret;

	//最大文字数取得
	ret = evwin_strlen_chk( str_paso03 );
	if( ret > evwin_strlen_chk( str_paso01 ) )	max = ret;	//○○のパソコン = ?
	else	max = 8;										//だれかのパソコン = 8

	//メニューの数を取得
	if( EventFlagCheck(SYS_GAME_CLEAR) )
	{
		menu = 4;
		NMenuWinBoxWrite( PASO_MENU_X, PASO_MENU_Y, 
				PASO_MENU_X+max+2, PASO_MENU_Y+(menu*2)+1 );

		NMenuMsgWrite( str_paso04, PASO_MENU_X+2, PASO_MENU_Y+1+4 );
		NMenuMsgWrite( str_paso05, PASO_MENU_X+2, PASO_MENU_Y+1+6 );
	}else
	{
		menu = 3;
		NMenuWinBoxWrite( PASO_MENU_X, PASO_MENU_Y, 
				PASO_MENU_X+max+2, PASO_MENU_Y+(menu*2)+1 );

		NMenuMsgWrite( str_paso05, PASO_MENU_X+2, PASO_MENU_Y+1+4 );
	}

	//だれかの・マユミのパソコン
	if( EventFlagCheck( SYS_PASO_MAYUMI ) )
		NMenuMsgWrite( str_paso02, PASO_MENU_X+2, PASO_MENU_Y+1 );
	else
		NMenuMsgWrite( str_paso01, PASO_MENU_X+2, PASO_MENU_Y+1 );

	//主人公のパソコン
	NMenuMsgWrite( str_paso03, PASO_MENU_X+2, PASO_MENU_Y+1+2 );

	//カーソル初期化
	NMenuVCursorInit( PASO_MENU_X+1, PASO_MENU_Y+1, menu, 0 );

	EvWinParameterSet(PASO_MENU_X,PASO_MENU_Y,
			PASO_MENU_X+(max)+2,PASO_MENU_Y+(menu*2)+1,0,menu);	//パラメータをタスクワークにセット
}

void PasoMenuWriteInit2()
{
	NMenuTalkWinWrite();
	NMenuMsgWrite( msg_paso_start, 4, 15 );
	return;
}

//=========================================================================
//
//	ポケモン表示ウィンドウ
//
//=========================================================================
//-------------------------------------------------------------------------
//-------------------------------------------------------------------------
extern const u32 DecordAdrs[];
extern u8 FePokeSet( u16 no, s16 x, s16 y, u8 pri );
extern void FePokeDel( actWork *act );

static void FieldPokeCGTask( u8 no );
static u8 EvWaitPokeCGErase( void );


#define POKECG_WINX1		10
#define	POKECG_WINY1		3//5
#define POKECG_WINX2		(9+10)
#define	POKECG_WINY2		(3+10)//(5+10)
#define	POKECG_ACTX			120
#define	POKECG_ACTY			64//80
#define	POKECG_ACTPRI		0
//-------------------------------------------------------------------------
//-------------------------------------------------------------------------
static void FieldPokeCGTask( u8 no )
{
	TASK_TABLE * my;

	my = &TaskTable[no];
	switch( my->work[0] )
	{
	case 0:
		my->work[0]++;
		break;

	case 1:
		/* 外部から操作されるまでこのまま */
		break;

	case 2:
		FePokeDel( &ActWork[ my->work[2] ] );
		my->work[0]++;
		break;
	
	case 3:
		//NMenuBoxClear( POKECG_WINX1, POKECG_WINY1, POKECG_WINX2, POKECG_WINY2 );
		NMenuBoxClear( my->work[3], my->work[4], my->work[3]+9, my->work[4]+10 );
		DelTask( no );
		break;
	};
};

//-------------------------------------------------------------------------
//	フィールドでのポケモンCG表示セット
//-------------------------------------------------------------------------
u8 FieldPokeCGWinOpen( u16 mons_no, u8 x, u8 y )
{
	u8 no,act;

	if( CheckTaskNo( FieldPokeCGTask ) != NOT_EXIST_TASK_ID )return FALSE;

	//NMenuWinBoxWrite( POKECG_WINX1, POKECG_WINY1, POKECG_WINX2, POKECG_WINY2 );
	NMenuWinBoxWrite( x, y, x+9, y+10 );

	no = AddTask( FieldPokeCGTask, 80 );
	TaskTable[no].work[0] = 0;
	TaskTable[no].work[1] = mons_no;
	//act = FePokeSet( mons_no, POKECG_ACTX, POKECG_ACTY, POKECG_ACTPRI );
	act = FePokeSet( mons_no, (x+1)*8+32, (y+1)*8+32, POKECG_ACTPRI );
	TaskTable[no].work[2] = act;
	TaskTable[no].work[3] = x;
	TaskTable[no].work[4] = y;
	ActWork[act].move = DummyActMove;
	ActWork[act].oamData.Priority = 0;
	return TRUE;
};

//-------------------------------------------------------------------------
//	フィールドでのポケモンＣＧ表示の消去処理
//	※スクリプトでの終了待ちルーチンを返す、失敗の場合はNULLをかえす
//-------------------------------------------------------------------------
void * FieldPokeCGWinClose( void )
{
	u8 res;
	res = CheckTaskNo( FieldPokeCGTask );
	if( res == NOT_EXIST_TASK_ID )return NULL;

	TaskTable[res].work[0]++;
	return (void *)EvWaitPokeCGErase;
};

static u8 EvWaitPokeCGErase( void )
{
	if( CheckTaskNo( FieldPokeCGTask ) == NOT_EXIST_TASK_ID )return TRUE;
	return FALSE;
};


