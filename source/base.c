//=========================================================================================
//										秘密基地
//								2001/10/04 by nakahiro
//=========================================================================================
#include "common.h"
#include "base.h"
#include "jiki.h"
#include "fieldmap.h"
#include "fld_main.h"
#include "mapbg.h"
#include "mapparam.h"
#include "script.h"
#include "palanm.h"
#include "task.h"
#include "pm_str.h"
#include "fntequ.h"
#include "menu.h"
#include "fld_tool.h"
#include "fld_task.h"
#include "map_attr.h"
#include "poketool.h"
#include "fight.h"
#include "sxytype.h"
#include "pokesio.h"
#include "gds_main.h"
#include "gds_put.h"
#include "gds_get.h"
#include "mus_tool.h"
#include "fan.h"
#include "fe_base.h"
#include "mapname.h"
#include "itemtool.h"
#include "message.h"
#include "record.h"
#include "weather.h"

#include "../evdata/maparray.h"
#include "../evdata/sxysym.h"

#include "../data/gds_sym.h"

#include "syswork.h"
#include "sysflag.h"		//TMFLG_...
#include "../script/savework.h"		//OBJCHRWORK参照のため
#include "../script/saveflag.h"		//FE_...

//=========================================================================================
//									シンボル定義
//=========================================================================================
#define	BASE_ENTRY_MAX		10		// 基地登録最大数
#define	SECRET_BOX_CELL		544		// 秘密の箱セルコード（自分の基地のパソコン）
#define	BASE_BOARD_CELL		545		// 掲示板のセルコード（他人の基地のパソコン）
#define	BASE_NORMAL_CELL	522		// 基地の地面のセルコード

#define CAVE_MAKE_CELL_CODE		0x90	// 土の部屋が作れる場所のセルコード
#define CAVE_BASE_CELL_CODE		0x91	// 土の部屋のセルコード
#define ROCK_MAKE_CELL_CODE		0x92	// 石の部屋が作れる場所のセルコード
#define ROCK_BASE_CELL_CODE		0x93	// 石の部屋のセルコード
#define SAND_MAKE_CELL_CODE		0x94	// 砂の部屋が作れる場所のセルコード
#define SAND_BASE_CELL_CODE		0x95	// 砂の部屋のセルコード
#define TREE_L_MAKE_CELL_CODE	0x96	// 木の部屋（左）が作れる場所のセルコード
#define TREE_L_BASE_CELL_CODE	0x97	// 木の部屋（左）のセルコード
#define TREE_R_MAKE_CELL_CODE	0x9c	// 木の部屋（右）が作れる場所のセルコード
#define TREE_R_BASE_CELL_CODE	0x9d	// 木の部屋（右）のセルコード
#define GRASS_MAKE_CELL_CODE	0x98	// 草の部屋が作れる場所のセルコード
#define GRASS_BASE_CELL_CODE	0x99	// 草の部屋のセルコード
#define SIME_MAKE_CELL_CODE		0x9a	// 湿の部屋が作れる場所のセルコード
#define SIME_BASE_CELL_CODE		0x9b	// 湿の部屋のセルコード

// 登録リスト　タスクワーク
#define	WK_ENTRY_MAX	0	// 登録数
#define	WK_ENTRY_POS	1	// 選択位置
#define	WK_ENTRY_SCR	2	// スクロールカウンタ
#define	WK_ENTRY_POSMAX	3	// 選択数
#define	WK_RESET_NO		4	// 選択された基地番号

// 登録リスト表示座標
#define	ENTRY_LIST_WINX		17
#define	ENTRY_LIST_WINY		0
#define	ENTRY_LIST_WINEX	( ENTRY_LIST_WINX + 12 )
#define	ENTRY_LIST_WINEY	19

#define	LIST_SCR_CUR_X		( ( ENTRY_LIST_WINX + ( ENTRY_LIST_WINEX-ENTRY_LIST_WINX ) / 2 ) * 8 + 4 )
#define	LIST_SCR_CUR_UY		( ENTRY_LIST_WINY * 8 + 8 )
#define	LIST_SCR_CUR_DY		( ENTRY_LIST_WINEY * 8 )

// 登録解除メニュー座標
#define	ENTRY_MENU_WINX		1
#define	ENTRY_MENU_WINY		0
#define	ENTRY_MENU_WINEX	( ENTRY_MENU_WINX + 11 )
#define	ENTRY_MENU_WINEY	( ENTRY_MENU_WINY + 5 )

// 登録解除はい・いいえ座標
#define	ENTRY_YESNO_WINX	20
#define ENTRY_YESNO_WINY	8
#define	ENTRY_YESNO_WINEX	( ENTRY_YESNO_WINX + 6 )
#define ENTRY_YESNO_WINEY	( ENTRY_YESNO_WINY + 5 )


//=========================================================================================
//									プロトタイプ宣言
//=========================================================================================
extern void SetNowExitPos(void);

static void EntryListTaskInit( u8 id );
static void EntryListEnd( u8 id );
static void	DrawEntryListWin( u8 id );
static void EntryListTaskMain( u8 id );
static u8	EntryListSelectBaseNoGet( u8 pos );
static void EntryResetInit( u8 id );
static void ReturnEntrySelect( u8 id );
static void EntryResetMenuInit( u8 id );
static void EntryResetMenuMain( u8 id );
static void EntryResetYesNoInit( u8 id );
static void EntryResetYes( u8 id );
static void EntryResetNo( u8 id );

u8 GetOrusubanCharID( u8 no );	// お留守番キャラのIDを取得

//=========================================================================================
//									グローバル変数
//=========================================================================================
extern u16	field_CellAtbData[];
extern u16	AnswerWork;
extern const VM_CODE base_in_script[];
extern const VM_CODE base_in_obj_goods_init[];
extern const VM_CODE return_mine_base_board[];
extern const VM_CODE return_other_base_pc[];


// 基地の入り口セル番号
static const BaseExit	base_exit[] =
{
	{  38,  54 },	// 木（左）
	{  39,  55 },	// 木（右）
	{ 416, 417 },	// 土
	{ 424, 425 },	// 砂
	{ 432, 433 },	// 湿
	{ 520, 528 },	// 石
	{ 625, 632 },	// 草
};

static u8	BaseNo = 0;			// 基地番号

// 基地のマップデータテーブル
// ID. Exit, PC_X, PC_Y
static const s8 BaseMap_Tbl[] = {
	SP_BASE01, SP_BASE01_MAT00,  1,  3,
	SP_BASE07, SP_BASE07_MAT00,  5,  9,
	SP_BASE13, SP_BASE13_MAT00,  1,  3,
	SP_BASE19, SP_BASE19_MAT00,  7, 13,

	SP_BASE02, SP_BASE02_MAT00,  2,  3,
	SP_BASE08, SP_BASE08_MAT00,  9,  2,
	SP_BASE14, SP_BASE14_MAT00, 13,  4,
	SP_BASE20, SP_BASE20_MAT00,  1,  2,

	SP_BASE03, SP_BASE03_MAT00,  1,  3,
	SP_BASE09, SP_BASE09_MAT00,  1,  2,
	SP_BASE15, SP_BASE15_MAT00,  3, 15,
	SP_BASE21, SP_BASE21_MAT00,  3, 14,

	SP_BASE04, SP_BASE04_MAT00,  9,  3,
	SP_BASE10, SP_BASE10_MAT00,  8,  7,
	SP_BASE16, SP_BASE16_MAT00,  3,  6,
	SP_BASE22, SP_BASE22_MAT00,  5,  9,

	SP_BASE05, SP_BASE05_MAT00,  2,  3,
	SP_BASE11, SP_BASE11_MAT00,  5,  6,
	SP_BASE17, SP_BASE17_MAT00, 15,  3,
	SP_BASE23, SP_BASE23_MAT00,  4, 10,

	SP_BASE06, SP_BASE06_MAT00,  3,  3,
	SP_BASE12, SP_BASE12_MAT00,  1,  2,
	SP_BASE18, SP_BASE18_MAT00,  7,  8,
	SP_BASE24, SP_BASE24_MAT00,  9,  6,
};

