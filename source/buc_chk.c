//=========================================================================
//	
//	バックアップカートリッジ検査画面
//
//=========================================================================
#include "common.h"
#include "intr.h"
#include "actor.h"
#include "palanm.h"
#include "task.h"
#include "print.h"
#include "poketool.h"
#include "../library/AgbFlash1M.h"
#include "decord.h"
#include "menu.h"
#include "window.h"
#include "calctool.h"
#include "mus_tool.h"
#include "monsno.def"
#include "message.h"

void			BuckUpRAMcheckSet(u8 mode);
static	void	BuckUpRAMcheckInit(void);
static	void	BuckUpRAMcheckMain(void);
static	void	BuckUpRAMcheckTalkExitInit(void);
static	void	BuckUpRAMcheckExitInit(void);
static	void	BuckUpRAMcheckExit(void);

static	u8		BuckUpRAMcheckRecover(u32 sector_bit);

extern	u8		PokeAGBSaveMain(u8 mode);
extern	void	FieldMenuRecover(void);
extern	pFunc	SvRecoverReturnProc;		// セクタ検査処理後に復帰する先の関数ポインタ
extern	u32		svld_error_sect_bit;		//セクタ異常判定フラグ

extern	const u16	opball_Palette[];
extern	const u16	op_bobj_Palette[];
extern	const u16	op_wobj_Palette[];
extern	const u8	opselsc1_LZ[];
extern	const u8	opselsc2_LZ[];
extern	const u8	opselch_LZ[];
extern	const u8	opseloch_LZ[];
extern	const u8	opselwch_LZ[];
const u16			buc_chk_Palette[];
const u8			buc_chk_LZ[];

static void BuckUpRAMcheckITask(void);

//VPos,AffineMode,ObjMode,Mosaic,ColorMode,Shape,
//HPos,AffineParamNo,Size,CharNo,Priority,Pltt,(Affine)
static const SysOamData TimerOam = {160,0,0,0,0,0,0,0,1,0,0,0,0};

extern	const	u8	buc_chk_msg[];
extern	const	u8	buc_chk_NG_msg[];
extern	const	u8	buc_chk_NG2_msg[];
extern	const	u8	buc_chk_retry_msg[];
extern	const	u8	buc_chk_OKreset_msg[];
extern	const	u8	buc_chk_OKreturn_msg[];

u16	BUCchkMode = {0};
u16	BUCchkWork[8] = {0};
/********************************************************************/
/*                                                                  */
/*				バックアックカートリッジ検証プロセスセット			*/
/*                                                                  */
/********************************************************************/
void	BuckUpRAMcheckSet(u8 mode)
{
	MainProcChange(BuckUpRAMcheckInit);
	BUCchkMode = mode;
	BUCchkWork[0] = 0;	//タイマーエフェクト表示フラグ
}

/********************************************************************/
/*                                                                  */
/*				割り込み											*/
/*                                                                  */
/********************************************************************/
static	void VInterFunc( void )
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
static	void	BuckUpRAMcheckInit(void)
{
	switch(sys.InitSeqWork){
	default:
	case 0:
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

		LZ77UnCompVram((void*)opselch_LZ,(void*)(BG_VRAM+0x0000));	//BG  CGX転送
		LZ77UnCompVram((void*)opselsc1_LZ,(void*)(BG_VRAM+0x3000));	//BG2 MAP転送(バッグ)
		LZ77UnCompVram((void*)opselsc2_LZ,(void*)(BG_VRAM+0x3800));	//BG3 MAP転送(背景)
		LZ77UnCompVram((void*)buc_chk_LZ,(void*)(OBJ_MODE0_VRAM+0x0020));	//OBJ CGX転送

		InitActor();
		InitTask();	
		PaletteAnimeInit();
		PaletteWorkSet(opball_Palette,PA_BG0,0x40);		//BG2&BG3 COL転送
		PaletteWorkSet(buc_chk_Palette,PA_OBJ0,0x20);	//OBJ COL転送

		PrintScreenInit(DEFAULT_TYPE);
		NMenuScreenInit(FIELD_MENU_TYPE);
		NMenuWinBoxWrite(13, 8,16,11);

		NMenuWinBoxWrite( 1,12,28,19);
		NMenuMsgWrite(buc_chk_msg,2,13);

		PaletteFadeReq(0xffffffff,0,16,0,0);

		REG_IE_SET( V_BLANK_INTR_FLAG );// VBLANK割込許可
		*(vu16 *)REG_STAT |= STAT_V_BLANK_IF_ENABLE;

		SetVBlankFunc(VInterFunc);			//割込み関数設定(VBLANK)

		*(vu16 *)REG_BG3CNT = BG_COLOR_16 | BG_SCREEN_SIZE_0 | BG_PRIORITY_3
						| 7 << BG_SCREEN_BASE_SHIFT | 0 << BG_CHAR_BASE_SHIFT;
		*(vu16 *)REG_BG2CNT = BG_COLOR_16 | BG_SCREEN_SIZE_0 | BG_PRIORITY_2
						| 6 << BG_SCREEN_BASE_SHIFT | 0 << BG_CHAR_BASE_SHIFT;
		*(vu16 *)REG_BG0CNT = BG_COLOR_16 | BG_SCREEN_SIZE_0 | BG_PRIORITY_0
						| 31 << BG_SCREEN_BASE_SHIFT | 2 << BG_CHAR_BASE_SHIFT;

		*(vu16 *)REG_DISPCNT = 	DISP_MODE_0					// BGモード 
			                  |	DISP_OBJ_CHAR_1D_MAP		// OBJ1次元ﾏｯﾋﾟﾝｸﾞ
							  | DISP_BG3_ON					// BG3有効
							  | DISP_BG2_ON					// BG2有効
							  | DISP_BG0_ON					// BG0有効
							  | DISP_OBJ_ON;
		sys.InitSeqWork++;
		break;
	case 1:
		if(PaletteAnime())	break;

		MainProcChange(BuckUpRAMcheckMain);
		SetVBlankFunc(BuckUpRAMcheckITask);	//割込みのみで表示系の処理をするため切り替え
		break;
	}
}


