/*====================================================================*/
/*  デバッグメニュー制御（田谷）                                      */
/*====================================================================*/
#ifdef PM_DEBUG

#include "common.h"
#include "fntequ.h"
#include "print.h"
#include "fieldmap.h"
#include "fld_main.h"
#include "fld_task.h"
#include "menu.h"
#include "menutool.h"
#include "task.h"
#include "mapname.h"
#include "oyaji.h"
#include "kaiwa.h"
#include "kaiwa_code.h"
#include "weather.h"
#include "box_mode.h"
#include "popword.h"
#include "calctool.h"
#include "palanm.h"
#include "intr.h"

#include "poketool.h"
#include "pasocom.h"
#include "monsno.def"
#include "window.h"

static u8 DebugTayaMenu(void);
static u8 ChangeKaiwa(void);
extern u8 DebugWeatherTestInit(void);
extern u8 PaletteAnime(void);
extern void TNaviDemoInit(void);
extern void TNaviInit(void);
extern u8 (*MenuFunc)();
extern u8* PM_strcpy_clear(u8 *to, const u8 *from, u8 code, u16 len);

/*--------------------------------------------*/
/* 流行語データを表示するだけ                 */
/*--------------------------------------------*/
static u8 DispRyukouKeyWait(void);
static u8 DispRyukou(void)
{
	u16 i;
	u8 buf[32];
	u8 tmp[8];
	u8 *cp;
	PopularWord* pop;

	NMenuScreenClear();
	NMenuWinBoxWrite(0,0,30,11);

	pop = Fld.PopWord;
	for(i = 0; i < 5; i++){
		buf[0] = ((pop->powerup_flag)?  n1_ : n0_);

		KaiwaCopyWord(tmp, pop->word[0]);
		cp = PM_strcpy_clear(buf+1, tmp, spc_, 7);

		KaiwaCopyWord(tmp, pop->word[1]);
		cp = PM_strcpy_clear(cp, tmp, spc_, 8);

		cp = PM_NumMsgSet(cp, pop->now_power, NUM_MODE_SPACE, 3);
		*cp++ = spc_;
		cp = PM_NumMsgSet(cp, pop->max_power, NUM_MODE_SPACE, 3);
		*cp++ = spc_;
		PM_NumMsgSet(cp, pop->random, NUM_MODE_SPACE, 5);

		NMenuMsgWrite(buf, 1, 1 + i*2);
		pop++;
	}

	MenuFunc = DispRyukouKeyWait;
	return 0;
}
static u8 DispRyukouKeyWait(void)
{
	if(sys.Trg & (A_BUTTON|B_BUTTON)){
		NMenuScreenClear();
		MenuEnd();
		return 1;
	}
	return 0;
}
/*--------------------------------------------*/
/* 流行語の単語にランダムデータをセット       */
/*--------------------------------------------*/
static u8 RandomRyukou(void)
{
	u16 i, j, r;

	for(i = 0; i < POPWORD_MAX; i++){
		for(j = 0; j < 2; j++){
			r = pp_rand() % KWC_MAX;
			r = KaiwaGetRandomWord(r);
			Fld.PopWord[i].word[j] = r;
		}
	}
	NMenuScreenClear();
	MenuEnd();
	return 1;
}
/*--------------------------------------------*/
/* 簡易会話画面に切り替えるだけ               */
/*--------------------------------------------*/
#include "ev_flag.h"
extern void KaiwaInput(void);
static const MENU_ITEM KaiwaMenuTbl[];

static u8 ChangeKaiwaFade(void)
{
	if(!PaletteAnime()){

//		ScriptParameter0 = KAIWA_MODE_MAIL;
//		ScriptParameter1 = 0;
		KaiwaInput();

		return 1;
	}
	return 0;
}
static u8 KaiwaSelect(void)
{
	s8 num;

	num = NMenuVCursorControl();
	switch(num){
	case CURSOR_CANCEL_VALUE:
		MenuEnd();
		return 1;

	case CURSOR_DEFAULT_VALUE:
		return 0;

	default:
		break;
	}

	ScriptParameter0 = (u32)(KaiwaMenuTbl[num].ptr);
	switch(ScriptParameter0){
	case KAIWA_MODE_HAGAKI:
	case KAIWA_MODE_INTERVIEW:
	case KAIWA_MODE_TOWER:
	case KAIWA_MODE_CONTEST:
	case KAIWA_MODE_GYMREADER:
		ScriptParameter1 = 0;
		ScriptParameter2 = 0;
		break;
	}

	FieldFadeControl(FIELD_BLACK_OUT, 0);
	MenuFunc = ChangeKaiwaFade;

	return 0;
}

