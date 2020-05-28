//=========================================================================
//
//		コンテストのスクリプトで使用する関数
//												by matsuda 2001.10.15(月)
//=========================================================================

#include "common.h"
#include "intr.h"
#include "poketool.h"
#include "contest.h"
#include "con_tool.h"
#include "fight.h"
#include "bss.h"
#include "print.h"
#include "decord.h"
#include "palanm.h"
#include "laster.h"
#include "task.h"
#include "actanm.h"
#include "server.h"
#include "agbmons.h"
#include "calctool.h"
#include "waza_eff.h"
#include "con_waza.h"
#include "conres.h"
#include "pokeicon.h"
#include "madefine.h"
#include "wazatool.h"
#include "conscr.h"
#include "fld_main.h"
#include "consio.h"
#include "script.h"
#include "evobj.h"
#include "pokesio.h"
#include "multisio.h"
#include "cable.h"
#include "syswork.h"
#include "menutool.h"
#include "objdata.h"
#include "client_t.h"
#include "d_matsu.h"
#include "mus_tool.h"

//#include "../sxydata/t105_r0102.sym"
#include "../sxydata/sp_contest.sym"	//shimoyamada(2001.12.12)


//----------------------------------------------------------
//	プロトタイプ宣言
//----------------------------------------------------------
static void ContSyokikaReturn(u8 id);
static void RandTaneTrans(u8 id);
static void ContestTypeTrans(u8 id);
static void ContSyokikaEnd(u8 id);
//static void BCanKansi(u8 id);
static void ContestTypeGetCheck(u8 id);
static void ContSioEnd(u8 id);
static void ContSioEndInit(u8 id);
static void ContestVersionTrans(u8 id);
u8 ContestServerVisionCheck(u8 version[]);
static void ContestPokeCGTask( u8 no );
static void BrdSortInitDataTrans(u8 id);




//----------------------------------------------------------
//	指定したコンテストに参加できるか出来ないかﾁｪｯｸ
// 引数：type = 参加するｺﾝﾃｽﾄの種類  rank = ｺﾝﾃｽﾄのﾗﾝｸ
//		 pp = 参加するﾎﾟｹﾓﾝのﾊﾟﾗﾒｰﾀｱﾄﾞﾚｽ
// 戻り値： 1 = 参加できる	0 = 参加できない
//----------------------------------------------------------
void ContestSankaCheck(void)	//u8 type, u8 rank, PokemonParam *pp)
{
	u8 kekka;
	PokemonParam *pp;
	pp = &PokeParaMine[ConTemotiNo];

	kekka = ContestParticipationCheck(pp);

	if(kekka)
	{
		SetBreederData(ContestKind, ContestRank);	//参加するｺﾝﾃｽﾄにあったﾌﾞﾘｰﾀﾞｰﾃﾞｰﾀをｾｯﾄする
		GetBPAll(ContestKind);
//		ContestRank = rank;
//		ContestKind = type;
//		SetJudgeParam();
	}
	
//	return kekka;
	AnswerWork = kekka;
}

//----------------------------------------------------------
//	現在参加してるコンテストのリボンを持っているかチェック
//	戻り値: 0=持ってない	1=持ってる
//----------------------------------------------------------
u8 RibbonCheck(void)
{
	u8 kekka = 0;
	PokemonParam *pp;

	pp = &PokeParaMine[ConTemotiNo];
	switch(ContestKind)
	{
		case STYLE_CONTEST:				//持ちﾎﾟｹﾓﾝの格好よさ
			if(PokeParaGet(pp, ID_stylemedal) > ContestRank)
				kekka = 1;
			break;
		case BEAUTIFUL_CONTEST:			//持ちﾎﾟｹﾓﾝの美しさ
			if(PokeParaGet(pp, ID_beautifulmedal) > ContestRank)
				kekka = 1;
			break;
		case CUTE_CONTEST:				//持ちﾎﾟｹﾓﾝの可愛さ
			if(PokeParaGet(pp, ID_cutemedal) > ContestRank)
				kekka = 1;
			break;
		case CLEVER_CONTEST:				//持ちﾎﾟｹﾓﾝの賢さ
			if(PokeParaGet(pp, ID_clevermedal) > ContestRank)
				kekka = 1;
			break;
		case STRONG_CONTEST:				//持ちﾎﾟｹﾓﾝのたくましさ
			if(PokeParaGet(pp, ID_strongmedal) > ContestRank)
				kekka = 1;
			break;
	}
	return kekka;
}

