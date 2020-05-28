//========================================================================================
//						デバッグメニュー なかむら ( fd_shop.c から移動 )
//								2002/07/30 by nakahiro
//========================================================================================
#ifdef	PM_DEBUG

#include "common.h"
#include "intr.h"
#include "task.h"
#include "pm_str.h"
#include "menu.h"
#include "palanm.h"
#include "fld_main.h"
#include "field.h"
#include "map_attr.h"
#include "script.h"
#include "gold.h"
#include "pm_str.h"
#include "jiki.h"
#include "bag.h"
#include "item.h"
#include "letter.h"
#include "cm.h"
#include "fd_shop.h"
#include "base.h"
#include "itemtool.h"
#include "map.h"
#include "mapbg.h"
#include "fieldmap.h"
#include "mus_tool.h"
#include "gds_main.h"
#include "gds_del.h"
#include "goods.h"
#include "calctool.h"
#include "poketool.h"
#include "message.h"
#include "agbmons.h"
#include "ecnt_dat.h"
#include "cubecase.h"

#include "monsno.def"

#include "../data/itemsym.h"


extern void BaseOut(void);
extern void CubeBlendBagInit(void);
extern void DebugAddMvPoke(void);
extern void DebugMvPokePos( u8 * str );
extern void PolockEatDemoInit(void);
extern void DebugShopDataSet(void);
extern u8	DebugPCDownAnmTest(void);
extern u8	DebugPCUpAnmTest(void);
extern u8 * MakeBaseName2( u8 * str, u8 no );

static u8 DebugNakahiroKey(void);
static u8 DebugShopInit(void);
static u8 DebugSetSeed(void);
static u8 DebugGoodsSet(void);
static u8 DebugSelectList(void);
static u8 DebugEntryBase(void);
static u8 DebugMvPoke(void);
static u8 DebugMakeBase(void);
static u8 DebugFishPoint(void);
static u8 DebugBaseMakeMax(void);
static u8 DebugBasePosDraw(void);
static u8 DebugBaseIDChange(void);
static u8 DebugPolockMake(void);

extern u8	(*MenuFunc)();
extern u8	fieldMax;			//ウィンドウ表示行数
extern u8	fieldMenuList[3];	//フィールドメニューリスト

static const u8	str_kinomi[] = { ki_,no_,mi_,EOM_ };
static const u8 str_goods[] = { GU_,TTU_,ZU_,EOM_ };
static const u8 str_list[] = { PO_,KE_,MO_,N_,RI_,SU_,TO_,EOM_ };
static const u8 str_trap[] = { TO_,RA_,TTU_,PU_,EOM_ };
static const u8 str_kiti[] = { ki_,ti_,spc_,he_,n_,ko_,u_,EOM_ };
static const u8 str_mv_poke[] = { i_,do_,u_,PO_,KE_,MO_,N_,EOM_ };
static const u8	str_turi[]  = { tu_,ri_,PO_,I_,N_,TO_,EOM_ };
static const u8	str_polock[]  = { PO_,RO_,TTU_,KU_,SE_,TTU_,TO_,EOM_ };
static const u8 str_b_MAX[] = { ki_,ti_,M__,A__,X__,EOM_ };
static const u8 str_p_kiti[] = { ki_,ti_,spc_,i_,ti_,EOM_ };

static const MENU_ITEM	d_menu[] =
{
	{ str_kinomi,   DebugSetSeed },			// きのみ
	{ str_list,     DebugSelectList },		// ポケモンリスト
	{ str_goods,    DebugGoodsSet },		// グッズ
	{ str_kiti,     DebugBaseIDChange },	// きち　へんこう
	{ str_b_MAX,	DebugBaseMakeMax },		// きちMAX
	{ str_p_kiti,	DebugBasePosDraw },		// きち　いち
	{ str_mv_poke,  DebugMvPoke },			// いどうポケモン
	{ str_turi,		DebugFishPoint },		// つりポイント
	{ str_polock,	DebugPolockMake },		// ポロックセット
};


static const u8 debug_base_pos_data[] = {
//	No	配置map	X_Pos	Y_Pos
	1,   118,	47,		14,		// 00
	2,   125,	53,		10,		// 01
	3,   113,	49,		8,		// 02
	11,  118,	67,		6,		// 03
	12,  121,	40,		11,		// 04
	13,  111,	35,		1,		// 05
	21,  115,	20,		53,		// 06
	22,  121,	18,		13,		// 07
	23,  119,	26,		81,		// 08
	31,  127,	59,		67,		// 09
	32,  125,	55,		11,		// 10
	33,  111,	27,		27,		// 11
	41,  114,	9,		47,		// 12
	42,  115,	32,		39,		// 13
	43,  115,	23,		8,		// 14
	51,  114,	30,		51,		// 15
	52,  115,	26,		15,		// 16
	53,  115,	32,		46,		// 17
	61,  114,	11,		62,		// 18
	62,  115,	21,		18,		// 19
	63,  115,	25,		24,		// 20
	71,  114,	19,		70,		// 21
	72,  115,	32,		6,		// 22
	73,  114,	32,		57,		// 23
	81,  116,	71,		4,		// 24
	82,  123,	47,		3,		// 25
	83,  123,	57,		5,		// 26
	91,  116,	79,		11,		// 27
	92,  123,	49,		3,		// 28
	93,  120,	18,		12,		// 29
	101, 120,	28,		62,		// 30
	102, 116,	56,		6,		// 31
	103, 119,	16,		81,		// 32
	111, 120,	30,		62,		// 33
	112, 116,	55,		15,		// 34
	113, 119,	16,		28,		// 35
	121, 111,	33,		34,		// 36
	122, 118,	29,		5,		// 37
	123, 127,	45,		24,		// 38
	131, 111,	24,		36,		// 39
	132, 125,	7,		25,		// 40
	133, 115,	8,		30,		// 41
	141, 111,	34,		50,		// 42
	142, 127,	59,		72,		// 43
	143, 127,	61,		21,		// 44
	151, 127,	67,		63,		// 45
	152, 125,	24,		32,		// 46
	153, 111,	35,		31,		// 47
	161, 111,	13,		19,		// 48
	162, 121,	43,		7,		// 49
	163, 118,	47,		5,		// 50
	164, 111,	14,		19,		// 51
	171, 118,	46,		5,		// 52
	172, 121,	42,		7,		// 53
	173, 119,	19,		76,		// 54
	174, 115,	7,		20,		// 55
	181, 110,	16,		25,		// 56
	182, 114,	11,		27,		// 57
	183, 115,	8,		20,		// 58
	191, 110,	17,		25,		// 59
	192, 114,	12,		27,		// 60
	193, 119,	18,		76,		// 61
	201, 119,	5,		2,		// 62
	202, 119,	4,		89,		// 63
	203, 120,	38,		54,		// 64
	204, 120,	5,		76,		// 65
	211, 119,	5,		15,		// 66
	212, 119,	7,		101,	// 67
	213, 120,	31,		23,		// 68
	221, 119,	34,		24,		// 69
	222, 120,	26,		10,		// 70
	223, 119,	4,		15,		// 71
	231, 119,	31,		73,		// 72
	232, 120,	29,		85,		// 73
	233, 119,	6,		2,		// 74
};

static u8 d_base_pos = 0;

static const u8 d_str_R[] = { R__,EOM_ };
static const u8 d_str_X[] = { X__,EOM_ };
static const u8 d_str_Y[] = { Y__,EOM_ };


//--------------------------------------------
//	デバッグウィンドウ初期設定
//--------------------------------------------
static void DebugInit(void)
{
	NMenuScreenClear();
	NMenuWinBoxWrite( 19, 0, 29, 19 );		//ウィンドウ表示
	NMenuFixListWrite( 21, 1, 9, d_menu );	//メニュー表示
	NMenuVCursorInit( 20, 1, 9, 0 );		//カーソル初期設定
}

u8	DebugNakahiroTest(void)
{
	DebugInit();
	MenuFunc = DebugNakahiroKey;
	return	0;
}

//--------------------------------------------
//	デバッグウィンドウキー操作
//--------------------------------------------
static u8 DebugNakahiroKey(void)
{
	MENUFUNC	func;

	if( sys.Trg & U_KEY )	NMenuVCursorSet(-1);
	if( sys.Trg & D_KEY )	NMenuVCursorSet(1);
	
	if( sys.Trg & A_BUTTON ){
		func = d_menu[ NMenuVCursorPosGet() ].ptr;
		return	func();
	}

	if( sys.Trg & B_BUTTON ){
		MenuEnd();
		return	1;
	}

	return	0;
}

