//=========================================================================
//
//		技エフェクトツール
//														
//=========================================================================

#include "common.h"
#include "ef_tool.h"
#include "calctool.h"
#include "actor.h"
#include "actanm.h"

#include "server.h"	
#include "waza_eff.h"
#include "cli_def.h"
#include "wazatool.h"

#include "fight.h"
#include "bss.h"
#include "contest.h"
#include "objdata.h"
#include "poketool.h"
#include "palanm.h"
#include "cli_num.h"
#include "madefine.h"
#include "decord.h"
#include "extanm.h"

#include "task.h"
#include "monsno.def"
#include "client.h"
#include "pm2fenum.h"
#include "pm2benum.h"

//=========================================================================
//	プロトタイプ宣言
//=========================================================================
void SetWorkSeq(actWork *Xreg, void *SeqAdr);
void SetMoveSeq(actWork *Xreg);
void W_ParallelMoveSeq(actWork *Xreg);
void W_GetStraightMoveSp(actWork *Xreg);

void W_GetStraightMoveLoop(actWork *Xreg);
void W_ParallelMove2Seq(actWork *Xreg);

u8	MineEnemyCheck(u8 client_no);		//Add by soga 2001.09.25
u8	ClientTypeGet(u8 client_no);		//Add by soga 2001.09.26
u8	ClientNoGet(u8 client_type);		//Add by soga 2001.09.26

void W_GetStraightSyncParam(actWork *Xreg);
void W_StraightSyncMove(actWork *Xreg);
u8 W_ParallelSync(actWork *Xreg);
void W_ParallelSyncMove(actWork *Xreg);
static void W_YamanariSubSeq(actWork *xreg);
void W_GetStraightSyncParam4(actWork *Xreg);
void W_StraightSyncMove4(actWork *Xreg);
u8 W_ParallelSync4(actWork *Xreg);
void W_ParallelSyncMove4(actWork *Xreg);
void W_GetStraightSpParam4(actWork *xreg);
void W_StraightSpMove4(actWork *Xreg);
void PokePriAllInit(void);
u8 GetPokeSoftPri(u8 client_no);
u8 GetWazaEffPos2(u8 client_no, u8 x_y);
u8 GetWazaEffPokeYPos(u8 client_no, u16 monsno, u8);
u8 RatioXFlipCheck(void);

//----------------------------------------------------------
//	データ
//----------------------------------------------------------
static const	actHeader WazaPokeHeader[];
static const CellData WazaPokeCell[];

//----------------------------------------------------------
//	外部ﾃﾞｰﾀ
//----------------------------------------------------------
extern const actAffAnm * const PmAffAnmTblF2[];



//=========================================================================
//	技エフェクト用 始点・終点座標データ
//=========================================================================
const WazaPosData WazaEffPos[][4] = 
{
	//FightType	1vs1
	{
		//ClientNo
		{C_POKE_X, C_POKE_Y},
		{CAI_POKE_X, CAI_POKE_Y},
		{CON_DEFENCE_X,CON_DEFENCE_Y},
		{CON_ATTACK_X,	CON_ATTACK_Y},//1対1では使われないのでｺﾝﾃｽﾄ用の座標を置いておく
	},
	//FightType 2vs2
	{
		{C_POKE1X,		C_POKE1Y},
		{CAI_POKE1X,	CAI_POKE1Y},
		{C_POKE2X,		C_POKE2Y},
		{CAI_POKE2X,	CAI_POKE2Y},
	},
};

//=========================================================================
//	プログラム
//=========================================================================

//----------------------------------------------------------
//	エフェクト始点、終点座標取得
// x_y = PM_X or PM_X : X座標  	PM_Y or PM_Y : Y座標
// x_y = POKE_*:ﾎﾟｹﾓﾝのｵﾌｾｯﾄ込みでの座標を取得。
//		 ※個々のﾎﾟｹﾓﾝの大きさによって座標が変わり、絵の大きさが違っても常に
//		   その絵にあったﾎﾟｹﾓﾝの中心の座標を取れる。
//		 EFF_*:ﾎﾟｹﾓﾝのｵﾌｾｯﾄは関係なしで常に共通の中心座標を取得する
//			どのﾎﾟｹﾓﾝにおいても共通の座標が必要な時などに使用する
//----------------------------------------------------------

#if 0
const u8 PowawaEYPos[]={
	20,11,12,11
};
#endif
const pmPara PowawaParaTbl[]={
	{0x44,17},
	{0x66, 9},
	{0x46, 9},
	{0x86, 8},
};

const u8 PowawaYOfsTbl[]={
//	16,6,6,5
	13,14,13,13
};

const u8 PowawaMYPos[]={
	0,0,0,0
};

u8 GetWazaEffPos(u8 client_no, u8 x_y)
{
//	s16 offsetY;
	u8 ret;
	u16 monsno;
	
	if(ContestCheck() && x_y == PM_Y && client_no == CONT_ENEMY_CLIENT)
		x_y = EFF_Y;
	
	switch(x_y)
	{
		case PM_X:
		case EFF_X:
			ret = WazaEffPos[FightType&FIGHT_TYPE_2vs2][ClientTypeGet(client_no)].x;
			break;
		case EFF_Y:
			ret = WazaEffPos[FightType&FIGHT_TYPE_2vs2][ClientTypeGet(client_no)].y;
			break;
		case PM_Y:
		case PM_DEFAULT_Y:
		default:
			if(ContestCheck())
			{
				if(conpara->hensin_flg)
					monsno = conpara->hensin_monsno;
				else
					monsno = conpara->monsno;
			}
			else if(MineEnemyCheck(client_no))
			{
				if(Climem[client_no].hensin_monsno == 0)
					monsno = PokeParaGet(
							&PokeParaEnemy[SelMonsNo[client_no]], ID_monsno);
//					monsno = WazaEffMonsNo[client_no];
				else
					monsno = Climem[client_no].hensin_monsno;
			}
			else
			{
				if(Climem[client_no].hensin_monsno == 0)
					monsno = PokeParaGet(
							&PokeParaMine[SelMonsNo[client_no]], ID_monsno);
//					monsno = WazaEffMonsNo[client_no];
				else
					monsno = Climem[client_no].hensin_monsno;
			}
			if(x_y == PM_Y)
				ret = GetWazaEffPokeYPos(client_no, monsno, 1);
			else
				ret = GetWazaEffPokeYPos(client_no, monsno, 0);
	}
	return ret;
}

//----------------------------------------------------------
//	monsnoからポケモンのPM_Y座標を取得
//	offset_flg = 0:自機側ﾎﾟｹﾓﾝへのｵﾌｾｯﾄなし　1:ｵﾌｾｯﾄあり
//----------------------------------------------------------

static	u8	PokeYPosGet(u8 client_no,u16 monsno)
{
	u16	annon_rnd;
	u32	rnd;
	u8	ypos=0;

	if(MineEnemyCheck(client_no) == SIDE_MINE || ContestCheck()){
		if(monsno==MONSNO_ANNOON){
			if(ContestCheck()){
				if(conpara->hensin_flg)
					rnd = conpara->hensin_personal_rnd;
				else
					rnd = conpara->personal_rnd;
			}
			else{
				if(Climem[client_no].hensin_monsno==0)
					rnd=PokeParaGet(&PokeParaMine[SelMonsNo[client_no]],ID_personal_rnd);
				else
					rnd=HenshinRnd[client_no];
			}
			annon_rnd=(((rnd&0x03000000)>>18)|((rnd&0x030000)>>12)|((rnd&0x0300)>>6)|(rnd&0x03))%28;
			if(annon_rnd==0)
				annon_rnd=monsno;
			else
				annon_rnd+=(CELLID_pm3b_unb-1);
			ypos=pm2bpara[annon_rnd].patcnt;
		}
		else if(monsno == MONSNO_POWARUN)
			ypos=PowawaMYPos[BattlePokeAnmNo[client_no]];
		else if(monsno>MONSNO_END)
			ypos=pm2bpara[0].patcnt;
		else
			ypos=pm2bpara[monsno].patcnt;
	}
	else{
		if(monsno==MONSNO_ANNOON){
			if(Climem[client_no].hensin_monsno==0)
				rnd=PokeParaGet(&PokeParaEnemy[SelMonsNo[client_no]],ID_personal_rnd);
			else
				rnd=HenshinRnd[client_no];
			annon_rnd=(((rnd&0x03000000)>>18)|((rnd&0x030000)>>12)|((rnd&0x0300)>>6)|(rnd&0x03))%28;
			if(annon_rnd==0)
				annon_rnd=monsno;
			else
				annon_rnd+=(CELLID_pm3f_unb-1);
			ypos=pm2fpara[annon_rnd].patcnt;
		}
		else if(monsno == MONSNO_POWARUN)
//			ypos=PowawaEYPos[BattlePokeAnmNo[client_no]];
			ypos=PowawaParaTbl[BattlePokeAnmNo[client_no]].patcnt;
		else if(monsno>MONSNO_END)
			ypos=pm2fpara[0].patcnt;
		else
			ypos=pm2fpara[monsno].patcnt;
	}
	return ypos;
}

static	u8	PokeYOfsGet(u8 client_no,u16 monsno)
{
//	u16	annon_rnd;
//	u32	rnd;
	u8	yofs=0;

	if(MineEnemyCheck(client_no)==SIDE_ENEMY && ContestCheck() == 0){
#if 0
		if(monsno==MONSNO_ANNOON){
			rnd=PokeParaGet(&PokeParaEnemy[SelMonsNo[client_no]],ID_personal_rnd);
			annon_rnd=(((rnd&0x03000000)>>18)|((rnd&0x030000)>>12)|((rnd&0x0300)>>6)|(rnd&0x03))%28;
			if(annon_rnd==0)
				annon_rnd=monsno;
			else
				annon_rnd+=(CELLID_pm3f_unb-1);
			yofs=PokeYOfsTbl[annon_rnd];
		}
		else if(monsno==MONSNO_POWARUN)
			yofs=PowawaYOfsTbl[BattlePokeAnmNo[client_no]];
		else
			yofs=PokeYOfsTbl[monsno];
#else
		if(monsno==MONSNO_POWARUN)
			yofs=PowawaYOfsTbl[BattlePokeAnmNo[client_no]];
		else if(monsno>MONSNO_END)
			yofs=PokeYOfsTbl[0];
		else
			yofs=PokeYOfsTbl[monsno];
#endif
	}
	return yofs;
}

u8 GetWazaEffPokeYPos(u8 client_no, u16 monsno, u8 offset_flg)
{
	u8 ret;
	s16 offsetY;
	
	if(MineEnemyCheck(client_no) == SIDE_MINE || ContestCheck())
	{
#if 0
		if(monsno == MONSNO_POWARUN)
			offsetY = PowawaMYPos[BattlePokeAnmNo[client_no]];
		else
			offsetY = pm2bpara[monsno].patcnt;
#endif
		offsetY=PokeYPosGet(client_no,monsno);
	}
	else
	{
#if 0
		if(monsno == MONSNO_POWARUN){
			offsetY = PowawaEYPos[BattlePokeAnmNo[client_no]];
		//空に浮いている系のポケモンの補正 by soga 2002.08.17
			offsetY -= PowawaYOfsTbl[BattlePokeAnmNo[client_no]];
		}
		else{
			offsetY = pm2fpara[monsno].patcnt;
		//空に浮いている系のポケモンの補正 by soga 2002.08.17
			offsetY -= PokeYOfsTbl[monsno];
		}
#else
		offsetY=PokeYPosGet(client_no,monsno);
		offsetY-=PokeYOfsGet(client_no,monsno);
#endif
	}
	ret = WazaEffPos[FightType&FIGHT_TYPE_2vs2][ClientTypeGet(client_no)].y+offsetY;
	
	if(offset_flg){
		if(MineEnemyCheck(client_no) == SIDE_MINE)
			ret += MINE_SIDE_OFFSET_Y;

		#if PM_Y_HOSEI
		if(ret > 112-8)
			ret = 112-8;
		#endif
	}
	
	return ret;
}

//----------------------------------------------------------
//	WazaEffMonsNoにmonsnoがちゃんと入っている場合のみ有効の座標取得関数
//	基本的には技ｴﾌｪｸﾄ中は平気。ポケモンのAddActorの時などの技ｴﾌｪｸﾄとは関係ない
//	所ではWazaEffMonsNoに値がちゃんと入ってないので、GetWazaEffPosの方を使用する。
//----------------------------------------------------------
u8 GetWazaEffPos2(u8 client_no, u8 x_y)
{
	u8 ret;
	u16 monsno;
	
	if(x_y == PM_Y || x_y == PM_DEFAULT_Y){
		if(ContestCheck()){
			if(conpara->hensin_flg)
				monsno = conpara->hensin_monsno;
			else
				monsno = conpara->monsno;
		}
		else if(Climem[client_no].hensin_monsno == 0)
			monsno = WazaEffMonsNo[client_no];
		else
			monsno = Climem[client_no].hensin_monsno;
		
		if(x_y == PM_Y)
			ret = GetWazaEffPokeYPos(client_no, monsno, 1);
		else
			ret = GetWazaEffPokeYPos(client_no, monsno, 0);
	}
	else{
		ret = GetWazaEffPos(client_no, x_y);
	}
	return ret;
}

