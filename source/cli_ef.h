
#ifndef __CLI_EF_H__
#define __CLI_EF_H__

#include "palanm.h"

//----------------------------------------------------------
//	定数定義
//----------------------------------------------------------
//-- ｹﾞｰｼﾞ出現エフェクト用 --//
#define GAE_MOVE_SP		5
#define GAE_DX_DY		(GAE_MOVE_SP * 23)
//-- ｹﾞｰｼﾞ差し替えエフェクト --//
#define GAUGE_CHG_FURIHABA_X	30
#define GAUGE_CHG_FURIHABA_Y	15
#define GAUGE_CHG_SEC			8	//128を割り切れる数のみ

//----------------------------------------------------------
//	外部関数宣言
//----------------------------------------------------------
extern u8 MBSmokeSet(s16 xpos, s16 ypos, u8 end_sw);
extern void MBSmokeCheck(actWork *actst);
extern void MBSmokeWait(actWork *actst);

extern u8 MonsterBallSet(u16 itemNo, u8 rate);
extern void MonsterBallMove(actWork *actst);

extern void GaugeAppearEffect(u8 client_no);
//extern void GaugeChangeEffect(u8 user);

extern void MonsterBallAppearEffSet(u8 pokeact, u8 palno, u8 xpos, u8 ypos, u8,u8,u8,u32);
extern void GaugeSwayEffect(u8 client_no);
extern u8 MonsterBallReturnEffSet(u8 pokeact, u8 palno, u8 xpos, u8 ypos, u8 oam_pri, u8 act_pri, u8 appear_wait, u32 haikei_fadebit);
extern void MonsterBallCellPalDel(actWork *xreg);
extern u8 MBHikariSet(u8 x, u8 y, u8 oam_pri, u8 act_pri);
extern u8 MBHikariColorEffectSet(u8 type, u8 palno, u32 haikei_palbit);

extern void MonsBallCellPalSet(u8 tblno);
extern void MonsBallCellPalDel(u8 tblno);

//----------------------------------------------------------
//	ﾃﾞｰﾀ
//----------------------------------------------------------
extern const CellData MonsterBallCellTbl[];
extern const PalData MonsterBallPalTbl[];
extern const actHeader MonsterBallHeader[];

//テスト用データ
extern const u16 MinePokeColor[];
extern const PalAnmData MinePokePalAnm;


//----------------------------------------------------------
//	モンスターボールのﾃｰﾌﾞﾙNo
//----------------------------------------------------------
#define MONS_BALL_MAX	12		//ﾓﾝｽﾀｰﾎﾞｰﾙの種類の数
enum{
	EF_MONSTER_BALL,
	EF_SUPER_BALL,
	EF_SAFARI_BALL,
	EF_HYPER_BALL,
	EF_MASTER_BALL,
	EF_NET_BALL,
	EF_DIVE_BALL,
	EF_NEST_BALL,
	EF_REPEAT_BALL,
	EF_TIMER_BALL,
	EF_GOUJYASU_BALL,
	EF_PREMIA_BALL,
};

#endif

