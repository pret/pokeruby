//**********************************************************************
//		ec_eff.c
//		¥›∂≥›ƒ¥Ã™∏ƒ
//**********************************************************************
#define		EC_EFF_H_PROTO
#include	<agb.h>
#include	"common.h"
#include	"intr.h"
#include	"actor.h"
#include	"actanm.h"
#include	"palanm.h"
#include	"task.h"
#include	"laster.h"
#include	"calctool.h"
#include	"ec_eff.h"
#include	"evobj.h"
#include	"mapbg.h"
#include	"weather.h"
#include	"mus_tool.h"
#include	"fld_main.h"
#include	"trfenum.h"

//----------------------------------------------------------------------
//		include
//----------------------------------------------------------------------
#include	"..\objdata\ecball.ach"
#include	"..\objdata\ecobjball.ach"
#include	"..\objdata\eccutin_bg.ach"
#include	"..\objdata\eccutin_obj.ach"
#include	"..\objdata\ecblack.ach"

//----------------------------------------------------------------------
//		äOïîéQè∆
//----------------------------------------------------------------------
extern const ActOamData Oam32x32;
// extern void WeatherFadeStop(void);
// extern void WeatherFadeStart(void);

//----------------------------------------------------------------------
//		define
//----------------------------------------------------------------------
#define EC_CONT_TASK_PRI		2						// ∫›ƒ€∞Ÿ¿Ω∏Ãﬂ◊≤µÿ√®
#define EC_SUB_EFF_TASK_PRI		3						// ªÃﬁ¥Ã™∏ƒ¿Ω∏Ãﬂ◊≤µÿ√®
#define EC_EFF_TASK_PRI			4						// ¥Ã™∏ƒ¿Ω∏Ãﬂ◊≤µÿ√®

#define	EC_END_TASK_WORK_NO		15						// ¿Ω∏‹∞∏èIóπ≈› ﬁ

#define EC_START_EFFECT_NOTHING 0						// Ω¿∞ƒ¥Ã™∏ƒñ≥Çµ

#define	MAP_VRAM_SET(map,x,y,ch) \
		map[((y)<<5)+(x)] = ch							// œØÃﬂ VRAM æØƒ
#define	BG_SCRN_DATA(ch,h,v,pal) \
		((ch)|((h)<<10)|((v)<<11)|((pal)<<12))			// Ω∏ÿ∞›√ﬁ∞¿ê∂ê¨

#define EC_DEBUG_CODE_ON 0								// √ﬁ ﬁØ∏óp
#define EC_DEBUG_CODE EC_BALL

#define EC_COLOR_TEST	0

enum
{
	PMLG_TRID_KAGETU = 0,
	PMLG_TRID_FUYOU,
	PMLG_TRID_PURIMU,
	PMLG_TRID_GENJI,
	PMLG_TRID_CHAMP,
};

//----------------------------------------------------------------------
//		typedef
//----------------------------------------------------------------------
typedef struct											// ◊≤›‹∞∏
{
	s16 init_x;
	s16 init_y;
	s16 x0;
	s16 y0;
	s16 x1;
	s16 y1;
	s16 mx;
	s16 my;
	s16 xdiff;
	s16 ydiff;
	s16 work;
}LINEWORK;

typedef struct
{
	vu8 vblank_trans_sw;								// V Ãﬁ◊›∏ì]ëóÃ◊∏ﬁ
	u16 reg_winin;										// ≥®›ƒﬁ≥ ì‡
	u16 reg_winout;										// ≥®›ƒﬁ≥ äO
	u16 reg_win0_h;										// ≥®›ƒﬁ≥0 H
	u16 reg_win0_v;										// ≥®›ƒﬁ≥0 V
	u16 reg_win1_h;										// ≥®›ƒﬁ≥1 H
	u16 reg_win1_v;										// ≥®›ƒﬁ≥1 V
	u16 reg_bldcnt;										// Ãﬁ⁄›ƒﬁ
	u16	reg_bldalpha;									// Ãﬁ⁄›ƒﬁåWêî
	u16 reg_bldy;										// Ãﬁ⁄›ƒﬁãPìx
	s16	mx;												// œØÃﬂ X
	s16 my;												// œØÃﬂ Y
	s16 bgx0;											// BG X 0
	s16 bgx1;											// BG X 1
	s16 bgy0;											// BG Y 0
	s16 bgy1;											// BG Y 1
	s16 work;											// ‹∞∏
	LINEWORK line;										// ◊≤›‹∞∏
}ECE_WORK;

#define ECE_WORK_SIZE			(sizeof(ECE_WORK))
#define ECE_WORK_ADRS			(&UserWork[0xc000])
#define ECE_DECORD_WORK_ADRS	(ECE_WORK_ADRS+ECE_WORK_SIZE)

//----------------------------------------------------------------------
//		Ãﬂ€ƒ
//----------------------------------------------------------------------
static void SetEcEffectControlTask( u8 );
static void EcEffectControlTask( u8 );

static void EcStartEffectFlash( u8 );

static void EcEffectMosaic( u8 );
static void EcEffectHSinLaster( u8 );
static void EcEffectVSinLaster( u8 );
static void EcEffectBall( u8 );
static void EcEffectSpinBall( u8 );
static void EcEffectLineWindow( u8 );
static void EcEffectSwell( u8 );
static void EcEffectCurtain( u8 );
static void EcEffectBGShift( u8 );
static void EcEffectWhiteLine( u8 );
static void EcEffectBlackCoating( u8 );
static void EcEffectScreenCut( u8 );
static void EcEffectPmlgKagetu( u8 );
static void EcEffectPmlgFuyou( u8 );
static void EcEffectPmlgPurimu( u8 );
static void	EcEffectPmlgGenji( u8 );
static void EcEffectPmlgChamp( u8 );

static void FeEcSpinBallMove( actWork * );
static void EcCutinTrainerActMove( actWork * );

static void SetEcEffectFlash( s16, s16, s16, s16, s16 );
static u8 CheckEcEffectFlash( void );

static void InitEceWork( void );
static void EcVBlankMain( void );

static void GetBG0Char( u16 ** );
static void GetBG0MapChar( u16 **, u16 ** );
static void SetPaletteBlack( void );
static void SetBufSin( u16 *, s16, s16, s16, s16, s16 );
static void SetWindowCircle( u16 *, s16, s16, s16 );
static void SetLineWork( LINEWORK *, s16, s16, s16, s16, s16, s16 );
static u8 MoveLineWork( LINEWORK *, u8, u8 );

static const actHeader SpinBallActHead;
static const actHeader TrHeroActHead;
static const actHeader TrDmyActHead;
static const u16 ecball_Palette[16];
static const u16 eccutin_bg_Palette[];
static const u16 * const eccutin_bg_PaletteTbl[];
static const u16 * const eccutin_hero_bg_PaletteTbl[];
static const u16 eccutin_obj_Palette[16];
static const PalData EcTrainerPalData;
static const u16 ecball_Map[600];
static const u16 eccutin0_Map[640];

static ECE_WORK * const EceWork = (ECE_WORK*)ECE_WORK_ADRS;

//======================================================================
//		¥›∂≥›ƒ¥Ã™∏ƒ
//======================================================================
//------------------------------------------
//	¥›∂≥›ƒ¥Ã™∏ƒæØƒ
//	In:		u8			; ¥›∂≥›ƒéÌóﬁ∫∞ƒﬁ
//	Info:	“≤›èàóùêÿÇËë÷Ç¶
//------------------------------------------
void SetEcEffect( u8 code )
{
#if EC_DEBUG_CODE_ON
	code = EC_DEBUG_CODE;
#endif

	sys.pMainProc = FieldEffectMain;
	SetEcEffectControlTask( code );
}

//------------------------------------------
//	¥›∂≥›ƒ¥Ã™∏ƒæØƒ
//	In:		u8			; ¥›∂≥›ƒéÌóﬁ∫∞ƒﬁ
//	Info:	“≤›èàóùêÿÇËë÷Ç¶ñ≥Çµ
//------------------------------------------
void SetEcEffect1stBattle( u8 code )
{
	SetEcEffectControlTask( code );
}

//------------------------------------------
//	¥›∂≥›ƒ¥Ã™∏ƒèIóπ¡™Ø∏
//	Out:	u8			; On = èIóπ
//	Info:	¡™Ø∏ -> èIóπéû,¿Ω∏çÌèú
//------------------------------------------
u8 CheckEcEffect( void )
{
	u8 i;

	i = CheckTaskNo( EcEffectControlTask );

	if( TaskTable[i].work[EC_END_TASK_WORK_NO] )
	{
		DelTask( i );
		return( 1 );
	}

	return( 0 );
}

//======================================================================
//		¥Ã™∏ƒ∫›ƒ€∞Ÿ
//======================================================================
static u8 EcControl0( TASK_TABLE * );
static u8 EcControl1( TASK_TABLE * );
static u8 EcControl2( TASK_TABLE * );
static u8 EcControl3( TASK_TABLE * );

//------------------------------------------
//	Ω¿∞ƒ¥Ã™∏ƒ√∞ÃﬁŸ
//------------------------------------------
static void (* const EcStartEffectTaskTbl[])(u8) =
{
	EcStartEffectFlash,									// EC_MOSAIC
	EcStartEffectFlash,									// EC_HSIN
	EcStartEffectFlash,									// EC_VSIN
	EcStartEffectFlash,									// EC_BALL
	EcStartEffectFlash,									// EC_SPINBALL
	EcStartEffectFlash,									// EC_LINEWINDOW
	EcStartEffectFlash,									// EC_SWELL
	EcStartEffectFlash,									// EC_CURTAIN
	EcStartEffectFlash,									// EC_BGSHIFT
	EcStartEffectFlash,									// EC_WHITELINE
	EcStartEffectFlash,									// EC_BLACKCOATING
	EcStartEffectFlash,									// EC_STRECH
	EcStartEffectFlash,									// EC_
	EcStartEffectFlash,									// EC_
	EcStartEffectFlash,									// EC_
	EcStartEffectFlash,									// EC_
	EcStartEffectFlash,									// EC_
};

//------------------------------------------
//	¥Ã™∏ƒ√∞ÃﬁŸ
//------------------------------------------
static void (* const EcEffectTaskTbl[])(u8) =
{
	EcEffectMosaic,										// EC_MOSAIC
	EcEffectHSinLaster,									// EC_HSIN
	EcEffectVSinLaster,									// EC_VSIN
	EcEffectBall,										// EC_BALL
	EcEffectSpinBall,									// EC_SPINBALL
	EcEffectLineWindow,									// EC_LINEWINDOW
	EcEffectSwell,										// EC_SWELL
	EcEffectCurtain,									// EC_CURTAIN
	EcEffectBGShift,									// EC_BGSHIFT
	EcEffectWhiteLine,									// EC_WHITELINE
	EcEffectBlackCoating,								// EC_BLACKCOATING
	EcEffectScreenCut,									// EC_STRECH
	EcEffectPmlgKagetu,									// EC_PMLG_KAGETSU
	EcEffectPmlgFuyou,									// EC_PMLG_FUYOU
	EcEffectPmlgPurimu,									// EC_PMLG_PURIMU
	EcEffectPmlgGenji,									// EC_PMLG_GENJI
	EcEffectPmlgChamp,									// EC_PMLG_CHAMP
};

//------------------------------------------
//	¥Ã™∏ƒ∫›ƒ€∞Ÿ¿Ω∏æØƒ
//------------------------------------------
static void SetEcEffectControlTask( u8 code )
{
	u8 i;

	i = AddTask( EcEffectControlTask, EC_CONT_TASK_PRI );
	TaskTable[i].work[1] = code;
}

//------------------------------------------
//	¥Ã™∏ƒ∫›ƒ€∞Ÿ¿Ω∏√∞ÃﬁŸ
//------------------------------------------
static u8 (* const EcControlTaskTbl[])( TASK_TABLE * ) =
{
	EcControl0,
	EcControl1,
	EcControl2,
	EcControl3,
};

//------------------------------------------
//	¥Ã™∏ƒ∫›ƒ€∞Ÿ¿Ω∏
//------------------------------------------
static void EcEffectControlTask( u8 no )
{
	while( EcControlTaskTbl[TaskTable[no].work[0]](&TaskTable[no]) );
}

//------------------------------------------
//	∫›ƒ€∞Ÿ 0
//------------------------------------------
static u8 EcControl0( TASK_TABLE *task )
{
	void *adrs;

	WeatherFadeStop();
	CpuCopy( PaletteWorkTrans, PaletteWork, 0x400, 32 );

	adrs = EcStartEffectTaskTbl[task->work[1]];

	if( adrs != EC_START_EFFECT_NOTHING )
	{
		AddTask( adrs, EC_EFF_TASK_PRI );
		task->work[0]++;
		return( 0 );
	}

	task->work[0] = 2;
	return( 1 );
}

//------------------------------------------
//	∫›ƒ€∞Ÿ 1
//------------------------------------------
static u8 EcControl1( TASK_TABLE *task )
{
	u8 i;

	i = CheckTaskNo( EcStartEffectTaskTbl[task->work[1]] );

	if( i == NOT_EXIST_TASK_ID )
	{
		task->work[0]++;
		return( 1 );
	}

	return( 0 );
}

//------------------------------------------
//	∫›ƒ€∞Ÿ 2
//------------------------------------------
static u8 EcControl2( TASK_TABLE *task )
{
	AddTask( EcEffectTaskTbl[task->work[1]], 0 );

	task->work[0]++;
	return( 0 );
}

//------------------------------------------
//	∫›ƒ€∞Ÿ 3
//------------------------------------------
static u8 EcControl3( TASK_TABLE *task )
{
	u8 i;

	task->work[EC_END_TASK_WORK_NO] = 0;
	i = CheckTaskNo( EcEffectTaskTbl[task->work[1]] );

	if( i == NOT_EXIST_TASK_ID )
	{
		task->work[EC_END_TASK_WORK_NO] = 1;			// èIóπ
	}

	return( 0 );
}

//======================================================================
//		Ω¿∞ƒ¥Ã™∏ƒ Ã◊Øº≠
//======================================================================
//------------------------------------------
//	Ω¿∞ƒ¥Ã™∏ƒ¿Ω∏
//------------------------------------------
static void EcStartEffectFlash( u8 no )
{
	if( TaskTable[no].work[0] == 0 )
	{
		TaskTable[no].work[0]++;
		SetEcEffectFlash( 0, 0, 3, 2, 2 );
	}
	else if( CheckEcEffectFlash() )
	{
		DelTask( no );
	}
}

//======================================================================
//		¥Ã™∏ƒ ”ªﬁ≤∏
//======================================================================
static u8 EcMosaic0( TASK_TABLE * );
static u8 EcMosaic1( TASK_TABLE * );
static u8 EcMosaic2( TASK_TABLE * );

//------------------------------------------
//	èàóù√∞ÃﬁŸ
//------------------------------------------
static u8 (* const EcMosaicTbl[])( TASK_TABLE * ) =
{
	EcMosaic0,
	EcMosaic1,
	EcMosaic2,
};

//------------------------------------------
//	¥Ã™∏ƒ¿Ω∏ ”ªﬁ≤∏
//------------------------------------------
static void EcEffectMosaic( u8 no )
{
	while( EcMosaicTbl[TaskTable[no].work[0]](&TaskTable[no]) );
}

