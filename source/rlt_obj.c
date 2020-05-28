//========================================================================================
//								ミニゲーム・ルーレットのOBJ
//									2002/03/28 by nakahiro
//========================================================================================
#include "common.h"
#include "intr.h"
#include "actor.h"
#include "actanm.h"
#include "palanm.h"
#include "task.h"
#include "MaDefine.h"
#include "calctool.h"
#include "mus_tool.h"
#include "roulette.h"
#include "rlt_obj.h"
#include "monsno.def"

#include "../scaddata/rlt_obj.acl"
#include "../scaddata/rlt_ball.ach"
#include "../scaddata/rlt_ev00.ach"
#include "../scaddata/rlt_shadow.ach"
//========================================================================================
//										シンボル
//========================================================================================

//========================================================================================
//									プロトタイプ宣言
//========================================================================================
static u8 AddRotateObj( const actHeader *, u8, u16 * );	// 回転OBJセット

static void RotatePokeActMove( actWork * act );	// ルーレット盤のポケモン回転処理
static void RotateCtblActMove( actWork * act );	// センターテーブルの回転

//アクターシーケンス
static void BallMoveAct_END(actWork *act);		//ボールがとまったとき
static void BallEv0_ST00(actWork *act);			//ボールがスタックしたとき
void Bg1_ScrollActMove1(actWork *act);

//イベント用
static void StackEventInit(actWork* act);
static void AddEventCharObj00(actWork *act);
static void AddEventCharObj01(actWork *act);
static void Ev0_MoveAct00(actWork *act);
static void Ev1_MoveAct00(actWork *act);

//========================================================================================
//									グローバル変数
//========================================================================================
#include "rlt_com.dat"
#include "rlt_obj.dat"

extern RLT_TABLE_PARAM	g_table[];	//卓のパラメータ
//========================================================================================
//									全OBJ共通処理
//========================================================================================
//--------------------------------------
//		ルーレットOBJパレット設定
//--------------------------------------
void RouletteObjPal( u8 flg )
{
	if( flg == 0 ){	//登録
		ObjPalManInit();
		ObjPalSets( (PalData *)&rlt_obj_Pal );

		//転送アクター用データをワークに展開
		LZ77UnCompWram((void *)rlt_event_LZ	,(void *)OBJ_EVPOKE_ADRS);
		LZ77UnCompWram((void *)rlt_ball_LZ	,(void *)OBJ_BALL_ADRS);
		LZ77UnCompWram((void *)rlt_shadow_LZ,(void *)OBJ_SHADOW_ADRS);
	}
	else{	//削除
		ObjPalManInit();
	}
}


//========================================================================================
//						回転OBJ共通処理（ルーレット盤のポケモン）
//========================================================================================
//-------------------------
//		回転OBJセット
//-------------------------
static u8 AddRotateObj( const actHeader * header, u8 width, u16 * angle )
{
	u8	id = 0;
	u8	pri = header->oamData_p->VPos;

	//オブジェクトをシステムに追加
	//OAMデータのVPositionをOBJプライオリティに適用している
	id = AddActor( header, CENTER_X_OBJ, CENTER_Y_OBJ,pri);
	ActWork[id].work[ ACT_ANGLE ] = *angle;		//ロットの初期値をセット
	ActWork[id].work[ ACT_WIDTH ] = width;		//トランスの初期値をセット
	ActWork[id].scr = 1;
	ActWork[id].anm_pause = 1;
	ActWork[id].aff_pause = 1;
	*angle += ANGLE_SPACE;		//rotに隣のOBJとの角度差を足す

	//Rotが360を超えたらリセット
	if( *angle >= THETA_360_DEF )	*angle -= THETA_360_DEF;

	return id;
}


//========================================================================================
//								賭けテーブルのポケモン
//========================================================================================
//--------------------------------
//		ポケモンマークセット
//--------------------------------
/*
	● | ▲ | ■ | ×
	0  | 09 | 06 | 03
	04 | 01 | 10 | 07
	08 | 05 | 02 | 10
	の順で表示する
*/
void AddRoulettePokeWinOBJ(void)
{
	u8	i,j;
	u8	dy;
	u8	id = 0;
	CellData	cell;
	
	//セルセット1
	LZ77UnCompWram(rlt_wPokeCell.ch_data,(void *)UserWork);
	cell.ch_data = (void *)UserWork;
	cell.size	 = rlt_wPokeCell.size;
	cell.act_num = rlt_wPokeCell.act_num;
	CellSet(&cell);

	//セルセット２
	LZ77UnCompWram(rlt_wPoke2Cell.ch_data,(void *)UserWork);
	cell.ch_data = (void *)UserWork;
	cell.size	 = rlt_wPoke2Cell.size;
	cell.act_num = rlt_wPoke2Cell.act_num;
	CellSet(&cell);
	
	//賭けテーブルのポケモンOBJはActorIDを保存しておく
	for( i=0; i<3; i++ ){
		dy = i*24;
		for( j=0; j<4; j++ ){
			id = MG_RLT->act_id[ WIN_POKE00+i*4+j ] =
				AddActor( &normal2_poke_Header[j], 148+j*24,92 + dy, PRI_WINPOKE );

			ActWork[id].anm_pause = 1;
			dy += 24;
			if(dy >= 24*3) dy = 0;
		}
	}
	//横一列
	for(i = 0;i < 4;i++){
		id = MG_RLT->act_id[ WIN_POKE12+i] = 
			AddActor( &normal_poke_Header[i],148+24*i,70,PRI_WINPOKE);
		ActWork[id].anm_pause = 1;
	}
	//縦一列
	for(i = 0;i < 3;i++){
		id = MG_RLT->act_id[ WIN_POKE16+i] = 
			AddActor( &normal_poke_Header[4+i],126,92+24*i,PRI_WINPOKE);
		ActWork[id].anm_pause = 1;
	}
}


//--------------------------------
//		ポケモンマーク削除
//--------------------------------
void DelRoulettePokeWinOBJ(void)
{
	u8	i;

	for( i=0; i<12; i++ )
		DelActor( &ActWork[ MG_RLT->act_id[ WIN_POKE00+i ] ] );
}

//----------------------------------
//		ポケモンマーク表示切替
//----------------------------------
/*
	u8	flg ==  1	すべてを消す
				0	ヒットしているポケモンだけ消す
	u8	no		最後にヒットしたセルのビットナンバー
*/
void BanishRoulettePokeControl( u8 flg ,u8 no)
{
	u8	i;

	switch(flg)
	{
	case 1:
		//すべてのウィンドウポケモンオブジェクトを消す
		for(i = 0;i < WIN_OBJ_NUM;i++)
			ActWork[MG_RLT->act_id[WIN_POKE00+i]].banish = 1;
		return;		
	case 0:	//ヒットしているポケモンだけ消す
		for( i=0; i< RLT_CELL_MAX; i++ ){
			if( ( MG_RLT->rlt_hp & g_rltCell[i].ui_flg) != 0)
			{
				if(g_rltCell[i].uc_bit != no)
					ActWork[ MG_RLT->act_id[ WIN_POKE00+i ] ].banish = 1;
				else
					ActWork[ MG_RLT->act_id[ WIN_POKE00+i ] ].banish = 0;
			}
			else	//ヒットしていないとき
			{
				ActWork[ MG_RLT->act_id[ WIN_POKE00+i ] ].banish = 0;
			}
		}
		//縦横表示のポケモンはON
		for(;i< WIN_OBJ_NUM;i++)
			ActWork[ MG_RLT->act_id[ WIN_POKE00+i]].banish = 0;
		break;	
	}
}

//========================================================================================
//								ボールが落ちたセルの表示
//========================================================================================
//--------------------------------
//		ベットテーブル用ボールセット
//--------------------------------
/*----------------------------------------
	ボールが落ちたセルの表示用、ボールオブジェクト作成

	void AddSTCellObj(void);
-----------------------------------------*/
void AddSTCellObj(void)
{
	u8	i = 0;
	
	//ベットテーブル用ボールオブジェクトはActorIDを保存しておく
	for(i = 0;i < RLT_BET_MAX;i++)
	{
		MG_RLT->act_id[ RLT_STCELL00 + i] = 
				AddActor( &rlt_ball_Header,92+24,20,PRI_STCELL);

		ActWork[MG_RLT->act_id[ RLT_STCELL00 + i]].banish = 1;
		ActWork[MG_RLT->act_id[ RLT_STCELL00 + i]].work[0] = 1;
		ActWork[MG_RLT->act_id[ RLT_STCELL00 + i]].move = Bg1_ScrollActMove;

		//表示プライオリティ変更
		ActWork[MG_RLT->act_id[ RLT_STCELL00 + i]].oamData.Priority = 1;
		
		//アニメーションは8パターン目
		ActAnmChg(&(ActWork[MG_RLT->act_id[RLT_STCELL00 + i]]),8);
	}
	return;
}

