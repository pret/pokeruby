//**********************************************************************
//		kaga.c
//		kagaya √ﬁ ﬁØ∏
//**********************************************************************
#include "common.h"
#include "intr.h"
#include "actor.h"
#include "actanm.h"
#include "palanm.h"
#include "menu.h"
#include "task.h"
#include "fld_eff.h"
#include "evobj.h"
#include "jiki.h"
#include "fieldmap.h"
#include "map_attr.h"
#include "fld_main.h"
#include "namein.h"
#include "mul_play.h"
#include "fld_main.h"
#include "script.h"
#include "slot.h"
#include "objdata.h"
#include "decord.h"
#include "poketool.h"
#include "calctool.h"
#include "mapparam.h"
#include "fld_bgm.h"
#include "ev_flag.h"
#include "sysflag.h"
#include "ev_check.h"
#include "mystatus.h"
#include "mus_tool.h"
#include "weather.h"
#include "fld_task.h"

//----
#ifdef PM_DEBUG
//----
//----------------------------------------------------------------------
//		extern
//----------------------------------------------------------------------
extern void FlyingInit(void);							// 2002/01/25 taya
extern const u32 DecordAdrs[];
extern u8 (*MenuFunc)();								// “∆≠∞Ãß›∏ºÆ›

//----------------------------------------------------------------------
//		define
//----------------------------------------------------------------------

//----------------------------------------------------------------------
//		Ãﬂ€ƒ
//----------------------------------------------------------------------
u8 SwimTest( void );
u8 SoraTest( void );
u8 DivingTest( void );

static u8 CardTest( void );
static u8 FriendCardTest( void );
static u8 SlotTest( void );

//----------------------------------------------------------------------
//		“∆≠∞√ﬁ∞¿
//----------------------------------------------------------------------
static const u8 fnt_test0[] = {KA_,bou_,DO_,EOM_};
static const u8 fnt_test1[] = {tu_,u_,si_,n_, KA_,bou_,DO_,EOM_};
static const u8 fnt_test2[] = {SU_,RO_,TTU_,TO_,EOM_};

static const MENU_ITEM	KagaMenuList[] =
{
	{ fnt_test0, CardTest },
	{ fnt_test1, FriendCardTest },
	{ fnt_test2, SlotTest },
};

#define	KAGA_MENU_LIST_MAX	3
#define	KAGA_MENU_X		9
#define	KAGA_MENU_Y		7

//======================================================================
//		√ﬁ ﬁØ∏“∆≠∞
//======================================================================
static void TestMenuBlt( void );
static u8	TestMenu( void );

//------------------------------------------
//	√ﬁ ﬁØ∏“∆≠∞
//------------------------------------------
u8 KagayaDebug( void )
{
	TestMenuBlt();
	return( 0 );
}

//------------------------------------------
//	√ﬁ ﬁØ∏“∆≠∞	æØƒ
//------------------------------------------
static void TestMenuBlt( void )
{
	NMenuScreenClear();
	NMenuWinBoxWrite( 0, 0, KAGA_MENU_X, KAGA_MENU_Y );
	NMenuFixListWrite( 2, 1, KAGA_MENU_LIST_MAX, KagaMenuList );
	NMenuVCursorInit( 1, 1, KAGA_MENU_LIST_MAX, 0 );
	MenuFunc = TestMenu;
}

//------------------------------------------
//	√ﬁ ﬁØ∏“∆≠∞	ëIë
//------------------------------------------
static u8 TestMenu( void )
{
	s8	flag;

	flag = NMenuVCursorControl();
	
	if( flag == CURSOR_DEFAULT_VALUE )
	{
		return( 0 );
	}

	if( flag == CURSOR_CANCEL_VALUE )
	{
		MenuEnd();
		return( 1 );
	}
	
	MenuFunc = KagaMenuList[flag].ptr;
	
	return( 0 );
}

//======================================================================
//		√ﬁ ﬁØ∏ﬁ“∆≠∞èàóù
//======================================================================
//------------------------------------------
//	ƒ⁄∞≈∞∂∞ƒﬁ
//------------------------------------------
static u8 CardTest1( void );
static u8 FriendCardTest1( void );

static u8 CardTest( void )
{
	PaletteFadeReq( 0xffffffff, 0, 0, 16, 0 );
	MenuFunc = CardTest1;
	return( 0 );
}
	
static u8 CardTest1( void )
{
	if( !(PaletteAnime()) )
	{
		SetTrainerCardPlayerDebug( FieldMenuRecover );
		MenuEnd();
		SetForceEvent();
		return( 1 );
	}
	
	return( 0 );
}

static u8 FriendCardTest( void )
{
	PaletteFadeReq( 0xffffffff, 0, 0, 16, 0 );
	MenuFunc = FriendCardTest1;
	return( 0 );
}
	
static u8 FriendCardTest1( void )
{
	if( !(PaletteAnime()) )
	{
		SetTrainerCardFriendDebug( FieldMenuRecover );
		MenuEnd();
		SetForceEvent();
		return( 1 );
	}

	return( 0 );
}

//------------------------------------------
//	Ω€Øƒ
//------------------------------------------
static u8 SlotTest2( void );

static u8 SlotTest( void )
{
	PaletteFadeReq( 0xffffffff, 0, 0, 16, 0 );
	MenuFunc = SlotTest2;
	return( 0 );
}
	
static u8 SlotTest2( void )
{
	if( !(PaletteAnime()) )
	{
		SlotDebug( pp_rand() % 6, FieldMenuRecover );
		MenuEnd();
		SetForceEvent();
		return( 1 );
	}

	return( 0 );
}

//======================================================================
//		√ﬁ ﬁØ∏ﬁ
//======================================================================
//------------------------------------------
//	îgèÊÇË
//------------------------------------------
u8 SwimTest( void )
{
	if( (MyMoveState.flag & MY_MV_BIT_SWIM) == 0 )
	{
		MenuEnd();

		if( CheckHeroAttrNaminoriStart() )
		{
			FeSetWork[0] = 0;							// √Ωƒ≈› ﬁ
			FldEffSet( FECODE_HidenPokeSwim );
		}
	}
	else
	{
		MenuEnd();
	}

	return( 1 );
}

//------------------------------------------
//	ãÛÇîÚÇ‘
//------------------------------------------
static u8 SoraTest2( void );

u8 SoraTest( void )
{
	PaletteFadeReq( 0xffffffff, 0, 0, 16, 0 );
	MenuFunc = SoraTest2;
	return( 0 );
}
	
static u8 SoraTest2( void )
{
	if( !(PaletteAnime()) )
	{
		MenuEnd();
		MainProcChange( FlyingInit );
		return( 1 );
	}

	return( 0 );
}

//------------------------------------------
//	¿ﬁ≤Àﬁ›∏ﬁ
//------------------------------------------
u8 DivingTest( void )
{
	u8 flag;

	MenuEnd();

	flag = DivingMapCheck();
	
	if( flag )
	{
		FeSetWork[0] = 0;
		FeSetWork[1] = flag - 1;
		FldEffSet( FECODE_Diving );
	}

	return( 1 );
}

//----
#endif // PM_DEBUG
//----
