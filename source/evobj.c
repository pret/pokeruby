//**********************************************************************
//		evobj.c
//		ﾌｨｰﾙﾄﾞOBJ
//**********************************************************************
#define		EVOBJ_H_PROTO
#include	<agb.h>
#include	"common.h"
#include	"actor.h"
#include	"actanm.h"
#include	"evobj.h"
#include	"jiki.h"
#include	"palanm.h"
#include	"map.h"
#include	"fieldmap.h"
#include	"field.h"
#include	"fld_tool.h"
#include	"ev_flag.h"
#include	"ev_fight.h"
#include	"seed.h"
#include	"mul_play.h"

//----------------------------------------------------------------------
//		ｸﾞﾛｰﾊﾞﾙ
//----------------------------------------------------------------------
EventOBJ	EvObj[EV_OBJ_MAX];							// ｲﾍﾞﾝﾄ OBJ ﾜｰｸ
MvCmd		MyMoveState =								// 自機ﾜｰｸ
{
	0,0,0,0,0,0,0,0,0,0,0,0,0,0,
	{0,0,0,0,0,0,0,0},
	{0,0,0,0,0,0,0,0},
};

#ifdef PM_DEBUG
u8			EvObjCount;									// ｲﾍﾞﾝﾄ OBJ ｶｳﾝﾄ(ﾃﾞﾊﾞｯｸﾞ)
#endif

//----------------------------------------------------------------------
//		ﾛｰｶﾙ
//----------------------------------------------------------------------
static u8  EvObjColorMode;								// 現在のﾊﾟﾚｯﾄﾓｰﾄﾞ
static u16 EvObjSpPalID;								// 登録中特殊OBJﾊﾟﾚｯﾄID

//----------------------------------------------------------------------
//		ﾃﾞﾊﾞｯｸﾞ
//----------------------------------------------------------------------
#define	EVOBJ_STAY_PAL_DEBUG	1						// 常駐ﾊﾟﾚｯﾄ

//----------------------------------------------------------------------
//		define
//----------------------------------------------------------------------
#define	OBJ_MAPOUT_MARGIN_V_UP		(2)
#define OBJ_MAPOUT_MARGIN_V_DOWN	(2)
#define OBJ_MAPOUT_MARGIN_H			(2)

#define EVOBJ_MV_LIM_CHECK_ON		1

#define SXY_OBJDATA_GET(sxy,i) sxy=&(Fld.SvSxyObj[i])	// SXYﾃﾞｰﾀ取得

//----------------------------------------------------------------------
//		外部参照関数,変数
//----------------------------------------------------------------------
extern s16 FieldActOX;
extern s16 FieldActOY;
extern s16 TransAreaFlagChk( u16 );

//----------------------------------------------------------------------
//		ﾌﾟﾛﾄ
//----------------------------------------------------------------------
static const evObjData * SxyObjDataGet( u8, u8, u8 );

//======================================================================
//		ﾌｨｰﾙﾄﾞOBJ ﾜｰｸ
//======================================================================
static u8 evobj_id_seek( u8, u8, u8 );
static u8 evobj_spid_seek( u8 );
static u8 evobj_work_seek( u16, u8, u8, u8 * );
static void EvObjStayActorSet( void );
static void evobj_delact( EventOBJ * );

//------------------------------------------
//	ｲﾍﾞﾝﾄ OBJ ﾜｰｸ初期化
//	In:	ev		; ﾜｰｸｱﾄﾞﾚｽ
//------------------------------------------
void EvObjWorkInit( EventOBJ *ev )
{
	memset( (u8*)ev, 0, EVOBJ_SIZE );
	
	ev->objID = 0xff;
	ev->mapID = 0xff;
	ev->divID = 0xff;
	ev->acmd = NOT_ACMD;
}

//------------------------------------------
//	ｲﾍﾞﾝﾄ OBJ ﾜｰｸ全初期化
//------------------------------------------
void EvObjWorkAllInit( void )
{
	u8 i;

	for( i = 0; i < EV_OBJ_MAX; EvObjWorkInitNo(i), i++ );

#ifdef PM_DEBUG
	EvObjCount = 0;
#endif
}

//------------------------------------------
//	ｲﾍﾞﾝﾄOBJ ﾜｰｸ全初期化,常駐ｱｸﾀｰｾｯﾄ
//------------------------------------------
void EvObjInit( void )
{
	InitAllPlayer();
	EvObjWorkAllInit();
	MyMoveStateInit();
	EvObjStayActorSet();
}

//------------------------------------------
//	常駐ｱｸﾀｰｾｯﾄ
//------------------------------------------
static void EvObjStayActorSet( void )
{
	u8 i;
	const actHeader *actH;

	actH = (const actHeader *)EvActHeadGet( EVACT_REFAFF );
	
	i = AddActorBottom( actH, 0, 0, 31 );

	ActWork[i].oamData.AffineMode = 1;
	AffineNumSet( &ActWork[i] );
	ActAffAnmChg( &ActWork[i], 0 );
	ActWork[i].banish = 1;
	
	i = AddActorBottom( actH, 0, 0, 31 );
	ActWork[i].oamData.AffineMode = 1;
	AffineNumSet( &ActWork[i] );
	ActAffAnmChg( &ActWork[i], 1 );
	ActWork[i].banish = 1;
}

//------------------------------------------
//	空ﾜｰｸｼｰｸ
//	Out:		u8		; 空ﾜｰｸﾅﾝﾊﾞ
//						; EV_OBJ_MAX = ERROR
//------------------------------------------
u8 EvObjEmptyWorkSeek( void )
{
	u8 i;
	
	for( i = 0; i < EV_OBJ_MAX && EvObj[i].sw; i++ );
	
	return( i );
}

//------------------------------------------
//	指定 ID -> ﾜｰｸﾅﾝﾊﾞ
//	In:		objID			; OBJ ID
//			mapID			; MAP ID
//			divID			; DIV ID
//	Out:	u8				; ﾜｰｸﾅﾝﾊﾞ
//							; EV_OBJ_MAX = ERROR
//------------------------------------------
u8 EvObjIdSeek( u8 objID, u8 mapID, u8 divID )
{
	u8 i;
	
	if( objID >= EV_OBJ_SPID )
	{
		i = evobj_spid_seek( objID );
	}
	else
	{
		i = evobj_id_seek( objID, mapID, divID );
	}

	return( i );
}

//------------------------------------------
//	ID -> ﾜｰｸﾅﾝﾊﾞ, ﾌﾗｸﾞ
//------------------------------------------
u8 EvObjIdPosGet( u8 objID, u8 mapID, u8 divID, u8 *pos )
{
	*pos = EvObjIdSeek( objID, mapID, divID );
	
	if( *pos == EV_OBJ_MAX )
	{
		return( 1 );
	}
	
	return( 0 );
}

//------------------------------------------
//	ﾏｯﾌﾟ座標 -> ﾜｰｸﾅﾝﾊﾞ
//------------------------------------------
u8 EvObjWorkMapPosGet( s16 x, s16 y )
{
	u8 i;
	
	for( i = 0; i < EV_OBJ_MAX; i++ )
	{
		if( EvObj[i].sw &&
			EvObj[i].gx == x && EvObj[i].gy == y )
		{
			return( i );
		}
	}
	
	return( i );
}

//------------------------------------------
//	ﾜｰｸｼｰｸ
//------------------------------------------
static u8 evobj_id_seek( u8 objID, u8 mapID, u8 divID )
{	
	u8	i;
	EventOBJ *ev;

	for( i = 0; i < EV_OBJ_MAX; i++ )
	{
		ev = &EvObj[i];
		
		if( ev->sw && ev->objID == objID &&
			ev->mapID == mapID && ev->divID == divID )
		{
			return( i );
		}
	}

	return( EV_OBJ_MAX );
}

//------------------------------------------
//	特別ID (主人公など)
//------------------------------------------
static u8 evobj_spid_seek( u8 objID )
{
	u8	i;
	EventOBJ *ev;

	for( i = 0; i < EV_OBJ_MAX; i++ )
	{
		ev = &EvObj[i];

		if( ev->sw && ev->objID == objID )
		{
			return( i );
		}
	}
	
	return( EV_OBJ_MAX );
}

//------------------------------------------
//	ｲﾍﾞﾝﾄOBJ ｾｯﾄ
//	In:		evH		; SXY OBJ ｽﾃｰﾀｽ
//			map_id	; Map ID
//			div_id	; Div ID
//	Out:	u8		; 登録番号
//					; EV_OBJ_MAX = Error
//-----------------------------------------
u8 EvObjAddWork( const evObjData *evH, u8 map_id, u8 div_id )
{
	EventOBJ *ev;
	u8	no;
	s16	x,y;

	if( evobj_work_seek(evH->id,map_id,div_id,&no) )
	{
		return( EV_OBJ_MAX );
	}

	ev = &EvObj[no];

	EvObjWorkInit( ev );
	
	x = evH->pos_x + MAP_LEFT_MARGIN;						// ﾏｯﾌﾟ座標修正
	y = evH->pos_y + MAP_UP_MARGIN;
	
	ev->sw = 1;
	ev->move_start_sw = 1;
	ev->obj_code = evH->obj_code;
	ev->mv_code = evH->site;
	ev->objID = evH->id;
	ev->mapID = map_id;
	ev->divID = div_id;
	ev->init_x = x;
	ev->init_y = y;
	ev->gx = x;
	ev->gy = y;
	ev->old_gx = x;
	ev->old_gy = y;
	ev->height = evH->height;
	ev->height_pri = evH->height;
	ev->mvlim_x = evH->mvlim_x;
	ev->mvlim_y = evH->mvlim_y;
	ev->ev_type = evH->ev_type;
	ev->ev_work = evH->work;
	ev->mapID = map_id;
	ev->old_site = EvObjDefaultSite( evH->site );
	EvObjSiteSet( ev, ev->old_site );
	EvObjCodeWorkChk( ev );

#if EVOBJ_MV_LIM_CHECK_ON								// SXY 設定ﾐｽ対処
	if( EvObjMoveLimitFlagTbl[ev->mv_code] )
	{
		if( ev->mvlim_x == 0 ) ev->mvlim_x++;
		if( ev->mvlim_y == 0 ) ev->mvlim_y++;
	}
#endif

#ifdef PM_DEBUG
	EvObjCount++;
#endif

	return( no );
}

