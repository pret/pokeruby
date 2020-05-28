//=========================================================================
//	
//
//
//
//=========================================================================

#include "common.h"

#include "oyaji.h"

#include "record.h"
#include "calctool.h"
#include "print.h"
#include "menutool.h"
#include "task.h"
#include "fld_talk.h"
#include "message.h"

#include "script.h"



//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//		デンセツおやじ用いろいろ
//
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//=========================================================================
//	定義
//=========================================================================
//#define name value

enum{
	LG_NAME_LEN = PERSON_NAME_SIZE,		/*おやじデータ内に保持する名前の長さ*/
	LG_RECORD_LEN = 4,		/*でんせつ記録データの大きさ*/
	LEGEND_MAX = 4,			/*でんせつの数*/


	//でんせつの識別子:でんせつがないとき
	NO_LEGEND_TYPE	= 0,

	//でんせつの識別子:レポートを書いた回数
	//CNT_REPORT == 0なのでデータがないときと同じだとみなされてしまうため
	//別の値に置き換えている
	CNT_REPORT_ID	= CNT_END,
};

//でんせつ選択ウィンドウ定義
enum{
	LGWIN_X = 0,
	LGWIN_Y = 0,
	LGWIN_X2 = 23,
	LGWIN_Y2 = 12,
};

//typedef ...

typedef struct {
	u8 type;									//おやじの種類
	u8 add_flag;								//でんせつを追加したかどうかのフラグ
	u8 renew_flag;		/*予備*/
	u8 dummy_flag;		/*予備*/
	u8 lg_type[LEGEND_MAX];						//でんせつの種類
	u8 lg_name[LG_NAME_LEN * LEGEND_MAX];		//でんせつの持ち主の名前
	u8 lg_record[LG_RECORD_LEN * LEGEND_MAX];	//でんせつの記録内容
}OYAJIDATA_LEGEND;

typedef struct {
	u8 type;				// でんせつの種類（record.hの定義に依存）
	u8 min;					// でんせつになるのに最低必要な数
	const u8 * title;		// ウィンドウに表示する項目
	const u8 * str;			// ＭＳＧに埋め込むことば
	const u8 * msg;			// でんせつ説明ＭＳＧ
}LEGEND_TABLE;

//=========================================================================
//	変数
//=========================================================================


