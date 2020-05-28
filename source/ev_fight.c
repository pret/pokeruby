//=========================================================================
//	
//
//	スクリプト・イベントからの戦闘呼び出し制御
//
//
//	2001.10.22	GAME FREAK Inc.
//=========================================================================

#include "common.h"
#include "print.h"
#include "field.h"
#include "server.h"
#include "fight.h"
#include "fld_main.h"
#include "fld_task.h"
#include "fld_talk.h"
#include "task.h"
#include "poketool.h"
#include "ev_flag.h"
#include "script.h"
#include "fld_tool.h"
#include "sxytype.h"
#include "mus_tool.h"
#include "calctool.h"
#include "message.h"

#include "map.h"
#include "../evdata/maparray.h"
#include "../data/trainer.def"
#include "sysflag.h"


#define EV_FIGHT_H_GLOBAL
#include "ev_fight.h"

extern void StartTrainerEncountEvent( void );
extern const VM_CODE TrainerTalkScript[];
extern const VM_CODE TrainerMoveScript[];
extern const VM_CODE TrainerEventScript[];
extern const VM_CODE Trainer2vs2Script[];
extern const VM_CODE TrainerRevengeScript[];
extern const VM_CODE Trainer2vs2RevengeScript[];

extern const VM_CODE test_bg_script[];
extern u8 TargetObjNo;


//=========================================================================
//	変数
//=========================================================================

static u16 trainer_type = 0;
u16 FieldTrainerID = 0;
static u16 trainer_obj = 0;
static const u8 * before_msg = NULL;
static const u8 * lose_msg = NULL;
static const u8 * win_msg = NULL;
static const u8 * no_fight_msg = NULL;
static const VM_CODE * after_script = NULL;
static const VM_CODE * battle_end_script = NULL;

//=========================================================================
//	定義
//=========================================================================

#define GET_TRN_FLAG(id)	( TRFLG_START+(id) )


enum{
	GET_1_BYTES,
	GET_2_BYTES,
	GET_4_BYTES,
	DMY_1_BYTES,
	DMY_2_BYTES,
	DMY_4_BYTES,
	GET_END_ADRS,
};

typedef struct {
	void * val_adrs;
	u8 val_type;
}TR_DATA_TYPE;


#define	TRDATA_CODE_SIZE	1

// トレーナーデータ構造
// ※ev_cmd.sのトレーナーデータ記述とずれがないように！！

/* 通常トレーナー */
#define TRDATA_TYPE		(0)				/* u8  トレーナーの種類 */
#define	TRDATA_ID		(1+0)			/* u16 戦闘ID指定 */
#define	TRDATA_OBJ		(1+2)			/* u16 */
#define	TRDATA_BEFORE	(1+4)			/* u32 対戦前フィールドでのMSG */
#define	TRDATA_LOSE		(1+8)			/* u32 対戦後の戦闘画面でのMSG */
#define TRDATA_END		(1+12)

/* イベントトレーナーデータ */
#define TRDATA_EV_TYPE		(0)				/* u8  トレーナーの種類 */
#define	TRDATA_EV_ID		(1+0)			/* u16 戦闘ID指定 */
#define	TRDATA_EV_OBJ		(1+2)			/* u16 */
#define	TRDATA_EV_BEFORE	(1+4)			/* u32 対戦前フィールドでのMSG */
#define	TRDATA_EV_LOSE		(1+8)			/* u32 対戦後の戦闘画面でのMSG */
#define TRDATA_EV_SCRIPT	(1+12)
#define TRDATA_EV_END		(1+16)

/* 2vs2対戦トレーナー */
#define TRDATA_2_TYPE		(0)				/* u8  トレーナーの種類 */
#define	TRDATA_2_ID			(1+0)			/* u16 戦闘ID指定 */
#define	TRDATA_2_OBJ		(1+2)			/* u16 */
#define	TRDATA_2_BEFORE		(1+4)			/* u32 対戦前フィールドでのMSG */
#define	TRDATA_2_LOSE		(1+8)			/* u32 対戦後の戦闘画面でのMSG */
#define TRDATA_2_NOFIGHT	(1+12)			/* u32 対戦しない場合のMSG */
#define TRDATA_2_END		(1+16)