//------------------------------------------
//	ｲﾍﾞﾝﾄOBJﾜｰｸ追加
//	In:		objID	; OBJ ID
//	Out:	u8		; ﾜｰｸﾅﾝﾊﾞ
//					; EV_OBJ_MAX = Error
//	Info:	現在のﾏｯﾌﾟで追加
//-----------------------------------------
u8 EvObjWorkAdd( u8 objID )
{
	u8	i,count;
	const evObjData *sxy;

	if( NowMap.Sxy == NULL ) return( EV_OBJ_MAX );
	count = NowMap.Sxy->ObjMax;								// 登録最大

	for( i = 0; i < count; i++ )
	{
		SXY_OBJDATA_GET( sxy, i );

		if( sxy->id == objID && EventFlagCheck(sxy->ev_flag) == 0 )
		{
			return( EvObjAddWork(sxy,(u8)Fld.MapID.map_id,(u8)Fld.MapID.div_id) );
		}
	}

	return( EV_OBJ_MAX );
}

//------------------------------------------
//	ｲﾍﾞﾝﾄOBJ ﾜｰｸ 調査
//------------------------------------------
static u8 evobj_work_seek( u16 id, u8 map_id, u8 div_id, u8 *no )
{
	u8	i;
	
	for( i = 0; i < EV_OBJ_MAX && EvObj[i].sw; i++ )	// OBJ ﾜｰｸﾁｪｯｸ
	{
		if( EvObj[i].objID == id &&
			EvObj[i].mapID == map_id &&
			EvObj[i].divID == div_id )
		{
			return( 1 );								// 存在している
		}
	}

	if( i >= EV_OBJ_MAX )
	{
		return( 1 );
	}

	*no = i;											// No

	for( ; i < EV_OBJ_MAX; i++ )						// 残り
	{
		if( EvObj[i].sw &&
			EvObj[i].objID == id &&
			EvObj[i].mapID == map_id &&
			EvObj[i].divID == div_id )
		{
			return( 1 );								// 存在している
		}
	}

	return( 0 );
}

//------------------------------------------
//	ｲﾍﾞﾝﾄOBJ 削除, ｱﾄﾞﾚｽ
//	In:		ev		; ｲﾍﾞﾝﾄﾜｰｸ
//------------------------------------------
void EvObjDel( EventOBJ *ev )
{
	ev->sw = 0;
	evobj_delact( ev );

#ifdef PM_DEBUG
	EvObjCount--;										// ﾃﾞﾊﾞｯｸﾞ
#endif
}

//------------------------------------------
//	ｲﾍﾞﾝﾄOBJ 削除,ﾌﾗｸﾞｾｯﾄ
//	In:		objID		; OBJ ID
//			mapID		; MAP ID
//			divID		; DIV ID
//------------------------------------------
void EvObjDelId( u8 objID, u8 mapID, u8 divID )
{
	u8 evno;

	if( EvObjIdPosGet(objID,mapID,divID,&evno) )
	{
		return;
	}

	EventFlagSet( EvObjNoEvFlagGet(evno) );

	EvObjDel( &EvObj[evno] );
}

//------------------------------------------
//	ｲﾍﾞﾝﾄOBJ 付属ｱｸﾀｰ削除
//------------------------------------------
static void evobj_delact( EventOBJ *ev )
{
	SXYObjHead *objst;
	actAnmData dmy_t[1];

	objst = SxyObjHeadGet( ev->obj_code );
	dmy_t[0].size = objst->celltrans_size;
	ActWork[ev->actno].anm_trans = (const actAnmData*)dmy_t;
	DelActor( &ActWork[ev->actno] );
}

//------------------------------------------
//	ｲﾍﾞﾝﾄOBJ 全削除(主人公以外)
//------------------------------------------
void EvObjDelMap( void )
{
	u8	i;

	for( i = 0; i < EV_OBJ_MAX; i++ )
	{
		if( i != MyMoveState.evobjno )
		{
			EvObjDelNo( i );
		}
	}
}

//------------------------------------------
//	ｲﾍﾞﾝﾄ OBJ, ｱｸﾀｰ 登録
//	In:		evH			; SXY OBJ ｽﾃｰﾀｽ
//			actH		; ｱｸﾀｰﾍｯﾀﾞ
//			mapID,divID	; Map ID, Div ID
//			dx,dy		; 座標修正値
//	Out:	u8			; ｲﾍﾞﾝﾄOBJﾜｰｸﾅﾝﾊﾞ
//						; EV_OBJ_MAX = Error
//------------------------------------------
u8 EvObjAdd( const evObjData *evH, actHeader *actH, u8 mapID, u8 divID, s16 dx, s16 dy )
{
	u8	evno, actno;
	SXYObjHead *objst;
	actWork *act;
	EventOBJ *ev;

	evno = EvObjAddWork( evH, mapID, divID );

	if( evno == EV_OBJ_MAX )
	{
		return( evno );
	}

	ev = &EvObj[evno];

	objst = SxyObjHeadGet( ev->obj_code );

	if( objst->oampalNo == MINE_OBJ_PALNO )
	{
		EvObjHeroPalSet( objst->palNo, objst->oampalNo );
	}
	else if( objst->oampalNo == SP_OBJ_PALNO )
	{
		EvObjSpPalSet( objst->palNo, objst->oampalNo );
	}

	if( ev->mv_code == MV_VANISH )
	{
		ev->banish_sw = 1;
	}

	*(u16*)&(actH->palNo) = ACT_OAMPAL;

	actno = AddActor( actH, 0, 0, 0 );

	if( actno == ACT_MAX )
	{
#ifdef PM_DEBUG
		EvObjCount--;
#endif
		EvObj[evno].sw = 0;
		return( EV_OBJ_MAX );
	}

	act = &ActWork[actno];
	
	MapCellSizePos( ev->gx + dx, ev->gy + dy, &act->x, &act->y );
	act->cx = -(objst->x_size >> 1);
	act->cy = -(objst->y_size >> 1);
	act->x += 8;										// 中心補正
	act->y += 16 + act->cy;								// 足場から
	
	act->oamData.Pltt = objst->oampalNo;				// EVOBJ_STAY_PAL_DEBUG
	act->scr = 1;										// ｽｸﾛｰﾙ依存
	act->work[0] = evno;								// ﾜｰｸﾅﾝﾊﾞ

	ev->actno = actno;									// ｱｸﾀｰﾜｰｸﾅﾝﾊﾞ
	ev->anm_change_sw = objst->anm_change_sw;			// ｾﾙﾁｪﾝｼﾞﾃﾞﾌｫﾙﾄｽｲｯﾁ

	if( ev->anm_change_sw == 0 )
	{
		ActAnmChg( act, EvActAnmNoStop(ev->site) );
	}

	EvActPriControl( ev->height_pri, act, 1 );
	EvObjBanish( ev, act );

	return( evno );
}

//------------------------------------------
//	SXY -> ｲﾍﾞﾝﾄOBJ, ｱｸﾀｰ 登録
//	In:		evH			; ｲﾍﾞﾝﾄOBJ SXY ﾃﾞｰﾀ
//			mapID,divID	; Map ID, Div ID
//			dx,dy		; 座標修正値
//	Out:	u8			; ｲﾍﾞﾝﾄOBJﾜｰｸﾅﾝﾊﾞ
//						; EV_OBJ_MAX = Error
//------------------------------------------
u8 EvObjSxyAdd( const evObjData *evH, u8 mapID, u8 divID, s16 dx, s16 dy  )
{
	u8 pos;
	actHeader	actH;
	OAMPatSt	*pat;
	SXYObjHead	*objst;
	actAnmData	dmy_cell[1];

	pat = NOT_OAMPAT;
	objst = SxyObjHeadGet( evH->obj_code );
	MakeSxyActHead( evH, &actH, &pat );						// ｱｸﾀｰﾍｯﾀﾞ生成
	dmy_cell[0].size = objst->celltrans_size;
	actH.anmTrans_p = (const actAnmData*)dmy_cell;
	
	pos = EvObjAdd( evH, &actH, mapID, divID, dx, dy );		// OBJ 登録
	
	if( pos == EV_OBJ_MAX )
	{
		return( pos );
	}
	
	ActWork[EvObj[pos].actno].anm_trans = objst->anmTrans_p;

	if( pat != NOT_OAMPAT )									// ﾊﾟｯﾄ
	{
		SetActOamPat( &ActWork[EvObj[pos].actno], (const OAMPatSt*)pat );
	}

	return( pos );
}