static const MENU_ITEM entry_list_menu[] =
{
	{ str_baselist_kaizyo, EntryResetInit    },	// とうろくかいじょ
	{ str_modoru,          ReturnEntrySelect },	// もどる
};

static const SELECT_ITEM EntryReset = { EntryResetYes, EntryResetNo };

// お留守番キャラコード
static const u8	orusuban_char[] = {
	CAPBOY1,		// たんぱん　こぞう
	CAPBOY2,		// むしとり　しょうねん
	BOY4,			// おぼっちゃま
	BOYSCOUT1,		// キャンプボーイ
	TRAINERM1,		// エリートトレーナー

	SCHOOLW1,		// ミニスカート
	GIRL3,			// じゅくがえり
	WOMAN1,			// おじょうさま
	GIRLSCOUT1,		// ピクニックガール
	TRAINERW1		// エリートトレーナー
};


//---------------------------
//		秘密基地初期化
//---------------------------
static void InitBaseAdrs( SECRET_BASE_DATA * base )
{
	u16	i,j;

	base->pos = 0;

	for( i=0; i<PERSON_NAME_SIZE; i++ )
		base->name[i] = EOM_;

	for( i=0; i<4; i++ )
		base->id[i] = 0;

	base->org_count     = 0;
	base->enter_count   = 0;
	base->exchange_item = 0;

	base->entry_flag = 0;
	base->fight_flag = 0;
	base->sex = 0;
	base->flg = 0;

	for( i=0; i<16; i++){
		base->furniture_id[i]  = 0;
		base->furniture_pos[i] = 0;
	}

	for( i=0; i<TEMOTI_POKEMAX; i++ ){
		for( j=0; j<4; j++ ){
			base->battle.waza[i*4+j] = 0;
		}
		base->battle.p_rnd[i]   = 0;
		base->battle.exp[i]     = 0;
		base->battle.mons_no[i] = 0;
		base->battle.item[i]    = 0;
		base->battle.level[i]   = 0;
	}
}

void InitBase( u8 base_no )
{
	InitBaseAdrs( &Fld.SecretBase[ base_no ] );
}

//全初期化
void InitAllBase(void)
{
	u16	i;

	for( i=0; i<SECRET_BASE_MAX; i++ )
		InitBase( i );
}

//---------------------------
//		基地番号をセット
//---------------------------
void SetBaseCheck(void)
{
	BaseNo = ScriptParameter0;
}

//--------------------------------
//		基地ありなしチェック
//--------------------------------
void BaseCheck(void)
{
	u16	i;

	AnswerWork = 0;

	for( i=0; i<SECRET_BASE_MAX; i++ ){
		if(	BaseNo == Fld.SecretBase[i].pos ){
			AnswerWork = 1;
			SetEventWorkValue( WK_BASE_POSNO, i );
			break;
		}
	}
}

//-----------------------------------------
//		自分の基地のありなしチェック
//-----------------------------------------
void MyBaseCheck(void)
{
	if(	Fld.SecretBase[0].pos != 0 )	AnswerWork = 1;
	else								AnswerWork = 0;
}


//--------------------------
//		基地の種類設定
//--------------------------
static u8 BaseTypeSet(void)
{
	s16	px,py,atb;

	GetHeroFrontCellPos(&px,&py);
	atb = GetCellAttribute(px,py) & 0xfff;

	//土部屋を作成
	if( atb == CAVE_MAKE_CELL_CODE || atb == CAVE_BASE_CELL_CODE )
		return	1;
	//石の部屋を作成
	if( atb == ROCK_MAKE_CELL_CODE || atb == ROCK_BASE_CELL_CODE )
		return	2;
	//湿の部屋を作成
	if( atb == SIME_MAKE_CELL_CODE || atb == SIME_BASE_CELL_CODE )
		return	3;
	//砂の部屋を作成
	if( atb == SAND_MAKE_CELL_CODE || atb == SAND_BASE_CELL_CODE )
		return	4;
	//木の部屋を作成
	if( atb == TREE_L_MAKE_CELL_CODE || atb == TREE_L_BASE_CELL_CODE ||
		atb == TREE_R_MAKE_CELL_CODE || atb == TREE_R_BASE_CELL_CODE )
		return	5;
	//草の部屋を作成
	if( atb == GRASS_MAKE_CELL_CODE || atb == GRASS_BASE_CELL_CODE )
		return	6;

	return	0;
}

void ScriptBaseTypeSet(void)
{
	ScriptParameter3 = BaseTypeSet();
}

//----------------------------------------------
//		指定したアトリビュートのセルを取得
//----------------------------------------------
s16	GetCellForAttribute(u16 *cell,u8 attr)
{
	u16	i;

	for( i=0; i<512; i++ ){
		if( (cell[i] & 0xfff) == attr )		return	i;
	}

	return	-1;
}

//--------------------------------
//		指定セルの場所を取得
//--------------------------------
static void CheckCellPos( s16 * px, s16 * py, u16 cell_no )
{
	s16	i,j;

	for( i=0; i<NowMap.Screen->Ysize; i++ ){
		for( j=0; j<NowMap.Screen->Xsize; j++ ){
			if((NowMap.Screen->ScreenData[i*NowMap.Screen->Xsize+j] & 0x3ff)==cell_no){
				*px = j;
				*py = i;
				return;
			}
		}
	}
}

//-----------------------------
//		セルを張りかえる
//-----------------------------
void BaseSetCell(void)
{
	s16	px,py,cell;
	u16	i;

	GetHeroFrontCellPos(&px,&py);

	cell = GetCellCode( px, py );

	for( i=0; i<7; i++ ){
		if( base_exit[i].before == cell ){
			SetCell( px, py, (base_exit[i].after |  CELL_HITCHECK_MASK) );
			RewriteSingleBG( px, py );
			return;
		}
	}

	for( i=0; i<7; i++ ){
		if( base_exit[i].after == cell ){
			SetCell( px, py, (base_exit[i].before |  CELL_HITCHECK_MASK) );
			RewriteSingleBG( px, py );
			return;
		}
	}
}

//------------------------------------------
//		基地の名前データの最後尾を取得
//------------------------------------------
u8	GetNameEndPos( u8 * name )
{
	u8	i;

	for( i=0; i<PERSON_NAME_SIZE; i++ ){
		if( name[i] == EOM_ )	return	i;
	}
	return	PERSON_NAME_SIZE;
}

//----------------------------
//		自分の基地を作成
//----------------------------
void BaseSet(void)
{
	u16	i;

	Fld.SecretBase[0].pos = BaseNo;

	for( i=0; i<4; i++ ){
		Fld.SecretBase[0].id[i] = MyData.ID[i];
	}

	SetEventWorkValue( WK_BASE_POSNO, 0 );

	PM_strncpy( Fld.SecretBase[0].name, MyData.my_name, GetNameEndPos( MyData.my_name ) );

	Fld.SecretBase[0].sex = MyData.my_sex;

	//自分の基地があるマップナンバーを保存
	SetEventWorkValue( WK_BASE_MAPNO, NowMap.WorldPos );
}

//----------------------------------------
//		マップ切り替え時の基地確認
//----------------------------------------
void ChangeBaseCell( const SXY_DATA *bg )
{
	u16	i,j,k;
	s16	cell;

	for( i=0; i<bg->evBgMax; i++){
		if( bg->BgData[i].type == BG_BASE ){
			for( j=0; j<SECRET_BASE_MAX; j++ ){
				if( Fld.SecretBase[j].pos == (u32)bg->BgData[i].script ){
					cell = GetCellCode(	MAP_LEFT_MARGIN + bg->BgData[i].posX,
										MAP_UP_MARGIN + bg->BgData[i].posY	);
					for( k=0; k<7; k++ ){
						if( base_exit[k].before == cell ){
							SetCell(MAP_LEFT_MARGIN + bg->BgData[i].posX,
									MAP_UP_MARGIN + bg->BgData[i].posY,
									(base_exit[k].after | CELL_HITCHECK_MASK) );
							break;
						}
					}
					break;
				}
			}
		}
	}
}

