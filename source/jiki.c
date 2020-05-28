//**********************************************************************
//		jiki.c
//		自機
//**********************************************************************
#define		JIKI_H_PROTO
#include	<agb.h>
#include	"common.h"
#include	"evobj.h"
#include	"map.h"
#include	"map_attr.h"
#include	"fieldmap.h"
#include	"pokesio.h"
#include	"jiki.h"
#include	"fld_tool.h"
#include	"multisio.h"
#include	"sysflag.h"
#include	"ev_flag.h"
#include	"task.h"
#include	"poketool.h"
#include	"wazano.def"
#include	"r_door.h"			//DoorPushCheck
#include	"ecnt_dat.h"
#include	"script.h"
#include	"menu.h"
#include	"calctool.h"
#include	"letter.h"
#include	"mus_tool.h"
#include	"record.h"

//----------------------------------------------------------------------
//		外部参照
//----------------------------------------------------------------------
extern u8 DebugMainFlag;
extern u8 TemotiNijyuuCheck(PokemonParam *pp, u16 wazano);
extern void FishEncountSet( u8 );
extern u8 FishingEncount2( void );

//----------------------------------------------------------------------
//		define
//----------------------------------------------------------------------

//----------------------------------------------------------------------
//		ﾌﾟﾛﾄ
//----------------------------------------------------------------------
static u8 HeroUnderControl( void );
static void HeroMoveNormal( u8, u16 );
static void ExitCursorControl( EventOBJ * );
static void SetHeroPushRockTask( u8, u8 );
static void SetHeroJumpingMatTask( void );
static void SetHeroTurnMatTask( void );
static void SetHeroSwimEndTask( u8 );

//======================================================================
//		自機動作
//======================================================================
static u8 HeroMove( EventOBJ *, actWork * );

//------------------------------------------
//	自機動作
//------------------------------------------
void EvObj_HeroMove( actWork *act )
{
	AcmdBranch( &EvObj[act->work[0]], act, HeroMove );
}

//------------------------------------------
//	自機動作
//------------------------------------------
static u8 HeroMove( EventOBJ *ev, actWork *act )
{
	return( 0 );
}

//======================================================================
//		動作制御
//======================================================================
static u8 HeroMoveStartCheck( EventOBJ *, u8 );
static void HeroMoveStartInit( EventOBJ * );
static void HeroMoveSet( u8, u16, u16 );
static void HeroUnderFlagReset( void );

//------------------------------------------
//	自機動作制御
//	In:		site		; 移動方向
//			trg			; ﾎﾞﾀﾝﾄﾘｶﾞｰ
//			cont		; ﾎﾞﾀﾝｺﾝﾄﾛｰﾗｰ
//------------------------------------------
void HeroMoveControl( u8 site, u16 trg, u16 cont )
{
	EventOBJ *ev;

	ev = &EvObj[MyMoveState.evobjno];

	ExitCursorControl( ev );

	if( MyMoveState.mv_pause )
	{
		return;
	}

	CycleCommandSet( trg, cont );

	if( HeroMoveStartCheck(ev,site) )
	{
		return;
	}

	HeroMoveStartInit( ev );
	HeroMoveRequest();

	if( HeroUnderControl() )
	{
		return;
	}

	HeroMoveSet( site, trg, cont );
	HeroUnderFlagReset();
}

//------------------------------------------
//	移動開始ﾁｪｯｸ
//------------------------------------------
static u8 HeroMoveStartCheck( EventOBJ *ev, u8 site )
{
	u8 code;

	if( AcmdSetChk(ev) )
	{
		if( AcmdEnd(ev) )
		{
			return( 0 );
		}

		code = AcmdCode( ev );

		if( code >= AC_STAY_WALK_D_05 && code <= AC_STAY_WALK_R_05 )
		{
			if( site != SITE_N && ev->mv_site != site )
			{
				AcmdFreeWork( ev );
				return( 0 );
			}
		}

		return( 1 );
	}

	return( 0 );
}

//------------------------------------------
//	開始初期化
//------------------------------------------
static void HeroMoveStartInit( EventOBJ *ev )
{
	ev->anm_change_sw = 0;								// 固定ﾌﾗｸﾞｸﾘｱ
	ev->anm_pause_sw = 0;
	ev->site_pause_sw = 0;
	MyMoveState.flag &= (~MY_MV_BIT_B_DASH);			// Bﾀﾞｯｼｭﾌﾗｸﾞｸﾘｱ
}

//------------------------------------------
//	動作設定
//------------------------------------------
static void HeroMoveSet( u8 site, u16 trg, u16 cont )
{
	if( MyMoveState.flag & MY_MV_BIT_CYCLE_AND )
	{
		HeroMoveCycle( site, trg, cont );				// 自転車移動へ
	}
	else
	{
		HeroMoveNormal( site, cont );					// 通常移動へ
	}
}

//------------------------------------------
//	足元ﾌﾗｸﾞ
//------------------------------------------
static void HeroUnderFlagReset( void )
{
	if( MyMoveState.mv_val == EV_M_WALK )				// 移動
	{
		MyMoveState.flag &= ~MY_MV_BIT_UNDER;			// 足元無効化ﾌﾗｸﾞｸﾘｱ
	}
}

//======================================================================
//		足元制御
//======================================================================
#define	UNDER_ATR_CHK_MAX	18
static u8 HeroUnderCheck( void );
static u8 (* const HeroUnderCheckTbl[])( u8 );
static u8 (* const HeroUnderSetTbl[])( void );

//------------------------------------------
//	足下制御
//------------------------------------------
#ifndef PM_DEBUG
static u8 HeroUnderControl( void )
{
	return( HeroUnderSetTbl[HeroUnderCheck()]() );
}
#endif

//------------------------------------------
//	足下制御 ﾃﾞﾊﾞｯｸﾞ
//------------------------------------------
#ifdef PM_DEBUG
static u8 HeroUnderControl( void )
{
	if( DebugMainFlag && (sys.Cont & R_BUTTON) )
	{
		return( 0 );
	}

	return( HeroUnderSetTbl[HeroUnderCheck()]() );
}
#endif

//------------------------------------------
//	足元ﾁｪｯｸ
//------------------------------------------
static u8 HeroUnderCheck( void )
{
	u8 i,attr;

	if( (MyMoveState.flag & MY_MV_BIT_UNDER) == 0 )		// 足下無効化
	{
		attr = EvObj[MyMoveState.evobjno].now_attr;

		for( i = 0; i < UNDER_ATR_CHK_MAX; i++ )
		{
			if( HeroUnderCheckTbl[i](attr) ) return( i + 1 );
		}
	}

	return( 0 );
}

//------------------------------------------
//	足元 特に無し
//------------------------------------------
static u8 non_force_set( void )
{
	EventOBJ *ev;

	if( MyMoveState.flag & MY_MV_BIT_FORCE )			// 強制移動が掛かっている
	{
		ev = &EvObj[MyMoveState.evobjno];
		ev->site_pause_sw = 0;
		ev->anm_pause_clr_sw = 1;
		EvObjSiteSet( ev, ev->site );
		MyMoveState.flag &= ~MY_MV_BIT_FORCE;
	}

	return( 0 );
}

//------------------------------------------
//	足下 強制移動ｾｯﾄ
//------------------------------------------
static u8 force_move_set( u8 site, void (*setcmd)(u8) )
{
	u8 flag;
	EventOBJ *ev;

	ev = &EvObj[MyMoveState.evobjno];
	flag = HeroMoveCheckSite( site );

	MyMoveState.flag |= MY_MV_BIT_FORCE;

	if( flag )
	{
		non_force_set();
		if( flag < HEROHIT_START ) return( 0 );
		if( flag == HEROHIT_JUMP ) HeroAcmdJump( site );
		MyMoveState.flag |= MY_MV_BIT_FORCE;
		MyMoveState.mv_val = EV_M_WALK;
		return( 1 );
	}

	MyMoveState.mv_val = EV_M_WALK;
	setcmd( site );

	return( 1 );
}

//------------------------------------------
//	足下 ｽﾍﾞﾘｾｯﾄ
//------------------------------------------
static u8 force_slip_move_set( void (*setcmd)(u8) )
{
	EventOBJ *ev;
	
	ev = &EvObj[MyMoveState.evobjno];
	ev->anm_pause_sw = 1;

	return( force_move_set(ev->mv_site,setcmd) );
}

//------------------------------------------
//	足元 ｽﾍﾞﾘ 2
//------------------------------------------
static u8 force_slip_2_set( void )
{
	return( force_slip_move_set(HeroAcmdWalk2) );
}

//------------------------------------------
//	足元 強制移動 1 下
//------------------------------------------
static u8 force_1_down_set( void )
{
	return( force_move_set(SITE_D,HeroAcmdWalk1) );
}

//------------------------------------------
//	足元 強制移動 1 上
//------------------------------------------
static u8 force_1_up_set( void )
{
	return( force_move_set(SITE_U,HeroAcmdWalk1) );
}

//------------------------------------------
//	足元 強制移動 1 左
//------------------------------------------
static u8 force_1_left_set( void )
{
	return( force_move_set(SITE_L,HeroAcmdWalk1) );
}

//------------------------------------------
//	足元 強制移動 1 右
//------------------------------------------
static u8 force_1_right_set( void )
{
	return( force_move_set(SITE_R,HeroAcmdWalk1) );
}

//------------------------------------------
//	足元 強制移動 3 下
//------------------------------------------
static u8 force_3_down_set( void )
{
	return( force_move_set(SITE_D,HeroAcmdWalk3) );
}

//------------------------------------------
//	足元 強制移動 3 上
//------------------------------------------
static u8 force_3_up_set( void )
{
	return( force_move_set(SITE_U,HeroAcmdWalk3) );
}

//------------------------------------------
//	足元 強制移動 3 左
//------------------------------------------
static u8 force_3_left_set( void )
{
	return( force_move_set(SITE_L,HeroAcmdWalk3) );
}

//------------------------------------------
//	足元 強制移動 3 右
//------------------------------------------
static u8 force_3_right_set( void )
{
	return( force_move_set(SITE_R,HeroAcmdWalk3) );
}

//------------------------------------------
//	足下 固定強制 ｾｯﾄ
//------------------------------------------
static u8 force_fix_move_set( u8 site, void (*setcmd)(u8) )
{
	EventOBJ *ev;

	ev = &EvObj[MyMoveState.evobjno];
	ev->anm_pause_sw = 1;
	ev->site_pause_sw = 1;

	return( force_move_set(site,setcmd) );
}

//------------------------------------------
//	足下 固定強制 2 下
//------------------------------------------
static u8 force_fix_2_down_set( void )
{
	return( force_fix_move_set(SITE_D,HeroAcmdWalk2) );
}

