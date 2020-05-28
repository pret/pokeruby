//**********************************************************************
//		act_anm.c
//		±¸À°±ÆÒ, ¾ÙÏÈ°¼Ş¬, ±Ì¨İÏÈ°¼Ş¬, ÊßÚ¯ÄÏÈ°¼Ş¬,@OAM Êß¯Ä
//**********************************************************************
#include	<agb.h>
#include 	"common.h"
#include	"actor.h"
#include	"palanm.h"

#include  "cell_bitchk.h"

//======================================================================
//		¸ŞÛ°ÊŞÙ•Ï”
//======================================================================
u8 ObjPalManStart;									// ÊßÚ¯ÄÏÈ°¼Ş¬
u8 AffAnmStopFlag = 0;								// ±Ì¨İ±ÆÒ—LŒø–³ŒøÌ×¸Ş
u32 AffineWorkUse;							// ±Ì¨İÏÈ°¼Ş¬

//======================================================================
//		•Ï”
//======================================================================
static u16 cell_act_num[ACT_MAX];					// ¾ÙÏÈ°¼Ş¬
static u16 cell_char_num[ACT_MAX][2];				// ¾ÙÏÈ°¼Ş¬
static ObjAffinePatWork OBJAffinePatWork[32];		// ŠgkÊß¯ÄÜ°¸
static u16 ObjPalManWork[16];						// µÌŞ¼ŞªÊßÚ¯ÄÏÈ°¼Ş¬

//----------------------------------------------------------------------
//		ŠO•”QÆŠÖ”, •Ï”
//----------------------------------------------------------------------
extern ObjAffineDestData OBJ_AffineWork[32];		// common.c
extern s16 TransAreaFlagChk( u16 );					// oam_act.c
extern u8 TransBitChkSet( u16, u8 );				// oam_act.c
extern void	dmaTransSet( u16, u16, const actAnmData * ); // oam_act.c
extern void	affineWorkinit( void );
extern void affineWorkSet( u8,u16,u16,u16,u16);

//======================================================================
//		±¸À°±ÆÒ
//======================================================================
static	void	anm_sw_off( actWork * );
static	void	anm_sw_on( actWork * );
static	void	affine_anm_set( actWork *act );
static	void	affine_anm( actWork *act );
static	void 	affineWorkDestSet( u8, ObjAffineDestData * );
static	u8		act_affine_no_get( actWork *act );
static 	void 	OBJAffinePatWorkInit( u8 );
static 	void 	OBJAffinePatWorkInitAnm( u8 );
static	void	OBJAffinePatWorkInitSet( u8, u8 );
static	void	OBJAffinePatWorkCalc( u8, actAffAnm * );
static	void	act_hv_flip_set( actWork *, u8, u8 );
static	void	anm_wait_check_del( actWork * );
static	u8		aff_wait_check_del( actWork *, u8 );
static	void	affanm_get( u8, actWork *, actAffAnm * );
static	void	affanm_calc( u8, actAffAnm * );

//------------------------------------------
//	Ã°ÌŞÙ
//------------------------------------------
static void (* const anm_sw_tbl[])(actWork *) =
{
	anm_sw_off,
	anm_sw_on
};
			
static void (* const affanm_sw_tbl[])(actWork *) =
{
	affine_anm,
	affine_anm_set
};

//------------------------------------------
//	±ÆÒ Ò²İ
//------------------------------------------
#if 1													// changed by matsuda 2002.09.01(“ú)
void ActAnm( actWork *act )								// Ò²İ
{
	anm_sw_tbl[act->anm_sw]( act );						// ¾Ù±ÆÒ

	if( AffAnmStopFlag == 0 )
		affanm_sw_tbl[act->affine_sw]( act );			// Šgk±ÆÒ
}
#else
void ActAnm( actWork *act )								// Ò²İ
{
	anm_sw_tbl[act->anm_sw]( act );						// ¾Ù±ÆÒ
	affanm_sw_tbl[act->affine_sw]( act );				// Šgk±ÆÒ
}
#endif

//------------------------------------------
//	±ÆÒ¾¯Ä ŠJn
//------------------------------------------
static void anm_sw_on( actWork *act )
{
	s16 Pat;
	u8  Wait, Hrev, Vrev;
	
	act->anm_offs = 0;									// QÆµÌ¾¯Ä
	act->anmend_sw = 0;									// ±ÆÒI—¹Ì×¸Ş
	act->anm_count = 0;									// Ù°Ìß¶³İÄ
	
	Pat = act->anm_tbl[act->anm_no][act->anm_offs].pat;	// Êß×ÒÀæ“¾
	
	if( Pat == ACT_ANMEND )								// ÀŞĞ°
	{
		return;
	}
	
	act->anm_sw = 0;									// ±ÆÒŠJnÌ×¸Ş¸Ø±

	Wait = act->anm_tbl[act->anm_no][act->anm_offs].wait;
	Hrev = act->anm_tbl[act->anm_no][act->anm_offs].hrev;
	Vrev = act->anm_tbl[act->anm_no][act->anm_offs].vrev;

	if( Wait )											// ³ª²Ä•â³
	{
		Wait--;
	}
	
	act->anm_wait = Wait;								// ³ª²Ä”½‰f

	if( (act->oamData.AffineMode & 0x01) == 0 )
	{
		act_hv_flip_set( act, Hrev, Vrev );				// ÌØ¯Ìß”½‰f
	}
	
	if( act->t_mode )									// ”ñ“]‘—±ÆÒ
	{
		act->oamData.CharNo = (u16)Pat + act->char_num;
	}
	else												// “]‘—Œ^±ÆÒ
	{
		dmaTransSet( Pat, act->oamData.CharNo, act->anm_trans );
	}
}

