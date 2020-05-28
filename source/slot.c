//**********************************************************************
//		slot.c
//		Ω€Øƒ
//**********************************************************************
#define		SLOT_H_PROTO
#include	<agb.h>
#include 	"common.h"
#include	"intr.h"
#include	"actor.h"
#include	"actanm.h"
#include	"task.h"
#include	"calctool.h"
#include	"palanm.h"
#include	"slot.h"
#include	"fld_eff.h"
#include	"menu.h"
#include	"mus_tool.h"
#include	"record.h"
#include	"decord.h"

//----------------------------------------------------------------------
//		extern
//----------------------------------------------------------------------
extern void BGM_FadeInPlaySet( u16, u8 );

//----------------------------------------------------------------------
//		include
//----------------------------------------------------------------------
#include "..\objdata\slotobj.ach"
#include "..\objdata\etcobj.ach"
// #include "..\objdata\ekisho.ach"
// #include "..\objdata\pikaobj.ach"
// #include "..\objdata\slotbg.ach"

//----------------------------------------------------------------------
//		define
//----------------------------------------------------------------------
#define	BG_CHNO_MAX		(0xe9)							// BG ∑¨◊êî
#define	BG_CHDATA_MAX	(BG_CHNO_MAX<<5)				// BG ∑¨◊ª≤Ωﬁ
#define BG_CHNO_0		(0x00)							// BG ∑¨◊≈› ﬁà íu
#define	BG0_CH_BASE		(BG_VRAM + 0x8000)				// BG 0 ∑¨◊Õﬁ∞Ω
#define BG1_CH_BASE 	(BG_VRAM)						// BG 1 ∑¨◊Õﬁ∞Ω
#define BG2_CH_BASE 	(BG1_CH_BASE)					// BG 2 ∑¨◊Õﬁ∞Ω
#define BG3_CH_BASE 	(BG2_CH_BASE)					// BG 3 ∑¨◊Õﬁ∞Ω
#define	BG0_MAP_BASE	(BG_VRAM + 0xf800)				// BG 0 œØÃﬂÕﬁ∞Ω
#define BG1_MAP_BASE	(BG_VRAM + 0xe000)				// BG 1 œØÃﬂÕﬁ∞Ω
#define BG2_MAP_BASE	(BG1_MAP_BASE + 0x0800)			// BG 2 œØÃﬂÕﬁ∞Ω
#define BG3_MAP_BASE	(BG2_MAP_BASE + 0x0800)			// BG 3 œØÃﬂÕﬁ∞Ω
#define BG0_CH_BASE_NO	((BG0_CH_BASE-BG_VRAM)>>14)		// BG 0 ∑¨◊Õﬁ∞Ω≈› ﬁ(no / 4000h)
#define BG1_CH_BASE_NO	((BG1_CH_BASE-BG_VRAM)>>14)		// BG 1 ∑¨◊Õﬁ∞Ω≈› ﬁ
#define BG2_CH_BASE_NO	((BG2_CH_BASE-BG_VRAM)>>14)		// BG 2 ∑¨◊Õﬁ∞Ω≈› ﬁ
#define BG3_CH_BASE_NO	((BG3_CH_BASE-BG_VRAM)>>14)		// BG 3 ∑¨◊Õﬁ∞Ω≈› ﬁ
#define BG0_MAP_BASE_NO	((BG0_MAP_BASE-BG_VRAM)>>11)	// BG 0 œØÃﬂÕﬁ∞Ω≈› ﬁ(no / 800h)
#define BG1_MAP_BASE_NO	((BG1_MAP_BASE-BG_VRAM)>>11)	// BG 1 œØÃﬂÕﬁ∞Ω≈› ﬁ
#define BG2_MAP_BASE_NO	((BG2_MAP_BASE-BG_VRAM)>>11)	// BG 2 œØÃﬂÕﬁ∞Ω≈› ﬁ
#define BG3_MAP_BASE_NO	((BG3_MAP_BASE-BG_VRAM)>>11)	// BG 3 œØÃﬂÕﬁ∞Ω≈› ﬁ

#define BG_SHADE_CHNO_0	(0x51)							// BG âe∑¨◊0
#define BG_SHADE_CHNO_1	(0x61)							// BG âe∑¨◊1
#define BG_SHADE_CHNO_2	(0xbe)							// BG âe∑¨◊2
#define BG_SHADE_CHNO_3	(0xbf)							// BG âe∑¨◊3
#define BG_SHADE_PALNO	(0x02)							// BG âe ﬂ⁄Øƒ

#define BG_IZM_GAUGE_ON_CHNO_0	(0x9e)					// BG ≤≈Ωﬁœπﬁ∞ºﬁ íÜ
#define BG_IZM_GAUGE_ON_CHNO_1	(0x9f)					// BG ≤≈Ωﬁœπﬁ∞ºﬁ ç∂
#define BG_IZM_GAUGE_ON_CHNO_2	(0xaf)					// BG ≤≈Ωﬁœπﬁ∞ºﬁ âE
#define BG_IZM_GAUGE_OFF_CHNO_0	(0x6e)					// BG ≤≈Ωﬁœπﬁ∞ºﬁ íÜ
#define BG_IZM_GAUGE_OFF_CHNO_1	(0x6f)					// BG ≤≈Ωﬁœπﬁ∞ºﬁ ç∂
#define BG_IZM_GAUGE_OFF_CHNO_2	(0x7f)					// BG ≤≈Ωﬁœπﬁ∞ºﬁ âE
#define BG_IZM_GAUGE_PALNO		(0x00)					// BG ≤≈Ωﬁœπﬁ∞ºﬁ ﬂ⁄Øƒ

#define BG_BTNOFF_CHNO_0	(0x42)						// BG Œﬁ¿›∑¨◊≈› ﬁ
#define BG_BTNOFF_CHNO_1	(0x43)
#define BG_BTNOFF_CHNO_2	(0x52)
#define BG_BTNOFF_CHNO_3	(0x53)
#define BG_BTNON_CHNO_0		(0x62)						// BG Œﬁ¿›∑¨◊≈› ﬁ
#define BG_BTNON_CHNO_1		(0x63)
#define BG_BTNON_CHNO_2		(0x72)
#define BG_BTNON_CHNO_3		(0x73)
#define BG_BTN_PALNO		(0x00)						// BG Œﬁ¿› ﬂ⁄Øƒ≈› ﬁ

#define BG_VRAMSET(m,x,y,c) (m)[((y)<<5)+(x)] = (c)		// BG∑¨◊æØƒ
#define	BG_SCRN_DATA(ch,h,v,p) \
		((ch)|((h)<<10)|((v)<<11)|((p)<<12))			// Ω∏ÿ∞›√ﬁ∞¿ê∂ê¨

#define TRG(b)		(sys.Trg&(b))						// Œﬁ¿›ƒÿ∂ﬁ
#define CONT(b)		(sys.Cont&(b))						// Œﬁ¿›∫›√∆≠
#define REPEAT(b)	(sys.Repeat&(b))					// Œﬁ¿›ÿÀﬂ∞ƒ

#define REEL_PT_MAX      (0x15)							// äGïøç≈ëÂ
#define REEL_PT_V_SIZE   (0x18)							// äGïøª≤Ωﬁ
#define REEL_PT_V_OFFSET (0x1c)							// äGïøµÃæØƒ
#define REEL_PT_V_MAX    (0x78)							// äGïøècç≈ëÂ
#define REEL_PT_V_GP(v)  ((v)/REEL_PT_V_SIZE)			// ƒﬁØƒ -> ∏ﬁÿØƒﬁ
#define REEL_PT_V_DP(v)  ((v)*REEL_PT_V_SIZE)			// ∏ﬁÿØƒﬁ -> ƒﬁØƒ
#define REEL_SCROLL_MAX  (REEL_PT_MAX*REEL_PT_V_SIZE)	// ÿ∞ŸΩ∏€∞Ÿç≈ëÂ
#define REEL_CENTERN_V   ((0x09*8)+4)					// ÿ∞ŸíÜâõ

#define MCREEL_PT_MAX		(0x06)						// œº›ÿ∞ŸäGïøç≈ëÂ
#define MCREEL_PT_V_SIZE	(0x14)						// œº›ÿ∞ŸäGïøª≤Ωﬁ
#define MCREEL_PT_V_OFFSET	((0x06*0x08)+4+8)			// œº›ÿ∞ŸäGïøµÃæØƒ
#define MCREEL_PT_V_MAX		(0x02*MCREEL_PT_V_SIZE)		// œº›ÿ∞Ÿècç≈ëÂ
#define MCREEL_PT_V_GP(v)	((v)/MCREEL_PT_V_SIZE)		// ç¿ïW->∏ﬁÿØƒﬁ
#define MCREEL_SCROLL_MAX	(MCREEL_PT_MAX*MCREEL_PT_V_SIZE)

#define BETLINE_1_COLNO		(PA_BG4+PA_COL10)			// ÕﬁØƒ◊≤›1 ∂◊∞≈› ﬁ
#define BETLINE_2_0_COLNO	(PA_BG4+PA_COL11)			// ÕﬁØƒ◊≤›2 è„∂◊∞≈› ﬁ
#define BETLINE_2_1_COLNO	(PA_BG4+PA_COL12)			// ÕﬁØƒ◊≤›2 â∫∂◊∞≈› ﬁ
#define BETLINE_3_0_COLNO	(PA_BG4+PA_COL14)			// ÕﬁØƒ◊≤›3 è„∂◊∞≈› ﬁ
#define BETLINE_3_1_COLNO	(PA_BG4+PA_COL13)			// ÕﬁØƒ◊≤›3 â∫∂◊∞≈› ﬁ

#define PATLAMP_PALNO		(PA_BG1)					//  ﬂƒ◊›Ãﬂ  ﬂ⁄Øƒ≈› ﬁ

#define REEL_SPEED_DEFAULT	(0x08)						// ÿ∞ŸΩÀﬂ∞ƒﬁ√ﬁÃ´Ÿƒ

#define CHAR_TEMP_WORK_POS  (0x10000)
#define CHAR_TEMP_WORK      (&UserWork[CHAR_TEMP_WORK_POS])

#define OBJ_CH_EKI_SIZE		(0x0190*0x20)
#define	OBJ_CH_PIKA_SIZE	(0x01b0*0x20)
#define OBJ_CH_EKI_TRANS_WORK_POS  (0x10000)
#define OBJ_CH_PIKA_TRANS_WORK_POS (OBJ_CH_EKI_TRANS_WORK_POS+OBJ_CH_EKI_SIZE)
#define OBJ_CH_EKI_TRANS_WORK    (&UserWork[OBJ_CH_EKI_TRANS_WORK_POS])
#define OBJ_CH_PIKA_TRANS_WORK   (&UserWork[OBJ_CH_PIKA_TRANS_WORK_POS])

#define SLOT_VER_COLOR	(PM_VERSION)					//  ﬁ∞ºﬁÆ›êFà·Ç¢
//#define SLOT_VER_COLOR	(VERSION_SAPPHIRE)			// ªÃß≤±
//#define SLOT_VER_COLOR	(VERSION_RUBY)				// ŸÀﬁ∞

enum													// ÕﬁØƒ◊≤›≈› ﬁ
{
	BETLINE_1 = 0,
	BETLINE_2_0,
	BETLINE_2_1,
	BETLINE_3_0,
	BETLINE_3_1,
	BETLINE_MAX,
};

enum													// œº›ÿ∞Ÿ≈› ﬁ
{
	MCREEL_PT_0 = 0,
	MCREEL_PT_1,
	MCREEL_PT_2,
	MCREEL_PT_3,
	MCREEL_PT_4,
	MCREEL_PT_5,
	MCREEL_PT_BOM,										// îöî≠
	MCREEL_HIT_MAX,
};

enum													// CELL ID
{
	CELL_BIG_R = 0,
	CELL_BIG_B,
	CELL_MARIRU,
	CELL_HASUBO,
	CELL_CHERRY,
	CELL_INAZUMA,
	CELL_REPLAY,
	CELL_NUM0,
	CELL_NUM1,
	CELL_NUM2,
	CELL_NUM3,
	CELL_NUM4,
	CELL_NUM5,
	CELL_NUM6,
	CELL_NUM7,
	CELL_NUM8,
	CELL_NUM9,
	CELL_DRUM,
	CELL_LC_STOP,
	CELL_LC_BONUS,
	CELL_LC_BIG,
	CELL_LC_REG,
};

enum													//  ﬂ⁄Øƒ ID
{
	PAL_OBJ_0,
	PAL_OBJ_1,
	PAL_OBJ_2,
	PAL_OBJ_3,
	PAL_OBJ_4,
	PAL_OBJ_5,
	PAL_OBJ_6,
	PAL_OBJ_7,
};

#define PIKAFLASH_COLNO	\
(OBJPALNO_TO_PANO(ObjPalNumGet(PAL_OBJ_7))+PA_COL3)		// Àﬂ∂¡≠≥ìdåÇ∂◊∞≈› ﬁ

#define LCBALL_PALNO \
(OBJPALNO_TO_PANO(ObjPalNumGet(PAL_OBJ_6)))				// âtèªŒﬁ∞Ÿ ﬂ⁄Øƒ≈› ﬁ

enum													// âtèª±∆“≈› ﬁ
{
	LCANM_Insert = 0,
	LCANM_Stop,
	LCANM_Win,
	LCANM_Lose,
	LCANM_BDTime,
	LCANM_RegBonus,
	LCANM_BigBonus,
};

enum													// âtèª±∏¿∞√ﬁ∞¿≈› ﬁ
{
	LCACT_Insert = 0,
	LCACT_Stop_S,
	LCACT_Stop_T,
	LCACT_Stop_O,
	LCACT_Stop_P,
	LCACT_A,
	LCACT_Ball,
	LCACT_Win,
	LCACT_Lose,
	LCACT_Kemuri0,
	LCACT_Kemuri1,
	LCACT_Kemuri2,
	LCACT_Kemuri3,
	LCACT_BD,
	LCACT_Time,
	LCACT_Num,
	LCACT_Key,
	LCACT_WinBall,
	LCACT_Reg_R,
	LCACT_Reg_E,
	LCACT_Reg_G,
	LCACT_BonusReg_B,
	LCACT_BonusReg_O,
	LCACT_BonusReg_N,
	LCACT_BonusReg_U,
	LCACT_BonusReg_S,
	LCACT_Big_B,
	LCACT_Big_I,
	LCACT_Big_G,
	LCACT_BonusBig_B,
	LCACT_BonusBig_O,
	LCACT_BonusBig_N,
	LCACT_BonusBig_U,
	LCACT_BonusBig_S,
	LCACT_InsertWindow,
};

enum													// âtèª±∏¿∞ÕØ¿ﬁ≈› ﬁ
{
	LCACTH_BD = 0,
	LCACTH_Time,
	LCACTH_Insert,
	LCACTH_Win,
	LCACTH_Lose,
	LCACTH_A,
	LCACTH_Kemuri,
	LCACTH_Num,
	LCACTH_Ball,
	LCACTH_Key,
	LCACTH_Stop_S,
	LCACTH_Stop_T,
	LCACTH_Stop_O,
	LCACTH_Stop_P,
	LCACTH_Bonus_B,
	LCACTH_Bonus_O,
	LCACTH_Bonus_N,
	LCACTH_Bonus_U,
	LCACTH_Bonus_S,
	LCACTH_Big_B,
	LCACTH_Big_I,
	LCACTH_Big_G,
	LCACTH_Reg_R,
	LCACTH_Reg_E,
	LCACTH_Reg_G,
	LCACTH_InsertWindow,
};

#define LCACTNO_NOTHING (ACT_MAX)						// âtèª±∏¿∞ñ≥Çµ
#define LCACT_END (0xff)								// âtèª±∏¿∞èIí[

enum													// ±∏¿∞Ãﬂ◊≤µÿ√®
{
	ACTPRI_STAR_0 = 0,
	ACTPRI_PIKACHUU,
	ACTPRI_STAR_1,
	ACTPRI_PIKA_FLASH,
	ACTPRI_PIKACHUU_SHADE,
	ACTPRI_INAZUMA,
	ACTPRI_BOM,
	ACTPRI_MACHINE,
	ACTPRI_SMOKE,
	ACTPRI_MACHINE_SHADE,
	ACTPRI_MACHINE_NO,
	ACTPRI_MACHINE_BACK,
	ACTPRI_IZMGAUGE,
	ACTPRI_NUMBER,
	ACTPRI_REEL_PTN,
	ACTPRI_DRUM,
	ACTPRI_LC,
};

enum													// ¿Ω∏Ãﬂ◊≤µÿ√®
{
	TASKPRI_SLOT = 0,
	TASKPRI_EXPLAIN,
	TASKPRI_REEL,
	TASKPRI_LC,
	TASKPRI_PAYOUT,
	TASKPRI_BTN_ANIME,
	TASKPRI_PATLAMP,
	TASKPRI_CUTIN,
	TASKPRI_IZM_GAUGE,
};

enum													// íäëI B
{
	LOTTERY_B_BIG = 0,
	LOTTERY_B_BD,
	LOTTERY_B_REG,
	LOTTERY_B_NOTHING,
};

#define LOTTERY_B_START_NO	LOTTERY_B_BIG
#define LOTTERY_B_END_NO	LOTTERY_B_NOTHING

enum													// éqñíäëI
{
	LOTTERY_S_INAZUMA = 0,
	LOTTERY_S_12,
	LOTTERY_S_6,
	LOTTERY_S_CHERRY,
	LOTTERY_S_REPLAY,
	LOTTERY_S_NOTHING,
};

#define LOTTERY_HITBIT_BIG			(0x80)				// íäëIÀﬁØƒ ÀﬁØ∏ﬁ
#define LOTTERY_HITBIT_REG			(0x40)				// ⁄∑ﬁ≠◊∞
#define LOTTERY_HITBIT_BD			(0x20)				// Àﬁ¿ƒﬁ“
#define LOTTERY_HITBIT_INAZUMA		(0x10)				// ≤≈Ωﬁœ
#define LOTTERY_HITBIT_12			(0x08)				// 12
#define LOTTERY_HITBIT_6			(0x04)				// 6
#define LOTTERY_HITBIT_CHERRY		(0x02)				// ¡™ÿ∞
#define LOTTERY_HITBIT_REPLAY		(0x01)				// ÿÃﬂ⁄≤
#define LOTTERY_HITBIT_BONUS_AND	(LOTTERY_HITBIT_BIG|LOTTERY_HITBIT_REG)
#define LOTTERY_HITBIT_BONUS_CLS	(~LOTTERY_HITBIT_BONUS_AND)
#define LOTTERY_HITBIT_BD_CLS		(~LOTTERY_HITBIT_BD)

#define BEFORE_7_RED	(0x00)							// ëO7ê‘
#define BEFORE_7_BLUE	(0x01)							// ëO7ê¬

enum													// ìñÇË
{
	HIT_CHERRY,
	HIT_CHERRY_4,
	HIT_REPLAY,
	HIT_HASUBO,
	HIT_MARIRU,
	HIT_INAZUMA,
	HIT_REGULAR,
	HIT_BONUS_RED,
	HIT_BONUS_BLUE,
	NO_HIT,
};

#define BIT_CHERRY		0x0001							// ÀØƒÃ◊∏ﬁ
#define BIT_CHERRY_4	0x0002
#define BIT_REPLAY		0x0004
#define BIT_HASUBO		0x0008
#define BIT_MARIRU		0x0010
#define BIT_INAZUMA		0x0020
#define BIT_REGULAR		0x0040
#define BIT_BIG_RED		0x0080
#define BIT_BIG_BLUE	0x0100

enum													// º∞∏¥›Ω≈› ﬁ
{
	SEQNO_FADE_IN_SET = 0,
	SEQNO_FADE_IN,
	SEQNO_GAME_INIT,
	SEQNO_LC_BDTIME_WAIT_NEXT_BET,
	SEQNO_NEXT_BET_CHECK,
	SEQNO_BET,
	SEQNO_BATBET3_MSG_SET,
	SEQNO_BATBET3_MSG_WAIT,
	SEQNO_EXPLAIN_WAIT,
	SEQNO_GAME_START,
	SEQNO_BDTIME_LOTTERY,
	SEQNO_REEL_SPIN_WAIT,
	SEQNO_REEL_STOP_BUTTON,
	SEQNO_REEL_STOP_WAIT,
	SEQNO_HIT_CHECK,
	SEQNO_PAYOUT,
	SEQNO_PATLUMP_WAIT,
	SEQNO_INAZUMA_GAUGE_UP,
	SEQNO_LC_BDTIME_WAIT_HITEND,
	SEQNO_GAME_NEXT,
	SEQNO_GAME_WAIT_NEXT,
	SEQNO_GAME_END_MSG_SET,
	SEQNO_GAME_END_YESNO,
	SEQNO_CREDIT_9999_MSG_SET,
	SEQNO_CREDIT_9999_MSG_WAIT,
	SEQNO_CREDIT_0_MSG_SET,
	SEQNO_CREDIT_0_MSG_WAIT,
	SEQNO_END_SET,
	SEQNO_END,

	SEQNO_DEBUG_MENU_WAIT,
};

#ifdef PM_DEBUG
#define SLOT_DEBUG_ERROR_CHECK
#define SLOT_DEBUG_BD_CHECK	(0)
#endif

//----------------------------------------------------------------------
//		typedef
//----------------------------------------------------------------------
typedef struct											// Ω€Øƒ√ﬁ∞¿
{
	u8	seq_no;											// º∞∏¥›Ω≈› ﬁ
	u8	hard;											// ê›íË
	u8	inazuma;										// ≤≈Ωﬁœ
	u8	before_7;										// íäëI7Ã◊∏ﬁ
	u8	lottery_bit;									// íäëIÃ◊∏ﬁ
	u8	lottery_bd_time;								// BDíäëI
	u8	hit_slip;										// ΩÕﬁÿ
	u8	hit_pattern;									// ÀØƒäGïø
	u16	hit_bit;										// ÀØƒÃ◊∏ﬁ
	u8	bd_time;										// BD¿≤—	
	u8	bd_time_count;									// BD¿≤—∂≥›ƒ
	s16	credit;											// ∏⁄ºﬁØƒ
	s16 payout;											// éxï•Ç¢
	s16 drop_credit;									// é∏Ç¡ÇΩñáêî
	s16 bet;											// ìqÇØã‡
	s16	machine_reel_dy;								// œº›ÿ∞Ÿ
	s16 machine_reel_gy;								// œº›ÿ∞Ÿ
	s16 reel_count;										// ÿ∞Ÿ∂≥›ƒ
	s16 reel_speed;										// ÿ∞ŸΩÀﬂ∞ƒﬁ
	s16	reel_dy[3];										// ÿ∞ŸƒﬁØƒY
	s16 reel_oy[3];										// ÿ∞ŸµÃæØƒY
	s16	reel_gy[3];										// ÿ∞Ÿ∏ﬁÿØƒﬁY
	s16 reel_slip_gy[3];								// ÿ∞ŸΩÿØÃﬂY
	s16 reel_hit_gy[3];									// ÿ∞ŸÀØƒà íu
	u8	taskno_reel[3];									// ÿ∞Ÿêßå‰¿Ω∏≈› ﬁ
	u8	taskno_lc;										// âtèªêßå‰¿Ω∏≈› ﬁ
	u8	taskno_izm_gauge;								// ≤≈Ωﬁœπﬁ∞ºﬁ¿Ω∏≈› ﬁ
	u8	actno_pikachuu;									// Àﬂ∂¡≠≥±∏¿≈› ﬁ
	u8	actno_machine_back;								// œº›ó†±∏¿≈› ﬁ
	u8	actno_bom;										// îöî≠±∏¿≈› ﬁ
	u8	actno_break_machine;							// âÛÇÍœº›±∏¿≈› ﬁ
	u8	actno_smoke;									// âå±∏¿≈› ﬁ
	u8	actno_betline[BETLINE_MAX];						// ÕﬁØƒ◊≤›±∏¿≈› ﬁ
	u8	actno_machine[2];								// œº›±∏¿≈› ﬁ
	u8	actno_machineno[3];								// œº›≈› ﬁ±∏¿≈› ﬁ
	u8	actno_machine_shade[2];							// œº›âe±∏¿≈› ﬁ
	u8	actno_inazuma[2];								// ≤≈Ωﬁœ±∏¿≈› ﬁ
	u8	actno_pikaflash[2];								// Àﬂ∂¡≠≥ìdåÇ±∏¿≈› ﬁ
	u8	actno_star[4];									// êØ±∏¿≈› ﬁ
	u16 vb_reg_win0_h;									// ≥®›ƒﬁ≥ H
	u16 vb_reg_win0_v;									// ≥®›ƒﬁ≥ V
	u16 vb_reg_win_in;									// ≥®›ƒﬁ≥ ì‡
	u16 vb_reg_win_out;									// ≥®›ƒﬁ≥ äO
	u16	bgmno;											// BGM
	pFunc rec_proc;										// ïúãAèàóù

//----
#ifdef PM_DEBUG
//----
	s32	d_mawasi_count;
	s32 d_payout_count;
	s32 d_cherry_hit_count;
	s32 d_replay_hit_count;
	s32 d_hasubo_hit_count;
	s32 d_ruriri_hit_count;
	s32 d_inazuma_hit_count;
	s32 d_reg_hit_count;
	s32 d_big_hit_count;
	s32 d_bd_hit_count;

#ifdef SLOT_DEBUG_ERROR_CHECK
	s32 d_big_d_d_count;
#endif
//----
#endif
//----

}SLOT;

typedef struct											// âtèª±∆“
{
	u8 actHno;											// ±∏¿∞ÕØ¿ﬁ√∞ÃﬁŸ≈› ﬁ
	u8 actDATAno;										// ±∏¿∞√ﬁ∞¿√∞ÃﬁŸ≈› ﬁ
	s16 actWORKdata;									// ±∏¿∞éwíË√ﬁ∞¿
}LCACTDATA;

//----------------------------------------------------------------------
//		Ãﬂ€ƒ
//----------------------------------------------------------------------
static void PushSlotTempWork( u8, pFunc );
static void PopSlotTempWork( void );

static void SlotScrnOFF( void );
static void SlotScrnON( void );
static void SlotBgVramInit( void );
static void SlotOamInit( void );
static void SlotScrnInit( void );
static void SlotWorkInit( void );
static void SlotFontInit( void );
static void SlotProcInit( void );
static void SlotVramSet( void );
static void SlotActorSet( void );
static void SlotProcSet( void );

static void SetSlotTask( void );

static void SetLottery( void );
static void CheckLottery( void );
static void SetLotteryBD( void );
static u8 GetLotteryBDBom( u16 );
static s16 GetLotteryBDTimeReelSpeed( void );

static void CheckReelHitCheck( void );

static void SetPayOutTask( void );
static u8 CheckPayOutTask( void );

static void SetMachineReelScroll( s16 );
static s16 SetMachineReelGridScroll( s16 );
static u8 GetMachineReelPattern( s16 );
static void SetReelScroll( u8, s16 );
static s16 SetReelGridScroll( u8, s16 );
static u8 GetReelPattern( u8, s16 );
static u8 GetReelPatternGrid( u8, s16 );
static void SetReelControlTask( void );
static void SetReelControlScroll( u8 );
static void SetReelControlStop( u8 );
static u8 CheckReelControlStop( u8 );

static void SetButtonAnimeTask( u8 );

static void SetBetLineLight( u8 );
static void SetBetLineLightOut( u8 );
static void SetBetLineLightBetPoint( u8 );
static void SetBetLineLightOutBetPoint( u8 );
static void AddBetLineActor( void );
static void SetBetLineAnime( u8 );
static u8 CheckBetLineAnimeStart( void );
static u8 CheckBetLineAnimeEnd( void );

static void SetPatLampTask( void );
static u8 CheckPatLampTask( void );

static void SetInazumaGaugeTask( void );
static void SetInazumaGaugeUp( u8 );
static void SetInazumaGaugeCls( void );
static u8 CheckInazumaGaugeAnime( void );
static void SetInazumaGauge( u8 );

static void SetInazumaCutinTask( void );
static u8 CheckInazumaCutinTask( void );

static void SetExplainTask( u8 no );
static u8 CheckExplainTask( void );

static void SetLcControlTask( void );
static void SetLcAnime( u8 );
static void SetLcAnimeSub( u8, void(*)(actWork*), s16, s16, s16 );
static void ClearLcAnime( void );
static u8 CheckLcAnime( void );

static void AddReelPatternActor( void );
static void ReelPatternActMove( actWork * );
static void AddNumberActor( void );
static void NumberActMove( actWork * );
static void AddDrumActor( void );
static void AddPikachuuActor( void );
static void DelPikachuuActor( void );
static void PikachuuActMove( actWork * );
static void AddMachineActor( void );
static void AddBreakMachineActor( void );
static void AddMachineNoActor( void );
static void MachineNoActMove( actWork * );
static void AddMachineShadeActor( void );
static void AddMachineBackActor( void );
static void DelMachineActor( void );
static void DelMachineShadeActor( void );
static void DelBreakMachineActor( void );
static void AddInazumaActor( void );
static void InazumaActMove( actWork * );
static void SetInazumaActWait( s16 );
static void DelInazumaActor( void );
static void AddPikaFlashActor( void );
static void PikaFlashActMove( actWork * );
static void SetPikaFlashActWait( s16 );
static void DelPikaFlashActor( void );
static void AddBomActor( void );
static void BomActMove( actWork * );
static void DelBomActor( void );
static void AddStarActor( void );
static void StarActMove( actWork * );
static void DelStarActor( void );
static void AddSmokeActor( void );
static void SmokeActMove( actWork * );
static u8 CheckSmokeActMove( void );
static void DelSmokeActor( void );
static u8 AddInazumaGaugeActor( s16, s16 );
static void InazumaGaugeActMove( actWork * );
static void DelInazumaGaugeActor( u8 );
static u8 AddLcActor( u8, u8, s16 );
static u8 AddLcActorSub( u8, void (*)(actWork*), s16, s16, s16 );

static void SetSlotObjVram( void );
static void SetSlotBgVram( void );
static void SetSlotBgMap( void );
static void SetMapButton( s16, u16, u16, u16, u16 );
static void SetMapExplain( void );

static const u8 ReelPattern[3][21];
static const u8 MachineReelPattern[];
static const s16 StartReelGVOffset[3][2];
static const u8 LotteryBonusA[6][3];
static const u8 LotteryBonusB[3][6];
static const u8 LotteryInazumaBigBDCorrect[17];
static const u8 LotterySmallRole[5][6];
static const u8 LotteryBDRed[6][17];
static const u8 LotteryBDBlue[6][17];
static const u16 LotteryBDBom[5];
static const u16 LotteryBDTimeReelSpeed[5][2];
static const u16 LotteryBDTimeReelSpeedCorrect[5];
static const u8 LotteryPattern[];
static const u16 LotteryBonusB_HitBit[];
static const u16 LotterySmallRole_HitBit[];
static const u8 HitReelPattern[];
static const u16 HitReelBit[];
static const s16 Payout[];

static const LCACTDATA * const LcAnimeDataTbl[];
static void (* const LcAnimeSettleTbl[])( void );
static const s16 LcActStartPosTbl[][2];
static void (* const LcActMoveTbl[])( actWork * );

static const actHeader ReelPatternActHead;
static const actHeader NumberActHead;
static const actHeader DrumActHead;
static const actHeader PikachuuActHead;
static const actHeader MachineUpActHead;
static const actHeader MachineDownActHead;
static const actHeader MachineBreakActHead;
static const actHeader MachineNoActHead;
static const actHeader MachineShadeActHead;
static const actHeader MachineBackActHead;
static const actHeader InazumaActHead;
static const actHeader PikaFlashActHead;
static const actHeader BomActHead;
static const actHeader StarActHead;
static const actHeader SmokeActHead;
static const actHeader LcBD_ActHead;
static const actHeader LcTime_ActHead;
static const actHeader LcInsert_ActHead;
static const actHeader LcStop_ActHead;
static const actHeader LcWin_ActHead;
static const actHeader LcLose_ActHead;
static const actHeader LcBonus_ActHead;
static const actHeader LcBig_ActHead;
static const actHeader LcReg_ActHead;
static const actHeader LcA_ActHead;
static const actHeader LcKemuri_ActHead;
static const actHeader LcNum_ActHead;
static const actHeader LcBall_ActHead;
static const actHeader LcKey_ActHead;
static const actHeader InazumaGaugeActHead;

static const OAMPatSt DrumOamPat[];
static const OAMPatSt MachineUpOamPat[];
static const OAMPatSt MachineDownOamPat[];
static const OAMPatSt MachineBreakOamPat[];
static const OAMPatSt MachineShadeOamPat[];
static const OAMPatSt MachineBackOamPat[];
static const OAMPatSt LcBD_OamPat[];
static const OAMPatSt LcTime_OamPat[];
static const OAMPatSt LcInsert_OamPat[];
static const OAMPatSt LcStop_OamPat[];
static const OAMPatSt LcWin_OamPat[];
static const OAMPatSt LcBall_OamPat[];
static const OAMPatSt LcKey_OamPat[];
static const OAMPatSt LcStop_S_Pat[];
static const OAMPatSt LcStop_T_Pat[];
static const OAMPatSt LcStop_O_Pat[];
static const OAMPatSt LcStop_P_Pat[];
static const OAMPatSt LcBonus_B_OamPat[];
static const OAMPatSt LcBonus_O_OamPat[];
static const OAMPatSt LcBonus_N_OamPat[];
static const OAMPatSt LcBonus_U_OamPat[];
static const OAMPatSt LcBonus_S_OamPat[];
static const OAMPatSt LcBig_B_OamPat[];
static const OAMPatSt LcBig_I_OamPat[];
static const OAMPatSt LcBig_G_OamPat[];
static const OAMPatSt LcReg_R_OamPat[];
static const OAMPatSt LcReg_E_OamPat[];
static const OAMPatSt LcReg_G_OamPat[];
static const actHeader * const LcActHeadTbl[];
static const OAMPatSt * const LcOamPatTbl[];

static const CellData SlotObj_CellData[];
static const CellData SlotDrum_CellData;
static const u8 * const SlotDrumCharacter;
static const u16 slotobj_Palette[];
static const u16 slotbg_Palette[];
static const u16 BetLineLightPalette[];
static const u16 * const BetLineLightColorTbl[];
static const u16 * const BetLineLightOutColorTbl[];
static const u8 BetLineSetColorPos[];
static const u8 BetPointLineSetNo[3][2];
static const u8 BetPointLineCount[];
static const u16 * const PatLampPaletteTbl[];
static const u16 * const PatLampLightOutPalette;
static const u16 * const LcBallPaletteTbl[];
static const u16 * const LcBallDefaultPalette;
static const u16 SlotExplainMsgPalette[];
static const PalData SlotObj_PaletteData[];
static const u8 ekisho_LZ[];
static const u8 pikaobj_LZ[];
static const u8 slotbg_LZ[];
static const u16 slotbg_Map[];
static const u16 kokuchi_Map[];
static const u16 slotbg_sel_Map[];

static const u8 SlotMsgGameEnd[];
static const u8 SlotMsgCredit9999[];
static const u8 SlotMsgCreditNothing[];
static const u8 SlotMsgBatBet3[];
static const u8 SlotMsgExplain[];

static SLOT * const Slotst = ((SLOT*)UserWork);

//----
#ifdef PM_DEBUG
//----
static u8 SlotDebugSw;
static u8 SlotDebugLotterySw;
static u8 SlotDebugLotteryHitBit;
static u8 SlotDebugAutoSw;
static s32 SlotDebugAutoKeyWait;
static void DebugSlotDataInit( void );
static void SlotDebugCount( s32 *, s32 );
static void SetDebugSlotMenuTask( void );
static u8 CheckDebugSlotMenuTask( void );

#ifdef SLOT_DEBUG_ERROR_CHECK
static void SlotDebugErrorCheck( void );
#endif
//----
#endif
//----

//======================================================================
//		Ω€Øƒ
//======================================================================
static void SlotInit( void );
static void SlotMain( void );
static void SlotVBlank( void );

//------------------------------------------
//	Ω€Øƒ
//	In:		hard			; ê›íË(0~5)
//			rec_proc		; ïúãAèàóù
//------------------------------------------
void Slot( u8 hard, pFunc rec_proc )
{
#ifdef PM_DEBUG
	SlotDebugSw = 0;
#endif

	PushSlotTempWork( hard, rec_proc );
	MainProcChange( SlotInit );
}

//----
#ifdef PM_DEBUG
//----
//------------------------------------------
//	Ω€Øƒ√ﬁ ﬁØ∏ﬁ
//	In:		hard			; ê›íË(0~5)
//			rec_proc		; ïúãAèàóù
//------------------------------------------
void SlotDebug( u8 hard, pFunc rec_proc )
{
	SlotDebugSw = 1;

	PushSlotTempWork( hard, rec_proc );
	MainProcChange( SlotInit );
}
//----
#endif
//----

//------------------------------------------
//	Ω€Øƒ èâä˙âª
//------------------------------------------
static void SlotInit( void )
{
	switch( sys.InitSeqWork )
	{
		case 0:
			SlotScrnOFF();
			SlotWorkInit();
			sys.InitSeqWork++;
			break;
		case 1:
			SlotBgVramInit();
			sys.InitSeqWork++;
			break;
		case 2:
			SlotOamInit();
			SlotScrnInit();
			sys.InitSeqWork++;
			break;
		case 3:
			SlotFontInit();
			sys.InitSeqWork++;
			break;
		case 4:
			SlotProcInit();
			sys.InitSeqWork++;
			break;
		case 5:
			SlotVramSet();
			sys.InitSeqWork++;
			break;
		case 6:
			SlotActorSet();
			SlotProcSet();
			SlotScrnON();
			MainProcChange( SlotMain );
	}
}

//------------------------------------------
//	“≤›
//------------------------------------------
static void SlotMain( void )
{
	MainTask();
	JumpActor();
	SetActor();
	PaletteAnime();
}

//------------------------------------------
//	V Blank
//------------------------------------------
static void SlotVBlank( void )
{
	actOAMtrans();
	actDMAtrans();
	PaletteFadeTrans();

	*(vu16*)REG_WIN0H = Slotst->vb_reg_win0_h;
	*(vu16*)REG_WIN0V = Slotst->vb_reg_win0_v;
	*(vu16*)REG_WININ = Slotst->vb_reg_win_in;
	*(vu16*)REG_WINOUT = Slotst->vb_reg_win_out;
}

//======================================================================
//		‹∞∏
//======================================================================
static void SlotTempWorkTask( u8 );

//------------------------------------------
//	√ﬁ∞¿ëﬁî
//------------------------------------------
static void PushSlotTempWork( u8 hard, pFunc rec_proc )
{
	u8 i;
	TASK_TABLE *task;
	
	i = AddTask( SlotTempWorkTask, 0xff );
	task = &TaskTable[i];
	
	task->work[0] = hard;
	SetAdrs_to_Work( &task->work[1], rec_proc );
}

//------------------------------------------
//	ëﬁî‹∞∏ïúãA
//------------------------------------------
static void PopSlotTempWork( void )
{
	u8 i;
	TASK_TABLE *task;
	
	i = CheckTaskNo( SlotTempWorkTask );
	task = &TaskTable[i];
	
	Slotst->hard = (u8)task->work[0];
	SetWork_to_Seq( &task->work[1], &Slotst->rec_proc );
}

//------------------------------------------
//	ëﬁîóp¿Ω∏
//------------------------------------------
static void SlotTempWorkTask( u8 no )
{
}

//======================================================================
//		èâä˙âªèàóù
//======================================================================
//------------------------------------------
//	âÊñ èàóù ON
//------------------------------------------
static void SlotScrnOFF( void )
{
	SetVBlankFunc( NULL );
	SetHBlankFunc( NULL );

	*(vu16*)REG_DISPCNT = 0;
}

//------------------------------------------
//	âÊñ èàóù ON
//------------------------------------------
static void SlotScrnON( void )
{
	SetVBlankFunc( SlotVBlank );

	REG_IE_SET( V_BLANK_INTR_FLAG );					// V äÑÇËçûÇ›
	*(vu16*)REG_STAT |= STAT_V_BLANK_IF_ENABLE;			// V äÑÇËçûÇ›ãñâ¬
	
	*(vu16 *)REG_DISPCNT =
					DISP_MODE_0	|						// ”∞ƒﬁ 0
					DISP_BG0_ON	|						// BG ON
					DISP_BG1_ON |
					DISP_BG2_ON	|
					DISP_BG3_ON |
					DISP_WIN0_ON |						// ≥®›ƒﬁ≥ 0 ON
					DISP_OBJ_CHAR_1D_MAP |				// ∑¨◊1éüå≥œØÀﬂ›∏ﬁ
					DISP_OBJ_ON;						// OBJ ON
}

//------------------------------------------
//	BG VRAM èâä˙âª
//------------------------------------------
static void SlotBgVramInit( void )
{
	DIV_DMACLEAR( 3, 0, BG_VRAM, BG_MODE0_VRAM_SIZE, 16 );
}

//------------------------------------------
//	OAM èâä˙âª
//------------------------------------------
static void SlotOamInit( void )
{
	DIV_DMACLEAR( 3, 0, OAM, OAM_SIZE, 16 );
}

//------------------------------------------
//	âÊñ èâä˙âª
//------------------------------------------
static void SlotScrnInit( void )
{
	*(vu16 *)REG_BG0CNT = 0;							// BG ∫›ƒ€∞Ÿ∏ÿ±
	*(vu16 *)REG_BG1CNT = 0;
	*(vu16 *)REG_BG2CNT = 0;
	*(vu16 *)REG_BG3CNT = 0;

	*(vu16 *)REG_BG0HOFS = 0;							// ç¿ïW∏ÿ±
	*(vu16 *)REG_BG0VOFS = 0; 
	*(vu16 *)REG_BG1HOFS = 0;
	*(vu16 *)REG_BG1VOFS = 0; 
	*(vu16 *)REG_BG2HOFS = 0;
	*(vu16 *)REG_BG2VOFS = 0;
	*(vu16 *)REG_BG3HOFS = 0;
	*(vu16 *)REG_BG3VOFS = 0;

	*(vu16 *)REG_BG0CNT =								// BG 0
		(BG0_MAP_BASE_NO << BG_SCREEN_BASE_SHIFT)	|	// Ω∏ÿ∞›Õﬁ∞Ω
		(BG0_CH_BASE_NO << BG_CHAR_BASE_SHIFT)		| 	// ∑¨◊Õﬁ∞Ω
								BG_COLOR_16 		|	// 16
								BG_SCREEN_SIZE_0	|	// 256x256
								BG_PRIORITY_0;			// Ãﬂ◊≤µÿ√®

	*(vu16 *)REG_BG1CNT =								// BG 1
		(BG1_MAP_BASE_NO << BG_SCREEN_BASE_SHIFT)	|	// Ω∏ÿ∞›Õﬁ∞Ω
		(BG1_CH_BASE_NO << BG_CHAR_BASE_SHIFT)		| 	// ∑¨◊Õﬁ∞Ω
								BG_COLOR_16 		|	// 16
								BG_SCREEN_SIZE_0	|	// 256x256
								BG_PRIORITY_1;			// Ãﬂ◊≤µÿ√®

	*(vu16 *)REG_BG2CNT =								// BG 2
		(BG2_MAP_BASE_NO << BG_SCREEN_BASE_SHIFT)	|	// Ω∏ÿ∞›Õﬁ∞Ω
		(BG2_CH_BASE_NO << BG_CHAR_BASE_SHIFT)		| 	// ∑¨◊Õﬁ∞Ω
								BG_COLOR_16 		|	// 16
								BG_SCREEN_SIZE_0	|	// 256x256
								BG_PRIORITY_2;			// Ãﬂ◊≤µÿ√®

	*(vu16 *)REG_BG3CNT =								// BG 3
		(BG3_MAP_BASE_NO << BG_SCREEN_BASE_SHIFT)	|	// Ω∏ÿ∞›Õﬁ∞Ω
		(BG3_CH_BASE_NO << BG_CHAR_BASE_SHIFT)		| 	// ∑¨◊Õﬁ∞Ω
								BG_COLOR_16 		|	// 16
								BG_SCREEN_SIZE_0	|	// 256x256
								BG_PRIORITY_2;			// Ãﬂ◊≤µÿ√®
	
	*(vu16 *)REG_WININ = WIN_ALL_ON;
	*(vu16 *)REG_WINOUT = WIN_ALL_ON;

	*(vu16 *)REG_BLDCNT =
		BLD_BG3_1ST | BLD_OBJ_2ND | BLD_A_BLEND_MODE;

	*(vu16 *)REG_BLDALPHA = (0x08 << 8) | 0x09;
}

//------------------------------------------
//	‹∞∏èâä˙âª
//------------------------------------------
static void SlotWorkInit( void )
{
	u8 i;

	PopSlotTempWork();

	Slotst->seq_no = SEQNO_FADE_IN_SET;
	Slotst->inazuma = 0;
	Slotst->before_7 = pp_rand() & 0x01;				// èââÒ7Ã◊∏ﬁæØƒ
	Slotst->lottery_bit = 0;
	Slotst->hit_bit = 0;
	Slotst->bd_time = 0;
	Slotst->bd_time_count = 0;
	Slotst->credit = Fld.my_coin;
	Slotst->payout = 0;
	Slotst->drop_credit = 0;
	Slotst->bet = 0;
	Slotst->reel_count = 0;
	Slotst->reel_speed = REEL_SPEED_DEFAULT;
	Slotst->vb_reg_win0_h = (0 << 8) | (240);
	Slotst->vb_reg_win0_v = (0 << 8) | (160);
	Slotst->vb_reg_win_in = WIN_ALL_ON;
	Slotst->vb_reg_win_out = WIN_ALL_ON;
	Slotst->bgmno = BGM_GetNowNo();

	for( i = 0; i < 3; i++ )
	{
		Slotst->reel_oy[i] = 0;
		Slotst->reel_gy[i] = StartReelGVOffset[i][Slotst->before_7] % REEL_PT_MAX;
		Slotst->reel_dy[i] = REEL_SCROLL_MAX - REEL_PT_V_DP( Slotst->reel_gy[i] );
		Slotst->reel_dy[i] %= REEL_SCROLL_MAX;
	}

#ifdef PM_DEBUG
	DebugSlotDataInit();
 	if( SlotDebugSw ) Slotst->credit = 1000;
#endif
}

//------------------------------------------
//	Ã´›ƒèâä˙âª
//------------------------------------------
static void SlotFontInit( void )
{
	PrintScreenInit( SLOT_TYPE );
	NMenuScreenInit( SLOT_TYPE );
}

//------------------------------------------
//	èàóùèâä˙âª
//------------------------------------------
static void SlotProcInit( void )
{
	PaletteAnimeInit();
	InitActor();
	OamWriteEd = 0x80;
	ObjPalManInit();
	InitTask();
}

//------------------------------------------
//	VramæØƒ
//------------------------------------------
static void SlotVramSet( void )
{
	SetSlotBgVram();
	SetSlotBgMap();
	SetSlotObjVram();
}

//------------------------------------------
//	±∏¿æØƒ
//------------------------------------------
static void SlotActorSet( void )
{
	AddReelPatternActor();
	AddNumberActor();
	AddBetLineActor();
	AddDrumActor();
}

//------------------------------------------
//	èàóùæØƒ
//------------------------------------------
static void SlotProcSet( void )
{
	SetInazumaGaugeTask();
	SetReelControlTask();
	SetLcControlTask();
	SetSlotTask();
}

//======================================================================
//		Ω€Øƒèàóù
//======================================================================
static void SlotTask( u8 );
static u8 SlotTask_StartFadeIn( TASK_TABLE * );
static u8 SlotTask_FadeIn( TASK_TABLE * );
static u8 SlotTask_GameInit( TASK_TABLE * );
static u8 SlotTask_LcBDTimeWait_NextBet( TASK_TABLE * );
static u8 SlotTask_NextBetCheck( TASK_TABLE * );
static u8 SlotTask_Bet( TASK_TABLE * );
static u8 SlotTask_BatBet3MsgSet( TASK_TABLE * );
static u8 SlotTask_BatBet3MsgWait( TASK_TABLE * );
static u8 SlotTask_ExplainWait( TASK_TABLE * );
static u8 SlotTask_GameStart( TASK_TABLE * );
static u8 SlotTask_BDTimeLottery( TASK_TABLE * );
static u8 SlotTask_ReelSpinWait( TASK_TABLE * );
static u8 SlotTask_ReelStopButton( TASK_TABLE * );
static u8 SlotTask_ReelStopWait( TASK_TABLE * );
static u8 SlotTask_ReelHitCheck( TASK_TABLE * );
static u8 SlotTask_PayOut( TASK_TABLE * );
static u8 SlotTask_PatLampWait( TASK_TABLE * );
static u8 SlotTask_InazumaGaugeUp( TASK_TABLE * );
static u8 SlotTask_LcBDTimeWaitNext( TASK_TABLE * );
static u8 SlotTask_ReturnToNext( TASK_TABLE * );
static u8 SlotTask_WaitReturnToNext( TASK_TABLE * );
static u8 SlotTask_EndMsgSet( TASK_TABLE * );
static u8 SlotTask_EndMsgYesNo( TASK_TABLE * );
static u8 SlotTask_Credit9999MsgSet( TASK_TABLE * );
static u8 SlotTask_Credit9999MsgWait( TASK_TABLE * );
static u8 SlotTask_CreditNothingMsgSet( TASK_TABLE * );
static u8 SlotTask_CreditNothingMsgWait( TASK_TABLE * );
static u8 SlotTask_EndSet( TASK_TABLE * );
static u8 SlotTask_End( TASK_TABLE * );

#ifdef PM_DEBUG
static u8 DebugSlotTask_MenuWait( TASK_TABLE * );
#endif

//------------------------------------------
//	“≤›èàóù¿Ω∏æØƒ
//------------------------------------------
static void SetSlotTask( void )
{
	u8 i;

	i = AddTask( SlotTask, TASKPRI_SLOT );
	SlotTask( i );
}

//------------------------------------------
//	Ω€Øƒèàóù√∞ÃﬁŸ
//------------------------------------------
static u8 (* const SlotTaskTbl[])(TASK_TABLE *) =
{
	SlotTask_StartFadeIn,
	SlotTask_FadeIn,
	SlotTask_GameInit,
	SlotTask_LcBDTimeWait_NextBet,	
	SlotTask_NextBetCheck,
	SlotTask_Bet,
	SlotTask_BatBet3MsgSet,
	SlotTask_BatBet3MsgWait,
	SlotTask_ExplainWait,
	SlotTask_GameStart,
	SlotTask_BDTimeLottery,
	SlotTask_ReelSpinWait,
	SlotTask_ReelStopButton,
	SlotTask_ReelStopWait,
	SlotTask_ReelHitCheck,
	SlotTask_PayOut,
	SlotTask_PatLampWait,
	SlotTask_InazumaGaugeUp,
	SlotTask_LcBDTimeWaitNext,
	SlotTask_ReturnToNext,
	SlotTask_WaitReturnToNext,
	SlotTask_EndMsgSet,
	SlotTask_EndMsgYesNo,
	SlotTask_Credit9999MsgSet,
	SlotTask_Credit9999MsgWait,
	SlotTask_CreditNothingMsgSet,
	SlotTask_CreditNothingMsgWait,
	SlotTask_EndSet,
	SlotTask_End,

#ifdef PM_DEBUG
	DebugSlotTask_MenuWait,
#endif
};

//------------------------------------------
//	Ω€Øƒ¿Ω∏
//------------------------------------------
static void SlotTask( u8 no )
{
	while( SlotTaskTbl[Slotst->seq_no](&TaskTable[no]) );
}

//------------------------------------------
//	Ω€Øƒ Ã™∞ƒﬁ≤›æØƒ
//------------------------------------------
static u8 SlotTask_StartFadeIn( TASK_TABLE *task )
{
	PaletteFadeReq( 0xffffffff, 0, 16, 0, 0 );
	SetInazumaGauge( Slotst->inazuma );					// âº,πﬁ∞ºﬁÇ™æ∞ÃﬁÇ≥ÇÍÇÈÇ»ÇÁÇŒÅc
	Slotst->seq_no++;

	return( 0 );
}

//------------------------------------------
//	Ω€Øƒ Ã™∞ƒﬁ≤›
//------------------------------------------
static u8 SlotTask_FadeIn( TASK_TABLE *task )
{
	if( FadeData.fade_sw == 0 )
	{
		Slotst->seq_no++;
	}

	return( 0 );
}

//------------------------------------------
//	Ω€Øƒ πﬁ∞—èâä˙âª
//------------------------------------------
static u8 SlotTask_GameInit( TASK_TABLE *task )
{
	Slotst->payout = 0;
	Slotst->bet = 0;
	Slotst->reel_count = 0;
	Slotst->lottery_bit &= LOTTERY_HITBIT_BONUS_AND;

	Slotst->seq_no = SEQNO_NEXT_BET_CHECK;

	if( Slotst->credit <= 0 )							// ∏⁄ºﬁØƒñ≥Çµ
	{
		Slotst->seq_no = SEQNO_CREDIT_0_MSG_SET;
	}
	else if( Slotst->bd_time )
	{
		Slotst->seq_no = SEQNO_LC_BDTIME_WAIT_NEXT_BET;
		SetLcAnime( LCANM_BDTime );
	}

	return( 1 );
}

//------------------------------------------
//	Ω€Øƒ BD Time ∂≥›ƒï\é¶ -> ÕﬁØƒÇ÷
//------------------------------------------
static u8 SlotTask_LcBDTimeWait_NextBet( TASK_TABLE *task )
{
	if( CheckLcAnime() )
	{
		Slotst->seq_no = SEQNO_NEXT_BET_CHECK;
	}

	return( 0 );
}

//------------------------------------------
//	Ω€Øƒ ÕﬁØƒÇ÷
//------------------------------------------
static u8 SlotTask_NextBetCheck( TASK_TABLE *task )
{
	SetLcAnime( LCANM_Insert );
	Slotst->seq_no = SEQNO_BET;

//----
#ifdef PM_DEBUG
//----
	if( SlotDebugSw == 0 || SlotDebugAutoSw == 0 )
	{
		if( Slotst->credit >= 9999 )
		{
			Slotst->seq_no = SEQNO_CREDIT_9999_MSG_SET;
		}
	}
//----
#else
//----
	if( Slotst->credit >= 9999 )
	{
		Slotst->seq_no = SEQNO_CREDIT_9999_MSG_SET;
	}
//----
#endif
//----

	return( 1 );
}

//------------------------------------------
//	Ω€Øƒ ÕﬁØƒﬁ
//------------------------------------------
static u8 SlotTask_Bet( TASK_TABLE *task )
{
	s16 d;

//----
#ifdef PM_DEBUG
	if( SlotDebugSw && SlotDebugAutoSw )
	{
		if( Slotst->credit <= 3 || CONT(B_BUTTON) )
		{
			SlotDebugAutoSw = 0;
		}
		else
		{
			SetBetLineLightBetPoint( 0 );
			SetBetLineLightBetPoint( 1 );
			SetBetLineLightBetPoint( 2 );
			Slotst->credit -= 3;
			Slotst->bet = 3;
			Slotst->seq_no = SEQNO_GAME_START;
			return( 0 );
		}
	}

	if( SlotDebugSw && TRG(START_BUTTON) )
	{
		SetDebugSlotMenuTask();
		Slotst->seq_no = SEQNO_DEBUG_MENU_WAIT;
		return( 0 );
	}
#endif
//----

	if( TRG(SELECT_BUTTON) )
	{
		SetExplainTask( LCANM_Insert );
		Slotst->seq_no = SEQNO_EXPLAIN_WAIT;
		return( 0 );
	}

	if( TRG(R_BUTTON) )
	{
		if( (Slotst->credit - (3 - Slotst->bet)) >= 0 )
		{
			for( d = Slotst->bet; d < 3; SetBetLineLightBetPoint(d), d++ );
			Slotst->credit -= 3 - Slotst->bet;
			Slotst->bet = 3;
			Slotst->seq_no = SEQNO_GAME_START;
			SePlay( SE_REGI );
			return( 0 );
		}
		else
		{
			Slotst->seq_no = SEQNO_BATBET3_MSG_SET;
			return( 0 );
		}
	}

	if( TRG(D_KEY) && Slotst->credit )
	{
		SePlay( SE_REGI );
		SetBetLineLightBetPoint( Slotst->bet );
		Slotst->credit--;
		Slotst->bet++;
	}

	if( Slotst->bet >= 3 || (Slotst->bet && TRG(A_BUTTON)) )
	{
		Slotst->seq_no = SEQNO_GAME_START;
	}

	if( TRG(B_BUTTON) )
	{
		Slotst->seq_no = SEQNO_GAME_END_MSG_SET;
	}

	return( 0 );
}

//------------------------------------------
//	Ω€Øƒ 3ñáä|ÇØïsâ¬“Øæ∞ºﬁæØƒ
//------------------------------------------
static u8 SlotTask_BatBet3MsgSet( TASK_TABLE *task )
{
	NMenuTalkWinWrite();
	NMenuMsgWrite( SlotMsgBatBet3, 4, 15 );

	Slotst->seq_no = SEQNO_BATBET3_MSG_WAIT;

	return( 0 );
}

//------------------------------------------
//	Ω€Øƒ 3ñáä|ÇØïsâ¬“Øæ∞ºﬁ≥™≤ƒ
//------------------------------------------
static u8 SlotTask_BatBet3MsgWait( TASK_TABLE *task )
{
	if( TRG(A_BUTTON|B_BUTTON) )
	{
		NMenuScreenClear();
		Slotst->seq_no = SEQNO_BET;
	}

	return( 0 );
}

//------------------------------------------
//	Ω€Øƒ¿Ω∏ ê‡ñæâÊñ 
//------------------------------------------
static u8 SlotTask_ExplainWait( TASK_TABLE *task )
{
	if( CheckExplainTask() )
	{
		Slotst->seq_no = SEQNO_BET;
	}

	return( 0 );
}

//------------------------------------------
//	Ω€Øƒ πﬁ∞—Ω¿∞ƒ
//------------------------------------------
static u8 SlotTask_GameStart( TASK_TABLE *task )
{
	SetLottery();										// íäëI
	ClearLcAnime();										// âtèª∏ÿ±
	SetReelControlScroll( 0 );							// ÿ∞ŸâÒì]æØƒ
	SetReelControlScroll( 1 );
	SetReelControlScroll( 2 );

	task->work[0] = 0;									// ≥™≤ƒ‹∞∏
	
	if( Slotst->lottery_bit & LOTTERY_HITBIT_BD )
	{
		SetInazumaCutinTask();
		Slotst->seq_no = SEQNO_BDTIME_LOTTERY;
	}
	else
	{
		SetLcAnime( LCANM_Stop );
		Slotst->seq_no = SEQNO_REEL_SPIN_WAIT;
	}

	Slotst->reel_speed = REEL_SPEED_DEFAULT;

	if( Slotst->bd_time )
	{
		Slotst->reel_speed = GetLotteryBDTimeReelSpeed();
	}

//----
#ifdef PM_DEBUG
//----
	if( SlotDebugSw )
	{
		SlotDebugCount( &Slotst->d_mawasi_count, 1 );
	}
//----
#endif
//----

	return( 0 );
}

//------------------------------------------
//	Ω€Øƒ BDíäëI
//------------------------------------------
static u8 SlotTask_BDTimeLottery( TASK_TABLE *task )
{
	if( CheckInazumaCutinTask() )
	{
		SetLcAnime( LCANM_Stop );
		Slotst->lottery_bit &= LOTTERY_HITBIT_BD_CLS;
		Slotst->seq_no = SEQNO_REEL_SPIN_WAIT;
	}

	return( 0 );
}

//------------------------------------------
//	Ω€Øƒ äJén≥™≤ƒ
//------------------------------------------
static u8 SlotTask_ReelSpinWait( TASK_TABLE *task )
{
	if( ++task->work[0] >= 30 )
	{
#ifdef PM_DEBUG
		if( SlotDebugSw && SlotDebugAutoSw )
		{
			SlotDebugAutoKeyWait = (pp_rand() & 31) + 1;
		}
#endif

		CheckLottery();									// íäëIÃ◊∏ﬁ¡™Ø∏
		Slotst->seq_no = SEQNO_REEL_STOP_BUTTON;
	}

	return( 0 );
}

//------------------------------------------
//	Ω€Øƒ Œﬁ¿›âüÇµ
//------------------------------------------
static u8 SlotTask_ReelStopButton( TASK_TABLE *task )
{
//----
#ifdef PM_DEBUG
	if( SlotDebugSw && SlotDebugAutoSw )
	{
		if( --SlotDebugAutoKeyWait ) return( 0 );

		SePlay( SE_JYUNI );
		SetReelControlStop( Slotst->reel_count );
		SetButtonAnimeTask( Slotst->reel_count );
		SlotDebugAutoKeyWait = (pp_rand() & 31) + 1;
		Slotst->seq_no = SEQNO_REEL_STOP_WAIT;
		return( 0 );
	}
#endif
//----

	if( TRG(A_BUTTON) )
	{
		SePlay( SE_JYUNI );
		SetReelControlStop( Slotst->reel_count );
		SetButtonAnimeTask( Slotst->reel_count );
		Slotst->seq_no = SEQNO_REEL_STOP_WAIT;
	}

	return( 0 );
}

//------------------------------------------
//	Ω€Øƒ í‚é~ë“Çø
//------------------------------------------
static u8 SlotTask_ReelStopWait( TASK_TABLE *task )
{
	if( CheckReelControlStop(Slotst->reel_count) == 0 )
	{
		Slotst->reel_count++;
		Slotst->seq_no = SEQNO_REEL_STOP_BUTTON;

		if( Slotst->reel_count >= 3 )
		{
			Slotst->seq_no = SEQNO_HIT_CHECK;
		}

		return( 1 );
	}

	return( 0 );
}

//------------------------------------------
//	Ω€Øƒ ÀØƒ¡™Ø∏
//------------------------------------------
static u8 SlotTask_ReelHitCheck( TASK_TABLE *task )
{
	Slotst->lottery_bit &= LOTTERY_HITBIT_BONUS_AND;
	CheckReelHitCheck();

#ifndef SLOT_DEBUG_ERROR_CHECK
	if( Slotst->bd_time )
	{
		Slotst->bd_time--;
		Slotst->bd_time_count++;
	}
#else
	if( Slotst->bd_time )
	{
		Slotst->bd_time--;
		Slotst->bd_time_count++;
	}
	else
	{
		SlotDebugErrorCheck();
	}
#endif

	if( Slotst->hit_bit )
	{
#ifdef PM_DEBUG
		SlotDebugCount( &Slotst->d_payout_count, Slotst->payout );
#endif
		Slotst->seq_no = SEQNO_PAYOUT;
		SetPayOutTask();
		SetPatLampTask();

		Slotst->drop_credit -= Slotst->payout;
		if( Slotst->drop_credit < 0 ) Slotst->drop_credit = 0;

		if( Slotst->hit_bit & (BIT_BIG_RED|BIT_BIG_BLUE) )
		{
			JinglePlay( MUS_ME_B_BIG );
			SetLcAnime( LCANM_BigBonus );
		}
		else if( Slotst->hit_bit & BIT_REGULAR )
		{
			JinglePlay( MUS_ME_B_BIG );
			SetLcAnime( LCANM_RegBonus );
		}
		else
		{
			JinglePlay( MUS_ME_B_SMALL );
			SetLcAnime( LCANM_Win );
		}

		if( Slotst->hit_bit & (BIT_REGULAR|BIT_BIG_RED|BIT_BIG_BLUE) )
		{
			Slotst->lottery_bit &= LOTTERY_HITBIT_BONUS_CLS;

			if( Slotst->hit_bit & (BIT_BIG_RED|BIT_BIG_BLUE) )
			{
				Slotst->bd_time = 0;
				Slotst->bd_time_count = 0;
				Slotst->before_7 = BEFORE_7_RED;
				if( Slotst->hit_bit & BIT_BIG_BLUE ) Slotst->before_7 = BEFORE_7_BLUE;
			}
		}

		if( (Slotst->hit_bit & BIT_INAZUMA) && Slotst->inazuma < 16 )
		{
			Slotst->inazuma++;
			SetInazumaGaugeUp( Slotst->inazuma );
		}
	}
	else
	{
		SetLcAnime( LCANM_Lose );
		Slotst->seq_no = SEQNO_GAME_WAIT_NEXT;
		Slotst->drop_credit += Slotst->bet;
		if( Slotst->drop_credit > 9999 ) Slotst->drop_credit = 9999;
	}

	return( 0 );
}

//------------------------------------------
//	Ω€Øƒ ï•Ç¢ñﬂÇµ
//------------------------------------------
static u8 SlotTask_PayOut( TASK_TABLE *task )
{
	if( CheckPayOutTask() )
	{
		Slotst->seq_no = SEQNO_PATLUMP_WAIT;
	}
	
	return( 0 );
}

//------------------------------------------
//	Ω€Øƒ  ﬂƒ◊›ÃﬂämîF
//------------------------------------------
static u8 SlotTask_PatLampWait( TASK_TABLE *task )
{
	if( CheckPatLampTask() )
	{
		Slotst->seq_no = SEQNO_GAME_NEXT;

		if( Slotst->hit_bit & (BIT_BIG_RED|BIT_BIG_BLUE) )
		{
			IncRecord( CNT_SLOT );
		}

		if( Slotst->hit_bit & BIT_REPLAY )
		{
			Slotst->reel_count = 0;
			Slotst->seq_no = SEQNO_GAME_START;
		}

		if( Slotst->hit_bit & BIT_INAZUMA )
		{
			Slotst->seq_no = SEQNO_INAZUMA_GAUGE_UP;
		}

		if( Slotst->bd_time && (Slotst->hit_bit & BIT_REPLAY) )
		{
			SetLcAnime( LCANM_BDTime );
			Slotst->seq_no = SEQNO_LC_BDTIME_WAIT_HITEND;
		}
	}

	return( 0 );
}

//------------------------------------------
//	Ω€Øƒ ≤≈Ωﬁœπﬁ∞ºﬁ±ØÃﬂ
//------------------------------------------
static u8 SlotTask_InazumaGaugeUp( TASK_TABLE *task )
{
	if( CheckInazumaGaugeAnime() == 0 )
	{
		Slotst->seq_no = SEQNO_GAME_NEXT;

		if( Slotst->hit_bit & BIT_REPLAY )
		{
			Slotst->seq_no = SEQNO_GAME_START;
			
			if( Slotst->bd_time )
			{
				SetLcAnime( LCANM_BDTime );
				Slotst->seq_no = SEQNO_LC_BDTIME_WAIT_HITEND;
			}
		}
	}

	return( 0 );
}

//------------------------------------------
//	Ω€Øƒ BD¿≤— ï\é¶
//------------------------------------------
static u8 SlotTask_LcBDTimeWaitNext( TASK_TABLE *task )
{
	if( CheckLcAnime() )
	{
		Slotst->seq_no = SEQNO_GAME_NEXT;

		if( Slotst->hit_bit & BIT_REPLAY )
		{
			Slotst->seq_no = SEQNO_GAME_START;
		}
	}

	return( 0 );
}

//------------------------------------------
//	Ω€Øƒ ñﬂÇÈ
//------------------------------------------
static u8 SlotTask_ReturnToNext( TASK_TABLE *task )
{
	SetBetLineLightOutBetPoint( 0 );
	SetBetLineLightOutBetPoint( 1 );
	SetBetLineLightOutBetPoint( 2 );

	Slotst->seq_no = SEQNO_GAME_INIT;

	return( 0 );
}

//------------------------------------------
//	Ω€Øƒ ≥™≤ƒ -> ñﬂÇÈ
//------------------------------------------
static u8 SlotTask_WaitReturnToNext( TASK_TABLE *task )
{
	if( ++task->work[1] > 64 )
	{
		task->work[1] = 0;
		Slotst->seq_no = SEQNO_GAME_NEXT;
	}
	
	return( 0 );
}

//------------------------------------------
//	Ω€Øƒ èIóπ“Øæ∞ºﬁæØƒ
//------------------------------------------
static u8 SlotTask_EndMsgSet( TASK_TABLE *task )
{
	NMenuTalkWinWrite();
	NMenuMsgWrite( SlotMsgGameEnd, 4, 15 );
	YesNoSelectInit( 21, 7 );

	Slotst->seq_no = SEQNO_GAME_END_YESNO;

	return( 0 );
}

//------------------------------------------
//	Ω€Øƒ èIóπ“Øæ∞ºﬁ ÇÕÇ¢,Ç¢Ç¢Ç¶
//------------------------------------------
static u8 SlotTask_EndMsgYesNo( TASK_TABLE *task )
{
	s8 flag;

	flag = YesNoSelectMain();

	if( flag == CURSOR_YES_VALUE )
	{
		NMenuScreenClear();
		SetBetLineLightOutBetPoint( 0 );
		SetBetLineLightOutBetPoint( 1 );
		SetBetLineLightOutBetPoint( 2 );
		Slotst->credit += Slotst->bet;
		Slotst->seq_no = SEQNO_END_SET;
	}
	else if( flag == CURSOR_NO_VALUE || flag == CURSOR_CANCEL_VALUE )
	{
		NMenuScreenClear();
		Slotst->seq_no = SEQNO_BET;
	}

	return( 0 );
}

//------------------------------------------
//	Ω€Øƒ ∏⁄ºﬁØƒ9999“Øæ∞ºﬁæØƒ
//------------------------------------------
static u8 SlotTask_Credit9999MsgSet( TASK_TABLE *task )
{
	NMenuTalkWinWrite();
	NMenuMsgWrite( SlotMsgCredit9999, 4, 15 );
	
	Slotst->seq_no = SEQNO_CREDIT_9999_MSG_WAIT;

	return( 0 );
}

//------------------------------------------
//	Ω€Øƒ ∏⁄ºﬁØƒêÿÇÍ“Øæ∞ºﬁ≥™≤ƒ
//------------------------------------------
static u8 SlotTask_Credit9999MsgWait( TASK_TABLE *task )
{
	if( TRG(A_BUTTON|B_BUTTON) )
	{
		NMenuScreenClear();
		Slotst->seq_no = SEQNO_BET;
	}

	return( 0 );
}

//------------------------------------------
//	Ω€Øƒ ∏⁄ºﬁØƒêÿÇÍ“Øæ∞ºﬁæØƒ
//------------------------------------------
static u8 SlotTask_CreditNothingMsgSet( TASK_TABLE *task )
{
	NMenuTalkWinWrite();
	NMenuMsgWrite( SlotMsgCreditNothing, 4, 15 );

	Slotst->seq_no = SEQNO_CREDIT_0_MSG_WAIT;

	return( 0 );
}

//------------------------------------------
//	Ω€Øƒ ∏⁄ºﬁØƒêÿÇÍ“Øæ∞ºﬁ≥™≤ƒ
//------------------------------------------
static u8 SlotTask_CreditNothingMsgWait( TASK_TABLE *task )
{
	if( TRG(A_BUTTON|B_BUTTON) )
	{
		NMenuScreenClear();
		Slotst->seq_no = SEQNO_END_SET;
	}

	return( 0 );
}

//------------------------------------------
//	Ω€Øƒ èIóπæØƒ
//------------------------------------------
static u8 SlotTask_EndSet( TASK_TABLE *task )
{
#ifdef PM_DEBUG
	if( SlotDebugSw == 0 ) Fld.my_coin = Slotst->credit;
#else
	Fld.my_coin = Slotst->credit;
#endif

	PaletteFadeReq( 0xffffffff, 0, 0, 16, 0 );
	Slotst->seq_no++;
	return( 0 );
}

//------------------------------------------
//	Ω€Øƒ èIóπ
//------------------------------------------
static u8 SlotTask_End( TASK_TABLE *task )
{
	if( FadeData.fade_sw == 0 )
	{
		MainProcChange( Slotst->rec_proc );
	}
	
	return( 0 );
}

//----
#ifdef PM_DEBUG
//----
//------------------------------------------
//	Ω€Øƒ√ﬁ ﬁØ∏ﬁ“∆≠∞
//------------------------------------------
static u8 DebugSlotTask_MenuWait( TASK_TABLE *task )
{
	if( CheckDebugSlotMenuTask() )
	{
		Slotst->seq_no = SEQNO_BET;
	}

	return( 0 );
}
//----
#endif
//----

//======================================================================
//		íäëI
//======================================================================
static u8 CheckLotteryBonusA( void );
static u8 CheckLotteryBonusB( void );
static u8 CheckLotterySmallRole( void );

//------------------------------------------
//	íäëI
//------------------------------------------
static void SetLottery( void )
{
	u8 flag;

	if( Slotst->bd_time )								// BD íÜ
	{
		return;
	}

//----
#ifdef PM_DEBUG

#if SLOT_DEBUG_BD_CHECK									// BD √ﬁ ﬁØ∏ﬁ
	if( SlotDebugAutoSw )
	{
		Slotst->lottery_bit = LOTTERY_HITBIT_BD;
		flag = CheckLotterySmallRole();
		
		if( flag != LOTTERY_S_NOTHING )
		{
			Slotst->lottery_bit |= LotterySmallRole_HitBit[flag];
		}

		return;
	}
#endif

	if( SlotDebugSw && SlotDebugLotterySw )
	{
		Slotst->lottery_bit = SlotDebugLotteryHitBit;
		SlotDebugLotterySw = 0;
		SlotDebugLotteryHitBit = 0;

		if( Slotst->lottery_bit & LOTTERY_HITBIT_BIG )
			SlotDebugCount( &Slotst->d_big_hit_count, 1 );
		if( Slotst->lottery_bit & LOTTERY_HITBIT_REG )
			SlotDebugCount( &Slotst->d_reg_hit_count, 1 );
		if( Slotst->lottery_bit & LOTTERY_HITBIT_BD )
			SlotDebugCount( &Slotst->d_bd_hit_count, 1 );
		if( Slotst->lottery_bit & LOTTERY_HITBIT_INAZUMA )
			SlotDebugCount( &Slotst->d_inazuma_hit_count, 1 );
		if( Slotst->lottery_bit & LOTTERY_HITBIT_12 )
			SlotDebugCount( &Slotst->d_ruriri_hit_count, 1 );
		if( Slotst->lottery_bit & LOTTERY_HITBIT_6 )
			SlotDebugCount( &Slotst->d_hasubo_hit_count, 1 );
		if( Slotst->lottery_bit & LOTTERY_HITBIT_REPLAY )
			SlotDebugCount( &Slotst->d_replay_hit_count, 1 );
		if( Slotst->lottery_bit & LOTTERY_HITBIT_CHERRY )
			SlotDebugCount( &Slotst->d_cherry_hit_count, 1 );

		return;
	}
#endif
//----

	if( Slotst->lottery_bit & LOTTERY_HITBIT_BONUS_AND )
	{
		return;											// BIG or REG
	}

	if( CheckLotteryBonusA() )							// Œﬁ∞≈ΩíäëI A
	{
		flag = CheckLotteryBonusB();					// Œﬁ∞≈ΩíäëI B

		if( flag != LOTTERY_B_NOTHING )
		{
			Slotst->lottery_bit |= LotteryBonusB_HitBit[flag];
//----
#ifdef PM_DEBUG
			if( Slotst->lottery_bit & LOTTERY_HITBIT_BIG )
				SlotDebugCount( &Slotst->d_big_hit_count, 1 );
			if( Slotst->lottery_bit & LOTTERY_HITBIT_REG )
				SlotDebugCount( &Slotst->d_reg_hit_count, 1 );
			if( Slotst->lottery_bit & LOTTERY_HITBIT_BD )
				SlotDebugCount( &Slotst->d_bd_hit_count, 1 );
#endif
//----
			if( flag != LOTTERY_B_BD )					// BD->äOÇÍÇΩèÍçáÇÃéqñ
			{
				return;
			}
		}
	}

	flag = CheckLotterySmallRole();

	if( flag != LOTTERY_S_NOTHING )
	{
		Slotst->lottery_bit |= LotterySmallRole_HitBit[flag];
//----
#ifdef PM_DEBUG
		if( Slotst->lottery_bit & LOTTERY_HITBIT_INAZUMA )
			SlotDebugCount( &Slotst->d_inazuma_hit_count, 1 );
		if( Slotst->lottery_bit & LOTTERY_HITBIT_12 )
			SlotDebugCount( &Slotst->d_ruriri_hit_count, 1 );
		if( Slotst->lottery_bit & LOTTERY_HITBIT_6 )
			SlotDebugCount( &Slotst->d_hasubo_hit_count, 1 );
		if( Slotst->lottery_bit & LOTTERY_HITBIT_REPLAY )
			SlotDebugCount( &Slotst->d_replay_hit_count, 1 );
		if( Slotst->lottery_bit & LOTTERY_HITBIT_CHERRY )
			SlotDebugCount( &Slotst->d_cherry_hit_count, 1 );
#endif
//----
	}
}

//------------------------------------------
//	íäëIÃ◊∏ﬁ¡™Ø∏
//------------------------------------------
static void CheckLottery( void )
{
	Slotst->hit_slip = 0;

	if( Slotst->lottery_bit )
	{
		Slotst->hit_slip = 1;
	}
}

//------------------------------------------
//	íäëIÃ◊∏ﬁ -> äGïø
//------------------------------------------
static u8 GetLotteryPattern( u8 lottery_bit )
{
	u8 i;

	for( i = 0; i < 8; lottery_bit >>= 1, i++ )
	{
		if( lottery_bit & 0x01 )
		{
			return( LotteryPattern[i] );
		}
	}

	return( 0 );
}

//------------------------------------------
//	Œﬁ∞≈ΩíäëI A
//------------------------------------------
static u8 CheckLotteryBonusA( void )
{
	u8 rnd,hit;

	rnd = pp_rand() & 0xff;
	hit = LotteryBonusA[Slotst->hard][Slotst->bet-1];

	if( hit > rnd )
	{
		return( 1 );
	}

	return( 0 );
}

//------------------------------------------
//	Œﬁ∞≈ΩíäëI B
//------------------------------------------
static u8 CheckLotteryBonusB( void )
{
	s16 i,rnd,hit;

	for( i = LOTTERY_B_START_NO; i < LOTTERY_B_END_NO; i++ )
	{
		rnd = pp_rand() & 0xff;
		hit = LotteryBonusB[i][Slotst->hard];

		if( hit > rnd )
		{
			break;
		}
	}

	return( i );
}

//------------------------------------------
//	éqñíäëI
//------------------------------------------
static u8 CheckLotterySmallRole( void )
{
	s16 i,rnd,hit;
	
	for( i = LOTTERY_S_INAZUMA; i < LOTTERY_S_NOTHING; i++ )
	{
		rnd = pp_rand() & 0xff;
		hit = LotterySmallRole[i][Slotst->hard];

		if( i == LOTTERY_S_INAZUMA && Slotst->before_7 == BEFORE_7_BLUE )
		{
			hit += 10;
			if( hit > 256 ) hit = 256;
		}
		else if( i == LOTTERY_S_REPLAY && Slotst->before_7 == BEFORE_7_BLUE )
		{
			hit -= 10;
			if( hit < 0 ) hit = 0;
		}
		
		if( hit > rnd )
		{
			break;
		}
	}

	return( i );
}

//------------------------------------------
//	BD íäëIéÊÇËèoÇµ
//------------------------------------------
static u8 GetLotteryBD( u8 count )
{
	if( Slotst->before_7 == BEFORE_7_RED )
		return( LotteryBDRed[count][Slotst->inazuma] );

	return( LotteryBDBlue[count][Slotst->inazuma] );
}

//------------------------------------------
//	BDíäëI
//------------------------------------------
static void SetLotteryBD( void )
{
	u8 rnd;
	s16 i;

	Slotst->lottery_bd_time = 0;

	rnd = pp_rand() & 0xff;
	if( rnd < GetLotteryBD(0) ) return;

	for( i = 5; i > 0; i-- )
	{
		rnd = pp_rand() & 0xff;
		if( rnd < GetLotteryBD(i) ) break;
	}

	Slotst->lottery_bd_time = i;
}

//------------------------------------------
//	BDîöî≠
//------------------------------------------
static u8 GetLotteryBDBom( u16 n )
{
	u16 rnd,hit;

	rnd = pp_rand() & 0xff;
	hit = LotteryBDBom[n];

	if( rnd < hit )
	{
		return( 1 );
	}

	return( 0 );
}

//------------------------------------------
//	BD¿≤—ë¨ìx
//------------------------------------------
static s16 GetLotteryBDTimeReelSpeed( void )
{
	u8 flag,rnd,hit;

	flag = 0;

	if( Slotst->drop_credit >= 300 )		flag = 4;
	else if( Slotst->drop_credit >= 250 )	flag = 3;
	else if( Slotst->drop_credit >= 200 )	flag = 2;
	else if( Slotst->drop_credit >= 150 )	flag = 1;

	rnd = pp_rand() % 100;
	hit = LotteryBDTimeReelSpeed[flag][0];
	if( rnd < hit ) return( 4 );

	rnd = pp_rand() % 100;
	hit = LotteryBDTimeReelSpeed[flag][1] +
			LotteryBDTimeReelSpeedCorrect[Slotst->bd_time_count];
	if( rnd < hit ) return( 2 );

	return( 8 );
}

//======================================================================
//		ìñÇËîªíË
//======================================================================
static void ReelHitCheckBet1( void );
static void ReelHitCheckBet2( void );
static void ReelHitCheckBet3( void );
static u8 HitCheckPattern( u8, u8, u8 );

//------------------------------------------
//	ìñÇËîªíËèàóù¡™Ø∏
//------------------------------------------
static void CheckReelHitCheck( void )
{
	Slotst->hit_bit = 0;

	ReelHitCheckBet1();
	if( Slotst->bet > 1 ) ReelHitCheckBet2();
	if( Slotst->bet > 2 ) ReelHitCheckBet3();
}

//------------------------------------------
//	ìñÇËîªíË 1ñá
//------------------------------------------
static void ReelHitCheckBet1( void )
{
	u8 p0,p1,p2,hit;

	p0 = GetReelPattern( 0, 2 );
	p1 = GetReelPattern( 1, 2 );
	p2 = GetReelPattern( 2, 2 );
	hit = HitCheckPattern( p0, p1, p2 );

	if( hit != NO_HIT )
	{
		Slotst->payout += Payout[hit];
		Slotst->hit_bit |= HitReelBit[hit];
		SetBetLineAnime( BETLINE_1 );
	}
}

//------------------------------------------
//	ìñÇËîªíË 2ñá
//------------------------------------------
static void ReelHitCheckBet2( void )
{
	u8 p0,p1,p2,hit;

	p0 = GetReelPattern( 0, 1 );
	p1 = GetReelPattern( 1, 1 );
	p2 = GetReelPattern( 2, 1 );
	hit = HitCheckPattern( p0, p1, p2 );

	if( hit != NO_HIT )									
	{
		if( hit == HIT_CHERRY ) hit = HIT_CHERRY_4;		// è„â∫íi¡™ÿ∞
		Slotst->payout += Payout[hit];
		Slotst->hit_bit |= HitReelBit[hit];
		SetBetLineAnime( BETLINE_2_0 );
	}

	p0 = GetReelPattern( 0, 3 );
	p1 = GetReelPattern( 1, 3 );
	p2 = GetReelPattern( 2, 3 );
	hit = HitCheckPattern( p0, p1, p2 );
	
	if( hit != NO_HIT )
	{
		if( hit == HIT_CHERRY ) hit = HIT_CHERRY_4;
		Slotst->payout += Payout[hit];
		Slotst->hit_bit |= HitReelBit[hit];
		SetBetLineAnime( BETLINE_2_1 );
	}
}

//------------------------------------------
//	ìñÇËîªíË 3ñá
//------------------------------------------
static void ReelHitCheckBet3( void )
{
	u8 p0,p1,p2,hit;

	p0 = GetReelPattern( 0, 1 );
	p1 = GetReelPattern( 1, 2 );
	p2 = GetReelPattern( 2, 3 );
	hit = HitCheckPattern( p0, p1, p2 );

	if( hit != NO_HIT )
	{
		if( hit != HIT_CHERRY )							// ¡™ÿ∞ÇÕ2Ç≈¡™Ø∏çœÇ›
		{
			Slotst->payout += Payout[hit];
			Slotst->hit_bit |= HitReelBit[hit];
		}

		SetBetLineAnime( BETLINE_3_0 );
	}

	p0 = GetReelPattern( 0, 3 );
	p1 = GetReelPattern( 1, 2 );
	p2 = GetReelPattern( 2, 1 );
	hit = HitCheckPattern( p0, p1, p2 );

	if( hit != NO_HIT )
	{
		if( hit != HIT_CHERRY )
		{
			Slotst->payout += Payout[hit];
			Slotst->hit_bit |= HitReelBit[hit];
		}

		SetBetLineAnime( BETLINE_3_1 );
	}
}

//------------------------------------------
//	äGïøìñÇËîªíË
//------------------------------------------
static u8 HitCheckPattern( u8 p0, u8 p1, u8 p2 )
{
	if( p0 == p1 && p0 == p2 )
	{
		return( HitReelPattern[p0] );
	}

	if( (p0 == CELL_BIG_R && p1 == CELL_BIG_R && p2 == CELL_BIG_B) ||
		(p0 == CELL_BIG_B && p1 == CELL_BIG_B && p2 == CELL_BIG_R) )
	{
		return( HIT_REGULAR );
	}

	if( p0 == CELL_CHERRY )
	{
		return( HIT_CHERRY );
	}

	return( NO_HIT );
}

//======================================================================
//		ï•Ç¢ñﬂÇµ
//======================================================================
static void PayOutTask( u8 no );
static u8 PayOut0( TASK_TABLE * );
static u8 PayOut1( TASK_TABLE * );
static u8 PayOut2( TASK_TABLE * );

//------------------------------------------
//	ï•Ç¢ñﬂÇµ¿Ω∏æØƒ
//------------------------------------------
static void SetPayOutTask( void )
{
	u8 i;

	i = AddTask( PayOutTask, TASKPRI_PAYOUT );
	PayOutTask( i );
}

//------------------------------------------
//	ï•Ç¢ñﬂÇµ¡™Ø∏
//------------------------------------------
static u8 CheckPayOutTask( void )
{
	if( CheckTaskNo(PayOutTask) == NOT_EXIST_TASK_ID )
	{
		return( 1 );
	}

	return( 0 );
}

//------------------------------------------
//	ìñÇËîªíËèàóù√∞ÃﬁŸ
//------------------------------------------
static u8 (* const PayOutTaskTbl[])( TASK_TABLE * ) =
{
	PayOut0,
	PayOut1,
	PayOut2,
};

//------------------------------------------
//	ìñÇËîªíËèàóù¿Ω∏
//------------------------------------------
static void PayOutTask( u8 no )
{
	while( PayOutTaskTbl[TaskTable[no].work[0]](&TaskTable[no]) );
}

//------------------------------------------
//	ï•Ç¢ñﬂÇµ 0
//------------------------------------------
static u8 PayOut0( TASK_TABLE *task )
{
	if( CheckBetLineAnimeStart() )
	{
		task->work[0]++;

		if( Slotst->payout == 0 )
		{
			task->work[0] = 2;
			return( 1 );
		}
	}

	return( 0 );
}

//------------------------------------------
//	ï•Ç¢ñﬂÇµ 1
//------------------------------------------
static u8 PayOut1( TASK_TABLE *task )
{
	if( task->work[1]-- == 0 )
	{
		if( JingleWait() ) SePlay( SE_PIN ); 
		Slotst->payout--;
		if( Slotst->credit < 9999 ) Slotst->credit++;

		task->work[1] = 8;
		if( CONT(A_BUTTON) ) task->work[1] >>= 1;
	}

	if( JingleWait() && TRG(START_BUTTON) )
	{
		SePlay( SE_PIN ); 
		Slotst->credit += Slotst->payout;
		if( Slotst->credit > 9999 ) Slotst->credit = 9999;
		Slotst->payout = 0;
	}

	if( Slotst->payout == 0 )
	{
		task->work[0]++;
	}

	return( 0 );
}

//------------------------------------------
//	ï•Ç¢ñﬂÇµ 2
//------------------------------------------
static u8 PayOut2( TASK_TABLE *task )
{
	if( CheckBetLineAnimeEnd() )
	{
		DelTask( CheckTaskNo(PayOutTask) );
	}
	
	return( 0 );
}

//======================================================================
//		ÿ∞Ÿ		
//======================================================================
//------------------------------------------
//	äGïøéÊìæ
//------------------------------------------
static u8 GetReelPattern( u8 no, s16 offs )
{
	s16 pos;

	pos = (Slotst->reel_gy[no] + offs) % REEL_PT_MAX;

	if( pos < 0 )
	{
		pos = REEL_PT_MAX + pos;
	}

	return( ReelPattern[no][pos] );
}

//------------------------------------------
//	äGïøéÊìæ ∏ﬁÿØƒﬁèCê≥
//------------------------------------------
static u8 GetReelPatternGrid( u8 no, s16 offs )
{
	s16 diff;

	diff = 0;

	if( Slotst->reel_dy[no] % REEL_PT_V_SIZE )
	{
		diff--;
	}

	return( GetReelPattern(no,offs+diff) );
}

//------------------------------------------
//	œº›ÿ∞ŸäGïøéÊìæ
//------------------------------------------
static u8 GetMachineReelPattern( s16 offs )
{
	s16 pos;

	pos = (Slotst->machine_reel_gy + offs) % MCREEL_PT_MAX;

	if( pos < 0 )
	{
		pos = MCREEL_PT_MAX + pos;
	}

	return( MachineReelPattern[pos] );
}

//------------------------------------------
//	ÿ∞ŸâÒì]
//------------------------------------------
static void SetReelScroll( u8 no, s16 y )
{
	Slotst->reel_dy[no] += y;
	Slotst->reel_dy[no] %= REEL_SCROLL_MAX;
	Slotst->reel_gy[no] = REEL_PT_MAX - REEL_PT_V_GP( Slotst->reel_dy[no] );
}

//------------------------------------------
//	ÿ∞ŸâÒì] ∏ﬁÿØƒﬁ
//------------------------------------------
static s16 SetReelGridScroll( u8 no, s16 y )
{
	s16 d;

	d = Slotst->reel_dy[no] % REEL_PT_V_SIZE;

	if( d )
	{
		if( d < y ) y = d;

		SetReelScroll( no, y );
		d = Slotst->reel_dy[no] % REEL_PT_V_SIZE;
	}

	return( d );
}

//------------------------------------------
//	œº›ÿ∞ŸâÒì]
//------------------------------------------
static void SetMachineReelScroll( s16 y )
{
	Slotst->machine_reel_dy += y;
	Slotst->machine_reel_dy %= MCREEL_SCROLL_MAX;
	Slotst->machine_reel_gy = MCREEL_PT_MAX - MCREEL_PT_V_GP( Slotst->machine_reel_dy );
}

//------------------------------------------
//	œº›ÿ∞ŸâÒì] ∏ﬁÿØƒﬁ
//------------------------------------------
static s16 SetMachineReelGridScroll( s16 y )
{
	s16 d;

	d = Slotst->machine_reel_dy % MCREEL_PT_V_SIZE;

	if( d )
	{
		if( d < y ) y = d;
		SetMachineReelScroll( y );
		d = Slotst->machine_reel_dy % MCREEL_PT_V_SIZE;
	}

	return( d );
}

//======================================================================
//		ÿ∞Ÿêßå‰
//======================================================================
static void ReelControlTask( u8 );
static u8 ReelControl0( TASK_TABLE * );
static u8 ReelControl1( TASK_TABLE * );
static u8 ReelControl2( TASK_TABLE * );
static u8 ReelControl3( TASK_TABLE * );
static u8 ReelControl4( TASK_TABLE * );
static u8 SetReelStop0_HitSlip( void );
static u8 SetReelStop0_HitSlipBet1( u8, u8 );
static u8 SetReelStop0_HitSlipBet2or3( u8, u8 );
static u8 SetReelStop1_HitSlip( void );
static u8 SetReelStop1_HitSlipBet1or2( void );
static u8 SetReelStop1_HitSlipBet3( void );
static u8 SetReelStop2_HitSlip( void );
static u8 SetReelStop2_HitSlipBet1or2( u8 );
static u8 SetReelStop2_HitSlipBet3( u8 );
static void SetReelStop0_MissSlip( void );
static void SetReelStop1_MissSlip( void );
static void SetReelStop1_MissSlipBet1( void );
static void SetReelStop1_MissSlipBet2( void );
static void SetReelStop1_MissSlipBet3( void );
static void SetReelStop2_MissSlip( void );
static void SetReelStop2_MissSlipBet1( void );
static void SetReelStop2_MissSlipBet2( void );
static void SetReelStop2_MissSlipBet3( void );

//------------------------------------------
//	ÿ∞Ÿêßå‰¿Ω∏æØƒ
//------------------------------------------
static void SetReelControlTask( void )
{
	u8 i,no;

	for( i = 0; i < 3; i++ )
	{
		no = AddTask( ReelControlTask, TASKPRI_REEL );
		TaskTable[no].work[15] = i;
		Slotst->taskno_reel[i] = no;
		ReelControlTask( no );
	}
}

//------------------------------------------
//	ÿ∞ŸâÒì]æØƒ
//------------------------------------------
static void SetReelControlScroll( u8 no )
{
	TaskTable[Slotst->taskno_reel[no]].work[0] = 1;
	TaskTable[Slotst->taskno_reel[no]].work[14] = 1;
}

//------------------------------------------
//	ÿ∞Ÿí‚é~æØƒ
//------------------------------------------
static void SetReelControlStop( u8 no )
{
	TaskTable[Slotst->taskno_reel[no]].work[0] = 2;
}

//------------------------------------------
//	ÿ∞Ÿí‚é~¡™Ø∏
//------------------------------------------
static u8 CheckReelControlStop( u8 no )
{
	return( TaskTable[Slotst->taskno_reel[no]].work[14] );
}

//------------------------------------------
//	ÿ∞Ÿêßå‰¿Ω∏√∞ÃﬁŸ
//------------------------------------------
static u8 (* const ReelControlTaskTbl[])( TASK_TABLE * ) =
{
	ReelControl0,
	ReelControl1,
	ReelControl2,
	ReelControl3,
	ReelControl4,
};

//------------------------------------------
//	ÿ∞Ÿêßå‰¿Ω∏
//------------------------------------------
static void ReelControlTask( u8 no )
{
	while( ReelControlTaskTbl[TaskTable[no].work[0]](&TaskTable[no]) );
}

//------------------------------------------
//	ÿ∞Ÿêßå‰ 0 êßå‰ñ≥Çµ
//------------------------------------------
static u8 ReelControl0( TASK_TABLE *task )
{
	return( 0 );
}

//------------------------------------------
//	ÿ∞Ÿêßå‰ 1 âÒì]
//------------------------------------------
static u8 ReelControl1( TASK_TABLE *task )
{
	SetReelScroll( task->work[15], Slotst->reel_speed );
	return( 0 );
}

//------------------------------------------
//	ÿ∞Ÿí‚é~èàóù√∞ÃﬁŸ
//------------------------------------------
static u8 (* const SetReelStopHitSlipTbl[])( void ) =
{
	SetReelStop0_HitSlip,
	SetReelStop1_HitSlip,
	SetReelStop2_HitSlip,
};

static void (* const SetReelStopMissSlipTbl[])( void ) =
{
	SetReelStop0_MissSlip,
	SetReelStop1_MissSlip,
	SetReelStop2_MissSlip,
};

//------------------------------------------
//	ÿ∞Ÿêßå‰ 2 í‚é~æØƒ
//------------------------------------------
static u8 ReelControl2( TASK_TABLE *task )
{
	task->work[0]++;
	Slotst->reel_hit_gy[task->work[15]] = 0;			// ÀØƒà íu∏ÿ±
	Slotst->reel_slip_gy[task->work[15]] = 0;			// ΩÕﬁÿ∏ÿ±

	if( Slotst->bd_time == 0 )
	{
		if( Slotst->lottery_bit == 0 || Slotst->hit_slip == 0 ||
			SetReelStopHitSlipTbl[task->work[15]]() == 0 )
		{
			Slotst->hit_slip = 0;
			SetReelStopMissSlipTbl[task->work[15]]();
		}
	}

	task->work[1] = Slotst->reel_slip_gy[task->work[15]];

	return( 1 );
}

//------------------------------------------
//	ÿ∞Ÿêßå‰ 3 í‚é~
//------------------------------------------
static u8 ReelControl3( TASK_TABLE *task )
{
	s16 d;
	s16 tbl[5] = { 2, 4, 4, 4, 8 };

	d = Slotst->reel_dy[task->work[15]] % REEL_PT_V_SIZE;

	if( d )
	{
		d = SetReelGridScroll( task->work[15], Slotst->reel_speed );
	}
	else if( Slotst->reel_slip_gy[task->work[15]] )
	{
		Slotst->reel_slip_gy[task->work[15]]--;
		SetReelScroll( task->work[15], Slotst->reel_speed );
		d = Slotst->reel_dy[task->work[15]] % REEL_PT_V_SIZE;
	}

	if( d == 0 && Slotst->reel_slip_gy[task->work[15]] == 0 )
	{
		task->work[0]++;
		task->work[1] = tbl[task->work[1]];
		task->work[2] = 0;
	}

	return( 0 );
}

//------------------------------------------
//	ÿ∞Ÿêßå‰ 4 í‚é~êUìÆ
//------------------------------------------
static u8 ReelControl4( TASK_TABLE *task )
{
	Slotst->reel_oy[task->work[15]] = task->work[1];

	task->work[1] = -task->work[1];
	task->work[2]++;

	if( (task->work[2]&0x03) == 0 )
	{
		task->work[1] >>= 1;
	}

	if( task->work[1] == 0 )
	{
		task->work[0] = 0;
		task->work[14] = 0;								// âÒì]Ã◊∏ﬁ∏ÿ±
		Slotst->reel_oy[task->work[15]] = 0;
	}

	return( 0 );
}

//------------------------------------------
//	ÿ∞ŸΩÕﬁÿ 0 ìñÇËèàóù√∞ÃﬁŸ
//------------------------------------------
static u8 (* const SetReelStop0_HitSlipTbl[])( u8, u8 ) =
{
	SetReelStop0_HitSlipBet1,
	SetReelStop0_HitSlipBet2or3,
	SetReelStop0_HitSlipBet2or3
};

//------------------------------------------
//	ÿ∞ŸΩÕﬁÿ 0 ìñÇË
//------------------------------------------
static u8 SetReelStop0_HitSlip( void )
{
	u8 hit0,hit1;

	hit0 = GetLotteryPattern( Slotst->lottery_bit );
	hit1 = hit0;

	if( Slotst->lottery_bit & LOTTERY_HITBIT_BONUS_AND )
	{
		hit0 = CELL_BIG_R;								// ÀﬁØ∏ﬁ,⁄∑ﬁ≠◊∞
		hit1 = CELL_BIG_B;
	}

	return( SetReelStop0_HitSlipTbl[Slotst->bet-1](hit0,hit1) );
}

//------------------------------------------
//	ÿ∞Ÿ0 ΩÕﬁÿ ìñÇËîªíË
//------------------------------------------
static u8 Reel0PatternHitCheck( s16 offs, u8 hit0, u8 hit1 )
{
	u8 pat;

	pat = GetReelPatternGrid( 0, offs );

	if( pat == hit0 || pat == hit1 )
	{
		Slotst->hit_pattern = pat;
		return( 1 );
	}

	return( 0 );
}

//------------------------------------------
//	ÿ∞Ÿ0 ΩÕﬁÿ íP¡™ÿ∞îªíË
//------------------------------------------
static u8 Reel0CheckCherry1( s16 offs )
{
	if( GetReelPatternGrid(0,1-offs) == CELL_CHERRY ||
		GetReelPatternGrid(0,2-offs) == CELL_CHERRY ||
		GetReelPatternGrid(0,3-offs) == CELL_CHERRY )
	{
		return( 1 );
	}

	return( 0 );
}

//------------------------------------------
//	íP¡™ÿ∞îªíË
//------------------------------------------
static u8 ReelCheckSetCherry1( void )
{
	if( (Slotst->lottery_bit & LOTTERY_HITBIT_CHERRY) ||
		(Slotst->lottery_bit & LOTTERY_HITBIT_BONUS_AND) )
	{
		return( 1 );
	}

	return( 0 );
}

//------------------------------------------
//	ÿ∞ŸΩƒØÃﬂ0 ÀØƒΩÕﬁÿ ÕﬁØƒﬁ 1
//------------------------------------------
static u8 SetReelStop0_HitSlipBet1( u8 hit0, u8 hit1 )
{
	s16 i;

	for( i = 0; i <= 4; i++ )							// àÍâ”èäÇÃÇ›
	{
		if( Reel0PatternHitCheck(2-i,hit0,hit1) )
		{
			Slotst->reel_hit_gy[0] = 2;
			Slotst->reel_slip_gy[0] = i;
			return( 1 );
		}
	}

	return( 0 );
}

//------------------------------------------
//	ÿ∞Ÿ0 ÀØƒΩÕﬁÿ ÕﬁØƒ2,3
//------------------------------------------
static u8 SetReelStop0_HitSlipBet2or3( u8 hit0, u8 hit1 )
{
	s16 i,c;

	c = ReelCheckSetCherry1();							// ¡™ÿ∞±ÿ

	if( c || Reel0CheckCherry1(0) == 0 )				// ¡™ÿ∞±ÿ or î’ñ ¡™ÿ∞ñ≥Çµ
	{
		for( i = 1; i <= 3; i++ )						// åªî’ñ 
		{
			if( Reel0PatternHitCheck(i,hit0,hit1) )
			{
				Slotst->reel_hit_gy[0] = i;
				Slotst->reel_slip_gy[0] = 0;
				return( 1 );
			}
		}
	}

	for( i = 1; i <= 4; i++ )							// ΩÕﬁÿ
	{
		if( c || Reel0CheckCherry1(i) == 0 )			// ¡™ÿ∞±ÿ or î’ñ ¡™ÿ∞ñ≥Çµ
		{
			if( Reel0PatternHitCheck(1-i,hit0,hit1) )
			{
				if( i == 1 && (c || Reel0CheckCherry1(i+2) == 0) )
				{										// ΩÕﬁÿ 1 -> â∫
					Slotst->reel_hit_gy[0] = 3;
					Slotst->reel_slip_gy[0] = i + 2;
					return( 1 );
				}

				if( i <= 3 && (c || Reel0CheckCherry1(i+1) == 0) )
				{										// ΩÕﬁÿ 2,3 -> íÜ
					Slotst->reel_hit_gy[0] = 2;
					Slotst->reel_slip_gy[0] = i + 1;
					return( 1 ); 
				}

				Slotst->reel_hit_gy[0] = 1;				// ΩÕﬁÿ 4 -> è„
				Slotst->reel_slip_gy[0] = i;
				return( 1 );
			}
		}
	}

	return( 0 );										// äOÇÍ
}

//------------------------------------------
//	ÿ∞ŸΩÕﬁÿ 1 ìñÇËèàóù√∞ÃﬁŸ
//------------------------------------------
static u8 (* const SetReelStop1_HitSlipTbl[])( void ) =
{
	SetReelStop1_HitSlipBet1or2,
	SetReelStop1_HitSlipBet1or2,
	SetReelStop1_HitSlipBet3
};

//------------------------------------------
//	ÿ∞ŸΩÕﬁÿ 1 ìñÇË
//------------------------------------------
static u8 SetReelStop1_HitSlip( void )
{
	return( SetReelStop1_HitSlipTbl[Slotst->bet-1]() );
}

//------------------------------------------
//	ÿ∞Ÿ1 ÀØƒΩÕﬁÿ ÕﬁØƒﬁ1,2
//------------------------------------------
static u8 SetReelStop1_HitSlipBet1or2( void )
{
	s16 i,pos;

	pos = Slotst->reel_hit_gy[0];						// ìñÇËà íu

	for( i = 0; i <= 4; i++ )
	{
		if( GetReelPatternGrid(1,pos-i) == Slotst->hit_pattern )
		{
			Slotst->reel_hit_gy[1] = pos;
			Slotst->reel_slip_gy[1] = i;
			return( 1 );
		}
	}

	return( 0 );										// äOÇÍ
}

//------------------------------------------
//	ÿ∞Ÿ1 ÀØƒΩÕﬁÿ ÕﬁØƒﬁ3
//------------------------------------------
static u8 SetReelStop1_HitSlipBet3( void )
{
	s16 i;

	if( SetReelStop1_HitSlipBet1or2() )					// â°ÀØƒ
	{
		if( Slotst->reel_hit_gy[0] == 2 ||
			Slotst->reel_slip_gy[1] <= 1 || Slotst->reel_slip_gy[1] == 4 )
		{
			return( 1 );								// íÜíi,ΩÕﬁÿ0,1,4
		}

		for( i = 0; i <= 4; i++ )						// ΩÕﬁÿ2,3ÇÃèÍçá,éŒÇﬂÇÃó]ínÇì¸ÇÍÇÈ
		{
			if( GetReelPatternGrid(1,2-i) == Slotst->hit_pattern )
			{
				Slotst->reel_hit_gy[1] = 2;
				Slotst->reel_slip_gy[1] = i;
				break;
			}
		}

		return( 1 );
	}

	if( Slotst->reel_hit_gy[0] != 2 )					// è„â∫íi,éŒÇﬂ±ÿ
	{
		for( i = 0; i <= 4; i++ )
		{
			if( GetReelPatternGrid(1,2-i) == Slotst->hit_pattern )
			{
				Slotst->reel_hit_gy[1] = 2;
				Slotst->reel_slip_gy[1] = i;
				return( 1 );
			}
		}
	}

	return( 0 );										// äOÇÍ
}

//------------------------------------------
//	ÿ∞ŸΩÕﬁÿ 2 ìñÇËèàóù√∞ÃﬁŸ
//------------------------------------------
static u8 (* const SetReelStop2_HitSlipTbl[])( u8 ) =
{
	SetReelStop2_HitSlipBet1or2,
	SetReelStop2_HitSlipBet1or2,
	SetReelStop2_HitSlipBet3,
};

//------------------------------------------
//	ÿ∞Ÿ2 ÀØƒΩÕﬁÿ ìñÇË
//------------------------------------------
static u8 SetReelStop2_HitSlip( void )
{
	u8 hit;

	hit = Slotst->hit_pattern;

	if( Slotst->lottery_bit & LOTTERY_HITBIT_REG )		// ⁄∑ﬁ≠◊∞
	{
		hit = CELL_BIG_R;

		if( Slotst->hit_pattern == CELL_BIG_R ) 
		{
			hit = CELL_BIG_B;
		}
	}

	return( SetReelStop2_HitSlipTbl[Slotst->bet-1](hit) );
}

//------------------------------------------
//	ÿ∞Ÿ2 ÀØƒΩÕﬁÿ ÕﬁØƒ 1,2
//------------------------------------------
static u8 SetReelStop2_HitSlipBet1or2( u8 hit )
{
	s16 i,pos;

	pos = Slotst->reel_hit_gy[1];

	for( i = 0; i <= 4; i++ )
	{
		if( GetReelPatternGrid(2,pos-i) == hit )
		{
			Slotst->reel_hit_gy[2] = pos;
			Slotst->reel_slip_gy[2] = i;
			return( 1 );
		}
	}

	return( 0 );
}

//------------------------------------------
//	ÿ∞Ÿ2 ÀØƒΩÕﬁÿ ÕﬁØƒ3
//------------------------------------------
static u8 SetReelStop2_HitSlipBet3( u8 hit )
{
	s16 i,pos;

	if( Slotst->reel_hit_gy[0] == Slotst->reel_hit_gy[1] )
	{
		return( SetReelStop2_HitSlipBet1or2(hit) );		// â°ÀØƒ
	}

	pos = 1;
	if( Slotst->reel_hit_gy[0] == 1 ) pos = 3;			// è„ÀØƒ

	for( i = 0; i <= 4; i++ )
	{
		if( GetReelPatternGrid(2,pos-i) == hit )
		{
			Slotst->reel_slip_gy[2] = i;
			Slotst->reel_hit_gy[2] = pos;
			return( 1 );
		}
	}

	return( 0 );
}

//------------------------------------------
//	ÿ∞Ÿ0 ΩÿØÃﬂ äOÇÍ
//------------------------------------------
static void SetReelStop0_MissSlip( void )
{
	s16 i;

	i = 0;

	while( 1 )
	{
		if( Reel0CheckCherry1(i) == 0 ) break;

		i++;
	}

	Slotst->reel_slip_gy[0] = i;
}

//------------------------------------------
//	ÿ∞¡ñ⁄ 
//------------------------------------------
static u8 GetCheckReachPattern( u8 *ptn )
{
	if( *ptn == CELL_BIG_R ) *ptn = CELL_BIG_B;
	else if( *ptn == CELL_BIG_B ) *ptn = CELL_BIG_R;
	else return( 0 );

	return( 1 );
}

//------------------------------------------
//	ÿ∞Ÿ1 ΩÿØÃﬂ  Ωﬁ⁄èàóù√∞ÃﬁŸ
//------------------------------------------
static void (* const SetReelStop1_MissSlipTbl[])( void ) =
{
	SetReelStop1_MissSlipBet1,
	SetReelStop1_MissSlipBet2,
	SetReelStop1_MissSlipBet3,
};

//------------------------------------------
//	ÿ∞Ÿ1 ΩÿØÃﬂ äOÇÍ
//------------------------------------------
static void SetReelStop1_MissSlip( void )
{
	SetReelStop1_MissSlipTbl[Slotst->bet-1]();
}

//------------------------------------------
//	ÿ∞Ÿ1 ΩÿØÃﬂ  Ωﬁ⁄ ÕﬁØƒ 1
//------------------------------------------
static void SetReelStop1_MissSlipBet1( void )
{
	u8 hit0;
	s16 i;

	if( Slotst->reel_hit_gy[0] && (Slotst->lottery_bit & LOTTERY_HITBIT_BIG) )
	{
		hit0 = GetReelPatternGrid( 0, 2 - Slotst->reel_slip_gy[0] );
		if( GetCheckReachPattern(&hit0) == 0 ) return;

		for( i = 0; i <= 4; i++ )
		{
			if( hit0 == GetReelPatternGrid(1,2-i) )
			{
				Slotst->reel_hit_gy[1] = 2;
				Slotst->reel_slip_gy[1] = i;
				return;
			}
		}
	}
}

//------------------------------------------
//	ÿ∞Ÿ1 ΩÿØÃﬂ  Ωﬁ⁄ ÕﬁØƒ 2
//------------------------------------------
static void SetReelStop1_MissSlipBet2( void )
{
	u8 hit0;
	s16 i;

	if( Slotst->reel_hit_gy[0] && (Slotst->lottery_bit & LOTTERY_HITBIT_BIG) )
	{
		hit0 = GetReelPatternGrid( 0, Slotst->reel_hit_gy[0] - Slotst->reel_slip_gy[0] );
		if( GetCheckReachPattern(&hit0) == 0 ) return;

		for( i = 0; i <= 4; i++ )
		{
			if( hit0 == GetReelPatternGrid(1,Slotst->reel_hit_gy[0]-i) )
			{
				Slotst->reel_hit_gy[1] = Slotst->reel_hit_gy[0];
				Slotst->reel_slip_gy[1] = i;
				return;
			}
		}
	}

}

//------------------------------------------
//	ÿ∞Ÿ1 ΩÿØÃﬂ  Ωﬁ⁄ ÕﬁØƒ 3
//------------------------------------------
static void SetReelStop1_MissSlipBet3( void )
{
	u8 hit0;
	s16 i,j;

	if( (Slotst->reel_hit_gy[0] && (Slotst->lottery_bit & LOTTERY_HITBIT_BIG)) == 0 )
	{
		return;											// ÿ∞¡ñ⁄ñ≥Çµ
	}

	if( Slotst->reel_hit_gy[0] == 2 )					// éŒÇﬂñ≥Çµ
	{
		SetReelStop1_MissSlipBet2();
		return;
	}

	hit0 = GetReelPatternGrid( 0, Slotst->reel_hit_gy[0] - Slotst->reel_slip_gy[0] );
	if( GetCheckReachPattern(&hit0) == 0 ) return;		// ÿ∞¡ñ⁄ñ≥Çµ

	i = 2;												// í≤ç∏à íu
	if( Slotst->reel_hit_gy[0] == 3 ) i = 3;

	for( j = 0; j < 2; j++, i-- )						// åªç›à íu
	{
		if( hit0 == GetReelPatternGrid(1,i) )
		{
			Slotst->reel_hit_gy[1] = i;
			Slotst->reel_slip_gy[1] = 0;
			return;
		}
	}

	for( i = 1; i <= 4; i++ )
	{
		if( hit0 == GetReelPatternGrid(1,Slotst->reel_hit_gy[0]-i) )
		{
			if( Slotst->reel_hit_gy[0] == 1 )			// 1íiñ⁄
			{
				if( i <= 2 )							// ΩÕﬁÿ1,2 -> éŒÇﬂÀØƒ
				{
					Slotst->reel_hit_gy[1] = 2;
					Slotst->reel_slip_gy[1] = i + 1;
				}
				else									// ΩÕﬁÿ3,4 -> â°ÀØƒ
				{
					Slotst->reel_hit_gy[1] = 1;
					Slotst->reel_slip_gy[1] = i;
				}
			}
			else										// éOíiñ⁄
			{
				if( i <= 2 )							// ΩÕﬁÿ1,2 -> éŒÇﬂÀØƒ
				{
					Slotst->reel_hit_gy[1] = 3;
					Slotst->reel_slip_gy[1] = i;
				}
				else									// ΩÕﬁÿ3,4 -> â°ÀØƒ
				{
					Slotst->reel_hit_gy[1] = 2;
					Slotst->reel_slip_gy[1] = i - 1;
				}
			}

			break;
		}
	}
}

//------------------------------------------
//	ÿ∞¡ñ⁄¡™Ø∏
//------------------------------------------
static u8 CheckReachPattern( u8 hit0, u8 hit1 )
{
	if( (hit0 == CELL_BIG_R && hit1 == CELL_BIG_B) ||
		(hit0 == CELL_BIG_B && hit1 == CELL_BIG_R) )
	{
		return( 1 );
	}

	return( 0 );
}

//------------------------------------------
//	ÿ∞¡ñ⁄îªíË
//------------------------------------------
static u8 CheckHitReachPattern( u8 hit0, u8 hit1, u8 hit2 )
{
	if( (hit0 == CELL_BIG_R && hit1 == CELL_BIG_B && hit2 == CELL_BIG_R) ||
		(hit0 == CELL_BIG_B && hit1 == CELL_BIG_R && hit2 == CELL_BIG_B) )
	{
		return( 1 );
	}

	return( 0 );
}

//------------------------------------------
//	 Ωﬁ⁄¡™Ø∏
//------------------------------------------
static u8 CheckMissPattern( u8 hit0, u8 hit1, u8 hit2 )
{
	if( (hit0 == CELL_BIG_R && hit1 == CELL_BIG_B && hit2 == CELL_BIG_R) ||
		(hit0 == CELL_BIG_B && hit1 == CELL_BIG_R && hit2 == CELL_BIG_B) )
	{
		return( 0 );									// ÿ∞¡ñ⁄
	}

	if( (hit0 == CELL_BIG_R && hit1 == CELL_BIG_R && hit2 == CELL_BIG_B) ||
		(hit0 == CELL_BIG_B && hit1 == CELL_BIG_B && hit2 == CELL_BIG_R) )
	{
		return( 0 );									// ⁄∑ﬁ≠◊∞
	}

	if( hit0 == hit1 && hit0 == hit2 )
	{
		return( 0 );									// ÀØƒ
	}

	return( 1 );										//  Ωﬁ⁄
}

//------------------------------------------
//	ÿ∞Ÿ2 ΩÿØÃﬂ äOÇÍèàóù√∞ÃﬁŸ
//------------------------------------------
static void (* const SetReelStop2_MissSlipTbl[])( void ) =
{
	SetReelStop2_MissSlipBet1,
	SetReelStop2_MissSlipBet2,
	SetReelStop2_MissSlipBet3
};

//------------------------------------------
//	ÿ∞Ÿ2 ΩÿØÃﬂ äOÇÍ
//------------------------------------------
static void SetReelStop2_MissSlip( void )
{
	SetReelStop2_MissSlipTbl[Slotst->bet-1]();
}

//------------------------------------------
//	ÿ∞Ÿ2 ΩÿØÃﬂ  Ωﬁ⁄ ÕﬁØƒ1
//------------------------------------------
static void SetReelStop2_MissSlipBet1( void )
{
	u8 hit0,hit1,hit2;
	s16 i;

	i = 0;
	hit0 = GetReelPatternGrid( 0, 2 - Slotst->reel_slip_gy[0] );
	hit1 = GetReelPatternGrid( 1, 2 - Slotst->reel_slip_gy[1] );

	if( hit0 == hit1 )									// ÀØƒ
	{
		while( 1 )
		{
			hit2 = GetReelPatternGrid( 2, 2 - i );

			if( hit0 != hit2 &&							//  Ωﬁ⁄ & ⁄∑ﬁ≠◊∞ëjé~
				((hit0 != CELL_BIG_R || hit2 != CELL_BIG_B) &&
				(hit0 != CELL_BIG_B || hit2 != CELL_BIG_R)) )
			{
				break;
			}

			i++;
		}
	}
	else
	{
		if( CheckReachPattern(hit0,hit1) )				// ÿ∞¡ñ⁄
		{
			if( Slotst->lottery_bit & LOTTERY_HITBIT_BIG )
			{
				for( i = 0; i <= 4; i++ )
				{
					if( hit0 == GetReelPatternGrid(2,2-i) )
					{
						Slotst->reel_slip_gy[2] = i;
						return;
					}
				}
			}

			i = 0;

			while( 1 )
			{
				hit2 = GetReelPatternGrid( 2, 2 - i );
				if( hit0 != hit2 ) break;
				i++;
			}
		}
	}

	Slotst->reel_slip_gy[2] = i;
}

//------------------------------------------
//	ÿ∞Ÿ2 ΩÿØÃﬂ  Ωﬁ⁄ ÕﬁØƒ2
//------------------------------------------
static void SetReelStop2_MissSlipBet2( void )
{
	u8 hit0,hit1,hit2;
	s16 i,slip,flag;

	slip = 0;

	if(	Slotst->reel_hit_gy[1] &&
		Slotst->reel_hit_gy[0] == Slotst->reel_hit_gy[1] &&
		(Slotst->lottery_bit & LOTTERY_HITBIT_BIG) )
	{
		hit0 = GetReelPatternGrid( 0, Slotst->reel_hit_gy[0] - Slotst->reel_slip_gy[0] );
		hit1 = GetReelPatternGrid( 1, Slotst->reel_hit_gy[1] - Slotst->reel_slip_gy[1] );

		if( CheckReachPattern(hit0,hit1) )				// ÿ∞¡ñ⁄ÀØƒ
		{
			for( i = 0; i <= 4; i++ )
			{
				hit2 = GetReelPatternGrid( 2, Slotst->reel_hit_gy[1] - i );

				if( hit0 == hit2 )
				{
					slip = i;
					break;
				}
			}
		}
	}

	while( 1 )
	{
		for( i = 1, flag = 0; i <= 3; i++ )
		{
			hit0 = GetReelPatternGrid( 0, i - Slotst->reel_slip_gy[0] );
			hit1 = GetReelPatternGrid( 1, i - Slotst->reel_slip_gy[1] );
			hit2 = GetReelPatternGrid( 2, i - slip );

			if( CheckMissPattern(hit0,hit1,hit2) == 0 )	// ÀØƒ
			{
				if( CheckHitReachPattern(hit0,hit1,hit2) &&
					(Slotst->lottery_bit & LOTTERY_HITBIT_BIG) )
				{
					continue;							// ÿ∞¡ñ⁄ÀØƒOK
				}

				flag++;
				break;
			}
		}

		if( flag == 0 ) break;
		slip++;
	}

	Slotst->reel_slip_gy[2] = slip;
}

//------------------------------------------
//	ÿ∞Ÿ2 ΩÿØÃﬂ  Ωﬁ⁄ ÕﬁØƒ3
//------------------------------------------
static void SetReelStop2_MissSlipBet3( void )
{
	u8 hit0,hit1,hit2;
	s16 i,pos;

	SetReelStop2_MissSlipBet2();						// â°æØƒ

	if(	Slotst->reel_hit_gy[1] &&						// ÿ∞¡ñ⁄±ÿ
		Slotst->reel_hit_gy[0] != Slotst->reel_hit_gy[1] &&
		(Slotst->lottery_bit & LOTTERY_HITBIT_BIG) )
	{
		hit0 = GetReelPatternGrid( 0, Slotst->reel_hit_gy[0] - Slotst->reel_slip_gy[0] );
		hit1 = GetReelPatternGrid( 1, Slotst->reel_hit_gy[1] - Slotst->reel_slip_gy[1] );

		if( CheckReachPattern(hit0,hit1) )
		{
			pos = 1;
			if( Slotst->reel_hit_gy[0] == 1 ) pos = 3;

			for( i = 0; i <= 4; i++ )
			{
				hit2 = GetReelPatternGrid( 2, pos - (Slotst->reel_slip_gy[2] + i) );

				if( hit0 == hit2 )
				{
					Slotst->reel_slip_gy[2] += i;
					break;
				}
			}
		}
	}

	while( 1 )
	{
		hit0 = GetReelPatternGrid( 0, 1 - Slotst->reel_slip_gy[0] );
		hit1 = GetReelPatternGrid( 1, 2 - Slotst->reel_slip_gy[1] );
		hit2 = GetReelPatternGrid( 2, 3 - Slotst->reel_slip_gy[2] );

		if( CheckMissPattern(hit0,hit1,hit2) )
		{
			break;
		}

		if( CheckHitReachPattern(hit0,hit1,hit2) &&
			(Slotst->lottery_bit & LOTTERY_HITBIT_BIG) )
		{
			break;
		}

		Slotst->reel_slip_gy[2]++;
	}

	while( 1 )
	{
		hit0 = GetReelPatternGrid( 0, 3 - Slotst->reel_slip_gy[0] );
		hit1 = GetReelPatternGrid( 1, 2 - Slotst->reel_slip_gy[1] );
		hit2 = GetReelPatternGrid( 2, 1 - Slotst->reel_slip_gy[2] );

		if( CheckMissPattern(hit0,hit1,hit2) )
		{
			break;
		}

		if( CheckHitReachPattern(hit0,hit1,hit2) &&
			(Slotst->lottery_bit & LOTTERY_HITBIT_BIG) )
		{
			break;
		}

		Slotst->reel_slip_gy[2]++;
	}
}

//======================================================================
//		Œﬁ¿›
//======================================================================
static void ButtonAnimeTask( u8 );
static void ButtonAnime0( TASK_TABLE *, u8 );
static void ButtonAnime1( TASK_TABLE *, u8 );
static void ButtonAnime2( TASK_TABLE *, u8 );

//------------------------------------------
//	Œﬁ¿›±∆“¿Ω∏æØƒ
//------------------------------------------
static void SetButtonAnimeTask( u8 no )
{
	u8 i;

	i = AddTask( ButtonAnimeTask, TASKPRI_BTN_ANIME );
	
	TaskTable[i].work[15] = no;
	ButtonAnimeTask( i );
}

//------------------------------------------
//	Œﬁ¿›±∆“èàóù√∞ÃﬁŸ
//------------------------------------------
static void (* const ButtonAnimeTaskTbl[])( TASK_TABLE *, u8 ) =
{
	ButtonAnime0,
	ButtonAnime1,
	ButtonAnime2,
};

//------------------------------------------
//	Œﬁ¿›œØÃﬂç¿ïW
//------------------------------------------
static const s16 ButtonMapPos[3] =
{ 0x05, 0x0a, 0x0f };

//------------------------------------------
//	Œﬁ¿›±∆“¿Ω∏
//------------------------------------------
static void ButtonAnimeTask( u8 no )
{
	ButtonAnimeTaskTbl[TaskTable[no].work[0]]( &TaskTable[no], no );
}

//------------------------------------------
//	Œﬁ¿›±∆“ 0
//------------------------------------------
static void ButtonAnime0( TASK_TABLE *task, u8 no )
{
	SetMapButton( ButtonMapPos[task->work[15]],
		BG_BTNON_CHNO_0, BG_BTNON_CHNO_1, BG_BTNON_CHNO_2, BG_BTNON_CHNO_3 );

	task->work[0]++;
}

//------------------------------------------
//	Œﬁ¿›±∆“ 1
//------------------------------------------
static void ButtonAnime1( TASK_TABLE *task, u8 no )
{
	if( ++task->work[1] >= 12 )
	{
		task->work[0]++;
	}
}

//------------------------------------------
//	Œﬁ¿›±∆“ 2
//------------------------------------------
static void ButtonAnime2( TASK_TABLE *task, u8 no )
{
	SetMapButton( ButtonMapPos[task->work[15]],
		BG_BTNOFF_CHNO_0, BG_BTNOFF_CHNO_1, BG_BTNOFF_CHNO_2, BG_BTNOFF_CHNO_3 );

	DelTask( no );
}

//======================================================================
//		ÕﬁØƒ◊≤›
//======================================================================
static u8 CheckBetLineActAnimeEnd( u8 no );
static void BetLineActMove( actWork * );

//------------------------------------------
//	ÕﬁØƒ◊≤›ì_ìî
//------------------------------------------
static void SetBetLineLight( u8 no )
{
	PaletteWorkSet( BetLineLightColorTbl[no], BetLineSetColorPos[no], 2 );
}

//------------------------------------------
//	ÕﬁØƒ◊≤›è¡ìî
//------------------------------------------
static void SetBetLineLightOut( u8 no )
{
	PaletteWorkSet( BetLineLightOutColorTbl[no], BetLineSetColorPos[no], 2 );
}

//------------------------------------------
//	ÕﬁØƒ -> ÕﬁØƒ◊≤›ì_ìî
//------------------------------------------
static void SetBetLineLightBetPoint( u8 bet )
{
	u8 i;

	for( i = 0; i < BetPointLineCount[bet]; i++ )
	{
		SetBetLineLight( BetPointLineSetNo[bet][i] );
	}
}

//------------------------------------------
//	ÕﬁØƒ -> ÕﬁØƒ◊≤›è¡ìî
//------------------------------------------
static void SetBetLineLightOutBetPoint( u8 bet )
{
	u8 i;

	for( i = 0; i < BetPointLineCount[bet]; i++ )
	{
		SetBetLineLightOut( BetPointLineSetNo[bet][i] );
	}
}

//------------------------------------------
//	ÕﬁØƒ◊≤›±∆“±∏¿æØƒ
//------------------------------------------
static void AddBetLineActor( void )
{
	u8 i,line;

	for( line = BETLINE_1; line < BETLINE_MAX; line++ )
	{
		i = AddDummyActor( BetLineActMove );
		ActWork[i].work[0] = line;
		Slotst->actno_betline[line] = i;
	}
}

//------------------------------------------
//	ÕﬁØƒ◊≤›±∆“æØƒ
//------------------------------------------
static void SetBetLineAnime( u8 no )
{
	actWork *act;

	act = &ActWork[Slotst->actno_betline[no]];
	act->work[1] = 1;									// Ω≤Ø¡
	act->work[2] = 4;									// Ω¿∞ƒ∂≥›ƒ
	act->work[3] = 0;									// ≥™≤ƒ
	act->work[4] = 0;									// ãPìx
	act->work[5] = 2;									// ë¨ìx
	act->work[7] = 0;									// èIóπÃ◊∏ﬁ
}

//------------------------------------------
//	ÕﬁØƒ◊≤›±∏¿Ω¿∞ƒ¡™Ø∏
//------------------------------------------
static u8 CheckBetLineAnimeStart( void )
{
	u8 i;
	actWork *act;

	for( i = BETLINE_1; i < BETLINE_MAX; i++ )
	{
		act = &ActWork[Slotst->actno_betline[i]];

		if( act->work[1] && act->work[2] )
		{
			return( 0 );
		}
	}
	
	return( 1 );
}

//------------------------------------------
//	ÕﬁØƒ◊≤›±∆“èIóπ
//------------------------------------------
static u8 CheckBetLineAnimeEnd( void )
{
	u8 i;
	
	for( i = BETLINE_1; i < BETLINE_MAX; i++ )
	{
		if( CheckBetLineActAnimeEnd(Slotst->actno_betline[i]) == 0 )
		{
			return( 0 );
		}
	}

	return( 1 );
}

//------------------------------------------
//	ÕﬁØƒ◊≤›±∏¿èIóπ¡™Ø∏
//------------------------------------------
static u8 CheckBetLineActAnimeEnd( u8 no )
{
	actWork *act;
	
	act = &ActWork[no];
	
	if( act->work[1] == 0 )
	{
		return( 1 );
	}

	if( act->work[1] && act->work[7] )
	{
		act->work[1] = 0;
	}

	return( act->work[7] );
}

//------------------------------------------
//	ÕﬁØƒ◊≤›±∏¿ìÆçÏ
//------------------------------------------
static void BetLineActMove( actWork *act )
{
	s16 max;

	if( act->work[1] == 0 )
	{
		return;
	}

	if( act->work[3]-- == 0 )							// ≥™≤ƒ
	{
		act->work[7] = 0;								// èIóπÃ◊∏ﬁ
		act->work[3] = 1;
		act->work[4] += act->work[5];
		
		max = 4;
		if( act->work[2] ) max <<= 1;
			
		if( act->work[4] <= 0 )
		{
			act->work[7] = 1;							// èIóπÃ◊∏ﬁ
			act->work[5] = -(act->work[5]);
			if( act->work[2] ) act->work[2]--;
		}
		else if( act->work[4] >= max )
		{
			act->work[5] = -(act->work[5]);
		}

		if( act->work[2] )								// Ω¿∞ƒ∂≥›ƒ 
		{
			act->work[3] <<= 1;							// íxÇ≠
		}
	}

	ColorFadeDown( BetLineSetColorPos[act->work[0]],
				(u8)act->work[4], (u8)act->work[4], (u8)act->work[4] );
}

//======================================================================
//		 ﬂƒ◊›Ãﬂ
//======================================================================
static void PatLampTask( u8 );

//------------------------------------------
//	 ﬂƒ◊›ÃﬂæØƒ
//------------------------------------------
static void SetPatLampTask( void )
{
	u8 i;
	
	i = AddTask( PatLampTask, TASKPRI_PATLAMP );
	TaskTable[i].work[3] = 1;
	PatLampTask( i );
}

//------------------------------------------
//	 ﬂƒ◊›ÃﬂèIóπ¡™Ø∏
//------------------------------------------
static u8 CheckPatLampTask( void )
{
	u8 i;
	
	i = CheckTaskNo( PatLampTask );

	if( TaskTable[i].work[2] == 0 )
	{
		DelTask( i );
		PaletteWorkSet( PatLampLightOutPalette, PATLAMP_PALNO, 0x20 );
		return( 1 );
	}

	return( 0 );
}

//------------------------------------------
//	 ﬂƒ◊›Ãﬂ¿Ω∏
//------------------------------------------
static void PatLampTask( u8 no )
{
	TASK_TABLE *task;
	
	task = &TaskTable[no];

	if( task->work[1]-- == 0 )
	{
		task->work[1] = 4;
		task->work[2] += task->work[3];

		if( task->work[2] == 0 || task->work[2] == 2 )
		{
			task->work[3] = -(task->work[3]);
		}
	}

	PaletteWorkSet( PatLampPaletteTbl[task->work[2]], PATLAMP_PALNO, 0x20 );
}

//======================================================================
//		≤≈Ωﬁœπﬁ∞ºﬁ
//======================================================================
static void InazumaGaugeTask( u8 );
static void InazumaGauge0( TASK_TABLE * );
static void InazumaGauge1( TASK_TABLE * );
static void InazumaGauge2( TASK_TABLE * );
static void InazumaGauge3( TASK_TABLE * );
static void ClearInazumaGaugeTaskWork( TASK_TABLE * );

//------------------------------------------
//	πﬁ∞ºﬁèàóù¿Ω∏æØƒ
//------------------------------------------
static void SetInazumaGaugeTask( void )
{
	u8 i;

	i = AddTask( InazumaGaugeTask, TASKPRI_IZM_GAUGE );
	Slotst->taskno_izm_gauge = i;
}

//------------------------------------------
//	≤≈Ωﬁœπﬁ∞ºﬁ 1 UP æØƒ
//------------------------------------------
static void SetInazumaGaugeUp( u8 up )
{
	TASK_TABLE *task;

	task = &TaskTable[Slotst->taskno_izm_gauge];
	ClearInazumaGaugeTaskWork( task );

	task->work[0] = 1;
	task->work[1]++;
	task->work[15] = 1;
}

//------------------------------------------
//	≤≈Ωﬁœπﬁ∞ºﬁ ∏ÿ±
//------------------------------------------
static void SetInazumaGaugeCls( void )
{
	TASK_TABLE *task;

	task = &TaskTable[Slotst->taskno_izm_gauge];
	ClearInazumaGaugeTaskWork( task );

	task->work[0] = 3;
	task->work[15] = 1;
}

//------------------------------------------
//	≤≈Ωﬁœπﬁ∞ºﬁ±∆“¡™Ø∏
//------------------------------------------
static u8 CheckInazumaGaugeAnime( void )
{
	return( TaskTable[Slotst->taskno_izm_gauge].work[15] );
}

//------------------------------------------
//	≤≈Ωﬁœπﬁ∞ºﬁèàóù√∞ÃﬁŸ
//------------------------------------------
static void (* const InazumaGaugeTaskTbl[])( TASK_TABLE * ) =
{
	InazumaGauge0,
	InazumaGauge1,
	InazumaGauge2,
	InazumaGauge3,
};

//------------------------------------------
//	≤≈Ωﬁœπﬁ∞ºﬁBG∑¨◊√∞ÃﬁŸ
//------------------------------------------
static const u16 IzmGaugeCharTbl[3][2] = 
{
	{ BG_IZM_GAUGE_ON_CHNO_0, BG_IZM_GAUGE_OFF_CHNO_0 },
	{ BG_IZM_GAUGE_ON_CHNO_1, BG_IZM_GAUGE_OFF_CHNO_1 },
	{ BG_IZM_GAUGE_ON_CHNO_2, BG_IZM_GAUGE_OFF_CHNO_2 }
};

//------------------------------------------
//	≤≈Ωﬁœπﬁ∞ºﬁèàóù
//------------------------------------------
static void InazumaGaugeTask( u8 no )
{
	InazumaGaugeTaskTbl[TaskTable[no].work[0]]( &TaskTable[no] );
}

//------------------------------------------
//	≤≈Ωﬁœπﬁ∞ºﬁ 0 ñ≥Çµ
//------------------------------------------
static void InazumaGauge0( TASK_TABLE *task )
{
}

//------------------------------------------
//	≤≈Ωﬁœπﬁ∞ºﬁ 1 Up
//------------------------------------------
static void InazumaGauge1( TASK_TABLE *task )
{
	s16 x,y;

	x = (0x03*8) + 4 + ((task->work[1] - 1) << 3);
	y = (0x02*8) + 4;

	task->work[2] = AddInazumaGaugeActor( x, y );
	task->work[0]++;
}

//------------------------------------------
//	≤≈Ωﬁœπﬁ∞ºﬁ 2 Up
//------------------------------------------
static void InazumaGauge2( TASK_TABLE *task )
{
	s16 x,flag;
	u16 *map;

	if( ActWork[task->work[2]].work[7] )
	{
		x = 0x03 + (task->work[1] - 1);
		map = (u16*)BG2_MAP_BASE;

		flag = 0;
		if( task->work[1] == 1 ) flag = 1;				// πﬁ∞ºﬁí[
		else if( task->work[1] == 16 ) flag = 2;

		BG_VRAMSET( map, x, 0x02,
			BG_SCRN_DATA(IzmGaugeCharTbl[flag][0],0,0,BG_IZM_GAUGE_PALNO) );

		DelInazumaGaugeActor( task->work[2] );

		task->work[0] = 0;
		task->work[15] = 0;
	}
}

//------------------------------------------
//	≤≈Ωﬁœπﬁ∞ºﬁ3 è¡ãé
//------------------------------------------
static void InazumaGauge3( TASK_TABLE *task )
{
	s16 x,flag;
	u16 *map;

	x = 0x03 + (task->work[1] - 1);
	map = (u16*)BG2_MAP_BASE;

	flag = 0;
	if( task->work[1] == 1 ) flag = 1;					// πﬁ∞ºﬁí[
	else if( task->work[1] == 16 ) flag = 2;

	if( task->work[2] == 0 )
	{
		BG_VRAMSET( map, x, 0x02,
			BG_SCRN_DATA(IzmGaugeCharTbl[flag][1],0,0,BG_IZM_GAUGE_PALNO) );

		task->work[1]--;
	}

	task->work[2]++;
	if( task->work[2] >= 20 ) task->work[2] = 0;

	if( task->work[1] == 0 )
	{
		task->work[0] = 0;
		task->work[15] = 0;
	}
}

//------------------------------------------
//	≤≈Ωﬁœπﬁ∞ºﬁ‹∞∏∏ÿ±
//------------------------------------------
static void ClearInazumaGaugeTaskWork( TASK_TABLE *task )
{
	u8 i;
	
	for( i = 2; i < 16; task->work[i] = 0, i++ );
}

//------------------------------------------
//	≤≈Ωﬁœπﬁ∞ºﬁèâä˙âª
//------------------------------------------
static void SetInazumaGauge( u8 izm )
{
	s16 x,i,flag;
	u16 *map;
	
	x = 0x03;
	map = (u16*)BG2_MAP_BASE;

	for( i = 0, x = 0x03; i < izm; i++, x++ )			// ì_ìîïîï™
	{
		flag = 0;
		if( i == 0 ) flag = 1;
		else if( i == 15 ) flag = 2;

		BG_VRAMSET( map, x, 0x02,
			BG_SCRN_DATA(IzmGaugeCharTbl[flag][0],0,0,BG_IZM_GAUGE_PALNO) );
	}

	for( ; i < 16; i++, x++ )							// è¡ìîïîï™
	{
		flag = 0;
		if( i == 0 ) flag = 1;
		else if( i == 15 ) flag = 2;
		
		BG_VRAMSET( map, x, 0x02,
			BG_SCRN_DATA(IzmGaugeCharTbl[flag][1],0,0,BG_IZM_GAUGE_PALNO) );
	}

	TaskTable[Slotst->taskno_izm_gauge].work[1] = izm;
}

//======================================================================
//		≤≈Ωﬁœ∂Øƒ≤›
//======================================================================
static void InazumaCutinTask( u8 );
static void InazumaCutin0( TASK_TABLE * );
static void InazumaCutin1( TASK_TABLE * );
static void InazumaCutin2( TASK_TABLE * );
static void InazumaCutin3( TASK_TABLE * );
static void InazumaCutin4( TASK_TABLE * );
static void InazumaCutin5( TASK_TABLE * );
static void InazumaCutin6( TASK_TABLE * );
static void InazumaCutin7( TASK_TABLE * );
static void InazumaCutin8( TASK_TABLE * );
static void InazumaCutin9( TASK_TABLE * );
static void InazumaCutinCls( TASK_TABLE * );
static void InazumaCutinHitEndSet( TASK_TABLE * );
static void InazumaCutinHitEndReelSpeedDown( TASK_TABLE * );
static void InazumaCutinHitEnd( TASK_TABLE * );
static void InazumaCutin10( TASK_TABLE * );
static void InazumaCutin11( TASK_TABLE * );
static void InazumaCutin12( TASK_TABLE * );
static void InazumaCutinBomEnd( TASK_TABLE * );
static void SetInazumaCutinMap( s16, s16 );
static void ClsInazumaCutinMap( s16 );

//------------------------------------------
//	≤≈Ωﬁœ∂Øƒ≤›¿Ω∏æØƒ
//------------------------------------------
static void SetInazumaCutinTask( void )
{
	u8 i;

	i = AddTask( InazumaCutinTask, TASKPRI_CUTIN );
	InazumaCutinTask( i );
}

//------------------------------------------
//	≤≈Ωﬁœ∂Øƒ≤›¡™Ø∏
//------------------------------------------
static u8 CheckInazumaCutinTask( void )
{
	u8 i;
	
	i = CheckTaskNo( InazumaCutinTask );
	
	if( i == NOT_EXIST_TASK_ID )
	{
		return( 1 );
	}
	
	return( 0 );
}

//------------------------------------------
//	≤≈Ωﬁœ∂Øƒ≤›èàóù√∞ÃﬁŸ
//------------------------------------------
static void (* const InazumaCutinTaskTbl[])( TASK_TABLE * ) =
{
	InazumaCutin0,
	InazumaCutin1,
	InazumaCutin2,
	InazumaCutin3,
	InazumaCutin4,
	InazumaCutin5,
	InazumaCutin6,
	InazumaCutin7,
	InazumaCutin8,
	InazumaCutin9,
	InazumaCutinCls,
	InazumaCutinHitEndSet,
	InazumaCutinHitEndReelSpeedDown,
	InazumaCutinHitEnd,
	InazumaCutin10,
	InazumaCutin11,
	InazumaCutin12,
	InazumaCutinCls,
	InazumaCutinBomEnd,
};

#define IZMSEQNO_BOM_START	(14)

//------------------------------------------
//	≤≈Ωﬁœ∂Øƒ≤›¿Ω∏
//------------------------------------------
static void InazumaCutinTask( u8 no )
{
	InazumaCutinTaskTbl[TaskTable[no].work[0]]( &TaskTable[no] );
}

//------------------------------------------
//	≤≈Ωﬁœ∂Øƒ≤› 0
//------------------------------------------
static void InazumaCutin0( TASK_TABLE *task )
{
	Slotst->bd_time = 0;
	Slotst->machine_reel_dy = 0;
	Slotst->machine_reel_gy = 0;

	task->work[0]++;
	task->work[1] = 0;									// BG X
	task->work[2] = 0x1e;
	task->work[4] = 0x0500;								// ÿ∞Ÿë¨ìx

	ActOX = 0;
	ActOY = 0;

	*(vu16*)REG_BG1HOFS = 0;
	*(vu16*)REG_BG1VOFS = 0;
	SetInazumaCutinMap( 0x1e, 0 );

	AddMachineActor();
	AddPikachuuActor();
	AddMachineNoActor();
	AddMachineShadeActor();
	AddMachineBackActor();

	SetLotteryBD();

	BGM_PlayStop();
	BGM_PlaySet( MUS_BD_TIME );
}

//------------------------------------------
//	≤≈Ωﬁœ∂Øƒ≤› 1 
//------------------------------------------
static void InazumaCutin1( TASK_TABLE *task )
{
	s16 x;

	ActOX -= 8;
	task->work[1] += 8;
	x = ((task->work[1] + 240) & 0xff) >> 3;
	*(vu16*)REG_BG1HOFS = task->work[1] & 0x1ff;

	if( x != task->work[2] && task->work[3] < 19 )		// çXêV
	{
		task->work[2] = x;
		task->work[3] = task->work[1] >> 3;
		SetInazumaCutinMap( x, task->work[3] );
	}

	if( task->work[1] >= 200 )							// 20+5
	{
		task->work[0]++;
		task->work[3] = 0;
	}

	SetMachineReelScroll( task->work[4] >> 8 );
}

//------------------------------------------
//	≤≈Ωﬁœ∂Øƒ≤› 2
//------------------------------------------
static void InazumaCutin2( TASK_TABLE *task )
{
	SetMachineReelScroll( task->work[4] >> 8 );

	if( ++task->work[5] >= 60 )							// ≥™≤ƒ
	{
		task->work[0]++;
		AddInazumaActor();
		AddPikaFlashActor();
	}
}

//------------------------------------------
//	≤≈Ωﬁœ∂Øƒ≤› 3
//------------------------------------------
static void InazumaCutin3( TASK_TABLE *task )
{
	s16 offs;
	u8 anmno[] = { 1, 1, 2, 2 };
	s16 i_wait[] = { 64, 48, 24, 8 };
	s16 p_wait[] = { 10, 8, 6, 4 };

	SetMachineReelScroll( task->work[4] >> 8 );

	task->work[4] -= 0x0004;
	offs = 0x04 - (task->work[4] >> 8);
	SetInazumaActWait( i_wait[offs] );
	SetPikaFlashActWait( p_wait[offs] );
	ActAnmChkChg( &ActWork[Slotst->actno_pikachuu], anmno[offs] );

	if( task->work[4] <= 0x0100 )
	{
		task->work[0]++;
		task->work[4] = 0x0100;
		task->work[5] = 0;
	}
}

//------------------------------------------
//	≤≈Ωﬁœ∂Øƒ≤› 4
//------------------------------------------
static void InazumaCutin4( TASK_TABLE *task )
{
	SetMachineReelScroll( task->work[4] >> 8 );

	if( ++task->work[5] >= 80 )
	{
		task->work[0]++;
		task->work[5] = 0;

		SetPikaFlashActWait( 2 );
		ActAnmChkChg( &ActWork[Slotst->actno_pikachuu], 3 );
	}
}

//------------------------------------------
//	≤≈Ωﬁœ∂Øƒ≤› 5
//------------------------------------------
static void InazumaCutin5( TASK_TABLE *task )
{
	SetMachineReelScroll( task->work[4] >> 8 );
	task->work[4] &= 0x00ff;
	task->work[4] += 0x0080;

	if( ++task->work[5] >= 80 )
	{
		task->work[0]++;
		task->work[5] = 0;
	}
}

//------------------------------------------
//	≤≈Ωﬁœ∂Øƒ≤› 6
//------------------------------------------
static void InazumaCutin6( TASK_TABLE *task )
{
	SetMachineReelScroll( task->work[4] >> 8 );
	task->work[4] &= 0x00ff;
	task->work[4] += 0x0040;
	
	if( ++task->work[5] >= ((MCREEL_PT_V_SIZE/2)*4) )
	{
		task->work[5] = 0;

		if( Slotst->lottery_bd_time )					// ê¨å˜
		{
			if( Slotst->bd_time <= task->work[6] )
			{
				task->work[0]++;
			}
		}
		else
		{
			if( task->work[6] >= 4 )					// é∏îs
			{
				task->work[0]++;
			}
			else if( GetLotteryBDBom(task->work[6]) )
			{
				task->work[0] = IZMSEQNO_BOM_START;
			}
		}
	
		task->work[6]++;
	}
}

//------------------------------------------
//	≤≈Ωﬁœ∂Øƒ≤› 7
//------------------------------------------
static void InazumaCutin7( TASK_TABLE *task )
{
	s16 d;

	d = Slotst->machine_reel_dy % MCREEL_PT_V_SIZE;

	if( d )
	{
		d = SetMachineReelGridScroll( task->work[4] >> 8 );
		task->work[4] &= 0x00ff;
		task->work[4] += 0x0040;
	}
	else if( GetMachineReelPattern(1) != Slotst->lottery_bd_time )
	{
		SetMachineReelScroll( task->work[4] >> 8 );
		d = Slotst->machine_reel_dy % MCREEL_PT_V_SIZE;
		task->work[4] &= 0x00ff;
		task->work[4] += 0x0040;
	}

	if( d == 0 && GetMachineReelPattern(1) == Slotst->lottery_bd_time )
	{
		task->work[4] = 0;
		task->work[0]++;
	}
}

//------------------------------------------
//	≤≈Ωﬁœ∂Øƒ≤› 8
//------------------------------------------
static void InazumaCutin8( TASK_TABLE *task )
{
	if( ++task->work[4] < 60 )
	{
		return;
	}

	BGM_PlayStop();
	DelInazumaActor();
	DelPikaFlashActor();

	task->work[0]++;

	if( Slotst->lottery_bd_time == MCREEL_PT_0 )
	{
		task->work[4] = 160;
		ActAnmChkChg( &ActWork[Slotst->actno_pikachuu], 5 );
		JinglePlay( MUS_ME_ZANNEN );
	}
	else
	{
		task->work[4] = 192;
		ActAnmChkChg( &ActWork[Slotst->actno_pikachuu], 4 );
		ActWork[Slotst->actno_pikachuu].anm_offs = 0;

		if( Slotst->inazuma )
		{
			SetInazumaGaugeCls();
			Slotst->inazuma = 0;
		}

		JinglePlay( MUS_ME_B_SMALL );
	}
}

//------------------------------------------
//	≤≈Ωﬁœ∂Øƒ≤› 9
//------------------------------------------
static void InazumaCutin9( TASK_TABLE *task )
{
	if( task->work[4] )
	{
		task->work[4]--;
	}

	if( task->work[4] == 0 && CheckInazumaGaugeAnime() == 0 )
	{
		task->work[0]++;
	}
}

//------------------------------------------
//	≤≈Ωﬁœ∂Øƒ≤› ◊Ωƒ
//------------------------------------------
static void InazumaCutinCls( TASK_TABLE *task )
{
	s16 x;

	ActOX -= 8;
	task->work[1] += 8;
	task->work[3] += 8;
	x = ((task->work[1] - 8) & 0xff) >> 3;
	*(vu16*)REG_BG1HOFS = task->work[1] & 0x1ff;

	if( (task->work[3] >> 3) < 26 )						// 200 = 25
	{
		ClsInazumaCutinMap( x );
	}
	else
	{
		task->work[0]++;
	}
}

//------------------------------------------
//	≤≈Ωﬁœ∂Øƒ≤› ìñÇËèIóπæØƒ
//------------------------------------------
static void InazumaCutinHitEndSet( TASK_TABLE *task )
{
	Slotst->bd_time_count = 0;
	Slotst->bd_time = Slotst->lottery_bd_time;

	ActOX = 0;
	*(vu16*)REG_BG1HOFS = 0;
	Slotst->reel_speed = REEL_SPEED_DEFAULT;			// îOÇÃÇΩÇﬂ

	DelPikachuuActor();
	DelMachineActor();
	DelMachineShadeActor();
	BGM_PlaySet( Slotst->bgmno );

	if( Slotst->bd_time == 0 )
	{
		DelTask( CheckTaskNo(InazumaCutinTask) );
		return;
	}

	SetLcAnime( LCANM_BDTime );
	task->work[1] = GetLotteryBDTimeReelSpeed();
	task->work[2] = 0;
	task->work[3] = 0;

	task->work[0]++;
}

//------------------------------------------
//	≤≈Ωﬁœ∂Øƒ≤›Å@ÿ∞Ÿë¨ìxóéÇ∆Çµ
//------------------------------------------
static void InazumaCutinHitEndReelSpeedDown( TASK_TABLE *task )
{
	if( Slotst->reel_speed == task->work[1] )
	{
		task->work[0]++;
		return;
	}

	if( (Slotst->reel_dy[0] % REEL_PT_V_SIZE) == 0 )
	{
		task->work[2]++;

		if( (task->work[2] & 7) == 0 )
		{
			Slotst->reel_speed >>= 1;					// 8 -> 4 -> 2
		}
	}
}

//------------------------------------------
//	≤≈Ωﬁœ∂Øƒ≤› ìñÇËèIóπ
//------------------------------------------
static void InazumaCutinHitEnd( TASK_TABLE *task )
{
	if( CheckLcAnime() )
	{
		DelTask( CheckTaskNo(InazumaCutinTask) );
	}
}

//------------------------------------------
//	≤≈Ωﬁœ∂Øƒ≤› 10
//------------------------------------------
static void InazumaCutin10( TASK_TABLE *task )
{
	DelMachineActor();
	DelInazumaActor();
	DelPikaFlashActor();
	
	AddBomActor();
	ActWork[Slotst->actno_machine_shade[0]].banish = 1;
	ActAnmChkChg( &ActWork[Slotst->actno_pikachuu], 5 );

	task->work[0]++;
	task->work[4] = 4;
	task->work[5] = 0;

	BGM_PlayStop();
	JinglePlay( MUS_ME_ZANNEN );
	SePlay( SE_W153 );
}

//------------------------------------------
//	≤≈Ωﬁœ∂Øƒ≤› 11
//------------------------------------------
static void InazumaCutin11( TASK_TABLE *task )
{
	ActOY = task->work[4];
	*(vu16*)REG_BG1VOFS = task->work[4];
	
	if( (task->work[5] & 0x01) )
	{
		task->work[4] = -task->work[4];
	}

	task->work[5]++;
	
	if( (task->work[5]&0x1f) == 0 )
	{
		task->work[4] >>= 1;
	}

	if( task->work[4] == 0 )
	{
		DelBomActor();
		AddStarActor();
		AddBreakMachineActor();
		AddSmokeActor();
		ActWork[Slotst->actno_machine_shade[0]].banish = 0;
		task->work[0]++;
		task->work[5] = 0;
	}
}

//------------------------------------------
//	≤≈Ωﬁœ∂Øƒ≤› 12
//------------------------------------------
static void InazumaCutin12( TASK_TABLE *task )
{
	ActOY = 0;
	*(vu16*)REG_BG1VOFS = 0;

	if( CheckSmokeActMove() )
	{
		task->work[0]++;
		DelSmokeActor();
	}
}

//------------------------------------------
//	≤≈Ωﬁœ∂Øƒ≤› îöî≠◊Ωƒ
//------------------------------------------
static void InazumaCutinBomEnd( TASK_TABLE *task )
{
	ActOX = 0;
	*(vu16*)REG_BG1HOFS = 0;

	BGM_PlaySet( Slotst->bgmno );
	DelPikachuuActor();
	DelBreakMachineActor();
	DelMachineShadeActor();
	DelStarActor();
	DelTask( CheckTaskNo(InazumaCutinTask) );
}

//------------------------------------------
//	∂Øƒ≤›œØÃﬂæØƒ
//------------------------------------------
static void SetInazumaCutinMap( s16 x, s16 map_x )
{
	s16 y;
	u16 ch;

	for( y = 0x04; y < 0x0f; y++ )
	{
		ch = kokuchi_Map[map_x + ((y-0x04)*20)];
		BG_VRAMSET( (u16*)BG1_MAP_BASE, x, y, ch );
	}
}

//------------------------------------------
//	∂Øƒ≤›œØÃﬂçÌèú
//------------------------------------------
static void ClsInazumaCutinMap( s16 x )
{
	s16 y;

	for( y = 0x04; y < 0x0f; BG_VRAMSET((u16*)BG1_MAP_BASE,x,y,0), y++ );
}

//======================================================================
//		ê‡ñæâÊñ 
//======================================================================
static void ExplainTask( u8 );
static void Explain0( TASK_TABLE * );
static void Explain1( TASK_TABLE * );
static void Explain2( TASK_TABLE * );
static void Explain3( TASK_TABLE * );
static void Explain4( TASK_TABLE * );
static void ExplainFadeWait( TASK_TABLE * );

//------------------------------------------
//	ê‡ñæâÊñ ¿Ω∏æØƒ
//------------------------------------------
static void SetExplainTask( u8 code )
{
	u8 i;
	
	i = AddTask( ExplainTask, TASKPRI_EXPLAIN );
	TaskTable[i].work[1] = code;
	ExplainTask( i );
}

//------------------------------------------
//	ê‡ñæâÊñ èIóπ¡™Ø∏
//------------------------------------------
static u8 CheckExplainTask( void )
{
	if( CheckTaskNo(ExplainTask) == NOT_EXIST_TASK_ID )
	{
		return( 1 );
	}

	return( 0 );
}

//------------------------------------------
//	ê‡ñæâÊñ èàóù√∞ÃﬁŸ
//------------------------------------------
static void (* const ExplainTaskTbl[])( TASK_TABLE * ) =
{
	Explain0,
	ExplainFadeWait,
	Explain1,
	ExplainFadeWait,
	Explain2,
	ExplainFadeWait,
	Explain3,
	ExplainFadeWait,
	Explain4,
};

//------------------------------------------
//	ê‡ñæâÊñ èàóù
//------------------------------------------
static void ExplainTask( u8 no )
{
	ExplainTaskTbl[TaskTable[no].work[0]]( &TaskTable[no] );
}

//------------------------------------------
//	ê‡ñæâÊñ  0
//------------------------------------------
static void Explain0( TASK_TABLE *task )
{
	PaletteFadeReq( 0xffffffff, 0, 0, 16, 0 );
	task->work[0]++;
}

//------------------------------------------
//	ê‡ñæâÊñ  Ã™∞ƒﬁë“Çø
//------------------------------------------
static void ExplainFadeWait( TASK_TABLE *task )
{
	if( FadeData.fade_sw == 0 )
	{
		task->work[0]++;
	}
}

//------------------------------------------
//	ê‡ñæâÊñ  1
//------------------------------------------
static void Explain1( TASK_TABLE *task )
{
	ClearLcAnime();
	SetMapExplain();
	NMenuContextChange( SLOT_INFO_TYPE );
	NMenuMsgWrite( SlotMsgExplain, 0x02, 0x04 );
	PaletteFadeReq( 0xffffffff, 0, 16, 0, 0 );
	task->work[0]++;
}

//------------------------------------------
//	ê‡ñæâÊñ  2
//------------------------------------------
static void Explain2( TASK_TABLE *task )
{
	if( TRG(SELECT_BUTTON|B_BUTTON) )
	{
		PaletteFadeReq( 0xffffffff, 0, 0, 16, 0 );
		task->work[0]++;
	}
}

//------------------------------------------
//	ê‡ñæâÊñ  3
//------------------------------------------
static void Explain3( TASK_TABLE *task )
{
	NMenuScreenClear();
	NMenuContextChange( SLOT_TYPE );
	SetSlotBgMap();
	SetLcAnime( task->work[1] );
	SetInazumaGauge( Slotst->inazuma );
	PaletteFadeReq( 0xffffffff, 0, 16, 0, 0 );
	task->work[0]++;
}

//------------------------------------------
//	ê‡ñæâÊñ  4
//------------------------------------------
static void Explain4( TASK_TABLE *task )
{
	DelTask( CheckTaskNo(ExplainTask) );
}

//======================================================================
//		âtèª
//======================================================================
#define LCACTNO_TASKWORKNO	(4)
static void LcControlTask( u8 );
static void LcControl0( TASK_TABLE * );

//------------------------------------------
//	âtèªêßå‰¿Ω∏æØƒ
//------------------------------------------
static void SetLcControlTask( void )
{
	u8 i;
	TASK_TABLE *task;

	i = AddTask( LcControlTask, TASKPRI_LC );
	Slotst->taskno_lc = i;
	
	task = &TaskTable[i];
	task->work[1] = 0xffff;
	for( i = LCACTNO_TASKWORKNO; i < 16; task->work[i] = LCACTNO_NOTHING, i++ );
}

//------------------------------------------
//	âtèª±∆“æØƒ
//------------------------------------------
static void SetLcAnime( u8 no )
{
	u8 i,actno;
	TASK_TABLE *task;

	ClearLcAnime();

	task = &TaskTable[Slotst->taskno_lc];
	task->work[1] = no;

	for( i = 0; LcAnimeDataTbl[no][i].actHno != LCACT_END; i++ )
	{
		actno = AddLcActor( LcAnimeDataTbl[no][i].actHno,
					LcAnimeDataTbl[no][i].actDATAno, LcAnimeDataTbl[no][i].actWORKdata );
		task->work[LCACTNO_TASKWORKNO + i] = actno;
	}
}

//------------------------------------------
//	âtèª±∆“æØƒ ªÃﬁ
//------------------------------------------
static void SetLcAnimeSub( u8 act_h_no, void (*move)(actWork*), s16 x, s16 y, s16 w6 )
{
	u8 i;
	TASK_TABLE *task;

	task = &TaskTable[Slotst->taskno_lc];

	for( i = LCACTNO_TASKWORKNO; i < 16; i++ )
	{
		if( task->work[i] == LCACTNO_NOTHING )
		{
			task->work[i] = AddLcActorSub( act_h_no, move, x, y, w6 );
			break;
		}
	}
}

//------------------------------------------
//	âtèª±∆“çÌèú
//------------------------------------------
static void ClearLcAnime( void )
{
	u8 i;
	TASK_TABLE *task;

	task = &TaskTable[Slotst->taskno_lc];

	if( (u16)task->work[1] != 0xffff )
	{
		LcAnimeSettleTbl[task->work[1]]();
	}

	for( i = LCACTNO_TASKWORKNO; i < 16; i++ )
	{
		if( task->work[i] != LCACTNO_NOTHING )
		{
			DelActor( &ActWork[task->work[i]] );
			task->work[i] = LCACTNO_NOTHING;
		}
	}
}

//------------------------------------------
//	âtèª±∆“èIóπë“Çø
//------------------------------------------
static u8 CheckLcAnime( void )
{
	u8 i;
	TASK_TABLE *task;

	task = &TaskTable[Slotst->taskno_lc];

	for( i = LCACTNO_TASKWORKNO; i <= 15; i++ )
	{
		if( task->work[i] != LCACTNO_NOTHING )
		{
			if( ActWork[task->work[i]].work[7] )
			{
				return( 0 );
			}
		}
	}

	return( 1 );
}

//------------------------------------------
//	âtèªêßå‰¿Ω∏√∞ÃﬁŸ
//------------------------------------------
static void (* const LcControlTaskTbl[])( TASK_TABLE * ) =
{
	LcControl0,
};

//------------------------------------------
//	âtèªêßå‰¿Ω∏
//------------------------------------------
static void LcControlTask( u8 no )
{
	LcControlTaskTbl[TaskTable[no].work[0]]( &TaskTable[no] );
}

//------------------------------------------
//	âtèªêßå‰ 0
//------------------------------------------
static void LcControl0( TASK_TABLE *task )
{
}

//======================================================================
//		äGïø
//======================================================================
//------------------------------------------
//	äGïø±∏¿∞æØƒ
//------------------------------------------
static void AddReelPatternActor( void )
{
	u8 i;
	s16 x,y,reel;
	actWork *act;

	for( reel = 0, x = 48; reel < 3; reel++, x += 40 )
	{
		for( y = 0; y  < 120; y += 24 )
		{
			i = AddActor( &ReelPatternActHead, x, 0, ACTPRI_REEL_PTN );
			act = &ActWork[i];
			act->oamData.Priority = 3;
			act->work[0] = reel;
			act->work[1] = y;
			act->work[3] = 0xffff;
		}
	}
}

//------------------------------------------
//	äGïøìÆçÏ
//------------------------------------------
static void ReelPatternActMove( actWork *act )
{
	act->work[2] = Slotst->reel_dy[act->work[0]] + act->work[1];
	act->work[2] %= REEL_PT_V_MAX;
	act->y = act->work[2] + REEL_PT_V_OFFSET + Slotst->reel_oy[act->work[0]];

	act->char_num = CellCharNumGet( GetReelPattern(act->work[0],REEL_PT_V_GP(act->work[2])) );
	ActCharNumSet( act );
}

//======================================================================
//		êîéö
//======================================================================
static void SetNumberActor( s16, s16, u8, s16 );

//------------------------------------------
//	≈› ﬁ∞±∏¿∞í«â¡
//------------------------------------------
static void AddNumberActor( void )
{
	s16 num,x;

	for( x = 0xcb, num = 1; num < 10000; SetNumberActor(x,23,0,num), num *= 10, x -= 7 );
	for( x = 0xeb, num = 1; num < 10000; SetNumberActor(x,23,1,num), num *= 10, x -= 7 );
}

//------------------------------------------
//	≈› ﬁ∞±∏¿∞æØƒ
//------------------------------------------
static void SetNumberActor( s16 x, s16 y, u8 flag, s16 keta )
{
	actWork *act;

	act = &ActWork[AddActor(&NumberActHead,x,y,ACTPRI_NUMBER)];
	act->oamData.Priority = 2;
	act->work[0] = flag;
	act->work[1] = keta;
	act->work[2] = keta * 10;
	act->work[3] = 0xffff;
}

//------------------------------------------
//	≈› ﬁ∞±∏¿∞ìÆçÏ
//------------------------------------------
static void NumberActMove( actWork *act )
{
	u16 num;

	num = Slotst->credit;
	if( act->work[0] ) num = Slotst->payout;

	if( act->work[3] != num )
	{
		act->work[3] = num;
		num %= (u16)act->work[2];
		num /= (u16)act->work[1];
		num += CELL_NUM0;

		act->char_num = CellCharNumGet( num );
		ActCharNumSet( act );
	}
}

//======================================================================
//		ƒﬁ◊—
//======================================================================
//------------------------------------------
//	ƒﬁ◊—±∏¿∞í«â¡
//------------------------------------------
static void AddDrumActor( void )
{
	u8 i;
	
	i = AddActor( &DrumActHead, 0x0b << 3, 0x09 << 3, ACTPRI_DRUM );
	ActWork[i].oamData.Priority = 3;
	SetActOamPat( &ActWork[i], DrumOamPat );
}

//======================================================================
//		Àﬂ∂¡≠≥
//======================================================================
//------------------------------------------
//	Àﬂ∂¡≠≥±∏¿∞í«â¡
//------------------------------------------
static void AddPikachuuActor( void )
{
	u8 i;

	i = AddActor( &PikachuuActHead, 0x23 << 3, 0x0a << 3, ACTPRI_PIKACHUU );
	ActWork[i].oamData.Priority = 1;
	ActWork[i].scr = 1;
	Slotst->actno_pikachuu = i;
}

//------------------------------------------
//	Àﬂ∂¡≠≥±∏¿∞çÌèú
//------------------------------------------
static void DelPikachuuActor( void )
{
	DelActor( &ActWork[Slotst->actno_pikachuu] );
}

//------------------------------------------
//	Àﬂ∂¡≠≥±∏¿∞ìÆçÏ
//------------------------------------------			
static void PikachuuActMove( actWork *act )
{
	act->dx = 0;
	act->dy = 0;

	if( act->anm_no == 4 )
	{
		act->dx = 8;
		act->dy = 8;

		if( (act->anm_offs && act->anm_wait >= 1) ||
			(act->anm_offs == 0 && act->anm_wait < 1) )
		{
			act->dy = -8;
		}
	}
}

//======================================================================
//		œº›
//======================================================================
//------------------------------------------
//	œº›±∏¿∞í«â¡
//------------------------------------------
static void AddMachineActor( void )
{
	u8 i;
	actWork *act;

	i = AddActor( &MachineUpActHead, 0x2e << 3, (0x06 << 3) + 4, ACTPRI_MACHINE );
	act = &ActWork[i];
	act->oamData.Priority = 1;
	act->scr = 1;
	SetActOamPat( act, MachineUpOamPat );
	Slotst->actno_machine[0] = i;

	i = AddActor( &MachineDownActHead, 0x2e << 3, (0x0a << 3) + 4, ACTPRI_MACHINE );
	act = &ActWork[i];
	act->oamData.Priority = 1;
	act->scr = 1;
	SetActOamPat( act, MachineDownOamPat );
	Slotst->actno_machine[1] = i;
}

//------------------------------------------
//	âÛÇÍœº›±∏¿í«â¡
//------------------------------------------
static void AddBreakMachineActor( void )
{
	u8 i;
	actWork *act;

	i = AddActor( &MachineBreakActHead, (0x15 << 3) - ActOX, 0x0a << 3, ACTPRI_MACHINE );
	act = &ActWork[i];
	act->oamData.Priority = 1;
	act->scr = 1;
	SetActOamPat( act, MachineBreakOamPat );
	Slotst->actno_break_machine = i;
}

//------------------------------------------
//	œº›≈› ﬁ±∏¿í«â¡
//------------------------------------------
static void AddMachineNoActor( void )
{
	u8 i,no;
	s16 y;
	actWork *act;

	for( i = 0, y = 0; i < 3; i++, y += MCREEL_PT_V_SIZE )
	{
		no = AddActor( &MachineNoActHead, (0x2e << 3), 0, ACTPRI_MACHINE_NO );
		act = &ActWork[no];
		act->oamData.Priority = 1;
		act->scr = 1;
		act->work[7] = y;
		Slotst->actno_machineno[i] = no;
	}
}

//------------------------------------------
//	œº›≈› ﬁ±∏¿ìÆçÏ
//------------------------------------------
static void MachineNoActMove( actWork *act )
{
	s16 y;

	y = Slotst->machine_reel_dy + act->work[7];
	y %= MCREEL_PT_V_MAX;
	act->y = (y + MCREEL_PT_V_OFFSET) - 1;				// 1dot = å©âhÇ¶

	y = GetMachineReelPattern( MCREEL_PT_V_GP(y) );
	ActAnmChkChg( act, y );
}

//------------------------------------------
//	âe±∏¿í«â¡
//------------------------------------------
static void AddMachineShadeActor( void )
{
	u8 i;
	actWork *act;

	i = AddActor( &MachineShadeActHead, 0x2e << 3, (0x0d << 3) - 4, ACTPRI_MACHINE_SHADE );
	act = &ActWork[i];
	act->scr = 1;
	act->oamData.Priority = 1;
	SetActOamPat( act, MachineShadeOamPat );
	Slotst->actno_machine_shade[0] = i;

	i = AddActor( &MachineShadeActHead, 0x24 << 3, 0x0d << 3, ACTPRI_PIKACHUU_SHADE );
	act = &ActWork[i];
	act->scr = 1;
	act->oamData.Priority = 1;
	SetActOamPat( act, MachineShadeOamPat );
	Slotst->actno_machine_shade[1] = i;
}

//------------------------------------------
//	œº›ó†±∏¿í«â¡
//------------------------------------------
static void AddMachineBackActor( void )
{
	u8 i;
	actWork *act;

	i = AddActor( &MachineBackActHead, 0x2e << 3, (0x09 << 3) + 4, ACTPRI_MACHINE_BACK );
	act = &ActWork[i];
	act->scr = 1;
	act->oamData.Priority = 1;
	SetActOamPat( act, MachineBackOamPat );
	Slotst->actno_machine_back = i;
};

//------------------------------------------
//	œº›±∏¿çÌèú
//------------------------------------------
static void DelMachineActor( void )
{
	u8 i;
	
	DelActor( &ActWork[Slotst->actno_machine_back] );
	for( i = 0; i < 2; DelActor(&ActWork[Slotst->actno_machine[i]]), i++ );
	for( i = 0; i < 3; DelActor(&ActWork[Slotst->actno_machineno[i]]), i++ );
}

//------------------------------------------
//	âe±∏¿çÌèú
//------------------------------------------
static void DelMachineShadeActor( void )
{
	u8 i;
	
	for( i = 0; i < 2; DelActor(&ActWork[Slotst->actno_machine_shade[i]]), i++ );
}

//------------------------------------------
//	âÛÇÍœº›çÌèú
//------------------------------------------
static void DelBreakMachineActor( void )
{
	DelActor( &ActWork[Slotst->actno_break_machine] );
}

//======================================================================
//		œº›≤≈Ωﬁœ
//======================================================================
//------------------------------------------
//	≤≈Ωﬁœ±∏¿∞í«â¡
//------------------------------------------
static void AddInazumaActor( void )
{
	u8 i;
	actWork *act;
	
	i = AddActor( &InazumaActHead, 0x13 << 3, 0x04 << 3, ACTPRI_INAZUMA );
	act = &ActWork[i];
	act->oamData.Priority = 1;
	act->Hflip = 1;
	Slotst->actno_inazuma[0] = i;
	act->work[0] = 8;
	act->work[1] = -1;
	act->work[2] = -1;
	act->work[7] = 32;

	i = AddActor( &InazumaActHead, 0x17 << 3, 0x04 << 3, ACTPRI_INAZUMA );
	act = &ActWork[i];
	act->oamData.Priority = 1;
	Slotst->actno_inazuma[1] = i;
	act->work[1] = 1;
	act->work[2] = -1;
	act->work[7] = 32;
}

//------------------------------------------
//	≤≈Ωﬁœ
//------------------------------------------
static void InazumaActMove( actWork *act )
{
	if( act->work[0] )
	{
		act->work[0]--;
		act->dx = 0;
		act->dy = 0;
		act->banish = 1;
		return;
	}
	
	act->banish = 0;
	act->dx += act->work[1];
	act->dy += act->work[2];
	act->work[3]++;

	if( act->work[3] >= 8 )
	{
		act->work[0] = act->work[7];
		act->work[3] = 0;
	}
}

//------------------------------------------
//	≤≈Ωﬁœ≥™≤ƒæØƒ
//------------------------------------------
static void SetInazumaActWait( s16 wait )
{
	ActWork[Slotst->actno_inazuma[0]].work[7] = wait;
	ActWork[Slotst->actno_inazuma[1]].work[7] = wait;
}

//------------------------------------------
//	≤≈Ωﬁœ±∏¿∞çÌèú
//------------------------------------------
static void DelInazumaActor( void )
{
	u8 i;

	for( i = 0; i < 2; DelActor(&ActWork[Slotst->actno_inazuma[i]]), i++ );
}

//======================================================================
//		Àﬂ∂¡≠≥ìdåÇ
//======================================================================
//------------------------------------------
//	Àﬂ∂¡≠≥ìdåÇ±∏¿∞í«â¡
//------------------------------------------
static void AddPikaFlashActor( void )
{
	u8 i;
	
	i = AddActor( &PikaFlashActHead, 0x09 << 3 , 0x0a << 3, ACTPRI_PIKA_FLASH );
	ActWork[i].oamData.Priority = 1;
	ActWork[i].work[0] = 1;
	ActWork[i].work[5] = 0;								// ãPìx
	ActWork[i].work[6] = 16;							// ≥™≤ƒ
	ActWork[i].work[7] = 8;								// ≥™≤ƒ
	Slotst->actno_pikaflash[0] = i;

	i = AddActor( &PikaFlashActHead, (0x09 << 3) + 32, 0x0a << 3, ACTPRI_PIKA_FLASH );
	ActWork[i].oamData.Priority = 1;
	ActWork[i].Hflip = 1;
	Slotst->actno_pikaflash[1] = i;
}

//------------------------------------------
//	Àﬂ∂¡≠≥ìdåÇ±∏¿∞ìÆçÏ
//------------------------------------------
static void PikaFlashActMove( actWork *act )
{
	u8 ev[2] = { 16, 0 };

	if( act->work[0] == 0 )
	{
		return;
	}

	act->work[6]--;
	
	if( act->work[6] <= 0 )
	{
		ColorFadeUp( PIKAFLASH_COLNO, ev[act->work[5]], ev[act->work[5]], ev[act->work[5]] );
		act->work[5] = (act->work[5] + 1) & 0x01;
		act->work[6] = act->work[7];
	}
}

//------------------------------------------
//	Àﬂ∂¡≠≥ìdåÇ±∏¿∞ìÆçÏ
//------------------------------------------
static void SetPikaFlashActWait( s16 wait )
{
	ActWork[Slotst->actno_pikaflash[0]].work[7] = wait;
}

//------------------------------------------
//	Àﬂ∂¡≠≥ìdåÇ±∏¿∞çÌèú
//------------------------------------------
static void DelPikaFlashActor( void )
{
	u8 i;
	
	ColorFadeUp( PIKAFLASH_COLNO, 0, 0, 0 );			// ∂◊∞ïúãA
	for( i = 0; i < 2; DelActor( &ActWork[Slotst->actno_pikaflash[i]]), i++ );
}

//======================================================================
//		îöî≠
//======================================================================
//------------------------------------------
//	îöî≠±∏¿∞í«â¡
//------------------------------------------
static void AddBomActor( void )
{
	u8 i;

	i = AddActor( &BomActHead, 0x15 << 3, 0x0a << 3, ACTPRI_BOM );
	ActWork[i].oamData.Priority = 1;
	Slotst->actno_bom = i;
}

//------------------------------------------
//	îöî≠±∏¿∞ìÆçÏ
//------------------------------------------
static void BomActMove( actWork *act )
{
	act->dy = ActOY;
}

//------------------------------------------
//	îöî≠±∏¿∞çÌèú
//------------------------------------------
static void DelBomActor( void )
{
	DelActor( &ActWork[Slotst->actno_bom] );
}

//======================================================================
//		êØ
//======================================================================
//------------------------------------------
//	êØ±∏¿∞í«â¡
//------------------------------------------
static void AddStarActor( void )
{
	u8 i,no;
	actWork *act;
	s16 rtbl[4] = { 0, 64, 128, 192 };

	for( i = 0; i < 4; i++ )
	{
		no = AddActor( &StarActHead, (0x0a << 3) - ActOX, (0x08 << 3) + 4, ACTPRI_STAR_0 );
		act = &ActWork[no];
		act->oamData.Priority = 1;
		act->scr = 1;
		act->work[0] = rtbl[i];
		Slotst->actno_star[i] = no;
	}
}

//------------------------------------------
//	êØ±∏¿∞ìÆçÏ
//------------------------------------------
static void StarActMove( actWork *act )
{
	act->work[0] -= 2;
	act->work[0] &= 0xff;
	act->dx = CosMove( act->work[0], 20 );
	act->dy = SinMove( act->work[0], 6 );

	act->pri = ACTPRI_STAR_0;

	if( act->work[0] >= 128 )
	{
		act->pri = ACTPRI_STAR_1;
	}

	if( ++act->work[1] >= 16 )
	{
		act->Hflip^= 1;
		act->work[1] = 0;
	}
}

//------------------------------------------
//	êØ±∏¿∞çÌèú
//------------------------------------------
static void DelStarActor( void )
{
	u8 i;

	for( i = 0; i < 4; DelActor(&ActWork[Slotst->actno_star[i]]), i++ );
}

//======================================================================
//		âå
//======================================================================
//------------------------------------------
//	âå±∏¿∞í«â¡
//------------------------------------------
static void AddSmokeActor( void )
{
	u8 i;
	actWork *act;

	i = AddActor( &SmokeActHead, 0x15 << 3, (0x07 << 3) + 4, ACTPRI_SMOKE );
	act = &ActWork[i];
	act->oamData.Priority = 1;
	act->oamData.AffineMode = 3;
	AffineNumSet( act );
	Slotst->actno_smoke = i;
}
	
//------------------------------------------
//	âå±∏¿∞ìÆçÏ
//------------------------------------------
static void SmokeActMove( actWork *act )
{
	if( act->work[0] == 0 )
	{
		if( act->affend_sw ) act->work[0]++;
	}
	else if( act->work[0] == 1 )
	{
		act->banish ^= 1;

		if( ++act->work[2] >= 24 )
		{
			act->work[0]++;
			act->work[2] = 0;
		}
	}
	else
	{
		act->banish = 1;
		if( ++act->work[2] >= 16 ) act->work[7] = 1;
	}

	act->work[1] &= 0x00ff;
	act->work[1] += 0x0010;
	act->dy -= act->work[1] >> 8;
}

//------------------------------------------
//	âå±∏¿∞ìÆçÏ¡™Ø∏
//------------------------------------------
static u8 CheckSmokeActMove( void )
{
	return( ActWork[Slotst->actno_smoke].work[7] );
}

//------------------------------------------
//	âå±∏¿∞çÌèú
//------------------------------------------
static void DelSmokeActor( void )
{
	actWork *act;
	
	act = &ActWork[Slotst->actno_smoke];
	AffineWorkNumDel( act->oamData.AffineParamNo );
	DelActor( act );
}

//======================================================================
//		≤≈Ωﬁœπﬁ∞ºﬁ±∏¿∞
//======================================================================
//------------------------------------------
//	≤≈Ωﬁœπﬁ∞ºﬁ±∏¿∞æØƒ
//------------------------------------------
static u8 AddInazumaGaugeActor( s16 x, s16 y )
{
	u8 i;
	actWork *act;

	i = AddActor( &InazumaGaugeActHead, x, y, ACTPRI_IZMGAUGE );
	act = &ActWork[i];
	act->oamData.Priority = 2;
	act->oamData.AffineMode = 3;
	AffineNumSet( act );

	return( i );
}

//------------------------------------------
//	≤≈Ωﬁœπﬁ∞ºﬁ±∏¿∞ìÆçÏ
//------------------------------------------
static void InazumaGaugeActMove( actWork *act )
{
	if( act->affend_sw )
	{
		act->work[7] = 1;
	}
}

//------------------------------------------
//	≤≈Ωﬁœπﬁ∞ºﬁ±∏¿∞çÌèú
//------------------------------------------
static void DelInazumaGaugeActor( u8 no )
{
	actWork *act;
	
	act = &ActWork[no];
	AffineWorkNumDel( act->oamData.AffineParamNo );
	DelActor( act );
}

//======================================================================
//		âtèª±∏¿∞
//======================================================================
//------------------------------------------
//	âtèª±∏¿∞í«â¡
//------------------------------------------
static u8 AddLcActor( u8 act_h_no, u8 act_d_no, s16 w6 )
{
	return( AddLcActorSub(act_h_no, LcActMoveTbl[act_d_no],
		LcActStartPosTbl[act_d_no][0],LcActStartPosTbl[act_d_no][1],w6) );
}

//------------------------------------------
//	âtèª±∏¿∞í«â¡ ªÃﬁ
//------------------------------------------
static u8 AddLcActorSub( u8 act_h_no, void (*move)(actWork*), s16 x, s16 y, s16 w6 )
{
	u8 i;
	actWork *act;
	const OAMPatSt *pat;

	i = AddActor( LcActHeadTbl[act_h_no], x, y, ACTPRI_LC );
	
	act = &ActWork[i];
	act->oamData.Priority = 3;
	act->move = move;
	act->work[6] = w6;									// éØï 
	act->work[7] = 1;									// ±∆“Ã◊∏ﬁ

	pat = LcOamPatTbl[act_h_no];

	if( pat )
	{
		SetActOamPat( act, pat );
	}

	return( i );
}

//------------------------------------------
//	âtèªìÆçÏñ≥Çµ
//------------------------------------------
static void LcActMoveNothing( actWork *act )
{
	act->work[7] = 0;
}

//------------------------------------------
//	âtèªìÆçÏ Kemuri 0
//------------------------------------------
static void LcActMoveKemuri0( actWork *act )
{
	s16 xtbl[] = { 4, -4, 4, -4 };
	s16 ytbl[] = { 4, 4, -4, -4 };

	if( act->work[1]++ >= 16 )
	{
		act->oampat_no ^= 1;							// âå±∆“ 0,1
		act->work[1] = 0;
	}

	act->dx = 0;
	act->dy = 0;

	if( act->oampat_no )
	{
		act->dx = xtbl[act->work[6]];
		act->dy = ytbl[act->work[6]];
	}
}

static void LcActMoveKemuri1( actWork *act )
{
	act->Hflip = 1;
	LcActMoveKemuri0( act );
}

static void LcActMoveKemuri2( actWork *act )
{
	act->Vflip = 1;
	LcActMoveKemuri0( act );
}

static void LcActMoveKemuri3( actWork *act )
{
	act->Hflip = 1;
	act->Vflip = 1;
	LcActMoveKemuri0( act );
}

//------------------------------------------
//	âtèªìÆçÏ BD
//------------------------------------------
static void LcActMoveBD( actWork *act )
{
	switch( act->work[0] )
	{
		case 0:
			act->x += 4;
			if( act->x >= (0x1a*8) )
			{
				act->x = 0x1a*8;
				act->work[0]++;
			}
			break;
		case 1:
			act->work[1]++;
			if( act->work[1] > 90 ) act->work[0]++;
			break;
		case 2:
			act->x += 4;
			if( act->x >= (0x22*8) ) act->work[0]++;
			break;
		case 3:
			act->work[7] = 0;
	}
}

//------------------------------------------
//	âtèªìÆçÏ Time
//------------------------------------------
static void LcActMoveTime( actWork *act )
{
	switch( act->work[0] )
	{
		case 0:
			act->x -= 4;
			if( act->x <= (0x1a*8) )
			{
				act->x = 0x1a*8;
				act->work[0]++;
			}
			break;
		case 1:
			act->work[1]++;
			if( act->work[1] > 90 ) act->work[0]++;
			break;
		case 2:
			act->x -= 4;
			if( act->x <= (0x12*8) ) act->work[0]++;
			break;
		case 3:
			act->work[7] = 0;
	}
}

//------------------------------------------
//	âtèªìÆçÏ Num
//------------------------------------------
static void LcActMoveNum( actWork *act )
{
	switch( act->work[0] )
	{
		case 0:
			ActAnmChg( act, Slotst->bd_time - 1 );
			act->work[0]++;
		case 1:
			act->work[1]++;
			if( act->work[1] >= 4 )
			{
				act->work[0]++;
				act->work[1] = 0;
			}
			break;
		case 2:
			act->x += 4;
			if( act->x >= (0x1a*8) )
			{
				act->x = 0x1a*8;
				act->work[0]++;
			}
			break;
		case 3:
			act->work[1]++;
			if( act->work[1] > 90 ) act->work[0]++;
			break;
		case 4:
			act->x += 4;
			if( act->x >= (0x1f*8) ) act->work[0]++;
			break;
		case 5:
			act->work[7] = 0;
	}
}

//------------------------------------------
//	âtèªìÆçÏ Œﬁ∞Ÿ
//------------------------------------------
static void LcActMoveBall( actWork *act )
{
	switch( act->work[0] )
	{
		case 0:
			act->anm_pause = 1;
			act->work[0]++;
		case 1:
			act->y += 8;
			if( act->y >= (0x0e*8) )
			{
				act->y = 0x0e*8;
				act->work[1] = 16;
				act->work[0]++;
			}
			break;
		case 2:
			if( act->work[2] == 0 )
			{
				act->y -= act->work[1];
				act->work[1] = -(act->work[1]);
				act->work[3]++;

				if( act->work[3] >= 2 )
				{
					act->work[1] >>= 2;
					act->work[3] = 0;

					if( act->work[1] == 0 )
					{
						act->work[0]++;
						act->work[7] = 0;
						act->anm_pause = 0;
					}
				}
			}

			act->work[2] = (act->work[2] + 1) & 0x07;
	}
}

//------------------------------------------
//	âtèªìÆçÏ ΩƒØÃﬂ
//------------------------------------------
static void LcActMoveStop( actWork *act )
{
	switch( act->work[0] )
	{
		case 0:
			act->work[1]++;
			if( act->work[1] > 8 ) act->work[0]++;
			break;
		case 1:
			act->y += 2;

			if( act->y >= (0x06*8) )
			{
				act->y = (0x06*8);
				act->work[0]++;
				act->work[7] = 0;
			}
	}
}

//------------------------------------------
//	âtèªìÆçÏ A
//------------------------------------------
static void LcActMoveA( actWork *act )
{
	switch( act->work[0] )
	{
		case 0:
			act->banish = 1;
			act->work[1]++;

			if( act->work[1] > 32 )
			{
				act->work[0]++;
				act->work[1] = 5;						// ”ªﬁ≤∏ Hª≤Ωﬁ
				act->oamData.Mosaic = 1;
				act->banish = 0;
				ActAnmChg( act, 1 );					// ”ªﬁ≤∏çló∂
				*(vu16*)REG_MOSAIC = ((act->work[1]<<4)|act->work[1]) << 8;
			}

			break;
		case 1:
			act->work[1] -= (act->work[2] >> 8);
			if( act->work[1] < 0 ) act->work[1] = 0;
			*(vu16*)REG_MOSAIC = ((act->work[1]<<4)|act->work[1]) << 8;
			act->work[2] &= 0x00ff;
			act->work[2] += 0x0080;
			
			if( act->work[1] == 0 )
			{
				act->work[0]++;
				act->work[7] = 0;
				act->oamData.Mosaic = 0;
				ActAnmChg( act, 0 );
			}
	}
}

//------------------------------------------
//	âtèªìÆçÏ èüÇøŒﬁ∞Ÿ
//------------------------------------------
static void LcActMoveWinBall( actWork *act )
{
	if( act->work[1] < 3 )
	{
		PaletteWorkSet( LcBallPaletteTbl[act->work[1]], LCBALL_PALNO, 32 );

		if( ++act->work[2] >= 4 )
		{
			act->work[1]++;
			act->work[2] = 0;
		}
	}
	else
	{
		PaletteWorkSet( LcBallPaletteTbl[act->work[1]], LCBALL_PALNO, 32 );

		if( ++act->work[2] > 24 )
		{
			act->work[1] = 0;
			act->work[2] = 0;
		}
	}

	ActAnmChkChg( act, 1 );
	act->work[7] = 0;
}

//------------------------------------------
//	âtèªìÆçÏ REG BONUS
//------------------------------------------
static void LcActMoveRegBonus( actWork *act )
{
	s16 dx_tbl[] = {  0,  -40, 0,  0, 48, 0, 24, 0 };
	s16 dy_tbl[] = {  -32, 0, -32, -48, 0, -48, 0, -48 };
	s16 wait_tbl[] = { 16, 12, 16, 0, 0, 4, 8, 8 };

	switch( act->work[0] )
	{
		case 0:
			act->dx = dx_tbl[act->work[6]];
			act->dy = dy_tbl[act->work[6]];
			act->work[1] = wait_tbl[act->work[6]];
			act->work[0]++;
		case 1:
			if( act->work[1]-- == 0 ) act->work[0]++;
			break;
		case 2:
			if( act->dx > 0 ) act->dx -= 4;
			else if( act->dx < 0 ) act->dx += 4;
			if( act->dy > 0 ) act->dy -= 4;
			else if( act->dy < 0 ) act->dy += 4;
			if( act->dx == 0 && act->dy == 0 ) act->work[0]++;
			break;
	}
}

//------------------------------------------
//	âtèªìÆçÏ BIG BONUS
//------------------------------------------
static void LcActMoveBigBonus( actWork *act )
{
	s16 r_pos[] = { 160, 192, 224,
					104, 80, 64, 48, 24 };

	if( act->work[0] == 0 )
	{
		act->work[0]++;
		act->work[1] = 12;
	}

	act->dx = CosMove( r_pos[act->work[6]], act->work[1] );
	act->dy = SinMove( r_pos[act->work[6]], act->work[1] );

	if( act->work[1] ) act->work[1]--;
}

//------------------------------------------
//	âtèªìÆçÏ Insert ≥®›ƒﬁ≥
//------------------------------------------
static void LcActMoveInsertWindow( actWork *act )
{
	switch( act->work[0] )
	{
		case 0:
			Slotst->vb_reg_win_in = WIN_ALL_ON ^ WIN_OBJ_ON;
			Slotst->vb_reg_win_out = WIN_ALL_ON;
			Slotst->vb_reg_win0_v = ((0x04*8)<<8) | (0x11*8);
			act->banish = 1;
			act->work[0]++;
		case 1:
			act->work[1] += 2;
			act->work[2] = (0x16*8) + act->work[1];
			act->work[3] = (0x1e*8) - act->work[1];
			if( act->work[2] > (0x1a*8) ) act->work[2] = 0x1a*8;
			if( act->work[3] < (0x1a*8) ) act->work[3] = 0x1a*8;
			Slotst->vb_reg_win0_h = (act->work[2] << 8) | act->work[3];

			if( act->work[1] >= ((0x6*8)+4) )
			{
				act->work[0]++;
				Slotst->vb_reg_win_in = WIN_ALL_ON;
			}

			break;
		case 2:
			if( Slotst->bet == 0 ) break;

			SetLcAnimeSub( LCACTH_A, DummyActMove, (0x1a*8), (0x0e*8)+4, 0 );
			Slotst->vb_reg_win0_h = ((0x18*8) << 8) | (0x1c*8);
			Slotst->vb_reg_win0_v = (((0x0d)*8) << 8) | (0x10*8);
			Slotst->vb_reg_win_in = WIN_ALL_ON ^ WIN_OBJ_ON;
			act->work[0]++;
			act->work[1] = 0;
		case 3:
			act->work[1] += 2;
			act->work[2] = (0x18*8) + act->work[1];
			act->work[3] = (0x1c*8) - act->work[1];
			if( act->work[2] > (0x1a*8) ) act->work[2] = 0x1a*8;
			if( act->work[3] < (0x1a*8) ) act->work[3] = 0x1a*8;
			Slotst->vb_reg_win0_h = (act->work[2] << 8) | act->work[3];

			if( act->work[1] >= (0x02*8) )
			{
				act->work[0]++;
				Slotst->vb_reg_win_in = WIN_ALL_ON;
			}
	}
}

//------------------------------------------
//	âtèª±∆“å„énññ ñ≥Çµ
//------------------------------------------
static void LcAnimeSettleNothing( void )
{
}

//------------------------------------------
//	âtèª±∆“å„énññ ΩƒØÃﬂ
//------------------------------------------
static void LcAnimeSettleStop( void )
{
	*(vu16*)REG_MOSAIC = 0;								// ”ªﬁ≤∏∏ÿ±
}

//------------------------------------------
//	âtèª±∆“å„énññ èüÇø
//------------------------------------------
static void LcAnimeSettleWin( void )
{
	PaletteWorkSet( LcBallDefaultPalette, LCBALL_PALNO, 32 );
}

//------------------------------------------
//	âtèª±∆“å„énññ Insert
//------------------------------------------
static void LcAnimeSettleInsert( void )
{
	Slotst->vb_reg_win0_h = (0 << 8) | (240);
	Slotst->vb_reg_win0_v = (0 << 8) | (160);
	Slotst->vb_reg_win_in = WIN_ALL_ON;
	Slotst->vb_reg_win_out = WIN_ALL_ON;
}

//======================================================================
//		OBJ
//======================================================================
static void DrumObjSet( void );

//------------------------------------------
//	OBJ Vram æØƒ
//------------------------------------------
static void SetSlotObjVram( void )
{
	DrumObjSet();
	DecordWram( (u8*)ekisho_LZ, OBJ_CH_EKI_TRANS_WORK );
	DecordWram( (u8*)pikaobj_LZ, OBJ_CH_PIKA_TRANS_WORK );
	CellSets( SlotObj_CellData );
	ObjPalSets( SlotObj_PaletteData );
}

//------------------------------------------
//	8x8 ƒﬁ◊—∑¨◊ -> 64x64
//------------------------------------------
static void DrumObjSet( void )
{
	u8 i,count;
	u8 *work_p;

	work_p = CHAR_TEMP_WORK;

	for( count = 0; count < 64; count++ )
	{
		for( i = 0; i < 0x20; i++, work_p++ )
		{
			*work_p = SlotDrumCharacter[i];
		}
	}

	CellSet( &SlotDrum_CellData );
}

//======================================================================
//		BG
//======================================================================
static void SetMapSlot( void );
static void SetMapReelShade( void );

//------------------------------------------
//	BG Vram æØƒ
//------------------------------------------
static void SetSlotBgVram( void )
{
	DecordWram( (u8*)slotbg_LZ, CHAR_TEMP_WORK );
	DIV_DMACOPY( 3, CHAR_TEMP_WORK, BG1_CH_BASE, BG_CHDATA_MAX, 16 );
	PaletteWorkSet( slotbg_Palette, PA_BG0, 0x20*5 );
	PaletteWorkSet( SlotExplainMsgPalette, PA_BG13, 0x20 );
}

//------------------------------------------
//	BG œØÃﬂæØƒ
//------------------------------------------
static void SetSlotBgMap( void )
{
	SetMapSlot();
	SetMapReelShade();
}

//------------------------------------------
//	Ω€ØƒœØÃﬂæØƒ
//------------------------------------------
static void SetMapSlot( void )
{
	s16 x,y;
	u16 *map,*data;
	
	map = (u16*)BG2_MAP_BASE;
	data = (u16*)slotbg_Map;
	
	for( y = 0; y < 0x14; y++ )
	{
		for( x = 0; x < 0x1e; BG_VRAMSET(map,x,y,(*data)), x++, data++ );
	}
}

//------------------------------------------
//	ÿ∞ŸâeæØƒ
//------------------------------------------
static void SetMapReelShade( void )
{
	s16 x,i;
	u16 *map;
	
	map = (u16*)BG3_MAP_BASE;
	
	for( x = 0x04; x < 0x12; x += 0x05 )
	{
		for( i = 0; i < 4; i++ )
		{
			BG_VRAMSET( map, x+i, 0x05, BG_SCRN_DATA(BG_SHADE_CHNO_0,0,0,BG_SHADE_PALNO) );
			BG_VRAMSET( map, x+i, 0x0d, BG_SCRN_DATA(BG_SHADE_CHNO_0,0,1,BG_SHADE_PALNO) );
			BG_VRAMSET( map, x+i, 0x06, BG_SCRN_DATA(BG_SHADE_CHNO_1,0,0,BG_SHADE_PALNO) );
			BG_VRAMSET( map, x+i, 0x0c, BG_SCRN_DATA(BG_SHADE_CHNO_1,0,1,BG_SHADE_PALNO) );
		}

		BG_VRAMSET( map, x, 0x06, BG_SCRN_DATA(BG_SHADE_CHNO_2,0,0,BG_SHADE_PALNO) );
		BG_VRAMSET( map, x, 0x0c, BG_SCRN_DATA(BG_SHADE_CHNO_2,0,1,BG_SHADE_PALNO) );

		for( i = 0x07; i < 0x0c; i++ )
		{
			BG_VRAMSET( map, x, i, BG_SCRN_DATA(BG_SHADE_CHNO_3,0,0,BG_SHADE_PALNO) );
		}
	}
}

//------------------------------------------
//	Œﬁ¿›æØƒ
//------------------------------------------
static void SetMapButton( s16 x, u16 ch0, u16 ch1, u16 ch2, u16 ch3 )
{
	BG_VRAMSET( (u16*)BG2_MAP_BASE, x, 0x0f, BG_SCRN_DATA(ch0,0,0,BG_BTN_PALNO) );
	BG_VRAMSET( (u16*)BG2_MAP_BASE, x + 1, 0x0f, BG_SCRN_DATA(ch1,0,0,BG_BTN_PALNO) );
	BG_VRAMSET( (u16*)BG2_MAP_BASE, x, 0x10, BG_SCRN_DATA(ch2,0,0,BG_BTN_PALNO) );
	BG_VRAMSET( (u16*)BG2_MAP_BASE, x + 1, 0x10, BG_SCRN_DATA(ch3,0,0,BG_BTN_PALNO) );
}

//------------------------------------------
//	BG ê‡ñæâÊñ œØÃﬂ
//------------------------------------------
static void SetMapExplain( void )
{
	s16 x,y;
	u16 *map2,*map3,*data;
	
	map2 = (u16*)BG2_MAP_BASE;
	map3 = (u16*)BG3_MAP_BASE;
	data = (u16*)slotbg_sel_Map;
	
	for( y = 0; y < 0x14; y++ )
	{
		for( x = 0; x < 0x1e; x++, data++ )
		{
			BG_VRAMSET( map2, x, y, (*data) );
			BG_VRAMSET( map3, x, y, 0 );
		}
	}
}

//======================================================================
//		ÿ∞ŸîzóÒ
//======================================================================
//------------------------------------------
//	ÿ∞ŸîzóÒ
//------------------------------------------
static const u8 ReelPattern[3][21] =
{
	{
		CELL_BIG_R,		// 21	0
		CELL_CHERRY,	// 20	1
		CELL_MARIRU,	// 19	2
		CELL_REPLAY,	// 18	3
		CELL_INAZUMA,	// 17	4
		CELL_HASUBO,	// 16	5
		CELL_BIG_B,		// 15	6
		CELL_HASUBO,	// 14	7
		CELL_CHERRY,	// 13	8
		CELL_INAZUMA,	// 12	9
		CELL_REPLAY,	// 11	10
		CELL_MARIRU,	// 10	11
		CELL_BIG_R,		// 9	12
		CELL_INAZUMA,	// 8	13
		CELL_HASUBO,	// 7	14
		CELL_REPLAY,	// 6	15
		CELL_MARIRU,	// 5	16
		CELL_BIG_B,		// 4	17
		CELL_INAZUMA,	// 3	18
		CELL_HASUBO,	// 2	19
		CELL_REPLAY,	// 1	20
	},
	{
		CELL_BIG_R,		// 21	0
		CELL_CHERRY,	// 20	1
		CELL_REPLAY,	// 19	2
		CELL_HASUBO,	// 18	3
		CELL_MARIRU,	// 17	4
		CELL_CHERRY,	// 16	5
		CELL_REPLAY,	// 15	6
		CELL_INAZUMA,	// 14	7
		CELL_INAZUMA,	// 13	8
		CELL_HASUBO,	// 12	9
		CELL_BIG_B,		// 11	10
		CELL_HASUBO,	// 10	11
		CELL_REPLAY,	// 9	12
		CELL_CHERRY,	// 8	13
		CELL_MARIRU,	// 7	14
		CELL_HASUBO,	// 6	15
		CELL_REPLAY,	// 5	16
		CELL_CHERRY,	// 4	17
		CELL_HASUBO,	// 3	18
		CELL_REPLAY,	// 2	19
		CELL_CHERRY,	// 1	20
	},
	{
		CELL_BIG_R,		// 21	0
		CELL_INAZUMA,	// 20	1
		CELL_BIG_B,		// 19	2
		CELL_REPLAY,	// 18	3
		CELL_HASUBO,	// 17	4
		CELL_MARIRU,	// 16	5
		CELL_REPLAY,	// 15	6
		CELL_HASUBO,	// 14	7
		CELL_INAZUMA,	// 13	8
		CELL_MARIRU,	// 12	9
		CELL_REPLAY,	// 11	10
		CELL_HASUBO,	// 10	11
		CELL_MARIRU,	// 9	12
		CELL_INAZUMA,	// 8	13
		CELL_REPLAY,	// 7	14
		CELL_HASUBO,	// 6	15
		CELL_MARIRU,	// 5	16
		CELL_INAZUMA,	// 4	17
		CELL_REPLAY,	// 3	18
		CELL_HASUBO,	// 2	19
		CELL_CHERRY,	// 1	20
	},
};

//------------------------------------------
//	œº›ÿ∞ŸîzóÒ
//------------------------------------------
static const u8 MachineReelPattern[] =
{
	MCREEL_PT_1,
	MCREEL_PT_0,
	MCREEL_PT_5,
	MCREEL_PT_4,
	MCREEL_PT_3,
	MCREEL_PT_2,
};

//------------------------------------------
//	Ω€ØƒäJénéûÿ∞Ÿà íu
//------------------------------------------
static const s16 StartReelGVOffset[3][2] =
{
	{ 0, 6 },
	{ 0, 10 },
	{ 0, 2 },
};

//======================================================================
//		íäëI,ämó¶
//======================================================================
//------------------------------------------
//	Œﬁ∞≈ΩíäëI A	n/256
//------------------------------------------
static const u8 LotteryBonusA[6][3] =
{
	{ 1, 1, 12 },										// 1
	{ 1, 1, 14 },										// 2
	{ 2, 2, 14 },										// 3
	{ 2, 2, 14 },										// 4
	{ 2, 3, 16 },										// 5
	{ 3, 3, 16 }										// 6
};

//------------------------------------------
//	Œﬁ∞≈ΩíäëI B n/256
//------------------------------------------
static const u8 LotteryBonusB[3][6] =
{
	{ 25, 25, 30, 40, 40, 50 },							// ÀﬁØ∏ﬁ
	{ 25, 25, 30, 30, 35, 35 },							// Àﬁ¿
	{ 25, 25, 30, 25, 25, 30 },							// ⁄∑ﬁ≠◊∞
};

//------------------------------------------
//	éqñíäëI n/256
//------------------------------------------
static const u8 LotterySmallRole[5][6] =
{
	{ 20, 25, 25, 20, 25, 25 },							// ≤≈Ωﬁœ
	{ 12, 15, 15, 18, 19, 22 },							// x12
	{ 25, 25, 25, 30, 30, 40 },							// x6
	{ 25, 25, 20, 20, 15, 15 },							// ¡™ÿ∞
	{ 40, 40, 35, 35, 40, 40 },							// ÿÃﬂ⁄≤
};

//------------------------------------------
//	BDíäëI ê‘7 n/256
//------------------------------------------
static const u8 LotteryBDRed[6][17] =					// 16 + 1
{
	{													// 0
		243,243,243,
		80,80,80,80,
		40,40,40,40,40,40,
		5,5,5,
		5,
	},
	{													// 1
		5,5,5,
		150,150,150,150,
		130,130,130,130,130,130,
		100,100,100,
		5,
	},
	{													// 2
		4,4,4,
		20,20,20,20,
		80,80,80,80,80,80,
		100,100,100,
		40,
	},
	{													// 3
		2,2,2,
		3,3,3,3,
		3,3,3,3,3,3,
		45,45,45,
		100,
	},
	{													// 4
		1,1,1,
		2,2,2,2,
		2,2,2,2,2,2,
		5,5,5,
		100,
	},
	{													// 5
		1,1,1,
		1,1,1,1,
		1,1,1,1,1,1,
		1,1,1,
		6,
	},
};

//------------------------------------------
//	BDíäëI ê¬7 n/256
//------------------------------------------
static const u8 LotteryBDBlue[6][17] =					// 16 + 1
{
	{													// 0
		243,243,243,
		200,200,200,200,
		160,160,160,160,160,160,
		70,70,70,
		5,
	},
	{													// 1
		5,5,5,
		25,25,25,25,
		5,5,5,5,5,5,
		2,2,2,
		6,
	},
	{													// 2
		4,4,4,
		25,25,25,25,
		30,30,30,30,30,30,
		40,40,40,
		35,
	},
	{													// 3
		2,2,2,
		3,3,3,3,
		30,30,30,30,30,30,
		100,100,100,
		50,
	},
	{													// 4
		1,1,1,
		2,2,2,2,
		30,30,30,30,30,30,
		40,40,40,
		100,
	},
	{													// 5
		1,1,1,
		1,1,1,1,
		1,1,1,1,1,1,
		4,4,4,
		60,
	},
};

//------------------------------------------
//	BD îöî≠ämó¶ n/256
//------------------------------------------
static const u16 LotteryBDBom[5] =
{ 128, 175, 200, 225, 256 };

//------------------------------------------
//	BD ë¨ìx n/100
//------------------------------------------
static const u16 LotteryBDTimeReelSpeed[5][2] =
{
	{ 10, 5  },											// 0 ~ 150
	{ 10, 10 },											// 150 ~ 200
	{ 10, 15 },											// 200 ~ 250
	{ 10, 25 },											// 250 ~ 300
	{ 10, 35 },											// 300 ~
};

//------------------------------------------
//	BD ë¨ìxïœìÆíl n/100
//------------------------------------------
static const u16 LotteryBDTimeReelSpeedCorrect[5] =
{ 0, 5, 10, 15, 20 };

//------------------------------------------
//	íäëIÀﬁØƒ -> äGïø
//------------------------------------------
static const u8 LotteryPattern[] =
{
	CELL_REPLAY,										// LOTTERY_HITBIT_REPLAY
	CELL_CHERRY,										// LOTTERY_HITBIT_CHERRY
	CELL_HASUBO,										// LOTTERY_HITBIT_6
	CELL_MARIRU,										// LOTTERY_HITBIT_12
	CELL_INAZUMA,										// LOTTERY_HITBIT_INAZUMA
	CELL_BIG_R,											// LOTTERY_HITBIT_BD(¿ﬁ–∞)
	CELL_BIG_R,											// LOTTERY_HITBIT_REG(¿ﬁ–∞)
	CELL_BIG_R,											// LOTTERY_HITBIT_BIG(¿ﬁ–∞)
};

//======================================================================
//		ñ
//======================================================================
//------------------------------------------
//	Œﬁ∞≈ΩíäëIB éÌóﬁ -> íäëIÀﬁØƒ
//------------------------------------------
static const u16 LotteryBonusB_HitBit[] =
{
	LOTTERY_HITBIT_BIG,									// LOTTERY_B_BIG
	LOTTERY_HITBIT_BD,									// LOTTERY_B_BD
	LOTTERY_HITBIT_REG,									// LOTTERY_B_REG
};

//------------------------------------------
//	éqñíäëIéÌóﬁ -> íäëIÀﬁØƒ
//------------------------------------------
static const u16 LotterySmallRole_HitBit[] =
{
	LOTTERY_HITBIT_INAZUMA,								// LOTTERY_S_INAZUMA
	LOTTERY_HITBIT_12,									// LOTTERY_S_12
	LOTTERY_HITBIT_6,									// LOTTERY_S_6
	LOTTERY_HITBIT_CHERRY,								// LOTTERY_S_CHERRY
	LOTTERY_HITBIT_REPLAY,								// LOTTERY_S_REPLAY
};

//------------------------------------------
//	äGïø -> ìñÇË
//------------------------------------------
static const u8 HitReelPattern[7] =
{
	HIT_BONUS_RED,										// CELL_BIG_R
	HIT_BONUS_BLUE,										// CELL_BIT_B
	HIT_MARIRU,											// CELL_MARIRU
	HIT_HASUBO,											// CELL_HASUBO
	HIT_CHERRY,											// CELL_CHERRY
	HIT_INAZUMA,										// CELL_INAZUMA
	HIT_REPLAY,											// CELL_REPLAY
};

//------------------------------------------
//	ÀØƒÀﬁØƒ
//------------------------------------------
static const u16 HitReelBit[9] =
{
	BIT_CHERRY,											// HIT_CHERRY
	BIT_CHERRY_4,										// HIT_CHERRY_4
	BIT_REPLAY,											// HIT_REPLAY
	BIT_HASUBO,											// HIT_HASUBO
	BIT_MARIRU,											// HIT_MARIRU
	BIT_INAZUMA,										// HIT_INAZUMA
	BIT_REGULAR,										// HIT_REGULAR
	BIT_BIG_RED,										// HIT_BONUS_RED
	BIT_BIG_BLUE,										// HIT_BONUS_BLUE
};

//------------------------------------------
//	ï•Ç¢ñﬂÇµ
//------------------------------------------
static const s16 Payout[9] =
{
	2,													// HIT_CHERRY
	4,													// HIT_CHERRY_4
	0,													// HIT_REPLAY
	6,													// HIT_HASUBO
	12,													// HIT_MARIRU
	3,													// HIT_INAZUMA
	90,													// HIT_REGULAR
	300,												// HIT_BONUS_RED
	300,												// HIT_BONUS_BLUE
};

//======================================================================
//		âtèª±∆“
//======================================================================
//------------------------------------------
//	âtèª±∆“±∏¿∞ç¿ïW√∞ÃﬁŸ
//------------------------------------------
static const s16 LcActStartPosTbl[][2] =
{
	{ 0x1a*8, 0x07*8 },									// LCACT_Insert
	{ 0x17*8, 0x00*8 },									// LCACT_Stop_S
	{ 0x19*8, 0x01*8 },									// LCACT_Stop_T
	{ 0x1b*8, 0x02*8 },									// LCACT_Stop_O
	{ 0x1d*8, 0x03*8 },									// LCACT_Stop_P
	{ 0x1a*8, 0x09*8 },									// LCACT_A
	{ 0x1a*8, 0x01*8 },									// LCACT_Ball
	{ 0x1a*8, 0x08*8 },									// LCACT_Win
	{ 0x1a*8, 0x07*8 },									// LCACT_Lose
	{ 0x18*8, 0x0b*8 },									// LCACT_Kemuri0
	{ 0x1c*8, 0x0b*8 },									// LCACT_Kemuri1
	{ 0x18*8, 0x0f*8 },									// LCACT_Kemuri2
	{ 0x1c*8, 0x0f*8 },									// LCACT_Kemuri3
	{ 0x12*8, 0x07*8 },									// LCACT_BD
	{ 0x22*8, 0x0b*8 },									// LCACT_Time
	{ 0x15*8, 0x0e*8 },									// LCACT_Num
	{ 0x1a*8, (0x0a*8)+4 },								// LCACT_Key
	{ 0x1a*8, 0x0e*8 },									// LCACT_WinBall
	{ (0x17*8)+4, (0x06*8)+4 },							// LCACT_Reg_B
	{ (0x1a*8), (0x06*8)+4},							// LCACT_Reg_I
	{ (0x1c*8)+4, (0x06*8)+4 },							// LCACT_Reg_G
	{ (0x17*8), (0x09*8) },								// LCACT_RegBonus_B
	{ (0x18*8)+4, (0x09*8) },							// LCACT_RegBonus_O
	{ (0x1a*8), (0x09*8) },								// LCACT_RegBonus_N
	{ (0x1b*8)+4, (0x09*8) },							// LCACT_RegBonus_U
	{ (0x1d*8), (0x09*8) },								// LCACT_RegBonus_S
	{ (0x17*8)+4, (0x06*8)+4 },							// LCACT_Big_B
	{ (0x1a*8), (0x06*8)+4},							// LCACT_Big_I
	{ (0x1c*8)+4, (0x06*8)+4 },							// LCACT_Big_G
	{ (0x17*8), (0x09*8) },								// LCACT_BigBonus_B
	{ (0x18*8)+4, (0x09*8) },							// LCACT_BigBonus_O
	{ (0x1a*8), (0x09*8) },								// LCACT_BigBonus_N
	{ (0x1b*8)+4, (0x09*8) },							// LCACT_BigBonus_U
	{ (0x1d*8), (0x09*8) },								// LCACT_BigBonus_S
	{ 0, 0 },											// LCACT_InsertWindow
};

//------------------------------------------
//	âtèª±∆“±∏¿∞ìÆçÏ√∞ÃﬁŸ
//------------------------------------------
static void (* const LcActMoveTbl[])( actWork * ) =
{
	LcActMoveNothing,									// LCACT_Insert
	LcActMoveStop,										// LCACT_Stop_S
	LcActMoveStop,										// LCACT_Stop_T
	LcActMoveStop,										// LCACT_Stop_O
	LcActMoveStop,										// LCACT_Stop_P
	LcActMoveA,											// LCACT_A
	LcActMoveBall,										// LCACT_Ball
	LcActMoveNothing,									// LCACT_Win
	LcActMoveNothing,									// LCACT_Lose
	LcActMoveKemuri0,									// LCACT_Kemuri0
	LcActMoveKemuri1,									// LCACT_Kemuri1
	LcActMoveKemuri2,									// LCACT_Kemuri2
	LcActMoveKemuri3,									// LCACT_Kemuri3
	LcActMoveBD,										// LCACT_BD
	LcActMoveTime,										// LCACT_Time
	LcActMoveNum,										// LCACT_Num
	LcActMoveNothing,									// LCACT_Key
	LcActMoveWinBall,									// LCACT_WinBall
	LcActMoveRegBonus,									// LCACT_Reg_B
	LcActMoveRegBonus,									// LCACT_Reg_I
	LcActMoveRegBonus,									// LCACT_Reg_G
	LcActMoveRegBonus,									// LCACT_BonusReg_B
	LcActMoveRegBonus,									// LCACT_BonusReg_O
	LcActMoveRegBonus,									// LCACT_BonusReg_N
	LcActMoveRegBonus,									// LCACT_BonusReg_U
	LcActMoveRegBonus,									// LCACT_BonusReg_S
	LcActMoveBigBonus,									// LCACT_Big_B
	LcActMoveBigBonus,									// LCACT_Big_I
	LcActMoveBigBonus,									// LCACT_Big_G
	LcActMoveBigBonus,									// LCACT_Bonus_B
	LcActMoveBigBonus,									// LCACT_Bonus_O
	LcActMoveBigBonus,									// LCACT_Bonus_N
	LcActMoveBigBonus,									// LCACT_Bonus_U
	LcActMoveBigBonus,									// LCACT_Bonus_S
	LcActMoveInsertWindow,								// LCACT_InsertWindow
};

//------------------------------------------
//	âtèª±∆“±∏¿∞îzíu√∞ÃﬁŸ
//------------------------------------------
static const LCACTDATA LcActDataInsert[] =				// Insert
{
	{ LCACTH_InsertWindow, LCACT_InsertWindow, 0 },
	{ LCACTH_Insert, LCACT_Insert, 0 },
	{ LCACTH_Key, LCACT_Key, 0 },
	{ LCACT_END, 0, 0 },
};

static const LCACTDATA LcActDataStop[] =				// Stop
{
	{ LCACTH_Stop_S, LCACT_Stop_S, 0 },
	{ LCACTH_Stop_T, LCACT_Stop_T, 0 },
	{ LCACTH_Stop_O, LCACT_Stop_O, 0 },
	{ LCACTH_Stop_P, LCACT_Stop_P, 0 },
	{ LCACTH_A, LCACT_A, 0 },
	{ LCACTH_Ball, LCACT_Ball, 0 },
	{ LCACT_END, 0, 0 },
};

static const LCACTDATA LcActDataWin[] =					// Win
{
	{ LCACTH_Win, LCACT_Win, 0 },
	{ LCACTH_Ball, LCACT_WinBall, 0 },
	{ LCACT_END, 0, 0 },
};

static const LCACTDATA LcActDataLose[] =				// Lose
{
	{ LCACTH_Lose, LCACT_Lose, 0 },
	{ LCACTH_Kemuri, LCACT_Kemuri0, 0 },
	{ LCACTH_Kemuri, LCACT_Kemuri1, 1 },
	{ LCACTH_Kemuri, LCACT_Kemuri2, 2 },
	{ LCACTH_Kemuri, LCACT_Kemuri3, 3 },
	{ LCACT_END, 0, 0 },
};

static const LCACTDATA LcActDataBDTime[] =				// BDTime
{
	{ LCACTH_BD, LCACT_BD, 0 },
	{ LCACTH_Time, LCACT_Time, 0 },
	{ LCACTH_Num, LCACT_Num, 0 },
	{ LCACT_END, 0, 0 },
};

static const LCACTDATA LcActDataBigBonus[] =
{
	{ LCACTH_Big_B, LCACT_Big_B, 0 },
	{ LCACTH_Big_I, LCACT_Big_I, 1 },
	{ LCACTH_Big_G, LCACT_Big_G, 2 },
	{ LCACTH_Bonus_B, LCACT_BonusBig_B, 3 },
	{ LCACTH_Bonus_O, LCACT_BonusBig_O, 4 },
	{ LCACTH_Bonus_N, LCACT_BonusBig_N, 5 },
	{ LCACTH_Bonus_U, LCACT_BonusBig_U, 6 },
	{ LCACTH_Bonus_S, LCACT_BonusBig_S, 7 },
	{ LCACTH_Ball, LCACT_WinBall, 0 },
	{ LCACT_END, 0, 0 },
};

static const LCACTDATA LcActDataRegBonus[] =
{
	{ LCACTH_Reg_R, LCACT_Reg_R, 0 },
	{ LCACTH_Reg_E, LCACT_Reg_E, 1 },
	{ LCACTH_Reg_G, LCACT_Reg_G, 2 },
	{ LCACTH_Bonus_B, LCACT_BonusReg_B, 3 },
	{ LCACTH_Bonus_O, LCACT_BonusReg_O, 4 },
	{ LCACTH_Bonus_N, LCACT_BonusReg_N, 5 },
	{ LCACTH_Bonus_U, LCACT_BonusReg_U, 6 },
	{ LCACTH_Bonus_S, LCACT_BonusReg_S, 7 },
	{ LCACTH_Ball, LCACT_WinBall, 0 },
	{ LCACT_END, 0, 0 },
};

static const LCACTDATA * const LcAnimeDataTbl[] =
{
	LcActDataInsert,									// Insert
	LcActDataStop,										// Stop
	LcActDataWin,										// Win
	LcActDataLose,										// Lose
	LcActDataBDTime,									// BDTime
	LcActDataRegBonus,									// RegBonus
	LcActDataBigBonus,									// BigBonus
};

//------------------------------------------
//	âtèª±∆“å„énññèàóù√∞ÃﬁŸ
//------------------------------------------
static void (* const LcAnimeSettleTbl[])( void ) =
{
	LcAnimeSettleInsert,								// Insert
	LcAnimeSettleStop,									// Stop
	LcAnimeSettleWin,									// Win
	LcAnimeSettleNothing,								// Lose
	LcAnimeSettleNothing,								// BDTime
	LcAnimeSettleWin,									// RegBonus
	LcAnimeSettleWin,									// BigBonus
};

//======================================================================
//		±∏¿∞√ﬁ∞¿
//======================================================================
//------------------------------------------
//	OAM
//------------------------------------------
static const ActOamData oam8x8 =
{
	0,							// u32 VPos:8
	0,							// u32 AffineMode:2
	0,							// u32 ObjMode:2
	0,							// u32 Mosaic:1
	0,							// u32 ColorMode:1
	0,							// u32 Shape:2
	0,							// u32 HPos:9
	0,							// u32 AffineParamNo:5
	0,							// u32 Size:2
	0,							// u32 CharNo:10
	0,							// u32 Priority:2
	0,							// u32 Pltt:3
	0,							// AffineWork
};

static const ActOamData oam8x16 =
{
	0,							// u32 VPos:8
	0,							// u32 AffineMode:2
	0,							// u32 ObjMode:2
	0,							// u32 Mosaic:1
	0,							// u32 ColorMode:1
	2,							// u32 Shape:2
	0,							// u32 HPos:9
	0,							// u32 AffineParamNo:5
	0,							// u32 Size:2
	0,							// u32 CharNo:10
	0,							// u32 Priority:2
	0,							// u32 Pltt:3
	0,							// AffineWork
};

static const ActOamData oam16x16 =
{
	0,							// u32 VPos:8
	0,							// u32 AffineMode:2
	0,							// u32 ObjMode:2
	0,							// u32 Mosaic:1
	0,							// u32 ColorMode:1
	0,							// u32 Shape:2
	0,							// u32 HPos:9
	0,							// u32 AffineParamNo:5
	1,							// u32 Size:2
	0,							// u32 CharNo:10
	0,							// u32 Priority:2
	0,							// u32 Pltt:3
	0,							// AffineWork
};

static const ActOamData oam16x32 =
{
	0,							// u32 VPos:8
	0,							// u32 AffineMode:2
	0,							// u32 ObjMode:2
	0,							// u32 Mosaic:1
	0,							// u32 ColorMode:1
	2,							// u32 Shape:2
	0,							// u32 HPos:9
	0,							// u32 AffineParamNo:5
	2,							// u32 Size:2
	0,							// u32 CharNo:10
	0,							// u32 Priority:2
	0,							// u32 Pltt:3
	0,							// AffineWork
};

static const ActOamData oam32x32 =
{
	0,							// u32 VPos:8
	0,							// u32 AffineMode:2
	0,							// u32 ObjMode:2
	0,							// u32 Mosaic:1
	0,							// u32 ColorMode:1
	0,							// u32 Shape:2
	0,							// u32 HPos:9
	0,							// u32 AffineParamNo:5
	2,							// u32 Size:2
	0,							// u32 CharNo:10
	0,							// u32 Priority:2
	0,							// u32 Pltt:3
	0,							// AffineWork
};

static const ActOamData oam32x64 =
{
	0,							// u32 VPos:8
	0,							// u32 AffineMode:2
	0,							// u32 ObjMode:2
	0,							// u32 Mosaic:1
	0,							// u32 ColorMode:1
	2,							// u32 Shape:2
	0,							// u32 HPos:9
	0,							// u32 AffineParamNo:5
	3,							// u32 Size:2
	0,							// u32 CharNo:10
	0,							// u32 Priority:2
	0,							// u32 Pltt:3
	0,							// AffineWork
};

static const ActOamData oam64x32 =
{
	0,							// u32 VPos:8
	0,							// u32 AffineMode:2
	0,							// u32 ObjMode:2
	0,							// u32 Mosaic:1
	0,							// u32 ColorMode:1
	1,							// u32 Shape:2
	0,							// u32 HPos:9
	0,							// u32 AffineParamNo:5
	3,							// u32 Size:2
	0,							// u32 CharNo:10
	0,							// u32 Priority:2
	0,							// u32 Pltt:3
	0,							// AffineWork
};

static const ActOamData oam64x64 =
{
	0,							// u32 VPos:8
	0,							// u32 AffineMode:2
	0,							// u32 ObjMode:2
	0,							// u32 Mosaic:1
	0,							// u32 ColorMode:1
	0,							// u32 Shape:2
	0,							// u32 HPos:9
	0,							// u32 AffineParamNo:5
	3,							// u32 Size:2
	0,							// u32 CharNo:10
	0,							// u32 Priority:2
	0,							// u32 Pltt:3
	0,							// AffineWork
};

//------------------------------------------
//	æŸ√ﬁ∞¿
//------------------------------------------
static const actAnmData Pikachuu_celltrans[] =
{
	{ &OBJ_CH_PIKA_TRANS_WORK[(0x20*64)*0], 0x20*64 },
	{ &OBJ_CH_PIKA_TRANS_WORK[(0x20*64)*1], 0x20*64 },
	{ &OBJ_CH_PIKA_TRANS_WORK[(0x20*64)*2], 0x20*64 },
	{ &OBJ_CH_PIKA_TRANS_WORK[(0x20*64)*3], 0x20*64 },
	{ &OBJ_CH_PIKA_TRANS_WORK[(0x20*64)*4], 0x20*64 },
};

static const actAnmData MachineUp_celltrans[] =
{
	{ &OBJ_CH_PIKA_TRANS_WORK[((0x20*64)*5)], 0x20*24 },
};

static const actAnmData MachineDown_celltrans[] =
{
	{ &OBJ_CH_PIKA_TRANS_WORK[((0x20*64)*5)+(0x20*24)], 0x20*40 },
};

static const actAnmData MachineBreak_celltrans[] =
{
	{ &OBJ_CH_PIKA_TRANS_WORK[(0x20*0x180)], 0x20*48 },
};

static const actAnmData MachineNo_celltrans[] =
{
	{ &etcobj_Character[(0x20*0x1a)+((0x20*0x04)*0)], 0x20*4 },
	{ &etcobj_Character[(0x20*0x1a)+((0x20*0x04)*1)], 0x20*4 },
	{ &etcobj_Character[(0x20*0x1a)+((0x20*0x04)*2)], 0x20*4 },
	{ &etcobj_Character[(0x20*0x1a)+((0x20*0x04)*3)], 0x20*4 },
	{ &etcobj_Character[(0x20*0x1a)+((0x20*0x04)*4)], 0x20*4 },
	{ &etcobj_Character[(0x20*0x1a)+((0x20*0x04)*5)], 0x20*4 },
};

static const actAnmData MachineShade_celltrans[] =
{
	{ &etcobj_Character[0x20*0x62], 0x20*16 },
};

static const actAnmData MachineBack_celltrans[] =
{
	{ &etcobj_Character[0x20*0x93], 0x20*2 },
};

static const actAnmData Inazuma_celltrans[] =
{
	{ &etcobj_Character[(0x20*0x32)+((0x20*0x08)*0)], 0x20*8 },
	{ &etcobj_Character[(0x20*0x32)+((0x20*0x08)*1)], 0x20*8 },
};

static const actAnmData PikaFlash_celltrans[] =
{
	{ &etcobj_Character[(0x20*0x72)], 0x20*32 },
};

static const actAnmData Bom_celltrans[] =
{
	{ &etcobj_Character[(0x20*0x42)+((0x20*16)*0)], 0x20*16 },
	{ &etcobj_Character[(0x20*0x42)+((0x20*16)*1)], 0x20*16 },
};

static const actAnmData Star_celltrans[] =
{
	{ &etcobj_Character[0x20*0x15], 0x20*1 },
};

static const actAnmData Smoke_celltrans[] =
{
	{ &etcobj_Character[0x20*0x16], 0x20*4 },
};

static const actAnmData lc_bt_celltrans[] =
{
	{ &OBJ_CH_EKI_TRANS_WORK[(0x20*0)], 0x20*48 },
};

static const actAnmData lc_time_celltrans[] =
{
	{ &OBJ_CH_EKI_TRANS_WORK[(0x20*0x30)], 0x20*16 },
};

static const actAnmData lc_insert_celltrans[] =
{
	{ &OBJ_CH_EKI_TRANS_WORK[(0x20*0x40)], 0x20*16 },
};

static const actAnmData lc_stop_celltrans[] =
{
	{ &OBJ_CH_EKI_TRANS_WORK[(0x20*0x50)], 0x20*16 },
};

static const actAnmData lc_win_celltrans[] =
{
	{ &OBJ_CH_EKI_TRANS_WORK[(0x20*0x60)], 0x20*24 },
};

static const actAnmData lc_lose_celltrans[] =
{
	{ &OBJ_CH_EKI_TRANS_WORK[(0x20*0x80)], 0x20*32 },
};

static const actAnmData lc_bonus_celltrans[] =
{
	{ &OBJ_CH_EKI_TRANS_WORK[(0x20*0xa0)], 0x20*16 },
};

static const actAnmData lc_big_celltrans[] =
{
	{ &OBJ_CH_EKI_TRANS_WORK[(0x20*0xb0)], 0x20*24 },
};

static const actAnmData lc_reg_celltrans[] =
{
	{ &OBJ_CH_EKI_TRANS_WORK[(0x20*0xc8)], 0x20*24 },
};

static const actAnmData lc_a_celltrans[] =
{
	{ &OBJ_CH_EKI_TRANS_WORK[(0x20*0xe0)], 0x20*16 },
	{ &OBJ_CH_EKI_TRANS_WORK[(0x20*0xf0)], 0x20*16 },
};

static const actAnmData lc_a1_celltrans[] =
{
	{ &OBJ_CH_EKI_TRANS_WORK[(0x20*0xf0)], 0x20*16 },
};

static const actAnmData lc_kemuri_celltrans[] =
{
	{ &OBJ_CH_EKI_TRANS_WORK[(0x20*0x100)], 0x20*20 },
};

static const actAnmData lc_num_celltrans[] =
{
	{ &OBJ_CH_EKI_TRANS_WORK[(0x20*0x114)], 0x20*4 },
	{ &OBJ_CH_EKI_TRANS_WORK[(0x20*0x118)], 0x20*4 },
	{ &OBJ_CH_EKI_TRANS_WORK[(0x20*0x11c)], 0x20*4 },
	{ &OBJ_CH_EKI_TRANS_WORK[(0x20*0x120)], 0x20*4 },
	{ &OBJ_CH_EKI_TRANS_WORK[(0x20*0x124)], 0x20*4 },
};

static const actAnmData lc_ball_celltrans[] =
{
	{ &OBJ_CH_EKI_TRANS_WORK[(0x20*0x130)], 0x20*36 },
	{ &OBJ_CH_EKI_TRANS_WORK[(0x20*0x154)], 0x20*36 },
};

static const actAnmData lc_key_celltrans[] =
{
	{ &OBJ_CH_EKI_TRANS_WORK[(0x20*0x178)], 0x20*12 },
	{ &OBJ_CH_EKI_TRANS_WORK[(0x20*0x184)], 0x20*12 },
};

static const actAnmData InazumaGauge_celltrans[] =
{
	{ &etcobj_Character[(0x20*0x14)], 0x20 },
};

//------------------------------------------
//	±∆“
//------------------------------------------
static const actAnm SlotAnimeNothing[] =
{
	{ 0, 1, 0, 0 },
	{ ACT_ANMEND, 0, 0, 0 },
};

static const actAnm SlotAnimeNothingLoop[] =
{
	{ 0, 1, 0, 0 },
	{ ACT_ANMLOOP, 0, 0, 0 },
};

static const actAnm PikachuuAnime0[] =
{
	{ 0, 16, 0, 0 },
	{ ACT_ANMEND, 0, 0, 0 },
};

static const actAnm PikachuuAnime1[] =
{
	{ 1, 16, 0, 0 },
	{ 0, 16, 0, 0 },
	{ ACT_ANMLOOP, 0, 0, 0 },
};

static const actAnm PikachuuAnime2[] =
{
	{ 1, 8, 0, 0 },
	{ 0, 8, 0, 0 },
	{ ACT_ANMLOOP, 0, 0, 0 },
};

static const actAnm PikachuuAnime3[] =
{
	{ 1, 4, 0, 0 },
	{ 0, 4, 0, 0 },
	{ ACT_ANMLOOP, 0, 0, 0 },
};

static const actAnm PikachuuAnime4[] =
{
	{ 2, 32, 0, 0 },
	{ 3, 32, 0, 0 },
	{ ACT_ANMLOOP, 0, 0, 0 },
};

static const actAnm PikachuuAnime5[] =
{
	{ 4, 1, 0, 0 },
	{ ACT_ANMEND, 0, 0, 0 },
};

static const actAnm MachineNoAnime0[] =
{
	{0,1,0,0},
	{ACT_ANMEND,0,0,0},
};

static const actAnm MachineNoAnime1[] =
{
	{1,1,0,0},
	{ACT_ANMEND,0,0,0},
};

static const actAnm MachineNoAnime2[] =
{
	{2,1,0,0},
	{ACT_ANMEND,0,0,0},
};

static const actAnm MachineNoAnime3[] =
{
	{3,1,0,0},
	{ACT_ANMEND,0,0,0},
};

static const actAnm MachineNoAnime4[] =
{
	{4,1,0,0},
	{ACT_ANMEND,0,0,0},
};

static const actAnm MachineNoAnime5[] =
{
	{5,1,0,0},
	{ACT_ANMEND,0,0,0},
};

static const actAnm InazumaAnime0[] =
{
	{ 0, 4, 0, 0 },
	{ 1, 4, 0, 0 },
	{ ACT_ANMLOOP, 0, 0, 0 },
};

static const actAnm BomAnime0[] =
{
	{ 0, 16, 0, 0 },
	{ 1, 16, 0, 0 },
	{ ACT_ANMLOOP, 0, 0, 0 },
};

static const actAnm LcAnime_A0[] =
{
	{ 0, 30, 0, 0 },
	{ 1, 30, 0, 0 },
	{ ACT_ANMLOOP, 0, 0, 0 },
};

static const actAnm LcAnime_A1[] =
{
	{ 1, 1, 0, 0 },
	{ ACT_ANMEND, 0, 0, 0 },
};

static const actAnm LcAnime_Key0[] =
{
	{ 0, 30, 0, 0 },
	{ 1, 30, 0, 0 },
	{ ACT_ANMLOOP, 0, 0, 0 },
};

static const actAnm LcAnime_Ball0[] =
{
	{ 0, 16, 0, 0 },
	{ 1, 16, 0, 0 },
	{ 0, 16, 0, 0 },
	{ 1, 16, 1, 0 },
	{ ACT_ANMLOOP, 0, 0, 0 },
};

static const actAnm LcAnime_Ball1[] =
{
	{ 0, 1, 0, 0 },
	{ ACT_ANMEND, 0, 0, 0 },
};

static const actAnm LcAnime_Num0[] =
{
	{ 0, 1, 0, 0 },
	{ ACT_ANMEND, 0, 0, 0 },
};

static const actAnm LcAnime_Num1[] =
{
	{ 1, 1, 0, 0 },
	{ ACT_ANMEND, 0, 0, 0 },
};

static const actAnm LcAnime_Num2[] =
{
	{ 2, 1, 0, 0 },
	{ ACT_ANMEND, 0, 0, 0 },
};

static const actAnm LcAnime_Num3[] =
{
	{ 3, 1, 0, 0 },
	{ ACT_ANMEND, 0, 0, 0 },
};

static const actAnm LcAnime_Num4[] =
{
	{ 4, 1, 0, 0 },
	{ ACT_ANMEND, 0, 0, 0 },
};

static const actAnm * const SlotAnimeNothingTbl[] =
{
	SlotAnimeNothing,
};

static const actAnm * const SlotAnimeNothingLoopTbl[] =
{
	SlotAnimeNothingLoop,
};

static const actAnm * const PikachuuAnimeTbl[] =
{
	PikachuuAnime0,
	PikachuuAnime1,
	PikachuuAnime2,
	PikachuuAnime3,
	PikachuuAnime4,
	PikachuuAnime5,
};

static const actAnm * const MachineNoAnimeTbl[] =
{
	MachineNoAnime0,
	MachineNoAnime1,
	MachineNoAnime2,
	MachineNoAnime3,
	MachineNoAnime4,
	MachineNoAnime5,
};

static const actAnm * const InazumaAnimeTbl[] =
{
	InazumaAnime0,
};

static const actAnm * const BomAnimeTbl[] =
{
	BomAnime0,
};

static const actAnm * const LcAnime_A_Tbl[] =
{
	LcAnime_A0,
	LcAnime_A1,
};

static const actAnm * const LcAnime_Key_Tbl[] =
{
	LcAnime_Key0,
};

static const actAnm * const LcAnime_Ball_Tbl[] =
{
	LcAnime_Ball0,
	LcAnime_Ball1,
};

static const actAnm * const LcAnime_Num_Tbl[] =
{
	LcAnime_Num0,
	LcAnime_Num1,
	LcAnime_Num2,
	LcAnime_Num3,
	LcAnime_Num4,
};

//------------------------------------------
//	ägèk±∆“
//------------------------------------------
static const actAffAnm SmokeAffAnime0[] =
{
	{ 0x10, 0x10, 0, ACT_AFSET },
	{ ACT_AFcLOOP, 0, 0, 0 },
	{ 1, 1, 0, 1 },
	{ ACT_AFcLOOP, 0xff, 0, 0 },
	{ ACT_AFEND, 0, 0, 0 },
};

static const actAffAnm * const SmokeAffAnimeTbl[] =
{
	SmokeAffAnime0,
};

static const actAffAnm InazumaGaugeAffAnime0[] =
{
	{ 0, 0, 8, 32 },
	{ 0, 0, 6, 32 },
	{ 0, 0, 4, 16 },
	{ 0, 0, 12, 2 },
	{ 0, 0, -12, 4 },
	{ 0, 0, 12, 2 },
	{ 0, 0, 12, 2 },
	{ 0, 0, -12, 4 },
	{ 0, 0, 12, 2 },
	{ ACT_AFEND, 0, 0, 0 },
};

static const actAffAnm * const InazumaGaugeAffAnimeTbl[] =
{
	InazumaGaugeAffAnime0,
};

//------------------------------------------
//	±∏¿∞ÕØ¿ﬁ
//------------------------------------------
static const actHeader ReelPatternActHead =
{
	CELL_BIG_R,
	PAL_OBJ_0,
	&oam32x32,
	SlotAnimeNothingTbl,
	ACT_NTRANS,
	DummyActAffTbl,
	ReelPatternActMove,
};

static const actHeader NumberActHead =
{
	CELL_NUM0,
	PAL_OBJ_4,
	&oam8x16,
	SlotAnimeNothingTbl,
	ACT_NTRANS,
	DummyActAffTbl,
	NumberActMove,
};

static const actHeader DrumActHead =
{
	CELL_DRUM,
	PAL_OBJ_0,
	&oam64x64,
	SlotAnimeNothingTbl,
	ACT_NTRANS,
	DummyActAffTbl,
	DummyActMove,
};

static const actHeader PikachuuActHead =
{
	ACT_TMODE,
	PAL_OBJ_1,
	&oam64x64,
	PikachuuAnimeTbl,
	Pikachuu_celltrans,
	DummyActAffTbl,
	PikachuuActMove,
};

static const actHeader MachineUpActHead =
{
	ACT_TMODE,
	PAL_OBJ_2,
	&oam8x16,
	SlotAnimeNothingTbl,
	MachineUp_celltrans,
	DummyActAffTbl,
	DummyActMove,
};

static const actHeader MachineDownActHead =
{
	ACT_TMODE,
	PAL_OBJ_3,
	&oam8x16,
	SlotAnimeNothingTbl,
	MachineDown_celltrans,
	DummyActAffTbl,
	DummyActMove,
};

static const actHeader MachineBreakActHead =
{
	ACT_TMODE,
	PAL_OBJ_3,
	&oam8x16,
	SlotAnimeNothingTbl,
	MachineBreak_celltrans,
	DummyActAffTbl,
	DummyActMove,
};

static const actHeader MachineNoActHead =
{
	ACT_TMODE,
	PAL_OBJ_4,
	&oam16x16,
	MachineNoAnimeTbl,
	MachineNo_celltrans,
	DummyActAffTbl,
	MachineNoActMove,
};

static const actHeader MachineShadeActHead =
{
	ACT_TMODE,
	PAL_OBJ_4,
	&oam16x16,
	SlotAnimeNothingTbl,
	MachineShade_celltrans,
	DummyActAffTbl,
	DummyActMove,
};

static const actHeader MachineBackActHead =
{
	ACT_TMODE,
	PAL_OBJ_4,
	&oam16x16,
	SlotAnimeNothingTbl,
	MachineBack_celltrans,
	DummyActAffTbl,
	DummyActMove,
};

static const actHeader InazumaActHead =
{
	ACT_TMODE,
	PAL_OBJ_4,
	&oam16x32,
	InazumaAnimeTbl,
	Inazuma_celltrans,
	DummyActAffTbl,
	InazumaActMove,
};

static const actHeader PikaFlashActHead =
{
	ACT_TMODE,
	PAL_OBJ_7,
	&oam32x64,
	SlotAnimeNothingTbl,
	PikaFlash_celltrans,
	DummyActAffTbl,
	PikaFlashActMove,
};

static const actHeader BomActHead =
{
	ACT_TMODE,
	PAL_OBJ_5,
	&oam32x32,
	BomAnimeTbl,
	Bom_celltrans,
	DummyActAffTbl,
	BomActMove,
};

static const actHeader StarActHead =
{
	ACT_TMODE,
	PAL_OBJ_4,
	&oam8x8,
	SlotAnimeNothingLoopTbl,
	Star_celltrans,
	DummyActAffTbl,
	StarActMove,
};

static const actHeader SmokeActHead =
{
	ACT_TMODE,
	PAL_OBJ_4,
	&oam16x16,
	SlotAnimeNothingTbl,
	Smoke_celltrans,
	SmokeAffAnimeTbl,
	SmokeActMove,
};

static const actHeader LcBD_ActHead =
{
	ACT_TMODE,
	PAL_OBJ_6,
	&oam8x8,
	SlotAnimeNothingTbl,
	lc_bt_celltrans,
	DummyActAffTbl,
	DummyActMove,
};

static const actHeader LcTime_ActHead =
{
	ACT_TMODE,
	PAL_OBJ_6,
	&oam8x8,
	SlotAnimeNothingTbl,
	lc_time_celltrans,
	DummyActAffTbl,
	DummyActMove,
};

static const actHeader LcInsert_ActHead =
{
	ACT_TMODE,
	PAL_OBJ_6,
	&oam8x8,
	SlotAnimeNothingTbl,
	lc_insert_celltrans,
	DummyActAffTbl,
	DummyActMove,
};

static const actHeader LcStop_ActHead =
{
	CELL_LC_STOP,
	PAL_OBJ_6,
	&oam8x8,
	SlotAnimeNothingTbl,
	lc_stop_celltrans,
	DummyActAffTbl,
	DummyActMove,
};

static const actHeader LcWin_ActHead =
{
	ACT_TMODE,
	PAL_OBJ_6,
	&oam64x32,
	SlotAnimeNothingTbl,
	lc_win_celltrans,
	DummyActAffTbl,
	DummyActMove,
};

static const actHeader LcLose_ActHead =
{
	ACT_TMODE,
	PAL_OBJ_6,
	&oam64x32,
	SlotAnimeNothingTbl,
	lc_lose_celltrans,
	DummyActAffTbl,
	DummyActMove,
};

static const actHeader LcBonus_ActHead =
{
	CELL_LC_BONUS,
	PAL_OBJ_6,
	&oam8x8,
	SlotAnimeNothingTbl,
	lc_bonus_celltrans,
	DummyActAffTbl,
	DummyActMove,
};

static const actHeader LcBig_ActHead =
{
	CELL_LC_BIG,
	PAL_OBJ_6,
	&oam8x8,
	SlotAnimeNothingTbl,
	lc_big_celltrans,
	DummyActAffTbl,
	DummyActMove,
};

static const actHeader LcReg_ActHead =
{
	CELL_LC_REG,
	PAL_OBJ_6,
	&oam8x8,
	SlotAnimeNothingTbl,
	lc_reg_celltrans,
	DummyActAffTbl,
	DummyActMove,
};

static const actHeader LcA_ActHead =
{
	ACT_TMODE,
	PAL_OBJ_6,
	&oam32x32,
	LcAnime_A_Tbl,
	lc_a_celltrans,
	DummyActAffTbl,
	DummyActMove,
};

static const actHeader LcKemuri_ActHead =
{
	ACT_TMODE,
	PAL_OBJ_6,
	&oam8x8,
	SlotAnimeNothingTbl,
	lc_kemuri_celltrans,
	DummyActAffTbl,
	DummyActMove,
};

static const actHeader LcNum_ActHead =
{
	ACT_TMODE,
	PAL_OBJ_6,
	&oam16x16,
	LcAnime_Num_Tbl,
	lc_num_celltrans,
	DummyActAffTbl,
	DummyActMove,
};

static const actHeader LcBall_ActHead =
{
	ACT_TMODE,
	PAL_OBJ_6,
	&oam8x8,
	LcAnime_Ball_Tbl,
	lc_ball_celltrans,
	DummyActAffTbl,
	DummyActMove,
};

static const actHeader LcKey_ActHead =
{
	ACT_TMODE,
	PAL_OBJ_6,
	&oam8x8,
	LcAnime_Key_Tbl,
	lc_key_celltrans,
	DummyActAffTbl,
	DummyActMove,
};

static const actHeader InazumaGaugeActHead =
{
	ACT_TMODE,
	PAL_OBJ_4,
	&oam8x8,
	SlotAnimeNothingTbl,
	InazumaGauge_celltrans,
	InazumaGaugeAffAnimeTbl,
	InazumaGaugeActMove,
};

//------------------------------------------
//	OAM  ﬂØƒ
//------------------------------------------
static const OAMPatData DrumOamPat0[] =
{
	{ -64, -64, 0, 3, 0x00, 3 },
	{ 0, -64, 0, 3, 0x00, 3 },
	{ -64, 0, 0, 3, 0x00, 3 },
	{ 0, 0, 0, 3, 0x00, 3 },
};

static const OAMPatSt DrumOamPat[] =
{
	{ 4, DrumOamPat0 },
};

static const OAMPatData MachineUpPat0[] =
{
	{ -32, -12, 1, 1, 0x00, 1 },
	{ 0, -12, 1, 1, 0x04, 1 },
	{ -32, -4, 1, 1, 0x08, 1 },
	{ -0, -4, 1, 1, 0x0c, 1 },
	{ -32, 4, 1, 1, 0x10, 1 },
	{ -0, 4, 1, 1, 0x14, 1 },
};

static const OAMPatSt MachineUpOamPat[] =
{
	{ 6, MachineUpPat0 },
};

static const OAMPatData MachineDownPat0[] =
{
	{ -32, -20, 1, 3, 0x00, 1 },
	{ -32, 12, 1, 1, 0x20, 1 },
	{ 0, 12, 1, 1, 0x24, 1 },
};

static const OAMPatSt MachineDownOamPat[] =
{
	{ 3, MachineDownPat0 },
};

static const OAMPatData MachineBreakPat0[] =
{
	{ -32, -24, 1, 3, 0x00, 1 },
	{ -32, 8, 1, 1, 0x20, 1 },
	{ 0, 8, 1, 1, 0x24, 1 },
	{ -32, 16, 1, 1, 0x28, 1 },
	{ 0, 16, 1, 1, 0x2c, 1 },
};

static const OAMPatSt MachineBreakOamPat[] =
{
	{ 5, MachineBreakPat0 },
};

static const OAMPatData MachineShadePat0[] =
{
	{ -32, -8, 1, 1, 0x00, 1 },
	{ 0, -8, 1, 1, 0x04, 1 },
	{ -32, 0, 1, 1, 0x08, 1 },
	{ 0, 0, 1, 1, 0x0c, 1 },
};

static const OAMPatSt MachineShadeOamPat[] =
{
	{ 4, MachineShadePat0 },
};

static const OAMPatData MachineBackPat0[] =
{
	{ -8, -12, 1, 0, 0x00, 1 },
	{ -8, -4, 1, 0, 0x00, 1 },
	{ -8, 4, 1, 0, 0x00, 1 },
};

static const OAMPatSt MachineBackOamPat[] =
{
	{ 3, MachineBackPat0 },
};

static const OAMPatData LcBD_Pat0[] =
{
	{ -32, -24, 1, 3, 0x00, 3 },
	{ -32, 8, 1, 1, 0x20, 3 },
	{ 0, 8, 1, 1, 0x24, 3 },
	{ -32, 16, 1, 1, 0x28, 3 },
	{ 0, 16, 1, 1, 0x2c, 3 },
};

static const OAMPatSt LcBD_OamPat[] =
{
	{ 5, LcBD_Pat0 },
};

static const OAMPatData LcTime_Pat0[] =
{
	{ -32, -8, 1, 1, 0x00, 3 },
	{ 0, -8, 1, 1, 0x04, 3 },
	{ -32, 0, 1, 1, 0x08, 3 },
	{ 0, 0, 1, 1, 0x0c, 3 },
};

static const OAMPatSt LcTime_OamPat[] =
{
	{ 4, LcTime_Pat0 },
};

static const OAMPatData LcInsert_Pat0[] =
{
	{ -32, -8, 1, 1, 0x00, 3 },
	{ 0, -8, 1, 1, 0x04, 3 },
	{ -32, 0, 1, 1, 0x08, 3 },
	{ 0, 0, 1, 1, 0x0c, 3 },
};

static const OAMPatSt LcInsert_OamPat[] =
{
	{ 4, LcInsert_Pat0 },
};

static const OAMPatData LcStop_Pat0[] =
{
	{ -32, -8, 1, 1, 0x00, 3 },
	{ 0, -8, 1, 1, 0x04, 3 },
	{ -32, 0, 1, 1, 0x08, 3 },
	{ 0, 0, 1, 1, 0x0c, 3 },
};

static const OAMPatSt LcStop_OamPat[] =
{
	{ 4, LcStop_Pat0 },
};

static const OAMPatData LcWin_Pat0[] =
{
	{ -32, -12, 1, 1, 0x00, 3 },
	{ 0, -12, 1, 1, 0x04, 3 },
	{ -32, -4, 1, 1, 0x08, 3 },
	{ 0, -4, 1, 1, 0x0c, 3 },
	{ -32, 4, 1, 1, 0x10, 3 },
	{ 0, 4, 1, 1, 0x14, 3 },
};

static const OAMPatSt LcWin_OamPat[] =
{
	{ 6, LcWin_Pat0 },
};

static const OAMPatData LcKemuri_Pat0[] =
{
	{ -16, -16, 0, 2, 0x00, 3 },
};

static const OAMPatData LcKemuri_Pat1[] =
{
	{ -8, -8, 0, 1, 0x10, 3 },
};

static const OAMPatSt LcKemuri_OamPat[] =
{
	{ 1, LcKemuri_Pat0 },
	{ 1, LcKemuri_Pat1 },
};

static const OAMPatData LcBall_Pat0[] =
{
	{ -24, -24, 1, 1, 0, 3 },
	{ 8, -24, 1, 0, 4, 3 },

	{ -24, -16, 1, 1, 6, 3 },
	{ 8, -16, 1, 0, 10, 3 },

	{ -24, -8, 1, 1, 12, 3 },
	{ 8, -8, 1, 0, 16, 3 },

	{ -24, 0, 1, 1, 18, 3 },
	{ 8, 0, 1, 0, 22, 3 },

	{ -24, 8, 1, 1, 24, 3 },
	{ 8, 8, 1, 0, 28, 3 },

	{ -24, 16, 1, 1, 30, 3 },
	{ 8, 16, 1, 0, 34, 3 },
};

static const OAMPatSt LcBall_OamPat[] =
{
	{ 12, LcBall_Pat0 },
};

static const OAMPatData LcKey_Pat0[] =
{
	{ -16, -12, 1, 2, 0, 3 },
	{ -16, 4, 1, 0, 8, 3 },
	{ 0, 4, 1, 0, 10, 3 },
};

static const OAMPatSt LcKey_OamPat[] =
{
	{ 3, LcKey_Pat0 },
};

static const OAMPatData LcStop_S_Pat0[] =
{
	{ -8, -8, 1, 0, 0x00, 3 },
	{ -8, 0, 1, 0, 0x08, 3 },
};

static const OAMPatSt LcStop_S_OamPat[] =
{
	{ 2, LcStop_S_Pat0 },
};

static const OAMPatData LcStop_T_Pat0[] =
{
	{ -8, -8, 1, 0, 0x02, 3 },
	{ -8, 0, 1, 0, 0x0a, 3 },
};

static const OAMPatSt LcStop_T_OamPat[] =
{
	{ 2, LcStop_T_Pat0 },
};

static const OAMPatData LcStop_O_Pat0[] =
{
	{ -8, -8, 1, 0, 0x04, 3 },
	{ -8, 0, 1, 0, 0x0c, 3 },
};

static const OAMPatSt LcStop_O_OamPat[] =
{
	{ 2, LcStop_O_Pat0 },
};

static const OAMPatData LcStop_P_Pat0[] =
{
	{ -8, -8, 1, 0, 0x06, 3 },
	{ -8, 0, 1, 0, 0x0e, 3 },
};

static const OAMPatSt LcStop_P_OamPat[] =
{
	{ 2, LcStop_P_Pat0 },
};

static const OAMPatData LcBonus_B_OamPat0[] =
{
	{ -8, -8, 1, 0, 0x00, 3 },
	{ -8, 0, 1, 0, 0x08, 3 },
};

static const OAMPatSt LcBonus_B_OamPat[] =
{
	{ 2, LcBonus_B_OamPat0 },
};

static const OAMPatData LcBonus_O_OamPat0[] =
{
	{ -4, -8, 0, 0, 0x02, 3 },
	{ -4, 0, 0, 0, 0x0a, 3 },
};

static const OAMPatSt LcBonus_O_OamPat[] =
{
	{ 2, LcBonus_O_OamPat0 },
};

static const OAMPatData LcBonus_N_OamPat0[] =
{
	{ -8, -8, 1, 0, 0x03, 3 },
	{ -8, 0, 1, 0, 0x0b, 3 },
};

static const OAMPatSt LcBonus_N_OamPat[] =
{
	{ 2, LcBonus_N_OamPat0 },
};

static const OAMPatData LcBonus_U_OamPat0[] =
{
	{ -4, -8, 0, 0, 0x05, 3 },
	{ -4, 0, 0, 0, 0x0d, 3 },
};

static const OAMPatSt LcBonus_U_OamPat[] =
{
	{ 2, LcBonus_U_OamPat0 }
};

static const OAMPatData LcBonus_S_OamPat0[] =
{
	{ -8, -8, 1, 0, 0x06, 3 },
	{ -8, 0, 1, 0, 0x0e, 3 },
};

static const OAMPatSt LcBonus_S_OamPat[] =
{
	{ 2, LcBonus_S_OamPat0 }
};

static const OAMPatData LcBig_B_OamPat0[] =
{
	{ -12, -12, 1, 0, 0x00, 3 },
	{ 4, -12, 0, 0, 0x02, 3 },
	{ -12, -4, 1, 0, 0x08, 3 },
	{ 4, -4, 0, 0, 0x0a, 3 },
	{ -12, 4, 1, 0, 0x10, 3 },
	{ 4, 4, 0, 0, 0x12, 3 },
};

static const OAMPatSt LcBig_B_OamPat[] =
{
	{ 6, LcBig_B_OamPat0 },
};

static const OAMPatData LcBig_I_OamPat0[] =
{
	{ -8, -12, 1, 0, 0x03, 3 },
	{ -8, -4, 1, 0, 0x0b, 3 },
	{ -8, 4, 1, 0, 0x13, 3 },
};

static const OAMPatSt LcBig_I_OamPat[] =
{
	{ 3, LcBig_I_OamPat0 },
};

static const OAMPatData LcBig_G_OamPat0[] =
{
	{ -12, -12, 1, 0, 0x05, 3 },
	{ 4, -12, 0, 0, 0x07, 3 },
	{ -12, -4, 1, 0, 0x0d, 3 },
	{ 4, -4, 0, 0, 0x0f, 3 },
	{ -12, 4, 1, 0, 0x15, 3 },
	{ 4, 4, 0, 0, 0x17, 3 },
};

static const OAMPatSt LcBig_G_OamPat[] =
{
	{ 6, LcBig_G_OamPat0 },
};

static const OAMPatData LcReg_R_OamPat0[] =
{
	{ -12, -12, 1, 0, 0x00, 3 },
	{ 4, -12, 0, 0, 0x02, 3 },
	{ -12, -4, 1, 0, 0x08, 3 },
	{ 4, -4, 0, 0, 0x0a, 3 },
	{ -12, 4, 1, 0, 0x10, 3 },
	{ 4, 4, 0, 0, 0x12, 3 },
};

static const OAMPatSt LcReg_R_OamPat[] =
{
	{ 6, LcReg_R_OamPat0 },
};

static const OAMPatData LcReg_E_OamPat0[] =
{
	{ -8, -12, 1, 0, 0x03, 3 },
	{ -8, -4, 1, 0, 0x0b, 3 },
	{ -8, 4, 1, 0, 0x13, 3 },
};

static const OAMPatSt LcReg_E_OamPat[] =
{
	{ 3, LcReg_E_OamPat0 },
};

static const OAMPatData LcReg_G_OamPat0[] =
{
	{ -12, -12, 1, 0, 0x05, 3 },
	{ 4, -12, 0, 0, 0x07, 3 },
	{ -12, -4, 1, 0, 0x0d, 3 },
	{ 4, -4, 0, 0, 0x0f, 3 },
	{ -12, 4, 1, 0, 0x15, 3 },
	{ 4, 4, 0, 0, 0x17, 3 },
};

static const OAMPatSt LcReg_G_OamPat[] =
{
	{ 6, LcReg_G_OamPat0 },
};

//------------------------------------------
//	âtèª±∏¿∞√∞ÃﬁŸ
//------------------------------------------
static const actHeader * const LcActHeadTbl[] =
{
	&LcBD_ActHead,
	&LcTime_ActHead,
	&LcInsert_ActHead,
	&LcWin_ActHead,
	&LcLose_ActHead,
	&LcA_ActHead,
	&LcKemuri_ActHead,
	&LcNum_ActHead,
	&LcBall_ActHead,
	&LcKey_ActHead,
	&LcStop_ActHead,
	&LcStop_ActHead,
	&LcStop_ActHead,
	&LcStop_ActHead,
	&LcBonus_ActHead,
	&LcBonus_ActHead,
	&LcBonus_ActHead,
	&LcBonus_ActHead,
	&LcBonus_ActHead,
	&LcBig_ActHead,
	&LcBig_ActHead,
	&LcBig_ActHead,
	&LcReg_ActHead,
	&LcReg_ActHead,
	&LcReg_ActHead,
	&DummyActHeader,
};

//------------------------------------------
//	âtèªOAM ﬂØƒ√∞ÃﬁŸ
//------------------------------------------
static const OAMPatSt * const LcOamPatTbl[] =
{
	LcBD_OamPat,
	LcTime_OamPat,
	LcInsert_OamPat,
	LcWin_OamPat,
	0,
	0,
	LcKemuri_OamPat,
	0,
	LcBall_OamPat,
	LcKey_OamPat,
	LcStop_S_OamPat,
	LcStop_T_OamPat,
	LcStop_O_OamPat,
	LcStop_P_OamPat,
	LcBonus_B_OamPat,
	LcBonus_O_OamPat,
	LcBonus_N_OamPat,
	LcBonus_U_OamPat,
	LcBonus_S_OamPat,
	LcBig_B_OamPat,
	LcBig_I_OamPat,
	LcBig_G_OamPat,
	LcReg_R_OamPat,
	LcReg_E_OamPat,
	LcReg_G_OamPat,
	0,
};

//======================================================================
//		æŸ√ﬁ∞¿
//======================================================================
//------------------------------------------
//	OBJ æŸ
//------------------------------------------
static const CellData SlotObj_CellData[] =
{
	{ &slotobj_Character[0x20*0x00], 0x20*0x10, CELL_BIG_R },
	{ &slotobj_Character[0x20*0x10], 0x20*0x10, CELL_BIG_B },
	{ &slotobj_Character[0x20*0x20], 0x20*0x10, CELL_MARIRU },
	{ &slotobj_Character[0x20*0x30], 0x20*0x10, CELL_HASUBO },
	{ &slotobj_Character[0x20*0x40], 0x20*0x10, CELL_CHERRY },
	{ &slotobj_Character[0x20*0x50], 0x20*0x10, CELL_INAZUMA },
	{ &slotobj_Character[0x20*0x60], 0x20*0x10, CELL_REPLAY },
	{ &etcobj_Character[0x20*0x00], 0x20*0x02, CELL_NUM0 },
	{ &etcobj_Character[0x20*0x02], 0x20*0x02, CELL_NUM1 },
	{ &etcobj_Character[0x20*0x04], 0x20*0x02, CELL_NUM2 },
	{ &etcobj_Character[0x20*0x06], 0x20*0x02, CELL_NUM3 },
	{ &etcobj_Character[0x20*0x08], 0x20*0x02, CELL_NUM4 },
	{ &etcobj_Character[0x20*0x0a], 0x20*0x02, CELL_NUM5 },
	{ &etcobj_Character[0x20*0x0c], 0x20*0x02, CELL_NUM6 },
	{ &etcobj_Character[0x20*0x0e], 0x20*0x02, CELL_NUM7 },
	{ &etcobj_Character[0x20*0x10], 0x20*0x02, CELL_NUM8 },
	{ &etcobj_Character[0x20*0x12], 0x20*0x02, CELL_NUM9 },
	{ &OBJ_CH_EKI_TRANS_WORK[0x20*0x50], 0x20*0x10, CELL_LC_STOP },
	{ &OBJ_CH_EKI_TRANS_WORK[0x20*0xa0], 0x20*0x10, CELL_LC_BONUS },
	{ &OBJ_CH_EKI_TRANS_WORK[0x20*0xb0], 0x20*0x18, CELL_LC_BIG },
	{ &OBJ_CH_EKI_TRANS_WORK[0x20*0xc8], 0x20*0x18, CELL_LC_REG },
	{ CELL_END, 0, 0 },
};

static const CellData SlotDrum_CellData =
{ (const u8 * const)CHAR_TEMP_WORK, 0x20*64, CELL_DRUM };

//------------------------------------------
//	ƒﬁ◊—∑¨◊
//------------------------------------------
static const u8 * const SlotDrumCharacter =
&etcobj_Character[0x20*0x92];

//======================================================================
//		 ﬂ⁄Øƒ√ﬁ∞¿
//======================================================================
//------------------------------------------
//	OBJ  ﬂ⁄Øƒ
//------------------------------------------
//----
#if (SLOT_VER_COLOR == VERSION_SAPPHIRE)
//----
static const u16 slotobj_Palette[112]={
	0x7fff,0x3def,0x5af7,0x7fff,0x7c00,0x7dc2,0x7e8e,0x268e,
	0x27b3,0x001f,0x017f,0x025f,0x127b,0x13bf,0x2d8c,0x2108,
	
	0x56b9,0x7fff,0x3fff,0x03bf,0x02fd,0x0238,0x0150,0x7c1f,
	0x7c1f,0x7c1f,0x253f,0x001c,0x0016,0x35ad,0x0842,0x7c1f,
	
	0x5755,0x7fff,0x7c1f,0x7e30,0x7e72,0x7e93,0x7ed5,0x7ef7,
	0x7f39,0x7ed0,0x7da0,0x54e0,0x7c1f,0x4e52,0x356b,0x20a5,
	
	0x62b5,0x7fff,0x029f,0x015e,0x00f6,0x00b0,0x373d,0x2257,
	0x0db2,0x7ed0,0x7da0,0x54e0,0x7c1f,0x4e52,0x356b,0x20a5,
	
	0x3d08,0x7fff,0x4bbf,0x035f,0x02bf,0x0134,0x7c1f,0x7c1f,
	0x7c1f,0x7c1f,0x7c1f,0x6f7b,0x6739,0x5694,0x356b,0x20a5,
	
	0x0000,0x013c,0x029f,0x017c,0x0f9f,0x021f,0x379f,0x53ff,
	0x7fff,0x7c1f,0x7c1f,0x7c1f,0x7c1f,0x7c1f,0x7c1f,0x7c1f,
	
	0x2d8c,0x0aff,0x0010,0x0918,0x0918,0x0918,0x0918,0x7c1f,
	0x7c1f,0x7c1f,0x7c1f,0x7c1f,0x7c1f,0x7c1f,0x7c1f,0x0000,

#if 0
	0x2d8c,0x0aff,0x0010,0x0aff,0x0918,0x0918,0x0918,0x7c1f,
	0x7c1f,0x7c1f,0x7c1f,0x7c1f,0x7c1f,0x7c1f,0x7c1f,0x0000,

	0x2d8c,0x0aff,0x0010,0x0918,0x0aff,0x0918,0x0918,0x7c1f,
	0x7c1f,0x7c1f,0x7c1f,0x7c1f,0x7c1f,0x7c1f,0x7c1f,0x0000,

	0x2d8c,0x0aff,0x0010,0x0918,0x0918,0x0aff,0x0918,0x7c1f,
	0x7c1f,0x7c1f,0x7c1f,0x7c1f,0x7c1f,0x7c1f,0x7c1f,0x0000,
#endif
};
//----
#else
//----
static const u16 slotobj_Palette[112]={
	0x7fff,0x3def,0x5af7,0x7fff,0x7c00,0x7dc2,0x7e8e,0x268e,
	0x27b3,0x001f,0x017f,0x025f,0x127b,0x13bf,0x2d8c,0x2108,
	
	0x56b9,0x7fff,0x3fff,0x03bf,0x02fd,0x0238,0x0150,0x7c1f,
	0x7c1f,0x7c1f,0x253f,0x001c,0x0016,0x35ad,0x0842,0x7c1f,
	
	0x5755,0x7fff,0x7c1f,0x423f,0x4a7f,0x4e9f,0x56df,0x5eff,
	0x673f,0x029f,0x015e,0x00f6,0x7c1f,0x4e52,0x356b,0x20a5,
	
	0x62b5,0x7fff,0x7ed0,0x7da0,0x54e0,0x3c60,0x373d,0x2257,
	0x0db2,0x029f,0x015e,0x00f6,0x7c1f,0x4e52,0x356b,0x20a5,
	
	0x3d08,0x7fff,0x4bbf,0x035f,0x02bf,0x0134,0x7c1f,0x7c1f,
	0x7c1f,0x7c1f,0x7c1f,0x6f7b,0x6739,0x5694,0x356b,0x20a5,
	
	0x0000,0x013c,0x029f,0x017c,0x0f9f,0x021f,0x379f,0x53ff,
	0x7fff,0x7c1f,0x7c1f,0x7c1f,0x7c1f,0x7c1f,0x7c1f,0x7c1f,
	
	0x2d8c,0x0aff,0x0010,0x0918,0x0918,0x0918,0x0918,0x7c1f,
	0x7c1f,0x7c1f,0x7c1f,0x7c1f,0x7c1f,0x7c1f,0x7c1f,0x0000,

#if 0	
	0x2d8c,0x0aff,0x0010,0x0aff,0x0918,0x0918,0x0918,0x7c1f,
	0x7c1f,0x7c1f,0x7c1f,0x7c1f,0x7c1f,0x7c1f,0x7c1f,0x0000,
	
	0x2d8c,0x0aff,0x0010,0x0918,0x0aff,0x0918,0x0918,0x7c1f,
	0x7c1f,0x7c1f,0x7c1f,0x7c1f,0x7c1f,0x7c1f,0x7c1f,0x0000,
	
	0x2d8c,0x0aff,0x0010,0x0918,0x0918,0x0aff,0x0918,0x7c1f,
	0x7c1f,0x7c1f,0x7c1f,0x7c1f,0x7c1f,0x7c1f,0x7c1f,0x0000,
#endif
};
//----
#endif
//----

//------------------------------------------
//	BG  ﬂ⁄Øƒ
//------------------------------------------
//----
#if (SLOT_VER_COLOR == VERSION_SAPPHIRE)
//----
static const u16 slotbg_Palette[80]={
	0x0000,0x18e7,0x739c,0x7fff,0x7eae,0x6926,0x75c7,0x7c1f,
	0x75c7,0x169f,0x025d,0x233f,0x0155,0x3400,0x2d8c,0x0000,
	
	0x6f7b,0x7fff,0x7eae,0x017f,0x00bb,0x017f,0x00bb,0x017f,
	0x00bb,0x017f,0x00bb,0x017f,0x00bb,0x7c1f,0x0013,0x0000,
	
	0x0000,0x7fff,0x6929,0x7eae,0x268e,0x27b3,0x0d1c,0x169f,
	0x13bf,0x7eae,0x5ef7,0x4e73,0x3def,0x2d6b,0x2108,0x0000,
	
	0x7c1f,0x7fff,0x6d4a,0x7e10,0x7e30,0x7e72,0x7e93,0x7ed5,
	0x7ef7,0x7f39,0x7c1f,0x7c1f,0x7c1f,0x7c1f,0x7c1f,0x0000,
	
	0x6f7b,0x6968,0x75c7,0x7fff,0x7eae,0x6000,0x0116,0x0116,
	0x01a0,0x01a0,0x7dea,0x027e,0x027e,0x2ac5,0x2ac5,0x0000,

#if 0
	0x6f7b,0x7fff,0x7eae,0x43ff,0x22df,0x7fff,0x43ff,0x43ff,
	0x22df,0x22df,0x017f,0x017f,0x00bb,0x7c1f,0x0013,0x0000,
		
	0x6f7b,0x7fff,0x7eae,0x22df,0x017f,0x43ff,0x22df,0x7fff,
	0x43ff,0x43ff,0x22df,0x22df,0x017f,0x7c1f,0x0013,0x0000,
	
	0x6f7b,0x7fff,0x7eae,0x017f,0x00bb,0x22df,0x017f,0x43ff,
	0x22df,0x7fff,0x43ff,0x43ff,0x22df,0x7c1f,0x0013,0x0000,
	
	0x6f7b,0x6968,0x75c7,0x7fff,0x7eae,0x7ec0,0x025f,0x025f,
	0x03a0,0x03a0,0x7ff1,0x37bf,0x37bf,0x4bf2,0x4bf2,0x0000,
	
	0x7c1f,0x7c1f,0x295b,0x3e1f,0x423f,0x4a7f,0x4e9f,0x56df,
	0x5eff,0x673f,0x7c1f,0x7c1f,0x7c1f,0x7c1f,0x7c1f,0x7c1f,
#endif
};
//----
#else
//----
static const u16 slotbg_Palette[80]={
	0x0000,0x18e7,0x739c,0x7fff,0x00bb,0x017e,0x029f,0x7c1f,
	0x00bb,0x169f,0x7e47,0x7f74,0x3cc0,0x0011,0x2d8c,0x0000,
	
	0x6f7b,0x7fff,0x00bb,0x017f,0x00bb,0x017f,0x00bb,0x017f,
	0x00bb,0x017f,0x00bb,0x017f,0x00bb,0x7c1f,0x0013,0x0000,
	
	0x0000,0x7fff,0x6929,0x7eae,0x268e,0x27b3,0x017f,0x169f,
	0x13bf,0x00bb,0x5ef7,0x4e73,0x3def,0x2d6b,0x2108,0x0000,
	
	0x7c1f,0x7fff,0x295b,0x3e1f,0x423f,0x4a7f,0x4e9f,0x56df,
	0x5eff,0x673f,0x7c1f,0x7c1f,0x7c1f,0x7c1f,0x7c1f,0x0000,
	
	0x6f7b,0x017e,0x023e,0x7fff,0x00bb,0x6000,0x0116,0x0116,
	0x01a0,0x01a0,0x7dea,0x027e,0x027e,0x2ac5,0x2ac5,0x0000,

#if 0
	0x6f7b,0x7fff,0x00bb,0x43ff,0x22df,0x7fff,0x43ff,0x43ff,
	0x22df,0x22df,0x017f,0x017f,0x00bb,0x7c1f,0x0013,0x0000,
	
	0x6f7b,0x7fff,0x00bb,0x22df,0x017f,0x43ff,0x22df,0x7fff,
	0x43ff,0x43ff,0x22df,0x22df,0x017f,0x7c1f,0x0013,0x0000,
	
	0x6f7b,0x7fff,0x00bb,0x017f,0x00bb,0x22df,0x017f,0x43ff,
	0x22df,0x7fff,0x43ff,0x43ff,0x22df,0x7c1f,0x0013,0x0000,
	
	0x6f7b,0x017e,0x023e,0x7fff,0x00bb,0x7680,0x021d,0x021d,
	0x0360,0x0360,0x7ff1,0x37bf,0x37bf,0x4bf2,0x4bf2,0x0000,
	
	0x7c1f,0x7c1f,0x295b,0x3e1f,0x423f,0x4a7f,0x4e9f,0x56df,
	0x5eff,0x673f,0x7c1f,0x7c1f,0x7c1f,0x7c1f,0x7c1f,0x7c1f,
#endif
};
//----
#endif
//----

//------------------------------------------
//	ÕﬁØƒ◊≤›ì_ìî ﬂ⁄Øƒ
//------------------------------------------
static const u16 BetLineLightPalette[16] =
{
//----
#if (SLOT_VER_COLOR == VERSION_SAPPHIRE)
//----
	0x6f7b,0x6968,0x75c7,0x7fff,0x7eae,0x7ec0,0x025f,0x025f,
	0x03a0,0x03a0,0x7ff1,0x37bf,0x37bf,0x4bf2,0x4bf2,0x0000,
//----
#else
//----
	0x6f7b,0x017e,0x023e,0x7fff,0x00bb,0x7680,0x021d,0x021d,
	0x0360,0x0360,0x7ff1,0x37bf,0x37bf,0x4bf2,0x4bf2,0x0000,
//----
#endif
//----
};

//------------------------------------------
//	ÕﬁØƒ◊≤›∂◊∞éQè∆
//------------------------------------------
static const u16 * const BetLineLightColorTbl[] =
{
	&BetLineLightPalette[0x0a],							// ◊≤›1
	&BetLineLightPalette[0x0b],							// ◊≤›2
	&BetLineLightPalette[0x0c],							// ◊≤›2
	&BetLineLightPalette[0x0d],							// ◊≤›3
	&BetLineLightPalette[0x0e],							// ◊≤›3
};

static const u16 * const BetLineLightOutColorTbl[] =
{
	&slotbg_Palette[(0x04*0x10)+0x0a],					// ◊≤›1
	&slotbg_Palette[(0x04*0x10)+0x0b],					// ◊≤›2
	&slotbg_Palette[(0x04*0x10)+0x0c],					// ◊≤›2
	&slotbg_Palette[(0x04*0x10)+0x0d],					// ◊≤›3
	&slotbg_Palette[(0x04*0x10)+0x0e],					// ◊≤›3
};

static const u8 BetLineSetColorPos[5] =					// æØƒêÊ
{
	BETLINE_1_COLNO,									// BETLINE_1
	BETLINE_2_0_COLNO,									// BETLINE_2_0
	BETLINE_2_1_COLNO,									// BETLINE_2_1
	BETLINE_3_0_COLNO,									// BETLINE_3_0
	BETLINE_3_1_COLNO,									// BETLINE_3_1
};

static const u8 BetPointLineSetNo[3][2] =				// ÕﬁØƒ -> æØƒNo
{
 {BETLINE_1,0},{BETLINE_2_0,BETLINE_2_1},{BETLINE_3_0,BETLINE_3_1}
};

static const u8 BetPointLineCount[3] =					// ÕﬁØƒêî -> æØƒ
{ 1, 2, 2 };

//------------------------------------------
//	 ﬂƒ◊›Ãﬂ ﬂ⁄Øƒ
//------------------------------------------
//----
#if (SLOT_VER_COLOR == VERSION_SAPPHIRE)
//----
static const u16 PatLampPalette0[] =					//  ﬂƒ◊›Ãﬂ±∆“ 0 B
{
	0x6f7b,0x7fff,0x7eae,0x43ff,0x22df,0x7fff,0x43ff,0x43ff,
	0x22df,0x22df,0x017f,0x017f,0x00bb,0x7c1f,0x0013,0x0000,
};
//----
#else
//----
static const u16 PatLampPalette0[] =					//  ﬂƒ◊›Ãﬂ±∆“ 0 B
{
	0x6f7b,0x7fff,0x00bb,0x43ff,0x22df,0x7fff,0x43ff,0x43ff,
	0x22df,0x22df,0x017f,0x017f,0x00bb,0x7c1f,0x0013,0x0000,
};
//----
#endif
//----

//----
#if (SLOT_VER_COLOR == VERSION_SAPPHIRE)
//----
static const u16 PatLampPalette1[] =					//  ﬂƒ◊›Ãﬂ±∆“ 1 C
{
	0x6f7b,0x7fff,0x7eae,0x22df,0x017f,0x43ff,0x22df,0x7fff,
	0x43ff,0x43ff,0x22df,0x22df,0x017f,0x7c1f,0x0013,0x0000,
};
//----
#else
//----
static const u16 PatLampPalette1[] =					//  ﬂƒ◊›Ãﬂ±∆“ 1 C
{
	0x6f7b,0x7fff,0x00bb,0x22df,0x017f,0x43ff,0x22df,0x7fff,
	0x43ff,0x43ff,0x22df,0x22df,0x017f,0x7c1f,0x0013,0x0000,
};
//----
#endif
//----

//----
#if (SLOT_VER_COLOR == VERSION_SAPPHIRE)
//----
static const u16 PatLampPalette2[] =					//  ﬂƒ◊›Ãﬂ±∆“ 2 D
{
	0x6f7b,0x7fff,0x7eae,0x017f,0x00bb,0x22df,0x017f,0x43ff,
	0x22df,0x7fff,0x43ff,0x43ff,0x22df,0x7c1f,0x0013,0x0000,
};
//----
#else
//----
static const u16 PatLampPalette2[] =					//  ﬂƒ◊›Ãﬂ±∆“ 2 D
{
	0x6f7b,0x7fff,0x00bb,0x017f,0x00bb,0x22df,0x017f,0x43ff,
	0x22df,0x7fff,0x43ff,0x43ff,0x22df,0x7c1f,0x0013,0x0000,
};
//----
#endif
//----

static const u16 * const PatLampPaletteTbl[] =			//  ﬂƒ◊›Ãﬂ√∞ÃﬁŸ
{
	PatLampPalette0,
	PatLampPalette1,
	PatLampPalette2,
};

static const u16 * const PatLampLightOutPalette =		//  ﬂƒ◊›ÃﬂµÃ
&slotbg_Palette[16];

//------------------------------------------
//	âtèªŒﬁ∞Ÿ±∆“ ﬂ⁄Øƒ
//------------------------------------------
//----
#if (SLOT_VER_COLOR == VERSION_SAPPHIRE)
//----
static const u16 LcBallPalette[] =
{
	0x2d8c,0x0aff,0x0010,0x0aff,0x0918,0x0918,0x0918,0x7c1f,
	0x7c1f,0x7c1f,0x7c1f,0x7c1f,0x7c1f,0x7c1f,0x7c1f,0x0000,

	0x2d8c,0x0aff,0x0010,0x0918,0x0aff,0x0918,0x0918,0x7c1f,
	0x7c1f,0x7c1f,0x7c1f,0x7c1f,0x7c1f,0x7c1f,0x7c1f,0x0000,

	0x2d8c,0x0aff,0x0010,0x0918,0x0918,0x0aff,0x0918,0x7c1f,
	0x7c1f,0x7c1f,0x7c1f,0x7c1f,0x7c1f,0x7c1f,0x7c1f,0x0000,
};
//----
#else
//----
static const u16 LcBallPalette[] =
{
	0x2d8c,0x0aff,0x0010,0x0aff,0x0918,0x0918,0x0918,0x7c1f,
	0x7c1f,0x7c1f,0x7c1f,0x7c1f,0x7c1f,0x7c1f,0x7c1f,0x0000,
	
	0x2d8c,0x0aff,0x0010,0x0918,0x0aff,0x0918,0x0918,0x7c1f,
	0x7c1f,0x7c1f,0x7c1f,0x7c1f,0x7c1f,0x7c1f,0x7c1f,0x0000,
	
	0x2d8c,0x0aff,0x0010,0x0918,0x0918,0x0aff,0x0918,0x7c1f,
	0x7c1f,0x7c1f,0x7c1f,0x7c1f,0x7c1f,0x7c1f,0x7c1f,0x0000,
};
//----
#endif
//----

static const u16 * const LcBallPaletteTbl[] =
{
	&LcBallPalette[0],
	&LcBallPalette[16],
	&LcBallPalette[32],
	&slotobj_Palette[6*16],
};

static const u16 * const LcBallDefaultPalette =
&slotobj_Palette[6*16];

//------------------------------------------
//	ê‡ñæï∂éö ﬂ⁄Øƒ
//------------------------------------------
static const u16 SlotExplainMsgPalette[16] =
{
	0x0000,0xffff,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x2108,
};

//------------------------------------------
//	OBJ ﬂ⁄Øƒìoò^√∞ÃﬁŸ
//------------------------------------------
static const PalData SlotObj_PaletteData[] =
{
	{ &slotobj_Palette[0x10*0x00], PAL_OBJ_0 },
	{ &slotobj_Palette[0x10*0x01], PAL_OBJ_1 },
	{ &slotobj_Palette[0x10*0x02], PAL_OBJ_2 },
	{ &slotobj_Palette[0x10*0x03], PAL_OBJ_3 },
	{ &slotobj_Palette[0x10*0x04], PAL_OBJ_4 },
	{ &slotobj_Palette[0x10*0x05], PAL_OBJ_5 },
	{ &slotobj_Palette[0x10*0x06], PAL_OBJ_6 },
	{ &slotobj_Palette[0x10*0x04], PAL_OBJ_7 },
	{ OBJPAL_END, 0 },
};

//======================================================================
//		∑¨◊√ﬁ∞¿
//======================================================================
//------------------------------------------
//	âtèª OBJ LZà≥èk
//------------------------------------------
static const u8 ekisho_LZ[0x768] = {
0x10,0x00,0x32,0x00,

0x27,0x00,0x00,0xd0,0x01,0x11,0x10,0x30,0x03,0x20,0x01,0x50,0x07,0xb3,0x60,0x01,
0x01,0x40,0x03,0x20,0x0b,0x11,0x10,0x50,0x0a,0xf0,0x01,0xf9,0x10,0x49,0x70,0x0a,
0x10,0x47,0x40,0x4b,0x70,0x5f,0x10,0x01,0x30,0x21,0xff,0xb0,0x53,0x30,0x03,0x40,
0x2a,0xf0,0x5f,0xf0,0x62,0xd0,0x01,0x60,0x6b,0x00,0x5f,0xff,0xf0,0xbf,0x80,0x5f,
0x40,0x5c,0xe0,0x23,0x90,0xa3,0x60,0xe3,0x10,0x33,0x50,0x37,0xff,0x00,0x13,0x50,
0x17,0x60,0x80,0x10,0xcc,0x50,0xd0,0x90,0x8c,0x40,0x12,0x10,0x2d,0xff,0xf0,0xcd,
0x90,0xe3,0xf0,0x21,0x90,0xe3,0x10,0x26,0xf1,0x0e,0x90,0xe3,0x70,0xa0,0xff,0x10,
0x13,0x50,0x17,0xf0,0x31,0xc1,0x63,0xa1,0xef,0xf0,0x0b,0x90,0xeb,0xa0,0x0b,0xff,
0x40,0x03,0x10,0x21,0x10,0x03,0x40,0xa3,0x60,0x0b,0x90,0x9f,0x50,0x8b,0x90,0x0b,
0xff,0xf0,0x5f,0xf0,0x5f,0xf0,0x5f,0xf0,0x5f,0xf0,0x5f,0xd0,0x5f,0x81,0xef,0xf0,
0x0b,0xff,0xf1,0x03,0xe0,0x0b,0xc2,0x9f,0xc0,0x0b,0xd0,0x97,0xf0,0xa3,0xd2,0xff,
0xd3,0x0b,0xff,0xf0,0x53,0xf0,0x5f,0xf0,0x5f,0x50,0x0b,0xf0,0x53,0xe0,0x0b,0xf0,
0xf7,0x80,0x0b,0xff,0xf0,0xf7,0xc2,0xff,0xf0,0x97,0xa0,0x0b,0x82,0xc6,0xf0,0xa3,
0x80,0xe3,0xf0,0x97,0xff,0x40,0x9b,0xf0,0x53,0xa0,0x0b,0xf0,0x53,0xe1,0x63,0xf0,
0x5f,0x90,0x5f,0xf0,0xf7,0xff,0xf1,0xfb,0xf0,0xf7,0x72,0x3f,0xc4,0xef,0xf2,0xab,
0xf1,0x03,0xb0,0x0b,0xa4,0xef,0xff,0xe2,0xab,0xf0,0x5f,0xf0,0x5f,0xf0,0x5f,0xf0,
0x5f,0xf0,0x5f,0x40,0x5f,0xf0,0xf7,0xff,0xf1,0x03,0xf5,0xf3,0xc2,0x3f,0x90,0x97,
0xd2,0x3f,0xc4,0xfb,0xd0,0x0b,0xf1,0x57,0xff,0xf3,0x5f,0xf1,0x03,0x64,0x03,0xd4,
0xfb,0xd0,0x0b,0xf0,0xf7,0xa0,0x7e,0xe2,0xff,0xff,0xd5,0x07,0xf2,0x33,0xf2,0x3f,
0xf0,0xf7,0xc0,0xfb,0xf0,0x78,0x86,0x0b,0xf0,0xf7,0xff,0xf3,0x5f,0xf2,0xff,0x90,
0xfb,0xf0,0xf7,0x70,0x0b,0xf0,0xf7,0xc5,0xff,0xf0,0xf7,0xff,0xf1,0x0f,0x96,0xdc,
0xe0,0x0b,0xd0,0x12,0x90,0x88,0x61,0x03,0x76,0xba,0x80,0x0b,0xff,0x80,0xa3,0xf7,
0x07,0xb2,0x1e,0xb0,0x53,0xd7,0xff,0xf0,0x40,0xa0,0x40,0xb1,0xff,0x7f,0x00,0x00,
0x0b,0xf4,0xff,0x97,0xf3,0xb5,0x5f,0xf0,0xf7,0xa0,0x0b,0xf0,0x12,0xff,0xb0,0x1e,
0xf0,0xf7,0xa0,0x0b,0x74,0xa6,0xa7,0x9f,0xb0,0xfb,0xf0,0xf7,0xa1,0xe0,0xff,0xf0,
0x5f,0xa8,0x2a,0xe0,0xf7,0x90,0x0b,0xf2,0x53,0xf5,0xbf,0xf2,0x9b,0xc3,0x9f,0xff,
0xf7,0x97,0xb9,0xff,0xb8,0xfb,0xe2,0x40,0xf1,0xbe,0x70,0xc6,0xf1,0xff,0xf3,0xe0,
0xff,0xa8,0xfb,0xf0,0x40,0xf3,0xff,0xf3,0xff,0x8a,0x53,0x99,0xc7,0xa6,0x9f,0xf1,
0x0f,0xff,0xaa,0xe3,0x70,0x78,0xc5,0x9b,0xf0,0x59,0x80,0x0b,0xf0,0x3d,0xc1,0xbe,
0xf0,0xf7,0xff,0xd1,0xff,0xf3,0x57,0xf3,0xff,0xf4,0x7e,0x5b,0x5b,0xf3,0xff,0xf0,
0xeb,0xf1,0xfb,0xff,0xf6,0xff,0xf2,0x43,0x30,0x0b,0xf0,0x78,0xc0,0x0b,0xf0,0x53,
0xf9,0x9f,0xf4,0x97,0xff,0x50,0x0b,0xf1,0x16,0x60,0x0b,0x57,0x0b,0xf5,0xb7,0x80,
0x0b,0xf0,0x53,0xf0,0x0b,0xff,0xf0,0x97,0xd6,0x9f,0x01,0xef,0x51,0xfb,0x90,0x0b,
0xf2,0xff,0xa0,0x0b,0xb9,0x03,0xff,0xf0,0x5f,0x72,0x63,0xf0,0x97,0x91,0xbb,0xc7,
0xf7,0xe6,0xff,0xbc,0xf3,0xb4,0x07,0xff,0xf0,0x53,0xf9,0xff,0xf0,0x97,0xf2,0xff,
0xf8,0x03,0xf9,0x9f,0xf0,0x0b,0xf0,0x5f,0xff,0xf0,0x5f,0xf0,0x97,0xc0,0x5f,0xf1,
0xfb,0xb3,0x1e,0xf0,0x5f,0xf0,0x5f,0xf0,0x5f,0xff,0xf1,0xfb,0xf0,0x0b,0xd2,0x9f,
0xf2,0xff,0xb0,0xeb,0xf2,0x07,0xf2,0xff,0xf0,0x5f,0xff,0xf0,0x97,0xf2,0xff,0xf1,
0x03,0x70,0x0b,0xf2,0xff,0xf2,0xff,0xf0,0x5f,0xf9,0x13,0xff,0xf0,0x9f,0xc5,0x1b,
0xf0,0xff,0xfe,0x8c,0xf0,0xff,0xf0,0x1e,0xf5,0x2e,0xf6,0x07,0xff,0xfe,0xf0,0xf0,
0x12,0xf0,0x7e,0xf6,0x07,0xf8,0xf7,0xf0,0x37,0xf0,0xf7,0xfa,0x9f,0xff,0xf0,0xf7,
0x80,0xff,0xf0,0xf7,0xda,0xff,0xf6,0x1a,0xa9,0x5f,0xf0,0xf7,0xd3,0xe0,0xff,0xf0,
0x01,0xf9,0x1e,0xf0,0x0b,0xf6,0xdb,0xfa,0xff,0xf0,0xf7,0xfa,0x9f,0xf0,0xf7,0xff,
0xa0,0xfb,0xf0,0x78,0x98,0xe0,0xf0,0xf7,0xf9,0x40,0xf0,0x01,0xf7,0x1e,0xf0,0x0b,
0xff,0xf6,0xff,0xf6,0xff,0xf1,0xef,0xf1,0xfb,0xf0,0xf7,0xf2,0xf3,0xf7,0xf7,0xf1,
0xfb,0xff,0xf2,0x74,0xf9,0xf7,0xf0,0x90,0xf2,0xe0,0xf0,0x12,0xf0,0x1e,0xf0,0x7e,
0xa2,0xff,0xff,0xf0,0x01,0xf2,0xff,0xf1,0x03,0xfa,0x88,0xf9,0x3f,0x89,0x3f,0xfe,
0x97,0x10,0x1a,0x7f,0x11,0x10,0x03,0x50,0x0b,0xf0,0x53,0xf3,0x5f,0xd9,0x93,0xe6,
0xff,0xc0,0x53,0xff,0xf0,0x5f,0xf0,0xbf,0xf0,0xbf,0xf0,0xf5,0xc2,0xff,0xf0,0xa3,
0x92,0xe7,0xf0,0xa3,0xff,0x60,0x9b,0xe0,0x97,0xf6,0xff,0xf2,0xff,0x40,0x0b,0xf1,
0x57,0xec,0x7e,0xf0,0x5f,0xff,0xf0,0x5f,0xf1,0xcf,0xc6,0xff,0xf0,0xbf,0xf0,0x35,
0xf1,0x9b,0xc3,0x0b,0xfc,0x07,0xff,0xf2,0xbe,0x9d,0x9b,0xf3,0x0b,0xf0,0x5f,0xf2,
0x9f,0xf0,0xa3,0xf2,0x67,0xf3,0x0b,0xff,0xf2,0xff,0xf1,0xef,0xf0,0x53,0xf0,0x97,
0xf2,0x9f,0xf4,0x03,0x81,0x03,0xf9,0xf3,0xff,0xc1,0x03,0xf0,0x53,0xf0,0x5f,0xf0,
0xf7,0xd9,0xff,0xf4,0x03,0xf5,0x3a,0xf1,0x03,0xff,0x78,0x0b,0xf1,0x03,0xf2,0xff,
0xf0,0xa3,0xf5,0xf3,0xf5,0x07,0xf4,0xfb,0xc1,0x9b,0xff,0xf0,0x53,0xf2,0x9f,0xf0,
0x97,0xf9,0xff,0xfb,0xfb,0xc0,0xe3,0x8b,0x03,0x71,0x03,0xff,0xf0,0x53,0xf2,0x07,
0xf2,0x07,0xf2,0x9f,0xf1,0xfb,0xf2,0xff,0xfe,0xa7,0xf2,0x9f,0xff,0xf6,0xaf,0xf0,
0x5f,0xf0,0x97,0xf2,0x67,0xf0,0x40,0xf2,0xff,0xf1,0xfb,0xf0,0xf7,0xff,0xf0,0xeb,
0xf2,0x9f,0xf1,0xfb,0xe2,0xff,0x7e,0x9b,0x99,0xd5,0xf8,0x9f,0xe1,0x03,0xff,0xf0,
0xa3,0xf1,0x03,0xf0,0xf7,0xd9,0x5f,0xf0,0xcb,0xf2,0xff,0xf1,0x03,0xf2,0xff,0xff,
0xf0,0x0b,0xf2,0xff,0xe8,0xff,0xf1,0xef,0x80,0x0b,0xf0,0xb6,0xf1,0xa7,0xf0,0xa3,
0xff,0xf3,0x5f,0xf1,0x03,0xf2,0xff,0xf2,0xff,0xf2,0xf3,0xf2,0x07,0xf0,0x01,0x91,
0x79,0xff,0xf1,0x5e,0x72,0xe4,0xf2,0xa8,0xe5,0x97,0xf0,0x65,0xf0,0x01,0xf7,0x1f,
0x97,0x1f,0xff,0x82,0x04,0xf2,0x64,0x70,0x63,0xe2,0x77,0xe2,0x42,0xf1,0x9e,0xf0,
0x77,0xb0,0x45,0xff,0x20,0x03,0xa4,0x78,0xb8,0xfb,0x4d,0xff,0xf3,0xf3,0x80,0x4c,
0xf0,0x77,0xf1,0x00,0xff,0xf0,0x01,0xf1,0x54,0xf5,0xec,0xf0,0x1e,0xf0,0x19,0xf0,
0x01,0xf0,0x01,0xf0,0x01,0xff,0xf1,0x9b,0xf0,0x6c,0x52,0xa7,0xf0,0x1e,0xb5,0xa7,
0xf0,0x52,0xf0,0x63,0xf3,0x7f,0xff,0x96,0x1f,0x50,0x6b,0x9f,0x87,0x03,0x1f,0x41,
0x49,0xff,0x7b,0xb9,0x2b,0xf1,0xff,0xff,0xe1,0xa6,0xf0,0x77,0x9f,0x3f,0xa3,0xf7,
0x70,0x77,0x83,0xa3,0x62,0x15,0xf9,0xa3,0xff,0x30,0x21,0xf0,0x77,0xf0,0x01,0xf0,
0x01,0xf1,0x54,0xf0,0x18,0xf0,0x1e,0xf0,0x01,0xff,0xf0,0x01,0xf0,0x01,0xf0,0x01,
0xf0,0x01,0xf5,0x63,0xf0,0x17,0xf4,0xbf,0xf0,0x01,0xff,0xf0,0x01,0xfd,0x2c,0xf3,
0x3f,0xf4,0xf6,0xf0,0x01,0xf0,0x01,0xd4,0x2a,0xf0,0x01,0xff,0xf2,0x1c,0xc0,0x0b,
0xf1,0xb7,0xf2,0xbb,0xf1,0x8c,0x45,0x1f,0x62,0xa3,0xf1,0x9f,0xff,0xd6,0x3f,0xf0,
0xaa,0xf0,0x63,0xb0,0x13,0x46,0x9f,0xf0,0xb8,0xf8,0x9b,0xf0,0x01,0xff,0xf0,0x4f,
0xf3,0x87,0x9f,0x43,0xf3,0x7b,0xdf,0xfe,0xf0,0xca,0xf0,0xe8,0xf5,0x47,0xff,0xf1,
0xd8,0xe2,0x03,0xf1,0x9e,0xb1,0x9e,0xf0,0x37,0x80,0x0b,0xf0,0x37,0xf1,0xcf,0xff,
0xca,0x4f,0xa0,0x17,0xf7,0x7a,0xb0,0x0b,0xfc,0x8f,0xb0,0x4f,0xf0,0x56,0xf2,0xc7,
0xff,0xf0,0x7f,0xf0,0x7f,0xf1,0x1e,0xb0,0x7f,0xfd,0x27,0xd0,0x7f,0xb0,0x37,0xa0,
0x7f,0xff,0xff,0x5f,0xaf,0x5f,0xf1,0x3b,0x70,0x0b,0xfe,0x93,0xf1,0x7f,0xf1,0x37,
0xf1,0x7f,0xff,0xf1,0x47,0xf0,0xff,0xf1,0x47,0xf0,0xff,0xf0,0xff,0xf0,0xf3,0xf0,
0x4f,0xf0,0x01,0xff,0xf0,0x01,0xf0,0x01,0xf0,0x01,0xf0,0x01,0xf0,0x01,0xf0,0x01,
0xf0,0x01,0xf0,0x01,0xff,0xf0,0x01,0xf0,0x01,0xf0,0x01,0xf0,0x01,0xf0,0x01,0xf0,
0x01,0xf0,0x01,0xf0,0x01,0xff,0xf0,0x01,0xf1,0x83,0xf1,0x9b,0xf3,0x03,0xf0,0x19,
0xf0,0x01,0xf0,0x01,0xf0,0x01,0xe3,0xf4,0xcb,0x85,0x3b,0x95,0x93,0x33,0x30,0x03,
0x10,0x03,0x50,0x0b,0xdb,0x10,0x07,0x00,0x06,0x33,0x10,0x03,0x40,0x0b,0x44,0x10,
0x03,0x10,0x0b,0x1b,0x44,0x40,0x04,0x20,0x07,0x00,0x06,0x10,0x10,0x03,0x40,0x0b,
0x70,0x40,0x10,0x03,0x50,0x0b,0xd5,0x1f,0x04,0x55,0x10,0x01,0xfb,0x10,0x03,0x50,
0x0b,0xf0,0x9e,0xf0,0xaf,0x41,0x31,0x30,0x30,0x03,0xb0,0x0b,0x87,0x50,0xa3,0x03,
0x33,0x40,0x04,0x10,0x03,0xd0,0x0b,0x50,0xa3,0xfd,0x10,0x07,0x60,0x0b,0x01,0x58,
0x10,0x03,0x90,0xa3,0x00,0x07,0x50,0x10,0x03,0x98,0x31,0x7b,0x55,0x50,0x10,0x03,
0x90,0xa3,0x05,0x55,0x50,0x7e,0x05,0x10,0x03,0xd0,0x0b,0xf5,0xd1,0xeb,0x7e,0x99,
0x3f,0xe0,0x25,0x01,0xff,0x00,0x94,0x10,0x03,0xf8,0xa8,0xf0,0x31,0xf0,0x0b,0x20,
0x09,0x00,0xa7,0x10,0x03,0xdf,0xf0,0x6b,0x10,0x03,0x05,0x00,0xbf,0x10,0x03,0xfc,
0xd7,0xf0,0x53,0xf0,0x0b,0xff,0xf2,0x33,0xc0,0x0b,0xfd,0xfb,0x97,0x5b,0x9d,0xa3,
0xf2,0xcc,0xf6,0xf9,0xf0,0x01,0xff,0x40,0x67,0xf5,0x61,0x9d,0xbb,0xf0,0x01,0xf0,
0x01,0xf0,0x01,0xc0,0xa3,0xf0,0x01,0xff,0xf3,0xaf,0xf0,0xc3,0x60,0xa3,0xf0,0xe2,
0x9f,0x43,0xf0,0x01,0xf0,0x01,0xf0,0x01,0xff,0xf0,0x01,0xf0,0x01,0xf0,0x01,0xf1,
0x55,0xf0,0x01,0xf0,0xcf,0xf0,0x3d,0xf0,0x3d,0xf7,0xf0,0x01,0xf0,0x01,0xf0,0x01,
0xe9,0x3f,0x60,0x30,0x03,0x50,0x0b,0x11,0x23,0x30,0x60,0x06,0x10,0x03,0x10,0x0b,
0x06,0x66,0x60,0x06,0xf7,0x10,0x03,0x50,0x0b,0x10,0x07,0x00,0x06,0x66,0x10,0x03,
0xf0,0x0b,0x30,0x07,0x0c,0x60,0x06,0x11,0x10,0x10,0x03,0x30,0x0b,0x66,0x60,0xef,
0x10,0x03,0x50,0x0b,0xd2,0x93,0x06,0x00,0xf1,0x10,0x03,0x50,0x0b,0xf0,0x01,0xc3,
0xe1,0x29,0x20,0x43,0x10,0x01,0x66,0x60,0x10,0x03,0xd0,0x0b,0xff,0x90,0xab,0xf0,
0x0b,0x70,0xa3,0x90,0xb7,0x91,0x7b,0x90,0xab,0x80,0x0b,0x00,0xcf,0x67,0x66,0x20,
0xcf,0x70,0xab,0x10,0x01,0x10,0x03,0xfa,0x63,0xf0,0x01,0xed,0xb1,0xc7,0xf0,0xb7,
0x42,0xaf,0x10,0x10,0x03,0x00,0x66,0x01,0x10,0x03,0xff,0x30,0xb7,0x70,0x0b,0xfc,
0xa3,0xf0,0x01,0xf8,0x37,0xf3,0xa5,0xf0,0x15,0xf0,0x0b,0xff,0xf0,0x01,0xfc,0xa5,
0xf4,0x99,0xfb,0xfb,0xf3,0x7b,0xf2,0xeb,0xf0,0x01,0xf0,0x01,0xff,0xbd,0xc7,0xf0,
0x7e,0x50,0x0b,0xf0,0xbc,0xf0,0x01,0xf0,0xa3,0xf0,0xa3,0xf1,0x0f,0xff,0xf0,0x01,
0xf0,0xc3,0xb0,0xa3,0xf0,0x3d,0xf0,0xa3,0xf0,0x01,0xf0,0x01,0xf0,0x01,0xff,0xf0,
0x01,0xa0,0xaf,0xf2,0x00,0xa6,0xca,0xfb,0x9b,0x60,0x0b,0xff,0x23,0xc1,0x17,0xff,
0xf1,0x1b,0xf0,0x0b,0xf0,0x39,0xf5,0xda,0xf0,0x01,0xf1,0xdf,0xf1,0xdf,0x50,0x7f,
0xff,0xf0,0x44,0xf0,0x63,0xe0,0x96,0x80,0xf4,0xf7,0xfb,0x90,0x1e,0xf1,0xd1,0xf0,
0x01,0xff,0xf0,0x01,0xf1,0x7f,0xf1,0x7f,0xf1,0x7f,0xf1,0x7f,0xf1,0x7f,0xf1,0x7f,
0xf0,0xdc,0xff,0xf1,0x7f,0xf0,0x01,0x9c,0x9f,0xf0,0x01,0x61,0x26,0xf1,0x7f,0xf1,
0x7f,0xf0,0x63,0xfe,0xf0,0x63,0xfc,0xc0,0x7c,0xdf,0xe7,0x9f,0xf1,0x7f,0xf0,0x01,
0x50,0x01,0x00,0x00,
};

//------------------------------------------
//	Àﬂ∂¡≠≥ OBJ LZà≥èk
//------------------------------------------
static const u8 pikaobj_LZ[0x1154] = {
0x10,0x00,0x36,0x00,

0x3f,0x00,0x00,0xf0,0x01,0xf0,0x01,0xf0,0x01,0xf0,0x01,0xf0,0x01,0xf0,0x01,0xe5,
0xf0,0x01,0xf0,0x01,0x50,0x01,0xe0,0xee,0x00,0x03,0xed,0xf0,0x17,0xbf,0x70,0x01,
0x0e,0xf0,0x12,0xf0,0x01,0xf0,0x01,0xf0,0x01,0xf0,0x01,0xf0,0x01,0xfe,0xf0,0x01,
0xf0,0x01,0xf0,0x01,0xf0,0x01,0xf0,0xe7,0x00,0xe3,0x20,0x03,0xdd,0xac,0x80,0x03,
0xde,0x00,0x18,0x26,0x10,0x03,0x01,0x04,0x00,0xee,0xb5,0x00,0xe8,0xee,0x00,0x08,
0x30,0x03,0x0e,0x20,0x03,0xe3,0x00,0x0c,0x1f,0x33,0x33,0x63,0xf0,0x4e,0xf0,0x01,
0xf0,0x01,0xf0,0x01,0xf0,0x01,0xca,0xf0,0x01,0xc0,0x01,0x60,0x06,0x00,0x03,0x62,
0x31,0xa9,0xee,0x00,0xee,0xe0,0xdd,0xdd,0xed,0xe0,0xee,0xdd,0x5b,0xdd,0x00,0x9c,
0xee,0x10,0x10,0x10,0xa9,0x05,0x21,0xc3,0x30,0x01,0x40,0x6e,0x00,0x2d,0x2d,0x62,
0x05,0x00,0x2e,0x22,0x1b,0x62,0x05,0x3e,0x00,0xb8,0x00,0x03,0x33,0x10,0x03,0x00,
0x1a,0x6a,0x25,0x10,0x4c,0x00,0x03,0x50,0x50,0x2b,0x05,0x00,0x03,0x63,0x00,0x00,
0x66,0x66,0x33,0x66,0x22,0x22,0x32,0x12,0x33,0x33,0x06,0x00,0x03,0x0e,0x22,0x00,
0x03,0x26,0xa0,0x00,0x03,0x25,0x00,0x03,0x60,0x33,0x43,0x0e,0x66,0x87,0x00,0x03,
0x33,0x36,0x43,0x66,0xf0,0x97,0xf0,0x01,0xf0,0x01,0xeb,0xf0,0x01,0xf0,0x01,0x60,
0xe7,0x32,0x30,0x03,0x50,0x00,0x03,0x20,0xab,0xcb,0x21,0x97,0x40,0x03,0x25,0x63,
0x00,0xe4,0x33,0x00,0x04,0x00,0xd2,0x5a,0x05,0x00,0xce,0x63,0x00,0x03,0xa0,0x01,
0x6e,0x10,0xe3,0xe6,0x28,0xee,0x6e,0x00,0x2b,0x36,0x01,0x02,0x36,0x63,0x06,0x64,
0x60,0x00,0x25,0x00,0x03,0x33,0x66,0x10,0x1e,0x36,0x36,0x0c,0x22,0x22,0x22,0x23,
0x00,0xe6,0x00,0x06,0x33,0x23,0xcf,0x10,0xed,0xe0,0x01,0x43,0x44,0x00,0x04,0x10,
0x03,0xf0,0x01,0x00,0x01,0xa5,0x13,0x03,0xe3,0x21,0x2f,0x00,0x00,0x10,0x0c,0x33,
0x00,0x0c,0x81,0x12,0x16,0x33,0xab,0x06,0x00,0xb3,0xab,0xf3,0x21,0xf7,0xf0,0x01,
0xf0,0x01,0xd1,0x00,0x80,0x03,0xe0,0xd0,0x1c,0x10,0xb1,0x50,0x03,0x5b,0x36,0x00,
0x03,0xe0,0x00,0xf0,0x01,0xfb,0x36,0x40,0x2b,0x10,0xe8,0xa0,0xd1,0x13,0x43,0x00,
0x03,0xe4,0x3e,0x33,0x43,0x5e,0x0d,0x32,0x33,0xe4,0x55,0x10,0x10,0x12,0x07,0xe4,
0x40,0x03,0x87,0x10,0x0b,0x55,0x55,0x55,0x45,0x00,0x03,0x20,0x01,0xf0,0xf1,0x88,
0x20,0x3f,0x43,0x55,0x34,0x10,0x27,0x33,0x33,0xb3,0x08,0xbb,0x0e,0x00,0x43,0x10,
0x03,0xe4,0x00,0x00,0x54,0x44,0x00,0xee,0x64,0x02,0x71,0x66,0x01,0x08,0x64,0x33,
0x07,0x06,0x00,0x33,0x36,0x64,0xf0,0xcd,0xf0,0x01,0xf0,0x01,0xfa,0xf0,0x01,0xf0,
0x01,0x70,0x01,0x02,0x07,0x12,0x1f,0x26,0x00,0xf7,0xe0,0xe1,0x50,0xf7,0x60,0x01,
0x00,0xe6,0x55,0x33,0x43,0x66,0x10,0xc7,0xc0,0x31,0xf0,0x11,0x23,0x36,0x43,0x44,
0x60,0x44,0x54,0x07,0xe5,0x56,0x55,0x55,0x5e,0x40,0xe6,0x00,0xcd,0x30,0x20,0x7e,
0xe3,0x00,0x03,0x00,0x14,0x60,0xff,0x30,0x19,0x60,0x01,0x61,0x4b,0x45,0xa7,0x11,
0x03,0x35,0x01,0x0b,0x36,0xe4,0x02,0x7b,0x00,0x03,0x01,0x00,0x5b,0x33,0x01,0x00,
0xe6,0x00,0xff,0x11,0x07,0x44,0x11,0x0f,0xf0,0xfe,0xfe,0xf0,0x01,0xf0,0x01,0xf0,
0x01,0xf0,0x01,0xd2,0x1f,0xf0,0x01,0x40,0x01,0x55,0x00,0x55,0xe5,0x5e,0xee,0x56,
0x55,0xe5,0x46,0x00,0xe3,0x56,0x55,0x4e,0x34,0xe3,0x56,0x4e,0x00,0x44,0x44,0xe3,
0x60,0x44,0x44,0x44,0xe0,0x86,0x00,0x03,0x00,0xee,0x56,0x44,0x10,0xe2,0x00,0xef,
0x34,0x78,0x65,0x42,0xe4,0x11,0x1f,0x10,0x01,0x00,0x1e,0x44,0x44,0x54,0x39,0xe6,
0xee,0x00,0xe7,0x42,0xff,0x13,0x07,0x44,0x44,0x00,0x06,0xd1,0x20,0x1a,0x10,0x01,
0x45,0x20,0x05,0x06,0x00,0x44,0x00,0xf0,0xe1,0x70,0x03,0x00,0x0f,0x20,0xfb,0x66,
0x00,0x66,0x36,0x23,0x1e,0xfe,0xf0,0x01,0xf0,0x01,0xf0,0x01,0xf0,0x01,0xf0,0x01,
0xf0,0x01,0xf0,0x01,0x60,0x7b,0x44,0x04,0xa3,0x15,0x0f,0xf0,0x01,0x10,0x01,0x66,
0x15,0x29,0xf0,0x16,0x87,0x60,0x01,0xee,0x6e,0x66,0x66,0x35,0x4f,0xf0,0x01,0x10,
0x01,0x03,0x44,0x44,0xe4,0x0e,0xee,0xee,0x04,0x59,0xf0,0x01,0xff,0xf0,0x01,0xf0,
0x01,0xf0,0x01,0xf0,0x01,0xf0,0x01,0xf0,0x01,0xf0,0x01,0xf0,0x01,0xff,0xf0,0x01,
0xf0,0x01,0xf0,0x01,0xf0,0x01,0xf0,0x01,0xf0,0x01,0xf0,0x01,0xf0,0x01,0xff,0xf0,
0x01,0xf0,0x01,0xf0,0x01,0xf0,0x01,0xf0,0x01,0xf0,0x01,0xf0,0x01,0xf0,0x01,0xee,
0xf0,0x01,0x68,0xe6,0x59,0x0b,0xde,0x50,0x03,0x00,0x0f,0x00,0x03,0xe0,0xff,0x10,
0x07,0xb9,0x0f,0x10,0x03,0x28,0x33,0x40,0x03,0xf0,0x01,0xf0,0x01,0xf0,0x01,0xef,
0xf0,0x01,0xc2,0xb5,0x14,0xf6,0x56,0x34,0xf3,0x69,0xab,0x18,0xb7,0x90,0x7a,0x68,
0xe0,0x00,0x20,0x60,0x97,0xed,0x10,0xb1,0xdd,0xee,0x00,0x08,0xee,0xde,0xed,0x6e,
0x08,0x22,0x22,0xee,0xee,0x0e,0x3e,0x23,0xee,0xee,0x27,0xff,0xe0,0x01,0x17,0xff,
0x52,0xa0,0x00,0x03,0x23,0x10,0x08,0x60,0xe2,0xee,0x00,0x60,0x2f,0x22,0xe3,0x05,
0x62,0x33,0x70,0x03,0x00,0x37,0x40,0x03,0x29,0x1b,0xbf,0x00,0x03,0xe3,0x16,0xfb,
0x10,0x03,0x03,0x0a,0x20,0x07,0x00,0x03,0x04,0x06,0xfb,0xf0,0x01,0xf0,0x01,0xf0,
0x01,0xb5,0xde,0x00,0xa3,0x25,0x00,0x03,0x17,0xff,0xcb,0x58,0x0b,0x68,0x0f,0x26,
0x33,0x00,0xe4,0x33,0x00,0x04,0x55,0xdf,0xad,0xd0,0x01,0xe0,0x06,0xd0,0x00,0x47,
0x13,0x01,0x35,0xe0,0x20,0x9f,0x45,0x63,0x06,0x9b,0x33,0x63,0xe0,0x00,0x1e,0x56,
0x07,0xab,0x8a,0x04,0xfa,0x66,0x22,0x33,0x08,0x08,0x6e,0x08,0x08,0x60,0x90,0x00,
0x03,0x36,0x33,0x78,0x08,0x66,0x66,0x35,0x43,0x7f,0x32,0x08,0xe8,0x08,0xff,0x10,
0x03,0x27,0x67,0x90,0x01,0x10,0xe3,0x11,0x8d,0xff,0x55,0xf3,0x27,0xff,0x00,0xfc,
0x06,0x49,0xfa,0x1f,0xf0,0x01,0xf0,0x01,0xf0,0x01,0xf5,0x58,0xeb,0x18,0xc3,0xe0,
0x01,0x90,0x8b,0xee,0x05,0xbc,0x00,0x08,0x00,0xf9,0x41,0xff,0x27,0x17,0x46,0xd2,
0x27,0xb3,0x37,0xe2,0x43,0x5e,0x00,0x06,0xdf,0x07,0x13,0x07,0x17,0xe4,0x37,0xdf,
0x15,0xf3,0x17,0xf7,0x10,0x01,0x16,0xf1,0xec,0x66,0xfb,0xf7,0xff,0x56,0xfb,0x33,
0x06,0xfb,0x20,0x07,0x33,0x33,0x18,0xab,0x0e,0x33,0x08,0xe8,0x18,0x08,0x33,0x43,
0xbb,0x2b,0x06,0x33,0x01,0x04,0x43,0x16,0x07,0xe6,0x38,0x07,0xf0,0xb1,0xff,0xf0,
0x01,0xf0,0x01,0xf0,0x01,0xf0,0x01,0x82,0x1f,0x12,0x93,0x01,0xe4,0x81,0x23,0xc2,
0x28,0xfb,0x00,0x03,0x56,0x33,0x64,0x56,0x00,0xc3,0x63,0xd2,0x10,0xe2,0x27,0xbb,
0x6e,0x00,0xa0,0x46,0x44,0x16,0xf2,0xe5,0xbe,0x00,0xdd,0xee,0x18,0xea,0x20,0xc5,
0x51,0x03,0xf0,0xff,0xe0,0x01,0xe3,0xab,0x08,0x12,0x43,0x00,0x18,0x43,0x10,0x07,
0x63,0x0a,0x55,0x18,0xe7,0xff,0x58,0x03,0x17,0x03,0x28,0x03,0x17,0x03,0x12,0x14,
0xf0,0x01,0xf0,0x01,0xf0,0x01,0xfa,0xf0,0x01,0xf0,0x01,0x66,0xa2,0x8a,0x1b,0xea,
0x1f,0x6e,0x00,0xe4,0x33,0x84,0x00,0x04,0x34,0x33,0x6e,0x45,0x07,0xc0,0x6e,0x46,
0x1b,0x44,0x34,0x33,0x08,0x03,0x87,0xff,0x45,0x20,0xfb,0x88,0xe6,0xbf,0x87,0xe1,
0xe6,0x1b,0x3e,0x12,0x37,0x37,0xff,0x80,0x19,0x70,0x01,0x17,0xff,0x7b,0x64,0x17,
0x07,0x40,0x03,0x10,0x0b,0x18,0x07,0x66,0x01,0x03,0x13,0x6d,0xff,0xf0,0x01,0xf0,
0x01,0xf0,0x01,0xf0,0x01,0xf0,0x01,0xf0,0x01,0xf0,0x01,0xf7,0xff,0xf8,0xf7,0xff,
0xf0,0x1c,0xf7,0xff,0xf0,0x19,0x40,0x3f,0x46,0x64,0x06,0xff,0xf7,0xff,0xf0,0x01,
0xf0,0x01,0xf0,0x01,0xf0,0x01,0xf0,0x01,0xf0,0x01,0xf0,0x01,0xff,0xf0,0x01,0xf0,
0x01,0xf0,0x01,0xf0,0x01,0xf0,0x01,0xf0,0x01,0xf0,0x01,0xf0,0x01,0xfa,0xf0,0x01,
0xf0,0x01,0xf0,0x01,0xf0,0x01,0x36,0xe9,0x0e,0x06,0xe9,0xee,0x05,0x06,0xe0,0xde,
0xdd,0x52,0x0e,0xef,0x22,0xf0,0x21,0xdf,0x30,0x01,0x11,0x91,0x52,0xf1,0x96,0xf0,
0x01,0xf0,0x01,0xf0,0x01,0xe3,0x6f,0x00,0xe6,0xdd,0x00,0x56,0xd2,0xed,0x56,0x22,
0x7f,0xd2,0xe2,0x17,0x10,0x10,0x08,0x20,0xf7,0xff,0xf0,0x01,0xf0,0x01,0xf0,0x01,
0xeb,0x12,0xba,0x05,0xd3,0x40,0x03,0x00,0x10,0x03,0xe0,0x14,0xe7,0x6c,0xe7,0x44,
0x22,0x00,0xe4,0x33,0x22,0x62,0x04,0x7f,0x22,0x06,0x0f,0x33,0x33,0x23,0xe2,0x44,
0xe7,0x25,0xef,0x2e,0xfb,0x90,0x4b,0x17,0x65,0x66,0x66,0x10,0x13,0x4e,0x06,0xde,
0x06,0xee,0x0e,0xef,0x68,0x22,0x10,0x1f,0x07,0x41,0x60,0x01,0x47,0x26,0x32,0x05,
0x0e,0x60,0x22,0x33,0x63,0x10,0x20,0x15,0x08,0x3c,0x08,0x43,0x01,0x22,0x32,0xe3,
0xee,0x32,0x33,0xe3,0x08,0x29,0xa4,0x20,0x03,0x0e,0x34,0xe7,0x0e,0x60,0x04,0xea,
0x26,0x64,0x10,0x0e,0x60,0x32,0x74,0xe1,0x55,0x05,0x00,0x56,0x27,0x22,0x06,0x00,
0x42,0x0e,0x25,0x07,0x00,0x06,0x78,0x00,0x2b,0xfc,0xf6,0x00,0xf0,0x01,0xf0,0x01,
0xf0,0x01,0xf0,0x01,0x71,0x1f,0x36,0x33,0x6d,0x00,0x16,0xf7,0x06,0x8f,0x50,0x00,
0x70,0x08,0x92,0xe3,0x00,0x03,0x00,0x36,0x60,0xa3,0x3a,0x33,0x60,0xaa,0xba,0xfb,
0xef,0xd3,0x10,0xda,0x17,0x10,0x36,0xf0,0x20,0x09,0xe6,0x4c,0xfa,0x11,0x33,0xd0,
0x07,0x44,0x10,0x15,0x36,0x10,0x1e,0xaa,0x33,0x33,0xa3,0x28,0xba,0x0e,0x06,0x5f,
0x06,0x06,0x5f,0x06,0x26,0x33,0x3b,0x33,0x64,0x00,0x4a,0x5f,0x27,0x10,0x03,0xeb,
0x30,0x37,0x20,0xe7,0xaf,0x70,0x03,0x44,0x07,0x03,0xe6,0x26,0xff,0x00,0x02,0xf0,
0x01,0xf0,0x01,0xf0,0xf0,0x01,0xf0,0x01,0xf0,0x01,0x50,0x01,0xae,0xbb,0x3b,0x00,
0x50,0xe6,0x00,0x03,0x36,0x06,0xff,0x35,0x43,0x66,0x50,0x00,0x33,0x53,0x55,0x60,
0x33,0x36,0x53,0x60,0x75,0x33,0x00,0x0c,0x10,0xd3,0x26,0xf9,0x66,0x29,0x1b,0x56,
0x45,0xb1,0x82,0x15,0xff,0x4e,0x34,0x33,0x43,0x4e,0x21,0xe6,0xaa,0x04,0xbb,0x33,
0x33,0xbb,0xeb,0x05,0xb7,0x4e,0x54,0x20,0x66,0x46,0x0d,0xf3,0x55,0x44,0x44,0x56,
0x33,0x10,0x46,0x44,0x36,0x07,0xde,0x36,0x33,0x43,0x3e,0x0d,0x33,0x43,0xe6,0x36,
0x08,0xc7,0x00,0x46,0x06,0x00,0x03,0x38,0x63,0x64,0x00,0x04,0x18,0x44,0x00,0x03,
0xe4,0xe4,0x36,0xff,0x09,0x48,0xf3,0x77,0x29,0xf7,0xf1,0xf8,0xf0,0x01,0xf0,0x01,
0xf0,0x01,0x40,0x01,0x79,0x50,0x46,0xe3,0x50,0x03,0x10,0x0f,0x20,0x01,0x35,0x36,
0x00,0x8e,0x1f,0x63,0xee,0x4e,0x19,0xb2,0x11,0xeb,0x30,0x03,0x77,0xcf,0xbf,0xbe,
0xf7,0xb0,0x01,0x16,0xce,0x01,0xec,0x01,0xc3,0xe6,0x01,0xf5,0x1e,0xdf,0x62,0x07,
0xa0,0x26,0xf3,0x34,0x0e,0xef,0x4e,0x56,0x33,0x0e,0x44,0x0c,0x64,0x55,0xe4,0x44,
0x09,0x2b,0x00,0x03,0xee,0x44,0x3f,0xe4,0xee,0x2f,0xd7,0x06,0xf6,0x29,0xf3,0x9b,
0xfb,0xf0,0x01,0xf0,0x01,0xf8,0xf0,0x01,0xf0,0x01,0xf0,0x01,0xf0,0x01,0x65,0x0f,
0x36,0x33,0x44,0x90,0x08,0x70,0xee,0x60,0x01,0x92,0x36,0x46,0xe6,0x0e,0x43,0xe6,
0xc6,0x8b,0x44,0x64,0xee,0x6e,0xf6,0x9e,0x9e,0xbf,0xef,0x07,0xe5,0x0c,0x10,0x07,
0x27,0x44,0x13,0x4c,0x00,0x12,0xa2,0xb6,0x10,0x0c,0xcf,0x10,0x3e,0x00,0xf2,0x00,
0x46,0x00,0x08,0x1b,0xeb,0xf0,0x01,0xf0,0x01,0xff,0xf0,0x01,0xf0,0x01,0xf0,0x01,
0xf0,0x01,0xf0,0x01,0xf0,0x01,0xf0,0x01,0xf0,0x01,0xff,0xf0,0x01,0xf0,0x01,0xf0,
0x01,0xf0,0x01,0xf0,0x01,0xf0,0x01,0xf0,0x01,0xf0,0x01,0xff,0xf0,0x01,0xf0,0x01,
0xf0,0x01,0xf0,0x01,0xf0,0x01,0xf0,0x01,0xf0,0x01,0xf0,0x01,0xf0,0xf0,0x01,0x26,
0x5f,0x1c,0x77,0xc5,0x6f,0x0e,0x00,0xee,0xdd,0x0f,0x0e,0x00,0xdd,0xed,0x00,0x03,
0xf2,0x0c,0xf0,0x01,0xf0,0x01,0xf7,0xf0,0x01,0xf0,0x64,0x2e,0xad,0x00,0x07,0xde,
0xf0,0x1b,0x0a,0xd3,0x09,0xd1,0x01,0x2d,0x22,0x65,0x66,0xdd,0x22,0x22,0xf7,0xff,
0xfa,0x96,0xee,0xf0,0x12,0xf4,0x57,0x46,0xfb,0x00,0x06,0x33,0x0e,0x52,0x33,0x3a,
0x00,0x25,0x00,0x03,0x05,0xeb,0x10,0x03,0x66,0x04,0xff,0xe3,0xaa,0x00,0xe3,0xe3,
0x00,0x8d,0x33,0x40,0x03,0x43,0x03,0x03,0x43,0xf9,0x4e,0xdb,0xf0,0xfd,0xf0,0x01,
0xf0,0x01,0x7f,0xc2,0x66,0xe2,0x5f,0xbb,0xe3,0x3f,0xaf,0xf0,0x24,0x17,0xf1,0x33,
0x22,0xee,0x04,0xc8,0x10,0x03,0xf7,0x08,0x02,0x18,0x07,0x03,0xa7,0x73,0xa3,0x22,
0x00,0x47,0x06,0x72,0x06,0xf2,0x42,0x64,0x00,0xb1,0x33,0x22,0x44,0x64,0x00,0x2f,
0x36,0x45,0x33,0x04,0x0f,0xe3,0xe1,0x50,0x07,0xb3,0x00,0x0e,0xc0,0x7e,0x56,0x10,
0x18,0x06,0xbb,0x07,0xee,0x30,0x03,0x00,0x0b,0x15,0x1b,0x3e,0xc0,0x36,0xff,0x16,
0xca,0x65,0xe3,0x3e,0x33,0x63,0x1e,0xd9,0x00,0x5f,0x08,0x6e,0x33,0x00,0x0b,0x00,
0x12,0xa3,0x3b,0x07,0x02,0x60,0xbb,0xd5,0xdb,0x0e,0xd1,0x56,0x63,0x00,0x66,0x22,
0x4c,0x43,0x0f,0x32,0x43,0x2e,0x28,0x5f,0x08,0x3f,0x56,0x22,0xad,0x00,0x02,0x33,
0x00,0x02,0x33,0x1f,0x23,0x90,0x01,0x22,0x1f,0x0f,0xff,0x1f,0x17,0x04,0x40,0x51,
0x3b,0x20,0x03,0x00,0x0b,0xff,0x1d,0xf0,0x01,0xf0,0x01,0xf0,0xb0,0x01,0x07,0xf6,
0x1e,0xf6,0x05,0xef,0xba,0x33,0x36,0xa3,0x00,0xba,0x3b,0x35,0xb3,0xbb,0x3b,0x60,
0x33,0x2a,0xbb,0x33,0x1f,0xdc,0x00,0x5e,0xd4,0x36,0x08,0xbb,0xee,0x05,0xce,0xcc,
0x33,0xe3,0xcc,0x07,0xd3,0xae,0x00,0x03,0x70,0xe3,0x00,0x03,0x17,0xe9,0x10,0x37,
0xbb,0xbb,0x3e,0x33,0x3c,0xb3,0x3b,0x31,0x0f,0x20,0x03,0x06,0xf3,0x4c,0xef,0x33,
0x43,0x00,0x64,0x43,0x3e,0x65,0x63,0x43,0x3e,0x36,0x00,0x36,0x43,0x36,0x36,0x45,
0xe4,0x63,0x63,0x03,0x64,0xe4,0x36,0x66,0x46,0x6e,0x37,0x06,0x17,0x53,0x78,0xe4,
0x00,0x7f,0x26,0x6b,0x00,0x03,0x07,0x32,0x44,0xe6,0x64,0xff,0x07,0xf8,0x06,0x22,
0x21,0xd0,0x1c,0xfd,0x12,0x27,0x10,0x03,0xfa,0x0b,0xf0,0x01,0xf7,0xf0,0x01,0xf0,
0x01,0x9c,0xd9,0x00,0x02,0x36,0x0a,0x0e,0x01,0x83,0x09,0x03,0x4b,0x60,0x00,0x03,
0x56,0x36,0x09,0x03,0x35,0x00,0x01,0x56,0xe0,0xfb,0x60,0x09,0xf0,0x01,0xf0,0x01,
0xf0,0x01,0x69,0x32,0x44,0x08,0x06,0x10,0xde,0x28,0xe4,0x60,0x00,0x03,0x36,0x07,
0x2e,0x45,0x63,0x33,0x07,0x44,0x5e,0x36,0x66,0x64,0x07,0x7b,0x00,0xe7,0x00,0xe8,
0xef,0x4a,0x17,0x21,0xeb,0x53,0x1f,0x55,0xf6,0x77,0xf0,0x01,0xf0,0x01,0xdf,0xdf,
0x7f,0x32,0x1f,0xc6,0x2f,0xe7,0x10,0xef,0x33,0x2f,0x60,0x01,0x11,0x75,0x10,0x03,
0x5b,0x43,0x02,0x05,0xe6,0x11,0x07,0x20,0x03,0x3e,0x60,0x03,0xf0,0xce,0xe0,0xf0,
0x01,0xf0,0x01,0x80,0x01,0x36,0x66,0xe4,0x33,0x35,0x01,0xe4,0x44,0x53,0x43,0xe4,
0x44,0x63,0xc0,0x03,0x04,0xe3,0x43,0x64,0x64,0x55,0x04,0x64,0x5e,0xe5,0xff,0x05,
0x13,0x00,0xf3,0x14,0x0f,0x50,0x03,0xf0,0xfa,0xf0,0x01,0xf0,0x01,0xf0,0x01,0xeb,
0xf0,0x01,0xd0,0x01,0x50,0xeb,0x60,0x5c,0x1b,0x4e,0x44,0x4b,0x29,0x2b,0xf2,0x98,
0xee,0x12,0xd3,0x18,0xd3,0x09,0xe5,0xe6,0x63,0x05,0x62,0x43,0xe1,0x08,0xc0,0x10,
0x17,0x6f,0xd6,0x64,0xee,0xee,0xe6,0xc4,0xd4,0x0b,0x44,0xe6,0x4e,0xe4,0x00,0x19,
0x0e,0x00,0x32,0x0f,0x0b,0xff,0xf0,0x7d,0xf0,0x01,0xf0,0x01,0xf0,0x01,0xf0,0x01,
0xf0,0x01,0xf0,0x01,0xf0,0x01,0xff,0x20,0x01,0x18,0xb3,0x10,0x03,0x05,0x09,0x20,
0x03,0x10,0xf7,0x60,0x01,0x20,0xe3,0xdf,0x04,0x7b,0x12,0x97,0x63,0x00,0x03,0xf9,
0x0b,0xf0,0x01,0xf0,0x01,0xf0,0x01,0xff,0xf0,0x01,0xf0,0x01,0xf0,0x01,0xf0,0x01,
0xf0,0x01,0xf0,0x01,0xf0,0x01,0xf0,0x01,0xff,0xf0,0x01,0xf0,0x01,0xf0,0x01,0xf0,
0x01,0xf0,0x01,0xf0,0x01,0xf0,0x01,0xf0,0x01,0xff,0xf0,0x01,0xf0,0x01,0xf0,0x01,
0xf0,0x01,0xf0,0x01,0xf0,0x01,0xf0,0x01,0xf0,0x01,0xdf,0xb8,0xd9,0x02,0xe4,0xde,
0x18,0x62,0xf5,0x95,0xf0,0x01,0xf0,0x01,0xf0,0x01,0xff,0xf0,0x01,0xf0,0x01,0xf0,
0x01,0xf0,0x01,0xf0,0x01,0xf0,0x01,0xf0,0x01,0xf0,0x01,0xe2,0x80,0xea,0x09,0xa4,
0x00,0x03,0xee,0xe0,0xed,0x30,0x03,0x60,0x47,0x22,0x10,0x03,0x33,0xe3,0x50,0x07,
0xa8,0x28,0xe7,0x80,0x2b,0xff,0x94,0xbf,0x17,0x9b,0x07,0xba,0xf0,0x01,0xf0,0x01,
0xf0,0x01,0xf0,0x01,0xf0,0x01,0xde,0x70,0xa1,0x01,0x84,0xe0,0x09,0xe7,0x69,0x07,
0xa9,0x0b,0x10,0x8b,0xed,0x88,0x00,0x11,0xdd,0xdd,0xee,0x0a,0x0d,0xed,0x66,0xee,
0x2f,0xee,0x2e,0x19,0x0f,0x22,0x15,0xd9,0x14,0xdc,0xf9,0xf3,0x09,0x13,0x07,0x05,
0x00,0x00,0x23,0x62,0x36,0x97,0x1e,0xb8,0x20,0x03,0xc8,0x07,0x0a,0x15,0x0d,0x00,
0x50,0x27,0x2f,0x43,0x00,0x66,0x03,0x36,0x43,0x56,0x33,0x63,0x33,0x10,0xe3,0x50,
0x03,0xd3,0x57,0xab,0x1c,0xeb,0x64,0x04,0x49,0x44,0x34,0xf4,0x2c,0xf0,0x01,0xff,
0xf0,0x01,0xf0,0x01,0xf0,0x01,0xf0,0x01,0xf0,0x01,0x45,0xde,0x09,0xf3,0x16,0xd3,
0x37,0xe0,0x46,0xfa,0x23,0x10,0xe3,0x05,0x09,0xde,0x07,0x8d,0x08,0x81,0x28,0x46,
0x64,0x0a,0x23,0x46,0x28,0xf7,0x56,0x00,0x3e,0xb1,0x09,0x93,0x6e,0xc9,0x8d,0x0a,
0xd0,0x56,0x22,0x36,0x09,0xa3,0x8a,0x88,0xed,0x33,0x63,0x06,0x09,0xeb,0x6a,0x00,
0x08,0xbb,0xb8,0x00,0x03,0xb4,0x8e,0xff,0x2f,0x03,0x51,0x83,0x6b,0x00,0x66,0x03,
0x06,0xeb,0x60,0x53,0x63,0xe4,0x01,0x3f,0x08,0x01,0x5c,0x43,0x00,0x6a,0x63,0x01,
0x56,0xe2,0x22,0x00,0x2b,0x65,0x0e,0x87,0x26,0x8b,0x50,0x63,0x66,0x0e,0x10,0xb7,
0xb0,0x01,0x11,0x51,0xfc,0x15,0xa4,0x51,0x6b,0xf0,0x01,0xef,0xf7,0x48,0xeb,0x1c,
0x8b,0x56,0x32,0xd9,0x1a,0x67,0x12,0xbb,0x25,0x00,0x9c,0x0a,0xc6,0x33,0x60,0x00,
0x08,0xfd,0x0b,0xb2,0x20,0x0b,0xf0,0x01,0x48,0xbe,0xf0,0x03,0x80,0x03,0x33,0x00,
0xca,0xfc,0x20,0x03,0xe0,0x01,0x19,0xe0,0x01,0x06,0x0b,0x1f,0x10,0xee,0x44,0x4e,
0xa9,0x30,0x03,0x64,0x1a,0x17,0x34,0x60,0x24,0xe3,0x35,0x01,0x27,0x55,0x3e,0x00,
0x03,0xe3,0x00,0x03,0x63,0x00,0x1b,0x33,0x01,0x81,0x67,0x33,0x00,0x27,0x1a,0x5f,
0x43,0x0e,0x10,0xef,0x93,0x57,0xf8,0x1b,0xff,0xf0,0x01,0xa6,0xdc,0x52,0xe7,0x12,
0xc3,0x12,0xbf,0x28,0xdf,0x77,0xe7,0x11,0xa3,0xca,0x00,0x67,0x00,0x6b,0xe4,0x63,
0x00,0x6e,0x6e,0x06,0xe7,0x6e,0xac,0x09,0x7f,0x60,0x01,0x5b,0x60,0x00,0x6b,0x00,
0x1f,0x3e,0x63,0xf9,0x08,0xc4,0x1c,0xcd,0x01,0x22,0x1c,0x22,0x58,0x0b,0x44,0x53,
0x00,0x36,0x00,0x54,0xe2,0x33,0x53,0x33,0xe3,0x53,0x55,0x11,0x33,0xe3,0x55,0x10,
0x03,0x35,0x33,0x63,0x00,0x03,0x00,0x56,0x55,0x33,0x33,0x5e,0x45,0x44,0x44,0xe8,
0x10,0x03,0xb1,0x11,0x03,0x44,0x53,0x00,0xef,0x55,0x45,0x44,0x5a,0x54,0x00,0x03,
0x55,0x00,0x03,0x00,0x47,0x0e,0x00,0x03,0x06,0xc5,0x01,0x22,0x07,0x6b,0xe4,0x00,
0x44,0x20,0x03,0x06,0x00,0x03,0x3f,0x0e,0x00,0x00,0x0a,0xf0,0xd0,0xf0,0x01,0xf0,
0x01,0xf0,0x01,0xf0,0x01,0xe0,0xbe,0xa7,0x90,0x03,0xb3,0x1f,0xe4,0xe0,0x55,0x43,
0x0e,0x03,0xe0,0x55,0xe4,0x00,0x60,0x55,0x01,0x16,0xe5,0xf0,0x00,0x5e,0x44,0x44,
0x54,0x6e,0x66,0x46,0x55,0x1c,0x55,0x55,0x65,0x04,0x5b,0x1e,0x77,0xb0,0x01,0x55,
0x55,0x4b,0x44,0x00,0xe7,0x44,0x64,0x00,0x1c,0x06,0xf8,0xfe,0x04,0x27,0xfe,0x49,
0xf7,0xf0,0x01,0xf0,0x01,0xf0,0x01,0xf0,0x01,0xf3,0xdf,0x82,0x8f,0x66,0x7f,0x66,
0x32,0x92,0xf0,0x0f,0xf0,0x0f,0xf0,0x0f,0xf0,0x0f,0xf0,0x0f,0xf0,0x0f,0xff,0xf0,
0x0f,0xf0,0x0f,0xf0,0x0f,0x60,0x0f,0xf0,0xd1,0xf0,0x01,0xf0,0x01,0xf0,0xff,0xd0,
0xf0,0x5f,0x50,0x0f,0xb3,0x04,0xb7,0x9b,0xa9,0x33,0xb3,0x00,0x19,0x99,0x66,0xb6,
0x99,0x99,0x33,0xb3,0x40,0x9a,0x00,0x0b,0xaa,0xaa,0x33,0xf3,0xab,0xaa,0x04,0x66,
0x66,0xbf,0xbb,0xff,0x00,0x27,0xba,0x3f,0xa7,0x0e,0xc9,0xfb,0x10,0x03,0x66,0x66,
0x30,0x07,0x00,0x13,0x00,0x03,0x30,0xbb,0x6f,0xf0,0x4f,0xe0,0x0f,0xbb,0xfb,0x3f,
0xb3,0x00,0x99,0xaa,0xfb,0x9b,0x91,0xa9,0xba,0x9b,0x00,0x99,0xa9,0xba,0xab,0x99,
0xaa,0xba,0xab,0x00,0xaa,0xaa,0xba,0xbf,0xaa,0xaa,0xbb,0xf6,0x3a,0xbb,0xbb,0x00,
0x45,0x30,0x01,0x00,0x62,0x33,0x00,0x4e,0x66,0xff,0x10,0x07,0x50,0x03,0xf0,0xff,
0xf0,0x01,0xf0,0x01,0xf0,0xff,0x90,0x8f,0x5b,0xaa,0xd4,0x10,0x01,0x30,0xaf,0xf3,
0x10,0xe2,0xde,0x00,0x02,0x11,0x66,0x01,0x66,0xe6,0xde,0x44,0x44,0xde,0x11,0x03,
0x83,0xf5,0x20,0x07,0x10,0x0f,0x10,0x1c,0x10,0x8b,0xdd,0x00,0x04,0xff,0x00,0x2f,
0x07,0xdd,0x4f,0x44,0x44,0xff,0x00,0x3b,0x20,0x07,0xf0,0xef,0x80,0xf0,0x5f,0xff,
0xff,0x3f,0x33,0xe3,0xfd,0x33,0x00,0xe3,0x1d,0xd1,0xfd,0x66,0xee,0xfd,0x6f,0x43,
0xe4,0x00,0x07,0x44,0xee,0xfd,0x4f,0x10,0x07,0x10,0x0f,0xff,0xf0,0x3f,0xb0,0x3f,
0xf0,0xd1,0xf0,0x01,0xf0,0x01,0xf0,0x01,0x46,0x0b,0x90,0x03,0x50,0x25,0x1f,0xfe,
0x50,0x03,0xb9,0x25,0x22,0x22,0x23,0x00,0x22,0x22,0x32,0x32,0x22,0xf2,0xff,0xff,
0x00,0x22,0xff,0xee,0xee,0x32,0xef,0xde,0xdd,0x00,0x23,0xef,0xdd,0xed,0x42,0xef,
0xdd,0xfe,0xe1,0x00,0x1e,0x04,0xcd,0x36,0x1f,0xff,0xff,0xff,0xff,0x56,0xcf,0xfb,
0x73,0xdf,0x30,0x1f,0x10,0x01,0x50,0x1f,0xb3,0xff,0x55,0x11,0x42,0x10,0x01,0x25,
0x44,0x5f,0x0d,0x3f,0xff,0x3f,0x40,0x03,0x35,0x00,0x03,0xc7,0x0d,0x4b,0x10,0x31,
0x33,0x33,0x0f,0x04,0xef,0xf0,0x03,0x10,0x03,0xfd,0xf0,0xc6,0xf0,0x01,0xf0,0x01,
0xa0,0x01,0x20,0xe7,0x30,0x03,0x50,0x17,0x57,0x84,0xa0,0x03,0x53,0xef,0xed,0xff,
0x30,0x03,0xfd,0xff,0x05,0x54,0xef,0xfe,0xff,0x55,0x60,0x03,0xff,0x20,0x03,0xfd,
0xf0,0x4e,0xf0,0x01,0xf0,0x01,0x70,0x01,0x20,0xe3,0x40,0x03,0x5f,0x00,0x03,0x7f,
0x3f,0x10,0x03,0x0e,0x30,0x50,0x03,0xf0,0xf3,0xf0,0xff,0xf0,0x01,0xf0,0x01,0xca,
0xf0,0x01,0x50,0x01,0x35,0x43,0x00,0x03,0x53,0xa0,0x03,0x50,0x2f,0x33,0x54,0x00,
0x03,0x55,0x10,0x03,0x50,0xe7,0x20,0x03,0x01,0xbf,0xf3,0xd0,0x03,0xf0,0x4f,0xf0,
0x01,0xf2,0x67,0x00,0x30,0x50,0x03,0x01,0xe6,0x5f,0x44,0x01,0xf6,0x44,0x00,0xf6,
0xe0,0x03,0x3f,0x37,0xf0,0xf3,0x50,0x03,0x7d,0x55,0xf0,0xff,0xf0,0x01,0xf0,0x01,
0xc0,0x8d,0x20,0xe7,0xf4,0x2a,0xbf,0x8f,0x20,0x03,0x22,0x22,0x00,0x08,0xf3,0x50,
0x03,0x10,0xe3,0x10,0x01,0x8f,0x52,0xc3,0x22,0x22,0x22,0xa9,0xf4,0x40,0x1e,0xf0,
0x1f,0x70,0x1f,0x78,0x35,0x80,0x1e,0x10,0x1f,0xa7,0xf1,0x00,0xe3,0x55,0x43,0x44,
0x58,0x54,0x00,0xeb,0x54,0x00,0xeb,0xe0,0x03,0x74,0x44,0x4f,0xc2,0x00,0xeb,0xd0,
0x03,0x8f,0x0f,0x00,0x74,0x00,0x03,0x77,0xfd,0x00,0x03,0xf0,0xd0,0xf0,0x01,0xf0,
0x01,0x92,0xfd,0x00,0xe7,0x15,0x04,0x47,0xbf,0x90,0x03,0xf0,0x71,0xd7,0x54,0x77,
0x90,0x01,0x93,0xc7,0xf0,0x1f,0xf0,0x1f,0xc0,0xf0,0x1f,0x70,0x1f,0x44,0x44,0x87,
0x77,0x77,0x77,0xc0,0x20,0x03,0x00,0x04,0x87,0xf7,0x77,0x77,0xff,0x0f,0xaf,0x92,
0x55,0x87,0x00,0xe3,0x88,0x10,0x03,0x00,0x13,0xf2,0x6c,0xf0,0x01,0xf9,0xf0,0x01,
0xf0,0x01,0xf0,0x01,0xf0,0x01,0x70,0x01,0xaf,0xfa,0x01,0x0f,0x02,0x9f,0xfb,0xff,
0xff,0x9f,0x9b,0x00,0x03,0xab,0x14,0x99,0xb9,0xb9,0x16,0x9b,0xf0,0x06,0x9b,0x00,
0xff,0x7e,0xff,0x21,0x80,0x10,0x04,0xd0,0x03,0xf0,0x01,0xf0,0x01,0x60,0x01,0xb0,
0x00,0xbb,0xff,0x00,0x9b,0xa9,0xba,0xb0,0x19,0x08,0x99,0xaa,0xb0,0x99,0x00,0x03,
0x9a,0xa9,0xaa,0x00,0xb0,0xaa,0xaa,0xaa,0xf0,0xab,0xaa,0xba,0xdf,0x50,0x22,0x10,
0x53,0xfb,0xf0,0x03,0xf0,0x01,0xf0,0x01,0xf0,0x01,0xf0,0x01,0xca,0x93,0x9b,0x05,
0x0f,0x50,0x22,0x00,0x06,0x22,0x1d,0xcb,0xe0,0x82,0x06,0x87,0x00,0xee,0xfd,0x0f,
0xe5,0x00,0x07,0x22,0x0e,0xee,0xfd,0x2f,0xe2,0x40,0x07,0x52,0xe7,0x85,0xc7,0x00,
0xbe,0x00,0x12,0x55,0x10,0x17,0x10,0x01,0x5c,0x2f,0xa5,0xeb,0x0e,0x37,0x22,0x28,
0x52,0x55,0x10,0x23,0xe2,0x40,0x1e,0xde,0x00,0xbf,0x20,0xbb,0xbb,0x22,0x6f,0xee,
0xfd,0x00,0xde,0x11,0x02,0xdd,0x0f,0xe0,0xde,0xff,0x00,0x30,0x72,0x5f,0x3f,0x55,
0x11,0x07,0x54,0xf1,0x4b,0x40,0x4b,0x12,0x5b,0x10,0x04,0xf0,0x01,0xf2,0xf0,0x01,
0xf0,0x01,0x84,0xfe,0x23,0xf7,0xf5,0x00,0x0b,0x6e,0x00,0x0e,0x50,0x44,0x54,0x00,
0x00,0x08,0x00,0xff,0x40,0x03,0x00,0x31,0x35,0xf3,0x53,0xe0,0x20,0x01,0xee,0xee,
0xf5,0x06,0xf7,0x20,0xf5,0xdf,0x04,0xfb,0xdf,0xff,0xdd,0x53,0xdf,0x02,0xff,0xfd,
0xff,0xff,0xed,0x3e,0x00,0x03,0xee,0x82,0x10,0x03,0xee,0xee,0xdf,0xee,0xfe,0x00,
0x08,0xff,0x02,0xff,0xf2,0xef,0xdd,0xee,0x2f,0x05,0x31,0xff,0x5b,0xef,0x1c,0xc1,
0xee,0x08,0x1b,0x00,0x20,0x3f,0x10,0x1c,0x00,0x07,0x7f,0xff,0x00,0x06,0x60,0x01,
0x28,0x40,0x54,0x2b,0x16,0xff,0x00,0x03,0x17,0x07,0xf7,0x16,0x07,0x25,0x17,0x01,
0x01,0xf6,0xff,0xf4,0x60,0x03,0xf0,0xd0,0xf0,0x01,0xff,0xf0,0x01,0xb1,0x01,0xb0,
0x03,0x16,0xf7,0x11,0xfb,0x05,0x07,0x01,0xff,0x00,0xe3,0x9a,0x10,0x03,0xff,0x53,
0x00,0xab,0x00,0x03,0xef,0x10,0x03,0x55,0x00,0xff,0xdf,0xed,0x55,0xdf,0xfd,0xff,
0x55,0x01,0xf5,0xff,0xff,0xd2,0xdd,0xdd,0xed,0x00,0xcf,0xed,0x07,0x11,0x70,0xd3,
0x10,0x0b,0xef,0x10,0xe8,0x30,0x01,0x3f,0x00,0x0f,0x20,0x33,0xfe,0x08,0xe6,0xde,
0xfd,0x33,0x43,0xfe,0xb7,0x00,0xe0,0xfd,0x00,0x0b,0x01,0x1c,0x3f,0x25,0x37,0x35,
0xe7,0x3c,0x05,0x5c,0x54,0x1c,0x0d,0x54,0x05,0x0f,0x46,0x03,0x10,0x08,0x55,0xf5,
0xdf,0x02,0x5b,0x05,0xeb,0xf5,0x01,0xf3,0x02,0x0c,0x00,0x06,0x03,0x76,0x04,0x37,
0xfb,0x00,0xfa,0xf5,0xff,0xf0,0x01,0xf0,0x01,0xe5,0xff,0x33,0x26,0xef,0xc5,0xff,
0x7c,0x50,0x02,0xc0,0x10,0x03,0x10,0xe3,0x0d,0xb2,0x4d,0xd3,0x33,0x44,0xf7,0xf5,
0xdf,0x20,0xc3,0x19,0xf2,0x00,0x06,0x34,0x05,0xdf,0x1e,0xba,0x70,0x23,0xdb,0xc5,
0xff,0x00,0x51,0x22,0x50,0x1d,0x10,0x4f,0x34,0x00,0x34,0x15,0xff,0xd5,0x00,0x3f,
0x20,0x03,0x3f,0x40,0x03,0xff,0x10,0x13,0x33,0x00,0x03,0xb4,0x14,0x62,0xff,0x12,
0x03,0x81,0xf7,0x43,0x00,0x03,0x3f,0x44,0x0f,0xff,0x00,0x46,0xf7,0xf0,0xff,0xf0,
0x01,0xf0,0x01,0xa0,0xfe,0x8e,0x10,0xe7,0x11,0x11,0x61,0xf5,0xff,0xf5,0xbf,0x00,
0x01,0x77,0x0d,0x66,0x66,0x76,0x77,0xf5,0xdf,0x30,0x01,0x67,0x40,0x03,0xe0,0xf0,
0x1f,0xf5,0xff,0x60,0x1f,0x44,0x87,0x6f,0x66,0x77,0x02,0x87,0x6f,0x76,0x77,0x87,
0x76,0xf5,0xff,0x00,0xf8,0x26,0xe3,0x26,0x03,0xf5,0xff,0xf0,0x01,0xf0,0x01,0x00,
};

//------------------------------------------
//	Ω€Øƒ BG LZà≥èk
//------------------------------------------
static const u8 slotbg_LZ[0xba0] = {
0x10,0x00,0x1e,0x00,

0x33,0x00,0x00,0xf0,0x01,0x90,0x01,0x44,0x44,0xf0,0x01,0xf0,0x01,0xa0,0x20,0x01,
0xff,0x00,0x02,0x99,0x44,0xf4,0xee,0xee,0x08,0x44,0x9f,0x99,0xe9,0x00,0x06,0xee,
0xf4,0x99,0x00,0x99,0x99,0x22,0x22,0x22,0x22,0xff,0xff,0x28,0xff,0xff,0x00,0x0e,
0xee,0x00,0x0e,0xe9,0x39,0x33,0x23,0x33,0x93,0x10,0x03,0x99,0x99,0x39,0x20,0x07,
0x80,0x3c,0x22,0x44,0xee,0x00,0x04,0xee,0xee,0x4f,0x00,0x03,0xfe,0x94,0x00,0x03,
0xee,0x4f,0x00,0x2f,0x4f,0xc0,0x5f,0x88,0x44,0x01,0xf4,0xdd,0xdd,0x44,0x8f,0x88,
0xd8,0x00,0x06,0x06,0xdd,0xf4,0x88,0x88,0x88,0x50,0x5f,0x00,0x0e,0xdd,0x82,0x00,
0x0e,0xd8,0x38,0x33,0x33,0x83,0x10,0x03,0x88,0x34,0x88,0x38,0x20,0x07,0x90,0x5f,
0xdd,0x00,0x04,0xdd,0xdd,0x53,0x4f,0x00,0x03,0xfd,0x00,0x03,0xdd,0x4f,0x00,0x2f,
0x90,0x5f,0x8e,0xf0,0xcf,0x44,0xff,0x55,0x10,0x5f,0xd0,0x01,0x10,0x6f,0xaa,0x01,
0xaa,0xaa,0xaa,0x55,0x55,0x55,0xaa,0xf0,0x36,0xbb,0x70,0x6f,0xaa,0x10,0x04,0xf0,
0x01,0x90,0x5f,0x66,0xf0,0x5d,0x30,0x5f,0x00,0xbb,0xbb,0xbb,0xbb,0x66,0x66,0x66,
0xb6,0xdf,0xf0,0x36,0x70,0x5f,0xbb,0x00,0x04,0xf1,0xb1,0xf1,0xbf,0xf0,0x01,0x30,
0x01,0xbc,0x00,0xfc,0xf4,0x10,0xc7,0xf0,0x01,0x70,0x01,0xf0,0x35,0x44,0x55,0x01,
0x44,0x44,0x54,0x66,0x44,0x44,0x65,0x20,0x03,0xcc,0x11,0xe3,0x11,0xeb,0x44,0xef,
0x00,0x03,0x11,0xfb,0x44,0xff,0xf9,0x00,0x03,0x20,0x9e,0x20,0x01,0x91,0xeb,0x30,
0x0b,0x99,0x99,0x12,0x0b,0xf1,0x10,0xe3,0x10,0xeb,0x11,0xe3,0x11,0xeb,0x9e,0x99,
0xf9,0x21,0xfb,0x79,0x99,0x11,0x15,0x80,0x6c,0x11,0xe3,0x11,0xeb,0x44,0xdf,0x00,
0x03,0x9e,0x11,0xfb,0x44,0xff,0x00,0x03,0x70,0x22,0x91,0xeb,0x30,0x0b,0x88,0x78,
0x88,0x12,0x0b,0x50,0x5f,0x11,0xe3,0x11,0xeb,0x8d,0x88,0xf8,0xb0,0x21,0xfb,0x88,
0xc0,0x5f,0x11,0x01,0x44,0x5f,0x55,0xa5,0xbb,0x11,0x08,0xf4,0x01,0xd0,0x20,0x03,
0x10,0xf7,0xaf,0x00,0x03,0x00,0x08,0x08,0x5a,0x33,0x33,0xa5,0x10,0x03,0x55,0x55,
0x33,0xc2,0x00,0x19,0x70,0x03,0x5a,0x55,0x33,0xa5,0x00,0x1c,0xa5,0x01,0xaa,0xaa,
0x4f,0x44,0xaa,0xaa,0xfa,0x00,0x03,0x38,0xaa,0x4f,0x00,0x18,0x20,0x03,0x10,0x0b,
0x5a,0x55,0xf5,0xc0,0x00,0x13,0x11,0x61,0xbb,0xbb,0x44,0x6f,0x66,0xb6,0x9c,0x00,
0x06,0xbb,0xf4,0x01,0xd0,0x20,0x03,0x00,0x0b,0x44,0xbf,0xc2,0x00,0x03,0x00,0x08,
0x36,0x33,0x33,0x63,0x10,0x03,0x66,0x0d,0x66,0x36,0x63,0x66,0x40,0x0b,0x00,0x09,
0x66,0x50,0x17,0x01,0xbb,0xbb,0x4f,0x44,0xbb,0xbb,0xfb,0x00,0x03,0x38,0xbb,0x4f,
0x00,0x3a,0x20,0x03,0x10,0x0b,0x6b,0x66,0xf6,0xdf,0x00,0x13,0x22,0xbe,0xf4,0xf0,
0x03,0x70,0x03,0x10,0x81,0xf0,0x03,0x70,0x03,0xfd,0xe1,0xdc,0x00,0xc0,0x00,0x63,
0x60,0x01,0xf1,0xfe,0xa2,0xbf,0x77,0xf2,0xbd,0x80,0x32,0xbf,0xcc,0xcc,0xcc,0xcc,
0x77,0x77,0x77,0x68,0xc7,0xf0,0x36,0x72,0xbf,0xcc,0x10,0x04,0xf4,0xcc,0xcc,0x09,
0x44,0x7f,0x77,0xc7,0x00,0x06,0xcc,0xf4,0x00,0x30,0xcc,0x20,0x03,0x00,0x0b,0x44,
0xcf,0x00,0x03,0x00,0x08,0x37,0x33,0x20,0x33,0x73,0x10,0x03,0x77,0x77,0x37,0x73,
0x77,0xd0,0x40,0x0b,0x00,0x09,0x77,0x50,0x17,0xcc,0xcc,0x4f,0x44,0x13,0xcc,0xcc,
0xfc,0x00,0x03,0xcc,0x4f,0x00,0x3a,0x20,0x03,0x8d,0x10,0x0b,0x7c,0x77,0xf7,0x00,
0x13,0x11,0x1f,0xff,0x12,0xc3,0xcf,0xf3,0x89,0x40,0x01,0xaa,0x5a,0x03,0xc4,0x01,
0xb0,0x52,0x2f,0xd0,0x01,0x6f,0x55,0xd2,0x2f,0xf0,0xc9,0xbb,0xf0,0x5f,0x70,0x01,
0x11,0x43,0x13,0xcb,0xdb,0xf0,0x5f,0x30,0x01,0x66,0xf0,0x5f,0xd0,0x5f,0xcc,0xf0,
0x5f,0x70,0x01,0xbb,0x00,0xef,0x77,0x11,0x6b,0xf0,0x5f,0x30,0x01,0x77,0xf0,0x5f,
0xc0,0x5e,0x00,0xff,0xff,0xf4,0xff,0xff,0x33,0xf4,0xff,0x7e,0x3f,0x00,0x07,0x50,
0x03,0x00,0x0f,0x11,0x8f,0x10,0x54,0x00,0x01,0x3f,0x41,0x33,0x00,0x01,0x3f,0x3f,
0xff,0x3f,0xf3,0x40,0x07,0x1b,0x3f,0x3f,0x33,0x50,0x73,0x20,0x1f,0xf3,0x00,0x11,
0x30,0x17,0x98,0x30,0x03,0xf3,0x3f,0x21,0xff,0x40,0x1e,0x66,0x33,0xff,0x1a,0xff,
0x6f,0xf3,0xc0,0x03,0x00,0x1e,0x6f,0x00,0x1b,0x6f,0x40,0x66,0x00,0x04,0xf6,0xff,
0x33,0xf3,0xf6,0xff,0x7d,0xf3,0x00,0x03,0x20,0x07,0x00,0x0f,0x00,0x03,0x00,0x20,
0xf6,0x50,0x5f,0xdf,0x00,0x1b,0x30,0x01,0x3f,0x00,0x21,0x10,0x0d,0xa0,0x5f,0x00,
0x13,0x50,0x1f,0xb0,0x30,0x01,0x33,0x00,0x01,0x80,0x1f,0x44,0x33,0xf3,0xff,0x1d,
0x4f,0x3f,0xff,0xb0,0x03,0x12,0x23,0x00,0x1b,0x4f,0x10,0xe3,0x81,0x30,0x03,0xee,
0xfe,0xf4,0xef,0xff,0xef,0x60,0x03,0xcb,0x40,0x0f,0x50,0x63,0xff,0xef,0x04,0xb2,
0xfe,0x80,0x01,0x50,0x0f,0xbf,0x50,0x1f,0xee,0x00,0x12,0x80,0x01,0x50,0x0f,0x10,
0xe3,0x10,0x03,0x00,0x2e,0x78,0x6f,0x00,0x2e,0x60,0x03,0x50,0x0f,0xf1,0x90,0x44,
0x44,0x99,0x00,0x49,0x44,0x44,0xe9,0x9e,0x49,0x44,0xe9,0x18,0xee,0x9e,0xf9,0xf3,
0xd3,0x10,0x03,0x84,0xf8,0x44,0x01,0x84,0xd8,0xfd,0x84,0xd8,0xdd,0xfd,0xf3,0xd3,
0x00,0x44,0xf4,0x9f,0x49,0x44,0xf4,0xef,0x9e,0x1c,0x49,0xf4,0xef,0x00,0x3f,0xf0,
0x1f,0x10,0x03,0x84,0xf8,0x5b,0x4f,0x00,0x3f,0x8f,0x00,0x3f,0x21,0x20,0x64,0x03,
0xe7,0x70,0x03,0x00,0x44,0x44,0x64,0x46,0x84,0x44,0x64,0x44,0x58,0x58,0x00,0x67,
0x55,0x21,0xc0,0x64,0x08,0x58,0x55,0x84,0xc8,0x14,0x20,0xe0,0x01,0x85,0x44,0x00,
0x02,0x44,0x55,0x48,0x00,0x84,0xff,0x85,0x44,0xff,0x33,0x45,0xf4,0x00,0x33,0x22,
0x44,0xf8,0x23,0x22,0x44,0x3f,0xf0,0x03,0x3f,0x00,0x1d,0x00,0x36,0x06,0x33,0x58,
0x55,0xff,0x48,0x00,0x84,0x55,0x33,0xff,0x44,0x58,0x22,0xe2,0x00,0x4f,0x54,0x22,
0x22,0x8f,0x44,0x22,0x22,0x47,0xfe,0x15,0x37,0xaa,0xba,0xbb,0x70,0x01,0xf0,0x0f,
0x30,0x11,0xff,0x70,0x03,0xd0,0x0d,0xf0,0x2f,0xf0,0x0f,0xd0,0x4f,0x70,0x01,0xa1,
0xef,0x42,0x0b,0xfe,0x13,0x13,0x56,0xdf,0xa1,0xef,0x80,0x01,0x55,0x1f,0x91,0xef,
0xf0,0x1f,0x66,0x71,0x66,0x91,0xef,0x52,0x0b,0x80,0x1e,0x66,0x94,0xe9,0x08,0xec,
0x03,0x94,0xe9,0xfe,0x44,0x44,0x94,0xf1,0xeb,0x00,0x03,0x00,0xd8,0xdd,0x8d,0xf8,
0xd8,0x8d,0x48,0x44,0x35,0x88,0x48,0xf2,0x27,0x10,0x01,0x9f,0x00,0x3f,0x4f,0x00,
0x3f,0x62,0x4f,0x00,0x3f,0xf1,0xe7,0x44,0xf4,0xdf,0x00,0x3f,0xdf,0x06,0x8d,0x48,
0xf4,0x8f,0x48,0xf0,0x1b,0x35,0xff,0x58,0xe7,0x01,0x9b,0x01,0x9f,0x01,0xd8,0x44,
0x54,0x41,0xab,0x11,0xb3,0x40,0x03,0xff,0x17,0x4b,0x50,0x01,0x13,0x53,0x50,0x01,
0x14,0xd3,0x10,0x01,0x11,0xe3,0x50,0x03,0x21,0x46,0xf8,0x00,0x03,0xf4,0x2e,0x22,
0x66,0x08,0x03,0x16,0x66,0x46,0x84,0x00,0xe4,0x44,0x21,0xe3,0x60,0x03,0xe2,0x02,
0x8f,0x64,0x22,0xee,0x4f,0x64,0x09,0xe7,0x66,0x3f,0xff,0x48,0x12,0x68,0xf6,0x5f,
0x95,0x3a,0xf0,0x12,0x35,0x50,0x55,0x57,0xf7,0xf0,0x07,0xb0,0x07,0x31,0x87,0x50,
0x36,0x46,0x90,0x3e,0x20,0x07,0x10,0x1f,0xbf,0x09,0x22,0x40,0xf0,0x03,0xa0,0x03,
0x19,0x63,0xf0,0x17,0x40,0x03,0x61,0xab,0x0f,0x66,0x66,0xf6,0x64,0x07,0xa8,0x10,
0x03,0x10,0x0b,0xd1,0xc7,0xae,0x01,0x5a,0xf5,0x08,0x2c,0xfa,0x10,0x03,0x10,0x0b,
0xd0,0x1f,0x74,0x0f,0x77,0x77,0xf7,0xc7,0x06,0xc8,0x10,0x03,0x10,0x0b,0xd7,0xbf,
0x6e,0x6f,0x00,0x53,0x08,0x32,0xfb,0x10,0x03,0x10,0x0b,0xd1,0xc7,0x5f,0xdd,0x00,
0x53,0x08,0xb2,0xfa,0x10,0x03,0x10,0x0b,0xd0,0x1f,0x7f,0x00,0x53,0xbf,0x07,0x52,
0xfc,0x10,0x03,0x10,0x0b,0xd7,0xff,0x21,0x37,0x50,0x03,0x54,0x0b,0xf8,0x00,0x0c,
0x11,0xe3,0x93,0x2f,0xda,0x5f,0xf3,0xff,0xff,0xee,0x45,0xba,0x1a,0x07,0xf8,0x3a,
0x13,0xd3,0xff,0x01,0xfb,0x58,0x09,0xe7,0x54,0x1f,0xee,0xee,0x8f,0x2b,0xe7,0xa0,
0x7f,0xf1,0xed,0x1c,0x07,0xf0,0x01,0x80,0xb0,0x01,0x9e,0x11,0xf1,0xee,0x9e,0xff,
0x1f,0x00,0xef,0x9e,0x1e,0xf1,0xef,0x9e,0xf1,0xff,0x8b,0x00,0x0f,0x11,0xef,0x9e,
0x05,0xb0,0x9e,0x10,0x1b,0x20,0x21,0x80,0x00,0x0c,0xfe,0x33,0x33,0xef,0xfe,0xff,
0x3f,0x01,0xef,0xee,0xfe,0xf3,0xee,0xee,0x3f,0x00,0x03,0xf4,0x03,0xd0,0x60,0x41,
0x10,0x1f,0x03,0xca,0xfe,0x15,0xa6,0xfe,0xf6,0x1a,0xee,0xee,0x6f,0x00,0x03,0x90,
0x1f,0xfe,0x00,0x16,0x4f,0x00,0xf5,0xee,0x6f,0xff,0x54,0xef,0xff,0x66,0xae,0x03,
0xe9,0x66,0x13,0xce,0x66,0x00,0x20,0x2c,0xd6,0x50,0x43,0xee,0x0e,0xfe,0x77,0x77,
0xef,0x10,0x03,0x10,0x0b,0x70,0x3a,0xff,0x00,0xee,0x2f,0xf7,0x27,0xef,0x2f,0x33,
0x23,0x06,0xff,0x2f,0x3f,0x2f,0xf2,0x00,0x07,0x10,0x03,0xef,0x18,0xfe,0x22,0x22,
0x70,0x27,0x0b,0x38,0x4e,0x55,0xf5,0x29,0xf4,0x4e,0x0a,0x7a,0x4e,0x07,0x91,0xfe,
0xf8,0x01,0x3c,0xb0,0x90,0x7f,0x7e,0x00,0x0b,0x00,0x56,0x7e,0x77,0x77,0xe7,0x2f,
0xfe,0xff,0x10,0x08,0xf7,0x30,0x13,0x4b,0x47,0x26,0x66,0x10,0xc4,0xff,0x00,0x6e,
0x30,0x08,0x00,0x06,0x46,0xb9,0x27,0xc3,0xf0,0x1f,0x20,0x13,0x24,0xeb,0xff,0x21,
0x65,0x13,0x8b,0xf0,0x01,0xd1,0x9b,0x61,0xa3,0x22,0x1b,0x40,0x01,0x1b,0xf7,0xaf,
0x40,0x03,0x46,0x00,0xb6,0x46,0x01,0xfb,0x93,0xff,0x3d,0xcb,0x50,0x03,0x3c,0x8f,
0x64,0x01,0xfb,0xa3,0xff,0xf1,0xce,0xf0,0x01,0x1e,0x11,0x00,0xef,0x11,0x1e,0xff,
0xf1,0xf1,0x1e,0x11,0x02,0xf1,0x11,0x1e,0x1f,0xff,0xf1,0x00,0x0b,0x11,0xc1,0x01,
0x57,0x61,0x64,0x11,0x1f,0x11,0xef,0xff,0x00,0x17,0xa3,0x00,0x07,0xf1,0x00,0x07,
0xff,0x11,0x1f,0x11,0x5a,0x71,0x3f,0x00,0xf1,0xee,0x1e,0xf1,0xf1,0xee,0xf1,0x1f,
0x80,0x00,0x03,0x1e,0xf1,0xee,0x11,0x11,0x11,0xf1,0x48,0xf1,0x00,0x25,0xff,0xfe,
0x52,0x3f,0x1e,0x1e,0xef,0x32,0x9e,0x1f,0x02,0x3f,0x00,0x46,0x9e,0xff,0x02,0x43,
0xef,0xff,0x02,0x4f,0x01,0xb6,0x52,0x3f,0xf0,0x03,0xb0,0x03,0x1c,0xcf,0xf0,0x17,
0x70,0x03,0xbe,0x10,0x01,0x1f,0x20,0x86,0x32,0x30,0x10,0x07,0x10,0x0f,0x50,0x7f,
0xee,0x04,0xf1,0xef,0x11,0xef,0x1f,0x20,0xbf,0xef,0xf1,0x87,0x00,0x87,0xf1,0xf1,
0xff,0x11,0x11,0x9f,0x50,0xc0,0x02,0xd7,0x16,0xee,0x9e,0xf1,0x00,0x9f,0xf1,0x00,
0xa7,0x10,0x03,0x1f,0xbb,0x00,0xa3,0xfe,0x70,0x9f,0x11,0x01,0x00,0xe2,0xff,0x00,
0x03,0x00,0x07,0x4f,0xfe,0x00,0x07,0xee,0x11,0x00,0x67,0x30,0x3f,0x18,0xe3,0xf1,
0xff,0xf7,0x62,0x1f,0x1c,0x4f,0xf0,0x01,0x10,0x01,0x46,0x34,0x00,0xf2,0x0d,0xf5,
0xa3,0xf0,0xb0,0x0f,0x60,0x02,0xf2,0x43,0xf4,0x5f,0x66,0xef,0xbc,0xbc,0x04,0xbc,
0xef,0xcc,0xcb,0xcb,0xd0,0x07,0xf2,0xce,0x10,0xbc,0xbc,0x22,0x00,0x08,0xbc,0x9a,
0x9a,0x9a,0x0c,0xcb,0xa9,0xa9,0xa9,0xf0,0x07,0x30,0x07,0x9a,0x7a,0x03,0x78,0x78,
0xa9,0x89,0x87,0x87,0xf0,0x07,0x30,0x07,0x00,0x78,0x78,0x56,0x56,0x87,0x87,0x65,
0x65,0xc0,0xf0,0x07,0x30,0x07,0x56,0x56,0x36,0x34,0x65,0x65,0x30,0x45,0x43,0xf0,
0x07,0x30,0x07,0x34,0x34,0x44,0xfe,0x09,0x43,0x43,0x43,0xfe,0xf0,0x07,0xe4,0x2f,
0x00,0x06,0x5f,0x22,0x11,0xfc,0xe9,0xf0,0x03,0xf0,0x03,0xf0,0x03,0x20,0x03,0xf0,
0x01,0xf7,0xf4,0xdf,0x21,0xff,0x44,0xd7,0x12,0x07,0x11,0x01,0xff,0x01,0xc7,0x61,
0xff,0xab,0x01,0xf5,0xee,0x04,0xff,0xee,0x02,0x17,0xee,0x00,0x27,0x02,0xe1,0x34,
0x1f,0xf1,0x01,0xdb,0x00,0x15,0x1e,0x12,0x6f,0x9e,0xee,0xbf,0x00,0x37,0x1e,0x12,
0x3f,0x10,0x3b,0x12,0xe3,0x00,0x07,0x04,0x98,0x20,0x3f,0xf7,0x21,0x84,0x11,0xeb,
0x00,0x01,0x00,0x05,0x46,0xf7,0x92,0xf1,0xcf,0xf0,0x01,0xf6,0xf0,0x01,0xb0,0x01,
0xf4,0x5f,0x50,0x01,0x22,0x01,0xe8,0x05,0x0a,0xce,0x0b,0x22,0x22,0xf2,0xef,0x0c,
0xae,0xf2,0xdc,0xbf,0x51,0xe7,0xff,0x54,0xeb,0xd0,0x1f,0x51,0xe7,0xf0,0x1f,0x30,
0x01,0x51,0xe7,0xf0,0x1f,0x30,0x01,0xf2,0x51,0xe7,0xf0,0x1f,0x30,0x01,0x01,0xe6,
0x22,0xe3,0x05,0xac,0xfe,0x1e,0x2f,0x22,0x22,0x00,0x02,0xe0,0x01,0x44,0xa1,0x01,
0x6b,0xfe,0xff,0x13,0xd7,0x90,0x03,0x54,0x9f,0x66,0x9f,0x13,0xb7,0xd6,0x9f,0xf2,
0x13,0x70,0x03,0xf6,0x12,0x5b,0xf4,0x4f,0xb4,0x7b,0x23,0xc5,0x9f,0x00,0x03,0x00,
0x09,0x9f,0x1f,0x99,0x99,0xf9,0x30,0x08,0x00,0x06,0x10,0x13,0x55,0xff,0xf0,0x1f,
0xd8,0x20,0x13,0x5d,0xdf,0x1f,0x05,0x12,0x20,0x03,0x21,0x22,0x22,0x09,0x1f,0x21,
0x33,0x33,0x70,0x03,0x88,0x88,0x10,0x1f,0xe4,0x00,0x1a,0x20,0x01,0x10,0xef,0x33,
0x33,0x70,0x01,0x88,0x88,0x03,0x88,0x88,0x1f,0x21,0x66,0x66,0x70,0x03,0x10,0x0f,
0x25,0x77,0x77,0x70,0x03,0x99,0x99,0xcb,0x6e,0x1a,0x00,0x02,0x0b,0x11,0xaa,0xaa,
0x11,0x30,0x03,0x1a,0x10,0x07,0x70,0x01,0x80,0x50,0x67,0x11,0x33,0x33,0x31,0x11,
0x13,0x11,0xe7,0x20,0x03,0xf0,0x1f,0x00,0x1e,0x13,0x13,0x00,0x05,0x30,0x03,0xf0,
0x1f,0x04,0x11,0x11,0x31,0x33,0x13,0x00,0x40,0x11,0x13,0xe3,0x10,0x03,0xf0,0x1f,
0x00,0x3f,0x31,0x33,0x33,0x00,0x25,0x10,0x29,0xae,0xf0,0x3f,0xa1,0x50,0x9d,0xa1,
0x20,0x03,0xd0,0x1f,0x20,0x08,0xc3,0x21,0x3a,0xac,0x10,0x03,0x3a,0x33,0x33,0xc3,
0xf0,0x1f,0xc3,0x30,0x01,0x10,0x1a,0xcc,0xcc,0x3c,0xac,0xf0,0x1f,0x60,0x3e,0x0f,
0xc3,0x33,0x33,0xac,0xf0,0x3f,0x50,0x0c,0x10,0x19,0xb0,0x3e,0x35,0xaa,0x11,0x10,
0x0e,0x10,0x21,0xca,0x10,0x97,0x1c,0x21,0x4e,0x7f,0xee,0x0b,0x97,0x50,0x03,0x1b,
0xa0,0x50,0x03,0x1b,0xa0,0x10,0x03,0x25,0xff,0xdc,0xf1,0xff,0x52,0x1f,0x4f,0xd1,
0xef,0xd0,0x0f,0x90,0x01,0x99,0x99,0x3f,0x99,0x99,0xd0,0x0f,0x30,0x33,0x50,0x03,
0xf0,0x0f,0x21,0xe3,0x21,0xe7,0xf9,0x50,0x03,0x11,0xff,0x12,0x07,0x40,0xd3,0x11,
0xeb,0x11,0x31,0x30,0x03,0xff,0x20,0x0b,0x30,0x01,0x61,0x47,0x81,0xeb,0x01,0xd6,
0x01,0xb7,0xb0,0x1f,0x01,0xeb,0xfd,0x21,0xe7,0x20,0x03,0x00,0x20,0xd0,0x1f,0x51,
0xe7,0x10,0x03,0x33,0x20,0x07,0xfc,0xd0,0x1f,0x31,0xe7,0x30,0x03,0x00,0x0f,0x21,
0xff,0x70,0x1f,0xca,0xc3,0xd8,0x01,0x84,0x21,0xb0,0xca,0x01,0x8f,0x01,0xd4,0xca,
0xcc,0xac,0x88,0xa1,0xa7,0xaa,0x3a,0x3c,0x30,0x03,0xc3,0x3a,0x3a,0x04,0x33,0xac,
0xca,0xca,0xcc,0xb0,0x3f,0xc3,0xc3,0x84,0x30,0x01,0x3c,0xac,0xc3,0x3c,0x00,0x46,
0xca,0xac,0xff,0x00,0x46,0xa0,0x3f,0x00,0x5a,0x10,0x03,0x10,0x17,0x11,0xf2,0x21,
0xe2,0xa0,0x5f,0xff,0x11,0x2a,0x10,0x03,0x01,0xef,0x11,0xf7,0x10,0xa3,0x82,0x16,
0x2d,0x88,0x00,0x07,0xf8,0x60,0x03,0x0b,0x93,0xf0,0x03,0xf0,0x03,0x50,0x03,0x1f,
0x21,0x44,0x67,0x44,0x70,0x03,0x11,0xb3,0x55,0x55,0x70,0x03,0xf1,0xff,0x14,0x03,
0xff,0x51,0x43,0x24,0x3b,0xe1,0xff,0x04,0x43,0x44,0x4f,0x10,0x1f,0xd4,0x2f,0xd0,
0x0f,0xfe,0x96,0x0b,0x10,0x0f,0x3c,0x4f,0x30,0x01,0x10,0x0f,0x98,0x92,0x10,0x0f,
0x77,0x75,0x77,0x70,0x01,0xf2,0x8f,0xf0,0x0f,0x5d,0x00,0x47,0xd4,0x1c,0x83,0xab,
0x00,0x08,0x44,0x00,0x08,0x44,0x00,0x08,0x44,0x00,0x08,0x00,0x6e,0x61,0x5d,0x00,
0x03,0x10,0x1a,0x55,0x55,0xd5,0xdd,0x10,0x03,0x02,0x5d,0xd5,0x5d,0xdd,0xdd,0xd5,
0x20,0x01,0x5d,0x7f,0xdd,0x0e,0xf8,0x30,0x17,0xf0,0x01,0xa0,0x01,0x20,0x5f,0x03,
0x7a,0xf6,0xd9,0xfe,0x30,0x01,0x10,0x23,0x13,0x9a,0xf0,0x19,0x6c,0xdf,0x06,0x17,
0x39,0xdf,0xff,0xe8,0x47,0xdf,0x16,0x27,0x97,0xdf,0x1e,0x01,0x4d,0x1e,0x1f,0x1f,
0x5b,0x1f,0x20,0x03,0x11,0x00,0x03,0x05,0xb1,0xfe,0x09,0xc3,0x58,0x20,0xff,0x0a,
0x32,0x1a,0x3a,0x0a,0xd4,0x2b,0x02,0x1a,0x3e,0x0b,0x10,0x0a,0xc1,0x5a,0x5f,0x74,
0x11,0x0b,0x0f,0x0b,0x01,0x00,0x22,0xee,0x00,0x1b,0xee,0xf1,0x3e,0xf1,0xf1,0x11,
0x9b,0x2a,0x93,0xf5,0x9f,0xf5,0x9f,0xe5,0x9f,0x31,0xfc,0x25,0x3e,0x25,0xa1,0xf5,
0x3f,0xf5,0x3f,0xe4,0xdf,0x04,0xfb,0x3a,0x33,0x07,0xc3,0xc3,0xca,0x3c,0xcc,0xf5,
0x1f,0x33,0x12,0x00,0x1e,0x0f,0xaa,0xca,0x3c,0x3c,0xa5,0x1e,0x60,0x1f,0x15,0x75,
0x15,0x1a,0xfd,0x05,0x3f,0xf5,0x1f,0xc5,0x1f,0xf0,0x3f,0x35,0x5b,0x20,0x60,0xc3,
0xc0,0x3f,0x93,0x60,0x9f,0x3c,0x3c,0x00,0x02,0xcc,0x3a,0x00,0x7f,0x31,0x7f,0x21,
0xf1,0x1e,0x0b,0x5e,0x1e,0x1e,0x11,0xff,0x40,0x07,0x35,0xf1,0x1e,0x0b,0x41,0x6b,
0xbf,0xef,0x07,0xe0,0xef,0x07,0xd8,0xa7,0x01,0x86,0xef,0x0b,0xc1,0xef,0xef,0x07,
0xe0,0x0b,0x5e,0x6c,0x80,0xfa,0x2c,0xb7,0x2c,0xbf,0x4c,0xc7,0x00,0x28,0x9c,0xbf,
0xf1,0x00,0x3f,0xff,0xbf,0x80,0x3f,0xf1,0x00,0x3f,0x1d,0xb5,0x6c,0xdf,0x11,0xd5,
0x01,0xfb,0x10,0x04,0xff,0x20,0x07,0x00,0x0f,0x13,0x5b,0x81,0xff,0x0c,0xdc,0x00,
0x03,0x1c,0xd8,0x00,0x08,0xff,0x12,0x07,0x1b,0xdf,0x60,0x5f,0x00,0x78,0x02,0x15,
0x20,0x57,0x0d,0x20,0x00,0x07,0x7f,0xf1,0x2c,0x11,0x10,0x1b,0xf5,0x9f,0xc5,0x9f,
0x81,0xeb,0x20,0x0b,0xf5,0x3f,0xc9,0xf5,0x3f,0x94,0xbf,0x33,0x33,0x01,0x47,0xcc,
0xc3,0x10,0x03,0x24,0xca,0x33,0x01,0xb5,0xcc,0xca,0xa0,0x1f,0x3a,0xc3,0x02,0x3c,
0x3c,0x33,0xac,0x3a,0xcc,0x00,0x03,0xac,0x84,0x05,0x23,0xaa,0xca,0xac,0xac,0xa0,
0x1f,0xcc,0xcc,0x77,0xc3,0x12,0x2e,0x15,0x47,0x05,0x7e,0xac,0x05,0x7e,0xf5,0x1f,
0xf5,0x1f,0xfd,0x85,0x9d,0x31,0xe7,0x00,0x40,0x00,0x01,0x40,0x40,0xb0,0x7f,0xac,
0x00,0x02,0xff,0x00,0x22,0x17,0x6e,0x35,0xde,0xa0,0x1f,0x05,0x22,0xf0,0x01,0xf0,
0x01,0xf0,0x01,0xff,0xf0,0x01,0xf0,0x01,0xf0,0x01,0xf0,0x01,0xf0,0x01,0xf0,0x01,
0xf0,0x01,0xf0,0x01,0xc0,0xf0,0x01,0x20,0x01,0x00,0x00,0x00,
};

//======================================================================
//		œØÃﬂ√ﬁ∞¿
//======================================================================
//------------------------------------------
//	Ω€Øƒë‰œØÃﬂ 30x20
//------------------------------------------
static const u16 slotbg_Map[600]={
	0x1084,0x1085,0x1086,0x1087,0x1088,0x1089,0x4001,0x00c7,    /* 0 */
	0x00c8,0x00c9,0x00c9,0x00c9,0x00c9,0x04c8,0x04c7,0x4401,
	0x1489,0x1488,0x1487,0x1486,0x1485,0x1484,0x0011,0x0020,
	0x0020,0x0020,0x0020,0x0020,0x0020,0x0411,
	0x1094,0x1095,0x1096,0x1097,0x1098,0x1099,0x0001,0x0001,    /* 1 */
	0x00ca,0x00cb,0x00cb,0x00cb,0x00cb,0x04ca,0x0401,0x0401,
	0x1499,0x1498,0x1497,0x1496,0x1495,0x1494,0x0030,0x0031,
	0x0032,0x0033,0x0034,0x0035,0x0036,0x0037,
	0x0001,0x0001,0x0001,0x006f,0x006e,0x006e,0x006e,0x006e,    /* 2 */
	0x006e,0x006e,0x006e,0x006e,0x006e,0x006e,0x006e,0x006e,
	0x006e,0x006e,0x007f,0x0001,0x0001,0x0001,0x0038,0x0039,
	0x003a,0x003b,0x043b,0x0039,0x003a,0x0438,
	0x4002,0x4003,0x4004,0x0001,0x0054,0x0055,0x0455,0x0454,    /* 3 */
	0x0001,0x0054,0x0055,0x0455,0x0454,0x0001,0x0054,0x0055,
	0x0455,0x0454,0x0001,0x4005,0x4006,0x4007,0x0048,0x0049,
	0x004a,0x004b,0x044b,0x044a,0x0449,0x0448,
	0x4012,0x4013,0x4014,0x403c,0x0457,0x0456,0x0056,0x0057,    /* 4 */
	0x000f,0x0457,0x0456,0x0056,0x0057,0x000f,0x0457,0x0456,
	0x0056,0x0057,0x4c4d,0x4015,0x4016,0x4017,0x0459,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0059,
	0x400b,0x400c,0x400d,0x404c,0x0000,0x0000,0x0000,0x0000,    /* 5 */
	0x001f,0x0000,0x0000,0x0000,0x0000,0x001f,0x0000,0x0000,
	0x0000,0x0000,0x4c3d,0x400b,0x400c,0x400d,0x0458,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0058,
	0x401b,0x401c,0x401d,0x405a,0x0000,0x0000,0x0000,0x0000,    /* 6 */
	0x405d,0x0000,0x0000,0x0000,0x0000,0x445d,0x0000,0x0000,
	0x0000,0x0000,0x445a,0x401b,0x401c,0x401d,0x0458,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0058,
	0x402a,0x402b,0x402c,0x401e,0x0000,0x0000,0x0000,0x0000,    /* 7 */
	0x403e,0x0000,0x0000,0x0000,0x0000,0x403f,0x0000,0x0000,
	0x0000,0x0000,0x441e,0x402a,0x402b,0x402c,0x0458,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0058,
	0x4008,0x4009,0x400a,0x401e,0x0000,0x0000,0x0000,0x0000,    /* 8 */
	0x404e,0x0000,0x0000,0x0000,0x0000,0x404f,0x0000,0x0000,
	0x0000,0x0000,0x441e,0x4008,0x4009,0x400a,0x0458,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0058,
	0x4018,0x4019,0x401a,0x405b,0x0000,0x0000,0x0000,0x0000,    /* 9 */
	0x405e,0x0000,0x0000,0x0000,0x0000,0x445e,0x0000,0x0000,
	0x0000,0x0000,0x445b,0x4018,0x4019,0x401a,0x0458,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0058,
	0x4027,0x4028,0x4029,0x401e,0x0000,0x0000,0x0000,0x0000,    /* 10 */
	0x403f,0x0000,0x0000,0x0000,0x0000,0x403e,0x0000,0x0000,
	0x0000,0x0000,0x441e,0x4027,0x4028,0x4029,0x0458,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0058,
	0x4021,0x4022,0x4023,0x401e,0x0000,0x0000,0x0000,0x0000,    /* 11 */
	0x404f,0x0000,0x0000,0x0000,0x0000,0x404e,0x0000,0x0000,
	0x0000,0x0000,0x441e,0x4021,0x4022,0x4023,0x0458,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0058,
	0x4024,0x4025,0x4026,0x405c,0x0000,0x0000,0x0000,0x0000,    /* 12 */
	0x405f,0x0000,0x0000,0x0000,0x0000,0x445f,0x0000,0x0000,
	0x0000,0x0000,0x445c,0x4024,0x4025,0x4026,0x0458,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0058,
	0x402d,0x402e,0x402f,0x403d,0x0000,0x0000,0x0000,0x0000,    /* 13 */
	0x001f,0x0000,0x0000,0x0000,0x0000,0x001f,0x0000,0x0000,
	0x0000,0x0000,0x4c4c,0x402d,0x402e,0x402f,0x0458,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0058,
	0x4005,0x4006,0x4007,0x404d,0x0040,0x0041,0x0441,0x0440,    /* 14 */
	0x080f,0x0040,0x0041,0x0441,0x0440,0x080f,0x0040,0x0041,
	0x0441,0x0440,0x4c3c,0x4002,0x4003,0x4004,0x0458,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0058,
	0x4015,0x4016,0x4017,0x4001,0x0050,0x0042,0x0043,0x0450,    /* 15 */
	0x0001,0x0050,0x0042,0x0043,0x0450,0x0001,0x0050,0x0042,
	0x0043,0x0450,0x0001,0x4012,0x4013,0x4014,0x0458,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0058,
	0x0001,0x0080,0x0081,0x0082,0x0083,0x0052,0x0053,0x0483,    /* 16 */
	0x0064,0x0083,0x0052,0x0053,0x0483,0x0064,0x0083,0x0052,
	0x0053,0x0483,0x0482,0x0481,0x0480,0x0001,0x0c59,0x0000,
	0x0000,0x0000,0x0000,0x0000,0x0000,0x0859,
	0x0001,0x0090,0x0091,0x0092,0x0093,0x0071,0x0471,0x0493,    /* 17 */
	0x0001,0x0093,0x0071,0x0471,0x0493,0x0001,0x0093,0x0071,
	0x0471,0x0493,0x0492,0x0491,0x0490,0x0001,0x0811,0x0820,
	0x0820,0x0820,0x0820,0x0820,0x0820,0x0c11,
	0x0044,0x0044,0x0044,0x0044,0x0044,0x0045,0x0010,0x0010,    /* 18 */
	0x0010,0x0010,0x0010,0x00a3,0x00a4,0x00a5,0x00a6,0x00a7,
	0x00a8,0x00a9,0x00aa,0x00ab,0x00ac,0x00ad,0x00d0,0x00d1,
	0x00d2,0x00d3,0x00d4,0x00d5,0x00d6,0x0045,
	0x0046,0x0046,0x0046,0x0046,0x0046,0x0047,0x0010,0x0010,    /* 19 */
	0x0010,0x0010,0x0010,0x00b3,0x00b4,0x00b5,0x00b6,0x00b7,
	0x00b8,0x00b9,0x00ba,0x00bb,0x00bc,0x00bd,0x00e0,0x00e1,
	0x00e2,0x00e3,0x00e4,0x00e5,0x00e6,0x0047,
};

//------------------------------------------
//	çêím∂Øƒ≤›œØÃﬂ 20x11
//------------------------------------------
static const u16 kokuchi_Map[220]={
	0x30a0,0x30a1,0x30a1,0x30a1,0x30a1,0x30a1,0x30a1,0x30a1,    /* 0 */
	0x30a1,0x30a1,0x30a1,0x30a1,0x30a1,0x30a1,0x30a1,0x30a1,
	0x30a1,0x30a1,0x30a1,0x34a0,
	0x30b0,0x30c3,0x30c3,0x30c3,0x30c3,0x30c3,0x30c3,0x30c3,    /* 1 */
	0x30c3,0x30c3,0x30c3,0x30c3,0x30c3,0x30c3,0x30c3,0x30c3,
	0x30c3,0x30c3,0x30c3,0x34b0,
	0x30b0,0x30c3,0x30c3,0x30c3,0x30c3,0x30c3,0x30c3,0x30c3,    /* 2 */
	0x30c3,0x30c3,0x30c3,0x30c3,0x30c3,0x30c3,0x30c3,0x30c3,
	0x30c3,0x30c3,0x30c3,0x34b0,
	0x30c0,0x30c4,0x30c4,0x30c4,0x30c4,0x30c4,0x30c4,0x30c4,    /* 3 */
	0x30c4,0x30c4,0x30c4,0x30c4,0x30c4,0x30c4,0x30c4,0x30c4,
	0x30c4,0x30c4,0x30c4,0x34c0,
	0x30a2,0x30c5,0x30c5,0x30c5,0x30c5,0x30c5,0x30c5,0x30c5,    /* 4 */
	0x30c5,0x30c5,0x30c5,0x30c5,0x30c5,0x30c5,0x30c5,0x30c5,
	0x30c5,0x30c5,0x30c5,0x34a2,
	0x30b2,0x30b1,0x30b1,0x30b1,0x30b1,0x30b1,0x30b1,0x30b1,    /* 5 */
	0x30b1,0x30b1,0x30b1,0x30b1,0x30b1,0x30b1,0x30b1,0x30b1,
	0x30b1,0x30b1,0x30b1,0x34b2,
	0x30b2,0x30b1,0x30b1,0x30b1,0x30b1,0x30b1,0x30b1,0x30b1,    /* 6 */
	0x30b1,0x30b1,0x30b1,0x30b1,0x30b1,0x30b1,0x30b1,0x30b1,
	0x30b1,0x30b1,0x30b1,0x34b2,
	0x30b2,0x30b1,0x30b1,0x30b1,0x30b1,0x30b1,0x30b1,0x30b1,    /* 7 */
	0x30b1,0x30b1,0x30b1,0x30b1,0x30b1,0x30b1,0x30b1,0x30b1,
	0x30b1,0x30b1,0x30b1,0x34b2,
	0x30b2,0x30b1,0x30b1,0x30b1,0x30b1,0x30b1,0x30b1,0x30b1,    /* 8 */
	0x30b1,0x30b1,0x30b1,0x30b1,0x30b1,0x30b1,0x30b1,0x30b1,
	0x30b1,0x30b1,0x30b1,0x34b2,
	0x30b2,0x30b1,0x30b1,0x30b1,0x30b1,0x30b1,0x30b1,0x30b1,    /* 9 */
	0x30b1,0x30b1,0x30b1,0x30b1,0x30b1,0x30b1,0x30b1,0x30b1,
	0x30b1,0x30b1,0x30b1,0x34b2,
	0x30c2,0x30c1,0x30c1,0x30c1,0x30c1,0x30c1,0x30c1,0x30c1,    /* 10 */
	0x30c1,0x30c1,0x30c1,0x30c1,0x30c1,0x30c1,0x30c1,0x30c1,
	0x30c1,0x30c1,0x30c1,0x34c2,
};

//------------------------------------------
//	ê‡ñæâÊñ  30x20
//------------------------------------------
static const u16 slotbg_sel_Map[600]={
	0x1084,0x1085,0x1086,0x1087,0x1088,0x1089,0x4001,0x00c7,    /* 0 */
	0x00c8,0x00c9,0x00c9,0x00c9,0x00c9,0x04c8,0x04c7,0x4401,
	0x1489,0x1488,0x1487,0x1486,0x1485,0x1484,0x0011,0x0020,
	0x0020,0x0020,0x0020,0x0020,0x0020,0x0411,
	0x1094,0x1095,0x1096,0x1097,0x1098,0x1099,0x0001,0x0001,    /* 1 */
	0x00ca,0x00cb,0x00cb,0x00cb,0x00cb,0x04ca,0x0401,0x0401,
	0x1499,0x1498,0x1497,0x1496,0x1495,0x1494,0x0030,0x0031,
	0x0032,0x0033,0x0034,0x0035,0x0036,0x0037,
	0x0001,0x0011,0x0020,0x0020,0x0020,0x0020,0x0020,0x0020,    /* 2 */
	0x0020,0x0020,0x0020,0x0020,0x0020,0x0020,0x0020,0x0020,
	0x0020,0x0020,0x0020,0x0020,0x0411,0x0001,0x0038,0x0039,
	0x003a,0x003b,0x043b,0x0039,0x003a,0x0438,
	0x0001,0x208a,0x208c,0x208c,0x208c,0x208c,0x208c,0x208c,    /* 3 */
	0x208c,0x208c,0x208c,0x208c,0x208c,0x208c,0x208c,0x208c,
	0x208c,0x208c,0x208c,0x208c,0x207a,0x0001,0x0048,0x0049,
	0x004a,0x004b,0x044b,0x044a,0x0449,0x0448,
	0x0001,0x208b,0x208c,0x2074,0x2074,0x2074,0x2074,0x2074,    /* 4 */
	0x2074,0x2074,0x2074,0x2074,0x2074,0x2074,0x2074,0x2074,
	0x2074,0x2074,0x2074,0x2074,0x2079,0x0001,0x208a,0x20d9,
	0x20da,0x20dd,0x20de,0x20df,0x208c,0x207a,
	0x0001,0x208b,0x208c,0x2074,0x2074,0x2074,0x2074,0x2074,    /* 5 */
	0x2074,0x2074,0x2074,0x2074,0x2074,0x2074,0x2074,0x2074,
	0x2074,0x2074,0x2074,0x2074,0x2079,0x0001,0x208b,0x2068,
	0x2068,0x2068,0x208c,0x207b,0x207c,0x207d,
	0x0001,0x208b,0x208c,0x2074,0x2074,0x2074,0x2074,0x2074,    /* 6 */
	0x2074,0x2074,0x2074,0x2074,0x2074,0x2074,0x2074,0x2074,
	0x2074,0x2074,0x2074,0x2074,0x2079,0x0001,0x208b,0x2067,
	0x2067,0x2067,0x208c,0x207b,0x207c,0x207d,
	0x0001,0x208b,0x208c,0x2074,0x2074,0x2074,0x2074,0x2074,    /* 7 */
	0x2074,0x2074,0x2074,0x2074,0x2074,0x2074,0x2074,0x2074,
	0x2074,0x2074,0x2074,0x2074,0x2079,0x0001,0x208b,0x20db,
	0x20dc,0x20dd,0x20de,0x20df,0x208c,0x2079,
	0x0001,0x208b,0x208c,0x2074,0x2074,0x2074,0x2074,0x2074,    /* 8 */
	0x2074,0x2074,0x2074,0x2074,0x2074,0x2074,0x2074,0x2074,
	0x2074,0x2074,0x2074,0x2074,0x2079,0x0001,0x208b,0x2068,
	0x2068,0x2067,0x208c,0x208c,0x207e,0x207d,
	0x0001,0x208b,0x208c,0x2074,0x2074,0x2074,0x2074,0x2074,    /* 9 */
	0x2074,0x2074,0x2074,0x2074,0x2074,0x2074,0x2074,0x2074,
	0x2074,0x2074,0x2074,0x2074,0x2079,0x0001,0x208b,0x2067,
	0x2067,0x2068,0x208c,0x208c,0x207e,0x207d,
	0x0001,0x208b,0x208c,0x2074,0x2074,0x2074,0x2074,0x2074,    /* 10 */
	0x2074,0x2074,0x2074,0x2074,0x2074,0x2074,0x2074,0x2074,
	0x2074,0x2074,0x2074,0x2074,0x2079,0x0001,0x208b,0x2074,
	0x2074,0x2074,0x2074,0x2074,0x2074,0x2079,
	0x0001,0x208b,0x208c,0x2074,0x2074,0x2074,0x2074,0x2074,    /* 11 */
	0x2074,0x2074,0x2074,0x2074,0x2074,0x2074,0x2074,0x2074,
	0x2074,0x2074,0x2074,0x2074,0x2079,0x0001,0x208b,0x206b,
	0x206b,0x206b,0x2074,0x2074,0x209a,0x209b,
	0x0001,0x208b,0x208c,0x2074,0x2074,0x2074,0x2074,0x2074,    /* 12 */
	0x2074,0x2074,0x2074,0x2074,0x2074,0x2074,0x2074,0x2074,
	0x2074,0x2074,0x2074,0x2074,0x2079,0x0001,0x208b,0x206c,
	0x206c,0x206c,0x2074,0x2074,0x2074,0x208d,
	0x0001,0x208b,0x208c,0x2074,0x2074,0x2074,0x2074,0x2074,    /* 13 */
	0x2074,0x2074,0x2074,0x2074,0x2074,0x2074,0x2074,0x2074,
	0x2074,0x2074,0x2074,0x2074,0x2079,0x0001,0x208b,0x2069,
	0x2074,0x2074,0x2074,0x2074,0x208e,0x208f,
	0x0001,0x208b,0x208c,0x2074,0x2074,0x2074,0x2074,0x2074,    /* 14 */
	0x2074,0x2074,0x2074,0x2074,0x2074,0x2074,0x2074,0x2074,
	0x2074,0x2074,0x2074,0x2074,0x2079,0x0001,0x208b,0x206a,
	0x206a,0x206a,0x2075,0x2076,0x2077,0x2078,
	0x0001,0x209c,0x2074,0x2074,0x2074,0x2074,0x2074,0x2074,    /* 15 */
	0x2074,0x2074,0x2074,0x2074,0x2074,0x2074,0x2074,0x2074,
	0x2074,0x2074,0x2074,0x2074,0x209d,0x0001,0x208b,0x206d,
	0x206d,0x206d,0x20cd,0x20ce,0x20cf,0x20cc,
	0x0001,0x0811,0x0820,0x0820,0x0820,0x0820,0x0820,0x0820,    /* 16 */
	0x0820,0x0820,0x0820,0x0820,0x0820,0x0820,0x0820,0x0820,
	0x0820,0x0820,0x0820,0x0820,0x0c11,0x0001,0x209c,0x2074,
	0x2074,0x2074,0x2074,0x2074,0x2074,0x209d,
	0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,    /* 17 */
	0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,
	0x0001,0x0001,0x0001,0x0001,0x0001,0x0001,0x0811,0x0820,
	0x0820,0x0820,0x0820,0x0820,0x0820,0x0c11,
	0x0044,0x0044,0x0044,0x0044,0x0044,0x0045,0x0010,0x0010,    /* 18 */
	0x0010,0x0010,0x0010,0x00a3,0x00a4,0x00a5,0x00a6,0x00a7,
	0x00a8,0x00d7,0x00d8,0x00d5,0x00ad,0x0010,0x0010,0x0010,
	0x0010,0x0010,0x0010,0x0010,0x0010,0x0045,
	0x0046,0x0046,0x0046,0x0046,0x0046,0x0047,0x0010,0x0010,    /* 19 */
	0x0010,0x0010,0x0010,0x00b3,0x00b4,0x00b5,0x00b6,0x00b7,
	0x00b8,0x00e7,0x00e8,0x00e5,0x00bd,0x0010,0x0010,0x0010,
	0x0010,0x0010,0x0010,0x0010,0x0010,0x0047,
};

//======================================================================
//		“Øæ∞ºﬁ
//======================================================================
//------------------------------------------
//	Ω€ØƒèIóπ
//------------------------------------------
static const u8 SlotMsgGameEnd[] =
{ GE_, bou_, MU_, wo_, spc_, ya_, me_, ma_, su_, ka_, hate_, EOM_ };

//------------------------------------------
//	∏⁄ºﬁØƒ9999
//------------------------------------------
static const u8 SlotMsgCredit9999[] =
{ KO_, I_, N_, ga_, spc_, n9_, n9_, n9_, n9_, ma_, i_, CR_,
	ta_, ma_, ttu_, te_, spc_, i_, ma_, su_, EOM_ };

//------------------------------------------
//	∏⁄ºﬁØƒêÿÇÍ
//------------------------------------------
static const u8 SlotMsgCreditNothing[] =
{ KO_, I_, N_, ga_, spc_, a_, ri_, ma_, se_, n_, CR_,
GE_, bou_, MU_, wo_, spc_, si_, yyu_, u_, ri_, yyo_, u_, si_, ma_, su_, EOM_ };

//------------------------------------------
//	3ñáä|ÇØïsâ¬
//------------------------------------------
static const u8 SlotMsgBatBet3[] =
{ KO_, I_, N_, ga_, spc_, n3_, ma_, i_, spc_, a_, ri_, ma_, se_, n_, gyoe_, EOM_ };

//------------------------------------------
//	ê‡ñæï∂
//------------------------------------------
static const u8 SlotMsgExplain[] =
{B__,D__,TA_,I_,MU_,CR_,
zi_,ttu_,ku_,ri_,spc_,ne_,ra_,e_,ba_,spc_,do_,n_,na_,spc_,MA_,bou_,KU_,mo_,CR_,
to_,me_,ra_,re_,ru_,spc_,TI_,YYA_,N_,SU_,GE_,bou_,MU_,da_,gyoe_,CR_,
ti_,yyu_,u_,se_,n_,spc_,sa_,re_,ta_,spc_,ka_,i_,su_,u_,da_,ke_,CR_,
B__,D__,TA_,I_,MU_,ga_,spc_,tu_,du_,ku_,zo_,gyoe_,CR_,
BI_,TTU_,GU_,BO_,bou_,NA_,SU_,ga_,de_,ru_,to_,spc_,si_,yyu_,u_,ri_,yyo_,u_,EOM_};

//======================================================================
//		√ﬁ ﬁØ∏ﬁ
//======================================================================
//----
#ifdef PM_DEBUG
//----
static void SlotDebugMenuTask( u8 no );

static const u8 d_slot_font0[] =	// ê›íË
{ se_,ttu_, te_, i_, EOM_ };
static const u8 d_slot_font1[] =	// Ç‹ÇÌÇµÇΩâÒêî
{ ma_,wa_,si_,ta_,ka_,i_,su_,u_,EOM_ };
static const u8 d_slot_font2[] =	// ï•Ç¢ñﬂÇµ
{ ha_,ra_,i_,mo_,do_,si_,EOM_ };
static const u8 d_slot_font3[] =	// à˘Ç‹ÇÍÇΩ∫≤›
{ no_,ma_,re_,ta_,KO_,I_,N_,EOM_};
static const u8 d_slot_font4[] =	// ëO7Ã◊∏ﬁ
{ ma_,e_,n7_,HU_,RA_,GU_,EOM_ };
static const u8 d_slot_font5[] =	// ç∂âE∑∞ê›íËïœçX
{ sa_,yu_,u_,spc_,spc_,se_,ttu_,te_,i_,he_,n_,ko_,u_,EOM_};
static const u8 d_slot_font6[] =	// Ω¿∞ƒµ∞ƒ
{ SU_,TA_,bou_,TO_,spc_,O_,bou_,TO_,EOM_ };
static const u8 d_slot_font7[] =	// æ⁄∏ƒê›íË
{ SE_,RE_,KU_,TO_,spc_,ti_,yyu_,u_,se_,n_,EOM_ };

static const u8 d_slot_font8[] =	// íäëIâÒêî
{ ti_,yyu_,u_,se_,n_,ka_,i_,su_,u_, EOM_ };
static const u8 d_slot_font9[] =	// ¡™ÿ∞
{ TI_,EE_,RI_,bou_, EOM_ };
static const u8 d_slot_font10[] =	// ÿÃﬂ⁄≤
{ RI_,PU_,RE_,I_,EOM_ };
static const u8 d_slot_font11[] =	// ÇÕÇ∑Ç⁄
{ HA_,SU_,BO_,bou_,EOM_ };
static const u8 d_slot_font12[] =	// ÇÈÇËÇË
{ RU_,RI_,RI_,EOM_ };
static const u8 d_slot_font13[] =	// ≤≈Ωﬁœ
{ I_,NA_,ZU_,MA_,EOM_ };
static const u8 d_slot_font14[] =	// ⁄∑ﬁ≠◊
{ RE_,GI_,YYU_,RA_,bou_,EOM_ };
static const u8 d_slot_font15[] =	// ÀﬁØ∏ﬁ
{ BI_,TTU_,GU_,EOM_ };
static const u8 d_slot_font16[] =	// BD
{ B__,D__,EOM_};

static const u8 d_slot_font17[] =	// ê‘7
{ a_,ka_,n7_,EOM_ };
static const u8 d_slot_font18[] =	// ê¬7
{ a_,o_,n7_,EOM_ };

static const u8 d_slot_font19[] =	// AŒﬁ¿›
{ A__,BO_,TA_,N_,spc_,KO_,I_,N_,EOM_ };
static const u8 d_slot_font20[] =	// íäëIåàíË
{ ti_,yyu_,u_,se_,n_,ke_,ttu_,te_,i_,EOM_ };
static const u8 d_slot_font21[] =
{ zi_, yyo_, u_, ge_, spc_, n1_, n0_,n0_,EOM_ };
static const u8 d_slot_font22[] =
{ sa_,yyu_,u_,spc_,n1_,n0_,n0_,n0_,EOM_ };

static void slotdebug_menu0( void )
{ SlotDebugLotteryHitBit |= LOTTERY_HITBIT_CHERRY; }
static void slotdebug_menu1( void )
{ SlotDebugLotteryHitBit |= LOTTERY_HITBIT_REPLAY; }
static void slotdebug_menu2( void )
{ SlotDebugLotteryHitBit |= LOTTERY_HITBIT_6; }
static void slotdebug_menu3( void )
{ SlotDebugLotteryHitBit |= LOTTERY_HITBIT_12; }
static void slotdebug_menu4( void )
{ SlotDebugLotteryHitBit |= LOTTERY_HITBIT_INAZUMA; }
static void slotdebug_menu5( void )
{ SlotDebugLotteryHitBit |= LOTTERY_HITBIT_REG; }
static void slotdebug_menu6( void )
{ SlotDebugLotteryHitBit |= LOTTERY_HITBIT_BIG; }
static void slotdebug_menu7( void )
{ SlotDebugLotteryHitBit |= LOTTERY_HITBIT_BD; }

static const MENU_ITEM SlotDebugMenuList[] =
{
	{ d_slot_font9, slotdebug_menu0 },
	{ d_slot_font10,slotdebug_menu1 },
	{ d_slot_font11,slotdebug_menu2 },
	{ d_slot_font12,slotdebug_menu3 },
	{ d_slot_font13,slotdebug_menu4 },
	{ d_slot_font14,slotdebug_menu5 },
	{ d_slot_font15,slotdebug_menu6 },
	{ d_slot_font16,slotdebug_menu7 },
};

static void SlotDebugHardWrite( void )
{
	u8 font[2];

	PM_NumMsgSet( font, Slotst->hard + 1, NUM_MODE_ZERO, 1 );
	NMenuMsgWrite( font, 6, 1 );
};

static void SlotDebugMenuWrite( void )
{
	u8 font[8];

	NMenuMsgWrite( d_slot_font0, 1, 1 );
	NMenuMsgWrite( d_slot_font1, 1, 3 );
	NMenuMsgWrite( d_slot_font2, 1, 5 );
	NMenuMsgWrite( d_slot_font3, 1, 7);
	NMenuMsgWrite( d_slot_font4, 1, 9 );
	NMenuMsgWrite( d_slot_font5, 1, 11 );
	NMenuMsgWrite( d_slot_font6, 1, 13 );
	NMenuMsgWrite( d_slot_font7, 1, 15 );
	NMenuMsgWrite( d_slot_font19, 1, 17 );

	NMenuMsgWrite( d_slot_font8, 15,  1 );
	NMenuMsgWrite( d_slot_font9, 15, 3 );
	NMenuMsgWrite( d_slot_font10, 15, 5 );
	NMenuMsgWrite( d_slot_font11, 15, 7 );
	NMenuMsgWrite( d_slot_font12, 15, 9 );
	NMenuMsgWrite( d_slot_font13, 15, 11 );
	NMenuMsgWrite( d_slot_font14, 15, 13 );
	NMenuMsgWrite( d_slot_font15, 15, 15 );
	NMenuMsgWrite( d_slot_font16, 15, 17 );
	
	if( Slotst->before_7 == BEFORE_7_RED )
	{
		NMenuMsgWrite( d_slot_font17, 10, 9 );
	}
	else
	{
		NMenuMsgWrite( d_slot_font18, 10, 9 );
	}

	PM_NumMsgSet( font, Slotst->d_mawasi_count, NUM_MODE_ZERO, 4 );
	NMenuMsgWrite( font, 10, 3 );
	PM_NumMsgSet( font, Slotst->d_payout_count, NUM_MODE_ZERO, 4 );
	NMenuMsgWrite( font, 10, 5 );
	PM_NumMsgSet( font, Slotst->drop_credit, NUM_MODE_ZERO, 4 );
	NMenuMsgWrite( font, 10, 7 );

	PM_NumMsgSet( font, Slotst->d_cherry_hit_count, NUM_MODE_ZERO, 4 );
	NMenuMsgWrite( font, 20, 3 );
	PM_NumMsgSet( font, Slotst->d_replay_hit_count, NUM_MODE_ZERO, 4 );
	NMenuMsgWrite( font, 20, 5 );
	PM_NumMsgSet( font, Slotst->d_hasubo_hit_count, NUM_MODE_ZERO, 4 );
	NMenuMsgWrite( font, 20, 7 );
	PM_NumMsgSet( font, Slotst->d_ruriri_hit_count, NUM_MODE_ZERO, 4 );
	NMenuMsgWrite( font, 20, 9 );
	PM_NumMsgSet( font, Slotst->d_inazuma_hit_count, NUM_MODE_ZERO, 4 );
	NMenuMsgWrite( font, 20, 11 );
	PM_NumMsgSet( font, Slotst->d_reg_hit_count, NUM_MODE_ZERO, 4 );
	NMenuMsgWrite( font, 20, 13 );
	PM_NumMsgSet( font, Slotst->d_big_hit_count, NUM_MODE_ZERO, 4 );
	NMenuMsgWrite( font, 20, 15 );
	PM_NumMsgSet( font, Slotst->d_bd_hit_count, NUM_MODE_ZERO, 4 );
	NMenuMsgWrite( font, 20, 17 );

	SlotDebugHardWrite();
}

static void SlotDebugCount( s32 *count, s32 add )
{
	*count += add;
	if( (*count) > 9999 ) *count = 9999;
}

static void DebugSlotDataInit( void )
{
	SlotDebugLotterySw = 0;
	SlotDebugLotteryHitBit = 0;
	SlotDebugAutoSw = 0;

	Slotst->d_mawasi_count = 0;
	Slotst->d_payout_count = 0;
	Slotst->d_cherry_hit_count = 0;
	Slotst->d_replay_hit_count = 0;
	Slotst->d_hasubo_hit_count = 0;
	Slotst->d_ruriri_hit_count = 0;
	Slotst->d_inazuma_hit_count = 0;
	Slotst->d_reg_hit_count = 0;
	Slotst->d_big_hit_count = 0;
	Slotst->d_bd_hit_count = 0;

#ifdef SLOT_DEBUG_ERROR_CHECK
	Slotst->d_big_d_d_count = 0;
#endif
}

static void SetDebugSlotMenuTask( void )
{
	u8 i;

	i = AddTask( SlotDebugMenuTask, 0 );
}

static u8 CheckDebugSlotMenuTask( void )
{
	if( CheckTaskNo(SlotDebugMenuTask) == NOT_EXIST_TASK_ID )
	{
		return( 1 );
	}

	return( 0 );
}

static void SlotDebugMenuTask( u8 no )
{
	s8 flag;
	TASK_TABLE *task;
	pFunc func;

	task = &TaskTable[no];

	switch( task->work[0] )
	{
		case 0:
			NMenuWinBoxWrite( 0, 0, 24, 19 );
			SlotDebugMenuWrite();
			task->work[0]++;
			break;
		case 1:
			if( TRG(B_BUTTON) )
			{
				NMenuScreenClear();
				DelTask( no );
				return;
			}

			if( TRG(L_KEY) )
			{
				Slotst->hard--;
				if( (s8)Slotst->hard < 0 ) Slotst->hard = 5;
				SlotDebugHardWrite();
				break;
			}
			
			if( TRG(R_KEY) )
			{
				Slotst->hard++;
				if( Slotst->hard > 5 ) Slotst->hard = 0;
				SlotDebugHardWrite();
				break;
			}

			if( TRG(A_BUTTON) )
			{
				task->work[0] = 3;
				NMenuScreenClear();
				NMenuWinBoxWrite( 0, 0, 9, 5 );
				NMenuMsgWrite( d_slot_font21, 1, 1 );
				NMenuMsgWrite( d_slot_font22, 1, 3 );
				break;
			}

			if( TRG(SELECT_BUTTON) )
			{
				SlotDebugLotterySw = 0;
				SlotDebugLotteryHitBit = 0;
				NMenuScreenClear();
				NMenuWinBoxWrite( 0, 0, 10, 19 );
				NMenuMsgWrite( d_slot_font20, 1, 1 );
				NMenuFixListWrite( 2, 3, 8, SlotDebugMenuList );
				NMenuVCursorInit( 1, 3, 8, 0 );
				task->work[0]++;
			}

			if( TRG(START_BUTTON) )
			{
				SlotDebugAutoSw = 1;
				NMenuScreenClear();
				DelTask( no );
			}

			break;
		case 2:
			flag = NMenuVCursorControl();
			
			if( flag == CURSOR_DEFAULT_VALUE )
			{
				break;
			}

			if( flag == CURSOR_CANCEL_VALUE )
			{
				NMenuScreenClear();
				DelTask( no );
				break;
			}

			SlotDebugLotterySw = 1;
			func = SlotDebugMenuList[flag].ptr;
			func();
			NMenuScreenClear();
			DelTask( no );
			break;
		case 3:
			if( REPEAT(D_KEY) )
			{
				Slotst->credit += 100;
				if( Slotst->credit > 9999 ) Slotst->credit = 9999;
				break;
			}

			if( REPEAT(U_KEY) )
			{
				Slotst->credit -= 100;
				if( Slotst->credit <= 0 ) Slotst->credit = 9999;
				break;
			}
			
			if( REPEAT(L_KEY) )
			{
				Slotst->credit -= 1000;
				if( Slotst->credit <= 0 ) Slotst->credit = 9999;
				break;
			}

			if( REPEAT(R_KEY) )
			{
				Slotst->credit += 1000;
				if( Slotst->credit > 9999 ) Slotst->credit = 9999;
				break;
			}

			if( TRG(B_BUTTON) )
			{
				NMenuScreenClear();
				DelTask( no );
			}
	}
}

#ifdef SLOT_DEBUG_ERROR_CHECK
static const u8 error_msg0[] =
{nakag_,KA_,U_,N_,TO_,E_,RA_,bou_,ga_,o_,ki_,ma_,si_,ta_,EOM_};
static const u8 error_msg1[] =
{nakag_,RI_,bou_,RU_,so_,u_,sa_,de_,spc_,E_,RA_,bou_,ga_,spc_,o_,ki_,ma_,si_,ta_,EOM_};
static const u8 error_msg2[] =
{nakag_,HU_,RA_,GU_,O_,HU_,E_,RA_,bou_,ga_,spc_,o_,ki_,ma_,si_,ta_,EOM_};
static const u8 error_msg3[] =
{nakag_,BO_,bou_,NA_,SU_,ko_,ya_,ku_,no_,spc_,E_,RA_,bou_,ga_,spc_,o_,ki_,ma_,si_,ta_,EOM_};

static void SlotDebugErrorCheck( void )
{
	u8 p0_1,p0_2,p0_3,p1_1,p1_2,p1_3,p2_1,p2_2,p2_3;

	if( Slotst->hit_bit & (BIT_BIG_RED|BIT_BIG_BLUE) )
	{
		Slotst->d_big_d_d_count++;
		if( Slotst->d_big_d_d_count > 9999 ) Slotst->d_big_d_d_count = 9999;

		if( Slotst->d_big_d_d_count != Slotst->d_big_hit_count )
		{
			NMenuMsgWrite( error_msg0, 4, 15 );
			SlotDebugAutoSw = 0;
		}

		if( (Slotst->lottery_bit & LOTTERY_HITBIT_BIG) == 0 )
		{
			NMenuMsgWrite( error_msg2, 4, 17 );
			SlotDebugAutoSw = 0;
		}
	}
	else if( Slotst->hit_bit && (Slotst->lottery_bit & LOTTERY_HITBIT_BIG) &&
			(Slotst->hit_bit & (BIT_CHERRY_4|BIT_CHERRY)) == 0 )
	{
		NMenuMsgWrite( error_msg3, 4, 2 );
		SlotDebugAutoSw = 0;
	}

	if( Slotst->hit_bit == 0 && Slotst->bet == 3 &&
		(Slotst->lottery_bit & LOTTERY_HITBIT_BIG) == 0 )
	{
		p0_1 = GetReelPattern(0,1);
		p0_2 = GetReelPattern(0,2);
		p0_3 = GetReelPattern(0,3);
		p1_1 = GetReelPattern(1,1);
		p1_2 = GetReelPattern(1,2);
		p1_3 = GetReelPattern(1,3);
		p2_1 = GetReelPattern(2,1);
		p2_2 = GetReelPattern(2,2);
		p2_3 = GetReelPattern(2,3);

		if( (p0_1 == CELL_BIG_R && p1_1 == CELL_BIG_B && p2_1 == CELL_BIG_R) ||
			(p0_2 == CELL_BIG_R && p1_2 == CELL_BIG_B && p2_2 == CELL_BIG_R) ||
			(p0_3 == CELL_BIG_R && p1_3 == CELL_BIG_B && p2_3 == CELL_BIG_R) ||
			(p0_1 == CELL_BIG_R && p1_2 == CELL_BIG_B && p2_3 == CELL_BIG_R) ||
			(p0_3 == CELL_BIG_R && p1_2 == CELL_BIG_B && p2_1 == CELL_BIG_R) ||
			(p0_1 == CELL_BIG_B && p1_1 == CELL_BIG_R && p2_1 == CELL_BIG_B) ||
			(p0_2 == CELL_BIG_B && p1_2 == CELL_BIG_R && p2_2 == CELL_BIG_B) ||
			(p0_3 == CELL_BIG_B && p1_3 == CELL_BIG_R && p2_3 == CELL_BIG_B) ||
			(p0_1 == CELL_BIG_B && p1_2 == CELL_BIG_R && p2_3 == CELL_BIG_B) ||
			(p0_3 == CELL_BIG_B && p1_2 == CELL_BIG_R && p2_1 == CELL_BIG_B) )
		{
			NMenuMsgWrite( error_msg1, 4, 0 );
			SlotDebugAutoSw = 0;
		}
	}
}
#endif

//----
#endif	// PM_DEBUG
//----

