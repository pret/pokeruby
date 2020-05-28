//**********************************************************************
//		fldeff.c
//		Ã®∞Ÿƒﬁ¥Ã™∏ƒ
//**********************************************************************
#define		FLD_EFF_H_PROTO
#include	<agb.h>
#include 	"common.h"
#include	"intr.h"
#include	"actor.h"
#include	"actanm.h"
#include	"palanm.h"
#include	"fld_eff.h"
#include	"objdata.h"
#include	"decord.h"
#include	"poketool.h"
#include	"evobj.h"
#include	"fld_main.h"
#include	"script.h"
#include	"task.h"
#include	"fld_tool.h"
#include	"fld_bgm.h"
#include	"weather.h"
#include	"f_pmlist.h"
#include	"fld_task.h"
#include	"calctool.h"
#include	"jiki.h"
#include	"mapbg.h"
#include	"mus_tool.h"
#include	"fieldmap.h"
#include	"escalat.h"
#include	"map_attr.h"
#include	"ev_check.h"
#include	"initgame.h"
#include	"mapparam.h"
#include	"menu.h"

//----------------------------------------------------------------------
//		√ﬁ∞¿
//----------------------------------------------------------------------
#include	"..\objdata\tr3_005.ach"
#include	"..\objdata\tr3_005.acl"

#include	"..\objdata\pc_eff.ach"
#include	"..\objdata\pc_eff.acl"
#include	"..\objdata\kaifuku.ach"

#include	"..\objdata\dendou1_obj.ach"
#include	"..\objdata\dendou2_obj.ach"
#include	"..\objdata\dendou_obj.acl"

#include	"..\objdata\hiden.ach"
#include	"..\objdata\hiden.acl"
#include	"..\objdata\hiden.asc"
#include	"..\objdata\hiden2.ach"
#include	"..\objdata\hiden2.acl"
#include	"..\objdata\hiden2.asc"

//----------------------------------------------------------------------
//		äOïîéQè∆
//----------------------------------------------------------------------
extern u32	FldEffSeqTbl[];
extern const u32 DecordAdrs[];

extern void FieldFadeInSet( void );
extern void FieldFadeOutSet( void );

//----------------------------------------------------------------------
//		define
//----------------------------------------------------------------------
#define	FE_CODE_MAX	(32)

#define FE_HCUTIN_VOICE_FLAG     (0x80000000)
#define FE_HCUTIN_VOICE_FLAG_CLS (0x7fffffff)
#define FE_HCUTIN_VOICE_FLAG_R_SHIFT (16)

//----------------------------------------------------------------------
//		∏ﬁ€∞ ﬁŸ
//----------------------------------------------------------------------
s32	FeSetWork[8] = { 0 };

//----------------------------------------------------------------------
//		€∞∂Ÿ
//----------------------------------------------------------------------
static u8 FeCode[FE_CODE_MAX];

//======================================================================
//		¥Ã™∏ƒæØƒ
//======================================================================
static u8 seq_cell_set( u8 **, u32 * );
static u8 seq_pal_set( u8 **, u32 * );
static u8 seq_pal_nw_set( u8 **, u32 * );
static u8 seq_sub_set( u8 **, u32 * );
static u8 seq_set_end( u8 **, u32 * );
static u8 seq_all_set( u8 **, u32 * );
static u8 seq_cell_sub_set( u8 **, u32 * );
static u8 seq_pal_sub_set( u8 **, u32 * );

static void cell_set_sub( u8 ** );
static void pal_set_sub( u8 ** );
static void pal_nw_set_sub( u8 ** );
static void sub_set_sub( u8 **, u32 * );

//------------------------------------------
//	æØƒ√∞ÃﬁŸ
//------------------------------------------
static u8 (* const FeSetSeqTbl[])( u8 **, u32 * ) =
{
	seq_cell_set,
	seq_pal_set,
	seq_pal_nw_set,
	seq_sub_set,
	seq_set_end,
	seq_all_set,
	seq_cell_sub_set,
	seq_pal_sub_set
};

//------------------------------------------
//	¥Ã™∏ƒæØƒ
//	In:		code			; ¥Ã™∏ƒ∫∞ƒﬁ
//	Out:	u32				; ‹∞∏
//------------------------------------------
u32 FldEffSet( u8 code )
{
	u8 *set_adrs;
	u32 ret;

	FeCodeSet( code );

	set_adrs = (u8*)FldEffSeqTbl[code];
	while( FeSetSeqTbl[*set_adrs](&set_adrs,&ret) );

	return( ret );
}

//------------------------------------------
//	æŸæØƒº∞π›Ω
//------------------------------------------
static u8 seq_cell_set( u8 **set_adrs, u32 *ret )
{
	(*set_adrs)++;
	cell_set_sub( set_adrs );
	return( 1 );
}

//------------------------------------------
//	 ﬂ⁄ØƒæØƒº∞π›Ω
//------------------------------------------
static u8 seq_pal_set( u8 **set_adrs, u32 *ret )
{
	(*set_adrs)++;
	pal_set_sub( set_adrs );
	return( 1 );
}

//------------------------------------------
//	 ﬂ⁄ØƒæØƒº∞π›Ω ìVåÛí≤êÆñ≥Çµ
//------------------------------------------
static u8 seq_pal_nw_set( u8 **set_adrs, u32 *ret )
{
	(*set_adrs)++;
	pal_nw_set_sub( set_adrs );
	return( 1 );
}

//------------------------------------------
//	ªÃﬁæØƒº∞π›Ω
//------------------------------------------
static u8 seq_sub_set( u8 **set_adrs, u32 *ret )
{
	(*set_adrs)++;
	sub_set_sub( set_adrs, ret );
	return( 1 );
}

//------------------------------------------
//	æØƒ¥›ƒﬁº∞π›Ω
//------------------------------------------
static u8 seq_set_end( u8 **set_adrs, u32 *ret )
{
	return( 0 );
}

//------------------------------------------
//	µ∞ŸæØƒº∞π›Ω
//------------------------------------------
static u8 seq_all_set( u8 **set_adrs, u32 *ret )
{
	(*set_adrs)++;
	cell_set_sub( set_adrs );
	pal_set_sub( set_adrs );
	sub_set_sub( set_adrs, ret );
	return( 1 );
}

//------------------------------------------
//	æŸ,ªÃﬁæØƒº∞π›Ω
//------------------------------------------
static u8 seq_cell_sub_set( u8 **set_adrs, u32 *ret )
{
	(*set_adrs)++;
	cell_set_sub( set_adrs );
	sub_set_sub( set_adrs, ret );
	return( 1 );
}

//------------------------------------------
//	 ﬂ⁄Øƒ,ªÃﬁæØƒº∞π›Ω
//------------------------------------------
static u8 seq_pal_sub_set( u8 **set_adrs, u32 *ret )
{
	(*set_adrs)++;
	pal_set_sub( set_adrs );
	sub_set_sub( set_adrs, ret );
	return( 1 );
}

//------------------------------------------
//	pp -> p
//------------------------------------------
static void * get_adrs( u8 **set_p )
{
	return( (void*)((**set_p) + ((*((*set_p)+1))<<8) +
				((*(*set_p+2))<<16) + ((*((*set_p)+3))<<24)) );
}

//------------------------------------------
//	æŸæØƒº∞π›Ω ªÃﬁ
//------------------------------------------
static void cell_set_sub( u8 **set_p )
{
	CellData *cell;

	cell = (CellData*)get_adrs( set_p );

	if( CellCharNumGet(cell->act_num) == 0xffff )
	{
		CellSet( cell );
	}

	*set_p += 4;
}

//------------------------------------------
//	 ﬂ⁄ØƒæØƒº∞π›Ω ªÃﬁ
//------------------------------------------
static void pal_set_sub( u8 **set_p )
{
	PalData *pal;

	pal = (PalData*)get_adrs( set_p ); 
	ObjPalSet( pal );
	FieldWeather_AdjustObjPal( ObjPalNumGet(pal->reg_num) );

	*set_p += 4;
}

//------------------------------------------
//	 ﬂ⁄ØƒæØƒº∞π›Ω ªÃﬁ ìVåÛí≤êÆñ≥Çµ
//------------------------------------------
static void pal_nw_set_sub( u8 **set_p )
{
	PalData *pal;

	pal = (PalData*)get_adrs( set_p ); 
	ObjPalSet( pal );

	*set_p += 4;
}

//------------------------------------------
//	ªÃﬁæØƒº∞π›Ω ªÃﬁ
//------------------------------------------
static void sub_set_sub( u8 **set_p, u32 *ret )
{
	u32 (*sub)(void);

	sub = (u32 (*)(void))get_adrs( set_p );
	*ret = sub();

	*set_p += 4;
}

//======================================================================
//		¥Ã™∏ƒ±∏¿∞
//======================================================================
static void cell_del_sub( u16 );
static void pal_del_sub( u8 );

//------------------------------------------
//	¥Ã™∏ƒ±∏¿∞çÌèú
//	In:		act			; çÌèú±∏¿∞
//------------------------------------------
void FeDelAct( actWork *act )
{
	u16	chnum;
	u8	palnum;
	
	chnum = act->char_num;
	palnum = act->oamData.Pltt;

	DelActor( act );
	cell_del_sub( chnum );
	pal_del_sub( palnum );
}

//------------------------------------------
//	¥Ã™∏ƒ±∏¿∞, ∫∞ƒﬁçÌèú
//	In:		act			; çÌèú±∏¿
//			code		; çÌèú∫∞ƒﬁ
//------------------------------------------
void FeDelActCode( actWork *act, u8 code )
{
	FeDelAct( act );
	FeCodeDel( code );
}

//------------------------------------------
//	æŸçÌèú
//------------------------------------------
static void cell_del_sub( u16 no )
{
	u8 i;
	u16	id;
	
	id = CellCharNumIdGet( no );
	
	if( id != 0xffff )
	{
		for( i = 0; i < ACT_MAX; i++ )
		{
			if( ActWork[i].act_sw && ActWork[i].t_mode && no == ActWork[i].char_num )
			{
				return;
			}
		}
	
		CellDel( id );
	}
}

//------------------------------------------
//	 ﬂ⁄ØƒçÌèú
//------------------------------------------
static void pal_del_sub( u8 no )
{
	u8	i;
	u16 id;

	id = ObjPalNumIdGet( no );

	if( id != 0xffff )
	{
		for( i = 0; i < ACT_MAX; i++ )
		{
			if( ActWork[i].act_sw && ActWork[i].oamData.Pltt == no )
			{
				return;
			}
		}

		ObjPalRegNumDel( id );
	}
}

//======================================================================
//		¥Ã™∏ƒ∫∞ƒﬁ
//======================================================================
//------------------------------------------
//	¥Ã™∏ƒ∫∞ƒﬁèâä˙âª
//------------------------------------------
void FeCodeInit( void )
{
	u8	i;

	for( i = 0; i < FE_CODE_MAX; FeCode[i] = FECODE_END, i++ );
}

//------------------------------------------
//	¥Ã™∏ƒ∫∞ƒﬁæØƒ
//	In:		code		; æØƒ∫∞ƒﬁ
//------------------------------------------
void FeCodeSet( u8 code )
{
	u8	i;
	
	for( i = 0; i < FE_CODE_MAX; i++ )
	{
		if( FeCode[i] == 0xff )
		{
			FeCode[i] = code;
			return;
		}
	}
}

//------------------------------------------
//	¥Ã™∏ƒ∫∞ƒﬁçÌèú
//	In:		code		; çÌèú∫∞ƒﬁ
//------------------------------------------
void FeCodeDel( u8 code )
{
	u8	i;
		
	for( i = 0; i < FE_CODE_MAX; i++ )
	{
		if( FeCode[i] == code )
		{
			FeCode[i] = 0xff;
			return;
		}
	}
}

//------------------------------------------
//	¥Ã™∏ƒ∫∞ƒﬁ¡™Ø∏
//	In:		code		; ¡™Ø∏Ç∑ÇÈ∫∞ƒﬁ
//	Out:	u8			; 1 = ë∂ç›
//------------------------------------------
u8 FeCodeChk( u8 code )
{
	u8	i;

	for( i = 0; i < FE_CODE_MAX; i++ )
	{
		if( FeCode[i] == code )
		{
			return( 1 );
		}
	}
	
	return( 0 );
}

//======================================================================
//		Oam√ﬁ∞¿
//======================================================================
//------------------------------------------
//	64x64
//------------------------------------------
static const ActOamData Oam64x64 =
{
	0,					// u32 VPos:8
	0,					// u32 AffineMode:2
	0,					// u32 ObjMode:2
	0,					// u32 Mosaic:1
	0,					// u32 ColorMode:1
	0,					// u32 Shape:2
	0,					// u32 HPos:9
	0,					// u32 AffineParamNo:5
	3,					// u32 Size:2
	0,					// u32 CharNo:10
	0,					// u32 Priority:2
	0,					// u32 Pltt:3
	0,					// AffineWork
};

//------------------------------------------
//	8x8
//------------------------------------------
static const ActOamData Oam8x8 =
{
	0,					// u32 VPos:8
	0,					// u32 AffineMode:2
	0,					// u32 ObjMode:2
	0,					// u32 Mosaic:1
	0,					// u32 ColorMode:1
	0,					// u32 Shape:2
	0,					// u32 HPos:9
	0,					// u32 AffineParamNo:5
	0,					// u32 Size:2
	0,					// u32 CharNo:10
	0,					// u32 Priority:2
	0,					// u32 Pltt:3
	0,					// AffineWork
};

//------------------------------------------
//	16x16
//------------------------------------------
static const ActOamData Oam16x16 =
{
	0,					// u32 VPos:8
	0,					// u32 AffineMode:2
	0,					// u32 ObjMode:2
	0,					// u32 Mosaic:1
	0,					// u32 ColorMode:1
	0,					// u32 Shape:2
	0,					// u32 HPos:9
	0,					// u32 AffineParamNo:5
	1,					// u32 Size:2
	0,					// u32 CharNo:10
	0,					// u32 Priority:2
	0,					// u32 Pltt:3
	0,					// AffineWork
};

//======================================================================
//		óßÇøépƒ⁄∞≈-
//======================================================================
//------------------------------------------
//	óßÇøépƒ⁄∞≈∞±∏¿∞í«â¡
//	In:		no			; ƒ⁄∞≈∞≈› ﬁ
//			x,y,pri		; ç¿ïW,±∏¿Ãﬂ◊≤µÿ√®
//			set_adrs	; ìWäJêÊ±ƒﬁ⁄Ω
//	Out:	u8			; ±∏¿∞‹∞∏≈› ﬁ
//	Info:	æŸ, ﬂ⁄Øƒœ»∞ºﬁ¨égóp
//------------------------------------------
u8 SetStandTrainerActor( u8 no, s16 x, s16 y, u8 pri, void *set_adrs )
{
	u8 i;
	actHeader actH;

	DecordPalSetAdrs( &TRFObjDataPal[no], set_adrs );
	DecordCellSetAdrs( &TRFObjDataCell[no], set_adrs );

	actH.cellNo = TRFObjDataCell[no].act_num;
	actH.palNo = TRFObjDataPal[no].reg_num;
	actH.oamData_p = &Oam64x64;
	actH.anmData_p = DummyActAnmTbl;
	actH.anmTrans_p = ACT_NTRANS;
	actH.affData_p = DummyActAffTbl;
	actH.moveData_p = DummyActMove;

	i = AddActor( &actH, x, y, pri );

	return( i );
}

//------------------------------------------
//	óßÇøépƒ⁄∞≈∞VRAMæØƒ
//	In:		no			; ƒ⁄∞≈∞≈› ﬁ
//			pal_no 		;  ﬂ⁄Øƒ‹∞∏æØƒNo
//			char_adrs	; ∑¨◊æØƒ±ƒﬁ⁄Ω
//------------------------------------------
void SetStandTrainerVram( u8 no, u16 pal_no, void *char_adrs )
{
	DecordVram( (void*)TRFObjDataCell[no].ch_data, char_adrs );
	DecordPaletteWork( (void*)TRFObjDataPal[no].pal_data, pal_no, 32 );
}

//------------------------------------------
//	îéémóßÇøép
//------------------------------------------
static const actAnmData hakase_celltrans[] =
{
	{&tr3_005_Character[(0x20*64)*0],0x20*64},
};

static const PalData hakase_pal =
{ &tr3_005_Palette[0],FE_StandOdamaki_PalID };

static const actAnm hakase_anm[] =
{
	{0,1,0,0},
	{ACT_ANMEND,0,0,0},
};

static const actAnm * const hakase_anm_tbl[] =
{
	hakase_anm,
};

static const actHeader StandHakaseActHead =
{
	ACT_TMODE,
	FE_StandOdamaki_PalID,
	&Oam64x64,
	hakase_anm_tbl,
	hakase_celltrans,
	DummyActAffTbl,
	DummyActMove,
};

//------------------------------------------
//	îéémóßÇøép±∏¿∞í«â¡
//	In:		x,y,pri		; ç¿ïW,±∏¿Ãﬂ◊≤µÿ√®
//	Out:	u8			; ‹∞∏≈› ﬁ
//	Info:	64x64, ﬂ⁄Øƒœ»∞ºﬁ¨égóp
//------------------------------------------
u8 StandOdamakiSet( s16 x, s16 y, u8 pri )
{
	ObjPalSet( (PalData *)&hakase_pal );
	return( AddActor(&StandHakaseActHead,x,y,pri) );
}

