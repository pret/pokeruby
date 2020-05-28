//**********************************************************************
//		ev_trai.c
//		Ì¨°ÙÄŞ ÄÚ°Å° ˆ—
//**********************************************************************
#define EV_TRAI_H_PROTO

#include	<agb.h>
#include 	"common.h"
#include	"actor.h"
#include	"actanm.h"
#include	"evobj.h"
#include	"jiki.h"
#include	"task.h"
#include	"fld_eff.h"
#include	"ev_trai.h"
#include	"fld_talk.h"
#include	"../script/saveflag.h"
#include	"script.h"
#include	"ev_fight.h"
#include	"calctool.h"

//----------------------------------------------------------------------
//		ŠO•”QÆ
//----------------------------------------------------------------------

//----------------------------------------------------------------------
//		include
//----------------------------------------------------------------------
#include "..\objdata\gyoe.ach"							// ·Ş®´° ·¬×
#include "..\objdata\heart.ach"							// Ê°Ä ·¬×

//----------------------------------------------------------------------
//		define
//----------------------------------------------------------------------

//----------------------------------------------------------------------
//		ÌßÛÄ
//----------------------------------------------------------------------
static u8 EvTrainerEyeFightChk( u8 );
static u8 TrainerEyeChk( EventOBJ * );
static void AddTaskTrainerEyeMeet( EventOBJ *, u8 );
static void TrainerEyeMeet( pTaskFunc );
static void TaskTrainerEyeMeet( u8 );

//======================================================================
//		ÄÚ°Å°‹ü
//======================================================================
//------------------------------------------
// ÄÚ°Å°‹ü
// Out:		u8		; ON = ‹üË¯Ä,½¸ØÌßÄ‹N“®
//------------------------------------------
u8 EvTrainerSightCheck( void )
{
	u8 i;

	for( i = 0; i < EV_OBJ_MAX; i++ )
	{
		if( EvObj[i].sw &&
			(EvObj[i].ev_type == OTYPE_TRAINER ||
			EvObj[i].ev_type == OTYPE_TRAINER_EYEALL) )
		{	
			if( EvTrainerEyeFightChk(i) )
			{
				return( 1 );
			}
		}
	}
	
	return( 0 );
}

//------------------------------------------
//	ÄÚ°Å°‹ü²ÍŞİÄ”­“®Áª¯¸
//------------------------------------------
static u8 EvTrainerEyeFightChk( u8 evno )
{
	VM_CODE *label;
	u8 range;

	label = (VM_CODE *)EvObjNoEvLabelGet( evno );

	if( CheckTrainerFlagByAdrs( label ) )				// Ï‚İ
	{
		return( 0 );
	}

	range = TrainerEyeChk( &EvObj[evno] );

	if( range )
	{
		SetTrainerMoveScript( evno, label );
		AddTaskTrainerEyeMeet( &EvObj[evno], range - 1 );
		return( 1 );
	}

	return( 0 );
}

//======================================================================
//		‹üÁª¯¸
//======================================================================
static u8 trai_eye_down( EventOBJ *, s16, s16, s16 );
static u8 trai_eye_up( EventOBJ *, s16, s16, s16 );
static u8 trai_eye_left( EventOBJ *, s16, s16, s16 );
static u8 trai_eye_right( EventOBJ *, s16, s16, s16 );
static u8 trai_move_range_attr_chk( EventOBJ *, u8, u8 );

//------------------------------------------
//	‹üÁª¯¸Ã°ÌŞÙ
//------------------------------------------
static u8 (* const EyeChkTbl[])( EventOBJ *ev, s16, s16, s16 ) =
{
	trai_eye_down, trai_eye_up,
	trai_eye_left, trai_eye_right
};
	
//------------------------------------------
//	‹üÁª¯¸
//------------------------------------------
static u8 TrainerEyeChk( EventOBJ *ev )
{
	u8 site,range;
	s16 x,y;

	GetHeroCellPos( &x, &y );

	if( ev->ev_type == OTYPE_TRAINER )
	{
		range = EyeChkTbl[ev->site - 1]( ev, (s16)ev->ev_work, x, y );
		return( trai_move_range_attr_chk(ev,range,ev->site) );
	}

	for( site = 0; site < 4; site++ )					// OTYPE_TRAINER_EYEALL
	{
		range = EyeChkTbl[site]( ev, (s16)ev->ev_work, x, y );
		
		if( trai_move_range_attr_chk(ev,range,site+1) )
		{
			return( range );
		}
	}

	return( 0 );
}