static const u8 kaiwa0[] = {  zi_, ko_, si_,yyo_,  u_, ka_,  i_,EOM_, };  // じこしょうかい
static const u8 kaiwa1[] = {  ta_,  i_, se_,  n_, ka_,  i_, si_,EOM_, };  // たいせんかいし
static const u8 kaiwa2[] = {  i_,i_,ko_,to_,ba_,EOM_ };  // いいことば
static const u8 kaiwa3[] = {  ta_,  i_, se_,  n_, ma_, ke_, ta_,EOM_, };  // たいせんまけた
static const u8 kaiwa4[] = {  ME_,bou_, RU_,EOM_, };  // メール
static const u8 kaiwa5[] = {  ha_, ga_, ki_, EOM_, }; // はがき
static const u8 kaiwa6[] = {  ka_, e_, u_, ta_, EOM_, }; // かえうた
static const u8 kaiwa7[] = {   I_,  N_, TA_, BI_,YYU_,bou_,EOM_, };  // インタビュー
static const u8 kaiwa8[] = {   BA_, TO_, RU_, TA_, WA_, bou_, EOM_ }; // バトルタワー

static const MENU_ITEM KaiwaMenuTbl[] = {
	{ kaiwa0, (void*)KAIWA_MODE_SELF },
	{ kaiwa1, (void*)KAIWA_MODE_BATTLE_START },
	{ kaiwa2, (void*)KAIWA_MODE_NICEWORD },
	{ kaiwa3, (void*)KAIWA_MODE_BATTLE_LOST },
	{ kaiwa4, (void*)KAIWA_MODE_MAIL },
	{ kaiwa5, (void*)KAIWA_MODE_HAGAKI },
	{ kaiwa6, (void*)KAIWA_MODE_SONG },
	{ kaiwa7, (void*)KAIWA_MODE_INTERVIEW },
	{ kaiwa8, (void*)KAIWA_MODE_TOWER },
};

static u8 ChangeKaiwa(void)
{
#define MENU_CNT  NELEMS(KaiwaMenuTbl)

	NMenuWinBoxWrite(0, 0, 9, MENU_CNT*2+1);
	NMenuFixListWrite(2, 1, MENU_CNT, KaiwaMenuTbl);
	NMenuVCursorInit(1, 1, MENU_CNT, 0);
	MenuFunc = KaiwaSelect;
	return 0;

#undef MENU_CNT
}

/*--------------------------------------------*/
/* ＲＯＭ内おやじ切り替え                     */
/*--------------------------------------------*/
extern u8 GetOyajiType(void);
extern void OyajiChange(u8 type);

static u8 OyajiSelect(void)
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

	if(num <= OYAJITYPE_MARCHEN){
		OyajiChange(num);
	}else if(num == OYAJITYPE_MARCHEN+1){
		OyajiReset();
	}else if(num == OYAJITYPE_MARCHEN+2){
		static const u16 words[] = {
			0x045b,    // ほのおのからだ
			0x0430,    // せいしんりょく
			0x020f,    // ポケモンゲット
		};

		u16 i;
		for(i =0 ; i < 3; i++)
		{
			((OYAJIDATA_SINGER *)(Fld.oyaji_work))->word[i] = words[i];
			((OYAJIDATA_SINGER *)(Fld.oyaji_work))->new_word[i] = words[i];
			Fld.kaiwa_battle[i] = words[i];
		}

	}else if(num == OYAJITYPE_MARCHEN+3){
		u16 i;
		for(i = 0; i < 33; i++){
			NowWordFlagSet(i);
		}
	}

	MenuEnd();
	return 1;
}
static u8 OyajiMenu(void)
{
	static const u8 oyaji0[] = { SI_, N_, GA_, bou_, spc_, EOM_ };
	static const u8 oyaji1[] = { NA_, U_, i_,  spc_, spc_, EOM_ };
	static const u8 oyaji2[] = { RI_, SA_, I_, KU_,  RU_,  EOM_ };
	static const u8 oyaji3[] = { de_, n_, se_, tu_, spc_, EOM_ };
	static const u8 oyaji4[] = { ME_, RU_, HE_, N_,  spc_, EOM_ };
	static const u8 flg_clear[] = { HU_, RA_, GU_, O_, HU_, EOM_ };
	static const u8 over21[] = { n2_, n1_, mo_, zi_, EOM_ };
	static const u8 nowset[] = { NA_, U_, ku_, na_, ru_, EOM_ };

	static const MENU_ITEM MenuTbl[] = {
		{ oyaji0, NULL },
		{ oyaji1, NULL },
		{ oyaji2, NULL },
		{ oyaji3, NULL },
		{ oyaji4, NULL },

		{ flg_clear, NULL },
		{ over21, NULL },
		{ nowset, NULL },
	};

#define MENU_CNT  (sizeof(MenuTbl)/sizeof(MenuTbl[0]))


	NMenuWinBoxWrite(0, 0, 7, MENU_CNT*2+1);
	NMenuFixListWrite(2, 1, MENU_CNT, MenuTbl);
	NMenuVCursorInit(1, 1, MENU_CNT, GetOyajiType());
	MenuFunc = OyajiSelect;
	return 0;

#undef MENU_CNT
}
/*--------------------------------------------*/
/* ボックスメニュー呼び出し                   */
/*--------------------------------------------*/
extern void BoxMenuStart(void);

