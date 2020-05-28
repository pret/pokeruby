//=========================================================================
//
//		ポケモンコンテスト用ツール
//											by matsuda 2001.09.20(木)
//=========================================================================

#include "common.h"
#include "poketool.h"
#include "con_tool.h"
#include "contest.h"
#include "menu.h"
#include "print.h"
#include "pokeicon.h"
#include "cli_def.h"
#include "objdata.h"
#include "client_t.h"
#include "madefine.h"
#include "decord.h"
#include "palanm.h"
#include "con_waza.h"
#include "actanm.h"
#include "fight.h"
#include "calctool.h"
#include "conscr.h"
#include "evobjdat.h"
#include "task.h"
#include "ef_tool.h"
#include "memtool.h"
#include "mus_tool.h"
#include "laster.h"
#include "item.h"
#include "bss.h"
#include "wazatool.h"
#include "waza_eff.h"
#include "consio.h"
#include "monsno.def"
#include "server.h"
#include "wazano.def"


//----------------------------------------------------------
//	メッセージデータ
//----------------------------------------------------------
#include "..\msgdata\conmsg.h"


//----------------------------------------------------------
//	外部変数
//----------------------------------------------------------
extern	TALK_WIN	FightMsg;
extern	TALK_WIN	win[4];
//extern	u8	FightMsgBuf[64];
extern unsigned long r_next;	//※暫定　デバック用

//----------------------------------------------------------
//	外部データ
//----------------------------------------------------------
extern	const u32 DecordAdrs[];
extern const actAffAnm * const PmAffAnmTblF2[];
extern const actAffAnm * const PmAffAnmTblB2[];
extern const actAffAnm * const PmAffAnmTblB[];
extern const actAffAnm * const PmAffAnmTblF[];
extern	const	WazaTblDat	WTD[];

//----------------------------------------------------------
//	外部関数
//----------------------------------------------------------
extern void	ConWazaAIInit(u8);
extern u8		ConWazaAIMain(void);

//----------------------------------------------------------
//	プロトタイプ宣言
//----------------------------------------------------------
void PutBreederName(u8 pos, u8);
void PutPokeName(u8 pos, u8);
void PutPokeNameIt(u8 pos);
void PutBreederNameIt(u8 pos);
static s8 GetMeterNum(s16 ap);
static void AppealMeterPutSeq(u8 id);
static void JyunniIconEffectInitSeq(actWork *Xreg);
static void JyunniIcon_BtoS_Init(actWork *Xreg);
static void JyunniIcon_StoB_Init(actWork *Xreg);
static void JyunniIcon_StoB(actWork *Xreg);
static void EyeColorFadeStopMain(u8 id);
static void EyeColorFadeSeq(u8 id);
static void MeterColorFadeCheck(u8 brd_pos);
static void MeterColorFadeSeq(u8 id);
void MeterColorFlagClear(u8 brd_pos);
void MeterColorClearAll(void);
static void MeterDefaultColorSet(u8 brd_pos);
static void AppealKoukaColorSeq(u8 id);
static void BrdWinAffEndSeq(actWork *Xreg);
static void BrdWinRegClearEnd(actWork *Xreg);
void UsedWorkNameClear(u8 brd);
void DebugAPUpdatingCheckPut(void);
static u16 GetBaseMeterScrn(u8 brd);
u8 PortraitDataSpaceSearch(u8 tiiki_no, u8);
static void AppealHeartPutSeq(u8 id);
static void HeartIconMoveSeq(actWork *xreg);
static void PlayerInfoCopySub(u32 ScrnBaseAdr);
void ConWazaBrdSort(void);
//static u16 GetNextSortScrn(u8 brd_pos);
//static u16 GetNextSortNumScrn(u8 brd_pos);
//static void VoltageIconSeq(actWork *xreg);
//static void VoltageIconStopSeq(actWork *xreg);
u8 TensyonMaxPalAnmSet(void);
static void TensyonMaxPalAnmMain(u8 id);
static void KankyakuAnmTask(u8 id);
static void VoltageGaugeSlidPutTask(u8 id);
static void VoltageGaugeSlidOutTask(u8 id);
static void VoltageGaugeSlidInTask(u8 id);
static void KankyakuColorFadeTask(u8 id);
static u32 GetNextSortNumAdrs(u8 brd_pos);
static void HeartIconAffEffCheckSeq(u8 id);
void InfoRewriteData(u8 id);
void SetEnemyBanishActor(void);
void EnemyBanishActorParamInit(void);
u16 GetContWazaNo(u16 wazano);
u16 GetContMonsNo(u16 monsno);
static void GetContestJyunni(void);
static u8 EvalSortConditionsCheck(int brd1, int brd2, int data[][4]);
u8 ContestPokeFlipCheck(u16 monsno);

//----------------------------------------------------------
//	順位ｱｲｺﾝ
//----------------------------------------------------------
#define JYUNNI_ICON_AFFSP	15
#define JYUNNI_ICON_AFFLOOP	15
const CellData JyunniIconCell={
	(void *)contrank_pch_ADRS,OBJ_SIZE16_16x16*4, CELLID_JYUNNIICON0
};
const PalData JyunniIconPal[]={
	{(void *)contrank_pcl_ADRS, CELLID_JYUNNIICON0},
	{(void *)contrank_pcl_ADRS, CELLID_JYUNNIICON1},
	{(void *)contrank_pcl_ADRS, CELLID_JYUNNIICON2},
	{(void *)contrank_pcl_ADRS, CELLID_JYUNNIICON3},
};
static const actAnm JyunniIconAnm0[]={
	{OBJ16_16x16*0,1,0,0},			
	{ACT_ANMEND,0,0,0}
};
static const actAnm JyunniIconAnm1[]={
	{OBJ16_16x16*1,1,0,0},			
	{ACT_ANMEND,0,0,0}
};
static const actAnm JyunniIconAnm2[]={
	{OBJ16_16x16*2,1,0,0},			
	{ACT_ANMEND,0,0,0}
};
static const actAnm JyunniIconAnm3[]={
	{OBJ16_16x16*3,1,0,0},			
	{ACT_ANMEND,0,0,0}
};
static const actAnm *const JyunniIconAnmTbl[]={
	JyunniIconAnm0,
	JyunniIconAnm1,
	JyunniIconAnm2,
	JyunniIconAnm3,
};
static const actAffAnm JyunniIconAffAnm0[] = {
//	{ 拡縮x, 拡縮y, 角度, ｳｪｲﾄ }
	{ 0, 0, 0, 1 },						// ｳｪｲﾄ
	{ACT_AFEND,0,0,0},					// ﾙｰﾌﾟ , 戻り先
};
static const actAffAnm JyunniIconAffAnm1[] = {	//通常状態から小さく
//	{ 拡縮x, 拡縮y, 角度, ｳｪｲﾄ }
	{ -JYUNNI_ICON_AFFSP, -JYUNNI_ICON_AFFSP, 0, JYUNNI_ICON_AFFLOOP},
	{ACT_AFEND,0,0,0},
};
static const actAffAnm JyunniIconAffAnm2[] = {
//	{ 拡縮x, 拡縮y, 角度, ｳｪｲﾄ }
	{0x100-JYUNNI_ICON_AFFSP*JYUNNI_ICON_AFFLOOP,
		 0x100-JYUNNI_ICON_AFFSP*JYUNNI_ICON_AFFLOOP, 0, ACT_AFSET },
	{JYUNNI_ICON_AFFSP, JYUNNI_ICON_AFFSP, 0, JYUNNI_ICON_AFFLOOP},
	{ACT_AFEND,0,0,0},
};
static const	actAffAnm * const JyunniIconAffTbl[] = {
	JyunniIconAffAnm0,
	JyunniIconAffAnm1,
	JyunniIconAffAnm2,
0};
static const ActOamData JyunniIconOamData = {
	0,		//u32 VPos:8;             // Ｙ座標
	0,		//u32 AffineMode:2;       // アフィンモード
	0,		//u32 ObjMode:2;          // ＯＢＪモード
	OFF,	//u32 Mosaic:1;           // モザイク
	0,		//u32 ColorMode:1;        // １６色/２５６色 選択
	0,		//u32 Shape:2;            // ＯＢＪ形状

	0,		//u32 HPos:9;             // Ｘ座標
	0,		//u32 AffineParamNo:5;  // アフィン変換パラメータNo & H,VFlip
	1,		//u32 Size:2;             // ＯＢＪサイズ

	0,		//u32 CharNo:10;          // キャラクタＮｏ
	0,		//u32 Priority:2;         // 表示優先
	0,		//u32 Pltt:4;             // パレットＮｏ
	0,
};
const actHeader JyunniIconHeader[]={
	{
		CELLID_JYUNNIICON0,
		CELLID_JYUNNIICON0,
		&JyunniIconOamData,
		JyunniIconAnmTbl,
		0,
		JyunniIconAffTbl,
		DummyActMove,
	},
	{
		CELLID_JYUNNIICON0,
		CELLID_JYUNNIICON1,
		&JyunniIconOamData,
		JyunniIconAnmTbl,
		0,
		JyunniIconAffTbl,
		DummyActMove,
	},
	{
		CELLID_JYUNNIICON0,
		CELLID_JYUNNIICON2,
		&JyunniIconOamData,
		JyunniIconAnmTbl,
		0,
		JyunniIconAffTbl,
		DummyActMove,
	},
	{
		CELLID_JYUNNIICON0,
		CELLID_JYUNNIICON3,
		&JyunniIconOamData,
		JyunniIconAnmTbl,
		0,
		JyunniIconAffTbl,
		DummyActMove,
	},
};

//----------------------------------------------------------
//	BGの情報ｳｨﾝﾄﾞｳ　OBJ落とし
//----------------------------------------------------------
enum{
	CELLID_BRD_WIN0 = 33000,
	CELLID_BRD_WIN1,
	CELLID_BRD_WIN2,
	CELLID_BRD_WIN3,
};
static const CellData BrdWinCell[] = {
	{(void*)space64_pch_ADRS, OBJ_SIZE16_64x64*2, CELLID_BRD_WIN0},
	{(void*)space64_pch_ADRS, OBJ_SIZE16_64x64*2, CELLID_BRD_WIN1},
	{(void*)space64_pch_ADRS, OBJ_SIZE16_64x64*2, CELLID_BRD_WIN2},
	{(void*)space64_pch_ADRS, OBJ_SIZE16_64x64*2, CELLID_BRD_WIN3},
};
static const PalData BrdWinPal[] = {
	{(void*)&UserWork[CONT_PALETTE_ADRS + 16*5*2], CELLID_BRD_WIN0},
	{(void*)&UserWork[CONT_PALETTE_ADRS + 16*6*2], CELLID_BRD_WIN1},
	{(void*)&UserWork[CONT_PALETTE_ADRS + 16*7*2], CELLID_BRD_WIN2},
	{(void*)&UserWork[CONT_PALETTE_ADRS + 16*8*2], CELLID_BRD_WIN3},
};
static const ActOamData BrdWinOamData = {
	0,		//u32 VPos:8;             // Ｙ座標
	3,		//u32 AffineMode:2;       // アフィンモード
	1,		//u32 ObjMode:2;          // ＯＢＪモード
	OFF,	//u32 Mosaic:1;           // モザイク
	0,		//u32 ColorMode:1;        // １６色/２５６色 選択
	0,		//u32 Shape:2;            // ＯＢＪ形状

	0,		//u32 HPos:9;             // Ｘ座標
	0,		//u32 AffineParamNo:5;  // アフィン変換パラメータNo & H,VFlip
	3,		//u32 Size:2;             // ＯＢＪサイズ

	0,		//u32 CharNo:10;          // キャラクタＮｏ
	0,		//u32 Priority:2;         // 表示優先
	0,		//u32 Pltt:4;             // パレットＮｏ
	0,
};
static const actAffAnm BrdWinAff0[] = {
//	{ 拡縮x, 拡縮y, 角度, ｳｪｲﾄ }
	{ 0x100, 0x100, 0, ACT_AFSET },
	{ACT_AFEND,0,0,0},					// ﾙｰﾌﾟ , 戻り先
};
#define WIN_AFF		3
#define WIN_AFF_LOOP	15
static const actAffAnm BrdWinAff1[] = {
//	{ 拡縮x, 拡縮y, 角度, ｳｪｲﾄ }
	{ WIN_AFF,	WIN_AFF,	0, WIN_AFF_LOOP},
	{ -WIN_AFF, -WIN_AFF,	0, WIN_AFF_LOOP},
	{ WIN_AFF, 	WIN_AFF, 	0, WIN_AFF_LOOP},
	{ -WIN_AFF, -WIN_AFF, 	0, WIN_AFF_LOOP},
	{ACT_AFEND,0,0,0},					// ﾙｰﾌﾟ , 戻り先
};
static const	actAffAnm * const BrdWinAffTbl[] = {
	BrdWinAff0,
	BrdWinAff1,
};
static const actHeader BrdWinActHeader[]={
	{
		CELLID_BRD_WIN0,
		CELLID_BRD_WIN0,
		&BrdWinOamData,
		DummyActAnmTbl,
		0,
		BrdWinAffTbl,
		DummyActMove,
	},
	{
		CELLID_BRD_WIN1,
		CELLID_BRD_WIN1,
		&BrdWinOamData,
		DummyActAnmTbl,
		0,
		BrdWinAffTbl,
		DummyActMove,
	},
	{
		CELLID_BRD_WIN2,
		CELLID_BRD_WIN2,
		&BrdWinOamData,
		DummyActAnmTbl,
		0,
		BrdWinAffTbl,
		DummyActMove,
	},
	{
		CELLID_BRD_WIN3,
		CELLID_BRD_WIN3,
		&BrdWinOamData,
		DummyActAnmTbl,
		0,
		BrdWinAffTbl,
		DummyActMove,
	},
};


//=========================================================================
//	自分のﾌﾞﾘｰﾀﾞｰNoを取得
//=========================================================================
void GetMyBreederNo(void)
{
	if((ContestTuusin & C_TUUSIN_FLG) == 0)
		MyBreederNo = 3;
}

//=========================================================================
//	通信対戦時、自分が親か調べる
//	1=親、0=子
//=========================================================================
u8 ContestSioOyaCheck(void)
{
	if(MyBreederNo == ContestSioOya)
		return 1;
	return 0;
}

//=========================================================================
//	ﾌﾞﾘｰﾀﾞｰﾜｰｸに自分のﾌﾞﾘｰﾀﾞｰﾃﾞｰﾀをｾｯﾄする
// temotino = 手持ちの何番目のﾎﾟｹﾓﾝのﾃﾞｰﾀをｾｯﾄするか
//=========================================================================
void SetMyBreederData(u8 temotino)
{
	u16 itemno;
	u8 buff[20];
	s16 style, beautiful, cute, clever, strong;
	
	PM_strcpy(buff, MyData.my_name);
#if	( PM_LANG== LANG_JAPAN )
	buff[5] = EOM_;		//ローカライズ対応のため5文字で切る
#endif
	PM_strcpy(BreederParam[MyBreederNo].name, buff);
	if(MyData.my_sex == MALE)
		BreederParam[MyBreederNo].pattern = CTHERO;	//HERO;
	else
		BreederParam[MyBreederNo].pattern = CTHINE;	//HEROINE;
	BreederParam[MyBreederNo].ai = 0;
	BreederParam[MyBreederNo].msg[0] = 0;//EOM_;
	BreederParam[MyBreederNo].monsno = PokeParaGet(&PokeParaMine[temotino], ID_monsno);
	PokeParaGet(&PokeParaMine[temotino], ID_nickname, buff);
	NickNameCutOff(buff);
	PM_strcpy(BreederParam[MyBreederNo].nickname, buff);
	BreederParam[MyBreederNo].style = PokeParaGet(&PokeParaMine[temotino], ID_style);
	BreederParam[MyBreederNo].beautiful
			 = PokeParaGet(&PokeParaMine[temotino], ID_beautiful);
	BreederParam[MyBreederNo].cute = PokeParaGet(&PokeParaMine[temotino], ID_cute);
	BreederParam[MyBreederNo].clever = PokeParaGet(&PokeParaMine[temotino], ID_clever);
	BreederParam[MyBreederNo].strong = PokeParaGet(&PokeParaMine[temotino], ID_strong);
	BreederParam[MyBreederNo].fur = PokeParaGet(&PokeParaMine[temotino], ID_fur);
	BreederParam[MyBreederNo].waza[0] = PokeParaGet(&PokeParaMine[temotino], ID_waza1);
	BreederParam[MyBreederNo].waza[1] = PokeParaGet(&PokeParaMine[temotino], ID_waza2);
	BreederParam[MyBreederNo].waza[2] = PokeParaGet(&PokeParaMine[temotino], ID_waza3);
	BreederParam[MyBreederNo].waza[3] = PokeParaGet(&PokeParaMine[temotino], ID_waza4);
	BreederParam[MyBreederNo].personal_rnd = PokeParaGet(&PokeParaMine[temotino], ID_personal_rnd);
	BreederParam[MyBreederNo].id_no = PokeParaGet(&PokeParaMine[temotino], ID_id_no);
	
	itemno = PokeParaGet(&PokeParaMine[temotino], ID_item);

	style = BreederParam[MyBreederNo].style;
	beautiful = BreederParam[MyBreederNo].beautiful;
	cute = BreederParam[MyBreederNo].cute;
	clever = BreederParam[MyBreederNo].clever;
	strong = BreederParam[MyBreederNo].strong;
	if(itemno == ITEM_AKAIBANDANA)
		style += 20;
	else if(itemno == ITEM_AOIBANDANA)
		beautiful += 20;
	else if(itemno == ITEM_PINKUNOBANDANA)
		cute += 20;
	else if(itemno == ITEM_MIDORINOBANDANA)
		clever += 20;
	else if(itemno == ITEM_KIIRONOBANDANA)
		strong += 20;
	
	if(style > 255)
		style = 255;
	if(beautiful > 255)
		beautiful = 255;
	if(cute > 255)
		cute = 255;
	if(clever > 255)
		clever = 255;
	if(strong > 255)
		strong = 255;
	BreederParam[MyBreederNo].style = style;
	BreederParam[MyBreederNo].beautiful = beautiful;
	BreederParam[MyBreederNo].cute = cute;
	BreederParam[MyBreederNo].clever = clever;
	BreederParam[MyBreederNo].strong = strong;
}

//=========================================================================
//	コンテストに参加するブリーダーのデータをｾｯﾄ
// 引数：type = 参加するｺﾝﾃｽﾄの種類  rank = ｺﾝﾃｽﾄのﾗﾝｸ
//=========================================================================
void SetBreederData(u8 type, u8 rank)
{
	int i, t;
	u8 putbrd[BREEDER_AI_DATA_MAX+1];
	u8 count = 0, put;
	u16 no;
	
	GetMyBreederNo();
	for(i = 0; i < BREEDER_AI_DATA_MAX; i++){
		put = 0;
		
		if(rank != bd_tbl[i].rank)
			continue;
		
		if(type == STYLE_CONTEST && bd_tbl[i].style_appear)
			put++;
		else if(type == BEAUTIFUL_CONTEST && bd_tbl[i].beautiful_appear)
			put++;
		else if(type == CUTE_CONTEST && bd_tbl[i].cute_appear)
			put++;
		else if(type == CLEVER_CONTEST && bd_tbl[i].clever_appear)
			put++;
		else if(type == STRONG_CONTEST && bd_tbl[i].strong_appear)
			put++;
		else
			continue;
		
		putbrd[count++] = i;
	}
	putbrd[count] = 0xff;	//番兵
	
	for(i = 0; i < BREEDER_MAX-1; i++){
		no = pp_rand() % count;
		BreederParam[i] = bd_tbl[putbrd[no]];
		for(t = no; putbrd[t] != 0xff; t++)
			putbrd[t] = putbrd[t+1];
		count--;
	}
	SetMyBreederData(ConTemotiNo);
}