extern const u8	msg_legend_title_report[];
extern const u8	msg_legend_action_report[];
extern const u8	msg_oyaji_01_p10_legend_report[];
extern const u8	msg_legend_title_trend[];
extern const u8	msg_legend_action_trend[];
extern const u8	msg_oyaji_01_p10_legend_trend[];
extern const u8	msg_legend_title_nuts[];
extern const u8	msg_legend_action_nuts[];
extern const u8	msg_oyaji_01_p10_legend_nuts[];
extern const u8	msg_legend_title_bicycle_trade[];
extern const u8	msg_legend_action_bicycle_trade[];
extern const u8	msg_oyaji_01_p10_legend_bicycle_trade[];
extern const u8	msg_legend_title_interview[];
extern const u8	msg_legend_action_interview[];
extern const u8	msg_oyaji_01_p10_legend_interview[];
extern const u8	msg_legend_title_trainer_battle[];
extern const u8	msg_legend_action_trainer_battle[];
extern const u8	msg_oyaji_01_p10_legend_rainer_battle[];
extern const u8	msg_legend_title_catch_poke[];
extern const u8	msg_legend_action_catch_poke[];
extern const u8	msg_oyaji_01_p10_legend_catch_poke[];
extern const u8	msg_legend_title_turi[];
extern const u8	msg_legend_action_turi[];
extern const u8	msg_oyaji_01_p10_legend_turi[];
extern const u8	msg_legend_title_tamago[];
extern const u8	msg_legend_action_tamago[];
extern const u8	msg_oyaji_01_p10_legend_tamago[];
extern const u8	msg_legend_title_shinka[];
extern const u8	msg_legend_action_shinka[];
extern const u8	msg_oyaji_01_p10_legend_shinka[];
extern const u8	msg_legend_title_kaifuku_pc[];
extern const u8	msg_legend_action_kaifuku_pc[];
extern const u8	msg_oyaji_01_p10_legend_kaifuku_pc[];
extern const u8	msg_legend_title_kaifuku_home[];
extern const u8	msg_legend_action_kaifuku_home[];
extern const u8	msg_oyaji_01_p10_legend_kaifuku_home[];
extern const u8	msg_legend_title_safari[];
extern const u8	msg_legend_action_safari[];
extern const u8	msg_oyaji_01_p10_legend_safari[];
extern const u8	msg_legend_title_iaigiri[];
extern const u8	msg_legend_action_iaigiri[];
extern const u8	msg_oyaji_01_p10_legend_aigiri[];
extern const u8	msg_legend_title_iwakudaki[];
extern const u8	msg_legend_action_iwakudaki[];
extern const u8	msg_oyaji_01_p10_legend_iwakudaki[];
extern const u8	msg_legend_title_agittrans[];
extern const u8	msg_legend_action_agittrans[];
extern const u8	msg_oyaji_01_p10_legend_agittrans[];
extern const u8	msg_legend_title_waza_haneru[];
extern const u8	msg_legend_action_waza_haneru[];
extern const u8	msg_oyaji_01_p10_legend_waza_haneru[];
extern const u8	msg_legend_title_waza_waruagaki[];
extern const u8	msg_legend_action_waza_waruagaki[];
extern const u8	msg_oyaji_01_p10_legend_waza_waruagaki[];
extern const u8	msg_legend_title_slot[];
extern const u8	msg_legend_action_slot[];
extern const u8	msg_oyaji_01_p10_legend_slot[];
extern const u8	msg_legend_title_roulette[];
extern const u8	msg_legend_action_roulette[];
extern const u8	msg_oyaji_01_p10_legend_roulette[];
extern const u8	msg_legend_title_tower_battle[];
extern const u8	msg_legend_action_tower_battle[];
extern const u8	msg_oyaji_01_p10_legend_tower_battle[];
extern const u8	msg_legend_title_cubemake[];
extern const u8	msg_legend_action_cubemake[];
extern const u8	msg_oyaji_01_p10_legend_cubemake[];
extern const u8	msg_legend_title_contest[];
extern const u8	msg_legend_action_contest[];
extern const u8	msg_oyaji_01_p10_legend_contest[];
extern const u8	msg_legend_title_contestwin[];
extern const u8	msg_legend_action_contestwin[];
extern const u8	msg_oyaji_01_p10_legend_contestwin[];
extern const u8	msg_legend_title_shoping[];
extern const u8	msg_legend_action_shoping[];
extern const u8	msg_oyaji_01_p10_legend_shoping[];
extern const u8	msg_legend_title_dowsing[];
extern const u8	msg_legend_action_dowsing[];
extern const u8	msg_oyaji_01_p10_legend_dowsing[];
extern const u8	msg_legend_title_rain[];
extern const u8	msg_legend_action_rain[];
extern const u8	msg_oyaji_01_p10_legend_rain[];
extern const u8	msg_legend_title_pokedex[];
extern const u8	msg_legend_action_pokedex[];
extern const u8	msg_oyaji_01_p10_legend_pokedex[];
extern const u8	msg_legend_title_ribbon[];
extern const u8	msg_legend_action_ribbon[];
extern const u8	msg_oyaji_01_p10_legend_ribbon[];
extern const u8	msg_legend_title_jump[];
extern const u8	msg_legend_action_jump[];
extern const u8	msg_oyaji_01_p10_legend_jump[];
extern const u8	msg_legend_title_tv_watch[];
extern const u8	msg_legend_action_tv_watch[];
extern const u8	msg_oyaji_01_p10_legend_tv_watch[];
extern const u8	msg_legend_title_clock_watch[];
extern const u8	msg_legend_action_clock_watch[];
extern const u8	msg_oyaji_01_p10_legend_clock_watch[];
extern const u8	msg_legend_title_poke_loto[];
extern const u8	msg_legend_action_poke_loto[];
extern const u8	msg_oyaji_01_p10_legend_poke_loto[];
extern const u8	msg_legend_title_sodateya[];
extern const u8	msg_legend_action_sodateya[];
extern const u8	msg_oyaji_01_p10_legend_sodateya[];
extern const u8	msg_legend_title_ropeway[];
extern const u8	msg_legend_action_ropeway[];
extern const u8	msg_oyaji_01_p10_legend_ropeway[];
extern const u8	msg_legend_title_onsen[];
extern const u8	msg_legend_action_onsen[];
extern const u8	msg_oyaji_01_p10_legend_onsen[];

