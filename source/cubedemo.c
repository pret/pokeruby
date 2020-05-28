/***********************************************************************
**	キューブデモ
**                                                               taya
***********************************************************************/
#include "tnavi_com.h"
#include "fld_main.h"
#include "poketool.h"
#include "objdata.h"
#include "a_enemy.h"
#include "decord.h"
#include "mus_tool.h"
#include "laster.h"
#include "fld_sio.h"
#include "window.h"

#include "cubecase.h"
#include "cubedemo.dat"

#include "message.h"

/*------------------------------------*/
/*  定数                              */
/*------------------------------------*/

// セル・パレットＩＤ
//（トレナビのポケモン画像と重ならないように）
#define CELLID_UPDOWN  (0)
#define PALID_UPDOWN   (0)

// メッセージウィンドウ座標
#define MSGWIN_X1  (0)
#define MSGWIN_X2  (29)
#define MSGWIN_Y1  (16)
#define MSGWIN_Y2  (19)

// はい・いいえウィンドウ座標
#define YESNOWIN_X1  (23)
#define YESNOWIN_Y1  (10)

// ポケモンウィンドウ上昇幅
#define POKEWIN_UP  (40)

// データ表示部上昇幅
#define DATAAREA_UP  (6)

enum CHECK_TYPE {
	CHECK_CANCEL,
	CHECK_GIVE,
};

/*------------------------------------*/
/*  グローバル                        */
/*------------------------------------*/
const int ConditionID[] = {
	ID_style, ID_strong, ID_clever, ID_cute, ID_beautiful,
};

static const u8 TasteID[] = {
	TASTE_KARAI, TASTE_SUPPAI, TASTE_NIGAI, TASTE_AMAI, TASTE_SIBUI
};

static CUBEDEMO_WORK *work = NULL;

static pFunc ReturnFunc = NULL;
static CUBE *CubeData = NULL;

extern u16	ReturnItemNo;		// 選択したキューブの配列番号を格納


u8  CubeDemoPokeNo = 0;   // 何番目のポケモンを選んだか？
s16 CubeDemoLike = 0;     // 選んだキューブを好きかどうか？

/*------------------------------------*/
/*  プロトタイプ                      */
/*------------------------------------*/
static void change_sub(pFunc sub);
static void cubedemo_main(void);
static void cubedemo_v_intr(void);
static void init_result_message(void);
static u8 next_result_message(void);
static void add_updown_actor(void);
static void calc_cube_param(void);
static void calc_add_param(CUBE *cube, PokemonParam *poke);

static void init_check(void);
static s8 wait_check(void);

static u8 is_fur_max(void);
static void disp_tabenai_msg(void);
static void erace_tabenai_msg(void);
static u8 selno_to_pokeno(u8 selno);
static u8 pokeno_to_selno(u8 pokeno);

extern void PolockEatDemoInit(void);

// --- サブプロセス -- 
static void sub_init(void);
static void sub_init_comb(void);
static void sub_fadein(void);
static void sub_select(void);
static void sub_todemo(void);
static void sub_demo(void);
static void sub_fadeout(void);
static void sub_cubedemo_recover(void);

/*==============================================================
==  初期化
==
==  cube       キューブデータ構造体へのポインタ
==	ret_func   復帰関数
==
==============================================================*/
void CubeDemoInit(CUBE *cube,  pFunc ret_func)
{
	work = &(NaviWork->CubeDemoWork);

	work->cube = cube;
	work->ret_func = ret_func;

	NaviWork->font_base_pal = 2;

	change_sub(sub_init);
	MainProcChange(cubedemo_main);
}
/*==============================================================
==  復帰
==
==============================================================*/
static void cubedemo_recover_main1(void);
static void cubedemo_recover_main2(void);