//=========================================================================
//	ｺﾝﾃｽﾄ参加ﾁｪｯｸ
//	戻り値： 1 = 参加できる	0 = 参加できない	2 = 既に優勝済み
//			 3 = タマゴ		4 = 瀕死
//=========================================================================
u8 ContestParticipationCheck(PokemonParam *pp)
{
	u8 kekka = 0;
	u8 medal = 0;
	
	// タマゴは参加不可		2002/05/31 by nakahiro
	if( PokeParaGet( pp, ID_tamago_flag ) != 0 )
		return	3;
	if(PokeParaGet(pp, ID_hp) == 0)
		return 4;	//気絶状態も参加不可
		
	switch(ContestKind)
	{
		case STYLE_CONTEST:				//持ちﾎﾟｹﾓﾝの格好よさ
			medal = PokeParaGet(pp, ID_stylemedal);
			break;
		case BEAUTIFUL_CONTEST:			//持ちﾎﾟｹﾓﾝの美しさ
			medal = PokeParaGet(pp, ID_beautifulmedal);
			break;
		case CUTE_CONTEST:				//持ちﾎﾟｹﾓﾝの可愛さ
			medal = PokeParaGet(pp, ID_cutemedal);
			break;
		case CLEVER_CONTEST:				//持ちﾎﾟｹﾓﾝの賢さ
			medal = PokeParaGet(pp, ID_clevermedal);
			break;
		case STRONG_CONTEST:				//持ちﾎﾟｹﾓﾝのたくましさ
			medal = PokeParaGet(pp, ID_strongmedal);
			break;
		default:
			//kekka = 0;
			return 0;
	}
	
	if(medal > ContestRank)
		kekka = 2;
	else if(medal >= ContestRank)
		kekka = 1;
	else
		kekka = 0;

	return kekka;
}


//=========================================================================
//	画面右のプレイヤー情報を表示
//=========================================================================
void PutPlayerInfo(void)
{
	u8 i;
	
	for(i = 0; i < BREEDER_MAX; i++)
	{
		FontScrnBoxFill(&FightMsg, MSG_CLEAR_NO, C_PokeNamePos[BrdSort[i]][0],
				C_PokeNamePos[BrdSort[i]][1], C_BreederPos[BrdSort[i]][0]+5, 
					C_BreederPos[BrdSort[i]][1]+1);
		PutBreederNameIt(i);
		PutPokeNameIt(i);
	}
}

//----------------------------------------------------------
//	フォント共通設定
//----------------------------------------------------------
static const u8 FontCommon_msg[] = {CTRL_,C_BCOL_,COL_NUKE,CTRL_,C_FCOL_,EOM_};
static u8 * FontCommonSet(const u8 *msg_adr, u8 font_col)
{
	u8 *msg_end;

	msg_end = PM_strcpy(FightMsgBuf, FontCommon_msg);
	msg_end[0] = font_col;
	msg_end++;
	msg_end = PM_strcpy(msg_end, msg_adr);
	return msg_end;
}
//----------------------------------------------------------
//	ブリーダー名表示
//----------------------------------------------------------
void PutBreederNameIt(u8 pos)
{
	u8 font_col;
	
/*	if(pos == MyBreederNo)
		font_col = COL_WHITE;
	else
		font_col = COL_BLACK;
*/
	font_col = BLD_PAL + pos;
	PutBreederName(pos, font_col);
}

void PutBreederName(u8 pos, u8 font_col)
{
	u8 msg[30];
	
	msg[0] = sura_;
	PM_strcpy(&msg[1], BreederParam[pos].name);
	FontCommonSet(msg, font_col);
	MsgPrint(&FightMsg, FightMsgBuf, CON_TRAINER + CON_TRAINER_LEN* BrdSort[pos],
			C_BreederPos[BrdSort[pos]][0] - 1, C_BreederPos[BrdSort[pos]][1]);
}
//----------------------------------------------------------
//	ﾎﾟｹﾓﾝのﾆｯｸﾈｰﾑ表示
//----------------------------------------------------------
void PutPokeNameIt(u8 pos)
{
	u8 font_col;
	
/*
	if(pos == MyBreederNo)
		font_col = COL_WHITE;
	else
		font_col = COL_BLACK;
*/
	font_col = BLD_PAL+pos;
	PutPokeName(pos, font_col);
}

void PutPokeName(u8 pos, u8 font_col)
{
	u8 *msg;
	u8 name_len;
	u8 i;
	
//	NMenuMsgWrite(BreederParam[pos].nickname, C_PokeNamePos[pos][0], C_PokeNamePos[pos][1]);
	name_len = PM_strlen(BreederParam[pos].nickname);
	name_len = 5 - name_len;
	msg = FontCommonSet(BreederParam[pos].nickname, font_col);
	for(i = 0 ; name_len > i; i++)
		msg[i] = spc_;
	msg[name_len] = EOM_;	//sura_;
//	msg[name_len+1] = EOM_;
	MsgPrint(&FightMsg, FightMsgBuf, CON_POKENAME + CON_POKE_LEN * BrdSort[pos], 
			C_PokeNamePos[BrdSort[pos]][0], C_PokeNamePos[BrdSort[pos]][1]);
}




//=========================================================================
//	ブリーダーポイントを取得する
//=========================================================================
u16 GetBP(u8 brd, u8 MainContest)
{
	u8 main_data, sub1, sub2;
	u16 ret;
	
	switch(MainContest)
	{
		case STYLE_CONTEST:
			main_data = BreederParam[brd].style;
			sub1 = BreederParam[brd].strong;
			sub2 = BreederParam[brd].beautiful;
			break;
		case BEAUTIFUL_CONTEST:
			main_data = BreederParam[brd].beautiful;
			sub1 = BreederParam[brd].style;
			sub2 = BreederParam[brd].cute;
			break;
		case CUTE_CONTEST:
			main_data = BreederParam[brd].cute;
			sub1 = BreederParam[brd].beautiful;
			sub2 = BreederParam[brd].clever;
			break;
		case CLEVER_CONTEST:
			main_data = BreederParam[brd].clever;
			sub1 = BreederParam[brd].cute;
			sub2 = BreederParam[brd].strong;
			break;
		case STRONG_CONTEST:
		default:
			main_data = BreederParam[brd].strong;
			sub1 = BreederParam[brd].clever;
			sub2 = BreederParam[brd].style;
			break;
	}
//	ret = main_data + (double)sub1 / 2 + (double)sub2 / 2 + (double)BreederParam[brd].fur / 2;
	ret = main_data + ((sub1 + sub2 + BreederParam[brd].fur) / 2);
	return ret;
}

void GetBPAll(u8 MainContest)
{
	u8 i;
	
	for(i = 0; i < BREEDER_MAX; i++)
		ContBP[i] = GetBP(i, MainContest);
}


//=========================================================================
//	審査員のｱｸﾀｰ(ﾊﾟﾚｯﾄ、グラフィックﾃﾞｰﾀ含む)をセットする
//=========================================================================
u8 ContestJudgeActorSet(void)
{
	u8 actno;

	DecordCellSet((CellData*)&JudgeCell);
	DecordPaletteWork((void*)shinsain_pcl_ADRS, PA_OBJ0 + 0x10 * 1, 0x20);
	actno = AddActor(&JudgeHeader, CON_JUDGE_X, CON_JUDGE_Y, C_POKE1PRI);

	ActWork[actno].oamData.Pltt = 1;
	ActWork[actno].move = DummyActMove;
	
//	ActWork[actno].aff_tbl = PmAffAnmTblF2;
//	ActAffAnmChg(&ActWork[actno], 0);
	
	return actno;
}

//=========================================================================
//	審判のふきだしアイコンアクターのｾｯﾄ
//=========================================================================
u8 JudgeFukidasiActorSet(void)
{
	u8 actno;
	
	DecordCellSet((CellData*)&FukidasiCell);
	DecordPalSet((void*)&FukidasiPal);
	actno = AddActor(&FukidasiHeader, CON_FUKIDASI_X, CON_FUKIDASI_Y, C_POKE1PRI-1);
	ActWork[actno].banish = 1;
	//ｱﾆﾒﾃｰﾌﾞﾙは使用しないのでﾄｯﾌﾟのｷｬﾗNoを保持しておく
	ActWork[actno].work[0] = ActWork[actno].oamData.CharNo;
	return actno;
}

//=========================================================================
//	ポケモンのアクター(ﾊﾟﾚｯﾄ、ｸﾞﾗﾌｨｯｸﾃﾞｰﾀ含む)をセットする
//		※正面向き
//=========================================================================
u8 ContestPokeActorSet(void)
{
	u8 actno;
	u16 monsno;
	
	monsno = BreederParam[MyBreederNo].monsno;
	DecordPokeCellMake(&PM2FObjDataCell[monsno], pm2fpara[monsno].size,
				pm2fpara[monsno].patcnt, (void*)0x2000000,(void*)DecordAdrs[1],monsno);
	DecordPaletteWork((void*)PM2NObjDataPal[monsno].pal_data,
		PA_OBJ0 + 0x10 * 1, 0x20);
	PokeActHeaderMake(BreederParam[MyBreederNo].monsno, 1);
	actno = AddActor(&PokeActHeader, CON_POKE_X, CON_POKE_Y + 
		4*(8-pm2fpara[BreederParam[MyBreederNo].monsno].size),
					C_POKE1PRI);	//ﾎﾟｹﾓﾝ
	ActWork[actno].oamData.Pltt = 1;
	ActWork[actno].move = DummyActMove;
	
	ActWork[actno].aff_tbl = PmAffAnmTblF2;
	ActAffAnmChg(&ActWork[actno], 0);
	
	return actno;
}
//=========================================================================
//	ポケモンのアクター(ﾊﾟﾚｯﾄ、ｸﾞﾗﾌｨｯｸﾃﾞｰﾀ含む)をセットする
//		※背後向き
//=========================================================================
u8 ContestPokeActorSet2(u16 monsno, u32 id_no, u32 personal_rnd)
{
	u8 actno;
	u32 palAdrs;
	
	monsno = GetContMonsNo(monsno);
	
	DecordPokeCellMakeBuchi(&PM2BObjDataCell[monsno], pm2bpara[monsno].size,
				pm2bpara[monsno].patcnt, (void*)0x2000000,(void*)DecordAdrs[CONT_POKEDECORD_NO],monsno, personal_rnd);

	//技ｴﾌｪｸﾄでﾎﾟｹﾓﾝのﾊﾟﾚｯﾄNoの取得はAttackNoで取ってるのでそれに合わせる
	palAdrs = PokePalGetPara(monsno, id_no, personal_rnd);
	DecordPaletteWork((void*)palAdrs, PA_OBJ0 + 0x10 * CONT_MINE_CLIENT, 0x20);
	PokeActHeaderMake(monsno, CONT_POKEDECORD_NO);
//	actno = AddActor(&PokeActHeader, CON_POKE_X, CON_POKE_Y + 
//		pm2bpara[monsno].patcnt, C_POKE1PRI);	//ﾎﾟｹﾓﾝ
	actno = AddActor(&PokeActHeader, CON_POKE_X, 
		GetWazaEffPokeYPos(CONT_MINE_CLIENT, monsno, 0), C_POKE1PRI);	//ﾎﾟｹﾓﾝ
//	ActWork[actno].oamData.Pltt = 0;
	ActWork[actno].oamData.Pltt = 2;	// 2002.06.06(木) AttackClientの位置に合わせる
	ActWork[actno].oamData.Priority = POKE_OAM_PRI;
	ActWork[actno].pri = GetPokeSoftPri(CONT_MINE_CLIENT);
	ActWork[actno].move = DummyActMove;
	ActWork[actno].work[0] = ActWork[actno].oamData.Pltt;	//戦闘と同じようにClientNo
	ActWork[actno].work[2] = monsno;	//戦闘と同じようにMonsNoを入れておく
	
	if(ContestPokeFlipCheck(monsno))
		ActWork[actno].aff_tbl = PmAffAnmTblF2;
	else
		ActWork[actno].aff_tbl = PmAffAnmTblF;	//反転禁止ポケモン
	ActAffAnmChg(&ActWork[actno], 0);
	
	return actno;
}

//-- ｺﾝﾃｽﾄで反転させないキャラかﾁｪｯｸ --//
//----------------------------------------------------------
//	ｺﾝﾃｽﾄで反転させないキャラかﾁｪｯｸ
// 戻り値: 1=反転OK	0=反転禁止
//----------------------------------------------------------
u8 ContestPokeFlipCheck(u16 monsno)
{
	if(monsno == MONSNO_ANNOON)
		return 0;
	return 1;
}


//=========================================================================
//	1枚目に書かれているプレイヤー情報を2枚目のｽｸﾘｰﾝにｺﾋﾟｰする
//=========================================================================
void PlayerInfoCopy(void)
{
	PlayerInfoCopySub(SCREEN_BASE24_ADDR);	//フォント部分のコピー
	PlayerInfoCopySub(SCREEN_BASE28_ADDR);	//Window部分のコピー
}

static void PlayerInfoCopySub(u32 ScrnBaseAdr)
{
//	vu8 dma_wait;

	//上半分までｺﾋﾟｰ　　1枚目とかぶる部分がないので
	DIV_DMACOPY(3, ScrnBaseAdr, ScrnBaseAdr + (256/8)*(160/8)*2,
		 (256/8)*(80/8)*2, 16);
}


//=========================================================================
//	技タイプのアイコンのｷｬﾗﾅﾝﾊﾞｰを取得する
//=========================================================================
static u16 GetWazaKubunIconCharNo(u16 wazano, u8 brd_pos)
{
	u8 kubun;
	u16 scrn_data;
	
//	kubun = conwaza_tbl[wazano].kubun;
	kubun = WazaKoukaTbl[ConWazaTbl[wazano].apno].class;
	
	switch(kubun)
	{
		case NORMAL_KUBUN:			//ノーマル
		case COMBO2_KUBUN:			//コンボ2
		case BOUGYO_KUBUN:			//防御
			scrn_data = 0x9082;
			break;
		case DIST1_KUBUN:				//妨害
		case DIST2_KUBUN:
			scrn_data = 0x9088;
			break;
		case SPECIAL_KUBUN:			//特殊
		case COMBO1_KUBUN:			//コンボ1
		default:
			scrn_data = 0x9086;
			break;
	}
	scrn_data += 0x9000 + brd_pos*0x1000;
	return scrn_data;
}

//=========================================================================
//	技の効果ｺﾒﾝﾄ表示
//=========================================================================
static const u8 sura_msg[] = {sura_,EOM_,};

void PutWazaComment(u16 wazano)
{
	u16 icon_scrn;
	int i;
	u16 end_heart;
//	u16 offset_char;
	u8 con_type;
	
	//-- 技の属性を表示(かっこいい、かわいい等) --//
	FontScrnBoxFill(&FightMsg, MSG_CLEAR_NO,
		CON_TYPE_X, CON_TYPE_Y, CON_TYPE_X+5, CON_TYPE_Y+3);
//	MsgPrint(&FightMsg, ConTypeMsgTbl[ConWazaTbl[wazano].con_type],
//			CON_TYPETEXT, CON_TYPE_X, CON_TYPE_Y);
	con_type = ConWazaTbl[wazano].con_type;
	if(con_type == STYLE_TYPE)
		icon_scrn = STYLE_MSG_SCRN;
	else if(con_type == BEAUTIFUL_TYPE)
		icon_scrn = BEAUTIFUL_MSG_SCRN;
	else if(con_type == CUTE_TYPE)
		icon_scrn = CUTE_MSG_SCRN;
	else if(con_type == CLEVER_TYPE)
		icon_scrn = CLEVER_MSG_SCRN;
	else
		icon_scrn = STRONG_MSG_SCRN;
	for(i = 0; i < 5; i++){
		*(vu16*)(SCREEN_BASE24_ADDR + (0x20*0x14 + 0x20*11+0xb+i)*2)
				= icon_scrn;
		*(vu16*)(SCREEN_BASE24_ADDR + (0x20*0x14 + 0x20*11+0xb+i+0x20)*2)
				= icon_scrn+0x10;
		icon_scrn++;
	}
	
	//-- ﾊｰﾄｱｲｺﾝ --//
	//AP
	if(WazaKoukaTbl[ConWazaTbl[wazano].apno].ap == 0xff)	//ﾗﾝﾀﾞﾑﾁｪｯｸ
		end_heart = 0;
	else
		end_heart = WazaKoukaTbl[ConWazaTbl[wazano].apno].ap / METER_ONE_AP;// 5;
	if(end_heart > HEART_ICON_MAX)
		end_heart = HEART_ICON_MAX;
	for(i = 0; i < HEART_ICON_MAX; i++){
		if(i < end_heart)
			*(vu16 *)(SCREEN_BASE24_ADDR
				+ (0x20*0x14 + 0x20*11 + 0x15 + i)*2) = HEART_RED_SCRN0;
		else
			*(vu16 *)(SCREEN_BASE24_ADDR
				+ (0x20*0x14 + 0x20*11 + 0x15 + i)*2) = HEART_REDSPACE_SCRN;
	}
	//妨害ﾎﾟｲﾝﾄ
	if(WazaKoukaTbl[ConWazaTbl[wazano].apno].bougai == 0xff)	//ﾗﾝﾀﾞﾑﾁｪｯｸ
		end_heart = 0;
	else
		end_heart = WazaKoukaTbl[ConWazaTbl[wazano].apno].bougai / METER_ONE_AP;// 5;
	if(end_heart > HEART_ICON_MAX)
		end_heart = HEART_ICON_MAX;
	for(i = 0; i < HEART_ICON_MAX; i++){
		if(i < end_heart)
			*(vu16 *)(SCREEN_BASE24_ADDR
				+ (0x20*0x14 + 0x20*12 + 0x15 + i)*2) = HEART_BLACK_SCRN0;
		else
			*(vu16 *)(SCREEN_BASE24_ADDR
				+ (0x20*0x14 + 0x20*12 + 0x15 + i)*2) = HEART_BLACKSPACE_SCRN;
	}
	
//	if(conwaza_tbl[wazano].combo != 0)
//		PM_strcpy(StrTempBuffer0, ComboIMSG_Tbl[conwaza_tbl[wazano].combo]);
	MsgPrint(&FightMsg, WazaSetumeiMsgTbl[ConWazaTbl[wazano].apno],
			CON_WAZAEXPLA, CON_RANKU_X, CON_RANKU_Y);

	MsgPrint(&FightMsg, sura_msg, CON_WAZASURA, 16,20+11);
}

void WazaCommentClear(void)
{
	FontScrnBoxFill(&FightMsg, MSG_CLEAR_NO,
		CON_RANKU_X, CON_RANKU_Y, CON_RANKU_X+17, CON_RANKU_Y+5);
}

