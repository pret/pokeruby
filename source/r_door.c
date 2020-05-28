//=========================================================================
//
//
//
//		回転ドアシステム（ヒワマキジム用）
//
//
//				2002.05.30	by tama
//
//=========================================================================

#include "common.h"
#include "actor.h"
#include "madefine.h"
#include "evobj.h"

#include "map.h"
#include "fieldmap.h"
#include "ev_flag.h"
#include "syswork.h"
#include "mus_tool.h"
#include "cycle.h"

#include "../evdata/maparray.h"

#define __R_DOOR_H_GLOBAL_
#include "r_door.h"



//------------------------------------------
//------------------------------------------
//回転方向の定義
enum{
	ROTATE_NOT = 0,
	ROTATE_LEFT,
	ROTATE_RIGHT,
};

//ドアの向きの定義
enum{
	DOOR_SITE_UP = 0,
	DOOR_SITE_RIGHT = 1,
	DOOR_SITE_DOWN = 2,
	DOOR_SITE_LEFT = 3,

	DOOR_SITE_MAX = 4,
};

//ドアの長さ
enum{
	WING_SIZE_MAX = 2,
	DOOR_DIAMETER = WING_SIZE_MAX * 2,
};

// 回転ドアの種類
enum{
	DOOR_L1_TYPE = 0,
	DOOR_L2_TYPE,
	DOOR_L3_TYPE,
	DOOR_L4_TYPE,

	DOOR_T1_TYPE,
	DOOR_T2_TYPE,
	DOOR_T3_TYPE,
	DOOR_T4_TYPE,
	DOOR_T5_TYPE,
	DOOR_T6_TYPE,
	DOOR_T7_TYPE,
	DOOR_T8_TYPE,
};

enum{
	IS_NOT_DOOR_MAP = 0,
	IS_GYM_DOOR_MAP = 1,
	IS_KARAKURI_DOOR_MAP = 2,
};

enum{
	DOOR_NOT_EXIST = ACT_MAX,
};

//=========================================================================
//
//	ドアの配置データ
//
//=========================================================================

typedef struct {
	s16 x;			//　Ｘ位置
	s16 y;			//	Ｙ位置
	u8 type;		//	回転ドアの種類
	u8 site;		//	最初の向き
}ROTATE_DOOR_DATA;

static const ROTATE_DOOR_DATA gym_door_data[] =
{
	{12,5,	DOOR_L4_TYPE, DOOR_SITE_UP },
	{14,7,	DOOR_L4_TYPE, DOOR_SITE_LEFT },
	{16,4,	DOOR_T2_TYPE, DOOR_SITE_RIGHT },
	{15,14,	DOOR_L2_TYPE, DOOR_SITE_UP },
	{18,13, DOOR_T1_TYPE, DOOR_SITE_DOWN },
	{ 8,20, DOOR_T1_TYPE, DOOR_SITE_DOWN },
	{16,20,	DOOR_T4_TYPE, DOOR_SITE_RIGHT },
};

static const ROTATE_DOOR_DATA karakuri_door_data[] = {
	{13,3,	DOOR_T1_TYPE, DOOR_SITE_LEFT },
	{12,6,	DOOR_T1_TYPE, DOOR_SITE_DOWN },
	{ 3,6,	DOOR_T1_TYPE, DOOR_SITE_DOWN },
	{ 3,9,	DOOR_T2_TYPE, DOOR_SITE_LEFT },
//	{ 7,9,	DOOR_L1_TYPE, DOOR_SITE_LEFT },
	{ 8,8,	DOOR_L1_TYPE, DOOR_SITE_RIGHT },
	{ 2,12, DOOR_T3_TYPE, DOOR_SITE_DOWN },
	{ 9,13, DOOR_L2_TYPE, DOOR_SITE_UP },
	{ 3,14, DOOR_L3_TYPE, DOOR_SITE_RIGHT },
	{ 9,15, DOOR_L4_TYPE, DOOR_SITE_DOWN },
	{ 3,18, DOOR_T2_TYPE, DOOR_SITE_DOWN },
	{ 2,19, DOOR_T1_TYPE, DOOR_SITE_UP },
	{ 5,21, DOOR_L1_TYPE, DOOR_SITE_UP },
	{ 9,19, DOOR_L4_TYPE, DOOR_SITE_LEFT },
	{12,20, DOOR_T1_TYPE, DOOR_SITE_RIGHT },
};

#define	DOOR_DATA_MAX	NELEMS(karakuri_door_data)		//回転ドアの数

//=========================================================================
//
//	ローカル変数
//
//=========================================================================

//	回転ドアの登録用ワーク
static u8 door_control[DOOR_DATA_MAX] = {};

static const ROTATE_DOOR_DATA * door_data = NULL;
static u8 door_max = 0;

//=========================================================================
//
//	ローカル関数
//
//=========================================================================
static int is_enable_rotation_check( u8 door_id, int rotate_direction );

