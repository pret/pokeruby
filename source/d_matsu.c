//=========================================================================
//
//		デバック用ソース(ﾃｽﾄ用ともいう)
//														by matsuda
//=========================================================================

#include "common.h"
#include "poketool.h"
#include "param.h"
#include "menu.h"
#include "task.h"
#include "palanm.h"
#include "con_tool.h"
#include "contest.h"
#include "conres.h"
#include "fight.h"
#include "laster.h"
#include "intr.h"
#include "actanm.h"
#include "fld_main.h"
#include "madefine.h"
#include "wazatool.h"
#include "consio.h"
#include "d_matsu.h"
#include "ev_flag.h"
#include "wazano.def"
#include "conscr.h"

//-- 2つセットで --//
#define DEBUG_NUMPRINT
#include "pokesio.h"
#include "multisio.h"
#include "cable.h"


//----------------------------------------------------------
//	デバック用グローバル変数
//----------------------------------------------------------
u8 DebugContestFlag = 0;	//1=1次審査、2次審査を飛ばす

//----------------------------------------------------------
//	外部関数宣言
//----------------------------------------------------------
extern void MenuEnd(void);
extern void InitContest(void);
extern void kanshi_network(u8 taskno);

//----------------------------------------------------------
//	外部変数
//----------------------------------------------------------
extern u8	(*MenuFunc)();
extern	TALK_WIN	win[4];

//----------------------------------------------------------
//	プロトタイプ宣言
//----------------------------------------------------------
static u8 ParamHenkou(void);
static u8 DebugMenuMain(void);
static u8 ContestResDebug(void);
static void FadeWaitContestResCall(u8 id);
static void ContestParamDebug(void);
static void BreederParamPutAll(u8 brd_no);
static void TrainerNo0Select(actWork *Xreg, s8 data);
static void TrainerNo1Select(actWork *Xreg, s8 data);
static void TrainerNo2Select(actWork *Xreg, s8 data);
static void TrainerNo3Select(actWork *Xreg, s8 data);
static void StyleAddSub(actWork *Xreg, s8 data);
static void CuteAddSub(actWork *Xreg, s8 data);
static void BeautifulAddSub(actWork *Xreg, s8 data);
static void CleverAddSub(actWork *Xreg, s8 data);
static void StrongAddSub(actWork *Xreg, s8 data);
static void FurAddSub(actWork *Xreg, s8 data);
static void Waza1AddSub(actWork *Xreg, s8 data);
static void Waza2AddSub(actWork *Xreg, s8 data);
static void Waza3AddSub(actWork *Xreg, s8 data);
static void Waza4AddSub(actWork *Xreg, s8 data);
static void DebugCursorMove(actWork *Xreg);
static void BreederNamePutAll(u8 select_brd);
static void DebugContestStart(actWork *Xreg, s8 data);
static void DebugContestEnd(actWork *Xreg, s8 data);
static void MainContestSelect(actWork *Xreg, s8 data);
static void MainContestTypePut(u8 main_type);
static void BPPut(u8 brd_no, u8 main_type);
static u8 ContTuusinDebug(void);
static u8 ContTuusinSyokika(void);
static void SyokikaReturn(u8 id);
static void ContSyokikaEnd(u8 id);
static void RandTaneTrans(u8 id);
static void BCanKansi(u8 id);
static void ContestRankSelect(actWork *Xreg, s8 data);
static void ContestRankPut(u8 rank);
static u8 KoutokutenDataReset(void);
static u8 KoutokutenDataSetMenu(void);
static u8 ArtMuseumAllSet(void);
static void ErrorMsgMain(void);
static void ContestVersionTrans(u8 id);
static void ContSyokikaEnd2(u8 id);
static void BrdSortInitDataTrans(u8 id);

static void ContestSioInitDebug(u8 id);
static void Sio10SyncWait(u8 id);
static void ConnectNumCheck(u8 id);
static void SioFlagWait(u8 id);

//----------------------------------------------------------
//	データ
//----------------------------------------------------------
static const u8 test_msg[] = {TE_,SU_,TO_,de_,su_,EOM_};

//----------------------------------------------------------
//	メニューデータ
//----------------------------------------------------------
static const u8 contest_msg[] = {KO_,N_,TE_,SU_,TO_,EOM_};
static const u8 contestkekka_msg[] = {KO_,N_,TE_,SU_,TO_,ke_,ttu_,ka_,EOM_};
static const u8 parameter_msg[] = {PA_,RA_,ME_,bou_,TA_,he_,n_,ko_,u_,EOM_};
static const u8 wazahenkou_msg[] = {wa_,za_,spc_,he_,n_,ko_,u_,EOM_};
static const u8 contuusin_msg[] = {KO_,N_,TE_,SU_,TO_,tu_,u_,si_,n_,EOM_};
static const u8 syokika_msg[] = {tu_,u_,si_,n_,spc_,si_,yyo_,ki_,ka_,EOM_};
static const u8 koutokuten_set_msg[] = {ko_,u_,to_,ku_,te_,n_,DE_,bou_,TA_,spc_,SE_,TTU_,TO_,EOM_,};
static const u8 koutokuten_reset_msg[] = {ko_,u_,to_,ku_,te_,n_,DE_,bou_,TA_,spc_,RI_,SE_,TTU_,TO_,EOM_,};
static const u8 art_set_msg[] = {bi_,zi_,yyu_,tu_,ka_,n_,spc_,ze_,n_,bu_,SE_,TTU_,TO_,EOM_,};

#define MENU_MAX 7
static const MENU_ITEM	MatsuDebugMenuList[] =
{
	{contest_msg, ParamHenkou},//ContestDebug},
	{contestkekka_msg, ContestResDebug},
	{contuusin_msg, ContTuusinDebug},
	{syokika_msg, ContTuusinSyokika},
	{koutokuten_set_msg, KoutokutenDataSetMenu},
	{koutokuten_reset_msg, KoutokutenDataReset},
	{art_set_msg, ArtMuseumAllSet},
//	{parameter_msg, ParamHenkou},
//	{wazahenkou_msg, WazaHenkou},
};

//=========================================================================
//	ﾌｨｰﾙﾄﾞﾃﾞﾊﾞｯｸﾒﾆｭｰから呼ばれる関数
//=========================================================================
u8 DebugMatsudaTest(void)
{
	NMenuScreenClear();
	NMenuWinBoxWrite( 0, 0, 16, 18);
	NMenuFixListWrite( 2, 1, MENU_MAX, MatsuDebugMenuList);
	NMenuVCursorInit( 1, 1, MENU_MAX, 0 );
	MenuFunc = DebugMenuMain;
	return 0;
}