/********************************************************************/
/*                                                                  */
/*				メイン												*/
/*                                                                  */
/********************************************************************/
#define	RETRY_COUNT	(3)

static	void	BuckUpRAMcheckMain(void)
{
	u8	retry_counter;
	u8	recover_flag;

	retry_counter = 0;
	
	BUCchkWork[0] = 1;//タイマーエフェクト表示フラグ（ＯＮ）

	while((svld_error_sect_bit) && (retry_counter < RETRY_COUNT)){	
		//セクタ異常発生中（リトライ３回まで・暫定）

		recover_flag = BuckUpRAMcheckRecover(svld_error_sect_bit); 

		if(recover_flag){
			//セクタ復帰失敗（寿命）
			NMenuWinBoxWrite( 1,12,28,19);
			NMenuMsgWrite(buc_chk_NG_msg,2,13);
			MainProcChange(BuckUpRAMcheckTalkExitInit);
			return;
		}else{
			//セクタ復帰成功（再セーブ）
			NMenuWinBoxWrite( 1,12,28,19);
			NMenuMsgWrite(buc_chk_retry_msg,2,13);

			PokeAGBSaveMain(BUCchkMode);
			if(svld_error_sect_bit){
				//リトライメッセージ
				NMenuMsgWrite(buc_chk_msg,2,13);
			}
		}
		retry_counter++;
	}
	if(retry_counter == RETRY_COUNT){
		//セクタ復帰失敗（寿命）
		NMenuWinBoxWrite( 1,12,28,19);
		NMenuMsgWrite(buc_chk_NG_msg,2,13);
		MainProcChange(BuckUpRAMcheckExitInit);
	}else{
		//セクタ復帰＆セーブ成功
		NMenuWinBoxWrite( 1,12,28,19);
		if(SvRecoverReturnProc == NULL){		// セクタ検査処理後に復帰する先の関数ポインタ
			//リセット
			NMenuMsgWrite(buc_chk_OKreset_msg,2,13);
		}else{
			//リターン
			NMenuMsgWrite(buc_chk_OKreturn_msg,2,13);
		}
	}
	MainProcChange(BuckUpRAMcheckExitInit);
}


/********************************************************************/
/*                                                                  */
/*				終了												*/
/*                                                                  */
/********************************************************************/
static	void	BuckUpRAMcheckTalkExitInit(void)
{
	BUCchkWork[0] = 0;//タイマーエフェクト表示フラグ（ＯＦＦ）

	if(sys.Trg & A_BUTTON){
		NMenuWinBoxWrite( 1,12,28,19);
		NMenuMsgWrite(buc_chk_NG2_msg,2,13);
		SetVBlankFunc(VInterFunc);			//割込み関数設定(VBLANK)
		MainProcChange(BuckUpRAMcheckExitInit);
	}
}

static	void	BuckUpRAMcheckExitInit(void)
{
	BUCchkWork[0] = 0;//タイマーエフェクト表示フラグ（ＯＦＦ）

	if(sys.Trg & A_BUTTON){
		PaletteFadeReq(0xffffffff,0,0,16,0);
		SetVBlankFunc(VInterFunc);			//割込み関数設定(VBLANK)
		MainProcChange(BuckUpRAMcheckExit);
	}
}

static	void	BuckUpRAMcheckExit(void)
{
	if(PaletteAnime())	return;

	if(SvRecoverReturnProc == NULL){		// セクタ検査処理後に復帰する先の関数ポインタ
		PM_SoftReset();
	}else{
		MainProcChange(SvRecoverReturnProc);
		SvRecoverReturnProc = NULL;		// セクタ検査処理後に復帰する先の関数ポインタ 初期化
	}
}


