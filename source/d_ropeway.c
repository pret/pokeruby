//<demo_ropeway.c>
//////////////////////////////////////////////////////////////////////
//
//		デバッグ用ロープウェイデモ画面処理
//		DebugIwasawa内からの呼び出し
//
//												By Iwasawa 02/05/27
//////////////////////////////////////////////////////////////////////

#include "d_ropeway.h"
#include "intr.h"
#include "task.h"
#include "menu.h"
#include "fld_task.h"
#include "fld_tool.h"
#include "script.h"

#include "ev_flag.h"
#include "evobj.h"
#include "weather.h"
#include "wea_com.h"
#include "decord.h"
#include "mus_tool.h"
#include "laster.h"
#include "../graphic/pokegra.h"

//メインタスクプロトタイプ
void DemoRopewayInit(void);			//デモの初期化
static void DemoRopewayMain(void);	//デモのメインタスク
static void DemoRopewayExit(void);	//デモの終了

//サブタスクプロトタイプ
static void DemoRopewayProc(u8);	//演算用のサブタスク
static void DemoRopewayUp(u8);		//のぼり用サブタスク
static void DemoRopewayDown(u8);	//下り用サブタスク

//VBlank割り込み関数プロトタイプ
static void DemoRopewayDraw(void);

//アクター動作関数プロトタイプ
static void DummyMoveSeq(actWork* xreg);		//動かない
static void rwd_dondola_move(actWork* xreg);	//ゴンドラ本体の動き

//ローカル関数プロトタイプ
static void SetScreenState(u8	setflg);	//スクリーン制御関係のレジスタセット
static void demo_ropeway_init(void);		//条件に応じて、オブジェクト用意

//山のスクロール処理
static void MtScrollUp(void);			//のぼり用
static void MtScrollTransUp(void);
static void MtScrollDown(void);			//下り用
static void MtScrollTransDown(void);
static void MtScrollInit(u8	flg);		//スクロール値の初期化

#include "d_ropeway.dat"
#include "d_rwAct.dat"

//ファイル内グローバルデータ
static RWDEMO_WORK*	sg_pWork = NULL;

///////////////////////////////////////////////////
//	スクリプトからの呼び出し
/////////////////////////////////////////////////////
static void rwd_fadewait(u8 tID)
{
	if(FadeData.fade_sw != 0) return;

	//フェードアウトが終わったら、メインタスク切り替え
	MainProcChange(DemoRopewayInit);
	DelTask(tID);	//このタスクはもういらないので消す

	return;
}
void DemoRopewayCall(void)
{
	u8	taskno;

	SetForceEvent();	//強制イベントフラグセット
	taskno = AddTask(rwd_fadewait,1);			//フェード待ちのタスクをAdd
	PaletteFadeReq(0xffffffff,0,0,16,0x0000);	//フェードアウトリクエスト
	return;
}

///////////////////////////////////////////////////
//	デバッグメニューからの呼び出し
//////////////////////////////////////////////////
#ifdef PM_DEBUG
void DemoRopewaySetUp(void)
{
	ScriptParameter0 = RWD_UP;
	MenuEnd();
	
	DemoRopewayCall();
	return;
}
void DemoRopewaySetDown(void)
{
	ScriptParameter0 = RWD_DOWN;
	MenuEnd();
	
	DemoRopewayCall();
	return;
}
#endif	//PM_DEBUG