//------------------------------------------
//	SXY -> ｲﾍﾞﾝﾄOBJ登録(簡易版)
//	In:		evH		; ｲﾍﾞﾝﾄOBJ SXY ﾃﾞｰﾀ
//	Out:	u8		; ｲﾍﾞﾝﾄOBJﾜｰｸﾅﾝﾊﾞ
//					; EV_OBJ_MAX = Error
//	Info:
//		現在のﾏｯﾌﾟ情報で登録
//------------------------------------------
u8 EvObjSxyAddNow( const evObjData *evH  )
{
	s16 dx,dy;
	
	MapCellSizeDiff( &dx, &dy );

	return( EvObjSxyAdd(evH,Fld.MapID.map_id,
				Fld.MapID.div_id, dx, dy) );
}

//------------------------------------------
//	SXYﾃﾞｰﾀ生成 -> ｲﾍﾞﾝﾄOBJ登録
//	In:		obj_code		; OBJｷｬﾗｺｰﾄﾞ
//			mv_code			; 動作ｺｰﾄﾞ
//			obj_id			; OBJ ID
//			mx,my			; ﾏｯﾌﾟ座標
//			height			; 高さ
//	Out:	u8				; ｲﾍﾞﾝﾄOBJﾜｰｸﾅﾝﾊﾞ
//							; EV_OBJ_MAX = Error
//	Info: 現在のﾏｯﾌﾟ情報で登録
//------------------------------------------
u8 EvObjMakeSxyAdd( u8 obj_code, u8 mv_code, u8 obj_id, s16 mx, s16 my, u8 height )
{
	evObjData data;

	mx -= MAP_LEFT_MARGIN;
	my -= MAP_UP_MARGIN;
	
	data.id = obj_id;
	data.obj_code = obj_code;
	data.col_code = 0;
	data.pos_x = mx;
	data.pos_y = my;
	data.height = height;
	data.site = mv_code;
	data.mvlim_x = 0;
	data.mvlim_y = 0;
	data.ev_type = OTYPE_NORMAL;
	data.work = 0;

	return( EvObjSxyAddNow((const evObjData*)&data) );
}

//------------------------------------------
//	ID -> ｲﾍﾞﾝﾄOBJ 登録
//	In:		objID		; OBJ ID
//			mapID		; MAP ID
//			divID		; DIV ID
//	Out:	u8			; ｲﾍﾞﾝﾄOBJﾜｰｸﾅﾝﾊﾞ
//						; EV_OBJ_MAX = ERROR
//------------------------------------------
u8 EvObjAddId( u8 objID, u8 mapID, u8 divID )
{
	s16 mx,my;
	evObjData *sxy;

	sxy = (evObjData *)SxyObjDataGet( objID, mapID, divID );

	if( sxy == 0 )
	{
		return( EV_OBJ_MAX );							// 該当無し
	}
	
	MapCellSizeDiff( &mx, &my );						// 座標修正値
	return( EvObjSxyAdd((const evObjData *)sxy,mapID,divID,mx,my) );
}

//------------------------------------------
//	ｱｸﾀｰﾍｯﾀﾞを生成
//	In:		code	; OBJ ｺｰﾄﾞ
//			move	; 動作関数
//			Head	; 生成先
//------------------------------------------
void EvMoveMakeHead( u16 code, void (*move)(actWork *), actHeader *Head, OAMPatSt **pat )
{
	SXYObjHead *SxyHead;
	
	SxyHead = SxyObjHeadGet( code );

	*(u16 *)&(Head->cellNo) = SxyHead->cellNo;				// const u16 -> u16 cast
	*(u16 *)&(Head->palNo) = SxyHead->palNo;
	Head->oamData_p = SxyHead->oamData_p;					// OAM
	Head->anmData_p = SxyHead->anmData_p;					// ｱﾆﾒ
	Head->anmTrans_p = SxyHead->anmTrans_p;					// ｱﾆﾒﾄﾗﾝｽ
	Head->affData_p = SxyHead->affData_p;					// ｱﾌｨﾝ
	Head->moveData_p = move;								// 動作
	*pat = (OAMPatSt*)SxyHead->oamPat;						// OAM ﾊﾟｯﾄ
}

//------------------------------------------
//	ｱｸﾀｰﾍｯﾀﾞ生成, 動作関数 ｺｰﾄﾞ
//	In:	code	; OBJ ｺｰﾄﾞ
//		mcode	; 動作ｺｰﾄﾞ
//		Head	; 生成先
//------------------------------------------
void EvMakeHead( u16 code, u16 mcode, actHeader *Head, OAMPatSt **pat )
{
	EvMoveMakeHead( code, EvObjMoveTbl[mcode], Head, pat );
}

//------------------------------------------
//	SXY ﾃﾞｰﾀから ｱｸﾀｰﾍｯﾀﾞを生成
//	In:	sxy			; SXY ﾃﾞｰﾀ
//		Head		; ﾍｯﾀﾞ生成先
//------------------------------------------
void MakeSxyActHead( const evObjData *sxy, actHeader *Head, OAMPatSt **pat )
{
	EvMakeHead( sxy->obj_code, sxy->site, Head, pat );

#if 0														// 従来型
	if( sxy->col_code )										// ｶﾗｰ指定有り
	{
		*(u16 *)&(Head->palNo) = (u16)sxy->col_code;
	}
#endif
}

//------------------------------------------
//	ｱｸﾀｰﾍｯﾀﾞを生成し追加
//	In:		code	; OBJ ｺｰﾄﾞ
//			move	; ｱｸﾀｰ動作関数
//			x,y,pri	; 座標,ﾌﾟﾗｲｵﾘﾃｨ
//	Out:	u8		; ｱｸﾀｰﾜｰｸﾅﾝﾊﾞ
//	Info:	ﾊﾟﾚｯﾄﾏﾈｰｼﾞｬ使用
//------------------------------------------
u8 EvObjMakeAddAct( u16 code, void (*move)(actWork *), s16 x, s16 y, u8 pri )
{
	u8	i;
	actHeader head;
	OAMPatSt *pat;
	
	EvMoveMakeHead( code, move, &head, &pat );

	if( head.palNo != ACT_OAMPAL )
	{
		EvObjPalSet( head.palNo );							// ﾊﾟﾚｯﾄｾｯﾄ
	}

	i =  AddActor( (const actHeader*)&head, x, y, pri );
	
	if( i != ACT_MAX && pat != NOT_OAMPAT )					// ﾊﾟｯﾄ
	{
		SetActOamPat( &ActWork[i], (const OAMPatSt*)pat );
		ActWork[i].oampat_sw = OAMPAT_PRIUNIT;
	}
	
	return( i );
}

//------------------------------------------
//	ﾌｨｰﾙﾄﾞOBJﾀﾞﾐｰｱｸﾀｰ追加
//	In:		code	; OBJｺｰﾄﾞ
//			id		; 識別 ID
//			x,y,h	; ﾏｯﾌﾟX,Y座標,高さ
//			site	; 方向
//	Out:	u8		; ｱｸﾀﾜｰｸﾅﾝﾊﾞ
//------------------------------------------
u8 EvObjDmyAddAct( u8 code, u8 id, s16 x, s16 y, u8 h, u8 site )
{
	u8 i;
	actHeader actH;
	actWork *act;
	OAMPatSt *pat;
	SXYObjHead *objst;
	
	objst = SxyObjHeadGet( code );
	EvMoveMakeHead( code, EvObjDmyActMove, &actH, &pat );
	*(u16*)&(actH.palNo) = ACT_OAMPAL;
	
	x += MAP_LEFT_MARGIN;
	y += MAP_UP_MARGIN;
	MapCellSizePosDiffOffs( &x, &y, 8, 16 );
//	i = AddActor( (const actHeader*)&actH, x, y, 0 );
	i = AddActorBottom( (const actHeader*)&actH, x, y, 0 );

	if( i != ACT_MAX )
	{
		act = &ActWork[i];
		act->cx = -(objst->x_size >> 1);
		act->cy = -(objst->y_size >> 1);
		act->y += act->cy;
		act->oamData.Pltt = objst->oampalNo;
		act->scr = 1;
		act->work[0] = id;
		act->work[1] = h;

		if( objst->oampalNo == SP_OBJ_PALNO )
		{
			EvObjSpPalSet( objst->palNo, objst->oampalNo );
		}

		if( pat != NOT_OAMPAT )
		{
			SetActOamPat( act, (const OAMPatSt*)pat );
			act->oampat_sw = OAMPAT_PRIUNIT;
		}

		EvActHeightSet( act, h );
		EvActPriControl( h, act, 1 );
		ActAnmChg( act, EvActAnmNoStop(site) );
	}

	return( i );
}