//----------------------------------------------------------
//	ポケモンのY座標を取得
//	GetWazaEffPosでは自機側にMINE_SIDE_OFFSET_Yだけ差が発生するけど、
//	この関数では差は発生しない。(純粋にポケモン毎のY座標を取得する)
//----------------------------------------------------------
u8 GetPokemonYPos(u8 client_no)
{
	s16 ypos;
	
//	ypos = GetWazaEffPos(client_no, PM_Y);
	ypos = GetWazaEffPos(client_no, PM_DEFAULT_Y);
//	if(MineEnemyCheck(client_no) == SIDE_MINE)
//		ypos -= MINE_SIDE_OFFSET_Y;
	return ypos;
}

//----------------------------------------------------------
//	身代わりキャラのY座標を取得
//----------------------------------------------------------
u8 GetMigawariYPos(u8 client_no)
{
	s16 ypos;
	
	if(MineEnemyCheck(client_no))
		ypos = GetWazaEffPos(client_no, EFF_Y) + MIGAWARI_F_OFFSET_Y;
	else
		ypos = GetWazaEffPos(client_no, EFF_Y) + MIGAWARI_B_OFFSET_Y;
	return ypos;

}

//----------------------------------------------------------
//	飛んでるポケモンの上方向へのオフセットも考慮したEFF_Yの座標を取得する
//----------------------------------------------------------
u8 GetPokeShadowYPos(u8 client_no)
{
	u8 ypos;
	u16 monsno;
	
	ypos = GetWazaEffPos(client_no, EFF_Y);
	if(ContestCheck())
	{
		return ypos;	//コンテストに影はないので
	}
	else if(MineEnemyCheck(client_no))
	{
		if(Climem[client_no].hensin_monsno == 0)
			monsno = PokeParaGet(
					&PokeParaEnemy[SelMonsNo[client_no]], ID_monsno);
		else
			monsno = Climem[client_no].hensin_monsno;
	}
	else
	{
		if(Climem[client_no].hensin_monsno == 0)
			monsno = PokeParaGet(
					&PokeParaMine[SelMonsNo[client_no]], ID_monsno);
		else
			monsno = Climem[client_no].hensin_monsno;
	}
	
	if(MineEnemyCheck(client_no))
//		ypos -= PokeYOfsTbl[monsno];
		ypos -= PokeYOfsGet(client_no,monsno);
	return ypos;
}

//----------------------------------------------------------
//	ﾎﾟｹﾓﾝのｱｸﾀｰﾅﾝﾊﾞｰ取得
// 0:攻撃側のﾎﾟｹﾓﾝ   1:防御側のﾎﾟｹﾓﾝ	2:攻撃側ﾎﾟｹﾓﾝ相方	3:防御側ﾎﾟｹﾓﾝ相方
//	※相方ﾎﾟｹﾓﾝを指定した際、1vs1や2vs2で相方が気絶でいない場合などは
//	  0xffをｴﾗｰｺｰﾄﾞとして返します
//----------------------------------------------------------
u8 W_GetPokeActNo(u8 which)
{
	u8 actno;

	if(which == 0){
		//if(PokeBG2taimeCheck(AttackNo) == 0)
		if(ClientPokeExistCheck(AttackNo) == 0)
			actno = 0xff;
		else
			actno = PokemonStruct[AttackNo];
	}
	else if(which == 1){
		//if(PokeBG2taimeCheck(DefenceNo) == 0)
		if(ClientPokeExistCheck(DefenceNo) == 0)
			actno = 0xff;
		else
			actno = PokemonStruct[DefenceNo];
	}
	else if(which == 2){
		if(PokeBG2taimeCheck(AttackNo^2) == 0)
			actno = 0xff;
		else
			actno = PokemonStruct[AttackNo^2];
	}
	else{
		if(PokeBG2taimeCheck(DefenceNo^2) == 0)
			actno = 0xff;
		else
			actno = PokemonStruct[DefenceNo^2];
	}
	return actno;
}

//----------------------------------------------------------
//	ｱｸﾀｰのwork[6],[7]にSeqAdrをｾｯﾄ	by matsuda
//----------------------------------------------------------
void SetWorkSeq(actWork *Xreg, void *SeqAdr)
{
	Xreg->work[6] = (s16)((u32)SeqAdr);
	Xreg->work[7] = (s16)((u32)SeqAdr >> 16);
}
//----------------------------------------------------------
//	SetWazaSeqAdrでwork[6],[7]にｾｯﾄしたｱﾄﾞﾚｽをmoveにｾｯﾄ	by matsuda
//----------------------------------------------------------
void SetMoveSeq(actWork *Xreg)
{
	Xreg->move = (void*)((0xffff & Xreg->work[6]) | (Xreg->work[7] << 16));
}

//--------------------------------------------------------------
//         OBJ円を描く 
//
// 	work[0]=角度
//	work[1]=振り幅
//	work[2]=角度増加量
//	work[3]=ループ回数
//--------------------------------------------------------------
void PMObjKaiten( actWork * xreg )
{
	if( xreg->work[3] ) 
	{
		//円を描く
		xreg->dx = SinMove(xreg->work[0], xreg->work[1]);
		xreg->dy = CosMove(xreg->work[0], xreg->work[1]);

		//角度変化
		xreg->work[0]+=xreg->work[2];

		if( xreg->work[0] > 255 )
			xreg->work[0]-=256;
		else if( xreg->work[0] < 0 )
			xreg->work[0]+=256;

		xreg->work[3]--;
	}else
	{
		SetMoveSeq(xreg);
	}
}
//--------------------------------------------------------------
//         OBJ円を描く2
//
// 	work[0]=角度
//	work[1]=振り幅
//	work[2]=角度増加量
//	work[3]=ループ回数
//	work[4]=振り幅増加量(下位8ﾋﾞｯﾄ少数)
//	work[5]=計算で使用(0で初期化しておくこと!)
//--------------------------------------------------------------
void PMObjKaiten2( actWork * xreg )
{
	if( xreg->work[3] ) 
	{
		//円を描く
		xreg->dx = SinMove(xreg->work[0], xreg->work[1] + (xreg->work[5] >> 8));
		xreg->dy = CosMove(xreg->work[0], xreg->work[1] + (xreg->work[5] >> 8));

		//角度変化
		xreg->work[0]+=xreg->work[2];
		xreg->work[5] += xreg->work[4];

		if( xreg->work[0] > 255 )
			xreg->work[0]-=256;
		else if( xreg->work[0] < 0 )
			xreg->work[0]+=256;

		xreg->work[3]--;
	}else
	{
		SetMoveSeq(xreg);
	}
}
//--------------------------------------------------------------
//         OBJ円を描く3
//
// 	work[0]=角度1			dx
//	work[1]=振り幅			共通
//	work[2]=角度増加量1
//	work[3]=ループ回数
// 	work[4]=角度2			dy
//	work[5]=角度増加量2
//--------------------------------------------------------------
void PMObjKaiten3( actWork * xreg )
{
	if( xreg->work[3] ) 
	{
		//円を描く
		xreg->dx = SinMove(xreg->work[0], xreg->work[1]);
		xreg->dy = CosMove(xreg->work[4], xreg->work[1]);

		//角度変化
		xreg->work[0]+=xreg->work[2];
		xreg->work[4]+=xreg->work[5];

		if( xreg->work[0] > 255 )
			xreg->work[0]-=256;
		else if( xreg->work[0] < 0 )
			xreg->work[0]+=256;

		if( xreg->work[4] > 255 )
			xreg->work[4]-=256;
		else if( xreg->work[4] < 0 )
			xreg->work[4]+=256;

		xreg->work[3]--;
	}else
	{
		SetMoveSeq(xreg);
	}
}
//--------------------------------------------------------------
//         OBJ円を描く4
//
// 	work[0]=角度		
//	work[1]=振り幅1		dx	
//	work[2]=角度増加量	
//	work[3]=ループ回数
// 	work[4]=振り幅2		dy
//--------------------------------------------------------------
void PMObjKaiten4( actWork * xreg )
{
	if( xreg->work[3] ) 
	{
		//円を描く
		xreg->dx = SinMove(xreg->work[0], xreg->work[1]);
		xreg->dy = CosMove(xreg->work[0], xreg->work[4]);

		//角度変化
		xreg->work[0]+=xreg->work[2];

		if( xreg->work[0] > 255 )
			xreg->work[0]-=256;
		else if( xreg->work[0] < 0 )
			xreg->work[0]+=256;

		xreg->work[3]--;
	}else
	{
		SetMoveSeq(xreg);
	}
}

//----------------------------------------------------------
//	work[0]が0になるまでｳｪｲﾄ	by matsuda
//----------------------------------------------------------
void W_WaitSeq(actWork *Xreg)
{
	if(Xreg->work[0] > 0)
		Xreg->work[0]--;
	else
	{
		SetMoveSeq(Xreg);
	}
}

//----------------------------------------------------------
//		※旧バージョン
//	始点、終点、直線移動		by matsuda
// work0:横移動速度 work1:始点X work2:終点X work3:始点Y work4:終点Y
// ※縦の移動速度は可変
//----------------------------------------------------------
void W_StraightMove(actWork *Xreg)
{
	W_GetStraightMoveSp(Xreg);
	Xreg->move = W_ParallelMoveSeq;
	W_ParallelMoveSeq(Xreg);	//ｳｪｲﾄを置かずに実行するように初回のｺｰﾙ
}

//----------------------------------------------------------
//		※旧バージョン
//	始点、終点の移動量をX方向への速度を基準に出す
//
// work0:横移動速度 work1:始点X work2:終点X work3:始点Y work4:終点Y
// 戻り値:
//	work[0]:何Syncかけて終点に到達させるか  work[1],[2]:毎ﾙｰﾌﾟごとに足す値
//----------------------------------------------------------
void W_GetStraightMoveSp(actWork *Xreg)
{
	s16 speed_x;
	
	if(Xreg->work[1] > Xreg->work[2])
		Xreg->work[0] = -Xreg->work[0];
	speed_x = Xreg->work[0];
	
	Xreg->work[0] = abs((Xreg->work[2] - Xreg->work[1]) / speed_x);
	Xreg->work[2] = (Xreg->work[4] - Xreg->work[3]) / Xreg->work[0];
	Xreg->work[1] = speed_x;
}

//----------------------------------------------------------
//		※旧バージョン
// Sync回数分dx,dyに値を足しつづける	by matsuda
//	work[0]:何Syncかけて終点に到達させるか  work[1],[2]:毎ﾙｰﾌﾟごとに足す値([1]=X, [2]=Y)
//----------------------------------------------------------
void W_ParallelMoveSeq(actWork *Xreg)
{
	if(Xreg->work[0] > 0)
	{
		Xreg->work[0]--;
		Xreg->dx += Xreg->work[1];
		Xreg->dy += Xreg->work[2];
	}
	else
	{
		SetMoveSeq(Xreg);
	}
}
//----------------------------------------------------------
//		※旧バージョン
// Sync回数分dx,dyに値を足しつづける(固定少数Ver)	by matsuda
//	work[0]:何Syncかけて終点に到達させるか
//  work[1],[2]:毎ﾙｰﾌﾟごとに足す値※下位8ﾋﾞｯﾄ少数([1]=X, [2]=Y)
//  work[3],[4]:ワークで使用(0で初期化しておくこと!)
//----------------------------------------------------------
void W_ParallelMove2Seq(actWork *Xreg)
{
	if(Xreg->work[0] > 0)
	{
		Xreg->work[0]--;
		Xreg->work[3] += Xreg->work[1];
		Xreg->work[4] += Xreg->work[2];
		Xreg->dx = Xreg->work[3] >> 8;
		Xreg->dy = Xreg->work[4] >> 8;
	}
	else
	{
		SetMoveSeq(Xreg);
	}
}

//----------------------------------------------------------
//		※旧バージョン
// Sync回数分dx,dyに値を足しつづける(固定少数Ver)	by matsuda
//	work[0]:何Syncかけて終点に到達させるか
//  work[1],[2]:毎ﾙｰﾌﾟごとに足す値※下位8ﾋﾞｯﾄ少数([1]=X, [2]=Y)
//  work[3],[4]:ワークで使用(0で初期化しておくこと!)
//  ポケモンアイコン用のシーケンス
//----------------------------------------------------------
void PokeIconMoveSeq(actWork *Xreg)
{
	if(Xreg->work[0] > 0)
	{
		Xreg->work[0]--;
		Xreg->work[3] += Xreg->work[1];
		Xreg->work[4] += Xreg->work[2];
		Xreg->dx = Xreg->work[3] >> 8;
		Xreg->dy = Xreg->work[4] >> 8;
	}
	else
	{
		SetMoveSeq(Xreg);
	}
	
	ExtAnm(Xreg);
}

//----------------------------------------------------------
//	自分のDx,Dyを含めた現在地から相手(終点)へ移動する
// work[0]:移動速度
//----------------------------------------------------------
void W_AttackThrows(actWork *Xreg)
{
//	Xreg->work[0] = THROWS_SP;
	Xreg->work[1] = Xreg->x + Xreg->dx;
	Xreg->work[3] = Xreg->y + Xreg->dy;
	Xreg->work[2] = GetWazaEffPos(DefenceNo, PM_X);
	Xreg->work[4] = GetWazaEffPos(DefenceNo, PM_Y);
	Xreg->move = W_StraightMove;
}