//------------------------------------------
//	足元 固定強制 2 上
//------------------------------------------
static u8 force_fix_2_up_set( void )
{
	return( force_fix_move_set(SITE_U,HeroAcmdWalk2) );
}

//------------------------------------------
//	足元 固定強制 2 左
//------------------------------------------
static u8 force_fix_2_left_set( void )
{
	return( force_fix_move_set(SITE_L,HeroAcmdWalk2) );
}

//------------------------------------------
//	足元 固定強制 2 右
//------------------------------------------
static u8 force_fix_2_right_set( void )
{
	return( force_fix_move_set(SITE_R,HeroAcmdWalk2) );
}

//------------------------------------------
//	足下	ｼﾞｬﾝﾋﾟﾝｸﾞﾏｯﾄ
//------------------------------------------
static u8 force_jumping_mat_set( void )
{
	SetHeroJumpingMatTask();
	return( 1 );
}

//------------------------------------------
//	足下	くるっとﾏｯﾄ
//------------------------------------------
static u8 force_turn_mat_set( void )
{
	SetHeroTurnMatTask();
	return( 1 );
}

//------------------------------------------
//	足下	滑る坂
//------------------------------------------
static u8 force_slip_slope_set( void )
{
	EventOBJ *ev;
	
	ev = &EvObj[MyMoveState.evobjno];

	if( ev->mv_site != SITE_U ||
		GetHeroMoveSpeed() < HERO_MOVE_SPEED_MAX )
	{
		// 方向を消す等の処理が必要になるであろう
		CycleSpeedBrakeSet( 0 );						// 仮
		ev->site_pause_sw = 1;
		return( force_move_set(SITE_D,HeroAcmdWalk2) );
	}

	return( 0 );
}

//------------------------------------------
//	ｱﾄﾘﾋﾞｭｰﾄﾁｪｯｸﾃｰﾌﾞﾙ
//------------------------------------------
static u8 (* const HeroUnderCheckTbl[])( u8 ) =
{
	ATR_IsSlipFloorRoomCheck,							// ｽﾘｯﾌﾟ 2
	ATR_IsSlipFloorIceCheck,							// ｽﾘｯﾌﾟ 2

	ATR_IsDownForceMoveCheck,							// 強制 1
	ATR_IsUpForceMoveCheck,
	ATR_IsLeftForceMoveCheck,
	ATR_IsRightForceMoveCheck,

	ATR_IsDownForceMoveCurrentCheck,					// 強制 2
	ATR_IsUpForceMoveCurrentCheck,
	ATR_IsLeftForceMoveCurrentCheck,
	ATR_IsRightForceMoveCurrentCheck,

	ATR_IsDownForcePushCheck,							// 方向固定強制
	ATR_IsUpForcePushCheck,
	ATR_IsLeftForcePushCheck,
	ATR_IsRightForcePushCheck,

	ATR_IsWaterFallCheck,								// 滝

	ATR_IsJumpingMatCheck,								// ｼﾞｬﾝﾋﾟﾝｸﾞﾏｯﾄ
	ATR_IsTurnMatCheck,									// くるくるﾏｯﾄ

	ATR_IsSlipSlopeCheck,								// 滑る坂
};

//------------------------------------------
//	強制移動処理ﾃｰﾌﾞﾙ
//------------------------------------------
static u8 (* const HeroUnderSetTbl[])(void) =
{
	non_force_set,										// 強制無し

	force_slip_2_set,									// ｽﾍﾞﾘ 2
	force_slip_2_set,									// ｽﾍﾞﾘ 2

	force_1_down_set,									// 強制移動 1
	force_1_up_set,
	force_1_left_set,
	force_1_right_set,

	force_3_down_set,									// 強制移動 2
	force_3_up_set,
	force_3_left_set,
	force_3_right_set,

	force_fix_2_down_set,								// 固定強制 2
	force_fix_2_up_set,
	force_fix_2_left_set,
	force_fix_2_right_set,

	force_3_down_set,									// 滝 下押しだし

	force_jumping_mat_set,								// ｼﾞｬﾝﾋﾟﾝｸﾞﾏｯﾄ
	force_turn_mat_set,									// くるくるﾏｯﾄ
	
	force_slip_slope_set,								// 滑る坂
};

//======================================================================
//		通常移動
//======================================================================
static u8 NormalMoveValue( u8 );
static void normal_move_stop( u8, u16 );
static void normal_move_turn( u8, u16 );
static void normal_move_on( u8, u16 );

//------------------------------------------
//	動作ﾃｰﾌﾞﾙ
//------------------------------------------
static void (* const NormalMoveTbl[])( u8, u16 ) =
{
	normal_move_stop,
	normal_move_turn,
	normal_move_on,
};

enum
{
	NORMAL_MOVE_STOP,
	NORMAL_MOVE_TURN,
	NORMAL_MOVE_ON,
};

//------------------------------------------
//	通常移動
//------------------------------------------
#ifndef PM_DEBUG
static void HeroMoveNormal( u8 site, u16 cont )
{
	NormalMoveTbl[NormalMoveValue(site)]( site, cont );
}
#endif

//------------------------------------------
//	通常移動 ﾃﾞﾊﾞｯｸﾞ
//------------------------------------------
#ifdef PM_DEBUG
static void HeroMoveNormal( u8 site, u16 cont )
{
	if( DebugMainFlag && HeroDebugMove(site) )
	{
		return;
	}

	NormalMoveTbl[NormalMoveValue(site)]( site, cont );
}
#endif

//------------------------------------------
//	通常移動 動作ﾁｪｯｸ
//------------------------------------------
static u8 NormalMoveValue( u8 site )
{
	u8 hsite;

	if( site == SITE_N )								// 命令無し
	{
		MyMoveState.mv_val = EV_M_STOP;					// 停止
		return( NORMAL_MOVE_STOP );
	}

	hsite = GetHeroMoveSite();

	if( site != hsite &&								// 方向 != 命令方向
		MyMoveState.mv_val != EV_M_WALK )				// 移動中ではない
	{
		MyMoveState.mv_val = EV_M_TURN;					// 振り向き
		return( NORMAL_MOVE_TURN );
	}

	MyMoveState.mv_val = EV_M_WALK;						// 移動
	return( NORMAL_MOVE_ON );
}

//------------------------------------------
//	通常移動	命令無し
//------------------------------------------
static void normal_move_stop( u8 site, u16 cont )
{
	HeroAcmdStop( GetHeroSite() );
}

//------------------------------------------
//	通常移動	振り向き
//------------------------------------------
static void normal_move_turn( u8 site, u16 cont )
{
	HeroAcmdWalkTurn( site );
}

//------------------------------------------
//	通常移動	移動
//------------------------------------------
static void normal_move_on( u8 site, u16 cont )
{
	u8 flag;
	
	flag = HeroMoveCheckSite( site );
	
	if( flag )
	{
		if( flag == HEROHIT_JUMP )
		{
			HeroAcmdJump( site );
			return;
		}

		if( flag < HEROHIT_START || flag >= HEROHIT_CYCLE_START )
		{
			HeroAcmdStopWalk05( site );
		}

		return;
	}

	if( MyMoveState.flag & MY_MV_BIT_SWIM )
	{
		HeroAcmdWalk2( site );							// 歩行ｺﾏﾝﾄﾞ
	}
	else
	{
		if( ((MyMoveState.flag & MY_MV_BIT_DIVING) == 0) &&
			(cont & B_BUTTON) && EventFlagCheck(SYS_B_DASH) &&
			CycleBatMoveAttrCheck(EvObj[MyMoveState.evobjno].now_attr) == 0 )
		{
			HeroAcmdDash2( site );
			MyMoveState.flag |= MY_MV_BIT_B_DASH;
		}
		else
		{
			HeroAcmdWalk1( site );						// 歩行ｺﾏﾝﾄﾞ
		}
	}
}

//======================================================================
//		移動判定
//======================================================================
static u8 HeroMoveCheckSwim( s16, s16, u8 );
static u8 HeroMoveCheckJump( s16, s16, u8 );
static u8 HeroMoveCheckPushRock( s16, s16, u8 );
static void HeroMoveCheckCycleOnly( s16, s16, u8, u8 * );

//------------------------------------------
//	自機 方向移動ﾁｪｯｸ
//------------------------------------------
u8 HeroMoveCheckSite( u8 site )
{
	s16 x,y;
	EventOBJ *ev;
	
	ev = &EvObj[MyMoveState.evobjno];
	x = ev->gx;
	y = ev->gy;
	SitePosMove( site, &x, &y );

	return( HeroMoveCheck(ev,x,y,site,GetCellAttribute(x,y)) );
}

//------------------------------------------
//	自機 移動ﾁｪｯｸ
//------------------------------------------
u8 HeroMoveCheck( EventOBJ *ev, s16 x, s16 y, u8 site, u8 attr )
{
	u8 flag;

	flag = EvObjMoveChk( ev, x, y, site );

	if( flag == EVOBJHIT_HEIGHT && HeroMoveCheckSwim(x,y,site) )
	{
		return( HEROHIT_SWIM );
	}

	if( HeroMoveCheckJump(x,y,site) )
	{
		IncRecord( CNT_JUMP );
		return( HEROHIT_JUMP );
	}

	if( flag == EVOBJHIT_OBJ && HeroMoveCheckPushRock(x,y,site) )
	{
		return( HEROHIT_KAIRIKI );
	}

	if( flag == EVOBJHIT_NOTHING )
	{
		if( DoorPushCheck(site,x,y) )
		{
			return( HEROHIT_DOOR );
		}

		HeroMoveCheckCycleOnly( x, y, attr, &flag );
	}
	
	return( flag );
}

//------------------------------------------
//	波乗り移動ﾁｪｯｸ
//------------------------------------------
static u8 HeroMoveCheckSwim( s16 x, s16 y, u8 site )
{
	u8 height;

	if( (MyMoveState.flag & MY_MV_BIT_SWIM) )
	{
		height = GetCellHeight( x, y );

		if( height == 3 && EvObjHitCheck(x,y,height) == EV_OBJ_MAX )
		{
			SetHeroSwimEndTask( site );					// 上陸
			return( 1 );
		}
	}

	return( 0 );
}

//------------------------------------------
//	ｼﾞｬﾝﾌﾟ移動ﾁｪｯｸ
//------------------------------------------
static u8 HeroMoveCheckJump( s16 x, s16 y, u8 site )
{
	if( EvMapAttrJumpChk(x,y,site) )
	{
		return( 1 );
	}

	return( 0 );
}