//--------------------------------------------------
//		ベットテーブル用ボールオブジェクト表示切替
//--------------------------------------------------
/*	
	u8	flg ==  0	消す
				1	すでに落ちた場所に表示
				2	最後に落ちた場所以外を表示
*/
void BanishSTCellControl( u8 flg,u8 no)
{
	u8	i = 0;
	
	//消すとき
	if(flg){
		for(i = 0;i < RLT_BET_MAX;i++){
			ActWork[MG_RLT->act_id[RLT_STCELL00+i]].banish = 1;
		}
		return;
	}

	//表示するとき
	for(i = 0;i < RLT_BET_MAX;i++)
	{
		if(MG_RLT->hit_cell[i] == 0 || i == no){
			ActWork[MG_RLT->act_id[RLT_STCELL00+i]].banish = 1;
			continue;
		}
		
		ActWork[MG_RLT->act_id[RLT_STCELL00+i]].banish = 0;
		ActWork[MG_RLT->act_id[RLT_STCELL00+i]].x = 
			(g_rltBet[MG_RLT->hit_cell[i]].posx + 1)*8 + 4;
		ActWork[MG_RLT->act_id[RLT_STCELL00+i]].y = 
			(g_rltBet[MG_RLT->hit_cell[i]].posy + 1)*8 + 3;
	}
}

void BanishWakuControl(u8 no)
{
	if(no == 0){
		ActWork[MG_RLT->act_id[RLT_WAKU]].banish = 1;
		return;
	}
	
	//表示
	ActWork[MG_RLT->act_id[RLT_WAKU]].banish = 0;
	ActWork[MG_RLT->act_id[RLT_WAKU]].x = (g_rltBet[no].posx+2)*8;
	ActWork[MG_RLT->act_id[RLT_WAKU]].y = (g_rltBet[no].posy+2)*8;
}
//=======================================================================================
//							ルーレット盤のポケモン
//=======================================================================================
//----------------------------------------
//		ルーレット盤のポケモンセット
//----------------------------------------
void AddRotatePokeOBJ(void)
{
	u8	i,j,id = 0;
	u16	angle;

	//セルセット
	CellData	cell;

	//圧縮データを展開
#if 0
	for(i = 0;i < 4;i ++){
		LZ77UnCompWram(rlt_rPokeCell[i].ch_data,(void*)UserWork);
		cell.ch_data = (void *)UserWork;
		cell.size	 = rlt_rPokeCell[i].size;
		cell.act_num = rlt_rPokeCell[i].act_num;
		CellSet(&cell);
	}
#else
	LZ77UnCompWram(rlt_rPokeCell.ch_data,(void*)UserWork);
	cell.ch_data = (void *)UserWork;
	cell.size	 = rlt_rPokeCell.size;
	cell.act_num = rlt_rPokeCell.act_num;
	CellSet(&cell);
#endif	
	
	angle = INIT_ANGLE;	//アングルは初期角度と隣のOBJとの角度差
	if(angle >= THETA_360_DEF)	angle -= THETA_360_DEF;

	//POKE_WIDTH = ポケモンのルーレット版からのおふせっと
	for( i=0; i<3; i++ ){
		for( j=0; j<4; j++ )
		{
			id = MG_RLT->act_id[RLT_RPOKE00 + i*4+j] = 
				AddRotateObj( &rotate_poke_Header[i*4+j], POKE_WIDTH, &angle );
			ActWork[id].anm_pause = 1;
			ActWork[id].aff_pause = 1;
		}
	}
}

//--------------------
//		ルーレット盤ポケモンOBJの回転処理
//--------------------
static void RotatePokeActMove( actWork * act )
{
	s16	sin,cos;
	s16	angle;
	u8	affNo;

	//ルーレット盤のRotとアクターOBJのRotのオフセットを足し合わせている
	angle = MG_RLT->bg_rotate + act->work[ ACT_ANGLE ];
	if(	angle >= THETA_360_DEF )	angle -= THETA_360_DEF;
	
	//盤の上の回転運動
	sin = Sin_360_Get( (u16)angle );
	cos = Cos_360_Get( (u16)angle );
	//回転の中心からのオフセットを取っている
	act->dx = (  sin * act->work[ ACT_WIDTH ] ) >> 12;
	act->dy = ( -cos * act->work[ ACT_WIDTH ] ) >> 12;

	//オブジェクトの回転処理
	affNo = act->oamData.AffineParamNo;
	sin = (s16)(((s32)sin * FF_MAG1000)/0x100);
	OBJ_AffineWork[ affNo ].H_DiffX = 
	OBJ_AffineWork[ affNo ].V_DiffY = (s16)(((s32)cos * FF_MAG1000)/0x100);
	OBJ_AffineWork[ affNo ].V_DiffX =  sin;
	OBJ_AffineWork[ affNo ].H_DiffY = -sin;
}


//========================================================================================
//								BG1_Window表示OBJ
//========================================================================================
void AddBg1OBJ(void)
{
	u8	i;

	//セル登録
	CellData	cell;
	for(i = 0;i < 5;i++){
		LZ77UnCompWram(rlt_bgoCell[i].ch_data,UserWork);
		cell.ch_data = UserWork;
		cell.size	 = rlt_bgoCell[i].size;
		cell.act_num = rlt_bgoCell[i].act_num;
		CellSet(&cell);
	}
	
	//クレジットウィンドウ
	MG_RLT->act_id[WIN_COIN] = AddActor(&(rlt_coin_Header[0]),208,16,PRI_WIN);
	ActWork[MG_RLT->act_id[WIN_COIN]].anm_pause = 1;
	
	//クレジットウィンドウの数字
	for(i = 0;i < 4;i++){
		MG_RLT->act_id[WIN_COIN00+i] = 
			AddActor( &(rlt_coin_Header[1]),196+i*8,24,PRI_NUM);
		ActWork[ MG_RLT->act_id[WIN_COIN00 +i] ].banish = 1;
		ActWork[ MG_RLT->act_id[WIN_COIN00 +i] ].anm_pause = 1;
	}
	
	//オッズ表示
	MG_RLT->act_id[WIN_ODDS] = AddActor(&rlt_odds_Header,120,68,PRI_WIN);
	ActWork[MG_RLT->act_id[WIN_ODDS]].anm_pause = 1;

	//残りの玉表示
	for(i = 0;i < 3;i++){
		MG_RLT->act_id[WIN_BALL00+i] = 
			AddActor( &rlt_restball_Header,192+i*16,36,PRI_WIN);
		ActWork[ MG_RLT->act_id[WIN_BALL00 + i] ].banish = 1;
		ActWork[ MG_RLT->act_id[WIN_BALL00 + i] ].anm_pause = 1;
	}

	//枠
	MG_RLT->act_id[RLT_WAKU] = AddActor(&rlt_waku_Header,152,96,PRI_WAKU);
	ActWork[MG_RLT->act_id[RLT_WAKU]].oamData.Priority = 1;
	ActWork[MG_RLT->act_id[RLT_WAKU]].anm_pause = 1;
	ActWork[MG_RLT->act_id[RLT_WAKU]].banish = 1;
}