////////////////////////////////////////////////////
//	メインタスク
////////////////////////////////////////////////////
/*----------------------------------------------
	ロープウェイデモ 初期化タスク

	void DemoRopewayInit(void);
------------------------------------------------*/
void DemoRopewayInit(void)
{
	u8	ct = 0;
	
	switch(sys.InitSeqWork)
	{
	default:
	case 0:
		SetVBlankFunc(NULL);
		LasterInit();							//HDMA初期化
		DIV_DMACLEAR(3,0,VRAM,VRAM_SIZE,16);	//VRAMクリア
		DIV_DMACLEAR(3,0,OAM,OAM_SIZE,32);		//OAMクリア
		DIV_DMACLEAR(3,0,PLTT,PLTT_SIZE,16);	//PlttRAMクリア
		
		//デモ用ワーククリア
		sg_pWork =(RWDEMO_WORK *)( &(UserWork[RWD_WORK0_AREA]));
		DIV_DMACLEAR(3,0,sg_pWork,sizeof(RWDEMO_WORK),16);
		
		sys.InitSeqWork++;
		break;
	case 1:		//タスク・アクター・GRデータ初期化
		InitActor();					//アクターシステム初期化
		InitTask();						//タスクシステム初期化
		ObjPalManInit();				//オブジェクトパレットマネージャー初期化
		PaletteAnimeInit();				//パレットアニメーションシステム初期化

		WeatherInit();	//天候エフェクト初期化
		for(ct = 0;ct < ASH_OBJ_MAX;ct++){
			wp->ash_actor[ct] = NULL; 
		}
		//サウンド初期化
		BGM_SystemInit();
		BGM_Init();
		
		ActOX = ActOY = 0;
		sys.InitSeqWork++;
		break;
	case 2:
		//必要なセルとパレットデータを用意
		for(ct = 0;ct < RWD_OBJCELL_NUM;ct++){
			DecordCellSet((CellData*)&(RWD_DataCell[ct]));
		}
		ObjPalSets(&RWD_DataPal[0]);	//パレットSで、PALLETRAMに

		//圧縮スクリーンデータをUserWorkに展開
		DecordWram((void *)GD_BG_MT_MAPSRC,(void*)GD_BG_MT_MAP);
		DecordWram((void *)GD_BG_TREE_MAPSRC,(void*)GD_BG_TREE_MAP);
		DecordWram((void *)GD_BG_SKY_MAPSRC,(void*)GD_BG_SKY_MAP);
		DecordWram((void *)GD_BG_POLE2_MAPSRC,(void*)GD_BG_POLE2_MAP);

		//BG用パレットデータをワークに転送
		PaletteWorkSet((const u16 *)rwd_bg01_pcl_ADRS,PA_BG0,0x20*4);

		//VRAMにBGキャラクタを展開
		LZ77UnCompVram((void *)rwd_bg01_pch_ADRS,(void *)VRAM);

		sys.InitSeqWork++;
		break;
	case 3:
		//自機の性別や上り下りを判断して、初期化
		//自機のオブジェクトもここで用意
		demo_ropeway_init();
		MainTask();				//天候エフェクト処理
		sys.InitSeqWork++;
		break;
	case 4:
		if(sg_pWork->uc_weather == WEATHER_ASH){
			sys.InitSeqWork++;
			break;
		}

		if(wp->ash_actor[0] == NULL) break;
		
		for(ct = 0;ct < ASH_OBJ_MAX;ct++){
			if(wp->ash_actor[ct] != NULL){
				wp->ash_actor[ct]->oamData.Priority = 0;
			}
		}
		sys.InitSeqWork++;
		break;
	case 5:		//バッファに初期BGデータを用意
		//森林
		SetChar16R((_tMap *)(SCREEN_BASE29_ADDR),(u16 *)GD_BG_TREE_MAP,0,17,32,15);
		//背景
		SetChar16R((_tMap *)(SCREEN_BASE30_ADDR),(u16 *)GD_BG_SKY_MAP,0,0,30,20);	//Screen2
		//支柱
		SetChar16R(&(sg_pWork->map[1]),(u16 *)GD_BG_POLE1_MAP,0,0,5,2);
		SetChar16R(&(sg_pWork->map[1]),(u16 *)GD_BG_POLE2_MAP,0,2,2,20);

		sys.InitSeqWork++;
		break;
	case 6:
		MtScrollInit(ScriptParameter0);
		//山肌
		SetChar16R(&(sg_pWork->map[0]),&(((u16 *)GD_BG_MT_MAP)[12*6]),0,14,12,3);		//Screen0
		SetChar16R(&(sg_pWork->map[0]),&(((u16 *)GD_BG_MT_MAP)[12*9]),12,17,12,3);	//Screen0
		SetChar16R(&(sg_pWork->map[0]),&(((u16 *)GD_BG_MT_MAP)[12*12]),24,20,12,3);
		SetChar16R(&(sg_pWork->map[0]),&(((u16 *)GD_BG_MT_MAP)[0]),0,17,12,3);
		SetChar16R(&(sg_pWork->map[0]),&(((u16 *)GD_BG_MT_MAP)[12*3]),0,20,12,3);
		SetChar16R(&(sg_pWork->map[0]),&(((u16 *)GD_BG_MT_MAP)[0]),12,20,12,3);
		SetChar16R(&(sg_pWork->map[0]),&(((u16 *)GD_BG_MT_MAP)[12*3]),12,23,12,3);
		SetChar16R(&(sg_pWork->map[0]),&(((u16 *)GD_BG_MT_MAP)[0]),24,23,12,3);
		
		sys.InitSeqWork++;
		break;
	case 7:
		PaletteFadeReq(0xffffffff,3,16,0,0);	//フェードインリクエスト		
		
		//BGMセット
		MusicFadeInPlay(MUS_ROPEWAY,1);		

		//BGコントロールレジスタを設定
		SetScreenState(RWD_START);
		sys.InitSeqWork++;
		break;
	case 8:
		//VBlank割り込み許可
		REG_IE_SET(V_BLANK_INTR_FLAG);
		SetVBlankFunc(DemoRopewayDraw);
		
		MainProcChange(DemoRopewayMain);
		AddTask(DemoRopewayProc,0);

		//上りと下りを区別して、サブタスクをセット
		if(ScriptParameter0 == RWD_UP){
			sg_pWork->uc_subTaskNo = AddTask(DemoRopewayUp,1);
		}
		else{
			sg_pWork->uc_subTaskNo = AddTask(DemoRopewayDown,1);
		}
		break;
	}
	return;
}

/*-------------------------------------------
	ロープウェイデモ メインタスク

	static void DemoRopewayMain(void);
------------------------------------------------*/
static void DemoRopewayMain(void)
{
	MainTask();
	JumpActor();
	SetActor();
	PaletteAnime();

	//サウンド再生
	BGM_Main();
	return;
}

/*----------------------------------------------
	ロープウェイデモ	終了タスク
	
	static void DemoRopewayExit(void);
------------------------------------------------*/
static void DemoRopewayExit(void)
{
	u8	ct = 0;

	SetScreenState(RWD_CLEAR);			//レジスタクリア

	//天候エフェクトクリア
	ActOX = 0;
	WeatherChangeDemo(WEATHER_OFF);
	for(ct = 0;ct < ASH_OBJ_MAX;ct++){
		wp->ash_actor[ct] = NULL; 
	}
	
	InitTask();
	InitActor();
	PaletteAnimeInit();

	//ユーザーワーククリア
	DIV_DMACLEAR(3,0,UserWork,sizeof(UserWork),32);
	sg_pWork = NULL;

	DIV_DMACLEAR(3,0,VRAM,VRAM_SIZE,16);	//VRAMクリア
	DIV_DMACLEAR(3,0,OAM,OAM_SIZE,32);		//OAMクリア
	DIV_DMACLEAR(3,0,PLTT,PLTT_SIZE,16);	//PlttRAMクリア
	

	//スクリプトへ復帰する
	SetNextWorldPosition();
	pFieldRecoverFunc = NULL;//AddFieldInTask;
	MainProcChange( FieldMainInit );
		
	return;
}

