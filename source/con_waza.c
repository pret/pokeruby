//=========================================================================
//
//		コンテスト技効果プログラム
//											by matsuda 2001.10.01(月)
//=========================================================================

#include "common.h"
#include "contest.h"
#include "con_tool.h"
#include "agbmons.h"
#include "calctool.h"
#include "param.h"

#include "..\msgdata\conmsg.h"

//----------------------------------------------------------
//	データ
//----------------------------------------------------------
#include "con_waza.dat"
extern	const	WazaTblDat	WTD[];

//----------------------------------------------------------
//	プロトタイプ宣言
//----------------------------------------------------------

#if 1
static void NormalAppeal(void);
static void Bougai2baiAppeal(void);
static void JibakuAppeal(void);
static void Penalty0Appeal(void);
static void DefendsOnlyOnceAppeal(void);
static void AbsoluteDefenceAppeal(void);
static void Bougai20InvalidAppeal(void);
static void BougaiAll10Appeal(void);
static void BeforeOneSub(void);
static void BeforeAllSub(void);
static void BeforeOneRandSub(void);
static void BeforeAllSubRand(void);
static void Combo1Del(void);
static void Combo1Sub40(void);
static void BeforeAll40Rest(void);
static void SameType40(void);
static void StyleType40(void);
static void BeautifulType40(void);
static void CuteType40(void);
static void CleverType40(void);
static void StrongType40(void);
static void StrainBinds(void);
static void StrainBindsAll(void);
static void BonusErases(void);
static void BonusBougai(void);
static void Itii3bai(void);
static void Yonni3bai(void);
static void HanbunGet(void);
static void BeforeSameAppeal(void);
static void JyunbandeHenka(void);
static void RandomEvaluation(void);
static void BeforeSameType(void);
static void BeforeNotSameType(void);
static void BeforeAppealChange(void);
static void BonusAppeal(void);
static void Bonus4bai(void);
static void NextAppeal1ban(void);
static void NextAppeal4ban(void);
static void NextAppealReverse(void);
static void NextAppealRandom(void);
static void SpecTypeSame(u8 type);
static u8 ShieldCheck(u8 brd);
static u8 BougaiCalc(void);
static void APSub(u8 brd, u8 bougai);
static void AbsoluteTensyonUp(void);
static void AppealHalf(void);
static void TensyondeHenka(void);
void TensyonStop(void);
static s16 HasuuKirisute(s16 ap);
static s16 HasuuKiriage(s16 bougai);

//----------------------------------------------------------
//	コンテスト効果技シーケンステーブル
//----------------------------------------------------------
const pFunc ConWazaSeqTbl2[] = 
{
	NormalAppeal,
	Bougai2baiAppeal,
	JibakuAppeal,
	Penalty0Appeal,
	DefendsOnlyOnceAppeal,
	AbsoluteDefenceAppeal,
	Bougai20InvalidAppeal,
	BougaiAll10Appeal,
	BeforeOneSub,
	BeforeAllSub,
	BeforeOneSub,
	BeforeAllSub,
	BeforeOneSub,
	BeforeAllSub,
	BeforeOneRandSub,
	BeforeAllSubRand,
	Combo1Del,
	Combo1Sub40,
	BeforeAll40Rest,
	SameType40,
	StyleType40,
	BeautifulType40,
	CuteType40,
	CleverType40,
	StrongType40,
	StrainBinds,
	StrainBindsAll,
	BonusErases,
	BonusBougai,
	Itii3bai,
	Yonni3bai,
	HanbunGet,
	BeforeSameAppeal,
	JyunbandeHenka,
	RandomEvaluation,
	BeforeSameType,
	BeforeNotSameType,
	BeforeAppealChange,
	BonusAppeal,
	Bonus4bai,
	NextAppeal1ban,
	NextAppeal4ban,
	NextAppealReverse,
	NextAppealRandom,
	AbsoluteTensyonUp,
	AppealHalf,
	TensyondeHenka,
	TensyonStop,
};
#endif

//=========================================================================
//	プログラム
//=========================================================================


//=========================================================================
//	コンボが成立するかチェック
// 戻り値：ｺﾝﾎﾞレベル(1～3　0の場合はｺﾝﾎﾞ不成立)
//=========================================================================
u8 ComboCheck(u16 combo1_waza, u16 combo2_waza)
{
	u8 combo1, combo2[4];
	
	combo1 = ConWazaTbl[combo1_waza].combo1;
	combo2[0] = ConWazaTbl[combo2_waza].combo2_0;
	combo2[1] = ConWazaTbl[combo2_waza].combo2_1;
	combo2[2] = ConWazaTbl[combo2_waza].combo2_2;
	combo2[3] = ConWazaTbl[combo2_waza].combo2_3;
	if(combo1 == 0)
		return 0;
	if(combo1 == combo2[0] || combo1 == combo2[1] || combo1 == combo2[2] || combo1 == combo2[3])
		return ComboLevelTbl[combo1];
	return 0;
}





//=========================================================================
//=========================================================================
//=========================================================================



//=========================================================================
//
//		新・計算式
//												by matsuda 2002.04.01(月)
//=========================================================================

#if 1	//------------- 技計算式 ---------------------------------

//----------------------------------------------------------
//	０：ノーマル40
//	特になし
//----------------------------------------------------------
static void NormalAppeal(void)
{
}

//----------------------------------------------------------
//	１：妨害被害2倍
//	妨害されると大幅にAP値が落ちる。妨害値＝妨害値×２
//----------------------------------------------------------
static void Bougai2baiAppeal(void)
{
	apsys[CONWAZA->nowbrd].bougai2bai = 1;
	AppealKoukaMsgSet(CONWAZA->nowbrd, APPEAL1_MSG);
}

//----------------------------------------------------------
//	２：自爆
//	次のﾀｰﾝからｱﾋﾟｰﾙに参加できなくなる。ｱﾋﾟｰﾙ後、妨害を受けても無効になる。
//----------------------------------------------------------
static void JibakuAppeal(void)
{
	apsys[CONWAZA->nowbrd].next_endAppeal_flg = 1;
//	apsys[CONWAZA->nowbrd].endAppeal_flg = 1;
	AppealKoukaMsgSet(CONWAZA->nowbrd, APPEAL2_MSG);
}