/* 強制トレーナー戦データ */
#define TRDATA_F_TYPE	(0)				/* u8  トレーナーの種類 */
#define	TRDATA_F_ID		(1+0)			/* u16 戦闘ID指定 */
#define	TRDATA_F_OBJ	(1+2)			/* u16 */
#define	TRDATA_F_MSG	(1+4)
#define	TRDATA_F_END	(1+8)


static const TR_DATA_TYPE normal_trainer_type[] =
{
	{ &trainer_type,		GET_1_BYTES },
	{ &FieldTrainerID,		GET_2_BYTES },
	{ &trainer_obj,			GET_2_BYTES },
	{ &before_msg,			GET_4_BYTES },
	{ &lose_msg,			GET_4_BYTES },
	{ &win_msg,				DMY_4_BYTES },
	{ &no_fight_msg,		DMY_4_BYTES },
	{ &battle_end_script,	DMY_4_BYTES },
	{ &after_script,		GET_END_ADRS },
};

static const TR_DATA_TYPE event_trainer_type[] =
{
	{ &trainer_type,		GET_1_BYTES },
	{ &FieldTrainerID,		GET_2_BYTES },
	{ &trainer_obj,			GET_2_BYTES },
	{ &before_msg,			GET_4_BYTES },
	{ &lose_msg,			GET_4_BYTES },
	{ &win_msg,				DMY_4_BYTES },
	{ &no_fight_msg,		DMY_4_BYTES },
	{ &battle_end_script,	GET_4_BYTES },
	{ &after_script,		GET_END_ADRS },
};

static const TR_DATA_TYPE normal2vs2_trainer_type[] =
{
	{ &trainer_type,		GET_1_BYTES },
	{ &FieldTrainerID,		GET_2_BYTES },
	{ &trainer_obj,			GET_2_BYTES },
	{ &before_msg,			GET_4_BYTES },
	{ &lose_msg,			GET_4_BYTES },
	{ &win_msg,				DMY_4_BYTES },
	{ &no_fight_msg,		GET_4_BYTES },
	{ &battle_end_script,	DMY_4_BYTES },
	{ &after_script,		GET_END_ADRS },
};

static const TR_DATA_TYPE force_trainer_type[] =
{
	{ &trainer_type,		GET_1_BYTES },
	{ &FieldTrainerID,		GET_2_BYTES },
	{ &trainer_obj,			GET_2_BYTES },
	{ &before_msg,			DMY_4_BYTES },
	{ &lose_msg,			GET_4_BYTES },
	{ &win_msg,				DMY_4_BYTES },
	{ &no_fight_msg,		DMY_4_BYTES },
	{ &battle_end_script,	DMY_4_BYTES },
	{ &after_script,		GET_END_ADRS },
};

static const TR_DATA_TYPE event2vs2_trainer_type[] =
{
	{ &trainer_type,		GET_1_BYTES },
	{ &FieldTrainerID,		GET_2_BYTES },
	{ &trainer_obj,			GET_2_BYTES },
	{ &before_msg,			GET_4_BYTES },
	{ &lose_msg,			GET_4_BYTES },
	{ &win_msg,				DMY_4_BYTES },
	{ &no_fight_msg,		GET_4_BYTES },
	{ &battle_end_script,	GET_4_BYTES },
	{ &after_script,		GET_END_ADRS },
};
//=========================================================================
//	関数
//=========================================================================

static u32 get_u32_value( const VM_CODE * adrs )
{
	return (u32)*adrs | (u32)*(adrs+1)<<8 |
		(u32)*(adrs+2)<<16 | (u32)*(adrs+3)<<24;
}

static u16 get_u16_value( const VM_CODE * adrs )
{
	return (u16)*adrs | (u16)*(adrs+1)<<8;
}

static u8 get_u8_value( const VM_CODE * adrs )
{
	return (u8)*adrs;
}


static u16 get_now_trn_flag( void )
{
	return GET_TRN_FLAG( FieldTrainerID );
}