//=========================================================================
//	技の区分ｱｲｺﾝを各ﾌﾞﾘｰﾀﾞｰのｳｨﾝﾄﾞｳに表示
//=========================================================================
void WazaKubunIconPut(u16 wazano, u8 brd_pos)
{
	u16 icon_scrn;
	u8 ypos;
	
	ypos = 2 + (BrdSort[brd_pos] * 5);
	if(YasumiTurnCheck(brd_pos) == 0 && wazano != 0)
	{
		icon_scrn = GetWazaKubunIconCharNo(wazano, brd_pos);
		*(vu16 *)(SCREEN_BASE24_ADDR + (0x20*ypos + 0x14)*2) = icon_scrn;
		*(vu16 *)(SCREEN_BASE24_ADDR + (0x20*ypos + 0x15)*2) = icon_scrn+1;
		*(vu16 *)(SCREEN_BASE24_ADDR + (0x20*(ypos+1) + 0x14)*2) = icon_scrn+0x10;
		*(vu16 *)(SCREEN_BASE24_ADDR + (0x20*(ypos+1) + 0x15)*2) = icon_scrn+0x11;
	}
	else
	{
		*(vu16 *)(SCREEN_BASE24_ADDR + (0x20*ypos + 0x14)*2) = 0;
		*(vu16 *)(SCREEN_BASE24_ADDR + (0x20*ypos + 0x15)*2) = 0;
		*(vu16 *)(SCREEN_BASE24_ADDR + (0x20*(ypos+1) + 0x14)*2) = 0;
		*(vu16 *)(SCREEN_BASE24_ADDR + (0x20*(ypos+1) + 0x15)*2) = 0;
	}
}

void WazaKubunIconPutAll(void)
{
	u8 i;
	for(i = 0; i < BREEDER_MAX; i++)
		WazaKubunIconPut(apsys[i].use_waza, i);
}

//=========================================================================
//	ボーナスアイコンのｽｸﾘｰﾝデータを取得する
//=========================================================================
static u16 GetBonusIconScrn(u8 brd_pos)
{
	u16 scrn_data;
	scrn_data = 0x2034;
	return scrn_data;
}

//=========================================================================
//	ボーナスｱｲｺﾝを各ﾌﾞﾘｰﾀﾞｰのｳｨﾝﾄﾞｳに表示
//	ﾎﾞｰﾅｽアイコンにを付けた、又は消した時は 1、
//	特にアイコンに対して何もしなかった時は 0
//	se_flg = 1:SEを鳴らせる	0:鳴らさない
//=========================================================================
u8 BonusIconPut(u8 brd_pos, u8 se_flg)
{
	u16 icon_scrn;
	u8 ypos;
	int i;
	
	if(apsys[brd_pos].bonus_flg == 0)
		return 0;
		
	ypos = 2 + (BrdSort[brd_pos] * 5);
	if(apsys[brd_pos].bonus_flg == 1){			//ﾎﾞｰﾅｽが付いた
		icon_scrn = GetBonusIconScrn(brd_pos);
		for(i = 0; apsys[brd_pos].bonus / 10 > i; i++)
			*(vu16 *)(SCREEN_BASE24_ADDR + (0x20*(ypos+i) + 0x13)*2) = icon_scrn;
		if(se_flg){
			SePlay(SE_EXPMAX);	//SE_RU_GASHIN);
			apsys[brd_pos].bonus_flg = 0;
		}
	}else{										//ﾎﾞｰﾅｽが消えた
		icon_scrn = MSG_CLEAR_NO;
		for(i = 3;apsys[brd_pos].bonus / 10 < i; i--)
			*(vu16 *)(SCREEN_BASE24_ADDR + (0x20*(ypos+i-1) + 0x13)*2) = icon_scrn;
		if(se_flg){
			SePlay(SE_FU_ZAKU2);
			apsys[brd_pos].bonus_flg = 0;
		}
	}
	return 1;
}

//=========================================================================
//	全てのﾌﾞﾘｰﾀﾞｰのﾎﾞｰﾅｽｱｲｺﾝを再描画する
//=========================================================================
void BonusIconResetAll(void)
{
	u16 icon_scrn;
	u8 ypos;
	int i, t;
	
	for(t = 0; t < BREEDER_MAX; t++){
		ypos = 2 + (BrdSort[t] * 5);
		icon_scrn = GetBonusIconScrn(t);
		for(i = 0; i < apsys[t].bonus / 10; i++)
			*(vu16 *)(SCREEN_BASE24_ADDR + (0x20*(ypos+i) + 0x13)*2) = icon_scrn;
		icon_scrn = MSG_CLEAR_NO;
		for( ; i < 3; i++)
			*(vu16 *)(SCREEN_BASE24_ADDR + (0x20*(ypos+i) + 0x13)*2) = icon_scrn;
	}
}


//=========================================================================
//	技効果で発生するアイコンのｷｬﾗﾅﾝﾊﾞｰを取得する
//=========================================================================
static u16 GetWazaKoukaIconScrn(u8 brd_pos, u8 icon_type)
{
	u16 scrn_data = 0;
	
	switch(icon_type)
	{
		case SHIELD_TYPE:			//シールド
			scrn_data = 0x0080;
			break;
		case KINTYOU_TYPE:			//緊張
			scrn_data = 0x0084;
			break;
		case YASUMI_TYPE:			//休み
			scrn_data = 0x0086;
			break;
		case BOUGAI_TARGET_TYPE:	//妨害のターゲットにされた
			scrn_data = 0x0088;
			break;
		case BOUGAI2BAI_TYPE:		//妨害2倍
			scrn_data = 0x0082;
			break;
	}
	scrn_data += 0x9000;
	return scrn_data;
}

//=========================================================================
//	技効果で発生するアイコンの表示(防御とか、緊張とか)
//	戻り値：1=ｱｲｺﾝを描いた	0=ｱｲｺﾝを消去した
//=========================================================================
u8 WazaKoukaIconPut(u8 brd)
{
	u8 put_mode = 1;
	u16 icon_scrn = 0;
	u8 ypos;
	
	ypos = 2 + (BrdSort[brd] * 5);
	
	if(apsys[brd].Ashield_flg || apsys[brd].invalid10 || 
		apsys[brd].shield_flg || apsys[brd].invalid)
	{	//シールドアイコン表示
		icon_scrn = GetWazaKoukaIconScrn(brd, SHIELD_TYPE);
	}
	else if(apsys[brd].miss_flg)	//緊張アイコン
		icon_scrn = GetWazaKoukaIconScrn(brd, KINTYOU_TYPE);
	else if(apsys[brd].yasumi_turn || apsys[brd].endAppeal_flg)	//休みアイコン
		icon_scrn = GetWazaKoukaIconScrn(brd, YASUMI_TYPE);
	else
		put_mode = 0;
	
	if(put_mode)
	{
		*(vu16 *)(SCREEN_BASE24_ADDR + (0x20*ypos + 0x14)*2) = icon_scrn;
		*(vu16 *)(SCREEN_BASE24_ADDR + (0x20*ypos + 0x15)*2) = icon_scrn+1;
		*(vu16 *)(SCREEN_BASE24_ADDR + (0x20*(ypos+1) + 0x14)*2) = icon_scrn+0x10;
		*(vu16 *)(SCREEN_BASE24_ADDR + (0x20*(ypos+1) + 0x15)*2) = icon_scrn+0x11;
	}
	else
	{	//アイコン消去
		*(vu16 *)(SCREEN_BASE24_ADDR + (0x20*ypos + 0x14)*2) = 0;
		*(vu16 *)(SCREEN_BASE24_ADDR + (0x20*ypos + 0x15)*2) = 0;
		*(vu16 *)(SCREEN_BASE24_ADDR + (0x20*(ypos+1) + 0x14)*2) = 0;
		*(vu16 *)(SCREEN_BASE24_ADDR + (0x20*(ypos+1) + 0x15)*2) = 0;
	}
	
	return put_mode;
}

void WazaKoukaIconPutAll(void)
{
	int i;
	for(i = 0; i < BREEDER_MAX; i++)
		WazaKoukaIconPut(i);
}

//=========================================================================
//	Talkメッセージ表示部分をｸﾘｱｰ
//=========================================================================
void ContestTalkMsgClear(void)
{
	FontScrnBoxFill(&FightMsg, MSG_CLEAR_NO,
		CON_TALKMSG_X, CON_TALKMSG_Y, CON_TALKMSG_X+15, CON_TALKMSG_Y+3);
}


//=========================================================================
//	繰り出した技ﾅﾝﾊﾞｰを取得
//=========================================================================
u16 UseWorkGet(u8 pos)
{
	u8 wazapos;
	u16 wazano;
/*	u16 rand_temp;
	
	rand_temp = r_next;
	pp_srand(sys.main_timer);
	r_next += pos;
	*/
	
	if(YasumiTurnCheck(pos))
		wazano = 0;
	else if(pos != MyBreederNo){
//		wazano = BreederParam[pos].waza[pp_rand() % 4];	//技をﾗﾝﾀﾞﾑでｹﾞｯﾄ
		ConWazaAIInit(pos);
		wazapos = ConWazaAIMain();
		wazano = BreederParam[pos].waza[wazapos];
	
	}else
		wazano = BreederParam[pos].waza[consys->cursor];
	
	//r_next = rand_temp;	//タネを元に戻す
	
	return wazano;
}

void UseWorkGetAll(void)
{
	u8 i;
	
	for(i = 0; i < BREEDER_MAX; i++)
	{
		apsys[i].use_waza = UseWorkGet(i);
	}
}

//=========================================================================
//	使用する技名を表示
// deep = 色の濃さ  0:普通の色   1:薄い色
//=========================================================================
void UsedWorkNamePut(u8 brd, u8 deep)
{
	u8 font_col;
	
	if(deep == 0)
	//	brd == MyBreederNo ? (font_col = COL_WHITE) : (font_col = COL_BLACK);
		font_col = BLD_PAL + brd;
	else
	//	brd == MyBreederNo ? (font_col = CON_GRAYPAL) : (font_col = CON_GRAYPAL);
		font_col = CON_GRAYPAL;
	
	//if(YasumiTurnCheck(brd))
	if(apsys[brd].use_waza == 0)
		FontCommonSet(yasumi_msg, font_col);
	else
		FontCommonSet(WazaNameData[apsys[brd].use_waza], font_col);
	
//		MsgPrint(&FightMsg, transparent_msg, CON_WAZA + CON_WAZANAME_LEN * brd,
//				C_RankingPos[brd][0], C_RankingPos[brd][1]);	//透明色でｸﾘｱ
	UsedWorkNameClear(brd);
	MsgPrint(&FightMsg, FightMsgBuf, CON_WAZA + CON_WAZANAME_LEN * brd,
			C_RankingPos[brd][0], C_RankingPos[brd][1]);	//技名書きこみ
}

void UsedWorkNamePutAll(u8 deep)
{
	u8 i;
	for(i = 0; i < BREEDER_MAX; i++)
		UsedWorkNamePut(i, deep);
}

//----------------------------------------------------------
//	技名が書かれている部分をクリアーする
//----------------------------------------------------------
void UsedWorkNameClear(u8 brd)
{
	FontScrnBoxFill(&FightMsg, MSG_CLEAR_NO, C_RankingPos[brd][0], C_RankingPos[brd][1],
		C_RankingPos[brd][0]+7, C_RankingPos[brd][1]+1);
}

void UsedWorkNameClearAll(void)
{
	u8 i;
	for(i = 0; i < BREEDER_MAX; i++)
		UsedWorkNameClear(i);
}


//=========================================================================
//	ｱﾋﾟｰﾙﾀｲﾑの順位決定処理
//=========================================================================
void TotalAPCalc(void)
{
	u8 i, j;
	s16 ap[BREEDER_MAX];
	s16 temp;
	
	for(i = 0; i < BREEDER_MAX; i++)
	{
		apsys[i].total_ap += apsys[i].ap;
		ap[i] = apsys[i].total_ap;
	}

	for(i = 0; i < BREEDER_MAX - 1; i++)	//ｿｰﾄ
	{
		for(j = BREEDER_MAX - 1; j > i; j--)
		{
			if(ap[j-1] < ap[j])
			{
				temp = ap[j];
				ap[j] = ap[j-1];
				ap[j-1] = temp;
			}
		}
	}
	
	for(i = 0; i < BREEDER_MAX; i++)
	{
		for(j = 0; j < BREEDER_MAX; j++)
		{
			if(apsys[i].total_ap == ap[j])
			{
				apsys[i].ranking = j;
				break;
			}
		}
	}

	BreederDataSort(1);
	ConWazaBrdSort();
}

//=========================================================================
//	ターン終了時の結果MsgIDを取得する
//=========================================================================
void GetTurnKekkaMsgID(void)
{
	int i;
	u8 kekka_msg;
	
	for(i = 0; i < BREEDER_MAX; i++){
	//	if(YasumiTurnCheck(MyBreederNo))
		if(apsys[i].use_waza == 0)
			kekka_msg = SITENAI_MSG;
		else if(apsys[i].ap < 1)
			kekka_msg = ZENZEN_MSG;
		else if(apsys[i].ap < 30)
			kekka_msg = ANMARI_MSG;
		else if(apsys[i].ap < 60)
			kekka_msg = MAAMAA_MSG;
		else if(apsys[i].ap < 80)
			kekka_msg = KANARI_MSG;
		else
			kekka_msg = MONOSUGOKU_MSG;
		apsys[i].kekka_msgid = kekka_msg;
	}
}

//=========================================================================
//	技の特殊効果を発動できるかチェック
//   & 技を出すときに発生する特殊もﾁｪｯｸ
//=========================================================================
u8 WazaCalcFlagCheck(u8 brd)
{
	if(apsys[brd].yasumi_turn || apsys[brd].endAppeal_flg)
		return 0;
	/*
	if(apsys[brd].AtoD_turn)
	{
		if(conwaza_tbl[apsys[brd].use_waza].class > S_CLASS)//A_CLASS)
		{
			apsys[brd].ap += apsys[brd].found_ap;
			apsys[brd].found_ap += apsys[brd].found_ap;
			AppealPutMsgSet(1);
		}
	}*/
	return 1;
}


//=========================================================================
//	技フラグのチェックとクリア
//=========================================================================
void ConWazaFlagCheckClear(void)
{
	u8 i;
	
	for(i = 0; i < BREEDER_MAX; i++)
	{
		apsys[i].ap = 0;
		apsys[i].found_ap = 0;
//		apsys[i].add_ap = 0;
//		apsys[i].sub_ap = 0;
		apsys[i].shield_flg = 0;
//		apsys[i].reflect_flg = 0;
//		apsys[i].surru_flg = 0;
//		apsys[i].surru_no = i;
//		apsys[i].SpeUseless_flg = 0;
//		apsys[i].conti_count;	ﾍﾟﾅﾙﾃｨ計算で処理
//		apsys[i].endAppeal_flg	立ったら立ちっぱなし
//		apsys[i].eachTime_flg	立ったら立ちっぱなし
		if(apsys[i].yasumi_turn > 0)
			apsys[i].yasumi_turn--;
//		if(apsys[i].AtoD_turn > 0)
//			apsys[i].AtoD_turn--;
//		if(apsys[i].combo_turn > 0)
//			apsys[i].combo_turn--;
//		apsys[i].bougai_count	技効果の中で処理
//		apsys[i].bougai_flg = 0;
		
		apsys[i].bougai = 0;
		apsys[i].invalid10 = 0;
		apsys[i].invalid = 0;
		apsys[i].Ashield_flg = 0;
		apsys[i].bougai2bai = 0;
		apsys[i].penalty0 = 0;
		apsys[i].miss_flg = 0;
		apsys[i].msgid = 0xff;
		apsys[i].msgid2nd = 0xff;
		apsys[i].bonus_flg = 0;
		apsys[i].combo1_invalid = apsys[i].penalty;
		apsys[i].penalty = 0;
		apsys[i].now_nextsort = 0;
		apsys[i].bonus3bai = 0;
		if(apsys[i].next_yasumi_turn){
			apsys[i].yasumi_turn = 1;
			apsys[i].next_yasumi_turn = 0;
		}
		if(apsys[i].next_endAppeal_flg){
			apsys[i].endAppeal_flg = 1;
			apsys[i].next_endAppeal_flg = 0;
		}
		apsys[i].tensyon_up = 0;
	}

	for(i = 0; i < BREEDER_MAX; i++)
	{
		apsys[i].use_wazaold = apsys[i].use_waza;
		consys->WazaHistory[consys->turn][i] = apsys[i].use_waza;
		consys->TensyonHistory[consys->turn][i] = TensyonCheck(apsys[i].use_waza);
		apsys[i].use_waza = 0;
	}
	ccw->tensyon_stop = 0;
	
	/*
	i = MyBreederNo;
	if(apsys[i].yasumi_turn || apsys[i].endAppeal_flg)
		consys->fusanka = 1;
	else
		consys->fusanka = 0;
	*/
}

//=========================================================================
//	今のﾀｰﾝ休みかチェック
// 戻り値: 1 = 休み		0 = 休みじゃない
//=========================================================================
u8 YasumiTurnCheck(u8 brd)
{
	if(apsys[brd].yasumi_turn || apsys[brd].endAppeal_flg)
		return 1;
	return 0;
}

//=========================================================================
//	技を受けた(出した)時に表示させるﾒｯｾｰｼﾞのﾅﾝﾊﾞｰをｾｯﾄ
// 戻り値： 0 = エラー(ｾｯﾄする場所がなかった)   1 = 正常終了
//=========================================================================
u8 ConWazaMsgSet(u8 brd_no, u8 msg_no)
{
	u8 i;
	
	if(brd_no != MyBreederNo)
		return 1;
	
	for(i = 0; i < BREEDER_MAX; i++)
	{
		if(msg_no == ITUMOYORI_MSG)
		{
			consys->itumoyori_flg = 1;
			return 1;
		}
		else if(msg_no == ITUMOYORI_MUCH_MSG)
		{
			consys->itumoyori_much = 1;
			return 1;
		}
		else if(consys->waza_msg[i] == msg_no)
			return 1;	//既に同じﾒｯｾｰｼﾞが登録済み
		if(consys->waza_msg[i] == 0xff)
		{
			consys->waza_msg[i] = msg_no;
			return 1;
		}
	}
	return 0;
}


//=========================================================================
//	評価値取得
//=========================================================================
void GetEvaluationValue(u8 brd)
{
	NijiPoint[brd] = GetNijisinsaPoint(brd);
	ContEvaluation[brd] = ContBP[brd] + NijiPoint[brd];
}

void GetEvaluationValueAll(void)
{
	u8 i;
	
	for(i = 0; i < BREEDER_MAX; i++)
		GetEvaluationValue(i);
	GetContestJyunni();
}

//----------------------------------------------------------
//	2次審査ポイントを取得
//----------------------------------------------------------
s16 GetNijisinsaPoint(u8 brd)
{
	//return ContAP[brd];
	return (ContAP[brd]*2);
}

//=========================================================================
//	各ﾌﾞﾘｰﾀﾞｰの最終的な順位を取り出す
//=========================================================================
static void GetContestJyunni(void)
{
	u16 random[BREEDER_MAX];
	int i,t, s;
	int data[BREEDER_MAX][4];	//0:Evaluation 1:BP 2:random 3:BreederNo
	int temp[4];
	
	memset(random, 0, sizeof(random));
	for(i = 0; i < BREEDER_MAX; i++){	//各ﾌﾞﾘｰﾀﾞｰのﾗﾝﾀﾞﾑ値を取得
		random[i] = pp_rand();
		for(t = 0; t < i; t++){
			if(random[i] == random[t]){
				i--;	//ﾗﾝﾀﾞﾑ値がかぶったら もう一回ﾗﾝﾀﾞﾑを引きなおす
				break;
			}
		}
	}
	
	for(i = 0; i < BREEDER_MAX; i++){
		data[i][0] = ContEvaluation[i];
		data[i][1] = ContBP[i];
		data[i][2] = random[i];
		data[i][3] = i;
	}

	for(i = 0; i < BREEDER_MAX - 1; i++){
		for(s = BREEDER_MAX - 1; s > i; s--){
			if(EvalSortConditionsCheck(s-1, s, data)){
				temp[0] = data[s-1][0];
				temp[1] = data[s-1][1];
				temp[2] = data[s-1][2];
				temp[3] = data[s-1][3];
				data[s-1][0] = data[s][0];
				data[s-1][1] = data[s][1];
				data[s-1][2] = data[s][2];
				data[s-1][3] = data[s][3];
				data[s][0] = temp[0];
				data[s][1] = temp[1];
				data[s][2] = temp[2];
				data[s][3] = temp[3];
			}
		}
	}

	for(i = 0; i < BREEDER_MAX; i++)
		ContestJyunni[data[i][3]] = i;
}

