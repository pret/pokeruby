//**********************************************************************
//		cycle.c
//		é©ì]é‘
//**********************************************************************
#define		CYCLE_H_PROTO
#include	<agb.h>
#include	"common.h"
#include	"evobj.h"
#include	"map.h"
#include	"map_attr.h"
#include	"fieldmap.h"
#include	"jiki.h"
#include	"fld_tool.h"
#include	"mapbg.h"
#include	"mus_tool.h"
#include	"scr_tool.h"
#include	"mapparam.h"

//----------------------------------------------------------------------
//		extern
//----------------------------------------------------------------------
extern u8 DebugMainFlag;

//----------------------------------------------------------------------
//		define
//----------------------------------------------------------------------
#define	B_BTN_ON(b)	(b & B_BUTTON)						// BŒﬁ¿›¡™Ø∏
#define AB_MASK (0x0f)									// ABŒﬁ¿›œΩ∏
#define	COM3(c0,c1,c2) ((c0<<8)|(c1<<4)|(c2))			// ∫œ›ƒﬁÀﬁØƒäiî[
#define	CYCLE_S_COMM_MAX 4								// ª≤∏ŸS∫œ›ƒﬁêî

//----------------------------------------------------------------------
//	typedef
//----------------------------------------------------------------------
typedef struct											// ∫œ›ƒﬁ√ﬁ∞¿
{
	u32	key;											// ∑∞
	u32 bt;												// Œﬁ¿›
	u32 key_and;										// ∑∞îªíË
	u32 bt_and;											// Œﬁ¿›îªíË
	const u8 *key_count;								// ∫œ›ƒﬁ∂≥›ƒ
	const u8 *bt_count;									// Œﬁ¿›∂≥›ƒ
	u8 site;											// å¸Ç©ÇπÇÈï˚å¸
}CYCLE_S_COMM;

//----------------------------------------------------------------------
//		Ãﬂ€ƒ
//----------------------------------------------------------------------
static void CycleRaceMove( u8, u16, u16 );
static void CycleActionMove( u8, u16, u16 );

static u8 CycleMoveCheckSite( u8 );
static u8 CycleMoveCheck( EventOBJ *, s16, s16, u8, u8 );
static u8 CycleBatMoveAttrCheckNMapType( u8 );
static u8 CycleSiteChangeCheck( u8, u8 );
static u8 CycleJumpBoardBridgeCheck( u8, u8 );

static u8 CycleActionCommandCheck( void );
static u8 KeySite( u16 );

static void CycleSpeedBrakeClear( void );

static const CYCLE_S_COMM CycleActionCommandTbl[];

//======================================================================
//		é©ì]é‘à⁄ìÆ
//======================================================================
//------------------------------------------
//	é©ã@é©ì]é‘à⁄ìÆ
//	In:		myst		; ê›íËé©ã@èÓïÒ
//			site		; ñΩóﬂï˚å¸
//			trg,cont	; Œﬁ¿›ƒÿ∂ﬁ,∫›√∆≠∞
//------------------------------------------
void HeroMoveCycle( u8 site, u16 trg, u16 cont )
{
	if( MyMoveState.flag & MY_MV_BIT_CYCLE_R )
	{
		CycleRaceMove( site, trg, cont );
	}
	else
	{
		CycleActionMove( site, trg, cont );
	}
}

//======================================================================
//		é©ì]é‘à⁄ìÆ	¿≤ÃﬂR
//======================================================================
static u8 CycleRaceMoveValue( u8 * );
static void race_move_stop( u8 );
static void race_move_turn( u8 );
static void race_move_on( u8 );
static void race_move_brake( u8 );

//------------------------------------------
//	R ìÆçÏ√∞ÃﬁŸ
//------------------------------------------
static void (* const CycleRaceMoveTbl[])(u8 ) =
{
	race_move_stop,
	race_move_turn,
	race_move_on,
	race_move_brake,
};

enum
{
	R_MOVE_STOP = 0,
	R_MOVE_TURN,
	R_MOVE_ON,
	R_MOVE_BRAKE
};

//------------------------------------------
//	R ìÆçÏ
//------------------------------------------
#ifndef PM_DEBUG
static void CycleRaceMove( u8 site, u16 trg, u16 cont )
{
	CycleRaceMoveTbl[CycleRaceMoveValue(&site)]( site );
}
#endif

//------------------------------------------
//	R ìÆçÏ √ﬁ ﬁØ∏ﬁ
//------------------------------------------
#ifdef PM_DEBUG
static void CycleRaceMove( u8 site, u16 trg, u16 cont )
{
	if( DebugMainFlag && HeroDebugMove(site) )
	{
		CycleSpeedBrakeClear();
		return;
	}

	CycleRaceMoveTbl[CycleRaceMoveValue(&site)]( site );
}
#endif

//------------------------------------------
//	ìÆçÏ¡™Ø∏
//------------------------------------------
static u8 CycleRaceMoveValue( u8 *site )
{
	u8 hsite;

	hsite = GetHeroMoveSite();

	if( *site == SITE_N )
	{
		*site = hsite;
		
		if( MyMoveState.cycle_brake )
		{
			MyMoveState.mv_val = EV_M_WALK;
			return( R_MOVE_BRAKE );
		}

		MyMoveState.mv_val = EV_M_STOP;
		return( R_MOVE_STOP );
	}

	if( *site != hsite && MyMoveState.mv_val != EV_M_WALK )
	{
		if( MyMoveState.cycle_brake )
		{
			*site = hsite;
			MyMoveState.mv_val = EV_M_WALK;
			return( R_MOVE_BRAKE );
		}

		MyMoveState.mv_val = EV_M_TURN;
		return( R_MOVE_TURN );
	}

	MyMoveState.mv_val = EV_M_WALK;
	return( R_MOVE_ON );
}