//----------------------------------------------------------
// ※ﾎﾟｹﾓﾝ用
// Sync回数分dx,dyに値を足しつづける	by matsuda
//	work[0]:何Syncかけて終点に到達させるか  work[1],[2]:毎ﾙｰﾌﾟごとに足す値([1]=X, [2]=Y)
//  work[3]:対象ﾎﾟｹﾓﾝのｱｸﾀｰﾅﾝﾊﾞｰ
//----------------------------------------------------------
void W_PokeParallelMoveSeq(actWork *Xreg)
{
	if(Xreg->work[0] > 0)
	{
		Xreg->work[0]--;
		ActWork[Xreg->work[3]].dx += Xreg->work[1];
		ActWork[Xreg->work[3]].dy += Xreg->work[2];
	}
	else
	{
		SetMoveSeq(Xreg);
	}
}
//----------------------------------------------------------
// ※ﾎﾟｹﾓﾝ用
// Sync回数分dx,dyに値を足しつづける(固定少数Ver)	by matsuda
//	work[0]:何Syncかけて終点に到達させるか
//  work[1],[2]:毎ﾙｰﾌﾟごとに足す値※下位8ﾋﾞｯﾄ少数([1]=X, [2]=Y)
//  work[3],[4]:ワークで使用(0で初期化しておくこと!)
//  work[5]:対象ﾎﾟｹﾓﾝのｱｸﾀｰﾅﾝﾊﾞｰ
//----------------------------------------------------------
void W_PokeParallelMoveSeq2(actWork *Xreg)
{
	if(Xreg->work[0] > 0)
	{
		Xreg->work[0]--;
		Xreg->work[3] += Xreg->work[1];
		Xreg->work[4] += Xreg->work[2];
		ActWork[Xreg->work[5]].dx = Xreg->work[3] >> 8;
		ActWork[Xreg->work[5]].dy = Xreg->work[4] >> 8;
	}
	else
	{
		SetMoveSeq(Xreg);
	}
}

//----------------------------------------------------------
//  ループ回数分dx,dyに足す、表示のon,off
//  0:LOOP 
//  1:speedX(下位8ﾋﾞｯﾄ小数点以下) 2:計算用
//  3:speedY(下位8ﾋﾞｯﾄ小数点以下) 4:計算用
//	5:表示のon,offの間隔(0で変化なし)
//----------------------------------------------------------
void W_ParallelMoveSeq2(actWork *Xreg)
{
	if(Xreg->work[0] > 0)
	{
		Xreg->work[0]--;
		Xreg->dx = Xreg->work[2] >> 8;
		Xreg->work[2] += Xreg->work[1];

		Xreg->dy = Xreg->work[4] >> 8;
		Xreg->work[4] += Xreg->work[3];

		if( Xreg->work[0] % Xreg->work[5] == 0 && Xreg->work[5] )
			//Xreg->oamData.AffineMode^=2;
			Xreg->banish^=1;
	}
	else
	{
		SetMoveSeq(Xreg);
	}
}

//----------------------------------------------------------
//  AffineModeが１か３だったらAffineWorkNumDelしてから
//	DelWazaEffectする
//----------------------------------------------------------
void W_AffCheckEndSeq(actWork *Xreg)
{
	AffineDelActor(Xreg);
	DelWazaEffect(Xreg);
}

//----------------------------------------------------------
//	Dx,Dyを含めた相手(終点)から自分(始点)へ移動する
// work[0]:移動速度
//----------------------------------------------------------
void W_AttackThrows2(actWork *Xreg)
{
//	Xreg->work[0] = THROWS_SP;
	Xreg->work[1] = Xreg->x + Xreg->dx;
	Xreg->work[3] = Xreg->y + Xreg->dy;
	Xreg->work[2] = GetWazaEffPos(AttackNo, PM_X);
	Xreg->work[4] = GetWazaEffPos(AttackNo, PM_Y);
	Xreg->move = W_StraightMove;
}

//----------------------------------------------------------
//	DelPalAnmしてからW_AffCheckEndSeqへ
//	work[5]にidを入れる
//----------------------------------------------------------
void W_DelPalEndSeq(actWork *Xreg)
{
	DelPalAnm((u16)Xreg->work[5]);

	W_AffCheckEndSeq(Xreg);
}

//----------------------------------------------------------
//	affend_swが1になるまで待機
//----------------------------------------------------------
void W_AffEndWait(actWork *Xreg)
{
	if(Xreg->affend_sw == 1)
		SetMoveSeq(Xreg);
}
//----------------------------------------------------------
//	anmend_swが1になるまで待機
//----------------------------------------------------------
void W_AnmEndWait(actWork *Xreg)
{
	if(Xreg->anmend_sw == 1)
		SetMoveSeq(Xreg);
}

//----------------------------------------------------------
//	BLDCNTとBLDALPHAを0クリアしてDelWazaEffectを行う
//----------------------------------------------------------
void W_BldClearEnd(actWork *xreg)
{
	*(vu16*)REG_BLDCNT = 0;
	*(vu16*)REG_BLDALPHA = 0;
	DelWazaEffect(xreg);
}

//----------------------------------------------------------
//	BLDCNTとBLDALPHAを0クリアしてDelTaskEffectを行う
//----------------------------------------------------------
void W_BldClearTaskEnd(u8 id)
{
	*(vu16*)REG_BLDCNT = 0;
	*(vu16*)REG_BLDALPHA = 0;
	DelTaskEffect(id);
}

//----------------------------------------------------------
//	ﾃﾞﾌｫﾙﾄでDefenceNoの座標がｾｯﾄされているのをAttackNoの座標に変える
//										※普通の関数として使用
//----------------------------------------------------------
void EffPositionReset(actWork *Xreg)
{
	Xreg->x = GetWazaEffPos(AttackNo, PM_X);
	Xreg->y = GetWazaEffPos(AttackNo, PM_Y);
}
//----------------------------------------------------------
//	X座標へのｵﾌｾｯﾄをAttackNoによって反転
//----------------------------------------------------------
void EffXpositionSet(actWork *Xreg, s16 offset_x)
{
#if X_OFFS_REVERSAL_CHECKTYPE	//2002.08.05(月)
	if(MineEnemyCheck(AttackNo))
		Xreg->x -= offset_x;
	else
		Xreg->x += offset_x;
#else	//AttackNoがDefenceNoよりも右側に位置しているならばｵﾌｾｯﾄ反転
	u8 at_x, de_x;
	
	at_x = GetWazaEffPos(AttackNo, EFF_X);
	de_x = GetWazaEffPos(DefenceNo, EFF_X);
	if(at_x > de_x)
		Xreg->x -= offset_x;
	else if(at_x < de_x)
		Xreg->x += offset_x;
	else{	//座標が同じ
		if(MineEnemyCheck(AttackNo))
			Xreg->x -= offset_x;
		else
			Xreg->x += offset_x;
	}
#endif
}



//----------------------------------------------------------
// ※コールして使用
//
// 全ワーク使用 : 指定がない限り初期化の必要なし
//	work 0:何Syncかけて終点に到達させるか   2:終点X　4:終点Y
//  5:山なりの振り幅
//----------------------------------------------------------
void YamanariMoveInit(actWork *Xreg)
{
	Xreg->work[1] = Xreg->x;
	Xreg->work[3] = Xreg->y;
//	W_GetStraightMoveLoop(Xreg);
	W_GetStraightSyncParam(Xreg);
	
	Xreg->work[6] = (128 << 8) / Xreg->work[0];
	Xreg->work[7] = 0;
}

//----------------------------------------------------------
//	※SetWorkSeq等を使用しないで、毎回コールして使用
//
// work: YamanariMoveInitを使用していれば何も指定する必要はないです
// 戻り値: 0:まだ続きがある   1:終了
//----------------------------------------------------------
u8 YamanariMoveMain(actWork *Xreg)
{
	if(W_ParallelSync(Xreg))
		return 1;

	Xreg->work[7] += Xreg->work[6];
	Xreg->dy += SinMove(0xff & (Xreg->work[7] >> 8), Xreg->work[5]);
	return 0;
}

//----------------------------------------------------------
//	Dx,DyをX,Yに足してDx,Dyは0クリア
//----------------------------------------------------------
void DxDyAddClear(actWork *xreg)
{
	xreg->x += xreg->dx;
	xreg->y += xreg->dy;
	xreg->dx = 0;
	xreg->dy = 0;
}

//----------------------------------------------------------
//	ﾃﾞﾌｫﾙﾄ座標ｾｯﾄ その1（あまりにも同じ命令を呼ぶ個所が多いので作ったっす)
// offset 0:Xoffset  1:Yoffset
//	引数:座標ﾓｰﾄﾞ(EFF_MODE or PM_MODE)
//----------------------------------------------------------
//-- そのまま防御側の座標 --//
void WazaDefaultPosSet1(actWork *Xreg, u8 zahyou_mode)
{
	if(zahyou_mode == EFF_MODE)
	{
		Xreg->x = GetWazaEffPos2(DefenceNo, EFF_X);
		Xreg->y = GetWazaEffPos2(DefenceNo, EFF_Y);
	}
	EffXpositionSet(Xreg, WazaEffWork[0]);
	Xreg->y += WazaEffWork[1];
}
//-- 攻撃側の座標に切り替えてからｵﾌｾｯﾄを足す --//
void WazaDefaultPosSet2(actWork *Xreg, u8 zahyou_mode)
{
	if(zahyou_mode == EFF_MODE)
	{
		Xreg->x = GetWazaEffPos2(AttackNo, EFF_X);
		Xreg->y = GetWazaEffPos2(AttackNo, EFF_Y);
	}
	else
	{
		Xreg->x = GetWazaEffPos2(AttackNo, PM_X);
		Xreg->y = GetWazaEffPos2(AttackNo, PM_Y);
	}
	EffXpositionSet(Xreg, WazaEffWork[0]);
	Xreg->y += WazaEffWork[1];
}

//----------------------------------------------------------
//		ポケモンの位置が敵側か味方側か判断する
//----------------------------------------------------------

u8	MineEnemyCheck(u8 client_no)		//Add by soga 2001.09.25
{
	return	ClientType[client_no]&1;
}

u8	ClientTypeGet(u8 client_no)		//Add by soga 2001.09.26
{
	return	ClientType[client_no];
}

u8	ClientNoGet(u8 client_type)		//Add by soga 2001.09.26
{
	u8	client_no;
	
	for(client_no=0;client_no<ClientSetMax;client_no++){
		if(ClientType[client_no]==client_type) break;
	}
	return client_no;
}

//----------------------------------------------------------
//	指定したｸﾗｲｱﾝﾄのﾎﾟｹﾓﾝが生きているか、いないか(存在してるか、してないか)
//  をﾁｪｯｸする
//	戻り値:0:生きてない	1:生きてる
//----------------------------------------------------------
u8 ClientPokeExistCheck(u8 client_no)
{
	if(ContestCheck()){
		if(AttackNo == client_no || DefenceNo == client_no)
			return 1;
		return 0;
	}
	
#if 1
	if(ClientType[client_no] == 0xff)
		return 0;
	
	if(MineEnemyCheck(client_no))
	{
		if(PokeParaGet(&PokeParaEnemy[SelMonsNo[client_no]], ID_hp) == 0)
			return 0;
		else
			return 1;
	}
	else
	{
		if(PokeParaGet(&PokeParaMine[SelMonsNo[client_no]], ID_hp) == 0)
			return 0;
		else
			return 1;
	}
#else
	return ((NoReshuffleClient&no2bittbl[client_no])==0);
#endif
}

//----------------------------------------------------------
//	現在の戦闘が1対1か2対2かﾁｪｯｸする
// 戻り値：0 = 1対1   1 = 2対2
//----------------------------------------------------------
u8 FightCheck(void)
{
	return (FightType & FIGHT_TYPE_2vs2);
}

//----------------------------------------------------------
//	戦闘、ｺﾝﾃｽﾄ、BGを使用する場合のｷｬﾗｱﾄﾞﾚｽ、ｽｸﾘｰﾝｱﾄﾞﾚｽを取得する
//----------------------------------------------------------
void GetWazaEffBgAdrs(WazaBgData *EffData)
{
	if(ContestCheck()){
		EffData->CharAdrs = (void*)(BG_VRAM + CONWAZA_BG_CHARBASE * 0x4000);
		EffData->ScrnAdrs = (void*)(BG_VRAM + 0x800 * CONWAZA_BG_SCRNBASE);
		EffData->PlttNo = CONWAZA_BG_PAL;
	}else{
		EffData->CharAdrs = (void*)(BG_VRAM + BTL_BG_CHARADRS1);
		EffData->ScrnAdrs = (void*)(BG_VRAM + 0x800 * BTL_BG_SCRNBASE1);
		EffData->PlttNo = BTL_BG_PAL1;
	}
}