//------------------------------------------
//	ﾏｯﾌﾟﾃﾞｰﾀ　ｲﾍﾞﾝﾄOBJ登録
//	In:		dx,dy			; 修正座標
//------------------------------------------
void EvObjAddControl( s16 dx, s16 dy )
{
	u8	i,count;
	s16 mx0,mx1,my0,my1,px,py;
	const evObjData *sxy;

	if( NowMap.Sxy == NULL )
	{
		return;												// 設定無し
	}

	mx0 = Fld.MapXpos - OBJ_MAPOUT_MARGIN_H;
	mx1 = Fld.MapXpos + SCR_CELL_X + OBJ_MAPOUT_MARGIN_H;
	my0 = Fld.MapYpos + VIEW_UP_MARGIN - OBJ_MAPOUT_MARGIN_V_UP;
	my1 = Fld.MapYpos + VIEW_UP_MARGIN + SCR_CELL_Y + OBJ_MAPOUT_MARGIN_V_DOWN;
	count = NowMap.Sxy->ObjMax;								// 登録最大

	for( i = 0; i < count; i++ )
	{
		SXY_OBJDATA_GET( sxy, i );
		
		px = sxy->pos_x + MAP_LEFT_MARGIN;
		py = sxy->pos_y + MAP_UP_MARGIN;
		
		if( my0 <= py && my1 >= py && mx0 <= px && mx1 >= px &&
			EventFlagCheck(sxy->ev_flag) == 0 )
		{
			EvObjSxyAdd( sxy, (u8)Fld.MapID.map_id,	(u8)Fld.MapID.div_id, dx, dy );
		}
	}
}

//------------------------------------------
//	ﾏｯﾌﾟｽｸﾛｰﾙ OBJ 削除
//------------------------------------------
static void evobj_delcont_chk( EventOBJ * );

static void EvObjDelControl( void )
{
	u8 i,pos,flag;
	EventOBJ *ev;

	for( i = 0; i < EV_OBJ_MAX; i++ )
	{
		for( pos = 0, flag = 0; pos < COMM_PLAYER_MAX; pos++ )	// 仮 いずれﾌﾗｸﾞ位置をまとめる
		{
			if( Player[pos].sw && i == Player[pos].evobjno )
			{
				flag = 1;
			}
		}

		if( flag == 0 )
		{
			ev = &EvObj[i];

			if( ev->sw && ev->scr_del_sw == 0 )
			{
				evobj_delcont_chk( ev );
			}
		}
	}
}

//------------------------------------------
//	OBJ 削除 判定
//------------------------------------------
static void evobj_delcont_chk( EventOBJ *ev )
{
#if 1
	s16 x0,y0,x1,y1;

	x0 = Fld.MapXpos - OBJ_MAPOUT_MARGIN_H;
	x1 = Fld.MapXpos + OBJ_MAPOUT_MARGIN_H + SCR_CELL_X;
	y0 = Fld.MapYpos + VIEW_UP_MARGIN - OBJ_MAPOUT_MARGIN_V_UP;
	y1 = Fld.MapYpos + VIEW_UP_MARGIN + OBJ_MAPOUT_MARGIN_V_DOWN + SCR_CELL_Y;

	if( (ev->gx < x0 || ev->gx > x1 || ev->gy < y0 || ev->gy > y1) &&
		(ev->init_x < x0 || ev->init_x > x1 || ev->init_y < y0 || ev->init_y > y1) )
	{
		EvObjDel( ev );
	}
#elif 0
	s16 x0,y0,x1,y1;

	x0 = Fld.MapXpos - OBJ_MAPOUT_MARGIN_H;
	x1 = Fld.MapXpos + OBJ_MAPOUT_MARGIN_H + SCR_CELL_X;
	y0 = Fld.MapYpos - OBJ_MAPOUT_MARGIN_V_UP;
	y1 = Fld.MapYpos + OBJ_MAPOUT_MARGIN_V_DOWN + SCR_CELL_Y;

	if( (ev->gx < x0 || ev->gx > x1 || ev->gy < y0 || ev->gy > y1) &&
		(ev->init_x < x0 || ev->init_x > x1 || ev->init_y < y0 || ev->init_y > y1) )
	{
		EvObjDel( ev );
	}
#else
	if( (ev->gx < Fld.MapXpos - OBJ_MAPOUT_MARGIN_H ||
			ev->gx > Fld.MapXpos + SCR_CELL_X + OBJ_MAPOUT_MARGIN_H  ||
			ev->gy < Fld.MapYpos - OBJ_MAPOUT_MARGIN_V_UP ||
			ev->gy > Fld.MapYpos + SCR_CELL_Y + OBJ_MAPOUT_MARGIN_V_DOWN) &&
		(ev->init_x < Fld.MapXpos - OBJ_MAPOUT_MARGIN_H ||
			ev->init_x > Fld.MapXpos + SCR_CELL_X + OBJ_MAPOUT_MARGIN_H  ||
			ev->init_y < Fld.MapYpos - OBJ_MAPOUT_MARGIN_V_UP ||
			ev->init_y > Fld.MapYpos + SCR_CELL_Y + OBJ_MAPOUT_MARGIN_V_DOWN) )
	{
		EvObjDel( ev );
	}
#endif
}

//======================================================================
//		復帰処理
//======================================================================
static void EvObjRecoverSet( u8, s16, s16 );
static void evobj_rec_work_init( EventOBJ * );
static void MyMoveStateSet( u8, u8 );

//------------------------------------------
//	ｲﾍﾞﾝﾄ OBJ 復帰処理
//	In:		dx,dy		; 表示修正座標
//------------------------------------------
void EvObjRecover( s16 dx, s16 dy )
{
	u8 i;

#ifdef PM_DEBUG
	EvObjCount = 0;
#endif

	MyMoveStateInit();

	for( i = 0; i < EV_OBJ_MAX; i++ )
	{
		if( EvObj[i].sw )
		{
			EvObjRecoverSet( i, dx, dy );
#ifdef PM_DEBUG
			EvObjCount++;
#endif
		}	
	}

	EvObjStayActorSet();
}

//------------------------------------------
//	ｲﾍﾞﾝﾄ OBJ 復帰処理 ﾜｰｸｾｯﾄ
//------------------------------------------
static void EvObjRecoverSet( u8 evpos, s16 dx, s16 dy )
{
	u8	pos;
	actHeader 	actH;
	OAMPatSt 	*pat;
	SXYObjHead	*objst;
	actWork *act;
	EventOBJ *ev;
	actAnmData	dmy_cell[1];
														
	for( pos = 0; pos < COMM_PLAYER_MAX; pos++ )			// 通信用OBJ識別
	{
		if( Player[pos].sw && evpos == Player[pos].evobjno )
		{
			return;
		}
	}

	ev = &EvObj[evpos];
	pat = NOT_OAMPAT;
	objst = SxyObjHeadGet( ev->obj_code );
	dmy_cell[0].size = objst->celltrans_size;
	EvMakeHead( ev->obj_code, ev->mv_code, &actH, &pat );	// ｱｸﾀｰﾍｯﾀﾞ生成
	actH.anmTrans_p = (const actAnmData*)dmy_cell;
	*(u16*)&(actH.palNo) = ACT_OAMPAL;						// PALTEST

	if( objst->oampalNo == MINE_OBJ_PALNO )
	{
		EvObjHeroPalSet( objst->palNo, objst->oampalNo );
	}

	if( objst->oampalNo >= SP_OBJ_PALNO )
	{
		EvObjSpPalSet( objst->palNo, objst->oampalNo );
	}

	*(u16*)&(actH.palNo) = ACT_OAMPAL;						// EVOBJ_STAY_PAL_DEBUG

	pos = AddActor( &actH, 0, 0, 0 );						// ｱｸﾀｰ追加

	if( pos == ACT_MAX )
	{
		return;
	}

	act = &ActWork[pos];
	
	MapCellSizePos( ev->gx + dx, ev->gy + dy, &act->x, &act->y );
	act->cx = -(objst->x_size >> 1);
	act->cy = -(objst->y_size >> 1);
	act->x += 8;											// 中心補正
	act->y += 16 + act->cy;									// 足場から

	act->anm_trans = objst->anmTrans_p;

	if( ev->mv_code == MV_HERO )
	{
		MyMoveStateSet( evpos, pos );
		ev->joint_actno[1] = EvActExitCursorSet();
	}

	if( pat != NOT_OAMPAT )
	{
		SetActOamPat( &ActWork[pos], (const OAMPatSt*)pat );
	}

	act->oamData.Pltt = objst->oampalNo;					// PALTEST
	act->scr = 1;
	act->work[0] = evpos;
	ev->actno = pos;
	
	if( ev->anm_change_sw == 0 && ev->mv_code != MV_HERO )
	{
		ActAnmChg( act, EvActAnmNoStop(ev->site) );
	}

	evobj_rec_work_init( ev );

	EvActPriControl( ev->height_pri, act, 1 );
}

//------------------------------------------
//	ﾌﾗｸﾞ系初期化
//------------------------------------------
static void evobj_rec_work_init( EventOBJ *ev )
{
	ev->move_sw = 0;
	ev->move_start_sw = 1;
	ev->shade_act_sw = 0;
	ev->attr_reflect_sw = 0;
	ev->attr_grass_sw = 0;
	ev->attr_shoal_sw = 0;
	ev->attr_sand_sw = 0;
	ev->attr_onsen_sw = 0;
	AcmdFreeWork( ev );
}

//------------------------------------------
//	MyMoveState 初期化
//------------------------------------------
static void MyMoveStateSet( u8 evpos, u8 actpos )
{
	MyMoveState.evobjno = evpos;
	MyMoveState.actno = actpos;
	MyMoveState.sex = GetMainHeroObjCodeSex( EvObj[evpos].obj_code );

	MyMoveStateObjCodeRequest( EvObj[evpos].obj_code, MY_MV_BIT_UNDER );
}

