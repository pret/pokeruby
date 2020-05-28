//=========================================================================
//	
//
//
//=========================================================================
#include "common.h"
#include "intr.h"
#include "actor.h"
#include "actanm.h"
#include "palanm.h"
#include "task.h"
#include "print.h"
#include "task.h"
#include "poketool.h"
#include "decord.h"
#include "objdata.h"
#include "menu.h"
#include "window.h"
#include "fld_main.h"
#include "mapparam.h"

void	TetsuTestTaskSet(void);
void	TetsuTestTask2Set(void);

static	const u16	xxx_Palette[16];
static	const u16	xxx_PaletteW[16];
static	const u16	xxx_PaletteB[16];
extern	u16			PaletteWork[0x200];

static	const u8 xxx_ch_LZ[0xb4];
static	const u8 xxx_sc_LZ[0x1e0];

static	u8	ChangeEffectSet(void);
/********************************************************************/
/*                                                                  */
/*				MAP切り替えEFFECT									*/
/*                                                                  */
/********************************************************************/
/********************************************************************/
/*                                                                  */
/*				ﾒｲﾝ													*/
/*                                                                  */
/********************************************************************/
void ChangeEffectMain( void )
{
		MainTask();
		JumpActor();
		SetActor();
		PaletteAnime();
}

/********************************************************************/
/*                                                                  */
/*				割り込み											*/
/*                                                                  */
/********************************************************************/
static void VIntrFunc( void )
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
void ChangeEffectInit( void );
void ChangeEffectMain( void );

// 初期化
void ChangeEffectInit( void )
{
	SetVBlankFunc(NULL);			//割込み関数設定(VBLANK)

    *(vu16 *)REG_DISPCNT	= 0;
    *(vu16 *)REG_BG2CNT		= 0;
    *(vu16 *)REG_BG1CNT		= 0;
    *(vu16 *)REG_BG0CNT		= 0;

	*(vu16 *)REG_BG2HOFS	= 0;
	*(vu16 *)REG_BG2VOFS	= 0;
    *(vu16 *)REG_BG1HOFS	= 0;
    *(vu16 *)REG_BG1VOFS	= 0; 
    *(vu16 *)REG_BG0HOFS	= 0;
    *(vu16 *)REG_BG0VOFS	= 0; 

    DmaClear(3, 0, VRAM, VRAM_SIZE,           16);	// VRAM   初期化
    DmaClear(3, 0, OAM,  OAM_SIZE,            32);	// OAM    初期化
    DmaClear(3, 0, PLTT+2, PLTT_SIZE-2,       16);	// ﾊﾟﾚｯﾄ  初期化

	PaletteAnimeInit();

	InitTask();										// ﾀｽｸ  初期化
	InitActor();									// ｱｸﾀｰ 初期化
//	PrintScreenInit(DEFAULT_TYPE);
//	NMenuScreenInit(FIELD_MENU_TYPE);

	REG_IE_SET( V_BLANK_INTR_FLAG );// VBLANK割込許可

	SetVBlankFunc(VIntrFunc);
	MainProcChange( ChangeEffectMain );

	if(!ChangeEffectSet()){	//EFFCETなし
		MainProcChange( sys.pReturnProc );
	}
}

/********************************************************************/
/*                                                                  */
/*				EFFECT設定											*/
/*                                                                  */
typedef	struct {
	u8		mtypeBefore;	//参照ﾏｯﾌﾟﾀｲﾌﾟ1
	u8		mtypeNext;		//参照ﾏｯﾌﾟﾀｲﾌﾟ2
	u8		FadeOutPat;		//ﾌｪｰﾄﾞｱｳﾄﾊﾟﾀｰﾝ
	u8		FadeInPat;		//ﾌｪｰﾄﾞｲﾝﾊﾟﾀｰﾝ
	pFunc	EffectProc;		//EFFECT関数ポインタ
}MapChgEffTbl;

