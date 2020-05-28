//=========================================================================
//
//
//		対戦成績表
//
//
//=========================================================================

#include "common.h"

#include "print.h"
#include "menu.h"
#include "server.h"
#include "record.h"
#include "mystatus.h"
#include "b_tower.def"

#define __SCORE_H_GLOBAL__
#include "score.h"


//対戦結果用ワーク、セーブするまでの暫定領域


//=========================================================================
//
//		対戦結果処理など
//
//=========================================================================

//	成績のクリア
static void clear_score( TAISEN_SCORE * sc )
{
	CpuClear(0, sc, sizeof(TAISEN_SCORE), 16 );
	sc->name[0] = EOM_;
	sc->id = 0;
	sc->win = 0;
	sc->lose = 0;
	sc->draw = 0;
}

//	対戦データのクリア
static void init_score_table( SCORE_TABLE * tbl )
{
	int i;

	for ( i=0; i< TAISEN_SCORE_MAX; i++ ) {
		clear_score( &(tbl->score[i]) );
	}
	SetRecord(CNT_KACHI, 0);
	SetRecord(CNT_MAKE, 0);
	SetRecord(CNT_HIKIWAKE, 0);
}


static int get_total_game( TAISEN_SCORE * sc )
{
	return sc->win + sc->lose + sc->draw;
}

static int search_person( SCORE_TABLE * tbl, const u8 * name, u16 id )
{
	int i;
	for ( i=0; i<TAISEN_SCORE_MAX; i++ ) {
		if ( PM_strncmp( tbl->score[i].name, name, PERSON_NAME_SIZE) ) continue;
		if ( tbl->score[i].id != id ) continue;
		return i;
	}
	return TAISEN_SCORE_MAX;
}

static void sort_score( SCORE_TABLE * tbl )
{
	int i,j;
	TAISEN_SCORE tmp;

	for ( i=TAISEN_SCORE_MAX-1; i>0; i-- ) {
		for ( j=i-1;j>=0; j-- ) {
			if ( get_total_game(&tbl->score[i]) > get_total_game(&tbl->score[j]) ) {
				tmp = tbl->score[i];
				tbl->score[i] = tbl->score[j];
				tbl->score[j] = tmp;
			}
		}
	}
}

static void update_score( TAISEN_SCORE * sc, int result )
{
	switch ( result ) {
	case FIGHT_WIN:
		sc->win ++;
		if ( sc->win > SCORE_COUNT_MAX ) sc->win = SCORE_COUNT_MAX;
		break;
	case FIGHT_LOSE:
		sc->lose ++;
		if ( sc->lose > SCORE_COUNT_MAX ) sc->lose = SCORE_COUNT_MAX;
		break;
	case FIGHT_DRAW:
		sc->draw ++;
		if ( sc->draw > SCORE_COUNT_MAX ) sc->draw = SCORE_COUNT_MAX;
		break;
	}
}

static void update_total_score( int result )
{
	u8 id;

	switch ( result ) {
	case FIGHT_WIN:		id = CNT_KACHI; break;
	case FIGHT_LOSE:	id = CNT_MAKE; break;
	case FIGHT_DRAW:	id = CNT_HIKIWAKE; break;
	default: return;
	}
	if (GetRecord(id) < SCORE_COUNT_MAX)
		IncRecord(id);
}

static void update_score_table( SCORE_TABLE * tbl, const u8 * name, u16 id, int result )
{
	int n;

	update_total_score( result );
	sort_score( tbl );
	n = search_person( tbl, name, id );
	if ( n == TAISEN_SCORE_MAX ) {
		n = TAISEN_SCORE_MAX - 1;
		clear_score( &(tbl->score[n]) );
		PM_strncpy( tbl->score[n].name, name, PERSON_NAME_SIZE );
		tbl->score[n].id = id;
	}
	update_score( &(tbl->score[n]), result );
	sort_score( tbl );
}


//-------------------------------------------------------------------------
//	対戦成績の初期化
//-------------------------------------------------------------------------
void InitTaisenScore( void )
{
	init_score_table( &Fld.TaisenScoreTable );
}

//-------------------------------------------------------------------------
//	通信部屋トレーナーカードのデータを更新
//-------------------------------------------------------------------------

static void inc_trcard_win(int id)
{
	u16 * win;

	win = &MultiTrainerCard[id].cable_fight_win;
	(*win) ++;
	if (*win > TRCARD_CABLE_F_WIN_MAX)
		*win = TRCARD_CABLE_F_WIN_MAX;
}

static void inc_trcard_lose(int id)
{
	u16 * lose;

	lose = &MultiTrainerCard[id].cable_fight_lose;
	(*lose) ++;
	if (*lose > TRCARD_CABLE_F_LOSE_MAX)
		*lose = TRCARD_CABLE_F_LOSE_MAX;
}