//------------------------------------------
//	”ªﬁ≤∏ 0
//------------------------------------------
static u8 EcMosaic0( TASK_TABLE *task )
{
	*(vu16*)REG_MOSAIC = 0;
	*(vu16*)REG_BG1CNT |= BG_MOS_ON;
	*(vu16*)REG_BG2CNT |= BG_MOS_ON;
	*(vu16*)REG_BG3CNT |= BG_MOS_ON;

	task->work[0]++;
	return( 1 );
}

//------------------------------------------
//	”ªﬁ≤∏ 1
//------------------------------------------
static u8 EcMosaic1( TASK_TABLE *task )
{
	if( task->work[1] )
	{
		task->work[1]--;
		return( 0 );
	}

	task->work[1] = 0x4;
	task->work[2]++;

	if( task->work[2] == 0x0a )
	{
		PaletteFadeReq( 0xffffffff, -1, 0, 16, 0 );
	}

	*(vu16*)REG_MOSAIC = (task->work[2] & 0x0f) * 0x10 + (task->work[2] & 0x0f);

	if( task->work[2] >= 0x0f )
	{
		task->work[0]++;
	}

	return( 0 );
}

//------------------------------------------
//	”ªﬁ≤∏ 2
//------------------------------------------
static u8 EcMosaic2( TASK_TABLE *task )
{
	if( FadeData.fade_sw == 0 )
	{
		DelTask( CheckTaskNo(EcEffectMosaic) );
	}

	return( 0 );
}

//======================================================================
//		¥Ã™∏ƒ H ª≤›◊Ω¿∞
//======================================================================
static u8 EcHSinLaster0( TASK_TABLE * );
static u8 EcHSinLaster1( TASK_TABLE * );
static void EcHSinVBlank( void );
static void EcHSinHBlank( void );

//------------------------------------------
//	èàóù√∞ÃﬁŸ
//------------------------------------------
static u8 (* const EcHSinLasterTbl[])( TASK_TABLE * ) =
{
	EcHSinLaster0,
	EcHSinLaster1,
};

//------------------------------------------
//	¥Ã™∏ƒ¿Ω∏ HSin◊Ω¿∞
//------------------------------------------
static void EcEffectHSinLaster( u8 no )
{
	while( EcHSinLasterTbl[TaskTable[no].work[0]](&TaskTable[no]) );
}

//------------------------------------------
//	HSin 0
//------------------------------------------
static u8 EcHSinLaster0( TASK_TABLE *task )
{
	InitEceWork();
	LasterWorkInit();
	PaletteFadeReq( 0xffffffff, 4, 0, 16, 0 );
	SetBufSin( LasterBuffer[1], EceWork->mx, 0, 2, 0, 160 );
	SetVBlankFunc( EcHSinVBlank );
	SetHBlankFunc( EcHSinHBlank );
	REG_IE_SET( V_BLANK_INTR_FLAG | H_BLANK_INTR_FLAG );
	*(vu16*)REG_STAT |= STAT_V_BLANK_IF_ENABLE | STAT_H_BLANK_IF_ENABLE;
	
	task->work[0]++;
	return( 0 );
}

//------------------------------------------
//	HSin 1
//------------------------------------------
static u8 EcHSinLaster1( TASK_TABLE *task )
{
	EceWork->vblank_trans_sw = 0;

	task->work[1] += 4;
	task->work[2] += 8;
	SetBufSin( LasterBuffer[0], EceWork->mx, task->work[1], 2, task->work[2], 160 );

	if( FadeData.fade_sw == 0 )
	{
		DelTask( CheckTaskNo(EcEffectHSinLaster) );
	}

	EceWork->vblank_trans_sw++;
	return( 0 );
}

//------------------------------------------
//	HSin V Blank
//------------------------------------------
static void EcHSinVBlank( void )
{
	EcVBlankMain();

	if( EceWork->vblank_trans_sw )
	{
		DmaCopy( 3, LasterBuffer[0], LasterBuffer[1], 160*2, 16 );
	}
}

//------------------------------------------
//	HSin H Blank
//------------------------------------------
static void EcHSinHBlank( void )
{
	u16 buf;

	buf = LasterBuffer[1][*(vu16*)REG_VCOUNT];
	*(vu16*)REG_BG1HOFS = buf;
	*(vu16*)REG_BG2HOFS = buf;
	*(vu16*)REG_BG3HOFS = buf;
}

//======================================================================
//		¥Ã™∏ƒ V ª≤›◊Ω¿∞
//======================================================================
static u8 EcVSinLaster0( TASK_TABLE * );
static u8 EcVSinLaster1( TASK_TABLE * );
static void EcVSinVBlank( void );
static void EcVSinHBlank( void );

//------------------------------------------
//	èàóù√∞ÃﬁŸ
//------------------------------------------
static u8 (* const EcVSinLasterTbl[])( TASK_TABLE * ) =
{
	EcVSinLaster0,
	EcVSinLaster1,
};

//------------------------------------------
//	¥Ã™∏ƒ¿Ω∏ VSin◊Ω¿∞
//------------------------------------------
static void EcEffectVSinLaster( u8 no )
{
	while( EcVSinLasterTbl[TaskTable[no].work[0]](&TaskTable[no]) );
}

//------------------------------------------
//	VSin 0
//------------------------------------------
static u8 EcVSinLaster0( TASK_TABLE *task )
{
	InitEceWork();
	LasterWorkInit();
	PaletteFadeReq( 0xffffffff, 4, 0, 16, 0 );
	memset( (u8*)&LasterBuffer[1], EceWork->my, 320 );
	SetVBlankFunc( EcVSinVBlank );
	SetHBlankFunc( EcVSinHBlank );
	REG_IE_SET( V_BLANK_INTR_FLAG | H_BLANK_INTR_FLAG );
	*(vu16*)REG_STAT |= STAT_V_BLANK_IF_ENABLE | STAT_H_BLANK_IF_ENABLE;

	task->work[0]++;
	return( 0 );
}

//------------------------------------------
//	VSin 1
//------------------------------------------
static u8 EcVSinLaster1( TASK_TABLE *task )
{
	u8 i;
	u16 s_ang,ang,rad;

	EceWork->vblank_trans_sw = 0;

	s_ang = task->work[1];
	rad = task->work[2] >> 8;
	task->work[1] += 0x1080;
	task->work[2] += 0x0180;

	for( i = 0; i < 160; i++, s_ang += 0x1080 )
	{
		ang = (s_ang >> 8);
		LasterBuffer[0][i] = EceWork->my + SinMove( (ang&0xff), rad );
	}

	if( FadeData.fade_sw == 0 )
	{
		DelTask( CheckTaskNo(EcEffectVSinLaster) );
	}

	EceWork->vblank_trans_sw++;
	return( 0 );
}

//------------------------------------------
//	VSin V Blank
//------------------------------------------
static void EcVSinVBlank( void )
{
	EcVBlankMain();

	if( EceWork->vblank_trans_sw )
	{
		DmaCopy( 3, LasterBuffer[0], LasterBuffer[1], 160*2, 16 );
	}
}

//------------------------------------------
//	VSin H Blank
//------------------------------------------
static void EcVSinHBlank( void )
{
	u16 buf;

	buf = LasterBuffer[1][*(vu16*)REG_VCOUNT];
	*(vu16*)REG_BG1VOFS = buf;
	*(vu16*)REG_BG2VOFS = buf;
	*(vu16*)REG_BG3VOFS = buf;
}

//======================================================================
//		¥Ã™∏ƒ ‹≤Ãﬂ
//======================================================================
static u8 EcBall0( TASK_TABLE * );
static u8 EcBall01( TASK_TABLE * );
static u8 EcBall02( TASK_TABLE * );
static u8 EcBall03( TASK_TABLE * );
static u8 EcBall04( TASK_TABLE * );
static u8 EcBall1( TASK_TABLE * );
static void EcBallVBlank0( void );
static void EcBallVBlank1( void );

//------------------------------------------
//	èàóù√∞ÃﬁŸ
//------------------------------------------
static u8 (* const EcBallTbl[])( TASK_TABLE * ) =
{
	EcBall0,
	EcBall01,
	EcBall02,
	EcBall03,
	EcBall04,
	EcBall1,
};

//------------------------------------------
//	¥Ã™∏ƒ¿Ω∏ Œﬁ∞Ÿ
//------------------------------------------
static void EcEffectBall( u8 no )
{
	while( EcBallTbl[TaskTable[no].work[0]](&TaskTable[no]) );
}

//------------------------------------------
//	Ball 0
//------------------------------------------
static u8 EcBall0( TASK_TABLE *task )
{
	u16 i,*bg_map,*bg_ch;

	InitEceWork();
	LasterWorkInit();
	task->work[1] = 16;									// BLD A
	task->work[2] = 0;									// BLD B
	task->work[4] = 0;									// sin a
	task->work[5] = 64 << 8;							// sin r
	EceWork->reg_winin = WIN_ALL_ON;
	EceWork->reg_winout = 0;
	EceWork->reg_win0_h = (0 << 8) | 240;
	EceWork->reg_win0_v = (0 << 8) | 160;
	EceWork->reg_bldcnt = BLD_BG0_1ST | BLD_2ND_ALL | BLD_A_BLEND_MODE;
	EceWork->reg_bldalpha = (task->work[1] << 8) | task->work[2];
	for( i = 0; i < 160; LasterBuffer[1][i] = (0<<8)|240, i++ );
	SetVBlankFunc( EcBallVBlank0 );

	GetBG0MapChar( &bg_map, &bg_ch );
	CpuClear( 0, bg_map, 0x0800, 16 );
	CpuCopy( ecball_Character, bg_ch, 0x20*0x2c, 16 );
	PaletteWorkSet( ecball_Palette, PA_BG15, 0x20 );

	task->work[0]++;
	return( 0 );
}

//------------------------------------------
//	Ball 0,1
//------------------------------------------
static u8 EcBall01( TASK_TABLE *task )
{
	s16 x,y;
	u16 *bg_map,*bg_ch,*set_map;

	set_map = (u16*)ecball_Map;
	GetBG0MapChar( &bg_map, &bg_ch );

	for( y = 0; y < 0x14; y++ )
	{
		for( x = 0; x < 0x1e; x++, set_map++ )
		{
			MAP_VRAM_SET( bg_map, x, y, BG_SCRN_DATA(*set_map,0,0,15) );
		}
	}

	SetBufSin( LasterBuffer[0], 0, task->work[4], 132, task->work[5], 160 );

	task->work[0]++;
	return( 1 );
}

static u8 EcBall02( TASK_TABLE *task )
{
	EceWork->vblank_trans_sw = 0;

	if( task->work[3] ) task->work[3]--;

	if( task->work[3] == 0 )
	{
		task->work[2]++;
		task->work[3] = 2;
	}

	EceWork->reg_bldalpha = (task->work[1] << 8) | task->work[2];

	if( task->work[2] >= 16 )
	{
		task->work[0]++;
	}

	task->work[4] += 8;
	task->work[5] -= 0x0100;
	SetBufSin( LasterBuffer[0], 0, task->work[4], 132, task->work[5] >> 8, 160 );

	EceWork->vblank_trans_sw++;
	return( 0 );
}

static u8 EcBall03( TASK_TABLE *task )
{
	EceWork->vblank_trans_sw = 0;

	if( task->work[3] ) task->work[3]--;

	if( task->work[3] == 0 )
	{
		task->work[1]--;
		task->work[3] = 2;
	}

	EceWork->reg_bldalpha = (task->work[1] << 8) | task->work[2];

	if( task->work[1] == 0 )
	{
		task->work[0]++;
	}

	task->work[4] += 8;
	task->work[5] -= 0x0100;
	SetBufSin( LasterBuffer[0], 0, task->work[4], 132, task->work[5] >> 8, 160 );

	EceWork->vblank_trans_sw++;
	return( 0 );
}

static u8 EcBall04( TASK_TABLE *task )
{
	EceWork->vblank_trans_sw = 0;

	task->work[4] += 8;
	task->work[5] -= 0x0100;
	SetBufSin( LasterBuffer[0], 0, task->work[4], 132, task->work[5] >> 8, 160 );

	if( task->work[5] <= 0 )
	{
		task->work[0]++;
		task->work[1] = 160;
		task->work[2] = 0x0100;
		task->work[3] = 0;
	}

	EceWork->vblank_trans_sw++;
	return( 0 );
}

//------------------------------------------
//	Ball 1
//------------------------------------------
static u8 EcBall1( TASK_TABLE *task )
{
	EceWork->vblank_trans_sw = 0;

	if( task->work[2] < 0x0400 ) task->work[2] += 0x0080;
	if( task->work[1] ) task->work[1] -= task->work[2] >> 8;
	if( task->work[1] < 0 ) task->work[1] = 0;
	SetWindowCircle( LasterBuffer[0], 120, 80, task->work[1] );

	if( task->work[1] == 0 )
	{
		DmaStop( 0 );
		SetPaletteBlack();
		DelTask( CheckTaskNo(EcEffectBall) );
	}

	if( task->work[3] == 0 )
	{
		task->work[3]++;
		SetVBlankFunc( EcBallVBlank1 );
	}

	EceWork->vblank_trans_sw++;
	return( 0 );
}

//------------------------------------------
//	Ball V Blank Main
//------------------------------------------
static void EcBallVBlankMain( void )
{
	DmaStop( 0 );
	EcVBlankMain();
	
	if( EceWork->vblank_trans_sw )
	{
		DmaCopy( 3, LasterBuffer[0], LasterBuffer[1], 160*2, 16 );
	}

	*(vu16*)REG_WININ = EceWork->reg_winin;
	*(vu16*)REG_WINOUT = EceWork->reg_winout;
	*(vu16*)REG_WIN0V = EceWork->reg_win0_v;
	*(vu16*)REG_BLDCNT = EceWork->reg_bldcnt;
	*(vu16*)REG_BLDALPHA = EceWork->reg_bldalpha;
}

//------------------------------------------
//	Ball V Blank 0
//------------------------------------------
static void EcBallVBlank0( void )
{
	EcBallVBlankMain();

	DmaSet( 0,											// H DMA æØƒ
		LasterBuffer[1],
		(vu16*)REG_BG0HOFS,
		DMA_ENABLE |									// DMA ãñâ¬
		DMA_TIMMING_H_BLANK |							// H DMA
		DMA_16BIT_BUS |									// 16bitì]ëó
		DMA_CONTINUOUS_ON |								// ñàâÒ
		DMA_SRC_INC |									// ì]ëóå≥≤›∏ÿ“›ƒ
		DMA_DEST_FIX | 									// ì]ëóêÊÇªÇÃÇ‹Ç‹
		1 );											// 1ìxÇ…1âÒ
}

//------------------------------------------
//	Ball V Blank 1
//------------------------------------------
static void EcBallVBlank1( void )
{
	EcBallVBlankMain();

	DmaSet( 0,											// H DMA æØƒ
		LasterBuffer[1],
		(vu16*)REG_WIN0H,
		DMA_ENABLE |									// DMA ãñâ¬
		DMA_TIMMING_H_BLANK |							// H DMA
		DMA_16BIT_BUS |									// 16bitì]ëó
		DMA_CONTINUOUS_ON |								// ñàâÒ
		DMA_SRC_INC |									// ì]ëóå≥≤›∏ÿ“›ƒ
		DMA_DEST_FIX | 									// ì]ëóêÊÇªÇÃÇ‹Ç‹
		1 );											// 1ìxÇ…1âÒ
}