static	const	MapChgEffTbl	dataTable[];
/********************************************************************/
static	u8	ChangeEffectSet(void)
{
	u8	i,mb,mn;

	mb = GetBeforeMapType();		//直前のマップのタイプを取得
	mn = GetNowMapType();		//現在のマップのタイプを取得

	i = 0;

	while(dataTable[i].mtypeBefore != 0){
		if((dataTable[i].mtypeBefore == mb)&&(dataTable[i].mtypeNext == mn)){
			(dataTable[i].EffectProc)();
			return 1;
		}
		i++;
	}
	return 0;
}

/********************************************************************/
/*				FadeOutﾊﾟﾀｰﾝのﾁｪｯｸ									*/
/*				0:黒1:白											*/
/********************************************************************/
u8	FieldFadeOutCheck(u8 NowType,u8 NextType)
{
	u8	i,mb,mn;

	mb = NowType;
	mn = NextType;

	i = 0;

	while(dataTable[i].mtypeBefore != 0){
		if((dataTable[i].mtypeBefore == mb)&&(dataTable[i].mtypeNext == mn)){
			return dataTable[i].FadeOutPat;
		}
		i++;
	}
	return 0;
}

/********************************************************************/
/*				FadeInﾊﾟﾀｰﾝのﾁｪｯｸ									*/
/*				0:黒1:白											*/
/********************************************************************/
u8	FieldFadeInCheck(u8 NowType,u8 NextType)
{
	u8	i,mb,mn;

	mb = NowType;
	mn = NextType;

	i = 0;

	while(dataTable[i].mtypeBefore != 0){
		if((dataTable[i].mtypeBefore == mb)&&(dataTable[i].mtypeNext == mn)){
			return dataTable[i].FadeInPat;
		}
		i++;
	}
	return 0;
}

/********************************************************************/
/*                                                                  */
/*				設定TABLE											*/
/*                                                                  */
#if 0
	MAPTYPE_TOWN = 1,		/* 町 */
	MAPTYPE_CITY,			/* 街 */
	MAPTYPE_ROAD,			/* 道路 */
	MAPTYPE_CAVE,			/* 洞窟 */
	MAPTYPE_WATER,			/* 水(？) */
	MAPTYPE_SEA,			/* 海 */
	MAPTYPE_ICE,			/* 氷 */
	MAPTYPE_ROOM,			/* 部屋 */
	MAPTYPE_BASE,			/* 秘密基地 */
#endif
/********************************************************************/
static	const	MapChgEffTbl	dataTable[] = {
		{MAPTYPE_TOWN,	MAPTYPE_CAVE,	1,0,	TetsuTestTask2Set},
		{MAPTYPE_CITY,	MAPTYPE_CAVE,	1,0,	TetsuTestTask2Set},
		{MAPTYPE_ROAD,	MAPTYPE_CAVE,	1,0,	TetsuTestTask2Set},
		{MAPTYPE_WATER,	MAPTYPE_CAVE,	1,0,	TetsuTestTask2Set},
		{MAPTYPE_SEA,	MAPTYPE_CAVE,	1,0,	TetsuTestTask2Set},
		{MAPTYPE_ICE,	MAPTYPE_CAVE,	1,0,	TetsuTestTask2Set},
		{MAPTYPE_ROOM,	MAPTYPE_CAVE,	1,0,	TetsuTestTask2Set},
		{MAPTYPE_BASE,	MAPTYPE_CAVE,	1,0,	TetsuTestTask2Set},

		{MAPTYPE_CAVE,	MAPTYPE_TOWN,	0,1,	TetsuTestTaskSet},
		{MAPTYPE_CAVE,	MAPTYPE_CITY,	0,1,	TetsuTestTaskSet},
		{MAPTYPE_CAVE,	MAPTYPE_ROAD,	0,1,	TetsuTestTaskSet},
		{MAPTYPE_CAVE,	MAPTYPE_WATER,	0,1,	TetsuTestTaskSet},
		{MAPTYPE_CAVE,	MAPTYPE_SEA,	0,1,	TetsuTestTaskSet},
		{MAPTYPE_CAVE,	MAPTYPE_ICE,	0,1,	TetsuTestTaskSet},
		{MAPTYPE_CAVE,	MAPTYPE_ROOM,	0,1,	TetsuTestTaskSet},
		{MAPTYPE_CAVE,	MAPTYPE_BASE,	0,1,	TetsuTestTaskSet},

		{0,0,	0,0,NULL},
};