void GetWazaEffBgAdrs2(WazaBgData *EffData, u8 client_no)
{
	if(ContestCheck()){
		EffData->CharAdrs = (void*)(BG_VRAM + CONWAZA_BG_CHARBASE * 0x4000);
		EffData->ScrnAdrs = (void*)(BG_VRAM + 0x800 * CONWAZA_BG_SCRNBASE);
		EffData->PlttNo = CONWAZA_BG_PAL;
	}else{
		if(GetPokeBGNo(AttackNo) == 1){
			EffData->CharAdrs = (void*)(BG_VRAM + BTL_BG_CHARADRS1);
			EffData->ScrnAdrs = (void*)(BG_VRAM + 0x800 * BTL_BG_SCRNBASE1);
			EffData->PlttNo = BTL_BG_PAL1;
		}
		else{
			EffData->CharAdrs = (void*)(BG_VRAM + BTL_BG_CHARADRS2);
			EffData->ScrnAdrs = (void*)(BG_VRAM + 0x800 * BTL_BG_SCRNBASE2);
			EffData->PlttNo = BTL_BG_PAL2;
		}
	}
}

//----------------------------------------------------------
//	戦闘、コンテストの背景のパレットNoを取得する
//----------------------------------------------------------
u8 GetHaikeiPalNo(void)
{
	if(ContestCheck())
		return 1;
	else
		return 2;
}

//----------------------------------------------------------
//	背景のBGに対して、回り込みﾌﾗｸﾞ、ｻｲｽﾞを0に変更してｾｯﾄ、ﾘｾｯﾄする
//	flg: 0=ｾｯﾄ	1:ﾘｾｯﾄ(初期設定に戻す)
//----------------------------------------------------------
void HaikeiBGLoopSizeSet(u8 flg)
{
	if(flg == 0){
		(*(vBgCnt *)REG_BG3CNT).Size = 0;
		(*(vBgCnt *)REG_BG3CNT).Loop = 1;
	}
	else{
		if(ContestCheck()){
			(*(vBgCnt *)REG_BG3CNT).Size = CONTEST_HAIKEI_SIZE;
			(*(vBgCnt *)REG_BG3CNT).Loop = CONTEST_HAIKEI_LOOP;
		}
		else{
			(*(vBgCnt *)REG_BG3CNT).Size = BTL_BG_HAIKEI_SIZE;
			(*(vBgCnt *)REG_BG3CNT).Loop = BTL_BG_HAIKEI_LOOP;
		}
	}
}

//----------------------------------------------------------
//		※旧バージョン	まだ使用してあるﾙｰﾁﾝがあるので残してる
//	始点、終点、直線移動		by matsuda
// work0:何Syncかけて終点に到達させるか work2:終点X work4:終点Y
//----------------------------------------------------------
void W_StraightMove2(actWork *Xreg)
{
	Xreg->work[1] = Xreg->x;
	Xreg->work[3] = Xreg->y;
	W_GetStraightMoveLoop(Xreg);
	Xreg->move = PokeIconMoveSeq;
	Xreg->move(Xreg);
}

//----------------------------------------------------------
//		※旧バージョン	まだ使用してあるﾙｰﾁﾝがあるので残してる
//	始点、終点の移動量をSync回数を基準に出す
//
// work0:何Syncかけて終点に到達させるか work1:始点X work2:終点X work3:始点Y work4:終点Y
// 戻り値:
//	work[0]:Sync回数  work[1],[2]:毎ﾙｰﾌﾟごとに足す値※下位8ﾋﾞｯﾄ少数([1]=X, [2]=Y)
//	work[3],[4]は0クリア
//----------------------------------------------------------
void W_GetStraightMoveLoop(actWork *Xreg)
{
	s16 OffSetX, OffSetY;
	
	OffSetX = ((Xreg->work[2] - Xreg->work[1])) << 8;
	OffSetY = ((Xreg->work[4] - Xreg->work[3])) << 8;
	
	Xreg->work[1] = OffSetX / Xreg->work[0];
	Xreg->work[2] = OffSetY / Xreg->work[0];
	Xreg->work[3] = Xreg->work[4] = 0;
}

//----------------------------------------------------------
//		※新バージョン
//	始点、終点の移動量をSync回数を基準に出す
//
// work0:何Syncかけて終点に到達させるか work1:始点X work2:終点X work3:始点Y work4:終点Y
// 戻り値:
//	work[0]:Sync回数  
//  work[1],[2]:毎ﾙｰﾌﾟごとに足す値※下位8ﾋﾞｯﾄ少数([1]=X, [2]=Y)
//				正の場合は最下位ﾋﾞｯﾄが0、負の場合は最下位ﾋﾞｯﾄが1になる
//				(少数の部分が1上下したぐらいではほとんど変わらないのでﾌﾗｸﾞとしてみる)
//	work[3],[4]は0クリア
//----------------------------------------------------------
void W_GetStraightSyncParam(actWork *Xreg)
{
	s32 OffSetX, OffSetY;
	u16 add_x, add_y;
	u8 mainasuX, mainasuY;
	
	OffSetX = Xreg->work[2] - Xreg->work[1];
	OffSetY = Xreg->work[4] - Xreg->work[3];
	OffSetX < 0 ? (mainasuX = 1) : (mainasuX = 0);
	OffSetY < 0 ? (mainasuY = 1) : (mainasuY = 0);
	
	add_x = abs(OffSetX) << 8;
	add_y = abs(OffSetY) << 8;
	add_x /= Xreg->work[0];
	add_y /= Xreg->work[0];
	if(mainasuX)
		add_x |= 1;
	else
		add_x &= 0xfffe;
	if(mainasuY)
		add_y |= 1;
	else
		add_y &= 0xfffe;
	
	Xreg->work[1] = add_x;
	Xreg->work[2] = add_y;
	Xreg->work[3] = Xreg->work[4] = 0;
}

//----------------------------------------------------------
//		※新バージョン
//	始点、終点、直線移動		by matsuda
// work0:何Syncかけて終点に到達させるか work2:終点X work4:終点Y
//----------------------------------------------------------
void W_StraightSyncMove(actWork *Xreg)
{
	Xreg->work[1] = Xreg->x;
	Xreg->work[3] = Xreg->y;
	W_GetStraightSyncParam(Xreg);
	Xreg->move = W_ParallelSyncMove;
	Xreg->move(Xreg);
}

//----------------------------------------------------------
//		※コールして使用
//	戻り値: 0 = まだ動作中		1 = 終了
//		※新バージョン
// Sync回数分dx,dyに値を足しつづける(固定少数)
//	work[0]:繰り返しSync回数
//  work[1],[2]:毎ﾙｰﾌﾟごとに足す値※下位8ﾋﾞｯﾄ少数([1]=X, [2]=Y)
//				最下位ﾋﾞｯﾄが0の場合は正として、1の場合は負としてみる
//				(詳しくはW_GetStraightSyncParamのｺﾒﾝﾄ参照)
//  work[3],[4]:ワークで使用(0で初期化しておくこと!)
//----------------------------------------------------------
u8 W_ParallelSync(actWork *Xreg)
{
	u16 addX, addY;
	u16 dx, dy;
	
	if(Xreg->work[0] == 0)
		return 1;
	
	addX = Xreg->work[1];
	addY = Xreg->work[2];
	dx = Xreg->work[3];
	dy = Xreg->work[4];
	
	dx += addX;
	dy += addY;
	if(addX & 1)
		Xreg->dx = -(dx >> 8);
	else
		Xreg->dx = dx >> 8;
	if(addY & 1)
		Xreg->dy = -(dy >> 8);
	else
		Xreg->dy = dy >> 8;
	
	Xreg->work[3] = dx;
	Xreg->work[4] = dy;
	Xreg->work[0]--;
	return 0;
}

//----------------------------------------------------------
//
//----------------------------------------------------------
void W_ParallelSyncMove(actWork *Xreg)
{
	if(W_ParallelSync(Xreg))
		SetMoveSeq(Xreg);
}

//----------------------------------------------------------
//		※新バージョン	2002.05.10(金)
//	始点、終点の移動量をX方向への速度を基準に出す
//
// work0:横移動速度(固定少数:正のみ) work1:始点X work2:終点X work3:始点Y work4:終点Y
//
// 戻り値:
//	work[0]:Sync回数
//  work[1],[2]:毎ﾙｰﾌﾟごとに足す値※下位8ﾋﾞｯﾄ少数([1]=X, [2]=Y)
//				正の場合は最下位ﾋﾞｯﾄが0、負の場合は最下位ﾋﾞｯﾄが1になる
//				(少数の部分が1上下したぐらいではほとんど変わらないのでﾌﾗｸﾞとしてみる)
//	work[3],[4]は0クリア
//----------------------------------------------------------
void W_GetStraightSpParam(actWork *xreg)
{
	s32 OffSetX;
	
	OffSetX = abs(xreg->work[2] - xreg->work[1]) << 8;
	xreg->work[0] = OffSetX / xreg->work[0];
	W_GetStraightSyncParam(xreg);
}

//----------------------------------------------------------
//		※新バージョン
//	始点、終点、X方向への速度を基準に直線移動		by matsuda
// work0:横移動速度(固定少数:正のみ) work2:終点X work4:終点Y
//----------------------------------------------------------
void W_StraightSpMove(actWork *Xreg)
{
	Xreg->work[1] = Xreg->x;
	Xreg->work[3] = Xreg->y;
	W_GetStraightSpParam(Xreg);
	Xreg->move = W_ParallelSyncMove;
	Xreg->move(Xreg);
}








//=========================================================================
//
//		下位4ビットが少数Version
//												by matsuda 2002.06.04(火)
//=========================================================================
//----------------------------------------------------------
//		※下位4ビット少数Version
//	始点、終点の移動量をSync回数を基準に出す
//
// work0:何Syncかけて終点に到達させるか work1:始点X work2:終点X work3:始点Y work4:終点Y
// 戻り値:
//	work[0]:Sync回数  
//  work[1],[2]:毎ﾙｰﾌﾟごとに足す値※下位8ﾋﾞｯﾄ少数([1]=X, [2]=Y)
//				正の場合は最下位ﾋﾞｯﾄが0、負の場合は最下位ﾋﾞｯﾄが1になる
//				(少数の部分が1上下したぐらいではほとんど変わらないのでﾌﾗｸﾞとしてみる)
//	work[3],[4]は0クリア
//----------------------------------------------------------
void W_GetStraightSyncParam4(actWork *Xreg)
{
	s32 OffSetX, OffSetY;
	u16 add_x, add_y;
	u8 mainasuX, mainasuY;
	
	OffSetX = Xreg->work[2] - Xreg->work[1];
	OffSetY = Xreg->work[4] - Xreg->work[3];
	OffSetX < 0 ? (mainasuX = 1) : (mainasuX = 0);
	OffSetY < 0 ? (mainasuY = 1) : (mainasuY = 0);
	
	add_x = abs(OffSetX) << 4;
	add_y = abs(OffSetY) << 4;
	add_x /= Xreg->work[0];
	add_y /= Xreg->work[0];
	if(mainasuX)
		add_x |= 1;
	else
		add_x &= 0xfffe;
	if(mainasuY)
		add_y |= 1;
	else
		add_y &= 0xfffe;
	
	Xreg->work[1] = add_x;
	Xreg->work[2] = add_y;
	Xreg->work[3] = Xreg->work[4] = 0;
}

//----------------------------------------------------------
//		※下位4ビット少数Version
//	始点、終点、直線移動		by matsuda
// work0:何Syncかけて終点に到達させるか work2:終点X work4:終点Y
//----------------------------------------------------------
void W_StraightSyncMove4(actWork *Xreg)
{
	Xreg->work[1] = Xreg->x;
	Xreg->work[3] = Xreg->y;
	W_GetStraightSyncParam4(Xreg);
	Xreg->move = W_ParallelSyncMove4;
	Xreg->move(Xreg);
}

//----------------------------------------------------------
//		※下位4ビット少数Version
//		※コールして使用
//	戻り値: 0 = まだ動作中		1 = 終了
//		※新バージョン
// Sync回数分dx,dyに値を足しつづける(固定少数)
//	work[0]:繰り返しSync回数
//  work[1],[2]:毎ﾙｰﾌﾟごとに足す値※下位8ﾋﾞｯﾄ少数([1]=X, [2]=Y)
//				最下位ﾋﾞｯﾄが0の場合は正として、1の場合は負としてみる
//				(詳しくはW_GetStraightSyncParamのｺﾒﾝﾄ参照)
//  work[3],[4]:ワークで使用(0で初期化しておくこと!)
//----------------------------------------------------------
u8 W_ParallelSync4(actWork *Xreg)
{
	u16 addX, addY;
	u16 dx, dy;
	
	if(Xreg->work[0] == 0)
		return 1;
	
	addX = Xreg->work[1];
	addY = Xreg->work[2];
	dx = Xreg->work[3];
	dy = Xreg->work[4];
	
	dx += addX;
	dy += addY;
	if(addX & 1)
		Xreg->dx = -(dx >> 4);
	else
		Xreg->dx = dx >> 4;
	if(addY & 1)
		Xreg->dy = -(dy >> 4);
	else
		Xreg->dy = dy >> 4;
	
	Xreg->work[3] = dx;
	Xreg->work[4] = dy;
	Xreg->work[0]--;
	return 0;
}