//------------------------------------------
//	‹üÁª¯¸ ‰º
//------------------------------------------
static u8 trai_eye_down( EventOBJ *ev, s16 range, s16 hero_gx, s16 hero_gy )
{
	if( ev->gx == hero_gx )
	{
		if( hero_gy > ev->gy && hero_gy <= (ev->gy + range) )
		{
			return( (u8)(hero_gy - ev->gy) );
		}
	}

	return( 0 );
}

//------------------------------------------
//	‹üÁª¯¸ ã
//------------------------------------------
static u8 trai_eye_up( EventOBJ *ev, s16 range, s16 hero_gx, s16 hero_gy )
{
	if( ev->gx == hero_gx )
	{
		if( hero_gy < ev->gy && hero_gy >= (ev->gy - range) )
		{
			return( (u8)(ev->gy - hero_gy) );
		}
	}
	
	return( 0 );
}

//------------------------------------------
//	‹üÁª¯¸ ¶
//------------------------------------------
static u8 trai_eye_left( EventOBJ *ev, s16 range, s16 hero_gx, s16 hero_gy )
{
	if( ev->gy == hero_gy )
	{
		if( hero_gx < ev->gx && hero_gx >= (ev->gx - range) )
		{
			return( (u8)(ev->gx - hero_gx) );
		}
	}
	
	return( 0 );
}

//------------------------------------------
//	‹üÁª¯¸ ‰E
//------------------------------------------
static u8 trai_eye_right( EventOBJ *ev, s16 range, s16 hero_gx, s16 hero_gy )
{
	if( ev->gy == hero_gy )
	{
		if( hero_gx > ev->gx && hero_gx <= (ev->gx + range) )
		{
			return( (u8)(hero_gx - ev->gx) );
		}
	}
	
	return( 0 );
}

//------------------------------------------
//	ˆÚ“®”ÍˆÍ”»’è
//------------------------------------------
static u8 trai_move_range_attr_chk( EventOBJ *ev, u8 range, u8 site )
{
	u8 i,flag,mvlim_x,mvlim_y;
	s16 x,y;

	if( range == 0 )
	{
		return( 0 );
	}

	x = ev->gx;
	y = ev->gy;
	
	for( i = 0; i <= (range - 1); i++, SitePosMove(site,&x,&y) )
	{
		flag = EvObjMoveChk( ev, x, y, site );
		
		if( flag && flag != EVOBJHIT_LIMIT )
		{
			return( 0 );
		}
	}
	
	mvlim_x = ev->mvlim_x;
	mvlim_y = ev->mvlim_y;
	ev->mvlim_x = 0;
	ev->mvlim_y = 0;

	flag = EvObjMoveChk( ev, x, y, site );

	ev->mvlim_x = mvlim_x;
	ev->mvlim_y = mvlim_y;

	if( flag == EVOBJHIT_OBJ )
	{
		return( range );
	}

	return( 0 );
}

//======================================================================
//		ÄÚ°Å°ˆÚ“®ºİÄÛ°ÙÀ½¸
//======================================================================
static u8 TrainerEyeMove0( u8, TASK_TABLE *, EventOBJ * );
static u8 TrainerEyeMove1( u8, TASK_TABLE *, EventOBJ * );
static u8 TrainerEyeMove2( u8, TASK_TABLE *, EventOBJ * );
static u8 TrainerEyeMove3( u8, TASK_TABLE *, EventOBJ * );
static u8 TrainerEyeMove4( u8, TASK_TABLE *, EventOBJ * );
static u8 TrainerEyeMove5( u8, TASK_TABLE *, EventOBJ * );
static u8 TrainerEyeMove6( u8, TASK_TABLE *, EventOBJ * );
static u8 TrainerEyeMove7( u8, TASK_TABLE *, EventOBJ * );
static u8 TrainerEyeMove8( u8, TASK_TABLE *, EventOBJ * );
static u8 TrainerEyeMove9( u8, TASK_TABLE *, EventOBJ * );
static u8 TrainerEyeMove10( u8, TASK_TABLE *, EventOBJ * );
static u8 TrainerEyeMove11( u8, TASK_TABLE *, EventOBJ * );

