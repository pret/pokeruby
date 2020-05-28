//====================================================================
//
//						ＴＶ企画	01/10/05 nohara							
//
//====================================================================
#include "common.h"
#include "intr.h"
#include "task.h"
#include "menu.h"					//menutool.h
#include "calctool.h"				//pp_rand
#include "script.h"					//ScriptParameter
#include "sysflag.h"				//SYS_TV_START
#include "fieldmap.h"				//NowMap
#include "server.h"					//FTW
#include "tv_def.h"					//define群
#include "tv_tool.h"				//関数群
#include "kaiwa.h"					//KaiwaCopyWord
#include "cm.h"						//CMDataAllInit
#include "tv.h"						//定義
#include "ev_time.h"				//UpdateTimeEvent
#include "mapbg.h"
#include "..\evdata\maparray.h"		//C106
#include "..\sxydata\field_r111.sym"//INTERVW1_01_FIELD_R111
#include "..\sxydata\field_r118.sym"//INTERVW1_01_FIELD_R118
#include "..\sxydata\field_r120.sym"//INTERVW1_01_FIELD_R120
#include "record.h"					//CNT_INTERVIEW
#include "..\script\saveflag.h"		//FH_00


//====================================================================
//						  変数
//====================================================================
s8 tv_akino;				//ＴＶデータの空いてる場所


//====================================================================
//						プロトタイプ宣言
//====================================================================
void TVDataAllInit();						//TVデータ初期化(ゲーム開始時に呼ばれる)
u8 ScrTVTypeGet();							//データタイプを取得
u8 TVDataWatchFlagOnChk();					//放送出来るTVデータがあるか
void BroadCastFlagChk();					//TVかCMどちらを放送するかchk
u8 GeneratingTVCellChk();					//大量発生のセル書き換えチェック
u8 ScrGeneratingBroadCastChk();				//大量発生をまたしようとしていたとき
u8 TVOnceFlagChk();							//TV放送を一度みたかのチェック

//インタビュアー＆カメラマン
void TVCameraAllInit();
void TVCameraBattleDataSet();
void TVCameraDataSet();
void TVCameraWatchFlagReset();
u8 TVCameraBattleGet();
u8 TVCameraBroadCastChk();
u8 TVCameraKaiwaSet();
u8 TVCameraOldFlagChk();
void TVCameraObjIDGet();


//====================================================================
//							プログラム
//====================================================================

//--------------------------------------------------------------------
//					   	 TVデータ初期化
//					 ゲーム開始時に呼ばれる
//--------------------------------------------------------------------
void TVDataAllInit()
{
	u8 i,j;

	//TVデータ(TVDATA_MAXが一番後ろの確保領域を含まないので <= にする)
	for(i=0; i <= TVDATA_MAX ;i++)
	{
		Fld.tv_event[i].datatype=TV_NODATA_TYPE1;		// 0=データなし 
		Fld.tv_event[i].watch_flag=TV_WATCH_FLAG_OFF;	// 0=TV見れない

		for(j=0; j < 34 ;j++)
		{
			Fld.tv_event[i].dmy[j]=0;					// 0=データなし 
		}
	}

	//CMデータ
	CMDataAllInit();
	return;
}


/********************************************************************/
/********************************************************************/
/********************************************************************/
/********************************************************************/
/********************************************************************/
/********************************************************************/


//====================================================================
//							放送関連
//====================================================================