static u8 BoxMenuCall(void)
{
	NMenuScreenClear();
	BoxMenuStart();
//	MenuEnd();
	return 1;
}
/*--------------------------------------------*/
/* キューブデモ呼び出し                       */
/*--------------------------------------------*/
#if 0
extern void CubeDemoInit(CUBE *cube,  pFunc ret_func);
static u8 cube_fade(void)
{
	if(!PaletteAnime()){
		CubeDemoInit(Fld.MyCube, FieldNormalRecover);
		return 1;
	}
	return 0;
}
static u8 cube_menu_call(void)
{
	FieldFadeControl(FIELD_BLACK_OUT, 0);
	MenuFunc = cube_fade;
	return 0;
}
#endif
/*--------------------------------------------*/
/* 街おとずれフラグを強制セット               */
/*--------------------------------------------*/
#include "sysflag.h"
static u8 TownFlag(void)
{
	EventFlagSet(SYS_T101_ARRIVE);
	EventFlagSet(SYS_T102_ARRIVE);
	EventFlagSet(SYS_T103_ARRIVE);
	EventFlagSet(SYS_T104_ARRIVE);
	EventFlagSet(SYS_T105_ARRIVE);
	EventFlagSet(SYS_T106_ARRIVE);
	EventFlagSet(SYS_T107_ARRIVE);
	EventFlagSet(SYS_C101_ARRIVE);
	EventFlagSet(SYS_C102_ARRIVE);
	EventFlagSet(SYS_C103_ARRIVE);
	EventFlagSet(SYS_C104_ARRIVE);
	EventFlagSet(SYS_C105_ARRIVE);
	EventFlagSet(SYS_C106_ARRIVE);
	EventFlagSet(SYS_C107_ARRIVE);
	EventFlagSet(SYS_C108_ARRIVE);
	EventFlagSet(SYS_C109_ARRIVE);
	EventFlagSet(SYS_ARRIVE_BATTLETOWER);
	EventFlagSet(SYS_ARRIVE_ISLAND);
	EventFlagSet(SYS_ARRIVE_FIREROAD);
	EventFlagSet(SYS_ARRIVE_LEAGUE);

	EventFlagSet(SYS_ARRIVE_YOKOANA);
	EventFlagSet(SYS_ARRIVE_ISEKI);
	EventFlagSet(SYS_ARRIVE_KASEKIMANIA);
	EventFlagSet(SYS_ARRIVE_IWATO);
	EventFlagSet(SYS_ARRIVE_KODAIDUKA);
	EventFlagSet(SYS_ARRIVE_TUMESYO);
	EventFlagSet(SYS_ARRIVE_HUNTER);
	EventFlagSet(SYS_ARRIVE_SEKISITSU);
	EventFlagSet(SYS_ARRIVE_FROWERSHOP);
	EventFlagSet(SYS_ARRIVE_HAGIHOUSE);
	EventFlagSet(SYS_ARRIVE_JUNKSHIP);
	EventFlagSet(SYS_ARRIVE_MARINEHOUSE);
	EventFlagSet(SYS_ARRIVE_NEWKINSETSU);
	EventFlagSet(SYS_ARRIVE_GENKIHOUSE);
	EventFlagSet(SYS_ARRIVE_KARAKURIYASHIKI);
	EventFlagSet(SYS_ARRIVE_BATTLEFAMILY);
	EventFlagSet(SYS_ARRIVE_GRASSSHOP);
	EventFlagSet(SYS_ARRIVE_MAYUMIHOUSE);
	EventFlagSet(SYS_ARRIVE_POKEMONBREEDER);
	EventFlagSet(SYS_ARRIVE_SUBMARINECAVE);


	EventFlagSet(SYS_RIBBON_GET);  // リボンもついでに

	MenuEnd();
	return 1;
}
/*--------------------------------------------*/
/* リボンセット画面呼び出し                   */
/*--------------------------------------------*/
static void RibonSet(void);
static u8 CallRibonSet(void)
{
	ColorConceChange(0xffffffff, 16, 0x0000);
	MainProcChange(RibonSet);
	MenuEnd();
	return 1;
}
/*--------------------------------------------*/
/* ポケモンくじナンバー強制セット             */
/*--------------------------------------------*/
typedef struct {
	u8 pos;
	u8 buf[7];
	u16 num;
	s32 Num;
	u16 val;
}KUJISET_WORK;
#define KujiWork  ((KUJISET_WORK*)UserWork)