static int get_door_site( u8 door_id );
static void set_door_site( u8 door_id, u8 site );
static void change_door_site( u8 door_id, int direction );

static void rotate_act_move( actWork * act );
static void scroll_vanish( actWork *act );
static u8 AddDoorActor( u8 door_id, s16 dx, s16 dy );

static void AddDoorControl( s16 dx, s16 dy );
static void DelDoorControl( void );

static void SetDoorCell( void );


//=========================================================================
//
//	ドアアクターデータ（仮）
//
//=========================================================================

//#include "../scaddata/l1_wing.ach"
#include "../scaddata/l2_wing.ach"
#include "../scaddata/l3_wing.ach"
#include "../scaddata/l4_wing.ach"
//#include "../scaddata/t1_wing.ach"
#include "../scaddata/t2_wing.ach"
#include "../scaddata/t3_wing.ach"
#include "../scaddata/t4_wing.ach"

#include "../scaddata/l1_wing_s.ach"
#include "../scaddata/t1_wing_s.ach"

//------------------------------------------
//	64x64
//------------------------------------------
static const ActOamData Oam64x64 =
{
	0,					// u32 VPos:8
	1,					// u32 AffineMode:2
	0,					// u32 ObjMode:2
	0,					// u32 Mosaic:1
	0,					// u32 ColorMode:1
	0,					// u32 Shape:2
	0,					// u32 HPos:9
	0,					// u32 AffineParamNo:5
	3,					// u32 Size:2
	0,					// u32 CharNo:10
	BGPRI2,				// u32 Priority:2
	OTHERS_OBJ_PALNO_3,					// u32 Pltt:3
	0,					// AffineWork
};

static const ActOamData Oam32x32 =
{
	0,					// u32 VPos:8
	1,					// u32 AffineMode:2
	0,					// u32 ObjMode:2
	0,					// u32 Mosaic:1
	0,					// u32 ColorMode:1
	0,					// u32 Shape:2
	0,					// u32 HPos:9
	0,					// u32 AffineParamNo:5
	2,					// u32 Size:2
	0,					// u32 CharNo:10
	BGPRI2,				// u32 Priority:2
	OTHERS_OBJ_PALNO_3,					// u32 Pltt:3
	0,					// AffineWork
};


//------------------------------------------
//	回転ドア	キャラ
//------------------------------------------
enum{
	CELLID_WING_START	= FLD_CellID_WEATHER_END+1,
	L1_WING_CELL_ID = CELLID_WING_START,
	L2_WING_CELL_ID,
	L3_WING_CELL_ID,
	L4_WING_CELL_ID,

	T1_WING_CELL_ID,
	T2_WING_CELL_ID,
	T3_WING_CELL_ID,
	T4_WING_CELL_ID,
	T5_WING_CELL_ID,
	T6_WING_CELL_ID,
	T7_WING_CELL_ID,
	T8_WING_CELL_ID,
};

static const CellData rotate_door_cell_tbl[] = {

	{ l1_wing_s_Character,	0x20*4*4,	L1_WING_CELL_ID },
	{ l2_wing_Character,	0x20*8*8,	L2_WING_CELL_ID },
	{ l3_wing_Character,	0x20*8*8,	L3_WING_CELL_ID },
	{ l4_wing_Character,	0x20*8*8,	L4_WING_CELL_ID },

	{ t1_wing_s_Character,	0x20*4*4,	T1_WING_CELL_ID },
	{ t2_wing_Character,	0x20*8*8,	T2_WING_CELL_ID },
	{ t3_wing_Character,	0x20*8*8,	T3_WING_CELL_ID },
	{ t4_wing_Character,	0x20*8*8,	T4_WING_CELL_ID },
//	{ t5_wing_Character,	0x20*8*8,	T5_WING_CELL_ID },
//	{ t6_wing_Character,	0x20*8*8,	T6_WING_CELL_ID },
//	{ t7_wing_Character,	0x20*8*8,	T7_WING_CELL_ID },
//	{ t8_wing_Character,	0x20*8*8,	T8_WING_CELL_ID },
	{ CELL_END,0,0},
};


static const actAnm normal_rotate_door_anm[] =
{
	{OBJ16_64x64 * 0, 0, 0, 0},
	{ACT_ANMEND, 0, 0, 0},
};

static const actAnm small_rotate_door_anm[] =
{
	{OBJ16_32x32 * 0, 0, 0, 0},
	{ACT_ANMEND, 0, 0, 0},
};

static const actAnm * const normal_rotate_door_anm_tbl[] = 
{
	normal_rotate_door_anm,
};

static const actAnm * const small_rotate_door_anm_tbl[] =
{
	small_rotate_door_anm,
};

//------------------------------------------
//	回転アニメ関連
//------------------------------------------
enum{
	MOVE_SIZE = 64,
	MV_NORMAL_WAIT = 16,
	MV_FAST_WAIT = 8,
	MV_NORMAL_SPEED = MOVE_SIZE / MV_NORMAL_WAIT,
	MV_FAST_SPEED = MOVE_SIZE / MV_FAST_WAIT,