//======================================================================
//		Œﬂπ”›¥Ã™∏ƒ
//======================================================================
//------------------------------------------
//	Œﬂπ”› OBJ æØƒ
//	In:		no				; Œﬂπ”›No
//			x,y,Ãﬂ◊≤µÿ√®	; ç¿ïW,Ãﬂ◊≤µÿ√®
//	Out:	u8				; ±∏¿∞‹∞∏≈› ﬁ
//							; ACT_MAX = Error
//	Info:	 ﬂ⁄Øƒœ»∞ºﬁ¨égóp
//------------------------------------------
u8 FePokeSet( u16 no, s16 x, s16 y, u8 pri )
{
	DecordPokeCellMake( &PM2FObjDataCell[no],
		pm2fpara[no].size, pm2fpara[no].patcnt,
		(void *)DecordAdrs[3],
		(void *)DecordAdrs[3],no);

	DecordPalSet( (PalData*)&PM2NObjDataPal[no] );

	PokeActHeaderMake( no, 3 );
	PokeActHeader.palNo = PM2NObjDataPal->reg_num;
	WeatherFadeSkipStart( 16 + ObjPalNumGet(PM2NObjDataPal->reg_num) );

	return( AddActor(&PokeActHeader,x,y,pri) );
}

//------------------------------------------
//	Œﬂπ”› OBJ æØƒ ⁄±∂◊∞îΩâf
//	In:		no				; Œﬂπ”›No
//			id,rnd			; ID,å¬ê´óêêî
//			x,y,pri			; ç¿ïW,Ãﬂ◊≤µÿ√®
//	Out:	u8				; ±∏¿∞‹∞∏≈› ﬁ
//	Info:	 ﬂ⁄Øƒœ»∞ºﬁ¨égóp
//------------------------------------------
u8 FePokeRareSet( u16 no, u32 id, u32 rnd, s16 x, s16 y, u8 pri )
{
	PalData *pal;

#if 0
	DecordPokeCellMakeBuchi( &PM2FObjDataCell[no],
		pm2fpara[no].size, pm2fpara[no].patcnt,
		(void *)DecordAdrs[0],
		(void *)DecordAdrs[1],no,rnd);
#else
	DecordPokeCellMakeBuchi( &PM2FObjDataCell[no],
		pm2fpara[no].size, pm2fpara[no].patcnt,
		(void *)DecordAdrs[3],
		(void *)DecordAdrs[3],no,rnd);
#endif

	pal = (PalData*)PokePalDataGetPara( no, id, rnd );
	DecordPalSet( pal );
	PokeActHeaderMake( no, 3 );
	PokeActHeader.palNo = pal->reg_num;
	
	WeatherFadeSkipStart( 16 + ObjPalNumGet(pal->reg_num) );
	return( AddActor(&PokeActHeader,x,y,pri) );
}

//------------------------------------------
//	Œﬂπ”› OBJ çÌèú
//	In:		act				; çÌèú±∏¿∞
//------------------------------------------
void FePokeDel( actWork *act )
{
	WeatherFadeSkipEnd();
	ObjPalRegNumDel( ObjPalNumIdGet(act->oamData.Pltt) );
	
	if( act->oamData.AffineMode )						// √ﬁÃ´ŸƒÇ≈ägèkONÇÁÇµÇ¢
	{
		AffineWorkNumDel( act->oamData.AffineParamNo );
	}

	DelActor( act );
}

//======================================================================
//		∂◊∞¥Ã™∏ƒ
//======================================================================
//------------------------------------------
//	∂◊∞Ã™∞ƒﬁUp
//	In:		colno			; ∂◊∞≈› ﬁ
//			evy_r,g,b		; ãPìxåWêîRGB
//------------------------------------------
void ColorFadeUp( u16 colno, u8 evy_r, u8 evy_g, u8 evy_b )
{
	u16 col,r,g,b;

	col = PaletteWork[colno];

	r = col & 31;										//  RGB
	g = (col & 0x03e0) >> 5;
	b = (col & 0x7c00) >> 10;
	col = 0;

	r = r + ((31 - r) * evy_r >> 4);					// ãPìx±ØÃﬂ
	g = g + ((31 - g) * evy_g >> 4);
	b = b + ((31 - b) * evy_b >> 4);

	col |= r;
	col |= (g << 5);
	col |= (b << 10);
	
	PaletteWorkTrans[colno] = col;	
}

//------------------------------------------
//	∂◊∞Ã™∞ƒﬁDown
//	In:		colno			; ∂◊∞≈› ﬁ
//			evy_r,g,b		; ãPìxåWêîRGB
//------------------------------------------
void ColorFadeDown( u16 colno, u8 evy_r, u8 evy_g, u8 evy_b )
{
	u16 col,r,g,b;

	col = PaletteWork[colno];

	r = col & 31;										//  RGB
	g = (col & 0x03e0) >> 5;
	b = (col & 0x7c00) >> 10;
	col = 0;

	r = r - ((r * evy_r) >> 4);							// ãPìxDown
	g = g - ((g * evy_g) >> 4);
	b = b - ((b * evy_b) >> 4);

	col |= r;
	col |= (g << 5);
	col |= (b << 10);
	
	PaletteWorkTrans[colno] = col;	
}

//======================================================================
//		Œﬂπæ›âÒïú¥Ã™∏ƒ
//======================================================================
static void PcRecoverTask( u8 );
static void PcRecover0( TASK_TABLE * );
static void PcRecover1( TASK_TABLE * );
static void PcRecover2( TASK_TABLE * );
static void PcRecover3( TASK_TABLE * );
static void DendouBallTask( u8 );
static void DendouBall0( TASK_TABLE * );
static void DendouBall1( TASK_TABLE * );
static void DendouBall2( TASK_TABLE * );
static void DendouBall3( TASK_TABLE * );
static u8 AddRecBallContActor( s16, s16, s16, s16 );
static void RecBallContActMove( actWork * );
static void RecBallCont0( actWork * );
static void RecBallCont1( actWork * );
static void RecBallCont2( actWork * );
static void RecBallCont3( actWork * );
static void RecBallCont4( actWork * );
static void RecBallCont5( actWork * );
static void RecBallCont6( actWork * );
static void RecBallCont7( actWork * );
static void ActPcRecBall( actWork * );
static u8 AddPcRecScreenActor( s16, s16 );
static void ActPcRecScreen( actWork * );
static void AddDendouScreenActor( s16, s16, s16, u8 );
static void ActDendouScreen( actWork * );

//------------------------------------------
//	±∏¿∞√ﬁ∞¿
//------------------------------------------
const PalData FePcRecoverPal =
{ &pc_eff_Palette[0], FE_PcRecover_PalID };

const PalData FeDendouScrnPal =
{ &dendou_obj_Palette[0], FE_DendouScrn_PalID };

static const ActOamData Oam32x16 =
{
	0,										// u32 VPos:8
	0,										// u32 AffineMode:2
	0,										// u32 ObjMode:2
	0,										// u32 Mosaic:1
	0,										// u32 ColorMode:1
	1,										// u32 Shape:2
	0,										// u32 HPos:9
	0,										// u32 AffineParamNo:5
	2,										// u32 Size:2
	0,										// u32 CharNo:10
	0,										// u32 Priority:2
	0,										// u32 Pltt:3
	0,										// AffineWork
};

static const actAnmData pokeball_celltrans[] =
{
	{&pc_eff_Character[(0x20*1)*0], 0x20*1},
};

static const actAnmData pcscreen_celltrans[] =
{
	{&kaifuku_Character[(0x20*6)*0], 0x20*6},
	{&kaifuku_Character[(0x20*6)*1], 0x20*6},
};

static const actAnmData dendou1_celltrans[] =
{
	{&dendou1_obj_Character[0], 0x20*16 },
};

static const actAnmData dendou2_celltrans[] =
{
	{&dendou2_obj_Character[0], 0x20*16 },
};

static const OAMPatData pcscreen_oampat0[] =
{
	{ -12, -8, 1, 0, 0x00, 2 },
	{ 4, -8, 0, 0, 0x02, 2 },
	{ -12, 0, 1, 0, 0x03, 2 },
	{ 4, 0, 0, 0, 0x05, 2, },
};

static const OAMPatSt pcscreen_oampat[] =
{
	{ 4, pcscreen_oampat0 },
};

static const OAMPatData dendou1_oampat0[] =
{
	{ -32, -8, 1, 1, 0x00, 2 },
	{ 0, -8, 1, 1, 0x04, 2 },
	{ -32, 0, 1, 1, 0x08, 2 },
	{ 0, 0, 1, 1, 0x0c, 2 },
};

static const OAMPatSt dendou1_oampat[] =
{
	{ 4, dendou1_oampat0 },
};

static const actAnm pc_rec_anm0[] =
{
	{0,1,0,0},
	{ACT_ANMLOOP,0,0,0},
};

static const actAnm pc_rec_anm1[] =
{
	{0,16,0,0},
	{1,16,0,0},
	{0,16,0,0},
	{1,16,0,0},
	{0,16,0,0},
	{1,16,0,0},
	{0,16,0,0},
	{1,16,0,0},
	{ACT_ANMEND,0,0,0},
};

static const actAnm * const pc_rec_anm_tbl[] =
{
	pc_rec_anm0,
	pc_rec_anm1,
};

static const actAnm * const dendou_anm_tbl[] =
{
	pc_rec_anm0,
};

static const actHeader PcRecBallActHead =
{
	ACT_TMODE,
	FE_PcRecover_PalID,
	&Oam8x8,
	pc_rec_anm_tbl,
	pokeball_celltrans,
	DummyActAffTbl,
	ActPcRecBall,
};

static const actHeader PcRecScreenActHead =
{
	ACT_TMODE,
	FE_Use0_PalID,
	&Oam16x16,
	pc_rec_anm_tbl,
	pcscreen_celltrans,
	DummyActAffTbl,
	ActPcRecScreen,
};

static const actHeader Dendou0ScreenActHead =
{
	ACT_TMODE,
	FE_DendouScrn_PalID,
	&Oam16x16,
	dendou_anm_tbl,
	dendou1_celltrans,
	DummyActAffTbl,
	ActDendouScreen,
};

static const actHeader Dendou1ScreenActHead =
{
	ACT_TMODE,
	FE_DendouScrn_PalID,
	&Oam32x16,
	dendou_anm_tbl,
	dendou2_celltrans,
	DummyActAffTbl,
	ActDendouScreen,
};

//------------------------------------------
//	Œﬂπæ›âÒïú¥Ã™∏ƒ
//------------------------------------------
u32 FePcRecoverSet( void )
{
	u8 i,count;
	TASK_TABLE *task;

	count = PokeCountMineGet();

	i = AddTask( PcRecoverTask, 0xff );
	task = &TaskTable[i];

	task->work[1] = count;
	task->work[2] = 77+16;
	task->work[3] = 36;
	task->work[4] = 104+20;
	task->work[5] = 32-8;

	return( 0 );
}

//------------------------------------------
//	Œﬂπæ›âÒïú¥Ã™∏ƒ¿Ω∏
//------------------------------------------
static void (* const PcRecvoerTaskTbl[])( TASK_TABLE * ) =
{
	PcRecover0,
	PcRecover1,
	PcRecover2,
	PcRecover3,
};

//------------------------------------------
//	Œﬂπæ›âÒïú¥Ã™∏ƒ¿Ω∏
//------------------------------------------
static void PcRecoverTask( u8 no )
{
	TASK_TABLE *task;

	task = &TaskTable[no];
	PcRecvoerTaskTbl[task->work[0]]( task );
}

//------------------------------------------
//	Œﬂπæ›âÒïú 0
//------------------------------------------
static void PcRecover0( TASK_TABLE *task )
{
	task->work[0]++;
	task->work[6] = AddRecBallContActor( task->work[1], task->work[2], task->work[3], 1 );
	task->work[7] = AddPcRecScreenActor( task->work[4], task->work[5] );
}

//------------------------------------------
//	Œﬂπæ›âÒïú 1
//------------------------------------------
static void PcRecover1( TASK_TABLE *task )
{
	if( ActWork[task->work[6]].work[0] >= 2 )
	{
		ActWork[task->work[7]].work[0]++;
		task->work[0]++;
	}
}

//------------------------------------------
//	Œﬂπæ›âÒïú 2
//------------------------------------------
static void PcRecover2( TASK_TABLE *task )
{
	if( ActWork[task->work[6]].work[0] >= 5 )
	{
		task->work[0]++;
	}
}

//------------------------------------------
//	Œﬂπæ›âÒïú 3
//------------------------------------------
static void PcRecover3( TASK_TABLE *task )
{
	if( ActWork[task->work[6]].work[0] >= 7 )
	{
		DelActor( &ActWork[task->work[6]] );
		FeCodeDel( FECODE_PcRecover );
		DelTask( CheckTaskNo(PcRecoverTask) );
	}
}

//------------------------------------------
//	ìaì∞ì¸ÇËŒﬁ∞Ÿ¥Ã™∏ƒ
//------------------------------------------
u32 FeDendouBallSet( void )
{
	u8 i,count;
	TASK_TABLE *task;

	count = PokeCountMineGet();

	i = AddTask( DendouBallTask, 0xff );
	task = &TaskTable[i];

	task->work[1] = count;
	task->work[2] = 117;
	task->work[3] = 52;

	return( 0 );
}

//------------------------------------------
//	ìaì∞ì¸ÇËŒﬁ∞Ÿ¥Ã™∏ƒ¿Ω∏
//------------------------------------------
static void (* const DendouBallTaskTbl[])( TASK_TABLE * ) =
{
	DendouBall0,
	DendouBall1,
	DendouBall2,
	DendouBall3,
};

//------------------------------------------
//	ìaì∞ì¸ÇËŒﬁ∞Ÿ¥Ã™∏ƒ¿Ω∏
//------------------------------------------
static void DendouBallTask( u8 no )
{
	TASK_TABLE *task;

	task = &TaskTable[no];
	DendouBallTaskTbl[task->work[0]]( task );
}

//------------------------------------------
//	ìaì∞Œﬁ∞Ÿ 0
//------------------------------------------
static void DendouBall0( TASK_TABLE *task )
{
	u8 no;

	task->work[0]++;
	task->work[6] = AddRecBallContActor( task->work[1], task->work[2], task->work[3], 0 );
	
	no = CheckTaskNo( DendouBallTask );

	AddDendouScreenActor( no, 120, 24, 0 );
	AddDendouScreenActor( no, 40, 8, 1 );
	AddDendouScreenActor( no, 72, 8, 1 );
	AddDendouScreenActor( no, 168, 8, 1 );
	AddDendouScreenActor( no, 200, 8, 1 );
}

//------------------------------------------
//	ìaì∞Œﬁ∞Ÿ 1
//------------------------------------------
static void DendouBall1( TASK_TABLE *task )
{
	if( ActWork[task->work[6]].work[0] >= 2 )
	{
		task->work[15]++;
		task->work[0]++;
	}
}

//------------------------------------------
//	ìaì∞Œﬁ∞Ÿ 2
//------------------------------------------
static void DendouBall2( TASK_TABLE *task )
{
	if( ActWork[task->work[6]].work[0] >= 5 )
	{
		task->work[0]++;
	}
}

//------------------------------------------
//	ìaì∞Œﬁ∞Ÿ 3
//------------------------------------------
static void DendouBall3( TASK_TABLE *task )
{
	if( ActWork[task->work[6]].work[0] >= 7 )
	{
		DelActor( &ActWork[task->work[6]] );
		FeCodeDel( FECODE_DendouBall);
		DelTask( CheckTaskNo(DendouBallTask) );
	}
}

//------------------------------------------
//	Œﬁ∞Ÿ∫›ƒ€∞Ÿ±∏¿∞æØƒ
//------------------------------------------
static u8 AddRecBallContActor( s16 count, s16 dx, s16 dy, s16 seflag )
{
	u8 i;
	actWork *act;

	i = AddDummyActor( RecBallContActMove );
	act = &ActWork[i];

	act->dx = dx;
	act->dy = dy;
	act->work[5] = seflag;
	act->work[6] = count;
	act->work[7] = i;

	return( i );
}

//------------------------------------------
//	Œﬁ∞Ÿ∫›ƒ€∞Ÿèàóù√∞ÃﬁŸ
//------------------------------------------
static void (* const RecBallContTbl[])( actWork * ) =
{
	RecBallCont0,
	RecBallCont1,
	RecBallCont2,
	RecBallCont3,
	RecBallCont4,
	RecBallCont5,
	RecBallCont6,
	RecBallCont7,
};

//------------------------------------------
//	Œﬁ∞Ÿ∫›ƒ€∞Ÿ±∏¿∞
//------------------------------------------
static void RecBallContActMove( actWork *act )
{
	RecBallContTbl[act->work[0]]( act );
}

//------------------------------------------
//	Œﬁ∞ŸîzíuµÃæØƒ
//------------------------------------------
static const POINT RecBallOffsetTbl[] =
{
	{ 0, 0 },{ 6, 0 },
	{ 0, 4 },{ 6, 4 },
	{ 0, 8 },{ 6, 8 },
};

//------------------------------------------
//	Œﬁ∞Ÿ 0 Œﬁ∞Ÿîzíu
//------------------------------------------
static void RecBallCont0( actWork *act )
{
	u8 i;

	if( act->work[1] ) act->work[1]--;

	if( act->work[1] == 0 )
	{
		act->work[1] = 25;

		i = AddActorBottom( &PcRecBallActHead,
				RecBallOffsetTbl[act->work[2]].x + act->dx,
				RecBallOffsetTbl[act->work[2]].y + act->dy, 0 );

		ActWork[i].oamData.Priority = 2;
		ActWork[i].work[0] = act->work[7];
		
		act->work[2]++;									// Œﬁ∞Ÿå¬êî∂≥›ƒ
		act->work[6]--;									// Œﬁ∞Ÿîzíu∂≥›ƒ
		
		SePlay( SE_BOWA );
	}

	if( act->work[6] == 0 )
	{
		act->work[1] = 32;
		act->work[0]++;
	}
}

//------------------------------------------
//	Œﬁ∞Ÿ 1 ≥™≤ƒ
//------------------------------------------
static void RecBallCont1( actWork *act )
{
	if( --act->work[1] == 0 )
	{
		act->work[0]++;
		act->work[1] = 8;
		act->work[2] = 0;
		act->work[3] = 0;
		if( act->work[5] ) JinglePlay( MUS_ME_ASA );
	}

	return;
}