static u8 EvalSortConditionsCheck(int brd1, int brd2, int data[][4])
{
	u8 ret;
	
	if(data[brd1][0] < data[brd2][0])	//Evaluation
		ret = 1;
	else if(data[brd1][0] > data[brd2][0])	//Evaluation
		ret = 0;
	//この先はContEvaluationが同じ値の場合
	else if(data[brd1][1] < data[brd2][1])	//BP
		ret = 1;
	else if(data[brd1][1] > data[brd2][1])	//BP
		ret = 0;
	//この先はContEvaluationもContBPも同じ値の場合
	else if(data[brd1][2] < data[brd2][2])	//random
		ret = 1;
	else
		ret = 0;
	
	return ret;
}


//=========================================================================
//	「つうしん　たいきちゅう」のﾒｯｾｰｼﾞを出す
//=========================================================================
void TuusintyuuMsgPut(void)
{
	ScrY0 = 0;
	ScrY2 = 0;
	
	ContestTalkMsgClear();
//	TalkMsgSet(&FightMsg, FightMsgBuf, CON_MSG, CON_TALKMSG_X, CON_TALKMSG_Y);
	MsgPrint(&win[0], tuusintyuu_msg, CON_MSG, CON_TALKMSG_X, CON_TALKMSG_Y);
}

//=========================================================================
//	アピールメーターを出すシーケンス(ﾀｽｸ)
// now_ap = 加減算前のAP	add_ap = 加減算する値(引く場合はﾏｲﾅｽで)
// col = ﾒｰﾀｰのｶﾗｰ指定		brd_pos = どのﾌﾞﾘｰﾀﾞｰに対して行うのか
// 戻り値：ﾒｰﾀｰを動かすﾀｽｸのID
//=========================================================================
u8 AppealMeterTaskSet(s16 now_ap, s16 add_ap, u8 col, u8 brd_pos)
{
	u8 id;
	s8 add_meter;
	u8 now_meter;
	u16 base_scrn;
	
	brdsys[brd_pos].meter_eff = 1;
	
	id = AddTask(AppealMeterPutSeq, 20);
	now_meter = GetMeterNum(now_ap);
	add_meter = GetMeterNum(now_ap+add_ap) - now_meter;
	base_scrn = GetBaseMeterScrn(brd_pos);
	TaskTable[id].work[0] = now_meter;
	TaskTable[id].work[1] = add_meter;
	TaskTable[id].work[2] = base_scrn + col;
	TaskTable[id].work[3] = brd_pos;
	
	if(add_ap < 0)	//ﾏｲﾅｽならﾒｰﾀｰ下降が終了する前に先に点滅のﾁｪｯｸをしてしまう
		MeterColorFadeCheck(brd_pos);

	return id;
}

static void AppealMeterPutSeq(u8 id)
{
	u8 brd_pos;
	u8 pos, i;
	
	brd_pos = TaskTable[id].work[3];

	if(TaskTable[id].work[1] == 0)
	{
		MeterColorFadeCheck(brd_pos);
		//TaskTable[id].TaskAdrs = DummyTaskSeq;
		DelTask(id);
		brdsys[brd_pos].meter_eff = 0;
		return;
	}
	if(++TaskTable[id].work[10] < 30)	//14)
		return;
	
	TaskTable[id].work[10] = 0;
	if(TaskTable[id].work[1] < 0)
	{
		pos = TaskTable[id].work[0]--;
		TaskTable[id].work[1]++;
		SePlay(SE_BOO);
	}
	else
	{
		pos = ++TaskTable[id].work[0];
		TaskTable[id].work[1]--;
		SePlay(SE_PIN);
	}
	
	if((u16)TaskTable[id].work[2] != 0xffff)
	{
		DmaTransReq((u8*)&TaskTable[id].work[2],
			SCREEN_BASE24_ADDR + (32*4 + 19 + pos + (32*5)*brd_pos)*2, 2);
	}
	else
	{
		for(i = 0; i < BREEDER_MAX-1; i++)
		{
			if(TaskTable[id].work[4+i] < 0)
			{
				DmaTransReq((u8*)&TaskTable[id].work[7+i],
					SCREEN_BASE24_ADDR + (32*4 + 19 + pos + (32*5)*brd_pos)*2, 2);
				TaskTable[id].work[4+i]++;
				break;
			}
		}
	}
}

//----------------------------------------------------------
//	アピールメーターをｸﾘｱｰする
//----------------------------------------------------------
void AppealMeterClear(void)
{
	u8 i;

	for(i = 0; i < BREEDER_MAX; i++){
		DIV_DMACLEAR(3, HEART_CLEAR_SCRN, SCREEN_BASE24_ADDR+(32*2+0x16+(32*5)*i)*2, 16, 16);
		DIV_DMACLEAR(3, HEART_CLEAR_SCRN, SCREEN_BASE24_ADDR+(32*3+0x16+(32*5)*i)*2, 16, 16);
	}
}

//----------------------------------------------------------
//	ﾒｰﾀｰを全て白で埋める
//----------------------------------------------------------
void AppealMeterWhiteSet(s16 ap, u8 brd)
{
	u8 meter, i;
	u16 base_scrn;
	u16 trans_scrn[9];
	
	meter = GetMeterNum(ap);
	if(brd == 0)
		base_scrn = BASE_METER_SCRN0;
	else if(brd == 1)
		base_scrn = BASE_METER_SCRN1;
	else if(brd == 2)
		base_scrn = BASE_METER_SCRN2;
	else
		base_scrn = BASE_METER_SCRN3;
	base_scrn += METER_WHITE;
	
	for(i = 0; i < 9; i++)
	{
		if(i < meter)
			trans_scrn[i] = base_scrn;
		else
			trans_scrn[i] = MSG_CLEAR_NO;
	}
	DIV_DMACOPY(3, (u8*)trans_scrn,	SCREEN_BASE24_ADDR + (32*4+20+(32*5)*brd)*2, 18, 16);
}

//----------------------------------------------------------
//	ﾌﾞﾘｰﾀﾞｰNoからﾍﾞｰｽのｽｸﾘｰﾝﾃﾞｰﾀを取り出す
//----------------------------------------------------------
static u16 GetBaseMeterScrn(u8 brd)
{
	u16 base_scrn;
	
	if(brd == 0)
		base_scrn = BASE_HEART_SCRN0;
	else if(brd == 1)
		base_scrn = BASE_HEART_SCRN1;
	else if(brd == 2)
		base_scrn = BASE_HEART_SCRN2;
	else
		base_scrn = BASE_HEART_SCRN3;
	
	return base_scrn + 1;	//常に濃いのを表示するように変更
}

//----------------------------------------------------------
//	AP値から何個のﾒｰﾀｰがつくかを返す
//----------------------------------------------------------
static s8 GetMeterNum(s16 ap)
{
	s8 ret;
	
	ret = ap / METER_ONE_AP;	//5;
	if(ret > 16)
		ret = 16;
	else if(ret < -16)
		ret = -16;

//	return abs(ret);
	return ret;
}

//=========================================================================
//	アピールハートを出すシーケンス(ﾀｽｸ)
// now_ap = 加減算前のAP	add_ap = 加減算する値(引く場合はﾏｲﾅｽで)
// brd_pos = どのﾌﾞﾘｰﾀﾞｰに対して行うのか
// 戻り値：ﾒｰﾀｰを動かすﾀｽｸのID
//=========================================================================
u8 AppealHeartTaskSet(s16 now_ap, s16 add_ap, u8 brd_pos)
{
	u8 id;
	s8 add_meter;
	s8 now_meter;
	u16 base_scrn;
	
	brdsys[brd_pos].meter_eff = 1;
	
	id = AddTask(AppealHeartPutSeq, 20);
	now_meter = GetMeterNum(now_ap);
	add_meter = GetMeterNum(now_ap+add_ap) - now_meter;
	base_scrn = GetBaseMeterScrn(brd_pos);

	TaskTable[id].work[0] = abs(now_meter);
	TaskTable[id].work[1] = add_meter;
	if(now_meter > 0 || (now_meter == 0 && add_meter > 0))
		TaskTable[id].work[2] = 1;
	else
		TaskTable[id].work[2] = -1;
	TaskTable[id].work[3] = brd_pos;

//	TaskTable[id].work[2] = base_scrn;	//  + col;
	
	if(add_ap < 0)	//ﾏｲﾅｽならﾒｰﾀｰ下降が終了する前に先に点滅のﾁｪｯｸをしてしまう
		MeterColorFadeCheck(brd_pos);

	return id;
}

//----------------------------------------------------------
//	ハートメーターをあげていく
//----------------------------------------------------------
static void AppealHeartPutSeq(u8 id)
{
	u8 brd_pos;
	u8 pos;
	s16 now, addsub;
	u16 scrn;
	s8 meter_pos;
	u8 sepos;
	
	brd_pos = TaskTable[id].work[3];
	now = TaskTable[id].work[0];
	addsub = TaskTable[id].work[1];
	
	if(++TaskTable[id].work[10] < METER_WAIT)	//14)
		return;
	TaskTable[id].work[10] = 0;

	if(TaskTable[id].work[1] == 0)
	{
		MeterColorFadeCheck(brd_pos);
		//TaskTable[id].TaskAdrs = DummyTaskSeq;
		DelTask(id);
		brdsys[brd_pos].meter_eff = 0;
		return;
	}

	if(now == 0){
		if(addsub < 0){
			scrn = GetBaseMeterScrn(brd_pos) + 2;
//			if(now+addsub < -9)
//				scrn++;	//濃いハートの色を表示させる
			meter_pos = -1;
			TaskTable[id].work[1]++;
		}else{
			scrn = GetBaseMeterScrn(brd_pos);
//			if(now+addsub > 9)
//				scrn++;	//濃いハートの色を表示させる
			meter_pos = 1;
			TaskTable[id].work[1]--;
		}
		pos = TaskTable[id].work[0]++;
	}else if(TaskTable[id].work[2] < 0){		//(now < 0){
		meter_pos = -1;
		if(addsub < 0){
			pos = TaskTable[id].work[0]++;
			TaskTable[id].work[1]++;

			scrn = GetBaseMeterScrn(brd_pos) + 2;
//			if(now+addsub < -8)
//				scrn++;	//濃いハートの色を表示させる
		}else{
			pos = --TaskTable[id].work[0];
			scrn = HEART_CLEAR_SCRN;
			TaskTable[id].work[1]--;
		}
	}else{
		meter_pos = 1;
		if(addsub < 0){
			pos = --TaskTable[id].work[0];
			scrn = HEART_CLEAR_SCRN;
			TaskTable[id].work[1]++;
		}else{
			pos = TaskTable[id].work[0]++;
			TaskTable[id].work[1]--;

			scrn = GetBaseMeterScrn(brd_pos);
//			if(now+addsub > 8)
//				scrn++;	//濃いハートの色を表示させる
		}
	}
	
	sepos = pos;
	if(pos > 7){
		//pos -= 8;
//		if(scrn != HEART_CLEAR_SCRN)
//			scrn++;		//濃い色のを表示
		pos += -8 + 0x20;	//下段に移動
	}
	CpuClear(scrn, SCREEN_BASE24_ADDR + 
			(32*2 + 0x16 + pos + (32*5)*BrdSort[brd_pos])*2, 2, 16);

	if(addsub > 0){
		//SePlay(SE_PIN);
		SePlay(SE_C_GAJI);
		m4aMPlayImmInit(&m4a_mplay001);
		m4aMPlayPitchControl(&m4a_mplay001, 0xffff, 256*sepos);
	}
	else{
		SePlay(SE_BOO);
	}
	
	if(pos == 0 && scrn == HEART_CLEAR_SCRN)
		TaskTable[id].work[2] = -TaskTable[id].work[2];
}


//=========================================================================
//	ハートのアイコンで現在のトータルAP値を示す
//=========================================================================
//----------------------------------------------------------
//	ハートアイコンのアクターをCell&PalSet
//----------------------------------------------------------
void HeartIconAllSet(void)
{
	int i;
	
	CellSet((CellData *)&HeartIconCell);
//	ObjPalSet((PalData*)&HeartIconPal);
	for(i = 0; i < BREEDER_MAX; i++)
		brdsys[i].heart_actno = AddActor(&HeartIconHeader, HEARTICON_X, 
			HeartIconYPos[BrdSort[i]], 1);
}

//----------------------------------------------------------
//	ハートアイコンを現在のtotal_apの位置まで動かす
//		動作中はheart_moveフラグが立つ	動作が終了したら0になる
//----------------------------------------------------------
void SetHeartIconMove(u8 brd)
{
	u8 actno;
	s16 dotto;
	
	brdsys[brd].heart_move = 1;
	actno = brdsys[brd].heart_actno;
	dotto = apsys[brd].total_ap / METER_ONE_AP * 2;	//5;

	if(dotto > 56)
		dotto = 56;
	else if(dotto < 0)
		dotto = 0;

	ActWork[actno].banish = 0;
	ActWork[actno].work[0] = brd;
	ActWork[actno].work[1] = dotto;
	if(dotto > ActWork[actno].dx)
		ActWork[actno].work[2] = 1;
	else
		ActWork[actno].work[2] = -1;
	ActWork[actno].move = HeartIconMoveSeq;
}

//----------------------------------------------------------
//	全てのﾌﾞﾘｰﾀﾞｰのハートアイコンに動作命令を出す
//----------------------------------------------------------
void SetHeartIconMoveAll(void)
{
	int i;
	for(i = 0; i < BREEDER_MAX; i++)
		SetHeartIconMove(i);
}

//----------------------------------------------------------
//	全てのﾌﾞﾘｰﾀﾞｰのハートアイコンの動作が終了しているか調べる
//	戻り値: 0=まだ動作中	1=全てのハートアイコンが動作終了している
//----------------------------------------------------------
u8 CheckHeartIconMoveAll(void)
{
	int i;
	for(i = 0; i < BREEDER_MAX; i++){
		if(brdsys[i].heart_move)
			break;
	}
	if(i == BREEDER_MAX)
		return 1;
	return 0;
}

//----------------------------------------------------------
//	ハートアイコンの動作シーケンス(トータルAP値まで動く)
//----------------------------------------------------------
static void HeartIconMoveSeq(actWork *xreg)
{
	if(xreg->dx == xreg->work[1]){
		brdsys[xreg->work[0]].heart_move = 0;
		xreg->move = DummyActMove;
	}else
		xreg->dx += xreg->work[2];
}

//----------------------------------------------------------
//	ﾊｰﾄｱｲｺﾝのY座標を再セット
//----------------------------------------------------------
void HeartIconYposSet(void)
{
	int i;
	for(i = 0; i < BREEDER_MAX; i++)
		ActWork[brdsys[i].heart_actno].y = HeartIconYPos[BrdSort[i]];
}

//----------------------------------------------------------
//	画面下2つのﾊｰﾄｱｲｺﾝを画面外に退避させたり戻したり
// 引数: 0 = 画面内に戻す	1 = 画面外に退避させる
//----------------------------------------------------------
void HearIconEva(u8 evac)
{
	int i;
	
	for(i = 0; i < BREEDER_MAX; i++){
		if(BrdSort[i] > 1){
			if(evac == 0)
				ActWork[brdsys[i].heart_actno].x = HEARTICON_X;	//画面内へ
			else
				ActWork[brdsys[i].heart_actno].x = 256;	//画面外へ
		}
	}
}

//=========================================================================
//	「つぎ？ばん」のアイコンをCell&Pal&AddActor
//=========================================================================
void SortIconAllSet(void)
{
	int i;
	
	ObjPalSet((PalData*)&SortIconPal);
	for(i = 0; i < BREEDER_MAX; i++){
		DecordCellSet((CellData *)&SortIconCell[i]);
		brdsys[i].sorticon_actno = AddActor(&SortIconHeader[i], SORTICON_X, 
			SortIconYPos[BrdSort[i]], 0);
		SetActOamPat(&ActWork[brdsys[i].sorticon_actno], &SortIconPat);
		ActWork[brdsys[i].sorticon_actno].banish = 1;
	}
}

//=========================================================================
//	ボルテージアイコンアクターのｾｯﾄ
//=========================================================================
#define VOLTAGE_GAUGE_X		30//27
#define VOLTAGE_GAUGE_Y		44	//16
#define VOLTAGE_ICON_X		(VOLTAGE_GAUGE_X - 16)
#define VOLTAGE_ICON_Y		VOLTAGE_GAUGE_Y
void VoltageIconActorSet(void)
{
//	u8 actno;
	u8 gauge1;	//, gauge2;
	
	//-- 下のゲージ部分 --//
	DecordCellSet((CellData*)&VoltageGaugeCell);
//	DecordPalSet((PalData*)&VoltageGaugePal);
	ObjPalSet((PalData*)&VoltageGaugePal);
	gauge1 = AddActor(&VoltageGaugeHeader, VOLTAGE_GAUGE_X, VOLTAGE_GAUGE_Y, 1);
//	gauge2 = AddActor(&VoltageGaugeSubHeader, 
//		VOLTAGE_GAUGE_X+32+4, VOLTAGE_GAUGE_Y,1);	//ゲージ右端部分
//	ActWork[gauge2].oamData.CharNo += 32;
	ActWork[gauge1].banish = 1;
//	ActWork[gauge2].banish = 1;
	consys->volgauge_act = gauge1;
//	consys->volgaugesub_act = gauge2;
}

//----------------------------------------------------------
//	ﾎﾞﾙﾃｰｼﾞｱｲｺﾝをﾃﾝｼｮﾝによってｱﾆﾒを変更する
//	0=平常	1以上=笑顔	-1以下=泣き顔
//----------------------------------------------------------
void VoltageIconAnmSet(s8 tensyon)
{
}


//=========================================================================
//	順位ｱｲｺﾝをｾﾙｾｯﾄ&ﾊﾟﾙｾｯﾄ&AddActorする(banishはﾃﾞﾌｫﾙﾄでONになる)
//=========================================================================
void JyunniIconAllDataSet(void)
{
	u8 i, actno;
	
	DecordCellSet((CellData*)&JyunniIconCell);
	for(i = 0; i < BREEDER_MAX; i++)
		DecordPalSet((PalData*)&JyunniIconPal[i]);
	for(i = 0; i < BREEDER_MAX; i++)
	{
		actno = AddActor(&JyunniIconHeader[i], 
			C_JyunniIconPos[i][0], C_JyunniIconPos[i][1], 5);
		ActWork[actno].banish = 1;
		ActWork[actno].work[0] = i;
		consys->jyunni_icon[i] = actno;
	}
}

//=========================================================================
//	順位を表示(変更)するｴﾌｪｸﾄを出す
//=========================================================================
void JyunniIconPut(void)
{
	int i;
	for(i = 0; i < BREEDER_MAX; i++)
		ActWork[consys->jyunni_icon[i]].move = JyunniIconEffectInitSeq;
}

//----------------------------------------------------------
//	ｴﾌｪｸﾄ終了ﾁｪｯｸ
// 戻り値: 0 = まだｴﾌｪｸﾄ中     1 = ｴﾌｪｸﾄ終了
//----------------------------------------------------------
u8 JyunniIconEffectEndCheck(void)
{
	int i;
	for(i = 0; i < BREEDER_MAX; i++)
	{
		if(ActWork[consys->jyunni_icon[i]].move != DummyActMove)
			break;
	}
	if(i == BREEDER_MAX)
		return 1;
	return 0;
}