static void CubeDemoRecover(void)
{
	work->cube = CubeData;
	work->ret_func = ReturnFunc;

	CubeDemoPokeNo = pokeno_to_selno(CubeDemoPokeNo);

	work->recover_vec = (CubeDemoPokeNo > 3)?  1 : 0; //4番以降のﾎﾟｹﾓﾝなら上送りで

	NaviWork->font_base_pal = 2;

	change_sub(sub_init);
	MainProcChange(cubedemo_recover_main1);
}
static void cubedemo_recover_main1(void)
{
	work->sub();
	JumpActor();
	SetActor();
	PaletteAnime();

	if(work->sub == sub_fadein)
	{
		*(vu16*)REG_DISPCNT = 0;
		work->prog = 0;
		MainProcChange(cubedemo_recover_main2);
	}

}
static void cubedemo_recover_main2(void)
{
	sub_cubedemo_recover();
	JumpActor();
	SetActor();
	PaletteAnime();
}

/*====================================================*/
/*  メインプロセス                                    */
/*====================================================*/
static void cubedemo_main(void)
{
	work->sub();
	JumpActor();
	SetActor();
	PaletteAnime();
}


/*====================================================*/
/*  V Blank                                           */
/*====================================================*/
static void cubedemo_v_intr(void)
{
	actOAMtrans();
	actDMAtrans();
	PaletteFadeTrans();
	CubeDemo_CalcRador(DATAAREA_UP);
	LasterVblank();
}
/*====================================================*/
/*  サブプロセス変更                                  */
/*====================================================*/
static void change_sub(pFunc sub)
{
	work->sub = sub;
	work->prog = 0;
}
/***********************************************************************
**  サブプロセス                                                      **
***********************************************************************/
#define TEXT_CHAR_BLOCK   (0)
#define TEXT_MAP_BLOCK    (31)
#define TEXT_MAP_ADDR     (BG_VRAM+TEXT_MAP_BLOCK*0x800)