//コインの表示コントロール
void DrawCoinControl(u16 coin)
{
	u16	p=1000;
	u8	i,no,flg=0;

//	coin = Fld.my_coin;

	for( i=0; i<4; i++ ){
		no = coin / p;
		//非表示
		ActWork[ MG_RLT->act_id[WIN_COIN00+i] ].banish = 1;
		if( no != 0 || flg != 0 || i == 3 ){
			ActWork[ MG_RLT->act_id[WIN_COIN00+i]].banish = 0;
			ActWork[ MG_RLT->act_id[WIN_COIN00+i]].oamData.CharNo =
				ActWork[ MG_RLT->act_id[WIN_COIN00+i]].char_num + 
				(u16)(ActWork[ MG_RLT->act_id[WIN_COIN00+i]].anm_tbl)[0][no].pat;
			flg = 1;
		}
		coin %= p;
		p /= 10;
	}
}
////////////////////////////////////////////////////
//オッズの表示コントロール
/*-----------------------------------------------
	指定セルのオッズを返す

	static u8 GetOddsNoPreCell(u8 no);

	u8	no	指定するテーブルセルナンバー
--------------------------------------------------*/
static u8 GetOddsNoPreCell(u8 no)
{
	u8	oddsTbl[5] = {0,1,2,3,4};

	if(no > 19) no = 0;
	
	switch(g_rltBet[no].odds)
	{
	case 3:		//色賭けのセル場合
		no = no /5-1;
		if(MG_RLT->hit_hLine[no] >= 4) return 0;
		
		return oddsTbl[MG_RLT->hit_hLine[no]+1];
	case 4:		//種類賭けのセルの場合
		no = no-1;
		if(MG_RLT->hit_vLine[no] >= 3) return 0;
		return oddsTbl[MG_RLT->hit_vLine[no]+2];
		break;
	case 12:	//単体に賭けた場合
		if(MG_RLT->rlt_hp & g_rltBet[no].flg) return 0;
		return oddsTbl[4];
	default:
		return 0;
	}
}
//引数：現在選択されているセルナンバー
void DrawOddsControl(u8 no)
{
	actWork *act = &(ActWork[MG_RLT->act_id[WIN_ODDS]]);
	//現在のオッズのアニメーションナンバーを求める
	act->anm_offs = GetOddsNoPreCell(no);
	act->oamData.CharNo = act->char_num + 
		(u16)(act->anm_tbl)[0][act->anm_offs].pat;
}

//////////////////////////////////////////////////////
//残りの玉表示
//引数：残りの玉数
void DrawRestballControl(u8 num)
{
	u8	i = 0,ofs = 0;
	
	if(MG_RLT->uc_rate == 1){
		ofs = 2;
	}
	switch(num)
	{
	case 6:
		for(i = 0;i < 3;i++){
			ActWork[ MG_RLT->act_id[ WIN_BALL00+i] ].banish = 0;
			ActWork[ MG_RLT->act_id[ WIN_BALL00+i]].oamData.CharNo =
				ActWork[ MG_RLT->act_id[WIN_BALL00+i]].char_num + 
				(u16)(ActWork[ MG_RLT->act_id[WIN_BALL00+i]].anm_tbl)[0][0].pat;
		}
		return;
	case 5:
		ActWork[ MG_RLT->act_id[ WIN_BALL02]].oamData.CharNo =
			ActWork[ MG_RLT->act_id[WIN_BALL02]].char_num + 
			(u16)(ActWork[ MG_RLT->act_id[WIN_BALL02]].anm_tbl)[0][1+ofs].pat;
		return;
	case 4:
		ActWork[ MG_RLT->act_id[ WIN_BALL02]].oamData.CharNo =
			ActWork[ MG_RLT->act_id[WIN_BALL02]].char_num + 
			(u16)(ActWork[ MG_RLT->act_id[WIN_BALL02]].anm_tbl)[0][2+ofs].pat;
		return;
	case 3:
		ActWork[ MG_RLT->act_id[ WIN_BALL01]].oamData.CharNo =
			ActWork[ MG_RLT->act_id[WIN_BALL01]].char_num + 
			(u16)(ActWork[ MG_RLT->act_id[WIN_BALL01]].anm_tbl)[0][1+ofs].pat;
		return;
	case 2:
		ActWork[ MG_RLT->act_id[ WIN_BALL01]].oamData.CharNo =
			ActWork[ MG_RLT->act_id[WIN_BALL01]].char_num + 
			(u16)(ActWork[ MG_RLT->act_id[WIN_BALL01]].anm_tbl)[0][2+ofs].pat;
		return;
	case 1:
		ActWork[ MG_RLT->act_id[ WIN_BALL00]].oamData.CharNo =
			ActWork[ MG_RLT->act_id[WIN_BALL00]].char_num + 
			(u16)(ActWork[ MG_RLT->act_id[WIN_BALL00]].anm_tbl)[0][1+ofs].pat;
		return;
	case 0:
	default:
		for(i = 0;i < 3;i++){
			ActWork[ MG_RLT->act_id[ WIN_BALL00+i]].oamData.CharNo =
				ActWork[ MG_RLT->act_id[WIN_BALL00+i]].char_num + 
				(u16)(ActWork[ MG_RLT->act_id[WIN_BALL00+i]].anm_tbl)[0][2+ofs].pat;
		}
		return;
	}
}

/////////////////////////////////////////////////
//スクリーンスクロール制御

//BG1のスクロールに依存
void Bg1_ScrollActMove(actWork *act)
{
	act->dx = MG_RLT->bg1_scrX;
}

//========================================================================================
//										玉が入る場所
//========================================================================================
//---------------------
//		AddActorｰセンターテーブル
//---------------------
void AddBallHoleObj(void)
{
	u8 id;
	CellData	cell;
	
	//センターテーブル 
	LZ77UnCompWram(rlt_ctblCell.ch_data,(void *)UserWork);
	cell.ch_data = (void *)UserWork;
	cell.size	 = rlt_ctblCell.size;
	cell.act_num = rlt_ctblCell.act_num;
	CellSet(&cell);

	id = AddActor(&rlt_ctbl_Header,CENTER_X_OBJ,CENTER_Y_OBJ,PRI_CTBL);
	
	ActWork[id].work[ ACT_ANGLE ] = MG_RLT->bg_rotate;		//ロットの初期値をセット
	ActWork[id].work[ ACT_WIDTH ] = 0;		//トランスの初期値をセット
	ActWork[id].anm_pause = 1;
	ActWork[id].aff_pause = 1;
	ActWork[id].scr = 1;

	return;
}

/*-------------------------------------------
	センターテーブルOBJの回転処理

	FileLocal
	static void RotateCtblActMove(actWork *act);
---------------------------------------------*/
static void RotateCtblActMove(actWork* act)
{
	u8	affNo;

	//オブジェクトの回転処理
	affNo = act->oamData.AffineParamNo;

	OBJ_AffineWork[ affNo ].H_DiffX =
	OBJ_AffineWork[ affNo ].V_DiffY = MG_RLT->bg_sPa;
	OBJ_AffineWork[ affNo ].V_DiffX = MG_RLT->bg_sPb;
	OBJ_AffineWork[ affNo ].H_DiffY = MG_RLT->bg_sPc;
	return;
}

//========================================================================================
//										玉
//========================================================================================
//------------------------
//		AddActor-ボール
//------------------------
void AddBallObj(void)
{
	u8	i;

	for(i = 0;i < RLT_BALL_MAX;i++)
	{
		MG_RLT->act_id[RLT_BALL0 + i] =		//ID保存 
			AddActor(&rlt_ball_Header,RLT_BALL_X,RLT_BALL_Y,PRI_BALL+(RLT_BALL_MAX-1-i));
		if(MG_RLT->act_id[RLT_BALL0 + i] != ACT_MAX)
		{
			ActWork[MG_RLT->act_id[RLT_BALL0 + i]].banish = 1;	//今は非表示
			ActWork[MG_RLT->act_id[RLT_BALL0 + i]].scr = 1;		//スクリーンスクロール依存
		}
	}
}

/*------------------------------------------------
	ボール6個のパラメーターをクリアする
	
	global
	void G_BallParamClear(void);
--------------------------------------------------*/
void G_BallParamClear(void)
{
	u8 i,no,ct;

	no = MG_RLT->act_id[RLT_BALL0];
	for(i = 0;i < RLT_BALL_MAX;i++)
	{
		ActWork[no].banish = 1;		//非表示
		ActWork[no].move = DummyActMove;		//動きません
		ActAnmChg(&(ActWork[no]),0);			//アニメチェンジ
		
		//ワークの初期化
		for(ct = 0;ct < 8;ct++)
			ActWork[no].work[ct] = 0;
	
		no++;
	}
	return;
}

//////////////////////////////////////////////////
//	ボールの動作関数
/////////////////////////////////////////////////
#define BGROT_BIG	(0x0001)
#define BGROT_MIN	(0x0000)

