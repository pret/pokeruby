
#ifdef	PM_DEBUG

//###################################################################################
//###################################################################################

//------------------------------------------------------------------------
//		d_menu.c
//		ﾃﾞﾊﾞｯｸﾞﾒﾆｭｰ
//------------------------------------------------------------------------
#include <agb.h>
#include "common.h"
#include "actor.h"
#include "actanm.h"
#include "map.h"
#include "evobj.h"
#include "jiki.h"
#include "fieldmap.h"
#include "map_attr.h"
#include "task.h"
#include "menu.h"
#include "fld_task.h"
#include "saveload.h"	// 2001.05.07 by tama
#include "poketool.h"
#include "mapbg.h"
#include "palanm.h"
#include "script.h"
#include "fld_main.h"
#include "zukan.h"
#include "fld_tool.h"
#include "mus_tool.h"
#include "initgame.h"
#include "window.h"
#include "seed.h"

#include "item.h"
#include "pasocom.h"
#include "ev_time.h"

#include "sysflag.h"
#include "param.h"
#include "wazano.def"
#include "safari.h"
#include "ev_check.h"
#include "ev_fight.h"
#include "syswork.h"
#include "b_tower.h"
#include "ex_load.h"
#include "record.h"
#include "monsno.def"
#include "intr.h"
#include "rtctool.h"
#include "../data/itemeqp.h"
#include "playtime.h"


#include "svld_ini.h"
#include "svld_sys.h"
#include <AgbFlash1M.h>

//------------------------------------------------------------------------
extern u8	DebugIwasawaTest(void);
extern void DebugFightInit(void);
extern u8	NoriTestMain(void);
extern void NoharaTestMain(void);
extern void CableMainInit(void);		// ケーブル通信実験
extern void Cable2MainInit(void);
extern void BlendTestInit(void);
extern void HusiginaDekigotoGamenInit();
extern void HusigiSendGamenInit();

extern void KoukanDemoOfflineInit(void);

static u8 GetStartFight(void);
static u8 GetStartField(void);
static u8 GetLoadField(void);
static u8 GetStartTest(void);
static u8 GetStartTest2(void);
static u8 GetStartTestEffct(void);
static u8 GetStartCable2(void);
static u8 GetSndTest(void);
static u8 GetStartBlend(void);
static u8 GetBreakFlash(void);
static u8 GetHusiginaDekigoto(void);
static u8 GetHusigiSend(void);
static u8 GetKoukanDemo(void);
static u8 GetStartRTCSet(void);
static u8 GetStartRtcReset(void);
static u8 GetStartConvert(void);
#ifdef	FESTA_VER_ROM
static u8 GetStartFestaMode(void);
#endif

void AddDebugMenuTask(void);
static void MakeDebugCom(void);

static u8 ctrl_debug_submenu( const MENU_ITEM * menu );
static u8 ctrl_debug_keyend( void );
static void make_debug_submenu( const MENU_ITEM * menu, u8 x_len, u8 menu_max );

static u8 DebugMenuInit(void);
static u8 DebugMenuKeyMain(void);
static u8 DebugMenuEnd(void);
static u8 DebugSogabe(void);
static u8 DebugTamada(void);
static u8 DebugKagaya(void);
static u8 DebugMatsuda(void);
static u8 DebugNohara(void);
static u8 DebugNakamura(void);
static u8 DebugWatanabe(void);
static u8 DebugMori(void);
static u8 DebugTomomichi(void);
static u8 DebugAoki(void);
static u8 DebugTaya(void);
static u8 DebugIwasawa(void);
static u8 DebugItem(void);
extern u8 DebugMap(void);  // 2001/12/25 taya
static u8 DebugPortrait(void);
static u8 DebugRTCwatch(void);
static u8 DebugRTCset(void);
static u8 DebugZukanSet(void);
static u8 DebugZukan2Set(void);
static u8 DebugPokeMake(void);
static u8 DebugCGcheck(void);
static u8 DebugCGcheck2(void);
static u8 DebugPokeBattle(void);
static u8 DebugBatchSet(void);
static u8 DebugHouenZukanSet(void);
static u8 DebugRamSeedSet(void);
static u8 DebugHidenWaza(void);
static u8 DebugBGMswitch(void);
static u8 DebugOOkisa(void);
static u8 DebugSafari( void );
static u8 DebugRevenge( void );
static u8 DebugMaboroshiChg( void );
static u8 DebugDendou( void );
static u8 DebugExDataFlag(void);
static u8 DebugRecord(void);
static u8 DebugWeatherEventFlag( void );
static u8 DebugSeedInfo(void);
static u8 DebugPutCellInfo( void );
static u8 DebugPorokkuPokemon( void );
static u8 DebugEndDemo( void );
extern u8 DebugPokeSecretData(void);
extern u8 DebugRandTest(void);
static u8 DebugBackUpMenu(void);
static u8 DebugSetPlayTime(void);

static void DebugMenuListWrite(void);
static void DebugZahyouWrite(void);	// 座標表示
static void DebugIDWrite(void);		// マップID表示

void DebugPutDate( u8 x, u8 y );	/* 作成期日用文字列表示 */
void DebugPutContinueDate( u8 x, u8 y ); /* セーブ継続日付文字列表示 */

extern u8 DebugMoriTest(void);		//2001_07_17
extern u8 DebugTamadaTest(void);	//2001_04_18 add by tama
extern u8 DebugTayaTest(void);		//2001_06_05
extern u8 DebugNoharaTest(void);	//2001_06_15
extern u8 DebugMatsudaTest(void);
extern u8 DebugNakahiroTest(void);
extern u8 DebugTomoTest(void);		//2002_03_28
extern u8 DebugSogaTest(void);

//ワープ
static u8 DebugWarp(void);
//手持ちポケモン変更
static u8 DebugMyPokeInit(void);
//BG表示切り替え
static u8 DebugBGInit(void);
//エンカウント
static u8 DebugEncount(void);
//プレイ時間計測
static u8 DebugPlayTime(void);
// ゲームクリアフラグ切り替え
static u8 DebugGameClear(void);

static u8 DebugBtStage(void);

extern void TitleInit(void);
extern void testMainExit(void);

extern void StartSetGameTime(void);
//---------------------------------------------------------------------


// フィールドデバッグメニュー用データ

static const u8 str_watanabe[]={wa_,ta_,na_,be_,EOM_};
static const u8 str_sogabe[]={so_,ga_,be_,spc_,EOM_};
static const u8 str_tamada[]={ta_,ma_,da_,spc_,EOM_};
static const u8	str_kagaya[]={ka_,ga_,ya_,spc_,EOM_};
static const u8	str_matuda[]={ma_,tu_,da_,spc_,EOM_};
static const u8	str_nohara[]={no_,ha_,ra_,spc_,EOM_};
static const u8	str_nakamura[]={na_,ka_,mu_,ra_,EOM_};
static const u8	str_close[]={to_,zi_,ru_,spc_,EOM_};
static const u8	str_warp[]={TE_,RE_,PO_,bou_,TO_,spc_,su_,ru_,EOM_ };
static const u8	str_BG[]={B__,G__,hi_,yyo_,u_,zi_,spc_,ki_,ri_,ka_,e_,EOM_ };
static const u8	str_pokemon[]={te_,mo_,ti_,PO_,KE_,MO_,N_,spc_,SE_,TTU_,TO_,EOM_};
static const u8	str_mori[]={mo_,ri_,spc_,spc_,EOM_};
static const u8	str_tomomichi[]={to_,mo_,mi_,ti_,EOM_};
static const u8	str_aoki[]={a_,o_,ki_,spc_,EOM_};
static const u8	str_taya[]={ta_,ya_,spc_,spc_,EOM_};
static const u8	str_encount[]={E_,N_,KA_,U_,N_,TO_,spc_,se_,i_,gi_,yyo_,EOM_ };
static const u8 str_time[]={P__,T__,I__,M__,E__,EOM_};
static const u8 str_dougu[]= {do_,u_,gu_,wo_,spc_,tu_,ku_,ru_,EOM_};
static const u8 str_map[] = { MA_,TTU_,PU_,spc_,i_,do_,u_,EOM_ };
static const u8 str_portrait[] = { ni_,ga_,o_,e_,DE_,bou_,TA_,ka_,ku_,ni_,n_,EOM_ };
static const u8 str_rtc[] = { zi_,ka_,n_,spc_,ka_,ku_,ni_,n_,EOM_ };
static const u8 str_rtc2[] = { zi_,ka_,n_,spc_,se_,ttu_,te_,i_,EOM_ };
static const u8 str_zukan1[] = { zu_,ka_,n_,SE_,TTU_,TO_,colon_,ze_,n_,ko_,ku_,EOM_ };
static const u8 str_zukan2[] = { zu_,ka_,n_,SE_,TTU_,TO_,colon_,HO_,U_,E_,N_,EOM_ };
static const u8 str_poke_make[] = { PO_,KE_,MO_,N_,wo_,tu_,ku_,ru_,EOM_ };
static const u8 str_cg_check[] = { GU_,RA_,HU_,II_,TTU_,KU_,spc_,TI_,EE_,TTU_,KU_,EOM_ };
static const u8 str_cg_check2[] = { TO_,RE_,bou_,NA_,bou_,spc_,GU_,RA_,HU_,II_,TTU_,KU_,EOM_ };
static const u8 str_pbattle[] = { DE_,BA_,TTU_,GU_,yo_,u_,spc_,se_,n_,to_,u_,EOM_ };
static const u8 str_batch[] = { BA_,TTU_,ZI_,spc_,HU_,RA_,GU_,SE_,TTU_,TO_,EOM_ };
static const u8 str_houenzukan[] =  { HO_,U_,E_,N_,ze_,n_,ko_,ku_,zu_,ka_,n_,EOM_ };
static const u8 str_ram_seed[] =  { RA_,MU_,ki_,no_,mi_,spc_,SE_,TTU_,TO_,EOM_ };
static const u8 str_hidenwaza[] = { HU_,II_,bou_,RU_,DO_,wa_,za_,spc_,si_,yo_,u_,EOM_ };
static const u8 str_iwasawa[] = { i_,wa_,sa_,wa_,EOM_ };
static const u8 str_BGM[] = { B__,G__,M__,spc_,O_,N_,nakag_,O_,HU_,EOM_ };
static const u8 str_ookisa[] = { o_,o_,ki_,sa_,ku_,ra_,be_,spc_,tu_,ku_,ru_,EOM_ };
static const u8 str_endflg[] = { KU_,RI_,A_,HU_,RA_,GU_,spc_,ki_,ri_,ka_,e_,EOM_ };
static const u8 str_safari[] = { SA_,HU_,AA_,RI_,EOM_ };
static const u8 str_revenge[] = { sa_,i_,se_,n_,TO_,RE_,bou_,NA_,bou_,EOM_ };
static const u8 str_maborosi[] = { MA_,BO_,RO_,SI_,ZI_,MA_,spc_,ra_,n_,su_,u_,EOM_ };
static const u8 str_dendou[] = { de_,n_,do_,u_,i_,ri_, EOM_ };
static const u8 str_exdata[] = { hu_,si_,gi_,na_,de_,ki_,go_,to_,EOM_ };
static const u8 str_record[] = { de_,n_,se_,tu_,RE_,KO_,bou_,DO_,EOM_ };
static const u8 str_wea_event[] = { HU_,RA_,GU_,colon_,te_,n_,ko_,u_,I_,BE_,N_,TO_,EOM_ };
static const u8 str_cellinfo[] = { SE_,RU_,zi_,yyo_,u_,ho_,u_,EOM_ };
static const u8 str_porokku[] = { PO_,RO_,TTU_,KU_,spc_,TI_,EE_,TTU_,KU_,yo_,u_,EOM_ };
static const u8 str_doryokuti[] = { do_,ri_,yyo_,ku_,ti_,spc_,hi_,yyo_,u_,zi_,EOM_ };
static const u8 str_seed_info[] = { ki_,no_,mi_,spc_,zi_,yyo_,u_,ho_,u_,EOM_ };
static const u8 str_bt_stage[] = {TA_,WA_,bou_,si_,yyu_,u_,ka_,i_,spc_,su_,u_,EOM_ };
static const u8 str_end_demo[] = {E_,N_,DE_,II_,N_,GU_,DE_,MO_,EOM_ };
static const u8 str_rnd_test[] = { ra_,n_,su_,u_,spc_,TE_,SU_,TO_,EOM_ };
static const u8 str_backup[] = { BA_,TTU_,KU_,A_,TTU_,PU_,BO_,bou_,I_,mo_,do_,ki_,EOM_ };

const MENU_ITEM	DebugMenuItem[]=
{
	{ str_close,	DebugMenuEnd },		// 0:とじる
	{ str_watanabe, DebugWatanabe },	// 1:わたなべ
	{ str_sogabe,	DebugSogabe },		// 2:そがべ
	{ str_tamada,	DebugTamada },		// 3:たまだ
	{ str_kagaya,	DebugKagaya },		// 4:かがや
	{ str_matuda,	DebugMatsuda },		// 5:まつだ
	{ str_nohara,	DebugNohara },		// 6:のはら
	{ str_nakamura,	DebugNakamura },	// 7:なかむら
	{ str_warp,		DebugWarp },		// 8:ワープ
	{ str_pokemon,	DebugMyPokeInit },	// 9:ポケモン
	{ str_BG,		DebugBGInit },		//10:BG
	{ str_mori,		DebugMori },		//11:もり
	{ str_tomomichi,DebugTomomichi },	//12:ともみち
	{ str_aoki,		DebugAoki },		//13:あおき
	{ str_taya,		DebugTaya },		//14:たや
	{ str_endflg,	DebugGameClear },	//15:ゲームクリアフラグ切り替え
	{ str_encount,	DebugEncount },		//16:エンカウント
	{ str_time,		DebugSetPlayTime },	//17:プレイ時間
	{ str_dougu,	DebugItem	},		//18:どうぐ取得
	{ str_map,		DebugMap	},		//19:マップ
	{ str_portrait, DebugPortrait	},	//20:似顔絵
	{ str_rtc,		DebugRTCwatch	},	//21:RTC
	{ str_rtc2,		DebugRTCset		},	//22:RTC2
	{ str_zukan1,	DebugZukanSet	},	//23:ずかん
	{ str_poke_make,DebugPokeMake	},	//24:ポケモンをつくる
	{ str_cg_check,	DebugCGcheck	},	//25:グラフィックチェック
	{ str_pbattle,	DebugPokeBattle	},	//26:デバッグ戦闘
	{ str_batch,	DebugBatchSet	},	//27:バッジフラグセット
	{ str_houenzukan,DebugHouenZukanSet},//28:ホウエン・全国モード図鑑フラグセット
	{ str_ram_seed,	DebugRamSeedSet},	//29:ラム木の実セット
	{ str_hidenwaza,DebugHidenWaza },	//30:ひでんわざ発動
	{ str_iwasawa,  DebugIwasawa },		//31:いわさわ
	{ str_BGM,		DebugBGMswitch },	//32:BGMのオンオフ
	{ str_ookisa,	DebugOOkisa },		//33:おおきさくらべ設定
	{ str_safari,	DebugSafari },		//34:サファリ
	{ str_revenge,	DebugRevenge },		//35:再戦トレーナー
	{ str_maborosi, DebugMaboroshiChg },//36:マボロシジマ周期変更
	{ str_dendou,	DebugDendou },		//37:殿堂入り確認
	{ str_exdata,	DebugExDataFlag },	//38:ふしぎなできごとフラグON/OFF
	{ str_record,	DebugRecord },		//39:でんせつレコードのチェック
	{ str_wea_event,DebugWeatherEventFlag},//40:フラグ:てんこうイベント
	{ str_cellinfo,	DebugPutCellInfo },	//41:セル情報生成
	{ str_porokku,	DebugPorokkuPokemon },	//42:
	{ str_doryokuti,DebugPokeSecretData },	//43:努力値表示
	{ str_zukan2,	DebugZukan2Set	},	//44:ホウエンずかんセット
	{ str_cg_check2,DebugCGcheck2	},	//45:グラフィックチェック（トレーナー）
	{ str_seed_info,DebugSeedInfo	},	//46:きのみ情報
	{ str_bt_stage, DebugBtStage	},	//47:バトルタワー周回数変更
	{ str_end_demo, DebugEndDemo	},	//48:エンディングデモ
	{ str_rnd_test, DebugRandTest	},	//49:乱数テスト
	{ str_backup,	DebugBackUpMenu },	//50:バックアップメニュー

};

