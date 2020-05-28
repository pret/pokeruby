//----------------------------------------------------------
//	自分ポケモン制御	by	soga
//----------------------------------------------------------

#include "common.h"
#include "actor.h"
#include "actanm.h"
#include "MaDefine.h"
#include "ef_tool.h"
#include "calctool.h"

#include "gauge.h"
#include "client.h"
#include "bss.h"
#include "server.h"
#include "a_mine.h"
#include "cli_def.h"


//----------------------------------------------------------
//	プロトタイプ宣言
//----------------------------------------------------------

void SeqMinePokeAppearInit(actWork *);
void SeqMinePokeAppearMain(actWork *);
void SeqMinePokeWait(actWork *);
void SeqMinePokeWaitInit(actWork *actst);
static void SelectMoveMain(actWork *xreg);

//actHeader MineHeader; 


//----------------------------------------------------------
//	アクターテーブル
//----------------------------------------------------------
const ActOamData MineOamData = {
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
	2,		//u32 Pltt:4;             // パレットＮｏ
	0,
};

//アニメーションデータフォーマット
/*
	s16 pat;	        //ｷｬﾗｸﾀｰﾃﾞｰﾀﾅﾝﾊﾞｰ
	u8 	wait:6;		//ｳｪｲﾄ
	u8 	hrev:1;		//H反転
	u8 	vrev:1;		//V反転
*/
const actAnm AnmMineAppear[] =
{
	{0, 5, 0, 0},
	{ACT_ANMLOOP, 0, 0, 0},
};

const actAnm * const MineAnmTbl[] = 
{
	AnmMineAppear,
};

const actAffAnm act_mine_aff_anm[] = {

//	{ 拡縮x, 拡縮y, 角度, ｳｪｲﾄ }
	{ -16, 0, 0, 4 },					// 横に伸びる
	{ 0, 0, 0, 60 },
	{ACT_AFLOOP,1,0,0},					// ﾙｰﾌﾟ , 戻り先
};

const	actAffAnm * const act_mine_aff_tbl[] = {
	act_mine_aff_anm,
};

//-------------------------------------------------------------
//		アクターシーケンス
//-------------------------------------------------------------

void SeqMinePokeAppearInit(actWork *actst)
{
	//actst->dx=200;
	actst->move=SeqMinePokeAppearMain;
}
void SeqMinePokeAppearMain(actWork *actst)
{
	if(EncountEffectFlag&ENCOUNT_EFFECT_FLAG_OBJSTOP) return;
	actst->dx-=ENCOUNT_SPEED;
	if(actst->dx==0){
		actst->move=SeqMinePokeWait;
		actst->work[1]=0;
	}
}
void SeqMinePokeWaitInit(actWork *actst)
{
	//GaugeON(ClientGaugeSt[actst->work[0]]);
//	GaugeON(ClientExpGaugeSt[actst->work[0]]);

//	NumberON(ClientHPNumSt[actst->work[0]]);
//	NumberON(ClientHPMAXNumSt[actst->work[0]]);
//	NumberON(ClientLVNumSt[actst->work[0]]);
	
	actst->move = SeqMinePokeWait;
}
void SeqMinePokeWait(actWork *actst)
{
	int	i;

	i=0;
	i=actst->work[1];

//	actst->work[1]+=4;
//	actst->dy=sin_cos_table[actst->work[1] & 0xff] / 0x80;
}


//-- ｻﾌﾞﾙｰﾁﾝ --------
void SeqMinePokeMove(actWork *actst)
{
	if(EncountEffectFlag&ENCOUNT_EFFECT_FLAG_OBJSTOP) return;
	actst->dx += actst->work[1];
	actst->dy += actst->work[2];
}



//=========================================================================
//	選択中のゆらゆらする動き
//=========================================================================
//----------------------------------------------------------
//	ゆらゆらする動きをｾｯﾄする
// poke_gauge = 揺らす対象ｱｸﾀｰ(MOTION_POKE:ﾎﾟｹﾓﾝ　MOTION_GAUGE:ｹﾞｰｼﾞ)
//----------------------------------------------------------
//void SelectMotionSet(u8 actno, s8 addsec, s8 furihaba)
void SelectMotionSet(u8 client_no, u8 poke_gauge, s8 addsec, s8 furihaba)
{
	u8 no;
	u8 taisyou;
	
	if(poke_gauge){
		if(CliSys[client_no].gauge_motion_set)
			return;
	}else{
		if(CliSys[client_no].poke_motion_set)
			return;
	}
	
	//ﾀｽｸだと実行中に画面切り替えが発生するとTaskInitがかからずに
	//そのまま実行されつづけてしまうのでｱｸﾀｰで行う
	no = AddBanishActor(SelectMoveMain);
	if(poke_gauge == MOTION_GAUGE){
		taisyou = ClientGaugeSt[client_no];
		CliSys[client_no].gauge_motion_no = no;
		CliSys[client_no].gauge_motion_set = 1;
		//ｹﾞｰｼﾞとﾎﾟｹﾓﾝで動きが同期しないようにする
		ActWork[no].work[0] = 256-64*2;
	}else{
		taisyou = PokemonStruct[client_no];
		CliSys[client_no].poke_motion_no = no;
		CliSys[client_no].poke_motion_set = 1;
		ActWork[no].work[0] = 256-64;
	}
//	ActWork[no].work[0] = 256-64;
	ActWork[no].work[1] = addsec;
	ActWork[no].work[2] = furihaba;
	ActWork[no].work[3] = taisyou;
	ActWork[no].work[4] = poke_gauge;
	ActWork[taisyou].dx = 0;
	ActWork[taisyou].dy = 0;
}

//----------------------------------------------------------
//	ゆらゆらしてるのを止める
// poke_gauge = 揺らす対象ｱｸﾀｰ(0:ﾎﾟｹﾓﾝ　1:ｹﾞｰｼﾞ)
//----------------------------------------------------------
void SelectMotionStop(u8 client_no, u8 poke_gauge)
{
	u8 taisyou;
	
	if(poke_gauge == MOTION_GAUGE){
		if(CliSys[client_no].gauge_motion_set == 0)
			return;
		taisyou = ActWork[CliSys[client_no].gauge_motion_no].work[3];
		DelActor(&ActWork[CliSys[client_no].gauge_motion_no]);
		CliSys[client_no].gauge_motion_set = 0;
	}else{
		if(CliSys[client_no].poke_motion_set == 0)
			return;
		taisyou = ActWork[CliSys[client_no].poke_motion_no].work[3];
		DelActor(&ActWork[CliSys[client_no].poke_motion_no]);
		CliSys[client_no].poke_motion_set = 0;
	}
	ActWork[taisyou].dx = 0;
	ActWork[taisyou].dy = 0;
}

static void SelectMoveMain(actWork *xreg)
{
	u8 taisyou;
	
	taisyou = xreg->work[3];
	if(xreg->work[4] == MOTION_GAUGE)
		ActWork[taisyou].dy = SinMove(xreg->work[0], xreg->work[2]) + xreg->work[2];
	else
		ActWork[taisyou].dy = SinMove(xreg->work[0], xreg->work[2]) + xreg->work[2];
	xreg->work[0] = 0xff & (xreg->work[0] + xreg->work[1]);
}