///////////////////////////////////////////////////////
//	サブタスク
//////////////////////////////////////////////////////
static void DemoRopewayProc(u8 tID)
{
	u8	ct = 0;
	
	sg_pWork->us_time++;

	switch(sg_pWork->uc_state)
	{
	case 0x00:
		//天候チェンジチェック
		if(sg_pWork->us_time == sg_pWork->us_weaTime){
			WeatherChangeSmooth(sg_pWork->uc_weather);
			sg_pWork->uc_state = 0x01;
		}
		break;
	case 0x01:
		switch(sg_pWork->uc_weather)
		{
		case WEATHER_ASH:
			if(wp->ash_actor[0] != NULL && wp->ash_actor[0]->oamData.Priority != 0){
				for(ct = 0;ct < ASH_OBJ_MAX;ct++){
					if(wp->ash_actor[ct] != NULL){
						wp->ash_actor[ct]->oamData.Priority = 0;
					}
				}
				sg_pWork->uc_state = 0x02;
			}
			break;
		case WEATHER_SHINE2:
			if(wp->status == WEATHER_SHINE2){
				sg_pWork->uc_state = 0x02;
				return;
			}
			if(sg_pWork->us_time < (sg_pWork->us_weaTime+8)){
				return;
			}
			for(ct = 0;ct < ASH_OBJ_MAX;ct++){
				if(wp->ash_actor[ct] != NULL){
					wp->ash_actor[ct]->banish ^= 1;
				}
			}
			break;
		default:
			break;
		}
		break;
	case 0x02:
		//終了チェック
		if(sg_pWork->us_time == RWD_TIME_END){
			sg_pWork->uc_state = 0x03;
			PaletteFadeReq(0xFFFFFFFF,3,0,16,0x0000);	

			//BGMフェードアウト
			MusicFadeOutEnd(4);
			return;	
		}		
		break;
	case 0x03:	//フェード待ち
		if(FadeData.fade_sw == 0)sg_pWork->uc_state = 0xFF;
		break;
	case 0xFF:
		SetVBlankFunc(NULL);
		DelTask(tID);

		//もうひとつのサブタスクも削除
		DelTask(sg_pWork->uc_subTaskNo);
		MainProcChange(DemoRopewayExit);
		break;
	}
	return;	
}

static void DemoRopewayUp(u8 tID)
{
	switch(sg_pWork->uc_state)
	{
	case 0xFF:
		break;
	default:
		//支柱のスクロール
		sg_pWork->scroll[RWD_BG_POLE].uc_x -=1;
		if(sg_pWork->us_time % 2 == 0)
		{
			sg_pWork->scroll[RWD_BG_POLE].uc_y--;
		}
		if(sg_pWork->us_time % 8 == 0)
		{
			//森のスクロール
			sg_pWork->scroll[1].uc_x--;
			sg_pWork->scroll[RWD_BG_TREE].uc_y--;
		}
		
		//支柱の位置リセット
		switch(sg_pWork->scroll[RWD_BG_POLE].uc_x)
		{
		case (256+RWD_U_POLE_X-1):
			FillChar16R(&(sg_pWork->map[1]),0x0000,0,22,2,10);
			break;
		case (256 - 27*8):
			FillChar16R(&(sg_pWork->map[1]),0x0000,3,0,2,2);
			break;
		case (256 - 28*8):
			FillChar16R(&(sg_pWork->map[1]),0x0000,2,0,1,2);
			break;
		case (16):
			SetChar16R(&(sg_pWork->map[1]),(u16 *)GD_BG_POLE1_MAP,0,0,5,2);
			SetChar16R(&(sg_pWork->map[1]),(u16 *)GD_BG_POLE2_MAP,0,2,2,30);
			sg_pWork->scroll[RWD_BG_POLE].uc_y  = 64;
			break;
		}
		break;
	}
	//斜面のスクロール
	MtScrollUp();

	//火山灰のスクロール
	ActOX = (ActOX+1)%128;
	return;
}

static void DemoRopewayDown(u8 tID)
{
	switch(sg_pWork->uc_state)
	{
	case 0xFF:
		break;
	default:
		//支柱のスクロール
		sg_pWork->scroll[RWD_BG_POLE].uc_x += 1;
		if(sg_pWork->us_time% 2 == 0){
			sg_pWork->scroll[RWD_BG_POLE].uc_y++;
		}
		//森のスクロール
		if(sg_pWork->us_time % 8 == 0){
				sg_pWork->scroll[1].uc_x++;
				sg_pWork->scroll[RWD_BG_TREE].uc_y++;
		}
		
		//支柱の位置リセット
		switch(sg_pWork->scroll[RWD_BG_POLE].uc_x)
		{
		case (256+RWD_U_POLE_X):
			SetChar16R(&(sg_pWork->map[1]),(u16 *)GD_BG_POLE2_MAP,0,2,2,30);
			break;
		case (16):
			FillChar16R(&(sg_pWork->map[1]),0x0000,2,0,3,2);
			FillChar16R(&(sg_pWork->map[1]),0x0000,0,22,2,10);
			sg_pWork->scroll[RWD_BG_POLE].uc_y = 256-64;
			break;
		case (32):
			sg_pWork->map[1].usa[0][2] = ((u16 *)GD_BG_POLE1_MAP)[2];
			sg_pWork->map[1].usa[0][3] = ((u16 *)GD_BG_POLE1_MAP)[3];
			sg_pWork->map[1].usa[1][2] = ((u16 *)GD_BG_POLE1_MAP)[7];
			sg_pWork->map[1].usa[1][3] = ((u16 *)GD_BG_POLE1_MAP)[8];
			break;
		case (40):
			sg_pWork->map[1].usa[0][4] = ((u16 *)GD_BG_POLE1_MAP)[4];
			sg_pWork->map[1].usa[1][4] = ((u16 *)GD_BG_POLE1_MAP)[9];
			break;
		}
		break;
	}
	//斜面のスクロール
	MtScrollDown();

	//火山灰のスクロール
	if(sg_pWork->us_time < sg_pWork->us_weaTime)
		ActOX = (ActOX-1+248)%248;
	else	//天候切り替えフェード処理中もスクロールさせるため、直値をいじってる
		wp->ash_xline = (wp->ash_xline-1+248)%248;
	
	return;
}

