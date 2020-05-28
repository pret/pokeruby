/***********************************************************************
**
**	天候エフェクトタスク制御
**
***********************************************************************/
#include "wea_com.h"
#include "laster.h"
#include "ev_sub.h"
#include "fld_tool.h"
#include "wea_ctrl.h"
#include "ef_tool.h"



//#define SHINE3_TBL_MAKE   // 日照りのテーブルをﾌﾟﾛｸﾞﾗﾑで作成するか？

#ifndef SHINE3_TBL_MAKE
#include "stbl.dat"  // 47c8 H bytes
#endif


/*==============================================
==	定数
==============================================*/
//static u8 MIST_EVY = 4;
//static u16 MIST_RGB = 0x7fff;


typedef struct {
	s16  body[VERYSHINE_LV_MAX][0x1000];
}SHINE_TABLE;
static SHINE_TABLE * const STbl = (SHINE_TABLE*)(UserWork);

/*==============================================
==	ワーク領域
==============================================*/
static WEATHER_WORK WorkBody ={};
WEATHER_WORK* const wp = &WorkBody;

/*==============================================
==	フェードルーチン用変数
==============================================*/
extern u16 PaletteWork[0x200];
extern u16 PaletteWorkTrans[0x200];

/*==============================================
==	関数プロトタイプ
==============================================*/
static void TaskWeatherWait(u8 id);

// サブプロセス初期化
static void init_off_proc(void);

// サブプロセス
static void off_proc(void);
static u8 off_quit_proc(void);

static void FieldWeatherTask(u8 my_no);
static void make_weather_fade_tbl(void);

// ﾌｪｰﾄﾞﾙｰﾁﾝ
static void fade_effect(void);    // ｴﾌｪｸﾄ用
static void fade_field_in(void);  // ﾌｨｰﾙﾄﾞｲﾝ用
static void fade_field_out(void); // ﾌｨｰﾙﾄﾞｱｳﾄ用

static void mist_fadein_reserve(u8 palno);




//=========================================================================
//
//	サブプロセステーブル
//
//=========================================================================
static const struct {
	pFunc init_proc;
	pFunc proc;
	pFunc direct_func;
	u8 (*quit_proc)(void);
}sub_proc_tbl[] = {
/*WEATHER_OFF*/			{ init_off_proc,   off_proc,    init_off_proc, off_quit_proc },
/*WEATHER_SHINE*/		{ InitShine,       ShineProc,   DirectShine,   QuitShine  },
/*WEATHER_SHINE2*/		{ InitShine2,      Shine2Proc,  DirectShine2,  QuitShine2 },
/*WEATHER_RAIN*/		{ InitRain,        RainProc,    DirectRain,    QuitRain   },
/*WEATHER_SNOW*/		{ InitSnow,        SnowProc,    DirectSnow,    QuitSnow   },
/*WEATHER_THUNDER*/		{ InitThunder,     ThunderProc, DirectThunder, QuitThunder},
/*WEATHER_MIST*/		{ InitMist,        MistProc,    DirectMist,    QuitMist   },
/*WEATHER_ASH*/			{ InitAsh,         AshProc,     DirectAsh,     QuitAsh    },
/*WEATHER_STORM*/		{ InitStorm,       StormProc,   DirectStorm,   QuitStorm  },
/*WEATHER_MIST2*/		{ InitMist2,       Mist2Proc,   DirectMist2,   QuitMist2  },
/*WEATHER_SEA*/			{ InitMist,        MistProc,    DirectMist,    QuitMist   },
/*WEATHER_CLOUD*/		{ InitCloud,       CloudProc,   DirectCloud,   QuitCloud  },
/*WEATHER_SHINE3*/		{ InitShine3,      Shine3Proc,  DirectShine3,  QuitShine3 },
/*WEATHER_HEAVYRAIN*/	{ InitHeavyRain,   ThunderProc, DirectHeavyRain, QuitThunder },
/*WEATHER_MARINE*/		{ InitMarine,      MarineProc,  DirectMarine,  QuitMarine },
};

/***********************************************************************
**
**	天候コントロールタスク初期化
**
***********************************************************************/
void WeatherInit(void)
{
	if(CheckTask(FieldWeatherTask) == FALSE){
		u8 palno;

		palno = ObjPalNumSet(WEATHER_PALID_COMMON);
		CpuCopy((void*)weather_common_Palette, (void*)(&(PaletteWork[256+palno*16])), 0x20, 32);
		make_weather_fade_tbl();

		wp->compal_num = palno;

		palno = ObjPalNumSet(WEATHER_PALID_EX);
		wp->expal_num = palno;

		wp->rain_obj_cnt = 0;
		wp->rain_disp_cnt = 0;
		wp->cloud_obj_flg = 0;
		wp->snow_obj_cnt = 0;
		wp->ash_obj_flg = 0;
		wp->mist_actor_flg = 0;
		wp->mist2_obj_flg = 0;
		wp->storm_obj_flg = 0;
		wp->storm2_obj_flg = 0;
		wp->awa_actor_flg = 0;
		wp->mist_fadein_palcnt = 0;
		WeatherBlendInit(0x10,0x00);

		wp->status = WEATHER_OFF;
		wp->fade_mode = FADEMODE_NULL;
		wp->fadereq_flg = 0;
		wp->smooth_end = 1;

//		wp->s3_tbl_make_end = 0;
		wp->task_id = AddTask(TaskWeatherWait, 80);
	}
}
/***********************************************************************
**
**	天候変化通知（徐々に変化）
**
***********************************************************************/
void WeatherChangeSmooth(u8 weather)
{
	if(IS_RAINY_WEATHER(weather)==0)
	{
		StopRainSound();
	}

	if(wp->next_status != weather
	&& wp->status == weather)
	{
		(sub_proc_tbl[weather].init_proc)();
	}

	wp->smooth_end = 0;
	wp->next_status = weather;
	wp->quit_prog = 0;
}
/***********************************************************************
**
**	天候変化通知（瞬時に変化）
**
***********************************************************************/
void WeatherChangeDirect(u8 weather)
{
	StopRainSound();

	wp->status = weather;
	wp->next_status = weather;

//	(sub_proc_tbl[weather].direct_func)();
}
/***********************************************************************
**
**	天候変化通知（デモ用）
**
***********************************************************************/
void WeatherChangeDemo(u8 weather)
{
	StopRainSound();

	wp->status = weather;
	wp->next_status = weather;

	wp->fadereq_flg = 1;
//	(sub_proc_tbl[weather].direct_func)();
}
//======================================================================
//  天候タスクフェードリクエスト待ち
//======================================================================
static void TaskWeatherWait(u8 id)
{
	if(wp->fadereq_flg){
		(sub_proc_tbl[wp->status].direct_func)();
		TaskTable[id].TaskAdrs = FieldWeatherTask;
	}
}

