
#ifndef	__WAZATOOL_H__
#define	__WAZATOOL_H__

#include  "task.h"  // TASK_TABLE 構造体定義参照のため  2002/05/20  TAYA

//=========================================================================
//	定数定義
//=========================================================================
//-- GetWazaEffPos用 --//
#define EFF_X	0
#define EFF_Y	1
#define PM_X	2
#define PM_Y	3
#define PM_DEFAULT_Y	4

#define EFF_MODE	0
#define PM_MODE		1

#define MINE_SIDE_OFFSET_Y	8	//自分側の座標が高いので強制的にｵﾌｾｯﾄで下にずらす

#define MIGAWARI_F_OFFSET_Y		16	//身代わりｷｬﾗを足元に合わせるためのｵﾌｾｯﾄ
#define MIGAWARI_B_OFFSET_Y		17

//-- GetPokeSize用 --//
enum POKESIZE_MODE {
	POKESIZE_HEIGHT = 0,
	POKESIZE_WIDTH,
	POKESIZE_TOP,
	POKESIZE_BOTTOM,
	POKESIZE_LEFT,
	POKESIZE_RIGHT,
	POKESIZE_REAL_BOTTOM,
};

#define X_OFFS_REVERSAL_CHECKTYPE	0	//Xｵﾌｾｯﾄ反転の条件式の選択

//高さの低い自機側ﾎﾟｹﾓﾝにｴﾌｪｸﾄが出る時、画面下にいかないように最低Yﾗｲﾝを作る
#define PM_Y_HOSEI					1

//----------------------------------------------------------
//	構造体定義
//----------------------------------------------------------
typedef struct{
	u8 x;
	u8 y;
}WazaPosData;

typedef struct{
	void *chr_adrs;		//キャラデータｱﾄﾞﾚｽ
	void *col_adrs;		//ｶﾗｰｱﾄﾞﾚｽ
	void *scr_adrs;		//ｽｸﾘｰﾝデータｱﾄﾞﾚｽ
}HaikeiCompData;

typedef struct{
	void *CharAdrs;
	void *ScrnAdrs;
	u8	 PlttNo;
}WazaBgData;