//----------------------------------------------------------
//		※下位4ビット少数Version
//----------------------------------------------------------
void W_ParallelSyncMove4(actWork *Xreg)
{
	if(W_ParallelSync4(Xreg))
		SetMoveSeq(Xreg);
}

//----------------------------------------------------------
//		※下位4ビット少数Version
//	始点、終点の移動量をX方向への速度を基準に出す
//
// work0:横移動速度(下位4ビット少数:正のみ) 
//	work1:始点X work2:終点X work3:始点Y work4:終点Y
//
// 戻り値:
//	work[0]:Sync回数
//  work[1],[2]:毎ﾙｰﾌﾟごとに足す値※下位8ﾋﾞｯﾄ少数([1]=X, [2]=Y)
//				正の場合は最下位ﾋﾞｯﾄが0、負の場合は最下位ﾋﾞｯﾄが1になる
//				(少数の部分が1上下したぐらいではほとんど変わらないのでﾌﾗｸﾞとしてみる)
//	work[3],[4]は0クリア
//----------------------------------------------------------
void W_GetStraightSpParam4(actWork *xreg)
{
	s32 OffSetX;
	
	OffSetX = abs(xreg->work[2] - xreg->work[1]) << 4;
	xreg->work[0] = OffSetX / xreg->work[0];
	W_GetStraightSyncParam4(xreg);
}

//----------------------------------------------------------
//		※下位4ビット少数Version
//	始点、終点、X方向への速度を基準に直線移動		by matsuda
// work0:横移動速度(固定少数:正のみ) work2:終点X work4:終点Y
//----------------------------------------------------------
void W_StraightSpMove4(actWork *Xreg)
{
	Xreg->work[1] = Xreg->x;
	Xreg->work[3] = Xreg->y;
	W_GetStraightSpParam4(Xreg);
	Xreg->move = W_ParallelSyncMove4;
	Xreg->move(Xreg);
}












//=========================================================================
//
//		ポケモン拡縮の値をｾｯﾄ
//	※ｺﾝﾃｽﾄでは向きを反転させなければいけないので、ここでOBJ_AffineWorkにｾｯﾄするのと
//	同時にｺﾝﾃｽﾄの場合は反転させる。
//	拡縮計算とOBJ_AffineWorkに対してのｾｯﾄを行う
//	
//	現在の拡縮値などの計算は外でやる必要がある
//												by matsuda 2002.02.18(月)
//=========================================================================
//----------------------------------------------------------
//	引数: pokeact = ポケモンのActNo
// 		  RatioX,RatioY = 拡縮X,Y	Theta = 回転角度
//----------------------------------------------------------
void PokeKakusyukuSet(u8 pokeact, s16 RatioX, s16 RatioY, u16 Theta)
{
	ObjAffineSrcData src;
	ObjAffineDestData dest;
	u8 affNo;
	
	src.RatioX = RatioX;	//0x0100;
	src.RatioY = RatioY;	//0x0100;
	src.Theta = Theta;		//0;
	
//	if(ContestCheck())
	if(RatioXFlipCheck())
		src.RatioX = -src.RatioX;
	
	affNo = ActWork[pokeact].oamData.AffineParamNo;
	ObjAffineSet(&src, &dest, 1, 2);
	OBJ_AffineWork[affNo].H_DiffX = dest.H_DiffX;
	OBJ_AffineWork[affNo].V_DiffX = dest.V_DiffX;
	OBJ_AffineWork[affNo].H_DiffY = dest.H_DiffY;
	OBJ_AffineWork[affNo].V_DiffY = dest.V_DiffY;
}

u8 RatioXFlipCheck(void)
{
	if(ContestCheck() && ActWork[W_GetPokeActNo(0)].work[2] != MONSNO_ANNOON)
		return 1;
	return 0;
}

//----------------------------------------------------------
//	ﾎﾟｹﾓﾝの拡縮をやる前のInit関数
//	引数: pokeact = ﾎﾟｹﾓﾝのActNo
//		  bld_flg = 半透明ON,OFFﾌﾗｸﾞ(1:ON  0:OFF)
//----------------------------------------------------------
void PokeKakusyukuInit(u8 pokeact, u8 bld_flg)
{
	u8 client_no;
	
	client_no = ActWork[pokeact].work[0];
	if(ContestCheck() == 0 && PokeBG2taimeCheck(client_no) == 0)	//2002.09.21(土)
		;	//ﾛｯｸｵﾝ→そらをとぶ→しめつける で画面にいないﾎﾟｹﾓﾝのﾊﾞﾆｯｼｭﾌﾗｸﾞをOFFしないようにﾁｪｯｸ
	else
		ActWork[pokeact].banish = 0;	//BG落としでﾊﾞﾆｯｼｭ状態になってるﾎﾟｹﾓﾝを出す
//	ActWork[pokeact].banish = 0;	//BG落としでﾊﾞﾆｯｼｭ状態になってるﾎﾟｹﾓﾝを出す
	ActWork[pokeact].oamData.ObjMode = bld_flg;	//半透明ﾌﾗｸﾞON
	ActWork[pokeact].aff_pause = 1;		//立てておかないとAffineｱﾆﾒが優先されてしまう
	if(ContestCheck() == 0 && 
		ActWork[pokeact].oamData.AffineMode == 0)	//ETCｴﾌｪｸﾄなどでは退避させてないので
	{
		ActWork[pokeact].oamData.AffineParamNo = CliSys[client_no].poke_aff_no;
	}
	ActWork[pokeact].oamData.AffineMode = 3;	//ﾎﾟｹﾓﾝの倍角ﾌﾗｸﾞON
	//-- 倍角ﾌﾗｸﾞを立てたので中心座標を補正 --//
	actCenterCalc(&ActWork[pokeact], ActWork[pokeact].oamData.Shape,
			ActWork[pokeact].oamData.Size, ActWork[pokeact].oamData.AffineMode );
}

//----------------------------------------------------------
//	ﾎﾟｹﾓﾝの拡縮を終了するときの呼ぶEnd関数
//	引数:	pokeact = ﾎﾟｹﾓﾝのActNo
//----------------------------------------------------------
void PokeKakusyukuEnd(u8 pokeact)
{
	//-- 一応ﾃﾞﾌｫﾙﾄの値をｾｯﾄ --//
	PokeKakusyukuSet(pokeact, 0x0100, 0x0100,  0);
	ActWork[pokeact].oamData.AffineMode = 1;	//倍角ﾌﾗｸﾞOFF
	ActWork[pokeact].oamData.ObjMode = 0;	//半透明ﾌﾗｸﾞOFF
	ActWork[pokeact].aff_pause = 0;
	//-- 倍角ﾌﾗｸﾞを元に戻したので中心座標を補正 --//
	actCenterCalc(&ActWork[pokeact], ActWork[pokeact].oamData.Shape,
		ActWork[pokeact].oamData.Size, ActWork[pokeact].oamData.AffineMode );
}
//-------------------------------------------------------------
//	回転したポケモンアクターの切れ目が見えないように、dy 値を補正する
//	pokeact  ポケモンアクターナンバ
//-------------------------------------------------------------
void W_AdjustKaitenYPos(u8 pokeact)
{
	u8 affno;
	s16 H_DiffY;
	u32 dy;

	affno = ActWork[pokeact].oamData.AffineParamNo;
	H_DiffY = OBJ_AffineWork[affno].H_DiffY;
	if(H_DiffY < 0){
		H_DiffY *= -1;
	}
	dy = (H_DiffY * 32) >> 8;
	ActWork[pokeact].dy = dy;
}


//=========================================================================
//	引数: xreg = ｱﾌｨﾝﾃﾞｰﾀをｾｯﾄするｱｸﾀｰ
//		  hosei = 倍角ﾓｰﾄﾞによる補正の再計算(0:しない  1:する)
// 		  RatioX,RatioY = 拡縮X,Y	Theta = 回転角度
//=========================================================================
void KakusyukuSet(actWork *xreg, u8 hosei, s16 RatioX, s16 RatioY, u16 Theta)
{
	ObjAffineSrcData src;
	ObjAffineDestData dest;
	u8 affNo;

	if((xreg->oamData.AffineMode & 1) == 0)
		return;
	
	xreg->aff_pause = 1;	//立てておかないとAffineｱﾆﾒが優先されてしまう
	if(hosei){
		//-- 倍角ﾌﾗｸﾞ 中心座標を補正 --//
		actCenterCalc(xreg, xreg->oamData.Shape,
			xreg->oamData.Size, xreg->oamData.AffineMode );
	}

	src.RatioX = RatioX;	//0x0100;
	src.RatioY = RatioY;	//0x0100;
	src.Theta = Theta;		//0;
	
//	if(ContestCheck())
	if(RatioXFlipCheck())
		src.RatioX = -src.RatioX;
	
	affNo = xreg->oamData.AffineParamNo;
	ObjAffineSet(&src, &dest, 1, 2);
	OBJ_AffineWork[affNo].H_DiffX = dest.H_DiffX;
	OBJ_AffineWork[affNo].V_DiffX = dest.V_DiffX;
	OBJ_AffineWork[affNo].H_DiffY = dest.H_DiffY;
	OBJ_AffineWork[affNo].V_DiffY = dest.V_DiffY;
}

//----------------------------------------------------------
//	ﾎﾟｹﾓﾝの拡縮を終了するときの呼ぶEnd関数
//	引数:	pokeact = ﾎﾟｹﾓﾝのActNo
//----------------------------------------------------------
void KakusyukuEnd(actWork *xreg)
{
	//-- 一応ﾃﾞﾌｫﾙﾄの値をｾｯﾄ --//
	KakusyukuSet(xreg, 1, 0x0100, 0x0100,  0);
	xreg->aff_pause = 0;
	//-- 倍角ﾌﾗｸﾞを元に戻したので中心座標を補正 --//
	actCenterCalc(xreg, xreg->oamData.Shape,
		xreg->oamData.Size, xreg->oamData.AffineMode );
}


//=========================================================================
//	角度を取得する
//
//	戻り値：角度 0～0xffff(そのままAffineParameterに入る値)
//=========================================================================
u16 GetKakudo(s16 x, s16 y)
{
	u16 kakudo;
	
	kakudo = ArcTan2(x,y);
	return kakudo;
}

u16 GetKakudo2(s16 x, s16 y)
{
	u16 kakudo;
	
	kakudo = GetKakudo(x,y);
	return (0x10000 - kakudo);
}

//=========================================================================
//	カラーをモノトーン色に変化
//	引数:palno = モノトーンにするカラーパレット(0～32  ※0～15:BG、 16～31:OBJ)
//		flg = 0:モノトーンにする	1:モノトーンになっていたのを元に戻す
//=========================================================================
void W_ColorMonotone(u16 palno, u8 flg)
{
	int i;
	u16 color;
	
	palno *= 16;
	
	if(flg == 0){
		for(i = 0; i < 16; i++){
			color = ((PlttData*)&PaletteWork[palno+i])->Red 
				+ ((PlttData*)&PaletteWork[palno+i])->Green 
				+ ((PlttData*)&PaletteWork[palno+i])->Blue;
			color /= 3;
			((PlttData*)&PaletteWorkTrans[palno+i])->Red = color;
			((PlttData*)&PaletteWorkTrans[palno+i])->Green = color;
			((PlttData*)&PaletteWorkTrans[palno+i])->Blue = color;
		}
	}else
		CpuCopy(&PaletteWork[palno], &PaletteWorkTrans[palno], 0x20, 32);
}


//=========================================================================
//	PaletteFadeで使用するfade_bitの内、背景、ﾎﾟｹﾓﾝ、ｴﾌｪｸﾄ用BGのﾋﾞｯﾄを取得する
//		各引数に 0=取得しない	1=取得する
// 引き数	haikei=背景(土地含む)	atpoke=攻撃側ﾎﾟｹﾓﾝ depoke=防御側ﾎﾟｹﾓﾝ
//			atpoke2=攻撃側ﾎﾟｹﾓﾝ相方  depoke2=防御側ﾎﾟｹﾓﾝ相方
//			eff1=ｴﾌｪｸﾄBG1  eff2=ｴﾌｪｸﾄBG2
//=========================================================================
u32 GetBattleFadeBit(u8 haikei, u8 atpoke, u8 depoke, u8 atpoke2, u8 depoke2, u8 eff1, u8 eff2)
{
	u32 fade_bit = 0;
	u32 pal_no;
	
	if(haikei){
		if(ContestCheck() == 0)
			fade_bit = 0xe;
		else
			fade_bit |= 1 << GetHaikeiPalNo();
	}
	if(atpoke)	//攻撃側ﾎﾟｹﾓﾝをﾌｪｰﾄﾞ
	{
		pal_no = AttackNo;
		fade_bit |= 1 << (pal_no + 16);
	}
	if(depoke)	//防御側ﾎﾟｹﾓﾝをﾌｪｰﾄﾞ
	{
		pal_no = DefenceNo;
		fade_bit |= 1 << (pal_no + 16);
	}
	if(atpoke2 && PokeBG2taimeCheck(AttackNo^2))	//攻撃側ﾎﾟｹﾓﾝ相方
	{
		pal_no = AttackNo ^ 2;
		fade_bit |= 1 << (pal_no + 16);
	}
	if(depoke2 && PokeBG2taimeCheck(DefenceNo^2))	//防御側ﾎﾟｹﾓﾝ相方
	{
		pal_no = DefenceNo ^ 2;
		fade_bit |= 1 << (pal_no + 16);
	}
	
	if(eff1){
		if(ContestCheck() == 0)
			fade_bit |= 1 << BTL_BG_PAL1;
		else
			fade_bit |= 1 << CONWAZA_BG_PAL;
	}
	if(eff2 && ContestCheck() == 0)
		fade_bit |= 1 << BTL_BG_PAL2;	//0x200;
	
	return fade_bit;
}