//=========================================================================
//	
//	ﾃｽﾄ
//
//=========================================================================
/********************************************************************/
/*                                                                  */
/*				ﾒｲﾝ													*/
/*                                                                  */
static	void	TetsuTestTask0(u8	id);
static	void	TetsuTestTask1(u8	id);
static	void	TetsuTestTask2(u8	id);
static	void	TetsuTestTask3(u8	id);
static	void	TetsuTestTask4(u8	id);
/********************************************************************/
void	TetsuTestTaskSet(void)
{
	AddTask(TetsuTestTask0, 0);
//	PaletteFadeReq(0xffffffff,0,0,16,0);
}

static	void	TetsuTestTask0(u8	id)
{
//	if(FadeData.fade_sw == 0){
		TaskTable[id].TaskAdrs = TetsuTestTask1;
//	}
}

/********************************************************************/
/*				初期化												*/
/********************************************************************/
static	void	TetsuTestTask1(u8	id)
{
	*(vu16 *)REG_DISPCNT = 	0;

	LZ77UnCompVram((void*)xxx_ch_LZ,(void*)(BG_VRAM+0xc000));	//BG  CGX転送
	LZ77UnCompVram((void*)xxx_sc_LZ,(void*)(BG_VRAM+0xf800));	//BG  MAP転送
	PaletteWorkSet(xxx_PaletteW,PA_BG14,0x20);
	PaletteWorkSet(&(xxx_Palette[0x0008]),PA_BG14,0x10);
//	PaletteWorkSet(xxx_Palette,PA_BG14,0x20);

   	*(vu16 *)REG_BLDCNT   = 0x3e41;	//半透明設定
   	*(vu16 *)REG_BLDALPHA = 0;
   	*(vu16 *)REG_BLDY	  = 0;

	*(vu16 *)REG_BG0CNT = BG_COLOR_16					//16色選択
						| BG_SCREEN_SIZE_0				// スクリーンサイズ
						| BG_PRIORITY_0					//BG優先順位
						| 31 << BG_SCREEN_BASE_SHIFT	//スクリーンベースブロック
						| 3 << BG_CHAR_BASE_SHIFT ;		//キャラクタベースブロック

	*(vu16 *)REG_DISPCNT = 	DISP_MODE_0					// BGモード 
                          |	DISP_OBJ_CHAR_1D_MAP		// OBJ1次元ﾏｯﾋﾟﾝｸﾞ
						  | DISP_BG0_ON					// BG0有効
						  | DISP_OBJ_ON;
	TaskTable[id].TaskAdrs = TetsuTestTask2;
	TaskTable[id].work[0] = 0x10;
	TaskTable[id].work[1] = 0;
}

static	void	TetsuTestTask2(u8	id)
{
	u16	a_val;
	u16	val;

//	val 	= TaskTable[id].work[1]>>1;
	val 	= TaskTable[id].work[1];
	a_val	= val+(0x10*0x100);
   	*(vu16 *)REG_BLDALPHA = a_val;

	if(val<0x11){
		TaskTable[id].work[1]++;
	}else{
		TaskTable[id].work[2] = 0;
		TaskTable[id].TaskAdrs = TetsuTestTask3;
	}
}

static	void	TetsuTestTask3(u8	id)
{
	u16	p;
//	u16	null_Palette[]={0x7fff};

   	*(vu16 *)REG_BLDALPHA = 0x1010;

	p = (TaskTable[id].work[2])>>0;

	if(p<8){
		TaskTable[id].work[2]++;
//		TaskTable[id].work[2]++;
//		PaletteWorkSet(xxx_Palette+(1*p),PA_BG14,0x20-(2*p));
//		PaletteWorkSet(null_Palette,PA_BG14+(16-p),2);
		PaletteWorkSet(&(xxx_Palette[0x0008+p]),PA_BG14,0x10-(2*p));
	}else{
		PaletteWorkSet(xxx_PaletteW,PA_BG0,0x20);
		TaskTable[id].TaskAdrs = TetsuTestTask4;
		TaskTable[id].work[2] = 8;
//		MainProcChange( sys.pReturnProc );
	}
}