//======================================================================
//		¥Ã™∏ƒ âÒì]Œﬁ∞Ÿ
//======================================================================
static u8 EcSpinBall0( TASK_TABLE * );
static u8 EcSpinBall1( TASK_TABLE * );
static u8 EcSpinBall2( TASK_TABLE * );

//------------------------------------------
//	èàóù√∞ÃﬁŸ
//------------------------------------------
static u8 (* const EcSpinBallTbl[])( TASK_TABLE * ) =
{
	EcSpinBall0,
	EcSpinBall1,
	EcSpinBall2,
};

//------------------------------------------
//	¥Ã™∏ƒ¿Ω∏ âÒì]Œﬁ∞Ÿ
//------------------------------------------
static void EcEffectSpinBall( u8 no )
{
	while( EcSpinBallTbl[TaskTable[no].work[0]](&TaskTable[no]) );
}

//------------------------------------------
//	SpinBall 0
//------------------------------------------
static u8 EcSpinBall0( TASK_TABLE *task )
{
	u16 *map,*ch;

	GetBG0MapChar( &map, &ch );
	CpuCopy( ecobjball_Character, ch, 0x20 * 2, 16 );
	CpuClear( 0, map, 0x0800, 32 );
	PaletteWorkSet( ecball_Palette, PA_BG15, 0x0020 );

	task->work[0]++;
	return( 0 );
}

//------------------------------------------
//	SpinBall 1
//------------------------------------------
static u8 EcSpinBall1( TASK_TABLE *task )
{
	s16 i,spin;
	s16 x_pos[2] = { -16, 256 };
	s16 wait[5] = { 0, 32, 64, 18, 48 };

	spin = pp_rand() & 0x01;							// êiçsï˚å¸

	for( i = 0; i < 5; i++, spin ^= 1 )
	{
		FeSetWork[0] = x_pos[spin];
		FeSetWork[1] = (i << 5) + 16;					// y 32
		FeSetWork[2] = spin;
		FeSetWork[3] = wait[i];
		FldEffSet( FECODE_EcActBall );
	}
	
	task->work[0]++;
	return( 0 );
}

//------------------------------------------
//	SpinBall 2
//------------------------------------------
static u8 EcSpinBall2( TASK_TABLE *task )
{
	if( FeCodeChk(FECODE_EcActBall) == 0 )
	{
		SetPaletteBlack();
		DelTask( CheckTaskNo(EcEffectSpinBall) );
	}

	return( 0 );
}

//------------------------------------------
//	Œﬁ∞Ÿ±∏¿æØƒ
//	In:		work0,1		; x,y
//			work2		; âÒì]ï˚å¸(0~1)
//			work3		; ≥™≤ƒ
//------------------------------------------
u32 FeEcSpinBallSet( void )
{
	u8 i;

	i = AddActorBottom( &SpinBallActHead, FeSetWork[0], FeSetWork[1], 0 );

	ActWork[i].oamData.Priority = 0;
	ActWork[i].oamData.AffineMode = 1;
	ActWork[i].work[0] = FeSetWork[2];
	ActWork[i].work[1] = FeSetWork[3];
	ActWork[i].work[2] = 0xffff;
	AffineNumSet( &ActWork[i] );
	ActAffAnmChg( &ActWork[i], FeSetWork[2] );

	return( 0 );
}

//------------------------------------------
//	Œﬁ∞Ÿ±∏¿ìÆçÏ
//------------------------------------------
static void FeEcSpinBallMove( actWork *act )
{
	u16 base_num;
	u16 *bgmap;
	s16 x,y;
	s16 move[2] = { 8, -8 };

	if( act->work[1] )									// ≥™≤ƒ
	{
		act->work[1]--;
		return;
	}

	if( act->x >= 0 && act->x <= 240 )
	{
		x = act->x >> 3;								// x/8
		y = act->y >> 3;

		if( x != act->work[2] )							// çXêV
		{
			act->work[2] = x;
			base_num = ((*(vu16*)REG_BG0CNT) >> BG_SCREEN_BASE_SHIFT) & 0x1f;
			bgmap = (u16*)(BG_VRAM + (base_num << 11));
			MAP_VRAM_SET( bgmap, x, y - 2, BG_SCRN_DATA(1,0,0,15) );
			MAP_VRAM_SET( bgmap, x, y - 1, BG_SCRN_DATA(1,0,0,15) );
			MAP_VRAM_SET( bgmap, x, y, BG_SCRN_DATA(1,0,0,15) );
			MAP_VRAM_SET( bgmap, x, y + 1, BG_SCRN_DATA(1,0,0,15) );
		}
	}

	act->x += move[act->work[0]];

	if( act->x <= -16 || act->x >= 256 )
	{
		FeDelActCode( act, FECODE_EcActBall );
	}
}

//======================================================================
//		¥Ã™∏ƒ ◊≤›≥®›ƒﬁ≥
//======================================================================
static u8 EcLineWindow0( TASK_TABLE * );
static u8 EcLineWindow1( TASK_TABLE * );
static u8 EcLineWindow2( TASK_TABLE * );
static u8 EcLineWindow3( TASK_TABLE * );
static u8 EcLineWindow4( TASK_TABLE * );
static u8 EcLineWindow5( TASK_TABLE * );
static u8 EcLineWindow6( TASK_TABLE * );
static void EcLineWindowVBlank( void );

//------------------------------------------
//	èàóù√∞ÃﬁŸ
//------------------------------------------
static u8 (* const EcLineWindowTbl[])( TASK_TABLE * ) =
{
	EcLineWindow0,
	EcLineWindow1,
	EcLineWindow2,
	EcLineWindow3,
	EcLineWindow4,
	EcLineWindow5,
	EcLineWindow6,
};

//------------------------------------------
//	¥Ã™∏ƒ¿Ω∏ ◊≤›≥®›ƒﬁ≥
//------------------------------------------
static void EcEffectLineWindow( u8 no )
{
	while( EcLineWindowTbl[TaskTable[no].work[0]](&TaskTable[no]) );
}

//------------------------------------------
//	LineWindow 0
//------------------------------------------
static u8 EcLineWindow0( TASK_TABLE *task )
{
	u16 i;

	InitEceWork();
	LasterWorkInit();

	EceWork->reg_winin = 0;
	EceWork->reg_winout = WIN_ALL_ON;
	EceWork->reg_win0_h = (240 << 8) | 241;
	EceWork->reg_win0_v = (0 << 8) | 160;
	for( i = 0; i < 160; LasterBuffer[1][i] = (243<<8)|244, i++ );

	SetVBlankFunc( EcLineWindowVBlank );

	EceWork->line.x1 = 120;

	task->work[0]++;
	return( 1 );
}

//------------------------------------------
//	LineWindow 1
//------------------------------------------
static u8 EcLineWindow1( TASK_TABLE *task )
{
	EceWork->vblank_trans_sw = 0;

	SetLineWork( &EceWork->line, 120, 80, EceWork->line.x1, -1, 1, 1 );
	do{ LasterBuffer[0][EceWork->line.y0] = (120 << 8) | (EceWork->line.x0 + 1);
	} while( MoveLineWork(&EceWork->line,1,1) == 0 );

	EceWork->line.x1 += 16;

	if( EceWork->line.x1 >= 240 )
	{
		EceWork->line.y1 = 0;							// èIì_ Y
		task->work[0]++;
	}

	EceWork->vblank_trans_sw++;
	return( 0 );
}

//------------------------------------------
//	LineWindow 2
//------------------------------------------
static u8 EcLineWindow2( TASK_TABLE *task )
{
	vu8 flag;
	s16 x0,x1;
	
	flag = 0;
	EceWork->vblank_trans_sw = 0;
	SetLineWork( &EceWork->line, 120, 80, 240, EceWork->line.y1, 1, 1 );

	while( 1 )
	{
		x0 = 120;
		x1 = EceWork->line.x0 + 1;

		if( EceWork->line.y1 >= 80 )
		{
			x0 = EceWork->line.x0;
			x1 = 240;
		}

		LasterBuffer[0][EceWork->line.y0] = (x0 << 8) | x1;
	
		if( flag )
		{
			break;
		}

		flag = MoveLineWork( &EceWork->line, 1, 1 );
	}

	EceWork->line.y1 += 8;

	if( EceWork->line.y1 >= 160 )
	{
		EceWork->line.x1 = 240;							// èIì_ x
		task->work[0]++;
	}
	else												// ñÑÇﬂ
	{
		while( EceWork->line.y0 < EceWork->line.y1 )
			LasterBuffer[0][++(EceWork->line.y0)] = (x0 << 8) | x1;
	}

	EceWork->vblank_trans_sw++;
	return( 0 );
}

//------------------------------------------
//	LineWindow 3
//------------------------------------------
static u8 EcLineWindow3( TASK_TABLE *task )
{
	EceWork->vblank_trans_sw = 0;

	SetLineWork( &EceWork->line, 120, 80, EceWork->line.x1, 160, 1, 1 );
	do{ LasterBuffer[0][EceWork->line.y0] = (EceWork->line.x0 << 8) | 240;
	} while( MoveLineWork(&EceWork->line,1,1) == 0 );

	EceWork->line.x1 -= 16;

	if( EceWork->line.x1 <= 0 )
	{
		EceWork->line.y1 = 160;							// èIì_ Y
		task->work[0]++;
	}

	EceWork->vblank_trans_sw++;
	return( 0 );
}

//------------------------------------------
//	LineWindow 4
//------------------------------------------
static u8 EcLineWindow4( TASK_TABLE *task )
{
	vu8 flag;
	s16 x0,x1;

	flag = 0;
	EceWork->vblank_trans_sw = 0;
	SetLineWork( &EceWork->line, 120, 80, 0, EceWork->line.y1, 1, 1 );
	
	while( 1 )
	{
		x0 = LasterBuffer[0][EceWork->line.y0];			// Y
		x1 = (x0 & 0x00ff);
		x0 = EceWork->line.x0;

		if( EceWork->line.y1 <= 80 )					// îΩì]
		{
			x0 = 120;
			x1 = EceWork->line.x0;
		}

		LasterBuffer[0][EceWork->line.y0] = (x0 << 8) | x1;

		if( flag )
		{
			break;
		}

		flag = MoveLineWork( &EceWork->line, 1, 1 );
	}

	EceWork->line.y1 -= 8;

	if( EceWork->line.y1 <= 0 )
	{
		EceWork->line.x1 = 0;								// èIì_ x
		task->work[0]++;
	}
	else
	{
		while( EceWork->line.y0 > EceWork->line.y1 )
			LasterBuffer[0][--(EceWork->line.y0)] = (x0 << 8) | x1; 
	}

	EceWork->vblank_trans_sw++;
	return( 0 );
}

//------------------------------------------
//	LineWindow 5
//------------------------------------------
static u8 EcLineWindow5( TASK_TABLE *task )
{
	s16 x0,x1;
	
	EceWork->vblank_trans_sw = 0;
	SetLineWork( &EceWork->line, 120, 80, EceWork->line.x1, 0, 1, 1 );

	do
	{
		x0 = 120;
		x1 = EceWork->line.x0;

		if( x1 >= 120 )
		{
			x0 = 0;
			x1 = 240;
		}

		LasterBuffer[0][EceWork->line.y0] = (x0 << 8) | x1;
	}while(	MoveLineWork(&EceWork->line,1,1) == 0 );

	EceWork->line.x1 += 16;

	if( EceWork->line.x0 > 120 )
	{
		task->work[0]++;
	}

	EceWork->vblank_trans_sw++;
	return( 0 );
}

//------------------------------------------
//	LineWindow 6
//------------------------------------------
static u8 EcLineWindow6( TASK_TABLE *task )
{
	DmaStop( 0 );
	SetPaletteBlack();
	DelTask( CheckTaskNo(EcEffectLineWindow) );

	return( 0 );
}

//------------------------------------------
//	LineWindow V Blank
//------------------------------------------
static void EcLineWindowVBlank( void )
{
	DmaStop( 0 );
	EcVBlankMain();

	if( EceWork->vblank_trans_sw )
	{
		DmaCopy( 3, LasterBuffer[0], LasterBuffer[1], 160*2, 16 );
	}

	*(vu16*)REG_WININ = EceWork->reg_winin;
	*(vu16*)REG_WINOUT = EceWork->reg_winout;
	*(vu16*)REG_WIN0V = EceWork->reg_win0_v;
	*(vu16*)REG_WIN0H = LasterBuffer[1][0];

	DmaSet( 0,											// H DMA æØƒ
		LasterBuffer[1],
		(vu16*)REG_WIN0H,
		DMA_ENABLE |									// DMA ãñâ¬
		DMA_TIMMING_H_BLANK |							// H DMA
		DMA_16BIT_BUS |									// 16bitì]ëó
		DMA_CONTINUOUS_ON |								// ñàâÒ
		DMA_SRC_INC |									// ì]ëóå≥≤›∏ÿ“›ƒ
		DMA_DEST_FIX | 									// ì]ëóêÊÇªÇÃÇ‹Ç‹
		1 );											// 1ìxÇ…1âÒ
}

//======================================================================
//		¥Ã™∏ƒ îgÇ§ÇÀÇË
//======================================================================
static u8 EcSwell0( TASK_TABLE * );
static u8 EcSwell1( TASK_TABLE * );
static void EcSwellVBlank( void );
static void EcSwellHBlank( void );

//------------------------------------------
//	èàóù√∞ÃﬁŸ
//------------------------------------------
static u8 (* const EcSwellTbl[])( TASK_TABLE * ) =
{
	EcSwell0,
	EcSwell1,
};

//------------------------------------------
//	¥Ã™∏ƒ¿Ω∏ îgÇ§ÇÀÇË
//------------------------------------------
static void EcEffectSwell( u8 no )
{
	while( EcSwellTbl[TaskTable[no].work[0]](&TaskTable[no]) );
}

//------------------------------------------
//	Swell 0
//------------------------------------------
static u8 EcSwell0( TASK_TABLE *task )
{
	u8 i;
	
	InitEceWork();
	LasterWorkInit();
	for( i = 0; i < 160; LasterBuffer[1][i] = EceWork->my, i++ );
	SetVBlankFunc( EcSwellVBlank );
	SetHBlankFunc( EcSwellHBlank );
	*(vu16*)REG_IE |= H_BLANK_INTR_FLAG;
	*(vu16*)REG_STAT |= STAT_H_BLANK_IF_ENABLE;

	task->work[0]++;
	return( 1 );
}

//------------------------------------------
//	Swell 1
//------------------------------------------
static u8 EcSwell1( TASK_TABLE *task )
{
	u8 i;
	u16 s_ang,a_ang,ang,rad;

	EceWork->vblank_trans_sw = 0;

	rad = task->work[2] >> 8;
	s_ang = task->work[1];
	a_ang = 0x0180;
	task->work[1] += 0x0400;

	if( task->work[2] < 0x2000 )
	{
		task->work[2] += 0x0180;
	}

	for( i = 0; i < 160; i++, s_ang += a_ang )
	{
		ang = (s_ang >> 8);
		LasterBuffer[0][i] = EceWork->my + SinMove( ang & 0xff, rad );
	}

	if( task->work[3]++ == 80 )
	{
		task->work[4]++;
		PaletteFadeReq( 0xffffffff, -2, 0, 16, 0 );
	}

	if( task->work[4] && FadeData.fade_sw == 0 )
	{
		DelTask( CheckTaskNo(EcEffectSwell) );
	}

	EceWork->vblank_trans_sw++;
	return( 0 );
}