static u8 DebugMenuMain(void)
{
	s8	flag;

	flag = NMenuVCursorControl();
	if( flag == CURSOR_DEFAULT_VALUE )
		return 0;

	if( flag == CURSOR_CANCEL_VALUE )
	{
		MenuEnd();
		return 1;
	}
	MenuFunc = MatsuDebugMenuList[flag].ptr;
	return 0;
}

//----------------------------------------------------------
//	結果発表画面呼び出し
//----------------------------------------------------------
static u8 ContestResDebug(void)
{
	PaletteFadeReq(0xffffffff, 0,0,16,0);
	AddTask(FadeWaitContestResCall, 0xff);
	return 1;
}

static void FadeWaitContestResCall(u8 id)
{
	if(FadeData.fade_sw == 0)
	{
		DelTask(id);
//		SetBreederData(0,0);
//		GetBPAll(0);
		if((ContestTuusin & C_TUUSIN_FLG) == 0)
			GetEvaluationValueAll();
		ContestResultInit();
	}
}

//----------------------------------------------------------
//	ｺﾝﾃｽﾄで使用するﾊﾟﾗﾒｰﾀｰを変更する
//----------------------------------------------------------
static u8 ParamHenkou(void)
{
	ContestTuusin = 0;
	ContestParamDebug();
	return 0;
}

//----------------------------------------------------------
//	通信でコンテストをする
//----------------------------------------------------------
static u8 ContTuusinDebug(void)
{
	//ContestTuusin = C_TUUSIN_FLG;
	ContestParamDebug();
//		MainProcChange(InitContest);
	return 0;
}

//----------------------------------------------------------
//	通信初期化
//----------------------------------------------------------
static u8 ContTuusinSyokika(void)
{
	u8 id;
	u8 kansi;
	
	//通信初期化
#if CONTEST_DEBUG
	DebugNumPrintInit(0,0,31,2);
	AddTask(kanshi_network,0);
#endif
	id = AddTask(ContestSioInitDebug, 0);
	ChangeTask(id, ContestSioInitDebug, SyokikaReturn);
	
	kansi = AddTask(BCanKansi, 1);	//Bｷｬﾝｾﾙ監視ﾀｽｸ
	TaskTable[kansi].work[10] = id;
	TaskTable[id].work[10] = kansi;
	return 1;
}

static void SyokikaReturn(u8 id)
{
	//ﾌﾞﾘｰﾀﾞｰﾃﾞｰﾀ転送
	SetMyBreederData(0);	//↑の初期化でﾌﾞﾘｰﾀﾞｰNoが入るので必ず初期化の後に呼ぶ事！
	ChangeTask(id, BreederTransData, RandTaneTrans);//ContestTypeTrans);
}

//-- ﾗﾝﾀﾞﾑのﾀﾈを転送 --//
static void RandTaneTrans(u8 id)
{
//	ChangeTask(id, RandTaneTransData, ContSyokikaEnd);
	ChangeTask(id, RandTaneTransData, ContestVersionTrans);
}

//-- ｺﾝﾃｽﾄのｻｰﾊﾞｰﾊﾞｰｼﾞｮﾝを転送 --//
static void ContestVersionTrans(u8 id)
{
	ChangeTask(id, ContestVersionGetAllData, ContSyokikaEnd);
}

static void ContSioEnd(u8 id)
{
	if(pokemon_sio_flag == 0){
		DelTask(TaskTable[id].work[10]);	//Bｷｬﾝ監視ﾀｽｸ
		DelTask(id);
		MenuEnd();
//		PokemonMultiSioEnd();
	}
}

static void ContSioEndInit(u8 id)
{
	SetSioEndDataStart();
	TaskTable[id].TaskAdrs = ContSioEnd;
}

static void ContSyokikaEnd(u8 id)
{
	int i;
	u8 version[BREEDER_MAX];
	
	//-- ｻｰﾊﾞｰVersionﾁｪｯｸ --//
	for(i = 0; i < BREEDER_MAX; i++){
		version[i] = TaskTable[id].work[5+i];
	}
	ContestSioOya = ContestServerVisionCheck(version);
	//-- Versionﾁｪｯｸ終了 --//

	//-- ContBP転送 ※必ず親(一番最新のｻｰﾊﾞｰ)が決まってからやること！ --//
	GetBPAll(ContestKind);
	BreederDataSort(0);
//	ChangeTask(id, ContBPAllTransData, ContSyokikaEnd2);
	ChangeTask(id, ContBPAllTransData, BrdSortInitDataTrans);
}

static void BrdSortInitDataTrans(u8 id)
{
	ChangeTask(id, BrdSortInitAllTransData, ContSyokikaEnd2);
}

static void ContSyokikaEnd2(u8 id)
{
	DelTask(TaskTable[id].work[10]);	//Bｷｬﾝ監視ﾀｽｸ
	DelTask(id);
	MenuEnd();
}

//-- Bｷｬﾝｾﾙ監視 --//
static void BCanKansi(u8 id)
{
	u8 hontai;
	
	if(sys.Trg == B_BUTTON)
	{
		hontai = TaskTable[id].work[10];
		TaskTable[hontai].TaskAdrs = ContSioEndInit;
		//PokemonMultiSioEnd();
	}
}


//----------------------------------------------------------
//	通信初期化部分を受付と、デバックでは違うようになったので、まるごと持ってきた
//----------------------------------------------------------
#define CONTEST_SIOINIT_DEL		1	//認証処理で接続を切らなくなったので不要な部分削除
static void ContestSioInitDebug(u8 id)
{
	u8 i;
	
//	if(ContestTuusin & C_TUUSIN_FLG)

#if CONTEST_SIOINIT_DEL
	PokemonMultiSioInit();
#endif
//	DebugNumPrintInit(0, 0, 31, 2);
//	AddTask(kanshi_network, 1);
	for(i = 0; i < MULTI_SIO_PLAYERS_MAX; i++)
		RecvPoolBuf[i][0] = 0xff;	//とりあえず IDの入るとこだけ
	TaskTable[id].work[0] = 0;
//	TaskTable[id].TaskAdrs = SioFlagWait;
	TaskTable[id].TaskAdrs = Sio10SyncWait;
}