//------------------------------------------
//	Œﬁ∞Ÿ 2 ∂◊∞¥Ã™∏ƒ
//------------------------------------------
static const u8 b_r[4] = { 16, 12, 8, 0 };
static const u8 b_g[4] = { 16, 12, 8, 0 };
static const u8 b_b[4] = {  0,  0, 0, 0 };

#define	POKEREC_PALNO (OBJPALNO_TO_PANO(ObjPalNumGet(FE_PcRecover_PalID)))

static void RecBallCont2( actWork *act )
{
	u8 no;

	if( --act->work[1] == 0 )
	{
		act->work[1] = 8;
		act->work[2] = (act->work[2] + 1) & 3;
		if( act->work[2] == 0 ) act->work[3]++;
	}

	no = (act->work[2] + 3) & 3;
	ColorFadeUp( POKEREC_PALNO + PA_COL8, b_r[no], b_g[no], b_b[no] );
	no = (act->work[2] + 2) & 3;
	ColorFadeUp( POKEREC_PALNO + PA_COL6, b_r[no], b_g[no], b_b[no] );
	no = (act->work[2] + 1) & 3;
	ColorFadeUp( POKEREC_PALNO + PA_COL2, b_r[no], b_g[no], b_b[no] );
	no = act->work[2];
	ColorFadeUp( POKEREC_PALNO + PA_COL5, b_r[no], b_g[no], b_b[no] );
	ColorFadeUp( POKEREC_PALNO + PA_COL3, b_r[no], b_g[no], b_b[no] );

	if( act->work[3] >= 3 )
	{
		act->work[0]++;
		act->work[1] = 8;
		act->work[2] = 0;
	}
}

//------------------------------------------
//	Œﬁ∞Ÿ3 ∂◊∞¥Ã™∏ƒèIóπ
//------------------------------------------
static void RecBallCont3( actWork *act )
{
	u8 no;

	act->work[1]--;

	if( act->work[1] == 0 )
	{
		act->work[1] = 8;
		act->work[2] = (act->work[2] + 1) & 3;

		if( act->work[2] == 3 )
		{
			act->work[0]++;
			act->work[1] = 30;
		}
	}

	no = act->work[2];
	ColorFadeUp( POKEREC_PALNO + PA_COL8, b_r[no], b_g[no], b_b[no] );
	ColorFadeUp( POKEREC_PALNO + PA_COL6, b_r[no], b_g[no], b_b[no] );
	ColorFadeUp( POKEREC_PALNO + PA_COL2, b_r[no], b_g[no], b_b[no] );
	ColorFadeUp( POKEREC_PALNO + PA_COL5, b_r[no], b_g[no], b_b[no] );
	ColorFadeUp( POKEREC_PALNO + PA_COL3, b_r[no], b_g[no], b_b[no] );
}

//------------------------------------------
//	Œﬁ∞Ÿ 4 ≥™≤ƒ
//------------------------------------------
static void RecBallCont4( actWork *act )
{
	if( --act->work[1] == 0 )
	{
		act->work[0]++;
	}
}

//------------------------------------------
//	Œﬁ∞Ÿ5 çÌèúë“Çø
//------------------------------------------
static void RecBallCont5( actWork *act )
{
	act->work[0]++;
}

//------------------------------------------
//	¥Ã™∏ƒ6 èIóπ
//------------------------------------------
static void RecBallCont6( actWork *act )
{
	if( act->work[5] == 0 || JingleWait() )				// ºﬁ›∏ﬁŸèIóπ
	{
		act->work[0]++;
	}
}

//------------------------------------------
//	¥Ã™∏ƒ7 ñ{ëÃçÌèúë“Çø
//------------------------------------------
static void RecBallCont7( actWork *act )
{
	// ë“Çø
}

//------------------------------------------
//	Œﬁ∞Ÿ±∏¿
//------------------------------------------
static void ActPcRecBall( actWork *act )
{
	if( ActWork[act->work[0]].work[0] >= 5 )
	{
		FeDelAct( act );
		return;
	}
}

//------------------------------------------
//	Ω∏ÿ∞›±∏¿æØƒ
//------------------------------------------
static u8 AddPcRecScreenActor( s16 x, s16 y )
{
	u8 i;
	actWork *act;

	i = AddActorBottom( &PcRecScreenActHead, x, y, 0 );
	
	act = &ActWork[i];
	act->oamData.Priority = 2;
	act->banish = 1;
	SetActOamPat( act, pcscreen_oampat );

	return( i );
}

//------------------------------------------
//	Ω∏ÿ∞›±∏¿
//------------------------------------------
static void ActPcRecScreen( actWork *act )
{
	if( act->work[0] )
	{
		act->work[0] = 0;
		act->banish = 0;
		ActAnmChg( act, 1 );
	}

	if( act->anmend_sw )
	{
		FeDelAct( act );
	}
}

//------------------------------------------
//	ìaì∞ì¸ÇËΩ∏ÿ∞›±∏¿æØƒ
//------------------------------------------
static void AddDendouScreenActor( s16 no, s16 x, s16 y, u8 flag )
{
	u8 i;

	if( flag == 0 )
	{
		i = AddActorBottom( &Dendou0ScreenActHead, x, y, 0 );
		SetActOamPat( &ActWork[i], dendou1_oampat );
	}
	else
	{
		i = AddActorBottom( &Dendou1ScreenActHead, x, y, 0 );
	}

	ActWork[i].banish = 1;
	ActWork[i].work[0] = no;
}

//------------------------------------------
//	ìaì∞ì¸ÇËΩ∏ÿ∞›±∏¿
//------------------------------------------
static void ActDendouScreen( actWork *act )
{
	if( TaskTable[act->work[0]].work[15] )
	{
		if( act->work[1] ) act->work[1]--;

		if( act->work[1] == 0 )
		{
			act->work[1] = 16;
			act->banish ^= 1;
		}
	
		act->work[2]++;
	}

	if( act->work[2] >= 128 )
	{
		FeDelAct( act );
	}
}

//======================================================================
//		ÇªÇÁÇÇ∆Ç‘
//======================================================================
static void FieldFlyOutStartEffect( void );
static void FlyOutEffectTask( u8 );
static void FieldFlyInStartEffect( void );
static void FlyInEffectTask( u8 );

//------------------------------------------
//	ÇªÇÁÇÇ∆Ç‘äJén
//------------------------------------------
void SetFieldFlyInStart( void )
{
	MainProcChange( FieldMainRecover );
	pFieldRecoverFunc = FieldFlyOutStartEffect;
}

//------------------------------------------
//	äJén Ã®∞Ÿƒﬁèâä˙âªèàóù
//------------------------------------------
static void FieldFlyOutStartEffect( void )
{
	FieldFadeBlackInSet();
	AddTask( FlyOutEffectTask, 0 );
	SetForceEvent();
	EvObjPauseAll();
	pFieldRecoverFunc = NULL;
}

//------------------------------------------
//	äJén ¥Ã™∏ƒ∫›ƒ€∞Ÿ¿Ω∏
//------------------------------------------
static void FlyOutEffectTask( u8 no )
{
	TASK_TABLE *task;
	
	task = &TaskTable[no];

	if( task->work[0] == 0 )
	{
		if( FieldFadeinCheck() == 0 )
		{
			return;
		}

		FeSetWork[0] = FPokeNo;
		if( FeSetWork[0] > 5 ) FeSetWork[0] = 0;		// √ﬁ ﬁØ∏ﬁëŒçÙ

		FldEffSet( FECODE_HidenPokeSora );
		task->work[0]++;
	}

	if( FeCodeChk(FECODE_HidenPokeSora) == 0 )
	{
		InitEventFlagAtFlying();						// ÇªÇÁÇÇ∆Ç‘Ç…ÇÊÇÈÉtÉâÉOèâä˙âª
		SetNextWorldPosition();
		MainProcChange( FieldMainInit );
		pFieldRecoverFunc = FieldFlyInStartEffect;
		DelTask( no );
	}
}

//------------------------------------------
//	ïúãA Ã®∞Ÿƒﬁèâä˙âªéû
//------------------------------------------
static void FieldFlyInStartEffect( void )
{
	MapBGM_Start();
	FieldFadeBlackInSet();
	AddTask( FlyInEffectTask, 0 );
	EvObjNoBanishOn( MyMoveState.evobjno );
	
	if( MyMoveState.flag & MY_MV_BIT_SWIM )				// Œﬂπ”›ÇÃå¸Ç´ÇçáÇÌÇπÇÈ
	{
		EvObjChgSite( &EvObj[MyMoveState.evobjno], SITE_L );
	}

	SetForceEvent();
	EvObjPauseAll();
	pFieldRecoverFunc = NULL;
}

//------------------------------------------
//	ïúãA ¥Ã™∏ƒ∫›ƒ€∞Ÿ¿Ω∏
//------------------------------------------
static void FlyInEffectTask( u8 no )
{
	TASK_TABLE *task;
	
	task = &TaskTable[no];

	if( task->work[0] == 0 )
	{
		if( FadeData.fade_sw )
		{
			return;
		}
		
		FldEffSet( FECODE_HidenPokeSoraEnd );
		task->work[0]++;
	}

	if( FeCodeChk(FECODE_HidenPokeSoraEnd) == 0 )
	{
		ResetForceEvent();
		EvObjPauseClrAll();
		DelTask( no );
	}
}

//======================================================================
//		óéÇ∆Çµåäóéâ∫
//======================================================================
static void FallInTask( u8 );
static u8 FallIn0( TASK_TABLE * );
static u8 FallIn1( TASK_TABLE * );
static u8 FallIn2( TASK_TABLE * );
static u8 FallIn3( TASK_TABLE * );
static u8 FallIn4( TASK_TABLE * );
static u8 FallIn5( TASK_TABLE * );
static u8 FallIn6( TASK_TABLE * );

//------------------------------------------
//	éÂêlåˆóéâ∫¿Ω∏æØƒ
//------------------------------------------
void FieldInitFallTask( void )
{
	MapBGM_Start();
	FieldFadeInSet();
	SetForceEvent();
	EvObjPauseAll();
	AddTask( FallInTask, 0 );
	pFieldRecoverFunc = NULL;
}

//------------------------------------------
//	óéâ∫èàóù√∞ÃﬁŸ
//------------------------------------------
static u8 (* const FallInTaskTbl[])( TASK_TABLE * ) =
{
	FallIn0,
	FallIn1,
	FallIn2,
	FallIn3,
	FallIn4,
	FallIn5,
	FallIn6,
};

//------------------------------------------
//	óéâ∫èàóù
//------------------------------------------
static void FallInTask( u8 no )
{
	TASK_TABLE *task;

	task = &TaskTable[no];

	while( FallInTaskTbl[task->work[0]](task) );
}

//------------------------------------------
//	óéâ∫0
//------------------------------------------
static u8 FallIn0( TASK_TABLE *task )
{
	actWork *act;
	EventOBJ *ev;
	
	ev = &EvObj[MyMoveState.evobjno];
	act = &ActWork[MyMoveState.actno];

	FldScrollActStop();
	EvObjNoBanishOn( MyMoveState.evobjno );
	MyMoveState.mv_pause = 1;
	AcmdSet( ev, AcmdCodeStopSite(GetHeroSite()) );
	
	(u8)task->work[4] = act->oampat_sw;					// âº
	ev->priority_hold_sw = 1;							// âº
	act->oamData.Priority = BGPRI1;
	act->oampat_sw = OAMPAT_PRIUNIT;

	task->work[0]++;
	return( 1 );
}

//------------------------------------------
//	óéâ∫ 1
//------------------------------------------
static u8 FallIn1( TASK_TABLE *task )
{
	if( FieldFadeinCheck() )
	{
		task->work[0]++;
	}

	return( 0 );
}

//------------------------------------------
//	óéâ∫ 2
//------------------------------------------
static u8 FallIn2( TASK_TABLE *task )
{
	s16 y_size;
	actWork *act;

	act = &ActWork[MyMoveState.actno];

	y_size = -(act->cy + act->cy);
	act->dy = -(act->y + act->cy + ActOY + y_size);
	task->work[1] = 1;
	task->work[2] = 0;
	EvObjNoBanishOff( MyMoveState.evobjno );
	SePlay( SE_RU_HYUU );
	task->work[0]++;

	return( 0 );
}

//------------------------------------------
//	óéâ∫3
//------------------------------------------
static u8 FallIn3( TASK_TABLE *task )
{
	actWork *act;
	EventOBJ *ev;
	
	ev = &EvObj[MyMoveState.evobjno];
	act = &ActWork[MyMoveState.actno];

	act->dy += task->work[1];

	if( task->work[1] < 8 )
	{
		task->work[2] += task->work[1];

		if( task->work[2] & 0x0f )
		{
			task->work[1] <<= 1;
		}
	}

	if( task->work[3] == 0 && act->dy >= -16 )			// âº
	{
		task->work[3]++;
		ev->priority_hold_sw = 0;
		act->oampat_sw = (u8)task->work[4];
		ev->move_start_sw = 1;
	}

	if( act->dy >= 0 )
	{
		SePlay( SE_W070 );
		ev->move_end_sw = 1;
		ev->move_jump_end_sw = 1;
		act->dy = 0;
		task->work[0]++;
	}

	return( 0 );
}

//------------------------------------------
//	óéâ∫4
//------------------------------------------
static u8 FallIn4( TASK_TABLE *task )
{
	task->work[0]++;
	task->work[1] = 4;
	task->work[2] = 0;
	SetMapViewFunc( NULL );

	return( 1 );
}

//------------------------------------------
//	óéâ∫5
//------------------------------------------
static u8 FallIn5( TASK_TABLE *task )
{
	SetMapViewOffset( 0, task->work[1] );
	
	task->work[1] = -task->work[1];
	task->work[2]++;

	if( (task->work[2]&0x03) == 0 )
	{
		task->work[1] >>= 1;
	}

	if( task->work[1] == 0 )
	{
		task->work[0]++;
	}

//	MapViewControl();									// main

	return( 0 );
}

//------------------------------------------
//	óéâ∫6
//------------------------------------------
static u8 FallIn6( TASK_TABLE *task )
{
	MyMoveState.mv_pause = 0;
	ResetForceEvent();
	FldScrollPosInit();
	EvObjPauseClrAll();
	MapViewInit();
	DelTask( CheckTaskNo(FallInTask) );

	return( 0 );
}

//======================================================================
//		¥Ω∂⁄∞¿
//======================================================================
static void MapChangeEscalatorTask( u8 );
static u8 MapChgEscalator0( TASK_TABLE * );
static u8 MapChgEscalator1( TASK_TABLE * );
static u8 MapChgEscalator2( TASK_TABLE * );
static u8 MapChgEscalator3( TASK_TABLE * );
static u8 MapChgEscalator4( TASK_TABLE * );
static u8 MapChgEscalator5( TASK_TABLE * );
static void EscalatorUpHeroActorMove( TASK_TABLE * );
static void EscalatorDownHeroActorMove( TASK_TABLE * );
static void MapChgEscalatorSetProc0( void );
static void MapChgEscalatorSetProc1( void );
static void FieldInitEscalatorTask( void );
static void MapInEscalatorTask( u8 );
static u8 MapInEscalator0(TASK_TABLE*);
static u8 MapInEscalator1(TASK_TABLE*);
static u8 MapInEscalator2(TASK_TABLE*);
static u8 MapInEscalator3(TASK_TABLE*);
static u8 MapInEscalator4(TASK_TABLE*);
static u8 MapInEscalator5(TASK_TABLE*);
static u8 MapInEscalator6(TASK_TABLE*);

//------------------------------------------
//	œØÃﬂ¡™›ºﬁ¥Ω∂⁄∞¿
//	In:		attr			; ¥⁄Õﬁ∞¿±ƒÿÀﬁ≠∞ƒ
//			pri				; ¿Ω∏Ãﬂ◊≤µÿ√®
//------------------------------------------
void SetMapChangeEscalatorTask( u8 attr, u8 task_pri )
{
	u8 i;

	i = AddTask( MapChangeEscalatorTask, task_pri );
	
	TaskTable[i].work[1] = ESCALATOR_DOWN;

	if( attr == 0x6a )
	{
		TaskTable[i].work[1] = ESCALATOR_UP;
	}
}

//------------------------------------------
//	¥Ω∂⁄∞¿ëJà⁄¿Ω∏√∞ÃﬁŸ
//------------------------------------------
static u8 (* const MapChgEscalatorTbl[])( TASK_TABLE * ) =
{
	MapChgEscalator0,
	MapChgEscalator1,
	MapChgEscalator2,
	MapChgEscalator3,
	MapChgEscalator4,
	MapChgEscalator5,
};

//------------------------------------------
//	¥Ω∂⁄∞¿ëJà⁄¿Ω∏
//------------------------------------------
static void MapChangeEscalatorTask( u8 no )
{
	TASK_TABLE *task;

	task = &TaskTable[no];

	while( MapChgEscalatorTbl[task->work[0]](task) );
}

//------------------------------------------
//	ëJà⁄¥Ω∂⁄∞¿ 0
//------------------------------------------
static u8 MapChgEscalator0( TASK_TABLE *task )
{
	EvObjPauseAll();
	FldScrollActStop();
	AddEscalatorBGAnm( (u8)task->work[1] );
	
	task->work[0]++;

	return( 0 );
}

//------------------------------------------
//	ëJà⁄¥Ω∂⁄∞¿ 1
//------------------------------------------
static u8 MapChgEscalator1( TASK_TABLE *task )
{
	EventOBJ *ev;

	ev = &EvObj[MyMoveState.evobjno];

	if( AcmdSetChk(ev) && AcmdEnd(ev) == 0 )			// àÍâû
	{
		return( 0 );
	}

	AcmdSet( ev, AcmdCodeStopSite(GetHeroSite()) );		// àÍâû

	task->work[0]++;
	task->work[2] = 0;
	task->work[3] = 0;

	if( (u8)task->work[1] == ESCALATOR_DOWN )			// â∫ÇË
	{
		task->work[0] = 4;
	}

	SePlay( SE_ESUKA );
	
	return( 0 );
}