#define GetBallAngle(angle,act){									\
	(angle) = (act)->work[BALL_R]+BALL_OFS_R;						\
	if((angle) < 0) (angle) += THETA_360_DEF;						\
	else if((angle) >= THETA_360_DEF) (angle) -= THETA_360_DEF;		\
}

/*----------------------------------------------
	現在のボールのROTと、盤のROTとの差を返す
	アクターワークにも同時に返す

	s16	Get_B2B_RotDiff(actWork *act);
-------------------------------------------------*/
s16	Get_B2B_RotDiff(actWork *act)
{
	if(MG_RLT->bg_rotate > act->work[BALL_R])
	{
		act->work[BGROT_OFS] = 
			THETA_360_DEF - MG_RLT->bg_rotate + act->work[BALL_R] ;
		
		if(act->work[BGROT_OFS] >= THETA_360_DEF)
			act->work[BGROT_OFS] -= THETA_360_DEF;
	}
	else{
		act->work[BGROT_OFS] = act->work[BALL_R]-MG_RLT->bg_rotate;
	}
	
	return	act->work[BGROT_OFS];
}

/*-----------------------------------------------
	現在のボールのROTと、盤のROTから、
	現在ボールがいるセルナンバーを返す

	u8	GetBallExistCell(actWork *act);
-------------------------------------------------*/
u8	GetBallExistCell(actWork *act)
{
	s16 rot;
	
	rot = Get_B2B_RotDiff(act);	//BGとボールとのROTのオフセットを求める
	MG_RLT->ball.uc_cell = (u8)((float)rot/30.0f);

	return MG_RLT->ball.uc_cell;
}

/*-----------------------------------------------
	盤とボールの同期に必要な、Syncオフセットを求める

	s16	Get_B2B_SyncOfs(actWork *act);
-------------------------------------------------*/
s16 Get_B2B_SyncOfs(actWork *act)
{
	s16	ofs;

	//盤とのROT差から、オフセットを求める
	ofs = (Get_B2B_RotDiff(act)%30);	//0-29

	if(ofs == 14){
		act->work[BALL_TIME] = 0;
		return 0;		//ぴったりセルの真ん中
	}
	
	if(ofs < 14){	//0から13の時は、14までずらす
		ofs = 14 - ofs;
	}
	else{	//15以上
		ofs = 29 - ofs + 14;	//29-16,16-29,
	}
	act->work[BALL_TIME] = ofs;
	return ofs;
}

/*-----------------------------------------------
	ボールの半径を適用した円運動

	FileLocal
	static void RotateBallMove(actWork *act)
--------------------------------------------------*/
static void RotateBallMove(actWork* act)
{
	s16	sin,cos;
	
	//盤の上の回転運動
	MG_RLT->ball.frv += MG_RLT->ball.fra;
	MG_RLT->ball.fr += MG_RLT->ball.frv;

	if( MG_RLT->ball.fr >= (float)THETA_360_DEF )
		MG_RLT->ball.fr -= (float)THETA_360_DEF;
	else if(MG_RLT->ball.fr < 0.0f)
		MG_RLT->ball.fr += (float)THETA_360_DEF;
	
	act->work[BALL_R] = (s16)(MG_RLT->ball.fr);

	//半径の計算
	MG_RLT->ball.fwv += MG_RLT->ball.fwa;
	MG_RLT->ball.fw += MG_RLT->ball.fwv;
	act->work[BALL_W] = (s16)MG_RLT->ball.fw;

	sin = Sin_360_Get( (u16)act->work[BALL_R] );
	cos = Cos_360_Get( (u16)act->work[BALL_R] );

	//回転の中心からのオフセットを取っている
	act->dx = (  sin * act->work[ BALL_W ] ) >> 12;
	act->dy = ( -cos * act->work[ BALL_W ] ) >> 12;

	if(SeEndCheck()){
		m4aMPlayPanpotControl( &m4a_mplay001, 0xffff, act->dx);
		m4aMPlayPanpotControl( &m4a_mplay002, 0xffff, act->dx);
	}
	return;
}

//ボールが完全にとまるときに呼ぶ
#define BallMoveEnd(act)											\
{																	\
	MG_RLT->ball.uc_flg = 0xFF;										\
	MG_RLT->ev_bact = 0;											\
	ActAnmChg((act),3+(act)->anm_offs);								\
	GetBallExistCell((act));										\
	(act)->work[BALL_W] = 24+6;										\
	Get_B2B_RotDiff((act));											\
	(act)->work[BGROT_OFS] = ((act)->work[BGROT_OFS]/30)*30+15;		\
	(act)->move = BallMoveAct_END;									\
	m4aSongNumStartOrChange(SE_HASHI);								\
}

////////////////////////////////////////////////////////////
///	ボールの アクターシーケンス
/////////////////////////////////////////////////////////////
/*------------------------------------------------
	ボールの動き(もう、決定)
	盤と同期して回転運動

	static void BallMoveAct_END(actWork *act);
--------------------------------------------------*/
void BallMoveAct_END(actWork *act)
{
	s16	sin,cos;
	
	//盤と同期しての回転運動
	act->work[BALL_R] = MG_RLT->bg_rotate + act->work[BGROT_OFS];
	if(act->work[BALL_R] >= 360)	act->work[BALL_R] -= 360;
	
	sin = Sin_360_Get( (u16)act->work[BALL_R] );
	cos = Cos_360_Get( (u16)act->work[BALL_R] );

	//回転の中心からのオフセットを取っている
	act->dx = (  sin * act->work[ BALL_W ] ) >> 12;
	act->dy = (( -cos * act->work[ BALL_W ] ) >> 12)+ActOY;

	return;
}

/*--------------------------------------------------
	スタックイベント00_1

	static void BallEv0_ST01(actWork *act);
----------------------------------------------------*/
static void BallEv0_ST01(actWork *act)
{
	RotateBallMove(act);

	act->work[BALL_TIME]++;
	
	//画面外表示防止
	if(act->work[BALL_W] > 80 || act->work[BALL_W] < -132){
		act->banish = 1;
	}	
	else
		act->banish = 0;
	
	//スタート直後に終了フラグがたつのを防止
	if(act->work[BALL_TIME]  < 30) return;
	
	if(act->work[BALL_FLG] == 0)
	{
		if(MG_RLT->ball.fw <= (MG_RLT->ball.fwo-2)){
			BallMoveEnd(act);
			MG_RLT->ball.fwa = MG_RLT->ball.fwv = 0;
			MG_RLT->ball.frv = -1.0f;
		}
	}
	else{
		if(MG_RLT->ball.fw >= (MG_RLT->ball.fwo-2)){
			BallMoveEnd(act);
			MG_RLT->ball.fwa = MG_RLT->ball.fwv = 0;
			MG_RLT->ball.frv = -1.0f;
		}
	}
}
/*------------------------------------------------
	スタックイベント00_0

	static void BallEv0_ST00(actWork *act);
--------------------------------------------------*/
static void BallEv0_ST00(actWork *act)
{
	float v0 = 0,t0 = 0,t = 0;
	
	RotateBallMove(act);

	switch(act->work[BALL_R])
	{
	case 0:
		if(act->work[BALL_FLG] == 1) return;
		
		t0 = (float)act->work[BALL_WORK];	//何セル先に落とすか？
		t = t0*g_table[MG_RLT->rlt_ver].uc_rBase+
			(g_table[MG_RLT->rlt_ver].uc_rBaseH-1);
		v0 = (t0/g_table[MG_RLT->rlt_ver].ev[0].prm2);
		break;
	case 180:
		if(act->work[BALL_FLG] == 0) return;

		t0 = (float)(act->work[BALL_WORK]);	//何セル先に落とすか？
		t = t0*g_table[MG_RLT->rlt_ver].uc_rBase+
			(g_table[MG_RLT->rlt_ver].uc_rBaseH-1);
		v0 = -(t0/g_table[MG_RLT->rlt_ver].ev[0].prm2);
		break;
	default:
		return;
	}
	MG_RLT->ball.fwo = MG_RLT->ball.fw;
	MG_RLT->ball.fwv = v0;
	MG_RLT->ball.fwa = -( (2*v0/t ) + (2 / (t*t)));
	MG_RLT->ball.frv = 0.0f;
	act->anm_pause = 0;
	act->anm_no = 0;
	act->anm_sw = 1;
	act->anmend_sw = 0;
	act->move = BallEv0_ST01;
	act->work[BALL_TIME] = 0;
	return;
}