//------------------------------------------
//	±ÆÒ 2‰ñ–ÚˆÈ~
//------------------------------------------
static void	pat_com_anmend( actWork * );
static void	pat_com_anmloop( actWork * );
static void	pat_com_anmcloop( actWork * );
static void	pat_com_nothing( actWork * );

static void (* const anmpat_command_tbl[])(actWork *) =
{
	pat_com_anmcloop,									// 0 ANMcLOOP(-3)
	pat_com_anmloop,									// 1 ANMLOOP(-2)
	pat_com_anmend,										// 2 ANMEND(-1)
	pat_com_nothing										// 3 ’Êí
};

static void	anm_sw_off( actWork *act )
{
	s16 Pat, tbl_no;
	u8  Hrev, Vrev;

	if( act->anm_wait )									// ³ª²Ä—L‚è
	{
		anm_wait_check_del( act );						// ³ª²ÄŒ¸­

		Hrev = (act->anm_tbl)[act->anm_no][act->anm_offs].hrev;
		Vrev = (act->anm_tbl)[act->anm_no][act->anm_offs].vrev;
		
		if( (act->oamData.AffineMode & 0x01) == 0 )		// ŠgkµÌ
		{
			act_hv_flip_set( act, Hrev, Vrev );			// ÌØ¯Ìß”½‰f
		}
	}
	else												// ³ª²Ä 0
	{
		if( act->anm_pause )							// Îß°½Ş
		{
			return;
		}

		(act->anm_offs)++;

		Pat = (act->anm_tbl)[act->anm_no][act->anm_offs].pat;
		
		tbl_no = 3;

		if( Pat	< 0 )									// Êß¯ÄÏ²Å½ ºÏİÄŞ
		{
			tbl_no = Pat + 3;							// END = -1, LOOP = -2, cLOOP = -3;
		}
		
		anmpat_command_tbl[tbl_no]( act );				// ºÏİÄŞ•Ê¾¯Ä
	}
}

//------------------------------------------
//	±ÆÒ ºÏİÄŞ–³‚µ
//------------------------------------------
static void	pat_com_nothing( actWork *act )
{
	s16 Pat;
	u8  Wait, Hrev, Vrev;

	Pat = (act->anm_tbl)[act->anm_no][act->anm_offs].pat;
	Wait = (act->anm_tbl)[act->anm_no][act->anm_offs].wait;
	Hrev = (act->anm_tbl)[act->anm_no][act->anm_offs].hrev;
	Vrev = (act->anm_tbl)[act->anm_no][act->anm_offs].vrev;
	
	if( Wait )
	{
		Wait--;											// ³ª²Ä•â³
	}
	
	act->anm_wait = Wait;

	if( (act->oamData.AffineMode & 0x01) == 0 )
	{
		act_hv_flip_set( act, Hrev, Vrev );				// ÌØ¯Ìß”½‰f
	}

	if( act->t_mode )
	{
		act->oamData.CharNo = (u16)Pat + act->char_num;
	}
	else
	{
		dmaTransSet( Pat, act->oamData.CharNo, act->anm_trans );
	}
}

//------------------------------------------
//	ACT_ANMEND
//------------------------------------------
static void	pat_com_anmend( actWork *act )
{
	(act->anm_offs)--;									// QÆˆÊ’u
	act->anmend_sw = 1;									// ±ÆÒI—¹Ì×¸Ş(1:I—¹)
}

//------------------------------------------
//	ACT_ANMLOOP
//------------------------------------------
static void	pat_com_anmloop( actWork *act )
{
	s16 Pat;
	u8  Wait, Hrev, Vrev;
	
	act->anm_offs =										// LOOP  wait ‚É–ß‚èŒÂŠ
		(act->anm_tbl)[act->anm_no][act->anm_offs].wait;

	Pat = (act->anm_tbl)[act->anm_no][act->anm_offs].pat;
	Wait = (act->anm_tbl)[act->anm_no][act->anm_offs].wait;
	Hrev = (act->anm_tbl)[act->anm_no][act->anm_offs].hrev;
	Vrev = (act->anm_tbl)[act->anm_no][act->anm_offs].vrev;
				
	if( Wait )
	{
		Wait--;											// ³ª²Ä•â³
	}
	
	act->anm_wait = Wait;

	if( (act->oamData.AffineMode & 0x01) == 0 )
	{
		act_hv_flip_set( act, Hrev, Vrev );				// ÌØ¯Ìß”½‰f
	}

	if( act->t_mode )
	{
		act->oamData.CharNo = (u16)Pat + act->char_num;
	}
	else
	{
		dmaTransSet( Pat, act->oamData.CharNo, act->anm_trans );
	}
}

//------------------------------------------
//	ACT_ANMcLOOP
//------------------------------------------
static void	anm_count_set( actWork * );
static void	anm_count_dec( actWork * );
static void	anm_count_back( actWork * );

static void	pat_com_anmcloop( actWork *act )
{
	if( act->anm_count )
	{
		anm_count_dec( act );							// Ù°Ìß
	}
	else
	{
		anm_count_set( act );							// Ù°ÌßŠJn
	}
}

//------------------------------------------
//	ACT_ANMcLOOP	ŠJn
//------------------------------------------
static void	anm_count_set( actWork *act )
{
	act->anm_count =									// wait ˆÊ’u‚É Ù°Ìß‰ñ”
		(act->anm_tbl)[act->anm_no][act->anm_offs].wait;

	anm_count_back( act );								// C³
	anm_sw_off( act );									// Ä‹A
}

//------------------------------------------
//	ACT_ANMcLOOP	Ù°Ìß
//------------------------------------------
static void	anm_count_dec( actWork *act )
{
	act->anm_count--;									// Ù°Ìß‰ñ”--
	anm_count_back( act );								// C³
	anm_sw_off( act );									// Ä‹A
}