//----------------------------------------------------------
//	３：ペナルティ0
//	連続して出してもペナルティを受けない。
//----------------------------------------------------------
static void Penalty0Appeal(void)
{
	apsys[CONWAZA->nowbrd].penalty0 = 1;
	apsys[CONWAZA->nowbrd].penalty = 0;
	apsys[CONWAZA->nowbrd].conti_count = 0;
}

//----------------------------------------------------------
//	４：1回だけ防御
//	1度だけ妨害の効果を防ぐ。2度目以降はそのまま妨害を受ける。
//----------------------------------------------------------
static void DefendsOnlyOnceAppeal(void)
{
	apsys[CONWAZA->nowbrd].shield_flg = 1;
	AppealKoukaMsgSet(CONWAZA->nowbrd, APPEAL4_0_MSG);
}

//----------------------------------------------------------
//	５：完全防御
//	妨害ｱﾋﾟｰﾙの効果を必ず防ぐ
//----------------------------------------------------------
static void AbsoluteDefenceAppeal(void)
{
	apsys[CONWAZA->nowbrd].Ashield_flg = 1;
	AppealKoukaMsgSet(CONWAZA->nowbrd, APPEAL5_0_MSG);
}

//----------------------------------------------------------
//	６：妨害-20を無効
//	妨害値20以下を受け付けない
//----------------------------------------------------------
static void Bougai20InvalidAppeal(void)
{
	apsys[CONWAZA->nowbrd].invalid = 20;
	AppealKoukaMsgSet(CONWAZA->nowbrd, APPEAL6_0_MSG);
}

//----------------------------------------------------------
//	７：妨害値＝１０
//	妨害を受けた時、妨害値を全て10にする
//----------------------------------------------------------
static void BougaiAll10Appeal(void)
{
	apsys[CONWAZA->nowbrd].invalid10 = 1;
	AppealKoukaMsgSet(CONWAZA->nowbrd, APPEAL7_0_MSG);
}

//----------------------------------------------------------
//	８、１０、１２，１４：前1人-X
//	自分の1つ前にアピールしたポケモンの評価を20減らす。自分が一番の時無効。
//----------------------------------------------------------
static void BeforeOneSub(void)
{
	u8 brd;
	int i;
	u8 flg = 0;
	
	brd = CONWAZA->nowbrd;
	if(CONWAZA->Sort[brd] != 0){
		for(i = 0; i < BREEDER_MAX; i++){
			if(CONWAZA->Sort[brd] - 1 == CONWAZA->Sort[i])
				break;
		}
		CONWAZA->target[0] = i;
		CONWAZA->target[1] = 0xff;
		flg = BougaiCalc();
	}
	if(flg == 0)
		AppealKoukaMsgSet2nd(CONWAZA->nowbrd, DEMOSIPPAI_MSG);
	AppealKoukaMsgSet(CONWAZA->nowbrd, BIKKURISASEYOUTOSITA_MSG);
}

//----------------------------------------------------------
//	９、１１，１３、１８：前全員-X
//	自分の前にｱﾋﾟｰﾙしたポケモン全員の評価を10減らす。自分が一番目の時無効。
//----------------------------------------------------------
static void BeforeAllSub(void)
{
	u8 brd;
	int i, t;
	u8 flg = 0;
	
	brd = CONWAZA->nowbrd;
	if(CONWAZA->Sort[brd] != 0){
		for(i = 0, t = 0; i < BREEDER_MAX; i++){
			if(CONWAZA->Sort[brd] > CONWAZA->Sort[i]){
				CONWAZA->target[t] = i;
				t++;
			}
		}
		CONWAZA->target[t] = 0xff;
		flg = BougaiCalc();
	}
	if(flg == 0)
		AppealKoukaMsgSet2nd(CONWAZA->nowbrd, DEMOSIPPAI_MSG);
	AppealKoukaMsgSet(CONWAZA->nowbrd, BIKKURISASEYOUTOSITA_MSG);
}

//----------------------------------------------------------
//	１４：前1人-乱数
//	自分の1つ前にｱﾋﾟｰﾙしたﾎﾟｹﾓﾝの評価をﾗﾝﾀﾞﾑで減らす
//	(20=20%、40=60%、60=20%)自分が1番の時無効
//----------------------------------------------------------
static void BeforeOneRandSub(void)
{
	u8 rand;
	s8 subap;
	
	rand = pp_rand() % 10;
	if(rand < 2)
		subap = 20;
	else if(rand < 8)
		subap = 40;
	else
		subap = 60;
	CONWAZA->bougai = subap;
	BeforeOneSub();
}

//----------------------------------------------------------
//	１５：前全員-乱数
//	自分の前にｱﾋﾟｰﾙしたﾎﾟｹﾓﾝ全員をﾗﾝﾀﾞﾑで減らす
//	(0=10%, 10=20%, 20=20%, 30=20%, 40=20%, 60=10%)
//----------------------------------------------------------
static void BeforeAllSubRand(void)
{
	u8 rand;
	s8 subap;
	u8 brd;
	int i;
	u8 flg, temp = 0;
	
	brd = CONWAZA->nowbrd;
	if(CONWAZA->Sort[brd] != 0){
		for(i = 0; i < BREEDER_MAX; i++){
			if(CONWAZA->Sort[brd] > CONWAZA->Sort[i]){
				CONWAZA->target[0] = i;
				CONWAZA->target[1] = 0xff;
				
				rand = pp_rand() % 10;
				if(rand < 1)
					subap = 0;
				else if(rand < 3)
					subap = 10;
				else if(rand < 5)
					subap = 20;
				else if(rand < 7)
					subap = 30;
				else if(rand < 9)
					subap = 40;
				else
					subap = 60;
				CONWAZA->bougai = subap;
				flg = BougaiCalc();
				if(flg)
					temp++;
			}
		}
	}
	AppealKoukaMsgSet(CONWAZA->nowbrd, BIKKURISASEYOUTOSITA_MSG);
	if(temp == 0)
		AppealKoukaMsgSet2nd(CONWAZA->nowbrd, DEMOSIPPAI_MSG);
}

