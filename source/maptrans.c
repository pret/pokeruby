/**********************************************************************/
/*  マップデータ転送                                                  */
/**********************************************************************/
#include "common.h"
#include "maptrans.h"

/**********************************************************************/
/*  グローバル変数                                                    */
/**********************************************************************/
static MAP_TRANS_WORK *wp = NULL;

/**********************************************************************/
/*  プロトタイプ                                                      */
/**********************************************************************/
static void trans_func(MAP_TRANS_PARAM *param);
static void clear_func(MAP_TRANS_PARAM *param);

/*=============================================
==	初期化
==	work   ワークエリアの先頭アドレス
==	param  パラメータエリアの先頭アドレス
==	max    パラメータ配列の数
=============================================*/
void MapTransInit(MAP_TRANS_WORK *work, MAP_TRANS_PARAM *param, u8 max)
{
	wp = work;
	wp->param = param;
	wp->max = max;
	wp->cnt = 0;
}
/*=============================================
==	マップデータ転送実行（V Blank）
=============================================*/
void MapTrans(void)
{
	if(wp->cnt){
		MAP_TRANS_PARAM *param;
		u16 i;
		for(i = 0; i < wp->cnt; i++){
			param = &(wp->param[i]);
			(*(param->func))(param);
		}
		wp->cnt = 0;
	}
}
/*==============================================
==	マップデータ転送リクエスト
==
==	dst            転送先マップデータ領域の先頭アドレス
==  dx,dy          転送先セル座標（0～29）
==  src            転送元マップデータアドレス
==  sx, sy         転送元セル座標（0～29）
==  width, height  転送矩形サイズ（0～29）
==  src_xcell      転送元マップデータの横セル数
==
==  return:  通常1, 失敗0
==
==============================================*/
u8 MapTransReq(u16 *dst, u16 dx, u16 dy, const u16 *src, u16 sx, u16 sy, u16 width, u16 height, u16 src_xcell)
{
	MAP_TRANS_PARAM *param;

	if(wp->cnt >= wp->max){ return 0; }

	param = &(wp->param[wp->cnt++]);
	param->size = width * sizeof(u16);
	param->dst = dst + (dy * 32 + dx);
	param->src = src + (sy * src_xcell + sx);
	param->height = height;
	param->xcell = src_xcell;
	param->func = trans_func;

	return 1;
}
/*==============================================
==	転送実行関数
==	param  転送パラメータ構造体
==============================================*/
static void trans_func(MAP_TRANS_PARAM *param)
{
	u16 i;
	for(i = 0; i < param->height; i++){
		CpuCopy(param->src, param->dst, param->size, 16);
		param->dst += 32;
		param->src += param->xcell;
	}
}

/*==============================================
==	マップデータゼロクリアリクエスト
==
==	dst            転送先マップデータ領域の先頭アドレス
==  dx,dy          転送先セル座標（0～29）
==  width, height  転送矩形サイズ（0～29）
==
==  return:  通常1, 失敗0
==
==============================================*/
u8 MapClearReq(u16 *dst, u16 dx, u16 dy, u16 width, u16 height)
{
	MAP_TRANS_PARAM *param;

	if(wp->cnt >= wp->max){ return 0; }

	param = &(wp->param[wp->cnt++]);
	param->size = width * sizeof(u16);
	param->dst = dst + (dy * 32 + dx);
	param->height = height;
	param->func = clear_func;

	return 1;
}
/*==============================================
==	ゼロクリア実行関数
==	param  転送パラメータ構造体
==============================================*/
static void clear_func(MAP_TRANS_PARAM *param)
{
	u16 i;
	for(i = 0; i < param->height; i++){
		DIV_DMACLEAR(3, 0, param->dst, param->size, 16);
		param->dst += 32;
	}
}