void GetPokeLotNumber(void);
void SetPokeLotNumber(u16 num);

static void update_kuji_win(void)
{
	PM_NumMsgSet(KujiWork->buf, KujiWork->num, NUM_MODE_ZERO, 5);
	NMenuMsgWrite(KujiWork->buf, 1, 1);
	PM_strclear(KujiWork->buf, spc_, 5);
	KujiWork->buf[KujiWork->pos] = ArrowU__;
	NMenuMsgWrite(KujiWork->buf, 1, 3);
}
static u8 poke_kuji_main(void)
{
	u8 up = 1;

	do{
		if(sys.Trg & L_KEY){
			if(KujiWork->pos){ KujiWork->pos--; break; }
		}
		if(sys.Trg & R_KEY){
			if(KujiWork->pos < 4){ KujiWork->pos++; break; }
		}
		if(sys.Repeat & U_KEY){
			u8 i;
			KujiWork->Num = KujiWork->num;
			KujiWork->val = 10000;
			for(i = 0; i < KujiWork->pos; i++)
			{
				KujiWork->val /= 10;
			}
			KujiWork->Num += KujiWork->val;
			if(KujiWork->Num > 65535){ KujiWork->Num = 65535; }
			if(KujiWork->num != KujiWork->Num){
				KujiWork->num = KujiWork->Num;
				break;
			}
		}
		if(sys.Repeat & D_KEY){
			u8 i;
			KujiWork->Num = KujiWork->num;
			KujiWork->val = 10000;
			for(i = 0; i < KujiWork->pos; i++)
			{
				KujiWork->val /= 10;
			}
			KujiWork->Num -= KujiWork->val;
			if(KujiWork->Num < 0){ KujiWork->Num = 0; }
			if(KujiWork->num != KujiWork->Num){
				KujiWork->num = KujiWork->Num;
				break;
			}
		}

		if(sys.Trg & B_BUTTON)
		{
			MenuEnd();
			return 1;
		}

		if(sys.Trg & A_BUTTON)
		{
			SetPokeLotNumber(KujiWork->num);
			MenuEnd();
			return 1;
		}

		up = 0;

	}while(0);

	if(up)
	{
		update_kuji_win();
	}

	return 0;
}

static u8 poke_kuji_set(void)
{
	NMenuWinBoxWrite(0, 0, 6, 5);

	GetPokeLotNumber();
	KujiWork->num = AnswerWork;
	KujiWork->pos = 0;

	update_kuji_win();

	MenuFunc = poke_kuji_main;
	return 0;
}
/*--------------------------------------------*/
/* 拡縮動作チェック画面へ強制切り替え         */
/*--------------------------------------------*/
/*
extern void KakusyukuChkInit(void);
static u8 kakusyuku_call(void)
{
	ColorConceChange(0xffffffff, 16, 0x0000);
	MainProcChange(KakusyukuChkInit);
	MenuEnd();
	return 1;
}
*/
/*--------------------------------------------*/
/* 再戦可能トレーナーと対戦済みにする         */
/*--------------------------------------------*/
#include "ev_fight.h"
#include "../data/revenge.h"
#include "trainer.def"
static u8 trainer_call(void)
{
	u16 i;

	for(i = 0; i < REVENGE_DATA_MAX; i++)
	{
		SetTrainerFlagByID(RevengeDataTbl[i].id[0]);
	}

	SetTrainerFlagByID(LEADERW_01);
	SetTrainerFlagByID(LEADERM_02);
	SetTrainerFlagByID(LEADERM_03);
	SetTrainerFlagByID(LEADERW_04);
	SetTrainerFlagByID(LEADERM_05);
	SetTrainerFlagByID(LEADERW_06);
	SetTrainerFlagByID(LEADER_07);
	SetTrainerFlagByID(LEADERM_08);
	SetTrainerFlagByID(BIG4M_01);
	SetTrainerFlagByID(BIG4W_02);
	SetTrainerFlagByID(BIG4W_03);
	SetTrainerFlagByID(BIG4M_04);
	SetTrainerFlagByID(CHAMPION_01);

	MenuEnd();
	return 1;
}