//------------------------------------------
//	Swell V Blank
//------------------------------------------
static void EcSwellVBlank( void )
{
	EcVBlankMain();

	if( EceWork->vblank_trans_sw )
	{
		DmaCopy( 3, LasterBuffer[0], LasterBuffer[1], 160*2, 16 );
	}
}

//------------------------------------------
//	Swell H Blank
//------------------------------------------
static void EcSwellHBlank( void )
{
	u16 buf;
	
	buf = LasterBuffer[1][(*(vu16*)REG_VCOUNT)];
	*(vu16*)REG_BG1VOFS = buf;
	*(vu16*)REG_BG2VOFS = buf;
	*(vu16*)REG_BG3VOFS = buf;
}

//======================================================================
//		¥Ã™∏ƒ ∂∞√›
//======================================================================
static u8 EcCurtain0( TASK_TABLE * );
static u8 EcCurtain1( TASK_TABLE * );
static u8 EcCurtain2( TASK_TABLE * );
static void EcCurtainVBlank( void );

//------------------------------------------
//	èàóù√∞ÃﬁŸ
//------------------------------------------
static u8 (* const EcCurtainTbl[])( TASK_TABLE * ) =
{
	EcCurtain0,
	EcCurtain1,
	EcCurtain2,
};

//------------------------------------------
//	¥Ã™∏ƒ¿Ω∏ ∂∞√›
//------------------------------------------
static void EcEffectCurtain( u8 no )
{
	while( EcCurtainTbl[TaskTable[no].work[0]](&TaskTable[no]) );
}

//------------------------------------------
//	∂∞√› 0
//------------------------------------------
static u8 EcCurtain0( TASK_TABLE *task )
{
	u8 i;

	InitEceWork();
	LasterWorkInit();
	
	EceWork->reg_winin = WIN_ALL_ON;
	EceWork->reg_winout = 0;
	EceWork->reg_win0_h = (0 << 8) | 240;
	EceWork->reg_win0_v = (0 << 8) | 160;
	for( i = 0; i < 160; LasterBuffer[1][i] = (0<<8)|242, i++ );
	SetVBlankFunc( EcCurtainVBlank );

	task->work[0]++;
	return( 1 );
}

//------------------------------------------
//	∂∞√› 1
//------------------------------------------
static u8 EcCurtain1( TASK_TABLE *task )
{
	u8 i,rad,flag;
	s16 x;
	u16 *buf;

	EceWork->vblank_trans_sw = 0;
	buf = &LasterBuffer[0][0];
	rad = task->work[2];
	task->work[2] += 16;
	task->work[1] += 8;

	for( i = 0, flag = 1; i < 160; i++, rad += 4, buf++ )
	{
		x = task->work[1] + SinMove( rad, 40 );
		if( x < 0 ) x = 0;
		if( x > 240 ) x = 240;

		*buf = (x << 8) | 241;
		if( x < 240 ) flag = 0;
	}

	if( flag )
	{
		task->work[0]++;
	}

	EceWork->vblank_trans_sw++;
	return( 0 );
}

//------------------------------------------
//	∂∞√› 2
//------------------------------------------
static u8 EcCurtain2( TASK_TABLE *task )
{
	DmaStop( 0 );
	SetPaletteBlack();
	DelTask( CheckTaskNo(EcEffectCurtain) );

	return( 0 );
}

//------------------------------------------
//	∂∞√› V Blank
//------------------------------------------
static void EcCurtainVBlank( void )
{
	DmaStop( 0 );
	EcVBlankMain();

	if( EceWork->vblank_trans_sw )
	{
		DmaCopy( 3, LasterBuffer[0], LasterBuffer[1], 160*2, 16 );
	}

	*(vu16*)REG_WININ = EceWork->reg_winin;
	*(vu16*)REG_WINOUT = EceWork->reg_winout;
	*(vu16*)REG_WIN0V = EceWork->reg_win0_v;
//	*(vu16*)REG_WIN0H = EceWork->reg_win0_h;
//	*(vu16*)REG_WIN0H = LasterBuffer[1][0];

	DmaSet( 0,											// H DMA æØƒ
		LasterBuffer[1],
		(vu16*)REG_WIN0H,
		DMA_ENABLE |									// DMA ãñâ¬
		DMA_TIMMING_H_BLANK |							// H DMA
		DMA_16BIT_BUS |									// 16bitì]ëó
		DMA_CONTINUOUS_ON |								// ñàâÒ
		DMA_SRC_INC |									// ì]ëóå≥≤›∏ÿ“›ƒ
		DMA_DEST_FIX | 									// ì]ëóêÊÇªÇÃÇ‹Ç‹
		1 );											// 1ìxÇ…1âÒ
}

//======================================================================
//		¥Ã™∏ƒ ∂Øƒ≤›
//======================================================================
static void EcEffectCutin( u8 );
static u8 EcCutin0( TASK_TABLE * );
static u8 EcCutin1( TASK_TABLE * );
static u8 EcCutin2( TASK_TABLE * );
static u8 EcCutin3( TASK_TABLE * );
static u8 EcCutin4( TASK_TABLE * );
static u8 EcCutin5( TASK_TABLE * );
static u8 EcCutin6( TASK_TABLE * );
static u8 EcCutin7( TASK_TABLE * );
static u8 EcCutin8( TASK_TABLE * );
static u8 EcCutin9( TASK_TABLE * );
static void EcCutinVBlankWindow( void );
static void EcCutinVBlankBlend( void );
static void EcCutinHBlank( void );
static void SetEcCutinTrainerActor( TASK_TABLE * );
static u8 EcCutinTrainer0( actWork * );
static u8 EcCutinTrainer1( actWork * );
static u8 EcCutinTrainer2( actWork * );
static u8 EcCutinTrainer3( actWork * );
static u8 EcCutinTrainer5( actWork * );
static void SetCutinTrainerSite( s16, s16 );
static void SetCutinTrainerMove( s16 );
static s16 CheckCutinTrainerMove( s16 );

//------------------------------------------
//	¥Ã™∏ƒ¿Ω∏ ∂πﬁ¬
//------------------------------------------
static void EcEffectPmlgKagetu( u8 no )
{
	TaskTable[no].work[15] = PMLG_TRID_KAGETU;
	EcEffectCutin( no );
}

//------------------------------------------
//	¥Ã™∏ƒ¿Ω∏ Ã÷≥
//------------------------------------------
static void EcEffectPmlgFuyou( u8 no )
{
	TaskTable[no].work[15] = PMLG_TRID_FUYOU;
	EcEffectCutin( no );
}

//------------------------------------------
//	¥Ã™∏ƒ¿Ω∏ Ãﬂÿ—
//------------------------------------------
static void EcEffectPmlgPurimu( u8 no )
{
	TaskTable[no].work[15] = PMLG_TRID_PURIMU;
	EcEffectCutin( no );
}

//------------------------------------------
//	¥Ã™∏ƒ¿Ω∏ ÉQÉìÉW
//------------------------------------------
static void	EcEffectPmlgGenji( u8 no )
{
	TaskTable[no].work[15] = PMLG_TRID_GENJI;
	EcEffectCutin( no );
}

//------------------------------------------
//	¥Ã™∏ƒ¿Ω∏ ¡¨›Àﬂµ›
//------------------------------------------
static void EcEffectPmlgChamp( u8 no )
{
	TaskTable[no].work[15] = PMLG_TRID_CHAMP;
	EcEffectCutin( no );
}

//------------------------------------------
//	èàóù√∞ÃﬁŸ
//------------------------------------------
static u8 (* const EcCutinTbl[])( TASK_TABLE * ) =
{
	EcCutin0,
	EcCutin1,
	EcCutin2,
	EcCutin3,
	EcCutin4,
	EcCutin5,
	EcCutin6,
	EcCutin7,
	EcCutin8,
	EcCutin9,
};

//------------------------------------------
//	¥Ã™∏ƒ¿Ω∏ ∂Øƒ≤›
//------------------------------------------
static void EcEffectCutin( u8 no )
{
	while( EcCutinTbl[TaskTable[no].work[0]](&TaskTable[no]) );
}

//------------------------------------------
//	∂Øƒ≤› 0
//------------------------------------------
static u8 EcCutin0( TASK_TABLE *task )
{
	u8 i;
	
	InitEceWork();
	LasterWorkInit();
	SetEcCutinTrainerActor( task );
	task->work[1] = 0;									// äpìx
	task->work[2] = 1;									// ≥®›ƒﬁ≥X0 µÃæØƒ
	task->work[3] = 239;								// ≥®›ƒﬁ≥X1 µÃæØƒ
	EceWork->reg_winin = WIN_ALL_ON;
	EceWork->reg_winout = WIN_ALL_ON ^ WIN_BG0_ON;
	EceWork->reg_win0_v = (0 << 8) | 160;
	for( i = 0; i < 160; LasterBuffer[1][i] = (240<<8)|241, i++ );
	SetVBlankFunc( EcCutinVBlankWindow );

	task->work[0]++;
	return( 0 );
}

//------------------------------------------
//	∂Øƒ≤› 1
//------------------------------------------
static u8 EcCutin1( TASK_TABLE *task )
{
	s16 x,y;
	u16 *bg_map,*bg_ch,*set_map;

	set_map = (u16*)eccutin0_Map;
	GetBG0MapChar( &bg_map, &bg_ch );
	CpuCopy( eccutin_bg_Character, bg_ch, 0x20*0x0f, 16 );
	PaletteWorkSet( eccutin_bg_PaletteTbl[task->work[15]], PA_BG15, 0x20 );
	PaletteWorkSet( eccutin_hero_bg_PaletteTbl[MyData.my_sex], PA_BG15+PA_COL10, 12 );

	for( y = 0; y < 0x14; y++ )
	{
		for( x = 0; x < 0x20; x++, set_map++ )
		{
			MAP_VRAM_SET( bg_map, x, y, BG_SCRN_DATA(*set_map,0,0,15) );
		}
	}

	*(vu16*)REG_IE |= H_BLANK_INTR_FLAG;
	*(vu16*)REG_STAT |= STAT_H_BLANK_IF_ENABLE;
	SetHBlankFunc( EcCutinHBlank );

	task->work[0]++;
	return( 0 );
}

//------------------------------------------
//	∂Øƒ≤› 2
//------------------------------------------
static u8 EcCutin2( TASK_TABLE *task )
{
	u8 i,r;
	s16 x;
	u16 *buf;

	EceWork->vblank_trans_sw = 0;

	buf = &LasterBuffer[0][0];
	r = task->work[1];
	task->work[1] += 16;

	for( i = 0; i < 80; i++, buf++, r += 16 )
	{
		x = task->work[2] + SinMove( r, 16 );
		if( x < 0 ) x = 1;
		if( x > 240 ) x = 240;

		*buf = (0 << 8) | x;
	}

	for( ; i < 160; i++, buf++, r += 16 )
	{
		x = task->work[3] - SinMove( r, 16 );
		if( x < 0 ) x = 0;
		if( x >= 240 ) x = 239;

		*buf = (x << 8) | 240;
	}

	task->work[2] += 8;
	task->work[3] -= 8;
	if( task->work[2] > 240 ) task->work[2] = 240;
	if( task->work[3] < 0 ) task->work[3] = 0;

	if( task->work[2] == 240 && task->work[3] == 0 )
	{
		task->work[0]++;
	}

	EceWork->bgx0 -= 8;
	EceWork->bgx1 += 8;
	EceWork->vblank_trans_sw++;
	return( 0 );
}

//------------------------------------------
//	∂Øƒ≤› 3
//------------------------------------------
static u8 EcCutin3( TASK_TABLE *task )
{
	u8 i;
	u16 *buf;

	EceWork->vblank_trans_sw = 0;

	buf = &LasterBuffer[0][0];
	for( i = 0; i < 160; *buf = (0<<8)|240, i++, buf++ );

	task->work[0]++;
	task->work[1] = 0;
	task->work[2] = 0;
	task->work[3] = 0;
	EceWork->bgx0 -= 8;
	EceWork->bgx1 += 8;

	SetCutinTrainerSite( task->work[13], 0 );
	SetCutinTrainerSite( task->work[14], 1 );
	SetCutinTrainerMove( task->work[13] );

	SePlay( SE_BT_START );

	EceWork->vblank_trans_sw++;
	return( 0 );
}

//------------------------------------------
//	∂Øƒ≤› 4
//------------------------------------------
static u8 EcCutin4( TASK_TABLE *task )
{
	EceWork->bgx0 -= 8;
	EceWork->bgx1 += 8;

	if( CheckCutinTrainerMove(task->work[13]) )				// ƒ⁄∞≈∞
	{
		task->work[0]++;
		SetCutinTrainerMove( task->work[14] );
	}

	return( 0 );
}

//------------------------------------------
//	∂Øƒ≤› 5
//------------------------------------------
static u8 EcCutin5( TASK_TABLE *task )
{
	EceWork->bgx0 -= 8;
	EceWork->bgx1 += 8;

	if( CheckCutinTrainerMove(task->work[14]) )				// é©ã@
	{
		EceWork->vblank_trans_sw = 0;
		SetVBlankFunc( NULL );
		DmaStop( 0 );
		memset( (u8*)LasterBuffer[0], 0, 320 );
		memset( (u8*)LasterBuffer[1], 0, 320 );
		*(vu16*)REG_WIN0H = (0 << 8) | 240;					// ≥®›ƒﬁ≥å≈íË
		*(vu16*)REG_BLDY = 0;								// åWêî∏ÿ±
		task->work[0]++;
		task->work[3] = 0;									// ∂≥›ƒ
		task->work[4] = 0;									// à íu
		EceWork->reg_bldcnt = BLD_1ST_ALL | BLD_UP_MODE;	// Ãﬁ⁄›ƒﬁæØƒ
		SetVBlankFunc( EcCutinVBlankBlend );
	}

	return( 0 );
}

//------------------------------------------
//	∂Øƒ≤› 6
//------------------------------------------
static u8 EcCutin6( TASK_TABLE *task )
{
	s16 i,pos0,pos1,flag;

	EceWork->vblank_trans_sw = 0;

	flag = 1;
	EceWork->bgx0 -= 8;
	EceWork->bgx1 += 8;
	if( task->work[4] < 80 ) task->work[4] += 2;
	if( task->work[4] > 80 ) task->work[4] = 80;

	if( (++task->work[3] & 0x01) )
	{
		for( i = 0, flag = 0; i <= task->work[4]; i++ )
		{
			pos0 = 80 - i;
			pos1 = 80 + i;

			if( LasterBuffer[0][pos0] < 16 )
			{
				flag = 1;
				LasterBuffer[0][pos0]++;
			}
	
			if( LasterBuffer[0][pos1] < 16 )
			{
				flag = 1;
				LasterBuffer[0][pos1]++;
			}
		}
	}

	if( task->work[4] == 80 && flag == 0 )
	{
		task->work[0]++;
	}

	EceWork->vblank_trans_sw++;
	return( 0 );
}