//--------------------------------------------
//	ショップ処理へ
//--------------------------------------------
static u8 DebugShopInit(void)
{
	MenuEnd();
	NMenuScreenClear();
	DebugShopDataSet();
	return	1;
}

//--------------------------------------------
//	ポケモンリスト
//--------------------------------------------
#include "pokelist.h"
#include "p_status.h"
#include "poketool.h"

extern void MultiBtlSelectPokeInit(void);
extern void BtlTowerSelectPokeInit(void);
extern void MultiBtlScrollInPokeInit(void);
extern void DebugMultiPokeParaSet(void);
//extern void TestEncountDataClear(void);

static void DebugSelectListFade( u8 id )
{
	if( !(FadeData.fade_sw) ){
//		PokeListCall( GROW_POKELIST_ID, SINGLE_LIST );		// 育て屋
//		MultiBtlSelectPokeInit();							// マルチ選択

//		TestEncountDataClear();

//		BtlTowerSelectPokeInit();							// バトルタワー選択
		DebugMultiPokeParaSet();
		PokeListCall( SCROLL_POKELIST_ID, SINGLE_LIST );	// スクロール
//		PokeListCall( MANIA_POKELIST_ID, SINGLE_LIST );		// 技教え
//		MainProcChange( MultiBtlSelectPokeInit );
//		MainProcChange( MultiBtlScrollInPokeInit );
		DelTask(id);
	}
}

static u8 DebugSelectList(void)
{
	MenuEnd();
	NMenuScreenClear();
	sys.pReturnProc = FieldMenuRecover;
	AddTask( DebugSelectListFade, 0 );
	PaletteFadeReq(0xffffffff,0,0,16,0);
	return	1;
}


//--------------------------------------------
//	指定したお留守番キャラの基地を作成
//--------------------------------------------
static const u8 str_base[] = {
	osu_,n1_,CR_,
	osu_,n2_,CR_,
	osu_,n3_,CR_,
	osu_,n4_,CR_,
	osu_,n5_,CR_,

	mesu_,n1_,CR_,
	mesu_,n2_,CR_,
	mesu_,n3_,CR_,
	mesu_,n4_,CR_,
	mesu_,n5_,EOM_,
};

static void SetBaseData( u8 no, u8 pos, u8 chr, u8 name )
{
	u8	i;

	Fld.SecretBase[no].pos = pos;
	Fld.SecretBase[no].name[0] = na_;
	Fld.SecretBase[no].name[1] = ka_;
	Fld.SecretBase[no].name[2] = hi_;
	Fld.SecretBase[no].name[3] = ro_;

	if( chr < 5 )	Fld.SecretBase[no].sex = 0;
	else			Fld.SecretBase[no].sex = 1;

	Fld.SecretBase[no].id[0] = chr;// * 20;

	for( i=0; i<16; i++ ){
		Fld.SecretBase[no].furniture_id[i]  = 0;
		Fld.SecretBase[no].furniture_pos[i] = 0;
	}

	SetDummyOrusubanData(no);	// ダミーお留守番キャラセット
}

static u8 DebugMakeBase2(void)
{
	if( sys.Trg & U_KEY ){
		NMenuVCursorSet( -1 );
		return	0;
	}
	if( sys.Trg & D_KEY ){
		NMenuVCursorSet( 1 );
		return	0;
	}

	if( sys.Trg & A_BUTTON ){
		MenuEnd();
		SetBaseData( 19, 62, NMenuVCursorPosGet(), 0 );
		return	1;
	}

	if( sys.Trg & B_BUTTON ){
		MenuEnd();
		return	1;
	}

	return	0;
}

static u8 DebugMakeBase(void)
{
	MenuFunc = DebugMakeBase2;
	NMenuBoxClear( 0, 0, 29, 19 );
	NMenuBoxWrite( 0, 0, 4, 19 );
	NMenuMsgWrite( str_base, 2, 0 );
	NMenuVCursorInit( 1, 0, 10, 0 );
	return	0;
}

//--------------------------------------------
//	登録基地
//--------------------------------------------
static u8 DebugEntryBase(void)
{
	u8	i;

	MenuEnd();

	for( i=0; i<10; i++ ){
		SetBaseData( i+1, i+2, 1, i );
		Fld.SecretBase[i+1].flg = 1;
	}

	return	1;
}


//--------------------------------------------
//	基地MAX
//--------------------------------------------
static u8 DebugBaseMakeMax(void)
{
	u8	i, j;

	MenuEnd();

	for( i=1; i<20; i++ ){

		if( Fld.SecretBase[i].pos == 0 ){

			// 名前作成
			for( j=0; j<PERSON_NAME_SIZE; j++ ){
				Fld.SecretBase[i].name[j] = MyData.my_name[j];
				if( Fld.SecretBase[i].name[j] == EOM_ )	break;
			}
			if( j == PERSON_NAME_SIZE )
				Fld.SecretBase[i].name[j-1] = A__ + i-1;
			else
				Fld.SecretBase[i].name[j] = A__ + i-1;

			// 場所設定
			while(1){
				Fld.SecretBase[i].pos = debug_base_pos_data[ (pp_rand() % 75)*4 ];

				for( j=0; j<i; j++ ){
					if( Fld.SecretBase[i].pos == Fld.SecretBase[j].pos )
						break;
				}

				if( j == i )	break;
			}

			// 性別セット
			Fld.SecretBase[i].sex = pp_rand() % 2;

			// IDセット
			for( j=0; j<4; j++ )
				Fld.SecretBase[i].id[j] = pp_rand() % 256;

			// 模様替えデータ初期化
			for( j=0; j<16; j++ ){
				Fld.SecretBase[i].furniture_id[j]  = 0;
				Fld.SecretBase[i].furniture_pos[j] = 0;
			}

			SetDummyOrusubanData(i);	// ダミーお留守番キャラセット
		}

	}

	return	1;
}

//--------------------------------------------
//	基地位置表示
//--------------------------------------------
static void BaseDataGet( u8 * pos, u8 * x, u8 * y )
{
	u8	i;
	u8	no = Fld.SecretBase[d_base_pos].pos;

	for( i=0; i<75; i++ ){
		if( debug_base_pos_data[i*4] == no ){
			*pos = debug_base_pos_data[i*4+1];
			*x   = debug_base_pos_data[i*4+2];
			*y   = debug_base_pos_data[i*4+3];
			break;
		}
	}
}

static void DebugBasePosWinPut(void)
{
	u8	pos, x, y;

	NMenuBoxWrite( 1, 1, 10, 10 );

	// 配列番号
	PM_NumMsgSet( StrTempBuffer0, d_base_pos, NUM_MODE_LEFT, 2 );
	NMenuMsgWrite( StrTempBuffer0, 1, 1 );

	if( Fld.SecretBase[d_base_pos].pos == 0 )	return;

	BaseDataGet( &pos, &x, &y );

	// 名前
//	Fld.SecretBase[i].name[j] = MyData.my_name[j];
	MakeBaseName2( StrTempBuffer0, d_base_pos );
	NMenuMsgWrite( StrTempBuffer0, 1, 3 );

	// 位置
	NMenuMsgWrite( d_str_R, 1, 5 );
	PM_NumMsgSet( StrTempBuffer0, pos, NUM_MODE_LEFT, 3 );
	NMenuMsgWrite( StrTempBuffer0, 2, 5 );

	// X
	NMenuMsgWrite( d_str_X, 1, 7 );
	PM_NumMsgSet( StrTempBuffer0, x, NUM_MODE_LEFT, 3 );
	NMenuMsgWrite( StrTempBuffer0, 3, 7 );

	// Y
	NMenuMsgWrite( d_str_Y, 1, 9 );
	PM_NumMsgSet( StrTempBuffer0, y, NUM_MODE_LEFT, 3 );
	NMenuMsgWrite( StrTempBuffer0, 3, 9 );
}

static u8 DebugBasePosKey(void)
{
	if( sys.Trg & L_KEY ){
		if( d_base_pos == 0 )	d_base_pos = 19;
		else					d_base_pos--;
		DebugBasePosWinPut();
		return	0;
	}
	if( sys.Trg & R_KEY ){
		if( d_base_pos == 19 )	d_base_pos = 0;
		else					d_base_pos++;
		DebugBasePosWinPut();
		return	0;
	}

	if( sys.Trg & B_BUTTON ){
		MenuEnd();
		return	1;
	}
	return	0;
}

