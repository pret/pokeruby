//=========================================================================
//
//
//	時間イベント関連
//
//
//=========================================================================

#include "common.h"
#include "intr.h"
#include "palanm.h"
#include "laster.h"
#include "print.h"
#include "menutool.h"
#include "script.h"
#include "ev_flag.h"
#include "rtctool.h"
#include "syswork.h"
#include "popword.h"
#include "fld_main.h"
#include "wea_ctrl.h"
#include "sysflag.h"
#include "calctool.h"
#include "window.h"
#include "svld_ini.h"
#include "svld_sys.h"
#include "message.h"


#include "task.h"
#include "actor.h"
#include "actanm.h"
#include "fld_eff.h"
#include "madefine.h"
#include "letter.h"
#include "mus_tool.h"
#include "seed.h"
#include "scr_tool.h"

#include "poketool.h"		//add by soga 2002.05.24
#include "pokelot.h"

//=========================================================================
//
//
//
//=========================================================================
static void update_day_event( const GAME_TIME * now );
static void update_min_event( const GAME_TIME * now );

//-------------------------------------------------------------------------
//	時間イベント初期化処理
//-------------------------------------------------------------------------
void InitTimeEvent( void )
{
	EventFlagSet( SYS_CLOCK_SET );

	GetGameTime();
	MyData.save_time = GameTime;
	SetEventWorkValue(EV_ONE_DAY_WORK, GameTime.day);
}

//-------------------------------------------------------------------------
//	時間イベントの更新
//-------------------------------------------------------------------------
void UpdateTimeEvent( void )
{
	if (EventFlagCheck(SYS_CLOCK_SET) == FALSE)
		return;

	GetGameTime();

	update_day_event( &GameTime );
	update_min_event( &GameTime );
}



//-------------------------------------------------------------------------
//	日単位での時間イベント更新
//-------------------------------------------------------------------------
static void update_day_event( const GAME_TIME * now )
{
	u16 * day_work;
	u16 diff;

	day_work = GetEventWorkAdrs( EV_ONE_DAY_WORK );

	//時間経過なし、何もしない
	if (*day_work == now->day) {
		return;
	}

	//現在＜過去（ありえないはず…）
	if (*day_work > now->day) {
//		*day_work = now->day;
		return;
	}

	//現在＞過去、経過があったので更新処理を呼び出す
	diff = now->day - *day_work;

	OneDayFlagClear();
	PopWord_Update( diff );
	TVData_Update( diff );
	WeatherCycle_Update( diff );
	PokerusCounterDec(diff);		//add by soga 2002.05.24
	MaboroshiCycle_Update( diff );
	ZukanHyouka_Update( diff );
	Asase_Update( diff );
	UpdatePokeLot( diff );

	*day_work = now->day;
}

//-------------------------------------------------------------------------
//	分単位での時間イベント更新
//-------------------------------------------------------------------------
static void update_min_event( const GAME_TIME * now )
{
	s32 minute;
	GAME_TIME diff_time;

	CalcGameTimeDiff( &diff_time, &MyData.save_time, now );
	minute = diff_time.day * 24 * 60 + diff_time.hour * 60 + diff_time.min;

	//時間経過なし、なにもしない
	if (minute == 0)
		return;

	//過去＞現在（…ありえない）
	if (minute < 0) {
//		MyData.save_time = *now;
		return;
	}

	//過去＜現在、更新処理を呼び出す
	EverySeedGrowth( minute );
	MyData.save_time = *now;
}

//-------------------------------------------------------------------------
//	時間入力ウィンドウ
//	※スクリプトから呼ばれる
//-------------------------------------------------------------------------
extern void TokeiEvInit(void);

static void TimeSetAfter(void)
{
	InitTimeEvent();
	MainProcChange( FieldScriptRecover );
}

void TimeSetWindow(void)
{
	MainProcChange( TokeiEvInit );
	sys.pReturnProc = TimeSetAfter;
//	sys.pReturnProc = FieldScriptRecover;
}



//=========================================================================
//
//	ゲーム時間の再設定インターフェイス
//
//=========================================================================
//------------------------------------------------
//------------------------------------------------
enum{
	TMWK_END_FLAG,			//終了状態を示すためのワーク
	TMWK_RESULT,