//-------------------------------------
//		秘密基地へマップ切り替え
//-------------------------------------
static void SetNextMapBaseID(void)
{
	s8	type;

	type = ( BaseNo / 10 ) << 2;

	NextMapSetByID( SP, BaseMap_Tbl[type], BaseMap_Tbl[type+1] );
}

static void ChangeBaseFadeOut(u8 id)
{
	u16	pos = 0;

	switch( TaskTable[id].work[0] ){
	case 0:
//		SetForceEvent();
		TaskTable[id].work[0] = 1;
		break;
	case 1:
		if(!(FadeData.fade_sw))	TaskTable[id].work[0] = 2;
		break;
	case 2:
		pos = GetEventWorkValue( WK_BASE_POSNO );

		if(	Fld.SecretBase[ pos ].enter_count < 0xff)
			Fld.SecretBase[ pos ].enter_count++;

		SetNextMapBaseID();

		SetNextWorldPosition();

//		pFieldRecoverFunc = AddFieldInTask;
		pFieldRecoverFunc = AddScriptFieldInTask;

		MainProcChange( FieldMainInit );
		DelTask(id);
		break;
	}
}

void ChangeBaseMap(void)
{
	AddTask( ChangeBaseFadeOut, 0 );
//	PaletteFadeReq(0xffffffff,0,0,16,0);
	FieldFadeControl( FIELD_BLACK_OUT, 0 );
	/* 現在位置を特殊接続として登録 */
	SetSpecialMapID( 0, Fld.MapID.div_id, Fld.MapID.map_id, -1 );
}

//-------------------------------------------------
//		秘密基地作成直後はマップ名を表示しない
//-------------------------------------------------
u8	BaseNameDraw(void)
{
	if( NowMap.type == MAPTYPE_BASE && GetEventWorkValue(WK_SCENE_BASE_MAKE) == 0 )
		return	FALSE;
	return	TRUE;
}

//---------------------------------
//		作成時に秘密の箱を置く
//---------------------------------
static void MakeBaseFinal3( u8 id )
{
	EvObjChgSite( &EvObj[MyMoveState.evobjno], SITE_U );

//	if( !(FadeData.fade_sw) ){
	if( FieldFadeinCheck() == 1 ){
		ContinueFieldScript();
		DelTask(id);
	}
}

static void MakeBaseFinal2(void)
{
	s16	i,j;

	SetForceEvent();

	EraseMapName();
	CheckCellPos( &i, &j, SECRET_BOX_CELL );
	SetCell( MAP_LEFT_MARGIN+i, MAP_UP_MARGIN+j, SECRET_BOX_CELL | CELL_HITCHECK_MASK );
	RewriteSingleBG( MAP_LEFT_MARGIN+i, MAP_UP_MARGIN+j );
//	PaletteFadeReq( 0xffffffff, 0, 16, 0, 0 );
	FieldFadeBlackInSet();
	AddTask( MakeBaseFinal3, 0 );
}

static void MakeBaseFinalTask( u8 id )
{
	s8	type;

	if( !(FadeData.fade_sw) ){
		type = ( BaseNo / 10 ) << 2;
		NextMapSetDirect(
			Fld.MapID.div_id, Fld.MapID.map_id, NO_EXIT_ID,
			BaseMap_Tbl[type+2], BaseMap_Tbl[type+3] );
		SetNextWorldPosition();
		pFieldRecoverFunc = MakeBaseFinal2;
		MainProcChange( FieldMainInit );
		DelTask(id);
	}
}
void MakeBaseFinal(void)
{
	u8	id;

	id = AddTask( MakeBaseFinalTask, 0 );
	TaskTable[id].work[0] = 0;
//	PaletteFadeReq(0xffffffff,0,0,16,0);
	FieldFadeControl( FIELD_BLACK_OUT, 0 );
}

//----------------------------
//		グッズを配置する
//----------------------------
static u8 CheckBaseMap(void)
{
	if( Fld.MapID.div_id == SP &&
		( Fld.MapID.map_id == SP_BASE01 || Fld.MapID.map_id == SP_BASE02 ||
		  Fld.MapID.map_id == SP_BASE03 || Fld.MapID.map_id == SP_BASE04 ||
		  Fld.MapID.map_id == SP_BASE05 || Fld.MapID.map_id == SP_BASE06 ||
		  Fld.MapID.map_id == SP_BASE07 || Fld.MapID.map_id == SP_BASE08 ||
		  Fld.MapID.map_id == SP_BASE09 || Fld.MapID.map_id == SP_BASE10 ||
		  Fld.MapID.map_id == SP_BASE11 || Fld.MapID.map_id == SP_BASE12 ||
		  Fld.MapID.map_id == SP_BASE13 || Fld.MapID.map_id == SP_BASE14 ||
		  Fld.MapID.map_id == SP_BASE15 || Fld.MapID.map_id == SP_BASE16 ||
		  Fld.MapID.map_id == SP_BASE17 || Fld.MapID.map_id == SP_BASE18 ||
		  Fld.MapID.map_id == SP_BASE19 || Fld.MapID.map_id == SP_BASE20 ||
		  Fld.MapID.map_id == SP_BASE21 || Fld.MapID.map_id == SP_BASE22 ||
		  Fld.MapID.map_id == SP_BASE23 || Fld.MapID.map_id == SP_BASE24 ) )
	{
		return	TRUE;	// 基地
	}

	return	FALSE;		// 基地以外
}

// セル書き換え
void SetBaseGoods( u8 pc_del )
{
	u16	i, j, pos;

	if( CheckBaseMap() == FALSE )	return;

//	BaseCheck();	// 配列番号取得

	pos = GetEventWorkValue( WK_BASE_POSNO );

	// BGグッズ
	for( i=0; i<16; i++ ){

		if( Fld.SecretBase[pos].furniture_id[i] != 0 &&
			Fld.SecretBase[pos].furniture_id[i] <= GOODS_DATA_MAX &&
			base_goods[ Fld.SecretBase[pos].furniture_id[i] ].type != DESK_TOP )
		{
			SetGoodsCell(
				MAP_LEFT_MARGIN + ( Fld.SecretBase[pos].furniture_pos[i] >> 4 ),
				MAP_UP_MARGIN + ( Fld.SecretBase[pos].furniture_pos[i] & 0xf ),
				Fld.SecretBase[pos].furniture_id[i] );
		}
	}

	// 秘密の箱
	if( pos != 0 ){
		CheckCellPos( &i, &j, SECRET_BOX_CELL );
		SetCell( MAP_LEFT_MARGIN+i, MAP_UP_MARGIN+j, BASE_BOARD_CELL | CELL_HITCHECK_MASK );
	}else{
		if( pc_del == 1 && GetEventWorkValue( WK_SCENE_BASE_GOODS ) == 1 ){
			CheckCellPos( &i, &j, SECRET_BOX_CELL );
			SetCell( MAP_LEFT_MARGIN+i, MAP_UP_MARGIN+j, BASE_NORMAL_CELL | CELL_HITCHECK_MASK );
		}
	}
}