static u8 DebugBasePosDraw(void)
{
	d_base_pos = 0;
	MenuFunc = DebugBasePosKey;
	NMenuBoxClear( 0, 0, 29, 19 );
	NMenuWinBoxWrite( 0, 0, 11, 11 );
	DebugBasePosWinPut();
	return	0;
}

//--------------------------------------------
//	基地変更
//--------------------------------------------
static u8 DebugBaseIDChangeKey1(void);

static u8 d_base_cng_no = 0;
static u8 d_base_cng_pos = 0;
static u8 d_base_cng_mode = 0;
static const u8 d_b_str_cur[] = { bou_,EOM_ };
static const u8 d_b_str_mode[] = {
	a_,EOM_,
	A_,EOM_,
	A__,EOM_,
	a__,EOM_,
	n0_,EOM_,
};

// ID
static void DebugBaseIDPut(void)
{
	u32  id;
	u8 * b_id = Fld.SecretBase[d_base_pos].id;

	id = ( ( b_id[3] << 24 ) | ( b_id[2] << 16 ) | ( b_id[1] << 8 ) | b_id[0] );

	PM_NumMsgSet( StrTempBuffer0, (int)(id/100000), NUM_MODE_ZERO, 5 );
	NMenuMsgWrite( StrTempBuffer0, 2, 7 );
	PM_NumMsgSet( StrTempBuffer0, (int)(id%100000), NUM_MODE_ZERO, 5 );
	NMenuMsgWrite( StrTempBuffer0, 7, 7 );
}

// NAME
static void DebugBaseNamePut(void)
{
	u8 * eom;

	NMenuBoxWrite( 2, 3, 11, 4 );

	eom  = PM_strncpy( StrTempBuffer0, Fld.SecretBase[d_base_pos].name, PERSON_NAME_SIZE );
	*eom = EOM_;
	NMenuMsgWrite( StrTempBuffer0, 2, 3 );
}

// パラメータ表示
static void DebugBaseIDChangeWinPut(void)
{
	NMenuBoxWrite( 2, 1, 11, 10 );

	// 配列番号
	PM_NumMsgSet( StrTempBuffer0, d_base_pos, NUM_MODE_LEFT, 2 );
	NMenuMsgWrite( StrTempBuffer0, 2, 1 );

	if( Fld.SecretBase[d_base_pos].pos == 0 )	return;

	DebugBaseNamePut();
	DebugBaseIDPut();
}

// カーソル表示
static void DebugBaseIDChangeCurPut(void)
{
	NMenuBoxWrite( 2, 5, 11, 6 );
	NMenuMsgWrite( d_b_str_cur, 2+d_base_cng_pos, 5 );
}

// モード表示
static void DebugBaseIDChangeModePut(void)
{
	if( d_base_cng_no != 0 )	NMenuBoxWrite( 11, 1, 11, 2 );
	else	NMenuMsgWrite( &d_b_str_mode[d_base_cng_mode*2], 11, 1 );
}

//--------------------------------------------
// IDセット
static void DebugBaseIDChangeIDSet( s8 no )
{
	u32  id;
	u32  plus;
	s8   i;
	u8 * b_id = Fld.SecretBase[d_base_pos].id;

	id = ( ( b_id[3] << 24 ) | ( b_id[2] << 16 ) | ( b_id[1] << 8 ) | b_id[0] );

	plus = no;
	for( i=9; i>d_base_cng_pos; i-- ){
		plus *= 10;
	}
	id = id + plus;

	b_id[3] = ( id & 0xff000000 ) >> 24;
	b_id[2] = ( id & 0xff0000 ) >> 16;
	b_id[1] = ( id & 0xff00 ) >> 8;
	b_id[0] = ( id & 0xff );

	DebugBaseIDPut();
}

// NAMEセット
static void DebugBaseIDChangeNameSet( s8 no )
{
	u8 * name = Fld.SecretBase[d_base_pos].name;
	u8   max=0, min=0;
	u8   i;

	if( no == 100 ){
		for( i=d_base_cng_pos; i<PERSON_NAME_SIZE; i++ )
			name[i] = EOM_;
	}else{
		switch( d_base_cng_mode ){
		case 0:
			min = a_;
			max = ttu_;
			break;
		case 1:
			min = A_;
			max = TTU_;
			break;
		case 2:
			min = A__;
			max = Z__;
			break;
		case 3:
			min = a__;
			max = z__;
			break;
		case 4:
			min = n0_;
			max = n9_;
		}

		name[d_base_cng_pos] += no;

		if( name[d_base_cng_pos] < min )	name[d_base_cng_pos] = max;
		if( name[d_base_cng_pos] > max )	name[d_base_cng_pos] = min;
	}

	DebugBaseNamePut();
}

//--------------------------------------------
// 桁選択
static u8 DebugBaseIDChangeKey2(void)
{
	u8	max;

	if( d_base_cng_no == 0 )	max = PERSON_NAME_SIZE;
	else						max = 10;

	if( sys.Repeat & U_KEY ){
		if( d_base_cng_no != 0 )	DebugBaseIDChangeIDSet( 1 );
		else						DebugBaseIDChangeNameSet( 1 );
		return	0;
	}
	if( sys.Repeat & D_KEY ){
		if( d_base_cng_no != 0 )	DebugBaseIDChangeIDSet( -1 );
		else						DebugBaseIDChangeNameSet( -1 );
		return	0;
	}

	if( sys.Repeat & L_KEY ){
		if( d_base_cng_pos == 0 )	d_base_cng_pos = max-1;
		else						d_base_cng_pos--;
		DebugBaseIDChangeCurPut();
		return	0;
	}
	if( sys.Repeat & R_KEY ){
		if( d_base_cng_pos == max-1 )	d_base_cng_pos = 0;
		else							d_base_cng_pos++;
		DebugBaseIDChangeCurPut();
		return	0;
	}

	if( sys.Trg & SELECT_BUTTON ){
		if( d_base_cng_no == 0 )
			d_base_cng_mode = ( d_base_cng_mode + 1 ) % 5;
		DebugBaseIDChangeModePut();
		return	0;
	}

	if( sys.Trg & A_BUTTON ){
		NMenuBoxWrite( 2, 5, 11, 6 );
		NMenuBoxWrite( 11, 1, 11, 2 );
		MenuFunc = DebugBaseIDChangeKey1;
		return	0;
	}

	if( sys.Trg & B_BUTTON ){
		if( d_base_cng_no == 0 )
			DebugBaseIDChangeNameSet( 100 );
		return	0;
	}
	return	0;
}

// 項目選択
static u8 DebugBaseIDChangeKey1(void)
{
	if( sys.Trg & U_KEY ){
		NMenuVCursorSet( -2 );
		return	0;
	}
	if( sys.Trg & D_KEY ){
		NMenuVCursorSet( 2 );
		return	0;
	}


	if( sys.Trg & L_KEY ){
		if( d_base_pos == 0 )	d_base_pos = 19;
		else					d_base_pos--;
		DebugBaseIDChangeWinPut();
		return	0;
	}
	if( sys.Trg & R_KEY ){
		if( d_base_pos == 19 )	d_base_pos = 0;
		else					d_base_pos++;
		DebugBaseIDChangeWinPut();
		return	0;
	}

	if( sys.Trg & A_BUTTON ){
		if( d_base_pos != 0 && Fld.SecretBase[d_base_pos].pos != 0 ){
			d_base_cng_no = NMenuVCursorPosGet();
			d_base_cng_pos = 0;
			DebugBaseIDChangeCurPut();
			DebugBaseIDChangeModePut();
			MenuFunc = DebugBaseIDChangeKey2;
		}
		return	0;
	}

	if( sys.Trg & B_BUTTON ){
		MenuEnd();
		return	1;
	}
	return	0;
}

//--------------------------------------------
// 呼び出し
static u8 DebugBaseIDChange(void)
{
	d_base_pos = 0;
	d_base_cng_mode = 0;
	MenuFunc = DebugBaseIDChangeKey1;
	NMenuBoxClear( 0, 0, 29, 19 );
	NMenuWinBoxWrite( 0, 0, 12, 11 );
	DebugBaseIDChangeWinPut();
	NMenuVCursorInit( 1, 3, 3, 0 );
	return	0;
}