/*------------------------------------------------
	スタックイベント01_2

	スバメに持ち上げられる,
	持ち上げられたあと、タイムが来るまで待機
	
	static void BallEv1_ST02(actWork *act);
--------------------------------------------------*/
static void BallEv1_ST02(actWork *act)
{
	//落下運動
	act->dy = (short)(0.05f*act->work[BALL_TIME]*act->work[BALL_TIME])-45;
	act->work[BALL_TIME]++;

	if(act->work[BALL_TIME] < 30 ) return;
	if(act->dy < 0) return;

	//オフセットYが0になったら
	BallMoveEnd(act);

	//イベント終了フラグを立てる
	MG_RLT->ev_end = 1;
}

/*------------------------------------------------
	スタックイベント01_1

	スバメに持ち上げられる,
	持ち上げられたあと、タイムが来るまで待機
	
	static void BallEv1_ST01(actWork *act);
--------------------------------------------------*/
static void BallEv1_ST01(actWork *act)
{
	if(act->work[BALL_TIME]++ < 45)
	{
		act->dy--;

		if(act->work[BALL_TIME] != 45) return;
		if(ActWork[MG_RLT->act_id[EV_POKE]].anm_offs == 1) act->dy++;

		return;
	}

	//持ち上げられたあと、タイムが来るまで上下
	if(act->work[BALL_TIME] < act->work[BALL_WORK]){
		if( ActWork[MG_RLT->act_id[EV_POKE]].anm_wait != 0) return;
		
		if(ActWork[MG_RLT->act_id[EV_POKE]].anm_offs == 1)	act->dy++;
		else												act->dy--;

		return;
	}

	//タイムアップしたら、落下運動
	act->anm_pause = 0;
	act->anm_no = 1;
	act->anm_sw = 1;
	act->anmend_sw = 0;
	act->work[BALL_TIME] = 0;
	act->move = BallEv1_ST02;

	m4aSongNumStart(SE_NAGERU);
}

/*------------------------------------------------
	スタックイベント01_0

	static void BallEv1_ST00(actWork *act);
--------------------------------------------------*/
static void BallEv1_ST00(actWork *act)
{
	RotateBallMove(act);

	switch(act->work[BALL_R])
	{
	case 90:
		if(act->work[BALL_FLG] == 1) return;
		act->move = BallEv1_ST01;
		act->work[BALL_TIME] = 0;
		break;
	case 270:
		if(act->work[BALL_FLG] == 0) return;
		act->move = BallEv1_ST01;
		act->work[BALL_TIME] = 0;
		break;
	default:
		return;
	}
}
/*------------------------------------------------
	ボールの動き
	スタックイベント稼動

	static void BallMoveAct_EvInit(actWork *act)
--------------------------------------------------*/
static void BallMoveAct_EvInit(actWork *act)
{
	//ボールの動き
	RotateBallMove(act);
	
	switch(MG_RLT->ev_no)
	{
	default:		
	case 0:		//イベントナンバー０
		AddEventCharObj00(act);
		act->move = BallEv0_ST00;
		break;
	case 1:
		AddEventCharObj01(act);
		act->move = BallEv1_ST00;
		break;
	}
}
/*------------------------------------------------
	ボールの動き(ステート5)
	落ちようとしたところにすでにボールがいたときの回避処理

	static void BallMoveAct_ST5(actWork *act);
--------------------------------------------------*/
static void BallMoveAct_ST5(actWork *act)
{
	//ボールの動き
	RotateBallMove(act);

	if(--act->work[BALL_TIME] == 15)
	{
		//速度反転
		MG_RLT->ball.fwv *= -1;
	}
		
	if(act->work[BALL_TIME] == 0)	//タイマーが0になった時点で終了
	{
		if(act->work[BALL_FLG] == 0){	//スタックしない
			//ボールをとめる
			BallMoveEnd(act);
		}
		else{							//スタックした
			act->anm_pause = 1;
			m4aSongNumStart(SE_KON);
			StackEventInit(act);		//イベント0初期化
		}
	}
	return;
}

/*------------------------------------------------
	ボールの動き(ステート4)
	盤と同期するための、ボールの位置補正タイム
	補正がすんだところでジャッジをかけ直す

	static void BallMoveAct_ST4(actWork *act);
--------------------------------------------------*/
#ifdef PM_DEBUG
u8	g_stackFlg = 0;
static void BallMoveAct_ST4_Dmy(actWork *act)
{
	s16	rand;
	u8	no;
	
	//盤上の回転運動
	RotateBallMove( act );
	
	//タイマーリセット
	act->work[BALL_TIME] = 0;
	
	//ジャッジ
	no = GetBallExistCell(act);
	
	//今いるセルが空きでなかったとき
	m4aSongNumStart(SE_KON);
	rand = pp_rand()&0x0001;

	if(rand)	//ボール進行方向側
	{
		//角速度更新
		MG_RLT->ball.frv = 0.0f;
		
		//次のセルナンバーを求める
		no = (MG_RLT->ball.uc_cell+1)%RLT_CELL_MAX;

		//スタックした場合のエリアナンバーを覚えておく
		MG_RLT->ball.uc_area = (MG_RLT->ball.uc_cell+1)%RLT_CELL_MAX;
	}
	else	//進行方向反対側
	{
		//角速度更新
		MG_RLT->ball.frv = g_table[MG_RLT->rlt_ver].f_invV*2;

		//次のセルナンバーを求める
		no = (MG_RLT->ball.uc_cell + (RLT_CELL_MAX-1))%RLT_CELL_MAX;

		//スタックした場合のエリアナンバーを覚えておく
		MG_RLT->ball.uc_area = MG_RLT->ball.uc_cell;
	}

	act->work[BALL_FLG] = 1;		//スタック
	act->work[BALL_TIME] = (short)g_table[MG_RLT->rlt_ver].uc_rBaseH;

	//半径に対する速度の更新
	MG_RLT->ball.fwv = 0.085f;
	
	act->move = BallMoveAct_ST5;
	act->work[BALL_STAT] = 5;
	return;

}
#endif	//ifdef PM_DEBUG
static void BallMoveAct_ST4(actWork *act)
{
	s16	rand;
	u8	no;
	
	//盤上の回転運動
	RotateBallMove( act );
	
	//タイマーリセット
	act->work[BALL_TIME] = 0;
	
	//ジャッジ
	//今いるセルが空きならば、そのまま落ちる
	no = GetBallExistCell(act);
	if((g_rltCell[MG_RLT->ball.uc_cell].ui_flg & MG_RLT->rlt_hp) == 0)
	{
		BallMoveEnd(act);
		return;
	}
	//今いるセルが空きでなかったとき
	m4aSongNumStart(SE_KON);
	rand = pp_rand()&0x0001;

	if(rand)	//ボール進行方向側
	{
		//角速度更新
		MG_RLT->ball.frv = 0.0f;
		
		//次のセルナンバーを求める
		no = (MG_RLT->ball.uc_cell+1)%RLT_CELL_MAX;

		//スタックした場合のエリアナンバーを覚えておく
		MG_RLT->ball.uc_area = (MG_RLT->ball.uc_cell+1)%RLT_CELL_MAX;
	}
	else	//進行方向反対側
	{
		//角速度更新
		MG_RLT->ball.frv = g_table[MG_RLT->rlt_ver].f_invV*2;

		//次のセルナンバーを求める
		no = (MG_RLT->ball.uc_cell + (RLT_CELL_MAX-1))%RLT_CELL_MAX;

		//スタックした場合のエリアナンバーを覚えておく
		MG_RLT->ball.uc_area = MG_RLT->ball.uc_cell;
	}

	//次のセルが空いているかどうか？
	if(g_rltCell[no].ui_flg & MG_RLT->rlt_hp){	//空いていない
		act->work[BALL_FLG] = 1;		//スタック
		act->work[BALL_TIME] = (short)g_table[MG_RLT->rlt_ver].uc_rBaseH;
	}
	else{	 //空いている
		act->work[BALL_FLG] = 0;		//スタックしない
		if(MG_RLT->rlt_ver){
			act->work[BALL_TIME] = (short)g_table[MG_RLT->rlt_ver].uc_rBase;
		}
		else{
			act->work[BALL_TIME] = (short)g_table[MG_RLT->rlt_ver].uc_rBaseH;
			if(rand){
				MG_RLT->ball.frv = 0.5f;
			}else{
				MG_RLT->ball.frv = -1.5f;
			}
		}
	}

	//半径に対する速度の更新
	MG_RLT->ball.fwv = 0.085f;
	
	act->move = BallMoveAct_ST5;
	act->work[BALL_STAT] = 5;
	return;
}

