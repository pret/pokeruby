
#include "common.h"
#include "task.h"
#include "fld_task.h"
#include "script.h"
#include "evobj.h"
#include "jiki.h"
#include "madefine.h"
#include "mapbg.h"
#include "palanm.h"
#include "mus_tool.h"		//SePlay
#include "map.h"
#include "fieldmap.h"
#include "../evdata/maparray.h"
#include "fld_tool.h"
#include "sysflag.h"
#include "syswork.h"
#include "../script/savework.h"
#include "scr_tool.h"

#include "../evdata/sxysym.h"


//=========================================================================
//
//	毒のエフェクト
//
//=========================================================================
static void poison_effect_task( u8 no )
{
	s16 * wk = TaskTable[no].work;
	switch ( wk[0] ) {
	case 0:
		wk[1] +=2;
		if ( wk[1] > 8 ) wk[0] ++;
		break;
	case 1:
		wk[1] -=2;
		if ( wk[1] == 0 ) wk[0] ++;
		break;
	case 2:
		DelTask(no);
		return;
	}

	*(u16*)REG_MOSAIC = wk[1] | (wk[1] << 4 );
}

void SetFieldPoisonEffect( void )
{
	SePlay( SE_DOKU );
	AddTask( poison_effect_task, 80 );
}

int CheckFieldPoisonEffect( void )
{
	return CheckTask( poison_effect_task );
}

//=========================================================================
//
//	じょうろアニメ
//
//=========================================================================
static void zyouro_anm_init_task( u8 no );
static void zyouro_anm_set_task( u8 no );
static void zyouro_anm_wait_task( u8 no );
static void zyouro_anm_end_task( u8 no );

static void zyouro_anm_init_task( u8 no )
{
	TaskTable[no].TaskAdrs = zyouro_anm_set_task;
}

static void zyouro_anm_set_task( u8 no )
{
	EventOBJ *ev = &EvObj[MyMoveState.evobjno];

	if( AcmdSetChk(ev) && AcmdEnd(ev) == 0 ) return;

	ChangeHeroActorJorro(GetHeroSite());
	AcmdSet( ev, AcmdCodeStayWalk1(GetHeroSite()) );

	TaskTable[no].TaskAdrs = zyouro_anm_wait_task;
}

static void zyouro_anm_wait_task( u8 no )
{
	EventOBJ *ev = &EvObj[MyMoveState.evobjno];

	if( AcmdEnd(ev) ) {
		if( TaskTable[no].work[1] ++ < 10 ) {
			AcmdSet( ev, AcmdCodeStayWalk1(GetHeroSite()) );
		} else {
			TaskTable[no].TaskAdrs = zyouro_anm_end_task;
		}
	}
}

static void zyouro_anm_end_task( u8 no )
{
	SetHeroMoveRequest( GetHeroState() );

	DelTask(no);
	ContinueFieldScript();
}

void AddZyouroAnimeTask( void )
{
	AddTask( zyouro_anm_init_task, 80 );
}

//=========================================================================
//
//	レコードコーナー	エフェクト
//
//=========================================================================
enum{
	PICO_ACT_CELLID	= FLD_CellID_FE_START,	/*fld_eff.h*/
	PICO_ACT_PALID	= FLD_PalID_FE_START,
};

#include "../scaddata/recordpiko.ach"
#include "../scaddata/recordpiko.acl"



static const actAnmData pico_celltrans[] =
{
	{ recordpiko_Character+0x20*4*0, 0x20*4 },
	{ recordpiko_Character+0x20*4*1, 0x20*4 },
	{ recordpiko_Character+0x20*4*2, 0x20*4 },
};

static const PalData pico_pal =
{
	recordpiko_Palette,
	PICO_ACT_PALID,
};

static const actAnm pico_anm[] =
{
	{ 0, 30, 0, 0},
	{ 1, 30, 0, 0},
	{ 2, 30, 0, 0},
	{ACT_ANMLOOP, 0, 0, 0},
};
static const actAnm * const pico_anm_tbl[] = 
{
	pico_anm,
};

extern const ActOamData Oam32x8;
static const actHeader act_pico_header=
{
	ACT_TMODE,
	PICO_ACT_PALID,
	&Oam32x8,
	pico_anm_tbl,
	pico_celltrans,
	DummyActAffTbl,
	DummyActMove,
};

enum{
	PICO_EFF_X = 9 + MAP_LEFT_MARGIN,
	PICO_EFF_Y = 6 + MAP_UP_MARGIN,
};

