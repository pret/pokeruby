//=========================================================================
//	
//	戦闘で使用する技エフェクト、ステータスエフェクト以外のエフェクト類
//
//											by matsuda 2002.07.04(木)
//=========================================================================
#include "common.h"
#include "actor.h"
#include "actanm.h"
#include "madefine.h"
#include "wazatool.h"
#include "waza_dat.h"
#include "waza_eff.h"
#include "server.h"
#include "calctool.h"
#include "bss.h"
#include "cli_ef.h"
#include "laster.h"
#include "task.h"
#include "pm_aff.h"
#include "gauge.h"
#include "client.h"
#include "ef_tool.h"
#include "fight.h"
#include "palanm.h"
#include "decord.h"
#include "contest.h"
#include "cli_def.h"
#include "mus_tool.h"
#include "cli_num.h"
#include "item.h"
#include "client_t.h"
#include "a_mine.h"
#include "poketool.h"
#include "wazano.def"



//----------------------------------------------------------
//	プロトタイプ宣言
//----------------------------------------------------------
static void RareStarEffectTail(u8 id);
static void CircleStarWaitTask(u8 id);
static void CircleStarSeq(actWork *xreg);
static void StraightStarSeq(actWork *xreg);
u8 HikariEffectSet(u8 x, u8 y, u8 oam_pri, u8 act_pri, u8 tblno);
static void MonsterBallHikariActorSetTask(u8 id);
static void MonsterHikariInitSeq(actWork *xreg);
static void MonsterHikariMainSeq(actWork *xreg);
static void OblongCircleHikariActorSetTask(u8 id);
static void OblongCircleHikariInitSeq(actWork *xreg);
static void HikariEffectDel(actWork *xreg);
static void LongwiseCircleHikariActorSetTask(u8 id);
static void SlowCircleHikariActorSetTask(u8 id);
u8 HikariColorEffectSet(u8 type, u8 palno, u32 haikei_palbit, u8 tblno);
static void HikariColorEffectInMain(u8 id);
static void HikariColorEffectOutInit(u8 id);
static void HikariColorEffectOutMain(u8 id);
static void EightCircleHikariActorSetTask(u8 id);
static void EightCircleHikariInitSeq(actWork *xreg);
static void NormalCircleHikariActorSetTask(u8 id);
static void DoubleCircleHikariActorSetTask(u8 id);
static void TwinCircleHikariActorSetTask(u8 id);
static void CrosCircleHikariInitSeq(actWork *xreg);
static void CrosCircleHikariActorSetTask(u8 id);
u8 BallItemNoTblNoConv(u16 itemno);
static void MonsBallActCheckWait(u8 id);
static void MonsterBallSeq(actWork *xreg);
static void MonsterBallMainSeq(actWork *xreg);
static void MonsterBallOpenSeq(actWork *xreg);
static void MonsterBallBaundSeq(actWork *xreg);
static void MonsterBallGetGugaInitSeq(actWork *xreg);
static void MonsterBallGetGuga(actWork *xreg);
static void MonsterBallGetSuccessInit(actWork *xreg);
static void MonsterBallGetSeq(actWork *xreg);
static void MonsterBallEffectEnd(actWork *xreg);
static void MonsterBallGetFailInitSeq(actWork *xreg);
static void MonsterBallGetFailMain(actWork *xreg);
static void MonsterBallCloseWaitSeq(actWork *xreg);
static void MonsterBallCloseInit(actWork *xreg);
static void HajikaretaSeq(actWork *xreg);
static void HajikaretaMainSeq(actWork *xreg);
void AddMonsBallActorSafari(u8 id);
static void MonsBallTrainerAnmWait(u8 id);
static void TrainerAnmEndWait(u8 id);
static void MonsterBallBanishEffect(actWork *xreg);
static void MonsterBallGetFailWaitInitSeq(actWork *xreg);



//=========================================================================
//
//		レベルアップエフェクト(ゲージに対して行なう)
//												by matsuda 2002.07.04(木)
//=========================================================================
static void LvUpEffMainTask(u8 id);

/*------
const PalData BattleEffGaugePal = {
	(void*)gauge55_pcl_ADRS, CELLID_EffGaugeColor
};
const PalData BattleEffGaugePartsPal = {
	(void*)gauge55_pcl_ADRS+0x20, CELLID_EffGaugePartsColor
};
---------*/

//----------------------------------------------------------
//	offset なし
//----------------------------------------------------------
#define LVUPEFF_ADD_Y	0x0280
#define LVUPEFF_BLDWAIT	2
#define LVUP_BLD		8	//最終的なBLD値
void LvUpEffTask(u8 id)
{
	WazaBgData wazabg;
	u8 client_no;
	u8 gauge, gauge2, parts;
	u8 winact, winact2;
	
	client_no = AttackNo;
	
	Win0H = 0;
	Win0V = 0;
	*(vu16*)REG_WININ = (WIN_ALL_ON << 8) | WIN_ALL_ON;
	*(vu16*)REG_WINOUT = (WIN_ALL_ON << 8) | 0x3d;
	*(vu16*)REG_DISPCNT |= DISP_OBJWIN_ON;
	*(vu16*)REG_BLDCNT = BLD_A_BLEND_MODE | BLD_2ND_ALL | BLD_BG1_1ST;
	*(vu16*)REG_BLDALPHA = 16 << 8;

	(*(vBgCnt *)REG_BG1CNT).Priority = 0;
	(*(vBgCnt *)REG_BG1CNT).Size = 0;
	(*(vBgCnt *)REG_BG1CNT).Loop = 1;
	//ｴﾌｪｸﾄの間だけｷｬﾗｸﾀﾍﾞｰｽを変更(ｽｸﾘｰﾝﾃﾞｰﾀの関係で)
	(*(vBgCnt *)REG_BG1CNT).CharBasep = 1;

	//-- WinObj --//
	gauge = ClientGaugeSt[client_no];		//本体　左側
	gauge2 = ActWork[gauge].oamData.AffineParam;	//本体　右側
	parts = ActWork[gauge].work[5];			//パーツ
	winact = AddBanishActor(DummyActMove);
	winact2 = AddBanishActor(DummyActMove);
	//エフェクト中だけゲージのプライオリティを下げる
	ActWork[gauge].oamData.Priority = 1;
	ActWork[gauge2].oamData.Priority = 1;
	ActWork[parts].oamData.Priority = 1;
	//アクターをコピーして作成
	ActWork[winact] = ActWork[gauge];
	ActWork[winact2] = ActWork[gauge2];
	ActWork[winact].oamData.ObjMode = 2;	//OBJ Win
	ActWork[winact2].oamData.ObjMode = 2;
	ActWork[winact].move = DummyActMove;
	ActWork[winact2].move = DummyActMove;
	
	//-- 光エフェクト --//
	GetWazaEffBgAdrs(&wazabg);
	DIV_DMACLEAR(3, 0, wazabg.ScrnAdrs, 0x1000, 32);
	DecordVram((void*)gauge_ef_psc_ADRS, wazabg.ScrnAdrs);
	DecordVram((void*)gauge_ef_pch_ADRS, wazabg.CharAdrs);
	DecordPaletteWork((void*)s_ref_pcl_ADRS, wazabg.PlttNo*16, 0x20);
	
	ScrX1 = -ActWork[winact].x + 32;
	ScrY1 = -ActWork[winact].y + 32-64;
	TaskTable[id].work[1] = LVUPEFF_ADD_Y;
	TaskTable[id].work[0] = winact;
	TaskTable[id].work[2] = winact2;
	TaskTable[id].TaskAdrs = LvUpEffMainTask;
}

static void LvUpEffMainTask(u8 id)
{
	WazaBgData wazabg;
	u8 client_no;
	u8 gauge, gauge2, parts;
	
	client_no = AttackNo;
	TaskTable[id].work[13] += TaskTable[id].work[1];
	ScrY1 += (u16)TaskTable[id].work[13] >> 8;
	TaskTable[id].work[13] &= 0x00ff;
	switch(TaskTable[id].work[15]){
		case 0:
			if(TaskTable[id].work[11]++ < LVUPEFF_BLDWAIT)
				break;
			TaskTable[id].work[11] = 0;
			TaskTable[id].work[12]++;
			*(vu16*)REG_BLDALPHA = ((16-TaskTable[id].work[12])<<8) | TaskTable[id].work[12];
			if(TaskTable[id].work[12] == LVUP_BLD)
				TaskTable[id].work[15]++;
			break;
		case 1:
			TaskTable[id].work[10]++;
			if(TaskTable[id].work[10] == 30)
				TaskTable[id].work[15]++;
			break;
		case 2:
			if(TaskTable[id].work[11]++ < LVUPEFF_BLDWAIT)
				break;
			TaskTable[id].work[11] = 0;
			TaskTable[id].work[12]--;
			*(vu16*)REG_BLDALPHA = ((16-TaskTable[id].work[12])<<8) | TaskTable[id].work[12];
			if(TaskTable[id].work[12] == 0){
				PokeBGDropClear(0);
				Win0H = 0;
				Win0V = 0;
				*(vu16*)REG_WININ = (WIN_ALL_ON << 8) | WIN_ALL_ON;
				*(vu16*)REG_WINOUT = (WIN_ALL_ON << 8) | WIN_ALL_ON;
				if(ContestCheck() == 0)
					(*(vBgCnt *)REG_BG1CNT).CharBasep = 0;
				*(vu16*)REG_DISPCNT ^= DISP_OBJWIN_ON;
				*(vu16*)REG_BLDCNT = 0;
				*(vu16*)REG_BLDALPHA = 0;
				DelActor(&ActWork[TaskTable[id].work[0]]);
				DelActor(&ActWork[TaskTable[id].work[2]]);
				GetWazaEffBgAdrs(&wazabg);
				DIV_DMACLEAR(3, 0, wazabg.ScrnAdrs, 0x800, 32);
				(*(vBgCnt *)REG_BG1CNT).Loop = 0;
				gauge = ClientGaugeSt[client_no];		//本体　左側
				gauge2 = ActWork[gauge].oamData.AffineParam;	//本体　右側
				parts = ActWork[gauge].work[5];			//パーツ
				ActWork[gauge].oamData.Priority = GAUGE_OAM_PRI;
				ActWork[gauge2].oamData.Priority = GAUGE_OAM_PRI;
				ActWork[parts].oamData.Priority = GAUGE_OAM_PRI;
				DelTaskEffect(id);
			}
			break;
	}
}

//=========================================================================
//	ゲージのパレットをｴﾌｪｸﾄ用のパレットをセットして、それにする
//=========================================================================
//-- ｴﾌｪｸﾄ用パレットをセット --//
void LvUpGaugePaletteSet(u8 id)
{
	u8 eff_pal, eff_pal2;
	u8 gauge, gauge2, parts;
	u16 pal0,pal1;
	
	gauge = ClientGaugeSt[AttackNo];		//本体　左側
	gauge2 = ActWork[gauge].oamData.AffineParam;	//本体　右側
	parts = ActWork[gauge].work[5];			//パーツ

	//ｹﾞｰｼﾞにｶﾗｰﾌｪｰﾄﾞをかけると場にあるｹﾞｰｼﾞ全てにかかってしまうので別にﾊﾟﾚｯﾄを用意する
//	eff_pal = ObjPalSet(&BattleEffGaugePal);
//	eff_pal2 = ObjPalSet(&BattleEffGaugePartsPal);
	eff_pal = ObjPalNumSet(CELLID_EffGaugeColor);
	eff_pal2 = ObjPalNumSet(CELLID_EffGaugePartsColor);
	pal0 = ActWork[gauge].oamData.Pltt * 16 + 16*16;
	pal1 = ActWork[parts].oamData.Pltt * 16 + 16*16;
	PaletteWorkSet((void*)&PaletteWork[pal0], 16*16+16*eff_pal, 32);
	PaletteWorkSet((void*)&PaletteWork[pal1], 16*16+16*eff_pal2, 32);
	ActWork[gauge].oamData.Pltt = eff_pal;
	ActWork[gauge2].oamData.Pltt = eff_pal;
	ActWork[parts].oamData.Pltt = eff_pal2;
	
	DelTaskEffect(id);
}