//=========================================================================
//
//=========================================================================
//--------------------------------------------------------------
//	ゲームオーバーになるかどうかの判定
//	<引数>		戦闘結果（WinLoseFlag)
//	<戻り値>	TRUE	ゲームオーバー
//				FALSE	プレイ継続
//	※戦闘結果の判別を行う個所がWinLoseFlagで判別できるよう、
//	　引数にWinLoseFlagをとるようになっている。
//--------------------------------------------------------------
int IsGameOverCheck( int value )
{
	switch ( value ) {
	case FIGHT_WIN:				return FALSE;
	case FIGHT_LOSE:			return TRUE;
	case FIGHT_DRAW:			return TRUE;
	case FIGHT_ESCAPE:			return FALSE;
	case FIGHT_END:				return FALSE;
	case FIGHT_ENEMY_ESCAPE:	return FALSE;
	case FIGHT_ENEMY_GET:		return FALSE;

	default:					return FALSE;
	}
}

//=========================================================================
//
//
//
//=========================================================================
static void init_trainer_data( void )
{
	trainer_type = 0;
	FieldTrainerID = 0;
	trainer_obj = 0;
	before_msg = NULL;
	lose_msg = NULL;
	win_msg = NULL;
	no_fight_msg = NULL;
	after_script = NULL;
	battle_end_script = NULL;
}

static void set_trainer_data( const TR_DATA_TYPE * type, const VM_CODE * adrs )
{
	for( ;;type++ ) {
		switch ( type->val_type ) {
		case GET_1_BYTES:
			*(u8*)type->val_adrs = get_u8_value(adrs);
			adrs ++;
			break;
		case GET_2_BYTES:
			*(u16*)type->val_adrs = get_u16_value(adrs);
			adrs += 2;
			break;
		case GET_4_BYTES:
			*(u32*)type->val_adrs = get_u32_value(adrs);
			adrs += 4;
			break;
		case DMY_1_BYTES:
			*(u8*)type->val_adrs = 0;
			break;
		case DMY_2_BYTES:
			*(u16*)type->val_adrs = 0;
			break;
		case DMY_4_BYTES:
			*(u32*)type->val_adrs = 0;
			break;
		case GET_END_ADRS:
			*(u32*)type->val_adrs = (u32)adrs;
			return;
		}
	}
}

static void set_trainer_obj_id( void )
{
	if (trainer_obj != 0 ) {
		TargetObjID = trainer_obj;
		TargetObjNo = EvObjIdSeek( TargetObjID, Fld.MapID.map_id, Fld.MapID.div_id );
	}
}

//--------------------------------------------------------------
//	フィールドトレーナーのパラメータをセット
//	<引数>
//	adr		トレーナーデータ先頭アドレス
//	<戻り値>
//			トレーナー話しかけスクリプトアドレス
//--------------------------------------------------------------
u32 SetTrainerDataByAdrs( const VM_CODE * adr )
{ 
	init_trainer_data();

	trainer_type	= get_u8_value(adr+TRDATA_TYPE);

	switch ( trainer_type ) {

	case TR_TYPE_FORCE:
		set_trainer_data( force_trainer_type, adr);
		return (u32)TrainerEventScript;

	case TR_TYPE_2VS2:
		set_trainer_data( normal2vs2_trainer_type, adr);
		set_trainer_obj_id();
		return (u32)Trainer2vs2Script;
	
	case TR_TYPE_EVENT:
	case TR_TYPE_LEADER:
		set_trainer_data( event_trainer_type, adr);
		set_trainer_obj_id();
		return (u32)TrainerTalkScript;

	case TR_TYPE_EVENT2VS2:
	case TR_TYPE_LEADER2VS2:
		set_trainer_data( event2vs2_trainer_type, adr);
		set_trainer_obj_id();
		return (u32)Trainer2vs2Script;

	case TR_TYPE_REVENGE2VS2:
		set_trainer_data( normal2vs2_trainer_type, adr);
		set_trainer_obj_id();
		FieldTrainerID = GetRevengerTrainerID( FieldTrainerID );
		return (u32)Trainer2vs2RevengeScript;

	case TR_TYPE_REVENGE:
		set_trainer_data( normal_trainer_type, adr);
		set_trainer_obj_id();
		FieldTrainerID = GetRevengerTrainerID( FieldTrainerID );
		return (u32)TrainerRevengeScript;

	default:
		set_trainer_data( normal_trainer_type, adr);
		set_trainer_obj_id();
		return (u32)TrainerTalkScript;
	}
}