static void update_trcard(int id)
{
	switch (WinLoseFlag) {
	case FIGHT_WIN:
		inc_trcard_win(id^1);
		inc_trcard_lose(id);
		break;
	case FIGHT_LOSE:
		inc_trcard_lose(id^1);
		inc_trcard_win(id);
		break;
	}
}

//-------------------------------------------------------------------------
//	対戦成績の反映
//	<引数>	対戦相手の通信ＩＤ
//-------------------------------------------------------------------------
void UpdateTaisenScore( int id )
{
	update_trcard(id);
	update_score_table( &Fld.TaisenScoreTable,
			MultiTrainerCard[id].name, MultiTrainerCard[id].id, WinLoseFlag );
}

#ifdef	PM_DEBUG
//=========================================================================
//
//	対戦表プログラム	デバッグテスト用
//
//=========================================================================
#define PLAYER1 { N__,U__,M__,B__,E__,R__,n1_,EOM_ }
#define PLAYER2 { NA_,N_,BA_,bou_,n2_,EOM_ }
#define PLAYER3 { NA_,N_,BA_,bou_,n3_,EOM_ }
#define PLAYER4 { NA_,N_,BA_,bou_,n4_,EOM_ }
#define PLAYER5 { NA_,N_,BA_,bou_,n5_,EOM_ }
#define PLAYER6 { NA_,N_,BA_,bou_,n6_,EOM_ }
#define PLAYER7 { NA_,N_,BA_,bou_,n7_,EOM_ }

typedef struct {
	u16 id;
	const u8 name[PERSON_NAME_SIZE+EOM_SIZE];
}TEST_PLAYER;

typedef struct {
	u8	player_no;
	u8	result;
}TEST_RESULT;

const TEST_PLAYER TestPlayer[] = {
	{1,PLAYER1 },
	{2,PLAYER2 },
	{3,PLAYER3 },
	{4,PLAYER4 },
	{5,PLAYER5 },
	{6,PLAYER6 },
	{7,PLAYER7 },
};

const TEST_RESULT TestResult[] = {
	{1,FIGHT_WIN},
	{2,FIGHT_WIN},
	{3,FIGHT_WIN},
//	{4,FIGHT_WIN},
//	{5,FIGHT_WIN},
//	{5,FIGHT_WIN},
//	{6,FIGHT_WIN},
//	{7,FIGHT_WIN},
};

void TestTaisenScore( void )
{
	int i,n;
	InitTaisenScore();

	for (i=0;i<NELEMS(TestResult);i++) {
		n = TestResult[i].player_no - 1;
		update_score_table( &Fld.TaisenScoreTable,
				TestPlayer[n].name, TestPlayer[n].id, TestResult[i].result );
	}
}
#endif

//=========================================================================
//
//		対戦結果表示など
//
//=========================================================================

enum{
	SCORE_NAME_SIZE = 5,

	SCORE_WIN_X_SIZE = 28,
	SCORE_WIN_Y_SIZE = 19,

	SCORE_WIN_X = 1,
	SCORE_WIN_Y = 0,
	SCORE_WIN_X2 = SCORE_WIN_X + SCORE_WIN_X_SIZE - 1,
	SCORE_WIN_Y2 = SCORE_WIN_Y + SCORE_WIN_Y_SIZE - 1,

	SCORE_TITLE_X = 6,
	SCORE_TITLE_Y = 1,

	SCORE_TOTAL_X = 2,
	SCORE_TOTAL_Y = 3,

	SCORE_LIST_NAME_X = 3,
	SCORE_LIST_WIN_X = 11,
	SCORE_LIST_LOSE_X = 17,
	SCORE_LIST_DRAW_X = 23,

	SCORE_LIST_Y = 6,
};

static const u8 str_title[] =
{
	I_MSG_,MY_NAME_BUF,spc_,no_,spc_,ta_,i_,se_,n_,spc_,se_,i_,se_,ki_,EOM_
};
static const u8 str_total_score[] =
{
	I_MSG_,STR_TEMP_BUF0,si_,yyo_,u_,spc_,
	I_MSG_,STR_TEMP_BUF1,ha_,i_,spc_,
	I_MSG_,STR_TEMP_BUF2,hi_,ki_,wa_,ke_,EOM_
};
static const u8 str_column_explain[] =
{
	ka_,ti_,spc_,spc_,spc_,spc_,ma_,ke_,spc_,spc_,spc_,hi_,ki_,wa_,ke_,EOM_
};
static const u8 str_namesize_bar[] = { bou_,bou_,bou_,bou_,bou_,EOM_ };
static const u8 str_scoresize_bar[] = { bou_,bou_,bou_,bou_,EOM_ };