//-- 元のゲージのパレットに戻す --//
void LvUpGaugePaletteRecover(u8 id)
{
	u8 gauge, gauge2, parts;
	u8 pal, pal2;
	
	gauge = ClientGaugeSt[AttackNo];		//本体　左側
	gauge2 = ActWork[gauge].oamData.AffineParam;	//本体　右側
	parts = ActWork[gauge].work[5];			//パーツ

	ObjPalRegNumDel(CELLID_EffGaugeColor);
	ObjPalRegNumDel(CELLID_EffGaugePartsColor);
	pal = ObjPalNumGet(CELLID_BattleGaugeMine1);
	pal2 = ObjPalNumGet(CELLID_BattleGaugeParts0);
	ActWork[gauge].oamData.Pltt = pal;
	ActWork[gauge2].oamData.Pltt = pal;
	ActWork[parts].oamData.Pltt = pal2;

	DelTaskEffect(id);
}

//=========================================================================
//	黒い矢印の部分を光らせる
// 0: 0=黒い矢印部分  1=本体
// 1: wait
//=========================================================================
static void LvUpEffColorFadeMain(u8 id);

#define LVUP_ADD_EVY	2
void LvUpEffColorFade(u8 id)
{
	TaskTable[id].work[10] = WazaEffWork[0];
	TaskTable[id].work[11] = WazaEffWork[1];
	TaskTable[id].TaskAdrs = LvUpEffColorFadeMain;
}

static void LvUpEffColorFadeMain(u8 id)
{
	u8 color;
	u16 pal;
	
	TaskTable[id].work[0]++;
	if(TaskTable[id].work[0]++ < TaskTable[id].work[11])
		return;
	
	TaskTable[id].work[0] = 0;
	pal = ObjPalNumGet(CELLID_EffGaugeColor);
	if(TaskTable[id].work[10] == 0)
		color = 6;
	else
		color = 2;
	
	switch(TaskTable[id].work[1]){
		case 0:
			TaskTable[id].work[2] += LVUP_ADD_EVY;
			if(TaskTable[id].work[2] > 16)
				TaskTable[id].work[2] = 16;
			SoftFade(16*16+16*pal + color, 1, TaskTable[id].work[2], 0x7f74);
			if(TaskTable[id].work[2] == 16)
				TaskTable[id].work[1]++;
			break;
		case 1:
			TaskTable[id].work[2] -= LVUP_ADD_EVY;
			if(TaskTable[id].work[2] < 0)
				TaskTable[id].work[2] = 0;
			SoftFade(16*16+16*pal + color, 1, TaskTable[id].work[2], 0x7f74);
			if(TaskTable[id].work[2] == 0)
				DelTaskEffect(id);
	}
}










//=========================================================================
//
//		自機側ポケモン引っ込めるエフェクト
//												by matsuda 2002.07.09(火)
//=========================================================================
//----------------------------------------------------------
//		ポケモンを小さくして消す
//	offset なし
//----------------------------------------------------------
#define POKERET_MINE_AFF	0x0030
void PokeReturnMineEff(u8 id)
{
	u8 poke;
	
	poke = PokemonStruct[AttackNo];
	switch(TaskTable[id].work[0])
	{
		case 0:
			PokeKakusyukuInit(poke, 0);
			TaskTable[id].work[10] = 0x0100;	//Affine初期値
			TaskTable[id].work[0]++;
			break;
		case 1:
			TaskTable[id].work[10] += POKERET_MINE_AFF;
			PokeKakusyukuSet(poke, TaskTable[id].work[10], TaskTable[id].work[10], 0);
			PokeKakusyukuYHosei(poke);
			
			if(TaskTable[id].work[10] >= 0x02d0)	//0x0300)
				TaskTable[id].work[0]++;
			break;
		case 2:
			PokeKakusyukuEnd(poke);
			ActWork[poke].banish = 1;
			DelTaskEffect(id);
			break;
	}
}

//----------------------------------------------------------
//		ボール爆発エフェクトを出す
//	offset	なし
//----------------------------------------------------------
void PokeReturnMineHikariEff(u8 id)
{
	u8 poke;
	u8 oam_pri, soft_pri;
	s16 x, y;
	u32 fade_bit;
	u8 tblno;
	u16 ballno;
	
	poke = PokemonStruct[AttackNo];
	if(MineEnemyCheck(AttackNo) == SIDE_MINE)
		ballno = PokeParaGet(&PokeParaMine[SelMonsNo[AttackNo]], ID_get_ball);
	else
		ballno = PokeParaGet(&PokeParaEnemy[SelMonsNo[AttackNo]], ID_get_ball);
	tblno = BallItemNoTblNoConv(ballno);
	switch(TaskTable[id].work[0]){
		case 0:
			//爆発キャラ
			x = GetWazaEffPos(AttackNo, EFF_X);
			y = GetWazaEffPos(AttackNo, EFF_Y) + 32;
			oam_pri = ActWork[poke].oamData.Priority;
			soft_pri = ActWork[poke].pri;
			//TaskTable[id].work[10] = MBHikariSet(x, y, oam_pri, soft_pri);
			TaskTable[id].work[10] = HikariEffectSet(x, y, oam_pri, soft_pri, tblno);

			//フラッシュ
			fade_bit = GetBattleFadeBit(1,0,0,0,0,0,0);
			//TaskTable[id].work[11] = MBHikariColorEffectSet(0, AttackNo, fade_bit);
			TaskTable[id].work[11] = HikariColorEffectSet(0, AttackNo, fade_bit, tblno);

			TaskTable[id].work[0]++;
			break;
		case 1:
			if(TaskTable[TaskTable[id].work[10]].occ == 0
			 && TaskTable[TaskTable[id].work[11]].occ == 0)
				DelTaskEffect(id);
			break;
	}
}











//=========================================================================
//
//		ポケモンゲットエフェクト
//												by matsuda 2002.07.15(月)
//=========================================================================

//----------------------------------------------------------
//	モンスターボールのCell,Palをセット
//----------------------------------------------------------
void WestMonsBallCellPalSet(u8 id)
{
	u8 tblno;
	
	tblno = BallItemNoTblNoConv(ItemNo);
	MonsBallCellPalSet(tblno);
	DelTaskEffect(id);
}

//----------------------------------------------------------
//	ﾓﾝｽﾀｰﾎﾞｰﾙのCell,PalをDel
//----------------------------------------------------------
void WestMonsBallCellPalDel(u8 id)
{
	u8 tblno;
	
	tblno = BallItemNoTblNoConv(ItemNo);
	MonsBallCellPalDel(tblno);
	DelTaskEffect(id);
}

//----------------------------------------------------------
//	ﾄﾚｰﾅｰ戦かﾁｪｯｸする
//	WazaEffWork[7]にﾄﾚｰﾅｰ戦なら0xffffが入ります
//----------------------------------------------------------
void TrainerPokeCheck(u8 id)
{
	if(BtlWork->get_rate == 5)
		WazaEffWork[7] = (s16)0xffff;
	else
		WazaEffWork[7] = 0;
	DelTaskEffect(id);
}

//----------------------------------------------------------
//	ボールのｱｲﾃﾑNoをﾎﾞｰﾙのﾃｰﾌﾞﾙNoに変換する
//----------------------------------------------------------
u8 BallItemNoTblNoConv(u16 itemno)
{
	u8 tblno;
	
	switch(itemno){
		case ITEM_MASUTAABOORU:
			tblno = EF_MASTER_BALL;
			break;
		case ITEM_HAIPAABOORU:
			tblno = EF_HYPER_BALL;
			break;
		case ITEM_SUUPAABOORU:
			tblno = EF_SUPER_BALL;
			break;
		case ITEM_SAFARIBOORU:
			tblno = EF_SAFARI_BALL;
			break;
		case ITEM_NETTOBOORU:
			tblno = EF_NET_BALL;
			break;
		case ITEM_DAIBUBOORU:
			tblno = EF_DIVE_BALL;
			break;
		case ITEM_NESUTOBOORU:
			tblno = EF_NEST_BALL;
			break;
		case ITEM_RIPIITOBOORU:
			tblno = EF_REPEAT_BALL;
			break;
		case ITEM_TAIMAABOORU:
			tblno = EF_TIMER_BALL;
			break;
		case ITEM_GOOZYASUBOORU:
			tblno = EF_GOUJYASU_BALL;
			break;
		case ITEM_PUREMIABOORU:
			tblno = EF_PREMIA_BALL;
			break;
		case ITEM_MONSUTAABOORU:
		default:
			tblno = EF_MONSTER_BALL;
			break;
	}
	return tblno;
}

//=========================================================================
//	ボールを投げる
//=========================================================================
#define MONSTER_BALL_SYNC	34

void AddMonsBallActor(u8 id)
{
	u8 actno, tblno;

	tblno = BallItemNoTblNoConv(ItemNo);
	actno=AddActor(&MonsterBallHeader[tblno], MONS_BALL_X, MONS_BALL_Y, MONS_BALL_PRI);
	ActWork[actno].work[0] = MONSTER_BALL_SYNC;
	ActWork[actno].work[1] = GetWazaEffPos(DefenceNo, EFF_X);
	ActWork[actno].work[2] = GetWazaEffPos(DefenceNo, EFF_Y) - 16;
	ActWork[actno].move = MonsterBallSeq;
	
	BtlWork->get_banish = ActWork[PokemonStruct[DefenceNo]].banish;
	
	TaskTable[id].work[0] = actno;
	TaskTable[id].TaskAdrs = MonsBallActCheckWait;
}

static void MonsBallActCheckWait(u8 id)
{
	u8 monsact;
	
	monsact = TaskTable[id].work[0];
	if((u16)ActWork[monsact].work[0] == 0xffff)
		DelTaskEffect(id);
}

//----------------------------------------------------------
//	サファリ用	※トレーナーのアニメ込み
//----------------------------------------------------------
void AddMonsBallActorSafari(u8 id)
{
	u8 actno, tblno;
	u8 pri;
	s16 offs_x, offs_y;
	
	if(FightType & FIGHT_TYPE_GET_DEMO){
		offs_x = 32;
		offs_y = 11;
	}
	else{
		offs_x = 23;
		offs_y = 5;
	}
	tblno = BallItemNoTblNoConv(ItemNo);
	pri = GetPokeSoftPri(ClientNoGet(BSS_CLIENT_ENEMY)) + 1;
	actno=AddActor(&MonsterBallHeader[tblno], MONS_BALL_X+offs_x, MONS_BALL_Y+offs_y, pri);
	ActWork[actno].work[0] = MONSTER_BALL_SYNC;	//ﾄﾚｰﾅｰｱﾆﾒとの同期の関係で速くする
	ActWork[actno].work[1] = GetWazaEffPos(DefenceNo, EFF_X);
	ActWork[actno].work[2] = GetWazaEffPos(DefenceNo, EFF_Y) - 16;
	//ActWork[actno].move = MonsterBallSeq;
	ActWork[actno].move = DummyActMove;
	
	ActAnmChg(&ActWork[PokemonStruct[ClientNoGet(BSS_CLIENT_MINE)]], 1);	//ﾄﾚｰﾅｰｱﾆﾒ

	TaskTable[id].work[0] = actno;
	TaskTable[id].TaskAdrs = MonsBallTrainerAnmWait;
}

static void MonsBallTrainerAnmWait(u8 id)
{	//ﾄﾚｰﾅｰのｱﾆﾒ待ち
	if(ActWork[PokemonStruct[ClientNoGet(BSS_CLIENT_MINE)]].anm_offs == 1){
		SePlayPan(SE_NAGERU, 0);
		ActWork[TaskTable[id].work[0]].move = MonsterBallSeq;
		AddTask(TrainerAnmEndWait, 10);	//ﾄﾚｰﾅｰのｱﾆﾒ監視用のﾀｽｸを別にｾｯﾄ
		TaskTable[id].TaskAdrs = MonsBallActCheckWait;
	}
}

static void TrainerAnmEndWait(u8 id)
{
	if(ActWork[PokemonStruct[ClientNoGet(BSS_CLIENT_MINE)]].anmend_sw){
		ActAnmChg(&ActWork[PokemonStruct[ClientNoGet(BSS_CLIENT_MINE)]], 0);
		DelTask(id);	//west.s上でAddされたものではないので
	}
}