//02/03/04 changed nohara
#define		GOODS_FLAG_START	(FE_BASE_GOODS_FLAG01)
void SetOBJGoods(void)
{
	u8	 type;
	u8	 i,j;
	u8 * id;
	u8 * pos;
	u8   max;
	u8   atb;
	u16  base_pos;

	base_pos = GetEventWorkValue( WK_BASE_POSNO );

	if( CheckBaseMap() == FALSE ){
		id  = Fld.MyRoomFurnitureID;
		pos = Fld.MyRoomFurniturePos;
		max = 12;
	}else{
		id  = Fld.SecretBase[ base_pos ].furniture_id;
		pos = Fld.SecretBase[ base_pos ].furniture_pos;
		max = 16;
	}

	for( j=0; j<max; j++ ){
		if( id[j] != 0 ){
			type = base_goods[ id[j] ].type;

			if( type == DESK_TOP ){
				for( i=0; i<(NowMap.Sxy->ObjMax) ; i++ ){
					if( NowMap.Sxy->ObjData[i].ev_flag == (GOODS_FLAG_START+ScriptParameter0) )
						break;
				}

				if( i != NowMap.Sxy->ObjMax ){

					ScriptParameter2 = pos[j] >> 4;
					ScriptParameter3 = pos[j] & 0xf;

					atb = GetCellAttribute(
						ScriptParameter2+MAP_LEFT_MARGIN,
						ScriptParameter3+MAP_UP_MARGIN );

					if( ATR_IsGoodsPutGoodsCheck( atb ) == TRUE ||
						ATR_IsBigDollPutCheck( atb ) == TRUE )
					{
						AnswerWork = OBJCHRWORK1+NowMap.Sxy->ObjData[i].obj_code-WKOBJCODE1;
						SetEventWorkValue( AnswerWork, base_goods[ id[j] ].cell[0] );

						AnswerWork = NowMap.Sxy->ObjData[i].id;

						EventFlagReset( GOODS_FLAG_START+ScriptParameter0 );
						EvObjAddId( (u8)AnswerWork, (u8)Fld.MapID.map_id, (u8)Fld.MapID.div_id );
						EvObjPosAllChgId(
							(u8)AnswerWork, (u8)Fld.MapID.map_id, (u8)Fld.MapID.div_id,
							(s16)ScriptParameter2, (s16)ScriptParameter3 );
						EvObjSxyIdPosChange( (u8)AnswerWork, (u8)Fld.MapID.map_id, (u8)Fld.MapID.div_id );
						ScriptParameter0++;
					}
				}
			}
		}
	}
}

// お留守番キャラのキャラコードをセット
void SetOrusubanOBJCode(void)
{
	u16	pos = GetEventWorkValue( WK_BASE_POSNO );

	SetEventWorkValue( OBJCHRWORK16, orusuban_char[ GetOrusubanCharID(pos) ] );
}


//------------------------
//		基地番号取得
//------------------------
void GetBaseNo( EV_POS *pos, const SXY_DATA *bg )
{
	s16	i;

	for( i=0; i<bg->evBgMax; i++){
		if( bg->BgData[i].type == BG_BASE ){
			if( pos->x == MAP_LEFT_MARGIN+bg->BgData[i].posX &&
				pos->y == MAP_UP_MARGIN+bg->BgData[i].posY )
			{
				BaseNo = (u8)( (u32)bg->BgData[i].script );
				break;
			}
		}
	}
}

//--------------------------------
//		十字キーで基地の中へ
//--------------------------------
void BaseDoorIn( EV_POS *pos, const SXY_DATA *bg )
{
	GetBaseNo( pos, bg );				// 基地番号取得
	BaseCheck();						// 配列番号取得
	StartFieldScript( base_in_script ); // スクリプト起動(タスクで制御)
}

//---------------------------
//		話しかけの確認
//---------------------------
u8	TalkBaseDoorCheck(void)
{
	SetBaseCheck();
	BaseCheck();
	if( AnswerWork == 1 )	return	FALSE;
	return	TRUE;
}

//----------------------------------
//		基地を出てマップへ復帰
//----------------------------------
static void BaseReturnFadeOut(u8 id)
{
	switch( TaskTable[id].work[0] ){
	case 0:
		SetForceEvent();
		TaskTable[id].work[0] = 1;
		break;

	case 1:
		if(!(FadeData.fade_sw))	TaskTable[id].work[0] = 2;
		break;

	case 2:
		NextMapSetBySpID( SPFIELD_MAP_EXIT02 );	/* 入ったときに登録した特殊接続先をセット */
		SetNextWorldPosition();						/* マップ遷移処理 */

		pFieldRecoverFunc = AddFieldInTask;
		MainProcChange( FieldMainInit );
		ResetForceEvent();
		DelTask(id);
		break;
	}
}

void BaseOut(void)
{
	AddTask( BaseReturnFadeOut, 0 );
	FieldFadeControl( FIELD_BLACK_OUT, 0 );
//	PaletteFadeReq( 0xffffffff, 0, 0, 16, 0 );
}

//------------------------------
//		自分の基地かどうか
//------------------------------
void BaseBoardCheck(void)
{
	if(	Fld.SecretBase[0].pos != BaseNo )	AnswerWork = 1;
	else									AnswerWork = 0;
}

//----------------------------
//		基地の場所を取得
//----------------------------
u8	GetBasePos( u8 no )
{
	s16	i;

	for( i=0; i<SECRET_BASE_MAX; i++ ){
		if( Fld.SecretBase[i].pos == no )
			return	i;
	}

	return	0;	//ダミー
}

//---------------------------
//		基地の名前作成
//---------------------------
u8 * MakeBaseName2( u8 * str, u8 no )
{
	u8 * eom;
	u8 * name;

	name = Fld.SecretBase[ no ].name;
	eom  = PM_strncpy( str, name, GetNameEndPos( name ) );
	*eom = EOM_;
	return	PM_strcat( str, str_kiti_name );
}

u8 * MakeBaseName( u8 * str )
{
	return	MakeBaseName2( str, GetEventWorkValue( WK_BASE_POSNO ) );
}

void MakeBaseNameScript(void)
{
	u8 * eom;
	u8 * name;
	u8   pos;
	
	pos  = GetEventWorkValue( WK_BASE_POSNO );
	name = Fld.SecretBase[pos].name;
	eom  = PM_strncpy( StrTempBuffer0, name, GetNameEndPos( name ) );
	*eom = EOM_;
}

//---------------------------------
//		基地が登録されているか
//---------------------------------
static u8 CheckBaseFlag( u8 no )
{
	if( Fld.SecretBase[no].flg != 0 )	return	TRUE;
	return	FALSE;
}

//---------------------------------
//		手持ちポケモンをセット
//---------------------------------
// 努力値の平均を取得
static u8 GetPokeExpAverage( PokemonParam * pp )
{
	u16	exp;

	exp = PokeParaGet( pp, ID_hp_exp );			// ヒットポイント努力値
	exp += PokeParaGet( pp, ID_pow_exp );		// 攻撃力努力値
	exp += PokeParaGet( pp, ID_def_exp );		// 防御力努力値
	exp += PokeParaGet( pp, ID_agi_exp );		// 素早さ努力値
	exp += PokeParaGet( pp, ID_spepow_exp );	// 特殊攻撃努力値
	exp += PokeParaGet( pp, ID_spedef_exp );	// 特殊防御努力値

	return	(u8)( exp / 6 );
}

void BasePokeSet(void)
{
	u16	i,j,no=0;

	BASE_BATTLE_DATA * btl = &Fld.SecretBase[0].battle;

	for( i=0; i<TEMOTI_POKEMAX; i++ ){

		for( j=0; j<4; j++ )
			btl->waza[i*4+j] = 0;
		btl->mons_no[i] = 0;
		btl->item[i]    = 0;
		btl->level[i]   = 0;
		btl->p_rnd[i]   = 0;
		btl->exp[i]     = 0;

		if( PokeParaGet( &PokeParaMine[i], ID_monsno ) != 0 &&
			PokeParaGet( &PokeParaMine[i], ID_tamago_flag ) == 0 )
		{
			for( j=0; j<4; j++ )
				btl->waza[no*4+j] = PokeParaGet( &PokeParaMine[i], ID_waza1 + j );
			btl->mons_no[no] = PokeParaGet( &PokeParaMine[i], ID_monsno );
			btl->item[no]    = PokeParaGet( &PokeParaMine[i], ID_item );
			btl->level[no]   = PokeParaGet( &PokeParaMine[i], ID_level );
			btl->p_rnd[no]   = PokeParaGet( &PokeParaMine[i], ID_personal_rnd );
			btl->exp[no]     = GetPokeExpAverage( &PokeParaMine[i] );
			no++;
		}

	}
}

//-----------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------

//-----------------------
//		引越し処理
//-----------------------
// 基地をつくったとき
void BaseMove(void)
{
	u16	org_count;

	org_count = Fld.SecretBase[0].org_count;
	InitBase(0);
	Fld.SecretBase[0].org_count = org_count;
	BaseOut();
}
// 引越しを選んだとき
void BaseMove2(void)
{
	IncRecord( CNT_AGITTRANS );
	BaseMove();
}