	TMWK_MODE,

	TMWK_DAY,
	TMWK_HOUR,
	TMWK_MIN,
	TMWK_SEC,
	TMWK_END,
};

enum{
	CURSTAT_NOTHING = 0,
	CURSTAT_DAY,
	CURSTAT_HOUR,
	CURSTAT_MIN,
	CURSTAT_SEC,
	CURSTAT_DECIDE,
	CURSTAT_END,
};

#define UD_KEY	(U_KEY|D_KEY)

//------------------------------------------------
//	表示ものの定義とか
//------------------------------------------------

static const u8 str_niti[] = {ni_,ti_,EOM_ };
static const u8 str_colon[] = { colon_,EOM_ };
static const u8 str_decide[] = { ke_,ttu_,te_,i_,EOM_ };

enum{
	TMWIN_X = 3,
	TMWIN_Y = 8 ,
	TMWIN_X2 = TMWIN_X+22,
	TMWIN_Y2 = TMWIN_Y+3,

	TMMSG_TIME_X = TMWIN_X + 1,
	TMMSG_TIME_Y = TMWIN_Y + 1,
	TMMSG_DECIDE_X = TMWIN_X2 - 5,
	TMMSG_DECIDE_Y = TMWIN_Y + 1,

	TMACT_X = (TMWIN_X+5) * 8,
	TMACT_HOUR_X = TMACT_X + 32,
	TMACT_MIN_X = TMACT_HOUR_X + 3*8,
	TMACT_SEC_X = TMACT_MIN_X + 3*8,

	TMACT_Y = (TMWIN_Y+0) * 8+4,
	TMACT_Y2 = TMACT_Y + 24,

	TMACT_DECIDE_X = TMMSG_DECIDE_X * 8 - NELEMS(str_decide),
	TMACT_DECIDE_Y = TMWIN_Y * 8 + 16,
};

typedef struct {
	u8 wk_id;
	u16 min;
	u16 max;
	u8 left_move;
	u8 right_move;
	u8 a_move;
}TM_INPUT_CTRL;

static const TM_INPUT_CTRL time_input_ctrl[] =
{
	{
		TMWK_DAY,
		1,9999,
		CURSTAT_NOTHING,CURSTAT_HOUR,
		CURSTAT_NOTHING,
	},
	{
		TMWK_HOUR,
		0,23,
		CURSTAT_DAY,CURSTAT_MIN,
		CURSTAT_NOTHING,
	},
	{
		TMWK_MIN,
		0,59,
		CURSTAT_HOUR,CURSTAT_SEC,
		CURSTAT_NOTHING,
	},
	{
		TMWK_SEC,
		0,59,
		CURSTAT_MIN,CURSTAT_DECIDE,
		CURSTAT_NOTHING,
	},
	{
		TMWK_END,
		0,0,
		CURSTAT_SEC,CURSTAT_NOTHING,
		CURSTAT_END,
	},
};

//------------------------------------------------
//	時間入力カーソル用アクターデータ
//------------------------------------------------
//
enum{
	CURACT_CELLID	= FLD_CellID_FE_START,	/*fld_eff.h*/
	CURACT_PALID	= FLD_PalID_FE_START,
};

static const ActOamData Oam8x8 =
{
	0,										// u32 VPos:8
	0,										// u32 AffineMode:2
	0,										// u32 ObjMode:2
	0,										// u32 Mosaic:1
	0,										// u32 ColorMode:1
	0,										// u32 Shape:2
	0,										// u32 HPos:9
	0,										// u32 AffineParamNo:5
	0,										// u32 Size:2
	0,										// u32 CharNo:10
	0,										// u32 Priority:2
	0,										// u32 Pltt:3
	0,										// AffineWork
};



static const u8 tm_cursor_Character[64]={
                                                        /*  0  =  0(0x0)  */
	0x00,0x00,0x00,0x00,0x22,0x22,0x22,0x02,
	0x12,0x11,0x11,0x02,0x12,0x11,0x11,0x02,
	0x12,0x11,0x11,0x02,0x20,0x11,0x21,0x00,
	0x00,0x12,0x02,0x00,0x00,0x20,0x00,0x00,

	0x00,0x00,0x00,0x00,0x20,0x22,0x02,0x00,
	0x20,0x11,0x21,0x00,0x20,0x11,0x11,0x02,
	0x20,0x11,0x11,0x21,0x20,0x11,0x11,0x02,
	0x20,0x11,0x21,0x00,0x20,0x22,0x02,0x00,
};

