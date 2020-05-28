//=========================================================================
//
//	
//	マップスクリーンデータ＆マップキャラデータファイル
//
//	2001.04.04 by tama
//		(旧testdata.cから分離）
//
//=========================================================================

#include "common.h"
#include "map.h"

//=========================================================================
//
//	マップキャラデータ
//		|
//		+----キャラデータ構造体
//				|
//				+----キャラデータ
//				+----セルデータ
//
//=========================================================================


//ポケモンＡＧＢ用マップデータ！！

// キャラ・パレット
#include "../mapdata/field_sch_LZ.c"
#include "../mapdata/field.acl"
#include "../mapdata/field_1_sch_LZ.c"
#include "../mapdata/field_1.acl"
#include "../mapdata/field_2_sch_LZ.c"
#include "../mapdata/field_2.acl"
#include "../mapdata/field_3_sch_LZ.c"
#include "../mapdata/field_3.acl"
#include "../mapdata/field_4_sch_LZ.c"
#include "../mapdata/field_4.acl"
#include "../mapdata/field_5_sch_LZ.c"
#include "../mapdata/field_5.acl"
#include "../mapdata/field_6_sch_LZ.c"
#include "../mapdata/field_6.acl"
#include "../mapdata/field_7_sch_LZ.c"
#include "../mapdata/field_7.acl"
#include "../mapdata/field_8_sch_LZ.c"
#include "../mapdata/field_8.acl"
#include "../mapdata/field_9_sch_LZ.c"
#include "../mapdata/field_9.acl"
#include "../mapdata/field_10_sch_LZ.c"
#include "../mapdata/field_10.acl"
#include "../mapdata/field_11_sch_LZ.c"
#include "../mapdata/field_11.acl"
#include "../mapdata/field_12_sch_LZ.c"
#include "../mapdata/field_12.acl"
#include "../mapdata/field_13_sch_LZ.c"
#include "../mapdata/field_13.acl"
#include "../mapdata/room_sch_LZ.c"			// 2001/07/23 by nakahiro
#include "../mapdata/room.acl"				// 2001/07/23 by nakahiro
#include "../mapdata/fdshop_sch_LZ.c"
#include "../mapdata/fdshop.acl"
#include "../mapdata/pc_sch_LZ.c"			// 2001/09/14 by nakahiro
#include "../mapdata/pc.acl"				// 2001/09/14 by nakahiro
#include "../mapdata/cave_sch_LZ.c"			// 2001/09/18 by nakahiro
#include "../mapdata/cave.acl"				// 2001/09/18 by nakahiro
#include "../mapdata/p_school_sch_LZ.c"		// 2001/09/19 by nakahiro
#include "../mapdata/p_school.acl"			// 2001/09/19 by nakahiro
#include "../mapdata/club_sch_LZ.c"			// 2001/09/21 by nakahiro
#include "../mapdata/club.acl"				// 2001/09/21 by nakahiro
#include "../mapdata/ice_sch_LZ.c"			// 2001/10/15 by nakahiro
#include "../mapdata/ice.acl"				// 2001/10/15 by nakahiro
#include "../mapdata/limcave_sch_LZ.c"		// 2001/10/24 by nakahiro
#include "../mapdata/limcave.acl"			// 2001/10/24 by nakahiro
#include "../mapdata/museum_sch_LZ.c"		// 2001/10/25 by nakahiro
#include "../mapdata/museum.acl"			// 2001/10/25 by nakahiro
#include "../mapdata/trade.ach"				// 2001/10/26 by nakahiro
#include "../mapdata/trade.acl"				// 2001/10/26 by nakahiro
#include "../mapdata/uminoie_sch_LZ.c"		// 2001/10/26 by nakahiro
#include "../mapdata/uminoie.acl"			// 2001/10/26 by nakahiro
#include "../mapdata/flwsp_sch_LZ.c"		// 2001/10/26 by nakahiro
#include "../mapdata/flwsp.acl"				// 2001/10/26 by nakahiro
#include "../mapdata/sodateya_sch_LZ.c"		// 2001/10/26 by nakahiro
#include "../mapdata/sodateya.acl"			// 2001/10/26 by nakahiro
#include "../mapdata/shipyard_sch_LZ.c"		// 2001/10/29 by nakahiro
#include "../mapdata/shipyard.acl"			// 2001/10/29 by nakahiro
#include "../mapdata/jiten_sch_LZ.c"		// 2001/10/31 by nakahiro
#include "../mapdata/jiten.acl"				// 2001/10/31 by nakahiro
#include "../mapdata/moscave_sch_LZ.c"		// 2001/12/17 by nakahiro
#include "../mapdata/moscave.acl"			// 2001/12/17 by nakahiro
#include "../mapdata/h_ishi_sch_LZ.c"		// 2001/12/21 by nakahiro
#include "../mapdata/h_ishi.acl"			// 2001/12/21 by nakahiro
#include "../mapdata/h_kinoue_sch_LZ.c"		// 2001/12/21 by nakahiro
#include "../mapdata/h_kinoue.acl"			// 2001/12/21 by nakahiro
#include "../mapdata/h_kusa_sch_LZ.c"		// 2001/12/21 by nakahiro
#include "../mapdata/h_kusa.acl"			// 2001/12/21 by nakahiro
#include "../mapdata/h_sime_sch_LZ.c"		// 2001/12/21 by nakahiro
#include "../mapdata/h_sime.acl"			// 2001/12/21 by nakahiro
#include "../mapdata/h_suna_sch_LZ.c"		// 2001/12/21 by nakahiro
#include "../mapdata/h_suna.acl"			// 2001/12/21 by nakahiro
#include "../mapdata/h_tsuchi_sch_LZ.c"		// 2001/12/21 by nakahiro
#include "../mapdata/h_tsuchi.acl"			// 2001/12/21 by nakahiro
#include "../mapdata/h_ishi.ach"			// 2001/12/21 by nakahiro
#include "../mapdata/h_kinoue.ach"			// 2001/12/21 by nakahiro
#include "../mapdata/h_kusa.ach"			// 2001/12/21 by nakahiro
#include "../mapdata/h_sime.ach"			// 2001/12/21 by nakahiro
#include "../mapdata/h_suna.ach"			// 2001/12/21 by nakahiro
#include "../mapdata/h_tsuchi.ach"			// 2001/12/21 by nakahiro
#include "../mapdata/nidai_sch_LZ.c"		// 2002/02/06 by nakahiro
#include "../mapdata/nidai.acl"				// 2002/02/06 by nakahiro
#include "../mapdata/hall_sch_LZ.c"			// 2002/02/27 by nakahiro
#include "../mapdata/hall.acl"				// 2002/02/27 by nakahiro
#include "../mapdata/art_sch_LZ.c"			// 2002/02/28 by nakahiro
#include "../mapdata/art.acl"				// 2002/02/28 by nakahiro
#include "../mapdata/s_home_sch_LZ.c"		// 2002/02/28 by nakahiro
#include "../mapdata/s_home.acl"			// 2002/02/28 by nakahiro
#include "../mapdata/o_ken_sch_LZ.c"		// 2002/03/22 by nakahiro
#include "../mapdata/o_ken.acl"				// 2002/03/22 by nakahiro
#include "../mapdata/field_sea_sch_LZ.c"	// 2002/04/08 by nakahiro
#include "../mapdata/field_sea.acl"			// 2002/04/08 by nakahiro
#include "../mapdata/minka_sch_LZ.c"		// 2002/04/19 by nakahiro
#include "../mapdata/minka.acl"				// 2002/04/19 by nakahiro
#include "../mapdata/game_sch_LZ.c"			// 2002/04/19 by nakahiro
#include "../mapdata/game.acl"				// 2002/04/19 by nakahiro
#include "../mapdata/gym_sch_LZ.c"			// 2002/02/07 by nakahiro
#include "../mapdata/gym.acl"				// 2002/02/07 by nakahiro
#include "../mapdata/gym_01_sch_LZ.c"		// 2002/04/22 by nakahiro
#include "../mapdata/gym_01.acl"			// 2002/04/22 by nakahiro
#include "../mapdata/gym_02_sch_LZ.c"		// 2002/04/22 by nakahiro
#include "../mapdata/gym_02.acl"			// 2002/04/22 by nakahiro
#include "../mapdata/gym_03_sch_LZ.c"		// 2002/04/23 by nakahiro
#include "../mapdata/gym_03.acl"			// 2002/04/23 by nakahiro
#include "../mapdata/gym_04_sch_LZ.c"		// 2002/04/24 by nakahiro
#include "../mapdata/gym_04.acl"			// 2002/04/24 by nakahiro
#include "../mapdata/gym_05_sch_LZ.c"		// 2002/04/12 by nakahiro
#include "../mapdata/gym_05.acl"			// 2002/04/12 by nakahiro
#include "../mapdata/gym_06_sch_LZ.c"		// 2002/06/24 by nakahiro
#include "../mapdata/gym_06.acl"			// 2002/06/24 by nakahiro
#include "../mapdata/gym_07_sch_LZ.c"		// 2002/06/24 by nakahiro
#include "../mapdata/gym_07.acl"			// 2002/06/24 by nakahiro
#include "../mapdata/gym_08_sch_LZ.c"		// 2002/04/12 by nakahiro
#include "../mapdata/gym_08.acl"			// 2002/04/12 by nakahiro
#include "../mapdata/karakuri_sch_LZ.c"		// 2002/06/13 by nakahiro
#include "../mapdata/karakuri.acl"			// 2002/06/13 by nakahiro
#include "../mapdata/ship_sch_LZ.c"			// 2002/06/26 by nakahiro
#include "../mapdata/ship.acl"				// 2002/06/26 by nakahiro
#include "../mapdata/base.ach"				// 2002/07/17 by nakahiro
#include "../mapdata/base.acl"				// 2002/07/17 by nakahiro
#include "../mapdata/champ_sch_LZ.c"		// 2002/07/29 by nakahiro
#include "../mapdata/champ.acl"				// 2002/07/29 by nakahiro
#include "../mapdata/b_tower_sch_LZ.c"		// 2002/08/16 by nakahiro
#include "../mapdata/b_tower.acl"			// 2002/08/16 by nakahiro