//=========================================================================
//	順位ｱｲｺﾝのアクターシーケンス
//=========================================================================
static void JyunniIconEffectInitSeq(actWork *Xreg)
{
	Xreg->oamData.AffineMode = 1;
	AffineNumSet(Xreg);
	if(Xreg->banish == 1)
		Xreg->move = JyunniIcon_StoB_Init;
	else
	{
		ActAffAnmChg(Xreg, 1);
		Xreg->move = JyunniIcon_BtoS_Init;
//		SePlay(SE_JYUNI);
	}
}

//-- 通常状態から小さく --//
static void JyunniIcon_BtoS_Init(actWork *Xreg)
{
	if(Xreg->affend_sw == 0)
		return;
		
	Xreg->banish = 1;
	Xreg->move = JyunniIcon_StoB_Init;
}

//-- 小さい状態から通常状態に --//
static void JyunniIcon_StoB_Init(actWork *Xreg)
{
	Xreg->banish = 0;
	ActAnmChg(Xreg, apsys[Xreg->work[0]].ranking);
	ActAffAnmChg(Xreg, 2);
	Xreg->move = JyunniIcon_StoB;
	SePlay(SE_JYUNI);
}

static void JyunniIcon_StoB(actWork *Xreg)
{
	if(Xreg->affend_sw == 0)
		return;
	
	AffineDelActor(Xreg);
	Xreg->oamData.AffineMode = 0;
	Xreg->move = DummyActMove;
}


//=========================================================================
//	ｺﾝﾎﾞ1実行時の目ｱｲｺﾝ ｶﾗｰ明滅処理
//=========================================================================
//----------------------------------------------------------
//	初期設定
//----------------------------------------------------------
void EyeColorTaskSet(void)
{
	u8 id, i;
	
	id = AddTask(EyeColorFadeSeq, 30);
	consys->eye_color = id;
	for(i = 0; i < BREEDER_MAX; i++)
		TaskTable[id].work[i*4] = 0xff;
}

//----------------------------------------------------------
//	ﾌｪｰﾄﾞ開始ﾘｸｴｽﾄ関数
//----------------------------------------------------------
void EyeColorFadeStart(u8 brd_pos)
{
	TaskTable[consys->eye_color].work[brd_pos*4] = 0;
	TaskTable[consys->eye_color].work[brd_pos*4+1] = 0;
}

//----------------------------------------------------------
//	ﾌｪｰﾄﾞ停止ﾘｸｴｽﾄ関数
//----------------------------------------------------------
void EyeColorFadeStop(u8 brd_pos)
{
	u8 id;
	
	id = AddTask(EyeColorFadeStopMain, 31);
	TaskTable[id].work[0] = brd_pos;
}

static void EyeColorFadeStopMain(u8 id)
{
	u8 brd_pos;
	
	brd_pos = TaskTable[id].work[0];
	//ﾌｪｰﾄﾞのevyが0になった時か、元々ﾌｪｰﾄﾞが停止状態ならｽﾄｯﾌﾟしてﾀｽｸDel
	if(TaskTable[consys->eye_color].work[brd_pos*4] == 0 ||
		TaskTable[consys->eye_color].work[brd_pos*4] == 0xff)
	{
		TaskTable[consys->eye_color].work[brd_pos*4] = 0xff;
		TaskTable[consys->eye_color].work[brd_pos*4+1] = 0;
		SoftFade(16*(5+consys->nowturn_sort[brd_pos]) + 6, 2, 0, 0x4bff);
		DelTask(id);
	}
}

//----------------------------------------------------------
//	メインシーケンス
//----------------------------------------------------------
static void EyeColorFadeSeq(u8 id)
{
	u8 base, i;
	
	for(i = 0; i < BREEDER_MAX; i++)
	{
		base = i * 4;
		if(TaskTable[id].work[base] != 0xff)
		{
			if(TaskTable[id].work[base+1] == 0)
				TaskTable[id].work[base]++;
			else
				TaskTable[id].work[base]--;
			if(TaskTable[id].work[base] == 16 || TaskTable[id].work[base] == 0)
				TaskTable[id].work[base+1] ^= 1;
			SoftFade(16*(5+consys->nowturn_sort[i]) + 6, 2, TaskTable[id].work[base], 0x4bff);
		}
	}
}

//=========================================================================
//	ｱﾋﾟｰﾙﾒｰﾀｰMax時のﾒｰﾀｰ点滅処理
//=========================================================================
//----------------------------------------------------------
//	初期セット
//----------------------------------------------------------
void MeterColorTaskSet(void)
{
	u8 id, i;
	
	id = AddTask(MeterColorFadeSeq, 30);
	consys->meter_color = id;
	for(i = 0; i < BREEDER_MAX; i++)
		MeterColorFlagClear(i);
}

//----------------------------------------------------------
//	ｹﾞｰｼﾞの点滅ﾌﾗｸﾞをｸﾘｱする
//----------------------------------------------------------
void MeterColorFlagClear(u8 brd_pos)
{
	TaskTable[consys->meter_color].work[brd_pos*4] = 0xff;
	TaskTable[consys->meter_color].work[brd_pos*4+1] = 0;
}

void MeterColorClearAll(void)
{
	u8 i;
	for(i = 0; i < BREEDER_MAX; i++)
		MeterDefaultColorSet(i);
}

static void MeterDefaultColorSet(u8 brd_pos)
{
	MeterColorFlagClear(brd_pos);
	DIV_DMACOPY(3, &PaletteWork[16*(5+brd_pos) + 0xa],
		&PaletteWorkTrans[16*(5+brd_pos) + 0xa], 2,16);
	DIV_DMACOPY(3, &PaletteWork[16*(5+brd_pos) + 0xc+brd_pos],
		&PaletteWorkTrans[16*(5+brd_pos) + 0xc+brd_pos], 2,16);
}

//----------------------------------------------------------
//	ﾒｰﾀｰ点滅 開始、終了ﾁｪｯｸ処理
//----------------------------------------------------------
static void MeterColorFadeCheck(u8 brd_pos)
{
#if 1	// 2002.06.28(金)
	return;
#else
	u8 id, base;
	
	id = consys->meter_color;
	base = brd_pos*4;
	if(apsys[brd_pos].ap > 80 && TaskTable[id].work[base] == 0xff)
	{
		TaskTable[id].work[base] = 0;
		TaskTable[id].work[base+1] = 0;
	}
	else if(apsys[brd_pos].ap <= 80 && TaskTable[id].work[base] != 0xff)
	{
		MeterDefaultColorSet(brd_pos);
	}
#endif
}

//----------------------------------------------------------
//	点滅処理 メインシーケンス
//----------------------------------------------------------
static void MeterColorFadeSeq(u8 id)
{
	u8 i, base;
	
	for(i = 0; i < BREEDER_MAX; i++)
	{
		base = i*4;
		if(TaskTable[id].work[base] != 0xff)
		{
			if(++TaskTable[id].work[base+2] < 3)
				continue;
			TaskTable[id].work[base+2] = 0;

			if(TaskTable[id].work[base+1] == 0)
				TaskTable[id].work[base]++;
			else
				TaskTable[id].work[base]--;
			if(TaskTable[id].work[base] == 16 || TaskTable[id].work[base] == 0)
				TaskTable[id].work[base+1] ^= 1;
			SoftFade(16*(5+i) + 0xa, 1, TaskTable[id].work[base], 0x4bff);
			SoftFade(16*(5+i) + 0xc+i, 1, TaskTable[id].work[base], 0x4bff);
		}
	}
}

//=========================================================================
//	ｱﾋﾟｰﾙ効果でAPが減った、増えたでｶﾗｰ点滅させる
// *color_flg = 各ﾌﾞﾘｰﾀﾞｰに対して、どのｶﾗｰ点滅処理をするか
//				0:何もしない	1:光るく点滅	2:暗く点滅
//=========================================================================
u8 AppealKoukaColorTaskSet(u8 *color_flg)
{
	u8 id, i;
	u8 base;
	
	id = AddTask(AppealKoukaColorSeq, 10);
	for(i = 0; i < BREEDER_MAX; i++)
	{
		base = i*4;
		TaskTable[id].work[base] = color_flg[i];
		if(color_flg[i] != 0)
			brdsys[i].win_eff = 1;
	}
	return id;
}

static const u16 WinBlackDicColor[] = {
	0x0073, 0x19e6, 0x0253, 0x4cc4
};
static const u16 WinWhiteDicColor[] = {
	0x001f, 0x03e0, 0x3ff, 0x7c00
};
static void AppealKoukaColorSeq(u8 id)
{
	u8 base, evy, counter;
	u8 i, direction, temp;
	u8 loop;
	
	for(loop = 0; loop < BREEDER_MAX; loop++)
	{
		i = BrdSort[loop];
		
		base = i*4;
		direction = TaskTable[id].work[base];
		if(direction == 0)
			continue;
		counter = TaskTable[id].work[base+1];
		evy = TaskTable[id].work[base+2];
		temp = TaskTable[id].work[base+3];
		if(direction == 1)
		{
			if(++temp == 1)
			{
				temp = 0;
				SoftFade(16*(5+i) + 1, 3, evy, 0x7fff);//WinWhiteDicColor[i]);
				if(evy == 0 && counter == 4)
					TaskTable[id].work[base] = 0;
				else
				{
					evy += 2;
					if(evy >= 14)
					{
						evy = 0;
						counter++;
					}
				}
			}
		}
		else if(direction == 2 || direction == 4)
		{
			if(++temp == 3)
			{
				temp = 0;
				SoftFade(16*(5+i) + 1, 3, evy, WinBlackDicColor[i]);
				if(evy == 0 && counter == 2)
					TaskTable[id].work[base] = 0;
				else
				{
					if(++evy == 14)
					{
						evy = 0;
						counter++;
						if(direction == 4 && counter == 1)
						{
							SoftFade(16*(9+i)+2, 1, 4, 0);
							SoftFade(16*(9+i)+5, 1, 4, 0);
						}
					}
				}
			}
		}
		else if(direction == 3)	//1回休みの処理
		{
			if(++temp == 12)
			{
				temp = 0;
				SoftFade(16*(5+i) + 1, 3, evy , 0);
				if(++evy == 5)
				{
					DIV_DMACOPY(3, PaletteWorkTrans[16*(5+i)+1], PaletteWork[16*(5+i)+1],
						6, 16);
					TaskTable[id].work[base] = 0;
				}
			}
		}
		TaskTable[id].work[base+1] = counter;
		TaskTable[id].work[base+2] = evy;
		TaskTable[id].work[base+3] = temp;
	}
	for(i = 0; i < BREEDER_MAX; i++)
	{
		if(TaskTable[id].work[i*4] != 0)
			break;
	}
	if(i == BREEDER_MAX)
	{
		for(i = 0; i < BREEDER_MAX; i++)
			brdsys[i].win_eff = 0;
		DelTask(id);
//		TaskTable[id].TaskAdrs = DummyTaskSeq;
	}
}

//=========================================================================
//	「フシギダネの　アピールこうか！」のﾒｯｾｰｼﾞを出す
// put_flg = 0:ﾒｯｾｰｼﾞは出さない		1:ﾒｯｾｰｼﾞを出す
//=========================================================================
void AppealPutMsgSet(u8 put_flg)
{
	if(put_flg)
	{
	//	TalkMsgSet(&FightMsg, wazaput_msg, CON_MSG, CON_TALKMSG_X, CON_TALKMSG_Y);
		//MsgPrint(&FightMsg, appealkouka_msg, CON_MSG, CON_TALKMSG_X, CON_TALKMSG_Y);
		consys->appeal_msg = 1;
	}
//	else	技効果前のWazaCalcFlagCheckで呼ばれて、その後効果で呼ばれる事があるので
//		consys->appeal_msg = 0;	あえて0はｾｯﾄしない
}

//=========================================================================
//	ｺﾝﾎﾞ状態をﾁｪｯｸして点滅を消したりセットしたりする
//=========================================================================
void EyeColorStatusCheckSet(u8 brd)
{
//	if(ConWazaTbl[apsys[brd].use_waza].combo1 != 0)
	if(apsys[brd].combo1_flg)
		EyeColorFadeStart(brd);
	else
		EyeColorFadeStop(brd);
}


//=========================================================================
//	各ﾌﾞﾘｰﾀﾞｰのｳｨﾝﾄﾞｳをOBJに落としこむ
//　戻り値: actno
//=========================================================================
u8 BreederWindowObjSet(u8 brd)
{
	u8 actno, actno2;
	u8 xpos, ypos;
	vu8 dma_wait;
	
	xpos = 184;	//0xa8;
	ypos = 0x20 + BrdSort[brd] * 40;
	DecordCellSet((CellData*)&BrdWinCell[brd]);
	ObjPalSet((PalData*)&BrdWinPal[brd]);
	actno = AddActor(&BrdWinActHeader[brd], xpos, ypos, C_POKE1PRI-1);
	actno2 = AddActor(&BrdWinActHeader[brd], xpos+64, ypos, C_POKE1PRI-1);
	ActWork[actno2].oamData.CharNo += 64;
	BG_to_OBJ(0, 3, (void*)CHAR_BASE0_ADDR, 
			(void*)(SCREEN_BASE28_ADDR + 0x13*2 + 0x20*5*BrdSort[brd]*2),
			(u8*)((ActWork[actno].oamData.CharNo * 32) + OBJ_MODE0_VRAM));
	BG_to_OBJ(0, 3, (void*)CHAR_BASE0_ADDR, 
			(void*)(SCREEN_BASE28_ADDR + (0x13+8)*2 + 0x20*5*BrdSort[brd]*2),
			(u8*)((ActWork[actno2].oamData.CharNo * 32) + OBJ_MODE0_VRAM));
	DIV_DMACLEAR(3, 0, (ActWork[actno].oamData.CharNo+8*5) * 32 + OBJ_MODE0_VRAM, 3*8*32, 32);
	dma_wait = 0;	dma_wait = 0;
	DIV_DMACLEAR(3, 0, (ActWork[actno2].oamData.CharNo+8*5) * 32 + OBJ_MODE0_VRAM, 3*8*32, 32);
	ActWork[actno].work[0] = actno2;
	ActWork[actno2].work[0] = actno;
	ActWork[actno].work[1] = brd;
	ActWork[actno2].work[1] = brd;
	return actno;
}

//----------------------------------------------------------
//	ｳｨﾝﾄﾞｳをOBJに落とす時にｾｯﾄした、ｾﾙ、ﾊﾟﾚｯﾄ、ｱｸﾀｰ全てをDELする
// actno = actno 0,1 どちらでもいい(ｾﾙ、ﾊﾟﾚｯﾄ共に同じものを使用しているので)
//----------------------------------------------------------
void BrdWinObjDel(u8 actno)
{
	u8 actno2;
	
	actno2 = ActWork[actno].work[0];
	AffineDelActor(&ActWork[actno2]);
	DelActor(&ActWork[actno2]);
	AllDelActor(&ActWork[actno]);
}

void BrdWinAlphaRegSet(void)
{
	*(vu16*)REG_BLDCNT = BLD_A_BLEND_MODE | BLD_2ND_ALL;
	*(vu16*)REG_BLDALPHA = 7 | (9<<8);	//5 | (11<<8);
}
void BrdWinAlphaRegReset(void)
{
	*(vu16*)REG_BLDCNT = 0;
	*(vu16*)REG_BLDALPHA = 0;
}

//----------------------------------------------------------
//	se_flg = 0:技を出すときのSE		1:アピール効果の時のSE
//----------------------------------------------------------
void BrdWinWazaPutEffSet(u8 actno, u8 se_flg)
{
	u8 actno2;
	
	BrdWinAlphaRegSet();

	brdsys[ActWork[actno].work[1]].win_eff = 1;
	actno2 = ActWork[actno].work[0];
	ActAffAnmChg(&ActWork[actno], 1);
	ActAffAnmChg(&ActWork[actno2], 1);
	ActWork[actno].move = BrdWinAffEndSeq;
	ActWork[actno2].move = DummyActMove;
	if(se_flg == 0)
		SePlay(SE_C_PIKON);
	else
		SePlay(SE_PC_LOGIN);
}

static void BrdWinAffEndSeq(actWork *Xreg)
{
	u8 actno2;
	
	if(Xreg->affend_sw == 0)
		return;
	
	actno2 = Xreg->work[0];
	if(ActWork[actno2].affend_sw)
	{
		//半透明ﾚｼﾞｽﾀを今ｵﾌしてしまうと一瞬半透明でないのが見えてしまうので
		Xreg->banish = 1;
		ActWork[actno2].banish = 1;
		Xreg->move = BrdWinRegClearEnd;
	}
}

static void BrdWinRegClearEnd(actWork *Xreg)
{
	brdsys[Xreg->work[1]].win_eff = 0;
//	BrdWinObjDel(ActWork[actno2].work[0]);
	BrdWinObjDel(Xreg->work[0]);//↑←どっちでもOK
	BrdWinAlphaRegReset();
}


//=========================================================================
//	技を出すﾌﾞﾘｰﾀﾞｰのｳｨﾝﾄﾞｳを明るくする(照明を落とす前の色に戻す)
// houkou : 0=ｳｨﾝﾄﾞｳ明るく     1=ｳｨﾝﾄﾞｳ暗く(照明を落とした時の色)
//=========================================================================
void WazaPutBrdWinLight(u8 brd, u8 houkou)
{
	brdsys[brd].win_eff = 0;
}



//=========================================================================
//	親の名前と現在のﾄｰﾀﾙAPを切り替えて表示する
//			※デバッグ用
//=========================================================================
void DebugAPPut(void)
{
	u8 i;
	
	UserWork[DEBUG_AP] ^= 1;

	if(UserWork[DEBUG_AP] == 0)
	{
		for(i = 0; i < BREEDER_MAX; i++)
			FontScrnBoxFill(&FightMsg, MSG_CLEAR_NO, C_PokeNamePos[i][0],
				C_PokeNamePos[i][1], C_BreederPos[i][0]+5, C_BreederPos[i][1]+1);
		PutPlayerInfo();
		PlayerInfoCopy();
	}
	else
		DebugAPUpdatingCheckPut();
}

//----------------------------------------------------------
//	AP表示ﾌﾗｸﾞをﾁｪｯｸしてAPの値を更新
//----------------------------------------------------------
void DebugAPUpdatingCheckPut(void)
{
	u8 i;
	u8 buff[8];
	u8 count = 0;
	s16 total_ap, ap;

	if(UserWork[DEBUG_AP] == 0)
		return;

	for(i = 0; i < BREEDER_MAX; i++)
		FontScrnBoxFill(&FightMsg, MSG_CLEAR_NO, C_PokeNamePos[i][0],
			C_PokeNamePos[i][1], C_BreederPos[i][0]+5, C_BreederPos[i][1]+1);
		
	//ﾄｰﾀﾙAP
	for(i = 0; i < BREEDER_MAX; i++)
	{
		total_ap = apsys[i].total_ap;
		if(total_ap < 0)
		{
			total_ap = abs(total_ap);
			buff[0] = bou_;
			count++;
		}
		PM_NumMsgSet(&buff[count], total_ap, NUM_MODE_LEFT, 4);
		MsgPrint(&FightMsg, buff, CON_TRAINER + CON_TRAINER_LEN*BrdSort[i],
			C_BreederPos[BrdSort[i]][0], C_BreederPos[BrdSort[i]][1]);
		count = 0;
	}
	//AP
	for(i = 0; i < BREEDER_MAX; i++)
	{
		ap = apsys[i].ap;
		if(ap < 0)
		{
			ap = abs(ap);
			buff[0] = bou_;
			count++;
		}
		PM_NumMsgSet(&buff[count], ap, NUM_MODE_LEFT, 4);
		MsgPrint(&FightMsg, buff, CON_POKENAME + CON_POKE_LEN * BrdSort[i], 
			C_PokeNamePos[BrdSort[i]][0], C_PokeNamePos[BrdSort[i]][1]);
		count = 0;
	}
	PlayerInfoCopy();
}