//----------------------------------------------------------
//	参加してるコンテストﾀｲﾌﾟのリボンﾌﾗｸﾞをｾｯﾄする
//----------------------------------------------------------
void RibbonSet(void)
{
	u8 ribbon;
	
	if(ContestJyunni[MyBreederNo] == 0)	//1位じゃないならはじく
	{
		switch(ContestKind)
		{
			case STYLE_CONTEST:				//持ちﾎﾟｹﾓﾝの格好よさ
				ribbon = PokeParaGet(&PokeParaMine[ConTemotiNo], ID_stylemedal);
				if(ribbon <= ContestRank && ribbon < 4){
					ribbon++;
					PokeParaPut(&PokeParaMine[ConTemotiNo], ID_stylemedal, &ribbon);
				}
				break;
			case BEAUTIFUL_CONTEST:			//持ちﾎﾟｹﾓﾝの美しさ
				ribbon = PokeParaGet(&PokeParaMine[ConTemotiNo], ID_beautifulmedal);
				if(ribbon <= ContestRank && ribbon < 4){
					ribbon++;
					PokeParaPut(&PokeParaMine[ConTemotiNo], ID_beautifulmedal, &ribbon);
				}
				break;
			case CUTE_CONTEST:				//持ちﾎﾟｹﾓﾝの可愛さ
				ribbon = PokeParaGet(&PokeParaMine[ConTemotiNo], ID_cutemedal);
				if(ribbon <= ContestRank && ribbon < 4){
					ribbon++;
					PokeParaPut(&PokeParaMine[ConTemotiNo], ID_cutemedal, &ribbon);
				}
				break;
			case CLEVER_CONTEST:			//持ちﾎﾟｹﾓﾝの賢さ
				ribbon = PokeParaGet(&PokeParaMine[ConTemotiNo], ID_clevermedal);
				if(ribbon <= ContestRank && ribbon < 4){
					ribbon++;
					PokeParaPut(&PokeParaMine[ConTemotiNo], ID_clevermedal, &ribbon);
				}
				break;
			case STRONG_CONTEST:			//持ちﾎﾟｹﾓﾝのたくましさ
				ribbon = PokeParaGet(&PokeParaMine[ConTemotiNo], ID_strongmedal);
				if(ribbon <= ContestRank && ribbon < 4){
					ribbon++;
					PokeParaPut(&PokeParaMine[ConTemotiNo], ID_strongmedal, &ribbon);
				}
				break;
		}
	}
}

//----------------------------------------------------------
//	ｴﾝﾄﾘｰﾅﾝﾊﾞｰからﾌﾞﾘｰﾀﾞｰ名を取得する
// 引数： entry_no = ｴﾝﾄﾘｰﾅﾝﾊﾞｰ 	buff = 取得した名前を入れるﾜｰｸ
//----------------------------------------------------------
void GetBreederName()
{
	PM_strcpy( StrTempBuffer0, BreederParam[ScriptParameter2].name );
}

//----------------------------------------------------------
//	ｴﾝﾄﾘｰﾅﾝﾊﾞｰからﾌﾞﾘｰﾀﾞｰの持ちﾎﾟｹﾓﾝのﾆｯｸﾈｰﾑを取得する
// 引数： entry_no = ｴﾝﾄﾘｰﾅﾝﾊﾞｰ 	buff = 取得した名前を入れるﾜｰｸ
//----------------------------------------------------------
void GetBreederNickName()
{
	PM_strcpy( StrTempBuffer2, BreederParam[ScriptParameter2].nickname );
}