// セル
#include "../mapdata/field_cell.c"
#include "../mapdata/field_1_cell.c"		// 2001/07/23 by nakahiro
#include "../mapdata/field_2_cell.c"
#include "../mapdata/field_3_cell.c"
#include "../mapdata/field_4_cell.c"
#include "../mapdata/field_5_cell.c"
#include "../mapdata/field_6_cell.c"
#include "../mapdata/field_7_cell.c"
#include "../mapdata/field_8_cell.c"
#include "../mapdata/field_9_cell.c"
#include "../mapdata/field_10_cell.c"
#include "../mapdata/field_11_cell.c"
#include "../mapdata/field_12_cell.c"
#include "../mapdata/field_13_cell.c"
#include "../mapdata/room_cell.c"			// 2001/07/23 by nakahiro
#include "../mapdata/fdshop_cell.c"
#include "../mapdata/pc_cell.c"				// 2001/09/14 by nakahiro
#include "../mapdata/cave_cell.c"			// 2001/09/18 by nakahiro
#include "../mapdata/p_school_cell.c"		// 2001/09/19 by nakahiro
#include "../mapdata/club_cell.c"			// 2001/09/21 by nakahiro
#include "../mapdata/ice_cell.c"			// 2001/10/15 by nakahiro
#include "../mapdata/limcave_cell.c"		// 2001/10/24 by nakahiro
#include "../mapdata/museum_cell.c"			// 2001/10/25 by nakahiro
#include "../mapdata/trade_cell.c"			// 2001/10/26 by nakahiro
#include "../mapdata/uminoie_cell.c"		// 2001/10/26 by nakahiro
#include "../mapdata/flwsp_cell.c"			// 2001/10/26 by nakahiro
#include "../mapdata/sodateya_cell.c"		// 2001/10/26 by nakahiro
#include "../mapdata/shipyard_cell.c"		// 2001/10/29 by nakahiro
#include "../mapdata/jiten_cell.c"			// 2001/10/31 by nakahiro
#include "../mapdata/moscave_cell.c"		// 2001/12/17 by nakahiro
#include "../mapdata/himits_cell.c"			// 2001/12/21 by nakahiro
#include "../mapdata/nidai_cell.c"			// 2002/02/06 by nakahiro
#include "../mapdata/hall_cell.c"			// 2002/02/27 by nakahiro
#include "../mapdata/art_cell.c"			// 2002/02/28 by nakahiro
#include "../mapdata/s_home_cell.c"			// 2002/02/28 by nakahiro
#include "../mapdata/o_ken_cell.c"			// 2002/03/22 by nakahiro
#include "../mapdata/field_sea_cell.c"		// 2002/04/08 by nakahiro
#include "../mapdata/minka_cell.c"			// 2002/04/19 by nakahiro
#include "../mapdata/game_cell.c"			// 2002/04/19 by nakahiro
#include "../mapdata/gym_cell.c"			// 2002/02/07 by nakahiro
#include "../mapdata/gym_01_cell.c"			// 2002/04/22 by nakahiro
#include "../mapdata/gym_02_cell.c"			// 2002/04/22 by nakahiro
#include "../mapdata/gym_03_cell.c"			// 2002/04/23 by nakahiro
#include "../mapdata/gym_04_cell.c"			// 2002/04/24 by nakahiro
#include "../mapdata/gym_05_cell.c"			// 2002/04/12 by nakahiro
#include "../mapdata/gym_06_cell.c"			// 2002/06/24 by nakahiro
#include "../mapdata/gym_07_cell.c"			// 2002/06/24 by nakahiro
#include "../mapdata/gym_08_cell.c"			// 2002/04/12 by nakahiro
#include "../mapdata/karakuri_cell.c"		// 2002/06/13 by nakahiro
#include "../mapdata/ship_cell.c"			// 2002/06/26 by nakahiro
#include "../mapdata/base_cell.c"			// 2002/07/17 by nakahiro
#include "../mapdata/champ_cell.c"			// 2002/07/29 by nakahiro
#include "../mapdata/b_tower_cell.c"		// 2002/08/16 by nakahiro