void sort(int a[], int n)
{
	int i,j,t;

	for(i = 0; i < n - 1; i++){
		for(j = n - 1; j > i; j--){
			if(a[j-1] > a[j]){
				t = a[j];
				a[j] = a[j-1];
				a[j-1] = t;
			}
		}
	}
}

//=========================================================================
//	現在のﾄｰﾀﾙAP値、1次審査の順位を基準にしてﾌﾞﾘｰﾀﾞｰﾃﾞｰﾀの並び替えを行う
//	引数：sort_type = 0:1次審査の順位を基準に並び替え	1:ﾄｰﾀﾙAPを基準に並び替え
//=========================================================================
void BreederDataSort(u8 sort_type)
{
//	s16 now;
//	u8 no,douritu;
	int i,s,t;
	u8 rank;
	u8 tempSort[BREEDER_MAX];
	u16 random[BREEDER_MAX];
	u8 temp;
	
	memset(random, 0, sizeof(random));
	for(i = 0; i < BREEDER_MAX; i++){	//各ﾌﾞﾘｰﾀﾞｰのﾗﾝﾀﾞﾑ値を取得
		random[i] = pp_rand();
		for(t = 0; t < i; t++){
			if(random[i] == random[t]){
				i--;	//ﾗﾝﾀﾞﾑ値がかぶったら もう一回ﾗﾝﾀﾞﾑを引きなおす
				break;
			}
		}
	}
	
	if(sort_type == 0){
		/*-------------------------------------------------
		BPを基準としたｿｰﾄの場合は、通信受付など2次審査画面以外の場所からも
		呼ばれる可能性があるのでUserWork領域へのアクセスはしないこと！！
		---------------------------------------------------*/
		
		//BP値が高い順にﾌﾞﾘｰﾀﾞｰNoを並び替え
		for(i = 0; i < BREEDER_MAX; i++){
			BrdSort[i] = i;
			for(s = 0; s < i; s++){
				//if(ContBP[BrdSort[s]] <= ContBP[i]){
				if(ContBP[BrdSort[s]] < ContBP[i] || 
					(ContBP[BrdSort[s]] == ContBP[i] && random[BrdSort[s]] < random[i]))
				{
					for(t = i; t > s; t--)
						BrdSort[t] = BrdSort[t - 1];
					BrdSort[s] = i;
					//BrdSort[i] = s;
					break;
				}
			}
			if(s == i)
				BrdSort[s] = i;
				//BrdSort[i] = s;
		}
		memcpy(tempSort, BrdSort, sizeof(tempSort));
		for(i = 0; i < BREEDER_MAX; i++)
			BrdSort[tempSort[i]] = i;
	}
	else
	{//ﾄｰﾀﾙAP値が高い順に並び替え
		
		//ﾗﾝｷﾝｸﾞ順に並び替え
		memset(tempSort, 0xff, sizeof(tempSort));
		for(i = 0; i < BREEDER_MAX; i++){	//ランク順にﾃﾞｰﾀをｾｯﾄ
			rank = apsys[i].ranking;
			for( ; ; rank++){
				if(tempSort[rank] == 0xff){
					tempSort[rank] = i;
					BrdSort[i] = rank;
					break;
				}
			}
		}
		//ﾗﾝｷﾝｸﾞが同率のものはﾗﾝﾀﾞﾑ値を見てｿｰﾄしなおす
		for(i = 0; i < BREEDER_MAX-1; i++){
			for(s = BREEDER_MAX-1; s > i; s--){
				if(apsys[s-1].ranking == apsys[s].ranking && 
					BrdSort[s-1] < BrdSort[s] && random[s-1] < random[s])
				{
					temp = BrdSort[s];
					BrdSort[s] = BrdSort[s-1];
					BrdSort[s-1] = temp;
				}
			}
		}
	}
}



//=========================================================================
//	画面右のプレイヤー情報を変更された並び順に書き直す(下のBGｳｨﾝﾄﾞｳも)
//=========================================================================
#define WIN_Y_LEN	5	//ｳｨﾝﾄﾞｳの縦のｷｬﾗ数
void ReWritePlayerInfo(void)
{
	int i;	//, t;
	
	for(i = 0; i < BREEDER_MAX; i++){
		PaletteWorkSet((void*)&UserWork[CONT_PALETTE_ADRS + 16*(5+i)*2], 
			16*(5+BrdSort[i]), 0x20);
	}
	PutPlayerInfo();
}


//=========================================================================
//	技計算
//=========================================================================
void ContestWazaCalc(u8 nowbrd)	//, ContestCalcWork *pccw)
{
	u16 wazano;
	u8 apno;
	int i;
	u8 combo;
	u8 combo_level;
	u8 rnd;
	
	apsys[nowbrd].ap = 0;
	apsys[nowbrd].found_ap = 0;
//	memset(pccw, 0, sizeof(ContestCalcWork));
	if(WazaCalcFlagCheck(nowbrd) == 0){
//		pccw->yasumi = 1;
		return;
	}
	
	wazano = apsys[nowbrd].use_waza;
	apno = ConWazaTbl[wazano].apno;

	apsys[nowbrd].con_type = ConWazaTbl[wazano].con_type;
	
	if(apsys[nowbrd].use_waza == apsys[nowbrd].use_wazaold && apsys[nowbrd].use_waza != 0){	//ペナルティﾁｪｯｸ
		apsys[nowbrd].penalty = 1;
		apsys[nowbrd].conti_count++;
		combo = 0;
	}else{
//		if(apsys[nowbrd].combo1_invalid == 0)
//			combo = ComboCheck(apsys[nowbrd].use_wazaold, apsys[nowbrd].use_waza);
//		else
			combo = 0;
		apsys[nowbrd].conti_count = 0;
	}
	combo++;	//0オリジンなので基本APに対して掛け算するのに1を足しておく
	apsys[nowbrd].found_ap = WazaKoukaTbl[apno].ap * combo;
	apsys[nowbrd].ap = apsys[nowbrd].found_ap;// + apsys[nowbrd].bonus;
	
	CONWAZA->bougai = WazaKoukaTbl[apno].bougai;
	CONWAZA->bougai_calc = CONWAZA->bougai;
	CONWAZA->nowbrd = nowbrd;

	for(i = 0; i < BREEDER_MAX; i++){
		apsys[i].bougai = 0;
		CONWAZA->nowwaza_target[i] = 0;
	}

	if(apsys[nowbrd].combo1_flg)
	{	//ｺﾝﾎﾞ1が発生しててｺﾝﾎﾞが成立しないならここでcombo1ﾌﾗｸﾞを落す
		//(次の技エフェクトを出すのと同時に目の点滅を消すため)
		if(ComboCheck(apsys[nowbrd].use_wazaold, apsys[nowbrd].use_waza) == 0)
			apsys[nowbrd].combo1_flg = 0;
	}
	
	ConWazaSeqTbl2[apno]();		//技効果計算
								//※技効果発生後に必要な計算はここ以降に書いていく
	//妨害などが終わってから足すように変更	2002.08.24(土)
	if(apsys[nowbrd].bonus_flg == 1)	//このﾀｰﾝで発生したﾎﾞｰﾅｽは加算しない
		apsys[nowbrd].ap += apsys[nowbrd].bonus - BONUS_POINT;
	else{
		if(apsys[nowbrd].bonus3bai)
			apsys[nowbrd].ap += apsys[nowbrd].bonus * 3;
		else
			apsys[nowbrd].ap += apsys[nowbrd].bonus;
	}

	//----------------------------------------------------------
	//	追加計算式 2002.08.08(木)
	//----------------------------------------------------------
	//-- コンボ計算 --//
	apsys[nowbrd].combo_level = 0;
	apsys[nowbrd].combo_hassei = 0;
	if(Combo1TermCheck(nowbrd)){
		combo_level = ComboCheck(apsys[nowbrd].use_wazaold, apsys[nowbrd].use_waza);
		if(combo_level && apsys[nowbrd].combo1_flg){	//ｺﾝﾎﾞ成立
			apsys[nowbrd].combo_level = combo_level;
			apsys[nowbrd].combo_hassei = 1;
			apsys[nowbrd].combo1_flg = 0;
			apsys[nowbrd].comboAP = apsys[nowbrd].found_ap * apsys[nowbrd].combo_level;
			apsys[nowbrd].combo_conti_flg = 1;
		}
		else if(ConWazaTbl[apsys[nowbrd].use_waza].combo1){	//ｺﾝﾎﾞ1発生
			apsys[nowbrd].combo1_flg = 1;
			apsys[nowbrd].combo_hassei = 1;
		}
		else{											//何も発生せず
			apsys[nowbrd].combo1_flg = 0;
		}
	}
	
	//-- ペナルティ計算 --//
	if(apsys[nowbrd].penalty){
		apsys[nowbrd].penaltyAP = (apsys[nowbrd].conti_count + 1) * 10;
	}
	
	//-- 緊張時の処理 --//
	if(apsys[nowbrd].miss_flg){
		apsys[nowbrd].combo1_flg = 0;
		apsys[nowbrd].ap = 0;
		apsys[nowbrd].found_ap = 0;
	}
	
	//-- テンション計算 --//
	ccw->tensyon_updown = TensyonCheck(apsys[nowbrd].use_waza);
	if(apsys[nowbrd].tensyon_up)
		ccw->tensyon_updown = TENSYON_GAUGE_UP;
	if(ccw->tensyon_updown > 0){
		if(consys->tensyon + ccw->tensyon_updown >= TENSYON_MAX)
			ccw->tensyonAdd = TENSYON_MAXPOINT;
		else
			ccw->tensyonAdd = TENSYON_POINT;
	}
	else
		ccw->tensyonAdd = 0;

	//-- 「へんしん」「なりきり」を使用した時に何番目のﾎﾟｹﾓﾝに化けるか --//
	rnd = pp_rand() % (BREEDER_MAX-1);
	for(i = 0; i < BREEDER_MAX; i++){
		if(i == nowbrd)
			continue;
		if(rnd == 0)
			break;
		else
			rnd--;
	}
	apsys[nowbrd].hensin_monsno = i;
}

//=========================================================================
//	技のアピール効果で発生した状態のメッセージ番号をセットする
//	メッセージを出すﾌﾞﾘｰﾀﾞｰ
//=========================================================================
void AppealKoukaMsgSet(u8 brdno, u8 msgid)
{
	apsys[brdno].msgid = msgid;
}

void AppealKoukaMsgSet2nd(u8 brdno, u8 msgid)
{
	apsys[brdno].msgid2nd = msgid;
}

//----------------------------------------------------------
//	妨害を受けた時のメッセージをセット
//		※妨害ダメージの威力によってメッセージが変わるもの
//	brdno = 妨害ﾀｰｹﾞｯﾄのﾌﾞﾘｰﾀﾞｰNo
//----------------------------------------------------------
void BougaiMsgSet(u8 brdno, u8 damage)
{
	if(damage >= 60)
		AppealKoukaMsgSet(brdno, BOUGAI60_MSG);
	else if(damage >= 40)
		AppealKoukaMsgSet(brdno, BOUGAI40_MSG);
	else if(damage >= 30)
		AppealKoukaMsgSet(brdno, BOUGAI30_MSG);
	else if(damage >= 20)
		AppealKoukaMsgSet(brdno, BOUGAI20_MSG);
	else if(damage >= 10)
		AppealKoukaMsgSet(brdno, BOUGAI10_MSG);
}

//=========================================================================
//	技を出した時のアピール効果メッセージのセット
//=========================================================================
void AppealMsgSet(u8 brd, u8 msgid)
{
	PM_strcpy(StrTempBuffer0, BreederParam[brd].nickname);
	PM_strcpy(StrTempBuffer1, WazaNameData[apsys[brd].use_waza]);
	if(ConWazaTbl[apsys[CONWAZA->nowbrd].use_waza].con_type == STYLE_CONTEST)
		PM_strcpy(StrTempBuffer2, mojimoji_msg);
	else if(ConWazaTbl[apsys[CONWAZA->nowbrd].use_waza].con_type==BEAUTIFUL_CONTEST)
		PM_strcpy(StrTempBuffer2, dokidoki_msg);
	else if(ConWazaTbl[apsys[CONWAZA->nowbrd].use_waza].con_type == CUTE_CONTEST)
		PM_strcpy(StrTempBuffer2, deredere_msg);
	else if(ConWazaTbl[apsys[CONWAZA->nowbrd].use_waza].con_type == CLEVER_CONTEST)
		PM_strcpy(StrTempBuffer2, orooro_msg);
	else
		PM_strcpy(StrTempBuffer2, bikubiku_msg);
	PM_MsgExpand(MsgExpandBuffer, AppealMsgTbl[msgid]);

	ContestTalkMsgClear();
	TalkMsgSet(&win[0], MsgExpandBuffer, CON_MSG, CON_TALKMSG_X, CON_TALKMSG_Y);
}

//=========================================================================
//	緊張状態になった時に緊張ﾌﾗｸﾞのｾｯﾄ、その他もろもろの処理
//=========================================================================
void KintyouFlgSet(u8 brd)
{
	apsys[brd].miss_flg = 1;
	apsys[brd].use_waza = 0;
//	apsys[brd].penalty = 1;		//次のﾀｰﾝでcombo1_invalidﾌﾗｸﾞをｾｯﾄするため
}

//=========================================================================
//	技を出す順番のｿｰﾄを行う
//=========================================================================
void ConWazaBrdSort(void)
{
	int i, s;
	u8 sort[BREEDER_MAX];
	u8 flg[BREEDER_MAX];
	u8 temp = 0;
	
	for(i = 0; i < BREEDER_MAX; i++){
		sort[i] = BrdSort[i];
		flg[i] = 0;
	}
	
	for(i = 0; i < BREEDER_MAX; i++){
		for(s = 0; s < BREEDER_MAX; s++){
			if(apsys[s].next_sort == i){	//技効果で順番が決まってるのを探す
				sort[s] = i;
				flg[s] = 1;		//このﾌﾞﾘｰﾀﾞｰのﾃﾞｰﾀはセットされた
				break;
			}
		}
		if(s == BREEDER_MAX){	//技効果で決まってるﾃﾞｰﾀはなかった
			//まだｾｯﾄされていないﾃﾞｰﾀで一番数字が若いのを探す
			for(s = 0; s < BREEDER_MAX; s++){
				if(flg[s] == 0 && apsys[s].next_sort == 0xff){
					temp = s;
					s++;
					break;
				}
			}
			for( ; s < BREEDER_MAX; s++){
				if(flg[s] == 0 && apsys[s].next_sort == 0xff){
					if(BrdSort[temp] > BrdSort[s])
						temp = s;
				}
			}
			sort[temp] = i;
			flg[temp] = 1;
		}
	}
	
	for(i = 0; i < BREEDER_MAX; i++){
		CONWAZA->Sort[i] = sort[i];
		//微妙
		apsys[i].next_sort = 0xff;
		apsys[i].nextsort_flg = 0;
		
		//技効果で順番が変わったらｳｨﾝﾄﾞｳの表示位置もそれに合わせるようにする
		BrdSort[i] = sort[i];
	}
}












//=========================================================================
//
//		審判のふきだしアイコンシーケンス
//												by matsuda 2002.04.18(木)
//=========================================================================
static void JudgeFukidasiSeq(actWork *xreg)
{
	if(xreg->work[1]++ < FUKIDASI_PUT_TIME)
		return;
	xreg->work[1] = 0;
	xreg->banish = 1;
	xreg->move = DummyActMove;
	consys->fukidasi_eff = 0;
}

//----------------------------------------------------------
//	ふきだし表示呼び出し
//----------------------------------------------------------
void JudgeFukidasiSet(u8 fukidasi_type)
{
	u8 actno;
	
	actno = consys->fukidasi_act;
	switch(fukidasi_type){
		case PENALTY_TYPE:
		case TENSYONDOWN_TYPE:
			ActWork[actno].oamData.CharNo = ActWork[actno].work[0];
			SePlay(SE_HAZURE);
			break;
		case COMBO1_TYPE:
			ActWork[actno].oamData.CharNo = ActWork[actno].work[0]+4*1;
			SePlay(SE_SEIKAI);
			break;
		case COMBO2_TYPE:
			ActWork[actno].oamData.CharNo = ActWork[actno].work[0]+4*2;
			SePlay(SE_SEIKAI);
			break;
		case TENSYONUP_TYPE:
			ActWork[actno].oamData.CharNo = ActWork[actno].work[0]+4*3;
			SePlay(SE_TK_WARPIN);
			break;
		case NEXTSORT_FAST_TYPE:
			ActWork[actno].oamData.CharNo = ActWork[actno].work[0]+4*3;
			SePlay(SE_TK_WARPIN);
			break;
		case NEXTSORT_LAST_TYPE:
			ActWork[actno].oamData.CharNo = ActWork[actno].work[0]+4*4;
			SePlay(SE_TK_WARPIN);
			break;
		case BONUS_TYPE:
			ActWork[actno].oamData.CharNo = ActWork[actno].work[0]+4*6;
			SePlay(SE_W215);
			break;
		case NEXTSORT_QUES_TYPE:
		default:
			ActWork[actno].oamData.CharNo = ActWork[actno].work[0]+4*5;
			SePlay(SE_TK_WARPIN);
			break;
	}
	ActWork[actno].work[1] = 0;
	ActWork[actno].banish = 0;
	ActWork[actno].move = JudgeFukidasiSeq;
	consys->fukidasi_eff = 1;
}



//=========================================================================
//	テンション数値表示
//=========================================================================
#define TENSYON_METER_MAX		5
#define TENSYON_METER_SCRN		0x3031
#define TENSYON_METER_CLR_SCRN	0x3030	//ｸﾘｱ用ｽｸﾘｰﾝﾃﾞｰﾀ
void TensyonNumPut(void)
{
	int i;
//	u16 scrn;
	u8 *adrs;
	
	for(i = 0; i < TENSYON_METER_MAX; i++){
		/*
		if(i < consys->tensyon)
			scrn = TENSYON_METER_SCRN;
		else
			scrn = TENSYON_METER_CLR_SCRN;
		*(vu16*)(SCREEN_BASE24_ADDR + (0x20*2 + 0x3 + i)*2) = scrn;
		*/
		if(i < consys->tensyon)
			adrs = (void*)excite2_pch_ADRS + 0x20*2;	//CHAR_BASE0_ADDR + 0x31*32;
		else
			adrs = (void*)excite2_pch_ADRS + 0x20*0;	//CHAR_BASE0_ADDR + 0x30*32;
		CpuCopy(adrs, OBJ_MODE0_VRAM + 
			((ActWork[consys->volgauge_act].oamData.CharNo+0x11+i) * 32), 32, 32);
		CpuCopy(adrs+32, OBJ_MODE0_VRAM + 
			((ActWork[consys->volgauge_act].oamData.CharNo+0x19+i) * 32), 32, 32);
		if(consys->tensyon >= TENSYON_MAX)
			TensyonMaxPalAnmSet();
	}
}

//-- 「テンション：」のﾒｯｾｰｼﾞ表示 --//
void TensyonMsgPut(void)
{
	u8 msgbuf[20];
	
	PM_strcpy(msgbuf, Tensyon_msg);
	MsgPrint(&FightMsg, msgbuf, CON_TENSYON_MSG, 0,0);
}