static u8	debugPick;			//選択中メニュー番号
static u8	debugWinNo;			//表示するウィンドウ番号
static const u8 * debugMenuList;	//メニューリスト

//作成するメニュー
static const u8 debugMenuNumbers[][8] =
{
	{  1, 2, 3, 4, 5, 6, 7, 0,},
	{ 11,12,13,14,31,18,19, 0,},
	{  8, 9,10,30,16,36,15, 0,},
	{ 21,22,23,24,25,26,27, 0,},
	{ 28,29,20,32,33,34,35, 0,},
	{ 37,38,39,40,41,42,43, 0,},
	{ 44,45,46,47,48,49,50, 0,},
	{ 17,0, 0, 0, 0, 0, 0, 0, },
};



//---------------------------------------------------------------------
//	デバッグスタートメニュー用データ
//---------------------------------------------------------------------
const u8 msg_build_date[] = { ni_,spc_,sa_,ku_,se_,i_,EOM_ };
const u8 msg_continue_date[] = { ka_,ra_,spc_,ke_,i_,zo_,ku_,PU_,RE_,I_,spc_,ka_,no_,u_,EOM_ };
const u8 msg_version[] = { I_MSG_,STR_VERSION,spc_,BA_,bou_,ZI_,YYO_,N_,EOM_ };
const u8 msg_rtclib[] = {
	se_,i_,ki_,R__,T__,C__,ta_,i_,o_,u_,ba_,n_,EOM_
};
#ifdef	PR_VER_ROM
const u8 msg_pr_ver[] = {
	ko_,u_,ho_,u_,yo_,u_,BA_,bou_,ZI_,YYO_,N_,EOM_
};
#endif
#ifdef	FESTA_VER_ROM
const u8 msg_festa_ver[] = {
	PO_,KE_,MO_,N_,HU_,EE_,SU_,TA_,yo_,u_,EOM_
};
#endif

static const u8 str_jikken[]= {ka_,spc_,no_,spc_,zi_,ttu_,ke_,n_,EOM_};
//static const u8 str_jikken[]= {zi_,ttu_,ke_,n_,EOM_};
static const u8 str_jikken2[]= {zi_,ttu_,ke_,n_,n2_,EOM_};
static const u8 str_e_jikken[]= {B__,G__,zi_,ttu_,ke_,n_,EOM_};
static const u8 str_battle[]= {BA_,TO_,RU_,EOM_};
static const u8 str_cable_jikken[]= {tu_,u_,si_,n_,spc_,zi_,ttu_,ke_,n_,EOM_};
static const u8 str_cable2[]= {tu_,u_,si_,n_,spc_,zi_,ttu_,ke_,n_,n2_,EOM_};
static const u8 str_field_start[]= {HU_,II_,bou_,RU_,DO_,spc_,ha_,zi_,me_,ru_,EOM_};
static const u8 str_field_continue[]= {HU_,II_,bou_,RU_,DO_,spc_,tu_,du_,ki_,EOM_};
static const u8 str_sndmode[]={SA_,U_,N_,DO_,TE_,SU_,TO_,EOM_};
static const u8 str_blend[]={KI_,YYU_,bou_,BU_,TE_,SU_,TO_,  spc_,EOM_,};
static const u8 str_flash_break[] = { BA_,TTU_,KU_,A_,TTU_,PU_,ha_,ka_,i_,EOM_ };
static const u8 str_carde[] = {TE_,SU_,TO_,spc_,KA_,bou_,DO_,E__,spc_,EOM_};
static const u8 str_koukan[]= {ko_,u_,ka_,n_,DE_,MO_,spc_,spc_,spc_,EOM_,};
static const u8 str_gametime_set[] = {  GE_,bou_,MU_,na_,i_,spc_,zi_,ka_,n_,EOM_ };
static const u8 str_festa_start[] = { HU_,EE_,SU_,TA_,spc_,MO_,bou_,DO_,EOM_ };
static const u8 str_husigi_okuri[] = {KA_,bou_,DO_,E__,no_,HU_,RI_,EOM_,};
static const u8 str_rtc_reset[] = { R__,T__,C__,RI_,SE_,TTU_,TO_,EOM_ };
static const u8 str_convert[] = { SE_,bou_,BU_,DE_,bou_,TA_,he_,n_,ka_,n_,EOM_ };

const MENU_ITEM	StartMenuItem[]=
{
	/* 表示文字列			対応する関数 */
	{ str_jikken,			GetStartTest },		//00:じっけん
	{ str_jikken2,			GetStartTest2 },	//01:じっけん２
	{ str_e_jikken,			GetStartTestEffct },//02:エフェクトじっけん
	{ str_battle,			GetStartFight },	//03:バトル
	{ str_blend,			GetStartBlend },	//04:ブレンドマシーン
	{ str_cable2,			GetStartCable2 },	//05:つうしんじっけん
	{ str_sndmode,			GetSndTest	},		//06:サウンドテスト
	{ str_field_start,		GetStartField },	//07:フィールド はじめ
	{ str_field_continue,	GetLoadField },		//08:フィールド つづき
	{ str_flash_break,		GetBreakFlash },	//09:バックアップ破壊
	{ str_carde,			GetHusiginaDekigoto },//10:カードＥテスト画面
	{ str_koukan,			GetKoukanDemo },	//11:こうかんデモ
	{ str_husigi_okuri,		GetHusigiSend},		//12:ふしぎなできごとを送る
	{ str_gametime_set,		GetStartRTCSet },	//13:RTCセット
	{ str_rtc_reset,		GetStartRtcReset },	//14:RTCリセット
	{ str_convert,			GetStartConvert },	//15:セーブデータ変換
};

#define START_MENU_MAX	9

static const u8 startMenuListTable[][START_MENU_MAX+1] =
{
	{ 7,3,6,4,0xff },
	{ 5,9,10,12,13,14,15,0xff },

//	{ 0,1,2,3,4,5,6,7,8,0xff },
//	{ 7,8,9,0xff },
};

static const int START_MENU_LIST_MAX = NELEMS(startMenuListTable);

extern u8 (*MenuFunc)();

//=========================================================================
//		最初の画面メニュー
//=========================================================================
static void StartMenuMainTask(u8 no);
static void NameMenuTaskInit(void);

enum {
	STMENU_X	= 16,
	STMENU_Y	= 0,
	STMENU_X2	= 29,
	STMENU_Y2	= STMENU_Y+1+START_MENU_MAX*2,

	STMENU_MSGX	= STMENU_X + 2,
	STMENU_MSGY = STMENU_Y + 1,

	STMENU_CSRX = STMENU_X + 1,
	STMENU_CSRY = STMENU_Y + 1,
};

//-------------------------------
//		初期化シーケンス
//-------------------------------
static void set_start_menu_list(u8 list_no)
{
	int i, max;

	debugMenuList = startMenuListTable[list_no];
	for ( i=0; debugMenuList[i] != 0xff; i++ );
	max = i;
	NMenuBoxClear(STMENU_X, STMENU_Y, STMENU_X2, STMENU_Y2);
	NMenuWinBoxWrite(STMENU_X, STMENU_Y, STMENU_X2, STMENU_Y+1+max*2);
	NMenuFreeListWrite(STMENU_MSGX, STMENU_MSGY, max, StartMenuItem, debugMenuList);
	NMenuVCursorInit(STMENU_CSRX, STMENU_CSRY, max, 0);
}

static void finish_start_menu(void)
{
	u8 no;

	no = CheckTaskNo(StartMenuMainTask);
	if (no == NOT_EXIST_TASK_ID)
		return;
	DelTask(no);
}

void StartMenuInit(void)
{
	DebugPutDate( 1, 10 );
	NMenuMsgWrite( msg_build_date, 8, 12 );
	DebugPutContinueDate( 1, 15 );
	NMenuMsgWrite( msg_continue_date, 1, 17 );

	NMenuMsgWrite( msg_version, 1,1 );
	NMenuMsgWrite( msg_rtclib, 1,3 );
#ifdef	PR_VER_ROM
	NMenuMsgWrite( msg_pr_ver, 1,5 );
#endif
#ifdef	FESTA_VER_ROM
	NMenuMsgWrite( msg_festa_ver, 1,7 );
#endif

	set_start_menu_list(0);
	AddTask( StartMenuMainTask, TSK_PRI_SYSTEM );
}

//-------------------------------
//		メインシーケンス
//-------------------------------
static void StartMenuMainTask(u8 no)
{
	s16 * twk;
	s8 res, pos;
	MENUFUNC func;

	twk = TaskTable[no].work;
	res = NMenuVCursorControl();
	pos = NMenuVCursorPosGet();

	switch (res) {

	case CURSOR_DEFAULT_VALUE:
		if (sys.Trg & L_KEY) {
			if (twk[0]==0)
				twk[0] = START_MENU_LIST_MAX - 1;
			else
				twk[0]--;

			set_start_menu_list(twk[0]);
			SePlay( SE_SELECT );
		}
		else if (sys.Trg & R_KEY) {
			if (twk[0]==START_MENU_LIST_MAX-1)
				twk[0] = 0;
			else
				twk[0]++;

			set_start_menu_list(twk[0]);
			SePlay( SE_SELECT );
		}
		break;

	case CURSOR_CANCEL_VALUE:
		PM_SoftReset();
		break;

	default:
		func = StartMenuItem[debugMenuList[pos]].ptr;
		func();
	}
}

//-------------------------------
//		選択肢処理
//-------------------------------

static u8	GetStartFight(void)
{
	MainProcChange(DebugFightInit);
	return	0;
}

static u8	GetStartField(void)
{
	finish_start_menu();
	NameMenuTaskInit();
	return	0;
}

#ifdef	FESTA_VER_ROM
extern void FestaGameStart(void);

static u8	GetStartFestaMode(void)
{
	DebugMainFlag = 1;		//デバッグモードＯＮ
	finish_start_menu();
	MainProcChange( FestaGameStart );
	return	0;
}
#endif

static u8	GetLoadField(void)
{
	if( SaveDataCheckInfo == SVLD_RET_NG ){		// セーブデータが存在する場合
		SePlay( SE_BOO );
	} else {
		finish_start_menu();
		MainProcChange(ContinueGameStart);
	}
	return	0;
}

static u8	GetStartTest(void)
{
//	MainProcChange(NoriTestMain);
	return 0;
}

static u8	GetStartTest2(void)
{
	MainProcChange(NoharaTestMain);
	return 0;
}

static u8	GetStartTestEffct(void)
{
	return 0;
}

static u8	GetStartBlend(void)
{
	MainProcChange(BlendTestInit);
	return 0;
}

static u8	GetHusiginaDekigoto(void)
{
	MainProcChange(HusiginaDekigotoGamenInit);
	return 0;
}

static u8   GetHusigiSend(void)
{
	MainProcChange(HusigiSendGamenInit);
	return 0;
}

static u8 	GetKoukanDemo(void)
{
	MainProcChange(KoukanDemoOfflineInit);
	return 0;
}
static u8	GetStartCable2(void)
{
	MainProcChange(Cable2MainInit);
	return 0;
}

extern	void	SndTestInit(void);
static u8	GetSndTest(void)
{
	MainProcChange(SndTestInit);
	return 0;
}


static u8	GetBreakFlash(void)
{
	EraseBackUpData();
	return 0;
}



static u8 GetStartRTCSet(void)
{
	finish_start_menu();
	StartSetGameTime();
	return 0;
}

//---------------------------------------------------------------------
//---------------------------------------------------------------------
static const u8 msg_rtc_reset_ask[] = {
	R__,T__,C__,wo_,spc_,RI_,SE_,TTU_,TO_,spc_,si_,ma_,su_,
	CR_,
	A__,de_,spc_,zi_,ttu_,ko_,u_,spc_,spc_,spc_,B__,de_,KI_,YYA_,N_,SE_,RU_,
	EOM_
};

static const u8 msg_rtc_reset[] = {
	R__,T__,C__,wo_,spc_,RI_,SE_,TTU_,TO_,spc_,si_,ta_,gyoe_,EOM_
};

void rtc_reset_task(u8 no)
{
	s16 * twk;
	twk = TaskTable[no].work;
	switch (twk[0]) {
	case 0:
		NMenuTalkWinWrite();
		NMenuMsgWrite(msg_rtc_reset_ask, MWIN_MSGXPOS, MWIN_MSGYPOS);
		twk[0] ++;
		break;
	case 1:
		if (sys.Trg & A_BUTTON) {
			NMenuTalkWinWrite();
			NMenuMsgWrite(msg_rtc_reset, MWIN_MSGXPOS, MWIN_MSGYPOS);
			SePlay(SE_PINPON);
			RTC_Reset();
			twk[0] ++;
		} else if (sys.Trg & B_BUTTON) {
			DelTask(no);
			PM_SoftReset();
		}
		break;
	case 2:
		if (sys.Trg & A_BUTTON) {
			DelTask(no);
			PM_SoftReset();
		}
	}
}

static u8 GetStartRtcReset(void)
{
	finish_start_menu();
	AddTask(rtc_reset_task, TSK_PRI_CONTROL);
	return 0;
}


//---------------------------------------------------------------------
//	セーブデータ変換
//---------------------------------------------------------------------
static const u8 msg_convert_data_ask[] = {
	SE_,bou_,BU_,DE_,bou_,TA_,wo_,spc_,KO_,N_,BA_,bou_,TO_,si_,ma_,su_,
	CR_,
	A__,de_,spc_,ke_,ttu_,te_,i_,spc_,spc_,B__,de_,spc_,KI_,YYA_,N_,SE_,RU_,
	EOM_
};
static const u8 msg_convert_data_end[] = {
	he_,n_,ka_,n_,ga_,spc_,si_,yyu_,u_,ri_,yyo_,u_,spc_,si_,ma_,si_,ta_,gyoe_,
	EOM_
};