//--------------------------------------------
//	移動ポケモン
//--------------------------------------------
#include "mv_poke.h"

static const u8 str_mv_poke_add[] = {
	A__,D__,D__,CR_,
	D__,E__,L__,CR_,
	E__,X__,I__,T__,EOM_
};

static u8 DebugMvPoke2(void)
{
	if( sys.Trg & U_KEY ){
		NMenuVCursorSet( -1 );
		return	0;
	}
	if( sys.Trg & D_KEY ){
		NMenuVCursorSet( 1 );
		return	0;
	}

	if( sys.Trg & A_BUTTON ){
		MenuEnd();
		switch( NMenuVCursorPosGet() ){
		case 0:
			DebugAddMvPoke();
			break;
		case 1:
			MvPokeDataInit();
			MvPokeMoveDataInit();
		}
		return	1;
	}

	if( sys.Trg & B_BUTTON ){
		MenuEnd();
		return	1;
	}

	return	0;
}

static u8 DebugMvPoke(void)
{
	MenuFunc = DebugMvPoke2;
	NMenuBoxClear( 0, 0, 29, 19 );
	DebugMvPokePos( StrTempBuffer0 );
	NMenuWinBoxWrite( 0, 0, 11, 9 );
	NMenuMsgWrite( StrTempBuffer0, 1, 1 );
	NMenuMsgWrite( str_mv_poke_add, 2, 3 );
	NMenuVCursorInit( 1, 3, 3, 0 );
	return	0;
}

//--------------------------------------------
//	木の実を43種追加
//--------------------------------------------
static u8 DebugSetSeed(void)
{
	u16	i;

	for( i=0; i<43; i++ ){
		Fld.MySeedItem[i].item = ITEM_SEED_START+i;
		Fld.MySeedItem[i].no = 999;
	}

	MenuEnd();
	return	1;
}


//--------------------------------------------
//	グッズを追加
//--------------------------------------------
extern void DebugGoodsSet2(void);	// デバッグ用グッズセット

static u8 DebugGoodsSet(void)
{
	GoodsAllInit();
	DebugGoodsSet2();

	NMenuBoxClear( 0, 0, 29, 19 );
	MenuEnd();
	return	1;
}


//--------------------------------------------
//	釣りができる場所を数える
//--------------------------------------------
static const u8 str_turibasyo[] = {
	tu_,ri_,ba_,si_,yyo_,spc_,spc_,spc_,spc_,spc_,R__,n1_,n1_,n9_,CR_,
	spc_,Y__,n1_,CR_,
	spc_,Y__,n2_,CR_,
	spc_,Y__,n3_,CR_,
	E_,N_,KA_,U_,N_,TO_,ba_,si_,yyo_,CR_,
	CR_,
	CR_,
	zi_,bu_,n_,no_,ma_,e_,EOM_
};


static u16 GetFishingPoint( u8 y )
{
	u16	i,j,p=0,sy,ly;

	ly = NowMap.Screen->Ysize / 3;
	sy = ly * y;

	for( i=sy; i<sy+ly; i++ ){
		for( j=0; j<NowMap.Screen->Xsize; j++ ){
			if( ATR_IsFishingPlace( GetCellAttribute( MAP_LEFT_MARGIN+j, MAP_UP_MARGIN+i ) ) == TRUE )
				p++;
		}
	}
	return	p;
}

static u16 GetFishingHeroPoint(void)
{
	u16	i,j,p=0;
	s16	px, py;

	GetHeroFrontCellPos( &px, &py );	// 釣り位置取得
	px -= MAP_LEFT_MARGIN;
	py -= MAP_UP_MARGIN;

	for( i=0; i<NowMap.Screen->Ysize; i++ ){
		for( j=0; j<NowMap.Screen->Xsize; j++ ){
			if( ATR_IsFishingPlace( GetCellAttribute( MAP_LEFT_MARGIN+j, MAP_UP_MARGIN+i ) ) == TRUE ){
				p++;
				if( px == j && py == i )
					return	p;
			}
		}
	}
	return	p+1;
}

static u8 DebugFishPointEnd(void)
{
	if( ( sys.Trg & A_BUTTON ) || ( sys.Trg & B_BUTTON ) ){
		NMenuBoxClear( 0, 0, 29, 19 );
		MenuEnd();
		return	1;
	}
	return	0;
}

static u8 DebugFishPoint(void)
{
	u16	i;
	u16	max;
	u16	p;

	NMenuBoxClear( 0, 0, 29, 19 );
	NMenuWinBoxWrite( 0, 0, 16, 19 );

	NMenuMsgWrite( str_turibasyo, 1, 1 );

	PM_NumMsgSet( StrTempBuffer0, GetFishingPoint(0), NUM_MODE_SPACE, 5 );
	NMenuMsgWrite( StrTempBuffer0, 5, 3 );
	PM_NumMsgSet( StrTempBuffer0, GetFishingPoint(1), NUM_MODE_SPACE, 5 );
	NMenuMsgWrite( StrTempBuffer0, 5, 5 );
	PM_NumMsgSet( StrTempBuffer0, GetFishingPoint(2), NUM_MODE_SPACE, 5 );
	NMenuMsgWrite( StrTempBuffer0, 5, 7 );

	PM_NumMsgSet( StrTempBuffer0, SP_ENCOUNT_R119ProgramSym(0), NUM_MODE_SPACE, 5 );
	NMenuMsgWrite( StrTempBuffer0, 11, 3 );
	PM_NumMsgSet( StrTempBuffer0, SP_ENCOUNT_R119ProgramSym(1), NUM_MODE_SPACE, 5 );
	NMenuMsgWrite( StrTempBuffer0, 11, 5 );
	PM_NumMsgSet( StrTempBuffer0, SP_ENCOUNT_R119ProgramSym(2), NUM_MODE_SPACE, 5 );
	NMenuMsgWrite( StrTempBuffer0, 11, 7 );

	SpFishingSrand( Fld.PopWord[0].random );	// 乱数初期化

	max = GetFishingPoint(0) + GetFishingPoint(1) + GetFishingPoint(2);

	i = 0;
	while(1){
		if( i == 6 )	break;

		p = ( SpFishingRand() % max );

		if( p == 0 )	p = max;

		if( !( p >= 1 && p <= 3 ) ){
			PM_NumMsgSet( StrTempBuffer0, p, NUM_MODE_SPACE, 4 );
			NMenuMsgWrite( StrTempBuffer0, 2+(i%3)*5, 11+(i/3)*2 );
			i++;
		}
	}

/*
	for( i=0; i<6; i++ ){
		PM_NumMsgSet( StrTempBuffer0, SpFishingRand() % max, NUM_MODE_SPACE, 4 );
		NMenuMsgWrite( StrTempBuffer0, 2+(i%3)*5, 11+(i/3)*2 );

	}
*/

	PM_NumMsgSet( StrTempBuffer0, GetFishingHeroPoint(), NUM_MODE_SPACE, 4 );
	NMenuMsgWrite( StrTempBuffer0, 2, 17 );

	MenuFunc = DebugFishPointEnd;
	return	0;
}



//=========================================================================================
//	手持ちポケモンセット
//=========================================================================================
#define	DP_SET_X	14
#define	DP_SET_Y	0

static void DegugPokeSetNamePut( u8 no );
static void DegugPokeSetSexPut( u8 no );
static void DegugPokeSetLvPut( u8 no );
static void DegugPokeSetPut( u8 no );
static void DebugPokeMonsNoSet( u8 no, s8 p );
static void DebugPokeSetEnd(void);
static void DebugPokeSetCurSet( u8 pt );
static u8	DebugPokeSetSexSetMain( u8 no );
static u8	DebugPokeSetMain(void);

typedef struct {
	s16	monsno;		// ポケモン番号
	s8	lv;			// Lv
	u8	flg;
}DEBUG_POKE_SET;

static const u8 DP_SERECT_POS[] = { 15, 22, 25 };

static DEBUG_POKE_SET	d_poke[6];
static u8 dp_cur_pos = 0;

static const u8 degug_str_setumei[] = {
	A__,BO_,TA_,N_,spc_,CTRL_,C_EXFONT_,Plus__,spc_,spc_,B__,BO_,TA_,N_,spc_,bou_,CR_,
	S__,T__,A__,R__,T__,spc_,ke_,ttu_,te_,i_,EOM_
};