//--------------------------------------------------------------------
//				watch_flagが見れる状態の場所の要素数を返す
//				TV_GENERATINE_TYPE1のみ時間も見ている
//
//	戻り値		0があった		0～TVDATA_MAXの値
//				0がなかった		TV_NOTHING
//--------------------------------------------------------------------
u8 TVDataWatchFlagOnChk()
{
	u8 i;
	TV_Generating_Work *p;
	u8 ans,hozon;

	//データが入ってない場所を返す
	for( i=TVDATA_HIMSELF_MAX; i < TVDATA_MAX ;i++ )
	{
		if( Fld.tv_event[i].datatype == TV_NODATA_TYPE1 ) break;
	}

	ans = (pp_rand() % i);					//0-4以上(相手データが入ってない所までの範囲)
	hozon = ans;

	while(1)
	{
		//CUT_TIME_TYPEではなかったら
		if( TVDataCopyTypeGet( Fld.tv_event[ans].datatype ) != CUT_TIME_TYPE )
		{
			if( Fld.tv_event[ans].watch_flag == TV_WATCH_FLAG_ON ) return ans;
		}else
		{
			p = (TV_Generating_Work *)&Fld.tv_event[ans];
			if( p->time_count == 0 && p->watch_flag == TV_WATCH_FLAG_ON )
				return ans;
		}

		if( ans == 0 )	ans = (TVDATA_MAX - 1);
		else	ans--;

		//ＴＶデータを一周見たら終了
		if( ans == hozon )	
		{
			break;
		}
	};

	return TV_NOTHING;			
}

//--------------------------------------------------------------------
//TVDataWatchFlagOnChkと大量発生している時のチェックをいっしょにしたもの
//--------------------------------------------------------------------
u8 TVDataWatchFlagOnChkGeneratingChk();
u8 TVDataWatchFlagOnChkGeneratingChk()
{
	u8 ret;
	ret = TVDataWatchFlagOnChk();

	//放送出来るデータがなかった
	if( ret == TV_NOTHING ) return TV_NOTHING;

	//大量発生している時に、大量発生を放送しようとしていたら
	if( Fld.tv_encount.pokeno != 0 && Fld.tv_event[ret].datatype == TV_GENERATING_TYPE1 )
	{
		//放送する要素数を変更する
		return GeneratingTVCellChk();
	}

	return ret;
}


/********************************************************************/
/********************************************************************/
/********************************************************************/
/********************************************************************/
/********************************************************************/
/********************************************************************/


//====================================================================
//							BGアニメ関連
//====================================================================

//--------------------------------------------------------------------
//						TVのセルを変更する
//--------------------------------------------------------------------
#define TV_CELL_ATTR	0x86
#define TVON_CELL_CODE	3
#define TVOFF_CELL_CODE	2

void ChangeTVCell(int,int);
void ReturnTVCell();
static void SetTVCellCode(int,int,u16);

//--------------------------------------------------------------------
//				マップ切り替え時にTVのセルを書き換える
//--------------------------------------------------------------------
void ChangeTVCell( int xsize, int ysize )
{
	u8 ans;

	//ＴＶを見れなくしておく
	EventFlagSet( SYS_TV_WATCH );
	
	//時間の経過をチェック(ＴＶ企画がスタートしてなくてもチェックする)
	//fld_tool.cでこの関数が呼ばれる前にUpdateTimeEvent()が呼ばれている
	//UpdateTimeEvent();

	//例外------------------------------------------------------------
	//自宅TVを見れるか	
	ans = TVMyHomeChk();
	if( ans == TRUE )
	{
		SetTVCellCode( xsize, ysize, TVON_CELL_CODE );
		return;
	}else if( ans == 2 )
	{
		//自宅ですでにフラグたっていたらＴＶを光らせない
		return;
	}
	
	//ミナモの民宿 
	if( Fld.MapID.div_id == C106 && Fld.MapID.map_id == C106_R0101 )
	{
		SetTVCellCode( xsize, ysize, TVON_CELL_CODE );
		return;
	}
	//-------------------------------------------------------------------

	//ＴＶ企画がスタートしているか
	if( EventFlagCheck(SYS_TV_START) == 0 ) return;

	//見れる状態のＴＶがあるか
	//(ＴＶのチェックに大量発生のチェックも同時に行うようにした)
	//if( (TVDataWatchFlagOnChk() == TV_NOTHING) 
	if( (TVDataWatchFlagOnChkGeneratingChk() == TV_NOTHING)		//add 02/09/10
			&& (CMTimeCountChk() == TV_NOTHING) 
				&& (TVCameraBroadCastChk() == TV_WATCH_FLAG_OFF) ) return;

	//ＴＶを見れるようにする
	EventFlagReset( SYS_TV_WATCH );

	SetTVCellCode( xsize, ysize, TVON_CELL_CODE );

	return;
}