	L_MV_NORMAL_SPEED =  MV_NORMAL_SPEED,
	R_MV_NORMAL_SPEED = -MV_NORMAL_SPEED,

	L_MV_FAST_SPEED = MV_FAST_SPEED,
	R_MV_FAST_SPEED = -MV_FAST_SPEED,
};

enum{
	R_UP_VALUE = 0,
	R_RT_VALUE = 192,
	R_DW_VALUE = 128,
	R_LF_VALUE = 64,
};

/*	Ｘ	Ｙ　　回転	ウェイト	*/
static const actAffAnm rotate_u[] =
{
	{ 0x100, 0x100, R_UP_VALUE, ACT_AFSET },
	{ ACT_AFLOOP,0,0,0},
};
static const actAffAnm rotate_r[] =
{
	{ 0x100, 0x100, R_RT_VALUE, ACT_AFSET },
	{ ACT_AFLOOP,0,0,0},
};
static const actAffAnm rotate_d[] =
{
	{ 0x100, 0x100, R_DW_VALUE, ACT_AFSET },
	{ ACT_AFLOOP,0,0,0},
};
static const actAffAnm rotate_l[] =
{
	{ 0x100, 0x100, R_LF_VALUE, ACT_AFSET },
	{ ACT_AFLOOP,0,0,0},
};

static const actAffAnm rotate_u_to_r_normal[] =
{
	{ 0x100, 0x100, R_UP_VALUE, ACT_AFSET },
	{ 0, 0, R_MV_NORMAL_SPEED, MV_NORMAL_WAIT },
	{ ACT_AFEND,0,0,0},
};
static const actAffAnm rotate_r_to_d_normal[] =
{
	{ 0x100, 0x100, R_RT_VALUE, ACT_AFSET },
	{ 0, 0, R_MV_NORMAL_SPEED, MV_NORMAL_WAIT },
	{ ACT_AFEND,0,0,0},
};
static const actAffAnm rotate_d_to_l_normal[] =
{
	{ 0x100, 0x100, R_DW_VALUE, ACT_AFSET },
	{ 0, 0, R_MV_NORMAL_SPEED, MV_NORMAL_WAIT },
	{ ACT_AFEND,0,0,0},
};
static const actAffAnm rotate_l_to_u_normal[] =
{
	{ 0x100, 0x100, R_LF_VALUE, ACT_AFSET },
	{ 0, 0, R_MV_NORMAL_SPEED, MV_NORMAL_WAIT },
	{ ACT_AFEND,0,0,0},
};
static const actAffAnm rotate_u_to_l_normal[] =
{
	{ 0x100, 0x100, R_UP_VALUE, ACT_AFSET },
	{ 0, 0, L_MV_NORMAL_SPEED, MV_NORMAL_WAIT },
	{ ACT_AFEND,0,0,0},
};
static const actAffAnm rotate_l_to_d_normal[] =
{
	{ 0x100, 0x100, R_LF_VALUE, ACT_AFSET },
	{ 0, 0, L_MV_NORMAL_SPEED, MV_NORMAL_WAIT },
	{ ACT_AFEND,0,0,0},
};
static const actAffAnm rotate_d_to_r_normal[] =
{
	{ 0x100, 0x100, R_DW_VALUE, ACT_AFSET },
	{ 0, 0, L_MV_NORMAL_SPEED, MV_NORMAL_WAIT },
	{ ACT_AFEND,0,0,0},
};
static const actAffAnm rotate_r_to_u_normal[] =
{
	{ 0x100, 0x100, R_RT_VALUE, ACT_AFSET },
	{ 0, 0, L_MV_NORMAL_SPEED, MV_NORMAL_WAIT },
	{ ACT_AFEND,0,0,0},
};


static const actAffAnm rotate_u_to_r_fast[] =
{
	{ 0x100, 0x100, R_UP_VALUE, ACT_AFSET },
	{ 0, 0, R_MV_FAST_SPEED, MV_FAST_WAIT },
	{ ACT_AFEND,0,0,0},
};
static const actAffAnm rotate_r_to_d_fast[] =
{
	{ 0x100, 0x100, R_RT_VALUE, ACT_AFSET },
	{ 0, 0, R_MV_FAST_SPEED, MV_FAST_WAIT },
	{ ACT_AFEND,0,0,0},
};
static const actAffAnm rotate_d_to_l_fast[] =
{
	{ 0x100, 0x100, R_DW_VALUE, ACT_AFSET },
	{ 0, 0, R_MV_FAST_SPEED, MV_FAST_WAIT },
	{ ACT_AFEND,0,0,0},
};
static const actAffAnm rotate_l_to_u_fast[] =
{
	{ 0x100, 0x100, R_LF_VALUE, ACT_AFSET },
	{ 0, 0, R_MV_FAST_SPEED, MV_FAST_WAIT },
	{ ACT_AFEND,0,0,0},
};
static const actAffAnm rotate_u_to_l_fast[] =
{
	{ 0x100, 0x100, R_UP_VALUE, ACT_AFSET },
	{ 0, 0, L_MV_FAST_SPEED, MV_FAST_WAIT },
	{ ACT_AFEND,0,0,0},
};
static const actAffAnm rotate_l_to_d_fast[] =
{
	{ 0x100, 0x100, R_LF_VALUE, ACT_AFSET },
	{ 0, 0, L_MV_FAST_SPEED, MV_FAST_WAIT },
	{ ACT_AFEND,0,0,0},
};
static const actAffAnm rotate_d_to_r_fast[] =
{
	{ 0x100, 0x100, R_DW_VALUE, ACT_AFSET },
	{ 0, 0, L_MV_FAST_SPEED, MV_FAST_WAIT },
	{ ACT_AFEND,0,0,0},
};
static const actAffAnm rotate_r_to_u_fast[] =
{
	{ 0x100, 0x100, R_RT_VALUE, ACT_AFSET },
	{ 0, 0, L_MV_FAST_SPEED, MV_FAST_WAIT },
	{ ACT_AFEND,0,0,0},
};