static const LEGEND_TABLE legend_table[] =
{
	{
	CNT_REPORT_ID,1,
	msg_legend_title_report,
	msg_legend_action_report,
	msg_oyaji_01_p10_legend_report,
	},
	{
	CNT_TREND,1,
	msg_legend_title_trend,
	msg_legend_action_trend,
	msg_oyaji_01_p10_legend_trend,
	},
	{
	CNT_NUTS,1,
	msg_legend_title_nuts,
	msg_legend_action_nuts,
	msg_oyaji_01_p10_legend_nuts,
	},
	{
	CNT_BICYCLE_TRADE,1,
	msg_legend_title_bicycle_trade,
	msg_legend_action_bicycle_trade,
	msg_oyaji_01_p10_legend_bicycle_trade,
	},
	{
	CNT_INTERVIEW,1,
	msg_legend_title_interview,
	msg_legend_action_interview,
	msg_oyaji_01_p10_legend_interview,
	},
	{
	CNT_TRAINER_BATTLE,1,
	msg_legend_title_trainer_battle,
	msg_legend_action_trainer_battle,
	msg_oyaji_01_p10_legend_rainer_battle,
	},
	{
	CNT_CATCH_POKE,1,
	msg_legend_title_catch_poke,
	msg_legend_action_catch_poke,
	msg_oyaji_01_p10_legend_catch_poke,
	},
	{
	CNT_TURI,1,
	msg_legend_title_turi,
	msg_legend_action_turi,
	msg_oyaji_01_p10_legend_turi,
	},
	{
	CNT_TAMAGO,1,
	msg_legend_title_tamago,
	msg_legend_action_tamago,
	msg_oyaji_01_p10_legend_tamago,
	},
	{
	CNT_SHINKA,1,
	msg_legend_title_shinka,
	msg_legend_action_shinka,
	msg_oyaji_01_p10_legend_shinka,
	},
	{
	CNT_KAIFUKU_PC,1,
	msg_legend_title_kaifuku_pc,
	msg_legend_action_kaifuku_pc,
	msg_oyaji_01_p10_legend_kaifuku_pc,
	},
	{
	CNT_KAIFUKU_HOME,1,
	msg_legend_title_kaifuku_home,
	msg_legend_action_kaifuku_home,
	msg_oyaji_01_p10_legend_kaifuku_home,
	},
	{
	CNT_SAFARI,1,
	msg_legend_title_safari,
	msg_legend_action_safari,
	msg_oyaji_01_p10_legend_safari,
	},
	{
	CNT_HIDEN_IAIGIRI,1,
	msg_legend_title_iaigiri,
	msg_legend_action_iaigiri,
	msg_oyaji_01_p10_legend_aigiri,
	},
	{
	CNT_HIDEN_IWAKUDAKI,1,
	msg_legend_title_iwakudaki,
	msg_legend_action_iwakudaki,
	msg_oyaji_01_p10_legend_iwakudaki,
	},
	{
	CNT_AGITTRANS,1,
	msg_legend_title_agittrans,
	msg_legend_action_agittrans,
	msg_oyaji_01_p10_legend_agittrans,
	},
	{
	CNT_WAZA_HANERU,1,
	msg_legend_title_waza_haneru,
	msg_legend_action_waza_haneru,
	msg_oyaji_01_p10_legend_waza_haneru,
	},
	{
	CNT_WAZA_WARUAGAKI,1,
	msg_legend_title_waza_waruagaki,
	msg_legend_action_waza_waruagaki,
	msg_oyaji_01_p10_legend_waza_waruagaki,
	},
	{
	CNT_SLOT,1,
	msg_legend_title_slot,
	msg_legend_action_slot,
	msg_oyaji_01_p10_legend_slot,
	},
	{
	CNT_ROULETTE,2,
	msg_legend_title_roulette,
	msg_legend_action_roulette,
	msg_oyaji_01_p10_legend_roulette,
	},
	{
	CNT_TOWER_BATTLE,1,
	msg_legend_title_tower_battle,
	msg_legend_action_tower_battle,
	msg_oyaji_01_p10_legend_tower_battle,
	},
	{
	CNT_MAKE_CUBE,1,
	msg_legend_title_cubemake,
	msg_legend_action_cubemake,
	msg_oyaji_01_p10_legend_cubemake,
	},
	{
	CNT_CONTEST,1,
	msg_legend_title_contest,
	msg_legend_action_contest,
	msg_oyaji_01_p10_legend_contest,
	},
	{
	CNT_CONTEST_WIN,1,
	msg_legend_title_contestwin,
	msg_legend_action_contestwin,
	msg_oyaji_01_p10_legend_contestwin,
	},
	{
	CNT_SHOPPING,1,
	msg_legend_title_shoping,
	msg_legend_action_shoping,
	msg_oyaji_01_p10_legend_shoping,
	},
	{
	CNT_DOWSING,1,
	msg_legend_title_dowsing,
	msg_legend_action_dowsing,
	msg_oyaji_01_p10_legend_dowsing,
	},
	{
	CNT_RAIN,1,
	msg_legend_title_rain,
	msg_legend_action_rain,
	msg_oyaji_01_p10_legend_rain,
	},
	{
	CNT_POKEDEX,1,
	msg_legend_title_pokedex,
	msg_legend_action_pokedex,
	msg_oyaji_01_p10_legend_pokedex,
	},
	{
	CNT_RIBBON,1,
	msg_legend_title_ribbon,
	msg_legend_action_ribbon,
	msg_oyaji_01_p10_legend_ribbon,
	},
	{
	CNT_JUMP,1,
	msg_legend_title_jump,
	msg_legend_action_jump,
	msg_oyaji_01_p10_legend_jump,
	},
	{
	CNT_TV_WATCH,1,
	msg_legend_title_tv_watch,
	msg_legend_action_tv_watch,
	msg_oyaji_01_p10_legend_tv_watch,
	},
	{
	CNT_CLOCK_WATCH,1,
	msg_legend_title_clock_watch,
	msg_legend_action_clock_watch,
	msg_oyaji_01_p10_legend_clock_watch,
	},
	{
	CNT_POKE_LOTO,1,
	msg_legend_title_poke_loto,
	msg_legend_action_poke_loto,
	msg_oyaji_01_p10_legend_poke_loto,
	},
	{
	CNT_SODATEYA,1,
	msg_legend_title_sodateya,
	msg_legend_action_sodateya,
	msg_oyaji_01_p10_legend_sodateya,
	},
	{
	CNT_ROPEWAY,1,
	msg_legend_title_ropeway,
	msg_legend_action_ropeway,
	msg_oyaji_01_p10_legend_ropeway,
	},
	{
	CNT_ONSEN,1,
	msg_legend_title_onsen,
	msg_legend_action_onsen,
	msg_oyaji_01_p10_legend_onsen,
	},
};