//--------------------------------------------------------------
//	レコードコーナーエフェクト追加
//--------------------------------------------------------------
u8 StartRecordExchangeEffect( void )
{
	actWork * act;
	u8 no;
	ObjPalSet(&pico_pal);
	no = AddActor( &act_pico_header, 0, 0, EVOBJ_HI_ACTPRI );
	if ( no == ACT_MAX ) return ACT_MAX;
	act = &ActWork[no];
	MapCellSizePos(  PICO_EFF_X, PICO_EFF_Y, &act->x, &act->y );
	act->scr = 1;
	act->x += 16;
	act->y += 2;
	return no;
}

//--------------------------------------------------------------
//	レコードコーナーエフェクト削除
//--------------------------------------------------------------
void FinishRecordExchangeEffect( void )
{
	int i;
	actWork *act;

	for ( i=0; i<ACT_MAX; i++ ) {
		if ( ActWork[i].actHead == &act_pico_header ) {
			act = & ActWork[i];
			PalDelActor(act);
			DelActor(act);
		}
	}
}

//=========================================================================
//=========================================================================


const u8 baggage_Character[128]={
                                                        /*  0  =  0(0x0)  */
	0x77,0x77,0x77,0x77,0xc8,0xaa,0xaa,0x9a,
	0xc8,0xaa,0xaa,0xaa,0xd8,0xaa,0xaa,0xaa,
	0xd8,0xdd,0xdd,0xdd,0xe8,0xe2,0xe2,0xe2,
	0xd8,0xdd,0xdd,0xdd,0xd8,0xaa,0xaa,0xaa,
                                                        /*  1  =  32(0x20)  */
	0x77,0x77,0x77,0x77,0x99,0x99,0x99,0x7c,
	0x99,0x99,0x99,0x7c,0x9a,0x99,0x99,0x7c,
	0xdd,0xcc,0xcc,0x7c,0xe2,0xd2,0xd2,0x72,
	0xdd,0xdd,0xcc,0x7c,0xaa,0xaa,0x9a,0x7c,
                                                        /*  2  =  64(0x40)  */
	0xd8,0xaa,0xaa,0xaa,0xd8,0xaa,0xaa,0xaa,
	0xd8,0xaa,0xaa,0xaa,0x28,0xbb,0xbb,0xbb,
	0x28,0x22,0x22,0x22,0x28,0x22,0x22,0x22,
	0x28,0x22,0x22,0x22,0x78,0x77,0x77,0x77,
                                                        /*  3  =  96(0x60)  */
	0xaa,0xaa,0xaa,0x7c,0xaa,0xaa,0xaa,0x7d,
	0xaa,0xaa,0xaa,0x7d,0xbb,0xbb,0xbb,0x7b,
	0x22,0x22,0x22,0x72,0x22,0x22,0x22,0x72,
	0x22,0x22,0x22,0x72,0x77,0x77,0x77,0x77,
};

const u16 baggage_Palette[] = {
	0x530e,0x4a10,0x41ce,0x418c,0x7fff,0x7c1f,0x18e7,0x3528,
	0x2cc5,0x777b,0x6af7,0x5673,0x4657,0x39d3,0x358c,0x0000,
};


//==============================================================
//
//		ゲーム開始時のトラックエフェクト
//
//==============================================================

enum{
	WK_SEQ,
	WK_COUNTER,
	WK_TASK1,
	WK_TASK2,
};

enum{
	WAIT_FIRST_SILENT = 90,
	WAIT_ONLY_GATAGOTO = 150,
	WAIT_TO_BREAK = 300,
	WAIT_TO_HAIKI = 90,
	WAIT_TO_OPEN = 120,
};

enum{
	TRUCKSCENE_SILENT = 0,
	TRUCKSCENE_ONLY_GATAGOTO,
	TRUCKSCENE_GATAGOTO,
	TRUCKSCENE_BREAK,
	TRUCKSCENE_HAIKI,
	TRUCKSCENE_OPEN,
};

enum{
	BAGGAGE_X1 = 11 * 8,
	BAGGAGE_Y1 = 6 * 8,
	BAGGAGE_X2 = 13 * 8,
	BAGGAGE_Y2 = 13 * 8,
	BAGGAGE_X3 = 17 * 8,
	BAGGAGE_Y3 = 13 * 8,

	CARGO_OFF_X1 = 3,
	CARGO_OFF_Y1 = 3,
	CARGO_OFF_X2 = 0,
	CARGO_OFF_Y2 = -3,
	CARGO_OFF_X3 = -3,
	CARGO_OFF_Y3 = 0,
};