//=========================================================================
//	ボールアクターの動作シーケンス
//=========================================================================
#define MONSBALL_YAMANARI_DY	(-40)
static void MonsterBallSeq(actWork *xreg)
{
	s16 end_x, end_y;
	
	end_x = xreg->work[1];
	end_y = xreg->work[2];
	xreg->work[1] = xreg->x;
	xreg->work[2] = end_x;
	xreg->work[3] = xreg->y;
	xreg->work[4] = end_y;
	xreg->work[5] = MONSBALL_YAMANARI_DY;
	YamanariMoveInit(xreg);
	xreg->move = MonsterBallMainSeq;
}

static void MonsterBallMainSeq(actWork *xreg)
{
	int i;
	u8 tblno;
	
	if(YamanariMoveMain(xreg))
	{
		if(BtlWork->get_rate == 5){	//ﾄﾚｰﾅｰにﾎﾞｰﾙをはじかれた時の処理に移る
			xreg->move = HajikaretaSeq;
			return;
		}
		
		ActAnmChg(xreg, 1);
		xreg->x += xreg->dx;
		xreg->y += xreg->dy;
		xreg->dx = 0;
		xreg->dy = 0;
		for(i = 0; i < 8; i++)
			xreg->work[i] = 0;
		xreg->work[5] = 0;
		xreg->move = MonsterBallOpenSeq;
		
		tblno = BallItemNoTblNoConv(ItemNo);
		switch(tblno){				//光エフェクトを分岐
			case EF_MONSTER_BALL:
			case EF_SUPER_BALL:
			case EF_SAFARI_BALL:
			case EF_HYPER_BALL:
			case EF_MASTER_BALL:
			case EF_NET_BALL:
			case EF_DIVE_BALL:
			case EF_NEST_BALL:
			case EF_REPEAT_BALL:
			case EF_TIMER_BALL:
			case EF_GOUJYASU_BALL:
			case EF_PREMIA_BALL:
				//MBHikariSet(xreg->x, xreg->y-5, 1, MONS_BALL_PRI-1);
				HikariEffectSet(xreg->x, xreg->y-5, 1, MONS_BALL_PRI-1, tblno);
				//MBHikariColorEffectSet(0, DefenceNo, 14);
				HikariColorEffectSet(0, DefenceNo, 14, tblno);
				break;
		}
//		xreg->work[0] = (s16)0xffff;
//		xreg->move = DelWazaEffect;
	}
}

#define MB_CLOSE_WAIT 10	//ﾎﾞｰﾙが開いてから閉じるまでのｳｪｲﾄ
static void MonsterBallOpenSeq(actWork *xreg)
{
	xreg->work[5]++;
	if(xreg->work[5] == MB_CLOSE_WAIT)
	{
		xreg->work[5] = AddTask(DummyTaskSeq, 50);
		xreg->move = MonsterBallCloseInit;
		ActWork[PokemonStruct[DefenceNo]].work[1] = 0;
	}
}

#define POKE_BALLIN_AFF		 0x0020
	u16 offs_y, sub_y;
	u32 loop;
static void MonsterBallCloseInit(actWork *xreg)
{
	u8 poke;
	u8 id;
//	u16 offs_y, sub_y;
//	u32 loop;
	
	poke = PokemonStruct[DefenceNo];
	id = xreg->work[5];
	
	if(TaskTable[id].work[1]++ == 10)
		SePlay(SE_SUIKOMU);
	switch(TaskTable[id].work[0])
	{
		case 0:
			PokeKakusyukuInit(poke, 0);
			TaskTable[id].work[10] = 0x0100;	//Affine初期値
			
			loop = ((0x0480 - 0x0100)<<8) / POKE_BALLIN_AFF;
			loop >>= 8;
//			loop++;	//小数で足りない分1を足す
			offs_y = ActWork[poke].y+ActWork[poke].dy - (xreg->y+xreg->dy);
			sub_y = (offs_y << 8) / loop;
			TaskTable[id].work[2] = sub_y;
			
			TaskTable[id].work[0]++;
			break;
		case 1:
			TaskTable[id].work[10] += POKE_BALLIN_AFF;
			PokeKakusyukuSet(poke, TaskTable[id].work[10], TaskTable[id].work[10], 0);
			//PokeKakusyukuYHosei(poke);
			TaskTable[id].work[3] += TaskTable[id].work[2];
			ActWork[poke].dy = -TaskTable[id].work[3] >> 8;
			
			if(TaskTable[id].work[10] >= 0x0480)
				TaskTable[id].work[0]++;
			break;
		case 2:
			PokeKakusyukuEnd(poke);
			ActWork[poke].banish = 1;
			TaskTable[id].work[0]++;
			break;
		default:
			if(TaskTable[id].work[1] > 10){	//SEが鳴ったのを確認してから進む
				DelTask(id);
				ActAnmChg(xreg, 2);		//ﾎﾞｰﾙを閉じる
				xreg->work[5] = 0;
				xreg->move = MonsterBallCloseWaitSeq;
			}
			break;
	}
}

//-- ﾎﾞｰﾙが閉じるのを待つ --//
#define BALL_FURIHABA_DEFAULT	32	//地面にﾊﾞｳﾝﾄﾞする時の最初の振り幅
static void MonsterBallCloseWaitSeq(actWork *xreg)
{
	if(xreg->anmend_sw == 0)
		return;
		
	xreg->work[3] = 0;
	xreg->work[4] = BALL_FURIHABA_DEFAULT;	//振り幅
	xreg->work[5] = 0;
	xreg->y += CosMove(0, xreg->work[4]);
	xreg->dy = -CosMove(0, xreg->work[4]);
	xreg->move = MonsterBallBaundSeq;
}

//-- 3回バウンド --//
#define BALL_ADD_SEC	4
#define BALL_FURIHABA_SUB	10
static void MonsterBallBaundSeq(actWork *xreg)
{
	u8 end_flg = 0;

	switch(xreg->work[3] & 0xff){
		case 0:
			xreg->dy = -CosMove(xreg->work[5], xreg->work[4]);
			xreg->work[5] += BALL_ADD_SEC + (xreg->work[3]>>8);
			if(xreg->work[5] >= 64){
				xreg->work[4] -= BALL_FURIHABA_SUB;
				xreg->work[3]++;
				xreg->work[3] += 0x0100;
				if((xreg->work[3] >> 8) == 4)	//3)
					end_flg = 1;
				
				switch(xreg->work[3] >> 8){
					case 1:
						SePlay(SE_KON);
						break;
					case 2:
						SePlay(SE_KON2);
						break;
					case 3:
						SePlay(SE_KON3);
						break;
					default:
						SePlay(SE_KON4);
				}
			}
			break;
		case 1:
			xreg->dy = -CosMove(xreg->work[5], xreg->work[4]);
			xreg->work[5] -= BALL_ADD_SEC + (xreg->work[3]>>8);
			if(xreg->work[5] <= 0){
				xreg->work[5] = 0;
				xreg->work[3] &= 0xff00;
			}
			break;
	}
	
	if(end_flg){
		xreg->work[3] = 0;
		xreg->y += CosMove(64, BALL_FURIHABA_DEFAULT);	//xreg->dy;
		xreg->dy = 0;
		if(BtlWork->get_rate == 0){	//グガ回数ﾁｪｯｸ
			xreg->work[5] = 0;
			xreg->move = MonsterBallGetFailWaitInitSeq;	//MonsterBallGetFailInitSeq;
		}
		else
		{
			xreg->move = MonsterBallGetGugaInitSeq;
			xreg->work[4] = 1;	//0x0080;
			xreg->work[5] = 0;
		}
	}
}

static void MonsterBallGetGugaInitSeq(actWork *xreg)
{
	if(xreg->work[3]++ == 30){	//ﾊﾞｳﾝﾄﾞが終わってからグガ開始までのｳｪｲﾄ
		xreg->work[3] = 0;
		xreg->aff_pause = 1;
		ActAffAnmChg(xreg, 1);
		BtlWork->ball_temp = 0;
		xreg->move = MonsterBallGetGuga;
		SePlay(SE_BOWA);
	}
}

#define BALL_GUGA_X		8	//4		//横に何Sync動かすか
#define BALL_GUGA_WAIT	0//8//0		//横に行ってから中心に戻る動きを開始するまでのｳｪｲﾄ
#define BALL_OVER_GUGA_WAIT	0//4		//戻ってｵｰﾊﾞｰした位置まで来た時のｳｪｲﾄ
#define BALL_GUGA_CENTER_WAIT	30//8	//30	//中心に来た時のｳｪｲﾄ
#define GUGA_OFFS_X	5	//横に行ってから戻ってくる時に余分に動かすSync数
#define BALL_ADD_DX		0x00b0
static void MonsterBallGetGuga(actWork *xreg)
{
	switch(xreg->work[3] & 0xff)
	{
		case 0:
//		case 2:
			if(BtlWork->ball_temp >= 0x0100){
//			if(temp++ == 2){
				xreg->dx += xreg->work[4];
				BtlWork->ball_temp &= 0x00ff;
			}
			else
				BtlWork->ball_temp += BALL_ADD_DX;
			xreg->work[5] ++;	//+= xreg->work[4];
			xreg->aff_pause = 0;
			//if(xreg->work[5] > 127)
			if(xreg->work[5] >= BALL_GUGA_X || xreg->work[5] <= -BALL_GUGA_X){
				BtlWork->ball_temp =0;
				xreg->work[3]++;
				xreg->work[5] = 0;
			}
			break;
		case 1:
			if(xreg->work[5]++ == BALL_GUGA_WAIT){
				xreg->work[5] = 0;
//				if((xreg->work[3]&0xff) == 1)
					xreg->work[4] = -xreg->work[4];
				//xreg->work[4] ^= 0x1000;
				xreg->work[3]++;
				xreg->aff_pause = 0;
//				if((xreg->work[3]&0xff) == 1){
					if(xreg->work[4] < 0)
						ActAffAnmHoldChg(xreg, 2);
					else
						ActAffAnmHoldChg(xreg, 1);
//				}
			}else
				xreg->aff_pause = 1;
			break;
		case 2:		//ボールを元の位置よりちょっとｵｰﾊﾞｰまで戻す
			if(BtlWork->ball_temp >= 0x0100){
				xreg->dx += xreg->work[4];
				BtlWork->ball_temp &= 0x00ff;
			}
			else
				BtlWork->ball_temp += BALL_ADD_DX;
			xreg->work[5] ++;	//+= xreg->work[4];
			xreg->aff_pause = 0;
			if(xreg->work[5] >= BALL_GUGA_X+GUGA_OFFS_X || xreg->work[5] <= -(BALL_GUGA_X+GUGA_OFFS_X)){
				BtlWork->ball_temp =0;
				xreg->work[3]++;
				xreg->work[5] = 0;
			}
			break;
		case 3:		//ｵｰﾊﾞｰして動かした分を元(中心)に戻す
			if(xreg->work[5]++ < BALL_OVER_GUGA_WAIT){
				xreg->aff_pause = 1;
				break;
			}
			xreg->work[5] = 0;
			
			xreg->work[4] = -xreg->work[4];
			//xreg->work[4] ^= 0x1000;
			xreg->work[3]++;
			xreg->aff_pause = 0;
//			if((xreg->work[3]&0xff) == 1){
				if(xreg->work[4] < 0)
					ActAffAnmHoldChg(xreg, 2);
				else
					ActAffAnmHoldChg(xreg, 1);
//			}
			//break;
		case 4:
			if(BtlWork->ball_temp >= 0x0100){
				xreg->dx += xreg->work[4];
				BtlWork->ball_temp &= 0x00ff;
			}
			else
				BtlWork->ball_temp += BALL_ADD_DX;
			xreg->work[5] ++;	//+= xreg->work[4];
			xreg->aff_pause = 0;
			if(xreg->work[5] >= GUGA_OFFS_X || xreg->work[5] <= -(GUGA_OFFS_X)){
				BtlWork->ball_temp =0;
				xreg->work[3]++;
				xreg->work[5] = 0;
				
				xreg->work[4] = -xreg->work[4];
			}
			break;
		case 5:	//3:
			xreg->work[3] += 0x0100;	//グガ回数ｲﾝｸﾘﾒﾝﾄ
			
			if((xreg->work[3]>>8) == BtlWork->get_rate){	//グガﾁｪｯｸ
				xreg->aff_pause = 1;
				xreg->move = MonsterBallGetFailWaitInitSeq;
			}
			else if(BtlWork->get_rate == SUCCESS_RATE 
					&& (xreg->work[3]>>8) == (SUCCESS_RATE-1))
			{
				xreg->move = MonsterBallGetSuccessInit;
				xreg->aff_pause = 1;
			}
			else{
				xreg->work[3]++;
				xreg->aff_pause = 1;
			}
			break;
		case 6:	//4:
		default:
			if(xreg->work[5]++ == BALL_GUGA_CENTER_WAIT){
				xreg->work[5] = 0;
				xreg->work[3] &= 0xff00;
//				xreg->work[4] = -xreg->work[4];
				ActAffAnmChg(xreg, 3);		//1回Affineをﾘｾｯﾄする為に必要
				if(xreg->work[4] < 0)
					ActAffAnmChg(xreg, 2);
				else
					ActAffAnmChg(xreg, 1);
				SePlay(SE_BOWA);
			}
	}
}