//----------------------------------------------------------
//	ｴﾝﾄﾘｰﾅﾝﾊﾞｰから一次審査の順位を取得する
// 引数： entry_no = ｴﾝﾄﾘｰﾅﾝﾊﾞｰ
// 戻り値：順位(0ｵﾘｼﾞﾝ)
//----------------------------------------------------------
/*
u8 GetPrimaryRank(u8 entry_no)
{
	u8 i, counter;
	
	for(i = 0, counter = 0; i < BREEDER_MAX; i++)
	{
		if(ContBP[entry_no] < ContBP[i])
			counter++;
	}
	return counter;
}
*/
void GetPrimaryRank()
{
	u8 i, counter;
	
	for(i = 0, counter = 0; i < BREEDER_MAX; i++)
	{
		if(ContBP[ScriptParameter2] < ContBP[i])
			counter++;
	}
	ScriptParameter0 = (u16)counter;
	return;
}

//----------------------------------------------------------
//	ｴﾝﾄﾘｰﾅﾝﾊﾞｰからBP値を取得する
// 引数： ScriptParameter2 = ｴﾝﾄﾘｰﾅﾝﾊﾞｰ
// 戻り値：ScriptParameter0 = BP値
//----------------------------------------------------------
void GetBPNum(void)
{
	ScriptParameter0 = ContBP[ScriptParameter2];
}

//=========================================================================
//	優勝したﾌﾞﾘｰﾀﾞｰのｴﾝﾄﾘｰﾅﾝﾊﾞｰを取得する
//=========================================================================
void GetChampEntryNumber(void)
{
	u8 i;
	
	for(i = 0; i < BREEDER_MAX; i++)
	{
		if(ContestJyunni[i] == 0)
			break;
	}
	ScriptParameter1 = (u16)i;
	return;
}

//----------------------------------------------------------
//	優勝したﾌﾞﾘｰﾀﾞｰの名前を取得する
// 引数：buff = 取得した名前を入れるﾜｰｸ
//----------------------------------------------------------
void GetChampBreederName()
{
	u8 i;

	for(i = 0; i < BREEDER_MAX; i++)
		if(ContestJyunni[i] == 0)
			break;
	PM_strcpy( StrTempBuffer2, BreederParam[i].name );
}

//----------------------------------------------------------
//	優勝したﾎﾟｹﾓﾝの名前を取得する
// 引数：buff = 取得した名前を入れるﾜｰｸ
//----------------------------------------------------------
void GetChampPokeName()
{
	u8 i;

	for(i = 0; i < BREEDER_MAX; i++)
		if(ContestJyunni[i] == 0)
			break;
	PM_strcpy( StrTempBuffer0, BreederParam[i].nickname );
}

//=========================================================================
//	2次審査画面呼び出し
//=========================================================================
static void ContestYobidasi(void)
{
	MainProcChange(InitContest);
}

static void FadeWaitContestCall(u8 id)
{
	if(FadeData.fade_sw == 0)
	{
		DelTask(id);
		//ContestTuusin = 0;	//通信ﾌﾗｸﾞOFF
		//InitContest();
//		sys.pMainProc = InitContest;
		MainProcChange(ContestYobidasi);
	}
}
void ContestNijiAppeal(void)
{
	SetForceEvent();	//強制イベントﾌﾗｸﾞｾｯﾄ

	AddTask(FadeWaitContestCall, 10);
	PaletteFadeReq(0xffffffff, 0, 0, 16, 0);
}

//=========================================================================
//	エントリーナンバーから所持しているポケモンのmonsnoを取り出す
//=========================================================================
/*
u16 GetMonsNo(u8 entry_no)
{
	return BreederParam[entry_no].monsno;
}
*/
void GetMonsNo()
{
	ScriptParameter0 = BreederParam[ScriptParameter2].monsno;
	return;
}

//=========================================================================
//	結果発表画面呼び出し
//=========================================================================
static void FadeWaitContestResultCall(u8 id)
{
	if(FadeData.fade_sw == 0)
	{
		DelTask(id);
		MainProcChange(ContestResultInit);
	}
}
void ContestResultScr(void)
{
	SetForceEvent();	//強制イベントﾌﾗｸﾞｾｯﾄ

	AddTask(FadeWaitContestResultCall, 10);
	PaletteFadeReq(0xffffffff, 0, 0, 16, 0);
}


//=========================================================================
//	通信時の自分のｴﾝﾄﾘｰﾅﾝﾊﾞｰを取得する
//=========================================================================
void GetEntryNo(void)
{
	ScriptParameter0 = (u16)MyBreederNo;
	return;
}