//--------------------------------------------------
//	別の場所に基地を作成するときの引越し処理
//--------------------------------------------------
// 同マップ内のセル張り替え
static void MyBaseNewMakeMoveMapChangeCell(void)
{
	u16	i,j;
	s16	cell;

	const SXY_DATA * bg = NowMap.Sxy;

	for( i=0; i<bg->evBgMax; i++){
		if( bg->BgData[i].type == BG_BASE ){

			if( Fld.SecretBase[0].pos == (u32)bg->BgData[i].script ){
				cell = GetCellCode(	MAP_LEFT_MARGIN + bg->BgData[i].posX,
									MAP_UP_MARGIN + bg->BgData[i].posY	);

				for( j=0; j<7; j++ ){
					if( base_exit[j].after == cell ){
						SetCell( MAP_LEFT_MARGIN + bg->BgData[i].posX,
								 MAP_UP_MARGIN + bg->BgData[i].posY,
								 (base_exit[j].before | CELL_HITCHECK_MASK) );
						break;
					}
				}

				MakeMapBG();
				break;
			}
		}
	}
}

// メイン
void MyBaseNewMakeMove(void)
{
	u16	org_count;

	MyBaseNewMakeMoveMapChangeCell();

	IncRecord( CNT_AGITTRANS );

	org_count = Fld.SecretBase[0].org_count;
	InitBase(0);
	Fld.SecretBase[0].org_count = org_count;
}

//----------------------------
//		登録状況を調べる
//----------------------------
static u8 CheckEntryNo( void )
{
	u8	no = 0;
	s16	i;

	for( i=1; i<SECRET_BASE_MAX; i++ ){
		if( CheckBaseFlag( (u8)i ) == TRUE )
			no++;
	}
	return	no;
}

void CheckBaseEntry( void )
{
	if( CheckBaseFlag( GetBasePos( BaseNo ) ) == TRUE ){
		AnswerWork = 1;			//登録されている
	}else{
		if( CheckEntryNo() >= BASE_ENTRY_MAX )
			AnswerWork = 2;		//登録MAX
		else
			AnswerWork = 0;		//登録可能
	}
}

//-------------------------------
//		登録をする/解除する
//-------------------------------
void ChangeBaseEntry( void )
{
	Fld.SecretBase[ GetBasePos( BaseNo ) ].flg ^= 1;
	EventFlagSet( FE_BASE_ENTRY );
}

//-----------------------
//		もようがえ
//-----------------------
void BaseRearrangeCheck(void)
{
	AddTask( RearrangeTaskInit, 0 );
}

//-----------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------

//----------------------
//		登録リスト
//----------------------
void BaseEntryListInit(void)
{
	AddTask( EntryListTaskInit, 0 );
}

//---------------------------
//		登録リスト作成
//---------------------------
static void EntryListTaskInit( u8 id )
{
	s16 * wk;

	SetForceEvent();
	ScrActInit();
	AddMarkPal();
	
	wk = TaskTable[id].work;

	wk[ WK_ENTRY_MAX ] = (s16)CheckEntryNo();

	if( wk[ WK_ENTRY_MAX ] != 0 ){
		if( wk[ WK_ENTRY_MAX ] > 7 )	wk[ WK_ENTRY_POSMAX ] = 7;
		else	wk[ WK_ENTRY_POSMAX ] = wk[ WK_ENTRY_MAX ];
		wk[ WK_ENTRY_POS ] = 0;
		wk[ WK_ENTRY_SCR ] = 0;
		NMenuBoxClear( 0, 0, 29, 19 );
		DrawEntryListWin(id);
		TaskTable[id].TaskAdrs = EntryListTaskMain;
	}else{
		SetTalkMsg( id, msg_base_no_entry_list, EntryListEnd, 0 );
	}
}

//----------------------------
//		登録リスト表示
//----------------------------
static void	DrawEntryList( u8 id )
{
	s16 * wk = TaskTable[id].work;
	u8	start = 0;
	u8	cnt = 0;
	u8	i;

	for( i=1; i<SECRET_BASE_MAX; i++ ){
		if( start == wk[ WK_ENTRY_SCR ] ){
			start = i;
			break;
		}
		if( CheckBaseFlag(i) == TRUE )	start++;
	}

	for( i=start; i<SECRET_BASE_MAX; i++ ){
		if( CheckBaseFlag(i) == TRUE ){
			MakeBaseName2( StrTempBuffer0, i );
			NMenuBoxWrite( ENTRY_LIST_WINX+2, ENTRY_LIST_WINY+2+(cnt<<1), ENTRY_LIST_WINEX-1, ENTRY_LIST_WINY+3+(cnt<<1) );
			NMenuMsgWrite( StrTempBuffer0, ENTRY_LIST_WINX+2, ENTRY_LIST_WINY+2+(cnt<<1) );
			cnt++;
			if( cnt == 8 )	break;
		}
	}

	if( cnt < 8 ){
		NMenuBoxWrite( ENTRY_LIST_WINX+2, ENTRY_LIST_WINY+2+(cnt<<1), ENTRY_LIST_WINEX-1, ENTRY_LIST_WINY+3+(cnt<<1) );
		NMenuMsgWrite( str_modoru, ENTRY_LIST_WINX+2, ENTRY_LIST_WINY+2+(cnt<<1) );
		DelScrCurActor( MARK_ACT_D_CURSOR );
		if( cnt != 7 )
			NMenuBoxWrite( ENTRY_LIST_WINX+2, ENTRY_LIST_WINY+2+((cnt+1)<<1), ENTRY_LIST_WINEX-1, ENTRY_LIST_WINEY-1 );
	}else{
		AddScrCurActor( MARK_ACT_D_CURSOR, LIST_SCR_CUR_X, LIST_SCR_CUR_DY );
	}

	if( wk[ WK_ENTRY_SCR ] == 0 )
		DelScrCurActor( MARK_ACT_U_CURSOR );
	else
		AddScrCurActor( MARK_ACT_U_CURSOR, LIST_SCR_CUR_X, LIST_SCR_CUR_UY );

}

static void	DrawEntryListWin( u8 id )
{
	s16 * wk = TaskTable[id].work;

	NMenuWinBoxWrite( ENTRY_LIST_WINX, ENTRY_LIST_WINY, ENTRY_LIST_WINEX, ENTRY_LIST_WINEY );
	NMenuVCursorInit( ENTRY_LIST_WINX+1, ENTRY_LIST_WINY+2, wk[ WK_ENTRY_POSMAX ]+1, wk[ WK_ENTRY_POS ] );
	DrawEntryList( id );
}

//---------------------------
//		登録リスト選択
//---------------------------
static void EntryListTaskMain( u8 id )
{
	s16 * wk = TaskTable[id].work;

	if( sys.Repeat & U_KEY ){
		if( wk[ WK_ENTRY_POS ] != 0 ){
			SePlay( SE_SELECT );
			wk[ WK_ENTRY_POS ] = (s16)NMenuVCursorSet(-1);
		}else{
			if( wk[ WK_ENTRY_SCR ] != 0 ){
				SePlay( SE_SELECT );
				wk[ WK_ENTRY_SCR ]--;
				DrawEntryList(id);
			}
		}
		return;
	}

	if( sys.Repeat & D_KEY ){
		if( wk[ WK_ENTRY_POS ] == wk[ WK_ENTRY_POSMAX ] &&
			wk[ WK_ENTRY_SCR ] + wk[ WK_ENTRY_POS ] != wk[ WK_ENTRY_MAX ] )
		{
			SePlay( SE_SELECT );
			wk[ WK_ENTRY_SCR ]++;
			DrawEntryList(id);
		}else{
			if( wk[ WK_ENTRY_POS ] != wk[ WK_ENTRY_POSMAX ] ){
				SePlay( SE_SELECT );
				wk[ WK_ENTRY_POS ] = (s16)NMenuVCursorSet(1);
			}
		}
		return;
	}

	if( sys.Trg & A_BUTTON ){
		SePlay( SE_SELECT );
		if( wk[ WK_ENTRY_POS ] + wk[ WK_ENTRY_SCR ] == wk[ WK_ENTRY_MAX ] ){
			NMenuBoxClear( 0, 0, 29, 19 );
			EntryListEnd(id);
		}else{
			wk[WK_RESET_NO] = (s16)EntryListSelectBaseNoGet( (u8)(wk[WK_ENTRY_POS]+wk[WK_ENTRY_SCR]) );
			EntryResetMenuInit(id);
		}
		return;
	}

	if( sys.Trg & B_BUTTON ){
		SePlay( SE_SELECT );
		NMenuBoxClear( 0, 0, 29, 19 );
		EntryListEnd(id);
	}
}