//------------------------------------------
//	À½¸’Ç‰Á
//------------------------------------------
static void AddTaskTrainerEyeMeet( EventOBJ *ev, u8 range )
{
	TASK_TABLE *task;

	task = &TaskTable[AddTask(TaskTrainerEyeMeet,80)];	// Ìß×²µØÃ¨‰¼

	task->work[1] = (s16)(((u32)ev & 0xffff0000) >> 16);
	task->work[2] = (s16)((u32)ev & 0x0000ffff);
	task->work[3] = range;
}

//------------------------------------------
//	ÄÚ°Å°‹ü²ÍŞİÄ”­“®
//------------------------------------------
static void TrainerEyeMeet( pTaskFunc ret_task )
{
	u8 no;

	no = CheckTaskNo( TaskTrainerEyeMeet );	
	ChangeTask( no, TaskTrainerEyeMeet, ret_task );		// ˆÚ“®I—¹ˆ—

	TaskTable[no].work[0] = 1;
	TaskTrainerEyeMeet( no );
}

//------------------------------------------
//	ÄÚ°Å°ˆÚ“®ˆ—Ã°ÌŞÙ
//------------------------------------------
static u8 (* const TrainerEyeMoveTbl[])( u8, TASK_TABLE *, EventOBJ * ) =
{
	TrainerEyeMove0,
	TrainerEyeMove1,
	TrainerEyeMove2,
	TrainerEyeMove3,
	TrainerEyeMove4,
	TrainerEyeMove5,

	TrainerEyeMove6,
	TrainerEyeMove7,
	
	TrainerEyeMove8,
	TrainerEyeMove9,
	TrainerEyeMove10,
	TrainerEyeMove11,
};

//------------------------------------------
//	ÄÚ°Å°ˆÚ“®
//------------------------------------------
static void TaskTrainerEyeMeet( u8 no )
{
	TASK_TABLE *task;
	EventOBJ *ev;

	task = &TaskTable[no];
	ev = (EventOBJ*)( (task->work[1] << 16) | (task->work[2]) );

	if( ev->sw == 0 )									// ˆÚ“®’†‚ÉÁ‚³‚ê‚é‚±‚Æ‚ğ—\‘ª
	{
		ChangeBackTask( no );
		return;
	}

	while( TrainerEyeMoveTbl[task->work[0]](no,task,ev) );
}

//------------------------------------------
//	ÄÚ°Å°ˆÚ“® 0
//------------------------------------------
static u8 TrainerEyeMove0( u8 no, TASK_TABLE *task, EventOBJ *ev )
{
	return( 0 );
}

//------------------------------------------
//	ÄÚ°Å°ˆÚ“® 1
//------------------------------------------
static u8 TrainerEyeMove1( u8 no, TASK_TABLE *task, EventOBJ *ev )
{
	EvObjIdWorkSet( ev, &FeSetWork[0], &FeSetWork[1], &FeSetWork[2] );
	FldEffSet( FECODE_Gyoe );
	AcmdSet( ev, AcmdCodeStopSite(ev->site) );

	task->work[0]++;
	return( 1 );
}

//------------------------------------------
//	ÄÚ°Å°ˆÚ“® 2
//------------------------------------------
static u8 TrainerEyeMove2( u8 no, TASK_TABLE *task, EventOBJ *ev )
{
	if( FeCodeChk(FECODE_Gyoe) )
	{
		return( 0 );									// ·Ş®´°´Ìª¸Ä
	}

	task->work[0]++;

	if( ev->mv_code == MV_HIDEW || ev->mv_code == MV_HIDER )
	{
		task->work[0] = 6;
	}
	
	if( ev->mv_code == MV_HIDES )
	{
		task->work[0] = 8;
	}

	return( 1 );
}

//------------------------------------------
//	ÄÚ°Å°ˆÚ“® 3
//------------------------------------------
static u8 TrainerEyeMove3( u8 no, TASK_TABLE *task, EventOBJ *ev )
{
	if( AcmdSetChk(ev) && AcmdEnd(ev) == 0 )
	{
		return( 0 );
	}

	if( task->work[3] )									// Úİ¼Ş
	{
		AcmdSet( ev, AcmdCodeWalk1(ev->site) );
		task->work[3]--;
	}
	else
	{
		AcmdSet( ev, AC_TURN_HERO_SITE );
		task->work[0]++;
	}
	
	return( 0 );
}

