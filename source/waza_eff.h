
#ifndef __WAZA_EFF_H_
#define __WAZA_EFF_H_

extern	void	WazaEffectSet(u16);
extern	pFunc	WazaEffectSequence;
extern	void	DelWazaEffect(actWork *);
extern	void	DelTaskEffect(u8);
extern void PokeBGDrop(u8 client_no, u8 bgno);
extern void PokeBGDropClear(u8 bgno);
extern u8 PokeBG2taimeCheck(u8 client_no);
extern u8 ContestCheck(void);
extern s8	GetWazaEffSePan(s8 pan);
extern void DelSeTask(u8 id);
extern void WazaEffectCommonSet(u32 *EffTblAdrs, u16 seqno, u8 fade_flg);
extern void	WazaEffectWorkInit(void);
extern void ScrnPalRewrite(u16 pal_no, u32 ScrnBaseAdrs, u32 CharNoOffset, u8);
extern void BtlEffectHaikeiSet(u16 haikei_id);
extern void BtlEffectHaikeiRecover(void);
extern s16 SePanOverCheck(s16 now_pan);
extern s16 GetWazaEffAddPan(s16 start_pan, s16 end_pan, s16 add_pan);
extern s8	GetSePanAttack(s8 pan);

extern	s16		WazaEffWork[8];
extern	u8	WazaEffectFlag;
extern	u8	WazaEffectCount;	//ADD_ACTOR,ADD_TASKされている数
extern u8 WazaCounter;			//複数回に渡る技エフェクトの番号が入る
extern WazaKoukaCount	*pwkc;
extern u16 WazaEffPower;		//技の攻撃力（属性計算とかが入る前の値）
extern s32 WazaEffDamage;		//技のダメージ（最終的にＨＰを減らす値）回復だとマイナス値
extern u8 AttackNo;
extern u8 DefenceNo;
extern u8 WazaEffNatukido;		//サーバーからなつき度が入る
extern u16 WazaEffWeather;		//サーバーから天気が入る
extern u16 WazaEffMonsNo[];
extern s8 WazaEffPan;

#endif

#define	WAZA_EFF_FLAG_SEQEND	0x01
#define	WAZA_EFF_FLAG_SEQINC	0x02
#define	WAZA_EFF_FLAG_DELEFF	0x04

#define	WAZA_EFF_X1	80
#define	WAZA_EFF_Y1	80
#define	WAZA_EFF_X2	176
#define	WAZA_EFF_Y2	32

//-- BGにﾎﾟｹﾓﾝや技ｴﾌｪｸﾄのﾃﾞｰﾀを落とす時のVramｱﾄﾞﾚｽ --//
#define BTL_BG_CHARADRS1	(0x4000)
#define BTL_BG_SCRNBASE1	28
#define BTL_BG_CHARADRS2	(BTL_BG_CHARADRS1+0x2000)
#define BTL_BG_SCRNBASE2	30
#define BTL_BG_PAL1			8
#define BTL_BG_PAL2			9

//-- BG1,BG2の標準ﾌﾟﾗｲｵﾘﾃｨ --//
#define EFF_BG1_PRI			1
#define EFF_BG2_PRI			1

//-- BG3(背景)のBGｻｲｽﾞと回り込みﾌﾗｸﾞのデフォルト値 --//
#define BTL_BG_HAIKEI_SIZE	1
#define BTL_BG_HAIKEI_LOOP	0