/*====================================================*/
/*  画面初期化                                        */
/*====================================================*/
static void sub_init(void)
{
	switch(work->prog){
	case 0:
		NaviWork->comm_flg = IsFieldCommMode();
		if(NaviWork->comm_flg == FALSE){
			work->init_end = 0;
			change_sub(sub_init_comb);
			work->prog++;
		}
		break;

	case 1:
		InitActor();
		ObjPalManInit();
		work->prog++;
		break;

	case 2:
		SetVBlankFunc(NULL);
		work->prog++;
		break;

	case 3:
		PrintScreenInit(TNAVI_TYPE);
		work->prog++;
		break;

	case 4:
		NMenuScreenInitStart(TNAVI_TYPE);
		work->prog++;
		break;

	case 5:
		if(NMenuScreenInitMain()){
			work->prog++;
		}
		break;

	case 6:
		NaviWork->condition_change_func = CONDITION_MODE_STOCK;
		NaviWork->combg_vofs = 32;
		work->prog++;
		break;

	case 7:
		TNaviObj_LabelInitBegin();
		work->prog++;
	case 8:
		if(!TNaviObj_LabelInit()){
			work->prog++;
		}
		break;

	case 9:
		TNaviObj_AddLabel_Begin(LABEL_CONDITION);
		work->prog++;
	case 10:
		if(!TNaviObj_AddLabel(LABEL_CONDITION)){
			work->prog++;
		}
		break;

	case 11:
		KeyRepeatStartWait= 20;

		NaviWork->stock_poke_cnt = PokeCountMineGet();
		NaviWork->calc_win_flag = 0;
		NaviWork->poke_actor = NULL;

		TNaviSub_ConditionInitStock();
		NaviWork->initbg_prog = 0;
		work->prog++;
		break;

	case 12:
		if(!TNaviBG_CubeDemoInit()){
			*(vu16*)REG_BG2VOFS = DATAAREA_UP;
			*(vu16*)REG_BG3VOFS = DATAAREA_UP;
			work->prog++;
		}
		break;

	case 13:
		TNaviObj_UpdatePokeImg(0);
		NaviWork->poke_actor->dy = -(POKEWIN_UP);
		work->prog++;
		break;

	case 14:
		if(!TNaviBG_PokeWinUp()){
			work->prog++;
		}
		break;

	case 15:
		TNaviObj_StockConInit();
		work->prog++;
		break;

	case 16:
		DIV_DMACLEAR(3, 0, TEXT_MAP_ADDR, 0x800, 32);
		*(vu16 *)REG_BG1VOFS = 0;
		*(vu16 *)REG_BG1HOFS = 0;
		*(vu16 *)REG_BG1CNT = BG_COLOR_16
							| BG_SCREEN_SIZE_0
							| BG_PRIORITY_0
							| TEXT_MAP_BLOCK << BG_SCREEN_BASE_SHIFT
							| 0 << BG_CHAR_BASE_SHIFT
							;
		work->prog++;
		break;

	case 17:
		TNaviSub_ParamToPos(NaviWork->poke_param[0], NaviWork->point[0]);
		TNaviSub_LadorLasterInitBegin();
		work->prog++;
		break;

	case 18:
		if(!TNaviSub_LadorLasterInitMain()){
			work->prog++;
		}
		break;

	case 19:
		TNaviSub_SetRadorPoint(NaviWork->point[0]);
		work->prog++;
		break;

	case 20:
		TNaviBG_PokeSeikakuWrite();
		work->prog++;
		break;

	case 21:
		*(vu16*)REG_WIN0H = 240;
		*(vu16*)REG_WIN1H = RADOR_CX;
		*(vu16*)REG_WIN0V = ((RADOR_TOP-DATAAREA_UP) << 8) | (RADOR_BOTTOM-DATAAREA_UP);
		*(vu16*)REG_WIN1V = ((RADOR_TOP-DATAAREA_UP) << 8) | (RADOR_BOTTOM-DATAAREA_UP);
		*(vu16*)REG_WININ = 0x3f3f;   // 内部：全て表示
		*(vu16*)REG_WINOUT = 0x001B;  // 外部：BG2 以外を全て表示

		*(vu16*)REG_BG0VOFS = POKEWIN_UP;

		*(vu16 *)REG_DISPCNT = DISP_MODE_0 | DISP_OBJ_CHAR_1D_MAP 
		| DISP_BG0_ON
		| DISP_BG1_ON
		| DISP_BG2_ON
		| DISP_BG3_ON
		| DISP_OBJ_ON
		| DISP_WIN01_ON
		;

	case 22:
		work->init_end = 1;
		change_sub(sub_fadein);
		break;
	}

}
// 分割しない初期化
static void sub_init_comb(void)
{
	while(work->init_end == 0)
	{
		sub_init();
	}
}