//======================================================================
//		ﾊﾟﾗﾒｰﾀ
//======================================================================
//------------------------------------------
//	ｲﾍﾞﾝﾄOBJ ﾊﾟﾗﾒﾀ変更
//	In:		ev			; ｲﾍﾞﾝﾄOBJﾜｰｸ
//			code		; ﾁｪﾝｼﾞｺｰﾄﾞ
//------------------------------------------
void EvObjChgParam( EventOBJ *ev, u8 code )
{
	SXYObjHead *objst;
	actWork *act;

	objst = SxyObjHeadGet( code );
	act = &ActWork[ev->actno];

	if( objst->oampalNo == MINE_OBJ_PALNO )
	{
//		EvObjHeroPalSet( objst->palNo, objst->oampalNo );
		EvObjStayPalSet( objst->palNo, objst->oampalNo );
	}

	if( objst->oampalNo == SP_OBJ_PALNO )
	{
		EvObjSpPalSet( objst->palNo, objst->oampalNo );
	}

	act->oamData.Shape = objst->oamData_p->Shape;
	act->oamData.Size = objst->oamData_p->Size;
	act->anm_trans = objst->anmTrans_p;
	act->anm_tbl = objst->anmData_p;
	act->oamPat = objst->oamPat;
	act->oamData.Pltt = objst->oampalNo;
	
	ev->anm_change_sw = objst->anm_change_sw;
	ev->obj_code = code;
	
	MapCellSizePosDiff( ev->gx, ev->gy, &act->x, &act->y );
	act->cx = -(objst->x_size >> 1);
	act->cy = -(objst->y_size >> 1);
	act->x += 8;										// 中心補正
	act->y += 16 + act->cy;								// 足場から

	if( ev->scr_main_sw )
	{
		FldScrollPosInit();
	}
}

//------------------------------------------
//	ｲﾍﾞﾝﾄOBJ ﾊﾟﾗﾒﾀ変更, ID
//	In:		id			; OBJ ID
//			map, div	; MAP ID, DIV ID
//			code		; ﾁｪﾝｼﾞOBJｺｰﾄﾞ
//------------------------------------------
void EvObjChgParamId( u8 id, u8 map, u8 div, u8 code )
{
	u8 pos;
	
	if( EvObjIdPosGet(id,map,div,&pos) )
	{
		return;
	}
	
	EvObjChgParam( &EvObj[pos], code );
}

//------------------------------------------
//	ｲﾍﾞﾝﾄOBJ 方向変更
//	In:		ev			; ｲﾍﾞﾝﾄOBJﾜｰｸ
//			site		; 指定方向
//------------------------------------------
void EvObjChgSite( EventOBJ *ev, u8 site )
{
	EvObjSiteSet( ev, site );
	
	if( ev->anm_change_sw == 0 )
	{
		ActAnmChg( &ActWork[ev->actno], EvActAnmNoStop(ev->site) );
		ActAnmOffsChg( &ActWork[ev->actno], 0 );
	}
}

//------------------------------------------
//	ｲﾍﾞﾝﾄOBJ ﾊﾟﾗﾒﾀ変更, ID
//	In:		id			; OBJ ID
//			map, div	; MAP ID, DIV ID
//			code		; 方向
//------------------------------------------
void EvObjChgSiteId( u8 id, u8 map, u8 div, u8 site )
{
	u8 pos;

	if( EvObjIdPosGet(id,map,div,&pos) )
	{
		return;
	}

	EvObjChgSite( &EvObj[pos], site );
}

//------------------------------------------
//	MvCmd 引数型 方向変更
//------------------------------------------
void MvCmdChgSite( MvCmd *myst, u8 site )
{
	EvObjChgSite( &EvObj[myst->evobjno], site );
}

//------------------------------------------
//	たねｱﾆﾒｰｼｮﾝﾊﾟﾗﾒﾀｾｯﾄ
//------------------------------------------
void EvObjSeedSetParam( EventOBJ *ev, actWork *act )
{
	u8 seed,speed;

	ev->banish_sw = 1;
	act->banish = 1;
	speed = GetSeedGrowth( ev->ev_work );

	if( speed == SEEDSTAT_NOTHING )						// 植えてない
	{
		return;
	}

	ev->banish_sw = 0;
	act->banish = 0;
	seed = GetSeedType( ev->ev_work ) - 1;	 			// たね種類 1 origin
	speed -= SEEDSTAT_UNDERGROUND;						// 成長 - 盛り土 = 各ﾅﾝﾊﾞ

	if( seed > SEED_TYPE_MAX )							// error対処
	{
		seed = 0;
	}

	EvObjChgParam( ev, SeedObjCodeGet(seed,speed) );
	act->anm_trans = SeedCellTransGet( seed );
	act->oamData.Pltt = SeedPalNoGet( seed, speed );
	ActAnmChg( act, speed );
}

//------------------------------------------
//	OBJ ｽﾃｰﾀｽﾍｯﾀﾞ
//------------------------------------------
SXYObjHead * SxyObjHeadGet( u8 code )
{
	if( code >= WKOBJCODE1 )
	{
		code = GetEvDefineObjCode( code - WKOBJCODE1 );
	}

	if( code >= EVOBJCODEMAX )							// error
	{
		code = BOYA1;
	}

	return( SxyObjHeadAdrs(code) );
}

//------------------------------------------
//	OBJ ｺｰﾄﾞﾁｪｯｸ
//------------------------------------------
void EvObjCodeWorkChk( EventOBJ *ev )
{
	if( ev->obj_code >= WKOBJCODE1 )
	{
		ev->obj_code = GetEvDefineObjCode( ev->obj_code - WKOBJCODE1 );
	}
}

//------------------------------------------
//	OBJ ﾊﾞﾆｯｼｭｾｯﾄ
//	In:		id			; OBJ ID
//			map, div	; MAP ID, DIV ID
//			sw			; ON = 非表示
//------------------------------------------
void EvObjBanishSet( u8 id, u8 map, u8 div, u8 sw )
{
	u8 pos;

	if( EvObjIdPosGet(id,map,div,&pos) )
	{
		return;
	}

	EvObj[pos].banish_sw = sw;
}

//------------------------------------------
//	OBJ ID 格納
//	In:		ev			; ｲﾍﾞﾝﾄOBJﾜｰｸ
//			work0,1,2	; ｾｯﾄﾜｰｸ
//						; 0 = OBJ ID
//						; 1 = MAP ID
//						; 2 = DIV ID
//------------------------------------------
void EvObjIdWorkSet( EventOBJ *ev, void *work0, void *work1, void *work2 )
{
	*(u8*)work0 = ev->objID;
	*(u8*)work1 = ev->mapID;
	*(u8*)work2 = ev->divID;
}

//------------------------------------------
//	その座標にいるOBJの動作ﾌﾗｸﾞON
//	In:		mx,my		; ﾁｪｯｸﾏｯﾌﾟx,y
//------------------------------------------
void EvObjMapPosMvFlagOn( s16 mx, s16 my )
{
	u8 i;
	EventOBJ *ev;

	i = EvObjWorkMapPosGet( mx, my );
	
	if( i != EV_OBJ_MAX )
	{
		ev = &EvObj[i];
		ev->move_start_sw = 1;
	}
}

//------------------------------------------
//	表示ﾌﾟﾗｲｵﾘﾃｨ変更
//	In:		objID,mapID, divID	; OBJ,MAP,DIV ID
//			pri					; 表示ﾌﾟﾗｲｵﾘﾃｨ
//	Info	ﾌﾟﾗｲｵﾘﾃｨﾌﾗｸﾞ ON
//------------------------------------------
void EvObjPriChg( u8 objID, u8 mapID, u8 divID, u8 pri )
{
	u8 i;
	EventOBJ *ev;
	actWork *act;

	if( EvObjIdPosGet(objID,mapID,divID,&i) == 0 )
	{
		ev = &EvObj[i];
		act = &ActWork[ev->actno];
		ev->priority_hold_sw = 1;
		act->pri = pri;
	}
}

//------------------------------------------
//	表示ﾌﾟﾗｲｵﾘﾃｨﾌﾗｸﾞ OFF
//	In:		objID,mapID, divID	; OBJ,MAP,DIV ID
//------------------------------------------
void EvObjPriChgOff( u8 objID, u8 mapID, u8 divID )
{
	u8 i;
	EventOBJ *ev;

	if( EvObjIdPosGet(objID,mapID,divID,&i) == 0 )
	{
		ev = &EvObj[i];
		ev->priority_hold_sw = 0;
		ev->move_start_sw = 1;
	}
}

//------------------------------------------
//	ｵﾌｾｯﾄ座標ｾｯﾄ
//	In:		objID,mapID,divID	; OBJ,MAP,DIV ID
//			x,y					; ﾄﾞｯﾄｵﾌｾｯﾄ
//------------------------------------------
void EvObjSetOffset( u8 objID, u8 mapID, u8 divID, s16 x, s16 y )
{
	u8 i;
	actWork *act;
	
	if( EvObjIdPosGet(objID,mapID,divID,&i) == 0 )
	{
		act= &ActWork[EvObj[i].actno];
		act->dx = x;
		act->dy = y;
	}
}