//------------------------------------------
//	怪力移動ﾁｪｯｸ
//------------------------------------------
static u8 HeroMoveCheckPushRock( s16 x, s16 y, u8 site )
{
	u8 i;
	EventOBJ *rock;

	if( EventFlagCheck(SYS_USE_WAZA_KAIRIKI) )			// 怪力使用
	{
		i = EvObjWorkMapPosGet( x, y );

		if( i == EV_OBJ_MAX || EvObj[i].obj_code != PUSHROCK1 )
		{
			return( 0 );
		}

		rock = &EvObj[i];

		x = rock->gx;
		y = rock->gy;
		SitePosMove( site, &x, &y );

		if( EvObjMoveChk(rock,x,y,site) ||
			ATR_IsWallExitCheck(GetCellAttribute(x,y)) )
		{
			return( 0 );								// 押し不可
		}

		SetHeroPushRockTask( i, site );

		return( 1 );
	}

	return( 0 );
}

//------------------------------------------
//	自転車用ｱﾄﾘﾋﾞｭｰﾄﾁｪｯｸﾃｰﾌﾞﾙ
//------------------------------------------
#define HMCOC_MAX 5

static u8 (* const HeroMoveCheckCycleOnlyTbl[])(u8) =
{
	ATR_IsJumpStoneCheck,
	ATR_IsVBoardCheck,
	ATR_IsHBoardCheck,
	ATR_IsVBridgeCheck,
	ATR_IsHBridgeCheck,
};

static const u8 HeroMoveCheckCycleOnlyFlagTbl[] =
{
	HEROHIT_JSTONE,
	HEROHIT_VBOARD,
	HEROHIT_HBOARD,
	HEROHIT_VBRIDGE,
	HEROHIT_HBRIDGE,
};

//------------------------------------------
//	自転車専用ｱﾄﾘﾋﾞｭｰﾄﾁｪｯｸ
//------------------------------------------
static void HeroMoveCheckCycleOnly( s16 x, s16 y, u8 attr, u8 *flag )
{
	u8 i;

	for( i = 0; i < HMCOC_MAX; i++ )
	{
		if( HeroMoveCheckCycleOnlyTbl[i](attr) )
		{
			*flag = HeroMoveCheckCycleOnlyFlagTbl[i];
			return;
		}
	}
}

//======================================================================
//		要求
//======================================================================
static void hero_normal_req( EventOBJ * );
static void hero_cycle_r_req( EventOBJ * );
static void hero_cycle_s_req( EventOBJ * );
static void hero_swim_req( EventOBJ * );
static void hero_div_req( EventOBJ * );
static void hero_under_req( EventOBJ * );
static void hero_dmy_req( EventOBJ * );

//------------------------------------------
//	ﾘｸｴｽﾄﾌﾗｸﾞｾｯﾄ & ﾘｸｴｽﾄ
//	In:		req_flag	; MY_MV_BIT_SWIM 等
//------------------------------------------
void SetHeroMoveRequest( u16 req_flag )
{
	MyMoveState.req_flag |= req_flag;
	HeroMoveRequest();
}

//------------------------------------------
//	ﾘｸｴｽﾄﾃｰﾌﾞﾙ
//------------------------------------------
static void (* const HeroRequestTbl[])( EventOBJ * ) =
{
	hero_normal_req,									// 0 通常移動
	hero_cycle_r_req,									// 1 自転車 TYPE_R
	hero_cycle_s_req,									// 2 自転車 TYPE_S
	hero_swim_req,										// 3 波乗り
	hero_div_req,										// 4 ﾀﾞｲﾋﾞﾝｸﾞ
	hero_under_req,										// 5 足下無効化
	hero_dmy_req,										// 6 強制移動
	hero_dmy_req,										// 7
};
	
//------------------------------------------
//	ﾌﾗｸﾞ,ｺｰﾄﾞｺﾝﾄﾛｰﾙ
//------------------------------------------
void HeroMoveRequest( void )
{
	u8 i,req;

	req = MyMoveState.req_flag;

	if( req )
	{
		for( i = 0; i < 8; i++, req >>= 1 )
		{
			if( (req & 0x01) ) HeroRequestTbl[i](&EvObj[MyMoveState.evobjno]);
		}

		MyMoveState.req_flag = 0;
	}
}

//------------------------------------------
//	ﾀﾞﾐｰﾘｸｴｽﾄ
//------------------------------------------
static void hero_dmy_req( EventOBJ *ev )
{
}

//------------------------------------------
//	ﾘｸｴｽﾄ	通常移動
//------------------------------------------
static void hero_normal_req( EventOBJ *ev )
{
	EvObjChgParam( ev, GetMainHeroObjCode(H_NORMAL) );
	EvObjChgSite( ev, ev->mv_site );
	MyMoveStateMvFlagSet( MY_MV_BIT_NORMAL );
}

//------------------------------------------
//	ﾘｸｴｽﾄ	自転車ﾀｲﾌﾟR
//------------------------------------------
static void hero_cycle_r_req( EventOBJ *ev )
{
	EvObjChgParam( ev, GetMainHeroObjCode(H_CYCLER) );
	EvObjChgSite( ev, ev->mv_site );
	MyMoveStateMvFlagSet( MY_MV_BIT_CYCLE_R );
	MyCycleWorkInit( 0, 0 );
}

//------------------------------------------
//	ﾘｸｴｽﾄ	自転車ﾀｲﾌﾟS
//------------------------------------------
static void hero_cycle_s_req( EventOBJ *ev )
{
	EvObjChgParam( ev, GetMainHeroObjCode(H_CYCLES) );
	EvObjChgSite( ev, ev->mv_site );
	MyMoveStateMvFlagSet( MY_MV_BIT_CYCLE_S );
	MyCycleWorkInit( 0, 0 );
	SetHeroCycleStatus();
}

//------------------------------------------
//	波乗りﾘｸｴｽﾄ
//------------------------------------------
static void hero_swim_req( EventOBJ *ev )
{
	u8	i;

	EvObjChgParam( ev, GetMainHeroObjCode(H_SWIM) );
	EvObjChgSite( ev, ev->mv_site );
	MyMoveStateMvFlagSet( MY_MV_BIT_SWIM );
	FeSetWork[0] = ev->gx;
	FeSetWork[1] = ev->gy;
	FeSetWork[2] = MyMoveState.evobjno;
	i = FldEffSet( FECODE_PokeSwim );
	ev->joint_actno[0] = i;
	SetPokeSwimMoveFlag( i, NAMIPOKE_WITH );
}

//------------------------------------------
//	ﾀﾞｲﾋﾞﾝｸﾞﾘｸｴｽﾄ(現状波乗り
//------------------------------------------
static void hero_div_req( EventOBJ *ev )
{
	EvObjChgParam( ev, GetMainHeroObjCode(H_DIV) );
	EvObjChgSite( ev, ev->mv_site );
	MyMoveStateMvFlagSet( MY_MV_BIT_DIVING );
	ev->joint_actno[0] = EvActDivingSwaySet( ev->actno );

#if 0
	FeSetWork[0] = ev->gx;
	FeSetWork[1] = ev->gy;
	FeSetWork[2] = MyMoveState.evobjno;
	i = FldEffSet( FECODE_PokeSwim );
	ev->joint_actno[0] = i;
	SetPokeSwimMoveFlag( i, NAMIPOKE_WITH );
	ActWork[i].oamData.Priority = BGPRI2;
#endif
}

//------------------------------------------
//	足下無効化ﾘｸｴｽﾄ
//------------------------------------------
static void hero_under_req( EventOBJ *ev )
{
	MyMoveState.flag |= MY_MV_BIT_UNDER;
}

//======================================================================
//		動作状況
//======================================================================
static u8 HeroAcmdStopCheck0( void );
static u8 HeroAcmdStopCheck1( void );

//------------------------------------------
//	自機動作状況ｾｯﾄ
//------------------------------------------
void HeroMvStateSet( void )
{
	MyMoveState.mv_state = EV_M_OFF;					// 無

	if( HeroAcmdSetChk() == 0 )							// ｺﾏﾝﾄﾞﾁｪｯｸ
	{
		return;											// 非ｺﾏﾝﾄﾞ
	}

	if( HeroAcmdEndChk() == 0 )							// 終了ﾁｪｯｸ
	{
		if( HeroAcmdStopCheck0() == 0 )					// 動作中,ｺﾏﾝﾄﾞｺｰﾄﾞﾁｪｯｸ
		{
			MyMoveState.mv_state = EV_M_ON;				// 動作中
		}
	}
	else if( HeroAcmdStopCheck1() == 0 )				// 動作終了
	{
		MyMoveState.mv_state = EV_M_END;				// 動作終了
	}
}

//------------------------------------------
//	ｱﾆﾒｰｼｮﾝｺｰﾄﾞ 停止ｺｰﾄﾞﾁｪｯｸ
//------------------------------------------
static u8 HeroAcmdStopCheck0( void )
{
	u8 code;

	code = EvObj[MyMoveState.evobjno].acmd;

#if 0
	if(	code <= AC_SITE_R ||
		(code >= AC_WAIT_1 && code <= AC_WAIT_16) ||
		(code >= AC_STAY_WALK_D_05 && code <= AC_STAY_WALK_R_4) ||
		(code >= AC_MTB_FTUP_SITE_D && code <= AC_MTB_FTDOWN_R) ||
		(code >= AC_MTB_DANIEL_D && code <= AC_MTB_DANIEL_R) ||
		(code >= AC_MTB_WHEELIE_D && code <= AC_MTB_WHEELIE_R) )
	{
		return( 1 );
	}
#else
	if(	code <= AC_SITE_R ||
		(code >= AC_WAIT_1 && code <= AC_WAIT_16) ||
		(code >= AC_STAY_WALK_D_05 && code <= AC_STAY_WALK_R_4) ||
		(code >= AC_MTB_FTUP_SITE_D && code <= AC_MTB_FTDOWN_R) ||
		(code >= AC_MTB_WHEELIE_D && code <= AC_MTB_WHEELIE_R) )
	{
		return( 1 );
	}
#endif

	return( 0 );
}

//------------------------------------------
//	ｱﾆﾒｰｼｮﾝｺﾏﾝﾄﾞ 停止ｺｰﾄﾞﾁｪｯｸ 振り向きあり
//------------------------------------------
static u8 HeroAcmdStopCheck1( void )
{
	u8 code;

	if( HeroAcmdStopCheck0() )
	{
		code = EvObj[MyMoveState.evobjno].acmd;

		if( MyMoveState.mv_val != EV_M_TURN )
		{
			return( 1 );
		}
	}

	return( 0 );
}

//======================================================================
//		自機ｺﾏﾝﾄﾞ
//======================================================================
static void HeroWallHitSePlay( u8 );