//------------------------------------------
//	∂Øƒ≤› 7
//------------------------------------------
static u8 EcCutin7( TASK_TABLE *task )
{
	EceWork->vblank_trans_sw = 0;
	ColorConceChange( 0xffffffff, 16, 0x7fff );			// îíÇ÷
	EceWork->reg_bldcnt = BLD_1ST_ALL | BLD_DOWN_MODE;	// ãPìx¿ﬁ≥›
	task->work[3] = 0;									// ãPìx
	task->work[0]++;

	return( 1 );
}

//------------------------------------------
//	∂Øƒ≤› 8
//------------------------------------------
static u8 EcCutin8( TASK_TABLE *task )
{
	EceWork->vblank_trans_sw = 0;

	task->work[3]++;
	memset( (u8*)LasterBuffer[0], task->work[3], 320 );

	if( task->work[3] >= 16 )
	{
		task->work[0]++;
	}

	EceWork->vblank_trans_sw++;
	return( 0 );
}

//------------------------------------------
//	∂Øƒ≤› 9
//------------------------------------------
static u8 EcCutin9( TASK_TABLE *task )
{
	DmaStop( 0 );
	SetPaletteBlack();
	DelTask( CheckTaskNo(task->TaskAdrs) );

	return( 0 );
}

//------------------------------------------
//	∂Øƒ≤› V Blank ≥®›ƒﬁ≥
//------------------------------------------
static void EcCutinVBlankWindow( void )
{
	DmaStop( 0 );
	EcVBlankMain();

	if( EceWork->vblank_trans_sw )
	{
		DmaCopy( 3, LasterBuffer[0], LasterBuffer[1], 160*2, 16 );
	}

	*(vu16*)REG_BG0VOFS = EceWork->bgy0;
	*(vu16*)REG_WININ = EceWork->reg_winin;
	*(vu16*)REG_WINOUT = EceWork->reg_winout;
	*(vu16*)REG_WIN0V = EceWork->reg_win0_v;

	DmaSet( 0,											// H DMA æØƒ
		LasterBuffer[1],
		(vu16*)REG_WIN0H,
		DMA_ENABLE |									// DMA ãñâ¬
		DMA_TIMMING_H_BLANK |							// H DMA
		DMA_16BIT_BUS |									// 16bitì]ëó
		DMA_CONTINUOUS_ON |								// ñàâÒ
		DMA_SRC_INC |									// ì]ëóå≥≤›∏ÿ“›ƒ
		DMA_DEST_FIX | 									// ì]ëóêÊÇªÇÃÇ‹Ç‹
		1 );											// 1ìxÇ…1âÒ
}

//------------------------------------------
//	∂Øƒ≤› V Blank Ãﬁ⁄›ƒﬁ
//------------------------------------------
static void EcCutinVBlankBlend( void )
{
	DmaStop( 0 );
	EcVBlankMain();

	if( EceWork->vblank_trans_sw )
	{
		DmaCopy( 3, LasterBuffer[0], LasterBuffer[1], 160*2, 16 );
	}

	*(vu16*)REG_BLDCNT = EceWork->reg_bldcnt;

	DmaSet( 0,											// H DMA æØƒ
		LasterBuffer[1],
		(vu16*)REG_BLDY,
		DMA_ENABLE |									// DMA ãñâ¬
		DMA_TIMMING_H_BLANK |							// H DMA
		DMA_16BIT_BUS |									// 16bitì]ëó
		DMA_CONTINUOUS_ON |								// ñàâÒ
		DMA_SRC_INC |									// ì]ëóå≥≤›∏ÿ“›ƒ
		DMA_DEST_FIX | 									// ì]ëóêÊÇªÇÃÇ‹Ç‹
		1 );											// 1ìxÇ…1âÒ
}

//------------------------------------------
//	∂Øƒ≤› H Blank
//------------------------------------------
static void EcCutinHBlank( void )
{
	if( *(vu16*)REG_VCOUNT < 80 )
	{
		*(vu16 *)REG_BG0HOFS = EceWork->bgx0;
	}
	else
	{
		*(vu16 *)REG_BG0HOFS = EceWork->bgx1;
	}
}

//------------------------------------------
//	ƒ⁄∞≈∞∑¨◊ID,ägëÂó¶
//------------------------------------------
static const u8 PmlgTrainerID[] =
{
	CELLID_gl3_009,
	CELLID_gl3_010,
	CELLID_gl3_011,
	CELLID_gl3_012,
	CELLID_tr3_031,
};

static const s16 PmlgTrainerAffine[][2] =
{
	{ 0x0200, 0x0200 },
	{ 0x0200, 0x0200 },
	{ 0x01b0, 0x01b0 },
	{ 0x01a0, 0x01a0 },
	{ 0x0188, 0x0188 },
};

static const s16 PmlgTrainerOffset[][2] =
{
	{ 0, 0 },
	{ 0, 0 },
	{ -4, 4 },
	{ 0, 5 },
	{ 0, 7 }
};

//------------------------------------------
//	ƒ⁄∞≈∞±∏¿∞í«â¡
//------------------------------------------
static void SetEcCutinTrainerActor( TASK_TABLE *task )
{
	s16 id;
	actWork *h_act,*t_act;

	id = task->work[15];
	task->work[13] = SetStandTrainerActor( PmlgTrainerID[id],
		-32+PmlgTrainerOffset[id][0], 42+PmlgTrainerOffset[id][1], 0, ECE_DECORD_WORK_ADRS );
	task->work[14] = SetStandTrainerActor(
		MyData.my_sex, 272, 106, 0, ECE_DECORD_WORK_ADRS );

	t_act = &ActWork[task->work[13]];
	h_act = &ActWork[task->work[14]];
	t_act->move = EcCutinTrainerActMove;
	h_act->move = EcCutinTrainerActMove;
	t_act->oamData.AffineMode = 3;
	h_act->oamData.AffineMode = 3;
	t_act->oamData.AffineParamNo = AffineWorkNumGet();
	h_act->oamData.AffineParamNo = AffineWorkNumGet();
	t_act->oamData.Shape = 1;
	h_act->oamData.Shape = 1;
	t_act->oamData.Size = 3;
	h_act->oamData.Size = 3;
	actCenterCalc( t_act, 1, 3, 3 );
	actCenterCalc( h_act, 1, 3, 3 );
	OBJ_AffineWorkCalc( t_act->oamData.AffineParamNo,
		PmlgTrainerAffine[id][0], PmlgTrainerAffine[id][1], 0 );
	OBJ_AffineWorkCalc( h_act->oamData.AffineParamNo, -0x0200, 0x0200, 0 );
}

//------------------------------------------
//	ƒ⁄∞≈∞±∏¿∞èàóù√∞ÃﬁŸ
//------------------------------------------
static u8 (* const EcCutinTrainerMoveTbl[])( actWork * ) =
{
	EcCutinTrainer0,
	EcCutinTrainer1,
	EcCutinTrainer2,
	EcCutinTrainer3,
	EcCutinTrainer0,
	EcCutinTrainer5,
	EcCutinTrainer0,
};

//------------------------------------------
//	ƒ⁄∞≈∞±∏¿∞ìÆçÏ
//------------------------------------------
static void EcCutinTrainerActMove( actWork *act )
{
	while( EcCutinTrainerMoveTbl[act->work[0]](act) );
}

//------------------------------------------
//	ƒ⁄∞≈∞±∏¿∞ 0
//------------------------------------------
static u8 EcCutinTrainer0( actWork *act )
{
	return( 0 );
}

//------------------------------------------
//	ƒ⁄∞≈∞±∏¿∞ 1
//------------------------------------------
static u8 EcCutinTrainer1( actWork *act )
{
	s16 x[] = { 12, -12 };
	s16 off[] = { -1, 1 };

	act->work[0]++;
	act->work[1] = x[act->work[7]];
	act->work[2] = off[act->work[7]];

	return( 1 );
}

//------------------------------------------
//	ƒ⁄∞≈∞±∏¿∞ 2
//------------------------------------------
static u8 EcCutinTrainer2( actWork *act )
{
	act->x += act->work[1];

	if( act->work[7] )
	{
		if( act->x <= 132 ) act->work[0]++;
	}
	else
	{
		if( act->x >= 104 ) act->work[0]++;
	}
	
	return( 0 );
}

//------------------------------------------
//	ƒ⁄∞≈∞±∏¿∞ 3
//------------------------------------------
static u8 EcCutinTrainer3( actWork *act )
{
	act->work[1] += act->work[2];
	act->x += act->work[1];

	if( act->work[1] == 0 )
	{
		act->work[0]++;
		act->work[2] = -(act->work[2]);
		act->work[6] = 1;
	}

	return( 0 );
}

//------------------------------------------
//	ƒ⁄∞≈∞±∏¿- 5
//------------------------------------------
static u8 EcCutinTrainer5( actWork *act )
{
	act->work[1] += act->work[2];
	act->x += act->work[1];
	if( act->x <= -32 || act->x >= 272 ) act->work[0]++;
	
	return( 0 );
}

//------------------------------------------
//	ƒ⁄∞≈∞±∏¿∞ à⁄ìÆï˚å¸æØƒ
//------------------------------------------
static void SetCutinTrainerSite( s16 no, s16 flag )
{
	ActWork[no].work[7] = flag;
}

//------------------------------------------
//	ƒ⁄∞≈∞±∏¿∞ à⁄ìÆæØƒ
//------------------------------------------
static void SetCutinTrainerMove( s16 no )
{
	ActWork[no].work[0]++;
}

//------------------------------------------
//	ƒ⁄∞≈∞±∏¿- à⁄ìÆ¡™Ø∏
//------------------------------------------
static s16 CheckCutinTrainerMove( s16 no )
{
	return( ActWork[no].work[6] );
}

//======================================================================
//		¥Ã™∏ƒ BGºÃƒ
//======================================================================
static u8 EcBGShift0( TASK_TABLE * );
static u8 EcBGShift1( TASK_TABLE * );
static u8 EcBGShift2( TASK_TABLE * );
static void EcBGShiftVBlank( void );
static void EcBGShiftHBlank( void );

//------------------------------------------
//	èàóù√∞ÃﬁŸ
//------------------------------------------
static u8 (* const EcBGShiftTbl[])( TASK_TABLE * ) =
{
	EcBGShift0,
	EcBGShift1,
	EcBGShift2,
};

//------------------------------------------
//	¥Ã™∏ƒ¿Ω∏ BGºÃƒ
//------------------------------------------
static void EcEffectBGShift( u8 no )
{
	while( EcBGShiftTbl[TaskTable[no].work[0]](&TaskTable[no]) );
}

//------------------------------------------
//	BGºÃƒ 0
//------------------------------------------
static u8 EcBGShift0( TASK_TABLE *task )
{
	u16 i;

	InitEceWork();
	LasterWorkInit();
	
	task->work[2] = 0x0100;								// â¡ë¨ìx
	task->work[3] = 0x0001;
	EceWork->reg_winin = WIN_ALL_ON;
	EceWork->reg_winout = 0;
	EceWork->reg_win0_v = (0 << 8) | 160;

	for( i = 0; i < 160; LasterBuffer[1][i] = EceWork->mx,
					LasterBuffer[1][160+i] = (0<<8)|240, i++ );

	*(vu16*)REG_IE |= H_BLANK_INTR_FLAG;
	*(vu16*)REG_STAT |= STAT_H_BLANK_IF_ENABLE;
	SetVBlankFunc( EcBGShiftVBlank );
	SetHBlankFunc( EcBGShiftHBlank );

	task->work[0]++;
	return( 1 );
}

//------------------------------------------
//	BGºÃƒ 1
//------------------------------------------
static u8 EcBGShift1( TASK_TABLE *task )
{
	u16 i;
	u16 *bgbuf,*winbuf;

	EceWork->vblank_trans_sw = 0;

	task->work[1] += task->work[2] >> 8;
	if( task->work[1] > 240 ) task->work[1] = 240;
	if( task->work[2] < 0x1000 ) task->work[2] += task->work[3];
	if( task->work[3] < 0x0080 ) task->work[3] <<= 1;

	for( i = 0; i < 160; i++ )
	{
		bgbuf = &LasterBuffer[0][i];
		winbuf = &LasterBuffer[0][160+i];

		if( i & 0x01 )
		{
			*bgbuf = EceWork->mx + task->work[1];
			*winbuf = (0 << 8) | (240 - task->work[1]);
		}
		else
		{
			*bgbuf = EceWork->mx - task->work[1];
			*winbuf = (task->work[1] << 8) | 241;
		}
	}

	if( task->work[1] >= 240 )
	{
		task->work[0]++;
	}

	EceWork->vblank_trans_sw++;
	return( 0 );
}

//------------------------------------------
//	BGºÃƒ 2
//------------------------------------------
static u8 EcBGShift2( TASK_TABLE *task )
{
	DmaStop( 0 );
	SetPaletteBlack();
	DelTask( CheckTaskNo(EcEffectBGShift) );

	return( 0 );
}

//------------------------------------------
//	BGºÃƒ V Blank
//------------------------------------------
static void EcBGShiftVBlank( void )
{
	DmaStop( 0 );
	EcVBlankMain();

	*(vu16*)REG_WININ = EceWork->reg_winin;
	*(vu16*)REG_WINOUT = EceWork->reg_winout;
	*(vu16*)REG_WIN0V = EceWork->reg_win0_v;

	if( EceWork->vblank_trans_sw )
	{
		DmaCopy( 3, LasterBuffer[0], LasterBuffer[1], 320*2, 16 );
	}

	DmaSet( 0,											// H DMA æØƒ
		&LasterBuffer[1][160],
		(vu16*)REG_WIN0H,
		DMA_ENABLE |									// DMA ãñâ¬
		DMA_TIMMING_H_BLANK |							// H DMA
		DMA_16BIT_BUS |									// 16bitì]ëó
		DMA_CONTINUOUS_ON |								// ñàâÒ
		DMA_SRC_INC |									// ì]ëóå≥≤›∏ÿ“›ƒ
		DMA_DEST_FIX | 									// ì]ëóêÊÇªÇÃÇ‹Ç‹
		1 );											// 1ìxÇ…1âÒ
}

//------------------------------------------
//	BGºÃƒ H Blank
//------------------------------------------
static void EcBGShiftHBlank( void )
{
	u16 buf;
	
	buf = LasterBuffer[1][*(vu16*)REG_VCOUNT];
	*(vu16*)REG_BG1HOFS = buf;
	*(vu16*)REG_BG2HOFS = buf;
	*(vu16*)REG_BG3HOFS = buf;
}

//======================================================================
//		¥Ã™∏ƒ Œ‹≤ƒ◊≤›
//======================================================================
static u8 EcWhiteLine0( TASK_TABLE * );
static u8 EcWhiteLine1( TASK_TABLE * );
static u8 EcWhiteLine2( TASK_TABLE * );
static u8 EcWhiteLine3( TASK_TABLE * );
static u8 EcWhiteLine4( TASK_TABLE * );
static void EcWhiteLineVBlank0( void );
static void EcWhiteLineVBlank1( void );
static void EcWhiteLineHBlank( void );
static void EcWhiteLineActMove( actWork * );