extern	void	LoadDataConv(void);
static void svld_convert_task(u8 no)
{
	s16 * twk;

	twk = TaskTable[no].work;
	switch (twk[0]) {
	case 0:
		NMenuTalkWinWrite();
		NMenuMsgWrite(msg_convert_data_ask, MWIN_MSGXPOS, MWIN_MSGYPOS);
		twk[0] ++;
		break;
	case 1:
		if (sys.Trg & A_BUTTON) {
			NMenuTalkWinWrite();
			//ここに機能を入れる
			LoadDataConv();
			NMenuMsgWrite(msg_convert_data_end, MWIN_MSGXPOS, MWIN_MSGYPOS);
			SePlay(SE_PINPON);
			twk[0] ++;
		} else if (sys.Trg & B_BUTTON) {
			DelTask(no);
			PM_SoftReset();
		}
		break;
	case 2:
		if (sys.Trg & A_BUTTON) {
			DelTask(no);
			PM_SoftReset();
		}
	}
}

static u8 GetStartConvert(void)
{
	finish_start_menu();
	AddTask(svld_convert_task, TSK_PRI_CONTROL);
	return 0;
}

//---------------------------------------------------------------------
//	デバッグゲーム開始時の名前選択
//---------------------------------------------------------------------
static const u8 str_male_name1[] = {ZI_,YYU_,N_,I_,TI_,EOM_};
static const u8 str_male_name2[] = {DA_,I_,GO_,RO_,U_,EOM_};
static const u8 str_male_name3[] = {TE_,TU_,ZI_,EOM_};
static const u8 str_female_name1[] = {BA_,RE_,N_,SI_,A_,EOM_};
static const u8 str_female_name2[] = {HA_,RU_,KO_,MA_,TI_,EOM_};
static const u8 str_m_f_name[] = {R__,A__,Y__,M__,O__,N__,D__,EOM_};
static const u8 str_f_f_name[] = {T__,I__,F__,F__,A__,N__,Y__,EOM_};
static const u8 str_female_name3[] = { ku_,ma_,x__,ti_,e_,EOM_};


enum{
	JAPANESE_NAME = 0x00,
	FOREIGN_NAME = 0x80,
};

static const MENU_ITEM name_menu[] = {
	{ str_male_name1,	(void*)(JAPANESE_NAME|MALE)	},
	{ str_male_name2,	(void*)(JAPANESE_NAME|MALE)	},
	{ str_female_name1,	(void*)(JAPANESE_NAME|FEMALE)	},
	{ str_female_name2,	(void*)(JAPANESE_NAME|FEMALE)	},
	{ str_m_f_name,		(void*)(FOREIGN_NAME|MALE) },
	{ str_f_f_name,		(void*)(FOREIGN_NAME|FEMALE) },
	{ str_male_name3,	(void*)(JAPANESE_NAME|MALE)	},
	{ str_female_name3,	(void*)(JAPANESE_NAME|FEMALE)	},
};

enum{
	NMMSG_MAX = NELEMS(name_menu),
	NMWIN_X1 = 0,
	NMWIN_Y1 = 0,
	NMWIN_X2 = NMWIN_X1 + 2 + PERSON_NAME_SIZE + 2,
	NMWIN_Y2 = NMWIN_Y1 + NMMSG_MAX * 2 + 1,
	NMMSG_X = NMWIN_X1 + 2,
	NMMSG_Y = NMWIN_Y1 + 1,
	NMCSR_X = NMWIN_X1 + 1,
	NMCSR_Y = NMWIN_Y1 + 1,
	NMICON_X	= NMWIN_X2 - 1,
	NMICON_Y	= NMMSG_Y,
};

static void put_name_window(void)
{
	u8 i,mark;
	NMenuWinBoxWrite(NMWIN_X1, NMWIN_Y1, NMWIN_X2, NMWIN_Y2);
	NMenuFixListWrite(NMMSG_X, NMMSG_Y,  NMMSG_MAX, name_menu);

	for (i=0; i<NMMSG_MAX; i++) {
		if (((u32)(name_menu[i].ptr)&1) == MALE)
			mark = osu_;
		else
			mark = mesu_;

		NMenuPutc( mark, NMICON_X, NMICON_Y + i*2);
	}
	NMenuVCursorInit(NMCSR_X, NMCSR_Y, NMMSG_MAX, 0);
}

static void select_name_task(u8 no)
{
	s16 * twk;
	s8 res, pos;
	u8 value;

	twk = TaskTable[no].work;
	res = NMenuVCursorControl();
	pos = NMenuVCursorPosGet();

	switch (res) {

	case CURSOR_DEFAULT_VALUE:
		break;

	case CURSOR_CANCEL_VALUE:
		NMenuScreenClear();
		StartMenuInit();
		DelTask(no);
		break;

	default:
		value = (u32)name_menu[pos].ptr & 0xff;
		MyData.my_sex = value & 1;
		PM_strcpy(MyData.my_name, name_menu[pos].msg);
		if ((value & FOREIGN_NAME) == 0)
			DebugInitGame( DEBUG_START_NORMAL );
		else
			DebugInitGame( DEBUG_START_FOREIGNER );

		DelTask(no);
		MainProcChange(DebugGameStart);
	}
}

static void NameMenuTaskInit(void)
{
	put_name_window();
	AddTask(select_name_task, TSK_PRI_CONTROL);
}

//=========================================================================
//
//		デバッグメニュー本体
//
//=========================================================================
enum{
	DMENU_MSG_MAX	= NELEMS(debugMenuNumbers[0]),

	DMENU_WIDE		= NELEMS(debugMenuNumbers) - 1,

	DMENU_WINX1	=	0,
	DMENU_WINY1	=	0,
	DMENU_WINX2	=	14,
	DMENU_WINY2 =	DMENU_WINY1 + DMENU_MSG_MAX * 2 + 1,
	DMENU_MSGX	=	DMENU_WINX1 + 2,
	DMENU_MSGY	=	DMENU_WINY1 + 1,
	DMENU_CSRX	=	DMENU_WINX1 + 1,
	DMENU_CSRY	=	DMENU_WINY1 + 1,

};

void MakeDebugCom(void)
{
	debugMenuList = debugMenuNumbers[debugWinNo];
}

//-------------------------------
//デバッグメニュー制御タスク
//-------------------------------
static void debug_menu_task(u8 no)
{
	if (MenuFunc()==1)
		DelTask(no);
}

void AddDebugMenuTask(void)
{
	MenuFunc = DebugMenuInit;
	SetForceEvent();
	AddTask(debug_menu_task, TSK_PRI_EFFECT);
}

static u8 DebugMenuInit(void)
{
	NMenuScreenInit(FIELD_MENU_TYPE);
	MakeDebugCom();
	DebugMenuListWrite();

	DebugIDWrite();
	DebugZahyouWrite();		// 座標表示

	MenuFunc = DebugMenuKeyMain;
	return 0;
}

static u8 DebugMenuKeyMain(void)
{
	MENUFUNC func;

	if( sys.Trg & U_KEY )
	{
		SePlay(SE_SELECT);
		debugPick = NMenuVCursorSet(-1);
	}
	if( sys.Trg & D_KEY ){
		SePlay(SE_SELECT);
		debugPick = NMenuVCursorSet(1);
	}

	if( sys.Trg & L_KEY )
	{
		SePlay(SE_SELECT);
		if(debugWinNo==0)	debugWinNo=DMENU_WIDE;
		else				debugWinNo--;
		MakeDebugCom();
		DebugMenuListWrite();
	}
	if( sys.Trg & R_KEY ){
		SePlay(SE_SELECT);
		if(debugWinNo==DMENU_WIDE)	debugWinNo=0;
		else						debugWinNo++;
		MakeDebugCom();
		DebugMenuListWrite();
	}

	if( sys.Trg & A_BUTTON )
	{
		SePlay(SE_SELECT);
		func = DebugMenuItem[debugMenuList[debugPick]].ptr;
		return	func();
	}

	if( sys.Trg & B_BUTTON || sys.Trg & START_BUTTON )
	{
		MenuEnd();
		return( 1 );
	}

	return( 0 );

}

static void DebugMenuListWrite(void)
{
	NMenuWinBoxWrite(DMENU_WINX1, DMENU_WINY1, DMENU_WINX2, DMENU_WINY2);
	NMenuFreeListWrite(DMENU_MSGX, DMENU_MSGY, DMENU_MSG_MAX, DebugMenuItem, debugMenuList);
	debugPick = NMenuVCursorInit(DMENU_CSRX, DMENU_CSRY, DMENU_MSG_MAX, debugPick);
}

//-------------------------------
// マップID表示
//-------------------------------
static const u8 str_id[] = { I__,D__,EOM_ };
static void DebugIDWrite(void)
{
	u8 * p;
	p = MsgExpandBuffer;
	p = PM_strcpy(p, str_id);
	p = PM_NumMsgSet(p, Fld.MapID.div_id, NUM_MODE_SPACE, 3);
	p = PM_NumMsgSet(p, Fld.MapID.map_id, NUM_MODE_SPACE, 3);
	NMenuWinBoxWrite(19, 12, 29, 15);
	NMenuMsgWrite(MsgExpandBuffer, 20, 13);
}

//-------------------------------
// 座標表示
//-------------------------------
static void DebugZahyouWrite(void)
{
	u8	x[] = { X__, EOM_ };
	u8	y[] = { spc_, Y__, EOM_ };
	u8	h[] = { spc_, H__, EOM_ };
	u8	height;
	u8	num[4];
	s16	px,py;
	u16	cnt = 0;

	GetHeroCellPos( &px, &py );
	height = GetCellHeight( px, py );

	px -= MAP_LEFT_MARGIN;
	py -= MAP_UP_MARGIN;


	PM_strcpy( MsgExpandBuffer, x );
	PM_NumMsgSet( num, px, NUM_MODE_LEFT, 3 );
	PM_strcat( MsgExpandBuffer, num );
	PM_strcat( MsgExpandBuffer, y );
	PM_NumMsgSet( num, py, NUM_MODE_LEFT, 3 );
	PM_strcat( MsgExpandBuffer, num );

	PM_strcat( MsgExpandBuffer, h );
	PM_NumMsgSet( num, height, NUM_MODE_LEFT, 2 );
	PM_strcat( MsgExpandBuffer, num );

	while(1){
		if( MsgExpandBuffer[cnt] == EOM_ )	break;
		cnt++;
	}

	NMenuWinBoxWrite( 28-cnt, 16, 29, 19 );
	NMenuMsgWrite( MsgExpandBuffer, 29-cnt, 17 );
}



//=========================================================================
//
//	デバッグメニュー項目別関数
//
//=========================================================================
//-------------------------------
//メニュー項目:やめる
//-------------------------------
static u8	DebugMenuEnd(void)
{
	MenuEnd();
	return 1;
};

//------------------------------
//	メニュー項目:曽我部
//------------------------------

static u8	DebugSogabe(void)
{
	return	DebugSogaTest();
}

//------------------------------
//	メニュー項目:玉田
//------------------------------
static u8	DebugTamada(void)
{
	return DebugTamadaTest();
}

//------------------------------
//	メニュー項目:加賀谷
//------------------------------
extern u8 KagayaDebug( void );

static u8	DebugKagaya(void)
{
	return( KagayaDebug() );
}

//------------------------------
//	メニュー項目:松田
//------------------------------
static u8	DebugMatsuda(void)
{
	return	DebugMatsudaTest();
}

//------------------------------
//	メニュー項目:野原
//------------------------------
static u8	DebugNohara(void)
{
	//MenuEnd();
	return DebugNoharaTest();
}

//------------------------------
//	メニュー項目:渡辺
//------------------------------
extern	u16		pp_rand(void);
extern	void	TokeiEvInit(void);
extern	void	SaveLoadSysCheckInit(void);
extern	void	DendouLookInit(void);
extern	void	HyousyouEvInit(void);
extern	void	BuckUpRAMcheckSet(u8 mode);
extern	void	TestEvoDemoInit(void);

static u8	DebugWatanabe(void)
{
	MenuEnd();

	MainProcChange(SaveLoadSysCheckInit);
//	BuckUpRAMcheckSet(POKEAGB_SVALL);
//	ZukanDebugFlag = 2;
	SetForceEvent();
	return	1;
}

//------------------------------
//メニュー項目:エンディングデモ確認
//------------------------------
extern	void	EDdemoInit(void);
static u8 DebugEndDemo( void )
{
	MenuEnd();
	MainProcChange(EDdemoInit);
	SetForceEvent();
	return	1;
}
//------------------------------
//メニュー項目:殿堂入り確認
//------------------------------
extern	void	ScrGameClear(void);
static u8 DebugDendou( void )
{
	MenuEnd();
	ScrGameClear();
	SetForceEvent();
	return	1;
}

//------------------------------
//メニュー項目:おおきさくらべ設定
//------------------------------
extern	void	OokisakurabeMakeInit(void);
static u8	DebugOOkisa(void)
{
	MenuEnd();
	OokisakurabeMakeInit();
	SetForceEvent();
	return	1;
}

//------------------------------
//メニュー項目:ホウエン・全国モード図鑑フラグセット
//------------------------------
static u8	DebugHouenZukanSet(void)
{
	if ( ZukanSpecialFlagCheck() ) {
		ZukanSpecialFlagInit();
	} else {
		ZukanSpecialFlagSet();
	}
	MenuEnd();
	return	1;
}

//------------------------------
//メニュー項目:ラム木の実セット
//------------------------------
static u8 set_ramseed(void);
static const u8 str_ramseed1[] = { H__,P__,EOM_ };
static const u8 str_ramseed2[] = { ma_,hi_,EOM_ };
static const u8 str_ramseed3[] = { ne_,mu_,ke_,EOM_ };
static const u8 str_ramseed4[] = { do_,ku_,EOM_ };
static const u8 str_ramseed5[] = { U_,MA_,I_,EOM_ };
static const MENU_ITEM ramseed_menu[] =
{
	{ str_ramseed1, set_ramseed },
	{ str_ramseed2, set_ramseed },
	{ str_ramseed3, set_ramseed },
	{ str_ramseed4, set_ramseed },
	{ str_ramseed5, set_ramseed },
};

static u8 set_ramseed(void)
{
	u8 pos;
	pos = NMenuVCursorPosGet();
	switch (pos) {
	case 0:
		DebugMakeDmyRamSeed(str_ramseed1, SOUBI_HPKAIHUKU, 4);
	//	DebugChangeDmyRamSeedTaste(10, 0, 10, 10, 10, 80);
		DebugChangeDmyRamSeedTaste(255, 255, 255, 0, 255, 255);
		break;
	case 1:
		DebugMakeDmyRamSeed(str_ramseed2, SOUBI_MAHINAOSI, 0);
	//	DebugChangeDmyRamSeedTaste(10, 0, 10, 10, 10, 80);
		DebugChangeDmyRamSeedTaste(255, 255, 0, 255, 255, 255);
		break;
	case 2:
		DebugMakeDmyRamSeed(str_ramseed3, SOUBI_NEMUKEZAMASI, 0);
	//	DebugChangeDmyRamSeedTaste(10, 0, 0, 10, 10, 50);
		DebugChangeDmyRamSeedTaste(255, 0, 255, 255, 255, 255);
		break;
	case 3:
		DebugMakeDmyRamSeed(str_ramseed4, SOUBI_DOKUKESI, 0);
	//	DebugChangeDmyRamSeedTaste(0, 0, 10, 10, 10, 80);
		DebugChangeDmyRamSeedTaste(0, 255, 255, 255, 255, 255);
		break;
	case 4:
		DebugMakeDmyRamSeed(str_ramseed5, SOUBI_DOKUKESI, 0);
		DebugChangeDmyRamSeedTaste(255, 255, 255, 255, 255, 255);
		break;
	};
	MenuEnd();
	return	1;
}