//-- SioInit後、10ｼﾝｸ待つ --//
static void Sio10SyncWait(u8 id)
{
#if CONTEST_SIOINIT_DEL
	if(TaskTable[id].work[0] < 10){
		TaskTable[id].work[0]++;
		return;
	}
	
	if(GetSioRealConnectNumber() < BREEDER_MAX)
		return;

	TaskTable[id].work[0] = 0;
	if(GetMyConnectIsParent())	//親
		TaskTable[id].TaskAdrs = ConnectNumCheck;
	else{						//子
		TaskTable[id].TaskAdrs = SioFlagWait;
//		SePlay(SE_SEIKAI);	//sioﾌﾗｸﾞ待ちになった合図
	}
#else
	TaskTable[id].TaskAdrs = SioFlagWait;
#endif
}

#if CONTEST_SIOINIT_DEL
//-- 親のみ：接続人数ﾁｪｯｸ --//
static void ConnectNumCheck(u8 id)
{
	if(TaskTable[id].work[0]++ == 100)
	{
		MultiSioSignalDecision();
		TaskTable[id].work[0] = 0;
		TaskTable[id].TaskAdrs = SioFlagWait;
	}
}
#endif

//-- 通信ﾌﾗｸﾞが立つまでｳｪｲﾄ --//
static void SioFlagWait(u8 id)
{
	if(pokemon_sio_flag == OFF)
		return;
	
	MyBreederNo = GetSioConnectId();
	if(GetConnectSioMenberNum() == 4)	//4人繋がってるかﾁｪｯｸ
	{
		ContestTuusin = C_TUUSIN_FLG;	//通信ﾌﾗｸﾞON
		ChangeBackTask(id);
	}
}


//=========================================================================
//	デバックメニュー共通ルーチン
//=========================================================================
//----------------------------------------------------------
//	ﾚｼﾞｽﾀｰ初期化
//----------------------------------------------------------
static void RegisterInit(void)
{
	*(vu16 *)REG_DISPCNT = DISP_MODE_0 | DISP_OBJ_CHAR_1D_MAP;
	*(vu16 *)REG_DISPCNT |= DISP_BG0_ON | DISP_OBJ_ON;// | DISP_BG1_ON | DISP_BG2_ON;

	PrintScreenInit(DEFAULT_TYPE);
	MsgControlInit(&win[0],DEFAULT_TYPE);
	
	*(vu16*)REG_MOSAIC = 0;

	*(vu16 *)REG_BLDCNT   = 0;	//半透明設定
	*(vu16 *)REG_BLDALPHA = 0;
	*(vu16 *)REG_BLDY	  = 0;

	*(vu16 *)REG_BG0HOFS = 0;
	*(vu16 *)REG_BG0VOFS = 0;
	ScrX0=0;
	ScrY0=0;
	ScrX1=0;
	ScrY1=0;
	ScrX2=0;
	ScrY2=0;
	ScrX3=0;
	ScrY3=0;
}

//----------------------------------------------------------
//	初期BGｷｬﾗ、ｽｸﾘｰﾝ、ｶﾗｰ転送
//----------------------------------------------------------
static void BGinit(void)
{
	u8 space[] = {CTRL_,C_BCOL_,COL_WHITE,spc_,EOM_};
	
	DIV_DMACLEAR(3,0,VRAM,(VRAM_END-VRAM),32);
	//ｸﾘｱｰ用に白ｽﾍﾟｰｽをセット
	MsgCGXDataSet((void*)BG_VRAM, space);

	PrintPaletteInit(DEFAULT_TYPE);
//	FontScrnEasyBoxFill(&win[0], 0,0, 29,19);
}

//----------------------------------------------------------
//	メインループ
//----------------------------------------------------------
static void	MatsuDebugMenuMainLoop(void)
{
	JumpActor();
	SetActor();
	MainTask();
	PaletteAnime();
	if(sys.Trg == SELECT_BUTTON)
		MainProcChange(FieldMenuRecover);
}

//----------------------------------------------------------
//	Vブランク関数
//----------------------------------------------------------
static void mdebug_v_blank_intr(void)
{
	*(vu16 *)REG_BG0HOFS = ScrX0;
	*(vu16 *)REG_BG0VOFS = ScrY0;
	*(vu16 *)REG_BG1HOFS = ScrX1;
	*(vu16 *)REG_BG1VOFS = ScrY1;
	*(vu16 *)REG_BG2HOFS = ScrX2;
	*(vu16 *)REG_BG2VOFS = ScrY2;
	*(vu16 *)REG_BG3HOFS = ScrX3;
	*(vu16 *)REG_BG3VOFS = ScrY3;
	actOAMtrans();
	actDMAtrans();
	PaletteFadeTrans();
	LasterVblank();
}




//=========================================================================
//	ｺﾝﾃｽﾄ用パラメーター変更ﾃﾞﾊﾞｯｸﾓｰﾄﾞ
//=========================================================================
//-- カーソル --//
const u8 ball_Character[32]={
                                                        /*  0  =  0(0x0)  */
	0x00,0x11,0x11,0x00,0x10,0x11,0x01,0x01,
	0x11,0x11,0x11,0x10,0x11,0x11,0x11,0x10,
	0x11,0x11,0x11,0x11,0x11,0x11,0x11,0x11,
	0x10,0x11,0x11,0x01,0x00,0x11,0x11,0x00,
};
const u16 ball_Palette[16]={
	0x0000,0x2dbf,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
};

#define NAME_CGXLEN			(5*2)
#define PARANAME_LEN		(5*2)
#define PARANUM_LEN			(3*2)
#define WAZANAME_LEN		(7*2)
#define KAISI_LEN			(10*2)
#define MODORU_LEN			(3*2)
#define BP_LEN				(3*2)
#define BPNUM_LEN			(3*2)
#define RANK_LEN			(9*2)
#define WAZANO_LEN			(3*2*4)

#define NAME_CGXNUM			2
#define PARANAME_CGXNUM		(NAME_CGXNUM + NAME_CGXLEN * BREEDER_MAX)
#define STYLENUM_CGXNUM		(PARANAME_CGXNUM + PARANAME_LEN * 6)
#define CUTENUM_CGXNUM		(STYLENUM_CGXNUM + PARANUM_LEN)
#define BEAUTINUM_CGXNUM	(CUTENUM_CGXNUM + PARANUM_LEN)
#define CLEVERNUM_CGXNUM	(BEAUTINUM_CGXNUM + PARANUM_LEN)
#define STRONGNUM_CGXNUM	(CLEVERNUM_CGXNUM + PARANUM_LEN)
#define FURNUM_CGXNUM		(STRONGNUM_CGXNUM + PARANUM_LEN)
#define WAZANAME_CGXNUM		(FURNUM_CGXNUM + PARANUM_LEN)
#define KAISI_CGXNUM		(WAZANAME_CGXNUM + WAZANAME_LEN*4)
#define MODORU_CGXNUM		(KAISI_CGXNUM + KAISI_LEN)
#define BP_CGXNUM			(MODORU_CGXNUM + MODORU_LEN)
#define BPNUM_CGXNUM		(BP_CGXNUM + BP_LEN)
#define RANK_CGXNUM			(BPNUM_CGXNUM + BPNUM_LEN)
#define WAZANO_CGXNUM		(RANK_CGXNUM + RANK_LEN)