static const u16 tm_cursor_Palette[] = {
0x0000,		//透明色
0x001F,		//赤
0x2529,		//黒
};

static const actAnmData tm_cursor_celltrans[] =
{
	{ (const u8 *)tm_cursor_Character, 0x20*1 },
	{ (const u8 *)tm_cursor_Character+0x20, 0x20*1 },
};

static const PalData tm_cursor_pal =
{
	tm_cursor_Palette,
	CURACT_PALID,
};

static const actAnm tm_cursor_anm[] =
{
	{OBJ16_8x8 * 0, 30, 0, 0},
	{ACT_ANMLOOP, 0, 0, 0},
};
static const actAnm tm_cursor_anm2[] =
{
	{OBJ16_8x8 * 0, 30, 0, 1},
	{ACT_ANMLOOP, 0, 0, 0},
};
static const actAnm tm_cursor_anm3[] =
{
	{OBJ16_8x8 * 1, 30, 0, 0},
	{ACT_ANMLOOP, 0, 0, 0},
};

static const actAnm * const tm_cursor_anm_tbl[] = 
{
	tm_cursor_anm,
	tm_cursor_anm2,
	tm_cursor_anm3,
};

static const actHeader act_tm_cursor_header=
{
	ACT_TMODE,
	CURACT_PALID,
	&Oam8x8,
	tm_cursor_anm_tbl,
	tm_cursor_celltrans,
	DummyActAffTbl,
	DummyActMove,
};


//------------------------------------------------
//	時間入力カーソル用アクター関数
//------------------------------------------------

static void upper_cursor_move( actWork * act)
{
	int mode;
	mode = TaskTable[act->work[0]].work[TMWK_MODE];
	if ( mode == act->work[1] ) return;
	act->work[1] = mode;
	switch ( mode ) {
	case CURSTAT_DAY:
		act->banish = 0;
		act->anm_no = 1;
		act->anm_wait = 0;
		act->x = TMACT_X;
		act->y = TMACT_Y;
		break;
	case CURSTAT_HOUR:
		act->banish = 0;
		act->anm_no = 1;
		act->anm_wait = 0;
		act->x = TMACT_HOUR_X;
		act->y = TMACT_Y;
		break;
	case CURSTAT_MIN:
		act->banish = 0;
		act->anm_no = 1;
		act->anm_wait = 0;
		act->x = TMACT_MIN_X;
		act->y = TMACT_Y;
		break;
	case CURSTAT_SEC:
		act->banish = 0;
		act->anm_no = 1;
		act->anm_wait = 0;
		act->x = TMACT_SEC_X;
		act->y = TMACT_Y;
		break;
	case CURSTAT_DECIDE:
		act->banish = 0;
		act->anm_no = 2;
		act->anm_wait = 0;
		act->x = TMACT_DECIDE_X;
		act->y = TMACT_DECIDE_Y;
		break;
	case CURSTAT_END:
		DelActor(act);
		break;
	}
}

static void lower_cursor_move( actWork * act)
{
	int mode;
	mode = TaskTable[act->work[0]].work[TMWK_MODE];
	if ( mode == act->work[1] ) return;
	act->work[1] = mode;
	switch ( mode ) {
	case CURSTAT_DAY:
		act->banish = 0;
		act->anm_no = 0;
		act->anm_wait = 0;
		act->x = TMACT_X;
		act->y = TMACT_Y2;
		break;
	case CURSTAT_HOUR:
		act->banish = 0;
		act->anm_no = 0;
		act->anm_wait = 0;
		act->x = TMACT_HOUR_X;
		act->y = TMACT_Y2;
		break;
	case CURSTAT_MIN:
		act->banish = 0;
		act->anm_no = 0;
		act->anm_wait = 0;
		act->x = TMACT_MIN_X;
		act->y = TMACT_Y2;
		break;
	case CURSTAT_SEC:
		act->banish = 0;
		act->anm_no = 0;
		act->anm_wait = 0;
		act->x = TMACT_SEC_X;
		act->y = TMACT_Y2;
		break;
	case CURSTAT_DECIDE:
		act->banish = 1;
		break;
	case CURSTAT_END:
		DelActor(act);
		break;
	}
}