//でんせつの種類最大数
static const int LEGEND_TYPE_MAX = NELEMS(legend_table);

//おやじデータエリアへのポインタ
static OYAJIDATA_LEGEND * const lg_wk = (OYAJIDATA_LEGEND *)(Fld.oyaji_work);

//デンセツおやじ構造体サイズ、
//エリアオーバーでエラーになる（はず）
static const u8 OYAJIDATA_LEGEND_SIZE = sizeof(Fld.oyaji_work) - sizeof(OYAJIDATA_LEGEND);

// ローカル変数、選択したでんせつの場所を保持
static u8 legend_pos;


//=========================================================================
//
//	デンセツおやじ用関数
//
//=========================================================================

//-------------------------------------------------------------------------
//	初期化
//-------------------------------------------------------------------------
void InitOyajiLegend( void )
{
	int i;
	lg_wk->type = OYAJITYPE_LEGEND;
	lg_wk->add_flag = 0;
	for (i=0;i<LEGEND_MAX;i++) {
		lg_wk->lg_type[i] = NO_LEGEND_TYPE;
		lg_wk->lg_name[i] = EOM_;
	}
}

//-------------------------------------------------------------------------
//	通信交換直後の設定
//-------------------------------------------------------------------------
void ResetOyajiLegend( void )
{
	lg_wk->type = OYAJITYPE_LEGEND;
	lg_wk->add_flag = 0;
}

//-------------------------------------------------------------------------
//	自分の保持しているカウントを取得
//	※CNT_REPORT_IDの場合のみ特殊処理をしている
//	　他の場合はtypeがそのままカウントのＩＤになっている
//-------------------------------------------------------------------------
static u32 get_my_record(u8 type)
{
	if (type == CNT_REPORT_ID)
		return GetRecord(CNT_REPORT);
	else
		return GetRecord(type);
}