/*--------------------------------------------*/
/* ポケナビの通信デバッグ前準備               */
/*--------------------------------------------*/
static u8 navidebug_call(void)
{
	static const u8 msg[] = {
		si_,yyo_,u_,si_,yyo_,u_,o_,ma_,ti_,ku_,da_,sa_,i_,gyoe_,EOM_
	};
	u16 b,p,monsno,lv;
	u32 val;

	NMenuTalkWinWrite();

	for(b=0;b<BOX_KAZU;b++){
		PM_strcpy(UserWork, msg);
		UserWork[b+1]=EOM_;
		NMenuMsgWrite(UserWork, MWIN_MSGXPOS, MWIN_MSGYPOS);
		for(p = 0; p < BOX_PM_KAZU; p++){
			val = 1 + pp_rand();
			lv = 1 + (pp_rand() % 100);
			monsno = 1 + (pp_rand() % (MONSNO_END-26));
			if(monsno >= MONSNO_HATE1 ){
				monsno += 25;
				if(monsno >= MONSNO_END){
					monsno = 1;
				}
			}
			PokePasoParaSet(&(BoxData.PPPBox[b][p]),monsno, lv ,POW_RND,RND_NO_SET,0,ID_SET,val);


			val = pp_rand() & 0xff;
			PokePasoParaPut(&(BoxData.PPPBox[b][p]), ID_style, (u8*)(&val));
			val = pp_rand() & 0xff;
			PokePasoParaPut(&(BoxData.PPPBox[b][p]), ID_beautiful, (u8*)(&val));
			val = pp_rand() & 0xff;
			PokePasoParaPut(&(BoxData.PPPBox[b][p]), ID_cute, (u8*)(&val));
			val = pp_rand() & 0xff;
			PokePasoParaPut(&(BoxData.PPPBox[b][p]), ID_clever, (u8*)(&val));
			val = pp_rand() & 0xff;
			PokePasoParaPut(&(BoxData.PPPBox[b][p]), ID_strong, (u8*)(&val));
			val = pp_rand() & 0xff;
			PokePasoParaPut(&(BoxData.PPPBox[b][p]), ID_fur, (u8*)(&val));

			val = 1 + (pp_rand() & 3);
			PokePasoParaPut(&(BoxData.PPPBox[b][p]), ID_stylemedal, (u8*)(&val));
			val = 1 + (pp_rand() & 3);
			PokePasoParaPut(&(BoxData.PPPBox[b][p]), ID_beautifulmedal, (u8*)(&val));
			val = 1 + (pp_rand() & 3);
			PokePasoParaPut(&(BoxData.PPPBox[b][p]), ID_cutemedal, (u8*)(&val));
			val = 1 + (pp_rand() & 3);
			PokePasoParaPut(&(BoxData.PPPBox[b][p]), ID_strongmedal, (u8*)(&val));
			val = 1 + (pp_rand() & 3);
			PokePasoParaPut(&(BoxData.PPPBox[b][p]), ID_clevermedal, (u8*)(&val));

			val = pp_rand() & 0x01;
			PokePasoParaPut(&(BoxData.PPPBox[b][p]), ID_champ_ribbon, (u8*)(&val));
			val = pp_rand() & 0x01;
			PokePasoParaPut(&(BoxData.PPPBox[b][p]), ID_winning_ribbon, (u8*)(&val));
			val = pp_rand() & 0x01;
			PokePasoParaPut(&(BoxData.PPPBox[b][p]), ID_victory_ribbon, (u8*)(&val));
			val = pp_rand() & 0x01;
			PokePasoParaPut(&(BoxData.PPPBox[b][p]), ID_bromide_ribbon, (u8*)(&val));
			val = pp_rand() & 0x01;
			PokePasoParaPut(&(BoxData.PPPBox[b][p]), ID_ganba_ribbon, (u8*)(&val));
			val = pp_rand() & 0x01;
			PokePasoParaPut(&(BoxData.PPPBox[b][p]), ID_marine_ribbon, (u8*)(&val));
			val = pp_rand() & 0x01;
			PokePasoParaPut(&(BoxData.PPPBox[b][p]), ID_land_ribbon, (u8*)(&val));
			val = pp_rand() & 0x01;
			PokePasoParaPut(&(BoxData.PPPBox[b][p]), ID_sky_ribbon, (u8*)(&val));
			val = pp_rand() & 0x01;
			PokePasoParaPut(&(BoxData.PPPBox[b][p]), ID_country_ribbon, (u8*)(&val));
			val = pp_rand() & 0x01;
			PokePasoParaPut(&(BoxData.PPPBox[b][p]), ID_national_ribbon, (u8*)(&val));
			val = pp_rand() & 0x01;
			PokePasoParaPut(&(BoxData.PPPBox[b][p]), ID_earth_ribbon, (u8*)(&val));
			val = pp_rand() & 0x01;
			PokePasoParaPut(&(BoxData.PPPBox[b][p]), ID_world_ribbon, (u8*)(&val));

		}

	}


	TownFlag();
	trainer_call();

	MenuEnd();
	return 1;
}