static	void	TetsuTestTask4(u8	id)
{
	if(TaskTable[id].work[2]){
		TaskTable[id].work[2]--;
	}else{
		MainProcChange( sys.pReturnProc );
	}
}




/********************************************************************/
/*                                                                  */
/*				ﾒｲﾝ2												*/
/*                                                                  */
static	void	TetsuTestTask2_0(u8	id);
static	void	TetsuTestTask2_1(u8	id);
static	void	TetsuTestTask2_2(u8	id);
static	void	TetsuTestTask2_3(u8	id);
/********************************************************************/
void	TetsuTestTask2Set(void)
{
	AddTask(TetsuTestTask2_0, 0);
//	PaletteFadeReq(0xffffffff,0,0,16,0);
}

static	void	TetsuTestTask2_0(u8	id)
{
//	if(FadeData.fade_sw == 0){
		TaskTable[id].TaskAdrs = TetsuTestTask2_1;
//	}
}

/********************************************************************/
/*				初期化												*/
/********************************************************************/
static	void	TetsuTestTask2_1(u8	id)
{
	*(vu16 *)REG_DISPCNT = 	0;

	LZ77UnCompVram((void*)xxx_ch_LZ,(void*)(BG_VRAM+0xc000));	//BG  CGX転送
	LZ77UnCompVram((void*)xxx_sc_LZ,(void*)(BG_VRAM+0xf800));	//BG  MAP転送

   	*(vu16 *)REG_BLDCNT   = 0;			//半透明設定
   	*(vu16 *)REG_BLDALPHA = 0;
   	*(vu16 *)REG_BLDY	  = 0;

	*(vu16 *)REG_BG0CNT = BG_COLOR_16					//16色選択
						| BG_SCREEN_SIZE_0				// スクリーンサイズ
						| BG_PRIORITY_0					//BG優先順位
						| 31 << BG_SCREEN_BASE_SHIFT	//スクリーンベースブロック
						| 3 << BG_CHAR_BASE_SHIFT ;		//キャラクタベースブロック

	*(vu16 *)REG_DISPCNT = 	DISP_MODE_0					// BGモード 
                          |	DISP_OBJ_CHAR_1D_MAP		// OBJ1次元ﾏｯﾋﾟﾝｸﾞ
						  | DISP_BG0_ON					// BG0有効
						  | DISP_OBJ_ON;

	PaletteWorkSet(xxx_PaletteW,PA_BG14,0x20);
	PaletteWorkSet(xxx_PaletteB,PA_BG0,0x20);

	TaskTable[id].TaskAdrs = TetsuTestTask2_2;
	TaskTable[id].work[0] = 0x10;
	TaskTable[id].work[1] = 0;
	TaskTable[id].work[2] = 0;
}

static	void	TetsuTestTask2_2(u8	id)
{
	u16	p;

	p = (TaskTable[id].work[2])>>0;

	if(p<16){
		TaskTable[id].work[2]++;
		TaskTable[id].work[2]++;
		PaletteWorkSet(xxx_Palette+(15-p),PA_BG14,(2*(p+1)));
	}else{
	 	*(vu16 *)REG_BLDALPHA = 0x1010;
	   	*(vu16 *)REG_BLDCNT   = 0x3e41;	//半透明設定
		TaskTable[id].TaskAdrs = TetsuTestTask2_3;
	}
}

static	void	TetsuTestTask2_3(u8	id)
{
	u16	a_val;
	u16	val;

//	val 	= 0x10-(TaskTable[id].work[1]>>1);
	val 	= 0x10-(TaskTable[id].work[1]);
	a_val	= val+(0x10*0x100);
   	*(vu16 *)REG_BLDALPHA = a_val;

	if(val>0){
		TaskTable[id].work[1]++;
	}else{
		PaletteWorkSet(xxx_PaletteB,PA_BG0,0x20);
		MainProcChange( sys.pReturnProc );
	}
}