static u8 ctrl_ramseed_menu(void)
{
	return ctrl_debug_submenu(ramseed_menu);
}

static u8	DebugRamSeedSet(void)
{
	make_debug_submenu(ramseed_menu, 12, NELEMS(ramseed_menu));
	MenuFunc = ctrl_ramseed_menu;
	return 0;
}

//------------------------------
//メニュー項目:BGMオン・オフ
//------------------------------
static u8 DebugBGMswitch(void)
{
	BGMStopFlag = !(BGMStopFlag);
	MenuEnd();
	return 1;
}


//------------------------------
//	メニュー項目:
//------------------------------
extern	void	DebugPokeBattleInit(void);
static u8 DebugPokeBattle(void)
{
	MenuEnd();
	DebugPokeBattleInit();
	SetForceEvent();
	return	1;
}

//------------------------------
//	メニュー項目:
//------------------------------
static u8 DebugZukanSet(void)
{
	u16	i;

	for(i=0;i<POKE_NUM_MAX;i++){
		ZukanCheck(i+1,Z_SEE_SET);
		ZukanCheck(i+1,Z_GET_SET);
	}
	ZukanDebugFlag = 1;
	MenuEnd();
	return 1;
}

static u8 DebugZukan2Set(void)
{
	u16	i,n;

	for(i=0;i<NEW_POKE_NUM_MAX;i++){
		n = PokeHouenNo2ZukanNoGet(i+1);
		ZukanCheck(n,Z_SEE_SET);
		ZukanCheck(n,Z_GET_SET);
	}
	ZukanDebugFlag = 1;
	MenuEnd();
	return 1;
}

//------------------------------
//メニュー項目:ポケモンをつくる
//------------------------------
extern	void	PokeMakeInit(void);
static u8 DebugPokeMake(void)
{
	MenuEnd();
	PokeMakeInit();
	SetForceEvent();
	return 1;
}

//------------------------------
//メニュー項目:グラフィックチェック
//------------------------------
extern	void	GraphicCheckInit(void);
static u8 DebugCGcheck(void)
{
	MenuEnd();
	GraphicCheckInit();
	SetForceEvent();
	return 1;
}

extern	void	GraphicCheck2Init(void);
static u8 DebugCGcheck2(void)
{
	MenuEnd();
	GraphicCheck2Init();
	SetForceEvent();
	return 1;
}

//------------------------------
//	メニュー項目:森
//------------------------------
static u8	DebugMori(void)
{
	return	DebugMoriTest();

}

//------------------------------
//	メニュー項目:太田(智)
//------------------------------
static u8	DebugTomomichi(void)
{
//	return NoriTestMain() ;
	return DebugTomoTest() ;
}

//------------------------------
//	メニュー項目:青木
//------------------------------
static u8	DebugAoki(void)
{
	MenuEnd();
	return	1;
}

//------------------------------
//	メニュー項目:田谷
//------------------------------
static u8	DebugTaya(void)
{
	return DebugTayaTest();
//	MenuEnd();
//	return	1;
}

//------------------------------
//	メニュー項目:中村
//------------------------------
static u8	DebugNakamura(void)
{
//	MenuEnd();
	return	DebugNakahiroTest();
}

//------------------------------
//	メニュー項目:岩澤
//------------------------------
static u8 DebugIwasawa(void)
{
//	MenuEnd();
	return	DebugIwasawaTest();
}

//-------------------------------
//メニュー項目:ワープ
//-------------------------------
static u8 DebugWarp(void)
{
	NextMapSetByTelMapID();
	AddMapChangeTask();
	SetForceEvent();
	MenuEnd();
	return	1;
}

//-------------------------------
//メニュー項目:手持ちポケモン変更
//-------------------------------
extern void DebugPokeSetInit(void);

// 初期設定
static u8 DebugMyPokeInit(void)
{
	NMenuScreenClear();					// デバッグメニュークリア
//	H_DebugPokemonName();				// ウィンドウ表示
//	NMenuVCursorInit( 22, 1, 6, 0 );	// カーソルセット
//	MenuFunc = DebugMyPokeMain;
	DebugPokeSetInit();
	return	0;
}


/*
#define MAX_POKE	410

static u8 DebugMyPokeMain(void);
static void H_DebugPokemonName(void);

// 名前表示
static void DebugDrawWinPokeName( u8 no )
{
	u16 monsno;
	monsno = PokeParaGet( &PokeParaMine[no], ID_monsno, 0 );
	NMenuBoxWrite( 23, 1+(no<<1), 28, 2+(no<<1) );
	if( monsno != 0 )
		NMenuMsgWrite( &PokeNameData[monsno][0], 23, 1+(no<<1) );
}

// ウィンドウ表示
static void H_DebugPokemonName(void)
{
	u8	i;

	NMenuWinBoxWrite( 21, 0, 29, 13 );

	for( i=0; i<TEMOTI_POKEMAX; i++ ){
		DebugDrawWinPokeName(i);
	}
}

// 手持ちポケモンを詰める
static void DebugSetPokeMine(void)
{
	u8	i,j;
	PokemonParam	dumy;

	for( i=0; i<5; i++ ){
		for( j=i+1; j<TEMOTI_POKEMAX; j++ ){
			if( PokeParaGet(&PokeParaMine[i],ID_monsno,0) == 0 ){
				dumy = PokeParaMine[i];
				PokeParaMine[i] = PokeParaMine[j];
				PokeParaMine[j] = dumy;
			}
		}
	}
	PokeCountMine = 0;
	for( i=0; i<TEMOTI_POKEMAX; i++ ){
		if( PokeParaGet(&PokeParaMine[i],ID_monsno,0) != 0 ) PokeCountMine++;
	}
	if( PokeCountMine == 0 ){
		PokeParaSet( &PokeParaMine[0], 1, 10, POW_RND, RND_NO_SET, 0 ,ID_NO_SET,0);
		PokeCountMine = 1;
	}
}

// ポケモン選択
static u8 DebugMyPokeMain(void)
{
	u16	monsno;
	u8	pokeNo;

	pokeNo = NMenuVCursorPosGet();
	monsno = PokeParaGet( &PokeParaMine[pokeNo], ID_monsno, 0 );

	if( sys.Trg & U_KEY ){
		SePlay(SE_SELECT);
		NMenuVCursorSet(-1);
		return 0;
	}

	if( sys.Trg & D_KEY ){
		SePlay(SE_SELECT);
		NMenuVCursorSet(1);
		return 0;
	}

	if( sys.Repeat & L_KEY ){
		SePlay(SE_SELECT);
		if( monsno == 0 )	monsno = MAX_POKE;
		else				monsno--;
		PokeParaSet( &PokeParaMine[pokeNo], monsno, 10, POW_RND ,RND_NO_SET ,0,ID_NO_SET,0);
		DebugDrawWinPokeName( pokeNo );
		return 0;
	}

	if( sys.Repeat & R_KEY ){
		SePlay(SE_SELECT);
		if( monsno == MAX_POKE )	monsno = 0;
		else						monsno++;
		PokeParaSet( &PokeParaMine[pokeNo], monsno, 10, POW_RND ,RND_NO_SET ,0,ID_NO_SET,0);
		DebugDrawWinPokeName( pokeNo );
		return 0;
	}

	if( sys.Trg & A_BUTTON || sys.Trg & B_BUTTON ){
		DebugSetPokeMine();
		MenuEnd();
		return	1;
	}

	return 0;
}
*/

//----------------------
//メニュー項目:BG表示切替
//----------------------
static u8	BGSts;

static void H_BGOnOff(u8 no)
{
	u8	onoff[] = {
		O__,F__,F__,EOM_,
		O__,N__,EOM_
	};

	NMenuBoxWrite( 25,no<<1,29,(no<<1)+1 );

	NMenuMsgWrite(&onoff[((BGSts>>no) & 1)<<2],25,no<<1);
}

static void H_BGCheck(void)
{
	u8	bg[] = {
		B__,G__,n0_,CR_,
		B__,G__,n1_,CR_,
		B__,G__,n2_,CR_,
		B__,G__,n3_,CR_,
		EOM_
	};

	NMenuBoxWrite( 19,0,29,8 );

	NMenuMsgWrite(bg,21,0);

    BGSts = (*(vu16 *)REG_DISPCNT>>8) & 0xf;

	H_BGOnOff(0);
	H_BGOnOff(1);
	H_BGOnOff(2);
	H_BGOnOff(3);
}

static u8 DebugBGKey(void)
{
	static u8	no;

	if( sys.Trg & U_KEY )
	{
		SePlay(SE_SELECT);
		NMenuVCursorSet(-1);
		if(no != 0)	no--;
		else		no=3;
	}
	if( sys.Trg & D_KEY )
	{
		SePlay(SE_SELECT);
		NMenuVCursorSet(1);
		if(no != 3)	no++;
		else		no=0;
	}
	if( sys.Trg & L_KEY || sys.Trg & R_KEY )
	{
		SePlay(SE_SELECT);
		BGSts ^= (1<<NMenuVCursorPosGet());
		H_BGOnOff(NMenuVCursorPosGet());
	//	BGSts ^= (1<<no);
	//	H_BGOnOff(no);
	}

	if( sys.Trg & A_BUTTON || sys.Trg & B_BUTTON )
	{
		*(vu16 *)REG_DISPCNT = (*(vu16 *)REG_DISPCNT & 0xf0ff)+(BGSts<<8);
		MenuEnd();
		return	1;
	}

	return	0;
}

static u8 DebugBGInit(void)
{
	NMenuScreenClear();
	H_BGCheck();
	NMenuVCursorInit(20,0,4,0);
	MenuFunc = DebugBGKey;
	return	0;
}

//------------------------
//メニュー項目:エンカウント
//------------------------
extern u8 encount_flag;

static void DrawOnOff( u8 flg )
{
	u8	onoff[] = {
		O__,N__,EOM_,
		O__,F__,F__,EOM_
	};

	NMenuWinBoxWrite( 25, 0, 29, 3 );
	NMenuMsgWrite( &onoff[ flg * 3 ], 26, 1 );
}

static u8 DebugEncountKey(void)
{
	if( sys.Trg & L_KEY || sys.Trg & R_KEY )
	{
		SePlay(SE_SELECT);
		encount_flag ^= 1;
		DrawOnOff( encount_flag );
	}

	if( sys.Trg & A_BUTTON || sys.Trg & B_BUTTON )
	{
		MenuEnd();
		return	1;
	}

	return	0;
}

static u8 DebugEncount(void)
{
	NMenuScreenClear();
	DrawOnOff( encount_flag );
	MenuFunc = DebugEncountKey;
	return	0;
}

//------------------------------
//メニュー項目:ひでんわざ
//------------------------------
static u8 make_hiden_menu(void);

static u8 DebugHidenWaza(void)
{
	MenuFunc = make_hiden_menu;
	return 0;
}


//=========================================================================
//=========================================================================
static const u8 str_revenge_exists[] = {
	sa_,i_,se_,n_,ka_,no_,u_,TO_,RE_,bou_,NA_,bou_,colon_,I_MSG_,STR_TEMP_BUF0,
	CR_,
	sa_,i_,se_,n_,zi_,yyo_,u_,ta_,i_,TO_,RE_,bou_,NA_,bou_,colon_,I_MSG_,STR_TEMP_BUF1,
	EOM_
};

static const u8 str_exist[] = { i_,ru_,EOM_ };
static const u8 str_not_exist[] = { i_,na_,i_,EOM_ };

static const u8 str_revenge_step_full[] = { ho_,su_,u_,spc_,sa_,i_,da_,i_,EOM_};
static const u8 str_revenge_step_clr[] = { ho_,su_,u_,spc_,KU_,RI_,A_,EOM_ };
static const u8 str_revenge_check[] = { TO_,RE_,bou_,NA_,bou_,spc_,ka_,ku_,ni_,n_,EOM_ };
static const u8 str_revenge_flag_clr[] = { HU_,RA_,GU_,spc_,O_,bou_,RU_,KU_,RI_,A_,EOM_ };
static const u8 str_revenge_flag_full[] = { HU_,RA_,GU_,spc_,O_,bou_,RU_,SE_,TTU_,TO_,EOM_ };

static u8 revenge_flag_full( void )
{
	int i;
	for ( i=0; i<NELEMS(Fld.RevengeFlag);i++ ) {
		Fld.RevengeFlag[i] = 1;
	}
	MenuEnd();
	return 1;
}

static u8 revenge_flag_clear( void )
{
	int i;
	for ( i=0; i<NELEMS(Fld.RevengeFlag);i++ ) {
		Fld.RevengeFlag[i] = 0;
	}
	MenuEnd();
	return 1;
}

static u8 revenge_check( void )
{
	NMenuScreenClear();
	if ( DebugCheckRevengeDataByMapID( Fld.MapID.div_id, Fld.MapID.map_id ) ) {
		PM_strcpy( StrTempBuffer0, str_exist );
	} else {
		PM_strcpy( StrTempBuffer0, str_not_exist );
	}
	if ( CheckRevengerByMapID( Fld.MapID.div_id, Fld.MapID.map_id ) ) {
		PM_strcpy( StrTempBuffer1, str_exist );
	} else {
		PM_strcpy( StrTempBuffer1, str_not_exist );
	}
	NMenuWinMsgWrite( str_revenge_exists );
	MenuFunc = ctrl_debug_keyend;
	return 0;
}

static u8 revenge_step_full( void )
{
	Fld.RevengeStepCount = REVENGE_STEP_MAX;
	MenuEnd();
	return 1;
}
static u8 revenge_step_clear( void )
{
	Fld.RevengeStepCount = 0;
	MenuEnd();
	return 1;
}

static const MENU_ITEM revenge_menu[] = {
	{ str_revenge_check,	revenge_check },
	{ str_revenge_step_full,revenge_step_full },
	{ str_revenge_step_clr,	revenge_step_clear },
	{ str_revenge_flag_full,revenge_flag_full },
	{ str_revenge_flag_clr, revenge_flag_clear },
};

static u8 ctrl_revenge_menu( void )
{
	return ctrl_debug_submenu( revenge_menu );
}