/***********************************************************************
**
**	天候コントロールタスクメイン
**
***********************************************************************/
static const pFunc FadeFuncTbl[] = 
{
	fade_effect,     // ｴﾌｪｸﾄ用
	fade_field_in,   // ﾌｨｰﾙﾄﾞｲﾝ用
	fade_field_out,  // ﾌｨｰﾙﾄﾞｱｳﾄ用
	fade_field_out,  // 何もしない
};
static void FieldWeatherTask(u8 my_no)
{
	if(wp->status != wp->next_status){
		if(!(sub_proc_tbl[wp->status].quit_proc)()){
			(sub_proc_tbl[wp->next_status].init_proc)();
			wp->evy_timer = 0;
			wp->fade_mode = FADEMODE_WEATHER;
			wp->status = wp->next_status;
			wp->smooth_end = 1;
		}
	}else{
		(sub_proc_tbl[wp->status].proc)();
	}

	(FadeFuncTbl[wp->fade_mode])();
}
/***********************************************************************
**
**	天候オフ時の各サブプロセス
**
***********************************************************************/
//-------------------------------------
// 初期化・ダイレクト初期化
//-------------------------------------
static void init_off_proc(void)
{
//	wp->now_evy = 0;
	wp->next_evy = 0;
	wp->evy_wait = 0;
}
//-------------------------------------
// 更新
//-------------------------------------
static void off_proc(void)
{
	// 何もしない
}
//-------------------------------------
// 終了  0:終了  1:継続中
//-------------------------------------
static u8 off_quit_proc(void)
{
	return 0;
}



/*============================================================================*/
/*                                                                            */
/*  天候用ﾊﾟﾚｯﾄﾌｪｰﾄﾞ                                                          */
/*                                                                            */
/*============================================================================*/

//-----------------------------------------
// ﾏｸﾛ
//-----------------------------------------
#define GET_R(c) ((c)&0x1f)
#define GET_G(c) (((c)>>5)&0x1f)
#define GET_B(c) (((c)>>10)&0x1f)

#define RGB(r,g,b) (((b)<<10)| ((g)<<5) | (r))
#define RGBto12BIT(r,g,b)  (((((b)&0x1e)<<7) | (((g)&0x1e)<<3) | (((r)&0x1e)>>1)))

#define COLORto12BIT(c)  ((((c)>>1)&0x000f) | (((c)>>2)&0x00f0) | (((c)>>3)&0x0f00))

//-----------------------------------------
// ｸﾞﾛｰﾊﾞﾙ
//-----------------------------------------
// 0:ｽｷｯﾌﾟ  1:BG用  2:OBJ用を使用
static const u8 FadeTblTypeDefault[32] = {
	1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,   // BG  0～15
	2,1,2,2,2,2,1,1,1,1,2,1,1,1,1,1,   // OBJ 0～15（映りこみはBGに合わせて暗く）
};
static u8 FadeTblTypeSkip[32] = {};

static const u8 *FadeTblType;

//-----------------------------------------
// ﾌﾟﾛﾄﾀｲﾌﾟ
//-----------------------------------------
static void weather_fade(u8 begin, u8 end, s8 evy);
static void cloud_fadein_fade(u8 begin, u8 end, s8 fade_evy, u8 evy, u16 col);
static void shine3_fadein_fade(s8 fade_evy, u8 evy, u16 col);
static void mist_fadein_fade(u8 evy, u16 col);

/***********************************************************************
**	フェードカラーテーブル作製
**
**	引数・戻り値	-
**
***********************************************************************/
static void make_weather_fade_tbl(void)
{
	u16 obj, col, evy, unit, base_col, fade_col;
	s16 diff_col;
	u8 (*fade_tbl)[32];

	FadeTblType = FadeTblTypeDefault;

	for(obj = 0; obj < 2; obj++){
		fade_tbl = (obj==0)? wp->bg_fade_tbl : wp->obj_fade_tbl;

		for(col = 0; col < 32; col++){
			base_col = col;
			fade_col = col << 8;

			if(obj==0){
				unit = (base_col<<8) / 16;
			}else{
				unit = 0;
			}

			// 曇天ﾊﾟﾚｯﾄ
			for(evy = 0; evy < FADE_CLOUD_MAX; evy++){
				fade_col -= unit;
				fade_tbl[evy][col] = (fade_col >> 8);
			}

			// 雷光ﾊﾟﾚｯﾄ
			base_col = fade_col;
			unit = ((31<<8)-fade_col) / 16;

			if(col < 12){
				// 暗い色は元の色を残し目にする
				for(  ; evy < FADE_THUNDER_MAX; evy++){
					fade_col += unit;
					diff_col = fade_col - base_col;
					if(diff_col > 0){
						fade_col -= (diff_col/2);
					}
					fade_tbl[evy][col] = (fade_col>>8);
					if(fade_tbl[evy][col] > 31){
						fade_tbl[evy][col] = 31;
					}
				}
			}else{
				for(  ; evy < FADE_THUNDER_MAX; evy++){
					fade_col += unit;
					fade_tbl[evy][col] = (fade_col>>8);
					if(fade_tbl[evy][col] > 31){
						fade_tbl[evy][col] = 31;
					}
				}
			}
		}
	}
}
/***********************************************************************
**
**	パレットフェード
**
***********************************************************************/
//======================================================
// 天候エフェクト用パレットフェード
//======================================================
static void fade_effect(void)
{
	if(wp->now_evy == wp->next_evy)
	{
		wp->fade_mode = FADEMODE_NULL;
		return;
	}

	if(++(wp->evy_timer) >= wp->evy_wait)
	{
		wp->evy_timer = 0;
		if(wp->now_evy < wp->next_evy){
			wp->now_evy++;
		}else{
			wp->now_evy--;
		}

		weather_fade(0,32,wp->now_evy);
	}
}
//======================================================
// フィールド復帰用パレットフェード
//======================================================
static u8 fadein_cloud(void);
static u8 fadein_shine3(void);
static u8 fadein_mist(void);

