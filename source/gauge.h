
#include "param.h"
#include "client.h"

#ifndef __GAUGE_H__
#define __GAUGE_H__


#define GAUGE_CHANGE	0	//一時デバッグ用



//==================================================================
//			ゲージ計算･表示 引数一覧
//
//    ※ HP_Work:ﾜｰｸとして使用 ※0だとﾜｰｸの初期化が行われる 初回は0を入れておくこと
//
// 引数 : MaxHP:最大HP
//		  NowHP:現在HP(ﾀﾞﾒｰｼﾞを受ける前)
//		  beHP:受けたﾀﾞﾒｰｼﾞ(回復する場合はﾏｲﾅｽで入れる)
//        *HP_Work : ﾜｰｸのｱﾄﾞﾚｽ(ｹﾞｰｼﾞの途中経過のﾃﾞｰﾀが入る)
//								上位0～3ﾋﾞｯﾄ 下げ率、 4～7 ﾌﾗｸﾞ、 8～15 分子 で使用する
//		  *TransPos:ｹﾞｰｼﾞを表示させるｽｸﾘｰﾝﾃﾞｰﾀの座標
//		  TopChr:ｹﾞｰｼﾞのｷｬﾗのﾄｯﾌﾟｱﾄﾞﾚｽ
//		  *pl_buf:ﾊﾟﾚｯﾄﾊﾞｯﾌｧ
// 戻り値 : -1:終了		0以上の数値:ｹﾞｰｼﾞと一緒に表示させる数値の値
//==================================================================

//----------------------------------------------------------
//	ゲージ構造体
//----------------------------------------------------------
typedef struct
{
#if 0	//2002.09.14(土)
	s16 MaxHP;			//最大HP(ｹﾞｰｼﾞﾏｯｸｽ値)
	s16 NowHP;			//現在のHP(ﾀﾞﾒｰｼﾞを受ける前)
	s16 beHP;			//受けたﾀﾞﾒｰｼﾞ(回復する場合はﾏｲﾅｽで入れる) 変動させる値
	u16 color:5;
	u16 CharNo;			//ｹﾞｰｼﾞの先頭のｷｬﾗｸﾀｰﾈｰﾑ
#else
	s32 MaxHP;			//最大HP(ｹﾞｰｼﾞﾏｯｸｽ値)
	s32 NowHP;			//現在のHP(ﾀﾞﾒｰｼﾞを受ける前)
	s32 beHP;			//受けたﾀﾞﾒｰｼﾞ(回復する場合はﾏｲﾅｽで入れる) 変動させる値
	u32 color:5;
	u32 CharNo;			//ｹﾞｰｼﾞの先頭のｷｬﾗｸﾀｰﾈｰﾑ
#endif
}GaugeDataBG;

typedef struct	//ｹﾞｰｼﾞ計算ﾙｰﾁﾝを呼ぶ前に引数として、あらかじめﾃﾞｰﾀをｾｯﾄしておくこと
{
	s16 actno;			//監視用ｱｸﾀｰの配列番号	ｱｸﾀｰのﾜｰｸに合わせるためにs16
	s16 MaxHP;			//最大HP(ｹﾞｰｼﾞﾏｯｸｽ値)
	s16 NowHP;			//現在のHP(ﾀﾞﾒｰｼﾞを受ける前)
	s16 beHP;			//受けたﾀﾞﾒｰｼﾞ(回復する場合はﾏｲﾅｽで入れる) 変動させる値
	s16 HP_Work;		//作業用ﾜｰｸ
}GaugeDataOBJ;

typedef struct	//ｹﾞｰｼﾞ計算ﾙｰﾁﾝ内でﾃﾞｰﾀ取得。特に外側から値を入れてやることは必要ない
{
	s16 AfterHP;
	s16 resultHP;
}GaugeDataOBJ2;

//----------------------------------------------------------
//	定数定義
//----------------------------------------------------------
//GaugeTransChrSetで使用
enum{	//user
	G_MINE0,
	G_MINE1,
	G_ENEMY0,
	G_ENEMY1,
};
enum{	//mode
	G_ALL,
	G_HP,
	G_MAXHP,
	G_LV,
	G_NAME,
	G_HPGAUGE,
	G_EXPGAUGE,
	G_BALL,
	G_GETCHKBALL,
	G_STATUS,
	G_SAFARI,
	G_SAFARIBALL,
	G_SAFARIDEBUG,
};

//-- HP_Workの初期値として使用 --//
#define HP_WORK_INIT_VALUE	(-32768)


//----------------------------------------------------------
//	マクロ
//----------------------------------------------------------
//---- パーセンテージ変換 ----//
// NowPercentage:変換する現在の%  NowMaxPercent:変換する現在のMax%
// ConvPercent:変換後のMax%
//例)NowPercentage = 80, NowMaxParcent = 100, ConvParcent = 120 の場合
//  現在 80%/100% を xxx%/120% に変換したときのxxxを求め出す
#define PERCENT_CONV(NowPercentage, NowMaxPercent, ConvPercent) \
			(ConvPercent * NowPercentage / NowMaxPercent)


//----------------------------------------------------------
//	外部関数宣言
//----------------------------------------------------------
extern s16 GaugeBG(GaugeDataBG *gdata, s32 *HP_Work, u16 *TransPos, u16 *pl_buf);
extern void PutHPNumber(s16 MaxHP, s16 resultHP, u16 *TransPos);
extern void PutNumber(s16 number, u16 *TransPos, u8 yose);