//----------------------------------------------------------
//	ｺﾝﾃｽﾄパラメータ変更座標ﾃﾞｰﾀ
//----------------------------------------------------------
//-- ﾌﾞﾘｰﾀﾞｰ名 --//
static const u8 NamePos[][2] = {
	{2, 0},
	{17, 0},
	{2, 2},
	{17,2},
};
static const u8 ParaNamePos[][2] = {
	{0, 6},
	{15,6},
	{0, 8},
	{15,8},
	{0,10},
	{15,10},
};
static const u8 ParaNumPos[][2] = {
	{7, 6},
	{22,6},
	{7, 8},
	{22,8},
	{7,10},
	{22,10},
};
static const u8 WazaNamePos[][2] = {
	{2,14},
	{17,14},
	{2,16},
	{17,16},
};

//-- カーソル座標 --//
#define Y_RETU_MAX	9
static const u8 CursorPosX[Y_RETU_MAX][2] = {
	{1*8,16*8},	//一番上の2つのX座標(左項目のXと右項目のX)
	{1*8,16*8},
	{2*8,2*8},
	{6*8,21*8},
	{6*8,21*8},
	{6*8,21*8},
	{1*8,16*8},
	{1*8,16*8},
	{2*8,17*8},
};
static const u8 CursorPosY[Y_RETU_MAX] = {
	1*8,3*8,5*8,7*8,9*8,11*8,15*8,17*8,19*8,
};

//----------------------------------------------------------
//	アクター、セル&ﾊﾟﾚｯﾄデータ
//----------------------------------------------------------
static const CellData CursorCell= {
	(void*)ball_Character, OBJ_SIZE16_8x8, 1200
};
static const PalData CursorPal = {
	(void*)ball_Palette, 1200,
};
static const ActOamData CursorOam = {
		0,		//u32 VPos:8;             // Ｙ座標
		0,		//u32 AffineMode:2;       // アフィンモード
		0,		//u32 ObjMode:2;          // ＯＢＪモード
		OFF,	//u32 Mosaic:1;           // モザイク
		0,		//u32 ColorMode:1;        // １６色/２５６色 選択
		0,		//u32 Shape:2;            // ＯＢＪ形状

		0,		//u32 HPos:9;             // Ｘ座標
		0,		//u32 AffineParamNo:5;  // アフィン変換パラメータNo & H,VFlip
		0,		//u32 Size:2;             // ＯＢＪサイズ

		0,		//u32 CharNo:10;          // キャラクタＮｏ
		0,		//u32 Priority:2;         // 表示優先
		0,		//u32 Pltt:4;             // パレットＮｏ
		0,
};
static const	actHeader DebugCursorHeader={
	1200,
	1200,
	&CursorOam,
	DummyActAnmTbl,
	0,
	DummyActAffTbl,
	DebugCursorMove,
};

//----------------------------------------------------------
//	動作関数テーブル
//----------------------------------------------------------
static void (* const KoumokuListTbl[][2])(actWork *, s8) = {
	{TrainerNo0Select,	TrainerNo1Select},
	{TrainerNo2Select,	TrainerNo3Select},
	{ContestRankSelect,	ContestRankSelect},
	{StyleAddSub,		CuteAddSub},
	{BeautifulAddSub,	CleverAddSub},
	{StrongAddSub,		FurAddSub,},
	{Waza1AddSub,		Waza2AddSub},
	{Waza3AddSub,		Waza4AddSub},
	{MainContestSelect,	DebugContestEnd},
};

//----------------------------------------------------------
//	ﾒｯｾｰｼﾞﾃﾞｰﾀ
//----------------------------------------------------------
static const u8 select_msg[] = {CTRL_,C_FCOL_,COL_LBLUE,CTRL_,C_BCOL_,COL_RED,EOM_};
static const u8 kaisi_msg[] = {ka_,i_,si_,EOM_};
static const u8 modoru_msg[] = {mo_,do_,ru_,EOM_};
static const u8 bp_msg[] = {CTRL_,C_FCOL_,COL_PURPLE,B__,P__,ten_,EOM_};
static const u8 paraname0_msg[] = {ka_,ttu_,ko_,yo_,sa_,EOM_};
static const u8 paraname1_msg[] = {ka_,wa_,i_,sa_,EOM_};
static const u8 paraname2_msg[] = {u_,tu_,ku_,si_,sa_,EOM_};
static const u8 paraname3_msg[] = {ka_,si_,ko_,sa_,EOM_};
static const u8 paraname4_msg[] = {ta_,ku_,ma_,si_,sa_,EOM_};
static const u8 paraname5_msg[] = {ke_,du_,ya_,EOM_};
static const u8 * const paraname_tbl[] = {
	paraname0_msg,
	paraname1_msg,
	paraname2_msg,
	paraname3_msg,
	paraname4_msg,
	paraname5_msg,
};

static const u8 maintype0_msg[] = {ka_,ttu_,ko_,yo_,sa_,KO_,N_,TE_,SU_,TO_,EOM_};
static const u8 maintype1_msg[] = {u_,tu_,ku_,si_,sa_,KO_,N_,TE_,SU_,TO_,EOM_};
static const u8 maintype2_msg[] = {ka_,wa_,i_,sa_,KO_,N_,TE_,SU_,TO_,spc_,EOM_};
static const u8 maintype3_msg[] = {ka_,si_,ko_,sa_,KO_,N_,TE_,SU_,TO_,spc_,EOM_};
static const u8 maintype4_msg[] = {ta_,ku_,ma_,si_,sa_,KO_,N_,TE_,SU_,TO_,EOM_};
static const u8 * const maintype_tbl[] = {
	maintype0_msg,
	maintype1_msg,
	maintype2_msg,
	maintype3_msg,
	maintype4_msg,
};

