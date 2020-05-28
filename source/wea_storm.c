/***********************************************************************
**
**	天候エフェクトタスク制御（すなあらし）
**
***********************************************************************/
#include "wea_com.h"

/*==============================================
==	グローバル変数
==============================================*/
static const actHeader StormObj;

/*==============================================
==	関数プロトタイプ
==============================================*/
static void add_storm_obj(void);
static void add_storm2_obj(void);
static void del_storm_obj(void);

static void StormActMove(actWork *act);
static void Storm2ActMove(actWork *act);
static void Storm2ActMove_Wait(actWork *act);

static void inc_storm_cnt(void);
static void calc_storm_line(void);

#define STORM_MOVE_BORDER_0  (32)
#define STORM_MOVE_BORDER_1  (96)
#define STORM_MOVE_BORDER_2  (120)

//==============================================
//	初期化
//==============================================
void InitStorm(void)
{
	wp->prog = 0;
	wp->direct_end = 0;

	wp->next_evy = 0;
	wp->evy_wait = CLOUD_CHANGE_WAIT;

	if(wp->storm_obj_flg == 0){
		wp->storm_xofs = wp->storm_yofs = 0;
		wp->storm_cnt = 8;
		wp->storm_cnt_sub = 0;
		if(wp->storm_cnt >= STORM_MOVE_BORDER_1){
			wp->storm_cnt = STORM_MOVE_BORDER_0 - (wp->storm_cnt - STORM_MOVE_BORDER_1);
		}
//		*(vu16*)REG_BLDCNT = BLD_A_BLEND_MODE | BLD_2ND_ALL;
		WeatherBlendInit(0x00,0x10);
	}
}
//==============================================
//	ダイレクト初期化
//==============================================
void DirectStorm(void)
{
	InitStorm();
	while(wp->direct_end == 0){
		StormProc();
	}
}
//==============================================
//	進行
//==============================================
void StormProc(void)
{
	calc_storm_line();
	inc_storm_cnt();

	if(wp->storm_cnt >= STORM_MOVE_BORDER_1){
		wp->storm_cnt = STORM_MOVE_BORDER_0;
	}


	switch(wp->prog){
	case 0:
		add_storm_obj();
		add_storm2_obj();
		wp->prog++;
		break;

	case 1:
		WeatherBlendReq(0x10,0x00,0);
		wp->prog++;
		break;

	case 2:
		if(WeatherBlendProg()){
			wp->direct_end = 1;
			wp->prog++;
		}
		break;

	default:
		break;
	}

}
//==============================================
//	終了
//==============================================
u8 QuitStorm(void)
{
	calc_storm_line();
	inc_storm_cnt();

	switch(wp->quit_prog){
	case 0:
		WeatherBlendReq(0x00, 0x10, 0);
		wp->quit_prog++;
		break;

	case 1:
		if(WeatherBlendProg()){
			wp->quit_prog++;
		}
		break;

	case 2:
		del_storm_obj();
		wp->quit_prog++;
		break;

	default:
		return 0;
	}

	return 1;
}

static void inc_storm_cnt(void)
{
	if(wp->storm_cnt_sub++ > 4){
		wp->storm_cnt++;
		wp->storm_cnt_sub = 0;
	}
}
static void calc_storm_line(void)
{
	wp->storm_xofs -= ((sin_cos_table[wp->storm_cnt]) * 4);
	wp->storm_yofs -= (sin_cos_table[wp->storm_cnt]);
	wp->storm_xline = (ActOX + (wp->storm_xofs >> 8)) & 255;
	wp->storm_yline = (ActOY + (wp->storm_yofs >> 8));
}
/***********************************************************************
**	アクター削除
***********************************************************************/
static void del_storm_obj(void)
{
	u16 i;
	if(wp->storm_obj_flg){
		for(i = 0; i < STORM_OBJ_MAX; i++){
			if(wp->storm_actor[i] != NULL){
				DelActor(wp->storm_actor[i]);
			}
		}
		wp->storm_obj_flg = 0;
		CellDel(WEATHER_CELLID_STORM);
	}
	if(wp->storm2_obj_flg){
		for(i = 0; i < STORM2_OBJ_MAX; i++){
			if(wp->storm2_actor[i] != NULL){
				DelActor(wp->storm2_actor[i]);
			}
		}
		wp->storm2_obj_flg = 0;
	}
}