//------------------------------------------
//	ìÆçÏ í‚é~
//------------------------------------------
static void race_move_stop( u8 site )
{
	HeroAcmdStop( site );
	CycleSpeedBrakeClear();
}

//------------------------------------------
//	ìÆçÏ êUÇËå¸Ç´
//------------------------------------------
static void race_move_turn( u8 site )
{
	EventOBJ *ev;
	
	ev = &EvObj[MyMoveState.evobjno];

	if( CycleSiteChangeCheck(site,ev->now_attr) )
	{
		HeroAcmdWalkTurn( site );
		CycleSpeedBrakeClear();
	}
	else
	{
		race_move_stop( ev->site );
	}
}

//------------------------------------------
//	ìÆçÏ à⁄ìÆ√∞ÃﬁŸ
//------------------------------------------
static void (* const race_move_tbl[])(u8) =
{
	HeroAcmdWalk1,
	HeroAcmdWalk2,
	HeroAcmdWalk4,
};

//------------------------------------------
//	ìÆçÏ à⁄ìÆ
//------------------------------------------
static void race_move_on( u8 site )
{
	u8 flag;
	EventOBJ *ev;

	ev = &EvObj[MyMoveState.evobjno];

	if( CycleSiteChangeCheck(site,ev->now_attr) == 0 )
	{
		if( MyMoveState.cycle_brake )
		{
			race_move_brake( ev->mv_site );
		}
		else
		{
			race_move_stop( ev->mv_site );
		}
		
		return;
	}

	flag = CycleMoveCheckSite( site );

	if( flag && flag < HEROHIT_VBRIDGE )
	{
		if( flag == HEROHIT_JUMP )
		{
			HeroAcmdJump( site );
		}
		else
		{
			CycleSpeedBrakeClear();

			if( flag < HEROHIT_START || flag >= HEROHIT_JSTONE )
			{
				HeroAcmdStopWalk( site );
			}
		}

		return;
	}

	race_move_tbl[MyMoveState.cycle_speed]( site );

	MyMoveState.cycle_brake =							// êßìÆãóó£ 1.5
		MyMoveState.cycle_speed + (MyMoveState.cycle_speed >> 1);

	if( MyMoveState.cycle_speed < 2 )							
	{
		MyMoveState.cycle_speed++;						// â¡ë¨
	}
}

//------------------------------------------
//	êßìÆìÆçÏ
//------------------------------------------
static void race_move_brake( u8 site )
{
	u8 flag;
	EventOBJ *ev;

	ev = &EvObj[MyMoveState.evobjno];

	if( MyMoveState.cycle_brake )
	{
		MyMoveState.cycle_brake--;
		MyMoveState.cycle_speed = MyMoveState.cycle_brake;
	}

	flag = CycleMoveCheckSite( site );
	
	if( flag && flag < HEROHIT_VBRIDGE )
	{
		if( flag == HEROHIT_JUMP )
		{
			HeroAcmdJump( site );
		}
		else
		{
			CycleSpeedBrakeClear();

			if( flag < HEROHIT_START || flag >= HEROHIT_JSTONE )
			{
				HeroAcmdStopWalk( site );
			}
		}

		return;
	}

	race_move_tbl[MyMoveState.cycle_speed]( site );
}

//======================================================================
//		é©ì]é‘à⁄ìÆ	¿≤ÃﬂS
//======================================================================
static u8 CycleActionMoveValue( u8 *, u16, u16 );
static u8 action_move_val_normal( u8 *, u16, u16 );
static u8 action_move_val_turn( u8 *, u16, u16 );
static u8 action_move_val_ftup( u8 *, u16, u16 );
static u8 action_move_val_daniel( u8 *, u16, u16 );
static u8 action_move_val_wheelie( u8 *, u16, u16 );
static u8 action_move_val_kani( u8 *, u16, u16 );
static u8 action_move_val_jump_turn( u8 *, u16, u16 );
static void action_move_stop( u8 );
static void action_move_turn( u8 );
static void action_move_on( u8 );
static void action_move_ftup( u8 );
static void action_move_ftdown( u8 );
static void action_move_ftup_stop( u8 );
static void action_move_daniel( u8 );
static void action_move_daniel_walk( u8 );
static void action_move_kani_jump( u8 );
static void action_move_jump_turn( u8 );
static void action_move_wheelie( u8 );
static void action_move_wheelie_start( u8 );
static void action_move_wheelie_end( u8 );

//------------------------------------------
//	S ìÆçÏ√∞ÃﬁŸ
//------------------------------------------
static void (* const CycleActionMoveTbl[])( u8 ) =
{
	action_move_stop,
	action_move_turn,
	action_move_on,
	action_move_ftup,
	action_move_ftdown,
	action_move_ftup_stop,
	action_move_daniel,
	action_move_daniel_walk,
	action_move_kani_jump,
	action_move_jump_turn,
	action_move_wheelie,
	action_move_wheelie_start,
	action_move_wheelie_end,
};

enum
{
	A_MOVE_STOP = 0,
	A_MOVE_TURN,
	A_MOVE_ON,
	A_MOVE_FTUP,
	A_MOVE_FTDOWN,
	A_MOVE_FTUP_STOP,
	A_MOVE_DANIEL,
	A_MOVE_DANIEL_WALK,
	A_MOVE_KANI_JUMP,
	A_MOVE_JUMP_TURN,
	A_MOVE_WHEELIE,
	A_MOVE_WHEELIE_START,
	A_MOVE_WHEELIE_END,
};

//------------------------------------------
//	S ìÆçÏ
//------------------------------------------
#ifndef PM_DEBUG
static void CycleActionMove( u8 site, u16 trg, u16 cont )
{
	CycleActionMoveTbl[CycleActionMoveValue(&site,trg,cont)]( site );
}
#endif

