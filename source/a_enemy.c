//----------------------------------------------------------
//	相手ポケモン制御	by	soga
//----------------------------------------------------------

#include "common.h"
#include <agb.h>
#include "actor.h"
#include "actanm.h"
#include "MaDefine.h"
#include "calctool.h"
#include "fight.h"
#include "gauge.h"
#include "client.h"
#include "cli_ef.h"
#include "objdata.h"
#include "server.h"
#include "mus_tool.h"
#include "cli_def.h"
#include "wazatool.h"
#include "poketool.h"
#include "monsno.def"
#include "pm2fenum.h"

//----------------------------------------------------------
//	プロトタイプ宣言
//----------------------------------------------------------

void SeqEnemyPokeAppearInit(actWork *);
void SeqEnemyPokeAppearMain(actWork *);
void SeqEnemyPokeWaitInit(actWork *);
void SeqEnemyPokeWaitMain(actWork *);
void SeqEnemyPokeDamageInit(actWork *);
void SeqEnemyPokeDamageMain(actWork *);
void SeqEnemyPokeKizetsuInit(actWork *);
void SeqEnemyPokeKizetsuMain(actWork *);
void SeqEnemyPokeBlinkInit(actWork *);
void SeqEnemyPokeBlink(actWork *);
void SeqEnemyPokeBlinkEnd(actWork *);

//actHeader EnemyHeader; 
const ActOamData EnemyOamData;

extern	const u32 DecordAdrs[];
extern const pmPara PowawaParaTbl[];

#define	VANISH_WAIT		0x08
#define	KIZETSU_WAIT	0x02

//----------------------------------------------------------
//	アクターテーブル
//----------------------------------------------------------
const ActOamData EnemyOamData = {
	0,		//u32 VPos:8;             // Ｙ座標
	1,		//u32 AffineMode:2;       // アフィンモード
	0,		//u32 ObjMode:2;          // ＯＢＪモード
	OFF,	//u32 Mosaic:1;           // モザイク
	0,		//u32 ColorMode:1;        // １６色/２５６色 選択
	0,		//u32 Shape:2;            // ＯＢＪ形状

	0,		//u32 HPos:9;             // Ｘ座標
	0,		//u32 AffineParamNo:5;  // アフィン変換パラメータNo & H,VFlip
	3,		//u32 Size:2;             // ＯＢＪサイズ

	0,		//u32 CharNo:10;          // キャラクタＮｏ
	POKE_OAM_PRI,		//u32 Priority:2;         // 表示優先
	0,		//u32 Pltt:4;             // パレットＮｏ
	0,
};

//アニメーションデータフォーマット
/*
	s16 pat;	        //ｷｬﾗｸﾀｰﾃﾞｰﾀﾅﾝﾊﾞｰ
	u8 	wait:6;		//ｳｪｲﾄ
	u8 	hrev:1;		//H反転
	u8 	vrev:1;		//V反転
*/

//-------------------------------------------------------------
//		アクターシーケンス
//-------------------------------------------------------------

void SeqEnemyPokeAppearInit(actWork *Xreg)
{
//		Xreg->dx=-200;
		Xreg->move=SeqEnemyPokeAppearMain;
		ActAnmChkChg(Xreg,0);
//		CpuClear(0,&PaletteWorkTrans[PA_OBJ0+(Xreg->work[0]*16)],0x20,16);
		PaletteFadeReq(0x00020000,0,10,10,0x3def);
}

void SeqEnemyPokeAppearMain(actWork *Xreg)
{
	if(EncountEffectFlag&ENCOUNT_EFFECT_FLAG_OBJSTOP) return;
	Xreg->dx+=ENCOUNT_SPEED;
	if(Xreg->dx==0){
		Xreg->move=SeqEnemyPokeWaitInit;
		VoicePlay(Xreg->work[2],25);
//		ActAnmChkChg(Xreg,1);
	}
}

void SeqEnemyPokeWaitInit(actWork *Xreg)
{
		if(Xreg->anmend_sw!=0){
				GaugeAppearEffect(Xreg->work[0]);
				GaugeON(ClientGaugeSt[Xreg->work[0]]);	//とりあえず　後で変える
				Xreg->move=SeqEnemyPokeWaitMain;
				ActAnmChkChg(Xreg,0);
				PaletteFadeReq(0x00020000,0,10,0,0x3def);
				/*
		CpuCopy(&PaletteWork[PA_OBJ0+(Xreg->work[0]*16)],
				&PaletteWorkTrans[PA_OBJ0+(Xreg->work[0]*16)],
				0x20,16);
				*/
		}
}