//------------------------------
//メニュー項目:再戦トレーナー
//------------------------------
static u8 DebugRevenge( void )
{
	NMenuScreenClear();
	make_debug_submenu( revenge_menu, 12, NELEMS(revenge_menu) );
	MenuFunc = ctrl_revenge_menu;
	return 0;
}
//=========================================================================
//		デバッグ用サファリサブメニュー
//=========================================================================
static const u8 str_rest_step[] = { no_,ko_,ri_,spc_,I_MSG_,STR_TEMP_BUF0,ho_,EOM_ };
static const u8 str_cube_info[] = {
	I_MSG_,STR_TEMP_BUF0, CR_,
	no_,ko_,ri_,spc_,I_MSG_,STR_TEMP_BUF1,ho_,EOM_
};
static const u8 str_no_cube[] = {
	me_,no_,ma_,e_,ni_,ha_,
	CR_,
	KI_,YYU_,bou_,BU_,ga_,spc_,a_,ri_,ma_,se_,n_,gyoe_,EOM_
};

static const u8 str_step_end[] = { ho_,su_,u_,wo_,no_,ko_,ri_,n1_,ni_,su_,ru_,EOM_ };
static const u8 str_ball_end[] = { BO_,bou_,RU_,wo_,no_,ko_,ri_,n1_,ni_,su_,ru_,EOM_ };
static const u8 str_cube_table[] = { KI_,YYU_,bou_,BU_,o_,ki_,ba_,EOM_ };
static const u8 str_ball_init[] = { BO_,bou_,RU_,wo_,no_,ko_,ri_,n3_,n0_,ni_,EOM_ };
static const u8 str_step_init[] =  { ho_,su_,u_,wo_,no_,ko_,ri_,n5_,n0_,n0_,ni_,EOM_ };

static u8 db_safari_ball_init( void )
{
	SafariBallCount = 30;
	MenuEnd();
	return 1;
}

static u8 db_safari_ball_end( void )
{
	SafariBallCount = 1;
	MenuEnd();
	return 1;
}

static u8 db_safari_step_init( void )
{
	SafariStepCount = 500;
	MenuEnd();
	return 1;
}

static u8 db_safari_step_end( void )
{
	SafariStepCount = 1;
	MenuEnd();
	return 1;
}

static u8 db_safari_cube_info( void )
{
	NMenuScreenClear();
	if ( DebugSafariCubeInfo() ) {
		NMenuWinMsgWrite( str_cube_info );
	} else {
		NMenuWinMsgWrite( str_no_cube );
	}
	MenuFunc = ctrl_debug_keyend;
	return 0;
}

static const MENU_ITEM debug_safari_menu[] =
{
	{ str_cube_table,	db_safari_cube_info },
	{ str_step_init,	db_safari_step_init },
	{ str_step_end,		db_safari_step_end },
	{ str_ball_init,	db_safari_ball_init },
	{ str_ball_end,		db_safari_ball_end },
};

static u8 ctrl_safari_menu( void )
{
	return ctrl_debug_submenu( debug_safari_menu );
}

//------------------------------
//メニュー項目:サファリ
//------------------------------
static u8 DebugSafari( void )
{
	if ( IsFieldSafariMode() == FALSE ) {
		MenuEnd();
		SePlay( SE_BOO );
		return 1;
	}

	NMenuScreenClear();
	make_debug_submenu( debug_safari_menu, 14, NELEMS(debug_safari_menu) );
	PM_NumMsgSet( StrTempBuffer0, SafariStepCount, NUM_MODE_SPACE, 3 );
	NMenuWinMsgWrite( str_rest_step );
	MenuFunc = ctrl_safari_menu;
	SetForceEvent();
	return	0;
}


//=========================================================================
//	ひでんわざメニュー
//=========================================================================
extern void TestIaigiri(void);
extern void TestIwakudaki(void);
extern void TestFlash(void);
extern void TestKairiki(void);
extern void TestTakinobori(void);
extern void TestHimitunotikara(void);
extern u8 SwimTest(void);
extern u8 DivingTest(void);
extern u8 SoraTest( void );

static u8 DebugIaigiri(void);
static u8 DebugIwakudaki(void);
static u8 DebugFlash(void);
static u8 DebugKairiki(void);
static u8 DebugTakinobori(void);
static u8 DebugHimitu(void);

static const MENU_ITEM debug_hiden_menu[] = 
{
	{ WazaNameData[ WAZANO_IAIGIRI ],	     DebugIaigiri },	// 00:いあいぎり
	{ WazaNameData[ WAZANO_HURASSYU ],	     DebugFlash },		// 01:フラッシュ
	{ WazaNameData[ WAZANO_IWAKUDAKI ],      DebugIwakudaki },	// 02:いわくだき
	{ WazaNameData[ WAZANO_KAIRIKI ],	     DebugKairiki },	// 03:かいりき
	{ WazaNameData[ WAZANO_NAMINORI ],       SwimTest },		// 04:なみのり
	{ WazaNameData[ WAZANO_SORAWOTOBU ],     SoraTest },		// 05:そらをとぶ
	{ WazaNameData[ WAZANO_TAKINOBORI ],     DebugTakinobori },	// 06:たきのぼり
	{ WazaNameData[ WAZANO_DAIBINGU ],       DivingTest },		// 07:ダイビング
	{ WazaNameData[ WAZANO_HIMITUNOTIKARA ], DebugHimitu },		// 08:ひみつのちから
};

enum{
	DEBUG_HIDEN_MENU_MAX = NELEMS(debug_hiden_menu),
	HIDEN_MENU_X_LEN = 10,
	HIDEN_MENU_Y_LEN = DEBUG_HIDEN_MENU_MAX*2+1,
};

// いあいぎり
static u8 DebugIaigiri(void)
{
	TestIaigiri();
	return	1;
}
// フラッシュ
static u8 DebugFlash(void)
{
	TestFlash();
	return	1;
}
// いわくだき
static u8 DebugIwakudaki(void)
{
	TestIwakudaki();
	return	1;
}
// かいりき
static u8 DebugKairiki(void)
{
	TestKairiki();
	return	1;
}
// たきのぼり
static u8 DebugTakinobori(void)
{
	TestTakinobori();
	MenuEnd();
	return	1;
}
// ひみつのちから
static u8 DebugHimitu(void)
{
	TestHimitunotikara();
	return	1;
}

// メイン処理
static u8 ctrl_hiden_menu(void)
{
	return ctrl_debug_submenu( debug_hiden_menu );
}

static u8 make_hiden_menu(void)
{
	NMenuScreenClear();
	make_debug_submenu( debug_hiden_menu, HIDEN_MENU_X_LEN, DEBUG_HIDEN_MENU_MAX );
	MenuFunc = ctrl_hiden_menu;
	return 0;
}

//=========================================================================
//=========================================================================
#define PT_XPOS	15
#define PT_YPOS	14
#define PT_XSIZ	13
#define PT_YSIZ	5

static const u8 line[]={spc_,zi_,ka_,n_,spc_,hu_,n_,spc_,bi_,yyo_,u_,EOM_};

static void TestViewPlayTimeTask(u8 no)
{
	u8 buf[8];
	switch(TaskTable[no].work[0])
	{
	case 0:
		NMenuScreenClear();
		NMenuWinBoxWrite(PT_XPOS,PT_YPOS,PT_XPOS+PT_XSIZ,PT_YPOS+PT_YSIZ);
		NMenuMsgWrite(line,PT_XPOS+1,PT_YPOS+1);
		TaskTable[no].work[0]++;
		break;

	case 1:
		PM_NumMsgSet( buf, MyData.playtime_h, NUM_MODE_SPACE, 4);
		NMenuMsgWrite( buf,PT_XPOS+1,PT_YPOS+3);
		PM_NumMsgSet( buf, MyData.playtime_m, NUM_MODE_SPACE, 3);
		NMenuMsgWrite( buf,PT_XPOS+5,PT_YPOS+3);
		PM_NumMsgSet( buf, MyData.playtime_s, NUM_MODE_SPACE, 3);
		NMenuMsgWrite( buf,PT_XPOS+8,PT_YPOS+3);
		if(sys.Cont & B_BUTTON) DelTask(no);
	};
}

//------------------------
//	メニュー項目:プレイ時間
//------------------------
static u8 DebugPlayTime(void)
{
	if( CheckTask(TestViewPlayTimeTask) == FALSE )
	{
		AddTask(TestViewPlayTimeTask,TSK_PRI_EFFECT);
	};
	MenuEnd();
	return 1;
}



//=========================================================================
//
//	日付表示（デバッグ用）
//
//=========================================================================

#define TO_I(c)	((c) - '0')

#include "d_date2.h"	/* 日付文字列：セーブデータ継続可能*/

#define YEAR_POS	0
#define MONS_POS	5
#define DAY_POS		8
#define HOUR_POS	11
#define MIN_POS		14

static void debug_make_date_string( const u8 * date, u8 * buf )
{
	int i;
	u16 year, month, day, hour, min;

	year = 0;
	for( i=0; i<2 ;i++)
	{
		year *= 10;
		year += TO_I(date[i+YEAR_POS+2]);
	};
	month = TO_I(date[MONS_POS])*10 + TO_I(date[MONS_POS+1]);
	day = TO_I(date[DAY_POS])*10 + TO_I(date[DAY_POS+1]);
	hour = TO_I(date[HOUR_POS])*10 + TO_I(date[HOUR_POS+1]);
	min = TO_I(date[MIN_POS])*10 + TO_I(date[MIN_POS+1]);

	buf = PM_NumMsgSet( buf, year, NUM_MODE_ZERO, 2 );
	*buf++ = sura_;
	buf = PM_NumMsgSet( buf, month, NUM_MODE_ZERO, 2 );
	*buf++ = sura_;
	buf = PM_NumMsgSet( buf, day, NUM_MODE_ZERO, 2 );
	*buf++ = spc_;
	buf = PM_NumMsgSet( buf, hour, NUM_MODE_ZERO, 2 );
	*buf++ = colon_;
	buf = PM_NumMsgSet( buf, min, NUM_MODE_ZERO, 2 );
}

void DebugPutDate( u8 x, u8 y )
{
	debug_make_date_string( build_date, MsgExpandBuffer );
	NMenuMsgWrite( MsgExpandBuffer, x, y );
}

void DebugPutContinueDate( u8 x, u8 y )
{
	debug_make_date_string( continue_date, MsgExpandBuffer );
	NMenuMsgWrite( MsgExpandBuffer, x, y );
}


//=========================================================================
//
//=========================================================================
//------------------------------------------------------------------------
//------------------------------------------------------------------------
static void make_debug_submenu( const MENU_ITEM * menu, u8 x_len, u8 menu_max )
{
	NMenuScreenClear();
	NMenuWinBoxWrite(0, 0, x_len, menu_max*2+1 );
	NMenuFixListWrite(2, 1, menu_max, menu);
	NMenuVCursorInit(1, 1, menu_max, 0);
}

//------------------------------------------------------------------------
//------------------------------------------------------------------------
static u8 ctrl_debug_submenu( const MENU_ITEM * menu )
{
	s8 num;

	num = NMenuVCursorControl();
	switch(num){
	case CURSOR_DEFAULT_VALUE:
		return 0;

	case CURSOR_CANCEL_VALUE:
		MenuEnd();
		return 1;

	default:
		break;
	}

	NMenuScreenClear();
	MenuFunc = menu[num].ptr;
	return 0;
}

//------------------------------------------------------------------------
//------------------------------------------------------------------------
static u8 ctrl_debug_keyend( void )
{
	if ( sys.Trg & A_BUTTON ) {
		MenuEnd();
		return 1;
	} else {
		return 0;
	}
}

//------------------------------------------------------------------------
//------------------------------------------------------------------------
static int change_counter( s16 * val, s32 min, s32 max ,u16 key )
{
	if ( key & D_KEY ){
		(*val) --;
		if ( *val < min ) *val = max;
	} else if ( key & U_KEY ){
		(*val) ++;
		if ( *val > max ) *val = min;
	} else if ( key & L_KEY ) {
		*val -= 10;
		if ( *val < min ) *val = max;
	} else if ( key & R_KEY ) {
		*val += 10;
		if ( *val > max ) *val = min;
	} else {
		return FALSE;
	}
	return TRUE;
}

//------------------------------------------------------------------------
//------------------------------------------------------------------------
static int DebugFlagKey( u32 flag )
{
	if ( sys.Trg & A_BUTTON || sys.Trg & B_BUTTON ) {
		MenuEnd();
		return	-1;
	}

	if ( sys.Trg & L_KEY || sys.Trg & R_KEY ) {
		SePlay(SE_SELECT);
		if ( flag ) {
			DrawOnOff(1);		//ON->OFF
			return 0;
		} else {
			DrawOnOff(0);		//OFF->ON
			return 1;
		}
	}
	return	flag;
}
//=========================================================================
//
//	どうぐ取得インターフェイス（デバッグ用）
//
//=========================================================================
enum{
	ITEM_COUNT_MAX	=	99,
};

static const u8 item_dore_msg[] =
{ do_,no_,spc_,do_,u_,gu_,wo_,spc_,e_,ra_,bi_,ma_,su_,ka_,hate_,EOM_ };
static const u8 item_ikutu_msg[] =
{ i_,ku_,tu_,de_,su_,ka_,hate_,EOM_};

static void add_debug_item_task( void );

static void debug_item_task( u8 no );
static void debug_item_type_task( u8 no );
static void debug_item_count_task( u8 no );
static void debug_item_end_task( u8 no );
static void debug_item_print( u16 item, u16 no );

//------------------------------
//メニュー項目:どうぐをつくる
//------------------------------
static u8 DebugItem(void)
{
	MenuEnd();
	add_debug_item_task();
	SetForceEvent();
	return	1;
}

static void add_debug_item_task( void )
{
	u8 no;
	no = AddTask( debug_item_task, TSK_PRI_EFFECT );
	NMenuScreenClear();
	TaskTable[no].work[1] = 1;
	TaskTable[no].work[2] = 1;
}

static void debug_item_print( u16 item, u16 no )
{
	NMenuBoxWrite( 4,17,22,18 );
	PM_NumMsgSet( StrTempBuffer0, item, NUM_MODE_SPACE, 3 );
	NMenuMsgWrite( StrTempBuffer0, 4, 17 );
	NMenuMsgWrite( ItemNameGet( item ), 4+4, 17 );
	PM_NumMsgSet( StrTempBuffer0, no, NUM_MODE_SPACE, 3 );
	NMenuMsgWrite( StrTempBuffer0, 4+4+10, 17 );
}

static void debug_item_task( u8 no )
{
	TASK_TABLE * my = &TaskTable[no];

	NMenuTalkWinWrite();
	NMenuMsgWrite(item_dore_msg, MWIN_MSGXPOS, MWIN_MSGYPOS);
	debug_item_print( my->work[1], my->work[2] );
	my->TaskAdrs = debug_item_type_task;
}

static void debug_item_type_task( u8 no )
{
	TASK_TABLE * my = &TaskTable[no];

	if ( sys.Trg & A_BUTTON ) {
		NMenuTalkWinWrite();
		NMenuMsgWrite(item_ikutu_msg, MWIN_MSGXPOS, MWIN_MSGYPOS);
		debug_item_print( my->work[1], my->work[2] );
		my->TaskAdrs = debug_item_count_task;

	} else if ( sys.Trg & B_BUTTON ) {
		my->TaskAdrs = debug_item_end_task;
		return;

	} else if ( change_counter( &(my->work[1]), 1, ITEM_DATA_MAX, sys.Repeat ) == TRUE ) {
		debug_item_print( my->work[1], my->work[2] );
	}
}