/* ＢＧアニメ初期化関数 */
extern void BgAnimeInitFieldDefault(void);
extern void BgAnimeInitField01(void);
extern void BgAnimeInitField02(void);
extern void BgAnimeInitField03(void);
extern void BgAnimeInitField04(void);
extern void BgAnimeInitField05(void);
extern void BgAnimeInitField06(void);
extern void BgAnimeInitField07(void);
extern void BgAnimeInitField08(void);
extern void BgAnimeInitField09(void);
extern void BgAnimeInitField10(void);
extern void BgAnimeInitField11(void);
extern void BgAnimeInitField12(void);
extern void BgAnimeInitField13(void);
extern void BgAnimeInitFieldSea(void);
extern void BgAnimeInitRoom00(void);
extern void BgAnimeInitGym03(void);
extern void BgAnimeInitGym08(void);
extern void BgAnimeInitChamp(void);
extern void BgAnimeInitCave(void);
extern void BgAnimeInitJiten(void);


/* 常駐データ */
const MapCharData field_char_data =
{
		MAP_CGX_COMPRESS,
	//	MAP_CGX_NORMAL,
		MAP_PLTT_NORMAL,
	//	field_Character,
		field_sch_LZ,
		field_Palette,
		field_CellChrData,
		field_CellAtbData,
		BgAnimeInitFieldDefault
};