//--------------------------------------------------------------
//
//	視線ヒット動作の初期設定
//
//--------------------------------------------------------------
void SetTrainerMoveScript( u8 evno, const VM_CODE * label )
{
	TargetObjNo = evno;
	TargetObjID = EvObjId( evno );
	SetTrainerDataByAdrs( label + TRDATA_CODE_SIZE );
	StartFieldScript( TrainerMoveScript );
	SetForceEvent();
}

//--------------------------------------------------------------
//	トレーナー対戦フラグのチェック
//--------------------------------------------------------------
int CheckTrainerFlagByAdrs( const VM_CODE * label )
{
	u16 id;
	id = get_u16_value( label+TRDATA_CODE_SIZE+TRDATA_ID );
	return EventFlagCheck( GET_TRN_FLAG( id ) );
}

//--------------------------------------------------------------
//	トレーナーの動作コードを静止状態にする
//	※スクリプトからよばれる
//--------------------------------------------------------------
void StopTrainerObjMove(void)
{
	EventOBJ * ev;

	ev = &EvObj[TargetObjNo];
	EvObjMvCodeChg( ev, EvObjMvCodeStopSite(ev->site) );
}


//=========================================================================
//
//	スクリプトから呼ばれる関数
//
//=========================================================================
//--------------------------------------------------------------
//	トレーナーの種類コードを返す
//--------------------------------------------------------------
u8 GetTrainerType( void )
{
	return trainer_type;
}


//--------------------------------------------------------------
//	トレーナー戦フラグ関連
//	※現在対象となっているトレーナーについて呼び出す
//--------------------------------------------------------------
u8 CheckNowTrainerFlag( void )
{
	return EventFlagCheck( get_now_trn_flag() );
}

void SetNowTrainerFlag( void )
{
	EventFlagSet( get_now_trn_flag() );
}

void ResetNowTrainerFlag( void )
{
	EventFlagSet( get_now_trn_flag() );
}


//--------------------------------------------------------------
//	トレーナー戦フラグ関連
//	※トレーナーIDをキーにして呼び出す
//--------------------------------------------------------------
u8 CheckTrainerFlagByID( u16 id )
{
	return EventFlagCheck( GET_TRN_FLAG(id) );
}

void SetTrainerFlagByID( u16 id )
{
	EventFlagSet( GET_TRN_FLAG(id) );
}

void ResetTrainerFlagByID( u16 id )
{
	EventFlagReset( GET_TRN_FLAG(id) );
}


//--------------------------------------------------------------
//	フィールドトレーナー戦開始
//	※スクリプトコマンド
//--------------------------------------------------------------
void FieldTrainerFightStart( void )
{
	FightType = FIGHT_TYPE_TRAINER;
	sys.pReturnProc = FieldTrainerFightEnd;
	StartTrainerEncountEvent();
	StopFieldScript();
}



//--------------------------------------------------------------
//	フィールドトレーナー戦終了
//	※スクリプトコマンド
//--------------------------------------------------------------
void FieldTrainerFightEnd( void )
{

	if( FieldTrainerID == ORUSUBAN_TRAINER ) {
		MainProcChange( FieldScriptRecover );

	} else if ( IsGameOverCheck(WinLoseFlag) == TRUE ) {
		MainProcChange( GameOverRestart );

	} else {
		MainProcChange( FieldScriptRecover );
		SetNowTrainerFlag();
	}
}

static void FieldRevengeTrainerFightEnd( void )
{

	if( FieldTrainerID == ORUSUBAN_TRAINER ) {
		MainProcChange( FieldScriptRecover );

	} else if ( IsGameOverCheck(WinLoseFlag) == TRUE ) {
		MainProcChange( GameOverRestart );

	} else {
		MainProcChange( FieldScriptRecover );
		SetNowTrainerFlag();
		ResetNowRevengerFlag();
	}
}