//----------------------------------
//		選択中の基地番号を取得
//----------------------------------
static u8 EntryListSelectBaseNoGet( u8 pos )
{
	u8	i;
	u8	cnt = 0;

	for( i=1; i<SECRET_BASE_MAX; i++ ){
		if( CheckBaseFlag(i) == TRUE ){
			if( pos == cnt )	return	i;
			cnt++;
		}
	}
	return	0;
}

//-------------------------------
//		解除ウィンドウ表示
//-------------------------------
static void EntryResetMenuInit( u8 id )
{
	ScrCurActAnmStopInit( MARK_ACT_U_CURSOR );
	ScrCurActAnmStopInit( MARK_ACT_D_CURSOR );
	NMenuWinBoxWrite( ENTRY_MENU_WINX, ENTRY_MENU_WINY, ENTRY_MENU_WINEX, ENTRY_MENU_WINEY );
	NMenuFixListWrite( ENTRY_MENU_WINX+2, ENTRY_MENU_WINY+1, 2, entry_list_menu );
	NMenuVCursorInit( ENTRY_MENU_WINX+1, ENTRY_MENU_WINY+1, 2, 0 );

	TaskTable[id].TaskAdrs = EntryResetMenuMain;
}

//-------------------------------
//		解除ウィンドウ選択
//-------------------------------
static void EntryResetMenuMain( u8 id )
{
	MENUFUNC	func;

	if( sys.Repeat & U_KEY ){
		if( NMenuVCursorPosGet() != 0 ){
			SePlay( SE_SELECT );
			NMenuVCursorSet(-1);
		}
		return;
	}

	if( sys.Repeat & D_KEY ){
		if( NMenuVCursorPosGet() != 1 ){
			SePlay( SE_SELECT );
			NMenuVCursorSet(1);
		}
		return;
	}

	if( sys.Trg & A_BUTTON ){
		SePlay( SE_SELECT );
		func = entry_list_menu[ NMenuVCursorPosGet() ].ptr;
		func(id);
		return;
	}

	if( sys.Trg & B_BUTTON ){
		SePlay( SE_SELECT );
		ReturnEntrySelect(id);
	}
}



//----------------------------------------
//		"とうろくかいじょしますか？"
//----------------------------------------
static void EntryResetInit( u8 id )
{
	s16 * wk = TaskTable[id].work;

	DelScrCurActor( MARK_ACT_U_CURSOR );
	DelScrCurActor( MARK_ACT_D_CURSOR );
	NMenuBoxClear( 0, 0, 29, 19 );
	MakeBaseName2( StrTempBuffer0, (u8)wk[ WK_RESET_NO ] );
	PM_MsgExpand( MsgExpandBuffer, msg_base_reset01 );
	SetTalkMsg( id, MsgExpandBuffer, EntryResetYesNoInit, 0 );
}

// はい・いいえセット
static void EntryResetYesNoInit( u8 id )
{
	YesNoSelectInit( ENTRY_YESNO_WINX, ENTRY_YESNO_WINY );
	SelectToolInit( id, &EntryReset );
}

// はい
static void EntryResetMain( u8 id )
{
	s16 * wk = TaskTable[id].work;

	NMenuBoxClear( 0, 0, 29, 19 );

	Fld.SecretBase[ wk[ WK_RESET_NO ] ].flg = 0;

	wk[ WK_ENTRY_MAX ] -= 1;
	if( wk[ WK_ENTRY_SCR ] > 0 )	wk[ WK_ENTRY_SCR ] -= 1;
	if( wk[ WK_ENTRY_MAX ] < 8 )	wk[ WK_ENTRY_POSMAX ] -= 1;

	DrawEntryListWin(id);
	TaskTable[id].TaskAdrs = EntryListTaskMain;
}
static void EntryResetYes( u8 id )
{
	NMenuBoxClear( ENTRY_YESNO_WINX, ENTRY_YESNO_WINY, ENTRY_YESNO_WINEX, ENTRY_YESNO_WINEY );
	SetTalkMsg( id, msg_base_reset02, EntryResetMain, 0 );
}

// いいえ
static void EntryResetNo( u8 id )
{
	NMenuBoxClear( 0, 0, 29, 19 );
	DrawEntryListWin(id);
	TaskTable[id].TaskAdrs = EntryListTaskMain;
};

//----------------------------------
//		登録リスト選択にもどる
//----------------------------------
static void ReturnEntrySelect( u8 id )
{
	s16 * wk = TaskTable[id].work;

	NMenuVCursorInit( ENTRY_LIST_WINX+1, ENTRY_LIST_WINY+2, wk[ WK_ENTRY_POSMAX ]+1, wk[ WK_ENTRY_POS ] );
	NMenuBoxClear( ENTRY_MENU_WINX, ENTRY_MENU_WINY, ENTRY_MENU_WINEX, ENTRY_MENU_WINEY );
	ScrCurActAnmPlay( MARK_ACT_U_CURSOR );
	ScrCurActAnmPlay( MARK_ACT_D_CURSOR );
	TaskTable[id].TaskAdrs = EntryListTaskMain;
}

//------------------------------
//		登録リスト処理終了
//------------------------------
static void EntryListEnd( u8 id )
{
	u16	pos = GetEventWorkValue( WK_BASE_POSNO );

	DelMarkPal();
	DelScrCurActor( MARK_ACT_U_CURSOR );
	DelScrCurActor( MARK_ACT_D_CURSOR );

	if( pos == 0 )	StartFieldScript( return_mine_base_board );
	else			StartFieldScript( return_other_base_pc );

	DelTask(id);
}


//-----------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------

//-------------------------------------
//	お留守番キャラのIDを取得
//-------------------------------------
u8 GetOrusubanCharID( u8 no )
{
	return	( Fld.SecretBase[no].id[0] % 5 ) + ( Fld.SecretBase[no].sex * 5 );
}

//---------------------------------------
//	お留守番対戦の敗北メッセージを取得
//---------------------------------------
extern const VM_CODE msg_boy_01_p04_sp_base[];
extern const VM_CODE msg_boy_02_p04_sp_base[];
extern const VM_CODE msg_boy_03_p04_sp_base[];
extern const VM_CODE msg_boy_04_p04_sp_base[];
extern const VM_CODE msg_boy_05_p04_sp_base[];
extern const VM_CODE msg_girl_01_p04_sp_base[];
extern const VM_CODE msg_girl_02_p04_sp_base[];
extern const VM_CODE msg_girl_03_p04_sp_base[];
extern const VM_CODE msg_girl_04_p04_sp_base[];
extern const VM_CODE msg_girl_05_p04_sp_base[];

const u8 * GetOrusubanLoseMsg(void)
{
	u8	id;

	id = GetOrusubanCharID( GetEventWorkValue( WK_BASE_POSNO ) );

	if( id == 0 )	return	(const u8 *)msg_boy_01_p04_sp_base;
	if( id == 1 )	return	(const u8 *)msg_boy_02_p04_sp_base;
	if( id == 2 )	return	(const u8 *)msg_boy_03_p04_sp_base;
	if( id == 3 )	return	(const u8 *)msg_boy_04_p04_sp_base;
	if( id == 4 )	return	(const u8 *)msg_boy_05_p04_sp_base;
	if( id == 5 )	return	(const u8 *)msg_girl_01_p04_sp_base;
	if( id == 6 )	return	(const u8 *)msg_girl_02_p04_sp_base;
	if( id == 7 )	return	(const u8 *)msg_girl_03_p04_sp_base;
	if( id == 8 )	return	(const u8 *)msg_girl_04_p04_sp_base;
	return	(const u8 *)msg_girl_05_p04_sp_base;
}