//--------------------------------------------------------------------
//						光るTVセルコードにする
//--------------------------------------------------------------------
static void SetTVCellCode( int x, int y, u16 code )
{
	int i,j;

	//今のマップ内でTVのセル(Atr86h)を探す
	for( i=0; i < y ;i++ )
	{
		for( j=0; j < x ;j++ )
		{
			if( GetCellAttribute(j,i) == TV_CELL_ATTR )//指定位置のｾﾙｱﾄﾘﾋﾞｭｰﾄ取得
			{
				SetCell(j,i,code | CELL_HITCHECK_MASK);
			}
		}
	}

	return;
}

//--------------------------------------------------------------------
//					TV放送を見た後TVのセルを元に戻す
//				(部屋の中にTVは一つしか存在しないものとする)
//--------------------------------------------------------------------
void ReturnTVCell()
{
	SetTVCellCode( VMap.Xsize, VMap.Ysize, TVOFF_CELL_CODE );
	MakeMapBG();							// ﾀﾞﾐｰVram 展開
	return;
}

//--------------------------------------------------------------------
//			ScriptParameter0の場所のTVデータタイプを取得する
//--------------------------------------------------------------------
u8 ScrTVTypeGet()
{
	return Fld.tv_event[ScriptParameter0].datatype;
}

//--------------------------------------------------------------------
//	大量発生していて、見れる状態のＴＶが大量発生のＴＶデータしか
//	なかった場合にＴＶのセル書き換えをしないようにする
//
//	戻り値	見れる状態のＴＶが他にある		要素数
//			見れる状態のＴＶが大量発生のみ	TV_NOTHING
//--------------------------------------------------------------------
u8 GeneratingTVCellChk()
{
	u8 i;

	for( i=0; i < TVDATA_MAX ;i++ )
	{
		if( Fld.tv_event[i].datatype != TV_NODATA_TYPE1 )
		{
			//大量発生以外で見れる状態のＴＶがあるか
			if( Fld.tv_event[i].datatype != TV_GENERATING_TYPE1
				&& Fld.tv_event[i].watch_flag == TV_WATCH_FLAG_ON )
				return i;
		}
	}

	//見れる状態のＴＶが大量発生データしかない
	return TV_NOTHING;
}

//--------------------------------------------------------------------
//		大量発生を放送しようとして、すでに発生していたら
//		要素数を変更する、もしくは放送しない
//
//	戻り値	見れる状態のＴＶが他にある		要素数
//			見れる状態のＴＶが大量発生のみ	TV_NOTHING
//--------------------------------------------------------------------
u8 ScrGeneratingBroadCastChk()
{
	TV_Generating_Work *p;
	p = (TV_Generating_Work *)&Fld.tv_event[ScriptParameter0];

	//大量発生を放送しようとしていたら
	if( p->datatype == TV_GENERATING_TYPE1 )
	{
		//発生している
		if( Fld.tv_encount.pokeno != 0 )
		{
			//放送する要素数を変更する
			return GeneratingTVCellChk();
		}
	}

	return (u8)ScriptParameter0;
}


/********************************************************************/
/********************************************************************/
/********************************************************************/
/********************************************************************/
/********************************************************************/
/********************************************************************/


//====================================================================
//					インタビュアー＆カメラマン
//====================================================================