/*------------------------------------------------
	ボールの動き(ステート3)
	ジャッジの半径になるまで、円運動

	static void BallMoveAct_ST3(actWork *act);
--------------------------------------------------*/
static void BallMoveAct_ST3(actWork *act)
{
	//盤上の回転運動
	RotateBallMove( act );

	if(MG_RLT->ball.frv > 0.5f) return;
	
	//速度が0.5以下になったらジャッジ
	GetBallExistCell(act);		//現在いるセルを求める
	
	if(Get_B2B_SyncOfs(act) == 0){	//セルぴったりにいるので補正なし
		MG_RLT->ball.fra = 0.0f;
		MG_RLT->ball.frv -= 
		(float)g_table[MG_RLT->rlt_ver].uc_rSpd/(g_table[MG_RLT->rlt_ver].uc_rWait+1);
		act->work[BALL_STAT] = 4;

#ifdef PM_DEBUG
		if(g_stackFlg)	act->move = BallMoveAct_ST4_Dmy;
		else			act->move = BallMoveAct_ST4;
#else
		act->move = BallMoveAct_ST4;
#endif		//PM_DEBUG
		return;
	}

	//速度がマイナスになるのを防止
	if(MG_RLT->ball.fra != 0.0f){
		if(MG_RLT->ball.frv < 0.0f){
			MG_RLT->ball.fra = 0.0f;
			MG_RLT->ball.frv = 0.0f;
			MG_RLT->ball.fwv /= 1.2;
		}
	}
	return;
}

/*------------------------------------------------
	ボールの動き(ステート2)
	円運動

	static void BallMoveAct_ST2(actWork *act);
--------------------------------------------------*/
static void BallMoveAct_ST2(actWork *act)
{
	//盤の上の回転運動
	RotateBallMove( act);

	//半径のエリアがAREA3に突入したら次のステートへ
	if(MG_RLT->ball.fw > (float)RLT_AREA3_OFS) return;

	//半径に対する速度を更新
	MG_RLT->ball.fwv = -(RLT_AREA3_SIZ/(float)MG_RLT->ball.us_syncA2);
	//加速度を更新
	MG_RLT->ball.fra = -(MG_RLT->ball.frv/(float)MG_RLT->ball.us_syncA2);

	act->anm_no = 2;
	act->anm_sw = 1;
	act->anmend_sw = 0;
	
	act->work[BALL_STAT] = 3;
	act->move = BallMoveAct_ST3;
	return;
}

/*------------------------------------------------
	ボールの動き(ステート1)
	円運動

	static void BallMoveAct_ST1(actWork *act);
--------------------------------------------------*/
static void BallMoveAct_ST1(actWork *act)
{
	//盤の上の回転運動
	RotateBallMove( act);

	//半径のエリアがAREA2に突入したら次のステートへ
	if(MG_RLT->ball.fw > (float)RLT_AREA2_OFS) return;
	
	m4aSongNumStartOrChange(SE_TAMAKORO_E);
	
	//半径に対する速度を更新
	MG_RLT->ball.fwv = -(RLT_AREA2_SIZ/(float)MG_RLT->ball.us_syncA1);
	//加速度を更新
	MG_RLT->ball.fra = (1.0f-MG_RLT->ball.frv)/(float)MG_RLT->ball.us_syncA1;

	act->anm_no = 1;
	act->anm_sw = 1;
	act->anmend_sw = 0;

	act->work[BALL_STAT] = 2;
	act->move = BallMoveAct_ST2;
	return;
}

/*-----------------------------------------------
	ボールの動き(ステート0)
	初期化・表示開始
	
	void BallMoveAct_ST0(actWork *act);
-------------------------------------------------*/
void BallMoveAct_ST0(actWork *act)
{
	//初期位置設定
	act->work[BALL_STAT] = 1;
	act->work[BALL_TIME] = 0;

	RotateBallMove(act);

	act->banish = 0;				//表示開始
	act->move = BallMoveAct_ST1;
}

///////////////////////////////////////////////////////////////
//	イベントキャラクタ
///////////////////////////////////////////////////////////////
/*----------------------------------------------------
	スタックイベント0用のキャラクタを追加

	void AddEventCharObj00(actWork *ballAct);
	
	i	actWork*	カレントボールのアクターへのポインタ
------------------------------------------------------*/
void AddEventCharObj00(actWork*	ballAct)
{
	u8	i = 0;
	s16	no = 0,ptn;

	//ボールの影の位置
	s16	pos[2][2] = {{CENTER_X_OBJ,CENTER_Y_OBJ-36},
					 {CENTER_X_OBJ,CENTER_Y_OBJ+32}};
	
	//イベントパターンの取得
	no = ballAct->work[BALL_WORK]-2;
	if(MG_RLT->rlt_ver) ptn = no;
	else				ptn = no + 2;
	
	//イベント用サポートポケモンのオブジェクト
	MG_RLT->act_id[EV_POKE] = 
	AddActor(&(rlt_evPoke_Header[0]),36,-12,PRI_EPOKE);
	
	//ボールの影
	MG_RLT->act_id[EV_SHADOW0] =
	AddActor(&(rlt_shadow_Header[0]),pos[ballAct->work[BALL_FLG]][0],
									 pos[ballAct->work[BALL_FLG]][1],PRI_ESHADOW2);
	
	//キャラクターの影
	MG_RLT->act_id[EV_SHADOW1] = 
	AddActor(&(rlt_shadow_Header[1]),36,140,PRI_ESHADOW);
	ActWork[MG_RLT->act_id[EV_SHADOW1]].oamData.ObjMode = 1;	//半透明	

	//共通のパラメータ初期化
	for(i = 0;i< 3;i++)
	{
		ActWork[MG_RLT->act_id[EV_POKE + i]].scr = 0;
		ActWork[MG_RLT->act_id[EV_POKE + i]].banish = 1;
		ActWork[MG_RLT->act_id[EV_POKE + i]].anm_pause = 1;
		ActWork[MG_RLT->act_id[EV_POKE + i]].aff_pause = 1;

		//互いのアクターIDナンバーを保存
		ActWork[MG_RLT->act_id[EV_POKE + i]].work[EV_PMID] = MG_RLT->act_id[EV_POKE];
		ActWork[MG_RLT->act_id[EV_POKE + i]].work[EV_SBID] = MG_RLT->act_id[EV_SHADOW0];
		ActWork[MG_RLT->act_id[EV_POKE + i]].work[EV_SCID] = MG_RLT->act_id[EV_SHADOW1];
	
		//イベントパターン保存
		ActWork[MG_RLT->act_id[EV_POKE + i]].work[EV_PTN] = no;	

		//イベントの稼動時間を保存
		ActWork[MG_RLT->act_id[EV_POKE + i]].work[EV_TIME] = 
			ballAct->work[BALL_WORK]*g_table[MG_RLT->rlt_ver].uc_rBase+
			(g_table[MG_RLT->rlt_ver].uc_rBaseH-1);
	}
	ActWork[MG_RLT->act_id[EV_SHADOW0]].scr = 1;

	//カレントボールのアクターポインタを、MG_RLT->pActに保存しておく
	MG_RLT->pAct = ballAct;
	return;
}
/*----------------------------------------------------
	スタックイベント1用のキャラクタを追加

	void AddEventCharObj01(actWork *ballAct);
	
	i	actWork*	カレントボールのアクターへのポインタ
------------------------------------------------------*/
void AddEventCharObj01(actWork*	ballAct)
{
	u8	i = 0;
	s16	no = 0;

	//キャラクタと影の初期位置
	s16	pos[2][2] = {{256,CENTER_Y_OBJ+4},
					 {-16,CENTER_Y_OBJ+4}};
	
	//イベントパターンの取得
	no = ballAct->work[BALL_WORK] - 2;
	
	//イベント用サポートポケモンのオブジェクト
	MG_RLT->act_id[EV_POKE] = 
	AddActor(&(rlt_evPoke_Header[1]),pos[ballAct->work[BALL_FLG]][0],
									 pos[ballAct->work[BALL_FLG]][1],PRI_EPOKE);
	ActAnmChg(&(ActWork[MG_RLT->act_id[EV_POKE]]),ballAct->work[BALL_FLG]);
	
	//キャラクターの影
	MG_RLT->act_id[EV_SHADOW0] = 
	AddActor(&(rlt_shadow_Header[2]),pos[ballAct->work[BALL_FLG]][0],
									 pos[ballAct->work[BALL_FLG]][1],PRI_ESHADOW);
	ActWork[MG_RLT->act_id[EV_SHADOW0]].aff_pause = 1;
	ActWork[MG_RLT->act_id[EV_SHADOW0]].anm_pause = 1;

	//稼働時間を保存
	ballAct->work[BALL_WORK] = 
		45+
		no*g_table[MG_RLT->rlt_ver].uc_rBase+
		g_table[MG_RLT->rlt_ver].ev[1].prm0;

	//共通のパラメータ初期化
	for(i = 0;i< 2;i++)
	{
		//互いのアクターIDナンバーを保存
		ActWork[MG_RLT->act_id[EV_POKE + i]].work[EV_PMID] = MG_RLT->act_id[EV_POKE];
		ActWork[MG_RLT->act_id[EV_POKE + i]].work[EV_SBID] = MG_RLT->act_id[EV_SHADOW0];
		ActWork[MG_RLT->act_id[EV_POKE + i]].work[EV_SCID] = MG_RLT->act_id[EV_SHADOW0];
	
		//イベントパターン保存
		ActWork[MG_RLT->act_id[EV_POKE + i]].work[EV_PTN] = no;	

		//イベントの稼動時間を保存
		ActWork[MG_RLT->act_id[EV_POKE + i]].work[EV_TIME] = 
			ballAct->work[BALL_WORK]-45;
	}
	
	//カレントボールのアクターポインタを、MG_RLT->pActに保存しておく
	MG_RLT->pAct = ballAct;

	return;
}