//---------------------------------------------
//	初期設定
//---------------------------------------------
void DebugPokeSetInit(void)
{
	u8	i;

	NMenuWinBoxWrite( DP_SET_X, DP_SET_Y, 29, 13 );
	NMenuWinBoxWrite( 0, 14, 29, 19 );
	NMenuMsgWrite( degug_str_setumei, 1, 15 );

	for( i=0; i<6; i++ ){
		d_poke[i].monsno = PokeParaGet( &PokeParaMine[i], ID_monsno );
		if( d_poke[i].monsno != 0 ){
			d_poke[i].lv  = PokeParaGet( &PokeParaMine[i], ID_level );

			DegugPokeSetNamePut(i);
			DegugPokeSetSexPut(i);
			DegugPokeSetLvPut(i);

		}else{
			d_poke[i].lv  = 1;
		}
		d_poke[i].flg = 0;
	}

	dp_cur_pos = 0;
	PalChangeCursorPut( DP_SET_X+1, DP_SET_Y+1, 0xff );

	MenuFunc = DebugPokeSetMain;
}

//---------------------------------------------
//	表示
//---------------------------------------------
// 名前
static void DegugPokeSetNamePut( u8 no )
{
	NMenuMsgWrite( PokeNameData[ d_poke[no].monsno ], DP_SET_X+2, DP_SET_Y+1+2*no );
}
// 性別
static void DegugPokeSetSexPut( u8 no )
{
	u8	sex;
	u8	hate[] = { hate_,EOM_ };

	sex = PokeSexGet( &PokeParaMine[no] );

	if( sex == MONS_MALE )
		NMenuMsgWrite( str_osu, DP_SET_X+9, DP_SET_Y+1+2*no );
	else{
		if( sex == MONS_FEMALE )
			NMenuMsgWrite( str_mesu, DP_SET_X+9, DP_SET_Y+1+2*no );
		else
			NMenuMsgWrite( hate, DP_SET_X+9, DP_SET_Y+1+2*no );
	}
}
//	Lv
static void DegugPokeSetLvPut( u8 no )
{
	PM_NumMsgSet( StrTempBuffer0, d_poke[no].lv, NUM_MODE_SPACE, 3 );
	NMenuMsgWrite( StrTempBuffer0, DP_SET_X+12, DP_SET_Y+1+2*no );
}

// 全部
static void DegugPokeSetPut( u8 no )
{
	NMenuBoxWrite( DP_SET_X+2, DP_SET_Y+1+2*no, 28, DP_SET_Y+2+2*no );

	if( d_poke[no].monsno != 0 ){
		DegugPokeSetNamePut( no );
		DegugPokeSetSexPut( no );
		DegugPokeSetLvPut( no );
	}

	DebugPokeSetCurSet(5);
}

//---------------------------------------------
//	各パラメータセット
//---------------------------------------------
static void DebugPokeMonsNoSet( u8 no, s8 p )
{
	if( d_poke[no].monsno == 0 && d_poke[no].flg == 0 && p == 1 ){
		d_poke[no].monsno = MONSNO_KIMORI-1;
	}

	d_poke[no].monsno += p;

	if( d_poke[no].monsno >= KAIHATSU_NUM_MAX )
		d_poke[no].monsno -= KAIHATSU_NUM_MAX;
	if( d_poke[no].monsno < 0 )
		d_poke[no].monsno += KAIHATSU_NUM_MAX;

	PokeParaSet(
		&PokeParaMine[no], d_poke[no].monsno, d_poke[no].lv,
		POW_RND ,RND_NO_SET, 0, ID_NO_SET, 0 );

	d_poke[no].flg = 1;
}


static void DebugPokeSexSet( u8 no )
{
	if( d_poke[no].monsno == 0 )	return;

	DebugPokeSetSexSetMain( no );
}


extern	const	PokePersonalData PPD[];

static void DebugPokeLvSet( u8 no, s8 p )
{
	if( d_poke[no].monsno == 0 )	return;

	d_poke[no].lv += p;

	if( d_poke[no].lv > 100 )	d_poke[no].lv = 1;
	if( d_poke[no].lv < 1 )		d_poke[no].lv = 100;

	PokeParaPut(&PokeParaMine[no],ID_exp,(u8 *)&GrowTbl[PPD[d_poke[no].monsno].grow][d_poke[no].lv]);
	PokeParaCalc(&PokeParaMine[no]);
}


//---------------------------------------------
//	ポケモンセット
//---------------------------------------------
static void DebugPokeSetEnd(void)
{
	u8	i,j;
	PokemonParam	dumy;

	NMenuBoxClear( 0, 0, 29, 19 );

	for( i=0; i<5; i++ ){
		for( j=i+1; j<6; j++ ){
			if( PokeParaGet(&PokeParaMine[i],ID_monsno,0) == 0 ){
				dumy = PokeParaMine[i];
				PokeParaMine[i] = PokeParaMine[j];
				PokeParaMine[j] = dumy;
			}
		}
	}

	PokeCountMineGet();

	if( PokeCountMine == 0 ){
		PokeParaSet( &PokeParaMine[0], 1, 10, POW_RND, RND_NO_SET, 0 ,ID_NO_SET,0);
		PokeCountMine = 1;
	}
}

//---------------------------------------------
//	カーソル位置セット
//---------------------------------------------
static void DebugPokeSetCurSet( u8 pt )
{
	u8	xp, yp;

	SePlay(SE_SELECT);

	xp = dp_cur_pos / 6;
	yp = dp_cur_pos % 6;
	NMenuBoxWrite(
		DP_SERECT_POS[xp], DP_SET_Y+1+(yp<<1),
		DP_SERECT_POS[xp], DP_SET_Y+2+(yp<<1) );

	if( pt == 0 ){
		if( yp != 0 )	dp_cur_pos--;
		else			dp_cur_pos = xp * 6 + 5;
	}
	if( pt == 1 ){
		if( yp != 5 )	dp_cur_pos++;
		else			dp_cur_pos = xp * 6;
	}
	if( pt == 2 ){
		if( xp != 0 )	dp_cur_pos -= 6;
		else			dp_cur_pos = 12 + yp;
	}
	if( pt == 3 ){
		if( xp != 2 )	dp_cur_pos += 6;
		else			dp_cur_pos = yp;
	}

	xp = dp_cur_pos / 6;
	yp = dp_cur_pos % 6;
	PalChangeCursorPut( DP_SERECT_POS[xp], DP_SET_Y+1+(yp<<1), 0xff );
}

//---------------------------------------------
//	キー入力
//---------------------------------------------
static u8 DebugPokeSetMain(void)
{
	if( sys.Trg & U_KEY ){
		DebugPokeSetCurSet(0);
		return 0;
	}

	if( sys.Trg & D_KEY ){
		DebugPokeSetCurSet(1);
		return 0;
	}

	if( sys.Trg & L_KEY ){
		DebugPokeSetCurSet(2);
		return 0;
	}

	if( sys.Trg & R_KEY ){
		DebugPokeSetCurSet(3);
		return 0;
	}

	if( sys.Repeat & A_BUTTON ){
		if( dp_cur_pos <= 5 )	DebugPokeMonsNoSet( dp_cur_pos, 1 );
		if( dp_cur_pos >= 6 && dp_cur_pos <= 11 )
			DebugPokeSexSet( dp_cur_pos % 6 );
		if( dp_cur_pos >= 12 && dp_cur_pos <= 17 )
			DebugPokeLvSet( dp_cur_pos % 6, 1 );

		DegugPokeSetPut( dp_cur_pos % 6 );
		return	0;
	}

	if( sys.Repeat & B_BUTTON ){
		if( dp_cur_pos <= 5 )	DebugPokeMonsNoSet( dp_cur_pos, -1 );
		if( dp_cur_pos >= 6 && dp_cur_pos <= 11 )
			DebugPokeSexSet( dp_cur_pos % 6 );
		if( dp_cur_pos >= 12 && dp_cur_pos <= 17 )
			DebugPokeLvSet( dp_cur_pos % 6, -1 );

		DegugPokeSetPut( dp_cur_pos % 6 );
		return	0;
	}
	if( sys.Repeat & R_BUTTON ){
		if( dp_cur_pos <= 5 )	DebugPokeMonsNoSet( dp_cur_pos, 10 );
		if( dp_cur_pos >= 6 && dp_cur_pos <= 11 )
			DebugPokeSexSet( dp_cur_pos % 6 );
		if( dp_cur_pos >= 12 && dp_cur_pos <= 17 )
			DebugPokeLvSet( dp_cur_pos % 6, 1 );

		DegugPokeSetPut( dp_cur_pos % 6 );
		return	0;
	}

	if( sys.Repeat & L_BUTTON ){
		if( dp_cur_pos <= 5 )	DebugPokeMonsNoSet( dp_cur_pos, -10);
		if( dp_cur_pos >= 6 && dp_cur_pos <= 11 )
			DebugPokeSexSet( dp_cur_pos % 6 );
		if( dp_cur_pos >= 12 && dp_cur_pos <= 17 )
			DebugPokeLvSet( dp_cur_pos % 6, -1 );

		DegugPokeSetPut( dp_cur_pos % 6 );
		return	0;
	}

	if( sys.Trg & START_BUTTON ){
		DebugPokeSetEnd();
		MenuEnd();
		return 1;
	}

	return 0;
}