/********************************************************************/
/*                                                                  */
/*				メイン制御（Ｖ割り込み内）							*/
/*                                                                  */
/********************************************************************/
static	const u8	TimerAnmData[][3]={
{0*4+1,0,0},{1*4+1,0,0},{2*4+1,0,0},{1*4+1,0,1},{0*4+1,0,1},{1*4+1,1,1},{2*4+1,1,0},{1*4+1,1,0},
};

static void BuckUpRAMcheckITask(void)
{
	u8	i;
	
	i = ((sys.vsync_counter >> 3)&0x0007);

	sys.OAMbuf[0] = TimerOam;
	sys.OAMbuf[0].HPos = 8*14;
	sys.OAMbuf[0].VPos = 8*9;

	if(BUCchkWork[0]){//タイマーエフェクト表示フラグ
		sys.OAMbuf[0].CharNo= TimerAnmData[i][0];
		sys.OAMbuf[0].AffineParamNo = (TimerAnmData[i][2]<<4)|(TimerAnmData[i][1]<<3);
	}else{
		sys.OAMbuf[0].CharNo= 1;
	}
	CpuFastCopy(sys.OAMbuf, OAM	,4);		//OAM転送

	if(BUCchkWork[1])	BUCchkWork[1]--;
}


/********************************************************************/
/*                                                                  */
/*				セクタ復旧処理										*/
/*                                                                  */
/********************************************************************/
#define	RECOVER_RETRY_COUNT	(130)
static	u8	BuckUpRAMcheckRecoverCheck(u16 sectnum) 
{
	u32*	rd;
	u16		offs;

	ReadFlash(sectnum,0,(u8*)(UserWork+0x000000),0x1000);
	rd = (u32*)(UserWork+0x000000);

	for(offs=0;offs<0x1000/4;offs++,rd++){
		if(*rd)	return 1;
	}
	return 0;
}

static	u8	BuckUpRAMcheckRecoverMain(u16 sectnum) 
{
	u16	retry_count,recover_flag,offs;

	retry_count		= 0;
	recover_flag	= 1;

	while((recover_flag)&&(retry_count < RECOVER_RETRY_COUNT)){

		//オーバーイレース状態のセクタにイレースせずに１バイトデータ（0x00）を書き込み
		for(offs=0;offs<0x1000;offs++)	ProgramFlashByte(sectnum,offs,0x00);

		//セクタ全域に１バイトデータ（0x00）が書き込みされているかチェック
		recover_flag = BuckUpRAMcheckRecoverCheck(sectnum);
		retry_count++;
	}
	return recover_flag;	//0:復帰、1:死亡
}

static	u8	BuckUpRAMcheckRecover(u32 sector_bit) 
{
	u32	mask;
	u16	sectnum;

	for(sectnum=0;sectnum<32;sectnum++){
		mask = (0x00000001 << sectnum);
		//異常判定が出ているセクタに復旧処理を行なう
		if(sector_bit & mask){
			if(!(BuckUpRAMcheckRecoverMain(sectnum))){
				//復旧成功
				sector_bit &= (mask^0xffffffff);
			}
		}
	}
	if(!sector_bit)	return 0;	//全異常セクタ復旧成功
	else			return 1;	//異常セクタ存在
}

/********************************************************************/
/*                                                                  */
/*				グラフィックデータ									*/
/*                                                                  */
/********************************************************************/
const u16 buc_chk_Palette[16] = {
0x2E2C,0x0000,0x1CE7,0x3DEF,0x5EF7,0x7FFF,0x151F,0x0000,
0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
};

const u8 buc_chk_LZ[0x90] = {
0x10,0x80,0x01,0x00,

0x0a,0x00,0x00,0x00,0x22,0x00,0x02,0x44,0x00,0x02,0x55,0x02,0x00,0x42,0x55,0x65,
0x20,0x54,0x30,0x03,0x42,0x65,0x55,0x30,0x03,0x00,0x1c,0x00,0x44,0x00,0x04,0x55,
0x00,0x04,0x12,0x56,0x55,0x24,0x00,0x03,0x45,0x02,0x30,0x03,0x55,0x6e,0x24,0x10,
0x03,0x40,0x27,0x55,0x00,0x33,0x20,0x03,0x00,0x43,0x55,0xfc,0x20,0x4b,0x10,0x53,
0x00,0x04,0x10,0x23,0x00,0x1e,0x00,0x03,0x45,0x02,0xbf,0x30,0x03,0x24,0x20,0x4b,
0x10,0x53,0x10,0x5b,0xc0,0x7f,0x60,0x47,0x10,0x53,0xc2,0xd0,0x7f,0x20,0x3b,0x66,
0x45,0x02,0x65,0x00,0x03,0x66,0xbf,0x00,0x8c,0x66,0xf0,0x7f,0xf0,0x7f,0xf0,0x7f,
0xf0,0x7f,0xf0,0x7f,0xf0,0x7f,0xe7,0x50,0x7f,0x60,0x47,0x00,0x7f,0x66,0x56,0xf0,
0x7f,0xc0,0x7f,0x10,0x23,0xc0,0xf0,0x7f,0x70,0x7f,0x00,0x00,
};