/********************************************************************/
/*				ﾃﾞｰﾀ												*/
/********************************************************************/
static	const u16 xxx_PaletteW[16] = {
0x7FFF,0x7FFF,0x7FFF,0x7FFF,0x7FFF,0x7FFF,0x7FFF,0x7FFF,
0x7FFF,0x7FFF,0x7FFF,0x7FFF,0x7FFF,0x7FFF,0x7FFF,0x7FFF,
};
static	const u16 xxx_PaletteB[16] = {
0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
};
static	const u16 xxx_Palette[16] = {
0x5712,0x0842,0x1084,0x18C6,0x2108,0x294A,0x318C,0x39CE,
0x4210,0x4A52,0x5294,0x5AD6,0x6318,0x6B5A,0x739C,0x7FFF,
};

static	const u8 xxx_sc_LZ[0x1e0] = {
0x10,0x00,0x08,0x00,

0x3c,0x01,0xe0,0xf0,0x01,0xf0,0x01,0xf0,0x01,0x10,0x01,0x00,0x00,0x01,0x00,0x00,
0x01,0xe0,0x11,0xe0,0x12,0xf0,0x01,0xb0,0x50,0x01,0xe4,0xf0,0x01,0x30,0x01,0x11,
0xe4,0x01,0xe4,0x83,0x30,0x3f,0x02,0xe0,0x03,0xe0,0x13,0xf0,0x01,0x30,0x01,0x62,
0xe4,0xf0,0x01,0x10,0x01,0x03,0xe4,0x02,0xa0,0x3f,0x04,0x08,0xe0,0x14,0xe0,0x15,
0xf0,0x01,0xe0,0x15,0xe4,0x88,0xf0,0x01,0x14,0xe4,0x04,0xf0,0x3f,0xe0,0x05,0xe0,
0x14,0x06,0xe0,0x16,0xf0,0x01,0xe4,0xd0,0x01,0x06,0xe4,0x60,0x05,0xf0,0x3f,0x40,
0x3f,0x07,0xe0,0x08,0xe0,0x17,0xa3,0xb0,0x01,0xe4,0x90,0x01,0x08,0xe4,0x07,0xf0,
0x3f,0xc0,0x3f,0x05,0x09,0xe0,0x18,0xe0,0x19,0x70,0x01,0xe4,0x50,0x01,0x1c,0x18,
0xe4,0x09,0xf0,0x3f,0xf0,0x3f,0x00,0x3f,0x0a,0xe0,0x14,0x0b,0xe0,0x1a,0x50,0x01,
0xe4,0x30,0x01,0x0b,0xe4,0x70,0x0a,0xf0,0x3f,0xf0,0x3f,0x60,0x3f,0x0c,0xe0,0x1b,
0xe0,0x40,0x1c,0x10,0x01,0xe4,0x1c,0xe4,0x1b,0xe4,0x0c,0xe0,0xf0,0x3f,0xf0,0x3f,
0xc0,0x3f,0x0d,0xe0,0x0e,0xe0,0x0f,0x03,0xe0,0x0f,0xe4,0x0e,0xe4,0x0d,0xf0,0x3f,
0x90,0x3f,0x00,0xe8,0x02,0xe8,0x03,0xe8,0x04,0xe8,0x05,0x00,0xe8,0x06,0xe8,0x07,
0xe8,0x08,0xe8,0x09,0x00,0xe8,0x0a,0xe8,0x0b,0xe8,0x0c,0xe8,0x0d,0x00,0xe8,0x0e,
0xe8,0x0f,0xe8,0x0f,0xec,0x0e,0x00,0xec,0x0d,0xec,0x0c,0xec,0x0b,0xec,0x0a,0x00,
0xec,0x09,0xec,0x08,0xec,0x07,0xec,0x06,0x00,0xec,0x05,0xec,0x04,0xec,0x03,0xec,
0x02,0x18,0xec,0x01,0xec,0xf0,0x3f,0x70,0x3f,0x1b,0xe8,0x1c,0x87,0x10,0x01,0xec,
0x1c,0xec,0x1b,0xf0,0x3f,0xf0,0x3f,0xc0,0x3f,0x5e,0x1a,0x50,0x01,0xec,0x30,0x01,
0xf0,0x3f,0xf0,0x3f,0x50,0x3f,0x18,0x2b,0xe8,0x19,0x70,0x01,0xec,0x50,0x01,0x18,
0xf0,0x3f,0xf0,0x3f,0xae,0x00,0x3f,0x17,0xb0,0x01,0xec,0x90,0x01,0xf0,0x3f,0xb0,
0x3f,0x16,0xb8,0xf0,0x01,0xec,0xd0,0x01,0xf0,0x3f,0x30,0x3f,0x14,0xe8,0x15,0x8a,
0xf0,0x01,0xe8,0x15,0xec,0xf0,0x01,0x14,0xf0,0x3f,0xe8,0x6e,0x13,0xf0,0x01,0x30,
0x01,0xec,0xf0,0x01,0x10,0x01,0x90,0x3f,0x11,0x36,0xe8,0x12,0xf0,0x01,0x50,0x01,
0xec,0xf0,0x01,0x30,0x01,0x11,0xff,0x50,0x3f,0xf4,0x97,0xf0,0x01,0xf0,0x01,0x64,
0xbf,0xf0,0x01,0xf0,0x01,0xf0,0x01,0xff,0xf0,0x01,0xf0,0x01,0xf0,0x01,0xf0,0x01,
0xf0,0x01,0xf0,0x01,0xf0,0x01,0xf0,0x01,0xff,0xf0,0x01,0xf0,0x01,0xf0,0x01,0xf0,
0x01,0xf0,0x01,0xf0,0x01,0xf0,0x01,0xf0,0x01,0xff,0xf0,0x01,0xf0,0x01,0xf0,0x01,
0xf0,0x01,0xf0,0x01,0xf0,0x01,0xf0,0x01,0xf0,0x01,0xff,0xf0,0x01,0xf0,0x01,0xf0,
0x01,0xf0,0x01,0xf0,0x01,0xf0,0x01,0xf0,0x01,0xf0,0x01,0xff,0xf0,0x01,0xf0,0x01,
0xf0,0x01,0xf0,0x01,0xf0,0x01,0xf0,0x01,0xf0,0x01,0x90,0x01,
};