//非常駐データ	//2001/7/23 by nakahiro
static const MapCharData field_1_char_data =
{
		MAP_CGX_COMPRESS,
		MAP_PLTT_NORMALSUB,
		field_1_sch_LZ,
		field_1_Palette,
		field_1_CellChrData,
		field_1_CellAtbData,
		BgAnimeInitField01
};

//非常駐データ	//2001/12/10 by nakahiro
static const MapCharData field_2_char_data =
{
		MAP_CGX_COMPRESS,
		MAP_PLTT_NORMALSUB,
		field_2_sch_LZ,
		field_2_Palette,
		field_2_CellChrData,
		field_2_CellAtbData,
		BgAnimeInitField02
};

//非常駐データ	//2001/12/10 by nakahiro
static const MapCharData field_3_char_data =
{
		MAP_CGX_COMPRESS,
		MAP_PLTT_NORMALSUB,
		field_3_sch_LZ,
		field_3_Palette,
		field_3_CellChrData,
		field_3_CellAtbData,
		BgAnimeInitField03
};

//非常駐データ	//2001/12/10 by nakahiro
static const MapCharData field_4_char_data =
{
		MAP_CGX_COMPRESS,
		MAP_PLTT_NORMALSUB,
		field_4_sch_LZ,
		field_4_Palette,
		field_4_CellChrData,
		field_4_CellAtbData,
		BgAnimeInitField04
};

//非常駐データ	//2001/12/10 by nakahiro
static const MapCharData field_5_char_data =
{
		MAP_CGX_COMPRESS,
		MAP_PLTT_NORMALSUB,
		field_5_sch_LZ,
		field_5_Palette,
		field_5_CellChrData,
		field_5_CellAtbData,
		BgAnimeInitField05
};

//非常駐データ	//2001/12/10 by nakahiro
static const MapCharData field_6_char_data =
{
		MAP_CGX_COMPRESS,
		MAP_PLTT_NORMALSUB,
		field_6_sch_LZ,
		field_6_Palette,
		field_6_CellChrData,
		field_6_CellAtbData,
		BgAnimeInitField06
};