//--------------------------------------------------------------------
//							初期化
//--------------------------------------------------------------------
void TVCameraAllInit()
{
    Fld.tv_camera.pokeno[0]			= 0;	// 自分のポケモンの種類
    Fld.tv_camera.pokeno[1]			= 0;	// 自分のポケモンの種類

    Fld.tv_camera.waza				= 0;	// 自分が最後に使った技
	//Fld.tv_camera.easytalk_no		= 0;	// 戦闘後の一言
	Fld.tv_camera.easytalk_no		= KAIWA_CODE_BLANK;	// 戦闘後の一言

    Fld.tv_camera.damage_flag		= 0;	// ノーダメージフラグ
    Fld.tv_camera.kizetsu_flag		= 0;	// 瀕死フラグ
    Fld.tv_camera.kaihuku_flag		= 0;	// 回復アイテムフラグ
    Fld.tv_camera.throw_flag		= 0;	// モンスタボールフラグ
    Fld.tv_camera.watch_flag		= 0;	// フラグ
    Fld.tv_camera.work				= 0;	// 余り

    Fld.tv_camera.old_damage_flag	= 0;	// ノーダメージフラグ
    Fld.tv_camera.old_kizetsu_flag	= 0;	// 瀕死フラグ
    Fld.tv_camera.old_kaihuku_flag	= 0;	// 回復アイテムフラグ
    Fld.tv_camera.old_throw_flag	= 0;	// モンスタボールフラグ
    Fld.tv_camera.old_work			= 0;	// 余り

    Fld.tv_camera.worldpos			= 0;	// 戦った場所
    Fld.tv_camera.battle			= 0;	// 戦った回数

	return;
}

//--------------------------------------------------------------------
//					データセット(戦闘後にセット)
//--------------------------------------------------------------------
void TVCameraBattleDataSet()
{
	u8 i;

    Fld.tv_camera.pokeno[0]		= FTW.MineLastPokeNo;
    Fld.tv_camera.pokeno[1]		= FTW.MineLastPokeNo2;
    Fld.tv_camera.waza			= FTW.MineLastWazaNo;
    if( Fld.tv_camera.battle != 0xff ) Fld.tv_camera.battle++;

    Fld.tv_camera.damage_flag	= FTW.DamageFlag;
	if( FTW.MineKizetsuCount > 0 )	Fld.tv_camera.kizetsu_flag = 1;
	else	Fld.tv_camera.kizetsu_flag = 0;

	if( FTW.ItemUseKaifukuCount > 0 )	Fld.tv_camera.kaihuku_flag = 1;
	else Fld.tv_camera.kaihuku_flag = 0;

	//ボールを投げたカウントが取ってないようなのでこの処理は特に意味がない
	if( FTW.ThrowMasterBallFlag == 0 )
	{
		for( i=0; i < FTW_BALL_MAX ;i++ )
		{
			if( FTW.ThrowBall[i] > 0 )
			{
				Fld.tv_camera.throw_flag = 1;
				break;
			}
		}
	}else
	{
		Fld.tv_camera.throw_flag = 1;
	}

	//データがあるときに戦闘データだけ新規になってＴＶを見れてしまうので
	TVCameraWatchFlagReset();

	//もし何も技をださないで戦闘終了したら(砂嵐のみで、回復しつづけるなど)
	//すでにインタビューを受けた状態にする
    if( Fld.tv_camera.waza == 0 )	EventFlagSet( FH_00 );

	return;
}

//--------------------------------------------------------------------
//					データセット(話し掛けでセット)
//--------------------------------------------------------------------
void TVCameraDataSet()
{
    Fld.tv_camera.old_damage_flag	= Fld.tv_camera.damage_flag;
    Fld.tv_camera.old_kizetsu_flag	= Fld.tv_camera.kizetsu_flag;
    Fld.tv_camera.old_kaihuku_flag	= Fld.tv_camera.kaihuku_flag;
    Fld.tv_camera.old_throw_flag	= Fld.tv_camera.throw_flag;

    Fld.tv_camera.watch_flag	= TV_WATCH_FLAG_ON;	//見れる状態にする
    Fld.tv_camera.worldpos		= NowMap.WorldPos;

	//インタビューの回数をインクリメント
	IncRecord( CNT_INTERVIEW );

	return;
}