//------------------------------------------
//	ACT_ANMcLOOP	ˆÊ’uC³
//------------------------------------------
static void anm_count_back( actWork *act )
{
	if( act->anm_count )								// 0 = ’Ê‰ß or ×ÍŞÙw’è
	{
		for( act->anm_offs--;
			 (act->anm_tbl)[act->anm_no][act->anm_offs - 1].pat != ACT_ANMcLOOP &&
			 act->anm_offs > 0; act->anm_offs-- );
		act->anm_offs--;
	}
}

//------------------------------------------
//	Šgk±ÆÒŠJn
//------------------------------------------
static void	affine_anm_set( actWork *act )
{
	u8	aff_no;
	actAffAnm aff;

	if( (act->oamData.AffineMode & 0x01) == 0 ||
		act->aff_tbl[0][0].rx == ACT_AFEND )			// ÀŞĞ°
	{
		return;
	}
	
	aff_no = act_affine_no_get( act );					// Ü°¸ÅİÊŞæ“¾
	OBJAffinePatWorkInitAnm( aff_no );					// Ü°¸‰Šú‰»
	affanm_get( aff_no, act, &aff );					// ±ÆÒÃŞ°Àæ“¾

	act->affine_sw = 0;									// ½²¯Á¸Ø±
	act->affend_sw = 0;									// ±ÆÒI—¹Ì×¸Ş¸Ø±
	affanm_calc( aff_no, &aff );
	OBJAffinePatWork[aff_no].wait = aff.wait;
}

//------------------------------------------
//	Šgk±ÆÒ 2‰ñ–ÚˆÈ~
//------------------------------------------
static void	aff_com_cloop( u8, actWork * );
static void	aff_com_loop( u8, actWork * );
static void	aff_com_end( u8, actWork * );
static void	aff_com_nothing( u8, actWork * );
static void	affine_wait_on( u8, actWork * );

static void (* const affine_com_tbl[])(u8, actWork *) =
{
	aff_com_cloop,
	aff_com_loop,
	aff_com_end,
	aff_com_nothing
};

static void	affine_anm( actWork *act )
{
	u8 aff_no;
	s16 pat, tbl_no;

	if( (act->oamData.AffineMode & 0x01) == 0 )			// ”ñŠgk
	{
		return;
	}
	
	aff_no = act_affine_no_get( act );

	if( OBJAffinePatWork[aff_no].wait )					// ³ª²Ä—L‚è
	{
		affine_wait_on( aff_no, act );
	}
	else
	{
		if( act->aff_pause )							// Îß°½Ş
		{
			return;
		}

		OBJAffinePatWork[aff_no].offs++;				// µÌ¾¯Ä‘‰Á
		
		pat =
		(act->aff_tbl)[OBJAffinePatWork[aff_no].no][OBJAffinePatWork[aff_no].offs].rx;
	
		tbl_no = 3;
	
		if( pat >= ACT_AFcLOOP )						// ºÏİÄŞÁª¯¸
		{
			tbl_no = pat - ACT_AFcLOOP;
		}
		
		affine_com_tbl[tbl_no]( aff_no, act );
	}
}	

//------------------------------------------
//	³ª²Ä—L‚è
//------------------------------------------
static void	affine_wait_on( u8 aff_no, actWork *act )
{
	actAffAnm aff;
	
	if( aff_wait_check_del( act, aff_no ) == 0 )		// ³ª²Ä & Îß°½Ş
	{
		affanm_get( aff_no, act, &aff );
		OBJAffinePatWorkCalc( aff_no, &aff );
	}
}


//------------------------------------------
//	ACT_AFcLOOP
//------------------------------------------
static void	aff_count_set( u8, actWork * );
static void	aff_count_dec( u8, actWork * );
static void	aff_count_back( u8, actWork * );

static void aff_com_cloop( u8 aff_no, actWork *act )
{
	if( OBJAffinePatWork[aff_no].count )
	{
		aff_count_dec( aff_no, act );					// Ù°Ìß
	}
	else
	{
		aff_count_set( aff_no, act );					// ŠJn
	}	
}

//------------------------------------------
//	ACT_AFcLOOP		ŠJn
//------------------------------------------
static void	aff_count_set( u8 aff_no, actWork *act )
{
	OBJAffinePatWork[aff_no].count = 					// Y Šgk—¦‚É‰ñ”
		(act->aff_tbl)[OBJAffinePatWork[aff_no].no][OBJAffinePatWork[aff_no].offs].ry;
	
	aff_count_back( aff_no, act );
	affine_anm( act );
}

//------------------------------------------
//	ACT_AFcLOOP		Ù°Ìß
//------------------------------------------
static void aff_count_dec( u8 aff_no, actWork *act )
{
	OBJAffinePatWork[aff_no].count--;
	aff_count_back( aff_no, act );						// C³
	affine_anm( act );									// Ä‹A
}

//------------------------------------------
//	ACT_AFcLOOP		ˆÊ’uC³
//------------------------------------------
static void aff_count_back( u8 no, actWork *act )
{
	if( OBJAffinePatWork[no].count )
	{
		for( OBJAffinePatWork[no].offs--;
			 (act->aff_tbl)[OBJAffinePatWork[no].no]
						   [OBJAffinePatWork[no].offs - 1].rx != ACT_AFcLOOP &&
			 OBJAffinePatWork[no].offs > 0; OBJAffinePatWork[no].offs-- );
		OBJAffinePatWork[no].offs--;					// C³
	}
}

//------------------------------------------
//	ACT_AFLOOP
//------------------------------------------
static void aff_com_loop( u8 aff_no, actWork *act )
{
	actAffAnm aff;
	
	OBJAffinePatWork[aff_no].offs =
		(act->aff_tbl)[OBJAffinePatWork[aff_no].no][OBJAffinePatWork[aff_no].offs].ry;
	
	affanm_get( aff_no, act, &aff );			
	affanm_calc( aff_no, &aff );
	OBJAffinePatWork[aff_no].wait = aff.wait;
}