/*====================================================================*/
/*  メイン                                                            */
/*====================================================================*/
static const u8 Menu0_Msg[] = { te_,  n_,   ko_,  u_,   spc_, EOM_ };
static const u8 Menu2_Msg[] = { BO_,  TTU_, KU_,  SU_ , spc_, EOM_ };
static const u8 Menu3_Msg[] = { ka_,  i_,   wa_,  spc_, spc_, EOM_ };
static const u8 Menu5_Msg[] = { o_,   ya_,  zi_,  spc_, spc_, EOM_ };
static const u8 Menu6_Msg[] = { ri_,  yyu_, u_,   ko_,  u_,   EOM_ };
static const u8 Menu7_Msg[] = { ri_,  yyu_, u_,   ko_,  u_,   R__, EOM_ };
static const u8 Menu8_Msg[] = { ma_,  ti_,  HU_,  RA_,  GU_,  EOM_, };
static const u8 MsgRibon[] =    { RI_,  BO_,  N_,   a_,   ge_,  EOM_ };
static const u8 MsgPokeKuji[] = { PO_,  KE_,  ku_,  zi_, EOM_ };

static const u8 MsgTrainer[] = { TO_,RE_,bou_,NA_,bou_,EOM_};
static const u8 MsgNaviDebug[] = { PO_,KE_,NA_,BI_,D__,EOM_};


static const MENU_ITEM DebugMenu0[] =
{
	{ Menu0_Msg, DebugWeatherTestInit   },
	{ Menu2_Msg, BoxMenuCall            },
	{ Menu3_Msg, ChangeKaiwa            },
	{ Menu5_Msg, OyajiMenu              },
	{ Menu6_Msg, DispRyukou             },
	{ Menu7_Msg, RandomRyukou           },
	{ Menu8_Msg, TownFlag               },
	{ MsgRibon,    CallRibonSet   },
	{ MsgPokeKuji, poke_kuji_set  },

};
static const MENU_ITEM DebugMenu1[] =
{
	{ MsgTrainer, trainer_call },
	{ MsgNaviDebug, navidebug_call },
};

static s8 Page = 0;

typedef struct {
	const MENU_ITEM *item;
	u8   size;
}MENU_TBL;
static const MENU_TBL DebugMenuTbl[] = 
{
	{ DebugMenu0, NELEMS(DebugMenu0) },
	{ DebugMenu1, NELEMS(DebugMenu1) },
};

#define DEBUG_MENU_MAX  (9)
#define MENU_X  (8)
#define MENU_Y  (DEBUG_MENU_MAX*2+1)
#define MENU_PAGE_MAX  (NELEMS(DebugMenuTbl)-1)

static u8 DebugTayaMenu(void)
{
	s8 num;

	num = NMenuVCursorControl();
	switch(num){
	case CURSOR_DEFAULT_VALUE:
		{
			s8 p = Page;
			if(sys.Trg&L_KEY){
				if(--Page < 0){ Page = MENU_PAGE_MAX; }
			}
			if(sys.Trg&R_KEY){
				if(++Page > MENU_PAGE_MAX){ Page = 0; }
			}
			if(p != Page){
				NMenuScreenClear();
				NMenuWinBoxWrite(0, 0, MENU_X, MENU_Y);
				NMenuFixListWrite(2, 1, DebugMenuTbl[Page].size, DebugMenuTbl[Page].item);
				NMenuVCursorInit(1, 1, DebugMenuTbl[Page].size, 0);
			}
		}
		return 0;

	case CURSOR_CANCEL_VALUE:
		MenuEnd();
		return 1;

	default:
		break;
	}

	MenuFunc = DebugMenuTbl[Page].item[num].ptr;
	return 0;
}
u8 DebugTayaTest(void)
{
	Page = 0;
	NMenuScreenClear();
	NMenuWinBoxWrite(0, 0, MENU_X, MENU_Y);
	NMenuFixListWrite(2, 1, DEBUG_MENU_MAX, DebugMenuTbl[0].item);
	NMenuVCursorInit(1, 1, DEBUG_MENU_MAX, 0);
	MenuFunc = DebugTayaMenu;
	return 0;
}
/***************************************************************
**	地図デバッグモードに切り替え
***************************************************************/
extern void FlyingInitDebug(void);
static u8 DebugMapFade(void)
{
	if(FadeData.fade_sw==0){
		MainProcChange(FlyingInitDebug);
		return 1;
	}
	return 0;
}
u8 DebugMap(void)
{
	FieldFadeControl(FIELD_BLACK_OUT, 0);
	MenuFunc = DebugMapFade;
	return 0;
}