static void MonsterBallGetFailWaitInitSeq(actWork *xreg)
{
	if(xreg->work[5]++ == BALL_GUGA_CENTER_WAIT){
		xreg->work[5] = 0;
		xreg->move = MonsterBallGetFailInitSeq;
	}
}

//-- ｹﾞｯﾄ成功 --//
static void MonsterBallGetSuccessInit(actWork *xreg)
{
	xreg->anm_pause = 1;
	xreg->move = MonsterBallGetSeq;
	xreg->work[3] = 0;
	xreg->work[4] = 0;
	xreg->work[5] = 0;
}

#define MB_GET_WAIT		40
#define MB_GET_WAIT2	(MB_GET_WAIT+55)
#define MB_GET_SE_WAIT	(MB_GET_WAIT2+220)
static void MonsterBallGetSeq(actWork *xreg)
{
	u8 client_no;
	
	client_no = DefenceNo;
	xreg->work[4]++;

	if(xreg->work[4] == MB_GET_WAIT)
	{
//		SePlay(SE_RETURN);
	}
	else if(xreg->work[4] == MB_GET_WAIT2)
	{
		//先にClientBitを落としてしまう 2002.05.02(木) 曽我部さんと協議の上
		ClientEffectWait = 0;
		GaugeHardPriSet(GAUGE_OAM_PRI);//「はい・いいえ」ｳｨﾝﾄﾞｳに被るので
		m4aMPlayAllStop();
		//JinglePlay(MUS_FANFA5);
		SePlay(MUS_FANFA5);
	}
	else if(xreg->work[4] == MB_GET_SE_WAIT)
	{
		//-- 敵 後で修正 ※暫定 --//
		AffineWorkNumDel(ActWork[PokemonStruct[DefenceNo]].oamData.AffineParamNo);
		DelActor(&ActWork[PokemonStruct[DefenceNo]]);
		
		xreg->work[0] = 0;
		xreg->move = MonsterBallBanishEffect;	//MonsterBallEffectEnd;
	}
}

#define MONSBALL_BANISH_BLD_WAIT	0	//1
static void MonsterBallBanishEffect(actWork *xreg)
{
	u16 palno;
	u32 fade_bit;
	
	switch(xreg->work[0]){
		case 0:
			xreg->work[1] = 0;
			xreg->work[2] = 0;
			xreg->oamData.ObjMode = 1;	//半透明OBJ ON
			*(vu16*)REG_BLDCNT = BLD_A_BLEND_MODE | BLD_2ND_ALL;
			*(vu16*)REG_BLDALPHA = 16;
			palno = ObjPalNumGet(xreg->actHead->palNo);
			fade_bit = 1 << (16+palno);
			PaletteFadeReq(fade_bit, 0, 0,16,0x7fff);
			xreg->work[0]++;
			break;
		case 1:
			if(xreg->work[1]++ > MONSBALL_BANISH_BLD_WAIT){
				xreg->work[1] = 0;
				xreg->work[2]++;
				*(vu16*)REG_BLDALPHA = ((xreg->work[2])<<8) | (16-xreg->work[2]);
				if(xreg->work[2] == 16)
					xreg->work[0]++;
			}
			break;
		case 2:
			xreg->banish = 1;
			xreg->work[0]++;
			break;
		case 3:
		default:
			if(FadeData.fade_sw == 0){
				*(vu16*)REG_BLDCNT = 0;
				*(vu16*)REG_BLDALPHA = 0;
				xreg->work[0] = 0;
				xreg->move = MonsterBallEffectEnd;
			}
			break;
	}
}

static void MonsterBallEffectEnd(actWork *xreg)
{
	if(xreg->work[0] == 0)
		xreg->work[0] = (s16)0xffff;	//ｴﾌｪｸﾄ終了の印 外のﾀｽｸで終了ﾁｪｯｸしてるので
	else{
		AffineDelActor(xreg);
		DelActor(xreg);
//		if(sys.FieldBattleFlag)
//			CliSys[client_no].ball_eff_wait = 0;
	}
}


//----------------------------------------------------------
//	捕獲失敗
//----------------------------------------------------------
static void MonsterBallGetFailInitSeq(actWork *xreg)
{
//	PokemonParam *pp;
//	s8 pan;
	u8 tblno;
	
	ActAnmChg(xreg, 1);
	ActAffAnmChg(xreg, 0);
	xreg->move = MonsterBallGetFailMain;

	tblno = BallItemNoTblNoConv(ItemNo);
	switch(tblno){				//光エフェクトを分岐
		case EF_MONSTER_BALL:
		case EF_SUPER_BALL:
		case EF_SAFARI_BALL:
		case EF_HYPER_BALL:
		case EF_MASTER_BALL:
		case EF_NET_BALL:
		case EF_DIVE_BALL:
		case EF_NEST_BALL:
		case EF_REPEAT_BALL:
		case EF_TIMER_BALL:
		case EF_GOUJYASU_BALL:
		case EF_PREMIA_BALL:
			//MBHikariSet(xreg->x, xreg->y-5, 1, MONS_BALL_PRI-1);
			HikariEffectSet(xreg->x, xreg->y-5, 1, MONS_BALL_PRI-1, tblno);
			//MBHikariColorEffectSet(1, DefenceNo, 14);
			HikariColorEffectSet(1, DefenceNo, 14, tblno);
			break;
	}

//	pp = &PokeParaEnemy[SelMonsNo[DefenceNo]];
//	pan = 25;
//	VoicePlay(PokeParaGet(pp, ID_monsno), pan);

	ActWork[PokemonStruct[DefenceNo]].banish = 0;
	ActAffAnmChg(&ActWork[PokemonStruct[DefenceNo]], PAF_BALLOUT);
	ActAnm(&ActWork[PokemonStruct[DefenceNo]]);

	ActWork[PokemonStruct[DefenceNo]].work[1] = 16 << 8;
}

static void MonsterBallGetFailMain(actWork *xreg)
{
	u8 aff_flg = 0;
	
	if(xreg->anmend_sw == 1)
		xreg->banish = 1;
	
	if(ActWork[PokemonStruct[DefenceNo]].affend_sw == 1)
	{
		ActAffAnmChg(&ActWork[PokemonStruct[DefenceNo]], PAF_NORMAL);
		aff_flg++;
	}
	else
	{
		ActWork[PokemonStruct[DefenceNo]].work[1] -= 0x120;
		ActWork[PokemonStruct[DefenceNo]].dy = 
			ActWork[PokemonStruct[DefenceNo]].work[1] >> 8;
	}
	
	if(xreg->anmend_sw == 1 && aff_flg)
	{
		ActWork[PokemonStruct[DefenceNo]].dy = 0;
		ActWork[PokemonStruct[DefenceNo]].banish = BtlWork->get_banish;
	//	xreg->move = DummyActMove;
		xreg->work[0] = 0;	//add 2002.07.31(水)
		xreg->move = MonsterBallEffectEnd;
//		AllDelActor(xreg);
		ClientEffectWait = 0;
		GaugeHardPriSet(GAUGE_OAM_PRI);//「はい・いいえ」ｳｨﾝﾄﾞｳに被るので
	}
}


//----------------------------------------------------------
//	ﾄﾚｰﾅｰにﾎﾞｰﾙをはじかれた時の処理
//----------------------------------------------------------

#define HAJIKARE_ADD_Y			0x0800
#define HAJIKARE_ADD_X			0x0680
static void HajikaretaSeq(actWork *xreg)
{
	int i;
	
	xreg->x += xreg->dx;
	xreg->y += xreg->dy;
	xreg->dx = xreg->dy = 0;
	for(i = 0; i < 6; i++)
		xreg->work[i] = 0;
	xreg->move = HajikaretaMainSeq;
}

static void HajikaretaMainSeq(actWork *xreg)
{
	xreg->work[0] += HAJIKARE_ADD_Y;
	xreg->work[1] += HAJIKARE_ADD_X;
	xreg->dx += -(xreg->work[1] >> 8);
	xreg->dy += xreg->work[0] >> 8;
	xreg->work[0] &= 0x00ff;
	xreg->work[1] &= 0x00ff;
	
	if(xreg->y+xreg->dy > 160 || xreg->x+xreg->dx < -8){
		xreg->work[0] = 0;
		xreg->move = MonsterBallEffectEnd;
		ClientEffectWait = 0;
		GaugeHardPriSet(GAUGE_OAM_PRI);//「はい・いいえ」ｳｨﾝﾄﾞｳに被るので
	}
}













//=========================================================================
//
//		モンスターボールから出てくる時の光
//												by matsuda 2002.07.30(火)
//=========================================================================
//----------------------------------------------------------
//	光キャラのセル&パレット	※テーブルNo順
//----------------------------------------------------------
const CellData BallHikariCellTbl[MONS_BALL_MAX] = 
{
	{(void *)ball_ef_pch_ADRS, OBJ_SIZE16_8x8 * 8, CELLID_MBHikari},	//ﾓﾝｽﾀｰﾎﾞｰﾙ
	{(void *)ball_ef_pch_ADRS, OBJ_SIZE16_8x8 * 8, CELLID_SuperHikari},	//ｽｰﾊﾟｰﾎﾞｰﾙ
	{(void *)ball_ef_pch_ADRS, OBJ_SIZE16_8x8 * 8, CELLID_SafariHikari},	//ｻﾌｧﾘ
	{(void *)ball_ef_pch_ADRS, OBJ_SIZE16_8x8 * 8, CELLID_HyperHikari},	//ﾊｲﾊﾟｰ
	{(void *)ball_ef_pch_ADRS, OBJ_SIZE16_8x8 * 8, CELLID_MasterHikari},	//ﾏｽﾀｰ
	{(void *)ball_ef_pch_ADRS, OBJ_SIZE16_8x8 * 8, CELLID_NetHikari},	//ﾈｯﾄ
	{(void *)ball_ef_pch_ADRS, OBJ_SIZE16_8x8 * 8, CELLID_DiveHikari},	//ﾀﾞｲﾌﾞ
	{(void *)ball_ef_pch_ADRS, OBJ_SIZE16_8x8 * 8, CELLID_NestHikari},	//ﾈｽﾄ
	{(void *)ball_ef_pch_ADRS, OBJ_SIZE16_8x8 * 8, CELLID_RepeatHikari},	//ﾘﾋﾟｰﾄ
	{(void *)ball_ef_pch_ADRS, OBJ_SIZE16_8x8 * 8, CELLID_TimerHikari},	//ﾀｲﾏｰ
	{(void *)ball_ef_pch_ADRS, OBJ_SIZE16_8x8 * 8, CELLID_GoojyasuHikari},	//ｺﾞｰｼﾞｬｽ
	{(void *)ball_ef_pch_ADRS, OBJ_SIZE16_8x8 * 8, CELLID_PremiaHikari},	//ﾌﾟﾚﾐｱ
};
const PalData BallHikariPalTbl[MONS_BALL_MAX] =
{
	{(void *)kouka_pcl_ADRS,	CELLID_MBHikari},	//ﾓﾝｽﾀｰﾎﾞｰﾙ
	{(void *)kouka_pcl_ADRS,	CELLID_SuperHikari},	//ｽｰﾊﾟｰﾎﾞｰﾙ
	{(void *)kouka_pcl_ADRS,	CELLID_SafariHikari},	//ｻﾌｧﾘ
	{(void *)kouka_pcl_ADRS,	CELLID_HyperHikari},	//ﾊｲﾊﾟｰ
	{(void *)kouka_pcl_ADRS,	CELLID_MasterHikari},	//ﾏｽﾀｰ
	{(void *)kouka_pcl_ADRS,	CELLID_NetHikari},	//ﾈｯﾄ
	{(void *)kouka_pcl_ADRS,	CELLID_DiveHikari},	//ﾀﾞｲﾌﾞ
	{(void *)kouka_pcl_ADRS,	CELLID_NestHikari},	//ﾈｽﾄ
	{(void *)kouka_pcl_ADRS,	CELLID_RepeatHikari},	//ﾘﾋﾟｰﾄ
	{(void *)kouka_pcl_ADRS,	CELLID_TimerHikari},	//ﾀｲﾏｰ
	{(void *)kouka_pcl_ADRS,	CELLID_GoojyasuHikari},	//ｺﾞｰｼﾞｬｽ
	{(void *)kouka_pcl_ADRS,	CELLID_PremiaHikari},	//ﾌﾟﾚﾐｱ
};