//======================================================================
//		ﾌｨｰﾙﾄﾞ OBJ ﾊﾟﾚｯﾄ
//======================================================================
#define	EvObjPalWorkSet(d,n) PaletteWorkSet(d,PA_OBJ0+((u16)n<<4),32);
static u8 evobj_palset( PalData * );					// ﾊﾟﾚｯﾄｾｯﾄ

//------------------------------------------
//	ﾊﾟﾚｯﾄﾏﾈｰｼﾞｬ初期化
//------------------------------------------
void EvObjPalManInit( void )
{
	ObjPalManInit();
	ObjPalManStart = EVOBJ_PALMAN_START_NO;
}

//------------------------------------------
//	ﾊﾟﾚｯﾄ登録 単発
//	In:		col		; ﾊﾟﾚｯﾄ ID
//------------------------------------------
void EvObjPalSet( u16 id )
{
	u16	tbl_no;

	tbl_no = EvObjPalTblSeek( id );
	
	if( tbl_no == EVOBJ_PALEND )
	{
		return;
	}

	evobj_palset( (PalData *)&EvObjPalTbl[tbl_no] );
}

//------------------------------------------
//	ﾊﾟﾚｯﾄ登録　複数
//	In:		col		; ﾊﾟﾚｯﾄ ID 配列
//------------------------------------------
void EvObjPalSets( u16 *data )
{
	u8	i;
	
	for( i = 0; data[i] != EVOBJ_PALEND; EvObjPalSet(data[i]), i++ );
}

//------------------------------------------
//	ﾊﾟﾚｯﾄﾜｰｸｾｯﾄ
//	In:		pal			; 登録ﾊﾟﾚｯﾄﾃﾞｰﾀ
//	Out:	u8			; 登録ﾊﾟﾚｯﾄﾅﾝﾊﾞ
//						; 0xff = Error
//------------------------------------------
static u8 evobj_palset( PalData *pal )
{
	if( ObjPalNumGet( pal->reg_num ) != 0xff )
	{
		return( 0xff );										// 登録済み
	}
	
	return( ObjPalSet(pal) );
}

//------------------------------------------
//	映り込みﾊﾟﾚｯﾄNoﾃｰﾌﾞﾙ
//------------------------------------------
const u8 EvObjRefPalNoTbl[16] =
{
	MINE_REF_OBJ_PALNO,
	MINE_REF_OBJ_PALNO,
	OTHERS_REF_OBJ_PALNO_0,
	OTHERS_REF_OBJ_PALNO_1,
	OTHERS_REF_OBJ_PALNO_2,
	OTHERS_REF_OBJ_PALNO_3,
	OTHERS_REF_OBJ_PALNO_0,
	OTHERS_REF_OBJ_PALNO_1,
	OTHERS_REF_OBJ_PALNO_2,
	OTHERS_REF_OBJ_PALNO_3,
	SP_REF_OBJ_PALNO,
	SP_REF_OBJ_PALNO,
	0,
	0,
	0,
	0,
};

//------------------------------------------
//	常駐ﾊﾟﾚｯﾄｾｯﾄ
//	In:		id			; ﾊﾟﾚｯﾄID
//			palno		; ﾊﾟﾚｯﾄNo
//------------------------------------------
void EvObjStayPalSet( u16 id, u8 palno )
{
	u8 id_pos;

	id_pos = EvObjPalTblSeek( id );

	if( id_pos == EVOBJ_PALEND )						// 該当無し
	{
		return;
	}

	EvObjPalWorkSet( EvObjPalTbl[id_pos].pal_data, palno );
}

//------------------------------------------
//	常駐ﾊﾟﾚｯﾄ複数ｾｯﾄ
//------------------------------------------
void EvObjStayPalSets( const u16 *id, u8 s, u8 e )
{
	for( ; s < e; EvObjStayPalSet(*id,s), id++, s++ );
}

//------------------------------------------
//	ﾊﾟﾚｯﾄﾃｰﾌﾞﾙｼｰｸ
//------------------------------------------
u8 EvObjPalTblSeek( u16 id )
{
	u8 i;

	for( i = 0; EvObjPalTbl[i].reg_num != EVOBJ_PALEND; i++ )
	{
		if( EvObjPalTbl[i].reg_num == id )
		{
			return( i );
		}
	}
	
	return( EVOBJ_PALEND );
}

//------------------------------------------
//	主人公ﾊﾟﾚｯﾄｾｯﾄ
//------------------------------------------
void EvObjHeroPalSet( u16 id, u8 pos )
{
	u8 i;
	
	EvObjStayPalSet( id, pos );

	for( i = 0; EvObjHeroPalStTbl[i].id != EVOBJ_PALEND; i++ )
	{
		if( EvObjHeroPalStTbl[i].id == id )
		{
			EvObjStayPalSet( EvObjHeroPalStTbl[i].com_id[EvObjColorMode], EvObjRefPalNo(pos) );
			return;
		}
	}
}

//------------------------------------------
//	特殊ﾊﾟﾚｯﾄｾｯﾄ
//------------------------------------------
void EvObjSpPalSet( u16 id, u8 pos )
{
	u8	i;
	
	EvObjSpPalID = id;									// 現特殊ﾊﾟﾚｯﾄ
	EvObjStayPalSet( id, pos );							// 通常ﾊﾟﾚｯﾄｾｯﾄ

	for( i = 0; EvObjSpPalStTbl[i].id != EVOBJ_PALEND; i++ )
	{
		if( EvObjSpPalStTbl[i].id == id )				// 映りこみﾊﾟﾚｯﾄｾｯﾄ
		{
			EvObjStayPalSet( EvObjSpPalStTbl[i].com_id[EvObjColorMode], EvObjRefPalNo(pos) );
			return;
		}
	}
}

//======================================================================
//		ﾌｨｰﾙﾄﾞOBJ ﾜｰｸ 移動,座標処理
//======================================================================
//------------------------------------------
//	座標移動,更新
//	In:		ev		; ﾜｰｸ
//			dx,dy	; 座標増減分
//------------------------------------------
void EvObjPosMove( EventOBJ *ev, s16 dx, s16 dy )
{
	ev->old_gx = ev->gx;
	ev->old_gy = ev->gy;
	ev->gx += dx;
	ev->gy += dy;
}

//------------------------------------------
//	座標更新
//	In:		ev		; ﾜｰｸ
//			x,y		; 新規座標
//------------------------------------------
void EvObjPosChg( EventOBJ *ev, s16 x, s16 y )
{
	ev->old_gx = ev->gx;
	ev->old_gy = ev->gy;
	ev->gx = x;
	ev->gy = y;
}

//------------------------------------------
//	座標初期化
//------------------------------------------
void EvObjPosInit( EventOBJ *ev, s16 x, s16 y )
{
	ev->old_gx = x;
	ev->old_gy = y;
	ev->gx = x;
	ev->gy = y;
}

//------------------------------------------
//	座標更新, ﾏｯﾌﾟ座標, 表示座標
//	In:		ev		; ﾜｰｸ
//			x,y		; 指定ﾏｯﾌﾟ座標
//------------------------------------------
void EvObjPosAllChg( EventOBJ *ev, s16 x, s16 y )
{
	actWork *act;
	SXYObjHead *objst;

	act = &ActWork[ev->actno];
	objst = SxyObjHeadGet( ev->obj_code );

	EvObjPosInit( ev, x, y );
	MapCellSizePosDiff( ev->gx, ev->gy, &act->x, &act->y );
	act->cx = -(objst->x_size >> 1);
	act->cy = -(objst->y_size >> 1);
	act->x += 8;										// 中心補正
	act->y += 16 + act->cy;								// 足場から

	evobj_rec_work_init( ev );
	
	if( ev->scr_main_sw )
	{
		FldScrollPosInit();
	}
}

//------------------------------------------
//	引数ID 座標更新, ﾏｯﾌﾟ座標, 表示座標
//	In:		id,map,div	; OBJ ID, MAP ID, DIV ID
//			x,y			; 指定ﾏｯﾌﾟ座標
//------------------------------------------
void EvObjPosAllChgId( u8 id, u8 map, u8 div, s16 x, s16 y )
{
	u8 pos;
	
	if( EvObjIdPosGet(id,map,div,&pos) )
	{
		return;
	}
	
	x += MAP_LEFT_MARGIN;
	y += MAP_UP_MARGIN;

	EvObjPosAllChg( &EvObj[pos], x, y );
}

//------------------------------------------
//	現座標で更新
//	In:		ev		; ﾜｰｸ
//------------------------------------------
void EvObjPosRenew( EventOBJ *ev )
{
	EvObjPosChg( ev, ev->gx, ev->gy );
}

//------------------------------------------
//	ﾏｯﾌﾟ切り替わり座標修正
//------------------------------------------
void EvObjMapChgCont( void )
{
	u8	i;
	s16	dx,dy;

	if( MapChange.chg_flag != TRUE )
	{
		return;											// 切り替わり無し
	}

	dx = MapChange.diffx;								// 修正値
	dy = MapChange.diffy;

	for( i = 0; i < EV_OBJ_MAX; i++ )
	{
		if( EvObj[i].sw )
		{
			EvObj[i].init_x -= dx;
			EvObj[i].init_y -= dy;
			EvObj[i].gx -= dx;
			EvObj[i].gy -= dy;
			EvObj[i].old_gx -= dx;
			EvObj[i].old_gy -= dy;
		}
	}
}