//////////////////////////////////////////////////////
//	VBlank割り込み	描画関数
//////////////////////////////////////////////////////
static void DemoRopewayDraw(void)
{
	//BG情報を転送
	DmaCopy(3,&(sg_pWork->map[0].usa[0][0]),SCREEN_BASE28_ADDR,2048,16);
	DmaCopy(3,&(sg_pWork->map[1].usa[0][0]),SCREEN_BASE31_ADDR,2048,16);
	
	*(vu16 *)REG_BG3HOFS = (vu16)(sg_pWork->scroll[RWD_BG_POLE].uc_x);
	*(vu16 *)REG_BG3VOFS = (vu16)(sg_pWork->scroll[RWD_BG_POLE].uc_y);
	*(vu16 *)REG_BG1HOFS = (vu16)(sg_pWork->scroll[RWD_BG_TREE].uc_x);
	*(vu16 *)REG_BG1VOFS = (vu16)(sg_pWork->scroll[RWD_BG_TREE].uc_y);
	*(vu16 *)REG_BG0HOFS = (vu16)(sg_pWork->scroll[RWD_BG_MT].uc_x);
	*(vu16 *)REG_BG0VOFS = (vu16)(sg_pWork->scroll[RWD_BG_MT].uc_y);
		
	actOAMtrans();
	actDMAtrans();
	PaletteFadeTrans();
	return;
}

//////////////////////////////////////////////////////////
//	アクターアニメーション関数
//////////////////////////////////////////////////////////
static void DummyMoveSeq(actWork* xreg)
{
	return;	
}

//ゴンドラの移動
static void rwd_dondola_move(actWork* xreg)
{
	if(sg_pWork->uc_state == 0xFF) return;

	if(ScriptParameter0 == RWD_UP)
	{
		xreg->x = xreg->work[0] - (u8)((float)sg_pWork->us_time*0.14f);
		xreg->y = xreg->work[1] - (u8)((float)sg_pWork->us_time*0.067f);
	}
	else{
		xreg->x = xreg->work[0] + (u8)((float)sg_pWork->us_time*0.14f);
		xreg->y = xreg->work[1] + (u8)((float)sg_pWork->us_time*0.067f);	
	}
	return;
}

static void rwd_hero_move(actWork* xreg)
{
	if(sg_pWork->uc_state == 0xFF) return;
	
	if(ScriptParameter0 == RWD_UP)
	{
		xreg->x = xreg->work[0] - (u8)((float)sg_pWork->us_time*0.14f);
		xreg->y = xreg->work[1] - (u8)((float)sg_pWork->us_time*0.067f);
	}
	else{
		xreg->x = xreg->work[0] + (u8)((float)sg_pWork->us_time*0.14f);
		xreg->y = xreg->work[1] + (u8)((float)sg_pWork->us_time*0.067f);	
	}

	//キャラが上下にぴょこぴょこ動くように
	switch(xreg->work[2])
	{
	case 0:
		xreg->dy = 17;
		if(xreg->work[3]++ >= 10)
		{
			xreg->work[3] = 0;
			xreg->work[2]++;
		}
		break;
	default:
		xreg->dy = 16;
		if(xreg->work[3]++ >= 10)
		{
			xreg->work[3] = 0;
			xreg->work[2] = 0;
		}
		break;	
	}
	return;
}

//時々斜面を横切るキャラクタの動き(ゴンドラが上る時用)
static void rwd_man_moveUp(actWork* xreg)
{
	if(xreg->work[0] == 0){		//キャラクタサイズによる位置補正
		xreg->x += xreg->cx*2;
		xreg->y += (xreg->cy+16);
	}
	
	xreg->work[0]++;	//タイマーアップ
	if(xreg->work[0] < xreg->work[2])	return;
	
	switch(xreg->work[1])
	{
	case 0:
		xreg->x++;
		if(xreg->work[0] % 4 == 0) xreg->y++;

		break;
	case 1:
		if(xreg->work[0] % 2 == 0) break;
		xreg->x++;
		if(xreg->x % 4 == 0)xreg->y++;

		break;
	}

	if(xreg->y > 160) DelActor(xreg);
	return;
}
//時々斜面を横切るキャラクタの動き(ゴンドラが下る時用)
static void rwd_man_moveDown(actWork* xreg)
{
	if(xreg->work[0] == 0)	//キャラクタサイズによる位置補正
	{
		xreg->y += (xreg->cy+16);
	}
	xreg->work[0]++;

	if(xreg->work[0] < xreg->work[2]) return;

	switch(xreg->work[1])
	{
	case 0:
		xreg->x--;	
		if(xreg->work[0]%4 == 0)xreg->y--;
		break;
	case 1:	
		if(xreg->work[0] % 2 == 0) break;
		xreg->x--;
		if(xreg->x % 4 == 0)xreg->y--;
	}
	if(xreg->y < 80) DelActor(xreg);
}