//非常駐データ	//2001/12/10 by nakahiro
static const MapCharData field_7_char_data =
{
		MAP_CGX_COMPRESS,
		MAP_PLTT_NORMALSUB,
		field_7_sch_LZ,
		field_7_Palette,
		field_7_CellChrData,
		field_7_CellAtbData,
		BgAnimeInitField07
};

//非常駐データ	//2001/12/10 by nakahiro
static const MapCharData field_8_char_data =
{
		MAP_CGX_COMPRESS,
		MAP_PLTT_NORMALSUB,
		field_8_sch_LZ,
		field_8_Palette,
		field_8_CellChrData,
		field_8_CellAtbData,
		BgAnimeInitField08
};

//非常駐データ	//2001/12/10 by nakahiro
static const MapCharData field_9_char_data =
{
		MAP_CGX_COMPRESS,
		MAP_PLTT_NORMALSUB,
		field_9_sch_LZ,
		field_9_Palette,
		field_9_CellChrData,
		field_9_CellAtbData,
		BgAnimeInitField09
};

//非常駐データ	//2001/12/10 by nakahiro
static const MapCharData field_10_char_data =
{
		MAP_CGX_COMPRESS,
		MAP_PLTT_NORMALSUB,
		field_10_sch_LZ,
		field_10_Palette,
		field_10_CellChrData,
		field_10_CellAtbData,
		BgAnimeInitField10
};

//非常駐データ	//2001/12/10 by nakahiro
static const MapCharData field_11_char_data =
{
		MAP_CGX_COMPRESS,
		MAP_PLTT_NORMALSUB,
		field_11_sch_LZ,
		field_11_Palette,
		field_11_CellChrData,
		field_11_CellAtbData,
		BgAnimeInitField11
};

//非常駐データ	//2001/12/10 by nakahiro
static const MapCharData field_12_char_data =
{
		MAP_CGX_COMPRESS,
		MAP_PLTT_NORMALSUB,
		field_12_sch_LZ,
		field_12_Palette,
		field_12_CellChrData,
		field_12_CellAtbData,
		BgAnimeInitField12
};

//非常駐データ	//2001/12/10 by nakahiro
static const MapCharData field_13_char_data =
{
		MAP_CGX_COMPRESS,
		MAP_PLTT_NORMALSUB,
		field_13_sch_LZ,
		field_13_Palette,
		field_13_CellChrData,
		field_13_CellAtbData,
		BgAnimeInitField13
};

//非常駐データ（部屋）	//2001/7/23 by nakahiro
static const MapCharData room_char_data =
{
		MAP_CGX_COMPRESS,
		MAP_PLTT_NORMAL,
		room_sch_LZ,
		room_Palette,
		room_CellChrData,
		room_CellAtbData,
		BgAnimeInitRoom00
};

static const MapCharData fdshop_char_data =
{
		MAP_CGX_COMPRESS,
		MAP_PLTT_NORMALSUB,
		fdshop_sch_LZ,
		fdshop_Palette,
		fdshop_CellChrData,
		fdshop_CellAtbData,
		NULL
};

//非常駐データ（ポケセン）	//2001/9/14 by nakahiro
static const MapCharData pc_char_data =
{
		MAP_CGX_COMPRESS,
		MAP_PLTT_NORMALSUB,
		pc_sch_LZ,
		pc_Palette,
		pc_CellChrData,
		pc_CellAtbData,
		NULL
};

//非常駐データ（ダンジョン）	//2001/9/18 by nakahiro
static const MapCharData cave_char_data =
{
		MAP_CGX_COMPRESS,
		MAP_PLTT_NORMALSUB,
		cave_sch_LZ,
		cave_Palette,
		cave_CellChrData,
		cave_CellAtbData,
		BgAnimeInitCave,
};

//非常駐データ（トレーナーズスクール）	//2001/9/19 by nakahiro
static const MapCharData p_school_char_data =
{
		MAP_CGX_COMPRESS,
		MAP_PLTT_NORMALSUB,
		p_school_sch_LZ,
		p_school_Palette,
		p_school_CellChrData,
		p_school_CellAtbData,
		NULL
};

//非常駐データ（ポケモン大好きクラブ）	//2001/9/21 by nakahiro
static const MapCharData club_char_data =
{
		MAP_CGX_COMPRESS,
		MAP_PLTT_NORMALSUB,
		club_sch_LZ,
		club_Palette,
		club_CellChrData,
		club_CellAtbData,
		NULL
};