static void fade_field_in(void)
{
	if(++(wp->fade_fill_cnt) > 1){
		wp->fade_fill_flg = 0;
	}

	switch(wp->status){
	case WEATHER_RAIN:
	case WEATHER_SNOW:
	case WEATHER_THUNDER:
	case WEATHER_CLOUD:
	case WEATHER_HEAVYRAIN:
		if(!fadein_cloud()){
			wp->now_evy = FADE_CLOUD_MAX;
			wp->fade_mode = FADEMODE_NULL;
		}
		break;

	case WEATHER_SHINE3:
		if(!fadein_shine3()){
			wp->now_evy = -VERYSHINE_LV_MAX;
			wp->fade_mode = FADEMODE_NULL;
		}
		break;

	case WEATHER_MIST:
		if(!fadein_mist()){
			wp->now_evy = 0;
			wp->fade_mode = FADEMODE_NULL;
		}
		break;

	// 通常は PaletteFadeReq が呼ばれるので待つだけ
	default:
		if(FadeData.fade_sw==0){
			wp->now_evy = wp->next_evy;
			wp->fade_mode = FADEMODE_NULL;
		}
		break;
	}
}
//------------------------------------
// 曇天用ﾌｪｰﾄﾞｲﾝ  0:終了  1:継続中
//------------------------------------
static u8 fadein_cloud(void)
{
	if(wp->fadein_step == 16)
	{
		return 0;
	}

	if(++(wp->fadein_step) >= 16)
	{
		weather_fade(0,32,FADE_CLOUD_MAX);
		wp->fadein_step = 16;
		return 0;
	}
	else
	{
		cloud_fadein_fade(0,32,FADE_CLOUD_MAX, 16-wp->fadein_step, wp->fadein_col);
	}
	return 1;
}
//------------------------------------
// 日照り用ﾌｪｰﾄﾞｲﾝ  0:終了  1:継続中
//------------------------------------
static u8 fadein_shine3(void)
{
	if(wp->fadein_step == 16)
	{
		return 0;
	}

	if(++(wp->fadein_step) >= 16)
	{
		weather_fade(0,32,-VERYSHINE_LV_MAX);
		wp->fadein_step = 16;
		return 0;
	}
	else
	{
		shine3_fadein_fade(-VERYSHINE_LV_MAX, 16-wp->fadein_step, wp->fadein_col);
	}
	return 1;
}
//------------------------------------
// 霧用ﾌｪｰﾄﾞｲﾝ  0:終了  1:継続中
//------------------------------------
static u8 fadein_mist(void)
{
	if(wp->fadein_step == 16)
	{
		return 0;
	}

	wp->fadein_step++;
	mist_fadein_fade(16-wp->fadein_step, wp->fadein_col);

	return 1;
}
//======================================================
// フィールドアウト用パレットフェード
//======================================================
static void fade_field_out(void)
{
	// PaletteFadeReqでﾘｸｴｽﾄを出したまま、後は何もしない
}
/*====================================================================*/
/*  天候ｴﾌｪｸﾄ用ﾌｪｰﾄﾞﾙｰﾁﾝ                                              */
/*                                                                    */
/*  begin  何番目のパレットから開始するか？（0～31）                  */
/*  end    パレット何本？                                             */
/*  evy    係数（天候独自）                                           */
/*                                                                    */
/*====================================================================*/
static void weather_fade(u8 begin, u8 end, s8 evy)
{
	u16 p, c, n;
	u8 r,g,b;

	// 曇天
	if(evy > 0){
		u8 *fade_tbl;

		evy--;

		n = begin << 4;
		end += begin;
		for(p = begin; p < end; p++){
			if(FadeTblType[p] == 0){
				CpuFastCopy(PaletteWork+n, PaletteWorkTrans+n, 0x20);
				n += 16;
				continue;
			}else{
				if(FadeTblType[p] == 2
				|| (p-16) == wp->compal_num
				){
					fade_tbl = wp->obj_fade_tbl[evy];
				}else{
					fade_tbl = wp->bg_fade_tbl[evy];
				}
			}
			for(c = 0; c < 16; c++){
				r = fade_tbl[ ((PlttData*)(&PaletteWork[n]))->Red ];
				g = fade_tbl[ ((PlttData*)(&PaletteWork[n]))->Green ];
				b = fade_tbl[ ((PlttData*)(&PaletteWork[n]))->Blue ];

				PaletteWorkTrans[n++] = RGB(r,g,b);
			}
		}

	// 日照り
	}else if(evy < 0){

		evy = (evy * -1) - 1;

		n = begin << 4;
		end += begin;

		for(p = begin; p < end; p++){
			if(FadeTblType[p] == 0){
				CpuFastCopy(PaletteWork+n, PaletteWorkTrans+n, 0x20);
				n += 16;
				continue;
			}else{
				for(c = 0; c < 16; c++){
					PaletteWorkTrans[n] = STbl->body[evy][COLORto12BIT(PaletteWork[n])];
					n++;
				}
			}
		}

	// そのまま
	}else{
		n = begin << 4;
		CpuFastCopy(&(PaletteWork[n]), &(PaletteWorkTrans[n]), 0x20*end);
	}
}
/*====================================================================*/
/*  曇天ﾌｨｰﾙﾄﾞ復帰用ﾌｪｰﾄﾞﾙｰﾁﾝ                                         */
/*                                                                    */
/*  begin  何番目のパレットから開始するか？（0～31）                  */
/*  cnt    パレット何本？                                             */
/*  fade_evy    係数（天候独自）                                      */
/*  evy    係数（ﾊﾟﾚｯﾄﾌｪｰﾄﾞと同様）                                   */
/*  col    ﾌｪｰﾄﾞｶﾗｰ                                                   */
/*                                                                    */
/*====================================================================*/
#define COLOR_FADE(b, a, evy)  (b+((a-b)* evy >> 4))