static void add_cursor_obj( u8 task_no )
{
	int no;

	ObjPalSet(&tm_cursor_pal);

	no = AddActorBottom( &act_tm_cursor_header, TMACT_X, TMACT_Y, 0 );
	ActWork[no].move = upper_cursor_move;
	ActWork[no].work[0] = task_no;
	ActWork[no].work[1] = -1;

	no = AddActorBottom( &act_tm_cursor_header, TMACT_X, TMACT_Y, 0 );
	ActWork[no].move = lower_cursor_move;
	ActWork[no].work[0] = task_no;
	ActWork[no].work[1] = -1;
}

static void del_cursor_obj( void )
{
	ObjPalRegNumDel(tm_cursor_pal.reg_num);
}


//------------------------------------------------
//	時間文字列・ウィンドウ関連
//------------------------------------------------

static void erase_time_win(void)
{
	NMenuBoxClear( TMWIN_X,TMWIN_Y,TMWIN_X2,TMWIN_Y2 );
}

static void write_time_info(u8 x, u8 y, u16 day, u8 hour, u8 min, u8 sec )
{
	u8 * buf = MsgExpandBuffer;

	PM_NumMsgSet( StrTempBuffer0, day, NUM_MODE_SPACE, 4 );
	buf = PM_strcpy( buf, StrTempBuffer0 );
	buf = PM_strcpy( buf, str_niti );

	PM_NumMsgSet( StrTempBuffer0, hour, NUM_MODE_SPACE, 3 );
	buf = PM_strcpy( buf, StrTempBuffer0 );
	buf = PM_strcpy( buf, str_colon );

	PM_NumMsgSet( StrTempBuffer0, min, NUM_MODE_ZERO, 2 );
	buf = PM_strcpy( buf, StrTempBuffer0 );
	buf = PM_strcpy( buf, str_colon );

	PM_NumMsgSet( StrTempBuffer0, sec, NUM_MODE_ZERO, 2 );
	buf = PM_strcpy( buf, StrTempBuffer0 );

	NMenuMsgWrite(MsgExpandBuffer, x, y);
}

static void write_time_win( u16 day, u8 hour, u8 min, u8 sec )
{
	NMenuWinBoxWrite( TMWIN_X,TMWIN_Y,TMWIN_X2,TMWIN_Y2 );
	NMenuMsgWrite( str_decide, TMMSG_DECIDE_X, TMMSG_DECIDE_Y );
	write_time_info(TMMSG_TIME_X, TMMSG_TIME_Y, day, hour, min, sec );
}


//------------------------------------------------
//	時間入力タスク
//------------------------------------------------
static void set_time_start_task( u8 no );
static void set_time_end_task( u8 no );

static int change_counter( s16 * val, int min, int max ,u16 key )
{
	if ( key & D_KEY ){
		(*val) --;
		if ( *val < min ) *val = max;
	} else if ( key & U_KEY ){
		(*val) ++;
		if ( *val > max ) *val = min;
	} else if ( key & L_KEY ) {
		*val -= 10;
		if ( *val < min ) *val = max;
	} else if ( key & R_KEY ) {
		*val += 10;
		if ( *val > max ) *val = min;
	} else {
		return FALSE;
	}
	return TRUE;
}



static void set_time_void_task(u8 no)
{
	TaskTable[no].work[TMWK_END_FLAG] = TRUE;
}

static void set_time_end_task( u8 no )
{
	erase_time_win();
	del_cursor_obj();
	TaskTable[no].TaskAdrs = set_time_void_task;
}