//------------------------------------------
//	ëJà⁄¥Ω∂⁄∞¿ 2 è„ÇË
//------------------------------------------
static u8 MapChgEscalator2( TASK_TABLE *task )
{
	EscalatorUpHeroActorMove( task );

	if( task->work[2] >= 4 )
	{
		MapChgEscalatorSetProc0();
		task->work[0]++;
	}
	
	return( 0 );
}

//------------------------------------------
//	ëJà⁄¥Ω∂⁄∞¿ 3
//------------------------------------------
static u8 MapChgEscalator3( TASK_TABLE *task )
{
	EscalatorUpHeroActorMove( task );
	MapChgEscalatorSetProc1();
	
	return( 0 );
}

//------------------------------------------
//	ëJà⁄¥Ω∂⁄∞¿ 4 â∫ÇË
//------------------------------------------
static u8 MapChgEscalator4( TASK_TABLE *task )
{
	EscalatorDownHeroActorMove( task );

	if( task->work[2] >= 4 )
	{
		MapChgEscalatorSetProc0();
		task->work[0]++;
	}
	
	return( 0 );
}

//------------------------------------------
//	ëJà⁄¥Ω∂⁄∞¿ 5
//------------------------------------------
static u8 MapChgEscalator5( TASK_TABLE *task )
{
	EscalatorDownHeroActorMove( task );
	MapChgEscalatorSetProc1();
	
	return( 0 );
}

//------------------------------------------
//	é©ã@±∏¿∞ è„ÇË
//------------------------------------------
static void EscalatorUpHeroActorMove( TASK_TABLE *task )
{
	actWork *act;

	act = &ActWork[MyMoveState.actno];
	act->dx = CosMove( 132, task->work[2] );
	act->dy = SinMove( 148, task->work[2] );

	task->work[3]++;

	if( task->work[3] & 0x01 )
	{
		task->work[2]++;
	}
}

//------------------------------------------
//	é©ã@±∏¿∞ â∫ÇË
//------------------------------------------
static void EscalatorDownHeroActorMove( TASK_TABLE *task )
{
	actWork *act;

	act = &ActWork[MyMoveState.actno];
	act->dx = CosMove( 124, task->work[2] );
	act->dy = SinMove( 118, task->work[2] );

	task->work[3]++;

	if( task->work[3] & 0x01 )
	{
		task->work[2]++;
	}
}

//------------------------------------------
//	œØÃﬂëJà⁄ÇÃ±⁄ ÇªÇÃ1
//------------------------------------------
static void MapChgEscalatorSetProc0( void )
{
	MapBGM_FadeOutSet();
	FieldFadeOutSet();
}

//------------------------------------------
//	œØÃﬂëJà⁄ÇÃ±⁄ ÇªÇÃ2
//------------------------------------------
static void MapChgEscalatorSetProc1( void )
{
	if( FadeData.fade_sw == 0 &&
		MapBGM_FadeWait() == TRUE )
	{
		DelEscalatorBGAnm();
		SetNextWorldPosition();
		pFieldRecoverFunc = FieldInitEscalatorTask;
		MainProcChange( FieldMainInit );
		DelTask( CheckTaskNo(MapChangeEscalatorTask) );
	}
}

//------------------------------------------
//	¥Ω∂⁄∞¿ œØÃﬂäJén
//------------------------------------------
void FieldInitEscalatorTask( void )
{
	MapBGM_Start();
	FieldFadeInSet();
	SetForceEvent();
	AddTask( MapInEscalatorTask, 0 );
	pFieldRecoverFunc = NULL;
}

//------------------------------------------
//	¥Ω∂⁄∞¿ œØÃﬂäJén¿Ω∏√∞ÃﬁŸ
//------------------------------------------
static u8 (* const MapInEscalatorTaskTbl[])( TASK_TABLE * ) =
{
	MapInEscalator0,
	MapInEscalator1,
	MapInEscalator2,
	MapInEscalator3,
	MapInEscalator4,
	MapInEscalator5,
	MapInEscalator6,
};

//------------------------------------------
//	¥Ω∂⁄∞¿ œØÃﬂäJén¿Ω∏
//------------------------------------------
static void MapInEscalatorTask( u8 no )
{
	TASK_TABLE *task;
	
	task = &TaskTable[no];
	while( MapInEscalatorTaskTbl[task->work[0]](task) );
}

//------------------------------------------
//	œØÃﬂäJén¥Ω∂⁄∞¿ 0
//------------------------------------------
static u8 MapInEscalator0( TASK_TABLE *task )
{
	u8 attr;
	s16 x,y;

	FldScrollActStop();
	AcmdSet( &EvObj[MyMoveState.evobjno], AcmdCodeStopSite(SITE_R) );

	GetHeroCellPos( &x, &y );
	attr = GetCellAttribute( x, y );
	
	task->work[0]++;
	task->work[1] = 16;

	if( attr == 0x6b )									// â∫ÇËÇ©ÇÁ
	{
		attr = ESCALATOR_UP;
		task->work[0] = 3;
	}
	else
	{
		attr = ESCALATOR_DOWN;
	}

	AddEscalatorBGAnm( attr );

	return( 1 );
}

//------------------------------------------
//	œØÃﬂäJén¥Ω∂⁄∞¿ 1 è„ÇË
//------------------------------------------
static u8 MapInEscalator1( TASK_TABLE *task )
{
	actWork *act;

	act = &ActWork[MyMoveState.actno];

	act->dx = CosMove( 132, task->work[1] );
	act->dy = SinMove( 148, task->work[1] );
	
	task->work[0]++;
	
	return( 0 );
}

//------------------------------------------
//	œØÃﬂäJén¥Ω∂⁄∞¿ 2
//------------------------------------------
static u8 MapInEscalator2( TASK_TABLE *task )
{
	actWork *act;
	
	act = &ActWork[MyMoveState.actno];
	
	act->dx = CosMove( 132, task->work[1] );
	act->dy = SinMove( 148, task->work[1] );
	
	task->work[2]++;
	
	if( task->work[2] & 0x01 )
	{
		task->work[1]--;
	}
	
	if( task->work[1] == 0 )
	{
		act->dx = 0;
		act->dy = 0;
		task->work[0] = 5;
	}
	
	return( 0 );
}

//------------------------------------------
//	œØÃﬂäJén¥Ω∂⁄∞¿ 3 â∫ÇË
//------------------------------------------
static u8 MapInEscalator3( TASK_TABLE *task )
{
	actWork *act;

	act = &ActWork[MyMoveState.actno];

	act->dx = CosMove( 124, task->work[1] );
	act->dy = SinMove( 118, task->work[1] );
	
	task->work[0]++;
	
	return( 0 );
}

//------------------------------------------
//	œØÃﬂäJén¥Ω∂⁄∞¿ 4
//------------------------------------------
static u8 MapInEscalator4( TASK_TABLE *task )
{
	actWork *act;
	
	act = &ActWork[MyMoveState.actno];
	
	act->dx = CosMove( 124, task->work[1] );
	act->dy = SinMove( 118, task->work[1] );
	
	task->work[2]++;
	
	if( task->work[2] & 0x01 )
	{
		task->work[1]--;
	}
	
	if( task->work[1] == 0 )
	{
		act->dx = 0;
		act->dy = 0;
		task->work[0]++;
	}
	
	return( 0 );
}

//------------------------------------------
//	œØÃﬂäJén¥Ω∂⁄∞¿ 5
//------------------------------------------
static u8 MapInEscalator5( TASK_TABLE *task )
{
	if( CheckEscalatorBGAnm() )
	{
		return( 0 );
	}
	
	DelEscalatorBGAnm();
	
	task->work[0]++;
	return( 1 );
}

//------------------------------------------
//	œØÃﬂäJén¥Ω∂⁄∞¿ 6
//------------------------------------------
static u8 MapInEscalator6( TASK_TABLE *task )
{
	EventOBJ *ev;
	
	ev = &EvObj[MyMoveState.evobjno];

	if( AcmdEnd(ev) == 0 )
	{
		return( 0 );
	}

	FldScrollPosInit();
	ResetForceEvent();
	AcmdSet( ev, AcmdCodeWalk1(SITE_R) );

	DelTask( CheckTaskNo(MapInEscalatorTask) );

	return( 0 );
}

//======================================================================
//		ëÍìoÇË
//======================================================================
static void TakiTask( u8 );
static u8 Taki0( TASK_TABLE *, EventOBJ * );
static u8 Taki1( TASK_TABLE *, EventOBJ * );
static u8 Taki2( TASK_TABLE *, EventOBJ * );
static u8 Taki3( TASK_TABLE *, EventOBJ * );
static u8 Taki4( TASK_TABLE *, EventOBJ * );

//------------------------------------------
//	Ã®∞Ÿƒﬁ¥Ã™∏ƒ ëÍè„ÇËæØƒ
//	In:		work0			; Œﬂπ”›No
//------------------------------------------
u32 FeTakinoboriSet( void )
{
	u8 i;
	
	i = AddTask( TakiTask, 0xff );
	TaskTable[i].work[1] = FeSetWork[0];
	TakiTask( i );

	return( 0 );
}

//------------------------------------------
//	ëÍìoÇË¿Ω∏√∞ÃﬁŸ
//------------------------------------------
static u8 (* const TakiTaskTbl[])( TASK_TABLE *, EventOBJ * ) =
{
	Taki0,
	Taki1,
	Taki2,
	Taki3,
	Taki4,
};

//------------------------------------------
//	ëÍìoÇË
//------------------------------------------
static void TakiTask( u8 no )
{
	while( TakiTaskTbl[TaskTable[no].work[0]](&TaskTable[no],&EvObj[MyMoveState.evobjno]) );
}

//------------------------------------------
//	ëÍ 0
//------------------------------------------
static u8 Taki0( TASK_TABLE *task, EventOBJ *ev )
{
	SetForceEvent();
	MyMoveState.mv_pause = 1;
	task->work[0]++;

	return( 0 );
}

//------------------------------------------
//	ëÍ 1
//------------------------------------------
static u8 Taki1( TASK_TABLE *task, EventOBJ *ev )
{
	SetForceEvent();

	if( AcmdSetChk(ev) )
	{
		return( 0 );
	}
	
	AcmdEnd( ev );
	
	FeSetWork[0] = task->work[1];
	FldEffSet( FECODE_HidenCutInMine );

	task->work[0]++;
	return( 0 );
}

//------------------------------------------
//	ëÍ 2
//------------------------------------------
static u8 Taki2( TASK_TABLE *task, EventOBJ *ev )
{
	if( FeCodeChk(FECODE_HidenCutIn) )
	{
		return( 0 );
	}
	
	task->work[0]++;
	return( 1 );
}

//------------------------------------------
//	ëÍ 3
//------------------------------------------
static u8 Taki3( TASK_TABLE *task, EventOBJ *ev )
{
	AcmdSet( ev, AcmdCodeWalk05(SITE_U) );
	task->work[0]++;
	return( 0 );
}

//------------------------------------------
//	ëÍ 4
//------------------------------------------
static u8 Taki4( TASK_TABLE *task, EventOBJ *ev )
{
	if( AcmdEnd(ev) == 0 )
	{
		return( 0 );
	}

	if( ATR_IsWaterFallCheck(ev->now_attr) )
	{
		task->work[0] = 3;
		return( 1 );
	}

	ResetForceEvent();
	MyMoveState.mv_pause = 0;
	DelTask( CheckTaskNo(TakiTask) );
	FeCodeDel( FECODE_Takinobori );

	return( 0 );
}

//======================================================================
//		¿ﬁ≤Àﬁ›∏ﬁ
//======================================================================
static void DivingTask( u8 );
static u8 Diving0( TASK_TABLE * );
static u8 Diving1( TASK_TABLE * );
static u8 Diving2( TASK_TABLE * );
#if 0
static void DivingMapChangeAbove( void );
static void DivingMapChangeBelow( void );
#endif

//------------------------------------------
//	Ã®∞Ÿƒﬁ¥Ã™∏ƒ ¿ﬁ≤Àﬁ›∏ﬁ
//	In:		work0			; Œﬂπ”›≈› ﬁ
//			work1			; 0=ïÇè„,1=êˆÇÈ
//------------------------------------------
u32 FeDivingSet( void )
{
	u8 i;

	i = AddTask( DivingTask, 0xff );
	TaskTable[i].work[15] = FeSetWork[0];
	TaskTable[i].work[14] = FeSetWork[1];

	DivingTask( i );

	return( 0 );
}

//------------------------------------------
//	¿ﬁ≤Àﬁ›∏ﬁèàóù√∞ÃﬁŸ
//------------------------------------------
static u8 (* const DivingTaskTbl[])( TASK_TABLE * ) =
{
	Diving0,
	Diving1,
	Diving2,
};

//------------------------------------------
//	¿ﬁ≤Àﬁ›∏ﬁ¿Ω∏
//------------------------------------------
static void DivingTask( u8 no )
{
	while( DivingTaskTbl[TaskTable[no].work[0]](&TaskTable[no]) );
}

//------------------------------------------
//	¿ﬁ≤Àﬁ›∏ﬁ 0
//------------------------------------------
static u8 Diving0( TASK_TABLE *task )
{
	MyMoveState.mv_pause = 1;
	task->work[0]++;
	
	return( 0 );
}

//------------------------------------------
//	¿ﬁ≤Àﬁ›∏ﬁ 1
//------------------------------------------
static u8 Diving1( TASK_TABLE *task )
{
	SetForceEvent();
	FeSetWork[0] = task->work[15];
	FldEffSet( FECODE_HidenCutInMine );
	task->work[0]++;
	
	return( 0 );
}

//------------------------------------------
//	¿ﬁ≤Àﬁ›∏ﬁ 2
//------------------------------------------
static u8 Diving2( TASK_TABLE *task )
{
	EV_POS pos;

	GetHeroCellPos( &pos.x, &pos.y );

	if( FeCodeChk(FECODE_HidenCutIn) == 0 )
	{
		DivingMapMoveCheck( &pos, EvObj[MyMoveState.evobjno].now_attr );
#if 0
		pFieldRecoverFunc = DivingMapChangeAbove;

		if( task->work[14] )
		{
			pFieldRecoverFunc = DivingMapChangeBelow;
		}
#endif
		DelTask( CheckTaskNo(DivingTask) );
		FeCodeDel( FECODE_Diving );
	}
	
	return( 0 );
}

#if 0
//------------------------------------------
//	œØÃﬂèâä˙âªéû ïÇè„
//------------------------------------------
static void DivingMapChangeAbove( void )
{
	SetHeroMoveRequest( MY_MV_BIT_SWIM );
	AddFieldInTask();
}

//------------------------------------------
//	œØÃﬂèâä˙âªéû Ç‡ÇÆÇË
//------------------------------------------
static void DivingMapChangeBelow( void )
{
	SetHeroMoveRequest( MY_MV_BIT_DIVING );
	AddFieldInTask();
}
#endif

//======================================================================
//		ä‘åáêÚ
//======================================================================
static void MapChangeGayserTask( u8 );
static u8 MapChgGayser0( TASK_TABLE *, EventOBJ *, actWork * );
static u8 MapChgGayser1( TASK_TABLE *, EventOBJ *, actWork * );
static u8 MapChgGayser2( TASK_TABLE *, EventOBJ *, actWork * );
static u8 MapChgGayser3( TASK_TABLE *, EventOBJ *, actWork * );
static u8 MapChgGayser4( TASK_TABLE *, EventOBJ *, actWork * );
static u8 MapChgGayser5( TASK_TABLE *, EventOBJ *, actWork * );
static void SetMapInGayser( void );
static void MapInGayserTask( u8 );
static u8 MapInGayser0( TASK_TABLE *, EventOBJ *, actWork * );
static u8 MapInGayser1( TASK_TABLE *, EventOBJ *, actWork * );
static u8 MapInGayser2( TASK_TABLE *, EventOBJ *, actWork * );
static u8 MapInGayser3( TASK_TABLE *, EventOBJ *, actWork * );

//------------------------------------------
//	œØÃﬂ¡™›ºﬁ ä‘åáêÚ
//	In:		pri				; ¿Ω∏Ãﬂ◊≤µÿ√®
//------------------------------------------
void SetMapChangeGayser( u8 pri )
{
	AddTask( MapChangeGayserTask, pri );
}

//------------------------------------------
//	ä‘åáêÚèàóù√∞ÃﬁŸ
//------------------------------------------
static u8 (* const MapChangeGayserTbl[])( TASK_TABLE *, EventOBJ *, actWork * ) =
{
	MapChgGayser0,
	MapChgGayser1,
	MapChgGayser2,
	MapChgGayser3,
	MapChgGayser4,
	MapChgGayser5,
};

//------------------------------------------
//	ä‘åáêÚ¿Ω∏
//------------------------------------------
static void MapChangeGayserTask( u8 no )
{
	while( MapChangeGayserTbl[TaskTable[no].work[0]]
		(&TaskTable[no],&EvObj[MyMoveState.evobjno],&ActWork[MyMoveState.actno]) );
}

//------------------------------------------
//	ä‘åáêÚ 0
//------------------------------------------
static u8 MapChgGayser0( TASK_TABLE *task, EventOBJ *ev, actWork *act )
{
	EvObjPauseAll();
	FldScrollActStop();
	SetMapViewFunc( NULL );
	MyMoveState.mv_pause = 1;
	ev->priority_hold_sw = 1;

	task->work[1] = 1;
	task->work[0]++;
	return( 1 );
}