//-------------------------------------------------------------------------
//	でんせつの種類から各種データを取得
//-------------------------------------------------------------------------
static const LEGEND_TABLE * get_legend_data( int type )
{
	int i;
	for (i=0;i<LEGEND_TYPE_MAX;i++) {
		if ( legend_table[i].type == type ) {
			return &legend_table[i];
		}
	}
	return &(legend_table[LEGEND_TYPE_MAX-1]);	//念のため、エラー処理
}

static const u8 * get_legend_title( int type )
{
	const LEGEND_TABLE * p = get_legend_data(type);
	return p->title;
}

static const u8 * get_legend_msg( int type )
{
	const LEGEND_TABLE * p = get_legend_data(type);
	return p->msg;
}

static const u8 * get_legend_string( int type )
{
	const LEGEND_TABLE * p = get_legend_data(type);
	return p->str;
}


//-------------------------------------------------------------------------
//	現在のでんせつを数える
//-------------------------------------------------------------------------
static u8 get_legend_count( void )
{
	u8 i;
	for (i=0;i<LEGEND_MAX;i++) {
		if ( lg_wk->lg_type[i] == NO_LEGEND_TYPE ) break;
	}
	return i;
}

//-------------------------------------------------------------------------
//-------------------------------------------------------------------------
static u32	get_legend_record( int pos )
{
	u32 value;
	u8 * p;
	p = &(lg_wk->lg_record[ pos * LG_RECORD_LEN ]);
	value = *p | *(p+1)<<8 | *(p+2)<<16 | *(p+3)<<24;
	return value;
}

static void set_legend_record( int pos ,u32 value )
{
	u8 * p = &(lg_wk->lg_record[ pos * LG_RECORD_LEN ]);
	*p = (u8)(0xff & value );
	*(p+1) = (u8)(0xff & (value >> 8) );
	*(p+2) = (u8)(0xff & (value >> 16) );
	*(p+3) = (u8)(0xff & (value >> 24) );
}

static int cmp_legend_record( int pos )
{
	int type;
	type = lg_wk->lg_type[pos];
	if ( get_my_record(type) > get_legend_record(pos) ) return TRUE;
	return FALSE;
}


//-------------------------------------------------------------------------
//-------------------------------------------------------------------------
static void get_legend_name( int pos, u8 * buf )
{
	u8 * p = &(lg_wk->lg_name[ pos * LG_NAME_LEN ]);
	memset( buf, EOM_, LG_NAME_LEN+EOM_SIZE );
	memcpy( buf, p, LG_NAME_LEN );
}

static void set_legend_name( int pos, const u8 * lg_name )
{
	u8 * p = &(lg_wk->lg_name[ pos * LG_NAME_LEN ]);
	memset( p, EOM_, LG_NAME_LEN );
	memcpy( p, lg_name, LG_NAME_LEN );
}


//-------------------------------------------------------------------------
//	でんせつデータの書き込み
//-------------------------------------------------------------------------
static void set_new_legend( int pos, int type )
{
	lg_wk->lg_type[pos] = type;
	set_legend_name( pos, MyData.my_name );
	set_legend_record( pos, get_my_record(type) );
	PM_NumMsgSet( StrTempBuffer0, get_my_record(type), NUM_MODE_LEFT, 10 );
	PM_strcpy( StrTempBuffer1, get_legend_string(type) );
}

//-------------------------------------------------------------------------
//	新規でんせつのチェック＆書き込み
//-------------------------------------------------------------------------
static void make_random_array( u8 * array, int len )
{
	int i,j,k;
	u8 n;

	for (i=0;i<len;i++) array[i] = i;
	for (i=0;i<len;i++) {
		j = pp_rand() % len;
		k = pp_rand() % len;
		n = array[j];
		array[j] = array[k];
		array[k] = n;
	}
}

static u8 search_new_legend( void )
{
	u8 array[LEGEND_TYPE_MAX];
	int i, j, type, min;

	make_random_array( array, LEGEND_TYPE_MAX );

	for (i=0;i<LEGEND_TYPE_MAX;i++) {
		type = legend_table[array[i]].type;
		min = legend_table[array[i]].min;
		for(j=0;j<LEGEND_MAX;j++) {
			if ( lg_wk->lg_type[j] == type ) break;
		}
		if (j == LEGEND_MAX && get_my_record(type) >= min) {
			lg_wk->add_flag = 1;
			set_new_legend( get_legend_count(), type );
			return TRUE;
		}
	}
	return FALSE;
}