//------------------------------------------
//	S ìÆçÏ √ﬁ ﬁØ∏ﬁ
//------------------------------------------
#ifdef PM_DEBUG
static void CycleActionMove( u8 site, u16 trg, u16 cont )
{
	if( DebugMainFlag && HeroDebugMove(site) )
	{
		CycleSpeedBrakeClear();
		return;
	}

	CycleActionMoveTbl[CycleActionMoveValue(&site,trg,cont)]( site );
}
#endif

//------------------------------------------
//	ìÆçÏ¡™Ø∏√∞ÃﬁŸ
//------------------------------------------
static u8 (* const CycleActionMoveValueTbl[])( u8 *, u16, u16 ) =
{
	action_move_val_normal,								// í èÌ
	action_move_val_turn,								// êUÇËå¸Ç´
	action_move_val_ftup,								// Ã€›ƒ±ØÃﬂ
	action_move_val_daniel,								// ¿ﬁ∆¥Ÿ
	action_move_val_wheelie,							// ≥≤ÿ∞
	action_move_val_kani,								// ∂∆
	action_move_val_jump_turn,							// ºﬁ¨›Ãﬂ¿∞›
};

//------------------------------------------
//	ìÆçÏ¡™Ø∏
//------------------------------------------
static u8 CycleActionMoveValue( u8 *site, u16 trg, u16 cont )
{
	return( CycleActionMoveValueTbl[MyMoveState.work0](site,trg,cont) );
}

//------------------------------------------
//	ìÆçÏ¡™Ø∏Å@í èÌ
//------------------------------------------			
static u8 action_move_val_normal( u8 *site, u16 trg, u16 cont )
{
	u8 hsite;

	hsite = GetHeroMoveSite();
	MyMoveState.cycle_speed = 0;

	if( (*site == SITE_N && B_BTN_ON(trg)) )
	{
		*site = hsite;
		MyMoveState.mv_val = EV_M_STOP;
		MyMoveState.work0 = CYCLE_S_FTUP;
		return( A_MOVE_FTUP );
	}

	if( *site == SITE_N )
	{
		*site = hsite;
		MyMoveState.mv_val = EV_M_STOP;
		return( A_MOVE_STOP );
	}

	if( *site == hsite && B_BTN_ON(cont) && MyMoveState.cycle_brake == 0 )
	{
		MyMoveState.cycle_brake++;
		MyMoveState.work0 = CYCLE_S_WHEELIE;
		return( A_MOVE_WHEELIE_START );
	}

	if( *site != hsite && MyMoveState.mv_val != EV_M_WALK )
	{
		MyMoveState.work0 = CYCLE_S_TURN;
		MyMoveState.work1 = *site;
		MyMoveState.mv_val = EV_M_STOP;
		return( CycleActionMoveValue(site,trg,cont) );
	}

	MyMoveState.mv_val = EV_M_WALK;
	return( A_MOVE_ON );
}

//------------------------------------------
//	ìÆçÏ¡™Ø∏ êUÇËå¸Ç´
//------------------------------------------
static u8 action_move_val_turn( u8 *site, u16 trg, u16 cont )
{
	u8 hsite;

	*site = MyMoveState.work1;							// êUÇËå¸Ç´êÊ
	MyMoveState.cycle_speed++;

	if( MyMoveState.cycle_speed >= 7 )					// over
	{
		MyMoveState.mv_val = EV_M_TURN;
		MyMoveState.work0 = CYCLE_S_NORMAL;
		CycleSpeedBrakeClear();
		return( A_MOVE_TURN );
	}

	hsite = GetHeroMoveSite();

	if( *site == CycleActionCommandCheck() )
	{
		CycleSpeedBrakeClear();
		MyMoveState.cycle_brake = 1;

		if( *site == SiteOpposite(hsite) )
		{
			MyMoveState.work0 = CYCLE_S_JUMP_TURN;
			return( A_MOVE_JUMP_TURN );
		}

		MyMoveState.mv_val = EV_M_WALK;
		MyMoveState.work0 = CYCLE_S_KANI;
		return( A_MOVE_KANI_JUMP );
	}

	*site = hsite;
	return( A_MOVE_STOP );
}

//------------------------------------------
//	ìÆçÏ¡™Ø∏ Ã€›ƒ±ØÃﬂ
//------------------------------------------
static u8 action_move_val_ftup( u8 *site, u16 trg, u16 cont )
{
	u8 hsite;
	EventOBJ *ev;
	
	hsite = GetHeroMoveSite();
	ev = &EvObj[MyMoveState.evobjno];
	MyMoveState.mv_val = EV_M_STOP;

	if( B_BTN_ON(cont) )
	{
		MyMoveState.cycle_speed++;
	}
	else
	{
		MyMoveState.cycle_speed = 0;
		
		if( ATR_IsJumpStoneCheck(ev->now_attr) == 0 )
		{
			*site = hsite;
			MyMoveState.work0 = CYCLE_S_NORMAL;
			CycleSpeedBrakeClear();
			return( A_MOVE_FTDOWN );
		}
	}

	if( MyMoveState.cycle_speed >= 40 )					// ¿ﬁ∆¥Ÿ
	{
		*site = hsite;
		MyMoveState.work0 = CYCLE_S_DANIEL;
		CycleSpeedBrakeClear();
		return( A_MOVE_DANIEL );
	}

	if( *site == hsite )								// ≥≤ÿ∞
	{
		MyMoveState.mv_val = EV_M_WALK;
		MyMoveState.work0 = CYCLE_S_WHEELIE;
		CycleSpeedBrakeClear();
		return( A_MOVE_WHEELIE );
	}

	if( *site == SITE_N )
	{
		*site = hsite;
		return( A_MOVE_FTUP_STOP );
	}

	MyMoveState.mv_val = EV_M_TURN;
	return( A_MOVE_FTUP_STOP );
}