//------------------------------------------
//	自機ｺﾏﾝﾄﾞﾁｪｯｸ
//------------------------------------------
u8 HeroAcmdSetChk( void )
{
	return( AcmdSetChk(&EvObj[MyMoveState.evobjno]) );
}

//------------------------------------------
//	自機ｺﾏﾝﾄﾞ終了ﾁｪｯｸ
//------------------------------------------
u8 HeroAcmdEndChk( void )
{
	return( AcmdEndChk(&EvObj[MyMoveState.evobjno]) );
}

//------------------------------------------
//	自機ｺﾏﾝﾄﾞﾓｰﾄﾞ,方向ｾｯﾄ
//------------------------------------------
void HeroAcmdModeSet( u8 mode )
{
	EvObj[MyMoveState.evobjno].work1 = mode;
}

//------------------------------------------
//	自機ｺﾏﾝﾄﾞﾓｰﾄﾞ
//------------------------------------------
u8 HeroAcmdMode( void )
{
	return( EvObj[MyMoveState.evobjno].work1 );
}

//------------------------------------------
//	自機強制ｺﾏﾝﾄﾞｾｯﾄ
//------------------------------------------
void HeroAcmdForceSet( u8 code )
{
	AcmdForceSet( &EvObj[MyMoveState.evobjno], code );
}

//------------------------------------------
//	自機ｺﾏﾝﾄﾞｾｯﾄ
//------------------------------------------
void HeroAcmdSet( u8 code, u8 mode )
{
	if( HeroAcmdSetChk() == 0 )
	{
		HeroAcmdModeSet( mode );
		AcmdSet( &EvObj[MyMoveState.evobjno], code );
	}
}
 
//------------------------------------------
//	自機用歩行ｺﾏﾝﾄﾞｾｯﾄ
//------------------------------------------
void HeroAcmdWalk1( u8 site )
{
	HeroAcmdSet( AcmdCodeWalk1(site), ACMD_MODE_WALK_1 );
}

//------------------------------------------
//	自機用走行ｺﾏﾝﾄﾞｾｯﾄ
//------------------------------------------
void HeroAcmdWalk2( u8 site )
{
	HeroAcmdSet( AcmdCodeWalk2(site), ACMD_MODE_WALK_1 );
}

//------------------------------------------
//	自機用走行ｺﾏﾝﾄﾞｾｯﾄ
//------------------------------------------
void HeroAcmdWalk3( u8 site )
{
	HeroAcmdSet( AcmdCodeWalk3(site), ACMD_MODE_WALK_1 );
}

//------------------------------------------
//	自機用4ﾄﾞｯﾄ移動ｺﾏﾝﾄﾞｾｯﾄ
//------------------------------------------
void HeroAcmdWalk4( u8 site )
{
	HeroAcmdSet( AcmdCodeWalk4(site), ACMD_MODE_WALK_1 );
}

//------------------------------------------
//	自機用2ﾄﾞｯﾄﾀﾞｯｼｭ移動ｺﾏﾝﾄﾞｾｯﾄ
//------------------------------------------
void HeroAcmdDash2( u8 site )
{
	HeroAcmdSet( AcmdCodeDash2(site), ACMD_MODE_WALK_1 );
}

//------------------------------------------
//	自機用その場足踏みｺﾏﾝﾄﾞｾｯﾄ
//------------------------------------------
void HeroAcmdStopWalk( u8 site )
{
	HeroWallHitSePlay( site );
	HeroAcmdSet( AcmdCodeStayWalk1(site), ACMD_MODE_WALK_1 );
}

//------------------------------------------
//	自機用その場足踏み0.5ｺﾏﾝﾄﾞｾｯﾄ
//------------------------------------------
void HeroAcmdStopWalk05( u8 site )
{
	HeroWallHitSePlay( site );
	HeroAcmdSet( AcmdCodeStayWalk05(site), ACMD_MODE_WALK_1 );
}

//------------------------------------------
//	自機用停止ｺﾏﾝﾄﾞｾｯﾄ
//------------------------------------------
void HeroAcmdStop( u8 site )
{
	HeroAcmdSet( AcmdCodeStopSite(site), ACMD_MODE_SITE );
}

//------------------------------------------
//	自機用振り向き歩きｺﾏﾝﾄﾞｾｯﾄ
//------------------------------------------
void HeroAcmdWalkTurn( u8 site )
{
	HeroAcmdSet( AcmdCodeStayWalk2(site), ACMD_MODE_SITE );
}

//------------------------------------------
//	自機用ｼﾞｬﾝﾌﾟｺﾏﾝﾄﾞｾｯﾄ
//------------------------------------------
void HeroAcmdJump( u8 site )
{
	SePlay( SE_DANSA );
	HeroAcmdSet(AcmdCodeJump2(site), ACMD_MODE_JUMP_2 );
}

//------------------------------------------
//	自機用 強制停止ｺﾏﾝﾄﾞｾｯﾄ
//------------------------------------------
void HeroAcmdForceStop( void )
{
	if( (MyMoveState.mv_state == EV_M_END || MyMoveState.mv_state == EV_M_OFF) &&
		CheckFtDownEnableCycle() )
	{
		HeroAcmdForceSet( AcmdCodeStopSite(EvObj[MyMoveState.evobjno].site) );
	}
}

//------------------------------------------
//	自機用 ﾌﾛﾝﾄｱｯﾌﾟｺﾏﾝﾄﾞｾｯﾄ
//------------------------------------------
void HeroAcmdMtbFtUpSite( u8 site )
{
	HeroAcmdSet( AcmdCodeMtbFtUpSite(site), ACMD_MODE_SITE );
}

//------------------------------------------
//	自機用 ﾌﾛﾝﾄｱｯﾌﾟｺﾏﾝﾄﾞｾｯﾄ
//------------------------------------------
void HeroAcmdMtbFtUp( u8 site )
{
	HeroAcmdSet( AcmdCodeMtbFtUp(site), ACMD_MODE_SITE );
}

//------------------------------------------
//	自機用 ﾌﾛﾝﾄﾀﾞｳﾝｺﾏﾝﾄﾞｾｯﾄ
//------------------------------------------
void HeroAcmdMtbFtDown( u8 site )
{
	HeroAcmdSet( AcmdCodeMtbFtDown(site), ACMD_MODE_SITE );
}

//------------------------------------------
//	自機用 ﾀﾞﾆｴﾙｺﾏﾝﾄﾞｾｯﾄ
//------------------------------------------
void HeroAcmdMtbDaniel( u8 site )
{
	SePlay( SE_JITE_PYOKO );
	HeroAcmdSet( AcmdCodeMtbDaniel(site), ACMD_MODE_SITE );
}

//------------------------------------------
//	自機用 ﾀﾞﾆｴﾙ1ｺﾏﾝﾄﾞｾｯﾄ
//------------------------------------------
void HeroAcmdMtbDaniel1( u8 site )
{
	SePlay( SE_JITE_PYOKO );
	HeroAcmdSet( AcmdCodeMtbDaniel1(site), ACMD_MODE_WALK_1 );
}

//------------------------------------------
//	自機用 ﾀﾞﾆｴﾙ2ｺﾏﾝﾄﾞｾｯﾄ
//------------------------------------------
void HeroAcmdMtbDaniel2( u8 site )
{
	SePlay( SE_JITE_PYOKO );
	HeroAcmdSet( AcmdCodeMtbDaniel2(site), ACMD_MODE_JUMP_2 );
}

//------------------------------------------
//	自機用 ｼﾞｬﾝﾌﾟﾀｰﾝｾｯﾄ
//------------------------------------------
void HeroAcmdJumpTurn( u8 site )
{
	SePlay( SE_JITE_PYOKO );
	HeroAcmdSet( AcmdCodeStayTurnJump(site), ACMD_MODE_SITE );
}

//------------------------------------------
//	自機用 その場ｳｲﾘｰｾｯﾄ
//------------------------------------------
void HeroAcmdMtbWheelie( u8 site )
{
	SePlay( SE_WALL_HIT );
	HeroAcmdSet( AcmdCodeMtbWheelie(site), ACMD_MODE_WALK_1 );
}

//------------------------------------------
//	自機用 ｳｲﾘｰ開始2ｾｯﾄ
//------------------------------------------
void HeroAcmdMtbWheelieStart2( u8 site )
{
	HeroAcmdSet( AcmdCodeMtbWheelieStart2(site), ACMD_MODE_WALK_1 );
}

//------------------------------------------
//	自機用 ｳｲﾘｰ2ｾｯﾄ
//------------------------------------------
void HeroAcmdMtbWheelie2( u8 site )
{
	HeroAcmdSet( AcmdCodeMtbWheelie2(site), ACMD_MODE_WALK_1 );
}

//------------------------------------------
//	自機用 ｳｲﾘｰ終了2ｾｯﾄ
//------------------------------------------
void HeroAcmdMtbWheelieEnd2( u8 site )
{
	HeroAcmdSet( AcmdCodeMtbWheelieEnd2(site), ACMD_MODE_WALK_1 );
}

//------------------------------------------
//	衝突音判定ﾁｪｯｸﾃｰﾌﾞﾙ
//------------------------------------------
static u8 (* const HeroWallHitMatCheckTbl[])( u8 ) =
{
	ATR_ExitMatDownEnableCheck,							// SITE_D
	ATR_ExitMatUpEnableCheck,							// SITE_U
	ATR_ExitMatLeftEnableCheck,							// SITE_L
	ATR_ExitMatRightEnableCheck,						// SITE_R
};

//------------------------------------------
//	衝突音判定
//------------------------------------------
static void HeroWallHitSePlay( u8 site )
{
	u8 attr;
	s16 x,y;

	attr = EvObj[MyMoveState.evobjno].now_attr;

	if( HeroWallHitMatCheckTbl[site-1](attr) )
	{
		return;
	}

	if( site == SITE_U )
	{
		GetHeroCellPos( &x, &y );
		SitePosMove( site, &x, &y );
		attr = GetCellAttribute( x, y );
		
		if( ATR_IsDoorCheck(attr) )
		{
			return;
		}
	}

	SePlay( SE_WALL_HIT );
}

//======================================================================
//		自機情報
//======================================================================
static const u8 HsexObjCodeTbl[][2];
static const u8 MainHsexObjCodeTbl[][2];

//------------------------------------------
//	自機の前の ｾﾙ 位置取得
//	In:		x,y				; 座標格納
//------------------------------------------
void GetHeroFrontCellPos( s16 *x, s16 *y )
{
	*x = EvObj[MyMoveState.evobjno].gx;
	*y = EvObj[MyMoveState.evobjno].gy;
	SitePosMove( GetHeroSite(), x, y );
}

