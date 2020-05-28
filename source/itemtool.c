//=========================================================================================
//					bag,fd_shop,base,f_pmlistなどで使用している便利な関数
//									2002/01/09 by nakahiro
//=========================================================================================
#include "common.h"
#include "intr.h"
#include "task.h"
#include "menu.h"
#include "actor.h"
#include "actanm.h"
#include "palanm.h"
#include "bag.h"
#include "config.h"
#include "mus_tool.h"
#include "fld_main.h"
#include "item.h"
#include "seed.h"
#include "map.h"
#include "itemtool.h"
#include "itemtool.dat"

#include "../evdata/maparray.h"

#include "../data/itemsym.h"

//=========================================================================================
//										シンボル
//=========================================================================================
#define MSGWINX			3		// メッセージウィンドウX座標
#define MSGWINY			15		// メッセージウィンドウY座標
#define MSGWINH			24		// メッセージウィンドウ幅
#define MSGWINV			4		// メッセージウィンドウ高さ

extern u8  pokemon_sio_flag;

static SELECT_ITEM	select_tool = { NULL, NULL };
static void (*EndMsg)(u8);				// 送りメッセージ終了処理

//---------------------------------------
//	BGデータ初期化
//---------------------------------------
void BGDataInit(void)
{
	memset( BG1_data, 0, sizeof(u16)*1024 );
	memset( BG2_data, 0, sizeof(u16)*1024 );
	memset( BG3_data, 0, sizeof(u16)*1024 );
}

//---------------------------------------
//	送りメッセージ
//---------------------------------------
//表示
static void DrawTalkMsg( const u8 *msg, u16 back_no )
{
	NMenuTalkWinWrite();
	if( back_no != 0 )
		ItemBGBoxWrite( BG1_data, MSGWINX, MSGWINY, MSGWINH, MSGWINV, back_no );
	NMenuTalkMsgSetEasy( msg );
}
//終了処理
static void EndDrawTalkMsg( u8 id )
{
	if( NMenuTalkMsgPut() == 1 )	EndMsg( id );
}
//セット
void SetTalkMsg( u8 id, const u8 *msg, void (*func), u16 back_no )
{
	DrawTalkMsg( msg, back_no );
	EndMsg = func;
	TaskTable[id].TaskAdrs = EndDrawTalkMsg;
}

//---------------------------------------
//	はい・いいえ処理
//---------------------------------------
static void SelectToolYesNoTask( u8 id )
{
	switch( YesNoSelectMain() ){
	case CURSOR_YES_VALUE:
		SePlay(SE_SELECT);
		select_tool.set_func(id);
		break;

	case CURSOR_CANCEL_VALUE:
	case CURSOR_NO_VALUE:
		SePlay(SE_SELECT);
		select_tool.cancel_func(id);
	}
}

void SelectToolInit( u8 id, const SELECT_ITEM * s )
{
	select_tool = *s;
	TaskTable[id].TaskAdrs = SelectToolYesNoTask;
}

//---------------------------------------
//	指定パレットでフォント表示
//---------------------------------------
extern TALK_WIN * pWin;

void PalChangeMojiPut( const u8 * str, u8 pal, u8 x, u8 y )
{
	u8	pal_msg[] = { CTRL_,C_PAL_,0,EOM_ };

	if( pal != 0xff ){
		pal_msg[2] = pal;
		PM_strcpy( MsgExpandBuffer, pal_msg );
		PM_strcat( MsgExpandBuffer, str );
		pal_msg[2] = pWin->palette;
		PM_strcat( MsgExpandBuffer, pal_msg );
	}else
		PM_strcpy( MsgExpandBuffer, str );

	NMenuMsgWrite( MsgExpandBuffer, x, y );
}

//---------------------------------------
//	指定パレットで数値表示
//---------------------------------------
void PalChangeNumPut( u32 no, u8 pal, u8 keta, u8 type, u8 x, u8 y )
{
	PM_NumMsgSet( StrTempBuffer0, no, type, keta );
	if( pal != 0xff )	PalChangeMojiPut( (const u8 *)StrTempBuffer0, pal, x, y );
	else				NMenuMsgWrite( StrTempBuffer0, x, y );
}