//------------------------------------------
//	ÄÚ°Å°ˆÚ“® 4
//------------------------------------------
static u8 TrainerEyeMove4( u8 no, TASK_TABLE *task, EventOBJ *ev )
{
	EventOBJ *hero;

	if( AcmdSetChk(ev) && AcmdEnd(ev) == 0 )
	{
		return( 0 );
	}

	EvObjMvCodeChg( ev, EvObjMvCodeStopSite(ev->site) );
	EvObjSxyMvCodeChange( ev, EvObjMvCodeStopSite(ev->site) );
	EvObjSxyPosChange( ev );

	hero = &EvObj[MyMoveState.evobjno];

	if( AcmdSetChk(hero) && AcmdEnd(hero) == 0 )
	{
		return( 0 );
	}

	ResetHeroForceMove();

	AcmdSet( &EvObj[MyMoveState.evobjno],
		AcmdCodeStopSite(SiteOpposite(ev->site)) );

	task->work[0]++;

	return( 0 );
}

//------------------------------------------
//	ÄÚ°Å°ˆÚ“® 5
//------------------------------------------
static u8 TrainerEyeMove5( u8 no, TASK_TABLE *task, EventOBJ *ev )
{
	EventOBJ *hero;

	hero = &EvObj[MyMoveState.evobjno];

	if( AcmdSetChk(hero) && AcmdEnd(hero) == 0 )
	{
		return( 0 );
	}

	ChangeBackTask( no );

	return( 0 );
}

//------------------------------------------
//	ÄÚ°Å°ˆÚ“® 6 ‰B‚ê–ªÄÚ°Å°“®ì0
//------------------------------------------
static u8 TrainerEyeMove6( u8 no, TASK_TABLE *task, EventOBJ *ev )
{
	if( AcmdSetChk(ev) && AcmdEnd(ev) == 0 )
	{
		return( 0 );
	}

	AcmdSet( ev, AC_HIDE_PULLOFF );
	task->work[0]++;

	return( 0 );
}

//------------------------------------------
//	ÄÚ°Å°ˆÚ“® 7 ‰B‚ê–ªÄÚ°Å°“®ì1
//------------------------------------------
static u8 TrainerEyeMove7( u8 no, TASK_TABLE *task, EventOBJ *ev )
{
	if( AcmdEnd(ev) )
	{
		task->work[0] = 3;								// ˆÚ“®‚Ö
	}
	
	return( 0 );
}

//------------------------------------------
//	ÄÚ°Å°ˆÚ“® 8 »‰B‚êÄÚ°Å°“®ì0
//------------------------------------------
static u8 TrainerEyeMove8( u8 no, TASK_TABLE *task, EventOBJ *ev )
{
	if( AcmdSetChk(ev) && AcmdEnd(ev) == 0 )
	{
		return( 0 );
	}

	AcmdSet( ev, AC_TURN_HERO_SITE );
	
	task->work[0]++;
	return( 0 );
}

//------------------------------------------
//	ÄÚ°Å°ˆÚ“® 9 »‰B‚êÄÚ°Å°“®ì1
//------------------------------------------
static u8 TrainerEyeMove9( u8 no, TASK_TABLE *task, EventOBJ *ev )
{
	if( AcmdEndChk(ev) )
	{
		FeSetWork[0] = ev->gx;
		FeSetWork[1] = ev->gy;
		FeSetWork[2] = ActWork[ev->actno].pri - 1;
		FeSetWork[3] = BGPRI2;
		task->work[4] = FldEffSet( FECODE_GymSand );
		task->work[0]++;
	}

	return( 0 );
}

//------------------------------------------
//	ÄÚ°Å°ˆÚ“® 10 »‰B‚êÄÚ°Å°“®ì2
//------------------------------------------
static u8 TrainerEyeMove10( u8 no, TASK_TABLE *task, EventOBJ *ev )
{
	if( ActWork[task->work[4]].anm_offs == 2 )
	{
		ev->priority_hold_sw = 0;
		ev->move_start_sw = 1;
		ActWork[ev->actno].oamData.Priority = BGPRI2;
		AcmdEnd( ev );
		AcmdSet( ev, AcmdCodeStayJump(ev->site) );

		task->work[0]++;
	}

	return( 0 );
}