//=========================================================================
//	アクターテーブル	※テーブルNo順
//=========================================================================
static const actAnm ballhikari_anm0[] =		//線のようなもの
{
	{OBJ16_8x8 * 0, 1, 0, 0},
	{OBJ16_8x8 * 1, 1, 0, 0},
	{OBJ16_8x8 * 2, 1, 0, 0},
	{OBJ16_8x8 * 0, 1, 1, 0},
	{OBJ16_8x8 * 2, 1, 0, 0},
	{OBJ16_8x8 * 1, 1, 0, 0},
	{ACT_ANMLOOP, 0, 0, 0},
};
static const actAnm star_anm0[] =		//星
{
	{OBJ16_8x8 * 3, 1, 0, 0},
	{ACT_ANMEND, 0, 0, 0},
};
static const actAnm awa_anm0[] =		//泡
{
	{OBJ16_8x8 * 4, 1, 0, 0},
	{ACT_ANMEND, 0, 0, 0},
};
static const actAnm heart_anm0[] =		//ﾊｰﾄ
{
	{OBJ16_8x8 * 5, 1, 0, 0},
	{ACT_ANMEND, 0, 0, 0},
};
static const actAnm hikari_anm0[] =		//光
{
	{OBJ16_8x8 * 6, 4, 0, 0},
	{OBJ16_8x8 * 7, 4, 0, 0},
	{ACT_ANMLOOP, 0, 0, 0},
};
static const actAnm hikari_anm1[] =		//光の粒
{
	{OBJ16_8x8 * 7, 4, 0, 0},
	{ACT_ANMEND, 0, 0, 0},
};
static const actAnm * const BallHikariAnmTbl[] = 
{
	ballhikari_anm0,
	star_anm0,
	awa_anm0,
	heart_anm0,
	hikari_anm0,
	hikari_anm1,
};
//-- 使用するｱﾆﾒﾊﾟﾀｰﾝ　※ﾃｰﾌﾞﾙNo順 --//
static const u8 BallHikariAnmChgTbl[MONS_BALL_MAX] = {
	0,				//EF_MONSTER_BALL,
	0,			  	//EF_SUPER_BALL,
	0,				//EF_SAFARI_BALL,
	5,				//EF_HYPER_BALL,
	1,				//EF_MASTER_BALL,
	2,				//EF_NET_BALL,
	2,				//EF_DIVE_BALL,
	3,				//EF_NEST_BALL,
	5,				//EF_REPEAT_BALL,
	5,				//EF_TIMER_BALL,
	4,				//EF_GOUJYASU_BALL,
	4,				//EF_PREMIA_BALL,
};

//----------------------------------------------------------
//	光ｴﾌｪｸﾄのｱｸﾀｰをｾｯﾄするﾀｽｸのテーブル	※ﾃｰﾌﾞﾙNo順
//----------------------------------------------------------
static const pTaskFunc HikariEffectTaskTbl[MONS_BALL_MAX] = {
	MonsterBallHikariActorSetTask,		//EF_MONSTER_BALL
	DoubleCircleHikariActorSetTask,		//EF_SUPER_BALL
	SlowCircleHikariActorSetTask,		//EF_SAFARI_BALL
	NormalCircleHikariActorSetTask,		//EF_HYPER_BALL
	TwinCircleHikariActorSetTask,		//EF_MASTER_BALL
	SlowCircleHikariActorSetTask,		//EF_NET_BALL
	LongwiseCircleHikariActorSetTask,	//EF_DIVE_BALL
	NormalCircleHikariActorSetTask,		//EF_NEST_BALL
	EightCircleHikariActorSetTask,		//EF_REPEAT_BALL
	OblongCircleHikariActorSetTask,		//EF_TIMER_BALL
	DoubleCircleHikariActorSetTask,		//EF_GOUJYASU_BALL
	CrosCircleHikariActorSetTask,		//EF_PREMIA_BALL
};

const actHeader BallHikariHeader[] = 
{
	{
		CELLID_MBHikari,
		CELLID_MBHikari,
		&WazaOamDataNormal[0],
		BallHikariAnmTbl,
		0,
		DummyActAffTbl,
		DummyActMove,
	},
	{
		CELLID_SuperHikari,
		CELLID_SuperHikari,
		&WazaOamDataNormal[0],
		BallHikariAnmTbl,
		0,
		DummyActAffTbl,
		DummyActMove,
	},
	{
		CELLID_SafariHikari,
		CELLID_SafariHikari,
		&WazaOamDataNormal[0],
		BallHikariAnmTbl,
		0,
		DummyActAffTbl,
		DummyActMove,
	},
	{
		CELLID_HyperHikari,
		CELLID_HyperHikari,
		&WazaOamDataNormal[0],
		BallHikariAnmTbl,
		0,
		DummyActAffTbl,
		DummyActMove,
	},
	{
		CELLID_MasterHikari,
		CELLID_MasterHikari,
		&WazaOamDataNormal[0],
		BallHikariAnmTbl,
		0,
		DummyActAffTbl,
		DummyActMove,
	},
	{
		CELLID_NetHikari,
		CELLID_NetHikari,
		&WazaOamDataNormal[0],
		BallHikariAnmTbl,
		0,
		DummyActAffTbl,
		DummyActMove,
	},
	{
		CELLID_DiveHikari,
		CELLID_DiveHikari,
		&WazaOamDataNormal[0],
		BallHikariAnmTbl,
		0,
		DummyActAffTbl,
		DummyActMove,
	},
	{
		CELLID_NestHikari,
		CELLID_NestHikari,
		&WazaOamDataNormal[0],
		BallHikariAnmTbl,
		0,
		DummyActAffTbl,
		DummyActMove,
	},
	{
		CELLID_RepeatHikari,
		CELLID_RepeatHikari,
		&WazaOamDataNormal[0],
		BallHikariAnmTbl,
		0,
		DummyActAffTbl,
		DummyActMove,
	},
	{
		CELLID_TimerHikari,
		CELLID_TimerHikari,
		&WazaOamDataNormal[0],
		BallHikariAnmTbl,
		0,
		DummyActAffTbl,
		DummyActMove,
	},
	{
		CELLID_GoojyasuHikari,
		CELLID_GoojyasuHikari,
		&WazaOamDataNormal[0],
		BallHikariAnmTbl,
		0,
		DummyActAffTbl,
		DummyActMove,
	},
	{
		CELLID_PremiaHikari,
		CELLID_PremiaHikari,
		&WazaOamDataNormal[0],
		BallHikariAnmTbl,
		0,
		DummyActAffTbl,
		DummyActMove,
	},
};

//=========================================================================
//	ﾎﾞｰﾙ開く時に出る光エフェクトをセット
//=========================================================================
#define MB_HIKARI_MAX		8
u8 HikariEffectSet(u8 x, u8 y, u8 oam_pri, u8 act_pri, u8 tblno)
{
//	u8 actno, i;
	u8 id;
	
	if(CellCharNumGet(BallHikariCellTbl[tblno].act_num) == 0xffff){
		DecordCellSet((CellData*)&BallHikariCellTbl[tblno]);
		DecordPalSet((PalData*)&BallHikariPalTbl[tblno]);
	}

	id = AddTask(HikariEffectTaskTbl[tblno], 5);
	TaskTable[id].work[1] = x;
	TaskTable[id].work[2] = y;
	TaskTable[id].work[3] = oam_pri;
	TaskTable[id].work[4] = act_pri;
	TaskTable[id].work[15] = tblno;

	SePlay(SE_BOWA2);
	if(sys.FieldBattleFlag == 1)
		BtlWork->hikari_count++;
	
	return id;
}

//=========================================================================
//	ﾓﾝｽﾀｰﾎﾞｰﾙの光ｴﾌｪｸﾄのｱｸﾀｰをｾｯﾄしていくタスク
//=========================================================================
static void MonsterBallHikariActorSetTask(u8 id)
{
	u8 actno, i;
	u8 x, y, oam_pri, act_pri;
	u8 tblno;
	
	tblno = TaskTable[id].work[15];
	
	if(TaskTable[id].work[0] < MB_HIKARI_MAX*2){
		x = TaskTable[id].work[1];
		y = TaskTable[id].work[2];
		oam_pri = TaskTable[id].work[3];
		act_pri = TaskTable[id].work[4];
		
		actno = AddActor(&BallHikariHeader[tblno], x, y, act_pri);
		ActAnmChg(&ActWork[actno], BallHikariAnmChgTbl[tblno]);
		ActWork[actno].move = MonsterHikariInitSeq;
		ActWork[actno].oamData.Priority = oam_pri;
		i = TaskTable[id].work[0];
		if(i >= MB_HIKARI_MAX)
			i -= MB_HIKARI_MAX;
		ActWork[actno].work[0] = i* (256/MB_HIKARI_MAX);
	}
	if(TaskTable[id].work[0] == MB_HIKARI_MAX*2-1){
		ActWork[actno].work[7] = 1;		//最後にAddされたｱｸﾀｰの印
		DelTask(id);
	}else
		TaskTable[id].work[0]++;
}

//----------------------------------------------------------
//	ﾓﾝｽﾀｰﾎﾞｰﾙの光ｴﾌｪｸﾄのｱｸﾀｰシーケンス
//----------------------------------------------------------
static void MonsterHikariInitSeq(actWork *xreg)
{
	if(xreg->work[1] == 0)
		xreg->move = MonsterHikariMainSeq;
	else
		xreg->work[1]--;
}

static void MonsterHikariMainSeq(actWork *xreg)
{
	xreg->dx = SinMove(xreg->work[0], xreg->work[1]);
	xreg->dy = CosMove(xreg->work[0], xreg->work[1]);
	xreg->work[1] += 2;
	if(xreg->work[1] == 50)
		HikariEffectDel(xreg);
}

//=========================================================================
//	横長の丸を描く光ｴﾌｪｸﾄのｱｸﾀｰをｾｯﾄしていくタスク
//=========================================================================
#define OBCIRCLE_HIKARI_MAX			8	//光OBJの数
#define OBCIRCLE_ADDSEC				10
#define OBCIRCLE_ADD_FURIHABA_X		2
#define OBCIRCLE_ADD_FURIHABA_Y		1
static void OblongCircleHikariActorSetTask(u8 id)
{
	u8 actno, i;
	u8 x, y, oam_pri, act_pri;
	u8 tblno;
	
	tblno = TaskTable[id].work[15];
	
	x = TaskTable[id].work[1];
	y = TaskTable[id].work[2];
	oam_pri = TaskTable[id].work[3];
	act_pri = TaskTable[id].work[4];
		
	for(i = 0; i < OBCIRCLE_HIKARI_MAX; i++)
	{
		actno = AddActor(&BallHikariHeader[tblno], x, y, act_pri);
		ActAnmChg(&ActWork[actno], BallHikariAnmChgTbl[tblno]);
		ActWork[actno].move = OblongCircleHikariInitSeq;
		ActWork[actno].oamData.Priority = oam_pri;
		ActWork[actno].work[0] = i * (256/OBCIRCLE_HIKARI_MAX);
		ActWork[actno].work[4] = OBCIRCLE_ADDSEC;
		ActWork[actno].work[5] = OBCIRCLE_ADD_FURIHABA_X;
		ActWork[actno].work[6] = OBCIRCLE_ADD_FURIHABA_Y;
	}
	
	ActWork[actno].work[7] = 1;		//最後にAddされたｱｸﾀｰの印
	DelTask(id);
}