//------------------------------------------
//	自機現在 ｾﾙ 位置取得
//	In:		x,y				; 座標格納
//------------------------------------------
void GetHeroCellPos( s16 *x, s16 *y )
{
	*x = EvObj[MyMoveState.evobjno].gx;
	*y = EvObj[MyMoveState.evobjno].gy;
}

//------------------------------------------
//	自機の表示向き取得
//	Out:	u8				; 方向
//------------------------------------------
u8 GetHeroSite( void )
{
	return( EvObj[MyMoveState.evobjno].site );
}

//------------------------------------------
//	自機の移動向き取得
//------------------------------------------
u8 GetHeroMoveSite( void )
{
	return( EvObj[MyMoveState.evobjno].mv_site );
}

//------------------------------------------
//	自機の高さ取得
//	Out:	u8				; 高さ
//------------------------------------------
u8 GetHeroHeight( void )
{
	return( EvObj[MyMoveState.evobjno].height_pri );
}

//------------------------------------------
//	自機の座標更新
//------------------------------------------
void SetHeroMapPos( s16 mx, s16 my )
{
	EvObjPosAllChg( &EvObj[MyMoveState.evobjno], mx, my );
}

//------------------------------------------
//	自機の状態ﾁｪｯｸ
//	In:		bit			; MY_MV_BIT_NORMAL等
//	Out:	u8			; On = その状態である
//------------------------------------------
u8 CheckHeroState( u8 bit )
{
	return( MyMoveState.flag & bit );
}

//------------------------------------------
//	自機の状態取得
//	Out:	u8			; 動作ﾌﾗｸﾞ
//------------------------------------------
u8 GetHeroState( void )
{
	return( MyMoveState.flag );
}

//------------------------------------------
//	自機のｱｸﾀﾜｰｸﾅﾝﾊﾞ取得
//------------------------------------------
u8 GetHeroActorNumber( void )
{
	return( MyMoveState.actno );
}

//------------------------------------------
//	強制移動解除
//------------------------------------------
void ResetHeroForceMove( void )
{
	non_force_set();
}

//------------------------------------------
//	動作状況ｸﾘｱ
//------------------------------------------
void SetHeroMoveStateInit( void )
{
	EventOBJ *ev;

	ev = &EvObj[MyMoveState.evobjno];

	HeroMoveStartInit( ev );
	EvObjSiteSet( ev, ev->site );

	if( CheckHeroState(MY_MV_BIT_CYCLE_AND) )
	{
		SetHeroCycleStatus();
		CycleSpeedBrakeSet( 0 );
	}
}

//------------------------------------------
//	OBJｺｰﾄﾞ性別分け
//	In:		kind		; H_NORMAL等
//			sex			; 性別
//------------------------------------------
u8 GetHeroSexObjCode( u8 kind, u8 sex )
{
	return( HsexObjCodeTbl[kind][sex] );
}

//------------------------------------------
//	OBJｺｰﾄﾞ性別分け(ﾌﾟﾚｲﾔｰ)
//	In:		kind		; H_NORMAL等
//			sex			; 性別
//------------------------------------------
u8 GetMainHeroSexObjCode( u8 kind, u8 sex )
{
	return( MainHsexObjCodeTbl[kind][sex] );
}

//------------------------------------------
//	OBJｺｰﾄﾞ性別分け MyMoveState型
//	In:		kind		; H_NORMAL等
//------------------------------------------
u8 GetMainHeroObjCode( u8 kind )
{
	return( GetMainHeroSexObjCode(kind,MyMoveState.sex) );
}

//------------------------------------------
//	OBJｺｰﾄﾞ -> 性別
//	In:		code		; OBJ ｺｰﾄﾞ
//------------------------------------------
u8 GetHeroObjCodeSex( u8 code )
{
	switch( code )
	{
		case HEROINE:
		case HINECYCLER:
		case HINECYCLES:
		case HINESWIM:
		case HINEHIDEN:
		case MAINHINEDIV:
		case MAINHINEFISH:
		case MAINHINEJORRO:
			return( FEMALE );
	}

	return( MALE );
}

//------------------------------------------
//	OBJｺｰﾄﾞ -> 性別
//	In:		code		; OBJ ｺｰﾄﾞ
//------------------------------------------
u8 GetMainHeroObjCodeSex( u8 code )
{
	switch( code )
	{
		case MAINHEROINE:
		case MAINHINECYCLER:
		case MAINHINECYCLES:
		case MAINHINESWIM:
		case MAINHINEHIDEN:
		case MAINHINEDIV:
		case MAINHINEFISH:
		case MAINHINEJORRO:
			return( FEMALE );
	}

	return( MALE );
}

//------------------------------------------
//	ﾎﾟｹﾓﾝ波乗り開始可能ﾁｪｯｸ
//	Out:	u8			; ON = 波乗り可能
//------------------------------------------
u8 CheckHeroNaminoriStart( void )
{
	u8 i;
	
	if( CheckHeroState(MY_MV_BIT_SWIM) == 0 )
	{
		for( i = 0; i < 6; i++ )
		{
			if( PokeParaGet(&PokeParaMine[i],ID_monsno) == 0 )
			{
				break;
			}

			if( TemotiNijyuuCheck(&PokeParaMine[i],WAZANO_NAMINORI) )
			{
				return( 1 );
			}
		}
	}

	return( 0 );
}

//------------------------------------------
//	滝上り開始可能ﾁｪｯｸ
//	Out:		u8			; ON = 滝登り可能
//------------------------------------------
u8 CheckHeroTakinoboriStart( void )
{
	if( GetHeroMoveSite() == SITE_U &&					// 上向き
		CheckHeroState(MY_MV_BIT_SWIM) )				// 波乗り中
	{
		return( 1 );
	}

	return( 0 );
}

//------------------------------------------
//	波乗り地形ﾁｪｯｸ
//	Out:	u8			; ON = 波乗り可能地形
//	Info:	つりができるかどうかの判定にも使用している
//			条件を変更するときは注意
//------------------------------------------
u8 CheckHeroAttrNaminoriStart( void )
{
	u8 flag;
	s16	x,y;
	EventOBJ *ev;

	ev = &EvObj[MyMoveState.evobjno];
	x = ev->gx;
	y = ev->gy;
	SitePosMove( ev->mv_site, &x, &y );
	
	flag = EvObjMoveChk( ev, x, y, ev->mv_site );

	if( flag == EVOBJHIT_HEIGHT && GetHeroHeight() == 3 )
	{
		if( ATR_IsNaminoriStartCheck(GetCellAttribute(x,y)) )
		{
			return( 1 );
		}
	}

	return( 0 );
}

//------------------------------------------
//	OBJｺｰﾄﾞ 性別ﾃｰﾌﾞﾙ
//------------------------------------------
static const u8 HsexObjCodeTbl[][2] =
{
	{ HERO,			HEROINE },
	{ HEROCYCLER,	HINECYCLER },
	{ HEROCYCLES,	HINECYCLES },
	{ HEROSWIM,		HINESWIM },
	{ MAINHERODIV,	MAINHINEDIV },
	{ HEROHIDEN,	HINEHIDEN },
	{ MAINHEROFISH, MAINHINEFISH },
	{ MAINHEROJORRO, MAINHINEJORRO },
};

//------------------------------------------
//	OBJｺｰﾄﾞ 性別ﾃｰﾌﾞﾙ(ﾌﾟﾚｲﾔｰ)
//------------------------------------------
static const u8 MainHsexObjCodeTbl[][2] =
{
	{ MAINHERO,			MAINHEROINE },
	{ MAINHEROCYCLER,	MAINHINECYCLER },
	{ MAINHEROCYCLES,	MAINHINECYCLES },
	{ MAINHEROSWIM,		MAINHINESWIM },
	{ MAINHERODIV,		MAINHINEDIV },
	{ MAINHEROHIDEN,	MAINHINEHIDEN },
	{ MAINHEROFISH,		MAINHINEFISH },
	{ MAINHEROJORRO,	MAINHINEJORRO },
};

//======================================================================
//		MyMoveState
//======================================================================
#define HERO_OBJ_CODE_MAX 5
static const u8 MyMoveObjCodeFlagTbl[2][HERO_OBJ_CODE_MAX][2];

//------------------------------------------
//	MyMoveState 初期化
//------------------------------------------
void MyMoveStateInit( void )
{
	memset( (u8*)&MyMoveState, 0, MvCmd_SIZE );
}

//------------------------------------------
//	動作ﾌﾗｸﾞｾｯﾄ
//------------------------------------------
void MyMoveStateMvFlagSet( u8 flag )
{
	MyMoveState.flag =										// 動作ﾌﾗｸﾞ消去 | 動作ﾌﾗｸﾞ
		(MyMoveState.flag & MY_MV_BIT_AND) | flag;
}

//------------------------------------------
//	OBJ ｺｰﾄﾞ -> 動作ﾌﾗｸﾞ
//------------------------------------------
u8 MyMoveStateObjCodeFlag( u8 obj_code, u8 sex )
{
	u8 i;

	for( i = 0; i < HERO_OBJ_CODE_MAX; i++ )
	{
		if( MyMoveObjCodeFlagTbl[sex][i][0] == obj_code )
		{
			return( MyMoveObjCodeFlagTbl[sex][i][1] );
		}
	}
	
	return( MY_MV_BIT_NORMAL );
}

//------------------------------------------
//	動作ﾌﾗｸﾞ -> OBJ ｺｰﾄﾞ
//------------------------------------------
u8 MyMoveStateFlagObjCode( void )
{
	u8 i,flag;
	
	flag = MyMoveState.flag;

	for( i = 0; i < HERO_OBJ_CODE_MAX; i++ )
	{
		if( MyMoveObjCodeFlagTbl[MyMoveState.sex][i][1] & flag )
		{
			return( MyMoveObjCodeFlagTbl[MyMoveState.sex][i][0] );
		}
	}

	return( MAINHERO );
}

//------------------------------------------
//	OBJ ｺｰﾄﾞ -> 動作ﾌﾗｸﾞｾｯﾄ,ﾘｸｴｽﾄ
//------------------------------------------
void MyMoveStateObjCodeRequest( u8 obj_code, u8 set_flag )
{
	u8 flag;

	flag = MyMoveStateObjCodeFlag( obj_code, MyMoveState.sex );
	MyMoveState.req_flag |= flag | set_flag;
	HeroMoveRequest();
}