//-------------------------------------
//		ダミーお留守番キャラセット
//-------------------------------------
void SetDummyOrusubanData( u8 no )
{
	u16	i;

	for( i=0; i<1; i++ ){
		Fld.SecretBase[no].battle.p_rnd[i]   = i+1;		// 個性乱数
		Fld.SecretBase[no].battle.waza[i*4]  = i+1;		// わざ
		Fld.SecretBase[no].battle.mons_no[i] = 277;		// ポケモンナンバー
		Fld.SecretBase[no].battle.item[i]    = i+1;		// どうぐ
		Fld.SecretBase[no].battle.level[i]   = i+5;		// レベル
		Fld.SecretBase[no].battle.exp[i]     = i*5;		// 努力値の平均
	}
}

//-------------------------------
//		お留守番キャラ対戦
//-------------------------------
void OrusubanBattle(void)
{
	u16	pos = GetEventWorkValue( WK_BASE_POSNO );

	FanPointCalc( FAN_BASE_TYPE );
	OrusubanTaisenSet( &Fld.SecretBase[pos] );
}

//--------------------------------------
//		お留守番対戦フラグセット
//--------------------------------------
void OrusubanBtlFlgSet(void)
{
	Fld.SecretBase[ GetEventWorkValue( WK_BASE_POSNO ) ].fight_flag = AnswerWork;
}

//------------------------
//		対戦チェック
//------------------------
void OrusubanFlgCheck(void)
{
	u8	i;
	u16	pos;

	pos = GetEventWorkValue( WK_BASE_POSNO );

	if( EventFlagCheck( TMFLG_ORUSUBAN_BATTLE ) == 0 ){
		for( i=0; i<SECRET_BASE_MAX; i++ )
			Fld.SecretBase[i].fight_flag = 0;
		EventFlagSet( TMFLG_ORUSUBAN_BATTLE );
	}

	ScriptParameter0 = (u16)GetOrusubanCharID( pos );
	AnswerWork       = (u16)Fld.SecretBase[pos].fight_flag;
}


//-----------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------
enum {
	SEQ_INIT = 0,
	SEQ_WAIT,
	SEQ_EFFECT,
};

// タスクワーク
#define	WK_SEQ		1
#define	WK_PX		2
#define	WK_PY		3
#define	WK_EF		4
#define	WK_FADE		5	// 真っ暗マット用


//----------------------------
//		トラップグッズ
//----------------------------
void BaseGoodsTrap( u8 id )
{
	u8	  atr;
	s16   px,py;
	s16 * wk = TaskTable[id].work;

	switch( wk[WK_SEQ] ){
	case SEQ_INIT:
		GetHeroCellPos( &wk[WK_PX], &wk[WK_PY] );
		wk[WK_SEQ] = SEQ_WAIT;
		break;
	case SEQ_WAIT:
		GetHeroCellPos( &px, &py );
		if( px == wk[WK_PX] && py == wk[WK_PY] )	break;

		wk[WK_PX] = px;
		wk[WK_PY] = py;

		atr = GetCellAttribute( px, py );

		// きらきらマット
		if( ATR_IsBaseDarkMatCheck( atr ) == TRUE ){
			BaseKiraKiraMat();
			break;
		}

		// 水風船・泥団子
		if( ATR_IsBreakGoodsCheck( atr ) == TRUE ){
			SetBreakGoodsEffect( GetCellCode( px, py ), px, py );
			break;
		}

		// つきやぶれるドア
		if( ATR_IsBaseBreakDoorCheck( atr ) == TRUE ){
			BaseBreakDoor( px, py );
			break;
		}

		// 音マット
		if( ATR_IsBaseSoundMatCheck( atr ) == TRUE ){
			BaseSoundMat( GetCellCode( px, py ) );
			break;
		}

		break;

	case SEQ_EFFECT:
		if( FeCodeChk( (u8)wk[WK_EF] ) == 0 )
			wk[WK_SEQ] = SEQ_WAIT;
		break;
	}
}


//-----------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------
#define	SIO_BASE_MAX	20
#define	SIO_BASE		SECRET_BASE_DATA

//----------------------------------------------------
//	基地を作成
//----------------------------------------------------
static void MakeBase( u8 p, SECRET_BASE_DATA * base )
{
	Fld.SecretBase[p] = *base;
	Fld.SecretBase[p].flg = 2;	// 上書きされないようにする
}

//----------------------------------------------------
//	同じ人の基地を探す
//----------------------------------------------------
// ID
static u8 Sio_SameCheckID( SECRET_BASE_DATA * b1, SECRET_BASE_DATA * b2 )
{
	u8	i;

	for( i=0; i<4; i++ ){
		if( b1->id[i] != b2->id[i] )	return	FALSE;
	}

	return	TRUE;
}
// NAME
static u8 Sio_SameCheckName( SECRET_BASE_DATA * b1, SECRET_BASE_DATA * b2 )
{
	u8	i;

	for( i=0; i<PERSON_NAME_SIZE; i++ ){
		if( b1->name[i] == EOM_ && b2->name[i] == EOM_ )
			break;
		if( b1->name[i] != b2->name[i] )	return	FALSE;
	}

	return	TRUE;

}
// ID & NAME & SEX
static u8 Sio_SameCheckMain( SECRET_BASE_DATA * b1, SECRET_BASE_DATA * b2 )
{
	if( b1->sex != b2->sex )					return	FALSE;
	if( Sio_SameCheckID( b1, b2 ) == FALSE )	return	FALSE;
	if( Sio_SameCheckName( b1, b2 ) == FALSE )	return	FALSE;

	return	TRUE;
}

//----------------------------------------------------
//	その場所に基地があるか調べる
//----------------------------------------------------
static s16 CheckBasePos( u8 pos )
{
	s16	i;

	for( i=0; i<SECRET_BASE_MAX; i++ ){
		if( Fld.SecretBase[i].pos == pos )
			return	i;
	}

	return	-1;
}

//----------------------------------------------------
//	空きスペースを探す
//----------------------------------------------------
static u8 CheckBaseSpace(void)
{
	s16	i;

	for( i=1; i<SECRET_BASE_MAX; i++ ){
		if( Fld.SecretBase[i].pos == 0 )
			return	i;
	}

	return	0;
}

//----------------------------------------------------
//	上書きできる場所を探す
//----------------------------------------------------
static u8 CheckBaseReset(void)
{
	s16	i;

	for( i=1; i<SECRET_BASE_MAX; i++ ){
		if( Fld.SecretBase[i].flg == 0 && Fld.SecretBase[i].entry_flag == 0 )
			return	i;
	}

	return	0;
}

//----------------------------------------------------
//	メイン
//----------------------------------------------------
static u8 SioBaseSet( SECRET_BASE_DATA * base )
{
	s16	p;

	if( base->pos == 0 )	return	0;	//基地がないなら終了

	p = CheckBasePos( base->pos );		//すでに基地があるか

	if( p == 0 )	return	0;			//自分の基地と同じ場所なら終了

	//すでに基地がある
	if( p != -1 ){
		if( Fld.SecretBase[p].entry_flag == 1 )
			return	0;						//登録されているなら終了
		else{
			if( Fld.SecretBase[p].flg != 2 || base->entry_flag == 1 ){
				MakeBase( (u8)p, base );		//登録されていないなら上書きして終了
				return	(u8)p;
			}
		}
	}else{
		p = (s16)CheckBaseSpace();			//空きスペースを調べる

		if( p != 0 ){
			MakeBase( (u8)p, base );		//空きスペースがあれば入れる
			return	(u8)p;
		}else{
			p = (s16)CheckBaseReset();		//上書きできる場所を調べる

			if( p != 0 ){
				MakeBase( (u8)p, base );	//上書きできるなら上書き
				return	(u8)p;
			}
		}
	}

	return	0;
}