void FieldRevengeTrainerFightStart( void )
{
	FightType = FIGHT_TYPE_TRAINER;
	sys.pReturnProc = FieldRevengeTrainerFightEnd;
	StartTrainerEncountEvent();
	StopFieldScript();
}


//--------------------------------------------------------------
//	トレーナー対戦前のＭＳＧをだす
//	※スクリプトから呼ばれるプログラム
//--------------------------------------------------------------
void PutTrainerBeforeFightMsg( void )
{
	FieldMsgSet(GetTrainerBeforeFightMsg());
}

//--------------------------------------------------------------
//	トレーナー戦済みの場合のスクリプトを返す
//	※スクリプトコマンド
//--------------------------------------------------------------
const VM_CODE * GetTrainerAfterScript( void )
{
	if( after_script == 0 )return test_bg_script;
	return after_script;
}

//--------------------------------------------------------------
//	トレーナー戦終了後のスクリプトを返す
//	※スクリプトコマンド
//--------------------------------------------------------------
const VM_CODE * GetTrainerBattleEndScript( void )
{
	if( battle_end_script == 0 )return test_bg_script;
	return battle_end_script;
}


//--------------------------------------------------------------
//	戦わない場合のMSGを表示する
//	※スクリプトから呼ばれるプログラム
//--------------------------------------------------------------
void PutTrainerNotFightMsg( void )
{
	FieldMsgSet(GetTrainerNotFightMsg());
}

//--------------------------------------------------------------
//	トレーナーエンカウントBGMセット
//	※スクリプトから呼ばれるプログラム
//--------------------------------------------------------------
void SetTrainerBGM( void )
{
	u16 bgm;

	//リーダー戦はエンカウントＢＧＭに切り替わらない
	if (trainer_type == TR_TYPE_LEADER || trainer_type == TR_TYPE_LEADER2VS2)
		return;

	switch ( GetTrainerSex(FieldTrainerID) ) {

	case EYE_BOY:			bgm = MUS_BOYEYE; break;
	case EYE_GIRL:			bgm = MUS_GIRLEYE; break;
	case EYE_LITTLE_GIRL:	bgm = MUS_SYOUJOEYE; break;
	case EYE_AYASII:		bgm = MUS_AYASII; break;
	case EYE_HAGESII:		bgm = MUS_HAGESHII; break;
	case EYE_KAKKOII:		bgm = MUS_KAKKOII; break;
	case EYE_AQUADAN:		bgm = MUS_AQA_0; break;
	case EYE_MAGUMADAN:		bgm = MUS_MGM0;	break;
	case EYE_SWIMMER:		bgm = MUS_SWIMEYE; break;
	case EYE_FUTAGO:		bgm = MUS_HUTAGO; break;
	case EYE_SITENNOU:		bgm = MUS_SITENNOU; break;
	case EYE_DEBU:			bgm = MUS_YAMA_EYE; break;
	case EYE_INTERVIEWER:	bgm = MUS_INTER_V; break;
	case EYE_GENTLEMAN:		bgm = MUS_TEST; break;

	default:
		bgm = MUS_AYASII; break;	/*とりあえず,フォロー処理*/
	}

	BGM_PlaySet( bgm );
}

//=========================================================================
//
//	メッセージデータアクセス
//
//=========================================================================
//--------------------------------------------------------------
//	MSGポインタがNULLの場合はダミーMSGへのポインタを返す
//--------------------------------------------------------------
static const u8 * null_msg_check(const u8 * msg)
{
	if (msg == NULL)
		return str_dummy;
	else
		return msg;
}

//--------------------------------------------------------------
//
//	トレーナー対戦前のメッセージデータを返す
//
//--------------------------------------------------------------
const u8 * GetTrainerBeforeFightMsg( void )
{
	return null_msg_check(before_msg);
}

//--------------------------------------------------------------
//
//	トレーナーが負けたときのメッセージデータを返す
//
//--------------------------------------------------------------
extern const u8 * GetOrusubanLoseMsg(void);	// 2002/07/24 by nakahiro