//---------------------------------------
//	指定パレットのカーソルを表示
//---------------------------------------
void PalChangeCursorPut( u8 x, u8 y, u8 pal )
{
	u8 cur[] = { cursor_,EOM_ };

	PalChangeMojiPut( (const u8 *)cur, pal, x, y );
}

//---------------------------------------
//	LR Mode Key Check
//---------------------------------------
u8 LR_TrgCheck(void)
{
	if( MyData.key_config == CNT_MD_LR ){
		if( sys.Trg & L_BUTTON )	return	LRM_L;
		if( sys.Trg & R_BUTTON )	return	LRM_R;
	}
	return	NOT_LR_MODE;
}

u8 LR_RepeatCheck(void)
{
	if( MyData.key_config == CNT_MD_LR ){
		if( sys.Repeat & L_BUTTON )	return	LRM_L;
		if( sys.Repeat & R_BUTTON )	return	LRM_R;
	}
	return	NOT_LR_MODE;
}

/*
//---------------------------------------
//	RAM木の実名前作成
//---------------------------------------
void MakeRAMKinomiName( u8 * str )
{
	const SEED_PARAM * p;

	p = GetSeedParam( ITEM_NAZONOMI - SEED_START_NO );
	PM_strcpy( str, p->name );
	PM_strcat( str, str_nomi );
}
*/


//---------------------------------------
//	交換部屋での「ナゾのみ」チェック
//---------------------------------------
u8 ChangeRoomRAMKinomiCheck( u16 item )
{
	if( item == ITEM_NAZONOMI &&
		Fld.MapID.div_id == SP && Fld.MapID.map_id == SP_PC04 )
	{
		return	FALSE;
	}
	return	TRUE;
}

//---------------------------------------
//	通信時メールを持てないチェック
//---------------------------------------
u8 SioMailNotCheck( u16 item )
{
	if( IsFieldCommMode() == TRUE && MailItemNoCheck( item ) == 1 )
		return	FALSE;
	return	TRUE;
}

//---------------------------------------
//	通信チェック
//	TRUE = 通信中　FALSE = 通信外
//---------------------------------------
u8 ItemToolSioCheck(void)
{
	if( IsFieldCommMode() == TRUE || pokemon_sio_flag == 1 )
		return	TRUE;
	return	FALSE;
}


//---------------------------------------
//	レジスタ初期化
//---------------------------------------
void ItemToolAGBRegInit(void)
{
    *(vu16 *)REG_DISPCNT	= 0;
    *(vu16 *)REG_BG3CNT		= 0;
    *(vu16 *)REG_BG2CNT		= 0;
    *(vu16 *)REG_BG1CNT		= 0;
    *(vu16 *)REG_BG0CNT		= 0;

	*(vu16 *)REG_BG3HOFS	= 0;
	*(vu16 *)REG_BG3VOFS	= 0;
	*(vu16 *)REG_BG2HOFS	= 0;
	*(vu16 *)REG_BG2VOFS	= 0;
    *(vu16 *)REG_BG1HOFS	= 0;
    *(vu16 *)REG_BG1VOFS	= 0;
    *(vu16 *)REG_BG0HOFS	= 0;
    *(vu16 *)REG_BG0VOFS	= 0;

	DIV_DMACLEAR( 3, 0, VRAM, VRAM_SIZE, 16 );	// VRAM初期化
	DIV_DMACLEAR( 3, 0, OAM,  OAM_SIZE,  32 );	// OAM初期化
	DIV_DMACLEAR( 3, 0, PLTT, PLTT_SIZE, 16 );	// ﾊﾟﾚｯﾄ初期化
}

//---------------------------------------
//	HVBlank初期化
//---------------------------------------
void InitHVBlankFunc(void)
{
	SetVBlankFunc( NULL );	// 割込み関数設定(VBLANK)
	SetHBlankFunc( NULL );	// 割込み関数設定(HBLANK)
}

//=======================================================================================
// アクターワーク
enum {
	WK_X_MOVE = 0,
	WK_XM_CNT,
	WK_Y_MOVE,
	WK_YM_CNT,
};