/*======================================================================
==	すなあらしアクター用データ
======================================================================*/
/* --- ＯＡＭデータ --- */
static const ActOamData StormObjOam =
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
	1,										// u32 Priority:2
	0,										// u32 Pltt:3
	0,										// AffineWork
};
/* アニメテーブル */
static const actAnm StormObjAnm[]=
{
	{ 0,3,0,0},{ACT_ANMEND,0,0,0},
	{64,3,0,0},{ACT_ANMEND,0,0,0},
};
static const actAnm * const StormObjAnmTbl[] =
{
	StormObjAnm,
	StormObjAnm+2,
};
/* --- アクトヘッダ --- */
static const actHeader StormObj =
{
	WEATHER_CELLID_STORM,		// cell id
	WEATHER_PALID_EX,			// pal id
	&StormObjOam,		// oam
	StormObjAnmTbl,		// anm table
	ACT_NTRANS,			// trans table
	DummyActAffTbl,		// affine table
	StormActMove,		// move
};
enum STORM_WORK {
	STORMWK_XID,
	STORMWK_YID,
};
enum STORM2_WORK {
	ST2WK_R,
	ST2WK_ANGLE,
	ST2WK_R_CNT,
	ST2WK_WAIT,
	ST2WK_Y,
};
#define ST2_AY      (1)
#define ST2_R_INIT  (4)//(8)
#define ST2_AANGLE  (10)
#define ST2_APY     (64)

static void add_storm_obj(void)
{
	if(wp->storm_obj_flg == 0){
//		static const PalData  pal =  { storm_Palette, WEATHER_PALID_EX };
		static const CellData cell = { weather_storm_Character, sizeof(weather_storm_Character), WEATHER_CELLID_STORM };

		u16 i, no;

		CellSet(&cell);
//		ObjPalSet(&pal);
		WeatherEXPalReg(weather_storm_Palette);

		for(i = 0; i < STORM_OBJ_MAX; i++){
			no = AddActorBottom(&StormObj, 0, (i/5)*64, 1);
			if(no != ACT_MAX)
			{
				wp->storm_actor[i] = &ActWork[no];
				wp->storm_actor[i]->work[STORMWK_XID] = (i % 5);
				wp->storm_actor[i]->work[STORMWK_YID] = (i / 5);
//				wp->storm_actor[i]->banish = 1;
			}
			else
			{
				wp->storm_actor[i] = NULL;
			}
		}

		wp->storm_obj_flg = 1;
	}
}
static void add_storm2_obj(void)
{
	if(wp->storm2_obj_flg == 0){
		static const s16 wait_tbl[] = { 0, 120, 80, 160, 40 };
		u16 i, act_no;

		for(i = 0; i < STORM2_OBJ_MAX; i++){
			act_no = AddActorBottom(&StormObj, 24+i*48, 208, 1);
			if(act_no != ACT_MAX){
				wp->storm2_actor[i] = &ActWork[act_no];
				wp->storm2_actor[i]->oamData.Size = 2;
				wp->storm2_actor[i]->work[ST2WK_ANGLE] = i * 51;
				wp->storm2_actor[i]->work[ST2WK_R] = 8;
				wp->storm2_actor[i]->work[ST2WK_R_CNT] = 0;
				wp->storm2_actor[i]->work[ST2WK_Y] = 208 * 127;

				wp->storm2_actor[i]->work[ST2WK_WAIT] = wait_tbl[i];

				ActAnmChg(wp->storm2_actor[i],1);
				actCenterCalc(wp->storm2_actor[i], 0, 2, 0);

				wp->storm2_actor[i]->move = Storm2ActMove_Wait;
			}
			else
			{
				wp->storm2_actor[i] = NULL;
			}
			wp->storm2_obj_flg = 1;
		}
	}
}
static void StormActMove(actWork *act)
{
	act->dy = wp->storm_yline;
	act->x = (wp->storm_xline+32) + act->work[STORMWK_XID] * 64;
	if(act->x > 271){
		act->x = (wp->storm_xline+480)-((4-act->work[STORMWK_XID])*64);
		act->x &= 511;
	}
}
static void Storm2ActMove_Wait(actWork *act)
{
	if(!(act->work[ST2WK_WAIT]--)){
		act->move = Storm2ActMove;
	}
}
static void Storm2ActMove(actWork *act)
{
	u32 dx, dy;

	act->y -= ST2_AY;
	if(act->y < -48){
		act->y = 208;
		act->work[ST2WK_R] = ST2_R_INIT;
	}

	dx = act->work[ST2WK_R] * sin_cos_table[act->work[ST2WK_ANGLE]];
	dy = act->work[ST2WK_R] * sin_cos_table[act->work[ST2WK_ANGLE] + 64];
	act->dx = dx >> 8;
	act->dy = dy >> 8;

	act->work[ST2WK_ANGLE] += ST2_AANGLE;
	act->work[ST2WK_ANGLE] &= 0xff;

	if(++(act->work[ST2WK_R_CNT]) > 8){
		act->work[ST2WK_R_CNT] = 0;
		act->work[ST2WK_R]++;
	}
}