//------------------------------------------
//	ìÆçÏ¡™Ø∏ ¿ﬁ∆¥Ÿ
//------------------------------------------
static u8 action_move_val_daniel( u8 *site, u16 trg, u16 cont )
{
	u8 hsite;
	EventOBJ *ev;
	
	hsite = GetHeroMoveSite();
	ev = &EvObj[MyMoveState.evobjno];

	if( B_BTN_ON(cont) == 0 )
	{
		CycleSpeedBrakeClear();

		if( ATR_IsJumpStoneCheck(ev->now_attr) )
		{
			MyMoveState.work0 = CYCLE_S_FTUP;
			return( CycleActionMoveValue(site,trg,cont) );
		}

		*site = hsite;
		MyMoveState.mv_val = EV_M_STOP;
		MyMoveState.work0 = CYCLE_S_NORMAL;
		return( A_MOVE_FTDOWN );
	}

	if( *site == SITE_N )
	{
		*site = hsite;
		MyMoveState.mv_val = EV_M_STOP;
		return( A_MOVE_DANIEL );
	}

	if( *site != hsite && MyMoveState.mv_val != EV_M_WALK )
	{
		MyMoveState.mv_val = EV_M_TURN;
		return( A_MOVE_DANIEL );
	}

	MyMoveState.mv_val = EV_M_WALK;
	return( A_MOVE_DANIEL_WALK );
}

//------------------------------------------
//	ìÆçÏ¡™Ø∏ ≥≤ÿ∞
//------------------------------------------
static u8 action_move_val_wheelie( u8 *site, u16 trg, u16 cont )
{
	u8 hsite;
	EventOBJ *ev;

	hsite = GetHeroSite();
	ev = &EvObj[MyMoveState.evobjno];

	if( B_BTN_ON(cont) == 0 )
	{
		CycleSpeedBrakeClear();

		if( ATR_IsJumpStoneCheck(ev->now_attr) == 0 )
		{
			MyMoveState.work0 = CYCLE_S_NORMAL;

			if( *site == SITE_N )
			{
				*site = hsite;
				MyMoveState.mv_val = EV_M_STOP;
				return( A_MOVE_FTDOWN );
			}

			if( *site != hsite && MyMoveState.mv_val != EV_M_WALK )
			{
				MyMoveState.mv_val = EV_M_STOP;
				return( A_MOVE_FTDOWN );
			}
	
			MyMoveState.mv_val = EV_M_WALK;
			return( A_MOVE_WHEELIE_END );
		}

		MyMoveState.work0 = CYCLE_S_FTUP;
		return( CycleActionMoveValue(site,trg,cont) );
	}

	if( *site == SITE_N )								// FTUP
	{
		*site = hsite;
		MyMoveState.work0 = CYCLE_S_FTUP;
		MyMoveState.mv_val = EV_M_STOP;
		CycleSpeedBrakeClear();
		return( A_MOVE_FTUP_STOP );
	}

	if( hsite != *site && MyMoveState.mv_val != EV_M_WALK )
	{
		MyMoveState.mv_val = EV_M_STOP;
		return( A_MOVE_FTUP_STOP );
	}

	MyMoveState.mv_val = EV_M_WALK;
	return( A_MOVE_WHEELIE );
}

//------------------------------------------
//	ìÆçÏ¡™Ø∏ ∂∆
//------------------------------------------
static u8 action_move_val_kani( u8 *site, u16 trg, u16 cont )
{
	EventOBJ *ev;
	
	ev = &EvObj[MyMoveState.evobjno];

	ev->site_pause_sw = 0;
	EvObjSiteSet( ev, ev->site );

	MyMoveState.work0 = CYCLE_S_NORMAL;

	return( CycleActionMoveValue(site,trg,cont) );
}

//------------------------------------------
//	ìÆçÏ¡™Ø∏ ºﬁ¨›Ãﬂ¿∞›
//------------------------------------------
static u8 action_move_val_jump_turn( u8 *site, u16 trg, u16 cont )
{
	MyMoveState.work0 = CYCLE_S_NORMAL;

	return( CycleActionMoveValue(site,trg,cont) );
}

//------------------------------------------
//	ìÆçÏ í‚é~
//------------------------------------------
static void action_move_stop( u8 site )
{
	HeroAcmdStop( site );
}

//------------------------------------------
//	ìÆçÏ êUÇËå¸Ç´
//------------------------------------------
static void action_move_turn( u8 site )
{
	EventOBJ *ev;
	
	ev = &EvObj[MyMoveState.evobjno];

	if( CycleSiteChangeCheck(site,ev->now_attr) == 0 )
	{
		site = ev->mv_site;
	}

	HeroAcmdStop( site );
}

//------------------------------------------
//	ìÆçÏ à⁄ìÆ
//------------------------------------------
static void action_move_on( u8 site )
{
	u8 flag;
	EventOBJ *ev;

	ev = &EvObj[MyMoveState.evobjno];

	if( CycleSiteChangeCheck(site,ev->now_attr) == 0 )
	{
		action_move_stop( ev->mv_site );
		return;
	}

	flag = CycleMoveCheckSite( site );
	
	if( flag && flag < HEROHIT_VBRIDGE )
	{
		if( flag == HEROHIT_JUMP )
		{
			HeroAcmdJump( site );
		}
		else if( flag < HEROHIT_START || flag >= HEROHIT_JSTONE )
		{
			HeroAcmdStopWalk( site );
		}
	
		return;
	}

	HeroAcmdWalk3( site );								// ï‡çs∫œ›ƒﬁ
}

//------------------------------------------
//	ìÆçÏ FTUP
//------------------------------------------
static void action_move_ftup( u8 site )
{
	EventOBJ *ev;

	ev = &EvObj[MyMoveState.evobjno];

	if( CycleSiteChangeCheck(site,ev->now_attr) == 0 )
	{
		site = ev->mv_site;
	}

	HeroAcmdMtbFtUp( site );
}