//=========================================================================
//	通信時の4台が選んだｺﾝﾃｽﾄの種類のﾁｪｯｸとコンテスト通信初期化
// 引数：選択ｳｨﾝﾄﾞｳで選んだ位置(0ｵﾘｼﾞﾝ)
// 返り値：通信完了後にScriptParameter0に値が入ります。
//			0 = 正常終了	1 = 選んだｺﾝﾃｽﾄの種類が違う		2 = 通信失敗
//=========================================================================
void ContestTuusinInit(u8 list_no)
{
	u8 id;
//	u8 kansi;
	SetForceEvent();	//強制イベントﾌﾗｸﾞｾｯﾄ
	//通信初期化
//	PokemonSioNinshouNo = NINSHOU_CONTEST;
	id = AddTask(ContestSioInit, 0);
	ChangeTask(id, ContestSioInit, ContSyokikaReturn);
	TaskTable[id].work[9] = list_no;
}

//-- ﾌﾞﾘｰﾀﾞｰﾃﾞｰﾀ転送 --//
static void ContSyokikaReturn(u8 id)
{
	SetMyBreederData(ConTemotiNo);//↑の初期化でﾌﾞﾘｰﾀﾞｰNoが入るので必ず初期化の後に呼ぶ事！
	ChangeTask(id, BreederTransData, RandTaneTrans);
}

//-- ﾗﾝﾀﾞﾑのﾀﾈを転送 --//
static void RandTaneTrans(u8 id)
{
//	ChangeTask(id, RandTaneTransData, ContestTypeTrans);
	ChangeTask(id, RandTaneTransData, ContestVersionTrans);
}

//-- ｺﾝﾃｽﾄのｻｰﾊﾞｰﾊﾞｰｼﾞｮﾝを転送 --//
static void ContestVersionTrans(u8 id)
{
	ChangeTask(id, ContestVersionGetAllData, ContestTypeTrans);
}

//-- ｺﾝﾃｽﾄﾀｲﾌﾟを転送 --//
static void ContestTypeTrans(u8 id)
{
	ChangeTask(id, ContestTypeGetAllData, ContestTypeGetCheck);
}

//-- 転送されてきたｺﾝﾃｽﾄﾀｲﾌﾟのﾁｪｯｸ --//
static void ContestTypeGetCheck(u8 id)
{
	u8 type[BREEDER_MAX];
	u8 i;
	u8 version[BREEDER_MAX];
	
	for(i = 0; i < BREEDER_MAX; i++)
		type[i] = TaskTable[id].work[1 + i];
	for(i = 0; i < BREEDER_MAX; i++)
	{
		if(type[0] != type[i])
			break;
	}
	if(i == BREEDER_MAX)
		ScriptParameter0 = 0;	//選んだｺﾝﾃｽﾄﾀｲﾌﾟが同じ
	else
		ScriptParameter0 = 1;	//選んだｺﾝﾃｽﾄﾀｲﾌﾟが違う
	//temp_rand = r_next;
	
	//-- ｻｰﾊﾞｰVersionﾁｪｯｸ --//
	for(i = 0; i < BREEDER_MAX; i++){
		version[i] = TaskTable[id].work[5+i];
	}
	ContestSioOya = ContestServerVisionCheck(version);
	//-- Versionﾁｪｯｸ終了 --//
	
	//-- ContBP転送 ※必ず親(一番最新のｻｰﾊﾞｰ)が決まってからやること！ --//
	GetBPAll(ContestKind);
//	ChangeTask(id, ContBPAllTransData, ContSyokikaEnd);
	ChangeTask(id, ContBPAllTransData, BrdSortInitDataTrans);
	
//	TaskTable[id].TaskAdrs = ContSyokikaEnd;
}

//-- 初回のBrdSortを転送 --//
static void BrdSortInitDataTrans(u8 id)
{
	BreederDataSort(0);
	ChangeTask(id, BrdSortInitAllTransData, ContSyokikaEnd);
}

//-- ｻｰﾊﾞｰﾊﾞｰｼﾞｮﾝﾁｪｯｸ：戻り値、親の通信ID --//
u8 ContestServerVisionCheck(u8 version[])
{
	int i;
	u8 oya;
	
	oya = 0;
	for(i = 1; i < BREEDER_MAX; i++){
		if(version[oya] < version[i]){
			oya = i;
			continue;
		}
		else if(version[oya] == version[i]){
			//同じVersionなら通信IDが若い方がなる
			continue;
		}
	}
	return oya;
}