//=========================================================================
//	縦長の丸を描く光ｴﾌｪｸﾄのｱｸﾀｰをｾｯﾄしていくﾀｽｸ
//=========================================================================
#define LONGWISE_HIKARI_MAX			8	//光OBJの数
#define LONGWISE_ADDSEC				10
#define LONGWISE_ADD_FURIHABA_X		1
#define LONGWISE_ADD_FURIHABA_Y		2
static void LongwiseCircleHikariActorSetTask(u8 id)
{
	u8 actno, i;
	u8 x, y, oam_pri, act_pri;
	u8 tblno;
	
	tblno = TaskTable[id].work[15];
	
	x = TaskTable[id].work[1];
	y = TaskTable[id].work[2];
	oam_pri = TaskTable[id].work[3];
	act_pri = TaskTable[id].work[4];
		
	for(i = 0; i < LONGWISE_HIKARI_MAX; i++)
	{
		actno = AddActor(&BallHikariHeader[tblno], x, y, act_pri);
		ActAnmChg(&ActWork[actno], BallHikariAnmChgTbl[tblno]);
		ActWork[actno].move = OblongCircleHikariInitSeq;
		ActWork[actno].oamData.Priority = oam_pri;
		ActWork[actno].work[0] = i * (256/LONGWISE_HIKARI_MAX);
		ActWork[actno].work[4] = LONGWISE_ADDSEC;
		ActWork[actno].work[5] = LONGWISE_ADD_FURIHABA_X;
		ActWork[actno].work[6] = LONGWISE_ADD_FURIHABA_Y;
	}
	
	ActWork[actno].work[7] = 1;		//最後にAddされたｱｸﾀｰの印
	DelTask(id);
}

//=========================================================================
//	ゆっくりとした円を描く光ｴﾌｪｸﾄのｱｸﾀｰをｾｯﾄしていくﾀｽｸ
//=========================================================================
#define SLOWCIRCLE_HIKARI_MAX			8	//光OBJの数
#define SLOWCIRCLE_ADDSEC				4
#define SLOWCIRCLE_ADD_FURIHABA_X		1
#define SLOWCIRCLE_ADD_FURIHABA_Y		1
static void SlowCircleHikariActorSetTask(u8 id)
{
	u8 actno, i;
	u8 x, y, oam_pri, act_pri;
	u8 tblno;
	
	tblno = TaskTable[id].work[15];
	
	x = TaskTable[id].work[1];
	y = TaskTable[id].work[2];
	oam_pri = TaskTable[id].work[3];
	act_pri = TaskTable[id].work[4];
		
	for(i = 0; i < SLOWCIRCLE_HIKARI_MAX; i++)
	{
		actno = AddActor(&BallHikariHeader[tblno], x, y, act_pri);
		ActAnmChg(&ActWork[actno], BallHikariAnmChgTbl[tblno]);
		ActWork[actno].move = OblongCircleHikariInitSeq;
		ActWork[actno].oamData.Priority = oam_pri;
		ActWork[actno].work[0] = i * (256/SLOWCIRCLE_HIKARI_MAX);
		ActWork[actno].work[4] = SLOWCIRCLE_ADDSEC;
		ActWork[actno].work[5] = SLOWCIRCLE_ADD_FURIHABA_X;
		ActWork[actno].work[6] = SLOWCIRCLE_ADD_FURIHABA_Y;
	}
	
	ActWork[actno].work[7] = 1;		//最後にAddされたｱｸﾀｰの印
	DelTask(id);
}

//=========================================================================
//	普通の円を描く光ｴﾌｪｸﾄのｱｸﾀｰをｾｯﾄしていくﾀｽｸ
//=========================================================================
#define NORMAL_HIKARI_MAX			10	//光OBJの数
#define NORMAL_ADDSEC				5
#define NORMAL_ADD_FURIHABA_X		1
#define NORMAL_ADD_FURIHABA_Y		1
static void NormalCircleHikariActorSetTask(u8 id)
{
	u8 actno, i;
	u8 x, y, oam_pri, act_pri;
	u8 tblno;
	
	tblno = TaskTable[id].work[15];
	
	x = TaskTable[id].work[1];
	y = TaskTable[id].work[2];
	oam_pri = TaskTable[id].work[3];
	act_pri = TaskTable[id].work[4];
		
	for(i = 0; i < NORMAL_HIKARI_MAX; i++)
	{
		actno = AddActor(&BallHikariHeader[tblno], x, y, act_pri);
		ActAnmChg(&ActWork[actno], BallHikariAnmChgTbl[tblno]);
		ActWork[actno].move = OblongCircleHikariInitSeq;
		ActWork[actno].oamData.Priority = oam_pri;
		ActWork[actno].work[0] = i * (256/NORMAL_HIKARI_MAX);
		ActWork[actno].work[4] = NORMAL_ADDSEC;
		ActWork[actno].work[5] = NORMAL_ADD_FURIHABA_X;
		ActWork[actno].work[6] = NORMAL_ADD_FURIHABA_Y;
	}
	
	ActWork[actno].work[7] = 1;		//最後にAddされたｱｸﾀｰの印
	DelTask(id);
}

//=========================================================================
//	2重の普通の円を描く光ｴﾌｪｸﾄのｱｸﾀｰをｾｯﾄしていくﾀｽｸ
//=========================================================================
#define DOUBLE_HIKARI_MAX			8	//光OBJの数
#define DOUBLE_ADDSEC				8
#define DOUBLE_ADD_FURIHABA_X		2
#define DOUBLE_ADD_FURIHABA_Y		2
#define DOUBLE_WAIT					8	//2個目の円が出てくるまでのｳｪｲﾄ
static void DoubleCircleHikariActorSetTask(u8 id)
{
	u8 actno, i;
	u8 x, y, oam_pri, act_pri;
	u8 tblno;
	
	if(TaskTable[id].work[7] != 0){
		TaskTable[id].work[7]--;
		return;
	}
	
	tblno = TaskTable[id].work[15];
	
	x = TaskTable[id].work[1];
	y = TaskTable[id].work[2];
	oam_pri = TaskTable[id].work[3];
	act_pri = TaskTable[id].work[4];
		
	for(i = 0; i < DOUBLE_HIKARI_MAX; i++)
	{
		actno = AddActor(&BallHikariHeader[tblno], x, y, act_pri);
		ActAnmChg(&ActWork[actno], BallHikariAnmChgTbl[tblno]);
		ActWork[actno].move = OblongCircleHikariInitSeq;
		ActWork[actno].oamData.Priority = oam_pri;
		ActWork[actno].work[0] = i * (256/DOUBLE_HIKARI_MAX);
		ActWork[actno].work[4] = DOUBLE_ADDSEC;
		ActWork[actno].work[5] = DOUBLE_ADD_FURIHABA_X;
		ActWork[actno].work[6] = DOUBLE_ADD_FURIHABA_Y;
	}
	
	TaskTable[id].work[7] = DOUBLE_WAIT;
	if(TaskTable[id].work[0]++ == 1){
		ActWork[actno].work[7] = 1;		//最後にAddされたｱｸﾀｰの印
		DelTask(id);
	}
}

//----------------------------------------------------------
//	横長、縦長の光ｴﾌｪｸﾄのｱｸﾀｰシーケンス
//----------------------------------------------------------
static void OblongCircleHikariInitSeq(actWork *xreg)
{
	xreg->dx = SinMove(xreg->work[0], xreg->work[1]);
	xreg->dy = CosMove(xreg->work[0], xreg->work[2]);
	xreg->work[0] += xreg->work[4];
	xreg->work[0] &= 0x00ff;
	xreg->work[1] += xreg->work[5];
	xreg->work[2] += xreg->work[6];
	if(xreg->work[3]++ == 50)
		HikariEffectDel(xreg);
}

//=========================================================================
//	8の字になる光ｴﾌｪｸﾄのｱｸﾀｰをｾｯﾄしていくﾀｽｸ
//=========================================================================
#define EIGHTCIRCLE_HIKARI_MAX			12	//光OBJの数
#define EIGHTCIRCLE_ADDSEC				6
#define EIGHTCIRCLE_ADD_FURIHABA_X		1
#define EIGHTCIRCLE_ADD_FURIHABA_Y		1
static void EightCircleHikariActorSetTask(u8 id)
{
	u8 actno, i;
	u8 x, y, oam_pri, act_pri;
	u8 tblno;
	
	tblno = TaskTable[id].work[15];
	
	x = TaskTable[id].work[1];
	y = TaskTable[id].work[2];
	oam_pri = TaskTable[id].work[3];
	act_pri = TaskTable[id].work[4];
		
	for(i = 0; i < EIGHTCIRCLE_HIKARI_MAX; i++)
	{
		actno = AddActor(&BallHikariHeader[tblno], x, y, act_pri);
		ActAnmChg(&ActWork[actno], BallHikariAnmChgTbl[tblno]);
		ActWork[actno].move = EightCircleHikariInitSeq;
		ActWork[actno].oamData.Priority = oam_pri;
		ActWork[actno].work[0] = i * (256/EIGHTCIRCLE_HIKARI_MAX);
	}
	
	ActWork[actno].work[7] = 1;		//最後にAddされたｱｸﾀｰの印
	DelTask(id);
}

//----------------------------------------------------------
//	８の字を描く光ｴﾌｪｸﾄのｱｸﾀｰシーケンス
//----------------------------------------------------------
static void EightCircleHikariInitSeq(actWork *xreg)
{
	xreg->dx = SinMove(xreg->work[0], xreg->work[1]);
	xreg->dy = CosMove(xreg->work[0], SinMove(xreg->work[0], xreg->work[2]));
	xreg->work[0] += EIGHTCIRCLE_ADDSEC;
	xreg->work[0] &= 0x00ff;
	xreg->work[1] += EIGHTCIRCLE_ADD_FURIHABA_X;
	xreg->work[2] += EIGHTCIRCLE_ADD_FURIHABA_Y;
	if(xreg->work[3]++ == 50)
		HikariEffectDel(xreg);
}

//=========================================================================
//	縦長と横長同時に出す光ｴﾌｪｸﾄのｱｸﾀｰをｾｯﾄしていくﾀｽｸ
//=========================================================================
#define TWIN_HIKARI_MAX			8	//光OBJの数
#define TWIN_ADDSEC				8
#define TWIN_ADD_FURIHABA_X		2
#define TWIN_ADD_FURIHABA_Y		1
static void TwinCircleHikariActorSetTask(u8 id)
{
	u8 actno, i, s;
	u8 x, y, oam_pri, act_pri;
	u8 tblno;
	
	tblno = TaskTable[id].work[15];
	
	x = TaskTable[id].work[1];
	y = TaskTable[id].work[2];
	oam_pri = TaskTable[id].work[3];
	act_pri = TaskTable[id].work[4];
		
	for(s = 0; s < 2; s++)
	{
		for(i = 0; i < TWIN_HIKARI_MAX; i++)
		{
			actno = AddActor(&BallHikariHeader[tblno], x, y, act_pri);
			ActAnmChg(&ActWork[actno], BallHikariAnmChgTbl[tblno]);
			ActWork[actno].move = OblongCircleHikariInitSeq;
			ActWork[actno].oamData.Priority = oam_pri;
			ActWork[actno].work[0] = i * (256/TWIN_HIKARI_MAX);
			ActWork[actno].work[4] = TWIN_ADDSEC;
			if(s == 0){
				ActWork[actno].work[5] = TWIN_ADD_FURIHABA_X;
				ActWork[actno].work[6] = TWIN_ADD_FURIHABA_Y;
			}
			else{
				ActWork[actno].work[5] = TWIN_ADD_FURIHABA_Y;
				ActWork[actno].work[6] = TWIN_ADD_FURIHABA_X;
			}
		}
	}
	
	ActWork[actno].work[7] = 1;		//最後にAddされたｱｸﾀｰの印
	DelTask(id);
}