//------------------------------------------
//	指定座標OBJ判定
//	In:		px,py		; ﾏｯﾌﾟ座標
//			height		; 高さ
//	Out:	u8			; ﾜｰｸﾅﾝﾊﾞ
//						; EV_OBJ_MAX = 存在しない
//------------------------------------------
static u8 ev_height_hitchk( EventOBJ *, u8 );

u8 EvObjHitCheck(u16 px, u16 py, u8 height )
{
	u8	i;
	
	for( i = 0; i < EV_OBJ_MAX; i++ )
	{
		if( EvObj[i].sw && EvObj[i].gx == px && EvObj[i].gy == py)
		{
			if( ev_height_hitchk(&EvObj[i],height) )
			{
				return( i );
			}
		}
	}

	return( EV_OBJ_MAX );
}

static u8 ev_height_hitchk( EventOBJ *ev, u8 h )
{
	if( ev->height == MAP_HEIGHT_FREE || h == MAP_HEIGHT_FREE )
	{
		return( 1 );
	}

	if( ev->height == h )
	{
		return( 1 );
	}

	return( 0 );
}

//======================================================================
//		ｽｸﾛｰﾙ
//======================================================================
static void ScrollActMove( actWork * );

static void	scr_init( actWork * );
static void	scr_ctrl( actWork * );
static void scr_stop( actWork * );

enum
{
	SCR_INIT = 0,
	SCR_CTRL,
	SCR_STOP,
};

//------------------------------------------
//	ｲﾍﾞﾝﾄ OBJ ﾒｲﾝｺﾝﾄﾛｰﾙ
//------------------------------------------
void EvObjMainControl( s16 dx, s16 dy )
{
	EvObjMapChgCont();									// マップ切替時の座標修正
	EvObjAddControl(dx,dy);								// 移動時の登録
	EvObjDelControl();									// 移動時の削除
}

//------------------------------------------
//	ｽｸﾛｰﾙｱｸﾀｰﾍｯﾀﾞ
//------------------------------------------
static const actHeader ScrTaskActH =
{
	0,
	ACT_OAMPAL,
	&DummyActOam,
	DummyActAnmTbl,
	ACT_NTRANS,
	DummyActAffTbl,
	ScrollActMove,
};

//------------------------------------------
//	ｱｸﾀｰ同期ｽｸﾛｰﾙﾀｽｸｾｯﾄ
//	In:	actno	; 同期させるｱｸﾀｰﾜｰｸ No
//------------------------------------------
u8 SetScrollTaskAct( u8 actno )
{
	u8	no;

	no = AddActor( &ScrTaskActH, 0, 0, 4 );
	ActWork[no].banish = 1;
	ActWork[no].work[0] = actno;

	return( no );
}

//------------------------------------------
//	指定ｱｸﾀｰとの同期処理
//	work0	= ｱｸﾄﾅﾝﾊﾞ
//	work1	= ｽｲｯﾁ
//	work2,3	= x,y
//------------------------------------------
static void ScrollActMove( actWork *act )
{
	void (*tbl[])(actWork*) =
		{ scr_init, scr_ctrl, scr_stop };

	tbl[act->work[1]]( act );
}

static void scr_init( actWork *act )
{
	act->x = ActWork[act->work[0]].x;						// 指定ｱｸﾀｰ座標取得
	act->y = ActWork[act->work[0]].y;
	act->banish = 1;
	act->work[1] = SCR_CTRL;

	scr_ctrl( act );
}

static void scr_ctrl( actWork *act )
{
	s16	x,y;

	x = ActWork[act->work[0]].x;
	y = ActWork[act->work[0]].y;

	act->work[2] = x - act->x;								// 過去座標との差
	act->work[3] = y - act->y;

	act->x = x;
	act->y = y;
}

static void scr_stop( actWork *act )
{
	act->x = ActWork[act->work[0]].x;
	act->y = ActWork[act->work[0]].y;
	act->work[2] = 0;
	act->work[3] = 0;
}

//------------------------------------------
//	ｽｸﾛｰﾙｱｸﾀｰｱﾄﾞﾚｽ
//------------------------------------------
static actWork * scroll_act_adrs( void )
{
	u8 i;

	for( i = 0; i < ACT_MAX; i++ )
	{
		if( ActWork[i].act_sw && ActWork[i].move == ScrollActMove )
		{
			return( &ActWork[i] );
		}
	}
	
	return( 0 );
}

//------------------------------------------
//	ｽｸﾛｰﾙ座標初期化
//------------------------------------------
void FldScrollPosInit( void )
{
	actWork *act;
	
	act = scroll_act_adrs();

	if( act == 0 )
	{
		return;
	}

	act->work[1] = SCR_INIT;
	act->move( act );
}

//------------------------------------------
//	ｽｸﾛｰﾙｱｸﾀｰ変更
//------------------------------------------
void FldScrollActChg( u8 no )
{
	actWork *act;

	act = scroll_act_adrs();
	
	if( act == 0 )
	{
		return;
	}
	
	act->work[0] = no;
	FldScrollPosInit();
}

//------------------------------------------
//	ｽｸﾛｰﾙｱｸﾀｰﾅﾝﾊﾞ
//------------------------------------------
u8 FldScrollActNo( void )
{
	actWork *act;
	
	act = scroll_act_adrs();
	
	if( act == 0 )
	{
		return( ACT_MAX );
	}
	
	return( act->work[0] );
}

//------------------------------------------
//	ｽｸﾛｰﾙｽﾄｯﾌﾟ
//------------------------------------------
void FldScrollActStop( void )
{
	actWork *act;
	
	act = scroll_act_adrs();
	act->work[1] = SCR_STOP;
}
	
//======================================================================
//		ｱｸﾀｰﾜｰｸ
//======================================================================
//------------------------------------------
//	ｺﾋﾟｰｱｸﾀ-配置優先0
//	In:		act			; ｺﾋﾟｰ元ｱｸﾀｰ
//			x,y			; 座標
//			pri			; ｱｸﾀｰﾌﾟﾗｲｵﾘﾃｨ
//	Out:	u8			; ﾜｰｸﾅﾝﾊﾞ
//						; ACT_MAX = Error
//------------------------------------------
u8 CopyActPri0( actWork *act, s16 x, s16 y, u8 pri )
{
	u8	i;
	actWork *act_p;
	
	for( i = 0; i < ACT_MAX; i++ )
	{
		if( ActWork[i].act_sw == 0 )
		{
			act_p = &ActWork[i];
	
			*act_p = *act;									// 全代入
			act_p->x = x;
			act_p->y = y;
			act_p->pri = pri;
			break;
		}
	}

	return( i );
}

//------------------------------------------
//	ｺﾋﾟｰｱｸﾀ-配置優先1
//------------------------------------------
u8 CopyActPri1( actWork *act, s16 x, s16 y, u8 pri )
{
	s16	i;
	actWork *act_p;
	
	for( i = ACT_MAX - 1; i > -1; i-- )
	{
		if( ActWork[i].act_sw == 0 )
		{
			act_p = &ActWork[i];
	
			*act_p = *act;									// 全代入
			act_p->x = x;
			act_p->y = y;
			act_p->pri = pri;
			return( i );
		}
	}
	
	return( ACT_MAX );
}

//======================================================================
//		方向
//======================================================================
//------------------------------------------
//	方向ｾｯﾄ
//	In:		ev			; ｾｯﾄｲﾍﾞﾝﾄOBJ
//			site		; 方向
//------------------------------------------
void EvObjSiteSet( EventOBJ *ev, u8 site )
{
	ev->old_site = ev->site;

	if( ev->site_pause_sw == 0 )
	{
		ev->site = site;
	}
	
	ev->mv_site = site;
}

//======================================================================
//		SXY OBJ ﾃﾞｰﾀ 取得
//======================================================================
static const evObjData *SxyObjAdrsGet( u8 obj, const evObjData *sxy, u8 Max );

//------------------------------------------
//	ｲﾍﾞﾝﾄﾗﾍﾞﾙ取得
//	In:		id			; OBJ ID
//	Out:	VM_CODE		; ｲﾍﾞﾝﾄｺｰﾄﾞｱﾄﾞﾚｽ
//------------------------------------------
const VM_CODE * EvObjEvLabelGet( u8 obj, u8 map, u8 div )
{
	evObjData *sxy;
	
	sxy = (evObjData *)SxyObjDataGet( obj, map, div );
	
	return( sxy->ev_label );
}

//------------------------------------------
//	ｲﾍﾞﾝﾄﾗﾍﾞﾙ取得
//	In:		no			; OBJ ﾜｰｸﾅﾝﾊﾞ
//	Out:	VM_CODE		; ｲﾍﾞﾝﾄｺｰﾄﾞｱﾄﾞﾚｽ
//------------------------------------------
const VM_CODE * EvObjNoEvLabelGet( u8 no )
{
	return( EvObjEvLabelGet(EvObj[no].objID,EvObj[no].mapID,EvObj[no].divID) );
}