/*====================================================*/
/*  フェードイン                                      */
/*====================================================*/
static void sub_fadein(void)
{
	switch(work->prog){
	case 0:
		PaletteFadeReq(0xffffffff, 0, 16, 0, 0x0000);
		SetVBlankFunc(cubedemo_v_intr);
		work->prog++;
		break;

	case 1:
		if(FadeData.fade_sw == 0){
			TNaviObj_KiraInit();
			TNaviObj_KiraStart();
			change_sub(sub_select);
		}
		break;
	}
}
/*====================================================*/
/*  ポケモン選択                                      */
/*====================================================*/
static void sub_select(void)
{
	switch(work->prog){
	case 0:
		if(sys.Cont & U_KEY){
			SePlay(SE_SELECT);
			TNaviSub_ConditionChangeInit(1);
			TNaviObj_KiraStop();
			work->prog = 1;
			break;
		}
		if(sys.Cont & D_KEY){
			SePlay(SE_SELECT);
			TNaviSub_ConditionChangeInit(0);
			TNaviObj_KiraStop();
			work->prog = 1;
			break;
		}
		if(sys.Trg&B_BUTTON){
			SePlay(SE_SELECT);
			work->prog = 3;
			break;
		}
		if(sys.Trg&A_BUTTON){
			SePlay(SE_SELECT);
			if(NaviWork->condition_poke_sel == NaviWork->condition_poke_cnt - 1){
				work->prog = 3;
			}else{
				work->prog = 5;
			}
			break;
		}
		break;


	// ポケモン切り替え待ち＆FIFO開放待ち
	case 1:
		if(!TNaviSub_ConditionChange()){
			work->prog++;
		}
		break;
	case 2:
		if(FieldRecvFifoClearWait() == FALSE){
			TNaviBG_PokeSeikakuWrite();
			TNaviObj_KiraStart();
			work->prog = 0;
		}
		break;


	// 中止確認
	case 3:
		change_sub(sub_fadeout);
		break;

	// あげる確認
	case 5:
		init_check();
		work->prog++;
		break;

	case 6:
		switch(wait_check()){
		case CURSOR_NO_VALUE:
		case CURSOR_CANCEL_VALUE:
			work->prog = 0;
			break;

		case CURSOR_YES_VALUE:
			if(is_fur_max()){
				disp_tabenai_msg();
				work->prog = 7;
			}else{
				change_sub(sub_todemo);
			}
			break;
		}
		break;

	case 7:
		if(sys.Trg&(A_BUTTON|B_BUTTON)){
			erace_tabenai_msg();
			work->prog = 0;
		}
		break;
	}
}
/*====================================================*/
/*  ポケモンがポロックを食べるデモ画面へ切り替え      */
/*====================================================*/
static void sub_todemo(void)
{
	switch(work->prog){
	case 0:
		CubeDemoPokeNo = selno_to_pokeno(NaviWork->condition_poke_sel);
		ReturnFunc = work->ret_func;
		CubeData = work->cube;
		PaletteFadeReq(0xffffffff,0,0,16,0x0000);
		work->prog++;
		break;

	case 1:
		if(FadeData.fade_sw==0){
			sys.pReturnProc = CubeDemoRecover;
			PolockEatDemoInit();
		}
		break;
	}
}
/*====================================================*/
/*  復帰後、選択されていたポケモン表示へ              */
/*====================================================*/
static void sub_cubedemo_recover(void)
{
	switch(work->prog){
	case 0:
		if(NaviWork->condition_poke_sel != CubeDemoPokeNo)
		{
			TNaviSub_ConditionChangeInit(work->recover_vec);
			work->prog++;
		}else{
			work->prog = 3;
		}
		break;

	// ポケモン切り替え待ち＆FIFO開放待ち
	case 1:
		if(!TNaviSub_ConditionChange()){
			work->prog++;
		}
		break;
	case 2:
		if(FieldRecvFifoClearWait() == FALSE){
			TNaviBG_PokeSeikakuWrite();
			work->prog = 0;
		}
		break;

	case 3:
		ColorConceChange(0xffffffff,16,0x0000);
		work->prog++;
		break;

	case 4:
		*(vu16 *)REG_DISPCNT = DISP_MODE_0 | DISP_OBJ_CHAR_1D_MAP 
		| DISP_BG0_ON
		| DISP_BG1_ON
		| DISP_BG2_ON
		| DISP_BG3_ON
		| DISP_OBJ_ON
		| DISP_WIN01_ON
		;
		work->prog++;
		break;

	case 5:
		SetVBlankFunc(cubedemo_v_intr);
		PaletteFadeReq(0xffffffff,0,16,0,0x0000);
		work->prog++;
		break;

	case 6:
		if(FadeData.fade_sw==0){
			TNaviObj_KiraInit();
			TNaviObj_KiraStart();
			change_sub(sub_demo);
			MainProcChange(cubedemo_main);
		}
		break;

	}
}