//=========================================================================
//	PaletteFadeで使用するfade_bitの内、ﾎﾟｹﾓﾝの敵、味方、全てのﾋﾞｯﾄを取得する
//		各引数に 0=取得しない	1=取得する
// 引き数	mine0=自機側1体目	mine1=自機側2体目
//			enemy0=敵側1体目	enemy1=敵側2体目
//=========================================================================
u32 GetPokeFadeBit(u8 mine0, u8 mine1, u8 enemy0, u8 enemy1)
{
	u32 fade_bit = 0;
	u32 pal_no;
	
	if(ContestCheck()){
		if(mine0){
			pal_no = CONT_MINE_CLIENT;
			fade_bit |= 1 << (pal_no + 16);
		}
		return fade_bit;
	}
		
	if(mine0 && PokeBG2taimeCheck(ClientNoGet(BSS_CLIENT_MINE))){
		pal_no = ClientNoGet(BSS_CLIENT_MINE);
		fade_bit |= 1 << (pal_no + 16);
	}
	if(mine1 && PokeBG2taimeCheck(ClientNoGet(BSS_CLIENT_MINE2))){
		pal_no = ClientNoGet(BSS_CLIENT_MINE2);
		fade_bit |= 1 << (pal_no + 16);
	}
	if(enemy0 && PokeBG2taimeCheck(ClientNoGet(BSS_CLIENT_ENEMY))){
		pal_no = ClientNoGet(BSS_CLIENT_ENEMY);
		fade_bit |= 1 << (pal_no + 16);
	}
	if(enemy1 && PokeBG2taimeCheck(ClientNoGet(BSS_CLIENT_ENEMY2))){
		pal_no = ClientNoGet(BSS_CLIENT_ENEMY2);
		fade_bit |= 1 << (pal_no + 16);
	}
	return fade_bit;
}

//=========================================================================
//	ClientNoからポケモンのパレットNoを取得
//=========================================================================
u8 GetClientPokePalNo(u8 client_no)
{
	return client_no;
}

//=========================================================================
//	ClientType(BSS_CLIENT_MINE,BSS_CLIENT_MINE2等)からポケモンのパレットNoを取得
//=========================================================================
u8 GetTypePokePalNo(u8 client_type)
{
	return (ClientNoGet(client_type));
}










//=========================================================================
//
//		共通Initシーケンス
//	※ｱｸﾀｰの最初のInit関数として使用(WazaEffWorkの値を使用しているため)
//=========================================================================
//----------------------------------------------------------
//		※Init関数
//	その場でｱﾆﾒｰｼｮﾝ、又は拡縮が終了するのを待って、その後Delする
// offset 0:Xoffset  1:Yoffset  2: 0=攻撃側に出す  1=防御側に出す
//		  3:座標ﾓｰﾄﾞ(0:PMﾓｰﾄﾞ	1:EFFﾓｰﾄﾞ)
//----------------------------------------------------------
void W_AnmAffWaitDel(actWork *xreg)
{
	u8 mode;
	
	if(xreg->work[0] == 0)	//flag
	{
		if(WazaEffWork[3] == 0)
			mode = PM_MODE;
		else
			mode = EFF_MODE;
		
		if(WazaEffWork[2] == 0)
			WazaDefaultPosSet2(xreg, mode);
		else
			WazaDefaultPosSet1(xreg, mode);
		
		xreg->work[0]++;	//初回flag on
	}
	else
	{
		if(xreg->anmend_sw == 1 || xreg->affend_sw == 1)
			W_AffCheckEndSeq(xreg);
	}
}

//----------------------------------------------------------
//		※Init関数
//	自分から敵に向かって球を飛ばしてDelする
//	offset	0:Xoffset	1:Yoffset	2:終点Xoffset	3:終点Yoffset
//	4:Sync回数		5:座標ﾓｰﾄﾞ:上位8ﾋﾞｯﾄ=始点  下位8ﾋﾞｯﾄ=終点(0:PMﾓｰﾄﾞ	1:EFFﾓｰﾄﾞ)
//----------------------------------------------------------
void W_StraightMoveInit(actWork *xreg)
{
	u8 st_mode, end_mode;
	
	if((WazaEffWork[5] & 0xff00) == 0)
		st_mode = PM_MODE;
	else
		st_mode = EFF_MODE;
	if((WazaEffWork[5] & 0x00ff) == 0)
		end_mode = PM_Y;
	else
		end_mode = EFF_Y;
	
	WazaDefaultPosSet2(xreg, st_mode);
	if(MineEnemyCheck(AttackNo))
		WazaEffWork[2] = -WazaEffWork[2];
	xreg->work[0] = WazaEffWork[4];
	xreg->work[2] = GetWazaEffPos(DefenceNo, PM_X) + WazaEffWork[2];
	xreg->work[4] = GetWazaEffPos(DefenceNo, end_mode) + WazaEffWork[3];
	xreg->move = W_StraightSyncMove;
	SetWorkSeq(xreg, DelWazaEffect);
}

//----------------------------------------------------------
//		※Init関数
//	自分から敵にやまなりで飛んでいく
//	offset	0:Xoffset	1:Yoffset	2:終点Xoffset	3:終点Yoffset	4:Sync回数
//			5:Y振り幅
//----------------------------------------------------------
void W_YamanariInitSeq(actWork *xreg)
{
	WazaDefaultPosSet2(xreg, PM_MODE);
	if(MineEnemyCheck(AttackNo))
		WazaEffWork[2] = -WazaEffWork[2];
	xreg->work[0] = WazaEffWork[4];
	xreg->work[2] = GetWazaEffPos(DefenceNo, PM_X) + WazaEffWork[2];
	xreg->work[4] = GetWazaEffPos(DefenceNo, PM_Y) + WazaEffWork[3];
	xreg->work[5] = WazaEffWork[5];
	YamanariMoveInit(xreg);
	xreg->move = W_YamanariSubSeq;
}

static void W_YamanariSubSeq(actWork *xreg)
{
	if(YamanariMoveMain(xreg))
		DelWazaEffect(xreg);
}

//----------------------------------------------------------
//		※Init関数
//	指定したポケモンのｵﾌｾｯﾄ間で直線移動する
//	0:始点Xoffset	1:始点Yoffset	2:終点Xoffset	3:終点Yoffset
//	4:Sync回数	5:攻撃側(0)か防御側(1)か	6:座標ﾓｰﾄﾞ(0:PMﾓｰﾄﾞ	1:EFFﾓｰﾄﾞ)
//----------------------------------------------------------
void W_OffsetSpaceMove(actWork *xreg)
{
	u8 client;
	u8 mode, mode_y;
	
	if(WazaEffWork[6] == 0)
	{
		mode = PM_MODE;
		mode_y = PM_Y;
	}
	else
	{
		mode = EFF_MODE;
		mode_y = EFF_Y;
	}
	
	if(WazaEffWork[5] == 0)
	{
		WazaDefaultPosSet2(xreg, mode);
		client = AttackNo;
	}
	else
	{
		WazaDefaultPosSet1(xreg, mode);
		client = DefenceNo;
	}
	
	if(MineEnemyCheck(AttackNo))
		WazaEffWork[2] = -WazaEffWork[2];
	
	WazaDefaultPosSet1(xreg, mode);
	xreg->work[0] = WazaEffWork[4];
	xreg->work[2] = GetWazaEffPos(client, PM_X) + WazaEffWork[2];
	xreg->work[4] = GetWazaEffPos(client, mode_y) + WazaEffWork[3];
	xreg->move = W_StraightSyncMove;
	SetWorkSeq(xreg, DelWazaEffect);
}











//======================================================================
//	ポケモンの残像アクター作成
//	which  0:攻撃側  1:防御側
//	return:  ｱｸﾀｰﾅﾝﾊﾞｰ （作成できなければ -1）
//																taya
//======================================================================
s16 W_PokeZanzouMake(u8 which)
{
	u8 actno;
	u16 i;

	actno = W_GetPokeActNo(which);
	if(actno != 0xff)
	{
		for(i = 0; i < ACT_MAX; i++){
			if(ActWork[i].act_sw == 0){
				ActWork[i] = ActWork[actno];
				ActWork[i].oamData.ObjMode = 1;
				ActWork[i].banish = 0;
				return i;
			}
		}
	}

	return -1;
}
//======================================================================
//	ポケモンの残像アクター削除
//	actor	ｱｸﾀｰｱﾄﾞﾚｽ
//======================================================================
void W_PokeZanzouDel(actWork *actor)
{
	actor->t_mode = 1;  // 本体のキャラ領域を開放させない
	DelActor(actor);
}




//=========================================================================
//
//	BLDALPHA レジスタ操作（必ず BLDALPHA_RESETを使用して終了すること）
//	0:eva 初期値  1:evb 初期値  2: eva 最終値 3: evb 最終値  4:wait
//
//	wait待ち後、eva, evb を交互に更新
//
//=========================================================================
static void TaskBldAlphaMain(u8 id);

void TaskBldAlphaCtrl(u8 id)
{
	s16 eva_diff, evb_diff;

	eva_diff = evb_diff = 0;

	if(WazaEffWork[2] > WazaEffWork[0]){
		eva_diff = 1;
	}
	if(WazaEffWork[2] < WazaEffWork[0]){
		eva_diff = -1;
	}
	if(WazaEffWork[3] > WazaEffWork[1]){
		evb_diff = 1;
	}
	if(WazaEffWork[3] < WazaEffWork[1]){
		evb_diff = -1;
	}

	TaskTable[id].work[0] = 0;              // 0:ｶｳﾝﾀ
	TaskTable[id].work[1] = WazaEffWork[4]; // 1:wait
	TaskTable[id].work[2] = 0;              // 2:どちらを更新するか？
	TaskTable[id].work[3] = WazaEffWork[0]; // 3:eva
	TaskTable[id].work[4] = WazaEffWork[1]; // 4:evb
	TaskTable[id].work[5] = eva_diff;       // 5:eva増加量
	TaskTable[id].work[6] = evb_diff;       // 6:evb増加量
	TaskTable[id].work[7] = WazaEffWork[2]; // 7:最終eva値
	TaskTable[id].work[8] = WazaEffWork[3]; // 8:最終evb値

//	*(vu16*)REG_BLDCNT = BLD_A_BLEND_MODE | BLD_2ND_ALL;
	*(vu16*)REG_BLDALPHA = (WazaEffWork[1] << 8)| WazaEffWork[0];

	TaskTable[id].TaskAdrs = TaskBldAlphaMain;
}
static void TaskBldAlphaMain(u8 id)
{
	TASK_TABLE *my = &TaskTable[id];

	if(++(my->work[0]) > my->work[1]){
		my->work[0] = 0;
		my->work[2]++;
		if(my->work[2] & 1){
			if(my->work[3] != my->work[7]){
				my->work[3] += my->work[5];
			}
		}else{
			if(my->work[4] != my->work[8]){
				my->work[4] += my->work[6];
			}
		}
		*(vu16*)REG_BLDALPHA = (my->work[4] << 8)| my->work[3];

		if(my->work[3] == my->work[7] && my->work[4] == my->work[8]){
			DelTaskEffect(id);
		}
	}
}


//=========================================================================
//	ポケモンパレットフェードタスク
//
//	0:(0:攻撃側  1:防御側  2:攻撃相方  3:防御相方） 
//	1:ﾌｪｰﾄﾞｶﾗｰ  2:最大evy値  3:wait  4:回数
//
//=========================================================================
static void TaskPokeFadeMain(u8 id);
static void FadeCtrlCommon(TASK_TABLE *task);