//-- 通信終了 --//
static void ContSyokikaEnd(u8 id)
{
	if(ScriptParameter0 == 1){	//選んだｺﾝﾃｽﾄが違うなら通信切断
		if(SplitDataSendStatus())
			TaskTable[id].TaskAdrs = ContSioEndInit;
	}
	else{
//		DelTask(TaskTable[id].work[10]);	//Bｷｬﾝ監視ﾀｽｸ
		DelTask(id);
		ResetForceEvent();	//強制ｲﾍﾞﾝﾄﾌﾗｸﾞ解除
		ContinueFieldScript();
	}
}

static void ContSioEndInit(u8 id)
{
	SetSioEndDataStart();
	TaskTable[id].TaskAdrs = ContSioEnd;
}

static void ContSioEnd(u8 id)
{
	if(pokemon_sio_flag == 0){
//		DelTask(TaskTable[id].work[10]);	//Bｷｬﾝ監視ﾀｽｸ
		DelTask(id);
		//PokemonMultiSioEnd();
		
		ResetForceEvent();	//強制ｲﾍﾞﾝﾄﾌﾗｸﾞ解除
		ContinueFieldScript();
		//GetBPAll(ContestKind);
	}
}


#include "../script/savework.h"		//OBJCHRWORK参照のため
#include "sysflag.h"				//SVWK_START参照のため
//=========================================================================
//	ブリーダーデータに合わせたトレーナーｷｬﾗを表示する
// 引数：map = ｺﾝﾃｽﾄ会場のﾏｯﾌﾟID    DIV = ｺﾝﾃｽﾄ会場のDIV ID
//		 site = ｷｬﾗｸﾀｰが最初に向いている向き(0:上, 1:左 2:下 3:右)
//=========================================================================
//void SetBreederObj(u8 map, u8 div)//, u8 site)
void SetBreederObj()//, u8 site)
{
	Fld.EventWork[OBJCHRWORK1-SVWK_START] = (u16)BreederParam[0].pattern;
	Fld.EventWork[OBJCHRWORK2-SVWK_START] = (u16)BreederParam[1].pattern;
	Fld.EventWork[OBJCHRWORK3-SVWK_START] = (u16)BreederParam[2].pattern;

	//元から上向きに配置しておけばよい
	/*
	EvObjChgSiteId(STUDYM1_01_SP_CONTEST, map, div, site);
	EvObjChgSiteId(FIGHTER1_01_SP_CONTEST, map, div, site);
	EvObjChgSiteId(GENTLEM1_01_SP_CONTEST, map, div, site);
	*/
}

//=========================================================================
//	優勝したブリーダーのOBJ IDを取得
//=========================================================================
void GetChampObjID(void)
{
	u8 i, id;
	
	//i = GetChampEntryNumber();
	i = (u8)ScriptParameter1;
	switch(i)
	{
		/*
		case 0:
			id = HERO_01_SP_CONTEST;
			break;
		case 1:
			id = HERO_02_SP_CONTEST;
			break;
		case 2:
			id = HERO_03_SP_CONTEST;
			break;
		default:
			id = HERO;
			break;
		*/

		case 0:
			id = STUDYM1_01_SP_CONTEST;
			break;
		case 1:
			id = FIGHTER1_01_SP_CONTEST;
			break;
		case 2:
			id = GENTLEM1_01_SP_CONTEST;
			break;
		default:
			id = HERO;
			break;
	}
	ScriptParameter0 = (u16)id;
	return;
}


//=========================================================================
//	ｴﾝﾄﾘｰﾅﾝﾊﾞｰからﾌﾞﾘｰﾀﾞｰ名を取得する
//	ｴﾝﾄﾘｰﾅﾝﾊﾞｰからﾌﾞﾘｰﾀﾞｰの持ちﾎﾟｹﾓﾝのﾆｯｸﾈｰﾑを取得する
//	エントリーナンバーから所持しているポケモンのmonsnoを取り出す
//=========================================================================
void SetBrdName(void)
{
	GetBreederName();
	GetBreederNickName();
	GetMonsNo();
}