//------------------------------------------
//	OBJｺｰﾄﾞ,ﾌﾗｸﾞﾃｰﾌﾞﾙ
//------------------------------------------
static const u8 MyMoveObjCodeFlagTbl[2][HERO_OBJ_CODE_MAX][2] =
{
	{
		{ MAINHERO, MY_MV_BIT_NORMAL },
		{ MAINHEROCYCLER, MY_MV_BIT_CYCLE_R },
		{ MAINHEROCYCLES, MY_MV_BIT_CYCLE_S },
		{ MAINHEROSWIM, MY_MV_BIT_SWIM },
		{ MAINHERODIV, MY_MV_BIT_DIVING },
	},
	{
		{ MAINHEROINE, MY_MV_BIT_NORMAL },
		{ MAINHINECYCLER, MY_MV_BIT_CYCLE_R },
		{ MAINHINECYCLES, MY_MV_BIT_CYCLE_S },
		{ MAINHINESWIM, MY_MV_BIT_SWIM },
		{ MAINHINEDIV, MY_MV_BIT_DIVING },
	},
};

//======================================================================
//		自機OBJ
//======================================================================
//------------------------------------------
//	主人公ﾌｨｰﾙﾄﾞOBJ登録
//	In:		px,py			; ﾏｯﾌﾟ座標
//			site,sex		; 方向,性別
//------------------------------------------
void SetJikiActor( s16 px, s16 py, u8 site, u8 sex )
{
	u8 no;
	EventOBJ *ev;
	evObjData HeroData;

	HeroData.id = EV_OBJ_SPID;
	HeroData.obj_code = GetMainHeroSexObjCode( H_NORMAL, sex );
	HeroData.pos_x = px - MAP_LEFT_MARGIN;
	HeroData.pos_y = py - MAP_UP_MARGIN;
	HeroData.height = 0;
	HeroData.site = MV_HERO;
	HeroData.mvlim_x = 0;
	HeroData.mvlim_y = 0;
	HeroData.ev_type = OTYPE_NORMAL;
	HeroData.work = 0;
	HeroData.ev_label = 0;
	HeroData.ev_flag = 0;

	no = EvObjSxyAddNow( &HeroData );
	
	ev = &EvObj[no];
	ev->scr_del_sw = 1;
	ev->joint_actno[1] = EvActExitCursorSet();
	EvObjChgSite( ev, site );

	MyMoveStateInit();
	MyMoveState.mv_val= EV_M_STOP;
	MyMoveState.mv_state = EV_M_OFF;
	MyMoveState.evobjno = no;
	MyMoveState.actno = ev->actno;
	MyMoveState.sex = sex;
	MyMoveStateMvFlagSet( MY_MV_BIT_NORMAL | MY_MV_BIT_UNDER );
}

//------------------------------------------
//	主人公OBJ 表示ON,OFF
//------------------------------------------
void SetHeroObjVanish( u8 sw )
{
	EvObjNoBanishSet( MyMoveState.evobjno, sw );

	if( CheckHeroState(MY_MV_BIT_SWIM) )
	{
		ActWork[EvObj[MyMoveState.evobjno].joint_actno[0]].banish = sw;
	}
}

//------------------------------------------
//	主人公秘伝技ｱｸﾀｰへ変更
//------------------------------------------
void ChangeHeroActorHiden( void )
{
	EvObjChgParam( &EvObj[MyMoveState.evobjno], GetMainHeroObjCode(H_HIDEN) );
	ActAnmChg( &ActWork[MyMoveState.actno], 0 );
}

//------------------------------------------
//	主人公釣りｱｸﾀｰへ変更
//	In:		site			; 向き
//------------------------------------------
void ChangeHeroActorFishing( u8 site )
{
	EvObjChgParam( &EvObj[MyMoveState.evobjno], GetMainHeroObjCode(H_FISHING) );
	ActAnmChg( &ActWork[MyMoveState.actno], EvActAnmNoFishingStart(site) );
}

//------------------------------------------
//	主人公自転車ﾌﾛﾝﾄｱｯﾌﾟへ変更
//------------------------------------------
void ChangeHeroActorCycleFtUp( u8 site )
{
	EvObjChgParam( &EvObj[MyMoveState.evobjno], GetMainHeroObjCode(H_CYCLES) );
	ActAnmChg( &ActWork[MyMoveState.actno], EvActAnmNoFtUp(site) );
	ActAnmOffsChg( &ActWork[MyMoveState.actno], 1 );		// 1->ｼﾝﾎﾞﾙに変更しよう
}

//------------------------------------------
//	主人公如雨露ｱｸﾀｰへ変更
//	In:		site			; 向き
//------------------------------------------
void ChangeHeroActorJorro( u8 site )
{
	EvObjChgParam( &EvObj[MyMoveState.evobjno], GetMainHeroObjCode(H_JORRO) );
	ActAnmChg( &ActWork[MyMoveState.actno], EvActAnmNoStop(site) );
}

//======================================================================
//		付属ｱｸﾀｰ
//======================================================================
static u8 (* const ExitAttributeTbl[])( u8 );

//------------------------------------------
//	出入り口ｶｰｿﾙｺﾝﾄﾛｰﾙ
//------------------------------------------
static void ExitCursorControl( EventOBJ *ev )
{
	u8 site,attr;
	s16 x,y;

	attr = ev->now_attr;
	
	for( x = 0, site = SITE_D; x < 4; x++, site++ )
	{
		if( ExitAttributeTbl[x](attr) && site == ev->mv_site )
		{
			x = ev->gx;
			y = ev->gy;
			SitePosMove( site, &x, &y );
			EvActExitCursorON( ev->joint_actno[1], site, x, y );
			return;
		}
	}

	EvActExitCursorOFF( ev->joint_actno[1] );
}

//------------------------------------------
//	出入口ｱﾄﾘﾋﾞｭｰﾄﾁｪｯｸﾃｰﾌﾞﾙ
//------------------------------------------
static u8 (* const ExitAttributeTbl[])(u8) =
{
	ATR_ExitMatDownEnableCheck,
	ATR_ExitMatUpEnableCheck,
	ATR_ExitMatLeftEnableCheck,
	ATR_ExitMatRightEnableCheck
};

//======================================================================
//		主人公岩押し
//======================================================================
static void HeroPushRockTask( u8 );
static u8 HeroPushRock0( TASK_TABLE *, EventOBJ *, EventOBJ * );
static u8 HeroPushRock1( TASK_TABLE *, EventOBJ *, EventOBJ * );
static u8 HeroPushRock2( TASK_TABLE *, EventOBJ *, EventOBJ * );

//------------------------------------------
//	岩押し処理ﾀｽｸ追加
//------------------------------------------
static void SetHeroPushRockTask( u8 evno, u8 site )
{
	u8 i;
	
	i = AddTask( HeroPushRockTask, 0xff );
	TaskTable[i].work[1] = evno;
	TaskTable[i].work[2] = site;
	HeroPushRockTask( i );									// 呼び出し
}

//------------------------------------------
//	岩押しﾀｽｸﾃｰﾌﾞﾙ
//------------------------------------------
static u8 (* const HeroPushRockTaskTbl[])( TASK_TABLE *, EventOBJ *, EventOBJ * ) =
{
	HeroPushRock0,
	HeroPushRock1,
	HeroPushRock2,
};

//------------------------------------------
//	岩押し処理ﾀｽｸ
//------------------------------------------
static void HeroPushRockTask( u8 no )
{
	while( HeroPushRockTaskTbl[TaskTable[no].work[0]]
	(&TaskTable[no],&EvObj[MyMoveState.evobjno], &EvObj[TaskTable[no].work[1]]) );
}

//------------------------------------------
//	岩押し 0
//------------------------------------------
static u8 HeroPushRock0( TASK_TABLE *task, EventOBJ *h_ev, EventOBJ *r_ev )
{
	SetForceEvent();
	MyMoveState.mv_pause = 1;
	task->work[0]++;
	return( 0 );
}

//------------------------------------------
//	岩押し 1
//------------------------------------------
static u8 HeroPushRock1( TASK_TABLE *task, EventOBJ *h_ev, EventOBJ *r_ev )
{
	if( AcmdSetChk(h_ev) || AcmdSetChk(r_ev) )
	{
		return( 0 );
	}

	AcmdEnd( h_ev );
	AcmdEnd( r_ev );

	AcmdSet( h_ev, AcmdCodeStayWalk1((u8)task->work[2]) );
	AcmdSet( r_ev, AcmdCodeWalk05((u8)task->work[2]) );

	FeSetWork[0] = r_ev->gx;
	FeSetWork[1] = r_ev->gy;
	FeSetWork[2] = r_ev->height_pri;
	FeSetWork[3] = ActWork[r_ev->actno].oamData.Priority;
	FldEffSet( FECODE_Hokori );
	
	SePlay( SE_W070 );

	task->work[0]++;

	return( 0 );
}

//------------------------------------------
//	岩押し 2
//------------------------------------------
static u8 HeroPushRock2( TASK_TABLE *task, EventOBJ *h_ev, EventOBJ *r_ev )
{
	if( AcmdEndChk(h_ev) == 0 || AcmdEndChk(r_ev) == 0 )
	{
		return( 0 );									// 2体とも終わっていない
	}
	
	AcmdEnd( h_ev );
	AcmdEnd( r_ev );
	
	MyMoveState.mv_pause = 0;
	ResetForceEvent();

	DelTask( CheckTaskNo(HeroPushRockTask) );
	
	return( 0 );
}

//======================================================================
//		ｼﾞｬﾝﾋﾟﾝｸﾞﾏｯﾄ
//======================================================================
static void HeroJumpingMatTask( u8 );
static u8 HeroJumpingMat0( TASK_TABLE *, EventOBJ * );

//------------------------------------------
//	ｼﾞｬﾝﾋﾟﾝｸﾞﾏｯﾄﾀｽｸ追加
//------------------------------------------
static void SetHeroJumpingMatTask( void )
{
	u8 i;
	
	i = AddTask( HeroJumpingMatTask, 0xff );
	HeroJumpingMatTask( i );
}

//------------------------------------------
//	ｼﾞｬﾝﾋﾟﾝｸﾞﾏｯﾄﾀｽｸﾃｰﾌﾞﾙ
//------------------------------------------
static u8 (* const HeroJumpingMatTaskTbl[])( TASK_TABLE *, EventOBJ * ) =
{
	HeroJumpingMat0,
};

//------------------------------------------
//	ｼﾞｬﾝﾋﾟﾝｸﾞﾀｽｸ
//------------------------------------------
static void HeroJumpingMatTask( u8 no )
{
	while( HeroJumpingMatTaskTbl[TaskTable[no].work[0]]
				(&TaskTable[no],&EvObj[MyMoveState.evobjno]) );
}