//extern s16 GaugeOBJ(u8 actno, u8 req_data, u16 *pl_buf);
extern s32 GaugeOBJ(u8 client_no, u8 actno, u8 req_data, u16 *pl_buf);
extern u8 GaugeActorSet(u8);
extern u8 GaugeActorSetSafari(void);
extern void GaugeOFF(u8 actno);
extern void GaugeON(u8 actno);
extern void GaugePosSet(u8 actno, s16 xpos, s16 ypos);

//extern void GaugeDataSet(u8 actno, s16 MaxHP, s16 NowHP, s16 beHP);
extern void GaugeDataSet(u8 client_no, u8 actno, s32 MaxHP, s32 NowHP, s32 beHP);
extern void GaugeLevelTrans(u8 actno, u8 level);
extern void GaugeHPTrans(u8 actno, s16 hp, u8);

extern	void	GaugePokeNameTrans(u8 actno, PokemonParam *);

#if 0
extern void NumberON(u8 actno);
extern void NumberOFF(u8 actno);
extern void PutNumOBJ(u8 actno, u16 number);
extern void NumberPosSet(u8 actno, s16 xpos, s16 ypos);
extern u8 NumberActorSet(void);
extern u8 NumberActorSet2(void);
#endif

extern void PokeListGaugeDataSet(u8 actno, s16 MaxHP, s16 NowHP, s16 beHP);
extern s16 PokeListGauge(u8 actno, u16 *pl_buf);

extern void GaugeTransChrSet(u8 actno, PokemonParam *PokePara, u8 mode);
extern void GaugeDefaultPosSet(u8 client_no);
extern void GaugePriSet(u8 actno, u8 pri);

extern u8 GaugeArrowActorSet(void);
extern void GaugeArrowON(u8 client_no);
extern void GaugeArrowOFF(void);
extern void GaugeArrowCheckON(u8 client_no);
extern void GaugeGetBallTrans(u8 actno, u8);
extern void HPNumGaugeChangePut(void);
extern u8 TemotiBallPut(u8 client_no, BallGaugePara *bgd, u8 zahyou, u8 syokai);
extern void TemotiBallOff(u8 id);
extern void GaugeHardPriSet(u8 hard_pri);
extern u8 GetNumDotto(s16 NowHP, s16 MaxHP, u8 GaugeMaxDot);

//----------------------------------------------------------
//	外部データ
//----------------------------------------------------------
#if GAUGE_CHANGE
extern const CellData BattleGaugeDataCell_1vs1;
extern const CellData BattleGaugeDataCellMine2[];
extern const CellData BattleGaugeDataCellEnemy2[];
#else
extern const CellData MineGaugeCell_1vs1;
extern const CellData EnemyGaugeCell_1vs1;
extern const CellData MineGaugeCell_2vs2[];
extern const CellData EnemyGaugeCell_2vs2[];
#endif
extern const CellData MineGaugeCell_Safari;				//add by soga 2002.06.01
extern const PalData BattleGaugeDataPal[];
extern const actHeader PokeListGaugeHeader[];
extern const CellData PokeListGaugeCell[];
extern const PalData PokeListGaugePal[];
extern const actHeader GaugeMineHeader[];
extern const actHeader GaugeEnemyHeader[];
extern const CellData BattleGaugeCursorCell;
extern const actHeader GaugeCursorHeader[];
extern const CellData BattleGaugePartsCell[];
extern u8 GetGaugeDottoColor(s16 NowHP, s16 MaxHP);

//----------------------------------------------------------
//	ゲージパーツ取得ID
//----------------------------------------------------------
enum{
	GP_SPACE,
	GP_HP,
	GP_HPBAR = 3,
	GP_EXPBAR = 0xc,
	GP_DOKU = 0x15,
	GP_MAHI = 0x18,
	GP_NEMURI = 0x1b,
	GP_KOORI = 0x1e,
	GP_YAKEDO = 0x21,
	GP_KUUHAKU = 0x27,
	GP_CORON = 0x2a,
	GP_TENNASI = 0x2b,
	GP_DAKUTEN,
	GP_HANDAKUTEN,
	GP_LV = 0x2e,
	GP_HPBAR_YELLOW = 0x2f,
	GP_HPBAR_RED = 0x38,
	GP_HPHEAD = 0x41,
	GP_BALLON = 0x42,
	GP_BALLOFF,	//手持ちなし
	GP_BALLERR,	//ステータス異常
	GP_BALLDEAD,	//気絶
	GP_GETBALL,	//ｹﾞｯﾄ済みﾏｰｸ(既に図鑑に記録されてるﾎﾟｹﾓﾝを示すﾏｰｸ)
	GP_DOKU1 = 0x47,
	GP_MAHI1 = 0x4a,
	GP_NEMURI1 = 0x4d,
	GP_KOORI1 = 0x50,
	GP_YAKEDO1 = 0x53,
	GP_DOKU2 = 0x56,
	GP_MAHI2 = 0x59,
	GP_NEMURI2 = 0x5c,
	GP_KOORI2 = 0x5f,
	GP_YAKEDO2 = 0x62,
	GP_DOKU3 = 0x65,
	GP_MAHI3 = 0x68,
	GP_NEMURI3 = 0x6b,
	GP_KOORI3 = 0x6e,
	GP_YAKEDO3 = 0x71,
	GP_HPNUMCLOSE = 0x74,
	GP_HPBARCLOSE,

	GP_ARROW,	//これは後で削除
};



#endif __GAUGE_H__