//-------------------------------------------------------------------------
// 伝説内容MSG出力
//-------------------------------------------------------------------------
static void put_densetsu_msg( int pos )
{
	int type;
	type = lg_wk->lg_type[pos];
	PM_NumMsgSet( StrTempBuffer0, get_legend_record(pos), NUM_MODE_LEFT, 10 );
	PM_strcpy( StrTempBuffer1, get_legend_string(type) );
	get_legend_name( pos, StrTempBuffer2 );
	FieldMsgSet( get_legend_msg(type) );
}

//-------------------------------------------------------------------------
// ウィンドウ表示
//-------------------------------------------------------------------------
static void make_legend_window( void )
{
	int i,type;
	NMenuWinBoxWrite(LGWIN_X,LGWIN_Y,LGWIN_X2,LGWIN_Y+get_legend_count()*2+2+2);
	for (i=0;i<LEGEND_MAX;i++) {
		type = lg_wk->lg_type[i];
		if ( type == NO_LEGEND_TYPE ) break;
		NMenuMsgWrite( get_legend_title(type), LGWIN_X+2, LGWIN_Y+2+i*2 );
	}
	NMenuMsgWrite( msg_cancel_string, LGWIN_X+2, LGWIN_Y+2+i*2 );
}

//-------------------------------------------------------------------------
//	でんせつ選択ウィンドウ操作
//-------------------------------------------------------------------------
enum{
	WK_SEQ = 0,
	WK_SEL = 1,
};

static void legend_select_task( u8 no )
{
	TASK_TABLE * my;
	int n;

	my = &TaskTable[no];

	switch ( my->work[WK_SEQ] ) {
	case 0:
		make_legend_window();
		NMenuVCursorInit( LGWIN_X+1,LGWIN_Y+2,get_legend_count()+1,0 );
		my->work[WK_SEQ]++;
		break;

	case 1:
		n = NMenuVCursorControl();
		if ( n == CURSOR_DEFAULT_VALUE ) return;
		if ( n == CURSOR_CANCEL_VALUE ) {
			AnswerWork = 0;
		} else if ( n == get_legend_count() ) {
			AnswerWork = 0;
		} else {
			AnswerWork = 1;
			legend_pos = n;
		}
		NMenuBoxClear(LGWIN_X,LGWIN_Y,LGWIN_X2,LGWIN_Y2);
		DelTask(no);
		ContinueFieldScript();
	}
}


//=========================================================================
//	デンセツおやじのスクリプト呼び出しプログラム
//=========================================================================
//-------------------------------------------------------------------------
//でんせつ選択ウィンドウ
//-------------------------------------------------------------------------
void OyajiScr_LegendWindow(void)
{
	AddTask( legend_select_task, 80 );
}
//-------------------------------------------------------------------------
//でんせつ内容ＭＳＧ
//-------------------------------------------------------------------------
void OyajiScr_LegendMsg(void)
{
	put_densetsu_msg( legend_pos );
}
//-------------------------------------------------------------------------
//でんせつの数を取得
//-------------------------------------------------------------------------
u8 OyajiScr_LegendGetCount(void)
{
	return get_legend_count();
}
//-------------------------------------------------------------------------
//でんせつ更新チェック
//-------------------------------------------------------------------------
u8 OyajiScr_LegendRenewCheck(void)
{
	int type;
	type = lg_wk->lg_type[legend_pos];
	if ( cmp_legend_record( legend_pos ) == TRUE ) {
		set_new_legend( legend_pos, type );
		return TRUE;
	}
	return FALSE;
}

//-------------------------------------------------------------------------
//でんせつ追加フラグチェック
//-------------------------------------------------------------------------
u8 OyajiScr_LegendAddCheck(void)
{
	if ( lg_wk->add_flag == 0 ) return 0;
	return 1;
}

//-------------------------------------------------------------------------
//でんせつ追加チェック
//-------------------------------------------------------------------------
u8 OyajiScr_LegendNewCheck(void)
{
	return search_new_legend();
}