static void set_time_main_task( u8 no )
{
	u8 mode;
	const TM_INPUT_CTRL * cl;
	s16 *wk = TaskTable[no].work;

	mode = wk[TMWK_MODE];
	cl = &time_input_ctrl[mode-1];

	/* 共通操作 */
	if ( sys.Trg & B_BUTTON ) {
		TaskTable[no].TaskAdrs = set_time_end_task;
		wk[TMWK_RESULT] = FALSE;
		wk[TMWK_MODE] = CURSTAT_END;
		SePlay( SE_SELECT );
		return;

	} else if ( sys.Trg & R_KEY && cl->right_move != CURSTAT_NOTHING ) {
		wk[TMWK_MODE] = cl->right_move;
		SePlay( SE_SELECT );
		return;

	} else if ( sys.Trg & L_KEY && cl->left_move != CURSTAT_NOTHING ) {
		wk[TMWK_MODE] = cl->left_move;
		SePlay( SE_SELECT );
		return;
	}

	if ( mode == CURSTAT_DECIDE ) {
		/* 決定の場合の操作 */
		if ( sys.Trg & A_BUTTON ) {

			GameTime.day = wk[TMWK_DAY];
			GameTime.hour = wk[TMWK_HOUR];
			GameTime.min = wk[TMWK_MIN];
			GameTime.sec = wk[TMWK_SEC];

			SePlay( SE_SELECT );
			TaskTable[no].TaskAdrs = set_time_end_task;
			wk[TMWK_RESULT] = TRUE;
			wk[TMWK_MODE] = CURSTAT_END;
		}

	} else {
		/* 時間部分にカーソルがある場合の操作 */
		if ( change_counter(&wk[cl->wk_id] ,cl->min, cl->max, sys.Repeat & UD_KEY ) ) {
			SePlay( SE_SELECT );
			write_time_info( TMMSG_TIME_X, TMMSG_TIME_Y,
					wk[TMWK_DAY],
					wk[TMWK_HOUR],
					wk[TMWK_MIN],
					wk[TMWK_SEC] );
		}
	}

}

static void set_time_start_task( u8 no )
{
	s16 *wk = TaskTable[no].work;

	wk[TMWK_END_FLAG] = FALSE;

	wk[TMWK_DAY] = GameTime.day;
	wk[TMWK_HOUR] = GameTime.hour;
	wk[TMWK_MIN] = GameTime.min;
	wk[TMWK_SEC] = GameTime.sec;

	write_time_win( wk[TMWK_DAY], wk[TMWK_HOUR], wk[TMWK_MIN], wk[TMWK_SEC] );
	add_cursor_obj( no );
	wk[TMWK_MODE] = CURSTAT_HOUR ;
	TaskTable[no].TaskAdrs = set_time_main_task;
}



//=========================================================================
//
//	タイトルからの時間再設定呼び出し処理
//
//=========================================================================

static void TimeInputVBlank(void);
static void TimeInputMain(void);

static void TimerInputMainTask(u8 no);

//------------------------------------------------
//	初期化
//------------------------------------------------
void TimeInputInit(void)
{
	*(vu16*)REG_DISPCNT = 0;
	SetVBlankFunc(NULL);

	DIV_DMACLEAR(3, 0, PLTT,PLTT_SIZE, 16);
	DIV_DMACLEAR(3, 0, VRAM,VRAM_SIZE, 16);
	actOAMinit(0, 128);
	actOAMtrans();

	LasterInit();
	LasterWorkInit();
	InitActor();
	InitTask();
	PaletteAnimeInit();
	PrintScreenInit(FIELD_MENU_TYPE);
	NMenuScreenInit(FIELD_MENU_TYPE);

	*(vu16*)REG_DISPCNT = DISP_MODE_0 | DISP_OBJ_ON | DISP_BG0_ON;

	SetVBlankFunc(TimeInputVBlank);
	MainProcChange(TimeInputMain);
	AddTask(TimerInputMainTask,80);
}

//------------------------------------------------
//	メイン関数
//------------------------------------------------
void TimeInputMain(void)
{
	MainTask();
	JumpActor();
	SetActor();
	PaletteAnime();
}

//------------------------------------------------
//	Vsync割り込み関数
//------------------------------------------------
static void TimeInputVBlank(void)
{
	actDMAtrans();
	actOAMtrans();
	PaletteFadeTrans();
}