static void cloud_fadein_fade(u8 begin, u8 end, s8 fade_evy, u8 evy, u16 col)
{
	u8 *fade_tbl;
	u16 p, c, n;
	u8 r,g,b, fade_r, fade_g, fade_b;

	fade_r = ((PlttData*)(&col))->Red;
	fade_g = ((PlttData*)(&col))->Green;
	fade_b = ((PlttData*)(&col))->Blue;

	n = begin << 4;
	end += begin;
	fade_evy--;

	for(p = begin; p < end; p++){
		if(FadeTblType[p] == 0){
			SoftFade(n, 16, evy, col);
			n += 16;
			continue;
		}else{
			fade_tbl = (FadeTblType[p]==1)?  wp->bg_fade_tbl[fade_evy] : wp->obj_fade_tbl[fade_evy];
		}
		for(c = 0; c < 16; c++){
			r = fade_tbl[ ((PlttData*)(&PaletteWork[n]))->Red ];
			g = fade_tbl[ ((PlttData*)(&PaletteWork[n]))->Green ];
			b = fade_tbl[ ((PlttData*)(&PaletteWork[n]))->Blue ];

			r = COLOR_FADE(r,fade_r,evy);
			g = COLOR_FADE(g,fade_g,evy);
			b = COLOR_FADE(b,fade_b,evy);

			PaletteWorkTrans[n++] = RGB(r,g,b);
		}
	}
}
/*====================================================================*/
/*  日照りﾌｨｰﾙﾄﾞ復帰用ﾌｪｰﾄﾞﾙｰﾁﾝ                                       */
/*                                                                    */
/*  fade_evy    係数（天候独自）                                      */
/*  evy    係数（ﾊﾟﾚｯﾄﾌｪｰﾄﾞと同様）                                   */
/*  col    ﾌｪｰﾄﾞｶﾗｰ                                                   */
/*                                                                    */
/*====================================================================*/
static void shine3_fadein_fade(s8 fade_evy, u8 evy, u16 col)
{
	u16 p, c, n, src_col;
	u8 r,g,b, fade_r, fade_g, fade_b;

	fade_evy = (fade_evy * -1) - 1;

	fade_r = ((PlttData*)(&col))->Red;
	fade_g = ((PlttData*)(&col))->Green;
	fade_b = ((PlttData*)(&col))->Blue;

	n = 0;
	for(p = 0; p < 32; p++){
		if(FadeTblType[p] == 0){
			SoftFade(n, 16, evy, col);
			n += 16;
			continue;
		}else{
			for(c = 0; c < 16; c++){
				r = ((PlttData*)(&PaletteWork[n]))->Red;
				g = ((PlttData*)(&PaletteWork[n]))->Green;
				b = ((PlttData*)(&PaletteWork[n]))->Blue;

				src_col = RGBto12BIT(r,g,b);

				r = ((PlttData*)(&(STbl->body[fade_evy][src_col])))->Red;
				g = ((PlttData*)(&(STbl->body[fade_evy][src_col])))->Green;
				b = ((PlttData*)(&(STbl->body[fade_evy][src_col])))->Blue;

				r = COLOR_FADE(r,fade_r,evy);
				g = COLOR_FADE(g,fade_g,evy);
				b = COLOR_FADE(b,fade_b,evy);

				PaletteWorkTrans[n++] = RGB(r,g,b);
			}
		}
	}
}
/*====================================================================*/
/*  霧ﾌｨｰﾙﾄﾞ復帰用ﾌｪｰﾄﾞﾙｰﾁﾝ                                           */
/*                                                                    */
/*  evy    係数（ﾊﾟﾚｯﾄﾌｪｰﾄﾞと同様）                                   */
/*  col    ﾌｪｰﾄﾞｶﾗｰ                                                   */
/*                                                                    */
/*====================================================================*/
static u8 mist_fadein_palchk(u8 palno);

#define MIST_EVY  (12)

#define MIST_R  (0x1c)
#define MIST_G  (0x1f)
#define MIST_B  (0x1c)

#define MIST_RGB  (RGB(MIST_R,MIST_G,MIST_B)) //(0x73fc)