//------------------------------------------
//	ä‘åáêÚ 1
//------------------------------------------
static u8 MapChgGayser1( TASK_TABLE *task, EventOBJ *ev, actWork *act )
{
	SetMapViewOffset( 0, task->work[1] );
	
	task->work[1] = -task->work[1];
	task->work[2]++;
	
	if( task->work[2] >= 8 )								// 4âÒóhÇÍ
	{
		task->work[2] = 0;
		task->work[0]++;
	}
	
	return( 0 );
}

//------------------------------------------
//	ä‘åáêÚ 2 
//------------------------------------------
static u8 MapChgGayser2( TASK_TABLE *task, EventOBJ *ev, actWork *act )
{
	act->dy = 0;
	task->work[3] = 1;

	FeSetWork[0] = ev->gx;
	FeSetWork[1] = ev->gy;
	FeSetWork[2] = act->pri - 1;
	FeSetWork[3] = act->oamData.Priority;
	FldEffSet( FECODE_Gayser );
	SePlay( SE_W153 );

	task->work[0]++;
	return( 1 );
}

//------------------------------------------
//	ä‘åáêÚ  3
//------------------------------------------
static u8 MapChgGayser3( TASK_TABLE *task, EventOBJ *ev, actWork *act )
{
	s16 y;

	SetMapViewOffset( 0, task->work[1] );

	task->work[1] = -task->work[1];
	task->work[2]++;

	if( task->work[2] < 18 )							// ±∆“Ç∆çáÇÌÇπÇÈ
	{
		if( (task->work[2]&0x01) == 0 && task->work[1] < 4 )
		{
			task->work[1] <<= 1;
		}
	}
	else
	{
		if( (task->work[2]&0x04) == 0 && task->work[1] > 0 )
		{
			task->work[1] >>= 1;
		}
	}

	if( task->work[2] > 6 )								// ±∆“Ç∆çáÇÌÇπÇÈ
	{
		y = -(act->cy + act->cy);

		if( act->dy > -(act->y + act->cy + ActOY + y) )
		{
			act->dy -= task->work[3];
			if( task->work[3] < 8 ) task->work[3]++;
		}
		else
		{
			task->work[4] = 1;
		}
	}

	if( task->work[5] == 0 && act->dy < -16 )			// âº
	{
		task->work[5]++;
		ev->priority_hold_sw = 1;
		act->oamData.Priority = BGPRI1;
		act->oampat_sw = OAMPAT_PRIUNIT;
	}

	if( task->work[1] == 0 && task->work[4] )
	{
		task->work[0]++;
	}

	return( 0 );
}

//------------------------------------------
//	ä‘åáêÚ 4
//------------------------------------------
static u8 MapChgGayser4( TASK_TABLE *task, EventOBJ *ev, actWork *act )
{
	MapBGM_FadeOutSet();								// Ç Ç´ÇæÇπ
	FieldFadeOutSet();

	task->work[0]++;
	return( 0 );
}

//------------------------------------------
//	ä‘åáêÚ 5
//------------------------------------------
static u8 MapChgGayser5( TASK_TABLE *task, EventOBJ *ev, actWork *act )
{
	if( FadeData.fade_sw == 0 && MapBGM_FadeWait() == TRUE )
	{
		SetNextWorldPosition();
		pFieldRecoverFunc = SetMapInGayser;
		MainProcChange( FieldMainInit );
		DelTask( CheckTaskNo(MapChangeGayserTask) );
	}
	
	return( 0 );
}

//------------------------------------------
//	ä‘åáêÚœØÃﬂ≤›æØƒ
//------------------------------------------
static void SetMapInGayser( void )
{
	MapBGM_Start();
	FieldFadeInSet();
	SetForceEvent();
	pFieldRecoverFunc = NULL;
	AddTask( MapInGayserTask, 0 );
}

//------------------------------------------
//	ä‘åáêÚœØÃﬂ≤›èàóù√∞ÃﬁŸ
//------------------------------------------
static u8 (* const MapInGayserTbl[])( TASK_TABLE *, EventOBJ *, actWork * ) =
{
	MapInGayser0,
	MapInGayser1,
	MapInGayser2,
	MapInGayser3,
};

//------------------------------------------
//	ä‘åáêÚœØÃﬂ≤›¿Ω∏
//------------------------------------------
static void MapInGayserTask( u8 no )
{
	while( MapInGayserTbl[TaskTable[no].work[0]]
		(&TaskTable[no],&EvObj[MyMoveState.evobjno],&ActWork[MyMoveState.actno]) );
}

//------------------------------------------
//	ä‘åáêÚœØÃﬂ≤› 0
//------------------------------------------
static u8 MapInGayser0( TASK_TABLE *task, EventOBJ *ev, actWork *act )
{
	FldScrollActStop();
	EvObjPauseAll();
	MyMoveState.mv_pause = 1;
	ev->banish_sw = 1;

	task->work[0]++;
	return( 0 );
}

//------------------------------------------
//	ä‘åáêÚœØÃﬂ≤› 1
//------------------------------------------
static u8 MapInGayser1( TASK_TABLE *task, EventOBJ *ev, actWork *act )
{
	if( FieldFadeinCheck() )
	{
		FeSetWork[0] = ev->gx;
		FeSetWork[1] = ev->gy;
		FeSetWork[2] = act->pri - 1;
		FeSetWork[3] = act->oamData.Priority;
		task->work[1] = FldEffSet( FECODE_GymSand );
		task->work[0]++;
	}

	return( 0 );
}

//------------------------------------------
//	ä‘åáêÚœØÃﬂ≤› 2
//------------------------------------------
static u8 MapInGayser2( TASK_TABLE *task, EventOBJ *ev, actWork *act )
{
	actWork *sand;
	
	sand = &ActWork[task->work[1]];

	if( sand->anm_offs >= 2 )
	{
		task->work[0]++;
		ev->banish_sw = 0;
		FldScrollPosInit();
		SePlay( SE_W091 );
		AcmdSet( ev, AcmdCodeJump1(SITE_R) );
	}

	return( 0 );
}

//------------------------------------------
//	ä‘åáêÚœØÃﬂ≤› 3
//------------------------------------------
static u8 MapInGayser3( TASK_TABLE *task, EventOBJ *ev, actWork *act )
{
	if( AcmdEnd(ev) )
	{
		MyMoveState.mv_pause = 0;
		ResetForceEvent();
		EvObjPauseClrAll();
		DelTask( CheckTaskNo(MapInGayserTask) );
	}

	return( 0 );
}

//------------------------------------------
//	Ã®∞Ÿƒﬁ¥Ã™∏ƒä‘åáêÚ±∏¿∞æØƒ
//	In:		work0,1			; œØÃﬂç¿ïW
//			work2,3			; ±∏¿,BGÃﬂ◊≤µÿ√®
//------------------------------------------
u32 FeGayserSet( void )
{
	u32 i;

	MapCellSizePosDiffOffs( (s16*)&FeSetWork[0], (s16*)&FeSetWork[1], 8, 8 );
	i = AddActorBottom( EvActHeadGet(EVACT_GAYSER),
				FeSetWork[0], FeSetWork[1], (u8)FeSetWork[2] );

	ActWork[i].oamData.Priority = (u8)FeSetWork[3];
	ActWork[i].scr = 1;

	return( i );
}

//------------------------------------------
//	ä‘åáêÚ±∏¿∞ìÆçÏ
//------------------------------------------
void FeGayserActMove( actWork *act )
{
	if( act->anmend_sw )
	{
		FeDelActCode( act, FECODE_Gayser );
	}
}

//======================================================================
//		âBÇµåä
//======================================================================
static void MapChangeHidePitFallTask( u8 );
static u8 MapChgHidePitFall0( TASK_TABLE *, EventOBJ *, actWork * );
static u8 MapChgHidePitFall1( TASK_TABLE *, EventOBJ *, actWork * );
static u8 MapChgHidePitFall2( TASK_TABLE *, EventOBJ *, actWork * );
static u8 MapChgHidePitFall3( TASK_TABLE *, EventOBJ *, actWork * );
static u8 MapChgHidePitFall4( TASK_TABLE *, EventOBJ *, actWork * );

//------------------------------------------
//	œØÃﬂ¡™›ºﬁ âBÇµåä
//	In:		pri				; ¿Ω∏Ãﬂ◊≤µÿ√®
//------------------------------------------
void SetMapChangeHidePitFall( u8 pri )
{
	AddTask( MapChangeHidePitFallTask, pri );
}

//------------------------------------------
//	âBÇµåäèàóù√∞ÃﬁŸ
//------------------------------------------
static u8 (* const MapChangeHidePitFallTbl[])( TASK_TABLE *, EventOBJ *, actWork * ) =
{
	MapChgHidePitFall0,
	MapChgHidePitFall1,
	MapChgHidePitFall2,
	MapChgHidePitFall3,
	MapChgHidePitFall4,
};

//------------------------------------------
//	âBÇµåä¿Ω∏
//------------------------------------------
static void MapChangeHidePitFallTask( u8 no )
{
	while( MapChangeHidePitFallTbl[TaskTable[no].work[0]]
		(&TaskTable[no],&EvObj[MyMoveState.evobjno],&ActWork[MyMoveState.actno]) );
}

//------------------------------------------
//	âBÇµåä 0
//------------------------------------------
static u8 MapChgHidePitFall0( TASK_TABLE *task, EventOBJ *ev, actWork *act )
{
	EvObjPauseAll();
	FldScrollActStop();
	MyMoveState.mv_pause = 1;
	ev->priority_hold_sw = 1;

	task->work[0]++;
	return( 0 );
}

//------------------------------------------
//	âBÇµåä 1
//------------------------------------------
static u8 MapChgHidePitFall1( TASK_TABLE *task, EventOBJ *ev, actWork *act )
{
	if( AcmdEnd(ev) )
	{
		if( task->work[1] >= 4 )
		{
			FeSetWork[0] = ev->gx;
			FeSetWork[1] = ev->gy;
			FeSetWork[2] = act->pri - 1;
			FeSetWork[3] = act->oamData.Priority;
			task->work[1] = FldEffSet( FECODE_GymSand );
			task->work[0]++;
			return( 0 );
		}

		task->work[1]++;
		AcmdSet( ev, AcmdCodeStayWalk4(ev->site) );
		SePlay( SE_FU_ZUZUZU );
	}
	
	return( 0 );
}

//------------------------------------------
//	âBÇµåä 2
//------------------------------------------
static u8 MapChgHidePitFall2( TASK_TABLE *task, EventOBJ *ev, actWork *act )
{
	if( ActWork[task->work[1]].anm_offs == 2 )
	{
		ev->banish_sw = 1;
		task->work[0]++;
	}

	return( 0 );
}

//------------------------------------------
//	âBÇµåä 3
//------------------------------------------
static u8 MapChgHidePitFall3( TASK_TABLE *task, EventOBJ *ev, actWork *act )
{
	if( FeCodeChk(FECODE_GymSand) == 0 )
	{
		MapBGM_FadeOutSet();
		FieldFadeOutSet();
		task->work[0]++;
	}
	
	return( 0 );
}

//------------------------------------------
//	âBÇµåä 4
//------------------------------------------
static u8 MapChgHidePitFall4( TASK_TABLE *task, EventOBJ *ev, actWork *act )
{
	if( FadeData.fade_sw == 0 && MapBGM_FadeWait() == TRUE )
	{
		SetNextWorldPosition();
		pFieldRecoverFunc = FieldInitFallTask;
		MainProcChange( FieldMainInit );
		DelTask( CheckTaskNo(MapChangeHidePitFallTask) );
	}

	return( 0 );
}

//------------------------------------------
//	Ã®∞Ÿƒﬁ¥Ã™∏ƒ ºﬁ—çªâåæØƒ
//	In:		work0,1			; œØÃﬂç¿ïW
//			work2,3			; ±∏¿,BGÃﬂ◊≤µÿ√®
//------------------------------------------
u32 FeGymSandSet( void )
{
	u32 i;

	MapCellSizePosDiffOffs( (s16*)&FeSetWork[0], (s16*)&FeSetWork[1], 8, 8 );
	i = AddActorBottom( EvActHeadGet(EVACT_GYMSAND),
				FeSetWork[0], FeSetWork[1], (u8)FeSetWork[2] );

	ActWork[i].oamData.Priority = (u8)FeSetWork[3];
	ActWork[i].scr = 1;

	return( i );
}

//------------------------------------------
//	çªâåìÆçÏ
//------------------------------------------
void FeGymSandActMove( actWork *act )
{
	if( act->anmend_sw )
	{
		FeDelActCode( act, FECODE_GymSand );
	}
}

//======================================================================
//		Ç†Ç»ÇŸÇË,Ç†Ç»Ç ÇØÇÃÉqÉÇ
//======================================================================
static void MapChangeAnanukeTask( u8 );
static void MapChangeAnanuke0( TASK_TABLE * );
static void MapChangeAnanuke1( TASK_TABLE * );
static void SetMapInAnanuke( void );
static void MapInAnanukeTask( u8 );
static void MapInAnanuke0( TASK_TABLE * );
static void MapInAnanuke1( TASK_TABLE * );

//------------------------------------------
//	Ç†Ç»Ç ÇØæØƒ
//------------------------------------------
void SetMapChangeAnanuke( void )
{
	SetForceEvent();
	EvObjPauseAll();
	AddTask( MapChangeAnanukeTask, 80 );
}

//------------------------------------------
//	åäî≤ÇØèàóù√∞ÃﬁŸ
//------------------------------------------
static void (* const MapChangeAnanukeTaskTbl[])( TASK_TABLE * ) =
{
	MapChangeAnanuke0,
	MapChangeAnanuke1,
};

//------------------------------------------
//	åäî≤ÇØèàóù
//------------------------------------------
static void MapChangeAnanukeTask( u8 no )
{
	MapChangeAnanukeTaskTbl[TaskTable[no].work[0]]( &TaskTable[no] );
}

//------------------------------------------
//	åäî≤ÇØ 0
//------------------------------------------
static void MapChangeAnanuke0( TASK_TABLE *task )
{
	task->work[0]++;
	task->work[14] = 64;
	task->work[15] = GetHeroSite();
}

//------------------------------------------
//	åäî≤ÇØ 1
//------------------------------------------
static void MapChangeAnanuke1( TASK_TABLE *task )
{
	EventOBJ *ev;
	u8 site[] = { SITE_D, SITE_L, SITE_R, SITE_U, SITE_D };

	if( task->work[14] && --task->work[14] == 0 )
	{
		MapBGM_FadeOutSet();
		FieldFadeOutSet();
	}

	ev = &EvObj[MyMoveState.evobjno];

	if( AcmdSetChk(ev) && AcmdEnd(ev) == 0 )
	{
		return;
	}

	if( task->work[14] == 0 && FadeData.fade_sw == 0 && MapBGM_FadeWait() == TRUE )
	{
		EvObjSiteSet( ev, task->work[15] );
		NextMapSetByEscMapID();
		SetNextWorldPosition();
		pFieldRecoverFunc = SetMapInAnanuke;
		MainProcChange( FieldMainInit );
		DelTask( CheckTaskNo(MapChangeAnanukeTask) );
		return;
	}

	if( task->work[1] ) task->work[1]--;

	if( task->work[1] == 0 )
	{
		AcmdSet( ev, AcmdCodeStopSite(site[ev->site]) );
		if( task->work[2] < 12 ) task->work[2]++;
		task->work[1] = 8 >> (task->work[2] >> 2);
	}
}

//------------------------------------------
//	åäî≤ÇØ œØÃﬂ≤›æØƒ
//------------------------------------------
static void SetMapInAnanuke( void )
{
	MapBGM_Start();
	FieldFadeInSet();
	SetForceEvent();
	EvObjPauseAll();
	pFieldRecoverFunc = NULL;
	EvObjNoBanishOn( MyMoveState.evobjno );
	AddTask( MapInAnanukeTask, 0 );
}

//------------------------------------------
//	åäî≤ÇØœØÃﬂ≤›√∞ÃﬁŸ
//------------------------------------------
static void (* const MapInAnanukeTaskTbl[])( TASK_TABLE * ) =
{
	MapInAnanuke0,
	MapInAnanuke1,
};

//------------------------------------------
//	åäî≤ÇØœØÃﬂ≤›¿Ω∏
//------------------------------------------
static void MapInAnanukeTask( u8 no )
{
	MapInAnanukeTaskTbl[TaskTable[no].work[0]]( &TaskTable[no] );
}

//------------------------------------------
//	åäî≤ÇØœØÃﬂ≤› 0
//------------------------------------------
static void MapInAnanuke0( TASK_TABLE *task )
{
	if( FieldFadeinCheck() )
	{
		task->work[0]++;
		task->work[15] = GetHeroSite();
	}
}

//------------------------------------------
//	åäî≤ÇØœØÃﬂ≤› 1
//------------------------------------------
static void MapInAnanuke1( TASK_TABLE *task )
{
	EventOBJ *ev;
	u8 site[] = { SITE_D, SITE_L, SITE_R, SITE_U, SITE_D };

	ev = &EvObj[MyMoveState.evobjno];

	if( task->work[1] )
	{
		task->work[1]--;
	}

	if( task->work[1] == 0 )
	{
		if( AcmdSetChk(ev) && AcmdEnd(ev) == 0 )
		{
			return;
		}

		if( task->work[2] >= 32 && task->work[15] == GetHeroSite() )
		{
			ev->banish_sw = 0;
			ResetForceEvent();
			EvObjPauseClrAll();
			DelTask( CheckTaskNo(MapInAnanukeTask) );
			return;
		}

		AcmdSet( ev, AcmdCodeStopSite(site[ev->site]) );
		if( task->work[2] < 32 ) task->work[2]++;
		task->work[1] = task->work[2] >> 2;
	}

	ev->banish_sw ^= 1;
}