//----------------------------------------------------------
//	今参加したｺﾝﾃｽﾄ種類の美術館用の絵が既に飾られてるか調べる
// ScriptParameter0に結果が入ります。
//	0 = 空っぽ(飾られてない)	1 = 既に絵が飾られてる
//----------------------------------------------------------
void ArtMuseumPortraitCheck(void)
{
	u8 no;
	
	switch(ContestKind)
	{
		case STYLE_CONTEST:
			no = 8;
			break;
		case BEAUTIFUL_CONTEST:
			no = 9;
			break;
		case CUTE_CONTEST:
			no = 10;
			break;
		case CLEVER_CONTEST:
			no = 11;
			break;
		case STRONG_CONTEST:
		default:
			no = 12;
			break;
	}
	if(Fld.PortraitData[no].monsno == 0)
		ScriptParameter0 = 0;
	else
		ScriptParameter0 = 1;
}

//----------------------------------------------------------
//	美術館に新しい絵のﾃﾞｰﾀをｾｯﾄする
//----------------------------------------------------------
void ArtMuseumPortraitSet(void)
{
	PortraitDataSet(0xff);
}

//----------------------------------------------------------
//	ﾏｽﾀｰﾗﾝｸ、高得点で優勝したか調べる
//	ScriptParameter0に結果が入ります
//	0 = 条件を満たしてない		1 = 全ての条件を満たしてる
//----------------------------------------------------------
void ArtMuseumCondCheck(void)
{
	if(ContestJyunni[MyBreederNo] == 0 && ContestRank == MASTER_RANK
		&& ContEvaluation[MyBreederNo] >= ARTMUSEUM_POINT)
	{
		ScriptParameter0 = 1;
	}
	else
		ScriptParameter0 = 0;
}

//----------------------------------------------------------
//	美術館に何枚の絵が飾られているか調べる
//  0～5 (0だと1枚も飾られてない)
//----------------------------------------------------------
u8 ArtMuseumCountCheck(void)
{
	int i;
	u8 counter = 0;
	
	for(i = 8; i < 13; i++)
	{
		if(Fld.PortraitData[i].monsno != 0)
			counter++;
	}
	return counter;
}

//----------------------------------------------------------
//	BP順位からﾎﾟｹﾓﾝのﾆｯｸﾈｰﾑ、ﾌﾞﾘｰﾀﾞｰ名を取り出す
//	引数:ScriptParameter2に何位のﾌﾞﾘｰﾀﾞｰﾃﾞｰﾀを取得するか渡してください
//			(0:1位  1:2位  2:3位  3:4位)
//	戻り値:同率順位の時もあるので、ScriptParameter2に改めて現在の順位を入れなおして返します
//			(0:1位　1:2位　2:3位　3:4位　4:同率1位　5:同率2位　6:同率3位　7:同率4位)
//			StrTempBuffer0に指定順位のﾎﾟｹﾓﾝのﾆｯｸﾈｰﾑ
//			StrTempBuffer1に指定順位のﾌﾞﾘｰﾀﾞｰﾈｰﾑ
//			が入ります。
//----------------------------------------------------------
void GetBPBreederData(void)
{
	s16 TempBP[BREEDER_MAX];
	int i,j,t;
	s8 douritu;
	u8 MyJyunni, MyCount, tempMyCount;
	s16 MyBP;
	
	for(i = 0; i < BREEDER_MAX; i++)
		TempBP[i] = ContBP[i];
	
	for(i = 0; i < BREEDER_MAX - 1; i++){	//BPを降順にソート
		for(j = BREEDER_MAX-1; j > i; j--){
			if(TempBP[j-1] < TempBP[j]){
				t = TempBP[j];
				TempBP[j] = TempBP[j-1];
				TempBP[j-1] = t;
			}
		}
	}
	
	MyBP = TempBP[ScriptParameter2];
	douritu = 0;
	MyCount = 0;
	for(i = 0; i < BREEDER_MAX; i++){
		if(TempBP[i] == MyBP){	//同じBP値の人が何人いるかﾁｪｯｸ
			douritu++;			//同じBP値だった人をｶｳﾝﾄ
			if(i == ScriptParameter2)
				MyCount = douritu;	//同じBP値だった時の何番目にﾋｯﾄだったか保存
		}
	}
	
	//-- 同率も考えた時実際の順位はいくつなのか調べる --//
	for(i = 0; i < BREEDER_MAX; i++){
		if(TempBP[i] == MyBP)
			break;
	}
	MyJyunni = i;
	
	//-- 指定順位のﾌﾞﾘｰﾀﾞｰﾃﾞｰﾀﾅﾝﾊﾞｰを取り出す --//
	tempMyCount = MyCount;
	for(i = 0; i < BREEDER_MAX; i++){
		if(MyBP == ContBP[i]){
			if(tempMyCount == 1)
				break;
			tempMyCount--;
		}
	}
	PM_strcpy(StrTempBuffer0, BreederParam[i].nickname);
	PM_strcpy(StrTempBuffer1, BreederParam[i].name);
	if(douritu == 1)	//同率の人がいない
		ScriptParameter2 = MyJyunni;
	else{				//同率の人がいる
		if(MyCount == douritu)//同率の人がいても自分の方が後ろにあったならば普通の順位を返す
			ScriptParameter2 = MyJyunni;
		else
			ScriptParameter2 = MyJyunni + BREEDER_MAX;
	}
}

