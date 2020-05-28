//========================================================================================
//								ミルクのみ / タマゴうみ
//					フィールドのポケモンリストから使用したときの処理
//								2002/06/06 by nakahiro
//========================================================================================
#include "common.h"
#include "print.h"
#include "pokelist.h"
#include "task.h"
#include "actanm.h"
#include "intr.h"
#include "menu.h"
#include "f_pmlist.h"
#include "poketool.h"
#include "p_status.h"
#include "itemtool.h"
#include "wazano.def"
#include "mus_tool.h"
#include "gauge.h"
#include "message.h"


//=========================================================================================
//									シンボル定義
//=========================================================================================

//=========================================================================================
//									プロトタイプ宣言
//=========================================================================================
extern void PokemonSort( u8 id );
extern void PokemonSortEnd2( u8 id );
extern void PokeSortEndCancelParam(void);
extern void F_PokeSortSet( u8 id );
extern void LifeGaugeDownMain( u8 id );	//	HPｹﾞｰｼﾞを減らす

static void PokeSelect( u8 id );
static void MilkNomiError( u8 id );
static void MilkNomiEnd( u8 id );

//------------------------
//		使用チェック
//------------------------
u8 MilkNomiCheck(void)
{
	u16	hp,hp_max;

	hp_max = PokeParaGet( &PokeParaMine[FPokeNo], ID_hpmax );
	hp     = PokeParaGet( &PokeParaMine[FPokeNo], ID_hp );

	if( hp >= ( hp_max / 5 ) )	return	TRUE;
	return	FALSE;
}

//-------------------------------
//		ポケモン選択処理へ
//-------------------------------
void MilkNomiInit( u8 id )
{
	P_CARD->UseTask = PokeSelect;
	P_LIST->work[7] = TUKAIMASUKA_MSG;
	F_PokeSortSet(id);
}

//----------------------------------------------
//		回復させるポケモンが選択されたとき
//----------------------------------------------
static void PokeSelect( u8 id )
{
	u8	pos1 = ActWork[ P_CARD->cur[0] ].work[0];
	u8	pos2 = ActWork[ P_CARD->cur[1] ].work[0];
	u16	hp;

	if( pos1 >=6 || pos2 >= 6 ){
		PokemonSortEnd2(id);
		return;
	}

	P_ITEM->pp = &PokeParaMine[ ActWork[P_CARD->cur[1]].work[0] ];

	hp = PokeParaGet( P_ITEM->pp, ID_hp );

	if( hp == 0 || pos1 == pos2 || PokeParaGet( P_ITEM->pp, ID_hpmax ) == hp ){
		MilkNomiError(id);
		return;
	}

	SePlay( SE_KAIFUKU );

	P_ITEM->cursor = ActWork[ P_CARD->cur[0] ].work[0];
	P_ITEM->pp     = &PokeParaMine[P_ITEM->cursor];
	P_ITEM->item   = 0;
	P_ITEM->gauge_work = HP_WORK_INIT_VALUE;	// TYPE
	P_ITEM->returnAdrs = MilkNomiEnd;

	TaskTable[id].work[I_TEMP0] = PokeParaGet( P_ITEM->pp, ID_hpmax );
	TaskTable[id].work[I_TEMP1] = PokeParaGet( P_ITEM->pp, ID_hp );
	TaskTable[id].work[I_TEMP2] = TaskTable[id].work[I_TEMP0] / 5;	// RCV
//	TaskTable[id].work[I_TEMP3] = HP_WORK_INIT_VALUE;	// TYPE

	PokeListWinClear2();

	TaskTable[id].TaskAdrs = LifeGaugeDownMain;
//	P_LIST->work[15] = 0;
	P_LIST->work[15] = TaskTable[id].work[I_TEMP1];
}

//-------------------------------------------
//		選択したポケモンに使えないとき
//-------------------------------------------
static void MilkNomiErrorWait( u8 id )
{
	if( ListMsgStatus == 0 ){
		NMenuBoxClear( SCR_MSG_WINSX, SCR_MSG_WINSY, SCR_MSG_WINEX, SCR_MSG_WINEY );
		PokeListWinFixMsgPut2( TUKAIMASUKA_MSG, 0 );
		TaskTable[id].TaskAdrs = PokemonSort;
	}
}

static void MilkNomiError( u8 id )
{
	ListStatus = 0;
	PokeListWinClear2();
	PokeListScrMsgSet( msg_poke_use_error01, 1 );
	TaskTable[id].TaskAdrs = MilkNomiErrorWait;
}

//-----------------
//		終了
//-----------------
static void MilkNomiEnd( u8 id )
{
	PokeSortEndCancelParam();
	P_LIST->card_flg = 2;

	// カーソル復帰
//	ActAnmChg( &ActWork[ P_CARD->cur[1] ], 0 );
//	ActWork[ P_CARD->cur[1] ].x = ActWork[ P_CARD->cur[0] ].x;
//	ActWork[ P_CARD->cur[1] ].y = ActWork[ P_CARD->cur[0] ].y;
	DelActor( &ActWork[ P_CARD->cur[0] ] );

	// メッセージ表示
	NMenuBoxClear( SCR_MSG_WINSX, SCR_MSG_WINSY, SCR_MSG_WINEX, SCR_MSG_WINEY );
	PokeListWinFixMsgPut2( ERANDE_MSG, 0 );

	// メインタスク復帰
	ChangeBackTask( P_CARD->main_id );
}