/*====================================================*/
/*  能力変動デモ                                      */
/*====================================================*/
static void sub_demo(void)
{
	switch(work->prog){
	case 0:
		work->pokepara = PokeParaMine;
		work->pokepara += NaviWork->sort_data[NaviWork->condition_poke_sel].poke;
//		write_reaction_message();
		TNaviObj_KiraStop();
		work->prog++;
		break;

	case 1:
		if(sys.Trg&(A_BUTTON|B_BUTTON))
		{
			work->prog++;
		}
		break;

	case 2:
		calc_cube_param();
		TNaviSub_ParamToPos(work->param_after, NaviWork->point[3]);
		TNaviSub_InitMorph(NaviWork->point[NaviWork->PokeSelNow], NaviWork->point[3]);
		add_updown_actor();
		work->prog++;
		break;

	case 3:
		if(!TNaviSub_ProgMorph()){
			u8 pokeno = selno_to_pokeno(NaviWork->condition_poke_sel);
			TNaviSub_UpdateFurLv(pokeno);
			TNaviObj_KiraStart();
			work->counter = 0;
			work->prog++;
		}
		break;

	case 4:
		if(++(work->counter) > 16){
			init_result_message();
			work->prog++;
		}
		break;

	case 5:
		if(sys.Trg&(A_BUTTON|B_BUTTON))
		{
			if(!next_result_message()){
				DelCube((u8)ReturnItemNo);  // キューブ消す
				change_sub(sub_fadeout);
			}
		}
		break;
	}
}
/*====================================================*/
/*  フェードアウト                                    */
/*====================================================*/
static void sub_fadeout(void)
{
	switch(work->prog){
	case 0:
		PaletteFadeReq(0xffffffff, 0, 0, 16, 0x0000);
		work->prog++;
		break;

	case 1:
		if(FadeData.fade_sw==0){
			work->prog++;
		}
		break;

	case 2:
		TNaviSub_LadorLasterQuit();
		work->prog++;
		break;

	case 3:
		MainProcChange(work->ret_func);
		break;
	}
}
/***********************************************************************
**  確認ウィンドウ                                                    **
***********************************************************************/
/*====================================================*/
/*  初期化                                            */
/*====================================================*/
static void init_check(void)
{
	u8 pokeno;

	pokeno = selno_to_pokeno(NaviWork->condition_poke_sel);
	PokeParaGet(PokeParaMine + pokeno, ID_nickname, work->buffer);
	NickNameCutOff(work->buffer);
	PM_strcat(work->buffer, PolockMsg_CheckGive);

	NMenuContextChange(TNAVI2_TYPE);
	NMenuWinBoxWrite(MSGWIN_X1, MSGWIN_Y1, MSGWIN_X2, MSGWIN_Y2);
	NMenuMsgWrite(work->buffer, MSGWIN_X1+1, MSGWIN_Y1+1);
	YesNoSelectInit(YESNOWIN_X1, YESNOWIN_Y1);
	NMenuVCursorSet(0);
}
/*====================================================*/
/*  決定待ち                                          */
/*  return:  通常のメニュー選択と同じ                 */
/*====================================================*/
static s8 wait_check(void)
{
	s8 ret = NMenuVCursorControlNoloop();

	if(ret == CURSOR_NO_VALUE
	|| ret == CURSOR_YES_VALUE
	|| ret == CURSOR_CANCEL_VALUE
	){
		NMenuScreenClear();
		NMenuContextChange(TNAVI_TYPE);
	}

	return ret;
}
/***********************************************************************
**  結果メッセージ表示                                                **
***********************************************************************/
static void make_result_message(u8 *buf, u8 pos, s16 val);
static void disp_result_message(const u8 *msg);

