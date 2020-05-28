#ifndef __CONSCR_H__
#define __CONSCR_H__

//----------------------------------------------------------
//	コンテストランク
//----------------------------------------------------------
#define	NORMAL_RANK	0
#define	SUPER_RANK	1
#define	HYPER_RANK	2
#define	MASTER_RANK	3

//----------------------------------------------------------
//	コンテストタイプ
//----------------------------------------------------------
#define	STYLE_CONTEST		0	//持ちﾎﾟｹﾓﾝの格好よさ
#define	BEAUTIFUL_CONTEST	1	//持ちﾎﾟｹﾓﾝの美しさ
#define	CUTE_CONTEST		2	//持ちﾎﾟｹﾓﾝの可愛さ
#define	CLEVER_CONTEST		3	//持ちﾎﾟｹﾓﾝの賢さ
#define	STRONG_CONTEST		4	//持ちﾎﾟｹﾓﾝのたくましさ

//----------------------------------------------------------
//	美術館に飾られるための評価値の最低点
//----------------------------------------------------------
#define ARTMUSEUM_POINT		800	//これより評価値が高ければ美術館に飾られる

//----------------------------------------------------------
//	絵の飾られる枚数
//----------------------------------------------------------
#define MUSEUM_PICTURE_MAX			5	//美術館に飾られる絵の最大数
#define CONTEST_PICTURE_MAX			8	//コンテスト会場の絵の合計数


#ifndef ASM_CPP		/* アセンブラの場合のみこのシンボルが定義される */

//----------------------------------------------------------
//	外部関数宣言
//----------------------------------------------------------

extern void ContestSankaCheck(void);//u8 type, u8 rank PokemonParam *pp);
extern void GetBreederName();
extern void GetBreederNickName();
extern void GetPrimaryRank();
extern void GetChampBreederName();
extern void GetChampPokeName();
extern void ContestNijiAppeal(void);
extern void PrimaryExaminationCalc(u8 type);
extern void GetMonsNo();
extern void ContestResultScr(void);
extern void GetChampEntryNumber(void);
extern void GetEntryNo(void);
extern void ContestTuusinInit(u8 list_no);
extern void SetBreederObj();
extern void GetChampObjID(void);
extern void SetBrdName(void);
extern void ArtMuseumPortraitCheck(void);
extern void ArtMuseumPortraitSet(void);
extern void ArtMuseumCondCheck(void);
extern u8 ArtMuseumCountCheck(void);
extern void GetBPBreederData(void);
extern void PortraitPicturePut(void);
extern void ContestSioObjChrSet(void);
extern void GetBPNum(void);
extern void RibbonSet(void);
extern u8 RibbonCheck(void);
extern u8 CheckDebugContestFlag(void);
extern u8 BromideRibbonCheckSet(void);
extern u8 ContestServerVisionCheck(u8 version[]);
extern void ContestPokeCGWinOpen(void);
extern void ContestPokeCGWinClose( void );
extern void ContestMusSet(void);
extern void GetContRnd(void);


#endif	/*ASM_CPP*/

#endif	/*__CONSCR_H__*/