static void trucksub_break( u8 no );
static void trucksub_break2( u8 no );
static void trucksub_gatagoto( u8 no );

s16 get_shake_y( int count )
{
	if ( count % 120 == 0 ) {
		return -1;
	}
	else if ( count % 10 < 5 ) {
		return 1;
	}
	else {
		return 0;
	}
}

s16 get_shake_y2( int count )
{
	count += 120;
	if ( count % 180 == 0 ) {
		return -1;
	}
	return 0;
}

static void trucksub_gatagoto( u8 no )
{
	s16 x,y;
	s16 * wk = TaskTable[no].work;

	x = 0;
	y = get_shake_y2(wk[0]+30) * 4;
	EvObjSetOffset( CARGO1_01_SP_TRUCK, Fld.MapID.map_id, Fld.MapID.div_id, 
			CARGO_OFF_X1-x, CARGO_OFF_Y1+y );
	y = get_shake_y2(wk[0]) * 2;
	EvObjSetOffset( CARGO1_02_SP_TRUCK, Fld.MapID.map_id, Fld.MapID.div_id, 
			CARGO_OFF_X2-x, CARGO_OFF_Y2+y );
	y = get_shake_y2(wk[0]) * 4;
	EvObjSetOffset( CARGO1_03_SP_TRUCK, Fld.MapID.map_id, Fld.MapID.div_id, 
			CARGO_OFF_X3-x, CARGO_OFF_Y3+y );

	wk[0]++;
	if ( wk[0] == 30000 ) wk[0] = 0;

	y = get_shake_y(wk[0]);
	SetMapViewOffset( 0, y );

}


static const s8 break_offset[] = {
	0,0,0,0,0,0,
	0,0,1,2,2,2,2,2,2,-1,-1,-1,0,
};

static void trucksub_break( u8 no )
{
	s16 x,y;
	s16 * wk = TaskTable[no].work;
	wk[0]++;
	wk[2]++;
	if ( wk[0] > 5 ) {
		wk[0] = 0;
		wk[1] ++;
	}
	if ( wk[1] == NELEMS(break_offset) ) {
		DelTask(no);
		return;
	}
	if ( break_offset[wk[1]] == 2 ) TaskTable[no].TaskAdrs = trucksub_break2;

	x = break_offset[wk[1]];
	y = get_shake_y(wk[2]);
	SetMapViewOffset( x, y );

	y = get_shake_y2(wk[2]+30) * 4;
	EvObjSetOffset( CARGO1_01_SP_TRUCK, Fld.MapID.map_id, Fld.MapID.div_id, 
			CARGO_OFF_X1-x, CARGO_OFF_Y1+y );
	y = get_shake_y2(wk[2]) * 2;
	EvObjSetOffset( CARGO1_02_SP_TRUCK, Fld.MapID.map_id, Fld.MapID.div_id, 
			CARGO_OFF_X2-x, CARGO_OFF_Y2+y );
	y = get_shake_y2(wk[2]) * 4;
	EvObjSetOffset( CARGO1_03_SP_TRUCK, Fld.MapID.map_id, Fld.MapID.div_id, 
			CARGO_OFF_X3-x, CARGO_OFF_Y3+y );
}

static void trucksub_break2( u8 no )
{
	s16 x,y;
	s16 * wk = TaskTable[no].work;
	wk[0]++;
	if ( wk[0] > 5 ) {
		wk[0] = 0;
		wk[1] ++;
	}
	if ( wk[1] == NELEMS(break_offset) ) {
		DelTask(no);
		return;
	}

	x = break_offset[wk[1]];
	y = 0;
	SetMapViewOffset( x, y );
//	y = get_shake_y2(wk[2]+30) * 4;
	EvObjSetOffset( CARGO1_01_SP_TRUCK, Fld.MapID.map_id, Fld.MapID.div_id, 
			CARGO_OFF_X1-x, CARGO_OFF_Y1+y );
//	y = get_shake_y2(wk[2]) * 2;
	EvObjSetOffset( CARGO1_02_SP_TRUCK, Fld.MapID.map_id, Fld.MapID.div_id, 
			CARGO_OFF_X2-x, CARGO_OFF_Y2+y );
//	y = get_shake_y2(wk[2]) * 4;
	EvObjSetOffset( CARGO1_03_SP_TRUCK, Fld.MapID.map_id, Fld.MapID.div_id, 
			CARGO_OFF_X3-x, CARGO_OFF_Y3+y );
}