static void put_taisen_total( SCORE_TABLE * tbl )
{
	PM_NumMsgSet( StrTempBuffer0, GetRecord(CNT_KACHI), NUM_MODE_SPACE, SCORE_KETA_MAX);
	PM_NumMsgSet( StrTempBuffer1, GetRecord(CNT_MAKE), NUM_MODE_SPACE, SCORE_KETA_MAX);
	PM_NumMsgSet( StrTempBuffer2, GetRecord(CNT_HIKIWAKE), NUM_MODE_SPACE, SCORE_KETA_MAX);
	NMenuMsgWrite( str_total_score, SCORE_TOTAL_X, SCORE_TOTAL_Y );
}

static void put_taisen_person( TAISEN_SCORE * sc, u8 y )
{
	if ( sc->win == 0 && sc->lose == 0 && sc->draw == 0 ) {
		NMenuMsgWrite(str_namesize_bar, SCORE_LIST_NAME_X, y);
		NMenuMsgWrite(str_scoresize_bar, SCORE_LIST_WIN_X, y);
		NMenuMsgWrite(str_scoresize_bar, SCORE_LIST_LOSE_X, y);
		NMenuMsgWrite(str_scoresize_bar, SCORE_LIST_DRAW_X, y);
		return;
	}

	PM_strclearEOM_(StrTempBuffer0, PERSON_NAME_SIZE + EOM_SIZE);
	PM_strncpy(StrTempBuffer0, sc->name, PERSON_NAME_SIZE);
	NMenuMsgWrite(StrTempBuffer0, SCORE_LIST_NAME_X, y);

	PM_NumMsgSet( StrTempBuffer0,sc->win,NUM_MODE_SPACE, SCORE_KETA_MAX);
	NMenuMsgWrite( StrTempBuffer0, SCORE_LIST_WIN_X, y );

	PM_NumMsgSet( StrTempBuffer0,sc->lose,NUM_MODE_SPACE, SCORE_KETA_MAX);
	NMenuMsgWrite( StrTempBuffer0, SCORE_LIST_LOSE_X, y );

	PM_NumMsgSet( StrTempBuffer0,sc->draw,NUM_MODE_SPACE, SCORE_KETA_MAX);
	NMenuMsgWrite( StrTempBuffer0, SCORE_LIST_DRAW_X, y );
}

//-------------------------------------------------------------------------
//	対戦成績の表示
//-------------------------------------------------------------------------
void PutTaisenScoreWindow( void )
{
	int i;

	NMenuWinBoxWrite( SCORE_WIN_X, SCORE_WIN_Y, SCORE_WIN_X2, SCORE_WIN_Y2 );

	NMenuMsgWrite( str_title, SCORE_TITLE_X, SCORE_TITLE_Y );
	put_taisen_total( &Fld.TaisenScoreTable );

	NMenuMsgWrite( str_column_explain, SCORE_LIST_WIN_X+1, SCORE_LIST_Y );
	for ( i=0; i< TAISEN_SCORE_MAX; i++ ) {
		put_taisen_person( &Fld.TaisenScoreTable.score[i], SCORE_LIST_Y + (i+1) * 2 );
	}
}

//=========================================================================
//
//
//		バトルタワーの成績表示
//
//
//=========================================================================

enum {
	BT_RENSHOU_MAX	= 9999,
};

enum{
	BSCORE_WIN_X1 = 3,
	BSCORE_WIN_Y1 = 1,
	BSCORE_WIN_X2 = 27,
	BSCORE_WIN_Y2 = 17,

	LINE_HEIGHT		= 2,

	BS_TITLE_X =	BSCORE_WIN_X1 + 2,
	BS_TITLE_Y =	BSCORE_WIN_Y1 + 1,

	BS_LV_TITLE_X	= BSCORE_WIN_X1 + 2,

	BS_L50_BASE_Y	= BS_TITLE_Y + LINE_HEIGHT * 2,
	BS_L50_TITLE_X	= BS_LV_TITLE_X,
	BS_L50_TITLE_Y	= BS_L50_BASE_Y,

	BS_DELIM_X1		= BSCORE_WIN_X1 + 2,
	BS_DELIM_X2		= BSCORE_WIN_X2 - 2,
	BS_DELIM_Y		= BS_L50_BASE_Y + LINE_HEIGHT * 2,

	BS_L100_TITLE_X = BS_LV_TITLE_X,
	BS_L100_TITLE_Y = BS_DELIM_Y + LINE_HEIGHT,

	BS_TYPE_X		= BSCORE_WIN_X1 + 10,
	BS_L50TYPE_X	= BS_TYPE_X,
	BS_L50TYPE_Y	= BS_L50_TITLE_Y,
	BS_L100TYPE_X	= BS_TYPE_X,
	BS_L100TYPE_Y	= BS_L100_TITLE_Y,
};