//------------------------------------------
//	ACT_AFEND
//------------------------------------------
static void aff_com_end( u8 aff_no, actWork *act )
{
	actAffAnm aff = { 0, 0, 0, 0 };

	act->affend_sw = 1;										// I—¹Ì×¸Ş ON
	OBJAffinePatWork[aff_no].offs--;						// –ß‚·
	OBJAffinePatWorkCalc( aff_no, &aff );
}

//------------------------------------------
//	ºÏİÄŞ–³‚µ
//------------------------------------------
static void aff_com_nothing( u8 aff_no, actWork *act )
{
	actAffAnm aff;

	affanm_get( aff_no, act, &aff );
	affanm_calc( aff_no, &aff );
	OBJAffinePatWork[aff_no].wait = aff.wait;
}

//------------------------------------------
//	±Ì¨İÜ°¸¾¯Ä
//------------------------------------------
static void affineWorkDestSet( u8 num, ObjAffineDestData *dest )
{
	OBJ_AffineWork[num].H_DiffX = dest->H_DiffX;
	OBJ_AffineWork[num].V_DiffX = dest->V_DiffX;
	OBJ_AffineWork[num].H_DiffY = dest->H_DiffY;
	OBJ_AffineWork[num].V_DiffY = dest->V_DiffY;
}

//------------------------------------------
//	±Ì¨İQÆ’læ“¾
//------------------------------------------
static u8 act_affine_no_get( actWork *act )
{
	u8	no;
	
	no = 0;

	if( (act->oamData.AffineMode & 0x01) )
	{
		no = (u8)act->oamData.AffineParamNo;				// Ü°¸ÅİÊŞ
	}

	return( no );
}

//------------------------------------------
//	HV ÌØ¯Ìß¾¯Ä
//------------------------------------------
static void act_hv_flip_set( actWork *act, u8 Hflip, u8 Vflip )
{
	act->oamData.AffineParamNo &= 0x007;					// ãˆÊ2ËŞ¯Äíœ
	act->oamData.AffineParamNo |=
			((Hflip ^ act->Hflip) & 0x01) << 3;				// HÌØ¯Ìß”½‰f
	act->oamData.AffineParamNo |=
			((Vflip ^ act->Vflip) & 0x01) << 4;				// VÌØ¯Ìß”½‰f
}

//------------------------------------------
//	ŠgkÜ°¸‰Šú‰»
//------------------------------------------
static void OBJAffinePatWorkInitAnm( u8 num )				// no ”²‚«
{
	OBJAffinePatWork[num].offs = 0;
	OBJAffinePatWork[num].wait = 0;
	OBJAffinePatWork[num].count = 0;
}

static void OBJAffinePatWorkInitSet( u8 num, u8 anm_no )	// no set & init
{
	OBJAffinePatWork[num].no = anm_no;
	OBJAffinePatWork[num].offs = 0;
	OBJAffinePatWork[num].wait = 0;
	OBJAffinePatWork[num].count = 0;
	OBJAffinePatWork[num].src.RatioX = 0x0100;
	OBJAffinePatWork[num].src.RatioY = 0x0100;
	OBJAffinePatWork[num].src.Theta = 0;
}

static void OBJAffinePatWorkInit( u8 num )					// all
{
	OBJAffinePatWork[num].no = 0;
	OBJAffinePatWork[num].offs = 0;
	OBJAffinePatWork[num].wait = 0;
	OBJAffinePatWork[num].count = 0;
	OBJAffinePatWork[num].src.RatioX = 0x0100;
	OBJAffinePatWork[num].src.RatioY = 0x0100;
	OBJAffinePatWork[num].src.Theta = 0;
}

static void OBJAffinePatWorkSet( u8 num, actAffAnm *aff )	// set init
{
	OBJAffinePatWork[num].src.RatioX = aff->rx;
	OBJAffinePatWork[num].src.RatioY = aff->ry;
	OBJAffinePatWork[num].src.Theta = aff->theta << 8;
}

//------------------------------------------
//	±ÆÒ°¼®İ³ª²ÄŒ¸­ Áª¯¸—L‚è
//------------------------------------------
static void anm_wait_check_del( actWork *act )
{
	if( !(act->anm_pause) )									// Îß°½ŞÁª¯¸
	{
		(act->anm_wait)--;
	}
}

//------------------------------------------
//	Šgk±ÆÒ°¼®İ³ª²ÄŒ¸­ Áª¯¸—L‚è
//------------------------------------------
static u8 aff_wait_check_del( actWork *act, u8 num )
{
	if( !(act->aff_pause) )
	{
		OBJAffinePatWork[num].wait--;
	}
	
	return( act->aff_pause );
}

//------------------------------------------
//	Šgk -> ±Ì¨İÜ°¸
//------------------------------------------
static s16 inverse( s16 );

static void OBJAffinePatWorkCalc( u8 num, actAffAnm *aff )
{
	ObjAffineSrcData src;
	ObjAffineDestData dest;

	OBJAffinePatWork[num].src.RatioX += aff->rx;
	OBJAffinePatWork[num].src.RatioY += aff->ry;
	OBJAffinePatWork[num].src.Theta =
		(OBJAffinePatWork[num].src.Theta + (aff->theta << 8)) & 0xff00;
	
	src.RatioX = inverse( OBJAffinePatWork[num].src.RatioX );
	src.RatioY = inverse( OBJAffinePatWork[num].src.RatioY );
	src.Theta = OBJAffinePatWork[num].src.Theta;

	ObjAffineSet( &src, &dest, 1, 2 );
	affineWorkDestSet( num, &dest );
}