//------------------------------------------
//	ｲﾍﾞﾝﾄﾌﾗｸﾞ取得
//	In:		obj			; OBJ ID
//			map			; MAP ID
//			div			; DIV ID
//	Out:	u16			; ｲﾍﾞﾝﾄﾌﾗｸﾞNo
//------------------------------------------
u16	EvObjEvFlagGet( u8 obj, u8 map, u8 div )
{
	evObjData *sxy;
	
	sxy = (evObjData *)SxyObjDataGet( obj, map, div );
	
	return( sxy->ev_flag );
}

//------------------------------------------
//	ｲﾍﾞﾝﾄﾌﾗｸﾞ取得
//	In:		no			; OBJ ﾜｰｸﾅﾝﾊﾞ
//	Out:	u16			; ｲﾍﾞﾝﾄﾌﾗｸﾞﾅﾝﾊﾞ
//------------------------------------------
u16	EvObjNoEvFlagGet( u8 no )
{
	return( EvObjEvFlagGet(EvObj[no].objID,EvObj[no].mapID,EvObj[no].divID) );
}

//------------------------------------------
//	ｲﾍﾞﾝﾄﾀｲﾌﾟ取得
//	In:		obj			; OBJ ID
//			map			; MAP ID
//			div			; DIV ID
//	Out:	u8			; ｲﾍﾞﾝﾄﾀｲﾌﾟ
//------------------------------------------
u8 EvObjEvTypeGet( u8 obj, u8 map, u8 div )
{
	u8	no;

	if( EvObjIdPosGet(obj,map,div,&no) )
	{
		return( 0xff );
	}

	return( EvObj[no].ev_type );
}

//------------------------------------------
//	ｲﾍﾞﾝﾄﾀｲﾌﾟ取得
//	In:		no			; OBJ ﾜｰｸﾅﾝﾊﾞ
//	Out:	u8			; ｲﾍﾞﾝﾄﾀｲﾌﾟ
//------------------------------------------
u8 EvObjNoEvTypeGet( u8 no )
{
	return( EvObj[no].ev_type );
}

//------------------------------------------
//	ｲﾍﾞﾝﾄﾜｰｸ取得
//	In:		obj			; OBJ ID
//			map			; MAP ID
//			div			; DIV ID
//	Out:	u8			; ｲﾍﾞﾝﾄﾜｰｸ
//------------------------------------------
u8 EvObjEvWorkGet( u8 obj, u8 map, u8 div )
{
	u8	no;

	if( EvObjIdPosGet(obj,map,div,&no) )
	{
		return( 0xff );
	}
	
	return( EvObj[no].ev_work );
}

//------------------------------------------
//	ｲﾍﾞﾝﾄﾜｰｸ取得
//------------------------------------------
u8 EvObjNoEvWorkGet( u8 no )
{
	return( EvObj[no].ev_work );
}

//------------------------------------------
//	SXY OBJ ﾃﾞｰﾀ
//-----------------------------------------
static const evObjData * SxyObjDataGet( u8 obj_id, u8 map_id, u8 div_id )
{
	const MapTotalData *map_data;
	
	if( Fld.MapID.map_id == map_id && Fld.MapID.div_id == div_id )
	{
		return( SxyObjAdrsGet(obj_id,(const evObjData*)Fld.SvSxyObj,NowMap.Sxy->ObjMax) );
	}

	map_data = GetTotalMapData( div_id, map_id );

	return( SxyObjAdrsGet(obj_id,map_data->Sxy->ObjData,map_data->Sxy->ObjMax) );
}

//------------------------------------------
//	SXY OBJ ｱﾄﾞﾚｽ
//------------------------------------------
static const evObjData * SxyObjAdrsGet( u8 obj_id, const evObjData *sxy, u8 max )
{
	u8 i;

	for( i = 0; i < max; i++ )
	{
		if( sxy[i].id == obj_id )
		{
			return( &(sxy[i]) );
		}
	}

	return( 0 );
}

//======================================================================
//		SXY OBJ ﾃﾞｰﾀ 変更
//		2001.12.21 by tama
//======================================================================
static evObjData * EvObjSxyDataAdrsGet( EventOBJ * obj )
{
	int i;

	if( obj->mapID != Fld.MapID.map_id
			|| obj->divID != Fld.MapID.div_id ) return NULL;//このマップのOBJ以外無駄

	for( i=0; i< SXY_OBJ_MAX; i++ ){
		if( obj->objID == Fld.SvSxyObj[i].id )return &Fld.SvSxyObj[i];
	}
	return NULL;
}

void EvObjSxyPosChange( EventOBJ * obj )
{
	evObjData * sxy;

	sxy = EvObjSxyDataAdrsGet( obj );
	if( sxy == NULL ) return;

	sxy->pos_x = obj->gx - MAP_LEFT_MARGIN;			// ﾏｯﾌﾟ座標修正
	sxy->pos_y = obj->gy - MAP_UP_MARGIN;
}

void EvObjSxyMvCodeChange( EventOBJ * obj, u8 code )
{
	evObjData * sxy;

	sxy = EvObjSxyDataAdrsGet( obj );
	if( sxy == NULL ) return;

	sxy->site = code;
}

void EvObjSxyIdPosChange( u8 obj_id, u8 map_id, u8 div_id )
{
	u8 id;

	if( EvObjIdPosGet( obj_id, map_id, div_id, &id ) )return;
	EvObjSxyPosChange( &EvObj[id] );
}

//======================================================================
//		αﾌﾞﾚﾝﾄﾞ
//======================================================================
//----
#if 0
//----
// ﾌﾞﾚﾝﾄﾞｺﾝﾄﾛｰﾙ構造体 agbtypes.h
typedef struct {
    u16 Pixel_1st_Bg0_On:1;								// 1stﾋﾟｸｾﾙ
    u16 Pixel_1st_Bg1_On:1;
    u16 Pixel_1st_Bg2_On:1;
    u16 Pixel_1st_Bg3_On:1;
    u16 Pixel_1st_Obj_On:1;
    u16 Pixel_1st_Bd_On:1;
    u16 BlendMode:2;									// ﾌﾞﾚﾝﾄﾞﾓｰﾄﾞ
    u16 Pixel_2nd_Bg0_On:1;								// 2ndﾋﾟｸｾﾙ
    u16 Pixel_2nd_Bg1_On:1;
    u16 Pixel_2nd_Bg2_On:1;
    u16 Pixel_2nd_Bg3_On:1;
    u16 Pixel_2nd_Obj_On:1;
    u16 Pixel_2nd_Bd_On:1;
    u16 Dummy_15_14:2;
    u16 Value_A:5;										// ﾊﾟﾗﾒﾀA
    u16 Dummy_23_21:3;
    u16 Value_B:5;										// ﾊﾟﾗﾒﾀB
    u16 Dummy_31_29:3;
    u16 Value_Y:5;										// ﾊﾟﾗﾒﾀY
    u16 Dummy_39_37:3;
} BlendCnt;

typedef  vl BlendCnt    vBlendCnt;

#define ST_BLD_NORMAL_MODE	0							// ﾉｰﾏﾙ
#define ST_BLD_A_BLEND_MODE	1							// 半透明
#define ST_BLD_UP_MODE		2							// 輝度Up
#define ST_BLD_DOWN_MODE	3							// 輝度Down
//----
#endif
//----

//------------------------------------------
//	半透明ﾚｼﾞｽﾀｾｯﾄ
//------------------------------------------
#if 0
void EvAlpBlendSet( void )
{
	*(vu16*)REG_BLDCNT =
// BG3 半透明OBJのみ反映
		BLD_BG3_2ND | BLD_OBJ_2ND | BLD_A_BLEND_MODE;
// BG3 全 OBJ 反映
//		BLD_BG3_2ND | BLD_OBJ_2ND | BLD_OBJ_1ST | BLD_A_BLEND_MODE;
	
	*(vu16*)REG_BLDALPHA = 0x080c;						// 大体の値 映り込みには重畳
}
#endif

//======================================================================
//		ﾌｨｰﾙﾄﾞOBJ ｸﾞﾗﾌｨｯｸ関連
//======================================================================
//------------------------------------------
//	OBJ ｸﾞﾗﾌｨｯｸ関連初期化
//	In:		pal_mode		; ﾊﾟﾚｯﾄﾓｰﾄﾞ
//------------------------------------------
void EvObjGraphicInit( u8 pal_mode )
{
	EvObjPalManInit();									// 初期化
	EvObjSpPalID = EVOBJ_PALEND;						// 特殊ﾊﾟﾚｯﾄ
	EvObjColorMode = pal_mode;							// 現在のﾊﾟﾚｯﾄﾓｰﾄﾞ
	EvObjStayPalSets( EvObjStayPalTbl[EvObjColorMode], 0, 10 );
}

//------------------------------------------
//	ﾊﾟﾚｯﾄNo -> 現在ﾊﾟﾚｯﾄID
//------------------------------------------
u16 EvObjPalIdGet( u8 palno )
{
	u8 i;

	if( palno < SP_OBJ_PALNO )							// 常駐
	{
		return( EvObjStayPalTbl[EvObjColorMode][palno] );
	}

	for( i = 0; EvObjSpPalStTbl[i].id != EVOBJ_PALEND; i++ )
	{
		if( EvObjSpPalStTbl[i].id == EvObjSpPalID )
		{
			return( EvObjSpPalStTbl[i].com_id[EvObjColorMode] );
		}
	}

	return( EVOBJ_PALEND );
}

