/***********************************************************************
**
**	天候エフェクトタスク制御（きり２）
**
***********************************************************************/
#include "wea_com.h"

/*==============================================
==	定数
==============================================*/
/* --- アクターワーク定義 --- */
enum MIST2_ACT_WORK {
	M2WK_X,
	M2WK_Y,
};
/*==============================================
==	グローバル変数
==============================================*/
static const actHeader Mist2Obj;
/*==============================================
==	関数プロトタイプ
==============================================*/
static void add_mist2_obj(void);
static void del_mist2_obj(void);
static void calc_mist2_line(void);

//==============================================
//	初期化
//==============================================
void InitMist2(void)
{
	wp->prog = 0;
	wp->direct_end = 0;

	wp->next_evy = 0;
	wp->evy_wait = CLOUD_CHANGE_WAIT;

	wp->mist_timer = 0;
	wp->mist_scr = 1;

	if(wp->mist2_obj_flg == 0){
		wp->mist2_xcnt = 0;
		wp->mist2_ycnt = 0;
		wp->mist2_xofs = 0;
		wp->mist2_yofs = 0;
		wp->mist2_xline = 0;
		wp->mist2_yline = 0;
		WeatherBlendInit(0x00,0x10);
	}
}
//==============================================
//	ダイレクト初期化
//==============================================
void DirectMist2(void)
{
	InitMist2();
	while(wp->direct_end == 0){
		Mist2Proc();
	}
}
//==============================================
//	進行
//==============================================
void Mist2Proc(void)
{
	calc_mist2_line();

	switch(wp->prog){
	case 0:
		add_mist2_obj();
		wp->prog++;
		break;

	case 1:
		WeatherBlendReq(0x0c, 0x08, 8);
		wp->prog++;
		break;

	case 2:
		if(WeatherBlendProg()){
			wp->direct_end = 1;
			wp->prog++;
		}
		break;

	default:
		return;
	}
}
//==============================================
//	終了
//==============================================
u8 QuitMist2(void)
{
	calc_mist2_line();

	switch(wp->quit_prog){
	case 0:
		WeatherBlendReq(0x00,0x10,1);
		wp->quit_prog++;
		break;

	case 1:
		if(WeatherBlendProg()){
			wp->quit_prog++;
		}
		break;

	case 2:
		del_mist2_obj();
		wp->quit_prog++;
		break;

	default:
		return 0;
	}

	return 1;
}


/***********************************************************************
*	アクター基準ライン更新
***********************************************************************/
static void calc_mist2_line(void)
{
	if(++(wp->mist2_xcnt) > 2){
		wp->mist2_xofs++;
		wp->mist2_xcnt = 0;
	}
	if(++(wp->mist2_ycnt) > 4){
		wp->mist2_yofs++;
		wp->mist2_ycnt = 0;
	}
	wp->mist2_xline = (ActOX - wp->mist2_xofs) & 255;
	wp->mist2_yline = (ActOY + wp->mist2_yofs);
}

/***********************************************************************
**	アクター登録＆フェードイン
***********************************************************************/
static void add_mist2_obj(void)
{
	if(wp->mist2_obj_flg == 0){
		CellData cell = { weather_mist2_Character, sizeof(weather_mist2_Character), WEATHER_CELLID_MIST2 };
		actWork *act;
		u16 i, act_no;

		CellSet(&cell);

		for(i = 0; i < MIST2_OBJ_MAX; i++){
			act_no = AddActorBottom(&Mist2Obj, 0, (i/5)*64, 255);
			if(act_no != ACT_MAX)
			{
				act = &ActWork[act_no];
				act->work[M2WK_X] = (i % 5);
				act->work[M2WK_Y] = (i / 5);
				wp->mist2_actor[i] = act;
			}
			else{
				wp->mist2_actor[i] = NULL;
			}
		}
		wp->mist2_obj_flg = 1;
	}
}
/***********************************************************************
**	アクター削除
***********************************************************************/
static void del_mist2_obj(void)
{
	if(wp->mist2_obj_flg){
		u16 i;
		for(i = 0; i < MIST2_OBJ_MAX; i++){
			if(wp->mist2_actor[i] != NULL){
				DelActor(wp->mist2_actor[i]);
			}
		}
		CellDel(WEATHER_CELLID_MIST2);
		wp->mist2_obj_flg = 0;
	}
}

/***********************************************************************
**	アクター動作関数
***********************************************************************/
static void Mist2ActMove(actWork *act)
{
	act->dy = wp->mist2_yline;
	act->x = (wp->mist2_xline+32) + act->work[M2WK_X] * 64;
	if(act->x > 271){
		act->x = (wp->mist2_xline+480)-((4-act->work[M2WK_X])*64);
		act->x &= 511;
	}
}
/*======================================================================
==	きり２アクター用データ
======================================================================*/
/* --- ＯＡＭデータ --- */
static const ActOamData Mist2ObjOam =
{
	0,										// u32 VPos:8
	0,										// u32 AffineMode:2
	1,										// u32 ObjMode:2
	0,										// u32 Mosaic:1
	0,										// u32 ColorMode:1
	0,										// u32 Shape:2

	0,										// u32 HPos:9
	0,										// u32 AffineParamNo:5
	3,										// u32 Size:2

	0,										// u32 CharNo:10
	2,										// u32 Priority:2
	0,										// u32 Pltt:3
	0,										// AffineWork
};
/* アニメテーブル */
static const actAnm Mist2ObjAnm[]=
{
	{0,16,0,0},
	{ACT_ANMEND,0,0,0},
};
static const actAnm * const Mist2ObjAnmTbl[] =
{
	Mist2ObjAnm,
};
/* --- アクトヘッダ --- */
static const actHeader Mist2Obj =
{
	WEATHER_CELLID_MIST2,		// cell id
	WEATHER_PALID_COMMON,      // pal id
	&Mist2ObjOam,		// oam
	Mist2ObjAnmTbl,		// anm table
	ACT_NTRANS,			// trans table
	DummyActAffTbl,		// affine table
	Mist2ActMove,		// move
};