//////////////////////////////////////////////////////
//	ファイル内	ローカル関数
//////////////////////////////////////////////////////
/*----------------------------------------------------
	全スクリーンの初期化
	
	static void SetScreenState(u8	setflg);
	
	i	u8	RWD_CLEAR	0:全レジスタクリア
			RWD_START	1:使用する値でセット
------------------------------------------------------*/
static void SetScreenState(u8	setflg){
	
	switch(setflg)
	{
	default:
	case RWD_CLEAR:
		*(vu16 *)REG_WININ = 0;
		*(vu16 *)REG_WINOUT = 0;
		*(vu16 *)REG_WIN0H = 0;
		*(vu16 *)REG_WIN1H = 0;
		*(vu16 *)REG_WIN0V = 0;
		*(vu16 *)REG_WIN1V = 0;
		
		*(vu16 *)REG_DISPCNT	= 0;
		*(vu16 *)REG_BG3CNT		= 0;
		*(vu16 *)REG_BG2CNT		= 0;
		*(vu16 *)REG_BG1CNT		= 0;
		*(vu16 *)REG_BG0CNT		= 0;

		*(vu16 *)REG_BG3HOFS	= 0;
		*(vu16 *)REG_BG3VOFS	= 0;
		*(vu16 *)REG_BG2HOFS	= 0;
		*(vu16 *)REG_BG2VOFS	= 0;
		*(vu16 *)REG_BG1HOFS	= 0;
    	*(vu16 *)REG_BG1VOFS	= 0; 
		*(vu16 *)REG_BG0HOFS	= 0;
		*(vu16 *)REG_BG0VOFS	= 0; 

		*(vu16 *)REG_BLDCNT = 0;
    	return;
    case RWD_START:

		*(vu16 *)REG_WININ = 0;
		*(vu16 *)REG_WINOUT = 0;
		*(vu16 *)REG_WIN0H = 0;
		*(vu16 *)REG_WIN1H = 0;
		*(vu16 *)REG_WIN0V = 0;
		*(vu16 *)REG_WIN1V = 0;

		//BGスクロールの初期値をセット
		if(ScriptParameter0 == RWD_UP)
		{
			sg_pWork->scroll[RWD_BG_POLE].uc_x = (u8)RWD_U_POLE_X;
			sg_pWork->scroll[RWD_BG_POLE].uc_y = (u8)RWD_U_POLE_Y;
			sg_pWork->scroll[RWD_BG_TREE].uc_x = RWD_U_TREE_X;
			sg_pWork->scroll[RWD_BG_TREE].uc_y = RWD_U_TREE_Y;
			sg_pWork->scroll[RWD_BG_MT].uc_y = 0;
			sg_pWork->scroll[RWD_BG_MT].uc_y = 0;
		}
		else{
			sg_pWork->scroll[RWD_BG_POLE].uc_x = (u8)RWD_D_POLE_X;
			sg_pWork->scroll[RWD_BG_POLE].uc_y = (u8)RWD_D_POLE_Y;
			sg_pWork->scroll[RWD_BG_TREE].uc_x = RWD_D_TREE_X;
			sg_pWork->scroll[RWD_BG_TREE].uc_y = RWD_D_TREE_Y;
			sg_pWork->scroll[RWD_BG_MT].uc_y = 0;
			sg_pWork->scroll[RWD_BG_MT].uc_y = 0;
		}
		*(vu16 *)REG_BG3HOFS	= sg_pWork->scroll[RWD_BG_POLE].uc_x;
		*(vu16 *)REG_BG3VOFS	= sg_pWork->scroll[RWD_BG_POLE].uc_y;
		*(vu16 *)REG_BG2HOFS	= 0;
		*(vu16 *)REG_BG2VOFS	= 0;
		*(vu16 *)REG_BG1HOFS	= sg_pWork->scroll[RWD_BG_TREE].uc_x;
		*(vu16 *)REG_BG1VOFS	= sg_pWork->scroll[RWD_BG_TREE].uc_y; 
		*(vu16 *)REG_BG0HOFS	= sg_pWork->scroll[RWD_BG_MT].uc_x;
		*(vu16 *)REG_BG0VOFS	= sg_pWork->scroll[RWD_BG_MT].uc_y; 	
		
	  	*(vu16 *)REG_BG0CNT =	BG_SCREEN_SIZE_0 |			//256*256
								BG_LOOP_ON |				//回り込み表示ON:
								BG_COLOR_16 |				//16色パレットモード
								BG_PRIORITY_1 |				//優先度０
								BG_MOS_OFF |				//モザイクOFF
								28 << BG_SCREEN_BASE_SHIFT |	//ScreenBaseBlock_0
								0 << BG_CHAR_BASE_SHIFT;	//ChaeBase_3
		*(vu16 *)REG_BG1CNT =	BG_SCREEN_SIZE_0 |			//256*256
								BG_LOOP_ON |				//回り込み表示ON:
								BG_COLOR_16 |				//16色パレットモード
								BG_PRIORITY_2 |				//優先度０
								BG_MOS_OFF |				//モザイクOFF
								29 << BG_SCREEN_BASE_SHIFT |	//ScreenBaseBlock_0
								0 << BG_CHAR_BASE_SHIFT;	//ChaeBase_3
		*(vu16 *)REG_BG2CNT =	BG_SCREEN_SIZE_0 |			//256*256
								BG_LOOP_ON |				//回り込み表示ON:
								BG_COLOR_16 |				//16色パレットモード
								BG_PRIORITY_3 |				//優先度０
								BG_MOS_OFF |				//モザイクOFF
								30 << BG_SCREEN_BASE_SHIFT |	//ScreenBaseBlock_0
								0 << BG_CHAR_BASE_SHIFT;	//ChaeBase_3
		*(vu16 *)REG_BG3CNT =	BG_SCREEN_SIZE_0 |			//256*256
								BG_LOOP_ON |				//回り込み表示ON:
								BG_COLOR_16 |				//16色パレットモード
								BG_PRIORITY_0 |				//優先度０
								BG_MOS_OFF |				//モザイクOFF
								31 << BG_SCREEN_BASE_SHIFT |	//ScreenBaseBlock_0
								0 << BG_CHAR_BASE_SHIFT;	//ChaeBase_3

		//BGMode0,表示
		*(vu16 *)REG_DISPCNT =	DISP_MODE_0 |			//BG_MODE0
								DISP_OBJ_CHAR_1D_MAP |	//OBJ_VRAM１次元マップ
								DISP_BG0_ON |
								DISP_BG1_ON |
								DISP_BG2_ON |
								DISP_BG3_ON |
								DISP_OBJ_ON;			//OBJ表示
		
		//ブレンディングパラメータ設定
		*(vu16 *)REG_BLDCNT = BLD_2ND_ALL;
  		break;
  	}
    return;
}