/*============================================================*/
/*  てもち先頭のポケモンにリボンをセットする                  */
/*============================================================*/
#include "poketool.h"

typedef struct {
	u8  ribbon_cnt[6][3];
	u8  buf[64];
	u8  prog, x, y, key, max;
}RIBONSET_WORK;

#define RSWork  ((RIBONSET_WORK*)UserWork)

static const u8 ribon_name0[] = {  TI_,YYA_,  N_, PU_,spc_,EOM_, };  // チャンプ　
static const u8 ribon_name1[] = {  KU_,bou_, RU_,spc_,spc_,EOM_, };  // クール　　
static const u8 ribon_name2[] = {  BI_,YYU_,bou_, TE_, II_,EOM_, };  // ビューティ
static const u8 ribon_name3[] = {  KI_,YYU_,bou_, TO_,spc_,EOM_, };  // キュート　
static const u8 ribon_name4[] = {  ZI_,bou_, NI_,  A_, SU_,EOM_, };  // ジーニアス
static const u8 ribon_name5[] = {  PA_, WA_, HU_, RU_,spc_,EOM_, };  // パワフル　
static const u8 ribon_name6[] = {   U_, II_, NI_,  N_, GU_,EOM_, };  // ウィニング
static const u8 ribon_name7[] = {  BI_, KU_, TO_, RI_,bou_,EOM_, };  // ビクトリー
static const u8 ribon_name8[] = {  BU_, RO_, MA_,  I_, DO_,EOM_, };  // ブロマイド
static const u8 ribon_name9[] = {  ga_,  n_, ba_,spc_,spc_,EOM_, };  // がんば　　
static const u8 ribon_name10[] = {  MA_, RI_,  N_,spc_,spc_,EOM_, };  // マリン　　
static const u8 ribon_name11[] = {  RA_,  N_, DO_,spc_,spc_,EOM_, };  // ランド　　
static const u8 ribon_name12[] = {  SU_, KA_,  I_,spc_,spc_,EOM_, };  // スカイ　　
static const u8 ribon_name13[] = {  KA_,  N_, TO_, RI_,bou_,EOM_, };  // カントリー
static const u8 ribon_name14[] = {  NA_, SI_,YYO_, NA_, RU_,EOM_, };  // ナショナル
static const u8 ribon_name15[] = {   A_,bou_, SU_,spc_,spc_,EOM_, };  // アース　　
static const u8 ribon_name16[] = {  WA_,bou_, RU_, DO_,spc_,EOM_, };  // ワールド　
static const u8 ribon_name17[] = {  spc_, spc_, spc_, spc_, spc_, EOM_, };

typedef struct {
	const u8 *name;
	u16   id;
}RIBONDATA;

static const RIBONDATA RibonData[6][3] = {
	{
		{ ribon_name0, ID_champ_ribbon },
		{ ribon_name1, ID_stylemedal },
		{ ribon_name2, ID_beautifulmedal },
	},{
		{ ribon_name3, ID_cutemedal },
		{ ribon_name4, ID_clevermedal },
		{ ribon_name5, ID_strongmedal },
	},{
		{ ribon_name6, ID_winning_ribbon },
		{ ribon_name7, ID_victory_ribbon },
		{ ribon_name8, ID_bromide_ribbon },
	},{
		{ ribon_name9, ID_ganba_ribbon },
		{ ribon_name10, ID_marine_ribbon },
		{ ribon_name11, ID_land_ribbon },
	},{
		{ ribon_name12, ID_sky_ribbon },
		{ ribon_name13, ID_country_ribbon },
		{ ribon_name14, ID_national_ribbon },
	},{
		{ ribon_name15, ID_earth_ribbon },
		{ ribon_name16, ID_world_ribbon },
		{ ribon_name17, 0 },
	},
};
static void update_ribonbg(void);