static const actAffAnm * const rotate_aff_anm_tbl[] =
{
	rotate_u,
	rotate_r,
	rotate_d,
	rotate_l,

	/* 左回転、通常速度 */
	rotate_u_to_l_normal,
	rotate_r_to_u_normal,
	rotate_d_to_r_normal,
	rotate_l_to_d_normal,

	/* 右回転、通常速度 */
	rotate_u_to_r_normal,
	rotate_r_to_d_normal,
	rotate_d_to_l_normal,
	rotate_l_to_u_normal,

	/* 左回転、倍速 */
	rotate_u_to_l_fast,
	rotate_r_to_u_fast,
	rotate_d_to_r_fast,
	rotate_l_to_d_fast,

	/* 右回転、倍速 */
	rotate_u_to_r_fast,
	rotate_r_to_d_fast,
	rotate_d_to_l_fast,
	rotate_l_to_u_fast,
};

//------------------------------------------
//	回転ドア	アクターヘッダー
//------------------------------------------
static const actHeader normal_rotate_door_header =
{
	CELLID_WING_START,
	ACT_OAMPAL,
	&Oam64x64,
	normal_rotate_door_anm_tbl,
	ACT_NTRANS,
	rotate_aff_anm_tbl,
	rotate_act_move,
};

static const actHeader small_rotate_door_header =
{
	CELLID_WING_START,
	ACT_OAMPAL,
	&Oam32x32,
	small_rotate_door_anm_tbl,
	ACT_NTRANS,
	rotate_aff_anm_tbl,
	rotate_act_move,
};


//=========================================================================
//
//=========================================================================

//-------------------------------------------------------------------------
//	扉に対するヒットチェック用データ
//-------------------------------------------------------------------------
enum{
	HIT_POS_MASK		= 0x0f,
	HIT_ROTATION_MASK	= 0xf0,
	HIT_ROTATION_SHIFT	= 4,

	HIT_SITE_NOT = 0xff,

	HIT_U1 =	0,
	HIT_U2,
	HIT_R1,
	HIT_R2,
	HIT_D1,
	HIT_D2,
	HIT_L1,
	HIT_L2,

	TURNL =		ROTATE_LEFT << HIT_ROTATION_SHIFT,
	TURNR =		ROTATE_RIGHT << HIT_ROTATION_SHIFT,
};

static const u8 hit_pos_table[4][DOOR_DIAMETER*DOOR_DIAMETER] =
{
	/* Move up */
	{
	HIT_SITE_NOT, HIT_SITE_NOT,	HIT_SITE_NOT, HIT_SITE_NOT,

	HIT_L2+TURNR, HIT_L1+TURNR,	HIT_R1+TURNL, HIT_R2+TURNL,

	HIT_SITE_NOT, HIT_SITE_NOT,	HIT_SITE_NOT, HIT_SITE_NOT,

	HIT_SITE_NOT, HIT_SITE_NOT,	HIT_SITE_NOT, HIT_SITE_NOT,
	},

	/* Move down */
	{
	HIT_SITE_NOT, HIT_SITE_NOT,	HIT_SITE_NOT, HIT_SITE_NOT,

	HIT_SITE_NOT, HIT_SITE_NOT,	HIT_SITE_NOT, HIT_SITE_NOT,

	HIT_L2+TURNL, HIT_L1+TURNL,	HIT_R1+TURNR, HIT_R2+TURNR,

	HIT_SITE_NOT, HIT_SITE_NOT,	HIT_SITE_NOT, HIT_SITE_NOT,
	},

	/* Move Left */
	{
	HIT_SITE_NOT, HIT_U2+TURNL,	HIT_SITE_NOT, HIT_SITE_NOT,

	HIT_SITE_NOT, HIT_U1+TURNL,	HIT_SITE_NOT, HIT_SITE_NOT,


	HIT_SITE_NOT, HIT_D1+TURNR,	HIT_SITE_NOT, HIT_SITE_NOT,

	HIT_SITE_NOT, HIT_D2+TURNR,	HIT_SITE_NOT, HIT_SITE_NOT,
	},

	/* Move Right */
	{
	HIT_SITE_NOT, HIT_SITE_NOT,	HIT_U2+TURNR, HIT_SITE_NOT,

	HIT_SITE_NOT, HIT_SITE_NOT,	HIT_U1+TURNR, HIT_SITE_NOT,

	HIT_SITE_NOT, HIT_SITE_NOT,	HIT_D1+TURNL, HIT_SITE_NOT,

	HIT_SITE_NOT, HIT_SITE_NOT,	HIT_D2+TURNL, HIT_SITE_NOT,
	},
};