//----------------------------------------------------------
//	１６：コンボ1消去
//	コンボ1状態のﾎﾟｹﾓﾝがいる時、その効果を打ち消す。
//----------------------------------------------------------
static void Combo1Del(void)
{
	int i;
	u8 brd;
	u8 flg = 0;
	
	brd = CONWAZA->nowbrd;
	if(CONWAZA->Sort[brd] != 0){
		for(i = 0; i < BREEDER_MAX; i++){
			if(CONWAZA->Sort[brd] > CONWAZA->Sort[i]){
				//if(apsys[i].combo_turn && ShieldCheck(i)){
				if(apsys[i].combo1_flg && ShieldCheck(i))
				{
					//apsys[i].combo_turn = 0;
					apsys[i].combo1_flg = 0;
					apsys[i].combo1_del = 1;
					AppealKoukaMsgSet(i, APPEAL16_1_MSG);
					flg = 1;
				}
			}
		}
	}
	AppealKoukaMsgSet(CONWAZA->nowbrd, APPEAL16_0_MSG);
	if(flg == 0)
		AppealKoukaMsgSet2nd(CONWAZA->nowbrd, DEMOSIPPAI_MSG);
}

//----------------------------------------------------------
//	１７：コンボ1-40
//	コンボ1状態のﾎﾟｹﾓﾝの評価を40減らす。それ以外は10
//----------------------------------------------------------
static void Combo1Sub40(void)
{
	int i;
	u8 brd;
	u8 temp = 0;
	u8 flg;
	
	brd = CONWAZA->nowbrd;
	if(CONWAZA->Sort[brd] != 0){
		for(i = 0; i < BREEDER_MAX; i++){
			if(CONWAZA->Sort[brd] > CONWAZA->Sort[i]){
				//if(apsys[i].combo_turn)
				if(apsys[i].combo1_flg)
					CONWAZA->bougai = 50;
				else
					CONWAZA->bougai = 10;	//両方の値をｾｯﾄしないと次のﾎﾟｹﾓﾝでその値で妨害してしまう
				CONWAZA->target[0] = i;
				CONWAZA->target[1] = 0xff;
				flg = BougaiCalc();
				if(flg)
					temp++;
			}
		}
	}
	AppealKoukaMsgSet(CONWAZA->nowbrd, BIKKURISASEYOUTOSITA_MSG);
	if(temp == 0)
		AppealKoukaMsgSet2nd(CONWAZA->nowbrd, DEMOSIPPAI_MSG);
}

//----------------------------------------------------------
//	１８：全員-40＝1休
//	自分の前にｱﾋﾟｰﾙしたﾎﾟｹﾓﾝ全員の評価を40減らす。次のﾀｰﾝ1回休み
//----------------------------------------------------------
static void BeforeAll40Rest(void)
{
	apsys[CONWAZA->nowbrd].next_yasumi_turn = 1;
//	apsys[CONWAZA->nowbrd].yasumi_turn = 2;
	BeforeAllSub();
	AppealKoukaMsgSet(CONWAZA->nowbrd, BIKKURISASEYOUTOSITA_MSG);
}

//----------------------------------------------------------
//	１９：同タイプを-40
//	自分の前にアピールしたﾎﾟｹﾓﾝの中で、自分と同じタイプのｱﾋﾟｰﾙを40減らす
//----------------------------------------------------------
static void SameType40(void)
{
	u16 wazano;
	
	wazano = apsys[CONWAZA->nowbrd].use_waza;
	SpecTypeSame(ConWazaTbl[wazano].con_type);
	AppealKoukaMsgSet(CONWAZA->nowbrd, BIKKURISASEYOUTOSITA_MSG);
}

//----------------------------------------------------------
//	２０：かっこいい-40
//	自分の前にｱﾋﾟｰﾙしたﾎﾟｹﾓﾝの中で、かっこいいﾀｲﾌﾟのｱﾋﾟｰﾙ評価を40減らす
//----------------------------------------------------------
static void StyleType40(void)
{
	SpecTypeSame(STYLE_TYPE);
	AppealKoukaMsgSet(CONWAZA->nowbrd, BIKKURISASEYOUTOSITA_MSG);
}

//----------------------------------------------------------
//	２１：うつくしい-40
//	自分の前にｱﾋﾟｰﾙしたﾎﾟｹﾓﾝの中で、美しいﾀｲﾌﾟのｱﾋﾟｰﾙ評価を40減らす
//----------------------------------------------------------
static void BeautifulType40(void)
{
	SpecTypeSame(BEAUTIFUL_TYPE);
	AppealKoukaMsgSet(CONWAZA->nowbrd, BIKKURISASEYOUTOSITA_MSG);
}

//----------------------------------------------------------
//	２２：かわいい-40
//	自分の前にｱﾋﾟｰﾙしたﾎﾟｹﾓﾝの中で、かわいいﾀｲﾌﾟのｱﾋﾟｰﾙ評価を40減らす
//----------------------------------------------------------
static void CuteType40(void)
{
	SpecTypeSame(CUTE_TYPE);
	AppealKoukaMsgSet(CONWAZA->nowbrd, BIKKURISASEYOUTOSITA_MSG);
}

//----------------------------------------------------------
//	２３：かしこい-40
//	自分の前にｱﾋﾟｰﾙしたﾎﾟｹﾓﾝの中で、かしこいﾀｲﾌﾟのｱﾋﾟｰﾙ評価を40減らす
//----------------------------------------------------------
static void CleverType40(void)
{
	SpecTypeSame(CLEVER_TYPE);
	AppealKoukaMsgSet(CONWAZA->nowbrd, BIKKURISASEYOUTOSITA_MSG);
}

//----------------------------------------------------------
//	２４：たくましい-40
//	自分の前にｱﾋﾟｰﾙしたﾎﾟｹﾓﾝの中で、たくましいﾀｲﾌﾟのｱﾋﾟｰﾙ評価を40減らす
//----------------------------------------------------------
static void StrongType40(void)
{
	SpecTypeSame(STRONG_TYPE);
	AppealKoukaMsgSet(CONWAZA->nowbrd, BIKKURISASEYOUTOSITA_MSG);
}

