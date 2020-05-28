//=========================================================================
//	
//	表彰状(図鑑完成イベント)
//
//=========================================================================
#include "common.h"
#include "intr.h"
#include "actor.h"
#include "actanm.h"
#include "palanm.h"
#include "task.h"
#include "print.h"
#include "poketool.h"
#include "decord.h"
#include "objdata.h"
#include "menu.h"
#include "window.h"
#include "zukan.h"
#include "fld_eff.h"
#include "calctool.h"
#include "ev_flag.h"
#include "mus_tool.h"
#include "monsno.def"
#include "laster.h"

#include "hyousyou.dat"

void	HyousyouEvInit(void);
void	HyousyouEvMain(void);

extern	void	FieldNormalRecover(void);

static	void	HyousyouEvInitTask(u8 id);
static	void	HyousyouEvSeq1Task(u8 id);
static	void	HyousyouEvExitTask(u8 id);

static	void		HyousyouScreenMake(void);

#define	COLCHG_DATASIZE	(6)
#define	JPN_NAMESIZE	(5)
/********************************************************************/
/*                                                                  */
/*				割り込み											*/
/*                                                                  */
/********************************************************************/
static void VInterFunc( void )
{
	actOAMtrans();						//ｱｸﾀｰ転送処理1
	actDMAtrans();						//ｱｸﾀｰ転送処理2
	PaletteFadeTrans();
}


/********************************************************************/
/*                                                                  */
/*				初期化												*/
/*                                                                  */
/********************************************************************/
void	HyousyouEvInit(void)
{
	u8	taskID;

	SetVBlankFunc(NULL);			//割込み関数設定(VBLANK)

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

    DmaClear(3, 0, VRAM, VRAM_SIZE,           16);	// VRAM   初期化
    DmaClear(3, 0, OAM,  OAM_SIZE,            32);	// OAM    初期化
    DmaClear(3, 0, PLTT, PLTT_SIZE,           16);	// ﾊﾟﾚｯﾄ  初期化

	LZ77UnCompVram((void*)syoujou_ch_LZ,(void*)(BG_VRAM+0x0000));//BG  CGX転送
	LZ77UnCompVram((void*)syoujou_sc_LZ,(void*)(BG_VRAM+0x3000));//BG2 MAP転送

	LasterInit();
	InitTask();										// ﾀｽｸ  初期化
	InitActor();									// ｱｸﾀｰ 初期化
	PaletteAnimeInit();
	ObjPalManInit();								// ｵﾌﾞｼﾞｪﾊﾟﾚｯﾄﾏﾈｰｼﾞｬ初期化

	PaletteWorkSet(syoujou_Palette,PA_BG0,0x40);		//BG2&BG3 COL転送

	PrintScreenInit(DEFAULT_TYPE);
	NMenuScreenInit(FIELD_MENU_TYPE);

	HyousyouScreenMake();

	PaletteFadeReq(0xffffffff,0,16,0,0);

	REG_IE_SET( V_BLANK_INTR_FLAG );// VBLANK割込許可
    *(vu16 *)REG_STAT |= STAT_V_BLANK_IF_ENABLE;

	SetVBlankFunc(VInterFunc);			//割込み関数設定(VBLANK)
	MainProcChange(HyousyouEvMain);

   	*(vu16 *)REG_BLDCNT   = 0;	//半透明設定
   	*(vu16 *)REG_BLDALPHA = 0;
   	*(vu16 *)REG_BLDY	  = 0;

	*(vu16 *)REG_BG3CNT = BG_COLOR_16 | BG_SCREEN_SIZE_1 | BG_PRIORITY_3
						| 6 << BG_SCREEN_BASE_SHIFT | 0 << BG_CHAR_BASE_SHIFT;
	*(vu16 *)REG_DISPCNT = 	DISP_MODE_0					// BGモード 
                          |	DISP_OBJ_CHAR_1D_MAP		// OBJ1次元ﾏｯﾋﾟﾝｸﾞ
						  | DISP_BG3_ON					// BG3有効
						  | DISP_BG0_ON					// BG0有効
						  | DISP_OBJ_ON;

	taskID = AddTask(HyousyouEvInitTask, 0);
}


/********************************************************************/
/*                                                                  */
/*				ﾒｲﾝ													*/
/*                                                                  */
/********************************************************************/
void	HyousyouEvMain(void)
{
		MainTask();
		JumpActor();
		SetActor();
		PaletteAnime();
}


/********************************************************************/
/*                                                                  */
/*				メイン制御											*/
/*                                                                  */
/********************************************************************/
/*==================================================================*/
//		初期化
/*==================================================================*/
static	void	HyousyouEvInitTask(u8 id)
{
	if(FadeData.fade_sw)	return;

	TaskTable[id].TaskAdrs = HyousyouEvSeq1Task;
}

/*==================================================================*/
//		キー判定
/*==================================================================*/
static	void	HyousyouEvSeq1Task(u8 id)
{
	if(sys.Trg & (A_BUTTON|B_BUTTON)){
		PaletteFadeReq(0xffffffff,0,0,16,0);

		TaskTable[id].TaskAdrs = HyousyouEvExitTask;
		return;
	}
}

/*==================================================================*/
//		終了
/*==================================================================*/
static	void	HyousyouEvExitTask(u8 id)
{
	if(FadeData.fade_sw)	return;

	DelTask(id);
	MainProcChange(FieldNormalRecover);
}

/********************************************************************/
/*                                                                  */
/*				スクリーン作成										*/
/*                                                                  */
/********************************************************************/
static	void	HyousyouScreenMake(void)
{
	u8	i,str[COLCHG_DATASIZE+JPN_NAMESIZE+EOM_SIZE];

	NMenuMsgWrite(hyousyou_msg1,8,2);
	//名前の表示
	PM_strcpy(str,colchg_msg);
	for(i=0;i<JPN_NAMESIZE;i++)	str[i+COLCHG_DATASIZE] = MyData.my_name[i];
	str[i+COLCHG_DATASIZE] = EOM_;
	NMenuMsgWrite(str,14,2);
	NMenuMsgWrite(hyousyou_msg2,19,2);

	NMenuMsgWrite(hyousyou_msg5,8,6);
	if(ZukanHyousyouCheckZenkoku()){
		*(vu16 *)REG_BG3HOFS	= 0x0100;	//全国用スクリーン
		NMenuMsgWrite(hyousyou_msg4,8,6);
	}else{
		*(vu16 *)REG_BG3HOFS	= 0x0000;	//ホウエン用スクリーン
		NMenuMsgWrite(hyousyou_msg3,8,6);
	}
	NMenuMsgWrite(hyousyou_msg6,14,16);
}