//------------------------------------------
//	èàóù√∞ÃﬁŸ
//------------------------------------------
static u8 (* const EcWhiteLineTbl[])( TASK_TABLE * ) =
{
	EcWhiteLine0,
	EcWhiteLine1,
	EcWhiteLine2,
	EcWhiteLine3,
	EcWhiteLine4,
};

//------------------------------------------
//	¥Ã™∏ƒ¿Ω∏ Œ‹≤ƒ◊≤›
//------------------------------------------
static void EcEffectWhiteLine( u8 no )
{
	while( EcWhiteLineTbl[TaskTable[no].work[0]](&TaskTable[no]) );
}

//------------------------------------------
//	Œ‹≤ƒ◊≤› 0
//------------------------------------------
static u8 EcWhiteLine0( TASK_TABLE *task )
{
	u16 i;

	InitEceWork();
	LasterWorkInit();
	EceWork->reg_bldcnt = BLD_UP_MODE | BLD_ALL;
	EceWork->reg_bldy = 0;
	EceWork->reg_winin = WIN_BG1_ON | WIN_BG2_ON | WIN_BG3_ON | WIN_OBJ_ON;
	EceWork->reg_winout = WIN_ALL_ON;
	EceWork->reg_win0_v = (0 << 8) | 160;
	
	for( i = 0; i < 160; LasterBuffer[1][i] = 0,
			LasterBuffer[1][160+i] = (0<<8)|240, i++ );

	*(vu16*)REG_IE |= H_BLANK_INTR_FLAG;
	*(vu16*)REG_STAT |= STAT_H_BLANK_IF_ENABLE;
	SetHBlankFunc( EcWhiteLineHBlank );
	SetVBlankFunc( EcWhiteLineVBlank0 );

	task->work[0]++;
	return( 0 );
}

//------------------------------------------
//	Œ‹≤ƒ◊≤› 1
//------------------------------------------
static u8 EcWhiteLine1( TASK_TABLE *task )
{
	u8 no;
	s16 i,y;
	actWork *act;
	s16 count[8] = { 0, 20, 15, 40, 10, 25, 35, 5 };

	for( i = 0, y = 0; i < 8; i++, y += 20 )
	{
		no = AddDummyActor( EcWhiteLineActMove );
		act = &ActWork[no];
		act->x = 240;
		act->y = y;
		act->work[5] = count[i];
	}

	act->work[6]++;										// ç≈å„ÇÃ±∏¿∞ì]ëóÃ◊∏ﬁëÄçÏ

	task->work[0]++;
	return( 0 );
}

//------------------------------------------
//	Œ‹≤ƒ◊≤› 2
//------------------------------------------
static u8 EcWhiteLine2( TASK_TABLE *task )
{
	EceWork->vblank_trans_sw = 0;						// ±∏¿∞Ç≈ON

	if( EceWork->work >= 8 )
	{
		ColorConceChange( 0xffffffff, 16, 0x7fff );		// îíÇ÷
		task->work[0]++;
	}

	return( 0 );
}

//------------------------------------------
//	Œ‹≤ƒ◊≤› 3
//------------------------------------------
static u8 EcWhiteLine3( TASK_TABLE *task )
{
	EceWork->vblank_trans_sw = 0;

	DmaStop( 0 );
	SetVBlankFunc( NULL );
	SetHBlankFunc( NULL );

	EceWork->reg_win0_h = (0 << 8) | 240;
	EceWork->reg_bldy = 0;
	EceWork->reg_bldcnt = BLD_DOWN_MODE | BLD_ALL;
	EceWork->reg_winin = WIN_ALL_ON;
	SetVBlankFunc( EcWhiteLineVBlank1 );

	task->work[0]++;
	return( 0 );
}

//------------------------------------------
//	Œ‹≤ƒ◊≤› 4
//------------------------------------------
static u8 EcWhiteLine4( TASK_TABLE *task )
{
	EceWork->reg_bldy++;
	
	if( EceWork->reg_bldy > 16 )
	{
		SetPaletteBlack();
		DelTask( CheckTaskNo(EcEffectWhiteLine) );
	}

	return( 0 );
}

//------------------------------------------
//	Œ‹≤ƒ◊≤› V Blank
//------------------------------------------
static void EcWhiteLineVBlank0( void )
{
	DmaStop( 0 );
	EcVBlankMain();

	*(vu16*)REG_BLDCNT = EceWork->reg_bldcnt;
	*(vu16*)REG_WININ = EceWork->reg_winin;
	*(vu16*)REG_WINOUT = EceWork->reg_winout;
	*(vu16*)REG_WIN0V = EceWork->reg_win0_h;

	if( EceWork->vblank_trans_sw )
	{
		DmaCopy( 3, LasterBuffer[0], LasterBuffer[1], 320*2, 16 );
	}

	DmaSet( 0,											// H DMA æØƒ
		&LasterBuffer[1][160],
		(vu16*)REG_WIN0H,
		DMA_ENABLE |									// DMA ãñâ¬
		DMA_TIMMING_H_BLANK |							// H DMA
		DMA_16BIT_BUS |									// 16bitì]ëó
		DMA_CONTINUOUS_ON |								// ñàâÒ
		DMA_SRC_INC |									// ì]ëóå≥≤›∏ÿ“›ƒ
		DMA_DEST_FIX | 									// ì]ëóêÊÇªÇÃÇ‹Ç‹
		1 );											// 1ìxÇ…1âÒ
}

//------------------------------------------
//	Œ‹≤ƒ◊≤› V Blank
//------------------------------------------
static void EcWhiteLineVBlank1( void )
{
	EcVBlankMain();
	
	*(vu16*)REG_BLDY = EceWork->reg_bldy;
	*(vu16*)REG_BLDCNT = EceWork->reg_bldcnt;
	*(vu16*)REG_WININ = EceWork->reg_winin;
	*(vu16*)REG_WINOUT = EceWork->reg_winout;
	*(vu16*)REG_WIN0H = EceWork->reg_win0_h;
	*(vu16*)REG_WIN0V = EceWork->reg_win0_v;
}

//------------------------------------------
//	Œ‹≤ƒ◊≤› H Blank
//------------------------------------------
static void EcWhiteLineHBlank( void )
{
	*(vu16*)REG_BLDY = LasterBuffer[1][*(vu16*)REG_VCOUNT];
}

//------------------------------------------
//	Œ‹≤ƒ◊≤›±∏¿∞ìÆçÏ
//------------------------------------------
static void EcWhiteLineActMove( actWork *act )
{
	u16 i;
	u16 *by,*wx;

	if( act->work[5] )									// ≥™≤ƒ
	{
		act->work[5]--;
		if( act->work[6] ) EceWork->vblank_trans_sw = 1;
		return;
	}

	by = &LasterBuffer[0][act->y];
	wx = &LasterBuffer[0][act->y+160];

	for( i = 0; i < 20; i++ )
	{
		by[i] = (act->work[0] >> 8);
		wx[i] = (0 << 8) | ((u8)act->x);
	}

	if( act->x == 0 && act->work[0] == 0x1000 )
	{
		act->work[1] = 1;
	}

	act->x -= 16;
	act->work[0] += 0x0080;
	if( act->x < 0 ) act->x = 0;
	if( act->work[0] > 0x1000 ) act->work[0] = 0x1000;

	if( act->work[6] )									// ì]ëóÃ◊∏ﬁëÄçÏÃ◊∏ﬁ
	{
		EceWork->vblank_trans_sw = 1;
	}

	if( act->work[1] )
	{
		if( act->work[6] )
		{
			if( EceWork->work < 7 ) return;				// 7◊≤›íBÇµÇƒÇ¢Ç»Ç¢
			if( act->work[2]++ < 8 ) return;			// ≥™≤ƒ
		}

		EceWork->work++;
		DelActor( act );
	}
}

//======================================================================
//		¥Ã™∏ƒ Ãﬁ◊Ø∏∫∞√®›∏ﬁ
//======================================================================
static u8 EcBlackCoating0( TASK_TABLE * );
static u8 EcBlackCoating1( TASK_TABLE * );
static u8 EcBlackCoating2( TASK_TABLE * );

//------------------------------------------
//	èàóù√∞ÃﬁŸ
//------------------------------------------
static u8 (* const EcBlackCoatingTbl[])( TASK_TABLE * ) =
{
	EcBlackCoating0,
	EcBlackCoating1,
	EcBlackCoating2,
};

//------------------------------------------
//	¥Ã™∏ƒ¿Ω∏ Ãﬁ◊Ø∏∫∞√®›∏ﬁ
//------------------------------------------
static void EcEffectBlackCoating( u8 no )
{
	while( EcBlackCoatingTbl[TaskTable[no].work[0]](&TaskTable[no]) );
}

//------------------------------------------
//	çï∫∞√®›∏ﬁ 0
//------------------------------------------
static u8 EcBlackCoating0( TASK_TABLE *task )
{
	u16 *map,*ch;
	
	GetBG0MapChar( &map, &ch );
	CpuCopy( &ecblack_Character[0], ch, 0x20, 16 );
	CpuClear( BG_SCRN_DATA(0,0,0,15), map, 0x0800, 16 );
	PaletteWorkSet( ecball_Palette, PA_BG15, 0x20 );
//	SetVBlankFunc( EcVBlankMain );

	task->work[0]++;
	return( 0 );
}

//------------------------------------------
//	çï∫∞√®›∏ﬁ 1
//------------------------------------------
static u8 EcBlackCoating1( TASK_TABLE *task )
{
	u16 *ch;

	if( task->work[1] == 0 )
	{
		GetBG0Char( &ch );
		task->work[1] = 3;								// 2 + 1
		task->work[2]++;
		CpuCopy( &ecblack_Character[task->work[2]<<5], ch, 0x20, 16 );

		if( task->work[2] >= 0x0e )
		{
			task->work[0]++;
			task->work[1] = 16;
		}
	}

	task->work[1]--;

	return( 0 );
}

//------------------------------------------
//	çï∫∞√®›∏ﬁ 2
//------------------------------------------
static u8 EcBlackCoating2( TASK_TABLE *task )
{
	task->work[1]--;
	
	if( task->work[1] == 0 )
	{
		SetPaletteBlack();
		DelTask( CheckTaskNo(EcEffectBlackCoating) );
	}
	
	return( 0 );
}

//======================================================================
//		¥Ã™∏ƒ âÊñ êÿÇË
//======================================================================
static u8 EcScreenCut0( TASK_TABLE * );
static u8 EcScreenCut1( TASK_TABLE * );
static u8 EcScreenCut2( TASK_TABLE * );
static u8 EcScreenCut3( TASK_TABLE * );
static u8 EcScreenCut4( TASK_TABLE * );
static void EcScreenCutVBlank( void );

//------------------------------------------
//	èàóù√∞ÃﬁŸ
//------------------------------------------
static u8 (* const EcScreenCutTbl[])( TASK_TABLE * ) =
{
	EcScreenCut0,
	EcScreenCut1,
	EcScreenCut2,
	EcScreenCut3,
	EcScreenCut4,
};

//------------------------------------------
//	¥Ã™∏ƒ¿Ω∏ âÊñ êÿÇË
//------------------------------------------
static void EcEffectScreenCut( u8 no )
{
	while( EcScreenCutTbl[TaskTable[no].work[0]](&TaskTable[no]) );
}

//------------------------------------------
//	âÊñ êÿÇË 0
//------------------------------------------
static u8 EcScreenCut0( TASK_TABLE *task )
{
	u16 i;

	InitEceWork();
	LasterWorkInit();
	EceWork->reg_winin = WIN_ALL_ON;
	EceWork->reg_winout = 0;
	EceWork->reg_win0_v = (0 << 8) | 160;
	for( i = 0; i < 160; LasterBuffer[0][i] = (0<<8)|240, i++ );
	CpuCopy( LasterBuffer[0], LasterBuffer[1], 160*2, 16 );
	SetVBlankFunc( EcScreenCutVBlank );

	task->work[0]++;
	return( 1 );
}

//------------------------------------------
//	âÊñ êÿÇË 1
//------------------------------------------
static const s16 cutpos[][5];

static u8 EcScreenCut1( TASK_TABLE *task )
{
	SetLineWork( &EceWork->line,
		cutpos[task->work[1]][0], cutpos[task->work[1]][1],
		cutpos[task->work[1]][2], cutpos[task->work[1]][3], 1, 1 );
	
	task->work[2] = cutpos[task->work[1]][4];

	task->work[0]++;
	return( 1 );
}

#if 0
#define CUT_MAX 9
static const s16 cutpos[][5] =
{
	{ 56, 0, 0, 160, 0 },
	{ 104, 160, 240, 88, 1 },
	{ 240, 72, 80, 0, 1 },
	{ 0, 32, 144, 160, 0 },
	{ 144, 160, 168, 0, 1 },
	{ 88, 0, 120, 160, 0 },
	{ 248, 160, 144, 0, 1 },
	{ 136, 0, 96, 160, 0 },
	{ 96, 160, 128, 0, 1 },
};
#endif

#define CUT_MAX 7

static const s16 cutpos[][5] =
{
	{ 56, 0, 0, 160, 0 },
	{ 104, 160, 240, 88, 1 },
	{ 240, 72, 56, 0, 1 },
	{ 0, 32, 144, 160, 0 },
	{ 144, 160, 184, 0, 1 },
	{ 56, 0, 168, 160, 0 },
	{ 168, 160, 48, 0, 1 },
};

static const s16 cutwait[] =
{ 8, 4, 2, 1, 1, 1 };
 
//------------------------------------------
//	âÊñ êÿÇË 2
//------------------------------------------
static u8 EcScreenCut2( TASK_TABLE *task )
{
	u8 flag;
	s16 wx0,wx1,i;

	EceWork->vblank_trans_sw = 0;

	for( i = 0, flag = 0; i < 16; i++ )
	{
		wx0 = LasterBuffer[0][EceWork->line.y0] >> 8;
		wx1 = LasterBuffer[0][EceWork->line.y0] & 0x00ff;

		if( task->work[2] == 0 )
		{
			if( wx0 < EceWork->line.x0 ) wx0 = EceWork->line.x0;
//			if( wx0 >= wx1 ) wx0 = wx1 - 1;
			if( wx0 > wx1 ) wx0 = wx1;
		}
		else
		{
			if( wx1 > EceWork->line.x0 ) wx1 = EceWork->line.x0;
//			if( wx1 <= wx0 ) wx1 = wx0 + 1;
			if( wx1 <= wx0 ) wx1 = wx0;
		}

		LasterBuffer[0][EceWork->line.y0] = (wx0 << 8) | wx1;

		if( flag )
		{
			task->work[0]++;
			break;
		}

		flag = MoveLineWork( &EceWork->line, 1, 1 );
	}

	EceWork->vblank_trans_sw++;
	return( 0 );
}

//------------------------------------------
//	âÊñ êÿÇË 3
//------------------------------------------
static u8 EcScreenCut3( TASK_TABLE *task )
{
	task->work[1]++;

	if( task->work[1] < CUT_MAX )
	{
		task->work[0]++;
		task->work[3] = cutwait[task->work[1]-1];
		return( 1 );
	}

	DmaStop( 0 );
	SetPaletteBlack();
	DelTask( CheckTaskNo(EcEffectScreenCut) );

	return( 0 );
}