//---------------------------------------
//	アクター番号初期化
//---------------------------------------
void ScrActInit(void)
{
	u8	i;

	for( i=0; i<=MARK_ACT_R_CURSOR; i++ )
		ScrActNo[i] = 0xff;

	ObjPalRegNumDel( MARK_OBJ_PAL );
	ObjPalSet( (PalData *)&MarkPal );
}
void MarkActInit( u8 * act, u8 max )
{
	u8	i;

	for( i=0; i<max; i++ )
		act[i] = 0xff;
}

//---------------------------------------
//	マークアクターセット
//---------------------------------------
void AddMarkActor( u8 id, u8 * act, s16 x, s16 y )
{
	if( id >= MARK_ACT_MAX )	return;

	if( *act == 0xff )
		*act = AddActor( &ActMarkHeader, x, y, 0 );

	id -= MARK_ACT_MARK1;

	ActAnmChg( &ActWork[ *act ], id );
}

//---------------------------------------
//	マークアクター削除
//---------------------------------------
void DelMarkActor( u8 * act )
{
	if( *act != 0xff ){
		DelActor( &ActWork[ *act ] );
		*act = 0xff;
	}
}
void DelMarkActorAll( u8 * act, u8 max )
{
	u8	i;

	for( i=0; i<8; i++ )
		DelMarkActor( &act[i] );
}

//---------------------------------------
//	スクロールカーソルアクターセット
//---------------------------------------
void AddScrCurActor( u8 id, s16 x, s16 y )
{
	if( id > MARK_ACT_R_CURSOR )	return;

	switch( id ){
	case MARK_ACT_U_CURSOR:
		if( ScrActNo[id] == 0xff ){
			ScrActNo[id] = AddActor( &ActHScrHeader, x, y, 0 );
			ActWork[ ScrActNo[id] ].work[WK_Y_MOVE] = -1;
			if( ScrActNo[ MARK_ACT_D_CURSOR ] != 0xff ){
				ActWork[ ScrActNo[id] ].dy = ActWork[ ScrActNo[ MARK_ACT_D_CURSOR ] ].dy * (-1);
				ActWork[ ScrActNo[id] ].work[ WK_YM_CNT ] = ActWork[ ScrActNo[ MARK_ACT_D_CURSOR ] ].work[ WK_YM_CNT ];
			}else	ActWork[ ScrActNo[id] ].work[ WK_YM_CNT ] = 0;
		}
		break;
	case MARK_ACT_D_CURSOR:
		if( ScrActNo[id] == 0xff ){
			ScrActNo[id] = AddActor( &ActHScrHeader, x, y, 0 );
			ActWork[ ScrActNo[id] ].work[WK_Y_MOVE] = 1;
			if( ScrActNo[ MARK_ACT_U_CURSOR ] != 0xff ){
				ActWork[ ScrActNo[id] ].dy = ActWork[ ScrActNo[ MARK_ACT_U_CURSOR ] ].dy * (-1);
				ActWork[ ScrActNo[id] ].work[ WK_YM_CNT ] = ActWork[ ScrActNo[ MARK_ACT_U_CURSOR ] ].work[ WK_YM_CNT ];
			}else	ActWork[ ScrActNo[id] ].work[ WK_YM_CNT ] = 0;
		}
		break;
	case MARK_ACT_L_CURSOR:
		if( ScrActNo[id] == 0xff ){
			ScrActNo[id] = AddActor( &ActVScrHeader, x, y, 0 );
			ActWork[ ScrActNo[id] ].work[WK_X_MOVE] = -1;
			if( ScrActNo[ MARK_ACT_R_CURSOR ] != 0xff ){
				ActWork[ ScrActNo[id] ].dx = ActWork[ ScrActNo[ MARK_ACT_R_CURSOR ] ].dx * (-1);
				ActWork[ ScrActNo[id] ].work[ WK_XM_CNT ] = ActWork[ ScrActNo[ MARK_ACT_R_CURSOR ] ].work[ WK_XM_CNT ];
			}else	ActWork[ ScrActNo[id] ].work[ WK_XM_CNT ] = 0;
		}
		break;
	case MARK_ACT_R_CURSOR:
		if( ScrActNo[id] == 0xff ){
			ScrActNo[id] = AddActor( &ActVScrHeader, x, y, 0 );
			ActWork[ ScrActNo[id] ].work[WK_X_MOVE] = 1;
			if( ScrActNo[ MARK_ACT_L_CURSOR ] != 0xff ){
				ActWork[ ScrActNo[id] ].dx = ActWork[ ScrActNo[ MARK_ACT_L_CURSOR ] ].dx * (-1);
				ActWork[ ScrActNo[id] ].work[ WK_XM_CNT ] = ActWork[ ScrActNo[ MARK_ACT_L_CURSOR ] ].work[ WK_XM_CNT ];
			}else	ActWork[ ScrActNo[id] ].work[ WK_XM_CNT ] = 0;
		}
	}

	ActAnmChg( &ActWork[ ScrActNo[id] ], ( id & 1 ) );
}