static void debug_item_count_task( u8 no )
{
	TASK_TABLE * my = &TaskTable[no];

	if ( sys.Trg & A_BUTTON ) {
		if( AddItem( my->work[1], my->work[2] ) == TRUE )SePlay(SE_SELECT);
		my->TaskAdrs = debug_item_task;

	} else if ( sys.Trg & B_BUTTON ) {
		my->TaskAdrs = debug_item_task;

	} else if ( change_counter( &(my->work[2]), 1, ITEM_COUNT_MAX, sys.Repeat ) == TRUE ) {
		debug_item_print( my->work[1], my->work[2] );
	}
}

static void debug_item_end_task( u8 no )
{
	NMenuScreenClear();
	ResetForceEvent();
	DelTask(no);
	AddDebugMenuTask();
}

//=========================================================================
//	似顔絵データ表示（デバッグ用）
//=========================================================================

static const u8 msg_param_list[] = {
	ni_,ga_,o_,e_,spc_,ba_,n_,go_,u_,CR_,
	PO_,KE_,MO_,N_,NA_,N_,BA_,bou_,CR_,
	PO_,KE_,MO_,N_,me_,i_,CR_,
	BU_,RI_,bou_,DA_,bou_,me_,i_,CR_,
	si_,yyu_,ru_,i_,CR_,
	ko_,se_,i_,ra_,n_,su_,u_,
	EOM_
};
static const u8 msg_nothing[] = {
	DE_,bou_,TA_,na_,si_,EOM_
};

static void debug_put_portrait_info( int number )
{
	u8 buf[11];
	PORTRAIT_DATA * p;

	if ( 0 >= number || number > PORTRAIT_MAX ) number = 1;
	p = &(Fld.PortraitData[number-1]);

	NMenuScreenClear();
	NMenuWinBoxWrite(0,0,19,17);
	NMenuMsgWrite(msg_param_list,2,2);
	PM_NumMsgSet( buf, number, NUM_MODE_SPACE, 3);
	NMenuMsgWrite( buf, 11, 2 );
	PM_NumMsgSet( buf, p->monsno, NUM_MODE_SPACE, 3);
	NMenuMsgWrite( buf, 11, 4 );
	if ( PM_strlen( p->nickname ) <= 11 ) {
		NMenuMsgWrite( p->nickname, 11, 6 );
	} else {
		NMenuMsgWrite( msg_nothing, 11, 6 );
	}
	if ( PM_strlen( p->oyaname ) <= 11 ) {
		NMenuMsgWrite( p->oyaname, 11, 8 );
	} else {
		NMenuMsgWrite( msg_nothing, 11, 8 );
	}
	PM_NumMsgSet( buf, p->pict_type, NUM_MODE_SPACE, 3);
	NMenuMsgWrite( buf, 11, 10 );
	PM_HexNumMsgSet( buf, p->personal_rnd, NUM_MODE_ZERO, 8 );
	NMenuMsgWrite( buf, 11, 12 );
}

static void debug_put_portrait_task( u8 no )
{
	if ( sys.Trg & A_BUTTON ) {
		NMenuScreenClear();
		DelTask(no);
		ResetForceEvent();
	}
}

static void debug_select_portrait_task( u8 no )
{
	TASK_TABLE * my = &(TaskTable[no]);
	if ( my->work[0] == 0 ) {
		my->work[0] ++;

	} else if ( sys.Trg & A_BUTTON ) {
		debug_put_portrait_info( my->work[0] );
		my->TaskAdrs = debug_put_portrait_task;
		return;

	} else if ( change_counter( &(my->work[0]), 1, PORTRAIT_MAX,
				sys.Repeat &(U_KEY|D_KEY) ) == FALSE ) {
		return;
	}

	NMenuBoxWrite( 4,17,22,18 );
	PM_NumMsgSet( StrTempBuffer0, my->work[0], NUM_MODE_SPACE, 3 );
	NMenuMsgWrite( StrTempBuffer0, 4, 17 );
}

//------------------------------
//メニュー項目:似顔絵情報表示
//------------------------------
static u8 DebugPortrait(void)
{
	MenuEnd();
	AddTask( debug_select_portrait_task, TSK_PRI_EFFECT );
	SetForceEvent();
	return	1;
}


void PutPortrait( int number )
{
	debug_put_portrait_info( number );
}

//==========================================================
//					バッジフラグセット
//==========================================================
//------------------------------
//メニュー項目:バッジフラグセット
//------------------------------
static u8 DebugBatchSet(void)
{
	EventFlagSet( SYS_BATCH01_GET );
	EventFlagSet( SYS_BATCH02_GET );
	EventFlagSet( SYS_BATCH03_GET );
	EventFlagSet( SYS_BATCH04_GET );
	EventFlagSet( SYS_BATCH05_GET );
	EventFlagSet( SYS_BATCH06_GET );
	EventFlagSet( SYS_BATCH07_GET );
	EventFlagSet( SYS_BATCH08_GET );
	MenuEnd();
	return	1;
}


//==========================================================
//					RTC関連
//==========================================================
extern void DebugRtcWatchTask( u8 no );
extern const VM_CODE debug_clock_script[];

//------------------------------
//メニュー項目:時間確認
//------------------------------
static u8 DebugRTCwatch(void)
{
	MenuEnd();
	AddTask( DebugRtcWatchTask, TSK_PRI_EFFECT );
	SetForceEvent();
	return	1;
}

//------------------------------
//メニュー項目:時間設定
//------------------------------
static u8 DebugRTCset(void)
{
	MenuEnd();
	DebugSetGameTime();
	SetForceEvent();
	return 1;
}

//==========================================================
//
//==========================================================
static const u8 msg_maboroshi_cycle[] = {
	MA_,BO_,RO_,SI_,ZI_,MA_,spc_,si_,yyu_,tu_,ge_,n_,
	CR_,
	ko_,se_,i_,ra_,n_,su_,u_,spc_,I_MSG_,STR_TEMP_BUF0,
	EOM_
};

static void put_maboroshi_cycle( u16 value )
{
	PM_HexNumMsgSet( StrTempBuffer0, value, NUM_MODE_LEFT, 4 );
	NMenuWinMsgWrite( msg_maboroshi_cycle );
}

static void debug_maboroshi_change_task( u8 no )
{
	s16 * wk = TaskTable[no].work;

	switch ( wk[0] ) {
	case 0:
		wk[1] = GetEventWorkValue( WK_MABOROSI_RND_H );
		put_maboroshi_cycle( wk[1] );
		wk[0]++;
		break;

	case 1:
		if ( sys.Trg & A_BUTTON ) {
			SePlay( SE_PINPON );
			*(u16 *)(GetEventWorkAdrs( WK_MABOROSI_RND_H ) ) = wk[1];
			NMenuScreenClear();
			DelTask(no);
			ResetForceEvent();
		}
		else if ( sys.Trg & B_BUTTON ) {
			NMenuScreenClear();
			DelTask(no);
			ResetForceEvent();
		}
		else if ( change_counter( &(wk[1]), 0, 0xffff, sys.Repeat ) == TRUE ) {
			put_maboroshi_cycle( wk[1] );
		}
	}
}

//------------------------------
//メニュー項目:マボロシ周期変更
//------------------------------
static u8 DebugMaboroshiChg( void )
{
	MenuEnd();
	AddTask( debug_maboroshi_change_task, TSK_PRI_EFFECT );
	SetForceEvent();
	return 1;
}

//===========================================================
//			ゲームクリアフラグ切り替え
//===========================================================
static u8 DebugGameClearKey(void)
{
	if( sys.Trg & L_KEY || sys.Trg & R_KEY ){
		SePlay(SE_SELECT);
		if( EventFlagCheck( SYS_GAME_CLEAR ) == 0 ){
			EventFlagSet( SYS_GAME_CLEAR );
			DrawOnOff(0);
		}else{
			EventFlagReset( SYS_GAME_CLEAR );
			DrawOnOff(1);
		}
	}

	if( sys.Trg & A_BUTTON || sys.Trg & B_BUTTON ){
		MenuEnd();
		return	1;
	}

	return	0;
}

static u8 DebugGameClear(void)
{
	NMenuScreenClear();
	DrawOnOff( EventFlagCheck( SYS_GAME_CLEAR ) ^ 1 );
	MenuFunc = DebugGameClearKey;
	return	0;
}

//===========================================================
//===========================================================

static u8 DebugWeatherEventFlagKey(void)
{
	switch ( DebugFlagKey( EventFlagCheck(SYS_WEATHER_CTRL) ) ) {
	case 0:
		EventFlagReset(SYS_WEATHER_CTRL);
		break;
	case 1:
		EventFlagSet(SYS_WEATHER_CTRL);
		break;
	case -1:
		return 1;
	}
	return 0;
}

static u8 DebugWeatherEventFlag(void)
{
	NMenuScreenClear();
	DrawOnOff( !EventFlagCheck(SYS_WEATHER_CTRL) );
	MenuFunc = DebugWeatherEventFlagKey;
	return	0;
}


static u8 DebugExDataFlagKey(void)
{
	switch ( DebugFlagKey(ExDataSpecialFlagCheck()) ) {
	case 0:
		ExDataSpecialFlagInit();
		break;
	case 1:
		ExDataSpecialFlagSet();
		break;
	case -1:
		return 1;
	}
	return 0;
}

static u8 DebugExDataFlag(void)
{
	NMenuScreenClear();
	DrawOnOff( !ExDataSpecialFlagCheck() );
	MenuFunc = DebugExDataFlagKey;
	return	0;
}


//===========================================================
//	ゲーム内出来事いろいろカウントシステム
//===========================================================
static const u8 msg_record_info[] = {
	I_MSG_,STR_TEMP_BUF0,colon_,I_MSG_,STR_TEMP_BUF1,CR_,I_MSG_,STR_TEMP_BUF2,EOM_ };

static const u8 str_nouse_record[] = { mi_,si_,yo_,u_,spc_,DE_,bou_,TA_,EOM_ };

//操作項目名
static const u8 str_check_record[] = { ka_,ku_,ni_,n_,EOM_ };
static const u8 str_set_record[] = { sa_,i_,da_,i_,bou_,n1_,SE_,TTU_,TO_,EOM_ };
static const u8 str_clear_record[] = { ZE_,RO_,spc_,KU_,RI_,A_,EOM_ };

//レコード名
static const u8 str_CNT_REPORT[] = { RE_,PO_,bou_,TO_,EOM_ };
static const u8 str_SV_TOTAL_TIME[] = { KU_,RI_,A_,spc_,zi_,ka_,n_,EOM_ };
static const u8 str_CNT_TREND[] = { ri_,yyu_,u_,ko_,u_,spc_,sa_,ku_,se_,i_,EOM_ };
static const u8 str_CNT_NUTS[] = { ki_,no_,mi_,wo_,spc_,u_,e_,ta_,ka_,i_,su_,u_,EOM_ };
static const u8 str_CNT_BICYCLE_TRADE[] = { zi_,te_,n_,si_,yya_,ko_,u_,ka_,n_,EOM_};
static const u8 str_CNT_WALK[] = { ho_,su_,u_,EOM_ };
static const u8 str_CNT_INTERVIEW[] = { I_,N_,TA_,BI_,YYU_,bou_,EOM_ };
static const u8 str_CNT_BATTLE[] = { BA_,TO_,RU_,EOM_ };
static const u8 str_CNT_WILD_BATTLE[] = { ya_,se_,i_,BA_,TO_,RU_,EOM_ };
static const u8 str_CNT_TRAINER_BATTLE[] = { TO_,RE_,bou_,NA_,bou_,BA_,TO_,RU_,EOM_ };
static const u8 str_CNT_DENDOU[] = { de_,n_,do_,u_,i_,ri_,EOM_ };
static const u8 str_CNT_CATCH_POKE[] = { PO_,KE_,MO_,N_,ho_,ka_,ku_,EOM_ };
static const u8 str_CNT_TURI[] = { tu_,ttu_,ta_,spc_,ka_,i_,su_,u_,EOM_ };
static const u8 str_CNT_TAMAGO[] = { TA_,MA_,GO_,ka_,e_,ttu_,ta_,EOM_ };
static const u8 str_CNT_SHINKA[] = { si_,n_,ka_,si_,ta_,EOM_ };
static const u8 str_CNT_KAIFUKU_PC[] = { PO_,KE_,SE_,N_,spc_,ka_,i_,hu_,ku_,EOM_ };
static const u8 str_CNT_KAIFUKU_HOME[] = { zi_,ta_,ku_,spc_,ka_,i_,hu_,ku_,EOM_ };
static const u8 str_CNT_SAFARI[] = { SA_,HU_,AA_,RI_,spc_,ri_,yo_,u_,EOM_ };
static const u8 str_CNT_HIDEN_IAIGIRI[] = { hi_,de_,n_,colon_,i_,a_,i_,gi_,ri_,EOM_ };
static const u8 str_CNT_HIDEN_IWAKUDAKI[] = { hi_,de_,n_,colon_,i_,wa_,ku_,da_,ki_,EOM_ };
static const u8 str_CNT_AGITTRANS[] = { ki_,ti_,spc_,hi_,ttu_,ko_,si_,EOM_ };
static const u8 str_CNT_COMM_TRADE[] = { tu_,u_,si_,n_,ko_,u_,ka_,n_,EOM_ };
static const u8 str_CNT_COMM_TAISEN[] = { tu_,u_,si_,n_,ta_,i_,se_,n_,EOM_ };
static const u8 str_CNT_KACHI[] = { tu_,u_,si_,n_,spc_,ka_,ti_,EOM_ };
static const u8 str_CNT_MAKE[] = { tu_,u_,si_,n_,spc_,ma_,ke_,EOM_ };
static const u8 str_CNT_HIKIWAKE[] = { tu_,u_,si_,n_,spc_,hi_,ki_,wa_,ke_,EOM_ };
static const u8 str_CNT_WAZA_HANERU[] = { wa_,za_,colon_,ha_,ne_,ru_,EOM_ };
static const u8 str_CNT_WAZA_WARUAGAKI[] = { wa_,za_,colon_,wa_,ru_,a_,ga_,ki_,EOM_ };
static const u8 str_CNT_SLOT[] = { SU_,RO_,TTU_,TO_,o_,o_,a_,ta_,ri_,ka_,i_,su_,u_,EOM_ };
static const u8 str_CNT_ROULETTE[] = { RU_,bou_,RE_,TTU_,TO_,spc_,re_,n_,si_,yyo_,u_,EOM_ };
static const u8 str_CNT_TOWER_BATTLE[] = { BA_,TO_,RU_,TA_,WA_,bou_,EOM_ };
static const u8 str_CNT_TOWER_KACHI[] = { BA_,TO_,RU_,TA_,WA_,bou_,ka_,ti_,EOM_ };
static const u8 str_CNT_TOWER_RENSHOU[] = { BA_,TO_,RU_,TA_,WA_,bou_,re_,n_,si_,yyo_,u_,EOM_ };
static const u8 str_CNT_MAKE_CUBE[] = { PO_,RO_,TTU_,KU_,sa_,ku_,se_,i_,EOM_ };
static const u8 str_CNT_COMM_CUBE_MAKE[] = { tu_,u_,si_,n_,de_,PO_,RO_,TTU_,KU_,tu_,ku_,ttu_,ta_,EOM_ };
static const u8 str_CNT_COMM_CONTEST_WIN[] = { tu_,u_,si_,n_,KO_,N_,TE_,SU_,TO_,ka_,ti_,EOM_ };
static const u8 str_CNT_CONTEST[] = { C__,P__,U__,KO_,N_,TE_,SU_,TO_,sa_,n_,ka_,EOM_ };
static const u8 str_CNT_CONTEST_WIN[] = { C__,P__,U__,KO_,N_,TE_,SU_,TO_,ka_,ti_,EOM_ };
static const u8 str_CNT_SHOPPING[] = { ka_,i_,mo_,no_,EOM_ };
static const u8 str_CNT_DOWSING[] = { DA_,U_,ZI_,N_,GU_,MA_,SI_,N_,EOM_ };
static const u8 str_CNT_RAIN[] = { a_,me_,hu_,ri_,EOM_ };
static const u8 str_CNT_POKEDEX[] = { zu_,ka_,n_,wo_,mi_,ta_,EOM_ };
static const u8 str_CNT_RIBBON[] = { RI_,BO_,N_,spc_,mo_,ra_,ttu_,ta_,EOM_ };
static const u8 str_CNT_JUMP[] = { da_,n_,sa_,spc_,to_,bi_,o_,ri_,EOM_ };
static const u8 str_CNT_TV_WATCH[] = { T__,V__,wo_,spc_,mi_,ta_,EOM_ };
static const u8 str_CNT_CLOCK_WATCH[] = { to_,ke_,i_,wo_,spc_,mi_,ta_,EOM_ };
static const u8 str_CNT_POKE_LOTO[] = { ku_,zi_,ga_,spc_,a_,ta_,ttu_,ta_,EOM_ };
static const u8 str_CNT_SODATEYA[] = { PO_,KE_,MO_,N_,a_,zu_,ke_,ta_,EOM_ };
static const u8 str_CNT_ROPEWAY[] = { RO_,bou_,PU_,U_,EE_,I_,ri_,yo_,u_,EOM_ };