//======================================================================
//		√⁄Œﬂ∞ƒ
//======================================================================
static void MapChangeTeleportTask( u8 );
static void MapChangeTeleport0( TASK_TABLE * );
static void MapChangeTeleport1( TASK_TABLE * );
static void MapChangeTeleport2( TASK_TABLE * );
static void MapChangeTeleport3( TASK_TABLE * );
static void SetMapInTeleport( void );
static void MapInTeleportTask( u8 );
static void MapInTeleport0( TASK_TABLE * );
static void MapInTeleport1( TASK_TABLE * );
static void MapInTeleport2( TASK_TABLE * );

//------------------------------------------
//	√⁄Œﬂ∞ƒæØƒ
//------------------------------------------
void SetMapChangeTeleport( void )
{
	AddTask( MapChangeTeleportTask, 0 );
}

//------------------------------------------
//	√⁄Œﬂ∞ƒèàóù√∞ÃﬁŸ
//------------------------------------------
static void (* const MapChangeTeleportTaskTbl[])( TASK_TABLE * ) =
{
	MapChangeTeleport0,
	MapChangeTeleport1,
	MapChangeTeleport2,
	MapChangeTeleport3,
};

//------------------------------------------
//	√⁄Œﬂ∞ƒèàóù
//------------------------------------------
static void MapChangeTeleportTask( u8 no )
{
	MapChangeTeleportTaskTbl[TaskTable[no].work[0]]( &TaskTable[no] );
}

//------------------------------------------
//	√⁄Œﬂ∞ƒ 0
//------------------------------------------
static void MapChangeTeleport0( TASK_TABLE *task )
{
	SetForceEvent();
	EvObjPauseAll();
	FldScrollActStop();
	task->work[15] = GetHeroSite();
	task->work[0]++;
}

//------------------------------------------
//	√⁄Œﬂ∞ƒ 1
//------------------------------------------
static void MapChangeTeleport1( TASK_TABLE *task )
{
	EventOBJ *ev;
	u8 site[] = { SITE_D, SITE_L, SITE_R, SITE_U, SITE_D };

	ev = &EvObj[MyMoveState.evobjno];

	if( task->work[1] )
	{
		task->work[1]--;
	}

	if( task->work[1] == 0 )
	{
		EvObjChgSite( ev, site[ev->site] );
		task->work[1] = 8;
		task->work[2]++;
	}

	if( task->work[2] >= 8 && task->work[15] == ev->site )
	{
		task->work[0]++;
		task->work[1] = 4;
		task->work[2] = 8;
		task->work[3] = 1;
		SePlay( SE_TK_WARPIN );
	}
}

//------------------------------------------
//	√⁄Œﬂ∞ƒ 2
//------------------------------------------
static void MapChangeTeleport2( TASK_TABLE *task )
{
	EventOBJ *ev;
	actWork *act;
	u8 site[] = { SITE_D, SITE_L, SITE_R, SITE_U, SITE_D };

	ev = &EvObj[MyMoveState.evobjno];
	act = &ActWork[MyMoveState.actno];

	if( --task->work[1] <= 0 )
	{
		task->work[1] = 4;
		EvObjChgSite( ev, site[ev->site] );
	}

	act->y -= task->work[3];
	task->work[4] += task->work[3];

	if( --task->work[2] <= 0 )
	{
		task->work[2] = 4;
		if( task->work[3] < 8 ) task->work[3] <<= 1;
	}

	if( task->work[4] > 8 )
	{
		act->oamData.Priority = BGPRI1;
		if( act->oampat_sw != OAMPAT_OFF ) act->oampat_sw = OAMPAT_PRIUNIT;
	}

	if( task->work[4] >= 168 )
	{
		task->work[0]++;
		MapBGM_FadeOutSet();
		FieldFadeOutSet();
	}
}

//------------------------------------------
//	√⁄Œﬂ∞ƒ 3
//------------------------------------------
static void MapChangeTeleport3( TASK_TABLE *task )
{
	if( FadeData.fade_sw == 0 && MapBGM_FadeWait() == TRUE )
	{
		NextMapSetByTelMapID();
		SetNextWorldPosition();
		MainProcChange( FieldMainInit );
		pFieldRecoverFunc = SetMapInTeleport;
		DelTask( CheckTaskNo(MapChangeTeleportTask) );
	}
}

//------------------------------------------
//	√⁄Œﬂ∞ƒœØÃﬂ≤›æØƒ
//------------------------------------------
static void SetMapInTeleport( void )
{
	MapBGM_Start();
	FieldFadeInSet();
	SetForceEvent();
	EvObjPauseAll();
	pFieldRecoverFunc = NULL;
	EvObjNoBanishOn( MyMoveState.evobjno );
	FldScrollActStop();
	AddTask( MapInTeleportTask, 0 );
}

//------------------------------------------
//	√⁄Œﬂ∞ƒœØÃﬂ≤›√∞ÃﬁŸ
//------------------------------------------
static void (* const MapInTeleportTaskTbl[])( TASK_TABLE * ) =
{
	MapInTeleport0,
	MapInTeleport1,
	MapInTeleport2,
};

//------------------------------------------
//	√⁄Œﬂ∞ƒœØÃﬂ≤›
//------------------------------------------
static void MapInTeleportTask( u8 no )
{
	MapInTeleportTaskTbl[TaskTable[no].work[0]]( &TaskTable[no] );
}

//------------------------------------------
//	√⁄Œﬂ∞ƒœØÃﬂ≤› 0
//------------------------------------------
static void MapInTeleport0( TASK_TABLE *task )
{
	s16 y_size;
	actWork *act;

	if( FieldFadeinCheck() )
	{
		act = &ActWork[MyMoveState.actno];
		y_size = -(act->cy + act->cy);
		act->dy = -(act->y + act->cy + ActOY + y_size);
		EvObjNoBanishOff( MyMoveState.evobjno );

		task->work[0]++;
		task->work[1] = 8;
		task->work[2] = 1;
		task->work[14] = act->oampat_sw;
		task->work[15] = GetHeroSite();
		SePlay( SE_TK_WARPIN );
	}
}

//------------------------------------------
//	√⁄Œﬂ∞ƒœØÃﬂ≤› 1
//------------------------------------------
static void MapInTeleport1( TASK_TABLE *task )
{
	EventOBJ *ev;
	actWork *act;
	u8 site[] = { SITE_D, SITE_L, SITE_R, SITE_U, SITE_D };

	ev = &EvObj[MyMoveState.evobjno];
	act = &ActWork[MyMoveState.actno];

	act->dy += task->work[1];

	if( act->dy >= -8 )
	{
		if( task->work[13] == 0 )
		{
			task->work[13]++;
			ev->move_start_sw = 1;
			act->oampat_sw = task->work[14];
		}
	}
	else
	{
		act->oamData.Priority = BGPRI1;
		if( act->oampat_sw != OAMPAT_OFF ) act->oampat_sw = OAMPAT_PRIUNIT;
	}

	if( act->dy >= -48 && task->work[1] > 1 )
	{
		if( (act->dy & 0x01) == 0 ) task->work[1]--;
	}

	if( --task->work[2] == 0 )
	{
		task->work[2] = 4;
		EvObjChgSite( ev, site[ev->site] );
	}

	if( act->dy >= 0 )
	{
		act->dy = 0;
		task->work[0]++;
		task->work[1] = 1;
		task->work[2] = 0;
	}
}

//------------------------------------------
//	√⁄Œﬂ∞ƒœØÃﬂ≤› 2
//------------------------------------------
static void MapInTeleport2( TASK_TABLE *task )
{
	EventOBJ *ev;
	actWork *act;
	u8 site[] = { SITE_D, SITE_L, SITE_R, SITE_U, SITE_D };

	ev = &EvObj[MyMoveState.evobjno];
	act = &ActWork[MyMoveState.actno];

	if( --task->work[1] == 0 )
	{
		EvObjChgSite( ev, site[ev->site] );
		task->work[1] = 8;
		task->work[2]++;
	
		if( task->work[2] > 4 && task->work[14] == ev->site )
		{
			ResetForceEvent();
			FldScrollPosInit();
			EvObjPauseClrAll();
			DelTask( CheckTaskNo(MapInTeleportTask) );
		}
	}
}

//======================================================================
//		îÈì`ãZ¥Ã™∏ƒ ∂Øƒ≤›
//======================================================================
static void HidenCutInFieldTask( u8 );
static void HidenCutInField0( TASK_TABLE * );
static void HidenCutInField1( TASK_TABLE * );
static void HidenCutInField2( TASK_TABLE * );
static void HidenCutInField3( TASK_TABLE * );
static void HidenCutInField4( TASK_TABLE * );
static void HidenCutInField5( TASK_TABLE * );
static void HidenCutInField6( TASK_TABLE * );
static void HidenCutInFieldVBlank( void );
static void SetHidenCutInFieldBGMap( u16 );
static void HidenCutInCaveTask( u8 );
static void HidenCutInCave0( TASK_TABLE * );
static void HidenCutInCave1( TASK_TABLE * );
static void HidenCutInCave2( TASK_TABLE * );
static void HidenCutInCave3( TASK_TABLE * );
static void HidenCutInCave4( TASK_TABLE * );
static void HidenCutInCave5( TASK_TABLE * );
static void HidenCutInCave6( TASK_TABLE * );
static void HidenCutInCaveVBlank( void );
static void HidenCutInCaveScroll( TASK_TABLE * );
static u8 SetHidenCutInCaveBGMap( TASK_TABLE * );
static u8 ClsHidenCutInCaveBGMap( TASK_TABLE * );
static u8 HidenCutInPokeActSet( u32, u32, u32 );
static void HidenCutInPokeActMoveStart( actWork * );
static void hiden_cutin_poke_act_move_wait( actWork * );
static void hiden_cutin_poke_act_move_end( actWork * );

//------------------------------------------
//	Ã®∞Ÿƒﬁ¥Ã™∏ƒ
//	îÈì`ãZ¥Ã™∏ƒ∂Øƒ≤›(√Ωƒ)
//	In:		work0		; ï\é¶Œﬂπ”›No,ñ¬Ç´ê∫Ã◊∏ﬁ
//			work1,2		; ID,å¬ê´óêêî
//	Out:	nothing
//	Info:	work0 | FE_HCUTIN_VOICE_FLAG
//					-> ñ¬Ç´ê∫çƒê∂Ã◊∏ﬁ
//------------------------------------------
u32 FeHidenCutIn( void )
{
	u8 i;

	if( MTYPE_IsFieldCheck(GetNowMapType()) == TRUE )
	{
		i = AddTask( HidenCutInFieldTask, 0xff );
	}
	else
	{
		i = AddTask( HidenCutInCaveTask, 0xff );
	}

	TaskTable[i].work[15] = HidenCutInPokeActSet( FeSetWork[0], FeSetWork[1], FeSetWork[2] );

	return( 0 );
}

//------------------------------------------
//	Ã®∞Ÿƒﬁ¥Ã™∏ƒ
//	îÈì`ãZ¥Ã™∏ƒ∂Øƒ≤›éËéùÇø
//	In:		work0		; PokeParaMine[]≈› ﬁ,ñ¬Ç´ê∫Ã◊∏ﬁ
//	Out:	nothing
//	Info:	‹∞∏æØƒ,FECODE_HidenCutIn∫∞Ÿ
//			work0 | FE_HCUTIN_VOICE_FLAG
//					-> ñ¬Ç´ê∫çƒê∂Ã◊∏ﬁ
//------------------------------------------
u32 FeHidenCutInMine( void )
{
	u8 i;
	u32 flag;
	
	flag = FeSetWork[0] & FE_HCUTIN_VOICE_FLAG;
	i = FeSetWork[0] & FE_HCUTIN_VOICE_FLAG_CLS;
	FeSetWork[0] = PokeParaGet( &PokeParaMine[i], ID_monsno );
	FeSetWork[1] = PokeParaGet( &PokeParaMine[i], ID_id_no );
	FeSetWork[2] = PokeParaGet( &PokeParaMine[i], ID_personal_rnd );

	FeSetWork[0] |= flag;
	FldEffSet( FECODE_HidenCutIn );
	FeCodeDel( FECODE_HidenCutInMine );

	return( 0 );
}

//------------------------------------------
//	∂Øƒ≤› Ã®∞Ÿƒﬁèàóù√∞ÃﬁŸ
//------------------------------------------
static void (* const FeHidenCutInFieldTbl[])(TASK_TABLE *) =
{
	HidenCutInField0,
	HidenCutInField1,
	HidenCutInField2,
	HidenCutInField3,
	HidenCutInField4,
	HidenCutInField5,
	HidenCutInField6,
};

//------------------------------------------
//	îÈì`ãZ∂Øƒ≤› Ã®∞Ÿƒﬁ
//------------------------------------------
static void HidenCutInFieldTask( u8 no )
{
	FeHidenCutInFieldTbl[TaskTable[no].work[0]]( &TaskTable[no] );
}

//------------------------------------------
//	∂Øƒ≤› Ã®∞Ÿƒﬁ 0
//------------------------------------------
static void HidenCutInField0( TASK_TABLE *task )
{
	task->work[11] = *(vu16*)REG_WININ;
	task->work[12] = *(vu16*)REG_WINOUT;
	SetAdrs_to_Work( &task->work[13], sys.pVBlank );

	task->work[1] = (240 << 8) | 241;					// win x
	task->work[2] = (80 << 8) | 81;						// win y
	task->work[3] = WIN_ALL_ON & 0x00ff;				// win in
	task->work[4] = WIN_OBJ_ON | WIN_BG1_ON |			// win out
				WIN_BG2_ON | WIN_BG3_ON | WIN_BLEND_ON;

	*(vu16*)REG_WIN0H = (u16)task->work[1];
	*(vu16*)REG_WIN0V = (u16)task->work[2];
	*(vu16*)REG_WININ = (u16)task->work[3];
	*(vu16*)REG_WINOUT = (u16)task->work[4];

	SetVBlankFunc( HidenCutInFieldVBlank );

	task->work[0]++;
}

//------------------------------------------
//	∂Øƒ≤› Ã®∞Ÿƒﬁ 1
//------------------------------------------
static void HidenCutInField1( TASK_TABLE *task )
{
	u16 map,ch;

	ch = (((*(vu16*)REG_BG0CNT) >> BG_CHAR_BASE_SHIFT) & 0x03) << 14;
	map = (((*(vu16*)REG_BG0CNT) >> BG_SCREEN_BASE_SHIFT) & 0x1f) << 11;

	CpuCopy( hiden_Character, BG_VRAM + ch, 0x20*16, 16 );
	CpuClear( 0, BG_VRAM + map, 0x0800, 32 );
	PaletteWorkSet( hiden_Palette, PA_BG15, 0x0020 );
	SetHidenCutInFieldBGMap( map );

	task->work[0]++;
}

//------------------------------------------
//	∂Øƒ≤› Ã®∞Ÿƒﬁ 2
//------------------------------------------
static void HidenCutInField2( TASK_TABLE *task )
{
	s16 x,y0,y1;

	task->work[5] -= 16;								// bg0 x

	x = (task->work[1] >> 8) & 0x00ff;
	y0 = (task->work[2] >> 8) & 0x00ff;
	y1 = task->work[2] & 0x00ff;

	x -= 16;
	y0 -= 2;
	y1 += 2;

	if( x < 0 ) x = 0;
	if( y0 < 40 ) y0 = 40;
	if( y1 > 120 ) y1 = 120;

	task->work[1] = (x << 8) | (task->work[1] & 0x00ff);
	task->work[2] = (y0 << 8) | y1;

	if( x == 0 && y0 == 40 && y1 == 120 )
	{
		ActWork[task->work[15]].move = HidenCutInPokeActMoveStart;
		task->work[0]++;
	}
}

//------------------------------------------
//	∂Øƒ≤› Ã®∞Ÿƒﬁ 3
//------------------------------------------
static void HidenCutInField3( TASK_TABLE *task )
{
	task->work[5] -= 16;

	if( ActWork[task->work[15]].work[7]	)				// ±∏¿∞èIóπ
	{
		task->work[0]++;
	}
}

//------------------------------------------
//	∂Øƒ≤› Ã®∞Ÿƒﬁ 4
//------------------------------------------
static void HidenCutInField4( TASK_TABLE *task )
{
	s16 y0,y1;

	task->work[5] -= 16;

	y0 = task->work[2] >> 8;
	y1 = task->work[2] & 0x00ff;

	y0 += 6;
	y1 -= 6;
	
	if( y0 > 80 ) y0 = 80;
	if( y1 < 81 ) y1 = 81;

	task->work[2] = (y0 << 8) | y1;

	if( y0 == 80 && y1 == 81 )
	{
		task->work[0]++;
	}
}

//------------------------------------------
//	∂Øƒ≤› Ã®∞Ÿƒﬁ 5
//------------------------------------------
static void HidenCutInField5( TASK_TABLE *task )
{
	u16 map;

	map = (((*(vu16*)REG_BG0CNT) >> BG_SCREEN_BASE_SHIFT) & 0x1f) << 11;
	CpuClear( 0, BG_VRAM + map, 0x0800, 32 );

	task->work[1] = (0 << 8) | 241;
	task->work[2] = (0 << 8) | 161;
	task->work[3] = task->work[11];
	task->work[4] = task->work[12];

	task->work[0]++;
}

//------------------------------------------
//	∂Øƒ≤› Ã®∞Ÿƒﬁ 6
//------------------------------------------
static void HidenCutInField6( TASK_TABLE *task )
{
	void (*vfunc)(void);

	SetWork_to_Seq( &task->work[13], &vfunc );
	SetVBlankFunc( vfunc );

	PrintScreenInit( FIELD_MENU_TYPE );
	NMenuScreenInit( FIELD_MENU_TYPE );

	FePokeDel( &ActWork[task->work[15]] );
	FeCodeDel( FECODE_HidenCutIn );
	DelTask( CheckTaskNo(HidenCutInFieldTask) );
}