//------------------------------------------
//	ÄÚ°Å°ˆÚ“® 11 »‰B‚êÄÚ°Å°“®ì3
//------------------------------------------
static u8 TrainerEyeMove11( u8 no, TASK_TABLE *task, EventOBJ *ev )
{
	if( FeCodeChk(FECODE_GymSand) == 0 )
	{
		task->work[0] = 3;
	}
	
	return( 0 );
}

//------------------------------------------
//	»‰B‚êÄÚ°Å°“Æ—§ˆ—Ã°ÌŞÙ
//------------------------------------------
static u8 (* const HideSandTrainerPulloffTbl[])( u8, TASK_TABLE *, EventOBJ * ) =
{
	TrainerEyeMove8,
	TrainerEyeMove9,
	TrainerEyeMove10,
	TrainerEyeMove11,
};

//------------------------------------------
//	»‰B‚êÄÚ°Å°“Æ—§ˆ—À½¸
//------------------------------------------
static void HideSandTrainerPulloffTask( u8 no )
{
	EventOBJ *ev;
	TASK_TABLE *task;

	task = &TaskTable[no];
	SetWork_to_Seq( &task->work[1], &ev );

	if( task->work[7] == 0 )
	{
		AcmdFreeWork( ev );
		task->work[7]++;
	}

	HideSandTrainerPulloffTbl[task->work[0]]( no, task, ev );

	if( task->work[0] == 3 && FeCodeChk(FECODE_GymSand) == 0 )
	{
		EvObjMvCodeChg( ev, EvObjMvCodeStopSite(ev->site) );
		EvObjSxyMvCodeChange( ev, EvObjMvCodeStopSite(ev->site) );
		DelTask( no );
	}
	else
	{
		ev->acmd_end_sw = 0;							// ±ÆÒ°¼®İˆ—’†‚Æ‚µ‚Ä”F¯,±¸À°‚ÅÄ¾¯Ä
	}
}

//------------------------------------------
//	»‰B‚êÄÚ°Å˜b‚µŠ|‚¯“™‚Ì»æ‚è
//	À½¸‚¾‚ª±ÆÒ°¼®İºÏİÄŞ‚Æ‚µ‚Ä‚Ìˆ—
//------------------------------------------
void SetHideSandTrainerPulloffTask( EventOBJ *ev )
{
	u8 i;

	i = AddTask( HideSandTrainerPulloffTask, 0 );
	SetAdrs_to_Work( &TaskTable[i].work[1], ev );
}

//======================================================================
//		½¸ØÌßÄ‹N“®ÄÚ°Å°ˆÚ“®
//======================================================================
static void tr_ctrl_end_task( u8 );

//------------------------------------------
//	ÄÚ°Å°ˆÚ“®ŠJn
//------------------------------------------
void AddTrainerMoveCtrlTask( void )
{
	TrainerEyeMeet( tr_ctrl_end_task );
}

//------------------------------------------
//	ÄÚ°Å°ˆÚ“®I—¹ˆ—
//------------------------------------------
static void tr_ctrl_end_task( u8 no )
{
	DelTask(no);
	ContinueFieldScript();
}

//======================================================================
//		Ì¨°ÙÄŞ´Ìª¸Ä ·Ş®´°,ÊÃÅ±¸À°
//======================================================================
static void gyoe_act_work_set( actWork *, s16, u8 );
static void GyoeActMove( actWork * );					// “®ìŠÖ”

static const ActOamData GyoeOam =						// ·Ş®´° OAM
{
	0,							// u32 VPos:8
	0,							// u32 AffineMode:2
	0,							// u32 ObjMode:2
	0,							// u32 Mosaic:1
	0,							// u32 ColorMode:1
	0,							// u32 Shape:2
	0,							// u32 HPos:9
	0,							// u32 AffineParamNo:5
	1,							// u32 Size:2
	0,							// u32 CharNo:10
	BGPRI1,						// u32 Priority:2
	MINE_OBJ_PALNO,				// u32 Pltt:4
	0,							// AffineWork
};

static const actAnmData GyoeCellTrans[] =				// ·¬×“]‘—Ã°ÌŞÙ
{
	{&gyoe_Character[(0x20*4)*0],0x20*4},				// !
	{&gyoe_Character[(0x20*4)*1],0x20*4},				// ?
};

static const actAnmData HeartCellTrans[] =
{
	{&heart_Character[(0x20*4)*0],0x20*4},
};