static const u8 conrank0_msg[] = {HA_,ZI_,TU_,GE_,sura_,NO_,bou_,MA_,RU_,EOM_};
static const u8 conrank1_msg[] = {SI_,DA_,KE_,sura_,SU_,bou_,PA_,bou_,spc_,EOM_};
static const u8 conrank2_msg[] = {KA_,I_,NA_,sura_,HA_,I_,PA_,bou_,spc_,EOM_};
static const u8 conrank3_msg[] = {MI_,NA_,MO_,sura_,MA_,SU_,TA_,bou_,spc_,EOM_};
static const u8 * const conrank_tbl[] = {
	conrank0_msg,
	conrank1_msg,
	conrank2_msg,
	conrank3_msg,
};

static void ContestParamDebug(void)
{
	u8 i, actno;
	
	//-- 共通初期設定処理 --//
	FadeData.trans_stop = 1;
	SetVBlankFunc(NULL);
	RegisterInit();
	LasterWorkInit();
	PaletteAnimeInit();
	InitActor();
	InitTask();
	ObjPalManInit();
	BGinit();
	SetVBlankFunc(mdebug_v_blank_intr);
	MainProcChange(MatsuDebugMenuMainLoop);
	FadeData.trans_stop = 0;
	//---------------------//
	
	ConTemotiNo = 0;	//ﾃﾞﾊﾞｯｸでは手持ちの先頭のﾎﾟｹﾓﾝが参加対象になる
	if(BreederParam[0].nickname[0] == 0)
		SetBreederData(0,0);	//ﾌﾞﾘｰﾀﾞｰﾃﾞｰﾀがｾｯﾄされてないなら、ここでｾｯﾄ
	SetMyBreederData(ConTemotiNo);	//自分のﾃﾞｰﾀだけは毎回読み込みなおす
	
	for(i = 0; i < 6; i++)
	{
		MsgPrint(&win[0], paraname_tbl[i], PARANAME_CGXNUM + PARANAME_LEN * i,
			ParaNamePos[i][0], ParaNamePos[i][1]);
	}
	//MsgPrint(&win[0], kaisi_msg, KAISI_CGXNUM, 5,18);
	ContestKind = ContestRank = 0;
	MainContestTypePut(ContestKind);
	ContestRankPut(ContestRank);
	MsgPrint(&win[0], modoru_msg, MODORU_CGXNUM, 18,18);
	MsgPrint(&win[0], bp_msg, BP_CGXNUM, 0, 12);
	CellSet((CellData*)&CursorCell);
	ObjPalSet((PalData*)&CursorPal);
	BreederNamePutAll(3);
	BreederParamPutAll(3);	//↑←↓ﾃﾞﾌｫﾙﾄで自分のﾃﾞｰﾀを表示
	BPPut(3, 0);
	actno = AddActor(&DebugCursorHeader, CursorPosX[1][1], CursorPosY[1], 5);
	ActWork[actno].work[0] = 1;	//X列
	ActWork[actno].work[1] = 1;	//Y列
	ActWork[actno].work[2] = 3;	//選択されているﾌﾞﾘｰﾀﾞｰﾅﾝﾊﾞｰ
	ActWork[actno].work[3] = 0;
}

//-- 全員のﾌﾞﾘｰﾀﾞｰ名表示 --//
// select_brd = 選択されているﾌﾞﾘｰﾀﾞｰNo(色が変わる)
static void BreederNamePutAll(u8 select_brd)
{
	u8 i;

	FontScrnBoxFill(&win[0], 0, 0, 0, 30, 3);

	PM_strcpy(UserWork, select_msg);
	PM_strcat(UserWork, BreederParam[select_brd].name);
	for(i = 0; i < BREEDER_MAX; i++)
	{
		if(select_brd == i)
			MsgPrint(&win[0], UserWork, NAME_CGXNUM + NAME_CGXLEN * i,
				 NamePos[i][0], NamePos[i][1]);
		else
			MsgPrint(&win[0], BreederParam[i].name, NAME_CGXNUM + NAME_CGXLEN * i,
				 NamePos[i][0], NamePos[i][1]);
	}
}
//-- 「かっこよさ」のﾊﾟﾗﾒｰﾀｰ表示 --//
static void StyleNumPut(u8 brd_no)
{
	PM_NumMsgSet(UserWork, BreederParam[brd_no].style, NUM_MODE_SPACE, 3);
	MsgPrint(&win[0], UserWork, STYLENUM_CGXNUM, ParaNumPos[0][0], ParaNumPos[0][1]);
}
//-- 「かわいさ」のﾊﾟﾗﾒｰﾀｰ表示 --//
static void CuteNumPut(u8 brd_no)
{
	PM_NumMsgSet(UserWork, BreederParam[brd_no].cute, NUM_MODE_SPACE, 3);
	MsgPrint(&win[0], UserWork, CUTENUM_CGXNUM, ParaNumPos[1][0], ParaNumPos[1][1]);
}
//-- 「うつくしさ」のﾊﾟﾗﾒｰﾀｰ表示 --//
static void BeautifulNumPut(u8 brd_no)
{
	PM_NumMsgSet(UserWork, BreederParam[brd_no].beautiful, NUM_MODE_SPACE, 3);
	MsgPrint(&win[0], UserWork, BEAUTINUM_CGXNUM, ParaNumPos[2][0], ParaNumPos[2][1]);
}
//-- 「かしこさ」のﾊﾟﾗﾒｰﾀｰ表示 --//
static void CleverNumPut(u8 brd_no)
{
	PM_NumMsgSet(UserWork, BreederParam[brd_no].clever, NUM_MODE_SPACE, 3);
	MsgPrint(&win[0], UserWork, CLEVERNUM_CGXNUM, ParaNumPos[3][0], ParaNumPos[3][1]);
}
//-- 「たくましさ」のﾊﾟﾗﾒｰﾀｰ表示 --//
static void StrongNumPut(u8 brd_no)
{
	PM_NumMsgSet(UserWork, BreederParam[brd_no].strong, NUM_MODE_SPACE, 3);
	MsgPrint(&win[0], UserWork, STRONGNUM_CGXNUM, ParaNumPos[4][0], ParaNumPos[4][1]);
}
//-- 「けづや」のﾊﾟﾗﾒｰﾀｰ表示 --//
static void FurNumPut(u8 brd_no)
{
	PM_NumMsgSet(UserWork, BreederParam[brd_no].fur, NUM_MODE_SPACE, 3);
	MsgPrint(&win[0], UserWork, FURNUM_CGXNUM, ParaNumPos[5][0], ParaNumPos[5][1]);
}
//-- 持ち技を表示 --//
// wazapos = 4つの手持ちのうち何番目の技名を表示するのか
static void WazaNamePut(u8 brd_no, u8 wazapos)
{
	FontScrnBoxFill(&win[0], 0, WazaNamePos[wazapos][0], WazaNamePos[wazapos][1],
		WazaNamePos[wazapos][0] + 7, WazaNamePos[wazapos][1] + 1);
	MsgPrint(&win[0], WazaNameData[BreederParam[brd_no].waza[wazapos]],
		WAZANAME_CGXNUM + WAZANAME_LEN * wazapos, 
			WazaNamePos[wazapos][0], WazaNamePos[wazapos][1]);
	PM_NumMsgSet(StrTempBuffer0,BreederParam[brd_no].waza[wazapos],NUM_MODE_ZERO,3);
	MsgPrint(&win[0], StrTempBuffer0, WAZANO_CGXNUM + 3*2 * wazapos, 
			WazaNamePos[wazapos][0]+7, WazaNamePos[wazapos][1]);
}
//-- ﾒｲﾝのｺﾝﾃｽﾄﾀｲﾌﾟを表示 --//
static void MainContestTypePut(u8 main_type)
{
	MsgPrint(&win[0], maintype_tbl[main_type], KAISI_CGXNUM, 3,18);
}
//-- ｺﾝﾃｽﾄﾗﾝｸを表示 --//
static void ContestRankPut(u8 rank)
{
	MsgPrint(&win[0], conrank_tbl[rank], RANK_CGXNUM, 3,4);
}
//-- BPを表示 --//
static void BPPut(u8 brd_no, u8 main_type)
{
	u16 bp;
	
	bp = GetBP(brd_no, main_type);
	PM_NumMsgSet(UserWork, bp, NUM_MODE_SPACE, 3);
	MsgPrint(&win[0], UserWork, BPNUM_CGXNUM, 3, 12);
}