//---------------------------------------------
//	性別セット
//---------------------------------------------
static u8 DebugPokeSetSexSetMain( u8 no )
{
	u32	per_rnd, pow_rnd;
	u8	new_sex, sex;
	u16	monsno;

	monsno = PokeParaGet( &PokeParaMine[no], ID_monsno );
	sex = PokeSexGet( &PokeParaMine[no] );
	new_sex = PPD[monsno].sex;
	if( new_sex == MONS_MALE || new_sex == MONS_FEMALE || new_sex == MONS_UNKNOWN )
		return	PokeSexGet( &PokeParaMine[no] );

	switch( sex ){
		case MONS_MALE:
			new_sex = MONS_FEMALE;	
			break;
		case MONS_FEMALE:
			new_sex = MONS_MALE;	
			break;
		default:
			return MONS_MALE;
	}

	do{
		per_rnd =  pp_rand();
		per_rnd |= ( pp_rand() << 16 );
	}while( PokeSexGetMonsNo( monsno, per_rnd ) != new_sex );

	pow_rnd = PokeParaGet( &PokeParaMine[no], ID_power_rnd );

//	PokeParaSetPowRnd(
//		&PokeParaMine[no], d_poke[no].monsno, d_poke[no].lv,
//		pow_rnd, per_rnd );
	PokeParaSet(
		&PokeParaMine[no], d_poke[no].monsno, d_poke[no].lv,POW_RND,
		RND_SET,per_rnd,ID_NO_SET,0);

	return	new_sex;
}


//========================================================================================
//	ポロックをつくる
//========================================================================================
// タスクワーク
#define	POLOCK_KARAMI	0
#define	POLOCK_SIBUMI	1
#define	POLOCK_AMAMI	2
#define	POLOCK_NIGAMI	3
#define	POLOCK_SANMI	4

static CUBE	debug_cube;

//-------------------------------------------
//	ポロック名作成
//-------------------------------------------
static u8 DebugPolockNameMake( u8 * str, CUBE * c )
{
	s16	param[6];
	u8	plus = 0;
	u8	p_point = 0;
	u8	m_point = 0;
	u8	z_point = 0;
	u8	wk, wk2, wk3;
	u8	i;

	for( i=0; i<6; i++ ){
		param[i] = GetCubeParam( c, PM_CUBE_KARAI+i );
		if( i != 5 ){
			if( param[i] > 0  ){
				plus |= ( 1 << i );
				p_point++;
			}
			if( param[i] < 0  )		m_point++;
			if( param[i] == 0  )	z_point++;
		}
	}

	// きんいろポロック
	if( param[0] >= 50 || param[1] >= 50 ||
		param[2] >= 50 || param[3] >= 50 || param[4] >= 50 )
	{
		PM_strcpy( str, cube_name14 );
		return	14;
	}

	// しろいポロック
	if( p_point == 4 ){
		PM_strcpy( str, cube_name13 );
		return	13;
	}

	// くろいポロック
	wk = 0;
	for( i=0; i<5; i++ ){
		if( param[i] == 2 )	wk++;
	}
	if( wk == 3 || z_point == 5 || m_point == 4 ){
		PM_strcpy( str, cube_name12 );
		return	12;
	}

	// はいいろポロック
	if( p_point == 3 ){
		PM_strcpy( str, cube_name11 );
		return	11;
	}

	if( p_point == 2 || m_point == 2 ){
		wk  = 6;
		wk2 = 0;
		for( i=0; i<5; i++ ){
			if( param[i] != 0 ){
				if( wk == 6 )	wk  = i;
				else			wk2 = i;
			}
		}
		if( param[wk] >= param[wk2] )	wk3 = wk;
		else							wk3 = wk2;

		// むらさきポロック
		if( wk3 == 0 ){
			PM_strcpy( str, cube_name06 );
			return	6;
		}
		// こんいろポロック
		if( wk3 == 1 ){
			PM_strcpy( str, cube_name07 );
			return	7;
		}
		// ちゃいろポロック
		if( wk3 == 2 ){
			PM_strcpy( str, cube_name08 );
			return	8;
		}
		// そらいろポロック
		if( wk3 == 3 ){
			PM_strcpy( str, cube_name09 );
			return	9;
		}
		// きみどりポロック
		if( wk3 == 4 ){
			PM_strcpy( str, cube_name10 );
			return	10;
		}
	}

	if( p_point == 1 || m_point == 1 ){
		// あかいポロック
		if( param[0] != 0 ){
			PM_strcpy( str, cube_name01 );
			return	1;
		}
		// あおいポロック
		if( param[1] != 0 ){
			PM_strcpy( str, cube_name02 );
			return	2;
		}
		// ももいろポロック
		if( param[2] != 0 ){
			PM_strcpy( str, cube_name03 );
			return	3;
		}
		// みどりのポロック
		if( param[3] != 0 ){
			PM_strcpy( str, cube_name04 );
			return	4;
		}
		// きいろのポロック
		if( param[4] != 0 ){
			PM_strcpy( str, cube_name05 );
			return	5;
		}
	}

	PM_strcpy( str, str_hate5 );
	return	0;
}

//-------------------------------------------
//	パラメータ文字セット
//-------------------------------------------
static void DebugPolockParamStrSet( u8 * str, s16 p )
{
	u8	i;
	s16	wk, wk2, wk3;

	for( i=0; i<4; i++ )
		str[i] = spc_;
	str[4] = EOM_;

	if( p == 0 ){
		str[3] = n0_;
		return;
	}
	if( p > 0 ){
		wk2 = 100;
		wk3 = 0;
		for( i=0; i<3; i++ ){
			wk = p / wk2;
			if( wk3 != 0 || i == 2 || wk != 0 ){
				str[i+1] = n0_ + wk;
				wk3 = 1;
			}
			p %= wk2;
			wk2 /= 10;
		}
		return;
	}
	if( p < 0 ){
		p *= (-1);
		wk2 = 100;
		wk3 = 0;
		for( i=0; i<3; i++ ){
			wk = p / wk2;
			if( wk3 != 0 || i == 2 || wk != 0 ){
				str[i+1] = n0_ + wk;
				if( wk3 == 0 )	str[i] = bou_;
				wk3 = 1;
			}
			p %= wk2;
			wk2 /= 10;
		}
		return;
	}

}

//-------------------------------------------
//	パラメータ表示
//-------------------------------------------
static void DebugPolockParamPut( u8	pos )
{
	CUBE * c = &debug_cube;

	if( pos == 0 ){
		DebugPolockParamStrSet( StrTempBuffer0, (s16)c->karai );
		NMenuMsgWrite( StrTempBuffer0, 8, 3 );
		return;
	}
	if( pos == 1 ){
		DebugPolockParamStrSet( StrTempBuffer0, (s16)c->sibui );
		NMenuMsgWrite( StrTempBuffer0, 8, 5 );
		return;
	}
	if( pos == 2 ){
		DebugPolockParamStrSet( StrTempBuffer0, (s16)c->amai );
		NMenuMsgWrite( StrTempBuffer0, 8, 7 );
		return;
	}
	if( pos == 3 ){
		DebugPolockParamStrSet( StrTempBuffer0, (s16)c->nigai );
		NMenuMsgWrite( StrTempBuffer0, 8, 9 );
		return;
	}
	if( pos == 4 ){
		DebugPolockParamStrSet( StrTempBuffer0, (s16)c->suppai );
		NMenuMsgWrite( StrTempBuffer0, 8, 11 );
		return;
	}
	if( pos == 5 ){
		DebugPolockParamStrSet( StrTempBuffer0, (s16)c->umai );
		NMenuMsgWrite( StrTempBuffer0, 8, 13 );
	}

}