//スタックイベント発生時に必要な値を初期化する
/*--------------------------------------------------
	スタックイベントの初期化
	
	static void StackEventInit(actWork* act);
	
	actWork*	カレントボールのアクターアドレス
----------------------------------------------------*/
static void  StackEventInit(actWork* act)
{
	u8	i = 0,no = 0,ofs = 0,nFree = 0,entry = 5,fix = 0;
	u8	free[10] = {0,0,0,0,0,0,0,0,0,0};
	u16 rot = 0,rand = pp_rand();
	
	//スタックのフラグを立てる
	MG_RLT->ball.uc_flg = 0x01;
	MG_RLT->ev_on = 1;
	MG_RLT->ev_end = 0;

	//スタックしたときを示すセルナンバーをセット
	MG_RLT->ball.uc_cell = 0xFF;
	
	MG_RLT->ball.fr = (float)(act->work[BALL_R]);
	
	//ボールの速度を設定する
	MG_RLT->ball.fwv = 0.0f;	
	MG_RLT->ball.frv = g_table[MG_RLT->rlt_ver].f_invV;

	//フラグ設定
	rot = 33 + MG_RLT->rlt_ver*30 + (1-MG_RLT->ev_no)*15;
	for(i = 0;i < 4;i++){
		if(	(rot < act->work[BALL_R]) && (act->work[BALL_R]) <= rot+90){
			act->work[BALL_FLG] = i/2;
			MG_RLT->ev_no = i%2;
			break;
		}
		if(i == 3){
			act->work[BALL_FLG] = 1;
			MG_RLT->ev_no = 1;
			break;
		}
		rot += 90;
	}

	//鳴き声再生
	if(MG_RLT->ev_no){
		if(act->work[BALL_FLG])
			VoicePlay(MONSNO_SUBAME,-63);
		else
			VoicePlay(MONSNO_SUBAME,63);
	}else{
		VoicePlay(MONSNO_KINOKOKO,-63);
	}
	//どこに落とすか決める	
	//今いるセル + (MG_RLT->ev_no*2)+1 のセルから６セル先までで、空いているセルを探す
	ofs = 2;
	no = (MG_RLT->ball.uc_area + ofs) % RLT_CELL_MAX;
	
	//エントリー数を決定
	if(MG_RLT->ev_no == 1 && MG_RLT->rlt_ver == 1){
		entry += ofs+4;
	}else{
		entry += ofs;
	}
	
	for(i = ofs;i < entry;i++)
	{
		//空いていない
		if( (MG_RLT->rlt_hp & g_rltCell[no].ui_flg)){
			no = (no + 1) % RLT_CELL_MAX;
			continue;
		}

		//空いている
		free[nFree++] = i;

		//空いている場所と賭けている場所が一致したら保存
		if(	(!fix) && (g_rltCell[no].ui_flg & g_rltBet[MG_RLT->uc_aBet[MG_RLT->nBet]].bet_flg)){
			fix = i;
		}
		no = (no + 1) % RLT_CELL_MAX;
	}

	//空いているセル候補の中からランダムで選ぶ
	if((MG_RLT->ev_no+1) & MG_RLT->mons_flg){
		if(fix && ((rand&0x00FF) < 192)){
			act->work[BALL_WORK] = fix;
		}
		else{
			act->work[BALL_WORK] = free[rand % nFree];
		}
	}
	else{
		act->work[BALL_WORK] = free[rand % nFree];
//		act->work[BALL_WORK] = free[nFree-1];
	}

	//次に飛ぶタスクを設定
	act->move = BallMoveAct_EvInit;
	return;
}

///////////////////////////////////////////////////
//	イベント00用 動作関数
///////////////////////////////////////////////////
static const u16 g_alpha[10] = {
	0x0907,0x0808,0x0709,0x060A,0x050B,0x040C,0x030D,0x020E,0x010F,0x0010,
};
/*-------------------------------------------------------
	イベント00_2	Charater & shadow of char

	キャラクタとキャラクタの影が、画面から消えるまで

	static void Ev0_MoveAct02(actWork *act);
---------------------------------------------------------*/
static void Ev0_MoveAct02(actWork *act)
{	
	//タイムアップするまでは帰る
	if( act->work[EV_CNT]++ < act->work[EV_TIME]){
		return;
	}
	
	act->x -= 2;

	//画面から消えたら
	if(act->x < -16){
		if(!MG_RLT->ev_end) MG_RLT->ev_end = 1;		//イベント終了フラグを立てる
		
		//アクター削除
		DelActor(act);

		MG_RLT->state_flg = 0;
		MG_RLT->w_alpha = g_alpha[0];
	}
}

/*---------------------------------------------------
	イベント00_3		shadow of ball
	
	ボールの影とスクリーンスクロール制御

	static void Ev0_MoveAct03(actWork *act);
-----------------------------------------------------*/
static void Ev0_MoveAct03(actWork *act)
{
	s16	rand[3][4] = {{-1,0,1,0},{-2,0,2,0},{-3,0,3,0}};
	
	//タイムアップするまで、スクリーンスクロール
	if( act->work[EV_CNT]++ < act->work[EV_TIME]){

//		if(MyData.playtime_ms%2 == 0){
		if(act->work[EV_CNT]&0x0001){
			ActOY = rand[act->work[EV_PTN]/2][act->work[EV_WORK]];
			act->work[EV_WORK] = (act->work[EV_WORK]+1)%4;
		}
		act->banish ^= 1;	//blink
		return;
	}

	//スクリーンスクロールリセット
	ActOY = 0;

	//キャラクターのパターンアニメ開始
	ActWork[MG_RLT->act_id[EV_POKE]].anm_pause = 0;
		
	//アクター削除
	DelActor(act);
}