static void mist_fadein_fade(u8 evy, u16 col)
{
	u16 i,n;
	u8 r,g,b, fade_r,fade_g,fade_b;

// BGは普通のｿﾌﾄﾌｪｰﾄﾞ
	SoftFade(0,256,evy,col);

// 
	fade_r = ((PlttData*)(&col))->Red;
	fade_g = ((PlttData*)(&col))->Green;
	fade_b = ((PlttData*)(&col))->Blue;

	for(i = 16; i < 32; i++)
	{
		if(mist_fadein_palchk(i))
		{
			u16 end_pal = (i+1)<<4;
			for(n = i<<4; n < end_pal; n++)
			{
				r = ((PlttData*)(&PaletteWork[n]))->Red;
				g = ((PlttData*)(&PaletteWork[n]))->Green;
				b = ((PlttData*)(&PaletteWork[n]))->Blue;

				r = COLOR_FADE(r,MIST_R,MIST_EVY);
				g = COLOR_FADE(g,MIST_G,MIST_EVY);
				b = COLOR_FADE(b,MIST_B,MIST_EVY);

				r = COLOR_FADE(r,fade_r,evy);
				g = COLOR_FADE(g,fade_g,evy);
				b = COLOR_FADE(b,fade_b,evy);

				PaletteWorkTrans[n] = RGB(r,g,b);

			}
		}
		else
		{
			SoftFade(i<<4,16,evy,col);
		}
	}
}
//--------------------------------------------
// 霧ﾌｪｰﾄﾞｲﾝ時ﾊﾟﾚｯﾄ補正をするﾅﾝﾊﾞｰ予約
//--------------------------------------------
static void mist_fadein_reserve(u8 palno)
{
	if(wp->mist_fadein_palcnt < MISTFADEIN_PALMAX)
	{
		wp->mist_fadein_palno[wp->mist_fadein_palcnt] = palno;
		wp->mist_fadein_palcnt++;
	}
}
//--------------------------------------------
// 予約ﾅﾝﾊﾞｰにあたるかﾁｪｯｸ
//--------------------------------------------
static u8 mist_fadein_palchk(u8 palno)
{
	u16 i;
	for(i = 0; i < wp->mist_fadein_palcnt; i++)
	{
		if(wp->mist_fadein_palno[i] == palno){ return 1; }
	}
	return 0;
}

/************************************************************
**	ﾌｨｰﾙﾄﾞ全体を、瞬時に指定evy値に（ｶﾐﾅﾘ用）
************************************************************/
void WeatherFadeNow(s8 evy)
{
	if(wp->fade_mode == FADEMODE_NULL){
		weather_fade(0,32,evy);
		wp->now_evy = evy;
	}
}
/************************************************************
**	ﾌｨｰﾙﾄﾞ全体へﾌｪｰﾄﾞﾘｸｴｽﾄ
**  begin   開始evy
**  end     終了evy
**  wait    更新間隔
************************************************************/
void WeatherFadeReq(s8 begin, s8 end, u8 wait)
{
	if(wp->fade_mode == FADEMODE_NULL)   // ﾌｪｰﾄﾞｲﾝ･ｱｳﾄ中は何もしない
	{
		wp->fade_mode = FADEMODE_WEATHER;
		wp->now_evy = begin;
		wp->next_evy = end;
		wp->evy_timer = 0;
		wp->evy_wait = wait;
		WeatherFadeNow(begin);
	}
}
/***********************************************************************
**	フィールド－他画面間のフェードリクエスト
**
**	引数	mode     フェードモード（enum FIELD_FADE_MODE）
**          wait     フェード間隔（PaletteFadeReq と同じ）
**
**	戻り値	-
**
***********************************************************************/
void FieldFadeControl(u8 mode, u8 wait)
{
	u16 col;
	u8 out, ex_weather;

	switch(mode){
	case FIELD_BLACK_IN:
		col = 0x0000;
		out = 0;
		break;
	case FIELD_WHITE_IN:
		col = 0xffff;
		out = 0;
		break;

	case FIELD_BLACK_OUT:
		col = 0x0000;
		out = 1;
		break;

	case FIELD_WHITE_OUT:
		col = 0xffff;
		out = 1;
		break;

	default:
		return;
	}

	switch(wp->status){
	case WEATHER_THUNDER:
	case WEATHER_HEAVYRAIN:
	case WEATHER_RAIN:
	case WEATHER_SNOW:
	case WEATHER_SHINE3:
	case WEATHER_CLOUD:
	case WEATHER_MIST:
		ex_weather = 1;
		break;
	default:
		ex_weather = 0;
		break;
	}

	// ﾌｪｰﾄﾞｱｳﾄ
	if(out){
		if(ex_weather){
			CpuFastCopy(PaletteWorkTrans, PaletteWork, 0x20*32);
		}
		PaletteFadeReq(0xffffffff, wait, 0, 16, col);

		wp->fade_mode = FADEMODE_OUT;

	// ﾌｪｰﾄﾞｲﾝ
	}else{
		wp->fadein_col = col;
		if(ex_weather){
			wp->fadein_step = 0;
		}else{
			PaletteFadeReq(0xffffffff, wait, 16, 0, col);
		}

		wp->fade_mode = FADEMODE_IN;
		wp->fade_fill_flg = 1;
		wp->fade_fill_cnt = 0;

		WeatherBlendInit(wp->eva, wp->evb);

		wp->fadereq_flg = 1;
	}
}
/***********************************************************************
**	フィールドフェードインの終了ﾁｪｯｸ
**
**	戻り値	0:継続中  1:終了
**
***********************************************************************/
u8 FieldFadeinCheck(void)
{
	return wp->fade_mode != FADEMODE_IN;
}
/***********************************************************************
**	フィールドに新規追加されたＯＢＪのパレットを、現在の天候に合わせる
**
**	pal_num   パレットナンバー（0-15）
**
***********************************************************************/
void FieldWeather_AdjustObjPal(u8 pal_num)
{
	u16 n = pal_num+16;

	switch(wp->fade_mode){
	case FADEMODE_IN:
		if(wp->fade_fill_flg){
			u16 i;

			if(wp->status == WEATHER_MIST)
			{
				mist_fadein_reserve(n);
			}

			n <<= 4;
			for(i = 0; i < 16; i++){
				PaletteWorkTrans[n+i] = wp->fadein_col;
			}
		}
		break;

	case FADEMODE_OUT:
		n <<= 4;
		CpuFastCopy(&PaletteWorkTrans[n], &PaletteWork[n], 0x20);
		SoftFade(n,16,FadeData.now_evy,FadeData.next_rgb);
		break;

	default:
		if(wp->status != WEATHER_MIST){
			weather_fade(n, 1, wp->now_evy);
		}else{
			n <<= 4;
			SoftFade(n,16,MIST_EVY,MIST_RGB);
		}
	}
}
/***********************************************************************
**	フィールドに新規追加されたＢＧのパレットを、現在の天候に合わせる
**
**	pal_num   パレットナンバー（0-15）
**
***********************************************************************/
void FieldWeather_AdjustBGPal(u8 pal_num)
{
	weather_fade(pal_num, 1, wp->now_evy);
}
/***********************************************************************
**	AdjustObjPal で、ﾊﾟﾚｯﾄを塗りつぶすかどうか？
**  return  0:塗りつぶさない  1:塗りつぶす
***********************************************************************/
u8 CheckWeatherAdjustFill(void)
{
	if(wp->fade_mode == FADEMODE_IN){
		return wp->fade_fill_flg;
	}
	return 0;
}
//=================================================================
// ｴﾌｪｸﾄOBJﾊﾟﾚｯﾄの登録
//=================================================================
void WeatherEXPalReg(const u16 *pal_data)
{
	PaletteWorkSet(pal_data, 256+wp->expal_num*16, 0x20);
	FieldWeather_AdjustObjPal(wp->expal_num);
}