//------------------------------------------
//	âÊñ êÿÇË 4
//------------------------------------------
static u8 EcScreenCut4( TASK_TABLE *task )
{
	if( --task->work[3] == 0 )
	{
		task->work[0] = 1;
		return( 1 );
	}

	return( 0 );
}

//------------------------------------------
//	âÊñ êÿÇË V Blank
//------------------------------------------
static void EcScreenCutVBlank( void )
{
	DmaStop( 0 );
	EcVBlankMain();

	if( EceWork->vblank_trans_sw )
	{
		DmaCopy( 3, LasterBuffer[0], LasterBuffer[1], 160*2, 16 );
	}

	*(vu16*)REG_WININ = EceWork->reg_winin;
	*(vu16*)REG_WINOUT = EceWork->reg_winout;
	*(vu16*)REG_WIN0V = EceWork->reg_win0_v;
	*(vu16*)REG_WIN0H = LasterBuffer[1][0];

	DmaSet( 0,											// H DMA æØƒ
		LasterBuffer[1],
		(vu16*)REG_WIN0H,
		DMA_ENABLE |									// DMA ãñâ¬
		DMA_TIMMING_H_BLANK |							// H DMA
		DMA_16BIT_BUS |									// 16bitì]ëó
		DMA_CONTINUOUS_ON |								// ñàâÒ
		DMA_SRC_INC |									// ì]ëóå≥≤›∏ÿ“›ƒ
		DMA_DEST_FIX | 									// ì]ëóêÊÇªÇÃÇ‹Ç‹
		1 );											// 1ìxÇ…1âÒ
}

//======================================================================
//		ªÃﬁ¥Ã™∏ƒ Ã◊Øº≠
//======================================================================
static void EcEffectFlash( u8 );
static u8 EcFlash0( TASK_TABLE * );
static u8 EcFlash1( TASK_TABLE * );

//------------------------------------------
//	¥Ã™∏ƒ Ã◊Øº≠æØƒ
//------------------------------------------
static void SetEcEffectFlash( s16 w_wait, s16 n_wait, s16 count, s16 w_add, s16 n_sub )
{
	u8 i;

	i = AddTask( EcEffectFlash, EC_SUB_EFF_TASK_PRI );

	TaskTable[i].work[1] = w_wait;
	TaskTable[i].work[2] = n_wait;
	TaskTable[i].work[3] = count;
	TaskTable[i].work[4] = w_add;
	TaskTable[i].work[5] = n_sub;
	TaskTable[i].work[6] = w_wait;
}

//------------------------------------------
//	¥Ã™∏ƒ Ã◊Øº≠èIóπ¡™Ø∏
//------------------------------------------
static u8 CheckEcEffectFlash( void )
{
	u8 i;
	
	i = CheckTaskNo( EcEffectFlash );
	
	if( i == NOT_EXIST_TASK_ID )
	{
		return( 1 );
	}
	
	return( 0 );
}

//------------------------------------------
//	¥Ã™∏ƒ Ã◊Øº≠√∞ÃﬁŸ
//------------------------------------------
static u8 (* const EcFlashTaskTbl[])( TASK_TABLE * ) =
{
	EcFlash0,
	EcFlash1,
};

//------------------------------------------
//	¥Ã™∏ƒ Ã◊Øº≠
//------------------------------------------
static void EcEffectFlash( u8 no )
{
	while( EcFlashTaskTbl[TaskTable[no].work[0]](&TaskTable[no]) );
}

//------------------------------------------
//	Ã◊Øº≠ 0
//------------------------------------------
static u8 EcFlash0( TASK_TABLE *task )
{
	if( task->work[6] )										// ≥™≤ƒóLÇË
	{
		task->work[6]--;
	}
	
	if( task->work[6] == 0 )
	{
		task->work[6] = task->work[1];						// éwíË≥™≤ƒ
		task->work[7] += task->work[4];						// éwíËëùâ¡
		if( task->work[7] > 16 ) task->work[7] = 16;

		ColorConceChange( 0xffffffff, (u8)task->work[7], 0x2d6b );
	}

	if( task->work[7] >= 16 )
	{
		task->work[0]++;
		task->work[6] = task->work[2];						// éwíË≥™≤ƒ
	}

	return( 0 );
}

//------------------------------------------
//	Ã◊Øº≠ 1
//------------------------------------------
static u8 EcFlash1( TASK_TABLE *task )
{
	if( task->work[6] )
	{
		task->work[6]--;
	}
	
	if( task->work[6] == 0 )
	{
		task->work[6] = task->work[2];						// éwíË≥™≤ƒ
		task->work[7] -= task->work[5];						// éwíËå∏ë¨
		if( task->work[7] < 0 ) task->work[7] = 0;

		ColorConceChange( 0xffffffff, (u8)task->work[7], 0x2d6b );
	}
	
	if( task->work[7] == 0 )
	{
		task->work[3]--;									// éwíËâÒêî
		
		if( task->work[3] == 0 )
		{
			DelTask( CheckTaskNo(EcEffectFlash) );
		}
		else
		{
			task->work[6] = task->work[1];
			task->work[0] = 0;
		}
	}

	return( 0 );
}

//======================================================================
//		ªÃﬁ
//======================================================================
//------------------------------------------
//	¥›∂≥›ƒ¥Ã™∏ƒ‹∞∏èâä˙âª
//------------------------------------------
static void InitEceWork( void )
{
	memset( (u8*)EceWork, 0, ECE_WORK_SIZE );
	GetMapRegPos( &EceWork->mx, &EceWork->my );
}

//------------------------------------------
//	V Blank äÓñ{
//------------------------------------------
static void EcVBlankMain( void )
{
	actOAMtrans();
	actDMAtrans();
	PaletteFadeTrans();
}

//------------------------------------------
//	BG0 ∑¨◊±ƒﬁ⁄Ω
//------------------------------------------
static void GetBG0Char( u16 **ch )
{
	u16 c_base;

	c_base = ((*(vu16 *)REG_BG0CNT) >> BG_CHAR_BASE_SHIFT) & 0x03;	
	c_base <<= 14;										// 0x4000
	*ch = (u16*)(BG_VRAM + c_base);
}

//------------------------------------------
//	BG0 œØÃﬂ,∑¨◊±ƒﬁ⁄Ω
//------------------------------------------
static void GetBG0MapChar( u16 **map, u16 **ch )
{
	u16 m_base,c_base;

	m_base = ((*(vu16 *)REG_BG0CNT) >> BG_SCREEN_BASE_SHIFT) & 0x1f;
	c_base = ((*(vu16 *)REG_BG0CNT) >> BG_CHAR_BASE_SHIFT) & 0x03;	
	m_base <<= 11;										// 0x0800
	c_base <<= 14;										// 0x4000
	*map = (u16*)(BG_VRAM + m_base);
	*ch = (u16*)(BG_VRAM + c_base);
}

//------------------------------------------
//	ëS ﬂ⁄Øƒçï
//------------------------------------------
static void SetPaletteBlack( void )
{
	ColorConceChange( 0xffffffff, 16, 0 );
}

//------------------------------------------
//	Sin∂∞Ãﬁ ﬁØÃßæØƒ
//------------------------------------------
static void SetBufSin( u16 *buf, s16 c_pos, s16 s_ang, s16 a_ang, s16 rad, s16 count )
{
	u8 i;

	for( i = 0; count > 0; count--, i++, s_ang += a_ang )
	{
		buf[i] = c_pos + SinMove( (s_ang&0xff), rad );
	}
}

//------------------------------------------
//	â~≥®›ƒﬁ≥æØƒ
//------------------------------------------
static void SetWindowCircle( u16 *buf, s16 cx, s16 cy, s16 r )
{
	s16 off_x,off_y;
	s16 i,x0,x1,y0,y1;
	s16 next_off,next_y0,next_y1;
	
	memset( (u8*)buf, 0x0a, 320 );						// ∏ÿ±

	for( i = 0; i < 64; i++ )							// 90
	{
		off_x = SinMove( i, r );
		off_y = CosMove( i, r );

		x0 = cx - off_x;
 		x1 = cx + off_x;
		y0 = cy - off_y;
		y1 = cy + off_y;

		if( x0 < 0 ) x0 = 0;							// ∏ÿØÀﬂ›∏ﬁ
		if( x1 > 240 ) x1 = 240;
		if( y0 < 0 ) y0 = 0;
		if( y1 >= 160 ) y1 = 159;

		x1 = (x0 << 8) | x1;							// æØƒíl

		buf[y0] = x1;
		buf[y1] = x1;

		next_off = CosMove( i + 1, r );

		next_y0 = cy - next_off;
		next_y1 = cy + next_off;
		if( next_y0 < 0 ) next_y0 = 0;
		if( next_y1 >= 160 ) next_y1 = 159;

		while( y0 > next_y0 ) buf[--y0] = x1;			// ï‚ê≥
		while( y0 < next_y0 ) buf[++y0] = x1;
		while( y1 > next_y1 ) buf[--y1] = x1;
		while( y1 < next_y1 ) buf[++y1] = x1;
	}
}

//------------------------------------------
//	◊≤›ãOìπ‹∞∏æØƒ
//------------------------------------------
static void SetLineWork( LINEWORK *line, s16 x0, s16 y0, s16 x1, s16 y1, s16 mx, s16 my )
{
	line->init_x = x0;
	line->init_y = y0;
	line->x0 = x0;
	line->y0 = y0;
	line->x1 = x1;
	line->y1 = y1;
	line->mx = mx;
	line->my = my;

	line->xdiff = x1 - x0;								// énì_ < èIì_

	if( line->xdiff < 0 )								// énì_ > èIì_
	{
		line->xdiff = -(line->xdiff);
		line->mx = -mx;
	}

	line->ydiff = y1 - y0;

	if( line->ydiff < 0 )
	{
		line->ydiff = -(line->ydiff);
		line->my = -my;
	}
	
	line->work = 0;
}

//------------------------------------------
//	◊≤›ãOìπà⁄ìÆ
//------------------------------------------
static u8 MoveLineWork( LINEWORK *line, u8 xflag, u8 yflag )
{
	u8 end;

	if( line->xdiff > line->ydiff )						// xãOìπ > yãOìπ
	{
		line->x0 += line->mx;							// ç¿ïWçXêV
		line->work += line->ydiff;

		if( line->work > line->xdiff )					// ãOìπí âﬂ
		{
			line->y0 += line->my;
			line->work -= line->xdiff;					// ãOìπèCê≥
		}
	}
	else
	{
		line->y0 += line->my;
		line->work += line->xdiff;

		if( line->work > line->ydiff )
		{
			line->x0 += line->mx;
			line->work -= line->ydiff;
		}
	}

	end = 0;

	if( (line->mx > 0 && line->x0 >= line->x1) ||
		(line->mx < 0 && line->x0 <= line->x1) )
	{
		end++;
		if( xflag ) line->x0 = line->x1;
	}

	if( (line->my > 0 && line->y0 >= line->y1) ||
		(line->my < 0 && line->y0 <= line->y1) )
	{
		end++;
		if( yflag ) line->y0 = line->y1;
	}

	if( end == 2 ) return( 1 );

	return( 0 );
}

//======================================================================
//		√ﬁ∞¿
//======================================================================
//------------------------------------------
//	Œﬁ∞Ÿ±∏¿∞
//------------------------------------------
static const actAnmData ball_celltrans[] =
{
	{&ecobjball_Character[0x20*2],0x20*16},
};

static const actAnm ball_anm[] =
{
	{0,1,0,0},
	{ACT_ANMEND,0,0,0},
};

static const actAnm * const ball_anm_tbl[] =
{
	ball_anm,
};

static const actAffAnm ball_left_spin_affanm[] =		// ç∂âÒÇË
{
	{ 0, 0, -4, 1 },
	{ ACT_AFLOOP, 0, 0, 0 }
};

static const actAffAnm ball_right_spin_affanm[] =		// âEâÒÇË
{
	{ 0, 0, 4, 1 },
	{ ACT_AFLOOP, 0, 0, 0 },
};

static const actAffAnm * const ball_spin_affanm_tbl[] =
{
	ball_left_spin_affanm,
	ball_right_spin_affanm,
};

static const actHeader SpinBallActHead =
{
	ACT_TMODE,
	FE_EcBall_PalID,
	&Oam32x32,
	ball_anm_tbl,
	ball_celltrans,
	ball_spin_affanm_tbl,
	FeEcSpinBallMove,
};

//------------------------------------------
//	ƒ⁄∞≈∞ ﬁΩƒ±ØÃﬂ
//------------------------------------------
static const ActOamData Oam64x64 =
{
	0,										// u32 VPos:8
	0,										// u32 AffineMode:2
	0,										// u32 ObjMode:2
	0,										// u32 Mosaic:1
	0,										// u32 ColorMode:1
	0,										// u32 Shape:2
	0,										// u32 HPos:9
	0,										// u32 AffineParamNo:5
	3,										// u32 Size:2
	0,										// u32 CharNo:10
	0,										// u32 Priority:2
	0,										// u32 Pltt:3
	0,										// AffineWork
};

static const actAnmData tr_hero_celltrans[] =
{
	{&eccutin_obj_Character[(0x20*64)*0],0x20*64},
};

static const actAnmData tr_dmy_celltrans[] =
{
	{&eccutin_obj_Character[(0x20*64)*1],0x20*64},
};

static const actAnm tr_anm[] =
{
	{0,1,0,0},
	{ACT_ANMEND,0,0,0},
};

static const actAnm * const tr_anm_tbl[] =
{
	tr_anm,
};

static const actHeader TrHeroActHead =
{
	ACT_TMODE,
	FE_EcTrainer_PalID,
	&Oam64x64,
	tr_anm_tbl,
	tr_hero_celltrans,
	DummyActAffTbl,
	EcCutinTrainerActMove,
};

static const actHeader TrDmyActHead =
{
	ACT_TMODE,
	FE_EcTrainer_PalID,
	&Oam64x64,
	tr_anm_tbl,
	tr_dmy_celltrans,
	DummyActAffTbl,
	EcCutinTrainerActMove,
};

//------------------------------------------
//	Œﬁ∞Ÿ∂◊∞
//------------------------------------------
static const u16 ecball_Palette[16]={
	0x76ac,0x003e,0x5b5d,0x4adb,0x7fff,0x779b,0x7337,0x6ed3,
	0x5a6c,0x0012,0x6318,0x539d,0x433b,0x36da,0x2a79,0x0000,
};

const PalData EcBallPalData =
{ ecball_Palette, FE_EcBall_PalID };

