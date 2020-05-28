//=========================================================================
//
//
//	プレイ時間計測
//
//	2001 GAME FREAK Inc.
//
//	2001.9.28 fld_tool.c から切り離し
//
//=========================================================================

#include "common.h"

#define PLAYTIME_H_GLOBAL
#include "playtime.h"

enum{
	PT_STOP_MODE,
	PT_MOVE_MODE,
	PT_MAX_MODE,
};

static u8 PlayTimeCtrl;

static void PlayTimeMaxSet(void);

//-------------------------------------------------------------
//	プレイ時間初期化
//-------------------------------------------------------------
void PlayTimeInit(void)
{
	PlayTimeCtrl = PT_STOP_MODE;
	MyData.playtime_h = 0;
	MyData.playtime_m = 0;
	MyData.playtime_s = 0;
	MyData.playtime_ms = 0;
};

//-------------------------------------------------------------
//	プレイ時間カウントスタート
//-------------------------------------------------------------
void PlayTimeStart(void)
{
	PlayTimeCtrl = PT_MOVE_MODE;

	if( MyData.playtime_h >= PLAYTIME_H_MAX ) PlayTimeMaxSet();
};

//-------------------------------------------------------------
//	プレイ時間カウントストップ
//-------------------------------------------------------------
void PlayTimeStop(void)
{
	PlayTimeCtrl = PT_STOP_MODE;
};

//-------------------------------------------------------------
//	プレイ時間カウントアップ
//	※main.cから呼ばれているので処理落ちすると
//	　カウントも遅れる
//-------------------------------------------------------------
void PlayTimeCount(void)
{
	if( PlayTimeCtrl != PT_MOVE_MODE )return;

	MyData.playtime_ms ++;
	if( MyData.playtime_ms < 60 )return;
	MyData.playtime_ms = 0;
	MyData.playtime_s ++;
	if( MyData.playtime_s < 60 )return;
	MyData.playtime_s = 0;
	MyData.playtime_m ++;
	if( MyData.playtime_m < 60 )return;
	MyData.playtime_m = 0;
	MyData.playtime_h ++;
	if( MyData.playtime_h < PLAYTIME_H_MAX )return;

	PlayTimeMaxSet();
};

//-------------------------------------------------------------
//-------------------------------------------------------------
static void PlayTimeMaxSet(void)
{
	PlayTimeCtrl = PT_MAX_MODE;
	MyData.playtime_h = PLAYTIME_H_MAX - 1;
	MyData.playtime_m = 59;
	MyData.playtime_s = 59;
	MyData.playtime_ms = 59;
};