#ifdef SHINE3_TBL_MAKE
/*====================================================================*/
/*  RGB <-> HLS  相互変換                                             */
/*                                                                    */
/*  RGB  GBAで使用される0～31の色成分                                 */
/*  HLS  H （色相） 0 ～ 359                                          */
/*       L （明度） 0 ～ 1  （小数点以下12bit）                       */
/*       S （彩度） 0 ～ 1  （小数点以下12bit）                       */
/*                                                                    */
/*====================================================================*/
// RGB -> HLS
static void RGBtoHLS(u8 r, u8 g, u8 b, u16 *h, u16 *l, u16 *s)
{
	u8 max, min;
	u32 L, S;
	s32 H;

	max = (r < g)? g : r;
	if(max < b){ max = b; }

	min = (r < g)? r : g;
	if(min > b){ min = b; }

	L = ((max << 12) + (min << 12)) / 62;

	if(max == min){
		H = S = 0;
	}else{
		if(L <= 0x800){
			S = ((max<<12)-(min<<12))/(max+min);
		}else{
			S = ((max<<12)-(min<<12))/(62-(max+min));
		}

		if(r == max){
			H = (((g<<8) - (b<<8)) / (max-min));
		}else if(g == max){
			H = (512 +  (((b<<8) - (r<<8)) / (max-min)));
		}else{
			H = (1024 +  (((r<<8) - (g<<8)) / (max-min)));
		}
		// この時点でＨの値は -256 ～ 1280
		while(H < 0){
			H += 1536;  // 色相１周分
		}
		// H = 0～1535
		H *= 60;  // H = 0～92100
		H >>= 8;  // H = 0～359
	}

	*h = H;
	*l = L;
	*s = S;
}

// HLS -> RGB
static u8 HLStoRGB_sub(s16 H, u32 max, u32 min);
static void HLStoRGB(u8 *r, u8 *g, u8 *b, u16 H, u16 L, u16 S)
{
	u32 max, min;

	if(L <= 0x800){
		min = L * (0x1000-S);
		max = (0x2000*L) - min;
	}else{
		max = L * (0x1000-S) + (S << 12);
		min = (0x2000*L) - max;
	}
	max >>= 12;
	min >>= 12;

	*r = HLStoRGB_sub(H+120, max, min);
	*g = HLStoRGB_sub(H    , max, min);
	*b = HLStoRGB_sub(H-120, max, min);
}
static u8 HLStoRGB_sub(s16 H, u32 max, u32 min)
{
	u32 val;
	if(H < 0){ H += 360; }
	if(H > 360){ H -= 360; }
	if(H < 60){
		val = min + (max-min) * H / 60;
	}else if(H < 180){
		val = max;
	}else if(H < 240){
		val = min + (max-min) * (240-H) / 60;
	}else{
		val = min;
	}
	val >>= 7;
	if(val > 31){ val = 31; }

	return (u8)val;
}
#endif

/*====================================================================*/
/*  日照りテーブル作成（実行）                                        */
/*                                                                    */
/*                                                                    */
/*====================================================================*/
static void make_shine_tbl(u8 *pr, u8 *pg)
{
#ifndef SHINE3_TBL_MAKE

	u8 r = *pr;

	if(r <= 6){
		u16 i;
		r -= 1;
		LZ77UnCompWram(stbl_sabun_dat[r], (void*)(STbl->body[r]));

		if(r==0){
			STbl->body[r][0] = STBL0_1STVAL;
			for(i = 1; i < 4096; i++)
			{
				STbl->body[r][i] += (STbl->body[r][i-1]);
			}
		}else{
			for(i=0;i<4096;i++)
			{
				STbl->body[r][i] += STbl->body[r-1][i];
			}
		}
		(*pr)++;
		if(*pr == 7){
			*pr = 32;
			*pg = 32;
		}
		return;
	}
#else

#define LGT_UNIT    (0x50)  // 明度増加単位
#define SAT_UNIT    (0x50)  // 彩度増加単位
#define LEVEL_MIN   (0)

	u16 h, l, s;
	u16 col, lv;
	u8  r,g, b, R, G, B;
	u8  cnt;
	r = *pr;
	g = *pg;



	for(cnt = 0; cnt < 1; cnt++){
//	for(r = 1; r < 32; r += 2){
//		for(g = 1; g < 32; g += 2){
			for(b = 1; b < 32; b += 2){
				col = RGBto12BIT(r,g,b);
				RGBtoHLS(r,g,b,&h,&l,&s);

				if(l < 0x400){
					for(lv = 0; lv < VERYSHINE_LV_MAX; lv++){
						STbl->body[lv][col] = RGB(r,g,b);
					}
				}else{
					l += (LGT_UNIT * (LEVEL_MIN + (l / 0x400)));
					s += (SAT_UNIT * (LEVEL_MIN + (s / 0x400)));
					if(l > 0x1000){ l = 0x1000; }
					if(s > 0x1000){ s = 0x1000; }
					for(lv = 0; lv < VERYSHINE_LV_MAX; lv++){
						HLStoRGB(&R,&G,&B,h,l,s);
						STbl->body[lv][col] = RGB(R,G,B);
						if(l < 0x1000){
							l += LGT_UNIT; if(l > 0x1000){ l = 0x1000; }
						}
						if(s < 0x1000){
							s += SAT_UNIT; if(s > 0x1000){ s = 0x1000; }
						}
					}
				}
			}
//		}
//	}

		g += 2;
		if(g >= 32){
			g = 1;
			r += 2;
			if(r >= 32){
				break;
			}
		}
	}

	*pr = r;
	*pg = g;

#endif
}
void WeatherS3TblMake_Begin(void)
{
	wp->s3_r = 1;
	wp->s3_g = 1;
}
u8 WeatherS3TblMake(void)
{
	if(wp->s3_r >= 32){
		return 0;
	}

	make_shine_tbl(&(wp->s3_r), &(wp->s3_g));
	if(wp->s3_r >= 32){
		return 0;
	}

	return 1;
}