static const u8 str_CNT_ONSEN[] = { o_,n_,se_,n_,spc_,ha_,i_,ttu_,ta_,EOM_ };

enum{
	MAX_OF_U24 = 0xffffff,
	MAX_OF_999 = 999,
	MAX_OF_9x4 = 9999,
	MAX_OF_GT =  ((PLAYTIME_H_MAX - 1) << 16) + (59 << 8) + 59,
	MAX_NOUSE =	0,
};
static const struct DEBUG_RECORD {
	u32 max;
	const u8 * string;
} DebugRecordList[] = {
	{ MAX_OF_U24, str_CNT_REPORT, },
	{ MAX_OF_GT, str_SV_TOTAL_TIME, },
	{ MAX_OF_U24, str_CNT_TREND, },
	{ MAX_OF_U24, str_CNT_NUTS, },
	{ MAX_OF_U24, str_CNT_BICYCLE_TRADE, },
	{ MAX_OF_U24, str_CNT_WALK, },
	{ MAX_OF_U24, str_CNT_INTERVIEW, },
	{ MAX_OF_U24, str_CNT_BATTLE, },
	{ MAX_OF_U24, str_CNT_WILD_BATTLE, },
	{ MAX_OF_U24, str_CNT_TRAINER_BATTLE, },
	{ MAX_OF_999, str_CNT_DENDOU, },
	{ MAX_OF_U24, str_CNT_CATCH_POKE, },
	{ MAX_OF_U24, str_CNT_TURI, },
	{ MAX_OF_U24, str_CNT_TAMAGO, },
	{ MAX_OF_U24, str_CNT_SHINKA, },
	{ MAX_OF_U24, str_CNT_KAIFUKU_PC, },
	{ MAX_OF_U24, str_CNT_KAIFUKU_HOME, },
	{ MAX_OF_U24, str_CNT_SAFARI, },
	{ MAX_OF_U24, str_CNT_HIDEN_IAIGIRI, },
	{ MAX_OF_U24, str_CNT_HIDEN_IWAKUDAKI, },
	{ MAX_OF_U24, str_CNT_AGITTRANS, },
	{ MAX_OF_U24, str_CNT_COMM_TRADE, },
	{ MAX_OF_U24, str_CNT_COMM_TAISEN, },
	{ MAX_OF_9x4, str_CNT_KACHI, },
	{ MAX_OF_9x4, str_CNT_MAKE, },
	{ MAX_OF_9x4, str_CNT_HIKIWAKE, },
	{ MAX_OF_U24, str_CNT_WAZA_HANERU, },
	{ MAX_OF_U24, str_CNT_WAZA_WARUAGAKI, },
	{ MAX_OF_U24, str_CNT_SLOT, },
	{ MAX_OF_U24, str_CNT_ROULETTE, },
	{ MAX_OF_U24, str_CNT_TOWER_BATTLE, },
	{ MAX_NOUSE, str_CNT_TOWER_KACHI, },
	{ MAX_NOUSE, str_CNT_TOWER_RENSHOU, },
	{ MAX_OF_U24, str_CNT_MAKE_CUBE, },
	{ MAX_OF_U24, str_CNT_COMM_CUBE_MAKE, },
	{ MAX_OF_U24, str_CNT_COMM_CONTEST_WIN, },
	{ MAX_OF_U24, str_CNT_CONTEST, },
	{ MAX_OF_U24, str_CNT_CONTEST_WIN, },
	{ MAX_OF_U24, str_CNT_SHOPPING, },
	{ MAX_OF_U24, str_CNT_DOWSING, },
	{ MAX_OF_U24, str_CNT_RAIN, },
	{ MAX_OF_U24, str_CNT_POKEDEX, },
	{ MAX_OF_U24, str_CNT_RIBBON, },
	{ MAX_OF_U24, str_CNT_JUMP, },
	{ MAX_OF_U24, str_CNT_TV_WATCH, },
	{ MAX_OF_U24, str_CNT_CLOCK_WATCH, },
	{ MAX_OF_U24, str_CNT_POKE_LOTO, },
	{ MAX_OF_U24, str_CNT_SODATEYA, },
	{ MAX_OF_U24, str_CNT_ROPEWAY, },
	{ MAX_OF_U24, str_CNT_ONSEN, },
};


static void debug_print_record( u16 no )
{
	u32 val = GetRecord(no);
	PM_NumMsgSet( StrTempBuffer0, no, NUM_MODE_ZERO, 2 );
	PM_strcpy( StrTempBuffer1, DebugRecordList[no].string );
	if (DebugRecordList[no].max == MAX_NOUSE) {
		PM_strcpy(StrTempBuffer2, str_nouse_record);
	}
	else if ( no != SV_TOTAL_TIME ) {
		PM_NumMsgSet( StrTempBuffer2, val, NUM_MODE_SPACE, 10 );
	}
	else {
		PM_NumMsgSet( StrTempBuffer2, val>>16, NUM_MODE_SPACE,3 );
		StrTempBuffer2[3] = colon_;
		PM_NumMsgSet( StrTempBuffer2+4, (val>>8)&0xff, NUM_MODE_ZERO,2);
		StrTempBuffer2[6] = colon_;
		PM_NumMsgSet( StrTempBuffer2+7, val&0xff, NUM_MODE_ZERO,2 );
	}
	NMenuTalkWinWrite();
	NMenuMsgWrite(msg_record_info, MWIN_MSGXPOS, MWIN_MSGYPOS);
}

static int debug_record_task_core(u8 no)
{
	s16 * wk;

	wk = TaskTable[no].work;
	switch ( wk[0] ) {
	case 0:
		debug_print_record(wk[1]);
		wk[0] ++;
		break;

	case 1:
		if ( sys.Trg & A_BUTTON ) {
			wk[0] --;
			return TRUE;
		}
		else if (sys.Trg & B_BUTTON) {
			wk[0] ++;
			return FALSE;
		}
		else if ( sys.Repeat & U_KEY ) {
			wk[1] ++;
			if ( wk[1] == CNT_END ) wk[1] = 0;
			debug_print_record(wk[1]);
		}
		else if ( sys.Repeat & D_KEY ) {
			wk[1] --;
			if ( wk[1] < 0 ) wk[1] = CNT_END - 1;
			debug_print_record(wk[1]);
		}
		break;

	case 2:
		NMenuScreenClear();
		ResetForceEvent();
		DelTask(no);
	}
	return FALSE;
}

static void debug_record_info_task( u8 no )
{
	debug_record_task_core(no);
}

static void debug_record_setmaxminus1_task(u8 no)
{
	u8 id;
	if (debug_record_task_core(no) == FALSE)
		return;

	id = TaskTable[no].work[1];
	if (DebugRecordList[id].max == MAX_NOUSE)
		return;

	SetRecord(id, DebugRecordList[id].max - 1);
	SePlay(SE_PIN);
}

static void debug_record_clear_task(u8 no)
{
	u8 id;

	if (debug_record_task_core(no) == FALSE)
		return;

	id = TaskTable[no].work[1];
	if (DebugRecordList[id].max == MAX_NOUSE)
		return;

	SetRecord(id, 0);
	SePlay(SE_PIN);
}


static u8 debug_task_start(pTaskFunc f)
{
	MenuEnd();
	SetForceEvent();
	AddTask(f, TSK_PRI_EFFECT);
	return 1;
}

static u8 debug_record_info_start( void )
{
	return debug_task_start(debug_record_info_task);
}
static u8 debug_record_maxset_start(void)
{
	return debug_task_start(debug_record_setmaxminus1_task);
}
static u8 debug_record_clear_start(void)
{
	return debug_task_start(debug_record_clear_task);
}

static const MENU_ITEM debug_record[] = {
	{ str_check_record, debug_record_info_start },
	{ str_set_record,	debug_record_maxset_start },
	{ str_clear_record,	debug_record_clear_start },
};

static u8 ctrl_record_menu(void)
{
	return ctrl_debug_submenu(debug_record);
}

static u8 DebugRecord(void)
{
	NMenuScreenClear();
	make_debug_submenu(debug_record, 12, NELEMS(debug_record));
	MenuFunc = ctrl_record_menu;
	return 0;
}

//===========================================================
//===========================================================
static const u8 test_cell_msg[] =
{
	A__,T__,T__,R__,colon_,I_MSG_,STR_TEMP_BUF0,
	spc_,H__,E__,I__,G__,H__,T__,colon_,I_MSG_,STR_TEMP_BUF2,
	CR_,
	C__,O__,D__,E__,colon_,I_MSG_,STR_TEMP_BUF1,
	EOM_
};

static void debug_make_cell_info( void )
{
	s16 x,y;
	GetHeroFrontCellPos( &x, &y );
	AnswerWork = GetCellAttribute(x,y);
	PM_HexNumMsgSet(StrTempBuffer0, AnswerWork, NUM_MODE_ZERO, 4);
	AnswerWork = GetCellCode(x,y);
	PM_HexNumMsgSet(StrTempBuffer1, AnswerWork, NUM_MODE_ZERO, 4);
	AnswerWork = GetCellHeight(x,y);
	PM_HexNumMsgSet(StrTempBuffer2, AnswerWork, NUM_MODE_ZERO, 4);
	PM_MsgExpand( MsgExpandBuffer, test_cell_msg );
}

static void test_putc_put_task( u8 no )
{
	switch ( TaskTable[no].work[0] ) {
	case 0:
		NMenuTalkWinWrite();
		TaskTable[no].work[0] ++;
		break;
	case 1:
		NMenuMsgWrite(MsgExpandBuffer, MWIN_MSGXPOS, MWIN_MSGYPOS);
		TaskTable[no].work[0] ++;
		break;
	case 2:
		if ( sys.Trg & A_BUTTON ) {
			NMenuScreenClear();
			ResetForceEvent();
			DelTask(no);
		}
		break;
	}
}

static u8 DebugPutCellInfo( void )
{
	MenuEnd();
	AddTask( test_putc_put_task, TSK_PRI_EFFECT );

	debug_make_cell_info();
	SetForceEvent();
	return 1;
}


//===========================================================
//===========================================================
extern const u8 * DebugFrontSeedCheck( void );
static u8 DebugSeedInfo(void)
{
	const u8 * msg;

	msg = DebugFrontSeedCheck();
	if (msg != NULL) {
		NMenuWinBoxWrite(0,0,19,19);
		NMenuMsgWrite(msg,1,1);
		MenuFunc = ctrl_debug_keyend;
		return 0;
	} else {
		MenuEnd();
		return 1;
	}
}

//===========================================================
//===========================================================
enum{
	BTWK_LEVEL = 0,
	BTWK_STAGE,
};

static const u8 str_bt_lvl_stage[] = {
	RE_,BE_,RU_,spc_,spc_,SU_,TE_,bou_,ZI_,EOM_
};

static void debug_bt_init_task(u8 no);
static void debug_bt_stage_task(u8 no);
static void debug_bt_level_task(u8 no);
static void debug_bt_end_task(u8 no);


static void debug_bt_put_window(void)
{
	NMenuTalkWinWrite();
	NMenuMsgWrite(str_bt_lvl_stage, 4, 15);
}

static void debug_bt_put_level(u16 level)
{
	if (level == 0) {
		PM_NumMsgSet(StrTempBuffer0, 50, NUM_MODE_ZERO, 3);
	} else {
		PM_NumMsgSet(StrTempBuffer0, 100, NUM_MODE_ZERO, 3);
	}
	NMenuMsgWrite(StrTempBuffer0, 4, 17);
}

static void debug_bt_put_stage(u16 stage)
{
	PM_NumMsgSet(StrTempBuffer0, stage, NUM_MODE_ZERO, 4);
	NMenuMsgWrite(StrTempBuffer0, 9, 17);
}

static void debug_bt_init_task(u8 no)
{
	s16 * twk;
	twk = TaskTable[no].work;

	twk[BTWK_LEVEL] = 0;
	twk[BTWK_STAGE] = MyData.BattleTowerWork.BattleTowerStage[0];
	debug_bt_put_window();
	debug_bt_put_level(twk[BTWK_LEVEL]);
	TaskTable[no].TaskAdrs = debug_bt_level_task;
}

static void debug_bt_level_task(u8 no)
{
	s16 * twk;
	twk = TaskTable[no].work;

	if (sys.Trg & (U_KEY|D_KEY)) {
		twk[BTWK_LEVEL] = !(twk[BTWK_LEVEL]);
		debug_bt_put_level(twk[BTWK_LEVEL]);
	}
	else if (sys.Trg & A_BUTTON) {
		twk[BTWK_STAGE] = MyData.BattleTowerWork.BattleTowerStage[twk[BTWK_LEVEL]];
		debug_bt_put_stage(twk[BTWK_STAGE]);
		TaskTable[no].TaskAdrs = debug_bt_stage_task;
	}
	else if (sys.Trg & B_BUTTON) {
		TaskTable[no].TaskAdrs = debug_bt_end_task;
	}
}