//----------------------------------------------------------
//	２５：後1人緊縛
//	この後、ｱﾋﾟｰﾙするﾎﾟｹﾓﾝを緊張させる。
//	緊張したﾎﾟｹﾓﾝは、ｱﾋﾟｰﾙを失敗してﾎﾟｲﾝﾄが貰えない
//----------------------------------------------------------
static void StrainBinds(void)
{
	int i;
	u8 flg = 0;
	
	if(CONWAZA->Sort[CONWAZA->nowbrd] != BREEDER_MAX-1){
		for(i = 0; i < BREEDER_MAX; i++){
			if(CONWAZA->Sort[CONWAZA->nowbrd]+1 == CONWAZA->Sort[i]){
				if(ShieldCheck(i)){
					KintyouFlgSet(i);
					AppealKoukaMsgSet(i, APPEAL25_1_MSG);
					flg = 1;
				}
				else{
					AppealKoukaMsgSet(i, HEIKIDATTA_MSG);
					flg = 1;
				}
			}
		}
	}
	AppealKoukaMsgSet(CONWAZA->nowbrd, APPEAL25_0_MSG);
	if(flg == 0)
//		AppealKoukaMsgSet2nd(CONWAZA->nowbrd, DEMOKINTYOU_MSG);
		AppealKoukaMsgSet2nd(CONWAZA->nowbrd, DEMOSIPPAI_MSG);
}

//----------------------------------------------------------
//	２６：後全員緊縛
//	この後、ｱﾋﾟｰﾙするﾎﾟｹﾓﾝ全員を緊張させる。
//	緊張する確立=後ろ1人の場合60%、
//	後ろ2人の場合、30%
//	後ろ3人の場合、20%
//----------------------------------------------------------
static void StrainBindsAll(void)
{
	int i, t;
	u8 target[BREEDER_MAX+1];
	s16 syuuseiti[BREEDER_MAX];
	s16 kakuritu[BREEDER_MAX];
	u8 flg = 0;
	u8 heiki_flg = 0;
	
	memset(target, 0xff, sizeof(target));
	for(i = 0, t = 0; i < BREEDER_MAX; i++){
		if(CONWAZA->Sort[CONWAZA->nowbrd] < CONWAZA->Sort[i]
				&& apsys[i].miss_flg == 0 && YasumiTurnCheck(i) == 0)
			target[t++] = i;
	}
	if(t == 1){
			kakuritu[0] = 60;	//70//100;
	}
	else if(t == 2){
		kakuritu[0] = 30;	//40;
		kakuritu[1] = 30;	//60;
	}
	else if(t == 3){
		kakuritu[0] = 20;	//25;
		kakuritu[1] = 20;	//30;
		kakuritu[2] = 20;	//35;
	}
	else{
		for(i = 0; i < BREEDER_MAX; i++)
			kakuritu[i] = 0;	//後ろに誰もいないので終了
	}
	
	for(i = 0; i < BREEDER_MAX; i++){
		//ｺﾝﾎﾞ1状態の時は緊張しやすくなる
		if(apsys[i].combo1_flg && Combo1TermCheck(i))
			syuuseiti[i] = ComboLevelTbl[ConWazaTbl[apsys[i].use_wazaold].combo1] * 10;
		else
			syuuseiti[i] = 0;
		
		//ﾎﾞｰﾅｽ状態の時は星一つにつき10%緊張しずらくなる 2002.08.27(火)
		syuuseiti[i] -= (apsys[i].bonus / BONUS_POINT) * 10;
	}
	
	if(kakuritu[0] != 0){
		for(i = 0; target[i] != 0xff; i++){
			if((pp_rand() % 100) < (kakuritu[i] + syuuseiti[target[i]])){
				if(ShieldCheck(target[i])){
					KintyouFlgSet(target[i]);
					AppealKoukaMsgSet(target[i], APPEAL25_1_MSG);
					flg++;
				}
				else
					heiki_flg = 1;
			}else
				heiki_flg = 1;
			
			if(heiki_flg){
				heiki_flg = 0;
				AppealKoukaMsgSet(target[i], HEIKIDATTA_MSG);
				flg++;
			}
			CONWAZA->nowwaza_target[target[i]] = 1;
		}
	}
	AppealKoukaMsgSet(CONWAZA->nowbrd, APPEAL26_MSG);
	if(flg == 0)
//		AppealKoukaMsgSet2nd(CONWAZA->nowbrd, DEMODAREMOKINTYOU_MSG);
		AppealKoukaMsgSet2nd(CONWAZA->nowbrd, DEMOSIPPAI_MSG);
}

//----------------------------------------------------------
//	２７：ボーナス消す
//	自分の前にｱﾋﾟｰﾙしたﾎﾟｹﾓﾝの中で、ﾎﾞｰﾅｽ状態のﾎﾟｹﾓﾝがいる時、ﾎﾞｰﾅｽ値を0にする
//----------------------------------------------------------
static void BonusErases(void)
{
	int i;
	u8 flg = 0;
	
	for(i = 0; i < BREEDER_MAX; i++){
		if(CONWAZA->Sort[CONWAZA->nowbrd] > CONWAZA->Sort[i]){
			if(apsys[i].bonus > 0){
				if(ShieldCheck(i)){
					//APSub(i, apsys[i].bonus);
					apsys[i].bonus = 0;
					apsys[i].bonus_flg = 2;
					AppealKoukaMsgSet(i, APPEAL27_1_MSG);
					flg++;
				}
			}
		}
	}
	AppealKoukaMsgSet(CONWAZA->nowbrd, APPEAL27_0_MSG);
	if(flg == 0)
		AppealKoukaMsgSet2nd(CONWAZA->nowbrd, DEMOMUSI_MSG);
}

//----------------------------------------------------------
//	２８：ボーナス妨害
//	自分の前にｱﾋﾟｰﾙしたﾎﾟｹﾓﾝの中で、ﾎﾞｰﾅｽ状態のﾎﾟｹﾓﾝがいた場合、
//	ｱﾋﾟｰﾙ評価を40減らす。それ以外は10
//----------------------------------------------------------
static void BonusBougai(void)
{
	int i;
	u8 flg, temp = 0;
	
	for(i = 0; i < BREEDER_MAX; i++){
		if(CONWAZA->Sort[CONWAZA->nowbrd] > CONWAZA->Sort[i]){
			if(apsys[i].bonus > 0)
				CONWAZA->bougai = 40;
			else
				CONWAZA->bougai = 10;
			CONWAZA->target[0] = i;
			CONWAZA->target[1] = 0xff;
			flg = BougaiCalc();
			if(flg)
				temp++;
		}
	}
	AppealKoukaMsgSet(CONWAZA->nowbrd, APPEAL28_MSG);
	if(temp == 0)
		AppealKoukaMsgSet2nd(CONWAZA->nowbrd, DEMOMUSI_MSG);
}

