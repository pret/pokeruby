/***********************************************************************
**	街や施設にある地図を見た時の画面
**                                                                taya
************************************************************************/
#include "common.h"
#include "palanm.h"
#include "intr.h"
#include "print.h"
#include "menutool.h"
#include "fld_main.h"
#include "actanm.h"

#include "townmap.h"


/***********************************************************************
**  ワーク領域                                                        **
***********************************************************************/
typedef struct {
	pFunc ret_func;
	pFunc sub;
	TOWNMAP_WORK  mapwk;
	u16   prog;
}INFOMAP_WORK;

static INFOMAP_WORK* const Work = (INFOMAP_WORK*)(&(UserWork[0x0000]));

/*------------------------------------*/
/*  定数                              */
/*------------------------------------*/
#define INFOWIN_X1  (16)
#define INFOWIN_Y1  (16)
#define INFOWIN_X2  (29)
#define INFOWIN_Y2  (19)

#define TITLEWIN_X1  (21)
#define TITLEWIN_Y1  (0)
#define TITLEWIN_X2  (29)
#define TITLEWIN_Y2  (3)

static const u8 InfoMapTitle[] = { HO_, U_, E_, N_, ti_, ho_, u_, EOM_, };

/*------------------------------------*/
/*  プロトタイプ                      */
/*------------------------------------*/
static void infomap_v_intr(void);
static void infomap_main(void);
static void infomap_init(void);
static void infomap_sub(void);
static void update_placename(void);

/*==============================================================
==  スクリプトからの初期化命令
==============================================================*/
void InfoMapInit(pFunc ret_func)
{
	SetVBlankFunc(NULL);

	Work->prog = 0;
	Work->ret_func = ret_func;
	MainProcChange(infomap_init);
}
/*====================================================*/
/*  初期化本体                                        */
/*====================================================*/
static void infomap_init(void)
{
	*(vu16 *)REG_DISPCNT = 0;

	*(vu16*)REG_BG0HOFS = 0;
	*(vu16*)REG_BG0VOFS = 0;
	*(vu16*)REG_BG1HOFS = 0;
	*(vu16*)REG_BG1VOFS = 0;
	*(vu16*)REG_BG2HOFS = 0;
	*(vu16*)REG_BG2VOFS = 0;
	*(vu16*)REG_BG3HOFS = 0;
	*(vu16*)REG_BG3VOFS = 0;

	InitActor();
	ObjPalManInit();

	// マップＢＧ
	TownMapInit(&(Work->mapwk), TOWNMAP_WHOLE);
	TownMapAddJiki(0,0);
	TownMapAddCursor(1,1);

	// テキストＢＧ
	PrintScreenInit(TNAVI2_TYPE);
	NMenuScreenInit(TNAVI2_TYPE);
	NMenuScreenClear();

	*(vu16 *)REG_BG0CNT = BG_SCREEN_SIZE_0 | BG_PRIORITY_0
	| 31 << BG_SCREEN_BASE_SHIFT
	| 0 << BG_CHAR_BASE_SHIFT
	| BG_COLOR_16 ;

	NMenuWinBoxWrite(TITLEWIN_X1, TITLEWIN_Y1, TITLEWIN_X2, TITLEWIN_Y2);
	NMenuMsgWrite(InfoMapTitle, TITLEWIN_X1+1, TITLEWIN_Y1+1);

	NMenuWinBoxWrite(INFOWIN_X1, INFOWIN_Y1, INFOWIN_X2, INFOWIN_Y2);
	update_placename();

	MainProcChange(infomap_main);

	SetVBlankFunc(infomap_v_intr);
	PaletteFadeReq(0xffffffff,0,16,0,0x0000);
}
/*====================================================*/
/*  V Blank                                           */
/*====================================================*/
static void infomap_v_intr(void)
{
	actOAMtrans();
	actDMAtrans();
	PaletteFadeTrans();
}
/*====================================================*/
/*  メイン                                            */
/*====================================================*/
static void infomap_main(void)
{
	infomap_sub();
	JumpActor();
	SetActor();
	PaletteAnime();
}
/*====================================================*/
/*  サブプロセス                                      */
/*====================================================*/
static void infomap_sub(void)
{
	switch(Work->prog){
	case 0:
	*(vu16 *)REG_DISPCNT = DISP_MODE_1 | DISP_OBJ_CHAR_1D_MAP 
	| DISP_BG0_ON
//	| DISP_BG1_ON
	| DISP_BG2_ON
	| DISP_OBJ_ON
	;

		Work->prog++;
		break;

	case 1:
		if(FadeData.fade_sw == 0){
			Work->prog++;
		}
		break;

	case 2:
		switch(TownMapKeyRead()){
		case MAPKEY_CHANGE:
			update_placename();
			break;

		case MAPKEY_DECIDE:
		case MAPKEY_CANCEL:
			Work->prog++;
		}
		break;

	case 3:
		PaletteFadeReq(0xffffffff, 0, 0, 16, 0x0000);
		Work->prog++;
		break;

	case 4:
		if(FadeData.fade_sw == 0){
			TownMapQuit();
			MainProcChange(Work->ret_func);
		}
		break;
	}
}

static void update_placename(void)
{
	NMenuBoxWrite(INFOWIN_X1+1, INFOWIN_Y1+1, INFOWIN_X2-1, INFOWIN_Y2-1);

	if(Work->mapwk.cursor_state != MAPCURSOR_SPACE){
		NMenuMsgWrite(Work->mapwk.mapname, INFOWIN_X1+1, INFOWIN_Y1+1);
	}
}