//-------------------------------------------------------------------------
//	ドアが回転するときのチェック座標
//-------------------------------------------------------------------------

typedef struct{
	s8 dx;
	s8 dy;
}CHK_POS;

enum{
	CHECK_RANGE_LEFT = 2,
	CHECK_RANGE_RIGHT = 1,
	CHECK_RANGE_UP = 2,
	CHECK_RANGE_DOWN = 1,
};

#define	POS_U2L2	{ -2,-2 }
#define POS_U2L1	{ -1,-2 }
#define	POS_U2R1	{  0,-2 }
#define	POS_U2R2	{ +1,-2 }

#define POS_U1L2	{ -2,-1 }
#define POS_U1L1	{ -1,-1 }
#define	POS_U1R1	{  0,-1 }
#define	POS_U1R2	{ +1,-1 }

#define POS_D1L2	{ -2, 0 }
#define POS_D1L1	{ -1, 0 }
#define	POS_D1R1	{  0, 0 }
#define	POS_D1R2	{ +1, 0 }

#define POS_D2L2	{ -2,+1 }
#define POS_D2L1	{ -1,+1 }
#define	POS_D2R1	{  0,+1 }
#define	POS_D2R2	{ +1,+1 }

//右回りの場合のチェック位置
static const CHK_POS right_rotate_check_table[DOOR_SITE_MAX*WING_SIZE_MAX] =
{
/* UP 1 */	POS_U1R1,
/* UP 2 */	POS_U2R2,
/* RT 1 */	POS_D1R1,
/* RT 2 */	POS_D1R2,
/* DW 1 */	POS_D1L1,
/* DW 2 */	POS_D2L1,
/* LF 1 */	POS_U1L1,
/* LF 2 */	POS_U1L2,
};

//左回りのときのチェック位置
static const CHK_POS left_rotate_check_table[DOOR_SITE_MAX*WING_SIZE_MAX] =
{
/* UP 1 */	POS_U1L1,
/* UP 2 */	POS_U2L1,
/* RT 1 */	POS_U1R1,
/* RT 2 */	POS_U1R2,
/* DW 1 */	POS_D1R1,
/* DW 2 */	POS_D2R1,
/* LF 1 */	POS_D1L1,
/* LF 2 */	POS_D1L2,
};

//-------------------------------------------------------------------------
//	扉の存在定義用配列
//-------------------------------------------------------------------------
static const u8 hit_door_wing_table[][DOOR_SITE_MAX*WING_SIZE_MAX] =
{
	/* L1_Wing	*/
	//
	//
	//		|
	//		+--
	//		
	//
	// U1 U2 R1 R2 D1 D2 L1 L2
	{  1, 0, 1, 0, 0, 0, 0, 0, } ,

	/* L2_Wing	*/
	//
	//		|
	//		|
	//		+ --
	//		
	//
	// U1 U2 R1 R2 D1 D2 L1 L2
	{  1, 1, 1, 0, 0, 0, 0, 0, } ,
	
	/* L3_Wing	*/
	//
	//
	//		|
	//		+ -- --
	//		
	//
	// U1 U2 R1 R2 D1 D2 L1 L2
	{  1, 0, 1, 1, 0, 0, 0, 0, } ,

	/* L4_Wing	*/
	//
	//		|
	//		|
	//		+ -- --
	//		
	//
	// U1 U2 R1 R2 D1 D2 L1 L2
	{  1, 1, 1, 1, 0, 0, 0, 0, } ,

	/* T1_Wing	*/
	//
	//		
	//		|
	//		+ --
	//		|
	//
	// U1 U2 R1 R2 D1 D2 L1 L2
	{  1, 0, 1, 0, 1, 0, 0, 0, } ,

	/* T2_Wing	*/
	// 
	//		|
	//		|
	//		+ --
	//		|
	//
	// U1 U2 R1 R2 D1 D2 L1 L2
	{  1, 1, 1, 0, 1, 0, 0, 0, } ,

	/* T3_Wing	*/
	//
	//		
	//		|
	//		+ -- --
	//		|
	//
	// U1 U2 R1 R2 D1 D2 L1 L2
	{  1, 0, 1, 1, 1, 0, 0, 0, } ,

	/* T4_Wing	*/
	//
	//		
	//		|
	//		+ --
	//		|
	//		|
	// U1 U2 R1 R2 D1 D2 L1 L2
	{  1, 0, 1, 0, 1, 1, 0, 0, } ,

	/* T5_Wing	*/
	//
	//		|
	//		|
	//		+ -- --
	//		|
	//
	// U1 U2 R1 R2 D1 D2 L1 L2
	{  1, 1, 1, 1, 1, 0, 0, 0, } ,

	/* T6_Wing	*/
	//
	//		|
	//		|
	//		+ --
	//		|
	//		|
	// U1 U2 R1 R2 D1 D2 L1 L2
	{  1, 1, 1, 0, 1, 1, 0, 0, } ,

	/* T7_Wing	*/
	//
	//
	//		|
	//		+ -- --
	//		|
	//		|
	// U1 U2 R1 R2 D1 D2 L1 L2
	{  1, 0, 1, 1, 1, 1, 0, 0, } ,

	/* T8_Wing	*/
	//
	//		|
	//		|
	//		+ -- --
	//		|
	//		|
	// U1 U2 R1 R2 D1 D2 L1 L2
	{  1, 1, 1, 1, 1, 1, 0, 0, } ,
};