//------------------------------------------------
//------------------------------------------------
static void put_msg_in_window(const u8 * msg)
{
	NMenuTalkWinWrite();
	NMenuMsgWrite(msg, MWIN_MSGXPOS, MWIN_MSGYPOS);
}

//------------------------------------------------
//	RTCリセットの覚悟をたずねる！
//------------------------------------------------
static void rtc_reset_ask_task(u8 no)
{
	s16 * twk;
	twk = TaskTable[no].work;

	switch (twk[0]) {
	case 0:
		NMenuScreenClear();
		NMenuWinBoxWrite(0,0,20,10);
		NMenuMsgWrite(str_now_time, 1, 1);
		write_time_info(1, 3,
				GameTime.day,
				GameTime.hour,
				GameTime.min,
				GameTime.sec);
		NMenuMsgWrite(str_before_time, 1, 5);
		write_time_info(1, 7,
				MyData.save_time.day,
				MyData.save_time.hour,
				MyData.save_time.min,
				MyData.save_time.sec);

		put_msg_in_window(msg_gtime_ask_reset);
		twk[0]++;
	case 1:
		if (sys.Trg & B_BUTTON) {
			DelTask(no);
			PM_SoftReset();
			return;
		}
		if (sys.Trg & A_BUTTON) {
			SePlay(SE_SELECT);
			DelTask(no);
		}
	}
}

//------------------------------------------------------------------
//------------------------------------------------------------------
enum{
	TISEQ_INIT,
	TISEQ_STARTWAIT,
	TISEQ_ASKWAIT,
	TISEQ_INPUTWAIT,
	TISEQ_SAVE,
	TISEQ_ENDWAIT,
	TISEQ_END,
};

//------------------------------------------------
//	時間再入力メイン制御
//------------------------------------------------
static void TimerInputMainTask(u8 no)
{
	s16 * twk;
	u8 svret_code;

	twk = TaskTable[no].work;

	switch (twk[0]) {
		case TISEQ_INIT:
			//フェードイン
			PaletteFadeReq(0xffffffff,1,16,0,0xffff);
			twk[0] = TISEQ_STARTWAIT;
			break;

		case TISEQ_STARTWAIT:
			if (FadeData.fade_sw == 1) break;

			if (SaveDataCheckInfo == SVLD_RET_NULL ||
					SaveDataCheckInfo == SVLD_RET_DESTROY) {
				put_msg_in_window(msg_gtime_no_savedata);
				twk[0] = TISEQ_ENDWAIT;
				break;
			}

			GetGameTime();

			//RTCリセットの確認
			twk[1] = AddTask(rtc_reset_ask_task, 80);
			twk[0] = TISEQ_ASKWAIT;
			break;

		case TISEQ_ASKWAIT:
			if (TaskTable[twk[1]].occ == 1) break;

			NMenuScreenClear();
			put_msg_in_window(msg_gtime_please_input);

			GameTime = MyData.save_time;	//前回チェックした時間を元にする
			twk[1] = AddTask(set_time_start_task, 80);
			twk[0] = TISEQ_INPUTWAIT;
			break;

		case TISEQ_INPUTWAIT:
			if (TaskTable[twk[1]].work[TMWK_END_FLAG] == FALSE) break;

			if (TaskTable[twk[1]].work[TMWK_RESULT] == FALSE) {
				DelTask(twk[1]);
				twk[0] = TISEQ_ASKWAIT;		//入力やり直し
				break;
			}
			DelTask(twk[1]);

			//RTCレジスタを初期化後、現在のGameTimeの値で時間差分を再計算する
			RTC_Reset();
			SetAllGameTime(GameTime.day, GameTime.hour, GameTime.min, GameTime.sec);

			//新しい現在の時間を最後にチェックした時間のワークに代入する
			MyData.save_time = GameTime;
			SetEventWorkValue(EV_ONE_DAY_WORK, GameTime.day);
			GameTimeSpecialFlagInit();

			put_msg_in_window(msg_gtime_finish_input);
			twk[0] = TISEQ_SAVE;
			break;

		case TISEQ_SAVE:
			//変更したゲーム内時間情報をセーブする
			svret_code = PokeAGBSave(POKEAGB_SVALL);
			if (svret_code == SVLD_RET_OK) {
				put_msg_in_window(msg_gtime_finish_report);
				SePlay(SE_PINPON);
			} else {
				put_msg_in_window(msg_gtime_fail_report);
				SePlay(SE_BOO);
			}
			twk[0] = TISEQ_ENDWAIT;

		case TISEQ_ENDWAIT:
			//	Aボタン待ち
			if ((sys.Trg & A_BUTTON) == 0) break;

			//	フェードアウト
			PaletteFadeReq(0xffffffff,1,0,16,0xffff);
			twk[0] = TISEQ_END;

		case TISEQ_END:
			if (FadeData.fade_sw == 1) break;
			DelTask(no);
			PM_SoftReset();	//ソフトリセット→タイトルへ
	}
}