//=========================================================================
//	似顔絵画像を画面に表示する
//=========================================================================
extern void contest_picture_init(void);

void AfterPutPortrait(void)
{
	MainProcChange(FieldScriptRecover);
}

void PortraitPicturePut(void)
{
	if(DebugContestFlag){
		KoutokutenDataSet();	//受付で選択したﾀｲﾌﾟの絵が表示されるようにﾃﾞｰﾀを再ｾｯﾄ
		UserWork[TEMP_PORTRAIT_MSGFLG] = 1;	//現状では特にﾃﾞｰﾀがないので0
		UserWork[TEMP_PORTRAIT_PLACE] = PortraitDataSpaceSearch(0xfe, 0);
		PortraitDataSet(MASTER_RANK);			//似顔絵ﾃﾞｰﾀ登録
		DebugContestFlag = 0;
	}
	MainProcChange(contest_picture_init);
	sys.pReturnProc = AfterPutPortrait;
}


//=========================================================================
//	コンテスト通信時、OBJCHRWORK1～にOBJｷｬﾗﾃﾞｰﾀをｾｯﾄ
//=========================================================================
void ContestSioObjChrSet(void)
{
	SetEventWorkValue(OBJCHRWORK1, BreederParam[0].pattern);
	SetEventWorkValue(OBJCHRWORK2, BreederParam[1].pattern);
	SetEventWorkValue(OBJCHRWORK3, BreederParam[2].pattern);
	SetEventWorkValue(OBJCHRWORK4, BreederParam[3].pattern);
}


//=========================================================================
//	ﾏｽﾀｰﾗﾝｸ、高得点で優勝し、なおかつﾌﾞﾛﾏｲﾄﾞﾘﾎﾞﾝを持っているかチェックして結果を返す
//
//	全ての条件を満たしていて、ﾌﾞﾛﾏｲﾄﾞﾘﾎﾞﾝを持っていないなら、ﾌﾞﾛﾏｲﾄﾞﾘﾎﾞﾝをｾｯﾄして
//	1を返す。
//　条件を満たしていない、又は既にブロマイドリボンを持っている場合は0を返す。
//=========================================================================
u8 BromideRibbonCheckSet(void)
{
	u8 ribon;
	
	ribon = PokeParaGet(&PokeParaMine[ConTemotiNo], ID_bromide_ribbon);
	if(ribon)
		return 0;
	
	if(ContestJyunni[MyBreederNo] == 0 && ContestRank == MASTER_RANK
		&& ContEvaluation[MyBreederNo] >= ARTMUSEUM_POINT)
	{
		ribon = 1;
		PokeParaPut(&PokeParaMine[ConTemotiNo], ID_bromide_ribbon, &ribon);
		return 1;
	}
	else
		return 0;
}

//=========================================================================
//	デバックフラグが立っていたら1を返す
//	立っていない時は0を返す
//=========================================================================
u8 CheckDebugContestFlag(void)
{
	return DebugContestFlag;
}