static void BreederParamPutAll(u8 brd_no)
{
	u8 i;
	
	StyleNumPut(brd_no);
	CuteNumPut(brd_no);
	BeautifulNumPut(brd_no);
	CleverNumPut(brd_no);
	StrongNumPut(brd_no);
	FurNumPut(brd_no);
	for(i = 0; i < 4; i++)
		WazaNamePut(brd_no, i);
}

//----------------------------------------------------------
//	自分のﾎﾟｹﾓﾝにﾃﾞﾊﾞｯｸﾒﾆｭｰで変更されたﾃﾞｰﾀをｾｯﾄする
//----------------------------------------------------------
static void MinePokeDataSet(void)
{
	PokeParaPut(&PokeParaMine[0], ID_style, &BreederParam[MyBreederNo].style);
	PokeParaPut(&PokeParaMine[0], ID_cute, &BreederParam[MyBreederNo].cute);
	PokeParaPut(&PokeParaMine[0], ID_beautiful, &BreederParam[MyBreederNo].beautiful);
	PokeParaPut(&PokeParaMine[0], ID_clever, &BreederParam[MyBreederNo].clever);
	PokeParaPut(&PokeParaMine[0], ID_strong, &BreederParam[MyBreederNo].strong);
	PokeParaPut(&PokeParaMine[0], ID_fur, &BreederParam[MyBreederNo].fur);
	PokeParaPut(&PokeParaMine[0], ID_waza1, (u8*)&BreederParam[MyBreederNo].waza[0]);
	PokeParaPut(&PokeParaMine[0], ID_waza2, (u8*)&BreederParam[MyBreederNo].waza[1]);
	PokeParaPut(&PokeParaMine[0], ID_waza3, (u8*)&BreederParam[MyBreederNo].waza[2]);
	PokeParaPut(&PokeParaMine[0], ID_waza4, (u8*)&BreederParam[MyBreederNo].waza[3]);
}

//----------------------------------------------------------
//	カーソルアクター(実質のﾒｲﾝ)
//----------------------------------------------------------
static void DebugCursorMove(actWork *Xreg)
{
	switch(sys.Repeat)
	{
		case L_KEY:
		case R_KEY:
			Xreg->work[0] ^= 1;
			break;
		case U_KEY:
			if(Xreg->work[1] == 0)
				Xreg->work[1] = Y_RETU_MAX-1;
			else
				Xreg->work[1]--;
			break;
		case D_KEY:
			if(Xreg->work[1] == Y_RETU_MAX-1)
				Xreg->work[1] = 0;
			else
				Xreg->work[1]++;
			break;
		case A_BUTTON:
			KoumokuListTbl[Xreg->work[1]][Xreg->work[0]](Xreg,1);
			BPPut(Xreg->work[2], Xreg->work[3]);
			break;
		case B_BUTTON:
			KoumokuListTbl[Xreg->work[1]][Xreg->work[0]](Xreg, -1);
			BPPut(Xreg->work[2], Xreg->work[3]);
			break;
		case R_BUTTON:
			KoumokuListTbl[Xreg->work[1]][Xreg->work[0]](Xreg, 10);
			BPPut(Xreg->work[2], Xreg->work[3]);
			break;
		case L_BUTTON:
			KoumokuListTbl[Xreg->work[1]][Xreg->work[0]](Xreg, -10);
			BPPut(Xreg->work[2], Xreg->work[3]);
			break;
		case START_BUTTON:
			DebugContestStart(Xreg, 1);
			break;
	}
	Xreg->x = CursorPosX[Xreg->work[1]][Xreg->work[0]];
	Xreg->y = CursorPosY[Xreg->work[1]];
}