static	const u8 xxx_ch_LZ[0xb4] = {
0x10,0x00,0x04,0x00,

0x33,0x00,0x00,0xf0,0x01,0x90,0x01,0x11,0x11,0xf0,0x01,0x90,0x01,0x33,0x22,0x22,
0xf0,0x01,0x90,0x01,0x33,0x33,0xf0,0x01,0x90,0x01,0x33,0x44,0x44,0xf0,0x01,0x90,
0x01,0x55,0x55,0xf0,0x01,0x90,0x01,0x33,0x66,0x66,0xf0,0x01,0x90,0x01,0x77,0x77,
0xf0,0x01,0x90,0x01,0x33,0x88,0x88,0xf0,0x01,0x90,0x01,0x99,0x99,0xf0,0x01,0x90,
0x01,0x33,0xaa,0xaa,0xf0,0x01,0x90,0x01,0xbb,0xbb,0xf0,0x01,0x90,0x01,0x33,0xcc,
0xcc,0xf0,0x01,0x90,0x01,0xdd,0xdd,0xf0,0x01,0x90,0x01,0x39,0xee,0xee,0xf0,0x01,
0xf0,0x01,0x30,0x01,0xff,0xff,0xf0,0x01,0xff,0xf1,0xd1,0xb1,0xd3,0xf0,0x13,0xb0,
0x01,0xf0,0x1f,0xf1,0xfb,0xf1,0xef,0xf1,0xe3,0xff,0xf0,0x01,0x30,0x01,0xf0,0x1f,
0xf1,0xf7,0xf1,0xeb,0xf1,0xdf,0xf1,0xd3,0xf1,0xc7,0x9f,0xf0,0x01,0xaa,0xaa,0xf0,
0x1f,0xf1,0xdb,0xf1,0xcf,0xf1,0xc3,0xf0,0x01,0xff,0x30,0x01,0xf0,0x1f,0xb1,0xd7,
0xf3,0x91,0xf0,0x01,0xf0,0x01,0xf0,0x01,0xf0,0x01,0x80,0x30,0x01,0x00,0x00,0x00,
};