static const u8 str_bt_title[] = {
	I_MSG_,MY_NAME_BUF,spc_,no_,spc_,BA_,TO_,RU_,TA_,WA_,bou_,spc_,se_,i_,se_,ki_,
	EOM_
};
static const u8 str_level50[] = { RE_,BE_,RU_,spc_,n5_,n0_,EOM_ };
static const u8 str_level100[] = { RE_,BE_,RU_,n1_,n0_,n0_,EOM_ };
static const u8 str_bt_score[] = { I_MSG_,STR_TEMP_BUF0,re_,n_,si_,yyo_,u_,EOM_ };
static const u8 str_genzai[] = { ge_,n_,za_,i_,EOM_ };
static const u8 str_saikou[] = { sa_,i_,ko_,u_,EOM_ };
static const u8 str_zenkai[] = { ze_,n_,ka_,i_,EOM_ };

//戻り値がTRUEのとき、まだ連勝継続中
static int check_bt_status( u8 no )
{
	BATTLE_TOWER_WORK * bt = &MyData.BattleTowerWork;
	switch ( bt->BattleTowerSeqNo[no] ) {
	case BATTLE_TOWER_NO_CHALLENGE:	return FALSE;	//バトルタワーに未挑戦
	case BATTLE_TOWER_CHALLENGE:	return FALSE;	//バトルタワーに挑戦中
	case BATTLE_TOWER_PAUSE:		return TRUE;	//バトルタワー一時中断
	case BATTLE_TOWER_CONTINUE:		return TRUE;	//バトルタワーで連勝中
	case BATTLE_TOWER_WIN:			return FALSE;	//バトルタワーで勝ち
	case BATTLE_TOWER_LOSE:			return FALSE;	//バトルタワーで負け
	case BATTLE_TOWER_NO_ITEM_GET:	return TRUE;	//バトルタワーで勝ったけど道具がいっぱいで
	}
	return FALSE;
}

static void put_bt_record( const u8 * title, u16 value, u8 x, u8 y )
{
	NMenuMsgWrite( title, x, y );
	if ( value > BT_RENSHOU_MAX )
		value = BT_RENSHOU_MAX;	//連勝数を補正
	PM_NumMsgSet( StrTempBuffer0, value, NUM_MODE_SPACE, 4 );
	NMenuMsgWrite( str_bt_score, x+4, y );
}

//最大連勝記録を表示
static void put_bt_max_record( u8 no, u8 x, u8 y )
{
	BATTLE_TOWER_WORK * bt = &MyData.BattleTowerWork;
	u16 value = bt->BattleTowerWinRecord[no];
	put_bt_record( str_saikou, value, x, y );
}

//現在の連勝数の算出
u16	GetBattleTowerRenshou( u8 no )
{
	u32 value;
	value = MyData.BattleTowerWork.BattleTowerRensyouNow[no];
	if (value > BT_RENSHOU_MAX) value = BT_RENSHOU_MAX;
	return value;
}

//現在の連勝数を表示
static void put_bt_now_record( u8 no, u8 x, u8 y )
{
	u16 value;

	value = GetBattleTowerRenshou(no);
	if ( check_bt_status(no) == TRUE ) {
		put_bt_record( str_genzai, value, x, y );
	} else {
		put_bt_record( str_zenkai, value, x, y );
	}
}

//-------------------------------------------------------------------------
//	バトルタワー成績を表示
//-------------------------------------------------------------------------
void PutBattleTowerScoreWindow( void )
{
	u16 i;

	//大枠＆タイトルを描画
	NMenuWinBoxWrite( BSCORE_WIN_X1, BSCORE_WIN_Y1, BSCORE_WIN_X2, BSCORE_WIN_Y2 );
	NMenuMsgWrite( str_bt_title, BS_TITLE_X, BS_TITLE_Y );
	NMenuMsgWrite( str_level50, BS_L50_TITLE_X, BS_L50_TITLE_Y );
	NMenuMsgWrite( str_level100, BS_L100_TITLE_X, BS_L100_TITLE_Y );

	//枠を描画
	for (i=BS_DELIM_X1; i<=BS_DELIM_X2; i++)
		NMenuPutc( bou_, i, BS_DELIM_Y);

	//成績表示
	put_bt_now_record( 0, BS_L50TYPE_X, BS_L50TYPE_Y );
	put_bt_max_record( 0, BS_L50TYPE_X, BS_L50TYPE_Y + 2 );
	put_bt_now_record( 1, BS_L100TYPE_X, BS_L100TYPE_Y );
	put_bt_max_record( 1, BS_L100TYPE_X, BS_L100TYPE_Y + 2 );
}