//=========================================================================
//	ｺﾝﾃｽﾄでのポケモンCG表示セット
//	ScriptParameter2に表示するブリーダーのｴﾝﾄﾘｰNoが入っている
//=========================================================================
void ContestPokeCGWinOpen(void)
{
	u8 no,act;
	u16 monsno;
	u32 personal_rnd;
	PalData *PD;
	u32 id_no;
	s16 x,y;
	
	if( CheckTaskNo( ContestPokeCGTask ) != NOT_EXIST_TASK_ID )
		return;

	x = 10;
	y = 3;
	NMenuWinBoxWrite( x, y, x+9, y+10 );
	
	monsno = BreederParam[ScriptParameter2].monsno;
	personal_rnd = BreederParam[ScriptParameter2].personal_rnd;
	id_no = BreederParam[ScriptParameter2].id_no;
	no = AddTask( ContestPokeCGTask, 80 );
	TaskTable[no].work[0] = 0;
	TaskTable[no].work[1] = monsno;

//	act = FePokeSet( mons_no, (x+1)*8+32, (y+1)*8+32, POKECG_ACTPRI );
	DecordPokeCellMakeBuchi( &PM2FObjDataCell[monsno],
		pm2fpara[monsno].size, pm2fpara[monsno].patcnt,
		(void *)DecordAdrs[0],
		(void *)DecordAdrs[1], monsno, personal_rnd);
	//DecordPalSet( (PalData*)&PM2NObjDataPal[no] );
	PD = (PalData*)PokePalDataGetPara(monsno, id_no, personal_rnd);
	DecordPalSet(PD);
	PokeActHeaderMake(monsno, 1 );
	PokeActHeader.palNo = PD->reg_num;
	act = AddActor(&PokeActHeader, (x+1)*8+32, (y+1)*8+32, 0);

	TaskTable[no].work[2] = act;
	TaskTable[no].work[3] = x;
	TaskTable[no].work[4] = y;
	ActWork[act].move = DummyActMove;
	ActWork[act].oamData.Priority = 0;
};

//----------------------------------------------------------
//	ポケモンCG表示をDelする
//----------------------------------------------------------
void ContestPokeCGWinClose( void )
{
	u8 res;
	
	res = CheckTaskNo( ContestPokeCGTask );
	if( res == NOT_EXIST_TASK_ID )
		return;
	TaskTable[res].work[0]++;
}

//----------------------------------------------------------
//	CGwinポケモン管理ﾀｽｸ
//----------------------------------------------------------
static void ContestPokeCGTask( u8 no )
{
	TASK_TABLE * my;
	actWork *act;
	
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
		//FePokeDel( &ActWork[ my->work[2] ] );
		act = &ActWork[my->work[2]];
		ObjPalRegNumDel( ObjPalNumIdGet(act->oamData.Pltt) );
		if( act->oamData.AffineMode )
		{
			AffineWorkNumDel( act->oamData.AffineParamNo );
		}
		DelActor( act );

		my->work[0]++;
		break;
	
	case 3:
		//NMenuBoxClear( POKECG_WINX1, POKECG_WINY1, POKECG_WINX2, POKECG_WINY2 );
		NMenuBoxClear( my->work[3], my->work[4], my->work[3]+9, my->work[4]+10 );
		DelTask( no );
		break;
	};
};


//=========================================================================
//	通信時に鳴らす曲のﾌﾗｸﾞを返す
//=========================================================================
void ContestMusSet(void)
{
	if(ContestTuusin & C_TUUSIN_FLG){
		AnswerWork = GetSioConnectId();
	}
	else{
		AnswerWork = 4;
	}
}


//=========================================================================
//	1次審査の画面で使用しているランダムのタネを通信時でも共有出来るようにする
//	AnsWorkにランダムの範囲が入った状態で呼ばれ、AnsWorkに結果をそのまま返す
//=========================================================================
void GetContRnd(void)
{
	u16 rand;
	
	if(ContestTuusin & C_TUUSIN_FLG){
		temp_rand = temp_rand *1103515245L + 24691;
		rand = (u16)(temp_rand / 65536L);
		AnswerWork = rand % AnswerWork;
	}
	else
		AnswerWork = pp_rand() % AnswerWork;
}