static s16 inverse( s16 s )									//  ‹t”(1/s)
{
    s32 tmp;
#if 1
    tmp = 0x10000;
    tmp /= s;
#else
	tmp = Div( 0x00010000, s );
#endif
	return (s16)tmp;
}

//------------------------------------------
//	Šgk±ÆÒÃŞ°Àæ“¾
//------------------------------------------
static void affanm_get( u8 no, actWork *act, actAffAnm *aff )
{
	aff->rx =
	(act->aff_tbl)[OBJAffinePatWork[no].no][OBJAffinePatWork[no].offs].rx;
	aff->ry =
	(act->aff_tbl)[OBJAffinePatWork[no].no][OBJAffinePatWork[no].offs].ry;
	aff->theta =
	(act->aff_tbl)[OBJAffinePatWork[no].no][OBJAffinePatWork[no].offs].theta;
	aff->wait = 
	(act->aff_tbl)[OBJAffinePatWork[no].no][OBJAffinePatWork[no].offs].wait;
}

//------------------------------------------
//	±ÆÒÃŞ°À”½‰f
//------------------------------------------
static void affanm_calc( u8 no, actAffAnm *aff )
{
	actAffAnm dmy = { 0, 0, 0, 0 };							// ÀŞĞ°
	
	if( aff->wait )
	{
		aff->wait--;										// ³ª²Ä•â³
		OBJAffinePatWorkCalc( no, aff );
	}
	else													// 0 = ‰Šú‰»w’è
	{
		OBJAffinePatWorkSet( no, aff );
		OBJAffinePatWorkCalc( no, &dmy );
	}
}

//======================================================================
//		±¸À°±ÆÒ•ÏX
//======================================================================
//------------------------------------------
//	±ÆÒ°¼®İÅİÊŞ•ÏX
//  In:	act			; ¾¯Ä‚·‚é±¸À°
// 		anm_num		; ¾¯ÄÅİÊŞ
//------------------------------------------
void ActAnmChg( actWork *act, u8 anm_num )
{
	act->anm_no = anm_num;
	act->anm_sw = 1;
	act->anmend_sw = 0;
}

//------------------------------------------
//	±ÆÒ°¼®İÅİÊŞ•ÏX Áª¯¸—L‚è
//  In:	act			; ¾¯Ä‚·‚é±¸À°
// 		anm_num		; ¾¯ÄÅİÊŞ
//------------------------------------------
void ActAnmChkChg( actWork *act, u8 anm_num )
{
    if( act->anm_no != anm_num )
	{
		ActAnmChg( act, anm_num );
	}
}

//------------------------------------------
//	±ÆÒ°¼®İµÌ¾¯ÄÅİÊŞ•ÏX & ”½‰f
//	In:	act			; ¾¯Ä±¸À
//		anm_offs	; ±ÆÒµÌ¾¯ÄÅİÊŞ
//------------------------------------------
void ActAnmOffsChg( actWork *act, u8 anm_offs )
{
	u8	dmy;
	
	dmy = act->anm_pause;
	act->anm_offs = anm_offs - 1;
	act->anm_wait = 0;
	act->anm_sw = 0;
	act->anmend_sw = 0;
	act->anm_pause = 0;
	anm_sw_off( act );

	if( act->anm_wait )
	{
		act->anm_wait++;
	}
	
	act->anm_pause = dmy;
}

//------------------------------------------
//	Šgk±ÆÒ°¼®İÅİÊŞ•ÏX
//  In:	act			; ¾¯Ä‚·‚é±¸À°
// 		anm_num		; ¾¯ÄÅİÊŞ
//------------------------------------------
void ActAffAnmChg( actWork *act, u8 anm_num )
{
	u8	no;
	
	no = act_affine_no_get( act );
	OBJAffinePatWorkInitSet( no, anm_num );
	act->affine_sw = 1;
	act->affend_sw = 0;
}

//------------------------------------------
//	Šgk±ÆÒ°¼®İÅİÊŞ•ÏX Áª¯¸—L‚è
//  In:	act			; ¾¯Ä‚·‚é±¸À°
// 		anm_num		; ¾¯ÄÅİÊŞ
//------------------------------------------
void ActAffAnmChkChg( actWork *act, u8 anm_num )
{
	u8	no;

	no = act_affine_no_get( act );
	
	if( OBJAffinePatWork[no].no != anm_num )
	{
		ActAffAnmChg( act, anm_num );
	}
}

//------------------------------------------
//	Šgk±ÆÒ°¼®İÅİÊŞ•ÏX,Šgk—¦•Û
//  In:	act			; ¾¯Ä‚·‚é±¸À°
// 		anm_num		; ¾¯ÄÅİÊŞ
//------------------------------------------
void ActAffAnmHoldChg( actWork *act, u8 anm_num )
{
	u8	no;
	
	no = act_affine_no_get( act );
	OBJAffinePatWork[no].no = anm_num;
	act->affine_sw = 1;
	act->affend_sw = 0;
}

//------------------------------------------
//	Šgk±ÆÒ°¼®İÅİÊŞ•ÏX Šgk—¦•Û Áª¯¸—L‚è
//  In:	act			; ¾¯Ä‚·‚é±¸À°
// 		anm_num		; ¾¯ÄÅİÊŞ
//------------------------------------------
void ActAffAnmHoldChkChg( actWork *act, u8 anm_num )
{
	u8	no;

	no = act_affine_no_get( act );
	
	if( OBJAffinePatWork[no].no != anm_num )
	{
		ActAffAnmHoldChg( act, anm_num );
	}
}