//----------------------------------------------------------
//	技のタイプがコンテストのタイプとあっているかﾁｪｯｸ
//----------------------------------------------------------
static const s8 ConTypeCheckTbl[][5] = {
//かっこいい、美しい、かわいい、賢い、たくましい
	{TENSYON_GAUGE_UP,0,-1,-1,0},	//かっこいい
	{0,TENSYON_GAUGE_UP,0,-1,-1,},	//美しい
	{-1,0,TENSYON_GAUGE_UP,0,-1},	//かわいい
	{-1,-1,0,TENSYON_GAUGE_UP,0},	//賢い
	{0,-1,-1,0,TENSYON_GAUGE_UP},	//たくましい
};
s8 TensyonCheck(u16 wazano)
{
	return ConTypeCheckTbl[ContestKind][ConWazaTbl[wazano].con_type];
}

//----------------------------------------------------------
//	テンションMax時のﾊﾟﾚｯﾄｱﾆﾒ制御タスクをｾｯﾄ
//----------------------------------------------------------
u8 TensyonMaxPalAnmSet(void)
{
	u8 id;
	
	id = AddTask(TensyonMaxPalAnmMain, 10);
	TaskTable[id].work[1] = 1;
	TaskTable[id].work[2] = ObjPalNumGet(VOLTAGEGAUGE_ID);
	return id;
}

#define TENSYON_PALANM_WAIT		0
static void TensyonMaxPalAnmMain(u8 id)
{
//	u8 add;
	
	if(TaskTable[id].work[0]++ == TENSYON_PALANM_WAIT){
		TaskTable[id].work[0] = 0;
		if(TaskTable[id].work[3] == 0)
			TaskTable[id].work[4]++;
		else
			TaskTable[id].work[4]--;
		SoftFade(16*16+16*TaskTable[id].work[2]+8, 1, TaskTable[id].work[4], 0x7fff);
		if(TaskTable[id].work[4] == 0 || TaskTable[id].work[4] == 16){
			TaskTable[id].work[3] ^= 1;
		//	if(TaskTable[id].work[4] == 0 && consys->tensyon < TENSYON_METER_MAX)
			if(consys->tensyon < TENSYON_METER_MAX){
				SoftFade(16*16+16*TaskTable[id].work[2]+8, 1, 0, 0x1f);
				DelTask(id);
			}
		}
	}
}

//----------------------------------------------------------
//	ボルテージゲージをスライドイン
//----------------------------------------------------------
#define VOLTAGE_GAUGE_OUT_DX	(-(VOLTAGE_GAUGE_X+40))	//ﾎﾞﾙﾃｰｼﾞｹﾞｰｼﾞ画面外座標
#define VOLTAGE_GAUGE_ADD_SLIDE_X	0x0680	//ｽﾗｲﾄﾞしてくる速度
void VoltageGaugeSlidIn(void)
{
	AddTask(VoltageGaugeSlidInTask, 10);
	ActWork[consys->volgauge_act].dx = VOLTAGE_GAUGE_OUT_DX;
//	ActWork[consys->voltage_act].dx = VOLTAGE_GAUGE_OUT_DX;
//	ActWork[consys->volgaugesub_act].dx = VOLTAGE_GAUGE_OUT_DX;
	ActWork[consys->volgauge_act].banish = 0;
//	ActWork[consys->voltage_act].banish = 0;
//	ActWork[consys->volgaugesub_act].banish = 0;
	consys->voltage_slide_eff = 1;
}

static void VoltageGaugeSlidInTask(u8 id)
{
//	actWork *kao, *gauge, *gauge_sub;
	actWork *gauge;
	
//	kao = &ActWork[consys->voltage_act];	//顔アイコン
	gauge = &ActWork[consys->volgauge_act];	//ゲージ部分
//	gauge_sub = &ActWork[consys->volgaugesub_act];	//ｹﾞｰｼﾞ右端
	TaskTable[id].work[10] += VOLTAGE_GAUGE_ADD_SLIDE_X;
	gauge->dx += TaskTable[id].work[10] >> 8;
	TaskTable[id].work[10] &= 0x00ff;
	if(gauge->dx > 0)
		gauge->dx = 0;
//	gauge->dx = kao->dx;
//	gauge_sub->dx = gauge->dx;
	if(gauge->dx == 0){
		consys->voltage_slide_eff = 0;
		DelTask(id);
	}
}

//----------------------------------------------------------
//	ボルテージゲージをスライドアウト
//----------------------------------------------------------
void VoltageGaugeSlidOut(void)
{
	if(ActWork[consys->volgauge_act].banish == 1){
		consys->voltage_slide_eff = 0;
		return;
	}
	
	AddTask(VoltageGaugeSlidOutTask, 10);
	ActWork[consys->volgauge_act].dx = 0;
//	ActWork[consys->voltage_act].dx = 0;
//	ActWork[consys->volgaugesub_act].dx = 0;
	consys->voltage_slide_eff = 1;
}

static void VoltageGaugeSlidOutTask(u8 id)
{
//	actWork *kao, *gauge, *gauge_sub;
	actWork *gauge;
	
//	kao = &ActWork[consys->voltage_act];	//顔アイコン
	gauge = &ActWork[consys->volgauge_act];	//ゲージ部分
//	gauge_sub = &ActWork[consys->volgaugesub_act];	//ｹﾞｰｼﾞ右端
	TaskTable[id].work[10] += VOLTAGE_GAUGE_ADD_SLIDE_X;
	gauge->dx -= TaskTable[id].work[10] >> 8;
	TaskTable[id].work[10] &= 0x00ff;
	if(gauge->dx < VOLTAGE_GAUGE_OUT_DX)
		gauge->dx = VOLTAGE_GAUGE_OUT_DX;
//	gauge->dx = kao->dx;
//	gauge_sub->dx = gauge->dx;
	if(gauge->dx == VOLTAGE_GAUGE_OUT_DX){
//		kao->banish = 1;
		gauge->banish = 1;
//		gauge_sub->banish = 1;
		consys->voltage_slide_eff = 0;
		DelTask(id);
	}
}

//----------------------------------------------------------
//	ﾎﾞﾙﾃｰｼﾞｹﾞｰｼﾞを、ｽﾗｲﾄﾞｲﾝ→wait→ｹﾞｰｼﾞ増減＆SE、とさせる
// 引数:flg = ﾃﾝｼｮﾝ上昇時は1、下降時は-1
//----------------------------------------------------------
#define VOLTAGE_SE_WAIT		20
void VoltageGaugeSlidPut(s8 flg)
{
	u8 id;
	
	id = AddTask(VoltageGaugeSlidPutTask, 5);
	TaskTable[id].work[0] = flg;
	consys->voltage_eff = 1;
}

static void VoltageGaugeSlidPutTask(u8 id)
{
	switch(TaskTable[id].work[10])
	{
		case 0:
			VoltageGaugeSlidIn();
			TaskTable[id].work[10]++;
			break;
		case 1:
			if(consys->voltage_slide_eff == 0){
				VoltageIconAnmSet(TaskTable[id].work[0]);
				TaskTable[id].work[10]++;
			}
			break;
		case 2:
			if(TaskTable[id].work[11]++ > VOLTAGE_SE_WAIT){
				TaskTable[id].work[11] = 0;
				TensyonNumPut();
				consys->voltage_eff = 0;
				DelTask(id);
			}
			break;
	}
}

//----------------------------------------------------------
//	ボルテージゲージを表示させる(ｽﾗｲﾄﾞｴﾌｪｸﾄなし)
//----------------------------------------------------------
void VoltageGaugePut(void)
{
	ActWork[consys->volgauge_act].dx = 0;
//	ActWork[consys->voltage_act].dx = 0;
//	ActWork[consys->volgaugesub_act].dx = 0;
	ActWork[consys->volgauge_act].banish = 0;
//	ActWork[consys->voltage_act].banish = 0;
//	ActWork[consys->volgaugesub_act].banish = 0;
}

//----------------------------------------------------------
//	ボルテージゲージを消す(ｽﾗｲﾄﾞｴﾌｪｸﾄなし)
//----------------------------------------------------------
void VoltageGaugeBanish(void)
{
	ActWork[consys->volgauge_act].banish = 1;
//	ActWork[consys->voltage_act].banish = 1;
//	ActWork[consys->volgaugesub_act].banish = 1;
}

//=========================================================================
//	観客の2ﾊﾟﾀｰﾝｱﾆﾒを開始
//=========================================================================
#define KANKYAKU_ANM_WAIT	7
#define KANKYAKU_ANM_LOOP	9	//ｱﾆﾒを何往復させるか
void KankyakuAnmSet(void)
{
	AddTask(KankyakuAnmTask, 15);
	consys->kankyaku_anm = 1;
}

static void KankyakuAnmTask(u8 id)
{
	if(TaskTable[id].work[10]++ < KANKYAKU_ANM_WAIT)
		return;
	
	TaskTable[id].work[10] = 0;
	if(TaskTable[id].work[11] == 0){
		DIV_DMACOPY(3, &UserWork[CONT_KANKYAKU_ADRS + 0x1000], 
			CHAR_BASE0_ADDR+0x2000, 0x1000, 32);
	}
	else{
		DIV_DMACOPY(3, &UserWork[CONT_KANKYAKU_ADRS], 
			CHAR_BASE0_ADDR+0x2000, 0x1000, 32);
		TaskTable[id].work[12]++;
	}
	TaskTable[id].work[11] ^= 1;
	if(TaskTable[id].work[12] == KANKYAKU_ANM_LOOP){
		consys->kankyaku_anm = 0;
		DelTask(id);
	}
}

//----------------------------------------------------------
//	観客の盛り上がり(盛り下がり)時のｶﾗｰﾌｪｰﾄﾞを行なう
// flg = 1:盛り上がり	-1:盛り下がり
// muki = 1:元の色からﾌｪｰﾄﾞ後の色にしていく	-1:元の色に戻していく
//----------------------------------------------------------
#define KANKYAKU_COLOR_WAIT		0
#define KANKYAKU_COLOR_EVY		3
void KankyakuColorFadeSet(s8 flg, s8 muki)
{
	u16 color;
	u8 evy, end_evy;
	u8 id;
	
	id = AddTask(KankyakuColorFadeTask, 10);
	if(flg > 0){
		color = TENSYON_UP_COLOR;
		if(muki > 0){
			evy = 0;
			end_evy = KANKYAKU_COLOR_EVY*consys->tensyon;
		}
		else{
			evy = KANKYAKU_COLOR_EVY*consys->tensyon;
			end_evy = 0;
		}
	}
	else{
		color = TENSYON_DOWN_COLOR;
		if(muki > 0){
			evy = 0;
			end_evy = 12;
		}
		else{
			evy = 12;
			end_evy = 0;
		}
	}
	
	TaskTable[id].work[0] = color;
	TaskTable[id].work[1] = evy;
	TaskTable[id].work[2] = muki;
	TaskTable[id].work[3] = end_evy;
	
	consys->kankyaku_color_eff = 0;
}

static void KankyakuColorFadeTask(u8 id)
{
	if(TaskTable[id].work[10]++ < KANKYAKU_COLOR_WAIT)
		return;
	TaskTable[id].work[10] = 0;
	
	if(TaskTable[id].work[2] > 0)
		TaskTable[id].work[1]++;
	else
		TaskTable[id].work[1]--;
	
	SoftFade(16*1+1, 1, TaskTable[id].work[1], TaskTable[id].work[0]);
	SoftFade(16*1+0xa, 1, TaskTable[id].work[1], TaskTable[id].work[0]);

	if(TaskTable[id].work[1] == TaskTable[id].work[3]){
		DelTask(id);
		consys->kankyaku_color_eff = 0;
	}
}


//=========================================================================
//	「つぎ？ばん」の表示
// flg = 0:全員の表示をｸﾘｱする	1:「つぎ？ばん」の表示
//=========================================================================
void NextSortPrint(u8 flg)
{
	int t;

	 for(t = 0; t < BREEDER_MAX; t++){
		if(apsys[t].nextsort_flg && flg){
			CpuCopy(GetNextSortNumAdrs(t), (ActWork[brdsys[t].sorticon_actno].oamData.CharNo+2)*32 + OBJ_MODE0_VRAM, 0x20, 32);
			ActWork[brdsys[t].sorticon_actno].y = SortIconYPos[BrdSort[t]];
			ActWork[brdsys[t].sorticon_actno].banish = 0;
		}
		else
			ActWork[brdsys[t].sorticon_actno].banish = 1;
	}
}

//----------------------------------------------------------
//	「つぎ　ばん」の数字の部分のｱﾄﾞﾚｽを取得する
//----------------------------------------------------------
static u32 GetNextSortNumAdrs(u8 brd_pos)
{
	u32 adrs;
	
	if(apsys[brd_pos].nextsort_flg == 1)
		adrs = tugi_num_pch_ADRS + apsys[brd_pos].next_sort * 32;
	else
		adrs = tugi_num_pch_ADRS + 4*32;
	return adrs;
}

//=========================================================================
//	妨害アピールのﾀｰｹﾞｯﾄになったﾎﾟｹﾓﾝにアイコンを表示させる
//=========================================================================
void BougaiReceiveIconPut(void)
{
	u16 icon_scrn;
	u8 ypos;
	int brd;
	
	for(brd = 0; brd < BREEDER_MAX; brd++){
		if(CONWAZA->nowwaza_target[brd] == 0 || YasumiTurnCheck(brd))
			continue;
		
		ypos = 2 + (BrdSort[brd] * 5);
		icon_scrn = GetWazaKoukaIconScrn(brd, BOUGAI_TARGET_TYPE);
		*(vu16 *)(SCREEN_BASE24_ADDR + (0x20*ypos + 0x14)*2) = icon_scrn;
		*(vu16 *)(SCREEN_BASE24_ADDR + (0x20*ypos + 0x15)*2) = icon_scrn+1;
		*(vu16 *)(SCREEN_BASE24_ADDR + (0x20*(ypos+1) + 0x14)*2) = icon_scrn+0x10;
		*(vu16 *)(SCREEN_BASE24_ADDR + (0x20*(ypos+1) + 0x15)*2) = icon_scrn+0x11;
		SePlay(SE_C_PASI);
	}
}


//=========================================================================
//	コンボ1が有効な状態かチェック
//	戻り値: 1=有効	0=無効
//=========================================================================
u8 Combo1TermCheck(u8 brd)
{
	//ﾍﾟﾅﾙﾃｨが前のﾀｰﾝか今、発生してるならｺﾝﾎﾞは無視
//	if(apsys[brd].penalty || apsys[brd].combo1_invalid || apsys[brd].miss_flg)
	if(apsys[brd].penalty || apsys[brd].miss_flg)
		return 0;	//無効
	return 1;	//有効
}


//=========================================================================
//
//		プレイヤー情報を更新する時にウィンドウを隠すエフェクト
//												by matsuda 2002.06.06(木)
//=========================================================================
#define RIGHT_IN	6
#define DOWN_IN		CURTAIN_SP	//7
#define LASTER_IN	6
#define FLASH_WAIT	10

static void DownMoveEffectIn(u8 id);
static void DownMoveEffectOut(u8 id);
static void FlashWait(u8 id);
static void FlashEndWait(u8 id);

//----------------------------------------------------------
//	マスクエフェクトのデータ、レジスタをｾｯﾄする
//----------------------------------------------------------
void InfoMaskEffectDataSet(void)
{
	int i;
	
	(*(vBgCnt *)REG_BG1CNT).Priority = 0;
	(*(vBgCnt *)REG_BG1CNT).Size = 1;
	(*(vBgCnt *)REG_BG1CNT).Loop = 0;
	ScrX1 = 240;	//画面外座標に持ってく
	ScrY1 = 160;
	*(vu16 *)REG_BG1HOFS = ScrX1;
	*(vu16 *)REG_BG1VOFS = ScrY1;
//ｽｸﾘｰﾝｻｲｽﾞは2画面分だけど、実際のｽｸﾘｰﾝﾃﾞｰﾀは2画面分ないので全てをまず0クリアしておく
	DIV_DMACLEAR(3, 0, BG_VRAM + 0x800*CONWAZA_BG_SCRNBASE, 0x1000, 32);
	DecordVram((void*)con_bg0_psc_ADRS, (void*)(BG_VRAM+0x800*CONWAZA_BG_SCRNBASE));
	(*(vBgCnt *)REG_BG1CNT).CharBasep = 0;
	for(i = 0; i < BREEDER_MAX; i++){
		ActWork[brdsys[i].heart_actno].oamData.Priority = 1;
		ActWork[brdsys[i].sorticon_actno].oamData.Priority = 1;
	}
	(*(vBgCnt *)REG_BG2CNT).Priority = 1;
	(*(vBgCnt *)REG_BG0CNT).Priority = 1;
	(*(vBgCnt *)REG_BG1CNT).Size = 2;
}

//----------------------------------------------------------
//	マスクエフェクトで変更したVram、レジスタをｸﾘｱして元に戻す
//	※BG0,2のﾌﾟﾗｲｵﾘﾃｨは別Syncに外側で直すこと！！
//----------------------------------------------------------
void InfoMaskEffectDataClear(void)
{
	int i;
	
	DIV_DMACLEAR(3, 0, BG_VRAM+0x4000*CONWAZA_BG_CHARBASE, 0x2000, 32);
	DIV_DMACLEAR(3, 0, BG_VRAM+0x800*CONWAZA_BG_SCRNBASE, 0x1000, 32);
	ScrX1 = 0;
	ScrY1 = 0;
	(*(vBgCnt *)REG_BG1CNT).Priority = 1;
	(*(vBgCnt *)REG_BG1CNT).Size = 0;
	(*(vBgCnt *)REG_BG1CNT).Loop = 0;
	(*(vBgCnt *)REG_BG1CNT).CharBasep = CONWAZA_BG_CHARBASE;

	for(i = 0; i < BREEDER_MAX; i++){
		ActWork[brdsys[i].heart_actno].oamData.Priority = 0;
		ActWork[brdsys[i].sorticon_actno].oamData.Priority = 0;
	}
}

//----------------------------------------------------------
//	
//----------------------------------------------------------
void DownMoveEffect(u8 id)
{
	ScrX1 = 0;
	ScrY1 = 160;
	
	SePlayPan(SE_C_MAKU_D, 0);
	TaskTable[id].TaskAdrs = DownMoveEffectIn;
}

static void DownMoveEffectIn(u8 id)
{
	ScrY1 -= DOWN_IN;
	if((s16)ScrY1 < 0)
		ScrY1 = 0;
	if(ScrY1 == 0){
		TaskTable[id].work[0] = 0;
		TaskTable[id].work[1] = 0;
		TaskTable[id].work[2] = 0;
		//TaskTable[id].TaskAdrs = FlashWait;
		TaskTable[id].TaskAdrs = InfoRewriteData;
		//InfoRewriteData();
	}
}