void track_effect_task( u8 no )
{
	s16 * wk = TaskTable[no].work;

	switch ( wk[WK_SEQ] ) {

	case TRUCKSCENE_SILENT:
		wk[WK_COUNTER]++;
		if ( wk[WK_COUNTER] == WAIT_FIRST_SILENT ) {
			SetMapViewFunc( NULL );
			wk[WK_COUNTER] = 0;
			wk[WK_TASK1] = AddTask( trucksub_gatagoto, TSK_PRI_CONTROL );
			wk[WK_SEQ] = TRUCKSCENE_ONLY_GATAGOTO;
			SePlay( SE_TRACK_MOVE );
		}
		break;

	case TRUCKSCENE_ONLY_GATAGOTO:
		wk[WK_COUNTER]++;
		if ( wk[WK_COUNTER] == WAIT_ONLY_GATAGOTO ) {
			FieldFadeBlackInSet();
			wk[WK_COUNTER] = 0;
			wk[WK_SEQ] = TRUCKSCENE_GATAGOTO;
		}
		break;

	case TRUCKSCENE_GATAGOTO:
		wk[WK_COUNTER]++;
		if( FadeData.fade_sw == 0 && wk[WK_COUNTER] > WAIT_TO_BREAK ) {
			wk[WK_COUNTER] = 0;
			DelTask( wk[WK_TASK1] );
			wk[WK_TASK2] = AddTask( trucksub_break ,TSK_PRI_CONTROL );
			wk[WK_SEQ] = TRUCKSCENE_BREAK;
			SePlay( SE_TRACK_STOP );
		}
		break;

	case TRUCKSCENE_BREAK:
		if ( TaskTable[wk[WK_TASK2]].occ == 0 ) {
			MapViewInit();
			wk[WK_COUNTER] = 0;
			wk[WK_SEQ] = TRUCKSCENE_HAIKI;
		}
		break;

	case TRUCKSCENE_HAIKI:
		wk[WK_COUNTER] ++;
		if ( wk[WK_COUNTER] == WAIT_TO_HAIKI ) {
			SePlay( SE_TRACK_HAIKI );
			wk[WK_COUNTER] = 0;
			wk[WK_SEQ] = TRUCKSCENE_OPEN;
		}
		break;

	case TRUCKSCENE_OPEN:
		wk[WK_COUNTER] ++;
		if ( wk[WK_COUNTER] == WAIT_TO_OPEN ) {
			SetCell(4+MAP_X_MARGIN,1+MAP_Y_MARGIN,520);
			SetCell(4+MAP_X_MARGIN,2+MAP_Y_MARGIN,528);
			SetCell(4+MAP_X_MARGIN,3+MAP_Y_MARGIN,536);
			MakeMapBG();
			SePlay( SE_TRACK_DOOR );
			DelTask(no);
			ResetForceEvent();
		}
		break;
	}
}

void FirstTruckEventStart( void )
{
	SetCell(4+MAP_X_MARGIN,1+MAP_Y_MARGIN,525);
	SetCell(4+MAP_X_MARGIN,2+MAP_Y_MARGIN,533);
	SetCell(4+MAP_X_MARGIN,3+MAP_Y_MARGIN,541);
	MakeMapBG();

	SetForceEvent();
	CpuFastClear( 0, PaletteWorkTrans, PLTT_SIZE );
	AddTask( track_effect_task, TSK_PRI_CONTROL );
}

void CargoControlTask( u8 no )
{
	if ( CheckTask(track_effect_task) ) return;

	EvObjSetOffset( CARGO1_01_SP_TRUCK, Fld.MapID.map_id, Fld.MapID.div_id, 
			CARGO_OFF_X1, CARGO_OFF_Y1 );
	EvObjSetOffset( CARGO1_02_SP_TRUCK, Fld.MapID.map_id, Fld.MapID.div_id, 
			CARGO_OFF_X2, CARGO_OFF_Y2 );
	EvObjSetOffset( CARGO1_03_SP_TRUCK, Fld.MapID.map_id, Fld.MapID.div_id, 
			CARGO_OFF_X3, CARGO_OFF_Y3 );
}




//=========================================================================
//
//
//			高速船デモ
//
//
//=========================================================================

//--------------------------------------------------------------
//	高速船デモ開始位置に遷移する
//--------------------------------------------------------------
static int set_ship_demo_position( void )
{
	u8 map_id,div_id;
	u16 xpos,ypos;
	u8 mode;

	mode = GetShipWorldPos( &div_id, &map_id, &xpos, &ypos );
	if ( mode != SHIPPOS_DEMO ) return FALSE;

	NextMapSetDirect( div_id, map_id, -1, xpos, ypos );
	return TRUE;
}