static void debug_bt_stage_task(u8 no)
{
	s16 * twk;
	twk = TaskTable[no].work;

	if (change_counter( &twk[BTWK_STAGE], 0, 2000, sys.Repeat) == TRUE) {
		debug_bt_put_stage(twk[BTWK_STAGE]);
	}
	else if (sys.Trg & A_BUTTON) {
		MyData.BattleTowerWork.BattleTowerStage[twk[BTWK_LEVEL]] = twk[BTWK_STAGE];
		SePlay(SE_PINPON);
		TaskTable[no].TaskAdrs = debug_bt_end_task;
	}
	else if (sys.Trg & B_BUTTON) {
		debug_bt_put_window();
		debug_bt_put_level(twk[BTWK_LEVEL]);
		TaskTable[no].TaskAdrs = debug_bt_level_task;
	}
}

static void debug_bt_end_task(u8 no)
{
	NMenuScreenClear();
	ResetForceEvent();
	DelTask(no);
}

static u8 DebugBtStage(void)
{
	MenuEnd();
	SetForceEvent();
	AddTask(debug_bt_init_task, TSK_PRI_EFFECT);
	return 1;
}

//=========================================================================
//=========================================================================

static const u8 msg_porokku_cycle[] = {
	PO_,RO_,TTU_,KU_,spc_,GU_,RU_,bou_,PU_,I_MSG_,STR_TEMP_BUF0,EOM_
};

static void put_porokku_cycle( u16 value )
{
	PM_HexNumMsgSet( StrTempBuffer0, value, NUM_MODE_LEFT, 1 );
	NMenuWinMsgWrite( msg_porokku_cycle );
}

// ダミーキューブデータ
static const CUBE	dumy_data[] = {
	{ 12, 3, 3, 3, 3, 30, 0 },
	{ 12, 3, 3, 3, 3, 30, 0 },
	{ 12, 3, 3, 3, 3, 30, 0 },
	{ 12, 3, 3, 3, 3, 30, 0 },
	{ 12, 3, 3, 3, 3, 30, 0 },
	{ 12, 3, 3, 3, 3, 30, 0 },
	{ 12, 3, 3, 3, 3, 30, 0 },
	{ 12, 3, 3, 3, 3, 30, 0 },
	{ 12, 3, 3, 3, 3, 30, 0 },
	{ 12, 3, 3, 3, 3, 30, 0 },
	{ 12, 3, 3, 3, 3, 30, 0 },
	{ 12, 3, 3, 3, 3, 30, 0 },
	{ 12, 3, 3, 3, 3, 30, 0 },
	{ 12, 3, 3, 3, 3, 30, 0 },
	{ 12, 3, 3, 3, 3, 30, 0 },
	{ 12, 3, 3, 3, 3, 30, 0 },
	{ 12, 3, 3, 3, 3, 30, 0 },
	{ 12, 3, 3, 3, 3, 30, 0 },
	{ 12, 3, 3, 3, 3, 30, 0 },
	{ 12, 3, 3, 3, 3, 30, 0 },
	{ 12, 3, 3, 3, 3, 30, 0 },
	{ 12, 3, 3, 3, 3, 30, 0 },
	{ 12, 3, 3, 3, 3, 30, 0 },
	{ 12, 3, 3, 3, 3, 30, 0 },
	{ 12, 3, 3, 3, 3, 30, 0 },
	{ 12, 3, 3, 3, 3, 30, 0 },
	{ 12, 3, 3, 3, 3, 30, 0 },
	{ 12, 3, 3, 3, 3, 30, 0 },
	{ 12, 3, 3, 3, 3, 30, 0 },
	{ 12, 3, 3, 3, 3, 30, 0 },
	{ 12, 3, 3, 3, 3, 30, 0 },
	{ 12, 3, 3, 3, 3, 30, 0 },
	{ 12, 3, 3, 3, 3, 30, 0 },
	{ 12, 3, 3, 3, 3, 30, 0 },
	{ 12, 3, 3, 3, 3, 30, 0 },
	{ 12, 3, 3, 3, 3, 30, 0 },
	{ 12, 3, 3, 3, 3, 30, 0 },
	{  0, 0, 0, 0, 0, 0, 0 },
};

//--------------------------------
//		ダミーデータをセット
//--------------------------------
void	SetKaCube(void)
{
	u8	i;

	for( i=0; i<MY_CUBE_MAX; i++ ){
		if( dumy_data[i].type == 0 )	break;
		Fld.MyCube[i] = dumy_data[i];
	}
}

static void debug_porokku_change_task( u8 no )
{
	s16 * wk = TaskTable[no].work;

	switch ( wk[0] ) {
	case 0:
		put_porokku_cycle( wk[1] );
		wk[0]++;
		break;

	case 1:
		if ( sys.Trg & A_BUTTON ) {
//			int i;
//			for ( i=0;i<5; i++ ) {
//				PokeParaSetChr( &PokeParaMine[i], MONSNO_RIZAADON,
//						99, POW_RND, wk[1] * 5 + i );
//			}
//			PokeCountMineGet();

			SePlay( SE_PINPON );
			NMenuScreenClear();
			DelTask(no);
			ResetForceEvent();
			SetKaCube() ;
		}
		else if ( sys.Trg & B_BUTTON ) {
			NMenuScreenClear();
			DelTask(no);
			ResetForceEvent();
		}
		else if ( change_counter( &(wk[1]), 0, 4, sys.Repeat ) == TRUE ) {
			put_porokku_cycle( wk[1] );
		}
	}
}

static u8 DebugPorokkuPokemon( void )
{
	MenuEnd();
	AddTask( debug_porokku_change_task, TSK_PRI_EFFECT );
	SetForceEvent();
	return 1;
}

//###################################################################################
//###################################################################################

//=========================================================================
//
//	バックアップマンもどき
//
//=========================================================================
static int write_flash( u8 sec, void * src, u32 size );
static int write_flash_main( u16 sec, u8 * src ,u32 size );
static void read_flash( u8 sec, void * src, u32 size);
static u8 backup_write_ask(void);
static u8 backup_write_ask_wait(void);
static u8 backup_write_all(void);
static u8 backup_read_all(void);
static u8 backup_msg_put(void);
static u8 backup_key_wait(void);
static u8 backup_menu_main(void);

static const u8 str_write_flash[] = { ka_,ki_,ko_,mi_,EOM_ };
static const u8 str_read_flash[] = { yo_,mi_,ko_,mi_,EOM_ };

static const MENU_ITEM backup_menu[] = {
	{ str_write_flash,	backup_write_ask },
	{ str_read_flash,	backup_read_all },
};

static const u8 msg_write_warning[] = {
	SE_,bou_,BU_,DE_,bou_,TA_,wo_,spc_,u_,wa_,ga_,ki_,si_,ma_,su_,gyoe_,
	CR_,
	A__,de_,spc_,su_,su_,mu_,spc_,B__,de_,ya_,me_,ru_,
	EOM_
};
static const u8 msg_write_success[] = {
	ka_,ki_,ko_,mi_,spc_,se_,i_,ko_,u_,EOM_
};
static const u8 msg_read_success[] = {
	yo_,mi_,ko_,mi_,se_,i_,ko_,u_,EOM_
};
static const u8 msg_write_failure[] = {
	ka_,ki_,ko_,mi_,spc_,si_,ttu_,pa_,i_,EOM_
};
static const u8 msg_read_failure[] = {
	yo_,mi_,ko_,mi_,spc_,si_,ttu_,pa_,i_,EOM_
};

static u8 backup_write_ask(void)
{
	NMenuTalkWinWrite();
	NMenuMsgWrite(msg_write_warning, MWIN_MSGXPOS, MWIN_MSGYPOS);
	MenuFunc = backup_write_ask_wait;
	return 0;
}
static u8 backup_write_ask_wait(void)
{
	if (sys.Trg & A_BUTTON) {
		MenuFunc = backup_write_all;
		return 0;
	} else if (sys.Trg & B_BUTTON) {
		MenuEnd();
		return 1;
	}
	return 0;
}

static u8 backup_write_all(void)
{
	if(write_flash(0, UserWork, SVLD_SECTOR_SIZE * 32) == TRUE) {
		PM_strcpy(MsgExpandBuffer, msg_write_success);
	} else {
		PM_strcpy(MsgExpandBuffer, msg_write_failure);
	}
	MenuFunc = backup_msg_put;
	return 0;
}

static u8 backup_read_all(void)
{
	u8 i;
	u8 * adrs;

	adrs = UserWork;
	for (i=0; i<32; i++) {
		read_flash(i, adrs, SVLD_SECTOR_SIZE);
		adrs += SVLD_SECTOR_SIZE;
	}
	PM_strcpy(MsgExpandBuffer, msg_read_success);
	MenuFunc = backup_msg_put;
	return 0;
}

static u8 backup_msg_put(void)
{
	NMenuTalkWinWrite();
	NMenuMsgWrite(MsgExpandBuffer, MWIN_MSGXPOS, MWIN_MSGYPOS);
	MenuFunc = backup_key_wait;
	return 0;
}

static u8 backup_key_wait(void)
{
	if (sys.Trg & A_BUTTON) {
		MenuEnd();
		return 1;
	}
	return 0;
}

static u8 DebugBackUpMenu(void)
{
	NMenuScreenClear();
	make_debug_submenu(backup_menu, 12, NELEMS(backup_menu));
	MenuFunc = backup_menu_main;
	return 0;
}

static u8 backup_menu_main(void)
{
	return ctrl_debug_submenu(backup_menu);
}


//-------------------------------------------------------------------------
//	セーブワーク→フラッシュロム
//-------------------------------------------------------------------------

static int write_flash_main( u16 sec, u8 * src ,u32 size )
{
	while( TRUE ) {
		if ( ProgramFlashSectorEx( sec, src ) != 0 ) return FALSE;
		if ( size <= SVLD_SECTOR_SIZE ) break;

		size -= SVLD_SECTOR_SIZE;
		src += SVLD_SECTOR_SIZE;
		sec ++;
	};
	return TRUE;
}

static int write_flash( u8 sec, void * src, u32 size )
{
	int res;

	////////////////////////////////////////////
	m4aSoundVSyncOff();
	////////////////////////////////////////////

	res = write_flash_main( sec, src, size );

	////////////////////////////////////////////
	m4aSoundVSyncOn();
	////////////////////////////////////////////

	return res;
}

//-------------------------------------------------------------------------
//	フラッシュ→セーブワーク
//-------------------------------------------------------------------------
static void read_flash( u8 sec, void * src, u32 size)
{
	ReadFlash( sec, 0, (u8 *)src, size );
}

//=========================================================================
//=========================================================================
typedef struct _PTIME_CTRL {
	u16 min;
	u16 max;
	u8 xpos;
	u8 workno;
}PTIME_CTRL;

enum{
	PT_SELPOS,
	PT_HOUR,
	PT_MINUTE,
	PT_SECOND,

	PT_CURSOR_X = MWIN_MSGXPOS,
	PT_CURSOR_Y = MWIN_MSGYPOS,

	PT_TIME_Y = MWIN_MSGYPOS + 2,
	PT_HOUR_X = MWIN_MSGXPOS,
	PT_MIN_X =	PT_HOUR_X + 4,
	PT_SEC_X =	PT_MIN_X + 3,
};

static const PTIME_CTRL PlayTimeCtrl[] = {
	{	0,	999,	PT_HOUR_X,	PT_HOUR},
	{	0,	59,		PT_MIN_X,	PT_MINUTE },
	{	0,	59,		PT_SEC_X,	PT_SECOND },
};

static void playtime_csr_print(s16 * twk)
{
	NMenuBoxWrite(PT_CURSOR_X,PT_CURSOR_Y,PT_CURSOR_X+20,PT_CURSOR_Y+1);
	NMenuPutc(V__, PlayTimeCtrl[twk[PT_SELPOS]].xpos, PT_CURSOR_Y);
}

static void playtime_print(s16 * twk)
{
	PM_NumMsgSet(StrTempBuffer0, twk[PT_HOUR], NUM_MODE_SPACE, 3);
	NMenuMsgWrite(StrTempBuffer0, PT_HOUR_X, PT_TIME_Y);
	NMenuPutc(colon_, PT_MIN_X - 1, PT_TIME_Y);
	PM_NumMsgSet(StrTempBuffer0, twk[PT_MINUTE], NUM_MODE_ZERO, 2);
	NMenuMsgWrite(StrTempBuffer0, PT_MIN_X, PT_TIME_Y);
	NMenuPutc(colon_, PT_SEC_X - 1, PT_TIME_Y);
	PM_NumMsgSet(StrTempBuffer0, twk[PT_SECOND], NUM_MODE_ZERO, 2);
	NMenuMsgWrite(StrTempBuffer0, PT_SEC_X, PT_TIME_Y);
}

static void playtime_change_init_task(u8 no);
static void playtime_change_main_task(u8 no);
static void playtime_change_end_task(u8 no);

static void playtime_change_init_task(u8 no)
{
	s16 * twk;

	twk = TaskTable[no].work;

	twk[PT_SELPOS] = 0;
	twk[PT_HOUR] = MyData.playtime_h;
	twk[PT_MINUTE] = MyData.playtime_m;
	twk[PT_SECOND] = MyData.playtime_s;
	
	NMenuTalkWinWrite();
	playtime_print(twk);
	playtime_csr_print(twk);

	TaskTable[no].TaskAdrs = playtime_change_main_task;
}

static void playtime_change_main_task(u8 no)
{
	const PTIME_CTRL * p;
	s16 * twk;
	int res;

	twk = TaskTable[no].work;

	if (sys.Trg & A_BUTTON) {
		MyData.playtime_h = twk[PT_HOUR];
		MyData.playtime_m = twk[PT_MINUTE];
		MyData.playtime_s = twk[PT_SECOND];
		SePlay(SE_PINPON);
		TaskTable[no].TaskAdrs = playtime_change_end_task;
		return;
	}
	else if (sys.Trg & B_BUTTON) {
		TaskTable[no].TaskAdrs = playtime_change_end_task;
		return;
	}
	else if (sys.Trg & L_KEY) {
		if (twk[PT_SELPOS] != 0) {
			twk[PT_SELPOS] --;
			playtime_csr_print(twk);
		}
		return;
	}
	else if (sys.Trg & R_KEY) {
		if (twk[PT_SELPOS] < NELEMS(PlayTimeCtrl) - 1) {
			twk[PT_SELPOS] ++;
			playtime_csr_print(twk);
		}
		return;
	}

	p = &PlayTimeCtrl[twk[PT_SELPOS]];
	res = change_counter(&twk[p->workno], p->min, p->max, sys.Repeat);

	if (res == TRUE)
		playtime_print(twk);
}

static void playtime_change_end_task(u8 no)
{
	NMenuScreenClear();
	ResetForceEvent();
	DelTask(no);
}

static u8 DebugSetPlayTime(void)
{
	MenuEnd();
	AddTask(playtime_change_init_task, TSK_PRI_EFFECT);
	SetForceEvent();
	return 1;
}

#endif	PM_DEBUG