//-------------------------------------------
//	パラメータセット
//-------------------------------------------
static void DebugPolockParamSet( u8	pos, s8 p )
{
	CUBE * c = &debug_cube;

	if( pos == 0 ){
		c->karai += p;
		return;
	}
	if( pos == 1 ){
		c->sibui += p;
		return;
	}
	if( pos == 2 ){
		c->amai += p;
		return;
	}
	if( pos == 3 ){
		c->nigai += p;
		return;
	}
	if( pos == 4 ){
		c->suppai += p;
		return;
	}
	if( pos == 5 )
		c->umai += p;
}

//-------------------------------------------
//	ポロック名表示
//-------------------------------------------
static void DebugPolockNamePut(void)
{
	debug_cube.type = DebugPolockNameMake( StrTempBuffer0, &debug_cube );
	NMenuBoxWrite( 1, 1, 8, 2 );
	NMenuMsgWrite( StrTempBuffer0, 1, 1 );
}

//-------------------------------------------
//	ウィンドウ表示
//-------------------------------------------
static void DebugPolockMakeWin(void)
{
	u8	i;

	NMenuWinBoxWrite( 0, 0, 12, 15 );
	DebugPolockNamePut();
	NMenuMsgWrite( str_cube_parm00, 2, 3 );
	NMenuMsgWrite( str_cube_parm01, 2, 5 );
	NMenuMsgWrite( str_cube_parm02, 2, 7 );
	NMenuMsgWrite( str_cube_parm03, 2, 9 );
	NMenuMsgWrite( str_cube_parm04, 2, 11 );
	NMenuMsgWrite( str_cube_parm05, 2, 13 );
	for( i=0; i<6; i++ )
		DebugPolockParamPut(i);

	NMenuVCursorInit( 1, 3, 6, 0 );
}

//-------------------------------------------
//	ポロックを加える
//-------------------------------------------
static void DebugAddPolock(void)
{
	CUBE * c = &debug_cube;
	u8	p = 0, i;

	if( c->type == 12 ){
		if( c->karai == 2 )		p++;
		if( c->amai == 2 )		p++;
		if( c->nigai == 2 )		p++;
		if( c->sibui == 2 )		p++;
		if( c->suppai == 2 )	p++;
		if( p != 3 ){
			c->karai = 2;
			c->amai = 2;
			c->nigai = 2;
		}
	}

	AddCube( c );

	DebugPolockNamePut();
	for( i=0; i<6; i++ )
		DebugPolockParamPut(i);
}


//-------------------------------------------
//	メイン
//-------------------------------------------
static u8 DebugPolockMakeTask(void)
{
	if( sys.Repeat & U_KEY ){
		NMenuVCursorSet( -1 );
		return	0;
	}
	if( sys.Repeat & D_KEY ){
		NMenuVCursorSet( 1 );
		return	0;
	}

	if( sys.Repeat & L_KEY ){
		DebugPolockParamSet( NMenuVCursorPosGet(), -1 );
		DebugPolockParamPut( NMenuVCursorPosGet() );
		DebugPolockNamePut();
		return	0;
	}
	if( sys.Repeat & R_KEY ){
		DebugPolockParamSet( NMenuVCursorPosGet(), 1 );
		DebugPolockParamPut( NMenuVCursorPosGet() );
		DebugPolockNamePut();
		return	0;
	}

	if( sys.Trg & A_BUTTON ){
		DebugAddPolock();
		SePlay( SE_SELECT );
		return	0;
	}

	if( sys.Trg & B_BUTTON ){
		NMenuBoxClear( 0, 0, 29, 19 );
		MenuEnd();
		return	1;
	}

	return	0;
}

//-------------------------------------------
//	呼び出し
//-------------------------------------------
static u8 DebugPolockMake(void)
{
	NMenuBoxClear( 0, 0, 29, 19 );
	DebugPolockMakeWin();
	MenuFunc = DebugPolockMakeTask;
	return	0;
}



//========================================================================================
//	努力値表示
//========================================================================================
static const u8 debug_str_poke00[] = { H__,P__,spc_,do_,ri_,yyo_,ku_,ti_,EOM_ };
static const u8 debug_str_poke01[] = { ko_,u_,ge_,ki_,spc_,do_,ri_,yyo_,ku_,ti_,EOM_ };
static const u8 debug_str_poke02[] = { bo_,u_,gi_,yyo_,spc_,do_,ri_,yyo_,ku_,ti_,EOM_ };
static const u8 debug_str_poke03[] = { su_,ba_,ya_,sa_,spc_,do_,ri_,yyo_,ku_,ti_,EOM_ };
static const u8 debug_str_poke04[] = { to_,ku_,ko_,u_,spc_,do_,ri_,yyo_,ku_,ti_,EOM_ };
static const u8 debug_str_poke05[] = { to_,ku_,bo_,u_,spc_,do_,ri_,yyo_,ku_,ti_,EOM_ };
static const u8 debug_str_poke06[] = { na_,tu_,ki_,do_,EOM_ };
static const u8 debug_str_poke07[] = { do_,ri_,yyo_,ku_,ti_,spc_,go_,u_,ke_,i_,EOM_ };

static u8 put_poke_no = 0;

//-------------------------------------------
//	表示
//-------------------------------------------
static void PokeSecretParamPut(void)
{
	NMenuWinBoxWrite( 0, 0, 22, 19 );

	// ニックネーム
	// ポケモン名

	NMenuMsgWrite( str_surassyu, 11, 1 );		// スラッシュ

	NMenuMsgWrite( debug_str_poke00, 2, 3 );	// ヒットポイント努力値
	NMenuMsgWrite( debug_str_poke01, 2, 5 );	// 攻撃力努力値
	NMenuMsgWrite( debug_str_poke02, 2, 7 );	// 防御力努力値
	NMenuMsgWrite( debug_str_poke03, 2, 9 );	// 素早さ努力値
	NMenuMsgWrite( debug_str_poke04, 2, 11 );	// 特殊攻撃努力値
	NMenuMsgWrite( debug_str_poke05, 2, 13 );	// 特殊防御努力値
	NMenuMsgWrite( debug_str_poke07, 2, 15 );	// 努力値合計
	NMenuMsgWrite( debug_str_poke06, 2, 17 );	// なつき度
}

static void PokeSecretDataPut( PokemonParam * pp )
{
	u16	work = 0, work2;

	// ニックネーム
	NMenuBoxWrite( 1, 1, 10, 2 );
	PokeParaGet( pp, ID_nickname, StrTempBuffer0 );
	NMenuMsgWrite( StrTempBuffer0, 1, 1 );

	// ポケモン名
	NMenuBoxWrite( 12, 1, 21, 2 );
	NMenuMsgWrite( PokeNameData[ PokeParaGet( pp, ID_monsno ) ], 12, 1 );

	// ヒットポイント努力値
	work2 = PokeParaGet( pp, ID_hp_exp );
	work += work2;
	PM_NumMsgSet( StrTempBuffer0, work2, NUM_MODE_LEFT, 5 );
	NMenuBoxWrite( 13, 3, 17, 4 );
	NMenuMsgWrite( StrTempBuffer0, 13, 3 );

	// 攻撃力努力値
	work2 = PokeParaGet( pp, ID_pow_exp );
	work += work2;
	PM_NumMsgSet( StrTempBuffer0, work2, NUM_MODE_LEFT, 5 );
	NMenuBoxWrite( 13, 5, 17, 6 );
	NMenuMsgWrite( StrTempBuffer0, 13, 5 );

	// 防御力努力値
	work2 = PokeParaGet( pp, ID_def_exp );
	work += work2;
	PM_NumMsgSet( StrTempBuffer0, work2, NUM_MODE_LEFT, 5 );
	NMenuBoxWrite( 13, 7, 17, 8 );
	NMenuMsgWrite( StrTempBuffer0, 13, 7 );

	// 素早さ努力値
	work2 = PokeParaGet( pp, ID_agi_exp );
	work += work2;
	PM_NumMsgSet( StrTempBuffer0, work2, NUM_MODE_LEFT, 5 );
	NMenuBoxWrite( 13, 9, 17, 10 );
	NMenuMsgWrite( StrTempBuffer0, 13, 9 );

	// 特殊攻撃努力値
	work2 = PokeParaGet( pp, ID_spepow_exp );
	work += work2;
	PM_NumMsgSet( StrTempBuffer0, work2, NUM_MODE_LEFT, 5 );
	NMenuBoxWrite( 13, 11, 17, 12 );
	NMenuMsgWrite( StrTempBuffer0, 13, 11 );

	// 特殊防御努力値
	work2 = PokeParaGet( pp, ID_spedef_exp );
	work += work2;
	PM_NumMsgSet( StrTempBuffer0, work2, NUM_MODE_LEFT, 5 );
	NMenuBoxWrite( 13, 13, 17, 14 );
	NMenuMsgWrite( StrTempBuffer0, 13, 13 );

	// 努力値合計
	PM_NumMsgSet( StrTempBuffer0, work, NUM_MODE_LEFT, 5 );
	NMenuBoxWrite( 13, 15, 17, 16 );
	NMenuMsgWrite( StrTempBuffer0, 13, 15 );

	// なつき度
	PM_NumMsgSet( StrTempBuffer0, PokeParaGet( pp, ID_friend ), NUM_MODE_LEFT, 5 );
	NMenuBoxWrite( 13, 17, 17, 18 );
	NMenuMsgWrite( StrTempBuffer0, 13, 17 );
}