//--------------------------------------------------------------------
//						watch_flagをおろす
//--------------------------------------------------------------------
void TVCameraWatchFlagReset()
{
    Fld.tv_camera.watch_flag = TV_WATCH_FLAG_OFF;
	return;
}

//--------------------------------------------------------------------
//						戦闘回数を取得する
//						6以上で6-8を返すようにする
//--------------------------------------------------------------------
u8 TVCameraBattleGet()
{
	if( Fld.tv_camera.battle >= 6 )
		return ((Fld.tv_camera.battle % 3)+6);
	else
		return Fld.tv_camera.battle;
}

//--------------------------------------------------------------------
//						放送するデータがあるか
//--------------------------------------------------------------------
u8 TVCameraBroadCastChk()
{
	return Fld.tv_camera.watch_flag;
}

//--------------------------------------------------------------------
//						前回の簡易会話を代入する
//--------------------------------------------------------------------
u8 TVCameraKaiwaSet()
{
	//データなし
	//if( Fld.tv_camera.easytalk_no == 0 ) return 0;
	if( Fld.tv_camera.easytalk_no == KAIWA_CODE_BLANK ) return 0;

	KaiwaCopyWord( StrTempBuffer0, Fld.tv_camera.easytalk_no );
	//Fld.tv_camera.easytalk_no = 0;
	Fld.tv_camera.easytalk_no = KAIWA_CODE_BLANK;
	return 1;
}

//--------------------------------------------------------------------
//					前回の戦闘の状況をチェックする
//--------------------------------------------------------------------
u8 TVCameraOldFlagChk()
{
	if( Fld.tv_camera.old_damage_flag == 0 ) return 1;
	else if( Fld.tv_camera.old_throw_flag ) return 2;
	else if( Fld.tv_camera.old_kaihuku_flag ) return 3;
	else if( Fld.tv_camera.old_kizetsu_flag ) return 4;

	return 0;
}

//--------------------------------------------------------------------
//					インタビュアーのOBJ指定をゲットする
//
//	戻り値 OBJ指定
//		   エラー時 = EV_OBJ_SPID
//--------------------------------------------------------------------
void TVCameraObjIDGet()
{
	switch( TVCameraBattleGet() )
	{
		case 1:
			ScriptParameter0 = INTERVW1_01_FIELD_R111;
			ScriptParameter1 = CAMERA1_01_FIELD_R111;
			break;
		case 2:
			ScriptParameter0 = INTERVW1_01_FIELD_R118;
			ScriptParameter1 = CAMERA1_01_FIELD_R118;
			break;
		case 3:
			ScriptParameter0 = INTERVW1_01_FIELD_R120;
			ScriptParameter1 = CAMERA1_01_FIELD_R120;
			break;
		case 4:
			ScriptParameter0 = INTERVW1_02_FIELD_R111;
			ScriptParameter1 = CAMERA1_02_FIELD_R111;
			break;
		case 5:
			ScriptParameter0 = INTERVW1_02_FIELD_R118;
			ScriptParameter1 = CAMERA1_02_FIELD_R118;
			break;
		case 6:
			ScriptParameter0 = INTERVW1_02_FIELD_R120;
			ScriptParameter1 = CAMERA1_02_FIELD_R120;
			break;
		case 7:
			ScriptParameter0 = INTERVW1_03_FIELD_R111;
			ScriptParameter1 = CAMERA1_03_FIELD_R111;
			break;
		case 8:
			ScriptParameter0 = INTERVW1_03_FIELD_R118;
			ScriptParameter1 = CAMERA1_03_FIELD_R118;
			break;
	};

	return;
}