//---------------------------------------
//	スクロールカーソルアクター表示切替
//---------------------------------------
void BanishScrCurActor( u8 id, u8 flg )
{
	if( id > MARK_ACT_R_CURSOR )	return;

	if( ScrActNo[id] != 0xff )
		ActWork[ ScrActNo[id] ].banish = flg;
}

//---------------------------------------
//	スクロールカーソルアクター削除
//---------------------------------------
void DelScrCurActor( u8 id )
{
	if( id > MARK_ACT_R_CURSOR )	return;

	if( ScrActNo[id] != 0xff ){
		DelActor( &ActWork[ ScrActNo[id] ] );
		ScrActNo[id] = 0xff;
	}
}

//---------------------------------------
//	マークパレットセット
//---------------------------------------
void AddMarkPal(void)
{
	ObjPalSet( (PalData *)&MarkPal );
}

//---------------------------------------
//	マークパレット削除
//---------------------------------------
void DelMarkPal(void)
{
	ObjPalRegNumDel( MARK_OBJ_PAL );
}

//---------------------------------------
//	スクロールカーソルアニメ
//---------------------------------------
static void ScrCurActAnm( actWork * act )
{
	if( act->work[ WK_XM_CNT ] == 0 )
		act->dx += act->work[ WK_X_MOVE ];
	if( act->work[ WK_YM_CNT ] == 0 )
		act->dy += act->work[ WK_Y_MOVE ];

	act->work[ WK_XM_CNT ]++;
	act->work[ WK_YM_CNT ]++;

	if( act->work[ WK_XM_CNT ] >= 3 )	act->work[ WK_XM_CNT ] = 0;
	if( act->work[ WK_YM_CNT ] >= 3 )	act->work[ WK_YM_CNT ] = 0;

	if( act->dx == 8 || act->dx == -8 )
		act->dx = 0;
	if( act->dy == 8 || act->dy == -8 )
		act->dy = 0;
}
// アニメストップ
void ScrCurActAnmStop( u8 id )
{
	if( ScrActNo[id] == 0xff )		return;
	if( id > MARK_ACT_R_CURSOR )	return;

	ActWork[ ScrActNo[id] ].move = DummyActMove;
}
// アニメ再開
void ScrCurActAnmPlay( u8 id )
{
	if( ScrActNo[id] == 0xff )		return;
	if( id > MARK_ACT_R_CURSOR )	return;

	ActWork[ ScrActNo[id] ].move = ScrCurActAnm;
}
// アニメクリア
void ScrCurActAnmInit( u8 id )
{
	if( ScrActNo[id] == 0xff )		return;
	if( id > MARK_ACT_R_CURSOR )	return;

	ActWork[ ScrActNo[id] ].dx = 0;
	ActWork[ ScrActNo[id] ].dy = 0;
	ActWork[ ScrActNo[id] ].work[ WK_XM_CNT ] = 0;
	ActWork[ ScrActNo[id] ].work[ WK_YM_CNT ] = 0;

}
// アニメストップ＆クリア
void ScrCurActAnmStopInit( u8 id )
{
	ScrCurActAnmStop(id);
	ScrCurActAnmInit(id);
}

//---------------------------------------
//	スクロールカーソル表示優先
//---------------------------------------
void ScrCurActPrioritySet( u8 id, u8 pri )
{
	if( ScrActNo[id] == 0xff )		return;
	if( id > MARK_ACT_R_CURSOR )	return;

	ActWork[ ScrActNo[id] ].oamData.Priority = pri;
}