//------------------------------------------
//	ìÆçÏ FTDOWN
//------------------------------------------
static void action_move_ftdown( u8 site )
{
	EventOBJ *ev;

	ev = &EvObj[MyMoveState.evobjno];

	if( CycleSiteChangeCheck(site,ev->now_attr) == 0 )
	{
		site = ev->mv_site;
	}

	HeroAcmdMtbFtDown( site );
}

//------------------------------------------
//	ìÆçÏ FTUP í‚é~
//------------------------------------------
static void action_move_ftup_stop( u8 site )
{
	EventOBJ *ev;

	ev = &EvObj[MyMoveState.evobjno];

	if( CycleSiteChangeCheck(site,ev->now_attr) == 0 )
	{
		site = ev->mv_site;
	}

	HeroAcmdMtbFtUpSite( site );
}

//------------------------------------------
//	ìÆçÏ ¿ﬁ∆¥Ÿ
//------------------------------------------
static void action_move_daniel( u8 site )
{
	EventOBJ *ev;

	ev = &EvObj[MyMoveState.evobjno];

	if( CycleSiteChangeCheck(site,ev->now_attr) == 0 )
	{
		site = ev->mv_site;
	}

	HeroAcmdMtbDaniel( site );
}

//------------------------------------------
//	ìÆçÏ ¿ﬁ∆¥Ÿà⁄ìÆ
//------------------------------------------
static void action_move_daniel_walk( u8 site )
{
	u8 flag;
	EventOBJ *ev;

	ev = &EvObj[MyMoveState.evobjno];
	
	if( CycleSiteChangeCheck(site,ev->now_attr) == 0 )
	{
		action_move_daniel( ev->mv_site );
		return;
	}

	flag = CycleMoveCheckSite( site );
	
	if( flag && flag != HEROHIT_JSTONE )
	{
		if( flag == HEROHIT_JUMP )
		{
			HeroAcmdMtbDaniel2( site );
			return;
		}

		if( flag >= HEROHIT_START && flag < HEROHIT_CYCLE_START )
		{
			return;
		}

		if( flag < HEROHIT_VBRIDGE )
		{
			action_move_daniel( site );
			return;
		}
	}

	HeroAcmdMtbDaniel1( site );
}

//------------------------------------------
//	ìÆçÏ ∂∆ºﬁ¨›Ãﬂ
//------------------------------------------
static void action_move_kani_jump( u8 site )
{
	u8 flag;
	EventOBJ *ev;

	flag = CycleMoveCheckSite( site );

	if( flag )
	{
		if( flag == HEROHIT_KAIRIKI )
		{
			return;
		}

		if( flag <= HEROHIT_START || flag <= HEROHIT_JSTONE )
		{
			action_move_turn( site );
			return;
		}

		if( CycleJumpBoardBridgeCheck(flag,site) == 0 )
		{
			action_move_turn( site );
			return;
		}
	}

	ev = &EvObj[MyMoveState.evobjno];

	SePlay( SE_JITE_PYOKO );
	ev->site_pause_sw = 1;
	HeroAcmdSet( AcmdCodeJump1(site), ACMD_MODE_WALK_1 );
}

//------------------------------------------
//	ìÆçÏ ºﬁ¨›Ãﬂ¿∞›
//------------------------------------------
static void action_move_jump_turn( u8 site )
{
	HeroAcmdJumpTurn( site );
}

//------------------------------------------
//	ìÆçÏ ≥≤ÿ∞
//------------------------------------------
static void action_move_wheelie( u8 site )
{
	u8 flag;
	EventOBJ *ev;

	ev = &EvObj[MyMoveState.evobjno];

	if( CycleSiteChangeCheck(site,ev->now_attr) == 0 )
	{
		HeroAcmdMtbFtUpSite( ev->mv_site );
		return;
	}

	flag = CycleMoveCheckSite( site );

	if( flag && flag < HEROHIT_VBRIDGE )
	{
		if( flag == HEROHIT_JUMP )
		{
			HeroAcmdMtbDaniel2( site );
			return;
		}
		
		if( flag == HEROHIT_JSTONE )
		{
			HeroAcmdMtbFtUpSite( site );
			return;
		}

		if( flag < HEROHIT_START )
		{
			if( ATR_IsJumpStoneCheck(ev->now_attr) )
			{
				HeroAcmdMtbFtUpSite( site );
			}
			else
			{
				HeroAcmdMtbWheelie( site );
			}
		}

		return;
	}

	HeroAcmdMtbWheelie2( site );
	MyMoveState.mv_val = EV_M_WALK;
}

//------------------------------------------
//	ìÆçÏ ≥≤ÿ∞∞äJén
//------------------------------------------
static void action_move_wheelie_start( u8 site )
{
	u8 flag;
	EventOBJ *ev;

	ev = &EvObj[MyMoveState.evobjno];

	if( CycleSiteChangeCheck(site,ev->now_attr) == 0 )
	{
		HeroAcmdMtbFtUp( ev->mv_site );
		return;
	}

	flag = CycleMoveCheckSite( site );
	
	if( flag && flag < HEROHIT_VBRIDGE )
	{
		if( flag == HEROHIT_JUMP )
		{
			HeroAcmdMtbDaniel2( site );
			return;
		}
	
		if( flag == HEROHIT_JSTONE )
		{
			HeroAcmdMtbFtUpSite( site );
			return;
		}

		if( flag < HEROHIT_START )
		{
			if( ATR_IsJumpStoneCheck(ev->now_attr) )
			{
				HeroAcmdMtbFtUpSite( site );
			}
			else
			{
				HeroAcmdMtbWheelie( site );
			}
		}

		return;
	}

	HeroAcmdMtbWheelieStart2( site );
	MyMoveState.mv_val = EV_M_WALK;
}