const u8 * GetTrainerLoseMessage( void )
{
	const u8 * msg;

	if ( FieldTrainerID == ORUSUBAN_TRAINER ) {
		msg = GetOrusubanLoseMsg();
	} else {
		msg = lose_msg;
	}
	PM_MsgExpand( MsgExpandBuffer, null_msg_check(msg) );
	return MsgExpandBuffer;
}

//--------------------------------------------------------------
//
//	トレーナーが勝ったときのメッセージデータを返す
//
//--------------------------------------------------------------
const u8 * GetTrainerWinMessage( void )
{
	return null_msg_check(win_msg);
}

//--------------------------------------------------------------
//
//	戦わない場合のメッセージデータを返す
//	※2vs2対戦用
//
//--------------------------------------------------------------
const u8 * GetTrainerNotFightMsg( void )
{
	return null_msg_check(no_fight_msg);
}






//=========================================================================
//	
//
//			再戦トレーナーフラグ関連
//
//
//=========================================================================


#define	NO_REVENGE_DATA			REVENGE_TRAINER_END		/* 再戦データがない場合の指定 */

#include "../data/revenge.h"
#include "../data/revenge.dat"




enum{
	NOT_EXIST_OFS	= -1,		//再戦データが存在しない場合
};

//=========================================================================
//
//
//
//=========================================================================

//-------------------------------------------------------------------------
/* トレーナーIDから再戦データへのオフセットを取得 */
//-------------------------------------------------------------------------
static int get_rvg_offset_by_trainer_id( const REVENGE_DATA * const rvg, u16 id )
{
	int i;

	for ( i=0; i<REVENGE_DATA_MAX; i++ ) {
		if ( rvg[i].id[0] == id ) return i;
	}
	return NOT_EXIST_OFS;
}

//-------------------------------------------------------------------------
/* トレーナーID(再戦専用ID含む)から再戦データへのオフセットを取得 */
//-------------------------------------------------------------------------
static int get_rvg_offset_by_revenger_id( const REVENGE_DATA * const rvg, u16 id )
{
	int i,j;

	for ( i=0; i<REVENGE_DATA_MAX; i++ ) {
		for ( j=0; j<REVENGE_LEVEL_MAX; j++ ) {
			if ( rvg[i].id[j] == NO_REVENGE_DATA ) break;
			if ( rvg[i].id[j] == id ) return i;
		}
	}
	return NOT_EXIST_OFS;
}

//-------------------------------------------------------------------------
/* 指定マップでの再戦トレーナーのランダムセット */
//-------------------------------------------------------------------------
static int set_random_revenger( const REVENGE_DATA * const rvg, u16 div_id, u16 map_id )
{
	int i,level;
	int check_flag;

	check_flag = FALSE;

	for ( i=0; i<REVENGE_DATA_MAX; i++ ) {
		/* 場所チェック */
		if ( rvg[i].div_id != div_id || rvg[i].map_id != map_id ) continue;

		/* すでにセットしているかどうかチェック */
		if ( Fld.RevengeFlag[i] != 0 ) {
			check_flag = TRUE;
			continue;
		}

		/* 戦ったことがあるかどうかチェック */
		if ( CheckTrainerFlagByID( rvg[i].id[0] ) != TRUE ) continue;

		/* ３０％の確立チェック */
		if ( pp_rand() % 100 > 30 ) continue;

		for ( level = 1; level < REVENGE_LEVEL_MAX; level++ ) {
			if ( rvg[i].id[level] == NO_REVENGE_DATA ) break;
			if ( CheckTrainerFlagByID(rvg[i].id[level]) == FALSE ) break;
		}
		Fld.RevengeFlag[i] = level;
		check_flag = TRUE;
	}
	return check_flag;
}


//-------------------------------------------------------------------------
/*	指定マップに再戦可能状態のトレーナーがいるかどうかのチェック */
//-------------------------------------------------------------------------
static int check_active_revenger_in_map( const REVENGE_DATA * const rvg, u16 div_id, u16 map_id )
{
	int i;

	for ( i=0; i<REVENGE_DATA_MAX; i++ ) {
		if ( rvg[i].div_id != div_id || rvg[i].map_id != map_id ) continue;
		if ( Fld.RevengeFlag[i] != 0 ) return TRUE;
	}
	return FALSE;
}

