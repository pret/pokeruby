//******************************************************************
//          tit_menu.c                                                  
//                                                                  
//          Copyright (C) 2001 GAME FREAK inc.
//******************************************************************
#include	"common.h"
#include	"intr.h"
#include	"palanm.h"
#include	"actor.h"
#include	"task.h"
#include	"print.h"
#include	"decord.h"
#include	"menu.h"
#include	"window.h"
#include	"saveload.h"
#include	"mus_tool.h"
#include	"message.h"
#include	"calctool.h"
#include	"svld_ini.h"
#include	"svld_sys.h"

static	u8		TitleMenuInit( void );
static	void	TitleMenuMain( void );
static	void	TitleMenuExit( void );

/********************************************************************/
/*				バックアップ消去									*/
extern	const MENU_ITEM	yesno_msg[];
#define TMENU_YESNO_WX	(2)
#define TMENU_YESNO_WY	(1)

static	void	BackUpDeleteInitTask(u8 id);
static	void	BackUpDeleteYesNoTask(u8 id);
static	void	BackUpDeleteTask(u8 id);

static	const u8	BackDeleteMsg[]={
	su_,be_,te_,no_,spc_,SE_,bou_,BU_,DE_,bou_,TA_,E_,RI_,A_,wo_,
	CR_,
	KU_,RI_,A_,spc_,si_,ma_,su_,ka_,hate_,
	EOM_
};
static	const u8	BackDeleteNowMsg[]={
	KU_,RI_,A_,spc_,si_,te_,i_,ma_,su_,
	CR_,
	o_,ma_,ti_,spc_,ku_,da_,sa_,i_,
	EOM_
};
/********************************************************************/
void	BackUpDelete( void )
{
	if(!TitleMenuInit())	return;

	AddTask(BackUpDeleteInitTask, 0);
}

//-------------------------------------------------------------------
static	void	BackUpDeleteInitTask(u8 id)
{
	NMenuWinBoxWrite( 2, 14,27, 19);
	NMenuMsgWrite(BackDeleteMsg,3,15);

	NMenuWinBoxWrite(TMENU_YESNO_WX,TMENU_YESNO_WY,TMENU_YESNO_WX+6,TMENU_YESNO_WY+5);
	NMenuFixListWrite(TMENU_YESNO_WX+2,TMENU_YESNO_WY+1,2,yesno_msg);
	NMenuVCursorInit(TMENU_YESNO_WX+1,TMENU_YESNO_WY+1,2,1);

	TaskTable[id].TaskAdrs = BackUpDeleteYesNoTask;
}

//-------------------------------------------------------------------
static	void	BackUpDeleteYesNoTask(u8 id)
{
	s8	res;

	res = YesNoSelectMain();
	switch(res){

	case	CURSOR_YES_VALUE:		//はい
		SePlay(SE_SELECT);
		NMenuWinBoxWrite( 2, 14,27, 19);
		NMenuMsgWrite(BackDeleteNowMsg,3,15);
		TaskTable[id].TaskAdrs = BackUpDeleteTask;
		break;
	case	CURSOR_NO_VALUE:		//いいえ
	case	CURSOR_CANCEL_VALUE:	//キャンセルされた
		SePlay(SE_SELECT);
		DelTask(id);
		MainProcChange(TitleMenuExit);
		break;
	}
}

//-------------------------------------------------------------------
static	void	BackUpDeleteTask(u8 id)
{
	EraseBackUpData();
	DelTask(id);
	MainProcChange(TitleMenuExit);
}






#define	BACK_COL	(0x3945)
/********************************************************************/
/*				メイン												*/
/********************************************************************/
static	void		TitleMenuMain( void )
{
	MainTask();
	PaletteAnime();
}

/********************************************************************/
/*				割り込み											*/
/********************************************************************/
static void		VInterFunc( void )
{
	PaletteFadeTrans();
}