//------------------------------------------
//	∂Øƒ≤›∂◊∞
//------------------------------------------
static const u16 eccutin_bg_Palette[] = {
#if (EC_COLOR_TEST == 0)
	0x18d5,0x39ce,0x4a52,0x5ad6,0x6b5a,0x5c17,0x6459,0x6c9b,
	0x74dd,0x7d1f,0x6acd,0x730f,0x7b51,0x7f93,0x7fd5,0x7fff,

	0x18d5,0x39ce,0x4a52,0x5ad6,0x6b5a,0x0741,0x13a4,0x1bc6,
	0x27e9,0x3fef,0x45fc,0x4e3e,0x567f,0x5ebf,0x66ff,0x45fc,
	
	0x18d5,0x39ce,0x4a52,0x5ad6,0x6b5a,0x555f,0x5d9f,0x65df,
	0x6e1f,0x765f,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	
	0x18d5,0x39ce,0x4a52,0x5ad6,0x6b5a,0x4000,0x4842,0x5084,
	0x58c6,0x6108,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	
	0x18d5,0x39ce,0x4a52,0x5ad6,0x6b5a,0x2318,0x2b5a,0x339c,
	0x3bde,0x43ff,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	
	0x6acd,0x730f,0x7b51,0x7f93,0x7fd5,0x7fff,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	
	0x45fc,0x4e3e,0x567f,0x5ebf,0x66ff,0x7fff,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000
#elif (EC_COLOR_TEST == 1)
	0x18d5,0x39ce,0x4a52,0x5ad6,0x6b5a,0x5c17,0x6459,0x6c9b,
	0x74dd,0x7d1f,0x6acd,0x730f,0x7b51,0x7f93,0x7fd5,0x7fff,
	0x18d5,0x39ce,0x4a52,0x5ad6,0x6b5a,0x0f5a,0x179c,0x1fde,
	0x27ff,0x2fff,0x45fc,0x4e3e,0x567f,0x5ebf,0x66ff,0x45fc,
	0x18d5,0x39ce,0x4a52,0x5ad6,0x6b5a,0x2722,0x2f64,0x37a6,
	0x3fe8,0x47ea,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x18d5,0x39ce,0x4a52,0x5ad6,0x6b5a,0x4000,0x4842,0x5084,
	0x58c6,0x6108,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x18d5,0x39ce,0x4a52,0x5ad6,0x6b5a,0x4a52,0x5294,0x5ad6,
	0x6318,0x6b5a,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x6acd,0x730f,0x7b51,0x7f93,0x7fd5,0x7fff,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x45fc,0x4e3e,0x567f,0x5ebf,0x66ff,0x45fc,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
#elif (EC_COLOR_TEST == 2)
	0x18d5,0x39ce,0x4a52,0x5ad6,0x6b5a,0x18df,0x211f,0x295f,
	0x319f,0x39df,0x6acd,0x730f,0x7b51,0x7f93,0x7fd5,0x7fff,
	0x18d5,0x39ce,0x4a52,0x5ad6,0x6b5a,0x0add,0x131f,0x1b5f,
	0x239f,0x2bdf,0x45fc,0x4e3e,0x567f,0x5ebf,0x66ff,0x7fff,
	0x18d5,0x39ce,0x4a52,0x5ad6,0x6b5a,0x69ce,0x7210,0x7a52,
	0x7e94,0x7ed6,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x18d5,0x39ce,0x4a52,0x5ad6,0x6b5a,0x0320,0x0b62,0x13a4,
	0x1be6,0x2bea,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x18d5,0x39ce,0x4a52,0x5ad6,0x6b5a,0x2318,0x2b5a,0x339c,
	0x3bde,0x43ff,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x6acd,0x730f,0x7b51,0x7f93,0x7fd5,0x7fff,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x45fc,0x4e3e,0x567f,0x5ebf,0x66ff,0x7fff,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
#else
	0x18d5,0x39ce,0x4a52,0x5ad6,0x6b5a,0x319f,0x421f,0x4a5f,
	0x529f,0x5adf,0x6acd,0x730f,0x7b51,0x7f93,0x7fd5,0x7fff,

	0x18d5,0x39ce,0x4a52,0x5ad6,0x6b5a,0x318c,0x4210,0x4a52,
	0x5294,0x5ad6,0x45fc,0x4e3e,0x567f,0x5ebf,0x66ff,0x7fff,
	
	0x18d5,0x39ce,0x4a52,0x5ad6,0x6b5a,0x5108,0x594a,0x618c,
	0x69ce,0x7210,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	
	0x18d5,0x39ce,0x4a52,0x5ad6,0x6b5a,0x0320,0x0b62,0x13a4,
	0x1be6,0x2bea,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	
	0x18d5,0x39ce,0x4a52,0x5ad6,0x6b5a,0x2318,0x2b5a,0x339c,
	0x3bde,0x43ff,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	
	0x6acd,0x730f,0x7b51,0x7f93,0x7fd5,0x7fff,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	
	0x45fc,0x4e3e,0x567f,0x5ebf,0x66ff,0x7fff,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
#endif
};

static const u16 * const eccutin_bg_PaletteTbl[] =
{
	&eccutin_bg_Palette[0],
	&eccutin_bg_Palette[16],
	&eccutin_bg_Palette[32],
	&eccutin_bg_Palette[48],
	&eccutin_bg_Palette[64],
};

static const u16 * const eccutin_hero_bg_PaletteTbl[] =
{
	&eccutin_bg_Palette[80],
	&eccutin_bg_Palette[96],
};

static const u16 eccutin_obj_Palette[16]={
	0x530e,0x677f,0x4a9b,0x3a19,0x296f,0x3d27,0x30e5,0x28a3,
	0x1c82,0x779b,0x2f1f,0x2e77,0x2d9f,0x2118,0x7fff,0x0000,
};

static const PalData EcTrainerPalData =
{ eccutin_obj_Palette, FE_EcTrainer_PalID };

//------------------------------------------
//	Œﬁ∞ŸœØÃﬂ 30x20
//------------------------------------------
static const u16 ecball_Map[600]={
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,    /* 0 */
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,    /* 1 */
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,    /* 2 */
	0x0000,0x0000,0x0000,0x0003,0x0004,0x0005,0x0006,0x0406,
	0x0405,0x0404,0x0403,0x0400,0x0400,0x0400,0x0400,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,    /* 3 */
	0x0000,0x0007,0x0008,0x0009,0x0001,0x0001,0x0001,0x0401,
	0x0401,0x0401,0x0409,0x0408,0x0407,0x0400,0x0400,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,    /* 4 */
	0x000a,0x000b,0x0001,0x0001,0x0001,0x0001,0x0001,0x0401,
	0x0401,0x0401,0x0401,0x0401,0x040b,0x040a,0x0400,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,    /* 5 */
	0x000d,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0401,
	0x0401,0x0401,0x0401,0x0401,0x0401,0x040d,0x0400,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x000e,    /* 6 */
	0x000f,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0401,
	0x0401,0x0401,0x0401,0x0401,0x0401,0x040f,0x040e,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0010,    /* 7 */
	0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0401,
	0x0401,0x0401,0x0401,0x0401,0x0401,0x0401,0x0410,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0011,    /* 8 */
	0x0001,0x0001,0x0001,0x0001,0x0001,0x0024,0x0025,0x0425,
	0x0424,0x0401,0x0401,0x0401,0x0401,0x0401,0x0411,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0012,    /* 9 */
	0x0013,0x0013,0x0013,0x0013,0x0013,0x0026,0x0027,0x0427,
	0x0426,0x0413,0x0413,0x0413,0x0413,0x0413,0x0412,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0014,    /* 10 */
	0x0015,0x0015,0x0015,0x0015,0x0015,0x0028,0x0029,0x0429,
	0x0428,0x0415,0x0415,0x0415,0x0415,0x0415,0x0414,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0016,    /* 11 */
	0x0002,0x0002,0x0002,0x0002,0x0002,0x002a,0x002b,0x042b,
	0x042a,0x0402,0x0402,0x0402,0x0402,0x0402,0x0416,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0017,    /* 12 */
	0x0002,0x0002,0x0002,0x0002,0x0002,0x0002,0x0002,0x0402,
	0x0402,0x0402,0x0402,0x0402,0x0402,0x0402,0x0417,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0018,    /* 13 */
	0x0019,0x0002,0x0002,0x0002,0x0002,0x0002,0x0002,0x0402,
	0x0402,0x0402,0x0402,0x0402,0x0402,0x0419,0x0418,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,    /* 14 */
	0x001a,0x0002,0x0002,0x0002,0x0002,0x0002,0x0002,0x0402,
	0x0402,0x0402,0x0402,0x0402,0x0402,0x041a,0x0400,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,    /* 15 */
	0x001b,0x001c,0x0002,0x0002,0x0002,0x0002,0x0002,0x0402,
	0x0402,0x0402,0x0402,0x0402,0x041c,0x041b,0x0400,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,    /* 16 */
	0x0000,0x001d,0x001e,0x001f,0x0002,0x0002,0x0002,0x0402,
	0x0402,0x0402,0x041f,0x041e,0x041d,0x0400,0x0400,0x0400,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,    /* 17 */
	0x0000,0x0000,0x0000,0x0020,0x0021,0x0022,0x0023,0x0423,
	0x0422,0x0421,0x0420,0x0400,0x0400,0x0400,0x0400,0x0400,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,    /* 18 */
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,    /* 19 */
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
};

//------------------------------------------
//	∂Øƒ≤›œØÃﬂ 32x20
//------------------------------------------
static const u16 eccutin0_Map[640]={
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,    /* 0 */
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,    /* 1 */
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,    /* 2 */
	0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,
	0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,
	0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,
	0x0006,0x0006,0x0006,0x0003,0x0003,0x0003,0x0003,0x0006,    /* 3 */
	0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0003,0x0006,
	0x0006,0x0006,0x0003,0x0003,0x0003,0x0003,0x0006,0x0006,
	0x0003,0x0003,0x0003,0x0003,0x0003,0x0006,0x0003,0x0003,
	0x0004,0x0004,0x0007,0x0004,0x0007,0x0007,0x0004,0x0004,    /* 4 */
	0x0004,0x0007,0x0007,0x0007,0x0007,0x0004,0x0004,0x0004,
	0x0004,0x0004,0x0004,0x0007,0x0007,0x0004,0x0004,0x0004,
	0x0004,0x0004,0x0004,0x0007,0x0004,0x0004,0x0004,0x0004,
	0x0005,0x0005,0x0005,0x0005,0x0005,0x0005,0x0005,0x0005,    /* 5 */
	0x0005,0x0005,0x0005,0x0005,0x0005,0x0005,0x0005,0x0005,
	0x0005,0x0005,0x0005,0x0005,0x0005,0x0005,0x0005,0x0005,
	0x0005,0x0005,0x0005,0x0005,0x0005,0x0005,0x0005,0x0005,
	0x0805,0x0805,0x0805,0x0805,0x0805,0x0805,0x0805,0x0805,    /* 6 */
	0x0805,0x0805,0x0805,0x0805,0x0805,0x0805,0x0805,0x0805,
	0x0805,0x0805,0x0805,0x0805,0x0805,0x0805,0x0805,0x0805,
	0x0805,0x0805,0x0805,0x0805,0x0805,0x0805,0x0805,0x0805,
	0x0007,0x0804,0x0804,0x0007,0x0007,0x0804,0x0804,0x0804,    /* 7 */
	0x0804,0x0804,0x0804,0x0804,0x0804,0x0804,0x0804,0x0007,
	0x0007,0x0804,0x0804,0x0804,0x0007,0x0007,0x0804,0x0804,
	0x0804,0x0804,0x0804,0x0804,0x0007,0x0007,0x0804,0x0804,
	0x0803,0x0803,0x0803,0x0803,0x0803,0x0006,0x0006,0x0803,    /* 8 */
	0x0803,0x0006,0x0803,0x0803,0x0006,0x0803,0x0803,0x0803,
	0x0803,0x0803,0x0006,0x0006,0x0006,0x0803,0x0803,0x0803,
	0x0803,0x0803,0x0006,0x0006,0x0006,0x0803,0x0803,0x0803,
	0x0801,0x0801,0x0801,0x0801,0x0801,0x0801,0x0801,0x0801,    /* 9 */
	0x0801,0x0801,0x0801,0x0801,0x0801,0x0801,0x0801,0x0801,
	0x0801,0x0801,0x0801,0x0801,0x0801,0x0801,0x0801,0x0801,
	0x0801,0x0801,0x0801,0x0801,0x0801,0x0801,0x0801,0x0801,
	0x0008,0x0008,0x0008,0x0008,0x0008,0x0008,0x0008,0x0008,    /* 10 */
	0x0008,0x0008,0x0008,0x0008,0x0008,0x0008,0x0008,0x0008,
	0x0008,0x0008,0x0008,0x0008,0x0008,0x0008,0x0008,0x0008,
	0x0008,0x0008,0x0008,0x0008,0x0008,0x0008,0x0008,0x0008,
	0x0009,0x000d,0x0009,0x0009,0x000d,0x000d,0x000d,0x000d,    /* 11 */
	0x0009,0x0009,0x0009,0x000d,0x000d,0x0009,0x000d,0x0009,
	0x0009,0x0009,0x0009,0x000d,0x000d,0x000d,0x0009,0x0009,
	0x0009,0x000d,0x000d,0x0009,0x0009,0x0009,0x0009,0x0009,
	0x000a,0x000a,0x000e,0x000e,0x000a,0x000a,0x000a,0x000a,    /* 12 */
	0x000a,0x000e,0x000e,0x000a,0x000a,0x000a,0x000a,0x000a,
	0x000a,0x000e,0x000a,0x000a,0x000a,0x000a,0x000e,0x000e,
	0x000a,0x000a,0x000a,0x000a,0x000e,0x000e,0x000e,0x000a,
	0x000c,0x000c,0x000c,0x000c,0x000c,0x000c,0x000c,0x000c,    /* 13 */
	0x000c,0x000c,0x000c,0x000c,0x000c,0x000c,0x000c,0x000c,
	0x000c,0x000c,0x000c,0x000c,0x000c,0x000c,0x000c,0x000c,
	0x000c,0x000c,0x000c,0x000c,0x000c,0x000c,0x000c,0x000c,
	0x080c,0x080c,0x080c,0x080c,0x080c,0x080c,0x080c,0x080c,    /* 14 */
	0x080c,0x080c,0x080c,0x080c,0x080c,0x080c,0x080c,0x080c,
	0x080c,0x080c,0x080c,0x080c,0x080c,0x080c,0x080c,0x080c,
	0x080c,0x080c,0x080c,0x080c,0x080c,0x080c,0x080c,0x080c,
	0x000e,0x080a,0x080a,0x080a,0x080a,0x000e,0x000e,0x000e,    /* 15 */
	0x080a,0x080a,0x080a,0x080a,0x080a,0x080a,0x080a,0x080a,
	0x080a,0x080a,0x080a,0x000e,0x000e,0x080a,0x080a,0x080a,
	0x080a,0x000e,0x080a,0x080a,0x080a,0x080a,0x000e,0x000e,
	0x0809,0x0809,0x000d,0x000d,0x0809,0x0809,0x000d,0x0809,    /* 16 */
	0x0809,0x0809,0x000d,0x000d,0x000d,0x000d,0x0809,0x0809,
	0x0809,0x000d,0x0809,0x0809,0x0809,0x0809,0x0809,0x000d,
	0x000d,0x0809,0x0809,0x0809,0x0809,0x000d,0x000d,0x0809,
	0x0808,0x0808,0x0808,0x0808,0x0808,0x0808,0x0808,0x0808,    /* 17 */
	0x0808,0x0808,0x0808,0x0808,0x0808,0x0808,0x0808,0x0808,
	0x0808,0x0808,0x0808,0x0808,0x0808,0x0808,0x0808,0x0808,
	0x0808,0x0808,0x0808,0x0808,0x0808,0x0808,0x0808,0x0808,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,    /* 18 */
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,    /* 19 */
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0800,0x0000,0x0000,0x0000,0x0000,0x0000,
};