//------------------------------------------
//	∂Øƒ≤› Ã®∞Ÿƒﬁ V Blank
//------------------------------------------
static void HidenCutInFieldVBlank( void )
{
	TASK_TABLE *task;
	void (*v_main)( void );

	task = &TaskTable[CheckTaskNo(HidenCutInFieldTask)];
	SetWork_to_Seq( &task->work[13], &v_main );

	v_main();

	*(vu16*)REG_WIN0H = (u16)task->work[1];
	*(vu16*)REG_WIN0V = (u16)task->work[2];
	*(vu16*)REG_WININ = (u16)task->work[3];
	*(vu16*)REG_WINOUT = (u16)task->work[4];
	*(vu16*)REG_BG0HOFS = task->work[5];
	*(vu16*)REG_BG0VOFS = task->work[6];
}

//------------------------------------------
//	∂Øƒ≤› Ã®∞Ÿƒﬁ BGœØÃﬂæØƒ
//------------------------------------------
static void SetHidenCutInFieldBGMap( u16 base )
{
	u16 i;
	u16 *map;

	map = (u16*)(BG_VRAM + base);
	map = &(map[5 << 5]);

	for( i = 0; i < 320; *map = hiden_Map[i] | (15<<12),  i++, map++ );
}

//------------------------------------------
//	∂Øƒ≤› ì¥åAèàóù√∞ÃﬁŸ
//------------------------------------------
static void (* const FeHidenCutInCaveTbl[])( TASK_TABLE * ) =
{
	HidenCutInCave0,
	HidenCutInCave1,
	HidenCutInCave2,
	HidenCutInCave3,
	HidenCutInCave4,
	HidenCutInCave5,
	HidenCutInCave6,
};

//------------------------------------------
//	îÈì`ãZ∂Øƒ≤› ì¥åA
//------------------------------------------
static void HidenCutInCaveTask( u8 no )
{
	FeHidenCutInCaveTbl[TaskTable[no].work[0]]( &TaskTable[no] );
}

//------------------------------------------
//	∂Øƒ≤› ì¥åA 0
//------------------------------------------
static void HidenCutInCave0( TASK_TABLE *task )
{
	*(vu16*)REG_BG0HOFS = task->work[1];
	*(vu16*)REG_BG0VOFS = task->work[2];

	SetAdrs_to_Work( &task->work[13], sys.pVBlank );
	SetVBlankFunc( HidenCutInCaveVBlank );

	task->work[0]++;
}

//------------------------------------------
//	∂Øƒ≤› ì¥åA 1
//------------------------------------------
static void HidenCutInCave1( TASK_TABLE *task )
{
	u16 map,ch;

	ch = (((*(vu16*)REG_BG0CNT) >> BG_CHAR_BASE_SHIFT) & 0x03) << 14;
	map = (((*(vu16*)REG_BG0CNT) >> BG_SCREEN_BASE_SHIFT) & 0x1f) << 11;

	task->work[12] = map;
	CpuCopy( hiden2_Character, BG_VRAM + ch, 0x20*4, 16 );
	CpuClear( 0, BG_VRAM + map, 0x0800, 32 );
	PaletteWorkSet( hiden2_Palette, PA_BG15, 0x20 );

	task->work[0]++;
}

//------------------------------------------
//	∂Øƒ≤› ì¥åA 2
//------------------------------------------
static void HidenCutInCave2( TASK_TABLE *task )
{
	if( SetHidenCutInCaveBGMap(task) )
	{
		*(vu16*)REG_WIN1H = (0 << 8) | 240;
		*(vu16*)REG_WIN1V = (40 << 8) | 120;
		ActWork[task->work[15]].move = HidenCutInPokeActMoveStart;
		task->work[0]++;
	}

	HidenCutInCaveScroll( task );
}

//------------------------------------------
//	∂Øƒ≤› ì¥åA 3
//------------------------------------------
static void HidenCutInCave3( TASK_TABLE *task )
{
	HidenCutInCaveScroll( task );

	if( ActWork[task->work[15]].work[7] )
	{
		task->work[0]++;
	}
}

//------------------------------------------
//	∂Øƒ≤› ì¥åA 4
//------------------------------------------
static void HidenCutInCave4( TASK_TABLE *task )
{
	HidenCutInCaveScroll( task );

	task->work[3] = task->work[1] & 0x07;				// bg scroll x
	task->work[4] = 0;									// bg bld x
	*(vu16*)REG_WIN1H = 0xffff;
	*(vu16*)REG_WIN1V = 0xffff;

	task->work[0]++;
}

//------------------------------------------
//	∂Øƒ≤› ì¥åA 5
//------------------------------------------
static void HidenCutInCave5( TASK_TABLE *task )
{
	HidenCutInCaveScroll( task );

	if( ClsHidenCutInCaveBGMap(task) )
	{
		task->work[0]++;
	}
}

//------------------------------------------
//	∂Øƒ≤› ì¥åA 6
//------------------------------------------
static void HidenCutInCave6( TASK_TABLE *task )
{
	u16 map;
	void (*vfunc)(void);

	map = (((*(vu16*)REG_BG0CNT) >> BG_SCREEN_BASE_SHIFT) & 0x1f) << 11;
	CpuClear( 0, BG_VRAM + map, 0x0800, 32 );

	SetWork_to_Seq( &task->work[13], &vfunc );
	SetVBlankFunc( vfunc );

	PrintScreenInit( FIELD_MENU_TYPE );
	NMenuScreenInit( FIELD_MENU_TYPE );

	FePokeDel( &ActWork[task->work[15]] );
	FeCodeDel( FECODE_HidenCutIn );
	DelTask( CheckTaskNo(HidenCutInCaveTask) );
}

//------------------------------------------
//	∂Øƒ≤› ì¥åA V Blank
//------------------------------------------
static void HidenCutInCaveVBlank( void )
{
	TASK_TABLE *task;
	void (*v_main)( void );

	task = &TaskTable[CheckTaskNo(HidenCutInCaveTask)];
	SetWork_to_Seq( &task->work[13], &v_main );

	v_main();

	*(vu16*)REG_BG0HOFS = task->work[1];
	*(vu16*)REG_BG0VOFS = task->work[2];
}

//------------------------------------------
//	∂Øƒ≤› ì¥åA Ω∏€∞Ÿ
//------------------------------------------
static void HidenCutInCaveScroll( TASK_TABLE *task )
{
	task->work[1] -= 16;								// bg0 x
	task->work[3] += 16;								// bg scroll x
}

//------------------------------------------
//	∂Øƒ≤› ì¥åA œØÃﬂæØƒ
//------------------------------------------
static u8 SetHidenCutInCaveBGMap( TASK_TABLE *task )
{
	u16 i,x0,x1;
	u16 *map;

	if( task->work[4] >= 32 ) return( 1 );

	x0 = (task->work[3] >> 3) & 0x1f;					// 8

	if( x0 >= task->work[4] )
	{
		x0 = (32 - x0) & 0x1f;
		x1 = (32 - task->work[4]) & 0x1f;
		map = (u16*)(BG_VRAM + (u16)task->work[12]);
		map = &(map[5 << 5]);

		for( i = 0; i < 10; i++ )
		{
			map[(i<<5) + x0] = hiden2_Map[(x1) + (i << 5)] | (15 << 12);
			map[(i<<5) + ((x0+1)&31)] = hiden2_Map[((x1+1)&31) + (i << 5)] | (15 << 12);
		}

		task->work[4] += 2;
	}
	
	return( 0 );
}

//------------------------------------------
//	∂Øƒ≤› ì¥åA œØÃﬂè¡ãé
//------------------------------------------
static u8 ClsHidenCutInCaveBGMap( TASK_TABLE *task )
{
	u16 i,x;
	u16 *map;

	if( task->work[4] >= 32 ) return( 1 );

	x = task->work[3] >> 3;

	if( x >= task->work[4] )
	{
		x = (task->work[1] >> 3) & 0x1f;				// bg x / 8
		map = (u16*)(BG_VRAM + (u16)task->work[12]);
		map = &map[(5 << 5)];							// bld pos

		for( i = 0; i < 10; i++ )
		{
			map[(i<<5)+x] = 0 | (15 << 12);
			map[(i<<5)+((x+1)&31)] = 0 | (15 << 12);
		}

		task->work[4] += 2;
	}
	
	return( 0 );
}

//------------------------------------------
//	îÈì`∂Øƒ≤›óp Œﬂπ”›±∏¿∞æØƒ
//------------------------------------------
static u8 HidenCutInPokeActSet( u32 no, u32 id, u32 rnd )
{
	u8 i;
	s16 v_flag;
	actWork *act;

	v_flag = (no & FE_HCUTIN_VOICE_FLAG) >> FE_HCUTIN_VOICE_FLAG_R_SHIFT;
	no &= FE_HCUTIN_VOICE_FLAG_CLS;

	i = FePokeRareSet( no, id, rnd, 320, 80, 0 );
	act = &ActWork[i];
	act->move = DummyActMove;
	act->oamData.Priority = 0;
	act->work[0] = no;
	act->work[6] = v_flag;

	return( i );
}

//------------------------------------------
//	îÈì`∂Øƒ≤›óp Œﬂπ”›±∏¿∞ìÆçÏ
//------------------------------------------
static void HidenCutInPokeActMoveStart( actWork *act )
{
	act->x -= 0x14;

	if( act->x <= 120 )
	{
		act->x = 120;
		act->work[1] = 30;
		act->move = hiden_cutin_poke_act_move_wait;

		if( act->work[6] ) VoicePlay2( (u16)act->work[0], 0, 125, 10 );
		else VoicePlay( (u16)act->work[0], 0 );
	}
}

static void hiden_cutin_poke_act_move_wait( actWork *act )
{
	if( --act->work[1] == 0 )
	{
		act->move = hiden_cutin_poke_act_move_end;
	}
}

static void hiden_cutin_poke_act_move_end( actWork *act )
{
	if( act->x < -64 )
	{
		act->work[7] = 1;
	}
	else
	{
		act->x -= 0x14;
	}
}

//======================================================================
//		îÈì`ãZÇ»Ç›ÇÃÇË
//======================================================================
static void HidenNaminoriTask( u8 );
static void HidenNaminori0( TASK_TABLE * );
static void HidenNaminori1( TASK_TABLE * );
static void HidenNaminori2( TASK_TABLE * );
static void HidenNaminori3( TASK_TABLE * );
static void HidenNaminori4( TASK_TABLE * );

//------------------------------------------
//	Ã®∞Ÿƒﬁ¥Ã™∏ƒ îÈì`ãZîgèÊÇË
//	In:		work0			; PokeParaMine[work0]
//	Out:	nothing
//------------------------------------------
u32 FeHidenPokeSwim( void )
{
	u8 i;

	i = AddTask( HidenNaminoriTask, 0xff );
	TaskTable[i].work[15] = FeSetWork[0];

	MapBGM_ClearSpecial();
	MapBGM_FadeChange( MUS_NAMINORI );

	return( 0 );
}

//------------------------------------------
//	îgèÊÇËèàóù√∞ÃﬁŸ
//------------------------------------------
static void (* const HidenNaminoriTbl[])( TASK_TABLE *task ) =
{
	HidenNaminori0,
	HidenNaminori1,
	HidenNaminori2,
	HidenNaminori3,
	HidenNaminori4,
};

//------------------------------------------
//	îÈì`ãZîgèÊÇË
//------------------------------------------
static void HidenNaminoriTask( u8 no )
{
	HidenNaminoriTbl[TaskTable[no].work[0]]( &TaskTable[no] );
}

//------------------------------------------
//	îgèÊÇË 0
//------------------------------------------
static void HidenNaminori0( TASK_TABLE *task )
{
	SetForceEvent();
	EvObjPauseAll();
	MyMoveState.mv_pause = 1;
	MyMoveStateMvFlagSet( MY_MV_BIT_SWIM );

	GetHeroCellPos( &task->work[1], &task->work[2] );
	SitePosMove( EvObj[MyMoveState.evobjno].mv_site, &task->work[1], &task->work[2] );

	task->work[0]++;
}

//------------------------------------------
//	îgèÊÇË 1
//------------------------------------------
static void HidenNaminori1( TASK_TABLE *task )
{
	EventOBJ *ev;
	
	ev = &EvObj[MyMoveState.evobjno];

	if( AcmdSetChk(ev) && AcmdEnd(ev) == 0 )
	{
		return;
	}

	ChangeHeroActorHiden();
	AcmdSet( ev, AC_ANM_END_WAIT );

	task->work[0]++;
}

//------------------------------------------
//	îgèÊÇË 2
//------------------------------------------
static void HidenNaminori2( TASK_TABLE *task )
{
	if( AcmdEndChk(&EvObj[MyMoveState.evobjno]) )
	{
		FeSetWork[0] = task->work[15] | FE_HCUTIN_VOICE_FLAG;
		FldEffSet( FECODE_HidenCutInMine );
		task->work[0]++;
	}
}

//------------------------------------------
//	îgèÊÇË 3
//------------------------------------------
static void HidenNaminori3( TASK_TABLE *task )
{
	EventOBJ *ev;

	if( FeCodeChk(FECODE_HidenCutIn) )
	{
		return;
	}

	ev = &EvObj[MyMoveState.evobjno];
	EvObjChgParam( ev, GetMainHeroObjCode(H_SWIM) );

	AcmdEnd( ev );
	AcmdSet( ev, AcmdCodeSwimJump(ev->mv_site) );
	
	FeSetWork[0] = task->work[1];
	FeSetWork[1] = task->work[2];
	FeSetWork[2] = MyMoveState.evobjno;
	ev->joint_actno[0] = FldEffSet( FECODE_PokeSwim );

	task->work[0]++;
}

//------------------------------------------
//	îgèÊÇË 4
//------------------------------------------
static void HidenNaminori4( TASK_TABLE *task )
{
	EventOBJ *ev;
	
	ev = &EvObj[MyMoveState.evobjno];

	if( AcmdEnd(ev) )
	{
		MyMoveState.mv_pause = 0;
		MyMoveState.flag &= ~MY_MV_BIT_UNDER;
		AcmdSet( ev, AcmdCodeStopSite( ev->mv_site ) );
		SetPokeSwimMoveFlag( ev->joint_actno[0], NAMIPOKE_WITH );

		EvObjPauseClrAll();
		ResetForceEvent();
		FeCodeDel( FECODE_HidenPokeSwim );
		DelTask( CheckTaskNo(HidenNaminoriTask) );
	}
}

//======================================================================
//		îÈì`ãZãÛîÚÇ—Œﬂπ”›(ãå)
//======================================================================
static void ActPokeSoraMove( actWork * );

//------------------------------------------
//	Ã®∞Ÿƒﬁ¥Ã™∏ƒ ÇªÇÁÇ∆Ç—Œﬂπ”›æØƒ
//	In:		work0			; éq±∏¿
//	Out:	u32				; ±∏¿∞‹∞∏≈› ﬁ
//	Info:	çÌèúó\íË,Ω∏ÿÃﬂƒÇ≈égópÇµÇƒÇ¢ÇÈå¬èäÇ™äÙÇ¬Ç©Åc
//------------------------------------------
u32 FePokeSoraSet( void )
{
	u8 i;
	actWork *act;

	i = AddActor( EvActHeadGet(EVACT_POKESORA), 120, 0, 1 );
	act = &ActWork[i];

	act->oamData.Pltt = MINE_OBJ_PALNO;
	act->oamData.Priority = 1;
	act->move = ActPokeSoraMove;
	act->work[1] = FeSetWork[0];

	SePlay( SE_W019 );
	
	return( i );
}

//------------------------------------------
//	ÇªÇÁÇ∆Ç—Œﬂπ”›ìÆçÏ
//	work0 = Ã◊∏ﬁ
//	work1 = éq±∏¿
//------------------------------------------
static void ActPokeSoraMove( actWork *act )
{
	actWork *ko_act;

	act->dx = CosMove( act->work[2], 140 );
	act->dy = SinMove( act->work[2], 72 );
	
	act->work[2] = (act->work[2] + 4) & 0xff;

	if( act->work[0] )
	{
		ko_act = &ActWork[act->work[1]];
		ko_act->scr = 0;
		ko_act->x = act->x + act->dx;
		ko_act->y = act->y + act->dy - 8;
		ko_act->dx = 0;
		ko_act->dy = 0;
	}

	if( act->work[2] >= 128 )
	{
		FeDelActCode( act, FECODE_PokeSora );
	}
}

//======================================================================
//		îÈì`ãZÇªÇÁÇÇ∆Ç‘
//======================================================================
static void TaskHidenPokeSora( u8 );
static void HidenPokeSora0( TASK_TABLE * );
static void HidenPokeSora1( TASK_TABLE * );
static void HidenPokeSora2( TASK_TABLE * );
static void HidenPokeSora3( TASK_TABLE * );
static void HidenPokeSora4( TASK_TABLE * );
static void HidenPokeSora5( TASK_TABLE * );
static void HidenPokeSora5( TASK_TABLE * );
static void HidenPokeSora6( TASK_TABLE * );
static void HidenPokeSora7( TASK_TABLE * );
static void HidenPokeSora8( TASK_TABLE * );
static u8 SetSoraPokeAct( void );
static u8 CheckSoraPokeActMove( u8 );
static void ChangeSoraPokeActMove( u8 );
static void SetSoraPokeActBackOn( u8, u8 );
static void SoraPokeStartActMove( actWork * );
static void SoraPokeActMove( actWork * );

//------------------------------------------
//	Ã®∞Ÿƒﬁ¥Ã™∏ƒ îÈì`ãZ:ÇªÇÁÇÇ∆Ç‘¥Ã™∏ƒ
//	In:		work0		; îÈì`ãZégópŒﬂπ”›≈› ﬁ
//	Out:	nothing
//------------------------------------------
u32 FeHidenPokeSora( void )
{
	u8 i;

	i = AddTask( TaskHidenPokeSora, 0xfe );
	TaskTable[i].work[1] = FeSetWork[0];

	return( 0 );
}