/*====================================================*/
/* 初期化＆最初のメッセージ表示                       */
/*====================================================*/
static void init_result_message(void)
{
	NMenuContextChange(TNAVI2_TYPE);
	NMenuWinBoxWrite(MSGWIN_X1, MSGWIN_Y1, MSGWIN_X2, MSGWIN_Y2);

	for(work->result_pos = 0; work->result_pos < 5; work->result_pos++)
	{
		if(work->param_up[work->result_pos]){ break; }
	}

	if(work->result_pos < 5){
		make_result_message(work->buffer, work->result_pos, work->param_up[work->result_pos]);
	}else{
		make_result_message(work->buffer, work->result_pos, 0);
	}

	disp_result_message(work->buffer);

}
/*====================================================*/
/* 次のメッセージ表示                                 */
/* return:  次が無ければ 0,  あれば 1                 */
/*====================================================*/
static u8 next_result_message(void)
{
	while(1)
	{
		work->result_pos++;
		if(work->result_pos < 5){
			if(work->param_up[work->result_pos]){ break; }
		}else{
			work->result_pos = 5;
			return 0;
		}
	}
	make_result_message(work->buffer, work->result_pos, work->param_up[work->result_pos]);
	disp_result_message(work->buffer);
	return 1;
}
/*====================================================*/
/* これ以上食べないメッセージ表示＆消去               */
/*====================================================*/
static void disp_tabenai_msg(void)
{
	NMenuContextChange(TNAVI2_TYPE);
	NMenuWinBoxWrite(MSGWIN_X1, MSGWIN_Y1, MSGWIN_X2, MSGWIN_Y2);
	NMenuMsgWrite(PolockMsg_Tabenai, MSGWIN_X1+1, MSGWIN_Y1+1);
}
static void erace_tabenai_msg(void)
{
	NMenuScreenClear();
	NMenuContextChange(TNAVI_TYPE);
}

/*====================================================*/
/* メッセージ描画                                     */
/*====================================================*/
static void disp_result_message(const u8 *msg)
{
	NMenuWinBoxWrite(MSGWIN_X1, MSGWIN_Y1, MSGWIN_X2, MSGWIN_Y2);
	NMenuMsgWrite(msg, MSGWIN_X1+1, MSGWIN_Y1+1);
}
/*====================================================*/
/* メッセージ文字列作成                               */
/*====================================================*/
static const u8 * const MsgTable1[] = {
	PolockMsg_Style,
	PolockMsg_Strong,
	PolockMsg_Clever,
	PolockMsg_Cute,
	PolockMsg_Beautiful,
};

