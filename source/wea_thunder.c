/***********************************************************************
**
**	天候エフェクトタスク制御（かみなり）
**
***********************************************************************/
#include "wea_com.h"

/*==============================================
== 関数プロトタイプ
==============================================*/
static void ThunderSeSet(u16 max_sec);
static void ThunderSeCheck(void);


/* サブプロセス切り替え間隔テーブル */
#define  FLASH_SYNCS  (6)

static const u16 thunder_timer_tbl[] = {
	0, FLASH_SYNCS, FLASH_SYNCS, FLASH_SYNCS*2, FLASH_SYNCS*3,
	FLASH_SYNCS*7, 300, 300,
};

#define THUNDER_TYPE_MAX  (2)

//==============================================
//	カミナリ：初期化
//==============================================
void InitThunder(void)
{
	wp->prog = 0;
	wp->direct_end = 0;
	wp->rain_disp_timer = 0;
	wp->rain_disp_wait = 4;

	wp->rain_speed = RAIN_SPEED_NORMAL;
	wp->rain_disp_max = RAIN_DISP_THUNDER;

	wp->next_evy = FADE_CLOUD_MAX;
	wp->evy_wait = CLOUD_CHANGE_WAIT;

	wp->direct_end = 0;
	wp->thunder_se_flg = 0;

#if PLAY_RAIN_SOUND
	PlayRainSound(SE_T_AME);
#endif
}
//==============================================
//	カミナリ：ダイレクト初期化
//==============================================
void DirectThunder(void)
{
	InitThunder();

	while(wp->direct_end == 0)
	{
		ThunderProc();
	}
}
//==============================================
//	おおあめ：初期化
//==============================================
void InitHeavyRain(void)
{
	wp->prog = 0;
	wp->direct_end = 0;
	wp->rain_disp_timer = 0;
	wp->rain_disp_wait = 4;

	wp->rain_speed = RAIN_SPEED_FAST;
	wp->rain_disp_max = RAIN_DISP_HEAVYRAIN;

	wp->next_evy = FADE_CLOUD_MAX;
	wp->evy_wait = CLOUD_CHANGE_WAIT;

	wp->direct_end = 0;

#if PLAY_RAIN_SOUND
	PlayRainSound(SE_T_OOAME);
#endif
}
//==============================================
//	おおあめ：ダイレクト初期化
//==============================================
void DirectHeavyRain(void)
{
	InitHeavyRain();
	while(wp->direct_end == 0){
		ThunderProc();
	}
}
//==============================================
//	進行
//==============================================
void ThunderProc(void)
{
	ThunderSeCheck();

	switch(wp->prog){
	case 0:
		RainCellSet();
		wp->prog++;
		break;

	case 1:
		if(!RainActorAdd()){
			wp->prog++;
		}
		break;

	case 2:
		if(!AdjustRainActor()){
			wp->direct_end = 1;
			wp->prog++;
		}
		break;

	case 3:
		if(wp->fade_mode != FADEMODE_WEATHER){
			wp->prog = 6;
		}
		break;

	// ﾀｲﾏｰｾｯﾄ&待ち
	case 4:
		wp->thunder_stop = 1;
		wp->thunder_timer = 360+(pp_rand() % 360);
		wp->prog++;

	case 5:
		if(--(wp->thunder_timer) == 0){
			wp->prog++;
		}
		break;

	// 動作タイプ決定
	case 6:
		wp->thunder_stop = 1;
		wp->thunder_type = pp_rand() % THUNDER_TYPE_MAX;
		wp->prog++;
		break;

	// １～２回短く光る ---------------------------------
	case 7:
		wp->thunder_cnt1  = 1 + (pp_rand() & 1);
		wp->prog++;
	/* fall throw */
	case 8:
		WeatherFadeNow(FADE_THUNDER_MAX);
		if(wp->thunder_type == 0 && wp->thunder_cnt1 == 1){
			ThunderSeSet(20);
		}
		wp->thunder_timer = 6 + (pp_rand() % 3);
		wp->prog++;
		break;
	case 9:
		if(--(wp->thunder_timer) == 0){
			WeatherFadeNow(FADE_CLOUD_MAX);
			wp->thunder_stop = 1;
			if(--(wp->thunder_cnt1)){
				wp->thunder_timer = 60 + (pp_rand() % 16);
				wp->prog = 10;
			}else{
				if(wp->thunder_type == 0){
					wp->prog = 4;
				}else{
					wp->prog = 11;
				}
			}
		}
		break;
	case 10:
		if(--(wp->thunder_timer) == 0){
			wp->prog = 8;
		}
		break;

	// ドーンと長めに光ってﾌｪｰﾄﾞ--------------------
	case 11:
		wp->thunder_timer = 60 + (pp_rand() % 16);
		wp->prog++;
		break;
	case 12:
		if(--(wp->thunder_timer) == 0){
			ThunderSeSet(100);
			WeatherFadeNow(FADE_THUNDER_MAX);
			wp->thunder_timer = 30 + (pp_rand() & 15);
			wp->prog++;
		}
		break;
	case 13:
		if(--(wp->thunder_timer) == 0){
			WeatherFadeReq(FADE_THUNDER_MAX, FADE_CLOUD_MAX, 5);
			wp->prog++;
		}
		break;
	case 14:
		if(wp->fade_mode == FADEMODE_NULL){
			wp->thunder_stop = 1;
			wp->prog = 4;
		}
		break;

	}
}
//==============================================
//	終了
//==============================================
u8 QuitThunder(void)
{
	switch(wp->quit_prog){
	case 0:
		wp->thunder_stop = 0;
		wp->quit_prog++;
	/* fall throw */
	case 1:
		ThunderProc();
		if(wp->thunder_stop)
		{
			if(IS_RAINY_WEATHER(wp->next_status)){
				return 0;
			}else{
				wp->rain_disp_max = 0;
				wp->quit_prog++;
			}
		}
		break;

	case 2:
		if(!AdjustRainActor()){
			DelRainObj();
			wp->thunder_se_flg = 0;
			wp->quit_prog++;
			return 0;
		}
		break;

	default:
		return 0;
	}
	return 1;
}


static void ThunderSeSet(u16 max_sec)
{
	if(wp->thunder_se_flg == 0){
		wp->thunder_se_timer = pp_rand() % max_sec;
		wp->thunder_se_flg = 1;
	}
}
static void ThunderSeCheck(void)
{
	if(wp->thunder_se_flg == 1){
		if(wp->thunder_se_timer == 0)
		{
			if(SeEndCheck()==0)
			{
				if(pp_rand() & 1){
					SePlay(SE_T_KAMI);
				}else{
					SePlay(SE_T_KAMI2);
				}
				wp->thunder_se_flg = 0;
			}
		}
		else
		{
			wp->thunder_se_timer--;
		}
	}
}