//------------------------------------------
//	·¬×ÅİÊŞ¾¯Ä(”ñ“]‘—)
//------------------------------------------
void ActCharNumSet( actWork *act )
{
	s16 pat;
	
	if( act->t_mode )
	{
		pat = act->anm_tbl[act->anm_no][act->anm_offs].pat;
	
		if( pat < 0 )										// Êß¯ÄÏ²Å½ ºÏİÄŞ
		{
			pat = 0;										// ÀŞĞ°‰»
		}
	
		act->oamData.CharNo = (u16)pat + act->char_num;
	}
}

//======================================================================
//		±Ì¨İÜ°¸ÏÈ°¼Ş¬
//======================================================================
//------------------------------------------
//	‰Šú‰»
//------------------------------------------
void AffineWorkManInit( void )
{
	u8	i;

	AffAnmStopFlag = 0;										// ±Ì¨İ±ÆÒ—LŒø	matsuda 02.09.01
	AffineWorkUse = 0;										// g—p” 0
	affineWorkinit();										// OAMŠgkÜ°¸‰Šú‰»
	for( i = 0; i < 32; OBJAffinePatWorkInit(i), i++ );
}

//------------------------------------------
//	±Ì¨İÜ°¸g—p‰Â”\ŒÂŠæ“¾,“o˜^
//	Out		u8		; g—p‰Â”\ÅİÊŞ (0~31)
//					; 0xff = Error
//------------------------------------------
u8 AffineWorkNumGet( void )
{
	u8	i;
	u32	calc, dmy;

	for( i = 0, calc = 1, dmy = AffineWorkUse; i < 32; i++, calc <<= 1 )
	{
		if( (dmy & calc) == 0 )
		{
			AffineWorkUse |= calc;
			return( i );
		}
	}

	return( 0xff );
}

//------------------------------------------
//	±Ì¨İÜ°¸g—pŒÂŠíœ
//	In		num		; íœNo
//------------------------------------------
void AffineWorkNumDel( u8 num )
{
	u8	i;
	u32	calc;

	for( i = 0, calc = 1; i < num; i++, calc <<= 1 );

	calc = ~calc;											// calc = not calc
	
	AffineWorkUse &= calc;

	affineWorkSet( num, 0x0100, 0x0000, 0x0000, 0x0100 );
}
	
//------------------------------------------
//	±Ì¨İÊß×ÒÀ¾¯Ä
//	In		act		; ¾¯Ä±¸À°
//------------------------------------------
void AffineNumSet( actWork *act )
{
	u8	aff_no;
	
	aff_no = AffineWorkNumGet();							// Ü°¸ÅİÊŞ
	
	if( aff_no == 0xff )									// “o˜^•s‰Â
	{
		return;
	}
	
	actCenterCalc( act, act->oamData.Shape,					// ’†S•â³
			act->oamData.Size, act->oamData.AffineMode );

	act->oamData.AffineParamNo = aff_no;
	act->affine_sw = 1;
	OBJAffinePatWorkInit( aff_no );							// Êß×ÒÀ‰Šú‰»
}

//------------------------------------------
//	OBJ_AffineWork‚Ö‚ÌŠgk—¦¾¯Ä
//	In:		no			; ±Ì¨İÜ°¸ÅİÊŞ
//			rx,ry		; x,yŠgk—¦(0x0100=1)
//			theta		; Šp“x(0x0100=0)
//------------------------------------------
void OBJ_AffineWorkCalc( u8 no, s16 rx, s16 ry, s16 theta )
{
	ObjAffineSrcData src;
	ObjAffineDestData dest;

	src.RatioX = inverse( rx );
	src.RatioY = inverse( ry );
	src.Theta = theta;

	ObjAffineSet( &src, &dest, 1, 2 );
	affineWorkDestSet( no, &dest );
}

//========================================================================
//			¾ÙÏÈ°¼Ş¬
//========================================================================
static void	cellman_pos_set( u16 act_no, u16 adrs, u16 size );
static u8	cellman_pos_get( u16 );

//------------------------------------------
//	¾Ù“o˜^’P”­
//	In		cell	; ¾ÙÃŞ°À
//	Out		u16		; ¾¯Ä·¬×ÅİÊŞ
//------------------------------------------
u16	CellSet( const CellData *cell )								// ¾Ù’P”­“o˜^
{
	s16	adrs;

	adrs = TransAreaFlagChk( (cell->size) >> 5 );			// size / 32 = chara no size

	if( adrs < 0 )											// Ï²Å½ “o˜^•s‰Â 
	{
		return( 0 );
	}

	cellman_pos_set( cell->act_num,	adrs, (cell->size) >> 5 );	// ¾ÙÏÈ°¼Ş¬“o˜^
	
#if DMA_CPU_SELECT
	DmaCopy( 3, cell->ch_data,
				OBJ_MODE0_VRAM + (adrs << 5), cell->size, 16 );	// ·¬×ÃŞ°À“]‘—
#else
	CpuCopy(cell->ch_data, OBJ_MODE0_VRAM + (adrs << 5), cell->size, 16);
#endif
	return( adrs );
}

//------------------------------------------
//	¾Ù“o˜^•¡”
//	In		cell	; ¾ÙÃŞ°À
//	Info
//		cell[] =
//		{
//			//{ ·¬×ÃŞ°À, “]‘—»²½Ş, “o˜^”Ô† }
//			{	&chara_data[0], 0x0040, 0 },
//			{	&chara_data[64], 0x0080, 1 },
//			{   CELL_END, 0, 0 }							// “o˜^I—¹
//		};
//------------------------------------------
void CellSets( const CellData *cell )
{
	u8	i;

	for( i = 0; cell[i].ch_data != CELL_END; CellSet( &cell[i] ), i++ );
}