//非常駐データ（ダンジョン２）	//2001/10/15 by nakahiro
static const MapCharData ice_char_data =
{
		MAP_CGX_COMPRESS,
		MAP_PLTT_NORMALSUB,
		ice_sch_LZ,
		ice_Palette,
		ice_CellChrData,
		ice_CellAtbData,
		NULL
};

//非常駐データ（ダンジョン３）	//2001/10/24 by nakahiro
static const MapCharData limcave_char_data =
{
		MAP_CGX_COMPRESS,
		MAP_PLTT_NORMALSUB,
		limcave_sch_LZ,
		limcave_Palette,
		limcave_CellChrData,
		limcave_CellAtbData,
		NULL
};

//非常駐データ（海洋博物館）	//2001/10/25 by nakahiro
static const MapCharData museum_char_data =
{
		MAP_CGX_COMPRESS,
		MAP_PLTT_NORMALSUB,
		museum_sch_LZ,
		museum_Palette,
		museum_CellChrData,
		museum_CellAtbData,
		NULL
};

//非常駐データ（交換部屋）	//2001/10/26 by nakahiro
static const MapCharData trade_char_data =
{
		MAP_CGX_NORMAL,
		MAP_PLTT_NORMALSUB,
		trade_Character,
//		trade_sch_LZ,
		trade_Palette,
		trade_CellChrData,
		trade_CellAtbData,
		NULL
};

//非常駐データ（海の家）	//2001/10/26 by nakahiro
static const MapCharData uminoie_char_data =
{
		MAP_CGX_COMPRESS,
		MAP_PLTT_NORMALSUB,
		uminoie_sch_LZ,
		uminoie_Palette,
		uminoie_CellChrData,
		uminoie_CellAtbData,
		NULL
};

//非常駐データ（花屋）	//2001/10/26 by nakahiro
static const MapCharData flwsp_char_data =
{
		MAP_CGX_COMPRESS,
		MAP_PLTT_NORMALSUB,
		flwsp_sch_LZ,
		flwsp_Palette,
		flwsp_CellChrData,
		flwsp_CellAtbData,
		NULL
};

//非常駐データ（育て屋）	//2001/10/26 by nakahiro
static const MapCharData sodateya_char_data =
{
		MAP_CGX_COMPRESS,
		MAP_PLTT_NORMALSUB,
		sodateya_sch_LZ,
		sodateya_Palette,
		sodateya_CellChrData,
		sodateya_CellAtbData,
		NULL
};

//非常駐データ（船内）	//2001/10/29 by nakahiro
static const MapCharData shipyard_char_data =
{
		MAP_CGX_COMPRESS,
		MAP_PLTT_NORMALSUB,
		shipyard_sch_LZ,
		shipyard_Palette,
		shipyard_CellChrData,
		shipyard_CellAtbData,
		NULL
};

//非常駐データ（自転車屋）	//2001/10/31 by nakahiro
static const MapCharData jiten_char_data =
{
		MAP_CGX_COMPRESS,
		MAP_PLTT_NORMALSUB,
		jiten_sch_LZ,
		jiten_Palette,
		jiten_CellChrData,
		jiten_CellAtbData,
		BgAnimeInitJiten,
};

//非常駐データ（洞窟）	//2001/12/17 by nakahiro
static const MapCharData moscave_char_data =
{
		MAP_CGX_COMPRESS,
		MAP_PLTT_NORMALSUB,
		moscave_sch_LZ,
		moscave_Palette,
		moscave_CellChrData,
		moscave_CellAtbData,
		NULL
};

//非常駐データ（秘密基地・石）	//2001/12/21 by nakahiro
static const MapCharData h_ishi_char_data =
{
		MAP_CGX_NORMAL,
		MAP_PLTT_NORMALSUB,
		h_ishi_Character,
		h_ishi_Palette,
		himits_CellChrData,
		himits_CellAtbData,
		NULL
};

//非常駐データ（秘密基地・木）	//2001/12/21 by nakahiro
static const MapCharData h_kinoue_char_data =
{
		MAP_CGX_NORMAL,
		MAP_PLTT_NORMALSUB,
		h_kinoue_Character,
		h_kinoue_Palette,
		himits_CellChrData,
		himits_CellAtbData,
		NULL
};

//非常駐データ（秘密基地・草）	//2001/12/21 by nakahiro
static const MapCharData h_kusa_char_data =
{
		MAP_CGX_NORMAL,
		MAP_PLTT_NORMALSUB,
		h_kusa_Character,
		h_kusa_Palette,
		himits_CellChrData,
		himits_CellAtbData,
		NULL
};