/*-----------------------------------------------
	イベント00_1	All	

	キャラクタの落下運動

	static void Ev0_MoveAct01(actWork *act);
-------------------------------------------------*/
static void Ev0_MoveAct01(actWork *act)
{
	act->work[EV_CNT]++;
	act->dy = (short)(0.039f*act->work[EV_CNT]*act->work[EV_CNT]);

	MG_RLT->w_alpha = g_alpha[(MG_RLT->state_flg-1)/2];
	if(MG_RLT->state_flg < 19) MG_RLT->state_flg++;

	if(act->work[EV_CNT] > 60){
		act->work[EV_CNT] = 0;			//タイマーリセット

		//キャラクタ
		act->move = Ev0_MoveAct02;		//動作変更

		//キャラクタの影
		ActWork[act->work[EV_SCID]].move = Ev0_MoveAct02;
		ActWork[act->work[EV_SCID]].work[EV_CNT] = -2;

		//ボールの影、表示開始
		ActWork[act->work[EV_SBID]].banish = 0;
		ActWork[act->work[EV_SBID]].move = Ev0_MoveAct03;

		m4aSongNumStart(SE_W070);
	}
}
/*----------------------------------------------
	イベント00_0	ALL

	ボールが規定位置に来るまで待機

	static void Ev0_MoveAct00(actWork *act);
-------------------------------------------------*/
static void Ev0_MoveAct00(actWork *act)
{
	if(act->work[EV_WORK] == 0){
		if(MG_RLT->pAct->work[BALL_FLG] == 0){
			if(	MG_RLT->pAct->work[BALL_R] != 
				g_table[MG_RLT->rlt_ver].ev[0].prm0){
				return;
			}
		}
		else{
			if(	MG_RLT->pAct->work[BALL_R] != 
				180+g_table[MG_RLT->rlt_ver].ev[0].prm0) return;
		}

		//ボールが規定位置にきた
		//キャラクタの影の表示をはじめる
		act->banish = 0;
		act->work[EV_WORK]++;
		m4aSongNumStart(SE_RU_HYUU);
		MG_RLT->state_flg = 1;
		MG_RLT->w_alpha = g_alpha[0];
	}else{
		MG_RLT->w_alpha = g_alpha[(MG_RLT->state_flg-1)/2];
		if(MG_RLT->state_flg < 19) MG_RLT->state_flg++;

		if(MG_RLT->pAct->work[BALL_FLG] == 0){
			if(	MG_RLT->pAct->work[BALL_R] != 
				g_table[MG_RLT->rlt_ver].ev[0].prm1){
				return;
			}
		}
		else{
			if(	MG_RLT->pAct->work[BALL_R] != 
				180+g_table[MG_RLT->rlt_ver].ev[0].prm1) return;
		}
		//ボールが規定位置にきた
		ActWork[act->work[EV_PMID]].move = Ev0_MoveAct01;	//キャラクタ動作スタート
		ActWork[act->work[EV_PMID]].banish = 0;
		act->move = DummyActMove;
		act->work[EV_WORK] = 0;

//		VoicePlay(MONSNO_KINOKOKO,-63);
	}
	return;
}

///////////////////////////////////////////////////
//	イベント01用 動作関数
///////////////////////////////////////////////////
static void Ev1_MoveAct05(actWork *act){
	act->banish ^= 1;
}
/*-------------------------------------------------------
	イベント01	Character

	キャラクタがボールを放して上昇
	画面外に消えるまで

	static void Ev1_MoveAct04(actWork *act);
 --------------------------------------------------------*/
static void Ev1_MoveAct04(actWork *act)
{
	if(act->y > -16){
		act->y -= 1;
		return;
	}

	act->move = DummyActMove;
	act->banish = 1;
	act->anm_pause = 1;

	m4aSongNumStop(SE_BASABASA);
	DelActor(act);
	AffineWorkNumDel(ActWork[MG_RLT->act_id[EV_SHADOW0]].oamData.AffineParamNo);
	DelActor(&(ActWork[ MG_RLT->act_id[EV_SHADOW0] ]));
	return;
}

/*-------------------------------------------------------
	イベント01	Character

	キャラクタがボールを持ち上げて上昇、
	タイムが来るまで待機

	static void Ev1_MoveAct03(actWork *act);
 --------------------------------------------------------*/
static void Ev1_MoveAct03(actWork *act)
{
	//上昇中
	if(act->work[EV_CNT] >= 0){
		act->work[EV_CNT]--;
		act->y--;

		if(act->work[EV_CNT] == 0){
			if(act->anm_offs == 1) act->dy++;
		}
		return;
	}
	//待機中
	if(act->work[EV_TIME] >= 0)
	{
		act->work[EV_TIME]--;

		if(act->anm_wait != 0) return;
		
		if(act->anm_offs == 1)	act->dy++;
		else					act->dy--;

		return;
	}

	//待機終わり・上昇して画面外へ
	m4aSongNumStart(SE_RU_HYUU);
	ActAnmChg(act,4+MG_RLT->pAct->work[BALL_FLG]);
	act->move = Ev1_MoveAct04;

	//影のAffineアニメーション開始
	ActWork[act->work[EV_SCID]].aff_pause = 0;
}

/*-------------------------------------------------------
	イベント01	Character

	キャラクタが、画面に突入。ボールと接触するまで

	static void Ev1_MoveAct02(actWork *act);
---------------------------------------------------------*/
static void Ev1_MoveAct02(actWork *act)
{
	s8	sign[2] = {-1,1};
	s8	pos[8][2] = {{2,0},{2,0},{2,-1},{2,-1},{2,-1},{2,-1},{2,-2},{2,-2}};
	s8	pan = 0;

	if(act->work[EV_CNT]-- >= 8){
		act->x += sign[MG_RLT->pAct->work[BALL_FLG]]*2;
		if(SeEndCheck()){
			pan = -((CENTER_X-act->x)/2);
			m4aMPlayPanpotControl(&m4a_mplay001,0xFFFF,pan);
			m4aMPlayPanpotControl(&m4a_mplay002,0xFFFF,pan);
		}
		return;
	}
	if(act->work[EV_CNT] >= 0){
		act->x += sign[MG_RLT->pAct->work[BALL_FLG]] * pos[7-act->work[EV_CNT]][0];
		act->y += pos[7-act->work[EV_CNT]][1];
		return;
	}

	//カウンタアップ
	m4aSongNumStartOrChange(SE_BASABASA);
	if(MG_RLT->pAct->work[BALL_FLG] == 0) VoicePlay(MONSNO_SUBAME,63);
	else								  VoicePlay(MONSNO_SUBAME,-63);
	ActAnmChg(act,2+MG_RLT->pAct->work[BALL_FLG]);	//遅い羽ばたきにアニメチェンジ
	act->work[EV_CNT] = 45;
	act->move = Ev1_MoveAct03;
}
/*-------------------------------------------------------
	イベント01	shadow of character

	キャラクタの影が、画面に突入。停止するまで

	static void Ev1_MoveAct01(actWork *act);
---------------------------------------------------------*/
static void Ev1_MoveAct01(actWork *act)
{
	s8	sign[2] = {-1,1};

	if(act->work[EV_CNT]-- >= 0){
		act->x += sign[MG_RLT->pAct->work[BALL_FLG]]*2;
		ActWork[act->work[EV_SCID]].banish ^= 1;	//blink
		return;
	}
	//カウンタアップ
	act->move = Ev1_MoveAct05;
}

/*-------------------------------------------------------
	イベント01	Charater

	ボールが規定の位置に来るまで待機

	static void Ev1_MoveAct00(actWork *act);
---------------------------------------------------------*/
static void Ev1_MoveAct00(actWork *act)
{
	if(MG_RLT->pAct->work[BALL_FLG] == 0){
		if(	MG_RLT->pAct->work[BALL_R] != 
			90+g_table[MG_RLT->rlt_ver].ev[1].prm1){
			return;
		}
		ActWork[act->work[EV_SCID]].work[EV_CNT] = 52;
		ActWork[act->work[EV_PMID]].work[EV_CNT] = 52;
	}
	else{
		if(	MG_RLT->pAct->work[BALL_R] != 
			270+g_table[MG_RLT->rlt_ver].ev[1].prm2){
			return;
		}
		ActWork[act->work[EV_SCID]].work[EV_CNT] = 46;
		ActWork[act->work[EV_PMID]].work[EV_CNT] = 46;
	}

	//ボールが規定の位置まできたら
	ActWork[act->work[EV_SCID]].move = Ev1_MoveAct01;
	ActWork[act->work[EV_PMID]].move = Ev1_MoveAct02;
	m4aSongNumStart(SE_RU_HYUU);
}