//=========================================================================
//	2つの斜めの円がクロスする光ｴﾌｪｸﾄのｱｸﾀｰをｾｯﾄしていくﾀｽｸ
//=========================================================================
#define CROSCIRCLE_HIKARI_MAX			8	//光OBJの数
#define CROSCIRCLE_ADDSEC				10
#define CROSCIRCLE_ADD_FURIHABA_X		1
#define CROSCIRCLE_ADD_FURIHABA_Y		1
static void CrosCircleHikariActorSetTask(u8 id)
{
	u8 actno, i;
	u8 x, y, oam_pri, act_pri;
	u8 tblno;
	
	tblno = TaskTable[id].work[15];
	
	x = TaskTable[id].work[1];
	y = TaskTable[id].work[2];
	oam_pri = TaskTable[id].work[3];
	act_pri = TaskTable[id].work[4];
		
	for(i = 0; i < CROSCIRCLE_HIKARI_MAX; i++)
	{
		actno = AddActor(&BallHikariHeader[tblno], x, y, act_pri);
		ActAnmChg(&ActWork[actno], BallHikariAnmChgTbl[tblno]);
		ActWork[actno].move = CrosCircleHikariInitSeq;
		ActWork[actno].oamData.Priority = oam_pri;
		ActWork[actno].work[0] = i * (256/CROSCIRCLE_HIKARI_MAX);
	}
	
	ActWork[actno].work[7] = 1;		//最後にAddされたｱｸﾀｰの印
	DelTask(id);
}

//----------------------------------------------------------
//	斜め向きの円ｴﾌｪｸﾄのｱｸﾀｰシーケンス
//----------------------------------------------------------
static void CrosCircleHikariInitSeq(actWork *xreg)
{
	xreg->dx = SinMove(xreg->work[0], xreg->work[1]);
	xreg->dy = CosMove(xreg->work[0], SinMove(xreg->work[0]&0x3f, xreg->work[2]));
	xreg->work[0] += CROSCIRCLE_ADDSEC;
	xreg->work[0] &= 0x00ff;
	xreg->work[1] += CROSCIRCLE_ADD_FURIHABA_X;
	xreg->work[2] += CROSCIRCLE_ADD_FURIHABA_Y;
	if(xreg->work[3]++ == 50)
		HikariEffectDel(xreg);
}


//=========================================================================
//	光ｴﾌｪｸﾄのｱｸﾀｰをDelする
//		※work[7]に1が入っている場合はCellとパレットのDelも行なう
//=========================================================================
static void HikariEffectDel(actWork *xreg)
{
	int i;
	
	if(sys.FieldBattleFlag == 0){	//フィールド
		if(xreg->work[7] == 1)
			AllDelActor(xreg);
		else
			DelActor(xreg);
	}
	else{							//戦闘
		if(xreg->work[7] == 1){
			BtlWork->hikari_count--;
			if(BtlWork->hikari_count == 0){
				//AllDelActor(xreg);
				for(i = 0; i < MONS_BALL_MAX; i++){
					CellDel(BallHikariCellTbl[i].act_num);
					ObjPalRegNumDel(BallHikariPalTbl[i].reg_num);
				}
				DelActor(xreg);
			}
			else
				DelActor(xreg);
		}
		else
			DelActor(xreg);
	}
}






//=========================================================================
//
//		ﾓﾝｽﾀｰﾎﾞｰﾙが開いた時に光につつまれるエフェクト
//												by matsuda 2002.07.30(火)
//=========================================================================
//-- ﾎﾞｰﾙ毎の変化後の指定色 --//
static const u16 BallHikariColor[] = {
	0x7adf,			//EF_MONSTER_BALL,
	0x7af0,			//EF_SUPER_BALL,
	0x53d7,			//EF_SAFARI_BALL,
	0x3fff,			//EF_HYPER_BALL,
	0x7297,			//EF_MASTER_BALL,
	0x67f5,			//EF_NET_BALL,
	0x7b2c,			//EF_DIVE_BALL,
	0x2b7e,			//EF_NEST_BALL,
	0x431f,			//EF_REPEAT_BALL,
	0x7bdd,			//EF_TIMER_BALL,
	0x2a3f,			//EF_GOUJYASU_BALL,
	0x293f,			//EF_PREMIA_BALL,
};
//----------------------------------------------------------
// type = 対象ﾎﾟｹﾓﾝをどっち方向にﾌｪｰﾄﾞさせるか(0:元の色→指定色   1:指定色→元の色)
//	haikei_palbit = ﾌﾗｯｼｭさせる背景のﾊﾟﾚｯﾄを指定(PaletteFadeReqのfade_bitと同じ)
//----------------------------------------------------------
u8 HikariColorEffectSet(u8 type, u8 palno, u32 haikei_palbit, u8 tblno)
{
	u8 id;
	
	id = AddTask(HikariColorEffectInMain, 5);
	TaskTable[id].work[15] = tblno;
	TaskTable[id].work[3] = palno;
	TaskTable[id].work[10] = haikei_palbit & 0x0000ffff;
	TaskTable[id].work[11] = haikei_palbit >> 16;
	//-- ポケモン --//
	if(type == 0)
	{
		SoftFade(16*16 + 16*palno, 16, 0, BallHikariColor[tblno]);
		TaskTable[id].work[1] = 1;
	}
	else
	{
		SoftFade(16*16 + 16*palno, 16, 16, BallHikariColor[tblno]);
		TaskTable[id].work[0] = 16;
		TaskTable[id].work[1] = -1;
		TaskTable[id].TaskAdrs = HikariColorEffectOutInit;
	}
	//-- 背景 --//
	PaletteFadeReq(haikei_palbit, 0, 0, 16, 0x7fff);
	return id;
}

static void HikariColorEffectInMain(u8 id)
{
	u32 haikei_palbit;
	u8 tblno;
	
	tblno = TaskTable[id].work[15];
	
	if(TaskTable[id].work[2] < 17)
	{
		SoftFade(16*16 + 16*TaskTable[id].work[3], 16, TaskTable[id].work[0], BallHikariColor[tblno]);
		TaskTable[id].work[0] += TaskTable[id].work[1];
		TaskTable[id].work[2]++;	//ｶｳﾝﾀ
	}
	else
	{
		if(FadeData.fade_sw == 0)
		{
			haikei_palbit = (u16)TaskTable[id].work[10]|((u16)TaskTable[id].work[11] << 16);
			PaletteFadeReq(haikei_palbit, 0, 16, 0, 0x7fff);
			DelTask(id);
		}
	}
}

static void HikariColorEffectOutInit(u8 id)
{
	u32 haikei_palbit;
	
	if(FadeData.fade_sw)
		return;
	haikei_palbit = (u16)TaskTable[id].work[10] | ((u16)TaskTable[id].work[11] << 16);
	PaletteFadeReq(haikei_palbit, 0, 16, 0, 0x7fff);
	TaskTable[id].TaskAdrs = HikariColorEffectOutMain;
}

static void HikariColorEffectOutMain(u8 id)
{
	u8 tblno;
	
	tblno = TaskTable[id].work[15];
	
	if(TaskTable[id].work[2] < 17)
	{
		SoftFade(16*16 + 16*TaskTable[id].work[3], 16, TaskTable[id].work[0], BallHikariColor[tblno]);
		TaskTable[id].work[0] += TaskTable[id].work[1];
		TaskTable[id].work[2]++;	//ｶｳﾝﾀ
	}
	else
		DelTask(id);
}












//=========================================================================
//
//		身代わりのキャラとポケモンをｽﾗｲﾄﾞさせて差し替える
//												by matsuda 2002.07.22(月)
//=========================================================================
//----------------------------------------------------------
//	offset 0: 0=ポケモンをｽﾗｲﾄﾞｱｳﾄさせて「みがわり」キャラをｽﾗｲﾄﾞｲﾝさせる
//			  1=「みがわり」キャラをｽﾗｲﾄﾞｱｳﾄさせてポケモンをｽﾗｲﾄﾞｲﾝさせる
//----------------------------------------------------------
#define MIGAWARI_SP		0x0500
void MigawariInOutTask(u8 id)
{
	u8 poke;
	u8 end = 0;
	
	poke = PokemonStruct[AttackNo];
	switch(TaskTable[id].work[10]){
		case 0:
			TaskTable[id].work[11] = WazaEffWork[0];
			TaskTable[id].work[0] += MIGAWARI_SP;
			if(MineEnemyCheck(AttackNo))
				ActWork[poke].dx += TaskTable[id].work[0] >> 8;
			else
				ActWork[poke].dx -= TaskTable[id].work[0] >> 8;
			TaskTable[id].work[0] &= 0x00ff;
			
			if(ActWork[poke].x+ActWork[poke].dx > 240+32 
					|| ActWork[poke].x+ActWork[poke].dx < -32)
				TaskTable[id].work[10]++;
			break;
		case 1:
			MigawariChange(AttackNo, TaskTable[id].work[11], poke);
			TaskTable[id].work[10]++;
			break;
		case 2:
			TaskTable[id].work[0] += MIGAWARI_SP;
			if(MineEnemyCheck(AttackNo))
				ActWork[poke].dx -= TaskTable[id].work[0] >> 8;
			else
				ActWork[poke].dx += TaskTable[id].work[0] >> 8;
			TaskTable[id].work[0] &= 0x00ff;
			
			if(MineEnemyCheck(AttackNo)){
				if(ActWork[poke].dx <= 0){
					ActWork[poke].dx = 0;
					end = 1;
				}
			}
			else{
				if(ActWork[poke].dx >= 0){
					ActWork[poke].dx = 0;
					end = 1;
				}
			}
			
			if(end)
				DelTaskEffect(id);
			break;
	}
}










//=========================================================================
//
//		「みがわり」キャラ気絶エフェクト
//												by matsuda 2002.07.23(火)
//=========================================================================
#define MIGAWARI_KIZETU_BLD_WAIT	1
void MigawariKizetuTask(u8 id)
{
#if 1
	u8 poke;
	u32 chradrs;
	
	switch(TaskTable[id].work[15]){
		case 0:
			if(GetPokeBGNo(AttackNo) == 1)
				*(vu16*)REG_BLDCNT = BLD_A_BLEND_MODE | BLD_2ND_ALL | BLD_BG1_1ST;
			else
				*(vu16*)REG_BLDCNT = BLD_A_BLEND_MODE | BLD_2ND_ALL | BLD_BG2_1ST;
			*(vu16*)REG_BLDALPHA = 16;
			TaskTable[id].work[15]++;
			break;
		case 1:
			if(TaskTable[id].work[1]++ > MIGAWARI_KIZETU_BLD_WAIT){
				TaskTable[id].work[1] = 0;
				TaskTable[id].work[0]++;
				*(vu16*)REG_BLDALPHA = ((TaskTable[id].work[0])<<8) | (16-TaskTable[id].work[0]);
				if(TaskTable[id].work[0] == 16)
					TaskTable[id].work[15]++;
			}
			break;
		case 2:
			poke = PokemonStruct[AttackNo];
			chradrs = ActWork[poke].oamData.CharNo * 32 + OBJ_MODE0_VRAM;
			DIV_DMACLEAR(3, 0, chradrs, 8*8*32, 32);	//「みがわり」ｷｬﾗを消去
			MigawariFlgReset(AttackNo);
			DelTaskEffect(id);
			break;
	}
#else
	switch(TaskTable[id].work[15]){
		case 0:
			SePlay(SE_POKE_DEAD);
			ActWork[PokemonStruct[AttackNo]].work[1] = 0;
			ActWork[PokemonStruct[AttackNo]].work[2] = C_POKE_KIZETU_SP;
			ActWork[PokemonStruct[AttackNo]].move = SeqMinePokeMove;
			TaskTable[id].work[15]++;
			break;
		case 1:
			if(ActWork[PokemonStruct[AttackNo]].y 
				+ ActWork[PokemonStruct[AttackNo]].dy > 160)
			{
				MigawariFlgReset(AttackNo);
				DelTaskEffect(id);
			}
			break;
	}
#endif
}