//=========================================================================
//
//
//=========================================================================

//-------------------------------------------------------------------------
//	回転ドアシステムを有効にするかどうかのチェック
//-------------------------------------------------------------------------
static int is_enable_rotation_door( void )
{
	if ( Fld.MapID.div_id == C105
			&& Fld.MapID.map_id == C105_R0201 ) return IS_GYM_DOOR_MAP;
	if ( Fld.MapID.div_id == R110
			&& Fld.MapID.map_id == R110_R0109 ) return IS_KARAKURI_DOOR_MAP;

	return IS_NOT_DOOR_MAP;
}

//-------------------------------------------------------------------------
//	方向用ワーク関連
//-------------------------------------------------------------------------

//	全回転ドアの方向を初期化
static void door_site_init( void )
{
	int i;
	u8 * site_work = (u8 *)( GetEventWorkAdrs( LOCALWORK0 ) );
	for ( i=0; i<door_max; i++ ) {
		site_work[i] = door_data[i].site;
	}
}

//	ドアの方向を取得
static int get_door_site( u8 door_id )
{
	u8 * site_work = (u8 *)( GetEventWorkAdrs( LOCALWORK0 ) );
	return site_work[door_id];
}

//	ドアの方向をセット
static void set_door_site( u8 door_id, u8 site )
{
	u8 * site_work = (u8 *)(GetEventWorkAdrs( LOCALWORK0 ) );
	site_work[door_id] = site;
}

//	ドアの方向を変更
static void change_door_site( u8 door_id, int direction )
{
	u8 site;

	site = get_door_site( door_id );
	if ( direction == ROTATE_LEFT ) {
		if ( site > 0 ) {
			site --;
		} else {
			site = DOOR_SITE_MAX - 1;
		}
	} else {
		site ++;
		site %= DOOR_SITE_MAX;
	}
	set_door_site( door_id, site );
}



//-------------------------------------------------------------------------
//	回転ドア登録初期化
//-------------------------------------------------------------------------
static void door_control_init( void )
{
	int i;

	switch ( is_enable_rotation_door() ) {

	case IS_GYM_DOOR_MAP:
		door_data = gym_door_data;
		door_max = NELEMS(gym_door_data);
		break;

	case IS_KARAKURI_DOOR_MAP:
		door_data = karakuri_door_data;
		door_max = NELEMS(karakuri_door_data);
		break;

	case IS_NOT_DOOR_MAP:
	default:
		return;
	}

	for ( i=0; i<DOOR_DATA_MAX; i++ ) {
		door_control[i] = DOOR_NOT_EXIST;
	}
}

//=========================================================================
//
//	回転ドアＯＢＪの表示登録
//
//=========================================================================

void AddDoorControl( s16 dx, s16 dy )
{
	u8	i;
	s16 mx0,mx1,my0,my1;
	s16	px,py;

	mx0 = Fld.MapXpos - MAP_OUT_MARGIN;
	mx1 = Fld.MapXpos + SCR_CELL_X + MAP_OUT_MARGIN;
	my0 = Fld.MapYpos - MAP_OUT_MARGIN;	
	my1 = Fld.MapYpos + SCR_CELL_Y + MAP_OUT_MARGIN;

	for( i = 0; i < door_max; i++ )
	{
		px = door_data[i].x + MAP_LEFT_MARGIN;					// 表示設定座標
		py = door_data[i].y + MAP_UP_MARGIN;

		if( my0 <= py && my1 >= py
				&& mx0 <= px && mx1 >= px && door_control[i] == DOOR_NOT_EXIST )
		{
			door_control[i] = AddDoorActor( i, dx, dy );
		}
	}
}