/********************************************************************/
/*				初期化												*/
/********************************************************************/
static	u8	TitleMenuInit( void )
{
	u16	i;

	switch(sys.InitSeqWork){
	default:
	case 0:
		SetVBlankFunc(NULL);			//割込み関数設定(VBLANK)

		*(vu16 *)REG_DISPCNT	= 0;
		*(vu16 *)REG_BG0HOFS	= 0;
		*(vu16 *)REG_BG0VOFS	= 0; 
		*(vu16 *)REG_BG3HOFS	= 0;
		*(vu16 *)REG_BG3VOFS	= 0; 
		*(vu16 *)REG_WIN0H		= 0;
		*(vu16 *)REG_WIN0V		= 0;
		*(vu16 *)REG_WININ		= 0;
		*(vu16 *)REG_WINOUT		= 0;
		*(vu16 *)REG_BLDCNT		= 0;
		*(vu16 *)REG_BLDALPHA	= 0;
		*(vu16 *)REG_BLDY		= 0;

		DmaClear(3, 0, VRAM, VRAM_SIZE,           16);	// VRAM   初期化
		DmaClear(3, 0, OAM,  OAM_SIZE,            32);	// OAM    初期化
		DmaClear(3, 0, PLTT+2, PLTT_SIZE-2,       16);	// ﾊﾟﾚｯﾄ  初期化

		PaletteAnimeInit();
		PaletteWork[PA_BG0 + PA_COL0]		= 0x7fff;	// PAL0 設定
		PaletteWorkTrans[PA_BG0 + PA_COL0]	= 0x7fff;	// PAL0 設定
		PaletteWork[PA_BG0 + PA_COL1]		= BACK_COL;	// PAL1 設定
		PaletteWorkTrans[PA_BG0 + PA_COL1]	= BACK_COL;	// PAL1 設定
		for(i=0;i<0x10;i++)		*(u16*)(BG_VRAM + 0x0020+i*2) = 0x1111;	//BG3 CGX作成（背景）
		for(i=0;i<0x500;i++)	*(u16*)(BG_VRAM + 0x3800+i*2) = 0x0001;	//BG3 MAP作成（背景）

		InitTask();										// ﾀｽｸ  初期化
		InitActor();									// ｱｸﾀｰ 初期化
		PrintScreenInit(DEFAULT_TYPE);
		NMenuScreenInit(FIELD_MENU_TYPE);

		PaletteFadeReq(0x0000ffff,0,16,0,0xffff);	//白フェード

		REG_IE_SET( V_BLANK_INTR_FLAG );			// VBLANK割込許可
		*(vu16 *)REG_STAT |= STAT_V_BLANK_IF_ENABLE;
		SetVBlankFunc(VInterFunc);					//割込み関数設定(VBLANK)

		*(vu16 *)REG_BG3CNT = BG_COLOR_16					// 16色選択
							| BG_SCREEN_SIZE_0				// スクリーンサイズ
							| BG_PRIORITY_3					// BG優先順位
							| 7 << BG_SCREEN_BASE_SHIFT		// スクリーンベースブロック
							| 0 << BG_CHAR_BASE_SHIFT ;		// キャラクタベースブロック
		*(vu16 *)REG_DISPCNT =	DISP_MODE_0					// BGモード 
							  | DISP_BG3_ON					// BG3有効
							  | DISP_BG0_ON;				// BG0有効
		sys.InitSeqWork = 1;
		break;
	case 1:
		PaletteAnime();
		if(FadeData.fade_sw)	break;

		MainProcChange(TitleMenuMain);
		return 1;
	}
	return 0;
}

/********************************************************************/
/*				終了												*/
/********************************************************************/
static	void		TitleMenuExit( void )
{
	switch(sys.InitSeqWork){
	default:
	case 0:
		PaletteFadeReq(0x0000ffff,0,0,16,0xffff);	//白フェード
		sys.InitSeqWork = 1;
		break;
	case 1:
		PaletteAnime();
		if(FadeData.fade_sw)	break;

		PM_SoftReset();
	}
}