//----------------------------------------------------------
//	外部関数宣言
//----------------------------------------------------------
extern void SetWorkSeq(actWork *Xreg, void *SeqAdr);
extern void SetMoveSeq(actWork *Xreg);
extern void W_WaitSeq(actWork *Xreg);
extern void W_ParallelMoveSeq(actWork *Xreg);
extern void W_StraightMove(actWork *Xreg);
extern void W_AttackThrows(actWork *Xreg);
extern void W_AttackThrows2(actWork *Xreg);
extern void W_PokeParallelMoveSeq(actWork *Xreg);
extern void PMObjKaiten( actWork * xreg );
extern void PMObjKaiten2( actWork * xreg );
extern void PMObjKaiten3( actWork * xreg );
extern void PMObjKaiten4( actWork * xreg );
extern void W_ParallelMoveSeq2(actWork *Xreg);
extern void W_AffCheckEndSeq(actWork *Xreg);
extern void W_DelPalEndSeq(actWork *Xreg);
extern void W_GetStraightMoveLoop(actWork *Xreg);
extern void W_GetStraightMoveSp(actWork *Xreg);
extern void W_AffEndWait(actWork *Xreg);
extern void EffPositionReset(actWork *Xreg);
extern void EffXpositionSet(actWork *Xreg, s16 offset_x);
extern void W_AnmEndWait(actWork *Xreg);
extern void W_ParallelMove2Seq(actWork *Xreg);
extern void YamanariMoveInit(actWork *Xreg);
extern u8 YamanariMoveMain(actWork *Xreg);
extern void W_StraightMove2(actWork *Xreg);
extern u8 GetWazaEffPos(u8 client_no, u8 x_y);
extern void W_PokeParallelMoveSeq2(actWork *Xreg);
extern u8 W_GetPokeActNo(u8 which);
extern void W_AnmAffWaitDel(actWork *Xreg);
extern void WazaDefaultPosSet1(actWork *Xreg, u8);
extern void WazaDefaultPosSet2(actWork *Xreg, u8);
extern u8 MineEnemyCheck(u8 client_no);
extern u8 ClientTypeGet(u8 client_no);
extern u8 ClientNoGet(u8 client_type);
extern u8 FightCheck(void);
//extern void ArcMove( actWork * xreg );
extern void DxDyAddClear(actWork *xreg);
extern u8 ClientPokeExistCheck(u8 client_no);
extern void W_GetStraightSyncParam(actWork *Xreg);
extern void W_StraightSyncMove(actWork *Xreg);
extern u8 W_ParallelSync(actWork *Xreg);
extern void W_ParallelSyncMove(actWork *Xreg);
extern void W_StraightMoveInit(actWork *xreg);
extern void W_YamanariInitSeq(actWork *xreg);
extern void W_OffsetSpaceMove(actWork *xreg);
extern void PokeKakusyukuSet(u8 pokeact, s16 RatioX, s16 RatioY, u16 Theta);
extern void PokeKakusyukuInit(u8 pokeact, u8 bld_flg);
extern void PokeKakusyukuEnd(u8);
extern void GetWazaEffBgAdrs(WazaBgData *EffData);
extern void W_AdjustKaitenYPos(u8 pokeact);
extern void W_ColorMonotone(u16 palno, u8);
extern s16 W_PokeZanzouMake(u8 which);
extern void W_PokeZanzouDel(actWork *actor);
extern u8 GetHaikeiPalNo(void);
extern void W_GetStraightSpParam(actWork *xreg);
extern void W_StraightSpMove(actWork *Xreg);
extern u32 GetBattleFadeBit(u8 haikei, u8 atpoke, u8 depoke, u8 atpoke2, u8 depoke2, u8 eff1, u8 eff2);
extern u16 GetKakudo(s16 x, s16 y);
extern void KakusyukuSet(actWork *xreg, u8 hosei, s16 RatioX, s16 RatioY, u16 Theta);
extern u16 GetKakudo2(s16 x, s16 y);
extern void SetPokeKakusyukuAnm(TASK_TABLE *task, u8 actno, const actAffAnm *anm);
extern u8 PokeKakusyukuAnm(TASK_TABLE *task);
extern void PokeKakusyukuYHosei(u8 pokeact);
extern void ZanzouKakusyukuYHosei(u8 zanzou_actno, u8 poke_actno);
extern u32 GetPokeFadeBit(u8 mine0, u8 mine1, u8 enemy0, u8 enemy1);
extern u8 GetClientPokePalNo(u8 client_no);
extern u8 GetTypePokePalNo(u8 client_type);
extern void Divide32(s16 *dst1, s16 *dst2, s32 val);
extern s32 Unite32(s16 src1, s16 src2);
extern void SetPokeKakusyukuStep(TASK_TABLE *task, u8 actno, s16 sx, s16 sy, s16 ex, s16 ey, u16 sync);
extern u8 PokeKakusyukuStep(TASK_TABLE *task);
extern void W_BldClearEnd(actWork *xreg);
extern void W_GetStraightSyncParam4(actWork *Xreg);
extern void W_StraightSyncMove4(actWork *Xreg);
extern u8 W_ParallelSync4(actWork *Xreg);
extern void W_ParallelSyncMove4(actWork *Xreg);
extern void W_GetStraightSpParam4(actWork *xreg);
extern void W_StraightSpMove4(actWork *Xreg);
extern void HaikeiBGLoopSizeSet(u8 flg);
extern void PokePriAllSet(u8 pri);
extern void PokePriAllInit(void);
extern u8 GetPokeSoftPri(u8 client_no);
extern u8 WazaEffPokeActSet(u16 monsno, u8 muki, u8 cell_type, s16 x, s16 y, u8 pri, u32 personal_rnd, u32 id_no);
extern u8 GetPokeBGPri(u8 client_no);
extern void WazaEffPokeActDel(actWork *xreg);
extern void W_BldClearTaskEnd(u8 id);
extern u8 GetPokeBGNo(u8 client_no);
extern void GetWazaEffBgAdrs2(WazaBgData *EffData, u8 client_no);
extern s16 W_GetPokeSize(u8 client_no, u8 mode);
extern void GetCenterEffPos(u8 client_no, u8 mode, s16 *xpos, s16 *ypos);
extern void KakusyukuEnd(actWork *xreg);
extern u8 GetPokemonYPos(u8 client_no);
extern u8 GetMigawariYPos(u8 client_no);
extern u8 PokeWinObjMake(u8 client_no, u8 pokeact, u16 monsno);
extern void KurinukiEffectSet(u8, s16, s16, u8, u8, u8, u8, u8, void *, void *, void *);
extern u8 GetWazaEffPos2(u8 client_no, u8 x_y);
extern u8 GetWazaEffPokeYPos(u8 client_no, u16 monsno, u8);
extern u8 GetPokeShadowYPos(u8 client_no);

//----------------------------------------------------------
//	ﾃﾞｰﾀ
//----------------------------------------------------------
//-- 技エフェクト用 始点・終点座標データ --//
extern const WazaPosData WazaEffPos[][4];
extern const CellData WazaEffDataCell[];
extern const PalData WazaEffDataPal[];


//----------------------------------------------------------
//	OAMデータテーブル(waza_oam.dat)
//----------------------------------------------------------
extern const ActOamData WazaOamDataNormal[];
extern const ActOamData WazaOamDataAffine[];
extern const ActOamData WazaOamDataAffine2[];
extern const ActOamData WazaOamDataBldNormal[];
extern const ActOamData WazaOamDataBldAffine[];
extern const ActOamData WazaOamDataBldAffine2[];



#endif	//__WAZATOOL_H__