//-------------------------------------------
//	次のポケモン取得
//-------------------------------------------
static void DebugNextPokeGet( s8 p )
{
	s16	i;

	if( p == -1 ){
		if( put_poke_no == 0 ){
			for( i=5; i>=0; i-- ){
				if( PokeParaGet( &PokeParaMine[i], ID_monsno ) != 0 ){
					put_poke_no = i;
					return;
				}
			}
		}
		put_poke_no += p;
		return;
	}

	if( p == 1 ){
		put_poke_no += p;
		if( put_poke_no == 6 ){
			put_poke_no = 0;
			return;
		}
		if( PokeParaGet( &PokeParaMine[put_poke_no], ID_monsno ) == 0 )
			put_poke_no = 0;
	}
}

//-------------------------------------------
//	キー操作
//-------------------------------------------
static u8 DebugPokeSecretDataKey(void)
{
	if( sys.Trg & L_KEY ){
		DebugNextPokeGet( -1 );
		PokeSecretDataPut( &PokeParaMine[put_poke_no] );
		return	0;
	}
	if( sys.Trg & R_KEY ){
		DebugNextPokeGet(1);
		PokeSecretDataPut( &PokeParaMine[put_poke_no] );
		return	0;
	}

	if( sys.Trg & B_BUTTON ){
		NMenuBoxClear( 0, 0, 29, 19 );
		MenuEnd();
		return	1;
	}

	return	0;
}

//-------------------------------------------
//	呼び出し
//-------------------------------------------
u8 DebugPokeSecretData(void)
{
	NMenuBoxClear( 0, 0, 29, 19 );
	put_poke_no = 0;
	PokeSecretParamPut();
	PokeSecretDataPut( &PokeParaMine[0] );
	MenuFunc = DebugPokeSecretDataKey;
	return	0;
}



//========================================================================================
//		乱数テスト
//========================================================================================
static u16	s_rnd_no = 0;
static u16	e_rnd_no = 0;
static u16	rnd_max_no = 0;
static u16	a_rnd_no = 0;

static const u8 d_str_rnd00[] = { ko_,ko_,ka_,ra_,EOM_ };
static const u8 d_str_rnd01[] = { ko_,ko_,ma_,de_,EOM_ };
static const u8 d_str_rnd02[] = { ka_,i_,su_,u_,EOM_ };
static const u8 d_str_rnd03[] = { ke_,ttu_,ka_,EOM_ };
static const u8 d_str_rnd04[] = { ka_,i_,EOM_ };
static const u8 d_str_rnd05[] = { n0_,EOM_ };
static const u8 d_str_rnd06[] = { ha_,n_,i_,EOM_ };

//-------------------------------------------
//	計算
//-------------------------------------------
static u16 RandCheckMain(void)
{
	u16	max = 0, rnd;
	u16	s_prm, e_prm;
	u32	i;

	if( s_rnd_no <= e_rnd_no ){
		s_prm = s_rnd_no;
		e_prm = e_rnd_no;
	}else{
		s_prm = e_rnd_no;
		e_prm = s_rnd_no;
	}

	for( i=0; i<rnd_max_no; i++ ){
		rnd = pp_rand() % a_rnd_no;
		if( rnd >= s_prm && rnd <= e_prm )
			max++;
	}

	return	max;
}

//-------------------------------------------
//	表示
//-------------------------------------------
static void RandTestWinPut(void)
{
	NMenuWinBoxWrite( 0, 0, 15, 11 );

	NMenuMsgWrite( d_str_rnd00, 2, 1 );
	NMenuMsgWrite( d_str_rnd01, 2, 3 );
	NMenuMsgWrite( d_str_rnd06, 2, 5 );
	NMenuMsgWrite( d_str_rnd02, 2, 7 );
	NMenuMsgWrite( d_str_rnd03, 2, 9 );
	NMenuMsgWrite( d_str_rnd04, 13, 9 );

	NMenuMsgWrite( d_str_rnd05, 12, 1 );
	NMenuMsgWrite( d_str_rnd05, 12, 3 );
	NMenuMsgWrite( d_str_rnd05, 12, 5 );
	NMenuMsgWrite( d_str_rnd05, 12, 7 );
	NMenuMsgWrite( d_str_rnd05, 12, 9 );

	NMenuVCursorInit( 1, 1, 4, 0 );
}

static void RandTestPut( u16 no )
{
	PM_NumMsgSet( StrTempBuffer0, no, NUM_MODE_SPACE, 5 );
	NMenuMsgWrite( StrTempBuffer0, 8, 9 );
}

static void RandTestParamPut( u16 * no, s8 plus, u8 y )
{
	*no += plus;

	PM_NumMsgSet( StrTempBuffer0, *no, NUM_MODE_SPACE, 5 );
	NMenuMsgWrite( StrTempBuffer0, 8, y );
}

//-------------------------------------------
//	キーチェック
//-------------------------------------------
static u8 RandTestKeyCheck(void)
{
	s8	plus, pos;

	if( sys.Cont & R_BUTTON )	plus = 100;
	else						plus = 1;

	if( sys.Repeat & U_KEY ){
		NMenuVCursorSet( -1 );
		return	0;
	}

	if( sys.Repeat & D_KEY ){
		NMenuVCursorSet( 1 );
		return	0;
	}

	if( sys.Repeat & L_KEY ){
		pos = NMenuVCursorPosGet();
		if( pos == 0 )	RandTestParamPut( &s_rnd_no, -plus, 1 );
		if( pos == 1 )	RandTestParamPut( &e_rnd_no, -plus, 3 );
		if( pos == 2 )	RandTestParamPut( &a_rnd_no, -plus, 5 );
		if( pos == 3 )	RandTestParamPut( &rnd_max_no, -plus, 7 );
		return	0;
	}

	if( sys.Repeat & R_KEY ){
		pos = NMenuVCursorPosGet();
		if( pos == 0 )	RandTestParamPut( &s_rnd_no, plus, 1 );
		if( pos == 1 )	RandTestParamPut( &e_rnd_no, plus, 3 );
		if( pos == 2 )	RandTestParamPut( &a_rnd_no, plus, 5 );
		if( pos == 3 )	RandTestParamPut( &rnd_max_no, plus, 7 );
		return	0;
	}

	if( sys.Trg & A_BUTTON ){
		if( a_rnd_no != 0 ){
			SePlay( SE_SELECT );
			RandTestPut( RandCheckMain() );
		}
		return	0;
	}

	if( sys.Trg & B_BUTTON ){
		NMenuBoxClear( 0, 0, 29, 19 );
		MenuEnd();
		return	1;
	}

	return	0;
}

//-------------------------------------------
//	呼び出し
//-------------------------------------------
u8 DebugRandTest(void)
{
	s_rnd_no = 0;
	e_rnd_no = 0;
	a_rnd_no = 0;
	rnd_max_no = 0;
	NMenuBoxClear( 0, 0, 29, 19 );
	RandTestWinPut();
	MenuFunc = RandTestKeyCheck;
	return	0;
}


#endif	PM_DEBUG