//-------------------------------------------------------------------------
/* 指定マップに再戦トレーナーが存在するかどうかのチェック */
//-------------------------------------------------------------------------
static int check_revenger_exist_in_map( const REVENGE_DATA * const rvg, u16 div_id, u16 map_id )
{
	int i;

	for ( i=0; i<REVENGE_DATA_MAX; i++ ) {
		if ( rvg[i].div_id == div_id && rvg[i].map_id == map_id ) return TRUE;
	}
	return FALSE;
}

//-------------------------------------------------------------------------
/* 指定IDのトレーナーが再戦可能状態かどうかチェック */
//-------------------------------------------------------------------------
static u8 check_revenger_by_trainer_id( const REVENGE_DATA * const rvg, u16 id )
{
	int ofs;
	ofs = get_rvg_offset_by_trainer_id(rvg,id);
	if ( ofs == NOT_EXIST_OFS ) return FALSE;
	if ( ofs >= REVENGER_MAX ) return FALSE;

	if ( Fld.RevengeFlag[ofs] == 0 ) return FALSE;
	return TRUE;
}

//-------------------------------------------------------------------------
/* 指定ID（再戦専用ID含む）のトレーナーが再戦可能状態かどうかのチェック */
//-------------------------------------------------------------------------
static u8 check_revenger_by_revenger_id( const REVENGE_DATA * const rvg, u16 id )
{
	int ofs;
	ofs = get_rvg_offset_by_revenger_id(rvg,id);
	if ( ofs == NOT_EXIST_OFS ) return FALSE;
	if ( ofs >= REVENGER_MAX ) return FALSE;

	if ( Fld.RevengeFlag[ofs] == 0 ) return FALSE;
	return TRUE;
}

//-------------------------------------------------------------------------
/* 指定再戦トレーナーの再戦用トレーナーIDを取得する */
//-------------------------------------------------------------------------
static u16 get_revenger_id_by_trainer_id( const REVENGE_DATA * const rvg, u16 id )
{
	const REVENGE_DATA * p;
	int level;
	int ofs;

	ofs = get_rvg_offset_by_trainer_id(rvg, id);
	if ( ofs == NOT_EXIST_OFS ) return 0;
	p = rvg + ofs;
	for (level=1; level<REVENGE_LEVEL_MAX; level++) {
		if (p->id[level] == NO_REVENGE_DATA) {
			//再戦IDがない→直前のIDを返す
			return p->id[level-1];
		}
		if (CheckTrainerFlagByID(p->id[level]) == FALSE) {
			//戦っていないID→このIDを返す
			return p->id[level];
		}
	}
	return p->id[REVENGE_LEVEL_MAX-1];	//最大レベル
}

//-------------------------------------------------------------------------
/* 再戦フラグのクリア */
//-------------------------------------------------------------------------
static void reset_revenger_flag_by_revenger_id( const REVENGE_DATA * const rvg, u16 id )
{
	int ofs;
	ofs = get_rvg_offset_by_revenger_id(rvg,id);
	if ( ofs == NOT_EXIST_OFS ) return;
	Fld.RevengeFlag[ofs] = 0;
}


//-------------------------------------------------------------------------
/* 再戦をしたことがあるトレーナーかどうかのチェック */
//-------------------------------------------------------------------------
static int check_revenged_by_trainer_id( const REVENGE_DATA * const rvg, u16 id )
{
	int ofs;

	ofs = get_rvg_offset_by_trainer_id(rvg,id);
	if ( ofs == NOT_EXIST_OFS )
		return FALSE;

	//テーブルの先頭から２番目のID == 再戦専用のトレーナーIDなので、
	//トレーナーフラグをチェックしてFALSEの場合はまだ再戦をしたことがない
	if ( CheckTrainerFlagByID(rvg[ofs].id[1]) == FALSE ) {
		return FALSE;
	} else {
		return TRUE;
	}
}