static u16 SHINE_WAIT = 0;
static void veryshine_palchange(s8 pos)
{
	WeatherFadeNow(-(pos+1));
}
void WeatherVeryShineInit(void)
{
	wp->vs_level = 0;
	wp->vs_cnt = 0;
	wp->vs_vec = 0;
	wp->vs_before_level = 0;
	SHINE_WAIT = 5;
//	make_shine_tbl();
}
void WeatherVeryShineProc(void)
{
	switch(wp->vs_vec){
	case 0:
		if(++(wp->vs_cnt) > SHINE_WAIT){
			wp->vs_cnt = 0;
			veryshine_palchange(wp->vs_level++);
//			veryshine_palchange(5);
			if(wp->vs_level >= VERYSHINE_LV_MAX){
//				wp->vs_vec = 2;
				wp->vs_before_level = wp->vs_level;
				wp->vs_vec = 1;
				wp->vs_cnt = 60;
			}
		}
		break;

	case 1:
		wp->vs_cnt += 3;
		wp->vs_cnt &= 127;
		wp->vs_level = 2 + ((sin_cos_table[wp->vs_cnt] - 1) >> 6);
		if(wp->vs_level != wp->vs_before_level){
			veryshine_palchange(wp->vs_level);
		}
		wp->vs_before_level = wp->vs_level;
		break;

	case 2:
		if(++(wp->vs_cnt) > SHINE_WAIT){
			wp->vs_cnt = 0;
			veryshine_palchange(--(wp->vs_level));
			if(wp->vs_level == 3){
//				wp->vs_level = 0;
				wp->vs_vec = 0;
			}
		}
		break;
	}
}
/*============================================================================*/
/*                                                                            */
/*   半透明レジスタ操作                                                       */
/*                                                                            */
/*============================================================================*/
//==============================================================
//  初期化
//==============================================================
void WeatherBlendInit(u8 eva, u8 evb)
{
	wp->eva = eva;
	wp->evb = evb;
	wp->end_eva = eva;
	wp->end_evb = evb;
	*(vu16*)REG_BLDALPHA = (evb << 8) | eva;
}
//==============================================================
// リクエスト
// eva, evb  ... 半透明ﾊﾟﾗﾒｰﾀ
// wait      ... wait
//==============================================================
void WeatherBlendReq(u8 eva, u8 evb, u8 wait)
{
	wp->end_eva = eva;
	wp->end_evb = evb;
	wp->blend_wait = wait;
	wp->blend_timer = 0;
	wp->blend_cnt = 0;
}
//==============================================================
// 更新    1:終了  0:継続中
//==============================================================
u8 WeatherBlendProg(void)
{
	if(wp->eva == wp->end_eva
	&& wp->evb == wp->end_evb)
	{
		return 1;
	}

	if(++(wp->blend_timer) > wp->blend_wait)
	{
		wp->blend_timer = 0;
		wp->blend_cnt++;
		if(wp->blend_cnt & 1){
			if(wp->eva < wp->end_eva){
				wp->eva++;
			}else if(wp->eva > wp->end_eva){
				wp->eva--;
			}
		}else{
			if(wp->evb < wp->end_evb){
				wp->evb++;
			}else if(wp->evb > wp->end_evb){
				wp->evb--;
			}
		}
	}

	*(vu16*)REG_BLDALPHA = (wp->evb << 8)|wp->eva;

	if(wp->eva == wp->end_eva
	&& wp->evb == wp->end_evb)
	{
		return 1;
	}

	return 0;
}