void SeqEnemyPokeWaitMain(actWork *Xreg)
{
}

void SeqEnemyPokeDamageInit(actWork *Xreg)
{
		Xreg->work[3]=6;			//VanishCount
		Xreg->work[4]=1;			//VanishWait
		Xreg->move=SeqEnemyPokeDamageMain;
}

void SeqEnemyPokeDamageMain(actWork *Xreg)
{
		if(--Xreg->work[4]==0){
			Xreg->work[4]=VANISH_WAIT;
			Xreg->banish^=1;
			if(--Xreg->work[3]==0){
				Xreg->banish=0;
				Xreg->move=SeqEnemyPokeWaitMain;
				FightEffectCount=0;
			}
		}
}

void SeqEnemyPokeKizetsuInit(actWork *Xreg)
{
#if 0	//2002.09.25(水) by matsuda
		Xreg->work[3]=8-(pm2fpara[Xreg->work[2]].patcnt/8)-
					(((pm2fpara[Xreg->work[2]].patcnt%1)!=0)?1:0);
		Xreg->work[4]=1;
		Xreg->move=SeqEnemyPokeKizetsuMain;
#else
		u16 monsno;
		u8 client_no;
		u32 rnd;
		u16 annon_rnd;
		u8 patcnt;
		
		client_no = Xreg->work[0];
		if(Climem[client_no].hensin_monsno != 0)
			monsno = Climem[client_no].hensin_monsno;
		else
			monsno = Xreg->work[2];
		rnd=PokeParaGet(&PokeParaEnemy[SelMonsNo[client_no]],ID_personal_rnd);
		
		if(monsno==MONSNO_ANNOON){
			rnd=PokeParaGet(&PokeParaEnemy[SelMonsNo[client_no]],ID_personal_rnd);
			annon_rnd=(((rnd&0x03000000)>>18)|((rnd&0x030000)>>12)|((rnd&0x0300)>>6)|(rnd&0x03))%28;
			if(annon_rnd==0)
				annon_rnd=monsno;
			else
				annon_rnd+=(CELLID_pm3f_unb-1);
			patcnt = pm2fpara[annon_rnd].patcnt;
		}
		else if(monsno == MONSNO_POWARUN)
			patcnt=PowawaParaTbl[BattlePokeAnmNo[client_no]].patcnt;
		else if(monsno>MONSNO_END)
			patcnt=pm2fpara[0].patcnt;
		else
			patcnt=pm2fpara[monsno].patcnt;
		
		Xreg->work[3]=8-(patcnt/8);
		Xreg->work[4]=1;
		Xreg->move=SeqEnemyPokeKizetsuMain;
#endif
}

void SeqEnemyPokeKizetsuMain(actWork *Xreg)
{
		int	i;
		u8	*adr;


		if(--Xreg->work[4]==0){
			Xreg->work[4]=KIZETSU_WAIT;
			Xreg->dy+=8;
			if(--Xreg->work[3]<0){
				AffineDelActor(Xreg);	//add by matsuda 2002.08.30(金)
				DelActor(Xreg);
				return;
			}
		//	adr=(u8 *)(DecordAdrs[ClientTypeGet(Xreg->work[0])]+(Xreg->work[3]*0x20*8));
			adr=(u8 *)(DecordAdrs[ClientTypeGet(Xreg->work[0])]
				+0x800*BattlePokeAnmNo[Xreg->work[0]]
				+(Xreg->work[3]*0x20*8));
			for(i=0;i<0x20*8;i++){
				*adr=0;
				adr++;
			}
			//ActAnmChg(Xreg,0);
			ActAnmChg(Xreg, BattlePokeAnmNo[Xreg->work[0]]);
		}
}

void SeqEnemyPokeBlinkInit(actWork *Xreg)
{
	Xreg->work[3]=8;
	Xreg->work[4] = Xreg->banish;	//add by matsuda 2002.08.01(木)
	Xreg->move=SeqEnemyPokeBlink;
}

void SeqEnemyPokeBlink(actWork *Xreg)
{
	if(--Xreg->work[3]==0){
		Xreg->banish^=1;
		Xreg->work[3]=8;
	}
}

void SeqEnemyPokeBlinkEnd(actWork *Xreg)
{
	Xreg->banish = Xreg->work[4];
	Xreg->work[4] = 0;
	Xreg->move=SeqEnemyPokeWaitMain;
}