typedef void (*pActMoveSeq)(actWork*);
/*-------------------------------------------
	使用するオブジェクトの初期化
	上りと下り、主人公の性別をみて、初期位置などを用意
	
	static void demo_ropeway_init(void);
--------------------------------------------*/
static void demo_ropeway_init(void)
{
	u8	uc_sex[2] = {HERO,HEROINE};
	u8	ct = 0,uc_no = 0;
	u16	rseed = pp_rand();
	u8	uc_aPerson[RWD_RND_MAX] = {HILL1,BOYSCOUT1,GIRLSCOUT1,ATTACK1};
	s16	us_aPos[2][2] = {{RWD_U_MAN_X,RWD_U_MAN_Y},{RWD_D_MAN_X,RWD_D_MAN_Y}};
	u8	uc_aTime[RWD_RND_MAX] = {0,60,120,170};
	pActMoveSeq	actTbl[2] = {rwd_man_moveUp,rwd_man_moveDown};

	switch(ScriptParameter0)
	{
	default:
	case RWD_UP:	//上り
		//性別に応じて自機OBJセット
		uc_no = EvObjMakeAddAct(uc_sex[MyData.my_sex],rwd_hero_move,
								RWD_U_G1_X+RWD_HERO_OFSX,
								RWD_U_G1_Y+RWD_HERO_OFSY,RWD_OPRI_HERO);
		if(uc_no != ACT_MAX){
			ActWork[uc_no].oamData.Priority = 2;
			ActWork[uc_no].dx = 8;	//OBJの左上の座標で考えられるようにオフセット
			ActWork[uc_no].dy = 16;
			ActWork[uc_no].work[0] = RWD_U_G1_X+RWD_HERO_OFSX;	//初期位置記憶
			ActWork[uc_no].work[1] = RWD_U_G1_Y+RWD_HERO_OFSY;
		}

		//ゴンドラの本体
		uc_no = AddActor(&(RWD_Header[0]),	RWD_U_G1_X,				//ゴンドラ本体
											RWD_U_G1_Y,
											RWD_OPRI_G1);
		ActWork[uc_no].dx = ActWork[uc_no].dy = 32;
		ActWork[uc_no].work[0] = RWD_U_G1_X;
		ActWork[uc_no].work[1] = RWD_U_G1_Y;
		
		//ゴンドラの下部キャラクタ
		uc_no = AddActor(&(RWD_Header[1]),	RWD_U_G1_X+RWD_G2_OFSX,
											RWD_U_G1_Y+RWD_G2_OFSY,
											RWD_OPRI_G2);
		ActWork[uc_no].dx = 8;
		ActWork[uc_no].dy = 4;
		ActWork[uc_no].work[0] = RWD_U_G1_X+RWD_G2_OFSX;
		ActWork[uc_no].work[1] = RWD_U_G1_Y+RWD_G2_OFSY;

		//天候設定
		sg_pWork->uc_weather = WEATHER_ASH;
		sg_pWork->us_weaTime = RWD_WEATHER_CHANGE;
		WeatherChangeDemo(WEATHER_SHINE2);
		break;
	case RWD_DOWN:		//くだりの初期値をセット
		SetChar16R(&(sg_pWork->map[0]),&(((u16 *)GD_BG_MT_MAP)[12*3]),24,26,12,3);
		
		//性別に応じて自機OBJセット
		uc_no = EvObjMakeAddAct(uc_sex[MyData.my_sex],rwd_hero_move,
								RWD_D_G1_X+RWD_HERO_OFSX,
								RWD_D_G1_Y+RWD_HERO_OFSY,RWD_OPRI_HERO);
		if(uc_no != ACT_MAX){
			ActWork[uc_no].oamData.Priority = 2;
			ActWork[uc_no].dx = 8;
			ActWork[uc_no].dy = 16;
			ActWork[uc_no].work[0] = RWD_D_G1_X+RWD_HERO_OFSX;
			ActWork[uc_no].work[1] = RWD_D_G1_Y+RWD_HERO_OFSY;
		}
		
		//ゴンドラの本体をADD
		uc_no = AddActor(&(RWD_Header[0]),	RWD_D_G1_X,				//ゴンドラ本体
											RWD_D_G1_Y,
											RWD_OPRI_G1);
		ActWork[uc_no].dx = ActWork[uc_no].dy = 32;
		ActWork[uc_no].work[0] = RWD_D_G1_X;
		ActWork[uc_no].work[1] = RWD_D_G1_Y;
		
		//ゴンドラの下部パーツをADD
		uc_no = AddActor(&(RWD_Header[1]),	RWD_D_G1_X+RWD_G2_OFSX,	//ゴンドラ下部
											RWD_D_G1_Y+RWD_G2_OFSY,
											RWD_OPRI_G2);
		ActWork[uc_no].dx = 8;
		ActWork[uc_no].dy = 4;
		ActWork[uc_no].work[0] = RWD_D_G1_X+RWD_G2_OFSX;
		ActWork[uc_no].work[1] = RWD_D_G1_Y+RWD_G2_OFSY;
		
		//天候セット
		sg_pWork->uc_weather = WEATHER_SHINE2;
		sg_pWork->us_weaTime = RWD_TIME_END - RWD_WEATHER_CHANGE+45;
		WeatherChangeDemo(WEATHER_ASH);
		break;
	}
	//ケーブル
	for(ct = 0;ct < 9;ct++)
	{
		uc_no = AddActor(&(RWD_Header[2]),	16*ct+RWD_CABLE_X,
											8*ct+RWD_CABLE_Y,
											RWD_OPRI_CABLE);
		ActWork[uc_no].dx = 8;
		ActWork[uc_no].dy = 8;
	}
	//ランダムで斜面をキャラクタが通り過ぎる
	if(rseed%64 == 0)
	{
		uc_no = EvObjMakeAddAct(
			uc_aPerson[(rseed%3)],
			actTbl[ScriptParameter0],
			us_aPos[ScriptParameter0][0],
			us_aPos[ScriptParameter0][1],RWD_OPRI_MAN);
		
		if(uc_no != ACT_MAX)
		{
			ActWork[uc_no].oamData.Priority = 2;
			ActWork[uc_no].dx = -ActWork[uc_no].cx;
			ActWork[uc_no].dy = -ActWork[uc_no].cy;

			if(ScriptParameter0 == 0)
			{
				if(rseed&0x0001){
					ActAnmChg(&(ActWork[uc_no]),WALK_L_1_ST);
					ActWork[uc_no].work[1] = 1;
					ActWork[uc_no].y += 2;
				}
				else{
					ActAnmChg(&(ActWork[uc_no]),WALK_R_1_ST);
					ActWork[uc_no].work[1] = 0;
				}
			}
			else{
				if(rseed&0x0001){
					ActAnmChg(&(ActWork[uc_no]),WALK_R_1_ST);
					ActWork[uc_no].work[1] = 1;
					ActWork[uc_no].y += 2;
				}
				else{
					ActAnmChg(&(ActWork[uc_no]),WALK_L_1_ST);
					ActWork[uc_no].work[1] = 0;
				}
			}
			ActWork[uc_no].work[2] = uc_aTime[rseed%RWD_RND_MAX];
		}
	}
	return;
}