//----------------------------------------------------------
//	ﾄﾚｰﾅｰ選択
//----------------------------------------------------------
static void TrainerSelect(actWork *Xreg, s8 data, u8 brd_no)
{
	if(data != 1)
		return;
	
	Xreg->work[2] = brd_no;
	BreederNamePutAll(Xreg->work[2]);
	BreederParamPutAll(Xreg->work[2]);
}
static void TrainerNo0Select(actWork *Xreg, s8 data)
{
	TrainerSelect(Xreg, data, 0);
}
static void TrainerNo1Select(actWork *Xreg, s8 data)
{
	TrainerSelect(Xreg, data, 1);
}
static void TrainerNo2Select(actWork *Xreg, s8 data)
{
	TrainerSelect(Xreg, data, 2);
}
static void TrainerNo3Select(actWork *Xreg, s8 data)
{
	TrainerSelect(Xreg, data, 3);
}
//----------------------------------------------------------
//	ﾊﾟﾗﾒｰﾀ増減
//----------------------------------------------------------
static u8 ParamAddSubCheck(u8 brd_no, u8 now_param, s8 data)
{
	s16 kekka;
	
	kekka = now_param + data;
	if(kekka > 255)
		kekka = 255;
	else if(kekka < 0)
		kekka = 0;
	return (u8)kekka;
}
static void StyleAddSub(actWork *Xreg, s8 data)
{
	BreederParam[Xreg->work[2]].style = ParamAddSubCheck(Xreg->work[2], 
		BreederParam[Xreg->work[2]].style, data);
	StyleNumPut(Xreg->work[2]);
}
static void CuteAddSub(actWork *Xreg, s8 data)
{
	BreederParam[Xreg->work[2]].cute = ParamAddSubCheck(Xreg->work[2], 
		BreederParam[Xreg->work[2]].cute, data);
	CuteNumPut(Xreg->work[2]);
}
static void BeautifulAddSub(actWork *Xreg, s8 data)
{
	BreederParam[Xreg->work[2]].beautiful = ParamAddSubCheck(Xreg->work[2], 
		BreederParam[Xreg->work[2]].beautiful, data);
	BeautifulNumPut(Xreg->work[2]);
}
static void CleverAddSub(actWork *Xreg, s8 data)
{
	BreederParam[Xreg->work[2]].clever = ParamAddSubCheck(Xreg->work[2], 
		BreederParam[Xreg->work[2]].clever, data);
	CleverNumPut(Xreg->work[2]);
}
static void StrongAddSub(actWork *Xreg, s8 data)
{
	BreederParam[Xreg->work[2]].strong = ParamAddSubCheck(Xreg->work[2], 
		BreederParam[Xreg->work[2]].strong, data);
	StrongNumPut(Xreg->work[2]);
}
static void FurAddSub(actWork *Xreg, s8 data)
{
	BreederParam[Xreg->work[2]].fur = ParamAddSubCheck(Xreg->work[2], 
		BreederParam[Xreg->work[2]].fur, data);
	FurNumPut(Xreg->work[2]);
}

//----------------------------------------------------------
//	技セレクト
//----------------------------------------------------------
static u16 WazaAddSubCheck(u8 brd_no, u16 wazano, s8 data)
{
	s16 kekka;
	
	kekka = wazano + data;
	if(kekka > WAZANO_MAX)
		kekka = 1;
	else if(kekka < 0)
		kekka = WAZANO_MAX;
	return kekka;
}
static void Waza1AddSub(actWork *Xreg, s8 data)
{
	BreederParam[Xreg->work[2]].waza[0] = WazaAddSubCheck(Xreg->work[2], 
		BreederParam[Xreg->work[2]].waza[0], data);
	WazaNamePut(Xreg->work[2], 0);
}
static void Waza2AddSub(actWork *Xreg, s8 data)
{
	BreederParam[Xreg->work[2]].waza[1] = WazaAddSubCheck(Xreg->work[2], 
		BreederParam[Xreg->work[2]].waza[1], data);
	WazaNamePut(Xreg->work[2], 1);
}
static void Waza3AddSub(actWork *Xreg, s8 data)
{
	BreederParam[Xreg->work[2]].waza[2] = WazaAddSubCheck(Xreg->work[2], 
		BreederParam[Xreg->work[2]].waza[2], data);
	WazaNamePut(Xreg->work[2], 2);
}
static void Waza4AddSub(actWork *Xreg, s8 data)
{
	BreederParam[Xreg->work[2]].waza[3] = WazaAddSubCheck(Xreg->work[2], 
		BreederParam[Xreg->work[2]].waza[3], data);
	WazaNamePut(Xreg->work[2], 3);
}

//----------------------------------------------------------
//	コンテストの種類を変える
//----------------------------------------------------------
static void MainContestSelect(actWork *Xreg, s8 data)
{
	s8 contype;
	
	if(data > 0)
		data = 1;
	else
		data = -1;
	contype = Xreg->work[3] + data;
	if(contype < 0)
		contype = 0;
	else if(contype > 4)
		contype = 4;
	MainContestTypePut(contype);
	Xreg->work[3] = contype;
	ContestKind = contype;
	SetBreederData(ContestKind, ContestRank);
	BreederNamePutAll(Xreg->work[2]);
	BreederParamPutAll(Xreg->work[2]);
}

//----------------------------------------------------------
//	コンテストのﾗﾝｸを変える
//----------------------------------------------------------
static void ContestRankSelect(actWork *Xreg, s8 data)
{
	if(data > 0)
		ContestRank++;
	else if(ContestRank != 0)
		ContestRank--;
	if(ContestRank > 3)
		ContestRank = 3;
	ContestRankPut(ContestRank);
	SetBreederData(ContestKind, ContestRank);
	BreederNamePutAll(Xreg->work[2]);
	BreederParamPutAll(Xreg->work[2]);
}

//----------------------------------------------------------
//	コンテスト開始
//----------------------------------------------------------
static void DebugContestCall(void)
{
	PaletteAnime();
	if(FadeData.fade_sw == 0)
	{
		MinePokeDataSet();
	//	GetBPAll(0);
		if((ContestTuusin & C_TUUSIN_FLG) == 0)
			GetBPAll(UserWork[0]);
	//	InitContest();
		MainProcChange(InitContest);
	}
}
static void DebugContestStart(actWork *Xreg, s8 data)
{
	if(data == 1)
	{
		UserWork[0] = Xreg->work[3];
		MainProcChange(DebugContestCall);
		PaletteFadeReq(0xffffffff, 0, 0,16, 0);
	}
}

//----------------------------------------------------------
//	ﾌｨｰﾙﾄﾞに戻る
//----------------------------------------------------------
static void DebugContestEnd(actWork *Xreg, s8 data)
{
	int i;
	
	if(data == 1)
	{
		MinePokeDataSet();
		for(i = 0; i < BREEDER_MAX; i++)
			ContBP[i] = GetBP(i, ContestKind);
		MainProcChange(FieldMenuRecover);
	}
}












//=========================================================================
//	デバッグ用メッセージ表示ルーチン
//=========================================================================
static const ActOamData DebugMsgOam =
{
	0,		//Vﾎﾟｼﾞｼｮﾝ
	0,		//拡大縮小ﾓｰﾄﾞ設定(OFF)
	0,		//OBJﾓｰﾄﾞ設定(NORMAL)
	0,		//ﾓｻﾞｲｸ設定(OFF)
	0,		//ｶﾗｰﾓｰﾄﾞ設定(16色)
	1,		//OBJ形状設定(正方形)

	0,		//Hﾎﾟｼﾞｼｮﾝ
	0,		//拡大縮小ﾊﾟﾗﾒｰﾀﾅﾝﾊﾞｰ設定 & H,Vﾌﾘｯﾌﾟ
	1,		//OBJサイズ設定(8x8)

	1023,	//ｷｬﾗｸﾀｰﾅﾝﾊﾞｰ
	0,		//表示ﾌﾟﾗｲｵﾘﾃｨｰ設定
	15,		//ﾊﾟﾚｯﾄﾅﾝﾊﾞｰ
	0,		//AffineParam	add 01/02/06
};