//------------------------------------------
//	ìÆçÏ ≥≤ÿ∞∞èIóπ
//------------------------------------------
static void action_move_wheelie_end( u8 site )
{
	u8 flag;
	EventOBJ *ev;

	ev = &EvObj[MyMoveState.evobjno];

	if( CycleSiteChangeCheck(site,ev->now_attr) == 0 )
	{
		HeroAcmdMtbFtDown( ev->mv_site );
		return;
	}

	flag = CycleMoveCheckSite( site );
	
	if( flag && flag < HEROHIT_VBRIDGE )
	{
		if( flag == HEROHIT_JUMP )
		{
			HeroAcmdJump( site );
		}
		else if( flag < HEROHIT_START || flag >= HEROHIT_JSTONE )
		{
			HeroAcmdMtbFtDown( site );
		}
	
		return;
	}

	HeroAcmdMtbWheelieEnd2( site );
}

//======================================================================
//		∑∞∫œ›ƒﬁ
//======================================================================
static void S_CommandSet( u16, u16 );
static void CycleCommandSort( u8 );
static void CycleButtonSort( u8 );
static u8 S_CommandCountCheck( const u8 *, const u8 * );

//------------------------------------------
//	∫œ›ƒﬁì¸óÕèÓïÒäiî[
//	In:		myst			; æØƒé©ã@
//			trg,cont		; Œﬁ¿›ƒÿ∂ﬁ,∫›√∆≠
//------------------------------------------
void CycleCommandSet( u16 trg, u16 cont )
{
	if( MyMoveState.flag & MY_MV_BIT_CYCLE_S )
	{
		S_CommandSet( trg, cont );
	}
}

//------------------------------------------
//	¿≤ÃﬂS	∫œ›ƒﬁäiî[
//------------------------------------------
static void S_CommandSet( u16 trg, u16 cont )
{
	u8 cont_site,com_site;

	cont_site = KeySite( cont );						// ∫›√∆≠-
	com_site = (u8)( MyMoveState.command & 0x0f );		// ç≈êV

	if( cont_site == com_site )							// ó≠Çﬂ
	{
		if( MyMoveState.command_count[0] < 0xff )
		{
			MyMoveState.command_count[0]++;
		}
	}
	else
	{
		CycleCommandSort( cont_site );
		MyMoveState.cycle_brake = 0;
	}

	cont_site = cont & AB_MASK;
	com_site = (u8)( MyMoveState.button & 0x0f );		// Œﬁ¿›

	if( cont_site == com_site )
	{
		if( MyMoveState.button_count[0] < 0xff )
		{
			MyMoveState.button_count[0]++;
		}
	}
	else
	{
		CycleButtonSort( cont_site );
		MyMoveState.cycle_brake = 0;
	}
}

//------------------------------------------
//	∫œ›ƒﬁî≠ìÆ∂≥›ƒ¡™Ø∏
//------------------------------------------
static u8 S_CommandCountCheck( const u8 *key_count, const u8 *bt_count )
{
	u8 i;
	
	for( i = 0; key_count[i]; i++ )
	{
		if( MyMoveState.command_count[i] > key_count[i] )
		{
			return( 0 );
		}
	}

	for( i = 0; bt_count[i]; i++ )
	{
		if( MyMoveState.button_count[i] > bt_count[i] )
		{
			return( 0 );
		}
	}

	return( 1 );
}

//------------------------------------------
//	∫œ›ƒﬁî≠ìÆ¡™Ø∏
//------------------------------------------
static u8 CycleActionCommandCheck( void )
{
	u32 key,bt,i;
	const CYCLE_S_COMM *com;

	for( i = 0; i < CYCLE_S_COMM_MAX; i++ )
	{
		com = &CycleActionCommandTbl[i];

		key = MyMoveState.command;
		bt = MyMoveState.button;
		key &= com->key_and;
		bt &= com->bt_and;

		if( (key ^ com->key) == 0 && (bt ^ com->bt) == 0 &&
			S_CommandCountCheck(com->key_count,com->bt_count) )
		{
			return( com->site );
		}
	}

	return( 0 );
}

//------------------------------------------
//	∫œ›ƒﬁø∞ƒ
//------------------------------------------
static void CycleCommandSort( u8 site )
{
	u8	i;
	u32	com;
	
	com = MyMoveState.command;
	
	com <<= 4;											// ç≈å√çÌèú ÀﬁØƒø∞ƒ
	com &= 0xfffffff0;
	com |= site & 0x0f;									// ç≈êVèÓïÒ
	MyMoveState.command = com;

	for( i = 7; i >= 1; i-- )
	{
		MyMoveState.command_count[i] = MyMoveState.command_count[i-1];
	}

	MyMoveState.command_count[0] = 1;					// ç≈êV∂≥›ƒ∏ÿ± 1 origin
}

//------------------------------------------
//	Œﬁ¿›ø∞ƒ	
//------------------------------------------
static void CycleButtonSort( u8 bt )
{
	u8	i;
	u32 button;
	
	button = MyMoveState.button;

	button <<= 4;
	button &= 0xfffffff0;
	button |= bt & 0x0f;
	MyMoveState.button = button;

	for( i = 7; i >= 1; i-- )
	{
		MyMoveState.button_count[i] = MyMoveState.button_count[i - 1];
	}

	MyMoveState.button_count[0] = 1;
}

//------------------------------------------
//	∑∞ -> ï˚å¸
//------------------------------------------
static u8 KeySite( u16 key )
{
	if( key & U_KEY ) return( SITE_U );
	if( key & D_KEY ) return( SITE_D );
	if( key & L_KEY ) return( SITE_L );
	if( key & R_KEY ) return( SITE_R );

	return( SITE_N );
}

//======================================================================
//		à⁄ìÆîªíË
//======================================================================
static void CycleCollisonCount( void );