//------------------------------------------
//	ãÛÇîÚÇ‘èàóù√∞ÃﬁŸ
//------------------------------------------
static void (* const TaskHidenPokeSoraTbl[])( TASK_TABLE * ) =
{
	HidenPokeSora0,
	HidenPokeSora1,
	HidenPokeSora2,
	HidenPokeSora3,
	HidenPokeSora4,
	HidenPokeSora5,
	HidenPokeSora6,
	HidenPokeSora7,
	HidenPokeSora8,
};

//------------------------------------------
//	ãÛÇîÚÇ‘
//------------------------------------------
static void TaskHidenPokeSora( u8 no )
{
	TaskHidenPokeSoraTbl[TaskTable[no].work[0]]( &TaskTable[no] );
}

//------------------------------------------
//	ãÛÇîÚÇ‘
//------------------------------------------
static void HidenPokeSora0( TASK_TABLE *task )
{
	EventOBJ *ev;

	ev = &EvObj[MyMoveState.evobjno];

	if( AcmdSetChk(ev) && AcmdEnd(ev) == 0 )
	{
		return;
	}

	task->work[15] = MyMoveState.flag;
	MyMoveState.mv_pause = 1;
	MyMoveStateMvFlagSet( MY_MV_BIT_NORMAL );

	ChangeHeroActorHiden();
	AcmdSet( ev, AC_ANM_END_WAIT );

	task->work[0]++;
}

//------------------------------------------
//	ãÛÇîÚÇ‘ 1
//------------------------------------------
static void HidenPokeSora1( TASK_TABLE *task )
{
	EventOBJ *ev;

	ev = &EvObj[MyMoveState.evobjno];

	if( AcmdEnd(ev) )
	{
		task->work[0]++;
		FeSetWork[0] = task->work[1];
		FldEffSet( FECODE_HidenCutInMine );
	}
}

//------------------------------------------
//	ãÛÇîÚÇ‘ 2
//------------------------------------------
static void HidenPokeSora2( TASK_TABLE *task )
{
	EventOBJ *ev;

	if( FeCodeChk(FECODE_HidenCutIn) == 0 )
	{
		ev = &EvObj[MyMoveState.evobjno];

		if( (u8)task->work[15] & MY_MV_BIT_SWIM )
		{
			SetPokeSwimMoveFlag( ev->joint_actno[0], NAMIPOKE_NOWITH_SWAY );
			SetPokeSwimSiteFlag( ev->joint_actno[0], NAMIPOKE_SITE_NOCHG );
		}

		task->work[1] = SetSoraPokeAct();
		task->work[0]++;
	}
}

//------------------------------------------
//	ãÛÇîÚÇ‘ 3
//------------------------------------------
static void HidenPokeSora3( TASK_TABLE *task )
{
	if( CheckSoraPokeActMove(task->work[1]) )
	{
		task->work[0]++;
		task->work[2] = 16;
		SetHeroMoveRequest( MY_MV_BIT_NORMAL );
		AcmdSet( &EvObj[MyMoveState.evobjno], AC_SITE_L );
	}
}

//------------------------------------------
//	ãÛÇîÚÇ‘ 4
//------------------------------------------
static void HidenPokeSora4( TASK_TABLE *task )
{
	EventOBJ *ev;

	ev = &EvObj[MyMoveState.evobjno];

	if( task->work[2] ) task->work[2]--;

	if( task->work[2] == 0 && AcmdEnd(ev) )
	{
		task->work[0]++;
		SePlay( SE_W019 );
		ChangeSoraPokeActMove( task->work[1] );
	}
}

//------------------------------------------
//	ãÛÇîÚÇ‘ 5
//------------------------------------------
static void HidenPokeSora5( TASK_TABLE *task )
{
	EventOBJ *ev;

	task->work[2]++;

	if( task->work[2] > ((64-(9*4))/4) )				// 90ìx - ºﬁ¨›Ãﬂ∂≥›ƒ
	{
		ev = &EvObj[MyMoveState.evobjno];
		EvObjChgParam( ev, GetMainHeroObjCode(H_SWIM) );
		ActAnmChg( &ActWork[ev->actno], SWIM_JUMP_L_ST );
		ev->anm_change_sw = 1;
		AcmdSet( ev, AC_STAY_JUMP_L );

		if( (u8)task->work[15] & MY_MV_BIT_SWIM )
		{
			DelActor( &ActWork[ev->joint_actno[0]] );
		}

		task->work[0]++;
		task->work[2] = 0;
	}
}

//------------------------------------------
//	ãÛÇîÚÇ‘ 6
//------------------------------------------
static void HidenPokeSora6( TASK_TABLE *task )
{
	EventOBJ *ev;

	if( ++task->work[2] > 9 )
	{
		ev = &EvObj[MyMoveState.evobjno];

		AcmdFree( ev );
		ev->anm_change_sw = 0;
		ev->shade_act_sw = 0;
		SetSoraPokeActBackOn( task->work[1], ev->actno );
		FldScrollActStop();
		task->work[0]++;
	}
}

//------------------------------------------
//	ãÛÇîÚÇ‘ 7
//------------------------------------------
static void HidenPokeSora7( TASK_TABLE *task )
{
	if( CheckSoraPokeActMove(task->work[1]) )
	{
		FieldFadeOutSet();
		task->work[0]++;
	}
}

//------------------------------------------
//	ãÛÇîÚÇ‘ 8
//------------------------------------------
static void HidenPokeSora8( TASK_TABLE *task )
{
	if( FadeData.fade_sw == 0 )
	{
		FeCodeDel( FECODE_HidenPokeSora );
		DelTask( CheckTaskNo(TaskHidenPokeSora) );
	}
}

//------------------------------------------
//	ãÛîÚÇ—Œﬂπ”›æØƒ
//------------------------------------------
static u8 SetSoraPokeAct( void )
{
	u8 i;
	actWork *act;

	i = AddActor( EvActHeadGet(EVACT_POKESORA), 255, 180, 1 );
	act = &ActWork[i];

	act->oamData.Pltt = MINE_OBJ_PALNO;
	act->oamData.Priority = 1;
	act->move = SoraPokeStartActMove;

	return( i );
}

//------------------------------------------
//	ãÛîÚÇ—Œﬂπ”› ìÆçÏ¡™Ø∏
//------------------------------------------
static u8 CheckSoraPokeActMove( u8 i )
{
	return( ActWork[i].work[7] );
}

//------------------------------------------
//	ãÛîÚÇ—Œﬂπ”› ìÆçÏïœçX
//------------------------------------------
static void ChangeSoraPokeActMove( u8 i )
{
	actWork *act;

	act = &ActWork[i];
	act->move = SoraPokeActMove;
	act->x = 120;
	act->y = 0;
	act->dx = 0;
	act->dy = 0;
	memset( (u8*)act->work, 0, 16 );
	act->work[6] = ACT_MAX;
}

//------------------------------------------
//	ãÛîÚÇ—Œﬂπ”› îwíÜèÊÇπ
//------------------------------------------
static void SetSoraPokeActBackOn( u8 i, u8 no )
{
	ActWork[i].work[6] = no;
}

static const actAffAnm sora_poke_affanm0[] =
{
	{ 0x0008, 0x0008, -30, ACT_AFSET },
	{ 0x001c, 0x001c, 0, 0x1e },
	{ ACT_AFEND, 0, 0, 0 },
};

static const actAffAnm sora_poke_affanm1[] =
{
	{ 0x0100, 0x0100, 64, ACT_AFSET },
	{ -10, -10, 0, 0x16 },
	{ ACT_AFEND, 0, 0, 0 },
};

static const actAffAnm * const SoraPokeAffAnmTbl[] =
{
	sora_poke_affanm0,
	sora_poke_affanm1,
};

//------------------------------------------
//	ãÛîÚÇ—Œﬂπ”› äJénìÆçÏ
//------------------------------------------
static void SoraPokeStartActMove( actWork *act )
{
	if( act->work[7] )
	{
		return;
	}

	if( act->work[0] == 0 )
	{
		act->oamData.AffineMode = 3;
		act->aff_tbl = SoraPokeAffAnmTbl;
		AffineNumSet( act );
		ActAffAnmChg( act, 0 );

		act->x = 118;
		act->y = 56 - 104;

		act->work[0]++;
		act->work[1] = 64;
		act->work[2] = 0x0100;
	}

	act->work[1] += act->work[2] >> 8;
	act->dx = CosMove( act->work[1], 120 );
	act->dy = SinMove( act->work[1], 120 );
	if( act->work[2] < 0x0800 ) act->work[2] += 0x0060;

	if( act->work[1] >= 130 )
	{
		act->work[7]++;
		act->oamData.AffineMode = 0;
		AffineWorkNumDel( act->oamData.AffineParamNo );
		actCenterCalc( act, act->oamData.Shape, act->oamData.Size, 0 );
	}
}

//------------------------------------------
//	ãÛîÚÇ—Œﬂπ”› à⁄ìÆ
//------------------------------------------
static void SoraPokeActMove( actWork *act )
{
	actWork *ko_act;

	act->dx = CosMove( act->work[2], 140 );
	act->dy = SinMove( act->work[2], 72 );
	act->work[2] = (act->work[2] + 4) & 0xff;

	if( act->work[6] != ACT_MAX )
	{
		ko_act = &ActWork[act->work[6]];
		ko_act->scr = 0;
		ko_act->x = act->x + act->dx;
		ko_act->y = act->y + act->dy - 8;
		ko_act->dx = 0;
		ko_act->dy = 0;
	}

	if( act->work[2] >= 128 )
	{
		act->work[7] = 1;
	}
}

//------------------------------------------
//	ãÛîÚÇ—Œﬂπ”› ñﬂÇÈ
//------------------------------------------
static void SoraPokeActRetMove( actWork *act )
{
	if( act->work[7] )
	{
		return;
	}

	if( act->work[0] == 0 )
	{
		act->oamData.AffineMode = 3;
		act->aff_tbl = SoraPokeAffAnmTbl;
		AffineNumSet( act );
		ActAffAnmChg( act, 1 );

		act->x = 118 - 24;
		act->y = -32;

		act->work[0]++;
		act->work[1] = 240;
		act->work[2] = 0x0800;
		act->work[4] = 0x0080;
	}

	act->work[1] += act->work[2] >> 8;
	act->work[3] += act->work[2] >> 8;
	act->work[1] &= 0xff;
	act->dx = CosMove( act->work[1], 32 );
	act->dy = SinMove( act->work[1], 120 );
	if( act->work[2] > 0x0100 ) act->work[2] -= act->work[4];
	if( act->work[4] < 0x0100 ) act->work[4] += 0x0018;
	if( act->work[2] < 0x0100 ) act->work[2] = 0x0100;

	if( act->work[3] >= 60 )
	{
		act->work[7]++;
		act->oamData.AffineMode = 0;
		AffineWorkNumDel( act->oamData.AffineParamNo );
		act->banish = 1;
	}
}

static void ChanegSoraPokeActRetMove( u8 i )
{
	ChangeSoraPokeActMove( i );
	ActWork[i].move = SoraPokeActRetMove;
}

//======================================================================
//		ÇªÇÁÇ∆Ç—èIóπ
//======================================================================
static void TaskHidenPokeSoraEnd( u8 );
static void HidenPokeSoraEnd0( TASK_TABLE * );
static void HidenPokeSoraEnd1( TASK_TABLE * );
static void HidenPokeSoraEnd2( TASK_TABLE * );
static void HidenPokeSoraEnd3( TASK_TABLE * );
static void HidenPokeSoraEnd4( TASK_TABLE * );
static void HidenPokeSoraEnd5( TASK_TABLE * );
static void HidenPokeSoraEnd6( TASK_TABLE * );

//------------------------------------------
//	Ã®∞Ÿƒﬁ¥Ã™∏ƒ îÈì`ãZ:ÇªÇÁÇÇ∆Ç‘èIóπ
//	In:		nothing
//	Out:	nothing
//------------------------------------------
u32 FeHidenPokeSoraEnd( void )
{
	AddTask( TaskHidenPokeSoraEnd, 0xfe );
	
	return( 0 );
}

//------------------------------------------
//	ÇªÇÁÇ∆Ç—èIóπ ¿Ω∏√∞ÃﬁŸ
//------------------------------------------
static void (* const TaskHidenPokeSoraEndTbl[])( TASK_TABLE * ) =
{
	HidenPokeSoraEnd0,
	HidenPokeSoraEnd1,
	HidenPokeSoraEnd2,
	HidenPokeSoraEnd3,
	HidenPokeSoraEnd4,
	HidenPokeSoraEnd5,
	HidenPokeSoraEnd6,
};

//------------------------------------------
//	ÇªÇÁÇ∆Ç—èIóπ “≤›
//------------------------------------------
static void TaskHidenPokeSoraEnd( u8 no )
{
	TaskHidenPokeSoraEndTbl[TaskTable[no].work[0]]( &TaskTable[no] );
}

//------------------------------------------
//	ÇªÇÁÇ∆Ç—èIóπ 0
//------------------------------------------
static void HidenPokeSoraEnd0( TASK_TABLE *task )
{
	EventOBJ *ev;

	ev = &EvObj[MyMoveState.evobjno];

	if( AcmdSetChk(ev) && AcmdEnd(ev) == 0 )
	{
		return;
	}

	task->work[0]++;
	task->work[2] = 64 / 4 + 1;
	task->work[15] = MyMoveState.flag;
	MyMoveState.mv_pause = 1;
	MyMoveStateMvFlagSet( MY_MV_BIT_NORMAL );

	if( (u8)task->work[15] & MY_MV_BIT_SWIM )
	{
		SetPokeSwimMoveFlag( ev->joint_actno[0], NAMIPOKE_NOWITH );
	}

	EvObjChgParam( ev, GetMainHeroObjCode(H_SWIM) );
	FldScrollActStop();
	EvObjChgSite( ev, SITE_L );
	ActAnmChg( &ActWork[ev->actno], SWIM_JUMP_L_ST );
	ev->banish_sw = 0;

	task->work[1] = SetSoraPokeAct();
	ChangeSoraPokeActMove( task->work[1] );
	SetSoraPokeActBackOn( task->work[1], ev->actno );
}

//------------------------------------------
//	ÇªÇÁÇ∆Ç—èIóπ 1
//------------------------------------------
static void HidenPokeSoraEnd1( TASK_TABLE *task )
{
	EventOBJ *ev;
	actWork *act;

	if( task->work[2] && --task->work[2] )
	{
		return;
	}

	ev = &EvObj[MyMoveState.evobjno];
	act = &ActWork[ev->actno];

	SetSoraPokeActBackOn( task->work[1], ACT_MAX );

	act->x = act->x + act->dx;
	act->y = act->y + act->dy;
	act->dx = 0;
	act->dy = 0;

	task->work[0]++;
	task->work[2] = 0;
}

//------------------------------------------
//	ÇªÇÁÇ∆Ç—èIóπ 2
//------------------------------------------
static void HidenPokeSoraEnd2( TASK_TABLE *task )
{
	actWork *act;
	EventOBJ *ev;
	s16 tbl[] = { -2, -4, -5, -6, -7, -8, -8, -8,
	 			  -7, -7, -6, -5, -3, -2,  0,  2,
				   4,  8, };

	ev = &EvObj[MyMoveState.evobjno];
	act = &ActWork[MyMoveState.actno];

	act->dy = tbl[task->work[2]];
	task->work[2]++;

	if( task->work[2] > 17 )
	{
		task->work[0]++;
	}
}

//------------------------------------------
//	ÇªÇÁÇ∆Ç—èIóπ 3
//------------------------------------------
static void HidenPokeSoraEnd3( TASK_TABLE *task )
{
	EventOBJ *ev;
	actWork *act;

	if( CheckSoraPokeActMove(task->work[1]) )
	{
		ev = &EvObj[MyMoveState.evobjno];
		act = &ActWork[ev->actno];

		ev->anm_change_sw = 0;
		EvObjPosAllChg( ev, ev->gx, ev->gy );
		act->dx = 0;
		act->dy = 0;
		act->scr = 1;
		ChangeHeroActorHiden();

		AcmdSet( ev, AC_ANM_END_WAIT );
		task->work[0]++;
	}
}

//------------------------------------------
//	ÇªÇÁÇ∆Ç—èIóπ 4
//------------------------------------------
static void HidenPokeSoraEnd4( TASK_TABLE *task )
{
	EventOBJ *ev;

	ev = &EvObj[MyMoveState.evobjno];

	if( AcmdEnd(ev) )
	{
		task->work[0]++;
		ChanegSoraPokeActRetMove( task->work[1] );
	}
}

//------------------------------------------
//	ÇªÇÁÇ∆Ç—èIóπ 5
//------------------------------------------
static void HidenPokeSoraEnd5( TASK_TABLE *task )
{
	if( CheckSoraPokeActMove(task->work[1]) )
	{
		DelActor( &ActWork[task->work[1]] );
		task->work[0]++;
		task->work[1] = 16;
	}
}

//------------------------------------------
//	ÇªÇÁÇ∆Ç—èIóπ 6
//------------------------------------------
static void HidenPokeSoraEnd6( TASK_TABLE *task )
{
	u8 code;
	EventOBJ *ev;

	if( --task->work[1] ) return;

	ev = &EvObj[MyMoveState.evobjno];
	code = H_NORMAL;

	if( (u8)task->work[15] & MY_MV_BIT_SWIM )
	{
		code = H_SWIM;
		SetPokeSwimMoveFlag( ev->joint_actno[0], NAMIPOKE_WITH );
	}

	EvObjChgParam( ev, GetMainHeroObjCode(code) );
	EvObjChgSite( ev, SITE_D );
	MyMoveState.flag = (u8)task->work[15];
	MyMoveState.mv_pause = 0;

	FeCodeDel( FECODE_HidenPokeSoraEnd );
	DelTask( CheckTaskNo(TaskHidenPokeSoraEnd) );
}