//----------------------------------------------------------
//	２９：1位=3倍
//	1位の場合のみ評価が3倍になる
//----------------------------------------------------------
static void Itii3bai(void)
{
	u16 wazano;
	
	//if(CONWAZA->Sort[CONWAZA->nowbrd] == 0){
	if(BrdSort[CONWAZA->nowbrd] == 0){
		wazano = apsys[CONWAZA->nowbrd].use_waza;
		apsys[CONWAZA->nowbrd].ap += WazaKoukaTbl[ConWazaTbl[wazano].apno].ap * 2;
		AppealKoukaMsgSet(CONWAZA->nowbrd, APPEAL29_MSG);
	}
}

//----------------------------------------------------------
//	３０：4位=3倍
//	4位の場合のみ評価が3倍になる
//----------------------------------------------------------
static void Yonni3bai(void)
{
	u16 wazano;
	
	//if(CONWAZA->Sort[CONWAZA->nowbrd] == BREEDER_MAX-1){
	if(BrdSort[CONWAZA->nowbrd] == BREEDER_MAX-1){
		wazano = apsys[CONWAZA->nowbrd].use_waza;
		apsys[CONWAZA->nowbrd].ap += WazaKoukaTbl[ConWazaTbl[wazano].apno].ap * 2;
		AppealKoukaMsgSet(CONWAZA->nowbrd, APPEAL30_MSG);
	}
}

//----------------------------------------------------------
//	３１：全員/2=自分
//	自分の前までに行われたﾗｲﾊﾞﾙﾎﾟｹﾓﾝの表価値合計の半分が自分の評価になる。
//	自分が一番の時は0。
//----------------------------------------------------------
static void HanbunGet(void)
{
	int i, hyouka;
	
	for(i = 0, hyouka = 0; i < BREEDER_MAX; i++){
		if(CONWAZA->Sort[CONWAZA->nowbrd] > CONWAZA->Sort[i])
			hyouka += apsys[i].ap;
	}
	if(hyouka < 0)
		hyouka = 0;
	if(CONWAZA->Sort[CONWAZA->nowbrd] == 0 || hyouka == 0)
		AppealKoukaMsgSet(CONWAZA->nowbrd, APPEAL31_1_MSG);
	else{
		apsys[CONWAZA->nowbrd].ap += hyouka / 2;
		AppealKoukaMsgSet(CONWAZA->nowbrd, APPEAL31_0_MSG);
	}
	apsys[CONWAZA->nowbrd].ap = HasuuKirisute(apsys[CONWAZA->nowbrd].ap);
}

//----------------------------------------------------------
//	３２：前の人＝自分
//	自分の前のﾎﾟｹﾓﾝのｱﾋﾟｰﾙ評価と同じだけ評価を得られる。自分が1番目の時は0
//----------------------------------------------------------
static void BeforeSameAppeal(void)
{
	int i;
	s16 hyouka = 0;
	
	if(CONWAZA->Sort[CONWAZA->nowbrd] != 0){
		for(i = 0; i < BREEDER_MAX; i++){
			if(CONWAZA->Sort[CONWAZA->nowbrd] -1 == CONWAZA->Sort[i])
				hyouka = apsys[i].ap;
		}
	}
	
	if(CONWAZA->Sort[CONWAZA->nowbrd] == 0 || hyouka <= 0)
		AppealKoukaMsgSet(CONWAZA->nowbrd, APPEAL32_1_MSG);
	else{
		apsys[CONWAZA->nowbrd].ap += hyouka;
		AppealKoukaMsgSet(CONWAZA->nowbrd, APPEAL32_0_MSG);
	}
}

//----------------------------------------------------------
//	３３：1<2<3<4
//	出す順番によって、評価が変わる
//	(後ほど評価が高い。1番目=10、2番目=20、3番目=40、4番目=60)
//----------------------------------------------------------
static void JyunbandeHenka(void)
{
	u8 jyunban;
	
	jyunban = CONWAZA->Sort[CONWAZA->nowbrd];
	if(jyunban == 0)
		apsys[CONWAZA->nowbrd].ap = 10;
	else
		apsys[CONWAZA->nowbrd].ap = jyunban * 20;
	
	if(jyunban == 0)
		AppealKoukaMsgSet(CONWAZA->nowbrd, APPEAL33_0_MSG);
	else if(jyunban == 1)
		AppealKoukaMsgSet(CONWAZA->nowbrd, APPEAL33_1_MSG);
	else if(jyunban == 2)
		AppealKoukaMsgSet(CONWAZA->nowbrd, APPEAL33_2_MSG);
	else
		AppealKoukaMsgSet(CONWAZA->nowbrd, APPEAL33_3_MSG);
}

//----------------------------------------------------------
//	３４：乱数で評価変化
//	ランダムで評価が変わる(10=30%, 20=30%, 40=20%, 60=10%, 80=10%)
//----------------------------------------------------------
static void RandomEvaluation(void)
{
	u8 rand;
	s8 addap;
	
	rand = pp_rand() % 10;
	if(rand < 3){
		addap = 10;
		AppealKoukaMsgSet(CONWAZA->nowbrd, APPEAL34_1_MSG);
	}else if(rand < 6){
		addap = 20;
		AppealKoukaMsgSet(CONWAZA->nowbrd, APPEAL34_2_MSG);
	}else if(rand < 8){
		addap = 40;
		AppealKoukaMsgSet(CONWAZA->nowbrd, APPEAL34_3_MSG);
	}else if(rand < 9){
		addap = 60;
		AppealKoukaMsgSet(CONWAZA->nowbrd, APPEAL34_4_MSG);
	}else{
		addap = 80;
		AppealKoukaMsgSet(CONWAZA->nowbrd, APPEAL34_5_MSG);
	}
	apsys[CONWAZA->nowbrd].ap = addap;
}