//------------------------------------------
//	¾Ù“o˜^ŒÂŠíœ
//	In		act_no	; “o˜^”Ô†
//------------------------------------------
void CellDel( u16 act_no )									// “o˜^”Ô†
{
	u8	pos;
	u16	i, adrs, size;
	
	pos  = cellman_pos_get( act_no );						// “o˜^”Ô†ŒÂŠ
	
	if( pos != 0xff )
	{
		adrs = cell_char_num[pos][0];
		size = cell_char_num[pos][1];
	
		for( i = adrs; i < adrs + size; i++ )
		{
//			TransBitChkSet(i,0);								// “o˜^´Ø±¸Ø±
			TRANS_BIT_CLEAR(i);
		}
	
		cell_act_num[pos] = 0xffff;
	}
}
	
//------------------------------------------
//	¾ÙÏÈ°¼Ş¬‘S‰Šú‰»
//------------------------------------------
void CellManAllInit( void )
{
	u8	i;

	for( i = 0; i < ACT_MAX; i++ )
	{
		cell_act_num[i] = 0xffff;
		cell_char_num[i][0] = 0x0000;
		cell_char_num[i][1] = 0x0000;
	}
}
//------------------------------------------
//	“o˜^”Ô† -> “o˜^·¬×ÅİÊŞ
//	In:		act_no		; “o˜^”Ô†
//	Out:	u16			; ·¬×ÅİÊŞ
//						; 0xffff = Error
//------------------------------------------
u16	CellCharNumGet( u16 act_no )
{
	u8	i;
	
	i = cellman_pos_get( act_no );
	
	if( i == 0xff )
	{
		return( 0xffff );
	}

	return( cell_char_num[i][0] );
}

//------------------------------------------
//	“o˜^”Ô† -> “o˜^ˆÊ’u
//------------------------------------------
static u8 cellman_pos_get( u16 act_no )
{
	u8	i;

	for( i = 0; i < ACT_MAX; i++ )
	{
		if( cell_act_num[i] == act_no )
		{
			return( i );
		}
	}

	return( 0xff );
}

//------------------------------------------
//	·¬×ÅİÊŞ -> “o˜^”Ô†
//	In:		chnum			; ·¬×ÅİÊŞ
//	Out:	u16				; ID
//							; 0xffff = Error
//------------------------------------------
u16	CellCharNumIdGet( u16 chnum )
{
	u8 i;
	
	for( i = 0; i < ACT_MAX; i++ )
	{
		if( cell_act_num[i] != 0xffff && cell_char_num[i][0] == chnum )
		{
			return( cell_act_num[i] );
		}
	}
	
	return( 0xffff );
}

//------------------------------------------
//	¾ÙÏÈ°¼Ş¬Êß×ÒÀ¾¯Ä
//------------------------------------------
static void	cellman_pos_set( u16 act_no, u16 adrs, u16 size )
{
	u8	i;
	
	i = cellman_pos_get( 0xffff );							// –¢“o˜^ŒÂŠ
	cell_act_num[i] = act_no;
	cell_char_num[i][0] = adrs;
	cell_char_num[i][1] = size;
}


//========================================================================
//			µÌŞ¼ŞªÊßÚ¯ÄÏÈ°¼Ş¬
//========================================================================
static void	obj_palset_work( const u16 *, u16 );
u8 ObjPalNumGet( u16 );

//------------------------------------------
//	‰Šú‰»
//------------------------------------------
void ObjPalManInit( void )
{
	u8	i;
	
	ObjPalManStart = 0;
	for( i = 0; i < 16; ObjPalManWork[i] = 0xffff, i++ );
}

//------------------------------------------
//	ÊßÚ¯Ä“o˜^’P”­
//	In		pal		; ÊßÚ¯Ä“o˜^ÃŞ°À
//	Out		u8		; “o˜^ÊßÚ¯ÄNo
//					; 0xff = Error
//------------------------------------------
u8 ObjPalSet( const PalData *pal )
{
	u8	pal_no;

	pal_no = ObjPalNumGet( pal->reg_num );

	if( pal_no != 0xff )
	{
		return( pal_no );
	}

	pal_no = ObjPalNumGet( 0xffff );							// –¢“o˜^ŒÂŠ
	
	if( pal_no == 0xff )
	{
		return( pal_no );										// ‹ó‚«–³‚µ
	}

	ObjPalManWork[pal_no] = pal->reg_num;
	obj_palset_work( pal->pal_data, (u16)((u16)pal_no << 4) );	// pal_no * 16
	return( pal_no );
}

//------------------------------------------
//	ÊßÚ¯Ä“o˜^•¡”
//	In		pal		; ÊßÚ¯Ä“o˜^ÃŞ°À
//	Info
//		pal[] = 
//		{ //{ ÊßÚ¯ÄÃŞ°À, “o˜^”Ô† }
//			{ Palette0, 0 },
//			{ Palette1, 1 },
//			{ OBJPAL_END, 0 }		// “o˜^I—¹
//		};
//------------------------------------------
void ObjPalSets( const PalData *pal )
{
	u8	i;

	for( i = 0; pal[i].pal_data != OBJPAL_END && (ObjPalSet(&pal[i])) != 0xff; i++ );
}

//------------------------------------------
//	ÊßÚ¯Ä“]‘—
//------------------------------------------
static void	obj_palset_work( const u16 *pal_data, u16 set_pos )
{
//	DmaCopy( 3, pal_data, OBJ_PLTT + set_pos, 0x0020, 32 );
	PaletteWorkSet( pal_data, PA_OBJ0 + set_pos, 32 );
}

//------------------------------------------
//	ÊßÚ¯Ä“o˜^”Ô†¾¯Ä
//	In:		reg_num		; “o˜^”Ô†
//	Out:	u8			; “o˜^ÊßÚ¯ÄNo
//------------------------------------------
u8 ObjPalNumSet( u16 reg_num )
{
	u8 no;

	no = ObjPalNumGet( 0xffff );
		
	if( no == 0xff )
	{
		return( no );
	}
	
	ObjPalManWork[no] = reg_num;

	return( no );
}