//非常駐データ（秘密基地・湿）	//2001/12/21 by nakahiro
static const MapCharData h_sime_char_data =
{
		MAP_CGX_NORMAL,
		MAP_PLTT_NORMALSUB,
		h_sime_Character,
		h_sime_Palette,
		himits_CellChrData,
		himits_CellAtbData,
		NULL
};

//非常駐データ（秘密基地・砂）	//2001/12/21 by nakahiro
static const MapCharData h_suna_char_data =
{
		MAP_CGX_NORMAL,
		MAP_PLTT_NORMALSUB,
		h_suna_Character,
		h_suna_Palette,
		himits_CellChrData,
		himits_CellAtbData,
		NULL
};

//非常駐データ（秘密基地・土）	//2001/12/21 by nakahiro
static const MapCharData h_tsuchi_char_data =
{
		MAP_CGX_NORMAL,
		MAP_PLTT_NORMALSUB,
		h_tsuchi_Character,
		h_tsuchi_Palette,
		himits_CellChrData,
		himits_CellAtbData,
		NULL
};

//非常駐データ（トラック・荷台）	//2002/02/06 by nakahiro
static const MapCharData nidai_char_data =
{
		MAP_CGX_COMPRESS,
		MAP_PLTT_NORMALSUB,
		nidai_sch_LZ,
		nidai_Palette,
		nidai_CellChrData,
		nidai_CellAtbData,
		NULL
};

//非常駐データ（トラック・荷台）	//2002/02/06 by nakahiro
static const MapCharData gym_char_data =
{
		MAP_CGX_COMPRESS,
		MAP_PLTT_NORMALSUB,
		gym_sch_LZ,
		gym_Palette,
		gym_CellChrData,
		gym_CellAtbData,
		NULL
};

//非常駐データ（コンテスト）	//2002/02/27 by nakahiro
static const MapCharData hall_char_data =
{
		MAP_CGX_COMPRESS,
		MAP_PLTT_NORMALSUB,
		hall_sch_LZ,
		hall_Palette,
		hall_CellChrData,
		hall_CellAtbData,
		NULL
};

//非常駐データ（美術館）	//2002/02/28 by nakahiro
static const MapCharData art_char_data =
{
		MAP_CGX_COMPRESS,
		MAP_PLTT_NORMALSUB,
		art_sch_LZ,
		art_Palette,
		art_CellChrData,
		art_CellAtbData,
		NULL
};

//非常駐データ（主人公の家）	//2002/02/28 by nakahiro
static const MapCharData s_home_char_data =
{
		MAP_CGX_COMPRESS,
		MAP_PLTT_NORMALSUB,
		s_home_sch_LZ,
		s_home_Palette,
		s_home_CellChrData,
		s_home_CellAtbData,
		NULL
};

//非常駐データ（オダマキ研究所）	//2002/03/22 by nakahiro
static const MapCharData o_ken_char_data =
{
		MAP_CGX_COMPRESS,
		MAP_PLTT_NORMALSUB,
		o_ken_sch_LZ,
		o_ken_Palette,
		o_ken_CellChrData,
		o_ken_CellAtbData,
		NULL
};

//非常駐データ（????）	//2002/04/08 by nakahiro
static const MapCharData field_sea_char_data =
{
		MAP_CGX_COMPRESS,
		MAP_PLTT_NORMALSUB,
		field_sea_sch_LZ,
		field_sea_Palette,
		field_sea_CellChrData,
		field_sea_CellAtbData,
		BgAnimeInitFieldSea
};

//非常駐データ（ジム）	//2002/04/12 by nakahiro
static const MapCharData gym_05_char_data =
{
		MAP_CGX_COMPRESS,
		MAP_PLTT_NORMALSUB,
		gym_05_sch_LZ,
		gym_05_Palette,
		gym_05_CellChrData,
		gym_05_CellAtbData,
		NULL
};

//非常駐データ（ジム）	//2002/04/12 by nakahiro
static const MapCharData gym_08_char_data =
{
		MAP_CGX_COMPRESS,
		MAP_PLTT_NORMALSUB,
		gym_08_sch_LZ,
		gym_08_Palette,
		gym_08_CellChrData,
		gym_08_CellAtbData,
		BgAnimeInitGym08
};

//非常駐データ（民家）	//2002/04/19 by nakahiro
static const MapCharData minka_char_data =
{
		MAP_CGX_COMPRESS,
		MAP_PLTT_NORMALSUB,
		minka_sch_LZ,
		minka_Palette,
		minka_CellChrData,
		minka_CellAtbData,
		NULL
};