//----------------------------------------------------------
//	３５：同じ場合3倍
//	自分の前にｱﾋﾟｰﾙしたﾎﾟｹﾓﾝと同じｺﾝﾃｽﾄﾀｲﾌﾟの場合、ｱﾋﾟｰﾙが3倍になる。1番目は無効
//----------------------------------------------------------
static void BeforeSameType(void)
{
	u16 mywaza;
	s8 mysort, target_sort, t_brd;
	
	mysort = CONWAZA->Sort[CONWAZA->nowbrd];
	target_sort = mysort-1;
	if(mysort == 0)
		return;
	
	while(1){
		for(t_brd = 0; t_brd < BREEDER_MAX; t_brd++){
			if(CONWAZA->Sort[t_brd] == target_sort)
				break;
		}
		
		if(apsys[t_brd].endAppeal_flg 	//ｱﾋﾟｰﾙが終了してる
			|| apsys[t_brd].yasumi_turn 	//休み
			|| apsys[t_brd].miss_flg)		//緊張
		{
			target_sort--;
			if(target_sort < 0)
				return;
		}
		else
			break;
	}

	mywaza = apsys[CONWAZA->nowbrd].use_waza;
	if(ConWazaTbl[mywaza].con_type == ConWazaTbl[apsys[t_brd].use_waza].con_type){
		apsys[CONWAZA->nowbrd].ap += WazaKoukaTbl[ConWazaTbl[mywaza].apno].ap * 2;
		AppealKoukaMsgSet(CONWAZA->nowbrd, APPEAL35_MSG);
	}
}

//----------------------------------------------------------
//	３６：違う場合2倍
//	自分の前にｱﾋﾟｰﾙしたﾎﾟｹﾓﾝと違うｺﾝﾃｽﾄﾀｲﾌﾟの場合、ｱﾋﾟｰﾙが3倍になる。1番目は無効
//----------------------------------------------------------
static void BeforeNotSameType(void)
{
	int i;
	u16 mywaza;

	if(CONWAZA->Sort[CONWAZA->nowbrd] != 0){
		mywaza = apsys[CONWAZA->nowbrd].use_waza;
		for(i = 0; i < BREEDER_MAX; i++){
			if(CONWAZA->Sort[CONWAZA->nowbrd] - 1 == CONWAZA->Sort[i]){
				if(ConWazaTbl[mywaza].con_type 
						!= ConWazaTbl[apsys[i].use_waza].con_type){
					apsys[CONWAZA->nowbrd].ap 
						+= WazaKoukaTbl[ConWazaTbl[mywaza].apno].ap * 2;
					AppealKoukaMsgSet(CONWAZA->nowbrd, APPEAL36_MSG);
					break;
				}
			}
		}
	}
}

//----------------------------------------------------------
//	３７：前の人で変化
//	直前のｱﾋﾟｰﾙにより評価が変わる。前の人のｱﾋﾟｰﾙより上だったら2倍。
//	下だったら0。等しい場合はそのまま
//----------------------------------------------------------
static void BeforeAppealChange(void)
{
	int i;
	u16 mywaza;

	if(CONWAZA->Sort[CONWAZA->nowbrd] != 0){
		mywaza = apsys[CONWAZA->nowbrd].use_waza;
		for(i = 0; i < BREEDER_MAX; i++){
			if(CONWAZA->Sort[CONWAZA->nowbrd]-1 == CONWAZA->Sort[i]){
				if(apsys[CONWAZA->nowbrd].ap > apsys[i].ap){
					apsys[CONWAZA->nowbrd].ap *= 2;
					AppealKoukaMsgSet(CONWAZA->nowbrd, APPEAL37_0_MSG);
				}else if(apsys[CONWAZA->nowbrd].ap < apsys[i].ap){
					apsys[CONWAZA->nowbrd].ap = 0;
					AppealKoukaMsgSet(CONWAZA->nowbrd, APPEAL37_1_MSG);
				}
			}
		}
	}
}

//----------------------------------------------------------
//	３８：ﾎﾞｰﾅｽ+10
//	使用したﾀｰﾝより、毎ﾀｰﾝの評価にﾎﾞｰﾅｽがつく。ﾎﾞｰﾅｽ値は+10。ﾎﾞｰﾅｽは最大+30まで
//----------------------------------------------------------
static void BonusAppeal(void)
{
	if(apsys[CONWAZA->nowbrd].bonus < BONUS_MAX){
		apsys[CONWAZA->nowbrd].bonus += BONUS_POINT;
		apsys[CONWAZA->nowbrd].bonus_flg = 1;
//		apsys[CONWAZA->nowbrd].ap += 10;
		AppealKoukaMsgSet(CONWAZA->nowbrd, APPEAL38_MSG);
	}else
		AppealKoukaMsgSet(CONWAZA->nowbrd, DEMOTYOUSIHA_MSG);
}

//----------------------------------------------------------
//	３９：ﾎﾞｰﾅｽ×3
//	ﾎﾞｰﾅｽ値×3をする
//----------------------------------------------------------
static void Bonus4bai(void)
{
	apsys[CONWAZA->nowbrd].bonus3bai = 1;
	if(apsys[CONWAZA->nowbrd].bonus)
		AppealKoukaMsgSet(CONWAZA->nowbrd, APPEAL39_MSG);
	else
		AppealKoukaMsgSet(CONWAZA->nowbrd, TYOUSIGAYOKUNAKUTE_MSG);
}

//----------------------------------------------------------
//	４０：次ｱﾋﾟｰﾙ1番
//	次のﾀｰﾝ、ｱﾋﾟｰﾙが最初になる。同じﾀｰﾝで複数ある時は、
//	後からの方が優先度が高い。5ﾀｰﾝ目は効果無効
//----------------------------------------------------------
static void NextAppeal1ban(void)
{
	s8 i, t;
	u8 sort[BREEDER_MAX];
	
	if(consys->turn == END_TURN-1)
		return;

	for(i = 0; i < BREEDER_MAX; i++)
		sort[i] = apsys[i].next_sort;
	
	sort[CONWAZA->nowbrd] = 0xff;	//自分の所は空白にしておく
	
	for(i = 0; i < BREEDER_MAX; i++){
		for(t = 0; t < BREEDER_MAX; t++){
			if(t == CONWAZA->nowbrd)
				continue;
			if(i == sort[t] && sort[t] == apsys[t].next_sort){
				sort[t]++;
				break;
			}
		}
		if(t == BREEDER_MAX)
			break;
	}
	sort[CONWAZA->nowbrd] = 0;
	apsys[CONWAZA->nowbrd].nextsort_flg = 1;
	
	for(i = 0; i < BREEDER_MAX; i++)
		apsys[i].next_sort = sort[i];
	apsys[CONWAZA->nowbrd].now_nextsort = 1;
	AppealKoukaMsgSet(CONWAZA->nowbrd, APPEAL40_MSG);
}