//--------------------------------------------------------------
//	高速船デモ制御タスク
//--------------------------------------------------------------
enum{
	WK_SHIPSEQ = 0,
	WK_SHIPEND,
};

enum{
	SEQ_SHIPFADEWAIT,	//フェードイン待ち
	SEQ_SHIPANMWAIT,	//移動アニメ待ち
	SEQ_SHIPCONTROL,	//制御
	SEQ_SHIPEND,		//デモ終了
};

static const u8 right_anime[] = { AC_WALK_R_2,ACMD_END };
static const u8 left_anime[] = { AC_WALK_L_2,ACMD_END };


void ship_control_task( u8 no )
{
	s16 * wk = TaskTable[no].work;
	u16 * scene = GetEventWorkAdrs( WK_SCENE_SP_SHIP01 );
	MapID * now = &Fld.MapID;

	switch ( wk[WK_SHIPSEQ] ) {

	case SEQ_SHIPFADEWAIT:
		if ( FadeData.fade_sw == 1 ) break;
		wk[WK_SHIPEND] = FALSE;
		wk[WK_SHIPSEQ] = SEQ_SHIPCONTROL;
		break;

	case SEQ_SHIPANMWAIT:
		if ( sys.Trg & A_BUTTON ) wk[WK_SHIPEND] = TRUE;
		if ( AnmCmdEnd( EV_OBJ_SPID,now->map_id,now->div_id) == FALSE ) break;
		if ( ShipStepCountCheck(1) == TRUE ) {
			if ( *scene == SHIPSCENE_DEMO_RIGHT ) {
				*scene = SHIPSCENE_END_DEMO_RIGHT;
			} else {
				*scene = SHIPSCENE_END_DEMO_LEFT;
			}
			wk[WK_SHIPSEQ] = SEQ_SHIPEND;
			break;
		}
		wk[WK_SHIPSEQ] = SEQ_SHIPCONTROL;
		/* FALL THROUGH */
	case SEQ_SHIPCONTROL:
		if ( wk[WK_SHIPEND] ) {
			wk[WK_SHIPSEQ] = SEQ_SHIPEND;
		}
		else if ( *scene == SHIPSCENE_DEMO_RIGHT ) {
			AnmCmdSet( EV_OBJ_SPID,now->map_id,now->div_id,right_anime);
			wk[WK_SHIPSEQ] = SEQ_SHIPANMWAIT;
		}
		else {
			AnmCmdSet( EV_OBJ_SPID,now->map_id,now->div_id,left_anime);
			wk[WK_SHIPSEQ] = SEQ_SHIPANMWAIT;
		}
		break;

	case SEQ_SHIPEND:
		EventFlagReset( CTRL_BGM_CHANGE );
		EventFlagReset( CTRL_MAPNAME_HIDE );
		NextMapSetBySpID(0);
		AddMapChangeSeNotTask();
		DelTask(no);
		break;

	}
}



void AddDemoShipActor( void )
{
	u8 actno;

	// 高速船アクターをセット
	actno = EvObjMakeAddAct( HISHIP1, DummyActMove, 7*16, 5*16, 0 );
	ActWork[actno].scr = 0;
	if ( GetEventWorkValue(WK_SCENE_SP_SHIP01) == SHIPSCENE_DEMO_RIGHT ) {
		ActAnmChg( &ActWork[actno], EvActAnmNoStop( SITE_RIGHT ) );
	} else {
		ActAnmChg( &ActWork[actno], EvActAnmNoStop( SITE_LEFT ) );
	}
}

//--------------------------------------------------------------
//	高速船デモ用フィールド初期化処理
//--------------------------------------------------------------
void AddFieldShipInTask( void )
{
	AddDemoShipActor();

	//主人公ＯＢＪを見えなくする
	EvObjNoBanishOn( MyMoveState.evobjno );

	FieldFadeBlackInSet();
	AddTask(ship_control_task,80);
	SetForceEvent();
}


//--------------------------------------------------------------
//	高速船デモに切り替え
//--------------------------------------------------------------
void ShipEventModeStart( void )
{
	EventFlagSet( SYS_CRUISE_MODE );
	EventFlagSet( CTRL_BGM_CHANGE );		//ＢＧＭ切り替えフック
	EventFlagSet( CTRL_MAPNAME_HIDE );		//地名表示フック
	SetSpecialMapID( 0, Fld.MapID.div_id, Fld.MapID.map_id, -1 );
	set_ship_demo_position();
	AddMapChangeShipTask();
}