//非常駐データ（カジノ）	//2002/04/19 by nakahiro
static const MapCharData game_char_data =
{
		MAP_CGX_COMPRESS,
		MAP_PLTT_NORMALSUB,
		game_sch_LZ,
		game_Palette,
		game_CellChrData,
		game_CellAtbData,
		NULL
};

//非常駐データ（ジム）	//2002/04/22 by nakahiro
static const MapCharData gym_01_char_data =
{
		MAP_CGX_COMPRESS,
		MAP_PLTT_NORMALSUB,
		gym_01_sch_LZ,
		gym_01_Palette,
		gym_01_CellChrData,
		gym_01_CellAtbData,
		NULL
};

//非常駐データ（ジム）	//2002/04/22 by nakahiro
static const MapCharData gym_02_char_data =
{
		MAP_CGX_COMPRESS,
		MAP_PLTT_NORMALSUB,
		gym_02_sch_LZ,
		gym_02_Palette,
		gym_02_CellChrData,
		gym_02_CellAtbData,
		NULL
};

//非常駐データ（ジム）	//2002/04/23 by nakahiro
static const MapCharData gym_03_char_data =
{
		MAP_CGX_COMPRESS,
		MAP_PLTT_NORMALSUB,
		gym_03_sch_LZ,
		gym_03_Palette,
		gym_03_CellChrData,
		gym_03_CellAtbData,
		BgAnimeInitGym03,
};

//非常駐データ（ジム）	//2002/04/24 by nakahiro
static const MapCharData gym_04_char_data =
{
		MAP_CGX_COMPRESS,
		MAP_PLTT_NORMALSUB,
		gym_04_sch_LZ,
		gym_04_Palette,
		gym_04_CellChrData,
		gym_04_CellAtbData,
		NULL
};

//非常駐データ（カラクリ）	//2002/06/13 by nakahiro
static const MapCharData karakuri_char_data =
{
		MAP_CGX_COMPRESS,
		MAP_PLTT_NORMALSUB,
		karakuri_sch_LZ,
		karakuri_Palette,
		karakuri_CellChrData,
		karakuri_CellAtbData,
		NULL
};

//非常駐データ（ジム）	//2002/06/24 by nakahiro
static const MapCharData gym_06_char_data =
{
		MAP_CGX_COMPRESS,
		MAP_PLTT_NORMALSUB,
		gym_06_sch_LZ,
		gym_06_Palette,
		gym_06_CellChrData,
		gym_06_CellAtbData,
		NULL
};

//非常駐データ（ジム）	//2002/06/24 by nakahiro
static const MapCharData gym_07_char_data =
{
		MAP_CGX_COMPRESS,
		MAP_PLTT_NORMALSUB,
		gym_07_sch_LZ,
		gym_07_Palette,
		gym_07_CellChrData,
		gym_07_CellAtbData,
		NULL
};

//非常駐データ（船）	//2002/06/26 by nakahiro
static const MapCharData ship_char_data =
{
		MAP_CGX_COMPRESS,
		MAP_PLTT_NORMALSUB,
		ship_sch_LZ,
		ship_Palette,
		ship_CellChrData,
		ship_CellAtbData,
		NULL
};

//常駐データ（秘密基地）	//2002/07/17 by nakahiro
static const MapCharData base_char_data =
{
		MAP_CGX_NORMAL,
		MAP_PLTT_NORMAL,
		base_Character,
		base_Palette,
		base_CellChrData,
		base_CellAtbData,
		NULL
};

//非常駐データ（????）	//2002/07/29 by nakahiro
static const MapCharData champ_char_data =
{
		MAP_CGX_COMPRESS,
		MAP_PLTT_NORMALSUB,
		champ_sch_LZ,
		champ_Palette,
		champ_CellChrData,
		champ_CellAtbData,
		BgAnimeInitChamp,
};

//非常駐データ（バトルタワー）	//2002/08/16 by nakahiro
static const MapCharData b_tower_char_data =
{
		MAP_CGX_COMPRESS,
		MAP_PLTT_NORMALSUB,
		b_tower_sch_LZ,
		b_tower_Palette,
		b_tower_CellChrData,
		b_tower_CellAtbData,
		NULL,
};


//=========================================================================
//
//	マップスクリーンデータ
//
//=========================================================================

/* 下記ファイルはコンバータにより自動生成 */

//#include "../evdata/scrndata.c"

#include "../mapdata/scrndata.c"