//=========================================================================
//		※west.sから呼ばれる命令です
//	身代わりフラグを調べて、WazaEffWork[7]に結果を返す
//	身代わりﾌﾗｸﾞが立っているなら１、立ってないなら０
//=========================================================================
void MigawariFlagChkTask(u8 id)
{
	WazaEffWork[7] = Climem[AttackNo].migawari;
	DelTaskEffect(id);
}





//=========================================================================
//	TsuikaClientの値をDefenceNoにセット
//=========================================================================
void TsuikaClientDefenceSet(u8 id)
{
	DefenceNo = TsuikaClient;
	DelTaskEffect(id);
}







//=========================================================================
//
//		レアエフェクト
//												by matsuda 2002.07.25(木)
//=========================================================================
extern const	actHeader NegaigotoHeader;
extern const	actHeader NegaigotoSippoHeader;

#define	RARE_EFF_START_WAIT		60//30	//レアエフェクト開始までのウェイト
void RareEffectCheckSet(u8 client_no, PokemonParam *pp)
{
	u32 poke_id, personal;
	u8 id_0,id_1;
	u8 rare_flg = 0;
	
	CliSys[client_no].rare_eff = 1;
	
	poke_id = PokeParaGet(pp, ID_id_no);
	personal = PokeParaGet(pp, ID_personal_rnd);
	
	if(PokeBG2taimeCheck(client_no) == 0)
		rare_flg = 0;
	else if( ( ((poke_id&0xffff0000)>>16) ^ (poke_id&0xffff) ^ ((personal&0xffff0000)>>16) ^ (personal&0xffff) ) < 8 )
		rare_flg = 1;
		
	if(rare_flg)
	{
		if(CellCharNumGet(WAZACHR_ID_SHOOTINGSTAR) == 0xffff){
			DecordCellSet((void*)&WazaEffDataCell[WAZACHR_ID_SHOOTINGSTAR-WAZACHR_ID_FAST_NUMBER]);
			DecordPalSet((void*)&WazaEffDataPal[WAZACHR_ID_SHOOTINGSTAR-WAZACHR_ID_FAST_NUMBER]);
		}
		id_0 = AddTask(RareStarEffectTail, 10);
		id_1 = AddTask(RareStarEffectTail, 10);
		TaskTable[id_0].work[0] = client_no;
		TaskTable[id_1].work[0] = client_no;
		TaskTable[id_0].work[1] = 0;	//circle
		TaskTable[id_1].work[1] = 1;	//straight
	}
	else
		CliSys[client_no].rare_eff_end = 1;
}

//----------------------------------------------------------
//	円を描く星のアクターを管理するタスク
//----------------------------------------------------------
#define RARE_STAR_MAX	5
static void RareStarEffectTail(u8 id)
{
	s16 x, y;
	u8 client_no;
	u8 actno;
	s8 pan;
	
	if(TaskTable[id].work[13] < RARE_EFF_START_WAIT){
		TaskTable[id].work[13]++;
		return;
	}
	if(BtlWork->hikari_count > 0)
		return;
	
	if(TaskTable[id].work[10]++ % 4 == 0){
		client_no = TaskTable[id].work[0];
		x = GetWazaEffPos(client_no, EFF_X);
		y = GetWazaEffPos(client_no, EFF_Y);
		switch(TaskTable[id].work[11])
		{
			case 0:
				actno = AddActor(&NegaigotoHeader, x, y, 5);
				break;
			case 1:
			case 2:
			case 3:
				actno = AddActor(&NegaigotoSippoHeader, x, y, 5);
				ActWork[actno].oamData.CharNo += 4;
				break;
			default:
				actno = AddActor(&NegaigotoSippoHeader, x, y, 5);
				ActWork[actno].oamData.CharNo += 5;
				break;
		}
		
		if(TaskTable[id].work[1] == 0)
			ActWork[actno].move = CircleStarSeq;
		else{
			ActWork[actno].move = StraightStarSeq;
			ActWork[actno].dx = -32;
			ActWork[actno].dy = 32;
			ActWork[actno].banish = 1;
			
			if(TaskTable[id].work[11] == 0){
				if(MineEnemyCheck(client_no) == SIDE_MINE)
					pan = WAZA_SE_L;
				else
					pan = WAZA_SE_R;
				SePlayPan(SE_REAPOKE, pan);
			}
		}
		ActWork[actno].work[0] = id;
		TaskTable[id].work[11]++;
		TaskTable[id].work[12]++;		//Addしたアクターの数(work[11]も同じだがｱｸﾀｰからいじられるので分けておく
		if(TaskTable[id].work[11] == RARE_STAR_MAX)
			TaskTable[id].TaskAdrs = CircleStarWaitTask;
	}
}

static void CircleStarWaitTask(u8 id)
{
	u8 client_no;
	
	if(TaskTable[id].work[12] == 0){
		if(TaskTable[id].work[1] == 1){
			client_no = TaskTable[id].work[0];
			CliSys[client_no].rare_eff_end = 1;
		}
		DelTask(id);
	}
}

//-- 星：円 --//
#define RARE_FURIHABA	24
#define RARE_ADDSEC		12
static void CircleStarSeq(actWork *xreg)
{
	xreg->dx = SinMove(xreg->work[1], RARE_FURIHABA);
	xreg->dy = CosMove(xreg->work[1], RARE_FURIHABA);
	xreg->work[1] += RARE_ADDSEC;
	if(xreg->work[1] > 255){
		TaskTable[xreg->work[0]].work[12]--;
		AffineDelActor(xreg);	//一応・・・
		DelActor(xreg);
	}
}

//-- 星：直線 --//
#define RARE_STRAIGHT_SP	5
static void StraightStarSeq(actWork *xreg)
{
	if(xreg->work[1] < 4){	//エフェクト開始までしばらく待機
		xreg->work[1]++;
		return;
	}
	
	xreg->banish = 0;
	xreg->dx += RARE_STRAIGHT_SP;
	xreg->dy -= RARE_STRAIGHT_SP;
	if(xreg->dx > 32){
		TaskTable[xreg->work[0]].work[12]--;
		AffineDelActor(xreg);
		DelActor(xreg);
	}
}










//=========================================================================
//
//		ポロック投げるエフェクト
//												by matsuda 2002.07.26(金)
//=========================================================================
//----------------------------------------------------------
//	ポロックの種類に合わせてCell&パレットをセット
//----------------------------------------------------------
enum{
	RED_POROC,
	BLUE_POROC,
	PINK_POROC,
	GREEN_POROC,
	YELLOW_POROC,
	WHITE_POROC,
	BLACK_POROC,
};
static const u8 PorocColorNoTbl[] = {
	RED_POROC,				// 00:ダミー
	RED_POROC,		// 01:あかいキューブ
	BLUE_POROC,		// 02:あおいキューブ
	PINK_POROC,		// 03:ももいろキューブ
	GREEN_POROC,		// 04:みどりのキューブ
	YELLOW_POROC,		// 05:きいろのキューブ
	BLUE_POROC,		// 06:むらさきキューブ
	BLUE_POROC,		// 07:こんいろキューブ
	RED_POROC,		// 08:ちゃいろキューブ
	BLUE_POROC,		// 09:そらいろキューブ
	GREEN_POROC,		// 10:きみどりキューブ
	WHITE_POROC,		// 11:はいいろキューブ
	BLACK_POROC,		// 12:くろいキューブ
	WHITE_POROC,		// 13:しろいキューブ
	YELLOW_POROC,		// 14:きんいろキューブ
};

void PorocCellPalSet(u8 id)
{
	u8 color_no;
	u8 palette;
	
	DecordCellSet((CellData*)&WazaEffDataCell[WAZACHR_ID_POROC-WAZACHR_ID_FAST_NUMBER]);
	DecordPalSet((PalData*)&WazaEffDataPal[WAZACHR_ID_POROC - WAZACHR_ID_FAST_NUMBER]);
	
	//-- ポロックの種類に合わせたカラーを転送 --//
	color_no = ItemNo;
	palette = ObjPalNumGet(WAZACHR_ID_POROC);
	
	DelTaskEffect(id);
}

void PorocCellPalDel(u8 id)
{
	CellDel(WAZACHR_ID_POROC);
	ObjPalRegNumDel(WAZACHR_ID_POROC);
	DelTaskEffect(id);
}

//=========================================================================
//	ポロックを投げる(ﾄﾚｰﾅｰのｱﾆﾒ込み)
//=========================================================================
static void PorocInit(actWork *xreg);
static void PorocMoveMain(actWork *xreg);
static void TrainerAnmWait(actWork *xreg);
static void ProcMoveEnd(actWork *xreg);

const actHeader PorocHeader = 
{
	WAZACHR_ID_POROC,
	WAZACHR_ID_POROC,
	&WazaOamDataNormal[1],
	DummyActAnmTbl,
	ACT_NTRANS,		//非転送アニメ
	DummyActAffTbl,
	PorocInit,
};

//----------------------------------------------------------
//	0:始点Xoffset	1:始点Yoffset	2:終点Xoffset	3:終点Yoffset
//----------------------------------------------------------
#define POROC_MOVE_SYNC		30
#define POROC_YAMANARI_DY	(-32)
static void PorocInit(actWork *xreg)
{
	WazaDefaultPosSet2(xreg, EFF_MODE);
	
	xreg->work[0] = POROC_MOVE_SYNC;
	xreg->work[2] = GetWazaEffPos(ClientNoGet(BSS_CLIENT_ENEMY), EFF_X)+WazaEffWork[2];
	xreg->work[4] = GetWazaEffPos(ClientNoGet(BSS_CLIENT_ENEMY), EFF_Y)+WazaEffWork[3];
	xreg->work[5] = POROC_YAMANARI_DY;
	YamanariMoveInit(xreg);

	ActAnmChg(&ActWork[PokemonStruct[AttackNo]], 1);	//ﾄﾚｰﾅｰｱﾆﾒ

	xreg->move = TrainerAnmWait;
}

static void TrainerAnmWait(actWork *xreg)
{	//ﾄﾚｰﾅｰのｱﾆﾒ待ち
	if(ActWork[PokemonStruct[AttackNo]].anm_offs == 1)
		xreg->move = PorocMoveMain;
}

static void PorocMoveMain(actWork *xreg)
{
	if(YamanariMoveMain(xreg)){
		xreg->work[0] = 0;
		xreg->banish = 1;
		xreg->move = ProcMoveEnd;
	}
}

static void ProcMoveEnd(actWork *xreg)
{
	if(ActWork[PokemonStruct[AttackNo]].anmend_sw){
		if(++xreg->work[0] > 0){
			ActAnmChg(&ActWork[PokemonStruct[AttackNo]], 0);	//元のｱﾆﾒに戻す
			DelWazaEffect(xreg);
		}
	}
}

//----------------------------------------------------------
//	AttackNoにBSS_CLIENT_MINE、DefenceNoにBSS_CLIENT_ENEMYのクライアントNoをセットする
//----------------------------------------------------------
void AttackDefenceMineEnemySet(u8 id)
{
	AttackNo = ClientNoGet(BSS_CLIENT_MINE);
	DefenceNo = ClientNoGet(BSS_CLIENT_ENEMY);
	DelTaskEffect(id);
}













//=========================================================================
//
//		しめつけエフェクト
//			何の技でしめつけられているかを調べる
//												by matsuda 2002.08.09(金)
//=========================================================================
void SimetukeWazaCheck(u8 id)
{
	if(BtlWork->work[0] == WAZANO_HONOONOUZU)
		WazaEffWork[0] = 1;
	else if(BtlWork->work[0] == WAZANO_UZUSIO)
		WazaEffWork[0] = 2;
	else if(BtlWork->work[0] == WAZANO_KARADEHASAMU)
		WazaEffWork[0] = 3;
	else if(BtlWork->work[0] == WAZANO_SUNAZIGOKU)
		WazaEffWork[0] = 4;
	else
		WazaEffWork[0] = 0;
	
	DelTaskEffect(id);
}









//=========================================================================
//
//		BtlWork->work[0]にAttackとDefenceが入っているので、
//		それをAttackNo,DefenceNoにｾｯﾄする
//												by matsuda 2002.08.14(水)
//=========================================================================
void BtlWorkAttackDefenceSet(u8 id)
{
	AttackNo = BtlWork->work[0] & 0xff;
	DefenceNo = BtlWork->work[0] >> 8;
	DelTaskEffect(id);
}