//----------------------------------------------------------
//	文字列表示	※最大8文字
//----------------------------------------------------------
void DebugMsgPrint(u8 *msg, u8 x, u8 y, u8 put_no)
{
	u16 str_len;
	u8 buff[64];
	u8 temp[2];
	int i;
	u8 oamNo;
	
	DIV_DMACLEAR(3, 0, OBJ_VRAM_END - 0x20*8*(put_no+1), 0x20*8, 32);
	str_len = PM_strlen(msg);
	if(str_len > 8)
		str_len = 8;
		
	for(i = 0; i < str_len; i++)
	{
		temp[0] = msg[i];
		temp[1] = EOM_;
		MsgCGXDataSet(buff, temp);
		DIV_DMACOPY(3, &buff[0x20], OBJ_VRAM_END - 0x20*8*(put_no+1) + 0x20*i, 0x20,32);
	}

	//-- OAM設定 --//
	oamNo = 124-put_no*2;
	sys.OAMbuf[oamNo] = DebugMsgOam;
	sys.OAMbuf[oamNo].CharNo = 1024 - (put_no+1) * 8;
	sys.OAMbuf[oamNo].HPos = x;//DebugMsgWork[i][0];
	sys.OAMbuf[oamNo].VPos = y;//DebugMsgWork[i][1];
	
	sys.OAMbuf[oamNo+1] = DebugMsgOam;
	sys.OAMbuf[oamNo+1].CharNo = sys.OAMbuf[oamNo].CharNo + 4;
	sys.OAMbuf[oamNo+1].HPos = x + 32;//DebugMsgWork[i][0] + 32;
	sys.OAMbuf[oamNo+1].VPos = y;//DebugMsgWork[i][1];
}

//----------------------------------------------------------
//	数値表示
//----------------------------------------------------------
void DebugNumMsgPrint(int num, u8 x, u8 y, u8 put_no)
{
	u8 msg[9];
	u8 i = 0;
	
	if(num < 0)
	{
		msg[0] = bou_;
		i++;
	}
	PM_NumMsgSet(&msg[i], abs(num), NUM_MODE_LEFT, 8);
	DebugMsgPrint(msg, x, y, put_no);
}


//=========================================================================
//	コンテストで自キャラのデータに高得点のデータをセットしておく
//=========================================================================
void KoutokutenDataSet(void)
{
	int i;
	
	DebugContestFlag = 1;
	MyBreederNo = 3;
	SetMyBreederData(0);
	for(i = BREEDER_MAX-1; i > -1; i--)
		ContestJyunni[i] = 3-i;
	for(i = 0; i < BREEDER_MAX-1; i++){
		ContBP[i] = 0;
		ContAP[i] = 0;
		ContEvaluation[i] = 0;
		BreederParam[i] = BreederParam[3];
	}
	ContBP[3] = 300;
	ContAP[3] = 400;
	ContEvaluation[3] = 400;
	PortraitDataSet(0xfe);
}

static u8 KoutokutenDataSetMenu(void)
{
	KoutokutenDataSet();
	MenuEnd();
	return 1;
}

static u8 KoutokutenDataReset(void)
{
	int i;
	DebugContestFlag = 0;
	for(i = 0; i < BREEDER_MAX; i++){
		ContBP[i] = 0;
		ContAP[i] = 0;
		ContEvaluation[i] = 0;
	}
	MenuEnd();
	return 1;
}


//=========================================================================
//	美術館データを自キャラの先頭のポケモンで全て埋める
//=========================================================================
static u8 ArtMuseumAllSet(void)
{
	int i;
	
	MyBreederNo = 3;
	SetMyBreederData(0);
	for(i = BREEDER_MAX-1; i > -1; i--)
		ContestJyunni[i] = 3-i;
	for(ContestKind = 0; ContestKind < 5; ContestKind++)
		PortraitDataSet(0xff);
	
	MenuEnd();
	return 1;
}
















//=========================================================================
//
//		すべてのシーケンスを初期化して画面にエラーメッセージを表示
//		タスクがオーバーした時のﾒｯｾｰｼﾞ表示などに使用
//												by matsuda 2002.07.11(木)
//=========================================================================
void ErrorMsgPut(const u8 *err_msg)
{
	*(vu16 *)REG_BG0HOFS = 0;
	*(vu16 *)REG_BG0VOFS = 0;
	*(vu16 *)REG_BG1HOFS = 0;
	*(vu16 *)REG_BG1VOFS = 0;
	*(vu16 *)REG_BG2HOFS = 0;
	*(vu16 *)REG_BG2VOFS = 0;
	*(vu16 *)REG_BG3HOFS = 0;
	*(vu16 *)REG_BG3VOFS = 0;
	*(vu16 *)REG_WIN0H = 0;
	*(vu16 *)REG_WIN0V = 0;
	*(vu16 *)REG_WIN1H = 0;
	*(vu16 *)REG_WIN1V = 0;
	*(vu16 *)REG_DISPCNT = DISP_BG0_ON | DISP_BG1_ON | DISP_BG2_ON | DISP_BG3_ON | DISP_OBJ_ON | DISP_MODE_0 | DISP_OBJ_CHAR_1D_MAP;
	REG_IE_SET( V_BLANK_INTR_FLAG );
	*(vu16 *)REG_STAT = STAT_V_BLANK_IF_ENABLE;

	InitTask();
	InitActor();
	MainProcChange(ErrorMsgMain);
	DIV_DMACLEAR(3, 0, VRAM, VRAM_SIZE, 32);
	PrintScreenInit(CONTEST_TYPE);
	MsgControlInit(&FightMsg,CONTEST_TYPE);
	PrintPaletteInit(CONTEST_TYPE);
	MsgPrint(&FightMsg, err_msg, 1, 9,7);
}

static void ErrorMsgMain(void)
{
	*(vu16 *)REG_BG0HOFS = 0;
	*(vu16 *)REG_BG0VOFS = 0;
	*(vu16 *)REG_BG1HOFS = 0;
	*(vu16 *)REG_BG1VOFS = 0;
	*(vu16 *)REG_BG2HOFS = 0;
	*(vu16 *)REG_BG2VOFS = 0;
	*(vu16 *)REG_BG3HOFS = 0;
	*(vu16 *)REG_BG3VOFS = 0;
}