void TaskPokeFadeCtrl(u8 id)
{
	u16 actno;

	actno = W_GetPokeActNo(WazaEffWork[0]);
	if(actno == 0xff){
		DelTaskEffect(id);
		return;
	}

	TaskTable[id].work[0] = 256 + (ActWork[actno].oamData.Pltt * 16) + 1;  // 0:ﾊﾟﾚｯﾄﾅﾝﾊﾞｰ

	FadeCtrlCommon(&TaskTable[id]);
}
static void FadeCtrlCommon(TASK_TABLE *task)
{
	task->work[1] = WazaEffWork[1];  // 1:ﾌｪｰﾄﾞｶﾗｰ
	task->work[2] = 0;               // 2:evy値
	task->work[3] = WazaEffWork[2];  // 3:最大evy値
	task->work[4] = 0;               // 4:ｶｳﾝﾀ
	task->work[5] = WazaEffWork[3];  // 5:wait
	task->work[6] = 0;               // 6:ﾓｰﾄﾞ
	task->work[7] = WazaEffWork[4];  // 7:回数

	task->TaskAdrs = TaskPokeFadeMain;
}
static void TaskPokeFadeMain(u8 id)
{
	TASK_TABLE *my = &TaskTable[id];

	my->work[4]++;
	if(my->work[4] >= my->work[5]){
		my->work[4] = 0;
		// 増加ﾓｰﾄﾞ
		if(my->work[6] == 0){
			my->work[2]++;
			SoftFade(my->work[0], 15, my->work[2], my->work[1]);
			if(my->work[2] == my->work[3]){
				my->work[6] = 1;
			}
		// 減少ﾓｰﾄﾞ
		}else{
			my->work[2]--;
			SoftFade(my->work[0], 15, my->work[2], my->work[1]);
			if(my->work[2] == 0){
				my->work[7]--;
				if(my->work[7]){
					my->work[4] = 0;
					my->work[6] = 0;
				}else{
					DelTaskEffect(id);
				}
			}
		}
	}
}
//=========================================================================
//	キャラ指定パレットフェードタスク
//
//	0:ﾊﾟﾚｯﾄID
//	1:ﾌｪｰﾄﾞｶﾗｰ  2:最大evy値  3:wait  4:回数
//
//=========================================================================
void TaskCharFadeCtrl(u8 id)
{
	u16 pal_no;

	pal_no = ObjPalNumGet(WazaEffWork[0]);
	if(pal_no == 0xff){
		DelTaskEffect(id);
		return;
	}

	TaskTable[id].work[0] = 256 + (pal_no * 16) + 1;  // 0:ﾊﾟﾚｯﾄﾅﾝﾊﾞｰ

	FadeCtrlCommon(&TaskTable[id]);
}



/**********************************************************************/
/*  ポケモンアクター拡縮アニメ                                        */
/*                                                                    */
/*  タスクからコールすることで、ポケモンの拡縮アニメを行います。      */
/*  タスクのworkを、7～15まで使います。                               */
/*                                                                    */
/*  work[15]にポケモンのｱｸﾀｰﾅﾝﾊﾞｰが入るので参照できます。             */
/*                                                                    */
/*  SetPokeKakusyukuAnm で必要なパラメータをセット後、                */
/*  PokeKakusyukuAnm が０を返すまで呼んでください。                   */
/*                                                                    */
/*  SetPokeKakusyukuAnmで指定した拡縮アニメテーブルに ACTAF_END が    */
/*  ないと、いつまで経っても０を返さないので、呼び出し側で責任を持っ  */
/*  て PokeKakusyukuEnd を呼んでください。                            */
/*                                                                    */
/**********************************************************************/
enum {
	PKA_ANM_NO = 7,
	PKA_ANM_TIMER,
	PKA_cLOOP_CNT,
	PKA_XRATIO,
	PKA_YRATIO,
	PKA_THETA,
	PKA_ANMADRS_H,
	PKA_ANMADRS_L,
	PKA_POKE_ACTNO,
};

//==============================================
//	拡縮アニメ初期化
//	task	タスクテーブルアドレス
//	actno	ポケモンアクターナンバ
//	anm		拡縮アニメテーブルのアドレス
//==============================================
void SetPokeKakusyukuAnm(TASK_TABLE *task, u8 actno, const actAffAnm *anm)
{
	task->work[PKA_ANM_NO] = 0;
	task->work[PKA_ANM_TIMER] = 0;
	task->work[PKA_cLOOP_CNT] = 0;
	task->work[PKA_POKE_ACTNO] = actno;

	task->work[PKA_XRATIO] =  0x100;
	task->work[PKA_YRATIO] = 0x100;
	task->work[PKA_THETA] = 0;

	Divide32(&(task->work[PKA_ANMADRS_H]), &(task->work[PKA_ANMADRS_L]), (u32)anm);

	PokeKakusyukuInit(actno, 0);
}

u8 PokeKakusyukuAnm(TASK_TABLE *task)
{
	static const actAffAnm *anm = NULL;

	anm = (const actAffAnm*)Unite32(task->work[PKA_ANMADRS_H], task->work[PKA_ANMADRS_L]);
	anm += task->work[PKA_ANM_NO];

	switch(anm->rx){
	default:
		if(anm->wait == ACT_AFSET)
		{
			task->work[PKA_XRATIO] = anm->rx;
			task->work[PKA_YRATIO] = anm->ry;
			task->work[PKA_THETA] = anm->theta;
			task->work[PKA_ANM_NO]++;
			anm++;
		}

		task->work[PKA_XRATIO] += anm->rx;
		task->work[PKA_YRATIO] += anm->ry;
		task->work[PKA_THETA] += anm->theta;
		PokeKakusyukuSet(task->work[PKA_POKE_ACTNO], task->work[PKA_XRATIO], task->work[PKA_YRATIO], task->work[PKA_THETA]);
		PokeKakusyukuYHosei(task->work[PKA_POKE_ACTNO]);
		if(++(task->work[PKA_ANM_TIMER]) >= anm->wait)
		{
			task->work[PKA_ANM_TIMER] = 0;
			task->work[PKA_ANM_NO]++;
		}
		break;

	case ACT_AFLOOP:
		task->work[PKA_ANM_NO] = anm->ry;
		break;

	case ACT_AFcLOOP:
		if(anm->ry){

			if(task->work[PKA_cLOOP_CNT] == 0){
				task->work[PKA_cLOOP_CNT] = anm->ry;
			}else{
				task->work[PKA_cLOOP_CNT]--;
				if(task->work[PKA_cLOOP_CNT] == 0){
					task->work[PKA_ANM_NO]++;
					break;
				}
			}
			while(task->work[PKA_ANM_NO]){
				task->work[PKA_ANM_NO]--;
				anm--;
				if(anm->rx == ACT_AFcLOOP){
					task->work[PKA_ANM_NO]++;
					break;
				}
			}

		}else{

			task->work[PKA_ANM_NO]++;

		}
		break;

	case ACT_AFEND:
		// 終了処理は呼び出し側で行う
		ActWork[task->work[PKA_POKE_ACTNO]].dy = 0;
		PokeKakusyukuEnd(task->work[PKA_POKE_ACTNO]);
		return 0;
	}

	return 1;
}
//==============================================
//	てもちポケモンの切れ目が見えないように
//	dy 値を補正
//==============================================
static u16 get_patcnt(u8 actno);
void PokeKakusyukuYHosei(u8 pokeact)
{
	s32 dy;
	s32  height;
	u8 affno;

	height = 64 - (get_patcnt(pokeact) * 2);
	affno = ActWork[pokeact].oamData.AffineParamNo;

	dy = (height << 8) / OBJ_AffineWork[affno].V_DiffY;
	if(dy > 128){ dy = 128; }

	ActWork[pokeact].dy = (height-dy)/2;
}
void ZanzouKakusyukuYHosei(u8 zanzou_actno, u8 poke_actno)
{
	s32 dy;
	s32  height;
	u8 affno;

	height = 64 - (get_patcnt(poke_actno) * 2);
	affno = ActWork[zanzou_actno].oamData.AffineParamNo;

	dy = (height << 8) / OBJ_AffineWork[affno].V_DiffY;
	if(dy > 128){ dy = 128; }

	ActWork[zanzou_actno].dy = (height-dy)/2;

}

// ﾎﾟｹﾓﾝｱｸﾀｰのpatcnt値（画像切れ目のＹ座標）
static u16 get_patcnt(u8 actno)
{
	u16 i, monsno;
	u8 client_no;
	
	client_no = ActWork[actno].work[0];
	for(i = 0; i < CLIENT_MAX; i++)
	{
		if(PokemonStruct[i] == actno)
		{
			if(ContestCheck()){
				monsno = conpara->monsno;
				return pm2bpara[monsno].patcnt;
			}else if(MineEnemyCheck(i) == SIDE_MINE){
				if(Climem[client_no].hensin_monsno == 0)
					monsno = PokeParaGet(&PokeParaMine[SelMonsNo[i]], ID_monsno);
					//monsno = WazaEffMonsNo[i];
				else
					monsno = Climem[client_no].hensin_monsno;
				return pm2bpara[monsno].patcnt;
			}else{
				if(Climem[client_no].hensin_monsno == 0)
					monsno = PokeParaGet(&PokeParaEnemy[SelMonsNo[i]], ID_monsno);
					//monsno = WazaEffMonsNo[i];
				else
					monsno = Climem[client_no].hensin_monsno;
				return pm2fpara[monsno].patcnt;
			}
		}
	}
	return 64; // ここまで来ることはあり得ないけど、一応。
}

//==============================================================
//	32bit値を分割して、16bit値 x 2 として保存
//	dst1, dst2   保存先変数アドレス
//	val          保存する値
//==============================================================
void Divide32(s16 *dst1, s16 *dst2, s32 val)
{
	*dst1 = val & 0xffff;
	*dst2 = (val >> 16) & 0xffff;
}
//==============================================================
//	Divide32で分割保存した32bit値を取り出す
//	src1, src2   分割保存した変数
//==============================================================
s32 Unite32(s16 src1, s16 src2)
{
	return (s32)((src1 & 0xffff) | (src2 << 16));
}

/**********************************************************************/
/*  ポケモンアクター拡縮アニメ２                                      */
/*                                                                    */
/*  タスクからコールすることで、ポケモンの拡縮アニメを行います。      */
/*  初期拡縮率・最終拡縮率・必要コール数を指定することで、            */
/*  コール毎に拡縮率を加減します。                                    */
/*                                                                    */
/*  タスクのworkを、8～15まで使います。                               */
/*  ﾎﾟｹﾓﾝのｱｸﾀｰﾅﾝﾊﾞが work[15] に入るので、参照できます。             */
/*                                                                    */
/*  SetPokeKakusyukuStep で必要なパラメータをセット後、               */
/*  PokeKakusyukuStep が0を返すまで呼んでください。                   */
/*                                                                    */
/*  拡縮率を変更したまま連続使用することを前提に作っているので、      */
/*  PokeKakusyukuInit, PokeKakusyukuEnd を内部で呼びません。          */
/*  これらの関数は呼び出し側で責任を持って呼んでください。            */
/*                                                                    */
/**********************************************************************/
enum {
	PK2_CNT = 8,
	PK2_XRATIO,
	PK2_YRATIO,
	PK2_ADD_X,
	PK2_ADD_Y,
	PK2_END_X,
	PK2_END_Y,
	PK2_ACTNO,
};

void SetPokeKakusyukuStep(TASK_TABLE *task, u8 actno, s16 sx, s16 sy, s16 ex, s16 ey, u16 sync)
{
	task->work[PK2_CNT] = sync;
	task->work[PK2_ACTNO] = actno;
	task->work[PK2_XRATIO] = sx;
	task->work[PK2_YRATIO] = sy;
	task->work[PK2_END_X] = ex;
	task->work[PK2_END_Y] = ey;
	task->work[PK2_ADD_X] = (ex - sx) / sync;
	task->work[PK2_ADD_Y] = (ey - sy) / sync;
}

u8 PokeKakusyukuStep(TASK_TABLE *task)
{
	if(task->work[PK2_CNT] == 0){
		return 0;
	}

	task->work[PK2_CNT]--;
	if(task->work[PK2_CNT]){
		task->work[PK2_XRATIO] += task->work[PK2_ADD_X];
		task->work[PK2_YRATIO] += task->work[PK2_ADD_Y];
	}else{
		task->work[PK2_XRATIO] = task->work[PK2_END_X];
		task->work[PK2_YRATIO] = task->work[PK2_END_Y];
	}

	PokeKakusyukuSet(task->work[PK2_ACTNO], task->work[PK2_XRATIO], task->work[PK2_YRATIO], 0);

	if(task->work[PK2_CNT]){
		PokeKakusyukuYHosei(task->work[PK2_ACTNO]);
	}else{
		ActWork[task->work[PK2_ACTNO]].dy = 0;
	}

	return task->work[PK2_CNT];
}




//=========================================================================
//	なつき度をWazaEffWork[7]の値にセットする
// なつき度が
//	0～30なら 0をセット
//	31～100なら 1をセット
//	101～200なら 2をセット
//	201以上なら 3をセット
//=========================================================================
void NatukidoWorkSet(u8 id)
{
	u8 ret;
	
	if(WazaEffNatukido < 31)
		ret = 0;
	else if(WazaEffNatukido < 101)
		ret = 1;
	else if(WazaEffNatukido < 201)
		ret = 2;
	else
		ret = 3;
	WazaEffWork[7] = ret;
	DelTaskEffect(id);
}


//=========================================================================
//	全てのポケモンのプライオリティを設定する
//=========================================================================
void PokePriAllSet(u8 pri)
{
	if(PokeBG2taimeCheck(DefenceNo))
		ActWork[PokemonStruct[DefenceNo]].oamData.Priority = pri;
	if(PokeBG2taimeCheck(AttackNo))
		ActWork[PokemonStruct[AttackNo]].oamData.Priority = pri;
	if(PokeBG2taimeCheck(DefenceNo^2))
		ActWork[PokemonStruct[DefenceNo^2]].oamData.Priority = pri;
	if(PokeBG2taimeCheck(AttackNo^2))
		ActWork[PokemonStruct[AttackNo^2]].oamData.Priority = pri;
}