//------------------------------------------
//	“o˜^”Ô† -> ÊßÚ¯ÄNo
//	In		reg_no		; “o˜^”Ô†
//	Out		u8			; ÊßÚ¯ÄNo(0~15)
//						; 0xff = Error
//------------------------------------------
u8 ObjPalNumGet( u16 reg_no )
{
	u8	i;

	for( i = ObjPalManStart; i < 16; i++ )
	{
		if( ObjPalManWork[i] == reg_no )
		{
			return( i );
		}
	}

	return( 0xff );
}

//------------------------------------------
//	ÊßÚ¯ÄÅİÊŞ -> ID
//	In:		no			; ÊßÚ¯Ä No
//	Out:	u16			; ÊßÚ¯Ä ID
//						; 0xffff = Error
//------------------------------------------
u16 ObjPalNumIdGet( u8 no )
{
	return( ObjPalManWork[no] );
}

//------------------------------------------
//	“o˜^”Ô†íœ
//	In		reg_no		; “o˜^”Ô†
//------------------------------------------
void ObjPalRegNumDel( u16 reg_no )
{
	u8	pal_no;

	pal_no = ObjPalNumGet( reg_no );
	
	if( pal_no == 0xff )
	{
		return;
	}
	
	ObjPalManWork[pal_no] = 0xffff;
}

//========================================================================
//	OAM Êß¯Ä
//========================================================================
u8 OamPatDevelop( actWork *, ActOamData *, u8 * );

//------------------------------------------
//	À•W
//------------------------------------------
typedef struct
{
	s8	x;
	s8	y;
}POINTs8;

//------------------------------------------
//	•`‰æ»²½Ş
//------------------------------------------
static const POINTs8 OamBltSize[3][4] =
{
	{
		{8,8},
		{16,16},
		{32,32},
		{64,64},
	},
	{
		{16,8},
		{32,8},
		{32,16},
		{64,32},
	},
	{
		{8,16},
		{8,32},
		{16,32},
		{32,64},
	}
};

//------------------------------------------
//	OAM Êß¯Ä¾¯Ä
//	In:		act			; ¾¯Ä±¸À
//			pat			; Êß¯ÄÃ°ÌŞÙ
//------------------------------------------
void SetActOamPat( actWork *act, const OAMPatSt *pat )
{
	act->oamPat = pat;
	act->oampat_no = 0;
	act->oampat_sw = OAMPAT_ON;
}

//------------------------------------------
//	OAM ‚Ö‚Ìİ’è
//	In:		act			; ±¸À°
//			use			; OAM g—p”
//	Out:	u8			; ON = g—pÅ‘å
//------------------------------------------
u8 ActOamSet( actWork *act, u8 *use )
{
	if( *use >= OamWriteEd )
	{
		return( 1 );
	}
	
	if( act->oamPat == NOT_OAMPAT || act->oampat_sw == OAMPAT_OFF )
	{
		sys.OAMbuf[*use] = act->oamData;
		(*use)++;
		return( 0 );
	}
	else
	{
		return( OamPatDevelop(act,&(sys.OAMbuf[*use]),use) );
	}
}

//------------------------------------------
//	OAM Êß¯Ä“WŠJ
//	In:		act			; “WŠJ±¸À°
//			oam_b		; “WŠJæOAM
//			oam_use		; OAM g—p”
//	Out:	u8			; ON = OAM g—pÅ‘å
//------------------------------------------
u8 OamPatDevelop( actWork *act, ActOamData *oam_b, u8 *oam_use )
{
	u16	chnum;
	s16	x, y, cx, cy;
	u8	i, max, hflip, vflip;
	OAMPatSt *patst;
	ActOamData *oam_a;

	if( *oam_use >= OamWriteEd )
	{
		return( 1 );
	}
	
	patst = (OAMPatSt*)&(act->oamPat[act->oampat_no]);
	oam_a = (ActOamData*)&(act->oamData);

	if( patst == NOT_OAMPAT || patst->pat == NOT_OAMPAT )		// –¢g—p
	{
		*oam_b = *oam_a;
		(*oam_use)++;
		return( 0 );
	}
	
	chnum = oam_a->CharNo;
	max = patst->use;
	hflip = (oam_a->AffineParamNo >> 3) & 0x01;
	vflip = (oam_a->AffineParamNo >> 4) & 0x01;
	cx = (s16)oam_a->HPos - (s16)act->cx;						// X ’†SˆÊ’u
	cy = (s16)oam_a->VPos - (s16)act->cy;						// Y ’†SˆÊ’u
	
	for( i = 0; i < max; i++, (*oam_use)++ )
	{
		if( *oam_use >= OamWriteEd )
		{
			return( 1 );
		}

		x = (s16)(patst->pat[i].x);
		y = (s16)(patst->pat[i].y);
		
		if( hflip )
		{
			x += (s16)OamBltSize[patst->pat[i].shape][patst->pat[i].size].x;
			x = (~x) + 1;
		}
		
		if( vflip )
		{
			y += (s16)OamBltSize[patst->pat[i].shape][patst->pat[i].size].y;
			y = (~y) + 1;
		}

		oam_b[i] = *oam_a;
		oam_b[i].Shape = patst->pat[i].shape;					// Œ`ó
		oam_b[i].Size = patst->pat[i].size;						// »²½Ş
		oam_b[i].HPos = cx + x;									// À•W
		oam_b[i].VPos = cy + y;
		oam_b[i].CharNo = chnum + patst->pat[i].ch_offs;		// ·¬×ÅİÊŞ
		
		if( act->oampat_sw != OAMPAT_PRIUNIT )
		{
			oam_b[i].Priority = patst->pat[i].bg_pri;			// BG Ìß×²µØÃ¨
		}
	}

	return( 0 );
}