//----------------------------------------------------------
//	４１：次ｱﾋﾟｰﾙ4番
//	次のﾀｰﾝ、ｱﾋﾟｰﾙが最後になる。同じﾀｰﾝで複数ある時は、
//	後からの方が優先度が高い。5ﾀｰﾝ目は効果無効
//----------------------------------------------------------
static void NextAppeal4ban(void)
{
	s8 i, t;
	u8 sort[BREEDER_MAX];

	if(consys->turn == END_TURN-1)
		return;

	for(i = 0; i < BREEDER_MAX; i++)
		sort[i] = apsys[i].next_sort;

	sort[CONWAZA->nowbrd] = 0xff;	//自分の所は空白にしておく

	for(i = BREEDER_MAX-1; i > -1; i--){
		for(t = 0; t < BREEDER_MAX; t++){
			if(t == CONWAZA->nowbrd)
				continue;
			if(i == sort[t] && sort[t] == apsys[t].next_sort){
				sort[t]--;
				break;
			}
		}
		if(t == BREEDER_MAX)
			break;
	}
	sort[CONWAZA->nowbrd] = BREEDER_MAX-1;
	apsys[CONWAZA->nowbrd].nextsort_flg = 1;
	
	for(i = 0; i < BREEDER_MAX; i++)
		apsys[i].next_sort = sort[i];
	apsys[CONWAZA->nowbrd].now_nextsort = 2;
	AppealKoukaMsgSet(CONWAZA->nowbrd, APPEAL41_MSG);
}

//----------------------------------------------------------
//	４２：逆順にｱﾋﾟｰﾙ
//	次のﾀｰﾝ、アピールする順番が下からになる。5ターン目は効果無効
//----------------------------------------------------------
static void NextAppealReverse(void)
{
	//現状、使用してる技もないし、下山田さんも作らなくていいと言っているので
	return;
}

//----------------------------------------------------------
//	４３：次の順番を乱数
//	次のターン、アピールする順番がランダムになる。5ターン目は効果無効
//----------------------------------------------------------
static void NextAppealRandom(void)
{
	s8 i, t;
	u8 sort[BREEDER_MAX];
	u8 brdno[BREEDER_MAX];
	u8 temp, temp2;
	
	if(consys->turn == END_TURN-1)
		return;

	for(i = 0; i < BREEDER_MAX; i++){
		sort[i] = apsys[i].next_sort;
		brdno[i] = i;
	}

	for(i = 0; i < BREEDER_MAX; i++){
		temp = pp_rand() % (BREEDER_MAX - i);
		temp2 = temp;
		for(t = 0; t < BREEDER_MAX; t++){
			if(brdno[t] != 0xff){
				if(temp2 == 0){
					sort[t] = i;
					brdno[t] = 0xff;
					break;
				}
				else
					temp2--;
			}
		}
	}
	
	for(i = 0; i < BREEDER_MAX; i++){
		apsys[i].next_sort = sort[i];
		apsys[i].nextsort_flg = 2;
	}
	apsys[CONWAZA->nowbrd].now_nextsort = 3;
	AppealKoukaMsgSet(CONWAZA->nowbrd, APPEAL43_MSG);
}

//----------------------------------------------------------
//	４４：必ず盛り上がる
//	コンテストタイプに関係なく必ず盛り上がる。テンション+1上がる。
//	テンションボーナス+10貰える。
//----------------------------------------------------------
static void AbsoluteTensyonUp(void)
{
	if(ConWazaTbl[apsys[CONWAZA->nowbrd].use_waza].con_type == ContestKind)
		return;	//既に属性が一致しているので、ここの処理は無視
	
	apsys[CONWAZA->nowbrd].tensyon_up = 1;
//	AppealKoukaMsgSet(CONWAZA->nowbrd, APPEAL43_MSG);
}

//----------------------------------------------------------
//	４５：アピールを半分に減らす
//	自分の前にアピールしたポケモン全てのアピール評価を半分に減らす。
//	０以下の相手に対しては10減らす。
//----------------------------------------------------------
static void AppealHalf(void)
{
	int i;
	u8 flg, temp = 0;
	
	for(i = 0; i < BREEDER_MAX; i++){
		if(CONWAZA->Sort[CONWAZA->nowbrd] > CONWAZA->Sort[i]){
			if(apsys[i].ap > 0){
				CONWAZA->bougai = apsys[i].ap / 2;
				CONWAZA->bougai = HasuuKiriage(CONWAZA->bougai);
			}
			else
				CONWAZA->bougai = 10;
			CONWAZA->target[0] = i;
			CONWAZA->target[1] = 0xff;
			flg = BougaiCalc();
			if(flg)
				temp++;
		}
	}

	if(temp == 0)
		AppealKoukaMsgSet2nd(CONWAZA->nowbrd, DEMOSIPPAI_MSG);
	AppealKoukaMsgSet(CONWAZA->nowbrd, BIKKURISASEYOUTOSITA_MSG);
}

//----------------------------------------------------------
//	４６：テンションで変化
//	アピールしたときのテンションによって評価値が変化する。
//	（テンション：0→10、1→20、２→30、3→50、4→60）
//----------------------------------------------------------
static void TensyondeHenka(void)
{
	u8 ap;
	
	if(consys->tensyon == 0){
		ap = 10;
		AppealKoukaMsgSet(CONWAZA->nowbrd, APPEAL34_1_MSG);
	}
	else if(consys->tensyon == 1){
		ap = 20;
		AppealKoukaMsgSet(CONWAZA->nowbrd, APPEAL34_2_MSG);
	}
	else if(consys->tensyon == 2){
		ap = 30;
		AppealKoukaMsgSet(CONWAZA->nowbrd, APPEAL34_3_MSG);
	}
	else if(consys->tensyon == 3){
		ap = 50;
		AppealKoukaMsgSet(CONWAZA->nowbrd, APPEAL34_4_MSG);
	}
	else{
		ap = 60;
		AppealKoukaMsgSet(CONWAZA->nowbrd, APPEAL34_5_MSG);
	}
	apsys[CONWAZA->nowbrd].ap = ap;
}