//------------------------------------------
//	é©ì]é‘à⁄ìÆï˚å¸¡™Ø∏
//------------------------------------------
static u8 CycleMoveCheckSite( u8 site )
{
	s16 x,y;
	EventOBJ *ev;
	
	ev = &EvObj[MyMoveState.evobjno];
	x = ev->gx;
	y = ev->gy;
	SitePosMove( site, &x, &y );

	return( CycleMoveCheck(ev,x,y,site,GetCellAttribute(x,y)) );
}

//------------------------------------------
//	é©ì]é‘à⁄ìÆ¡™Ø∏
//------------------------------------------
static u8 CycleMoveCheck( EventOBJ *ev, s16 x, s16 y, u8 site, u8 attr )
{
	u8 flag;

	flag = HeroMoveCheck( ev, x, y, site, attr );

	if( flag >= HEROHIT_START )							// ì¡éÍÀØƒ
	{
		return( flag );
	}

	if( flag == EVOBJHIT_NOTHING && CycleBatMoveAttrCheckNMapType(attr) )
	{
		flag = EVOBJHIT_ATR;
	}
	
	if( flag )											// è’ìÀîªíË
	{
		CycleCollisonCount();
	}

	return( flag );
}

//------------------------------------------
//	é©ì]é‘à⁄ìÆïsâ¬¡™Ø∏
//	In:		attr			; ¡™Ø∏±ƒÿÀﬁ≠∞ƒ
//	Out:	u8				; On = ïsâ¬
//	Info:	œØÃﬂ¿≤Ãﬂ¡™Ø∏±ÿ
//------------------------------------------
u8 CycleBatMoveAttrCheck( u8 attr )
{
	if( CycleBatMoveAttrCheckNMapType(attr) || NowMap.type == MAPTYPE_ROOM )
	{
		return( 1 );
	}

	return( 0 );
}

//------------------------------------------
//	é©ì]é‘à⁄ìÆïsâ¬¡™Ø∏
//------------------------------------------
static u8 CycleBatMoveAttrCheckNMapType( u8 attr )
{
	if( ATR_IsCycleBatMoveCheck(attr) ||
		(ATR_IsHangBridgeCheck(attr) && (GetHeroHeight() & 0x01) == 0) )
	{
		return( 1 );
	}

	return( 0 );
}

//------------------------------------------
//	é©ì]é‘è’ìÀ∂≥›ƒ
//------------------------------------------
static void CycleCollisonCount( void )
{
	if( bicycle_collision_flag && bicycle_collision_count < 100 )
	{
		bicycle_collision_count++;
	}
}

//------------------------------------------
//	ï˚å¸êÿÇËë÷Ç¶â¬î\¡™Ø∏
//------------------------------------------
static u8 CycleSiteChangeCheck( u8 site, u8 attr )
{
	if( site == SITE_L || site == SITE_R )
	{
		if( ATR_IsVBoardCheck(attr) || ATR_IsVBridgeCheck(attr) )
		{
			return( 0 );
		}
	}
	else
	{
		if( ATR_IsHBoardCheck(attr) || ATR_IsHBridgeCheck(attr) )
		{
			return( 0 );
		}
	}
	
	return( 1 );
}

//------------------------------------------
//	î¬,ã¥,èÊÇËà⁄ÇË¡™Ø∏
//------------------------------------------
static u8 CycleJumpBoardBridgeCheck( u8 flag, u8 site )
{
	if( site == SITE_D || site == SITE_U )
	{
		if( flag == HEROHIT_VBOARD || flag == HEROHIT_VBRIDGE )
		{
			return( 0 );
		}
	}
	else if( flag == HEROHIT_HBOARD || flag == HEROHIT_HBRIDGE )
	{
		return( 0 );
	}
	
	return( 1 );
}

//======================================================================
//		èÊÇËç~ÇË
//======================================================================
//------------------------------------------
//	é©ì]é‘Ç…èÊÇÍÇÈÇ©Ç«Ç§Ç©
//	Out:	u8			; On = ïsâ¬
//------------------------------------------
u8 CheckRideCycle( void )
{
	s16 x,y;
	u8 attr;

	if( (MyMoveState.flag & MY_MV_BIT_SWIM) ||			// îgèÊÇË
		(MyMoveState.flag & MY_MV_BIT_DIVING) )			// ¿ﬁ≤Àﬁ›∏ﬁ
	{
		return( 1 );
	}

	GetHeroCellPos( &x, &y );
	attr = GetCellAttribute( x, y );

	if( CycleBatMoveAttrCheckNMapType(attr) )
	{
		return( 1 );
	}

	return( 0 );
}

//------------------------------------------
//	é©ì]é‘Ã€›ƒ¿≤‘Çâ∫ÇÎÇπÇÈÇ©Ç«Ç§Ç©
//	Out:		u8 			; ON = â¬î\
//------------------------------------------
u8 CheckFtDownEnableCycle( void )
{
	if( CheckHeroState(MY_MV_BIT_CYCLE_S) &&
		ATR_IsJumpStoneCheck(EvObj[MyMoveState.evobjno].now_attr) )
	{
		return( 0 );
	}

	return( 1 );
}