//-------------------------------------------------------------------------
//	ドアアクターのセット
//-------------------------------------------------------------------------
u8 AddDoorActor( u8 door_id, s16 dx, s16 dy )
{
	u8 actno;
	actWork * act;
	s16 x,y;
	const ROTATE_DOOR_DATA * door;
	actHeader head;

	door = &door_data[door_id];

	if ( door->type == DOOR_L1_TYPE || door->type == DOOR_T1_TYPE ) {
		head = small_rotate_door_header;
	} else {
		head = normal_rotate_door_header;
	}
	head.cellNo = CELLID_WING_START + door->type;
	actno = AddActor( &head, 0, 0, EVOBJ_LOW_ACTPRI0 );
	if( actno == ACT_MAX ) {
		return DOOR_NOT_EXIST;
	}

	x = door->x + MAP_LEFT_MARGIN;
	y = door->y + MAP_UP_MARGIN;

	act = &ActWork[actno];
	act->work[0] = door_id;
	act->scr = 1;

	MapCellSizePos( x + dx, y + dy, &act->x, &act->y );
//	act->cx = -(64 >> 1);
//	act->cy = -(64 >> 1);
	scroll_vanish(act);

	
	ActAffAnmChg( act, get_door_site(door_id) );
	return actno;
}


//-------------------------------------------------------------------------
//	ドアアクター用動作関数
//-------------------------------------------------------------------------
static void rotate_act_move( actWork * act )
{
	u8 aff,site,req;
	req = act->work[1];
	site = act->work[2];

	scroll_vanish(act);

	if ( req == ROTATE_LEFT ) {
		aff = ROTATE_LEFT*DOOR_SITE_MAX + site;
		if ( GetHeroMoveSpeed() != HERO_MOVE_SPEED_1 ) {
			aff += DOOR_SITE_MAX * 2;
		}
		SePlay( SE_HI_TURUN );
		ActAffAnmChg( act, aff );
	}
	else if (req == ROTATE_RIGHT ) {
		aff = ROTATE_RIGHT*DOOR_SITE_MAX + site;
		if ( GetHeroMoveSpeed() != HERO_MOVE_SPEED_1 ) {
			aff += DOOR_SITE_MAX * 2;
		}
		SePlay( SE_HI_TURUN );
		ActAffAnmChg( act, aff );
	}
	act->work[1] = 0;
}


//-------------------------------------------------------------------------
//	ドアアクターの表示ＯＮ／ＯＦＦ制御
//-------------------------------------------------------------------------
static void scroll_vanish( actWork *act )
{
	s16	x0,y0,x1,y1;

	act->banish = 0;

	x0 = act->x + act->dx + act->cx + ActOX;
	y0 = act->y + act->dy + act->cy + ActOY;
	
	x1 = (s16)((u16)x0 + 64 );
	y1 = (s16)((u16)y0 + 64 );
	
	if( x0 >= 256 || x1 < -16 )
	{
		act->banish = 1;
	}

	if( y0 >= 176 || y1 < -16 )
	{
		act->banish = 1;
	}
}


//-------------------------------------------------------------------------
//-------------------------------------------------------------------------
static void SetDoorCell( void )
{
	CellSets( rotate_door_cell_tbl );
}

//=========================================================================
//
//	回転ドアＯＢＪの表示削除
//
//=========================================================================
void DelDoorControl( void )
{
	int i;
	s16 x,y;
	s16 mx0,mx1,my0,my1;
	actWork *act;

	mx0 = Fld.MapXpos - MAP_OUT_MARGIN;
	mx1 = Fld.MapXpos + SCR_CELL_X + MAP_OUT_MARGIN;
	my0 = Fld.MapYpos - MAP_OUT_MARGIN;
	my1 = Fld.MapYpos + SCR_CELL_Y + MAP_OUT_MARGIN;

	for ( i=0; i< door_max; i++ ) {

		x = door_data[i].x + MAP_LEFT_MARGIN;
		y = door_data[i].y + MAP_UP_MARGIN;
		if ( door_control[i] == DOOR_NOT_EXIST ) continue;
		if ( x < mx0 || x > mx1 || y < my0 || y > my1 ) {
			act = &ActWork[ door_control[i] ];
			AffineDelActor(act);
			DelActor(act);
			door_control[i] = DOOR_NOT_EXIST;
		}
	}
}


//-------------------------------------------------------------------------
//
//	ドアが回転できるかどうかのチェック
//
//	<引数>
//	door_id				回転ドアのナンバー
//	rotate_direction	回転方向
//
//	<戻り値>
//	TRUE				回転できる
//	FALSE				回転できない
//-------------------------------------------------------------------------
static int is_enable_rotation_check( u8 door_id, int rotate_direction )
{
	int i,j;
	u8 type,now_site;
	u8 site;
	s16 x,y;
	const CHK_POS * tbl;

	if ( rotate_direction == ROTATE_LEFT ) {
		tbl = left_rotate_check_table;
	}
	else if ( rotate_direction == ROTATE_RIGHT ) {
		tbl = right_rotate_check_table;
	}
	else {
		return FALSE;
	}


	now_site = get_door_site(door_id);
	type = door_data[door_id].type;
	x = door_data[door_id].x + MAP_LEFT_MARGIN;
	y = door_data[door_id].y + MAP_UP_MARGIN;

	for ( i=0; i<DOOR_SITE_MAX; i++ ) {
		for ( j=0; j<WING_SIZE_MAX; j++ ) {

			site = ( ( now_site + i ) % DOOR_SITE_MAX ) * WING_SIZE_MAX + j;
			if ( hit_door_wing_table[type][WING_SIZE_MAX*i+j] == 0 ) continue;
			if ( GetCellHitCheck( x+tbl[site].dx, y+tbl[site].dy ) == 1 ) return FALSE;

		}
	}

	return TRUE;
}