static void make_result_message(u8 *buf, u8 pos, s16 val)
{
	if(val){
		if(val > 0){ val = 0; }
		if(val < 0){ val = 1; }

		PM_strcpy(buf, MsgTable1[pos]);
		PM_strcat(buf, PolockMsg_Up);

	}else{
		PM_strcpy(buf, PolockMsg_Unchange);
	}
}
/***********************************************************************
**  キューブデータ・パラメータ操作                                    **
***********************************************************************/
/*====================================================*/
/*  ポケモンのコンディションデータ値を配列に取得      */
/*                                                    */
/*  poke   ポケモンデータ                             */
/*  param  データ値を受け取る配列                     */
/*====================================================*/
static void GetPokeCondition(PokemonParam *poke, u8 *param)
{
	u16 i;

	for(i = 0; i < 5; i++)
	{
		param[i] = PokeParaGet(poke, ConditionID[i]);
	}
}
/*====================================================*/
/*  キューブデータからパラメータ増減値を計算して      */
/*  ポケモンデータに反映する                          */
/*                                                    */
/*  cube   キューブデータ                             */
/*  poke   ポケモンデータ                             */
/*                                                    */
/*====================================================*/
static void CubeToPoke(CUBE *cube, PokemonParam *poke)
{
	u8  poke_param, fur;
	s16 param_work;
	u16 i;

	// けづや値が最大なら何も変わらない
	if(PokeParaGet(poke, ID_fur) == 255)
	{
		return;
	}

	calc_add_param(cube, poke);

	// 範囲オーバーするような数値は切り詰める
	for(i = 0; i < 5; i++)
	{
		poke_param = PokeParaGet(poke, ConditionID[i]);
		param_work = poke_param + work->add_param[i];
		if(param_work < 0)
		{
			param_work = 0;
		}
		if(param_work > 255)
		{
			param_work = 255;
		}
		poke_param = param_work;
		PokeParaPut(poke, ConditionID[i], &poke_param);
	}

	// 毛づやを増加させる
	fur = PokeParaGet(poke, ID_fur);
	param_work = fur + cube->umai;
	if(param_work > 255)
	{
		param_work = 255;
	}
	poke_param = param_work;
	PokeParaPut(poke, ID_fur, &poke_param);
}
/*====================================================*/
/*  キューブを与えた後のレーダーデータなどを計算      */
/*====================================================*/
static void calc_cube_param(void)
{
	PokemonParam *poke;
	u16 i;

	poke = PokeParaMine;
	poke += NaviWork->sort_data[NaviWork->condition_poke_sel].poke;

	GetPokeCondition(poke, work->param_before);
	CubeToPoke(work->cube, poke);
	GetPokeCondition(poke, work->param_after);

	for(i = 0; i < 5; i++)
	{
		work->param_up[i] = work->param_after[i] - work->param_before[i];
	}
}
/*====================================================*/
/*  キューブを与えた時の増減値を計算                  */
/*                                                    */
/*  cube   キューブデータ                             */
/*  poke   ポケモンデータ                             */
/*                                                    */
/*  ※ work->add_param 配列にそれぞれの値が入る       */
/*                                                    */
/*====================================================*/
static void calc_add_param(CUBE *cube, PokemonParam *poke)
{
	s8  like, taste_like, add, i;

	work->add_param[0] = cube->karai;
	work->add_param[1] = cube->suppai;
	work->add_param[2] = cube->nigai;
	work->add_param[3] = cube->amai;
	work->add_param[4] = cube->sibui;

	if(CubeDemoLike>0){
		like = 1;
	}else if(CubeDemoLike < 0){
		like = -1;
	}else{
		return;  // 好きでも嫌いでもない場合は何もしない
	}

	// 好き嫌いが一致する味は、値を増減させる
	for(i = 0; i < 5; i++)
	{
		// 四捨五入してからの１割を計算
		add = work->add_param[i] / 10;
		if((work->add_param[i] % 10) > 4){
			add++;
		}

		taste_like = PokeLikeTasteCheck(poke, TasteID[i]);
		if(taste_like == like)
		{
			work->add_param[i] += (like * add);
		}
	}
}
/*====================================================*/
/*  選択したポケモンの毛づやレベルが最大か？          */
/*====================================================*/
static u8 is_fur_max(void)
{
	PokemonParam *poke;
	poke = PokeParaMine;
	poke += NaviWork->sort_data[NaviWork->condition_poke_sel].poke;

	// けづや値が最大なら何も変わらない
	if(PokeParaGet(poke, ID_fur) == 255)
	{
		return 1;
	}

	return 0;
}
/*====================================================*/
/*  選択番号←→てもち番号相互変換                    */
/*（選択番号はタマゴをスキップしているため）          */
/*====================================================*/
static u8 selno_to_pokeno(u8 selno)
{
	u8 i;

	for(i = 0; i < STOCK_POKE_MAX; i++){
		if(PokeParaGet(PokeParaMine+i, ID_tamago_flag)==0){
			if(selno==0){
				return i;
			}else{
				selno--;
			}
		}
	}
	return 0;  // あり得ないけど
}
static u8 pokeno_to_selno(u8 pokeno)
{
	u8 i, cnt;

	for(i = 0, cnt = 0; i < pokeno; i++){
		if(PokeParaGet(PokeParaMine+i, ID_tamago_flag)){
			cnt++;
		}
	}
	return pokeno - cnt;
}

u8 CubedemoSelnoToPokeno(u8 selno)
{
	return selno_to_pokeno(selno);
}