static const actAnm GyoeAnm[] =							// ¾Ù±ÆÒ
{
	{ 0, 60, 0, 0 },
	{ ACT_ANMEND, 0, 0, 0 },
};

static const actAnm HateAnm[] =
{
	{ 1, 60, 0, 0 },
	{ ACT_ANMEND, 0, 0, 0 },
};

static const actAnm * const GyoeAnmTbl[] =				// ¾Ù±ÆÒÃ°ÌŞÙ
{
	GyoeAnm,
	HateAnm,
};

static const actHeader GyoeActHeader =
{
	ACT_TMODE,					// “]‘—Œ^
	ACT_OAMPAL,					// Pal ID
	&GyoeOam,					// OAM
	GyoeAnmTbl,					// ±ÆÒ
	GyoeCellTrans,				// ¾Ù“]‘—Ã°ÌŞÙ
	DummyActAffTbl,				// ±Ì¨İÀŞĞ°
	GyoeActMove,				// “®ìŠÖ”
};

static const actHeader HeartActHeader =
{
	ACT_TMODE,					// “]‘—Œ^
	FE_Use0_PalID,				// Pal ID
	&GyoeOam,					// OAM
	GyoeAnmTbl,					// ±ÆÒ
	HeartCellTrans,				// ¾Ù“]‘—Ã°ÌŞÙ
	DummyActAffTbl,				// ±Ì¨İÀŞĞ°
	GyoeActMove,				// “®ìŠÖ”
};

//------------------------------------------
//	Ì¨°ÙÄŞ´Ìª¸Ä ·Ş®´°
//	In:		work0,1,2		; OBJ,MAP,DIV ID
//	Out:	nothing	
//------------------------------------------
u32 FeGyoeSet( void )
{
	u8 i;

	i = AddActorBottom( &GyoeActHeader, 0, 0, EVOBJ_ACTPRI0 );

	if( i != ACT_MAX )
	{
		gyoe_act_work_set( &ActWork[i], FECODE_Gyoe, 0 );
	}

	return( 0 );
}

//------------------------------------------
//	Ì¨°ÙÄŞ´Ìª¸Ä ÊÃÅ
//	In:		work0,1,2		; OBJ,MAP,DIV ID
//	Out:	nothing	
//------------------------------------------
u32 FeHatenaSet( void )
{
	u8 i;

	i = AddActorBottom( &GyoeActHeader, 0, 0, EVOBJ_HI_ACTPRI );

	if( i != ACT_MAX )
	{
		gyoe_act_work_set( &ActWork[i], FECODE_Hatena, 1 );
	}

	return( 0 );
}


//------------------------------------------
//	Ì¨°ÙÄŞ´Ìª¸Ä Ê°Ä
//	In:		work0,1,2		; OBJ,MAP,DIV ID
//	Out:	nothing	
//------------------------------------------
u32 FeHeartSet( void )
{
	u8 i;

	i = AddActorBottom( &HeartActHeader, 0, 0, EVOBJ_HI_ACTPRI );

	if( i != ACT_MAX )
	{
		gyoe_act_work_set( &ActWork[i], FECODE_Heart, 0 );
	}

	return( 0 );
}

//------------------------------------------
//	Ü°¸¾¯Ä
//------------------------------------------
static void gyoe_act_work_set( actWork *act, s16 code, u8 no )
{
	act->oamData.Priority = 1;
	act->scr = 1;
	act->work[0] = FeSetWork[0];
	act->work[1] = FeSetWork[1];
	act->work[2] = FeSetWork[2];
	act->work[3] = -5;
	act->work[7] = code;
	ActAnmChg( act, no );
}

//------------------------------------------
//	“®ì
//------------------------------------------
static void GyoeActMove( actWork *act )
{
	u8 i;
	actWork *evact;

	if( EvObjIdPosGet(act->work[0],act->work[1],act->work[2],&i) ||
		act->anmend_sw )
	{
		FeDelActCode( act, act->work[7] );
		return;
	}

	evact = &ActWork[EvObj[i].actno];
	
	act->work[4] += act->work[3];

	act->x = evact->x;
	act->y = evact->y + evact->cy + (-16 - evact->cy);	// 16 = »²½Ş
	act->dx = evact->dx;
	act->dy = evact->dy + act->work[4];
	
	if( act->work[4] )
	{
		act->work[3]++;
	}
	else
	{
		act->work[3] = 0;
	}
}

