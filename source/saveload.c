//=========================================================================
//
//
//	saveload.c
//
//	2001.05.02	by tama
//
//	2001.11.21	by tama
//		SRAMの廃止、ゲーム進行データとボックスのセクタ切り離しなど
//=========================================================================

#include "agb.h"
#include "common.h"
#include "intr.h"
#include "../library/AgbFlash1M.h"


//#include "map.h"
//#include "fieldmap.h"
//#include "field.h"
//#include "pasocom.h"
//#include "rtctool.h"
#include "poketool.h"		//PokeParaMine
#include "fld_tool.h"		//SetContinueMapBySpID
#include "evobj.h"			//EvObj

#define	__SAVELOAD_H_GLOBAL__
#include "saveload.h"


//=========================================================================
//		定義
//=========================================================================

typedef struct {
	MINEITEM MyNormalItem[ MY_NORMAL_ITEM_MAX ];	//手持ちの普通の道具
	MINEITEM MyExtraItem[ MY_EXTRA_ITEM_MAX];		//手持ちの大切な道具
	MINEITEM MyBallItem[ MY_BALL_ITEM_MAX];			//手持ちのﾓﾝｽﾀｰﾎﾞｰﾙ
	MINEITEM MySkillItem[ MY_SKILL_ITEM_MAX];		//手持ちの技マシン
	MINEITEM MySeedItem[ MY_SEED_ITEM_MAX];			//手持ちのたね
	MAIL_DATA MailData[MAIL_STOCK_MAX];
}SAVE_ITEM;

//=========================================================================
//	セーブ領域
//=========================================================================

SYS_SAVE_DATA MyData = {};		// システムデータ

FIELD_SAVE_DATA Fld = {};		// ゲーム進行データ


SAVE_ITEM SaveItem = {};		// 手持ちどうぐ退避ワーク 


//=========================================================================
//	変数
//=========================================================================

SAVE_MEMORY_TYPE SaveMemType;

static const u32 SizeOfMyData = sizeof(MyData);
static const u32 SizeOfFld = sizeof(Fld);

static const u32 SizeOfSeedParam = sizeof(SEED_PARAM);
static const u32 SizeOfRamSeed = sizeof(RAM_SEED);
static const u32 SizeOfMail = sizeof(MAIL_DATA);
static const u32 SizeOfPokemonParam = sizeof(PokemonParam);

static const u32 SizeOfSaveItem = sizeof(SaveItem);




//=========================================================================
//
//	グローバル関数
//
//=========================================================================
//-------------------------------------------------------------------------
//　セーブロードシステムの初期化
//-------------------------------------------------------------------------
void SaveLoadSystemInit(void)
{
	if ( IdentifyFlash_1M() == 0 ) {
		SaveMemType = FLASH_1M_TYPE;
		FlashIntrInit();

	} else {
		SaveMemType = NO_MEMORY_TYPE;			// 認証失敗
	};
}


//=========================================================================
//
//	セーブ状態フラグのチェック
//
//=========================================================================
//-------------------------------------------------------------------------
//	特殊なコンティニュー状態かどうかのチェック
//	<戻り値>	1	特殊、指定マップに遷移して開始
//				0	通常
//-------------------------------------------------------------------------
int CheckContinueStatus( void )
{
	return MyData.save_flag;
}

//-------------------------------------------------------------------------
//	特殊コンティニュー状態クリア
//-------------------------------------------------------------------------
void InitContinueStatus( void )
{
	MyData.save_flag = 0;
}

//-------------------------------------------------------------------------
//	特殊コンティニュー状態セット
//-------------------------------------------------------------------------
void SetContinueStatus( void )
{
	MyData.save_flag = 1;
}

//-------------------------------------------------------------------------
//	通信モードセーブフラグセット
//-------------------------------------------------------------------------
void SetCommSaveFlag( void )
{
	SetContinueMapBySpID(0);
	MyData.save_flag = 1;
}

void ClearCommSaveFlag( void )
{
	MyData.save_flag = 0;
}


//=========================================================================
//
//	ゲームデータとテンポラリワークとのコピー処理
//
//=========================================================================

//-------------------------------------------------------------------------
//	手持ちポケモンデータの退避・復帰
//-------------------------------------------------------------------------
void BackUpPokeParaMine( void )
{
	int i;
	Fld.PokeCountTemoti = PokeCountMine;
	for( i=0; i<TEMOTI_POKEMAX; i++ ) Fld.PokeParaTemoti[i] = PokeParaMine[i];
}

void RecoverPokeParaMine( void )
{
	int i;
	PokeCountMine = Fld.PokeCountTemoti;
	for( i=0; i<TEMOTI_POKEMAX; i++ )PokeParaMine[i] = Fld.PokeParaTemoti[i];
}

//-------------------------------------------------------------------------
//-------------------------------------------------------------------------
void BackUpEvObj( void )
{
	int i;
	for ( i=0; i<EV_OBJ_MAX; i++ ) {
		Fld.EvObj[i] = EvObj[i];
	}
}

void RecoverEvObj( void )
{
	int i;
	for ( i=0; i<EV_OBJ_MAX; i++ ) {
		EvObj[i] = Fld.EvObj[i];
	}
}

//-------------------------------------------------------------------------
//-------------------------------------------------------------------------
void BackUpGameData( void )
{
	BackUpPokeParaMine();
	BackUpEvObj();
}

void RecoverGameData( void )
{
	RecoverPokeParaMine();
	RecoverEvObj();
}


//-------------------------------------------------------------------------
//	手持ちのどうぐを退避
//-------------------------------------------------------------------------
void BackUpTemotiItem(void)
{
	int i;

	for (i=0; i<MY_NORMAL_ITEM_MAX; i++)
		SaveItem.MyNormalItem[i] = Fld.MyNormalItem[i];

	for (i=0; i<MY_EXTRA_ITEM_MAX; i++)
		SaveItem.MyExtraItem[i] = Fld.MyExtraItem[i];

	for (i=0; i<MY_BALL_ITEM_MAX; i++)
		SaveItem.MyBallItem[i] = Fld.MyBallItem[i];

	for (i=0; i<MY_SKILL_ITEM_MAX; i++)
		SaveItem.MySkillItem[i] = Fld.MySkillItem[i];

	for (i=0; i<MY_SEED_ITEM_MAX; i++)
		SaveItem.MySeedItem[i] = Fld.MySeedItem[i];

	for (i=0; i<MAIL_STOCK_MAX; i++)
		SaveItem.MailData[i] = Fld.MailData[i];
}

//-------------------------------------------------------------------------
//	手持ちのどうぐを復帰
//-------------------------------------------------------------------------
void RecoverTemotiItem(void)
{
	int i;

	for (i=0; i<MY_NORMAL_ITEM_MAX; i++)
		Fld.MyNormalItem[i] = SaveItem.MyNormalItem[i];

	for (i=0; i<MY_EXTRA_ITEM_MAX; i++)
		Fld.MyExtraItem[i] = SaveItem.MyExtraItem[i];

	for (i=0; i<MY_BALL_ITEM_MAX; i++)
		Fld.MyBallItem[i] = SaveItem.MyBallItem[i];

	for (i=0; i<MY_SKILL_ITEM_MAX; i++)
		Fld.MySkillItem[i] = SaveItem.MySkillItem[i];

	for (i=0; i<MY_SEED_ITEM_MAX; i++)
		Fld.MySeedItem[i] = SaveItem.MySeedItem[i];

	for (i=0; i<MAIL_STOCK_MAX; i++)
		Fld.MailData[i] = SaveItem.MailData[i];
}