static void ribonset_vintr(void)
{
	actOAMtrans();
	actDMAtrans();
	PaletteFadeTrans();
}
static void ribonset_main(void)
{
	JumpActor();
	SetActor();

	switch(RSWork->prog){
	case 0:
		RSWork->key = 0;
		if(sys.Trg & U_KEY){
			if(RSWork->y){
				RSWork->y--;
				RSWork->key = 1;
			}
		}
		if(sys.Trg & D_KEY){
			if(RSWork->x != 2){
				if(RSWork->y < 5){
					RSWork->y++;
					RSWork->key = 1;
				}
			}else{
				if(RSWork->y < 4){
					RSWork->y++;
					RSWork->key = 1;
				}
			}
		}
		if(sys.Trg & L_KEY){
			if(RSWork->x){
				RSWork->x--;
				RSWork->key = 1;
			}
		}
		if(sys.Trg & R_KEY){
			if(RSWork->y != 5){
				if(RSWork->x < 2){
					RSWork->x++;
					RSWork->key = 1;
				}
			}else{
				if(RSWork->x < 1){
					RSWork->x++;
					RSWork->key = 1;
				}
			}
		}
		if(RSWork->key){
			update_ribonbg();
			break;
		}

		if(sys.Trg & A_BUTTON)
		{
			if(RibonData[RSWork->y][RSWork->x].id >= ID_stylemedal
			&& RibonData[RSWork->y][RSWork->x].id <= ID_strongmedal)
			{
				RSWork->max = 4;
			}else{
				RSWork->max = 1;
			}
			RSWork->prog = 1;
			break;
		}

		if(sys.Trg & B_BUTTON)
		{
			ColorConceChange(0xffffffff, 16, 0x0000);
			MainProcChange(FieldNormalRecover);
		}

		break;

	case 1:
		RSWork->key = 0;
		if(sys.Trg & U_KEY){
			if(RSWork->ribbon_cnt[RSWork->y][RSWork->x] < RSWork->max){
				RSWork->ribbon_cnt[RSWork->y][RSWork->x]++;
				RSWork->key = 1;
			}
		}
		if(sys.Trg & D_KEY){
			if(RSWork->ribbon_cnt[RSWork->y][RSWork->x] > 0){
				RSWork->ribbon_cnt[RSWork->y][RSWork->x]--;
				RSWork->key = 1;
			}
		}
		if(RSWork->key)
		{
			update_ribonbg();
			break;
		}
		if(sys.Trg & B_BUTTON){
			RSWork->ribbon_cnt[RSWork->y][RSWork->x] = PokeParaGet(PokeParaMine, RibonData[RSWork->y][RSWork->x].id);
			update_ribonbg();
			RSWork->prog = 0;
		}
		if(sys.Trg & A_BUTTON){
			if(RibonData[RSWork->y][RSWork->x].id){
				PokeParaPut(PokeParaMine, RibonData[RSWork->y][RSWork->x].id, &(RSWork->ribbon_cnt[RSWork->y][RSWork->x]));
			}
			RSWork->prog = 0;
		}
		break;
	}
}

static void RibonSet(void)
{
	static const u8 msg[] = { a_, ge_, ru_, RI_, BO_, N_, wo_, spc_, e_, ra_, n_, de_, ne_, EOM_ };
	u8 i, j;

	*(vu16*)REG_BG0HOFS=0;
	*(vu16*)REG_BG0VOFS=0;

	for(i = 0; i < 6; i++)
	{
		for(j = 0; j < 3; j++){
			if(RibonData[i][j].id){
				RSWork->ribbon_cnt[i][j] = PokeParaGet(PokeParaMine, RibonData[i][j].id);
			}else{
				RSWork->ribbon_cnt[i][j] = 0;
			}
		}
	}

	PrintScreenInit(PASOBOXMENU_TYPE);
	NMenuScreenInit(PASOBOXMENU_TYPE);
	NMenuScreenClear();

	NMenuWinBoxWrite(0, 0, 29, 3);
	NMenuMsgWrite(msg, 1, 1);

	NMenuWinBoxWrite(0, 4, 29, 17);
	NMenuWinBoxWrite(0, 18, 29, 21);


	*(vu16 *)REG_DISPCNT = 	DISP_MODE_0					// BGモード0
						  | DISP_OBJ_ON					// OBJ有効
						  | DISP_BG0_ON					// BG0有効
						  | DISP_OBJ_CHAR_1D_MAP;		//1D OBJ map

	RSWork->x = 0;
	RSWork->y = 0;
	RSWork->prog = 0;

	update_ribonbg();

	SetVBlankFunc(ribonset_vintr);
	MainProcChange(ribonset_main);
}

static void update_ribonbg(void)
{
	u8 *cp;
	u8 x, y;

	for(y = 0; y < 6; y++){
		PM_strclear(RSWork->buf, spc_, 28);
		cp = RSWork->buf;
		for(x = 0; x < 3; x++){
			if(y == 5 && x == 2){ break; }
			if(RSWork->x == x && RSWork->y == y)
			{
				*cp = cursor_;
			}
			cp++;
			cp = PM_strcpy(cp, RibonData[y][x].name);
			*cp++ = spc_;
			cp = PM_NumMsgSet(cp, RSWork->ribbon_cnt[y][x], NUM_MODE_LEFT, 1);
			*cp++ = spc_;
		}
		NMenuMsgWrite(RSWork->buf, 1, 5 + y * 2);
	}
}



#endif  // PM_DEBUG