//=========================================================================
//	次ターンに向けてプレイヤー情報更新
//=========================================================================
enum{
	REWRITEDATA_INIT,
	CONWAZAFLAG_CLEAR_INIT,
	CONWAZAFLAG_CLEAR_WAIT,
	CONWAZAFLAG_CLEAR_END,
};
void InfoRewriteData(u8 id)
{
	int i;
	u8 taskno;
	
	switch(TaskTable[id].work[0]){
		case REWRITEDATA_INIT:
			for(i = 0; i < BREEDER_MAX; i++)
				consys->nowturn_sort[i] = BrdSort[i];
			AppealMeterClear();
			MeterColorClearAll();
			BonusIconResetAll();
			ReWritePlayerInfo();
			NextSortPrint(1);
			HeartIconYposSet();
			TaskTable[id].work[0] = CONWAZAFLAG_CLEAR_INIT;
			break;
		case CONWAZAFLAG_CLEAR_INIT:
			if(ContestTuusin & C_TUUSIN_FLG){
				consys->sio_wazacalc = 1;
				if(ContestSioOyaCheck()){
					//毎ﾀｰﾝｸﾘｱｰする必要があるﾌﾗｸﾞをｸﾘｱｰする
					ConWazaFlagCheckClear();	//ﾀｰﾝをｲﾝｸﾘﾒﾝﾄする前に呼ぶこと!
				}
				taskno = AddTask(ContWazaCalcDataSioGet, 0);
				ChangeTask(taskno, ContWazaCalcDataSioGet, ContWazaCalcDatatWait);
				TuusintyuuMsgPut();
				TaskTable[id].work[0] = CONWAZAFLAG_CLEAR_WAIT;
			}
			else{
				//毎ﾀｰﾝｸﾘｱｰする必要があるﾌﾗｸﾞをｸﾘｱｰする
				ConWazaFlagCheckClear();	//ﾀｰﾝをｲﾝｸﾘﾒﾝﾄする前に呼ぶこと!
				TaskTable[id].work[0] = CONWAZAFLAG_CLEAR_END;
			}
			break;
		case CONWAZAFLAG_CLEAR_WAIT:
			if(consys->sio_wazacalc == 0){
				TaskTable[id].work[0] = CONWAZAFLAG_CLEAR_END;
			}
			break;
		case CONWAZAFLAG_CLEAR_END:
			WazaKoukaIconPutAll();
			PlayerInfoCopy();
			TaskTable[id].work[0] = 0;
			TaskTable[id].TaskAdrs = FlashWait;
			break;
	}
}


static void DownMoveEffectOut(u8 id)
{
	ScrY1 += DOWN_IN;
	if((s16)ScrY1 > 160)
		TaskTable[id].TaskAdrs = InfoMaskEffectEnd;
}


//----------------------------------------------------------
//	
//----------------------------------------------------------
static void FlashWait(u8 id)
{
	if(TaskTable[id].work[2] < FLASH_WAIT){
		TaskTable[id].work[2]++;
		return;
	}

//	待つだけ。フラッシュはしない　2002.07.10(水)
//	SoftFade(CONWAZA_BG_PAL*16, 16, TaskTable[id].work[0], 0x7fff);
	if(TaskTable[id].work[1] == 0){
		if(TaskTable[id].work[0] == 16)
			TaskTable[id].work[1]++;
		else
			TaskTable[id].work[0]++;
	}
	else{
		if(TaskTable[id].work[0] == 0){
			TaskTable[id].work[1] = 0;
			TaskTable[id].work[2] = 0;
			TaskTable[id].TaskAdrs = FlashEndWait;
		}
		else
			TaskTable[id].work[0]--;
	}
}

static void FlashEndWait(u8 id)
{
	if(TaskTable[id].work[2] < FLASH_WAIT)
		TaskTable[id].work[2]++;
	else
	{
		TaskTable[id].work[2] = 0;
		SePlayPan(SE_C_MAKU_U, 0);
		TaskTable[id].TaskAdrs = DownMoveEffectOut;
	}
}



//=========================================================================
//	ハートアイコンのｱﾌｨﾝｴﾌｪｸﾄをｾｯﾄ
//		aff_type = client.hにenumが定義してあります
//=========================================================================
void HeartIconAffEffSet(u8 aff_type)
{
	int i;
	u8 id;
	
	//アフィンデータを取得
	for(i = 0; i < BREEDER_MAX; i++){
		ActWork[brdsys[i].heart_actno].oamData.AffineParamNo
			= AffineWorkNumGet();
		ActWork[brdsys[i].heart_actno].oamData.AffineMode = 1;
		ActAffAnmChg(&ActWork[brdsys[i].heart_actno], aff_type);
		
		if(aff_type == HEART_AFF_BIG){
			ActAnm(&ActWork[brdsys[i].heart_actno]);
			ActWork[brdsys[i].heart_actno].banish = 0;
		}
	}
	id = AddTask(HeartIconAffEffCheckSeq, 5);
	TaskTable[id].work[0] = aff_type;
	consys->heart_aff_eff = 1;	//ｱﾌｨﾝｴﾌｪｸﾄ中ﾌﾗｸﾞｾｯﾄ
}

//----------------------------------------------------------
//	ハートアイコンのｱﾌｨﾝｱﾆﾒが終了するのを監視
//----------------------------------------------------------
static void HeartIconAffEffCheckSeq(u8 id)
{
	int i;
	u8 aff_type;
	
	if(ActWork[brdsys[0].heart_actno].affend_sw == 0)
		return;
	
	aff_type = TaskTable[id].work[0];
	if(aff_type == HEART_AFF_SMALL){
		for(i = 0; i < BREEDER_MAX; i++)
			ActWork[brdsys[i].heart_actno].banish = 1;
	}
	
	//ｱﾌｨﾝﾏﾈｰｼﾞｬｰ開放
	for(i = 0; i < BREEDER_MAX; i++)
		AffineDelActor(&ActWork[brdsys[i].heart_actno]);

	consys->heart_aff_eff = 0;
	DelTask(id);
}

//=========================================================================
//	次ﾊﾞｰｼﾞｮﾝを考えてWAZANO_MAX以上の技Noが来た時は「はたく」の技Noを返す
//=========================================================================
u16 GetContWazaNo(u16 wazano)
{
	if(wazano > WAZANO_MAX)
		wazano = 1;	//未知の技は全て「はたく」
	return wazano;
}

//=========================================================================
//	次ﾊﾞｰｼﾞｮﾝを考えてMONSNO_END以上の値が来た時は「?」のMonsNoを返す
//=========================================================================
u16 GetContMonsNo(u16 monsno)
{
	if(monsno >= MONSNO_END)
		monsno = 0;
	return monsno;
}

//=========================================================================
//	技エフェクトで使用するシステムワークをｾｯﾄする
//		※技ｴﾌｪｸﾄを出す前に行なう
//=========================================================================
void ContestWazaEffectWorkSet(u8 brd)
{
	int i;
	u16 wazano;
	u16 monsno;
//	u16 rnd;
	
	wazano = GetContWazaNo(apsys[brd].use_waza);
	monsno = GetContMonsNo(BreederParam[brd].monsno);
	
	memset(conpara, 0, sizeof(ConWazaEffParam));
	WazaEffectWorkInit();
	for(i = 0; i < CLIENT_MAX; i++){
		BattlePokeAnmNo[i] = 0;
	}

	//-- 技ごとによるｶｳﾝﾀ-の設定 --//
	switch(wazano){
		case WAZANO_NOROI:	//のろい
			if(PPD[monsno].type1 == GHOST_TYPE || PPD[monsno].type2 == GHOST_TYPE)
				WazaCounter = 0;
			else
				WazaCounter = 1;
			break;
		case WAZANO_HENSIN:
		case WAZANO_NARIKIRI:
			i = apsys[brd].hensin_monsno;
			conpara->hensin_monsno = GetContMonsNo(BreederParam[i].monsno);
			conpara->hensin_personal_rnd = BreederParam[i].personal_rnd;
			conpara->hensin_flg = 1;
			break;
		case WAZANO_ONGAESI:
			WazaEffNatukido = 255;	//威力Max状態のを出す
			break;
		case WAZANO_YATUATARI:
			WazaEffNatukido = 0;	//威力Max状態のを出す
			break;
		case WAZANO_SOORAABIIMU:	//2ﾀｰﾝ連続
		case WAZANO_KAMAITATI:
		case WAZANO_ROKETTOZUTUKI:
		case WAZANO_GODDOBAADO:
			if(consys->eff_loop == 0){
				consys->eff_loop = 2;
				WazaCounter = 0;
			}
			else
				WazaCounter = 1;
			break;
	}
	
	//-- 透明ｱｸﾀｰのﾊﾟﾗﾒｰﾀｰ初期化 --//
	EnemyBanishActorParamInit();
}

//=========================================================================
//	技エフェクトで使用するシステムワークをクリアする
//		※技ｴﾌｪｸﾄが終了した後に行なう
//=========================================================================
void ContestWazaEffectWorkClear(u8 brd)
{
	memset(conpara, 0, sizeof(ConWazaEffParam));	//変身ﾌﾗｸﾞをｸﾘｱするため
	if(consys->eff_loop)
		consys->eff_loop--;
}

//=========================================================================
//	技ｴﾌｪｸﾄで必要なﾎﾟｹﾓﾝデータをｾｯﾄする
//=========================================================================
void ConWazaEffParaSet(u8 brd)
{
	conpara->brd = brd;
	conpara->monsno = GetContMonsNo(BreederParam[brd].monsno);
	conpara->personal_rnd = BreederParam[brd].personal_rnd;
	conpara->id_no = BreederParam[brd].id_no;
}

//=========================================================================
//	技エフェクトで敵側の役割をする透明ｱｸﾀｰを登録
//=========================================================================
void SetEnemyBanishActor(void)
{
	u8 poke;
	
	poke = AddBanishActor(DummyActMove);
	PokemonStruct[CONT_ENEMY_CLIENT] = poke;
	AffineNumSet(&ActWork[PokemonStruct[DefenceClient]]);	//透明ｱｸﾀｰにもAffineﾏﾈｰｼﾞｬｰをｾｯﾄしておかないと別の防御側ﾎﾟｹﾓﾝ以外の所に拡縮がかかってしまう
	EnemyBanishActorParamInit();
}

//=========================================================================
//	技エフェクトで敵側の役割をする透明ｱｸﾀｰのパラメータを登録
//=========================================================================
void EnemyBanishActorParamInit(void)
{
	actWork *xreg;
	
	xreg = &ActWork[PokemonStruct[CONT_ENEMY_CLIENT]];
	xreg->dx = 0;
	xreg->dy = 0;
	xreg->x = GetWazaEffPos(CONT_ENEMY_CLIENT, EFF_X);
	xreg->y = GetWazaEffPos(CONT_ENEMY_CLIENT, EFF_Y);
	xreg->banish = 1;
}

//=========================================================================
//	技Noのﾚﾝｼﾞによって、DefenceClientの値を設定する(AttackCleintは自分固定)
//=========================================================================
void SetRangeClient(u16 wazano)
{
	u8 range;
	
	range = WTD[wazano].attackrange;
	switch(range){
		case RANGE_MINE:
		case RANGE_ALWAYS:
			DefenceClient = CONT_MINE_CLIENT;
			break;
		case RANGE_NORMAL:
		case RANGE_NONE:
		case RANGE_RANDOM:
		case RANGE_DOUBLE:
		case RANGE_TRIPLE:
		default:
			DefenceClient = CONT_ENEMY_CLIENT;
			break;
	}
}







//=========================================================================
//	似顔絵ﾃﾞｰﾀをｾｯﾄ
//	tiiki_no = ｺﾝﾃｽﾄ会場の場所(美術館ﾃﾞｰﾀをｾｯﾄする場合は0xff, 
//			   	一時的にUserWorkに美術館ﾃﾞｰﾀをｾｯﾄする場合は0xfe)
//	戻り値: 1 = ｾｯﾄ完了		0 = ｾｯﾄできなかった
//=========================================================================
u8 PortraitDataSet(u8 tiiki_no)
{
	u8 no;
	int brd;
	u8 pict_rnd;
	
	pict_rnd = pp_rand() % 3;	//ﾗﾝﾀﾞﾑの種の共有を崩さないように判定前にやっておく
	
	for(brd = 0; brd < BREEDER_MAX-1; brd++)
	{
		if(ContestJyunni[brd] == 0)
			break;
	}
	if(tiiki_no == 0xff && brd != MyBreederNo)
		return 0;	//自分が優勝してないので美術館には飾れない
	
	switch(ContestKind)
	{
		case STYLE_CONTEST:
			pict_rnd += 0;
			break;
		case BEAUTIFUL_CONTEST:
			pict_rnd += 3;
			break;
		case CUTE_CONTEST:
			pict_rnd += 6;
			break;
		case CLEVER_CONTEST:
			pict_rnd += 9;
			break;
		case STRONG_CONTEST:
			pict_rnd += 12;
			break;
	}

	if(tiiki_no != 0xfe){
		no = PortraitDataSpaceSearch(tiiki_no, 1);
		Fld.PortraitData[no].personal_rnd = BreederParam[brd].personal_rnd;
		Fld.PortraitData[no].monsno = BreederParam[brd].monsno;
		Fld.PortraitData[no].idno = BreederParam[brd].id_no;
		PM_strcpy(Fld.PortraitData[no].nickname, BreederParam[brd].nickname);
		PM_strcpy(Fld.PortraitData[no].oyaname, BreederParam[brd].name);
		if(tiiki_no != 0xff)
			Fld.PortraitData[no].pict_type = ContestKind;
		else
			Fld.PortraitData[no].pict_type = pict_rnd;
	}
	else{	//UserWorkに美術館ﾃﾞｰﾀを形成
		PORTRAIT_TEMP->personal_rnd = BreederParam[brd].personal_rnd;
		PORTRAIT_TEMP->idno = BreederParam[brd].id_no;
		PORTRAIT_TEMP->monsno = BreederParam[brd].monsno;
		PM_strcpy(PORTRAIT_TEMP->nickname, BreederParam[brd].nickname);
		PM_strcpy(PORTRAIT_TEMP->oyaname, BreederParam[brd].name);
		PORTRAIT_TEMP->pict_type = pict_rnd;
	}
	return 1;
}

//----------------------------------------------------------
//	ｺﾝﾃｽﾄ会場の場所からｾｯﾄする似顔絵ﾃﾞｰﾀの配列の添え字を取得する
//	tiiki_no = ｺﾝﾃｽﾄ会場の場所(美術館ﾃﾞｰﾀをｾｯﾄする場合は0xff)
//	slide_flg = ﾃﾞｰﾀのｽﾗｲﾄﾞを行うかのﾌﾗｸﾞ(0:行わない	1:行う)
//----------------------------------------------------------
u8 PortraitDataSpaceSearch(u8 tiiki_no, u8 slide_flg)
{
	int i;
	u8 ret = 0;
	
	switch(tiiki_no)				//コンテスト会場の場所
	{
		case 0:						//ハジツゲ
		case 1:						//シダケ
			ret = tiiki_no;
			break;
		case 2:						//カイナ
			if(slide_flg){
				for(i = 4; i > 2; i--)
					memcpy(&Fld.PortraitData[i], &Fld.PortraitData[i-1], 
						sizeof(PORTRAIT_DATA));
			}
			ret = 2;
			break;
		case 3:						//ミナモ
			if(slide_flg){
				for(i = 7; i > 5; i--)
					memcpy(&Fld.PortraitData[i], &Fld.PortraitData[i-1], 
						sizeof(PORTRAIT_DATA));
			}
			ret = 5;
			break;
		default:					//美術館
			switch(ContestKind)
			{
				case STYLE_CONTEST:
					ret = 8;
					break;
				case BEAUTIFUL_CONTEST:
					ret = 9;
					break;
				case CUTE_CONTEST:
					ret = 10;
					break;
				case CLEVER_CONTEST:
					ret = 11;
					break;
				case STRONG_CONTEST:
				default:
					ret = 12;
					break;
			}
	}
	return ret;
}



//----------------------------------------------------------
//	似顔絵ﾃﾞｰﾀのﾃﾞﾌｫﾙﾄ値を設定
//----------------------------------------------------------
static const PORTRAIT_DATA portrait_init_dmy[] = {
	{//0
		0,			//u32 personal_rnd;		//個性乱数
		0xffff,			//u32 idno;				//ポケモンＩＤナンバー
		MONSNO_SUBAME,			//u16 monsno;				//ポケモンナンバー
		3,			//u8	pict_type;			//絵の種類
		{SU_,WA_,MI_,bou_,EOM_,},	//u8	nickname[11];		//ポケモンの名前
		{KI_,YYO_,U_,I_,TI_,EOM_,},	//u8	oyaname[11];		//親の名前
	},
	{//1
		0,			//u32 personal_rnd;		//個性乱数
		0xffff,			//u32 idno;				//ポケモンＩＤナンバー
		MONSNO_KINOGASSA,			//u16 monsno;				//ポケモンナンバー
		1,			//u8	pict_type;			//絵の種類
		{PI_,NO_,PI_,EOM_,},	//u8	nickname[11];		//ポケモンの名前
		{YA_,TTU_,KO_,EOM_,},	//u8	oyaname[11];		//親の名前
	},
	{//2
		0,			//u32 personal_rnd;		//個性乱数
		0xffff,			//u32 idno;				//ポケモンＩＤナンバー
		MONSNO_PERIPPAA,			//u16 monsno;				//ポケモンナンバー
		0,			//u8	pict_type;			//絵の種類
		{KA_,bou_,GO_,EOM_,},	//u8	nickname[11];		//ポケモンの名前
		{MO_,N_,DO_,EOM_,},	//u8	oyaname[11];		//親の名前
	},
	{//3
		0,			//u32 personal_rnd;		//個性乱数
		0xffff,			//u32 idno;				//ポケモンＩＤナンバー
		MONSNO_PERIPPAA,			//u16 monsno;				//ポケモンナンバー
		0,			//u8	pict_type;			//絵の種類
		{KA_,bou_,GO_,EOM_,},	//u8	nickname[11];		//ポケモンの名前
		{MO_,N_,DO_,EOM_,},	//u8	oyaname[11];		//親の名前
	},
	{//4
		0,			//u32 personal_rnd;		//個性乱数
		0xffff,			//u32 idno;				//ポケモンＩＤナンバー
		MONSNO_PERIPPAA,			//u16 monsno;				//ポケモンナンバー
		0,			//u8	pict_type;			//絵の種類
		{KA_,bou_,GO_,EOM_,},	//u8	nickname[11];		//ポケモンの名前
		{MO_,N_,DO_,EOM_,},	//u8	oyaname[11];		//親の名前
	},
	{//5
		0,			//u32 personal_rnd;		//個性乱数
		0xffff,			//u32 idno;				//ポケモンＩＤナンバー
		MONSNO_ENEKORORO,			//u16 monsno;				//ポケモンナンバー
		3,			//u8	pict_type;			//絵の種類
		{E_,NE_,sa_,n_,EOM_,},	//u8	nickname[11];		//ポケモンの名前
		{TO_,ME_,KI_,TI_,EOM_,},	//u8	oyaname[11];		//親の名前
	},
	{//6
		0,			//u32 personal_rnd;		//個性乱数
		0xffff,			//u32 idno;				//ポケモンＩＤナンバー
		MONSNO_GOKURIN,			//u16 monsno;				//ポケモンナンバー
		2,			//u8	pict_type;			//絵の種類
		{PA_,PI_,I_,EOM_,},	//u8	nickname[11];		//ポケモンの名前
		{YU_,ME_,MI_,EOM_,},	//u8	oyaname[11];		//親の名前
	},
	{//7
		0,			//u32 personal_rnd;		//個性乱数
		0xffff,			//u32 idno;				//ポケモンＩＤナンバー
		MONSNO_DOGOOMU,			//u16 monsno;				//ポケモンナンバー
		4,			//u8	pict_type;			//絵の種類
		{DO_,RA_,U_,DO_,EOM_,},	//u8	nickname[11];		//ポケモンの名前
		{YU_,RA_,TO_,EOM_,},	//u8	oyaname[11];		//親の名前
	},
};

void InitPortraitData(void)
{
	int i;
	
	for(i = 0; i < 8; i++)
		Fld.PortraitData[i] = portrait_init_dmy[i];
}