/***********************************************************************
**  アクター表示                                                      **
***********************************************************************/
#define UPDOWN_X1  (156)  // かっこよさ
#define UPDOWN_Y1  (36 - DATAAREA_UP)
#define UPDOWN_X2  (117)  // うつくしさ
#define UPDOWN_Y2  (59 - DATAAREA_UP)
#define UPDOWN_X3  (117)  // かわいさ
#define UPDOWN_Y3  (118 - DATAAREA_UP)
#define UPDOWN_X4  (197)  // かしこさ
#define UPDOWN_Y4  (118 - DATAAREA_UP)
#define UPDOWN_X5  (197)  // たくましさ
#define UPDOWN_Y5  (59 - DATAAREA_UP)

static const actHeader UpDownHeader;
static void actmove_up(actWork *act);

static void add_updown_actor(void)
{
	static const CellData cell = { updown_Character, sizeof(updown_Character), CELLID_UPDOWN };
	static const PalData  pal = { updown_Palette, PALID_UPDOWN };
	static const u16 pos[5][2] = {
		{ UPDOWN_X1, UPDOWN_Y1 },
		{ UPDOWN_X2, UPDOWN_Y2 },
		{ UPDOWN_X3, UPDOWN_Y3 },
		{ UPDOWN_X4, UPDOWN_Y4 },
		{ UPDOWN_X5, UPDOWN_Y5 },
	};
	u16 i, actno;

	CellSet(&cell);
	ObjPalSet(&pal);
	work->updown_act_cnt = 0;

	for(i = 0; i < 5; i++)
	{
		if(work->param_up[i])
		{
			actno = AddActor(&UpDownHeader, pos[i][0], pos[i][1], 0);
			if(actno != ACT_MAX)
			{
				if(work->param_up[i] > 0){
					ActWork[actno].move = actmove_up;

#if 0   // さがることは無くなった
				}else{
					ActAnmChg(&ActWork[actno], 1);
					ActWork[actno].move = actmove_down;
#endif

				}
				work->updown_act_cnt++;
			}
		}
	}
}

/*============================================*/
/*  動作関数                                  */
/*============================================*/
// ↓どちらも60syncくらい表示しておく
static void actmove_up(actWork *act)
{
	if(act->work[0] < 6)
	{
		act->dy -= 2;
	}else if(act->work[0] < 12){
		act->dy += 2;
	}

	if(++(act->work[0]) > 60)
	{
		DelActor(act);
		work->updown_act_cnt--;
	}
}
/*============================================*/
/*  アクターデータ                            */
/*============================================*/
static const ActOamData UpDownOam = {
	0,		//u32 VPos:8;             // Ｙ座標
	0,		//u32 AffineMode:2;       // アフィンモード
	0,		//u32 ObjMode:2;          // ＯＢＪモード
	OFF,	//u32 Mosaic:1;           // モザイク
	0,		//u32 ColorMode:1;        // １６色/２５６色 選択
	1,		//u32 Shape:2;            // ＯＢＪ形状

	0,		//u32 HPos:9;             // Ｘ座標
	0,		//u32 AffineParamNo:5;    // アフィン変換パラメータNo & H,VFlip
	2,		//u32 Size:2;             // ＯＢＪサイズ

	0,		//u32 CharNo:10;          // キャラクタＮｏ
	1,		//u32 Priority:2;         // 表示優先
	0,		//u32 Pltt:4;             // パレットＮｏ
	0,
};
static const actAnm UpDownAnm[]={
	{0,5,0,0}, {ACT_ANMEND,0,0,0},
	{8,5,0,0}, {ACT_ANMEND,0,0,0},
};
static const actAnm *const UpDownAnmTbl[]={
	UpDownAnm + 0,
	UpDownAnm + 2,
};
static const actHeader UpDownHeader = {
	CELLID_UPDOWN,
	PALID_UPDOWN,
	&UpDownOam,
	UpDownAnmTbl,
	ACT_NTRANS,
	DummyActAffTbl,
	DummyActMove,
};