////////////////////////////////////////////////////////////////
//	山肌のスクロール関連
////////////////////////////////////////////////////////////////
/*-------------------------------------------------------
	山肌のスクロール ＆ BG補間処理
		補間用のマップをバッファに用意する

	static void MtScrollMakeBuf(void);
------------------------------------------------------*/
static void MtScrollMakeBuf(void)
{
	u8	ct = 0,count = 0;
	u8	i = 0,j = 0;

	i = 12*3*(sg_pWork->MtScrl.uc_blockNo+2);
	for(ct = 0;ct < 3;ct++)
	{
		for(count = 0;count < 12;count++)
		{
			sg_pWork->MtScrl.us_buf[ct][count] = ((u16 *)GD_BG_MT_MAP)[i++];
			sg_pWork->MtScrl.us_buf[ct+3][count] = ((u16 *)GD_BG_MT_MAP)[j];
			sg_pWork->MtScrl.us_buf[ct+6][count] = ((u16 *)GD_BG_MT_MAP)[j+36];
			j++;
		}
	}
	//ブロックナンバー変更
	sg_pWork->MtScrl.uc_blockNo = (sg_pWork->MtScrl.uc_blockNo+1)%3;
	
}

/*---------------------------------------------------
	山肌のスクロール ＆ BG補間処理
		のぼりのスクロール、メイン処理

	static void MtScrollUp(void);
-----------------------------------------------------*/
static void MtScrollUp(void){
	//スクリーンスクロール処理
	sg_pWork->MtScrl.uc_scrScroll = (sg_pWork->MtScrl.uc_scrScroll+1)%96;
	
	sg_pWork->scroll[RWD_BG_MT].uc_x = 
		sg_pWork->MtScrl.uc_oldX - sg_pWork->MtScrl.uc_dx;
	sg_pWork->scroll[RWD_BG_MT].uc_y = 
		sg_pWork->MtScrl.uc_oldY - sg_pWork->MtScrl.uc_dy;
	
	sg_pWork->MtScrl.uc_dx++;
	if(sg_pWork->MtScrl.uc_dx % 4 == 0) sg_pWork->MtScrl.uc_dy++;

	if(sg_pWork->MtScrl.uc_dx <= 16) return;

	//BGの補間処理
	MtScrollTransUp();

}

/*---------------------------------------------------
	山肌のスクロール ＆ BG補間処理
		下りのスクロール、メイン処理

	static void MtScrollDown(void);
-----------------------------------------------------*/
static void MtScrollDown(void){
	//スクリーンスクロール処理
	sg_pWork->MtScrl.uc_scrScroll = (sg_pWork->MtScrl.uc_scrScroll+1)%96;
	
	sg_pWork->scroll[RWD_BG_MT].uc_x = 
		sg_pWork->MtScrl.uc_oldX + sg_pWork->MtScrl.uc_dx;
	sg_pWork->scroll[RWD_BG_MT].uc_y = 
		sg_pWork->MtScrl.uc_oldY + sg_pWork->MtScrl.uc_dy;
	
	sg_pWork->MtScrl.uc_dx++;
	if(sg_pWork->MtScrl.uc_dx % 4 == 0) sg_pWork->MtScrl.uc_dy++;

	if(sg_pWork->MtScrl.uc_dx <= 16) return;

	//BGの補間処理
	MtScrollTransDown();

}