//------------------------------------------
//	é©ì]é‘ÿ∏¥Ωƒ
//	In:		cycle_bit		; é©ì]é‘éÌóﬁÀﬁØƒ
//	Info:	ï‡Ç´->é©ì]é‘
//			é©ì]é‘->ï‡Ç´
//------------------------------------------
//----
#if 0													// âÊñ èCê≥±ÿ
//----
void MyCycleRequest( u8 cycle_bit )
{
	if( MyMoveState.flag & MY_MV_BIT_CYCLE_AND )
	{
		MyMoveState.req_flag |= MY_MV_BIT_NORMAL;
		MapViewControlFlag = 0;
		MapBGM_Start();
	}
	else
	{
		MyMoveState.req_flag |= cycle_bit;
		MapViewControlFlag = 1;
		MapBGM_FadeChange( MUS_CYCLING );
	}
}
//----
#elif 0													// âÊñ èCê≥ñ≥Çµ & ÿ∏¥ΩƒÃ◊∏ﬁ
//----
void MyCycleRequest( u8 cycle_bit )
{
	MapViewControlFlag = 0;

	if( MyMoveState.flag & MY_MV_BIT_CYCLE_AND )
	{
		MyMoveState.req_flag |= MY_MV_BIT_NORMAL;
		MapBGM_ClearSpecial();
		MapBGM_Start();
	}
	else
	{
		MyMoveState.req_flag |= cycle_bit;
		MapBGM_SetSpecial( MUS_CYCLING );
		MapBGM_FadeChange( MUS_CYCLING );
	}
}
//----
#else													// âÊñ èCêÆñ≥Çµ & ÇªÇÃèÍæØƒ
//----
void MyCycleRequest( u8 cycle_bit )
{
	MapViewControlFlag = 0;

	if( MyMoveState.flag & MY_MV_BIT_CYCLE_AND )
	{
		SetHeroMoveRequest( MY_MV_BIT_NORMAL );
		MapBGM_ClearSpecial();
		MapBGM_Start();
	}
	else
	{
		SetHeroMoveRequest( cycle_bit );
		MapBGM_SetSpecial( MUS_CYCLING );
		MapBGM_FadeChange( MUS_CYCLING );
	}
}
//----
#endif
//----

//======================================================================
//		‹∞∏
//======================================================================
//------------------------------------------
//	é©ì]é‘‹∞∏èâä˙âª
//	In:		myst			; ∏ÿ±Ω√∞¿Ω
//			com				; æØƒ∫œ›ƒﬁ
//------------------------------------------
void MyCycleWorkInit( u32 com, u32 bt )
{
	u8 i;

	MyMoveState.work0 = 0;
	MyMoveState.work1 = 0;
	MyMoveState.cycle_speed = 0;
	MyMoveState.cycle_brake = 0;
	MyMoveState.command = com;
	MyMoveState.button = bt;

	for( i = 0; i < 8; MyMoveState.command_count[i] = 0, i++ );
	for( i = 0; i < 8; MyMoveState.button_count[i] = 0, i++ );
}

//------------------------------------------
//	ë¨ìxæØƒ
//------------------------------------------
void CycleSpeedBrakeSet( u8 speed )
{
	MyMoveState.cycle_speed = speed;
	MyMoveState.cycle_brake =							// êßìÆãóó£ 1.5
		MyMoveState.cycle_speed + (MyMoveState.cycle_speed >> 1);
}

//------------------------------------------
//	ë¨ìx∏ÿ±
//------------------------------------------
static void CycleSpeedBrakeClear( void )
{
	MyMoveState.cycle_speed = 0;
	MyMoveState.cycle_brake = 0;
}

//------------------------------------------
//	é©ã@ÇÃë¨ìxÇéÊìæ
//	Out:	s16			; ë¨ìx(1,2,3,4) 
//------------------------------------------
s16 GetHeroMoveSpeed( void )
{
	s16 tbl[] = { 1, 2, 4 };

	if( MyMoveState.flag & MY_MV_BIT_CYCLE_R )			// œØ 
	{
		return( tbl[MyMoveState.cycle_speed] );
	}

	if( MyMoveState.flag & MY_MV_BIT_CYCLE_S )			// ¿ﬁ∞ƒ
	{
		return( 3 );
	}

	if( MyMoveState.flag & (MY_MV_BIT_SWIM | MY_MV_BIT_B_DASH) )
	{
		return( 2 );									// îgèÊÇË,B¿ﬁØº≠
	}

	return( 1 );										// ï‡çs,¿ﬁ≤Àﬁ›∏ﬁ
}

//------------------------------------------
//	é©ì]é‘èÛë‘èâä˙âª
//------------------------------------------
void SetHeroCycleStatus( void )
{
	u8 attr;
	s16 x,y;

	if( MyMoveState.flag & MY_MV_BIT_CYCLE_S )
	{
		GetHeroCellPos( &x, &y );
		attr = GetCellAttribute( x, y );

		if( ATR_IsJumpStoneCheck(attr) )				// ã≠êßFTUP
		{
			MyMoveState.work0 = CYCLE_S_FTUP;
			ChangeHeroActorCycleFtUp( GetHeroMoveSite() );
		}
	}
}

//======================================================================
//		∫œ›ƒﬁ√ﬁ∞¿
//======================================================================
//------------------------------------------
//	∑∞∫œ›ƒﬁ∂≥›ƒ
//------------------------------------------
static const u8 Cycle_S_CountTbl[] =					// ó¨óp
{ 4, 0 };

//------------------------------------------
//	∑∞∫œ›ƒﬁ√∞ÃﬁŸ
//------------------------------------------
static const CYCLE_S_COMM CycleActionCommandTbl[CYCLE_S_COMM_MAX] =
{
	{													// â∫
		COM3( 0, 0, SITE_D ),
		COM3( 0, 0, B_BUTTON ),
		0x0000000f,
		0x0000000f,
		Cycle_S_CountTbl,
		Cycle_S_CountTbl,
		SITE_D,
	},
	{													// è„
		COM3( 0, 0, SITE_U ),
		COM3( 0, 0, B_BUTTON ),
		0x0000000f,
		0x0000000f,
		Cycle_S_CountTbl,
		Cycle_S_CountTbl,
		SITE_U,
	},
	{													// âE
		COM3( 0, 0, SITE_L ),
		COM3( 0, 0, B_BUTTON ),
		0x0000000f,
		0x0000000f,
		Cycle_S_CountTbl,
		Cycle_S_CountTbl,
		SITE_L,
	},
	{													// ç∂
		COM3( 0, 0, SITE_R ),
		COM3( 0, 0, B_BUTTON ),
		0x0000000f,
		0x0000000f,
		Cycle_S_CountTbl,
		Cycle_S_CountTbl,
		SITE_R,
	},
};