//----------------------------------------------------
//	基地をソート
//	自分の基地 > 登録基地 > 古い基地 > 新規の基地
//----------------------------------------------------
static void BaseSortOld(void)
{
	u8	i, j;
	SECRET_BASE_DATA   dummy;
	SECRET_BASE_DATA * my_data;

	my_data = Fld.SecretBase;

	for( i=1; i<SIO_BASE_MAX-1; i++ ){
		for( j=i+1; j<SIO_BASE_MAX; j++ ){
			if( ( my_data[i].flg == 0 && my_data[j].flg == 1 ) ||
				( my_data[i].flg == 2 && my_data[j].flg != 2 ) )
			{
				dummy = my_data[i];
				my_data[i] = my_data[j];
				my_data[j] = dummy;
			}
		}
	}
}

// 本人の以外の基地を配置
static void SioAllBaseSetEntry( SIO_BASE * base, u8 flg )
{
	u16	i;

	for( i=1; i<SIO_BASE_MAX; i++ ){
		if( base[i].flg == flg )	SioBaseSet( &base[i] );
	}
}

//----------------------------------------------------
//	相手側の自分の基地を削除
//----------------------------------------------------
static u8 SioGetMyBaseCheck( SIO_BASE * b )
{
	u8	i;

	// 基地なし
	if( b->pos == 0 )	return	FALSE;

	// 性別
	if( b->sex != MyData.my_sex )	return	FALSE;

	// ID
	for( i=0; i<4; i++ ){
		if( b->id[i] != MyData.ID[i] )	return	FALSE;
	}

	// Name
	for( i=0; i<PERSON_NAME_SIZE; i++ ){
		if( b->name[i] == EOM_ && MyData.my_name[i] == EOM_ )
			break;
		if( b->name[i] != MyData.my_name[i] )	return	FALSE;
	}
	return	TRUE;
}

static void SioGetMyBaseDel( SIO_BASE * b1, SIO_BASE * b2, SIO_BASE * b3 )
{
	u8	i, del=0;

	for( i=0; i<SECRET_BASE_MAX; i++ ){
		if( ( del & 1 ) == 0 ){
			if( SioGetMyBaseCheck( &b1[i] ) == TRUE ){
				InitBaseAdrs( &b1[i] );
				del |= 1;
			}
		}
		if( ( del & 2 ) == 0 ){
			if( SioGetMyBaseCheck( &b2[i] ) == TRUE ){
				InitBaseAdrs( &b2[i] );
				del |= 2;
			}
		}
		if( ( del & 4 ) == 0 ){
			if( SioGetMyBaseCheck( &b3[i] ) == TRUE ){
				InitBaseAdrs( &b3[i] );
				del |= 4;
			}
		}
		if( del == 7 )	break;
	}
}

//----------------------------------------------------
//	同じ基地を削除
//----------------------------------------------------
static u8 SameBaseDel( SIO_BASE * b1, SIO_BASE * b2, u8 flg )
{
	u8	i;

	for( i=0; i<SECRET_BASE_MAX; i++ ){
		if( b2[i].pos != 0 ){
			if( Sio_SameCheckMain( b1, &b2[i] ) == TRUE ){

				if( flg == 0 ){
					InitBaseAdrs( &b2[i] );
					return	FALSE;
				}

				// オリジナルカウントチェック
				if( b1->org_count > b2[i].org_count ){
					InitBaseAdrs( &b2[i] );
					return	FALSE;
				}else{
					b2[i].entry_flag = b1->entry_flag;
					InitBaseAdrs( b1 );
					return	TRUE;
				}
			}
		}
	}

	return	FALSE;
}

static void SameBaseDelMain( SIO_BASE * b1, SIO_BASE * b2, SIO_BASE * b3, SIO_BASE * b4 )
{
	u8	i;

	for( i=1; i<SECRET_BASE_MAX; i++ ){
		if( b1[i].pos != 0 ){
			if( b1[i].flg == 1 )	b1[i].entry_flag = 1;
			if( SameBaseDel( &b1[i], b2, i ) == FALSE ){
				if( SameBaseDel( &b1[i], b3, i ) == FALSE )
					SameBaseDel( &b1[i], b4, i );
			}
		}
	}
	for( i=0; i<SECRET_BASE_MAX; i++ ){
		if( b2[i].pos != 0 ){
			b2[i].fight_flag = 0;
			if( SameBaseDel( &b2[i], b3, i ) == FALSE )
				SameBaseDel( &b2[i], b4, i );
		}
	}
	for( i=0; i<SECRET_BASE_MAX; i++ ){
		if( b3[i].pos != 0 ){
			b3[i].fight_flag = 0;
			SameBaseDel( &b3[i], b4, i );
		}
		if( b4[i].pos != 0 )	b4[i].fight_flag = 0;
	}
}

//-------------------------------------------------------
//	基地交換メイン処理
//-------------------------------------------------------
static void SioAllBaseSetMain( SIO_BASE * b2, SIO_BASE * b3, SIO_BASE * b4 )
{
	SioGetMyBaseDel( b2, b3, b4 );					// 送られてきた自分の基地を削除
	SameBaseDelMain( Fld.SecretBase, b2, b3, b4 );	// 同じ基地を削除

	SioBaseSet( b2 );				// 交換相手の基地
	SioBaseSet( b3 );
	SioBaseSet( b4 );
	SioAllBaseSetEntry( b2, 1 );	// 交換相手が登録している基地
	SioAllBaseSetEntry( b3, 1 );
	SioAllBaseSetEntry( b4, 1 );
	SioAllBaseSetEntry( b2, 0 );	// 交換相手が登録していない基地
	SioAllBaseSetEntry( b3, 0 );
	SioAllBaseSetEntry( b4, 0 );
}

void SioAllBaseSet( void * base, u32 size, u8 id )
{
	u16	i;

#ifdef	PM_DEBUG
	if( DebugMainFlag == 0 && EventFlagCheck( FE_HIMITSU_GET ) == FALSE )
		return;
#else
	// 通常は「ひみつのちから」をもらってないと交換できない
	if( EventFlagCheck( FE_HIMITSU_GET ) == FALSE )
		return;
#endif	PM_DEBUG


	// 繋がっていない人のデータは削除
	switch( GetConnectSioMenberNum() ){
	case 2:
		memset( (SIO_BASE *)(base+size*2), 0, size );
		memset( (SIO_BASE *)(base+size*3), 0, size );
		break;
	case 3:
		memset( (SIO_BASE *)(base+size*3), 0, size );
	}

	// IDによって優先度を設定
	switch( id ){
	case 0:
		SioAllBaseSetMain(
			(SIO_BASE *)(base+size),
			(SIO_BASE *)(base+size*2),
			(SIO_BASE *)(base+size*3) );
		break;
	case 1:
		SioAllBaseSetMain(
			(SIO_BASE *)(base+size*2),
			(SIO_BASE *)(base+size*3),
			(SIO_BASE *)(base)	);
		break;
	case 2:
		SioAllBaseSetMain(
			(SIO_BASE *)(base+size*3),
			(SIO_BASE *)(base),
			(SIO_BASE *)(base+size) );
		break;
	case 3:
		SioAllBaseSetMain(
			(SIO_BASE *)(base),
			(SIO_BASE *)(base+size),
			(SIO_BASE *)(base+size*2) );
		break;
	}

	// ダミーのフラグを下げる1
	for( i=1; i<SECRET_BASE_MAX; i++ ){
		if( Fld.SecretBase[i].entry_flag == 1 ){
			Fld.SecretBase[i].flg = 1;
			Fld.SecretBase[i].entry_flag = 0;
		}
	}

	BaseSortOld();

	// ダミーのフラグを下げる2
	for( i=1; i<SECRET_BASE_MAX; i++ ){
		if( Fld.SecretBase[i].flg == 2 )
			Fld.SecretBase[i].flg = 0;
	}

	// オリジナルカウント
	if( Fld.SecretBase[0].org_count != 0xffff )
		Fld.SecretBase[0].org_count++;
}