//----------------------------------------------------------
//	４７：テンション停止
//	アピール後、次以降のポケモンのアピールで、テンションが変化しなくなる。
//	このターンが終了するまで効果は継続。
//----------------------------------------------------------
void TensyonStop(void)
{
	if(ccw->tensyon_stop)
		return;		//既にテンション停止フラグが立っているなら処理はしない
		
	ccw->tensyon_stop = 1;
	ccw->tensyon_stop_brd = CONWAZA->nowbrd;
	AppealKoukaMsgSet(CONWAZA->nowbrd, TYUUMOKUWOATUMETA_MSG);
}


//=========================================================================
//	共通計算式
//=========================================================================
//----------------------------------------------------------
//	自分の前にｱﾋﾟｰﾙしたﾎﾟｹﾓﾝの中で、指定したタイプと同じならばｱﾋﾟｰﾙﾎﾟｲﾝﾄを減らす
//	引数: 減算対象とする技タイプを指定
//----------------------------------------------------------
static void SpecTypeSame(u8 type)
{
	int i, flg, temp = 0;
	
	for(i = 0; i < BREEDER_MAX; i++){
		if(CONWAZA->Sort[CONWAZA->nowbrd] > CONWAZA->Sort[i]){
			if(type == ConWazaTbl[apsys[i].use_waza].con_type)
				CONWAZA->bougai = 40;
			else
				CONWAZA->bougai = 10;
			CONWAZA->target[0] = i;
			CONWAZA->target[1] = 0xff;
			flg = BougaiCalc();
			if(flg)
				temp++;
		}
	}
	if(temp == 0)
		AppealKoukaMsgSet2nd(CONWAZA->nowbrd, DEMOSIPPAI_MSG);
}


//=========================================================================
//	ツール類
//=========================================================================
//----------------------------------------------------------
//	妨害ｱﾋﾟｰﾙが効くかシールドのﾁｪｯｸ
//	引数:	対象のﾌﾞﾘｰﾀﾞｰNo
//	戻り値: 0=効かない	1=効く
//----------------------------------------------------------
static u8 ShieldCheck(u8 target)
{
	//ｼｰﾙﾄﾞﾁｪｯｸをするやつは必ず妨害のﾀｰｹﾞｯﾄになってるやつなので
	CONWAZA->nowwaza_target[target] = 1;

	if(apsys[target].Ashield_flg){	//絶対防御
		AppealKoukaMsgSet(target, APPEAL5_MSG);
		return 0;
	}
	if(apsys[target].shield_flg){	//シールドの耐久がある限り防御
		apsys[target].shield_flg--;
		AppealKoukaMsgSet(target, APPEAL4_MSG);
		return 0;
	}
	if(apsys[target].endAppeal_flg)	//ｱﾋﾟｰﾙが終了してる
		return 0;
	if(apsys[target].yasumi_turn)// | apsys[target].miss_flg)	//緊張or休み
		return 0;
	return 1;
}

//----------------------------------------------------------
//	妨害効果の計算
// 戻り値: 1=誰か一人にでも妨害が成立した	0=誰にも妨害できなかった
//----------------------------------------------------------
static u8 BougaiCalc(void)
{
	u8 target;
	int i;
	s16 buff[BREEDER_MAX];
//	s32 bougai, temp;
	
	memset(buff, 0, sizeof(buff));
	for(i = 0; CONWAZA->target[i] != 0xff; i++){
		target = CONWAZA->target[i];
		
		//防御系
		if(ShieldCheck(target) == 0)
			continue;
		
		
		CONWAZA->bougai_calc = CONWAZA->bougai;
	
		//妨害値可変系
		if(apsys[target].bougai2bai)	//妨害値2倍
			CONWAZA->bougai_calc *= 2;
		if(apsys[target].invalid10){		//妨害値を10にする
			CONWAZA->bougai_calc = 10;
			AppealKoukaMsgSet(target, APPEAL7_MSG);
			continue;
		}
		CONWAZA->bougai_calc -= apsys[target].invalid;	//妨害値を減算
		if(CONWAZA->bougai_calc <= 0){
			CONWAZA->bougai_calc = 0;	//減算でﾏｲﾅｽになったら0にする
			AppealKoukaMsgSet(target, APPEAL6_MSG);
			continue;
		}
		
		//ｱﾋﾟｰﾙﾎﾟｲﾝﾄに妨害値を加えて計算
		APSub(target, CONWAZA->bougai_calc);
		//メッセージセット
		BougaiMsgSet(target, CONWAZA->bougai_calc);
		buff[target] = CONWAZA->bougai_calc;
	}
	
	for(i = 0; i < BREEDER_MAX; i++){
		if(buff[i] != 0)
			return 1;
	}
	return 0;
}

//----------------------------------------------------------
//	妨害によって指定ﾌﾞﾘｰﾀﾞｰのAP値を下げる
//	brd = 妨害を受けるﾌﾞﾘｰﾀﾞｰ	bougai = 妨害ﾎﾟｲﾝﾄ
//----------------------------------------------------------
static void APSub(u8 brd, u8 bougai)
{
	apsys[brd].ap -= bougai;
	apsys[brd].bougai += bougai;
}

//----------------------------------------------------------
//	評価値端数切捨て
//----------------------------------------------------------
static s16 HasuuKirisute(s16 ap)
{
	s16 hasuu;
	
	hasuu = abs(ap) % 10;
	if(ap < 0){
		if(hasuu != 0)
			ap -= 10 - hasuu;
	}
	else
		ap -= hasuu;
	return ap;
}

//----------------------------------------------------------
//	妨害端数切上げ
//----------------------------------------------------------
static s16 HasuuKiriage(s16 bougai)
{
	s16 hasuu;
	
	hasuu = abs(bougai) % 10;
	if(hasuu != 0)
		bougai += 10 - hasuu;
	return bougai;
}


#endif	//--------- 技計算式 ----------------------------------