//=========================================================================
//
//
//
//=========================================================================
//-------------------------------------------------------------------------
//-------------------------------------------------------------------------

static const u16 badge_flags[] =
{
	SYS_BATCH01_GET,
	SYS_BATCH02_GET,
	SYS_BATCH03_GET,
	SYS_BATCH04_GET,
	SYS_BATCH05_GET,
	SYS_BATCH06_GET,
	SYS_BATCH07_GET,
	SYS_BATCH08_GET,
};

static int check_badge_count( void )
{
	int i,count;
	count = 0;
	for ( i=0; i<NELEMS(badge_flags); i++ ) {
		if ( EventFlagCheck(badge_flags[i]) == TRUE ) {
			count ++;
			if ( count >= 5 ) return TRUE;
		}
	}
	return FALSE;
}

//-------------------------------------------------------------------------
//	再戦チェック用歩数カウント
//-------------------------------------------------------------------------
void RevengeStepCountUp( void )
{
	if ( check_badge_count() == FALSE ) return;

	if ( Fld.RevengeStepCount >= REVENGE_STEP_MAX ) {
		Fld.RevengeStepCount = REVENGE_STEP_MAX;
	} else {
		Fld.RevengeStepCount++;
	}
}

static int check_revenge_step_count( void )
{
	if ( check_badge_count() == FALSE ) return FALSE;
	if ( Fld.RevengeStepCount < REVENGE_STEP_MAX ) return FALSE;
	return TRUE;
}

//-------------------------------------------------------------------------
//	ランダムで再戦トレーナーを再戦状態にセットする
//	<引数>
//		div_id,map_id	マップの指定
//-------------------------------------------------------------------------
void SetRandomRevenger( u16 div_id, u16 map_id )
{
	if ( check_revenge_step_count() == FALSE ) return;
	if ( set_random_revenger( RevengeDataTbl, div_id, map_id ) == TRUE ) {
		Fld.RevengeStepCount = 0;
	}
	return;
}


//-------------------------------------------------------------------------
//	再戦状態のトレーナーがいるかどうかのチェック
//	<引数>
//		div_id,map_id		マップの指定
//	<戻り値>
//		TRUE		存在する
//		FALSE		存在しない
//-------------------------------------------------------------------------
int CheckRevengerByMapID( u16 div_id, u16 map_id )
{
	return check_active_revenger_in_map( RevengeDataTbl, div_id, map_id );
}

int DebugCheckRevengeDataByMapID( u16 div_id, u16 map_id )
{
	return check_revenger_exist_in_map( RevengeDataTbl, div_id, map_id );
}

//-------------------------------------------------------------------------
//	再戦トレーナーの対戦トレーナーIDを取得する
//	<引数>
//		再戦トレーナーのトレーナーID
//	<戻り値>
//		再戦する際のトレーナーID
//-------------------------------------------------------------------------
u16 GetRevengerTrainerID( u16 trainer_id )
{
	return get_revenger_id_by_trainer_id( RevengeDataTbl, trainer_id );
}

//-------------------------------------------------------------------------
//	再戦データへ分岐するかどうかのチェック
//	下記のどちらかの場合に、TRUEを返す
//	・再戦フラグがオン
//	・再戦フラグがオフだが再戦をしたことがある
//-------------------------------------------------------------------------
u8 IsRevengerCheck( void )
{
	if ( check_revenger_by_trainer_id( RevengeDataTbl, FieldTrainerID ) ) {
		return TRUE;
	}
	return check_revenged_by_trainer_id( RevengeDataTbl, FieldTrainerID );
}

//-------------------------------------------------------------------------
//	再戦フラグのチェック
//-------------------------------------------------------------------------
u8 CheckRevengerFlag( void )
{
	return check_revenger_by_revenger_id( RevengeDataTbl, FieldTrainerID );
}

//-------------------------------------------------------------------------
//	再戦フラグのクリア
//-------------------------------------------------------------------------
void ResetNowRevengerFlag( void )
{
	reset_revenger_flag_by_revenger_id( RevengeDataTbl, FieldTrainerID );
	SetNowTrainerFlag();
}