//------------------------------------------
//	ｼﾞｬﾝﾋﾟﾝｸﾞ 0
//------------------------------------------
static u8 HeroJumpingMat0( TASK_TABLE *task, EventOBJ *ev )
{
	MyMoveState.mv_pause = 1;

	if( AcmdEnd(ev) )
	{
		SePlay( SE_DANSA );
		AcmdSet( ev, AcmdCodeStayJump(ev->site) );
		task->work[1]++;
	
		if( task->work[1] >= 2 )
		{
			MyMoveState.mv_pause = 0;
			MyMoveState.req_flag |= MY_MV_BIT_UNDER;
			DelTask( CheckTaskNo(HeroJumpingMatTask) );
		}
	}

	return( 0 );
}

//======================================================================
//		くるっとﾏｯﾄ
//======================================================================
static void HeroTurnMatTask( u8 );
static u8 HeroTurnMat0( TASK_TABLE *, EventOBJ * );
static u8 HeroTurnMat1( TASK_TABLE *, EventOBJ * );
static u8 HeroTurnMat2( TASK_TABLE *, EventOBJ * );
static u8 HeroTurnMat3( TASK_TABLE *, EventOBJ * );

//------------------------------------------
//	くるっとﾏｯﾄﾀｽｸ追加
//------------------------------------------
static void SetHeroTurnMatTask( void )
{
	u8 i;
	
	i = AddTask( HeroTurnMatTask, 0xff );
	HeroTurnMatTask( i );
}

//------------------------------------------
//	くるっとﾏｯﾄﾀｽｸﾃｰﾌﾞﾙ
//------------------------------------------
static u8 (* const HeroTurnMatTaskTbl[])( TASK_TABLE *, EventOBJ * ) =
{
	HeroTurnMat0,
	HeroTurnMat1,
	HeroTurnMat2,
	HeroTurnMat3,
};

//------------------------------------------
//	くるっとﾀｽｸ
//------------------------------------------
static void HeroTurnMatTask( u8 no )
{
	while( HeroTurnMatTaskTbl[TaskTable[no].work[0]]
			(&TaskTable[no],&EvObj[MyMoveState.evobjno]) );
}

//------------------------------------------
//	くるっと 0
//------------------------------------------
static u8 HeroTurnMat0( TASK_TABLE *task, EventOBJ *ev )
{
	task->work[0]++;
	task->work[1] = ev->mv_site;
	MyMoveState.mv_pause = 1;
	SetForceEvent();
	SePlay( SE_TK_WARPIN );

	return( 1 );
}

//------------------------------------------
//	くるっと 1
//------------------------------------------
static u8 HeroTurnMat1( TASK_TABLE *task, EventOBJ *ev )
{
	u8 site;
	u8 site_tbl[] = { SITE_L, SITE_R, SITE_U, SITE_D };
	
	if( AcmdEnd(ev) == 0 )
	{
		return( 0 );
	}
	
	site = site_tbl[ev->mv_site - 1];
	AcmdSet( ev, AcmdCodeStopSite(site) );
	
	if( site == (u8)task->work[1] )						// 一周
	{
		task->work[2]++;
	}
	
	task->work[0]++;

	if( task->work[2] >= 4 &&							// 四周 & 抜け場所
		site == SiteOpposite(task->work[1]) )
	{
		task->work[0]++;
	}
	
	return( 0 );
}

//------------------------------------------
//	くるっと 2
//------------------------------------------
static u8 HeroTurnMat2( TASK_TABLE *task, EventOBJ *ev )
{
	u8 wait[5] = { AC_WAIT_1, AC_WAIT_1, AC_WAIT_2, AC_WAIT_4, AC_WAIT_8 };

	if( AcmdEnd(ev) == 0 )
	{
		return( 0 );
	}	

	AcmdSet( ev, wait[task->work[2]] );

	task->work[0] = 1;
	
	return( 0 );
}

//------------------------------------------
//	くるっと 3
//------------------------------------------
static u8 HeroTurnMat3( TASK_TABLE *task, EventOBJ *ev )
{
	if( AcmdEnd(ev) == 0 )
	{
		return( 0 );
	}

	AcmdSet( ev, AcmdCodeWalk05(SiteOpposite(task->work[1])) );

	ResetForceEvent();
	MyMoveState.mv_pause = 0;
//	MyMoveState.req_flag |= MY_MV_BIT_UNDER;			// ﾏｯﾄ抜け後のｱﾄﾘﾋﾞｭｰﾄに反応
	DelTask( CheckTaskNo(HeroTurnMatTask) );

	return( 0 );
}

//======================================================================
//		波乗り終了
//======================================================================
static void HeroSwimEnd0( u8 );
static void HeroSwimEnd1( u8 );

//------------------------------------------
//	波乗り終了ﾀｽｸｾｯﾄ
//------------------------------------------
static void SetHeroSwimEndTask( u8 site )
{
	u8 i;

	SetForceEvent();
	MapBGM_ClearSpecial();
	MapBGM_FadeNowSet();
	MyMoveState.flag &= ~MY_MV_BIT_SWIM;
	MyMoveState.flag |= MY_MV_BIT_NORMAL;
	MyMoveState.mv_pause = 1;

	i = AddTask( HeroSwimEnd0, 0xff );
	TaskTable[i].work[0] = site;
	HeroSwimEnd0( i );
}

//------------------------------------------
//	波乗り終了 0
//------------------------------------------
static void HeroSwimEnd0( u8 no )
{
	EventOBJ *ev;
	
	ev = &EvObj[MyMoveState.evobjno];

	if( AcmdSetChk(ev) && AcmdEnd(ev) == 0 )
	{
		return;
	}

	SetPokeSwimMoveFlag( ev->joint_actno[0], NAMIPOKE_NOWITH_SWAY );

	AcmdSet( ev, AcmdCodeSwimJump((u8)TaskTable[no].work[0]) );
	TaskTable[no].TaskAdrs = HeroSwimEnd1;
}

//------------------------------------------
//	波乗り終了 1
//------------------------------------------
static void HeroSwimEnd1( u8 no )
{
	EventOBJ *ev;

	ev = &EvObj[MyMoveState.evobjno];

	if( AcmdEnd(ev) == 0 )
	{
		return;
	}

	EvObjChgParam( ev, GetMainHeroObjCode(H_NORMAL) );
	AcmdSet( ev, AcmdCodeStopSite(ev->site) );

	MyMoveState.mv_pause = 0;
	ResetForceEvent();

	DelActor( &ActWork[ev->joint_actno[0]] );
	DelTask( no );
}

//======================================================================
//		つり
//======================================================================
static void HeroFishingTask( u8 );
static u8 HeroFishing0( TASK_TABLE * );
static u8 HeroFishing1( TASK_TABLE * );
static u8 HeroFishing2( TASK_TABLE * );
static u8 HeroFishing3( TASK_TABLE * );
static u8 HeroFishing4( TASK_TABLE * );
static u8 HeroFishing5( TASK_TABLE * );
static u8 HeroFishing6( TASK_TABLE * );
static u8 HeroFishing7( TASK_TABLE * );
static u8 HeroFishing8( TASK_TABLE * );
static u8 HeroFishing9( TASK_TABLE * );
static u8 HeroFishing10( TASK_TABLE * );
static u8 HeroFishing11( TASK_TABLE * );
static u8 HeroFishing12( TASK_TABLE * );
static u8 HeroFishing13( TASK_TABLE * );
static u8 HeroFishing14( TASK_TABLE * );
static u8 HeroFishing15( TASK_TABLE * );
static void HeroFishingOffset( void );
static const u8 fishing_kakattuta_msg[];
static const u8 fishing_turenai_msg[];
static const u8 fishing_nigerare_msg[];

enum
{
	FISH_START = 0,
	FISH_INIT,
	FISH_SAO_FURI_WAIT,
	FISH_WAIT_INIT,
	FISH_WAIT,
	FISH_HIT_CHECK,
	FISH_HIT,
	FISH_PUSH_A,
	FISH_AWASE_CHECK,
	FISH_ENCOUNT_START,
	FISH_ENCOUNT,
	FISH_TURENAI_SET,
	FISH_NIGASITA_SET,
	FISH_NOHIT_WINDOW_SET,
	FISH_NOHIT_END_SET,
	FISH_NOHIT_END,
};

//------------------------------------------
//	釣りﾀｽｸ追加
//	In:		sao				; 釣り竿の種類
//------------------------------------------
void SetHeroFishingTask( u8 sao )
{
	u8 i;

	i = AddTask( HeroFishingTask, 0xff );

	TaskTable[i].work[15] = sao;
	HeroFishingTask( i );
}

//------------------------------------------
//	釣りﾃｰﾌﾞﾙ
//------------------------------------------
static u8 (* const HeroFishingTaskTbl[])( TASK_TABLE * ) =
{
	HeroFishing0,
	HeroFishing1,
	HeroFishing2,
	HeroFishing3,
	HeroFishing4,
	HeroFishing5,
	HeroFishing6,
	HeroFishing7,
	HeroFishing8,
	HeroFishing9,
	HeroFishing10,
	HeroFishing11,
	HeroFishing12,
	HeroFishing13,
	HeroFishing14,
	HeroFishing15,
};

//------------------------------------------
//	釣りﾀｽｸ
//------------------------------------------
static void HeroFishingTask( u8 no )
{
	while( HeroFishingTaskTbl[TaskTable[no].work[0]](&TaskTable[no]) );
}

//------------------------------------------
//	釣り 0
//------------------------------------------
static u8 HeroFishing0( TASK_TABLE *task )
{
	SetForceEvent();
	MyMoveState.mv_pause = 1;
	task->work[0]++;

	return( 0 );
}

//------------------------------------------
//	釣り 1
//------------------------------------------
static u8 HeroFishing1( TASK_TABLE *task )
{
	EventOBJ *ev;
	s16 below[3] = { 1, 1, 1 };
	s16 mod[3] = { 1, 3, 6 };

	task->work[12] = 0;
	task->work[13] = below[task->work[15]] + (pp_rand() % mod[task->work[15]]);
	task->work[14] = EvObj[MyMoveState.evobjno].obj_code;

	ev = &EvObj[MyMoveState.evobjno];
	AcmdFree( ev );
	ev->anm_pause_clr_sw = 1;
	ChangeHeroActorFishing( ev->site );

	task->work[0]++;
	return( 0 );
}

//------------------------------------------
//	釣り 2
//------------------------------------------
static u8 HeroFishing2( TASK_TABLE *task )
{
	HeroFishingOffset();

	if( ++task->work[1] >= 60 )
	{
		task->work[0]++;
	}

	return( 0 );
}