/*---------------------------------------------------
	山肌のスクロール ＆ BG補間処理
		のぼりのスクロール、BG補間処理

	static void MtScrollTransUp(void);
-----------------------------------------------------*/
static void MtScrollTransUp(void){

	u8	ct = 0;
	static u8	ni = 0;
	static u8	nj = 0;
	static u8	nk = 0;

	//オフセットと古い値を更新
	sg_pWork->MtScrl.uc_dx = sg_pWork->MtScrl.uc_dy = 0;
	sg_pWork->MtScrl.uc_oldX = sg_pWork->scroll[RWD_BG_MT].uc_x;
	sg_pWork->MtScrl.uc_oldY = sg_pWork->scroll[RWD_BG_MT].uc_y;
	
	//次に補間するラインを計算
	sg_pWork->MtScrl.uc_sLine = (sg_pWork->MtScrl.uc_sLine-2+32)%32;
	sg_pWork->MtScrl.cBlockCt -= 2;

	//画像を転送
	nk = (sg_pWork->MtScrl.uc_dLine-9+32)%32;
	for(ct = 0;ct < 9;ct++)
	{
		ni = sg_pWork->MtScrl.uc_sLine;
		nj = (nk+ct)%32;

		sg_pWork->map[0].usa[nj][ni] = 
			sg_pWork->MtScrl.us_buf[ct][(u8)sg_pWork->MtScrl.cBlockCt];
		
		ni = (ni+1)%32;
		sg_pWork->map[0].usa[nj][ni] = 
			sg_pWork->MtScrl.us_buf[ct][sg_pWork->MtScrl.cBlockCt+1];
	}
	//ごみ掃除
	ni = (sg_pWork->MtScrl.uc_sLine -2+32)%32;
	FillChar16R(&(sg_pWork->map[0]),0x0000,ni,0,2,32);
	
	//1ブロック分の転送がすんでいなければ帰る
	if(sg_pWork->MtScrl.cBlockCt != 0) return;

	//転送用バッファを更新
	sg_pWork->MtScrl.uc_dLine = (sg_pWork->MtScrl.uc_dLine-3+32)%32;
	sg_pWork->MtScrl.cBlockCt = 12;
	MtScrollMakeBuf();
	
	//ごみ掃除
	ni = (sg_pWork->MtScrl.uc_dLine+1)%32;
	FillChar16R(&(sg_pWork->map[0]),0x0000,0,ni,32,9);
	return;
}

/*---------------------------------------------------
	山肌のスクロール ＆ BG補間処理
		下りのスクロール、BG補間処理

	static void MtScrollTransUp(void);
-----------------------------------------------------*/
static void MtScrollTransDown(void){

	u8	ct = 0;
	static u8	ni = 0;
	static u8	nj = 0;
	static u8	nk = 0;

	//オフセットと古い値を更新
	sg_pWork->MtScrl.uc_dx = sg_pWork->MtScrl.uc_dy = 0;
	sg_pWork->MtScrl.uc_oldX = sg_pWork->scroll[RWD_BG_MT].uc_x;
	sg_pWork->MtScrl.uc_oldY = sg_pWork->scroll[RWD_BG_MT].uc_y;
	
	//次に補間するラインを計算
	sg_pWork->MtScrl.uc_sLine = (sg_pWork->MtScrl.uc_sLine+2)%32;
	sg_pWork->MtScrl.cBlockCt += 2;

	//画像を転送
	nk = (sg_pWork->MtScrl.uc_dLine);//+9)%32;
	for(ct = 0;ct < 9;ct++)
	{
		ni = sg_pWork->MtScrl.uc_sLine;
		nj = (nk+ct)%32;

		sg_pWork->map[0].usa[nj][ni] = 
			sg_pWork->MtScrl.us_buf[ct][(u8)sg_pWork->MtScrl.cBlockCt];
		
		ni = (ni+1)%32;
		sg_pWork->map[0].usa[nj][ni] = 
			sg_pWork->MtScrl.us_buf[ct][sg_pWork->MtScrl.cBlockCt+1];
	}
	//ごみ掃除
	nj = (sg_pWork->MtScrl.uc_dLine -9+32)%32;
	FillChar16R(&(sg_pWork->map[0]),0x0000,sg_pWork->MtScrl.uc_sLine,nj,2,9);
	
	//1ブロック分の転送がすんでいなければ帰る
	if(sg_pWork->MtScrl.cBlockCt != 10) return;

	//転送用バッファを更新
	sg_pWork->MtScrl.uc_dLine = (sg_pWork->MtScrl.uc_dLine+3)%32;
	sg_pWork->MtScrl.cBlockCt = -2;
	MtScrollMakeBuf();
	
	return;
}

/*---------------------------------------------------
	山肌のスクロール ＆ BG補間処理
		上りか下りかをパラメータに、スクロールの初期値を代入
		最初必要になるデータも用意しておく
		
	static void MtScrollInit(void);
-----------------------------------------------------*/
static void MtScrollInit(u8 flg)
{
	switch(flg)
	{
	default:
	case RWD_UP:
		sg_pWork->MtScrl.uc_blockNo = 2;
		sg_pWork->MtScrl.uc_sLine = 0;
		sg_pWork->MtScrl.uc_dLine = 20;
		sg_pWork->MtScrl.cBlockCt = 12;

		//転送用のバッファを用意
		MtScrollMakeBuf();
		MtScrollTransUp();
		
		break;
	case RWD_DOWN:
		sg_pWork->MtScrl.uc_blockNo = 2;
		sg_pWork->MtScrl.uc_sLine = 28;
		sg_pWork->MtScrl.uc_dLine = 20;
		sg_pWork->MtScrl.cBlockCt = 4;

		//転送用のバッファを用意
		MtScrollMakeBuf();
		MtScrollTransDown();
		break;
	}
	sg_pWork->MtScrl.uc_scrScroll = 0;
	return;
}