//-------------------------------------------------------------------------
//	指定位置にドアがあるかどうかのチェック
//-------------------------------------------------------------------------
static int exist_wing_check( u8 door_id, u8 wing_pos )
{
	u8 type;
	s8 site;
	u8 wing_len,wing_site;

	wing_site = wing_pos / 2;
	wing_len = wing_pos % 2;
	site = ( wing_site - get_door_site(door_id) + DOOR_SITE_MAX ) % DOOR_SITE_MAX;
	type = door_data[door_id].type;

	return hit_door_wing_table[type][ site * WING_SIZE_MAX + wing_len ];
}


//-------------------------------------------------------------------------
//	ドアの回転アニメをセット
//-------------------------------------------------------------------------
static void request_rotation_anime( u8 door_id, int direction )
{
	actWork * act;

	if ( door_control[door_id] == DOOR_NOT_EXIST ) return;
	act = &ActWork[ door_control[door_id] ];
	act->work[1] = direction;
	act->work[2] = get_door_site( door_id );
}

//-------------------------------------------------------------------------
//	ドアのチェック要素を返す
//-------------------------------------------------------------------------
static int get_hit_pos_value( u8 site, s16 x, s16 y )
{
	const u8 * tbl;

	if ( site == SITE_UP ) {
		tbl = hit_pos_table[0];
	}
	else if (site == SITE_DOWN ) {
		tbl = hit_pos_table[1];
	}
	else if ( site== SITE_LEFT ) {
		tbl = hit_pos_table[2];
	}
	else if ( site == SITE_RIGHT ) {
		tbl = hit_pos_table[3];
	}
	else {
		return HIT_SITE_NOT;
	}

	return tbl[ y * DOOR_DIAMETER + x ];
}


//=========================================================================
//	ドアOBJパラメータ初期化
//=========================================================================
void DoorObjInit( void )
{
	if ( is_enable_rotation_door() == IS_NOT_DOOR_MAP ) return;
	door_control_init();
	door_site_init();
}

//=========================================================================
//	スクロール時のドアOBJ制御
//=========================================================================
void DoorObjControl( s16 dx, s16 dy )
{
	if ( is_enable_rotation_door() == IS_NOT_DOOR_MAP ) return;
	AddDoorControl(dx,dy);
	DelDoorControl();
}

//=========================================================================
//	マップ遷移・画面復帰時のドアOBJセット
//=========================================================================
void DoorObjSet( void )
{
	if ( is_enable_rotation_door() == IS_NOT_DOOR_MAP ) return;
	SetDoorCell();
	door_control_init();
	AddDoorControl(0,0);
}

//=========================================================================
//	回転ドアとのヒットチェック
//　<引数>
//	site	移動方向
//	x		移動先Ｘ座標
//	y		移動先Ｙ座標
//
//	<戻り値>
//	0		当たりなし or 回転して進める
//	1		進めない
//=========================================================================
int DoorPushCheck( u8 site, s16 x, s16 y )
{
	int door_id;
	s16 mx,my,cx,cy;
	u8 direction,wing_pos;
	u8 result;

	if ( is_enable_rotation_door() == IS_NOT_DOOR_MAP ) return 0;

	for ( door_id=0; door_id< door_max; door_id++ ) {

		mx = door_data[door_id].x + MAP_LEFT_MARGIN;
		my = door_data[door_id].y + MAP_UP_MARGIN;
		if ( mx-CHECK_RANGE_LEFT > x || x > mx+CHECK_RANGE_RIGHT
				|| my-CHECK_RANGE_UP > y || y > my+CHECK_RANGE_DOWN ) continue;

		cx = x - mx + CHECK_RANGE_LEFT;
		cy = y - my + CHECK_RANGE_UP;
		result = get_hit_pos_value( site, cx, cy );
		if ( result == HIT_SITE_NOT ) continue;

		direction = (result & HIT_ROTATION_MASK ) >> HIT_ROTATION_SHIFT;
		wing_pos = result & HIT_POS_MASK;

		if  ( exist_wing_check( door_id, wing_pos ) ) {
			if ( is_enable_rotation_check( door_id, direction ) ) {
				request_rotation_anime( door_id ,direction );
				change_door_site( door_id, direction );
				return 0;
			} else {
				return 1;
			}
		}

	}
	return 0;
}