/*====================================================================*/
/*                                                                    */
/*  フィールドコントロール→天候変化ルーチン呼び出し                  */
/*                                                                    */
/*====================================================================*/
void WeatherCtrl(u8 ctrl)
{
	switch(ctrl){
	case SHINE_CTRL:   ChangeFieldWeatherSmooth(WEATHER_SHINE); break;
	case SHINE2_CTRL:  ChangeFieldWeatherSmooth(WEATHER_SHINE2); break;
	case RAIN_CTRL:    ChangeFieldWeatherSmooth(WEATHER_RAIN); break;
	case SNOW_CTRL:    ChangeFieldWeatherSmooth(WEATHER_SNOW); break;
	case THUNDER_CTRL: ChangeFieldWeatherSmooth(WEATHER_THUNDER); break;
	case MIST_CTRL:    ChangeFieldWeatherSmooth(WEATHER_MIST); break;
	case MIST2_CTRL:   ChangeFieldWeatherSmooth(WEATHER_MIST2); break;
	case ASH_CTRL:     ChangeFieldWeatherSmooth(WEATHER_ASH); break;
	case STORM_CTRL:   ChangeFieldWeatherSmooth(WEATHER_STORM); break;
	case CLOUD_CTRL:   ChangeFieldWeatherSmooth(WEATHER_CLOUD); break;
	}
}
/*====================================================================*/
/*                                                                    */
/*  現在の天候を返す（戦闘時に使用）                                  */
/*                                                                    */
/*====================================================================*/
u8 GetWeatherNow(void)
{
	return wp->status;
}
/*====================================================================*/
/*                                                                    */
/*  雨、大雨の音を終わらせる                                          */
/*                                                                    */
/*====================================================================*/
void PlayRainSound(u16 se)
{
	if(wp->fade_mode != FADEMODE_OUT)
	{
		switch(se){
		case SE_T_KOAME: wp->rain_sound_type = 0; break;
		case SE_T_OOAME: wp->rain_sound_type = 1; break;
		case SE_T_AME:   wp->rain_sound_type = 2; break;
		default:
			return;
		}
		SePlay(se);
	}
}
void StopRainSound(void)
{
	if(SeEndCheckPlayer003()){
		switch(wp->rain_sound_type){
		case 0: SePlay(SE_T_KOAME_E); break;
		case 1: SePlay(SE_T_OOAME_E); break;

		default:
		case 2: SePlay(SE_T_AME_E); break;

		}
	}
}
/*====================================================================*/
/*  天候変化の終了チェック                                            */
/*  ※WeatherChangeSmooth()で指定した天候に                           */
/*  切り替わった       ... 1                                          */
/*  切り替わっていない ... 0     を返す                               */
/*====================================================================*/
u8 CheckWeatherChange(void)
{
	return wp->smooth_end;
}
/*====================================================================*/
/*  天候ｴﾌｪｸﾄによるﾊﾟﾚｯﾄ操作の停止・再開                              */
/*（ｴﾝｶｳﾝﾄ,ｶｯﾄｲﾝｴﾌｪｸﾄなどの前に）                                     */
/*====================================================================*/
//=================================
// 停止
//=================================
void WeatherFadeStop(void)
{
	wp->fade_mode = FADEMODE_OUT;
}
//=================================
// 再開
//=================================
void WeatherFadeStart(void)
{
	wp->fade_mode = FADEMODE_NULL;
}
//=================================
// 指定ﾊﾟﾚｯﾄのみｽｷｯﾌﾟ：開始
// palno  0～31
//=================================
void WeatherFadeSkipStart(u8 palno)
{
	CpuCopy(FadeTblTypeDefault, FadeTblTypeSkip, 32, 16);
	FadeTblTypeSkip[palno] = 0;
	FadeTblType = FadeTblTypeSkip;
}
//=================================
// 指定ﾊﾟﾚｯﾄのみｽｷｯﾌﾟ：終了
//=================================
void WeatherFadeSkipEnd(void)
{
	FadeTblType = FadeTblTypeDefault;
}























/*============================================================================*/
/*                                                                            */
/*  デバッグメニュー制御                                                      */
/*                                                                            */
/*============================================================================*/
#ifdef PM_DEBUG

/* 天候名表示用 */
static const u8 off_msg[] =    { na_,  si_,  spc_, spc_, spc_, EOM_ };
static const u8 shine_msg[] =  { ha_,  re_,  spc_, spc_, spc_, EOM_ };
static const u8 shine2_msg[] = { ha_,  re_,  n2_ , spc_, spc_, EOM_ };
static const u8 rain_msg[] =   { a_,   me_,  spc_, spc_, spc_, EOM_ };
static const u8 snow_msg[] =   { yu_,  ki_,  spc_, spc_, spc_, EOM_ };
static const u8 thunder_msg[] ={ ka_,  mi_,  na_,  ri_,  spc_, EOM_ };
static const u8 mist_msg[] =   { ki_,  ri_,  spc_, spc_, spc_, EOM_ };
static const u8 ash_msg[] =    { ka_,  za_,  n_,   ba_,  i_,   EOM_ };
static const u8 storm_msg[] =  { su_,  na_,  a_ ,  ra_ , si_ , EOM_ };
static const u8 mist2_msg[] =  { ki_,  ri_,  n2_,  spc_, spc_, EOM_ };
static const u8 sea_msg[] =    { ka_,  i_,   te_,  i_,   spc_, EOM_ };
static const u8 cloud_msg[] =  { ku_,  mo_, ri_, spc_, spc_, EOM_, };
static const u8 shine3_msg[] = { ha_,  re_,  n3_ , spc_, spc_, EOM_ };
static const u8 hrain_msg[] =  { o_, o_, a_, me_, EOM_ };
static const u8 kaitei_msg[] = { ka_, i_, te_, i_, n2_, EOM_, };

static const u8* const weather_msg_tbl[] = {
	off_msg,
	shine_msg,
	shine2_msg,
	rain_msg,
	snow_msg,
	thunder_msg,
	mist_msg,
	ash_msg,
	storm_msg,
	mist2_msg,
	sea_msg,
	cloud_msg,
	shine3_msg,
	hrain_msg,
	kaitei_msg,
};

static u8 DEBUG_WEATHER = 0;

// デバッグメニュー「てんこう」：選択、決定
static u8 DebugWeatherTest(void)
{
	u8 change = 0;

	if(sys.Trg & R_BUTTON){
		if(++DEBUG_WEATHER == WEATHER_MAX){ DEBUG_WEATHER = WEATHER_OFF; }
		change = 1;
	}
	if(sys.Trg & L_BUTTON){
		DEBUG_WEATHER = (DEBUG_WEATHER == WEATHER_OFF)? (WEATHER_MAX - 1) : (DEBUG_WEATHER - 1);
		change = 1;
	}
	if(change){
		NMenuBoxWrite( 22,1,28,2 );
		NMenuMsgWrite(weather_msg_tbl[DEBUG_WEATHER],23,1);
	}

	if(sys.Trg & A_BUTTON){
		WeatherChangeSmooth(DEBUG_WEATHER);
		MenuEnd();
		return 1;
	}
	return 0;
};
// デバッグメニュー「てんこう」：初期化
u8 DebugWeatherTestInit(void)
{
	extern u8 (*MenuFunc)();

	DEBUG_WEATHER = wp->status;
	NMenuScreenClear();
	NMenuBoxWrite( 22,1,28,2 );
	NMenuMsgWrite(weather_msg_tbl[DEBUG_WEATHER],23,1);
	MenuFunc = DebugWeatherTest;

	return 0;
}

#endif