//=========================================================================
//	全てのポケモンのｿﾌﾄとﾊｰﾄﾞのプライオリティを初期化する
//=========================================================================
void PokePriAllInit(void)
{
	int i;
	
	for(i = 0; i < ClientSetMax; i++)
	{
		if(PokeBG2taimeCheck(i) == 0)
			continue;
		ActWork[PokemonStruct[i]].pri = GetPokeSoftPri(i);
		ActWork[PokemonStruct[i]].oamData.Priority = POKE_OAM_PRI;
	}
}

//----------------------------------------------------------
//	指定したｸﾗｲｱﾝﾄのﾎﾟｹﾓﾝのﾃﾞﾌｫﾙﾄのｱｸﾀｰ(ｿﾌﾄ)ﾌﾟﾗｲｵﾘﾃｨを取り出す
//----------------------------------------------------------
u8 GetPokeSoftPri(u8 client_no)
{
	u8 client_type;
	u8 pri;
	
	if(ContestCheck()){
		if(client_no == CONT_MINE_CLIENT)
			return C_POKE1PRI;
		else
			return CAI_POKE1PRI;
	}
	
	client_type = ClientTypeGet(client_no);
	if(client_type == BSS_CLIENT_MINE)
		pri = C_POKE1PRI;
	else if(client_type == BSS_CLIENT_MINE2)
		pri = C_POKE2PRI;
	else if(client_type == BSS_CLIENT_ENEMY)
		pri = CAI_POKE1PRI;
	else
		pri = CAI_POKE2PRI;
	return pri;
}

//----------------------------------------------------------
//	指定したｸﾗｲｱﾝﾄのBG落しの時のBGﾌﾟﾗｲｵﾘﾃｨを取り出す
//----------------------------------------------------------
u8 GetPokeBGPri(u8 client_no)
{
	u8 client_type;
	u8 pri;
	
	client_type = ClientTypeGet(client_no);
	if(ContestCheck())
		pri = 2;
	else{
		if(client_type == BSS_CLIENT_MINE || client_type == BSS_CLIENT_ENEMY2)
			pri = (*(vBgCnt *)REG_BG2CNT).Priority;
		else
			pri = (*(vBgCnt *)REG_BG1CNT).Priority;
	}
	return pri;
}

//----------------------------------------------------------
//	指定したｸﾗｲｱﾝﾄのBG落しの時のBGNoを取り出す
// 戻り値: BG1 = 1, BG2 = 2が戻り値として戻る
//----------------------------------------------------------
u8 GetPokeBGNo(u8 client_no)
{
	u8 client_type;
	
	if(ContestCheck())
		return 1;
	
	client_type = ClientTypeGet(client_no);
	if(client_type == BSS_CLIENT_MINE || client_type == BSS_CLIENT_ENEMY2)
		return 2;
	else
		return 1;
}

//=========================================================================
//	指定Noのﾎﾟｹﾓﾝのｱｸﾀｰを生成する
//	muki = 0:正面向き	1:後ろ向き
//	cell_type = 使用するActHeaderのﾃｰﾌﾞﾙ(0～1)同じ番号のcell_typeは一緒にはAdd出来ない
//=========================================================================
#define WAZA_EFF_POKE_TRANSADRS		0x2000000	//0x2004000
u8 WazaEffPokeActSet(u16 monsno, u8 muki, u8 cell_type, s16 x, s16 y, u8 pri, u32 personal_rnd, u32 id_no)
{
	u8 poke;
	u16 cell_no, pal_no;
	
	cell_no = CellSet(&WazaPokeCell[cell_type]);
	pal_no = ObjPalNumSet(WazaPokeHeader[cell_type].palNo);
	if(muki == 0){
		DecordPaletteWork((void*)PokePalGetPara(monsno,id_no,personal_rnd),
				16*16+16*pal_no, 0x20);
		DecordPokeCellMakeRndFB(&PM2FObjDataCell[monsno], pm2fpara[monsno].size,
				pm2fpara[monsno].patcnt, (void*)0x2000000,
				(void*)WAZA_EFF_POKE_TRANSADRS, monsno, personal_rnd, POKE_FRONT);
	}
	else{
		DecordPaletteWork((void*)PokePalGetPara(monsno,id_no,personal_rnd),
				16*16+16*pal_no, 0x20);
		DecordPokeCellMakeRndFB(&PM2BObjDataCell[monsno], pm2bpara[monsno].size,
				pm2bpara[monsno].patcnt, (void*)0x2000000,
				(void*)WAZA_EFF_POKE_TRANSADRS, monsno, personal_rnd, POKE_BACK);
	}
	DIV_DMACOPY(3, WAZA_EFF_POKE_TRANSADRS, OBJ_MODE0_VRAM+cell_no*32, 0x800, 32);

	if(muki == 0)
		poke = AddActor(&WazaPokeHeader[cell_type], x, y+pm2fpara[monsno].patcnt, pri);
	else
		poke = AddActor(&WazaPokeHeader[cell_type], x, y+pm2bpara[monsno].patcnt, pri);
	
	if(ContestCheck()){
		ActWork[poke].aff_tbl = PmAffAnmTblF2;
		ActAffAnmChg(&ActWork[poke], 0);
	}
	
	return poke;
}

//----------------------------------------------------------
//	WazaEffPokeActSetでAddしたﾎﾟｹﾓﾝをDelする
//----------------------------------------------------------
void WazaEffPokeActDel(actWork *xreg)
{
	AllDelActor(xreg);
}

static const	actHeader WazaPokeHeader[]={
	{
		CELLID_WAZAPOKE0,
		CELLID_WAZAPOKE0,
		&WazaOamDataAffine[3],
		DummyActAnmTbl,
		0,
		DummyActAffTbl,
		DummyActMove,
	},
	{
		CELLID_WAZAPOKE1,
		CELLID_WAZAPOKE1,
		&WazaOamDataAffine[3],
		DummyActAnmTbl,
		0,
		DummyActAffTbl,
		DummyActMove,
	},
};
static const CellData WazaPokeCell[] = {	//領域確保するためだけのCell定義
	{space64_Character, OBJ_SIZE16_64x64, CELLID_WAZAPOKE0},
	{space64_Character, OBJ_SIZE16_64x64, CELLID_WAZAPOKE1},
};





/*==============================================================
==  ポケモン画像の幅・高さなどを得る
==  client_no   ｸﾗｲｱﾝﾄﾅﾝﾊﾞｰ
==	mode
==			POKESIZE_HEIGHT    高さ
==			POKESIZE_WIDTH     幅
==			POKESIZE_TOP       頂点
==			POKESIZE_BOTTOM    底辺
==			POKESIZE_LEFT      左端
==			POKESIZE_RIGHT     右端
==			POKESIZE_REAL_BOTTOM  誤差なし底辺
==
==	※ 数ﾄﾞｯﾄ程度の誤差があります。大体の目安として使ってください。
==	   
==
==============================================================*/
s16 W_GetPokeSize(u8 client_no, u8 mode)
{
	u16 monsno;
	const pmPara *para;
	u16	annon_rnd;
	u32	rnd;

	if(ContestCheck()){
		if(conpara->hensin_flg){
			monsno = conpara->hensin_monsno;
			rnd = conpara->hensin_personal_rnd;
		}
		else{
			monsno = conpara->monsno;
			rnd	   = conpara->personal_rnd;
		}
		if(monsno==MONSNO_ANNOON){
			annon_rnd=(((rnd&0x03000000)>>18)|((rnd&0x030000)>>12)|((rnd&0x0300)>>6)|(rnd&0x03))%28;
			if(annon_rnd==0)
				annon_rnd=monsno;
			else
				annon_rnd+=(CELLID_pm3b_unb-1);
			para = pm2bpara+annon_rnd;
		}
		else if(monsno==MONSNO_POWARUN)
			para = PowawaParaTbl+BattlePokeAnmNo[client_no];
		else if(monsno>MONSNO_END)
			para = pm2bpara;
		else
			para = pm2bpara+monsno;
	}
	else if(MineEnemyCheck(client_no) == SIDE_MINE){
		if(Climem[client_no].hensin_monsno == 0){
			monsno = PokeParaGet(&PokeParaMine[SelMonsNo[client_no]], ID_monsno);
			rnd	   = PokeParaGet(&PokeParaMine[SelMonsNo[client_no]], ID_personal_rnd);
		}
		else{
			monsno = Climem[client_no].hensin_monsno;
			rnd    = HenshinRnd[client_no];
		}
		if(monsno==MONSNO_ANNOON){
			annon_rnd=(((rnd&0x03000000)>>18)|((rnd&0x030000)>>12)|((rnd&0x0300)>>6)|(rnd&0x03))%28;
			if(annon_rnd==0)
				annon_rnd=monsno;
			else
				annon_rnd+=(CELLID_pm3b_unb-1);
			para = pm2bpara+annon_rnd;
		}
		else if(monsno>MONSNO_END)
			para = pm2bpara;
		else
			para = pm2bpara+monsno;
	}else{
		if(Climem[client_no].hensin_monsno == 0){
			monsno = PokeParaGet(&PokeParaEnemy[SelMonsNo[client_no]], ID_monsno);
			rnd	   = PokeParaGet(&PokeParaEnemy[SelMonsNo[client_no]], ID_personal_rnd);
		}
		else{
			monsno = Climem[client_no].hensin_monsno;
			rnd	   = HenshinRnd[client_no];
		}
		if(monsno==MONSNO_ANNOON){
			annon_rnd=(((rnd&0x03000000)>>18)|((rnd&0x030000)>>12)|((rnd&0x0300)>>6)|(rnd&0x03))%28;
			if(annon_rnd==0)
				annon_rnd=monsno;
			else
				annon_rnd+=(CELLID_pm3f_unb-1);
			para = pm2fpara+annon_rnd;
		}
		else if(monsno==MONSNO_POWARUN)
			para = PowawaParaTbl+BattlePokeAnmNo[client_no];
		else if(monsno>MONSNO_END)
			para = pm2fpara;
		else
			para = pm2fpara+monsno;
	}

	switch(mode){
	case POKESIZE_HEIGHT:
		return (para->size & 0x0f) * 8;

	case POKESIZE_WIDTH:
		return ((para->size >> 4) & 0x0f) * 8;

	case POKESIZE_LEFT:
		return GetWazaEffPos(client_no,PM_X) - (((para->size >> 4) & 0x0f) * 4);

	case POKESIZE_RIGHT:
		return GetWazaEffPos(client_no,PM_X) + (((para->size >> 4) & 0x0f) * 4);

	case POKESIZE_TOP:
		return GetWazaEffPos(client_no,PM_Y) - ((para->size & 0x0f) * 4);

	case POKESIZE_BOTTOM:
		return GetWazaEffPos(client_no,PM_Y) + ((para->size & 0x0f) * 4);

	case POKESIZE_REAL_BOTTOM:
		return GetWazaEffPos(client_no,EFF_Y) + 31 - para->patcnt;
	}

	return 0;

}








//=========================================================================
//
//	1対1の時は対象のポケモンの中心座標、2対2の時は対象の2対のポケモンの間の
//	中心座標を取得する
//												by matsuda 2002.07.19(金)
//=========================================================================
//----------------------------------------------------------
//	mode:EFF_MODE or PM_MODE	xpos,ypos:結果代入先ﾜｰｸ
//----------------------------------------------------------
void GetCenterEffPos(u8 client_no, u8 mode, s16 *xpos, s16 *ypos)
{
	u8 mode_x, mode_y;
	s16 x1,x2,y1,y2;
	
	if(mode == EFF_MODE){
		mode_x = EFF_X;
		mode_y = EFF_Y;
	}
	else{
		mode_x = PM_X;
		mode_y = PM_Y;
	}
	
	x1 = GetWazaEffPos(client_no, mode_x);
	y1 = GetWazaEffPos(client_no, mode_y);
	if(FightCheck() && ContestCheck() == 0){
		x2 = GetWazaEffPos(client_no^2, mode_x);
		y2 = GetWazaEffPos(client_no^2, mode_y);
	}
	else{
		x2 = x1;
		y2 = y1;
	}

	*xpos = (x1 + x2) / 2;
	*ypos = (y1 + y2) / 2;
}





//=========================================================================
//
//		ポケモンのウィンドウOBJを生成
//												by matsuda 2002.07.25(木)
//=========================================================================
u8 PokeWinObjMake(u8 client_no, u8 pokeact, u16 monsno)
{
	u8 winact;

	winact = AddBanishActor(DummyActMove);
	ActWork[winact] = ActWork[pokeact];
	ActWork[winact].t_mode = 1;	//ｳｨﾝﾄﾞｳOBJをDelした時に本体のｷｬﾗを開放しないように
	ActWork[winact].oamData.Priority = 0;
	ActWork[winact].oamData.ObjMode = 2;	//OBJ Win
	ActWork[winact].oamData.CharNo = ActWork[pokeact].oamData.CharNo;
	ActWork[winact].move = DummyActMove;
//	ActAnmChg(&ActWork[winact], BattlePokeAnmNo[client_no]);

	return winact;
}