#ifdef	PM_DEBUG
//-------------------------------------------------------------------------
//-------------------------------------------------------------------------
void StartSetGameTime(void)
{
	MainProcChange(TimeInputInit);
}


//-------------------------------------------------------------------------
//	時間設定インターフェイス
//	※デバッグ用
//-------------------------------------------------------------------------
static void debug_settime_task(u8 no)
{
	s16 * twk;
	twk = TaskTable[no].work;
	switch (twk[0]) {
	case 0:
		twk[1] = AddTask( set_time_start_task, 80 );
		twk[0]++;
		break;
	case 1:
		if (TaskTable[twk[1]].work[TMWK_END_FLAG] == FALSE) break;

		if (TaskTable[twk[1]].work[TMWK_RESULT] == TRUE) {
			SetAllGameTime(GameTime.day, GameTime.hour, GameTime.min, GameTime.sec);
		}
		DelTask(twk[1]);

		NMenuScreenClear();
		ResetForceEvent();
		DelTask(no);
	}
}

void DebugSetGameTime(void)
{
	GetGameTime();
	AddTask(debug_settime_task, 80);
	SetForceEvent();
}

void DebugSetGameTime2(void)
{
	GameTime = MyData.save_time;
	AddTask(debug_settime_task, 80);
	SetForceEvent();
}

//=========================================================================
//
//	ゲーム時間の表示（デバッグ用）
//
//=========================================================================

static const u8 str_date[] = { ni_,ttu_,su_,u_,EOM_ };
static const u8 str_time[] = { zi_,ka_,n_,EOM_ };
static const u8 str_game_time[] = { GE_,bou_,MU_,na_,i_,spc_,zi_,ka_,n_,EOM_ };
static const u8 str_rtc_time[] = { R__,T__,C__,spc_,zi_,ka_,n_,EOM_ };


void DebugRtcWatchTask( u8 no )
{
	s16 * wk = TaskTable[no].work;
	u8 * buf = MsgExpandBuffer;

	switch( wk[0] ){
	case 0:
		wk[0]++;
		break;
	case 1:
		NMenuWinBoxWrite( 0,9,29,19);
		PM_HexNumMsgSet( buf+80, RTC_GetStatus(), NUM_MODE_ZERO, 4 );
		NMenuMsgWrite( buf+80, 2, 10 );
		NMenuMsgWrite( str_date, 12, 12 );
		NMenuMsgWrite( str_time, 20, 12 );
		NMenuMsgWrite( str_rtc_time, 1, 14 );
		NMenuMsgWrite( str_game_time, 1, 16 );
		wk[0]++;
		break;
	case 2:
		GetGameTime();
		RTC_DebugMakeTimeString( buf );
		RTC_DebugMakeDayString( buf+20 );
		MakeTimeString( buf+40, GameTime.hour, GameTime.min, GameTime.sec );
		PM_NumMsgSet( buf+60, GameTime.day, NUM_MODE_SPACE, 4 );
		if( MyData.playtime_ms == 0 ){
			NMenuMsgWrite( buf,		20,14 );
			NMenuMsgWrite( buf+20,	12,14 );
			NMenuMsgWrite( buf+40,	20,16 );
			NMenuMsgWrite( buf+60,	12,16 );
		}
		if( wk[1] >= 20 ){
			wk[1]++;
			break;
		}
		if( sys.Trg & A_BUTTON ){
			NMenuScreenClear();
			DelTask(no);
			ResetForceEvent();
		}
		break;
	}
}
#endif PM_DEBUG