//------------------------------------------
//	釣り 3
//------------------------------------------
static u8 HeroFishing3( TASK_TABLE *task )
{
	NMenuTalkWinWrite();

	task->work[0]++;
	task->work[1] = 0;
	task->work[2] = 0;
	task->work[3] = (pp_rand() % 10) + 1;				// ｳｪｲﾄ
	if( task->work[12] == 0 ) task->work[3] += 3;		// 初回 最低値
	if( task->work[3] >= 10 ) task->work[3] = 10;

	return( 1 );
}

//------------------------------------------
//	釣り 4
//------------------------------------------
static u8 HeroFishing4( TASK_TABLE *task )
{
	u8 font[] = { nakag_, EOM_ };

	HeroFishingOffset();

	task->work[1]++;

	if( sys.Trg & A_BUTTON )
	{
		task->work[0] = FISH_TURENAI_SET;
		if( task->work[12] ) task->work[0]++;
		return( 1 );
	}

	if( task->work[1] >= 20 )
	{
		task->work[1] = 0;

		if( task->work[2] >= task->work[3] )
		{
			task->work[0]++;
			if( task->work[12] ) task->work[0]++;
			task->work[12]++;
		}
		else
		{
			NMenuMsgWrite( font, 0x04 + task->work[2], 0x0f );
			task->work[2]++;							// ｶｳﾝﾄ
		}
	}

	return( 0 );
}

//------------------------------------------
//	釣り 5	初回
//------------------------------------------
static u8 HeroFishing5( TASK_TABLE *task )
{
	HeroFishingOffset();

	task->work[0]++;

	if( FishingEncount2() == 0 || (pp_rand() & 0x01) )
	{
		task->work[0] = FISH_TURENAI_SET;
	}
	else
	{
		ActAnmChg( &ActWork[MyMoveState.actno], EvActAnmNoFishingHit(GetHeroSite()) );
	}

	return( 1 );
}

//------------------------------------------
//	釣り 6
//------------------------------------------
static u8 HeroFishing6( TASK_TABLE *task )
{
	u8 font[] = { hi_,i_,te_,ru_,spc_,hi_,i_,te_,ru_,gyoe_,gyoe_,EOM_ };

	HeroFishingOffset();
	NMenuMsgWrite( font, 0x04, 0x11 );

	task->work[0]++;
	task->work[1] = 0;

	return( 0 );
}

//------------------------------------------
//	釣り 7
//------------------------------------------
static u8 HeroFishing7( TASK_TABLE *task )
{
	s16 wait[3] = { 36, 33, 30 };
	HeroFishingOffset();

	task->work[1]++;

	if( task->work[1] >= wait[task->work[15]] )
	{
		task->work[0] = FISH_NIGASITA_SET;
	}
	else if( sys.Trg & A_BUTTON )
	{
		task->work[0]++;
	}

	return( 0 );
}

//------------------------------------------
//	釣り 8
//------------------------------------------
static u8 HeroFishing8( TASK_TABLE *task )
{
	s16 hit;
	s16 awase[3][2]	= { { 0, 0 }, { 40, 10 }, { 70, 30 } };

	HeroFishingOffset();

	task->work[0]++;

	if( task->work[12] < task->work[13] )				// 合わせ回数
	{
		task->work[0] = FISH_WAIT_INIT;
	}
	else
	{
		if( task->work[12] < 2 )
		{
			hit = pp_rand() % 100;

			if( awase[task->work[15]][task->work[12]] > hit )
			{
				task->work[0] = FISH_WAIT_INIT;
			}
		}
	}

	return( 0 );
}

//------------------------------------------
//	釣り 9
//------------------------------------------
static u8 HeroFishing9( TASK_TABLE *task )
{
	HeroFishingOffset();

	NMenuTalkMsgSetEasy( fishing_kakattuta_msg );
	NMenuTalkWinWrite();

	task->work[0]++;
	task->work[1] = 0;

	return( 0 );
}

//------------------------------------------
//	釣り 10
//------------------------------------------
static u8 HeroFishing10( TASK_TABLE *task )
{
	EventOBJ *ev;

	if( task->work[1] == 0 )
	{
		HeroFishingOffset();
	}

	if( task->work[1] == 0 && NMenuTalkMsgPut() )
	{
		ev = &EvObj[MyMoveState.evobjno];
		EvObjChgParam( ev, (u8)task->work[14] );
		EvObjChgSite( ev, ev->mv_site );

		if( MyMoveState.flag & MY_MV_BIT_SWIM )
		{
			SetPokeSwimOffsetFlag(
				EvObj[MyMoveState.evobjno].joint_actno[0], 
				NAMIPOKE_VOFFSET_OFF, 0 );
		}

		ActWork[MyMoveState.actno].dx = 0;
		ActWork[MyMoveState.actno].dy = 0;
		NMenuScreenClear();

		task->work[1]++;
	}
	else if( task->work[1] )
	{
		MyMoveState.mv_pause = 0;
		ResetForceEvent();
		FishEncountSet( task->work[15] );
		TVFishingCount( 1 );
		DelTask( CheckTaskNo(HeroFishingTask) );
	}

	return( 0 );
}

//------------------------------------------
//	釣り 11
//------------------------------------------
static u8 HeroFishing11( TASK_TABLE *task )
{
	HeroFishingOffset();
	ActAnmChg( &ActWork[MyMoveState.actno], EvActAnmNoFishingEnd(GetHeroSite()) );

	NMenuTalkMsgSetEasy( fishing_turenai_msg );
	task->work[0] = FISH_NOHIT_WINDOW_SET;
	return( 1 );
}

//------------------------------------------
//	釣り 12
//------------------------------------------
static u8 HeroFishing12( TASK_TABLE *task )
{
	HeroFishingOffset();
	ActAnmChg( &ActWork[MyMoveState.actno], EvActAnmNoFishingEnd(GetHeroSite()) );

	NMenuTalkMsgSetEasy( fishing_nigerare_msg );
	task->work[0]++;
	return( 1 );
}

//------------------------------------------
//	釣り 13
//------------------------------------------
static u8 HeroFishing13( TASK_TABLE *task )
{
	HeroFishingOffset();

	NMenuTalkWinWrite();
	task->work[0]++;
	return( 0 );
}

//------------------------------------------
//	釣り 14
//------------------------------------------
static u8 HeroFishing14( TASK_TABLE *task )
{
	EventOBJ *ev;

	HeroFishingOffset();

	if( ActWork[MyMoveState.actno].anmend_sw )
	{
		ev = &EvObj[MyMoveState.evobjno];
		EvObjChgParam( ev, (u8)task->work[14] );
		EvObjChgSite( ev, ev->mv_site );

		if( MyMoveState.flag & MY_MV_BIT_SWIM )
		{
			SetPokeSwimOffsetFlag(
				EvObj[MyMoveState.evobjno].joint_actno[0], 
				NAMIPOKE_VOFFSET_OFF, 0 );
		}

		ActWork[MyMoveState.actno].dx = 0;
		ActWork[MyMoveState.actno].dy = 0;
		task->work[0]++;
	}

	return( 0 );
}

//------------------------------------------
//	釣り 15
//------------------------------------------
static u8 HeroFishing15( TASK_TABLE *task )
{
	if( NMenuTalkMsgPut() )
	{
		MyMoveState.mv_pause = 0;
		ResetForceEvent();
		EvObjPauseClrAll();
		NMenuScreenClear();
		TVFishingCount( 0 );
		DelTask( CheckTaskNo(HeroFishingTask) );
	}

	return( 0 );
}

//------------------------------------------
//	釣り自機ｵﾌｾｯﾄ
//------------------------------------------
static void HeroFishingOffset( void )
{
	u8 no;
	actWork *act;
	
	act = &ActWork[MyMoveState.actno];
	ActAnm( act );
	
	act->dx = 0;
	act->dy = 0;
	no = act->anm_offs;

	if( act->anm_tbl[act->anm_no][no].pat != ACT_ANMEND )
	{
		act->anm_wait++;
	}

	if( act->anm_tbl[act->anm_no][no].pat == ACT_ANMEND )
	{
		no--;
	}
	
	no = act->anm_tbl[act->anm_no][no].pat;

	if( no == 1 || no == 2 || no == 3 )
	{
		act->dx = 8;

		if( GetHeroSite() == SITE_L )
		{
			act->dx = -8;
		}
	}
	
	if( no == 5 )
	{
		act->dy = -8;
	}
	
	if( no == 10 || no == 11 )
	{
		act->dy = 8;
	}
	
	if( MyMoveState.flag & MY_MV_BIT_SWIM )
	{
		SetPokeSwimOffsetFlag(
			EvObj[MyMoveState.evobjno].joint_actno[0], 
			NAMIPOKE_VOFFSET_ON, act->dy );
	}
}

//------------------------------------------
//	釣りﾒｯｾｰｼﾞ
//------------------------------------------
static const u8 fishing_kakattuta_msg[] =
{PO_,KE_,MO_,N_,wo_,spc_,tu_,ri_,a_,ge_,ta_,gyoe_,CTRL_,C_TRGWAIT_,EOM_};
static const u8 fishing_turenai_msg[] =
{tu_,re_,na_,i_,na_,a_,nakag_,nakag_,nakag_,CTRL_,C_TRGWAIT_,EOM_};
static const u8 fishing_nigerare_msg[] =
{ni_,ge_,ra_,re_,te_,spc_,si_,ma_,ttu_,ta_,nakag_,nakag_,nakag_,CTRL_,C_TRGWAIT_,EOM_};

//======================================================================
//		ﾃﾞﾊﾞｯｸ
//======================================================================
//----
#ifdef PM_DEBUG
//----
static u8 HeroDebugMove_R( u8 );

//------------------------------------------
//	ﾃﾞﾊﾞｯｸﾞ移動 R
//------------------------------------------
u8 HeroDebugMove( u8 site )
{
	if( sys.Cont & R_BUTTON )							// R ﾎﾞﾀﾝ
	{
		return( HeroDebugMove_R(site) );
	}

	return( 0 );
}

//------------------------------------------
//	ﾃﾞﾊﾞｯｸ移動	R ﾎﾞﾀﾝ	ﾋｯﾄﾁｪｯｸ ﾅｼ
//------------------------------------------
static u8 HeroDebugMove_R( u8 site )
{
	if( site == SITE_N )
	{
		HeroAcmdStop( EvObj[MyMoveState.evobjno].mv_site );
		return( 1 );
	}

	if( EvObj[MyMoveState.evobjno].scr_main_sw && CheckMapMove(site) == 0 )
	{
		HeroAcmdStopWalk( site );						// 足踏みｺﾏﾝﾄﾞ 
		return( 1 );
	}

	HeroAcmdWalk4( site );								// 4ﾄﾞｯﾄ移動
	return( 1 );
}
//----
#endif	// PM_DEBUG
//----

