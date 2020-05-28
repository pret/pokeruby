
#ifdef	PM_DEBUG

/*==================================================================*/
/*                  d_tomo.c                                        */
/*             　　 とも専用テスト環境                              */
/*                  by tomo                                         */
/*==================================================================*/

/*==================================================================*/
/*                      INCLUDE FILE                                */
/*==================================================================*/
#include <agb.h>
#include "common.h"
#include "actor.h"
#include "actanm.h"
#include "map.h"
#include "evobj.h"
#include "jiki.h"
#include "fieldmap.h"
#include "map_attr.h"
#include "task.h"
#include "menu.h"
#include "fld_task.h"
#include "saveload.h"
#include "poketool.h"
#include "mapbg.h"
#include "palanm.h"
#include "script.h"
#include "fld_main.h"
#include "zukan.h"
#include "fld_tool.h"
#include "mus_tool.h"
#include "initgame.h"
#include "window.h"
#include "seed.h"

#include "item.h"
#include "pasocom.h"
#include "ev_time.h"

#include "sysflag.h"
#include "param.h"
#include "wazano.def"
#include "safari.h"
#include "ev_check.h"
#include "ev_fight.h"
#include "syswork.h"
#include "b_tower.h"
#include "ex_load.h"
#include "record.h"
#include "monsno.def"
#include "intr.h"
#include "rtctool.h"
#include "../data/itemeqp.h"

#include "svld_ini.h"
#include "svld_sys.h"

#include "con_tool.h"

#include "..\script\savework.h"		//
#include "..\script\saveflag.h"		//
#include "..\script\ballflag.h"
/*==================================================================*/
/*                      EXTERN                                      */
/*==================================================================*/
extern const VM_CODE ev_debug_game_clar[];
extern const VM_CODE ev_koin_buy_ok[];
extern const VM_CODE ev_kotoki_support_set[];
extern const VM_CODE ev_new_kinsetu_open_set[];
extern const VM_CODE ev_fune_go_ok_set[];
extern const VM_CODE ev_add_tamago[];
extern const VM_CODE ev_item_over_set[];
extern const VM_CODE ev_goods_over_set[];
extern const VM_CODE ev_coin_over_set[];
extern const VM_CODE ev_muro_gym_open_set[];
extern const VM_CODE ev_my_gold_zero_set[];
extern const VM_CODE ev_kinokoko_full[];
extern const VM_CODE ev_dozyotti_full[];
extern const VM_CODE ev_kinokoko_tamago[];
extern const VM_CODE ev_dozyotti_tamago[];

extern void TitleInit(void);
extern void contest_picture_init(void);

extern u8 (*MenuFunc)();								// ﾒﾆｭｰﾌｧﾝｸｼｮﾝ
/*==================================================================*/
/*                      関数宣言                                    */
/*==================================================================*/
u8 DebugTomoTest(void);
void FieldBgEffectTestEnd( void );

/*==================================================================*/

static u8 MainMenuBlt(void);
static u8 MainContestBlt(void);
static u8 MainMuseumBlt(void);
static u8 SubMenu2Blt(void);
static u8 MainKarakuriBlt(void);
static u8 MainEventBlt(void);
static u8 MainFlagBlt(void);
static u8 MainWorkBlt(void);

/*==================================================================*/

static u8 MainMenu(void);
static u8 MainContest(void);
static u8 MainMuseum(void);
static u8 SubMenu2(void);
static u8 MainKarakuri(void);
static u8 MainEvent(void);
static u8 MainFlag(void);
static u8 MainWork(void);

/*==================================================================*/

static u8 EventCtrl0Menu(void);
static u8 EventCtrl1Menu(void);

/*==================================================================*/

static u8 go_con(void);
static u8 go_mus(void);
static u8 go_pre(void);
static u8 go_con2(void);
static u8 go_mus2(void);
static u8 go_pre2(void);

/*==================================================================*/

static u8 reberu_menu_blt(void);
static u8 daiou_menu_blt(void);

/*==================================================================*/

static u8 reberu_menu(void);
static u8 daiou_menu(void);

/*==================================================================*/

static u8 event_part1_menu_blt(void);
static u8 event_part2_menu_blt(void);

/*==================================================================*/

static u8 flag_event_menu_blt(void);
static u8 flag_vanish_menu_blt(void);
static u8 flag_trainer_menu_blt(void);
static u8 flag_sys_menu_blt(void);
static u8 flag_ball_vanish_menu_blt(void);
static u8 flag_fh_menu_blt(void);
static u8 flag_fh_obj_menu_blt(void);

/*==================================================================*/

static u8 work_save_menu_blt(void);
static u8 work_sys_menu_blt(void);
static u8 work_local_menu_blt(void);
static u8 work_obj_menu_blt(void);
static u8 work_ans_menu_blt(void);
static u8 work_save2_menu_blt(void);

/*==================================================================*/
static u8 AnsWorkMenu(void);

/*==================================================================*/

static u8 SaveWorkMenu(void);
static u8 save_work_menu_0_blt(void);
static u8 save_work_menu_1_blt(void);
static u8 save_work_menu_2_blt(void);
static u8 save_work_menu_3_blt(void);
static u8 save_work_menu_4_blt(void);
static u8 save_work_menu_5_blt(void);
static u8 save_work_menu_6_blt(void);
static u8 save_work_menu_7_blt(void);
static u8 save_work_menu_8_blt(void);
static u8 SaveWorkSubMenu(void);

/*==================================================================*/

static u8 Save2WorkMenu(void);
static u8 save2_work_menu_0_blt(void);
static u8 save2_work_menu_1_blt(void);
static u8 save2_work_menu_2_blt(void);
static u8 save2_work_menu_3_blt(void);
static u8 save2_work_menu_4_blt(void);
static u8 save2_work_menu_5_blt(void);
static u8 Save2WorkSubMenu(void);

/*==================================================================*/

static u8 LocalWorkMenu(void);
static u8 local_work_menu_0_blt(void);
static u8 local_work_menu_1_blt(void);
static u8 LocalWorkSubMenu(void);

/*==================================================================*/

static u8 ObjWorkMenu(void);
static u8 obj_work_menu_0_blt(void);
static u8 obj_work_menu_1_blt(void);
static u8 ObjWorkSubMenu(void);

/*==================================================================*/

static u8 SysWorkMenu(void);
static u8 sys_work_menu_0_blt(void);
static u8 sys_work_menu_1_blt(void);
static u8 sys_work_menu_2_blt(void);
static u8 sys_work_menu_3_blt(void);
static u8 sys_work_menu_4_blt(void);
static u8 SysWorkSubMenu(void);

/*==================================================================*/

static u8 FlagFHObjMenu(void);
static u8 flag_fh_obj_menu_0_blt(void);
static u8 flag_fh_obj_menu_1_blt(void);
static u8 FlagFHObjSubMenu(void);

/*==================================================================*/

static u8 FlagFHMenu(void);
static u8 flag_fh_menu_0_blt(void);
static u8 flag_fh_menu_1_blt(void);
static u8 FlagFHSubMenu(void);

/*==================================================================*/

static u8 FlagBallVanishMenu(void);
static u8 flag_ball_vanish_menu_0_blt(void);
static u8 FlagBallVanishSubMenu(void);

/*==================================================================*/

static u8 FlagVanishMenu(void);
static u8 flag_vanish_menu_0_blt(void);
static u8 flag_vanish_menu_1_blt(void);
static u8 flag_vanish_menu_2_blt(void);
static u8 flag_vanish_menu_3_blt(void);
static u8 flag_vanish_menu_4_blt(void);
static u8 flag_vanish_menu_5_blt(void);
static u8 flag_vanish_menu_6_blt(void);
static u8 flag_vanish_menu_7_blt(void);
static u8 flag_vanish_menu_8_blt(void);
static u8 FlagVanishSubMenu(void);

/*==================================================================*/

static u8 FlagTrainerMenu(void);
static u8 flag_trainer_menu_0_blt(void);
static u8 flag_trainer_menu_1_blt(void);
static u8 flag_trainer_menu_2_blt(void);
static u8 FlagTrainerSubMenu(void);

/*==================================================================*/

static u8 EventFlagMenu(void);
static u8 event_flag_menu_0_blt(void);
static u8 event_flag_menu_1_blt(void);
static u8 event_flag_menu_2_blt(void);
static u8 event_flag_menu_3_blt(void);
static u8 event_flag_menu_4_blt(void);
static u8 event_flag_menu_5_blt(void);
static u8 event_flag_menu_6_blt(void);
static u8 event_flag_menu_7_blt(void);
static u8 event_flag_menu_8_blt(void);
static u8 EventFlagSubMenu(void);

/*==================================================================*/

static u8 SysFlagMenu(void);
static u8 sys_flag_menu_0_blt(void);
static u8 sys_flag_menu_1_blt(void);
static u8 sys_flag_menu_2_blt(void);
static u8 sys_flag_menu_3_blt(void);
static u8 sys_flag_menu_4_blt(void);
static u8 sys_flag_menu_5_blt(void);
static u8 sys_flag_menu_6_blt(void);
static u8 sys_flag_menu_7_blt(void);
static u8 sys_flag_menu_8_blt(void);
static u8 SysFlagSubMenu(void);

/*==================================================================*/
static u8 MenuDummy(void);

/*==================================================================*/

static u8 event_kuriago_set(void);
static u8 event_koin_set(void);
static u8 event_kotoki_support_set(void);
static u8 event_new_kinsetu_open_set(void);
static u8 event_fune_go_ok_set(void);
static u8 event_add_tamago(void);
static u8 event_item_over_set(void);
static u8 event_goods_over_set(void);
static u8 event_coin_over_set(void);
static u8 event_muro_gym_open_set(void);
static u8 event_my_gold_zero_set(void);
static u8 event_kinokoko_full(void);
static u8 event_dozyotti_full(void);
static u8 event_kinokoko_tamago(void);
static u8 event_dozyotti_tamago(void);

/*==================================================================*/

static void mons_no_check(void);
static void rand_no_check(void);
static void contest_no_check(void);
static void title_no_check(void);
static void pre_no_check(void);
static void	portraite_work_set(u8 mode);

static void	no_str_print(u8 mode);

/*==================================================================*/
static void	ans_no_str_print(void);
static void	save_no_str_print(u8 mode);
static void	local_no_str_print(u8 mode);
static void	obj_no_str_print(u8 mode);
static void	sys_no_str_print(u8 mode);
static void	save2_no_str_print(u8 mode);
static void	event_flag_str_print(u8 mode);
static void	sys_flag_str_print(u8 mode);
static void	ball_vanish_flag_str_print(u8 mode);
static void	vanish_flag_str_print(u8 mode);
static void	trainer_flag_str_print(u8 mode);
static void	fh_flag_str_print(u8 mode);
static void	fh_obj_flag_str_print(u8 mode);

/*==================================================================*/
static void	ans_no_check(void);
static void	savew_no_check(u8 mode,u8 no);
static void	sys_no_check(u8 mode,u8 no);
static void	lw_no_check(u8 mode,u8 no);
static void	ow_no_check(u8 mode,u8 no);
static void	save2w_no_check(u8 mode,u8 no);

/*==================================================================*/
static void	bvf_no_check(u8 mode,u8 no);
static void	tf_no_check(u8 mode,u8 no);
static void	vf_no_check(u8 mode,u8 no);
static void	ef_no_check(u8 mode,u8 no);
static void	sysf_no_check(u8 mode,u8 no);
static void	fhf_no_check(u8 mode,u8 no);
static void	fhobjf_no_check(u8 mode,u8 no);

/*==================================================================*/
static void flag_msg_write(u8 x,u8 y,u8 flag);
static void work_msg_write(u8 x,u8 y,u16 work);

/*==================================================================*/
/*==================================================================*/
/*                      DEFINE,TYPEDEF等                            */
/*==================================================================*/
#define MAIN_MENU_MAX	7
#define MAIN_MENU_X		12
#define MAIN_MENU_Y		(MAIN_MENU_MAX*2+1)

/*----------------------------------------------------------------*/
#define WORK_KETA_LEN	5				//表示する桁
#define FLAG_KETA_LEN	1				//表示する桁
/*----------------------------------------------------------------*/

#define MAIN_CONTEST_X		20
#define MAIN_CONTEST_Y		11
#define MAIN_CONTEST_MAX	4

#define MAIN_MUSEUM_X		20
#define MAIN_MUSEUM_Y		11
#define MAIN_MUSEUM_MAX	4

#define SUB_MENU2_X		20
#define SUB_MENU2_Y		11
#define SUB_MENU2_MAX	4


#define KARAKURI_MAIN_MENU_X	24			//カラクリ屋敷用
#define KARAKURI_MAIN_MENU_Y	7
#define KARAKURI_MAIN_MENU_MAX	2

#define EVENT_CTRL_MENU_MAX		2
#define EVENT_CTRL_MENU_X		24
#define EVENT_CTRL_MENU_Y		(EVENT_CTRL_MENU_MAX*2+1)

#define FLAG_CTRL_MAX			7
#define FLAG_CTRL_X				24
#define FLAG_CTRL_Y				(FLAG_CTRL_MAX*2+1)

#define WORK_CTRL_MENU_MAX		6
#define WORK_CTRL_MENU_X		24
#define WORK_CTRL_MENU_Y		(WORK_CTRL_MENU_MAX*2+1)
/*----------------------------------------------------------------*/
#define EVENT_PART_MENU_STR_X_LEN		28

#define EVENT_PART1_MENU_MAX	9
#define EVENT_PART1_MENU_X		(EVENT_PART_MENU_STR_X_LEN)
#define EVENT_PART1_MENU_Y		(EVENT_PART1_MENU_MAX*2+1)

#define EVENT_PART2_MENU_MAX	6
#define EVENT_PART2_MENU_X		(EVENT_PART_MENU_STR_X_LEN)
#define EVENT_PART2_MENU_Y		(EVENT_PART2_MENU_MAX*2+1)

/*----------------------------------------------------------------*/
#define ANS_WORK_STR_X_LEN		24

#define ANS_WORK_MENU_MAX		1
#define ANS_WORK_MENU_X			(ANS_WORK_STR_X_LEN + WORK_KETA_LEN)
#define ANS_WORK_MENU_Y			(ANS_WORK_MENU_MAX*2+1)

/*----------------------------------------------------------------*/
#define SAVE_WORK_STR_X_LEN		24

#define SAVE_WORK_MENU_MAX		9
#define SAVE_WORK_MENU_X		(SAVE_WORK_STR_X_LEN)
#define SAVE_WORK_MENU_Y		(SAVE_WORK_MENU_MAX*2+1)

#define SAVE_WORK0_MENU_MAX		8
#define SAVE_WORK0_MENU_X		(SAVE_WORK_STR_X_LEN + WORK_KETA_LEN)
#define SAVE_WORK0_MENU_Y		(SAVE_WORK0_MENU_MAX*2+1)

#define SAVE_WORK1_MENU_MAX		9
#define SAVE_WORK1_MENU_X		(SAVE_WORK_STR_X_LEN + WORK_KETA_LEN)
#define SAVE_WORK1_MENU_Y		(SAVE_WORK1_MENU_MAX*2+1)

#define SAVE_WORK2_MENU_MAX		9
#define SAVE_WORK2_MENU_X		(SAVE_WORK_STR_X_LEN + WORK_KETA_LEN)
#define SAVE_WORK2_MENU_Y		(SAVE_WORK2_MENU_MAX*2+1)

#define SAVE_WORK3_MENU_MAX		9
#define SAVE_WORK3_MENU_X		(SAVE_WORK_STR_X_LEN + WORK_KETA_LEN)
#define SAVE_WORK3_MENU_Y		(SAVE_WORK3_MENU_MAX*2+1)

#define SAVE_WORK4_MENU_MAX		9
#define SAVE_WORK4_MENU_X		(SAVE_WORK_STR_X_LEN + WORK_KETA_LEN)
#define SAVE_WORK4_MENU_Y		(SAVE_WORK4_MENU_MAX*2+1)

#define SAVE_WORK5_MENU_MAX		7
#define SAVE_WORK5_MENU_X		(SAVE_WORK_STR_X_LEN + WORK_KETA_LEN)
#define SAVE_WORK5_MENU_Y		(SAVE_WORK5_MENU_MAX*2+1)

#define SAVE_WORK6_MENU_MAX		6
#define SAVE_WORK6_MENU_X		(SAVE_WORK_STR_X_LEN + WORK_KETA_LEN)
#define SAVE_WORK6_MENU_Y		(SAVE_WORK6_MENU_MAX*2+1)

#define SAVE_WORK7_MENU_MAX		9
#define SAVE_WORK7_MENU_X		(SAVE_WORK_STR_X_LEN + WORK_KETA_LEN)
#define SAVE_WORK7_MENU_Y		(SAVE_WORK7_MENU_MAX*2+1)

#define SAVE_WORK8_MENU_MAX		9
#define SAVE_WORK8_MENU_X		(SAVE_WORK_STR_X_LEN + WORK_KETA_LEN)
#define SAVE_WORK8_MENU_Y		(SAVE_WORK8_MENU_MAX*2+1)

/*----------------------------------------------------------------*/
#define SAVE2_WORK_STR_X_LEN	24

#define SAVE2_WORK_MENU_MAX		6
#define SAVE2_WORK_MENU_X		(SAVE2_WORK_STR_X_LEN)
#define SAVE2_WORK_MENU_Y		(SAVE2_WORK_MENU_MAX*2+1)

#define SAVE2_WORK0_MENU_MAX	6
#define SAVE2_WORK0_MENU_X		(SAVE2_WORK_STR_X_LEN + WORK_KETA_LEN)
#define SAVE2_WORK0_MENU_Y		(SAVE2_WORK0_MENU_MAX*2+1)

#define SAVE2_WORK1_MENU_MAX	5
#define SAVE2_WORK1_MENU_X		(SAVE2_WORK_STR_X_LEN + WORK_KETA_LEN)
#define SAVE2_WORK1_MENU_Y		(SAVE2_WORK1_MENU_MAX*2+1)

#define SAVE2_WORK2_MENU_MAX	9
#define SAVE2_WORK2_MENU_X		(SAVE2_WORK_STR_X_LEN + WORK_KETA_LEN)
#define SAVE2_WORK2_MENU_Y		(SAVE2_WORK2_MENU_MAX*2+1)

#define SAVE2_WORK3_MENU_MAX	2
#define SAVE2_WORK3_MENU_X		(SAVE2_WORK_STR_X_LEN + WORK_KETA_LEN)
#define SAVE2_WORK3_MENU_Y		(SAVE2_WORK3_MENU_MAX*2+1)

#define SAVE2_WORK4_MENU_MAX	9
#define SAVE2_WORK4_MENU_X		(SAVE2_WORK_STR_X_LEN + WORK_KETA_LEN)
#define SAVE2_WORK4_MENU_Y		(SAVE2_WORK4_MENU_MAX*2+1)

#define SAVE2_WORK5_MENU_MAX	6
#define SAVE2_WORK5_MENU_X		(SAVE2_WORK_STR_X_LEN + WORK_KETA_LEN)
#define SAVE2_WORK5_MENU_Y		(SAVE2_WORK5_MENU_MAX*2+1)

/*----------------------------------------------------------------*/
#define LOCAL_WORK_STR_X_LEN	24

#define LOCAL_WORK_MENU_MAX		2
#define LOCAL_WORK_MENU_X		(LOCAL_WORK_STR_X_LEN)
#define LOCAL_WORK_MENU_Y		(LOCAL_WORK_MENU_MAX*2+1)

#define LOCAL_WORK0_MENU_MAX	9
#define LOCAL_WORK0_MENU_X		(LOCAL_WORK_STR_X_LEN + WORK_KETA_LEN)
#define LOCAL_WORK0_MENU_Y		(LOCAL_WORK0_MENU_MAX*2+1)

#define LOCAL_WORK1_MENU_MAX	7
#define LOCAL_WORK1_MENU_X		(LOCAL_WORK_STR_X_LEN + WORK_KETA_LEN)
#define LOCAL_WORK1_MENU_Y		(LOCAL_WORK1_MENU_MAX*2+1)

/*----------------------------------------------------------------*/
#define SYS_WORK_STR_X_LEN		24

#define SYS_WORK_MENU_MAX		5
#define SYS_WORK_MENU_X			(SYS_WORK_STR_X_LEN)
#define SYS_WORK_MENU_Y			(SYS_WORK_MENU_MAX*2+1)

#define SYS_WORK0_MENU_MAX		3
#define SYS_WORK0_MENU_X		(SYS_WORK_STR_X_LEN + WORK_KETA_LEN)
#define SYS_WORK0_MENU_Y		(SYS_WORK0_MENU_MAX*2+1)

#define SYS_WORK1_MENU_MAX		2
#define SYS_WORK1_MENU_X		(SYS_WORK_STR_X_LEN + WORK_KETA_LEN)
#define SYS_WORK1_MENU_Y		(SYS_WORK1_MENU_MAX*2+1)

#define SYS_WORK2_MENU_MAX		6
#define SYS_WORK2_MENU_X		(SYS_WORK_STR_X_LEN + WORK_KETA_LEN)
#define SYS_WORK2_MENU_Y		(SYS_WORK2_MENU_MAX*2+1)

#define SYS_WORK3_MENU_MAX		9
#define SYS_WORK3_MENU_X		(SYS_WORK_STR_X_LEN + WORK_KETA_LEN)
#define SYS_WORK3_MENU_Y		(SYS_WORK3_MENU_MAX*2+1)

#define SYS_WORK4_MENU_MAX		5
#define SYS_WORK4_MENU_X		(SYS_WORK_STR_X_LEN + WORK_KETA_LEN)
#define SYS_WORK4_MENU_Y		(SYS_WORK4_MENU_MAX*2+1)

/*----------------------------------------------------------------*/
#define OBJ_WORK_STR_X_LEN		24

#define OBJ_WORK_MENU_MAX		2
#define OBJ_WORK_MENU_X			(OBJ_WORK_STR_X_LEN)
#define OBJ_WORK_MENU_Y			(OBJ_WORK_MENU_MAX*2+1)

#define OBJ_WORK0_MENU_MAX		9
#define OBJ_WORK0_MENU_X		(OBJ_WORK_STR_X_LEN + WORK_KETA_LEN)
#define OBJ_WORK0_MENU_Y		(OBJ_WORK0_MENU_MAX*2+1)

#define OBJ_WORK1_MENU_MAX		7
#define OBJ_WORK1_MENU_X		(OBJ_WORK_STR_X_LEN + WORK_KETA_LEN)
#define OBJ_WORK1_MENU_Y		(OBJ_WORK1_MENU_MAX*2+1)
/*----------------------------------------------------------------*/
#define FH_FLAG_STR_X_LEN	28

#define FH_FLAG_MENU_MAX	2
#define FH_FLAG_MENU_X		(FH_FLAG_STR_X_LEN)
#define FH_FLAG_MENU_Y		(FH_FLAG_MENU_MAX*2+1)

#define FH_FLAG0_MENU_MAX	9
#define FH_FLAG0_MENU_X		(FH_FLAG_STR_X_LEN + FLAG_KETA_LEN)
#define FH_FLAG0_MENU_Y		(FH_FLAG0_MENU_MAX*2+1)

#define FH_FLAG1_MENU_MAX	7
#define FH_FLAG1_MENU_X		(FH_FLAG_STR_X_LEN + FLAG_KETA_LEN)
#define FH_FLAG1_MENU_Y		(FH_FLAG1_MENU_MAX*2+1)

/*----------------------------------------------------------------*/
#define FH_OBJ_FLAG_STR_X_LEN	28

#define FH_OBJ_FLAG_MENU_MAX	2
#define FH_OBJ_FLAG_MENU_X		(FH_OBJ_FLAG_STR_X_LEN)
#define FH_OBJ_FLAG_MENU_Y		(FH_OBJ_FLAG_MENU_MAX*2+1)

#define FH_OBJ_FLAG0_MENU_MAX	9
#define FH_OBJ_FLAG0_MENU_X		(FH_OBJ_FLAG_STR_X_LEN + FLAG_KETA_LEN)
#define FH_OBJ_FLAG0_MENU_Y		(FH_OBJ_FLAG0_MENU_MAX*2+1)

#define FH_OBJ_FLAG1_MENU_MAX	7
#define FH_OBJ_FLAG1_MENU_X		(FH_OBJ_FLAG_STR_X_LEN + FLAG_KETA_LEN)
#define FH_OBJ_FLAG1_MENU_Y		(FH_OBJ_FLAG1_MENU_MAX*2+1)

/*----------------------------------------------------------------*/
#define BALL_VANISH_FLAG_STR_X_LEN	28

#define BALL_VANISH_FLAG_MENU_MAX	1
#define BALL_VANISH_FLAG_MENU_X		(BALL_VANISH_FLAG_STR_X_LEN)
#define BALL_VANISH_FLAG_MENU_Y		(BALL_VANISH_FLAG_MENU_MAX*2+1)

#define BALL_VANISH_FLAG0_MENU_MAX	2
#define BALL_VANISH_FLAG0_MENU_X	(BALL_VANISH_FLAG_STR_X_LEN + FLAG_KETA_LEN)
#define BALL_VANISH_FLAG0_MENU_Y	(BALL_VANISH_FLAG0_MENU_MAX*2+1)

/*----------------------------------------------------------------*/
#define VANISH_FLAG_STR_X_LEN	28

#define VANISH_FLAG_MENU_MAX	9
#define VANISH_FLAG_MENU_X		(VANISH_FLAG_STR_X_LEN)
#define VANISH_FLAG_MENU_Y		(VANISH_FLAG_MENU_MAX*2+1)

#define VANISH_FLAG0_MENU_MAX	9
#define VANISH_FLAG0_MENU_X		(VANISH_FLAG_STR_X_LEN + FLAG_KETA_LEN)
#define VANISH_FLAG0_MENU_Y		(VANISH_FLAG0_MENU_MAX*2+1)

#define VANISH_FLAG1_MENU_MAX	9
#define VANISH_FLAG1_MENU_X		(VANISH_FLAG_STR_X_LEN + FLAG_KETA_LEN)
#define VANISH_FLAG1_MENU_Y		(VANISH_FLAG1_MENU_MAX*2+1)

#define VANISH_FLAG2_MENU_MAX	9
#define VANISH_FLAG2_MENU_X		(VANISH_FLAG_STR_X_LEN + FLAG_KETA_LEN)
#define VANISH_FLAG2_MENU_Y		(VANISH_FLAG2_MENU_MAX*2+1)

#define VANISH_FLAG3_MENU_MAX	9
#define VANISH_FLAG3_MENU_X		(VANISH_FLAG_STR_X_LEN + FLAG_KETA_LEN)
#define VANISH_FLAG3_MENU_Y		(VANISH_FLAG3_MENU_MAX*2+1)

#define VANISH_FLAG4_MENU_MAX	6
#define VANISH_FLAG4_MENU_X		(VANISH_FLAG_STR_X_LEN + FLAG_KETA_LEN)
#define VANISH_FLAG4_MENU_Y		(VANISH_FLAG4_MENU_MAX*2+1)

#define VANISH_FLAG5_MENU_MAX	9
#define VANISH_FLAG5_MENU_X		(VANISH_FLAG_STR_X_LEN + FLAG_KETA_LEN)
#define VANISH_FLAG5_MENU_Y		(VANISH_FLAG5_MENU_MAX*2+1)

#define VANISH_FLAG6_MENU_MAX	9
#define VANISH_FLAG6_MENU_X		(VANISH_FLAG_STR_X_LEN + FLAG_KETA_LEN)
#define VANISH_FLAG6_MENU_Y		(VANISH_FLAG6_MENU_MAX*2+1)

#define VANISH_FLAG7_MENU_MAX	9
#define VANISH_FLAG7_MENU_X		(VANISH_FLAG_STR_X_LEN + FLAG_KETA_LEN)
#define VANISH_FLAG7_MENU_Y		(VANISH_FLAG7_MENU_MAX*2+1)

#define VANISH_FLAG8_MENU_MAX	9
#define VANISH_FLAG8_MENU_X		(VANISH_FLAG_STR_X_LEN + FLAG_KETA_LEN)
#define VANISH_FLAG8_MENU_Y		(VANISH_FLAG8_MENU_MAX*2+1)

/*----------------------------------------------------------------*/
#define TRAINER_FLAG_STR_X_LEN	28

#define TRAINER_FLAG_MENU_MAX	3
#define TRAINER_FLAG_MENU_X		(TRAINER_FLAG_STR_X_LEN)
#define TRAINER_FLAG_MENU_Y		(TRAINER_FLAG_MENU_MAX*2+1)

#define TRAINER_FLAG0_MENU_MAX	8
#define TRAINER_FLAG0_MENU_X		(TRAINER_FLAG_STR_X_LEN + FLAG_KETA_LEN)
#define TRAINER_FLAG0_MENU_Y		(TRAINER_FLAG0_MENU_MAX*2+1)

#define TRAINER_FLAG1_MENU_MAX	4
#define TRAINER_FLAG1_MENU_X		(TRAINER_FLAG_STR_X_LEN + FLAG_KETA_LEN)
#define TRAINER_FLAG1_MENU_Y		(TRAINER_FLAG1_MENU_MAX*2+1)

#define TRAINER_FLAG2_MENU_MAX	1
#define TRAINER_FLAG2_MENU_X		(TRAINER_FLAG_STR_X_LEN + FLAG_KETA_LEN)
#define TRAINER_FLAG2_MENU_Y		(TRAINER_FLAG2_MENU_MAX*2+1)

/*----------------------------------------------------------------*/
#define EVENT_FLAG_STR_X_LEN	28

#define EVENT_FLAG_MENU_MAX		9
#define EVENT_FLAG_MENU_X		(EVENT_FLAG_STR_X_LEN)
#define EVENT_FLAG_MENU_Y		(EVENT_FLAG_MENU_MAX*2+1)

#define EVENT_FLAG0_MENU_MAX	9
#define EVENT_FLAG0_MENU_X		(EVENT_FLAG_STR_X_LEN + FLAG_KETA_LEN)
#define EVENT_FLAG0_MENU_Y		(EVENT_FLAG0_MENU_MAX*2+1)

#define EVENT_FLAG1_MENU_MAX	9
#define EVENT_FLAG1_MENU_X		(EVENT_FLAG_STR_X_LEN + FLAG_KETA_LEN)
#define EVENT_FLAG1_MENU_Y		(EVENT_FLAG1_MENU_MAX*2+1)

#define EVENT_FLAG2_MENU_MAX	9
#define EVENT_FLAG2_MENU_X		(EVENT_FLAG_STR_X_LEN + FLAG_KETA_LEN)
#define EVENT_FLAG2_MENU_Y		(EVENT_FLAG2_MENU_MAX*2+1)

#define EVENT_FLAG3_MENU_MAX	9
#define EVENT_FLAG3_MENU_X		(EVENT_FLAG_STR_X_LEN + FLAG_KETA_LEN)
#define EVENT_FLAG3_MENU_Y		(EVENT_FLAG3_MENU_MAX*2+1)

#define EVENT_FLAG4_MENU_MAX	9
#define EVENT_FLAG4_MENU_X		(EVENT_FLAG_STR_X_LEN + FLAG_KETA_LEN)
#define EVENT_FLAG4_MENU_Y		(EVENT_FLAG4_MENU_MAX*2+1)

#define EVENT_FLAG5_MENU_MAX	9
#define EVENT_FLAG5_MENU_X		(EVENT_FLAG_STR_X_LEN + FLAG_KETA_LEN)
#define EVENT_FLAG5_MENU_Y		(EVENT_FLAG5_MENU_MAX*2+1)

#define EVENT_FLAG6_MENU_MAX	9
#define EVENT_FLAG6_MENU_X		(EVENT_FLAG_STR_X_LEN + FLAG_KETA_LEN)
#define EVENT_FLAG6_MENU_Y		(EVENT_FLAG6_MENU_MAX*2+1)

#define EVENT_FLAG7_MENU_MAX	9
#define EVENT_FLAG7_MENU_X		(EVENT_FLAG_STR_X_LEN + FLAG_KETA_LEN)
#define EVENT_FLAG7_MENU_Y		(EVENT_FLAG7_MENU_MAX*2+1)

#define EVENT_FLAG8_MENU_MAX	3
#define EVENT_FLAG8_MENU_X		(EVENT_FLAG_STR_X_LEN + FLAG_KETA_LEN)
#define EVENT_FLAG8_MENU_Y		(EVENT_FLAG8_MENU_MAX*2+1)

/*----------------------------------------------------------------*/
#define SYS_FLAG_STR_X_LEN		28

#define SYS_FLAG_MENU_MAX		9
#define SYS_FLAG_MENU_X			(SYS_FLAG_STR_X_LEN)
#define SYS_FLAG_MENU_Y			(SYS_FLAG_MENU_MAX*2+1)

#define SYS_FLAG0_MENU_MAX		8
#define SYS_FLAG0_MENU_X		(SYS_FLAG_STR_X_LEN + FLAG_KETA_LEN)
#define SYS_FLAG0_MENU_Y		(SYS_FLAG0_MENU_MAX*2+1)

#define SYS_FLAG1_MENU_MAX		7
#define SYS_FLAG1_MENU_X		(SYS_FLAG_STR_X_LEN + FLAG_KETA_LEN)
#define SYS_FLAG1_MENU_Y		(SYS_FLAG1_MENU_MAX*2+1)

#define SYS_FLAG2_MENU_MAX		9
#define SYS_FLAG2_MENU_X		(SYS_FLAG_STR_X_LEN + FLAG_KETA_LEN)
#define SYS_FLAG2_MENU_Y		(SYS_FLAG2_MENU_MAX*2+1)

#define SYS_FLAG3_MENU_MAX		4
#define SYS_FLAG3_MENU_X		(SYS_FLAG_STR_X_LEN + FLAG_KETA_LEN)
#define SYS_FLAG3_MENU_Y		(SYS_FLAG3_MENU_MAX*2+1)

#define SYS_FLAG4_MENU_MAX		9
#define SYS_FLAG4_MENU_X		(SYS_FLAG_STR_X_LEN + FLAG_KETA_LEN)
#define SYS_FLAG4_MENU_Y		(SYS_FLAG4_MENU_MAX*2+1)

#define SYS_FLAG5_MENU_MAX		9
#define SYS_FLAG5_MENU_X		(SYS_FLAG_STR_X_LEN + FLAG_KETA_LEN)
#define SYS_FLAG5_MENU_Y		(SYS_FLAG5_MENU_MAX*2+1)

#define SYS_FLAG6_MENU_MAX		9
#define SYS_FLAG6_MENU_X		(SYS_FLAG_STR_X_LEN + FLAG_KETA_LEN)
#define SYS_FLAG6_MENU_Y		(SYS_FLAG6_MENU_MAX*2+1)

#define SYS_FLAG7_MENU_MAX		7
#define SYS_FLAG7_MENU_X		(SYS_FLAG_STR_X_LEN + FLAG_KETA_LEN)
#define SYS_FLAG7_MENU_Y		(SYS_FLAG7_MENU_MAX*2+1)

#define SYS_FLAG8_MENU_MAX		5
#define SYS_FLAG8_MENU_X		(SYS_FLAG_STR_X_LEN + FLAG_KETA_LEN)
#define SYS_FLAG8_MENU_Y		(SYS_FLAG8_MENU_MAX*2+1)

/*----------------------------------------------------------------*/

#define REBERU_MENU_X		12
#define REBERU_MENU_Y		19
#define REBERU_MENU_MAX	8

#define DAIOU_MENU_X		12
#define DAIOU_MENU_Y		13
#define DAIOU_MENU_MAX		5

/*----------------------------------------------------------------*/
#define RINKAKU_MENU_X		24
#define RINKAKU_MENU_Y		9
#define RINKAKU_MENU_MAX	3

#define AWAIKARA__MENU_X	24
#define AWAIKARA__MENU_Y	9
#define AWAIKARA__MENU_MAX	3

#define SUMIE_MENU_X		24
#define SUMIE_MENU_Y		9
#define SUMIE_MENU_MAX		3

/*----------------------------------------------------------------*/

//#define POKE_NO_MIN 277			//ポケモンナンバーMIN(1origin)
#define POKE_NO_MIN 1			//ポケモンナンバーMIN(1origin)
#define RAND_NO_MAX	(0xffffffff)		//個性乱数ナンバーMAX(0origin)
#define CONTEST_TYPE_NO_MAX	5		//コンテスト種類ナンバーMAX(1origin)
#define TITLE_TYPE_NO_MAX	15		//タイトル種類ナンバーMAX(1origin)
#define PRE_TYPE_NO_MAX	15		//タイトル種類ナンバーMAX(1origin)

#define TUNE_TYPE_NO_MAX	4		//エフェクト調整種類ナンバーMAX(0origin)

/*==================================================================*/
/*                      変数                                        */
/*==================================================================*/
static u16 mons_no;
static u32 id_no;
static u32 rand_no;
static u8 contest_no;
static u8 title_no;
static u8 pre_no;

/*==================================================================*/
static u8 MenuModeFlag;			//メニュー番号（引数やりとり用）
static u8 no_str[9];			//ナンバー計算用

static u8	debugMainPick;			//選択中メニュー番号
static u8	debugKarakuriPick;		//選択中メニュー番号
static u8	debugEventPick;			//選択中メニュー番号
static u8	debugFlagPick;			//選択中メニュー番号
static u8	debugWorkPick;			//選択中メニュー番号
/*==================================================================*/
/*                      データ                                      */
/*==================================================================*/
static const u8 place_name0[] = {KO_,N_,TE_,SU_,TO_,ga_,zo_,u_,EOM_};
static const u8 place_name1[] = {bi_,zi_,yyu_,tu_,ka_,n_,ga_,zo_,u_,EOM_};
static const u8 place_name2[] = {PU_,RE_,BI_,YYU_,bou_,ga_,zo_,u_,EOM_};
static const u8 place_name3[] = {KA_,RA_,KU_,RI_,ya_,si_,ki_,EOM_};
static const u8 place_name4[] = {I_,BE_,N_,TO_,so_,u_,sa_,EOM_};
static const u8 place_name5[] = {F__,L__,A__,G__,so_,u_,sa_,EOM_};
static const u8 place_name6[] = {W__,O__,R__,K__,so_,u_,sa_,EOM_};

static const MENU_ITEM	MainMenuList[] =
{
	{ place_name0,MainContestBlt },
	{ place_name1,MainMuseumBlt },
	{ place_name2,SubMenu2Blt },
	{ place_name3,MainKarakuriBlt },
	{ place_name4,MainEventBlt },
	{ place_name5,MainFlagBlt },
	{ place_name6,MainWorkBlt },
};

/*----------------------------------------------------------------------------------*/

static const u8 contest_title[] = {KO_,N_,TE_,SU_,TO_,EOM_};
static const u8 contest_menu0[] = {PO_,KE_,MO_,N_,NA_,N_,BA_,bou_,EOM_};
static const u8 contest_menu1[] = {ko_,se_,i_,ra_,n_,su_,u_,EOM_};
static const u8 contest_menu2[] = {KO_,N_,TE_,SU_,TO_,si_,yyu_,ru_,i_,EOM_};
static const u8 contest_menu3[] = {hi_,yyo_,u_,zi_,EOM_};

static const MENU_ITEM	MainContestList[] =
{
	{ contest_menu0,MenuDummy },
	{ contest_menu1,MenuDummy },
	{ contest_menu2,MenuDummy },
	{ contest_menu3,go_con },
};

static const u8 museum_title[] = {bi_,zi_,yyu_,tu_,ka_,n_,EOM_};
static const u8 museum_menu0[] = {PO_,KE_,MO_,N_,NA_,N_,BA_,bou_,EOM_};
static const u8 museum_menu1[] = {ko_,se_,i_,ra_,n_,su_,u_,EOM_};
static const u8 museum_menu2[] = {TA_,I_,TO_,RU_,si_,yyu_,ru_,i_,EOM_};
static const u8 museum_menu3[] = {hi_,yyo_,u_,zi_,EOM_};

static const MENU_ITEM	MainMuseumList[] =
{
	{ museum_menu0,MenuDummy },
	{ museum_menu1,MenuDummy },
	{ museum_menu2,MenuDummy },
	{ museum_menu3,go_mus },
};

static const u8 preview_title[] = {PU_,RE_,BI_,YYU_,bou_,EOM_};
static const u8 preview_menu0[] = {PO_,KE_,MO_,N_,NA_,N_,BA_,bou_,EOM_};
static const u8 preview_menu1[] = {ko_,se_,i_,ra_,n_,su_,u_,EOM_};
static const u8 preview_menu2[] = {si_,yyu_,ru_,i_,EOM_};
static const u8 preview_menu3[] = {hi_,yyo_,u_,zi_,EOM_};

static const MENU_ITEM	SubMenu2List[] =
{
	{ preview_menu0,MenuDummy },
	{ preview_menu1,MenuDummy },
	{ preview_menu2,MenuDummy },
	{ preview_menu3,go_pre },
};

static const u8 main_karakuri_title[] = {KA_,RA_,KU_,RI_,ka_,n_,re_,n_,EOM_};
static const u8 main_karakuri_menu0[] = {RE_,BE_,RU_,EOM_};
static const u8 main_karakuri_menu1[] = {da_,i_,o_,u_,EOM_};

static const MENU_ITEM	MainKarakuriList[] =
{
	{ main_karakuri_menu0,reberu_menu_blt },
	{ main_karakuri_menu1,daiou_menu_blt },
};


static const u8 main_event_menu0[] = {PA_,bou_,TO_,n1_,EOM_};
static const u8 main_event_menu1[] = {PA_,bou_,TO_,n2_,EOM_};

static const MENU_ITEM	MainEventList[] =
{
	{ main_event_menu0,event_part1_menu_blt},
	{ main_event_menu1,event_part2_menu_blt},
};

static const u8 main_flag_menu0[] = {I_,BE_,N_,TO_,F__,L__,A__,G__,EOM_};
static const u8 main_flag_menu1[] = {BA_,NI_,SI_,YYU_,F__,L__,A__,G__,EOM_};
static const u8 main_flag_menu2[] = {TO_,RE_,bou_,NA_,bou_,F__,L__,A__,G__,EOM_};
static const u8 main_flag_menu3[] = {S__,Y__,S__,F__,L__,A__,G__,EOM_};
static const u8 main_flag_menu4[] = {B__,A__,L__,L__,BA_,NI_,SI_,YYU_,F__,L__,A__,G__,EOM_};
static const u8 main_flag_menu5[] = {F__,H__,EOM_};
static const u8 main_flag_menu6[] = {F__,H__,bou_,O__,B__,J__,EOM_};

static const MENU_ITEM	MainFlagList[] =
{
	{ main_flag_menu0,flag_event_menu_blt},
	{ main_flag_menu1,flag_vanish_menu_blt},
	{ main_flag_menu2,flag_trainer_menu_blt},
	{ main_flag_menu3,flag_sys_menu_blt},
	{ main_flag_menu4,flag_ball_vanish_menu_blt},
	{ main_flag_menu5,flag_fh_menu_blt},
	{ main_flag_menu6,flag_fh_obj_menu_blt},
};

static const u8 main_work_menu0[] = {S__,A__,V__,E__,W__,O__,R__,K__,EOM_};
static const u8 main_work_menu1[] = {S__,Y__,S__,W__,O__,R__,K__,EOM_};
static const u8 main_work_menu2[] = {L__,O__,C__,A__,L__,W__,O__,R__,K__,EOM_};
static const u8 main_work_menu3[] = {O__,B__,J__,W__,O__,R__,K__,EOM_};
static const u8 main_work_menu4[] = {A__,N__,S__,W__,O__,R__,K__,EOM_};
static const u8 main_work_menu5[] = {S__,A__,V__,E__,W__,O__,R__,K__,spc_,PA_,bou_,TO_,n2_,EOM_};


static const MENU_ITEM	MainWorkList[] =
{
	{ main_work_menu0,work_save_menu_blt},
	{ main_work_menu1,work_sys_menu_blt},
	{ main_work_menu2,work_local_menu_blt},
	{ main_work_menu3,work_obj_menu_blt},
	{ main_work_menu4,work_ans_menu_blt},
	{ main_work_menu5,work_save2_menu_blt},
};
/*----------------------------------------------------------------------------------*/

static const u8 event_ctrl_menu0[] = {KU_,RI_,A_,go_,EOM_};
static const u8 event_ctrl_menu1[] = {KO_,I_,N_,ko_,u_,ni_,yyu_,u_,ka_,no_,u_,EOM_};
static const u8 event_ctrl_menu2[] = {KO_,TO_,KI_,SA_,PO_,bou_,TA_,bou_,SE_,TTU_,TO_,EOM_};
static const u8 event_ctrl_menu3[] = {NI_,YYU_,bou_,KI_,N_,SE_,TU_,O__,P__,E__,N__,EOM_};
static const u8 event_ctrl_menu4[] = {re_,n_,ra_,ku_,se_,n_,ni_,no_,re_,ru_,EOM_};
static const u8 event_ctrl_menu5[] = {TA_,MA_,GO_,tu_,i_,ka_,EOM_};
static const u8 event_ctrl_menu6[] = {A_,I_,TE_,MU_,i_,ttu_,pa_,i_,EOM_};
static const u8 event_ctrl_menu7[] = {GU_,TTU_,ZU_,i_,ttu_,pa_,i_,EOM_};
static const u8 event_ctrl_menu8[] = {C__,O__,I__,N__,i_,ttu_,pa_,i_,EOM_};

static const MENU_ITEM	EventCtrl0MenuList[] =
{
	{ event_ctrl_menu0,event_kuriago_set},
	{ event_ctrl_menu1,event_koin_set},
	{ event_ctrl_menu2,event_kotoki_support_set},
	{ event_ctrl_menu3,event_new_kinsetu_open_set},
	{ event_ctrl_menu4,event_fune_go_ok_set},
	{ event_ctrl_menu5,event_add_tamago},
	{ event_ctrl_menu6,event_item_over_set},
	{ event_ctrl_menu7,event_goods_over_set},
	{ event_ctrl_menu8,event_coin_over_set},
};

static const u8 event_ctrl_menu9[] = {MU_,RO_,ZI_,MU_,O__,P__,E__,N__,EOM_};
static const u8 event_ctrl_menu10[] = {o_,ka_,ne_,wo_,n0_,he_,EOM_};
static const u8 event_ctrl_menu11[] = {DO_,ZI_,YYO_,TTU_,TI_,spc_,F__,U__,L__,L__,EOM_};
static const u8 event_ctrl_menu12[] = {KI_,NO_,KO_,KO_,spc_,F__,U__,L__,L__,EOM_};
static const u8 event_ctrl_menu13[] = {DO_,ZI_,YYO_,TTU_,TI_,spc_,TA_,MA_,GO_,EOM_};
static const u8 event_ctrl_menu14[] = {KI_,NO_,KO_,KO_,spc_,TA_,MA_,GO_,EOM_};

static const MENU_ITEM	EventCtrl1MenuList[] =
{
	{ event_ctrl_menu9,event_muro_gym_open_set},
	{ event_ctrl_menu10,event_my_gold_zero_set},
	{ event_ctrl_menu11,event_kinokoko_full},
	{ event_ctrl_menu12,event_dozyotti_full},
	{ event_ctrl_menu13,event_kinokoko_tamago},
	{ event_ctrl_menu14,event_dozyotti_tamago},
};

/*----------------------------------------------------------------------------------*/
static const u8 answ_menu0[] = {A__,N__,S__,W__,O__,R__,K__,spc_,mi_,ka_,n_,se_,i_,EOM_};

static const MENU_ITEM	AnsWorkMenuList[] = 
{
	{ answ_menu0,MenuDummy},
};

/*----------------------------------------------------------------------------------*/
static const u8 fh_obj_menu0[] = {F__,H__,bou_,O__,B__,J__,n0_,n0_,bou_,n0_,n8_,EOM_};
static const u8 fh_obj_menu1[] = {F__,H__,bou_,O__,B__,J__,n0_,n9_,bou_,n1_,n5_,EOM_};

static const MENU_ITEM	FlagFHObjMenuList[] =
{
	{ fh_obj_menu0,flag_fh_obj_menu_0_blt },
	{ fh_obj_menu1,flag_fh_obj_menu_1_blt }
};

static const u8 fh_obj_flag_menu0[] = {F__,H__,bou_,O__,B__,J__,n0_,n0_,EOM_};
static const u8 fh_obj_flag_menu1[] = {F__,H__,bou_,O__,B__,J__,n0_,n1_,EOM_};
static const u8 fh_obj_flag_menu2[] = {F__,H__,bou_,O__,B__,J__,n0_,n2_,EOM_};
static const u8 fh_obj_flag_menu3[] = {F__,H__,bou_,O__,B__,J__,n0_,n3_,EOM_};
static const u8 fh_obj_flag_menu4[] = {F__,H__,bou_,O__,B__,J__,n0_,n4_,EOM_};
static const u8 fh_obj_flag_menu5[] = {F__,H__,bou_,O__,B__,J__,n0_,n5_,EOM_};
static const u8 fh_obj_flag_menu6[] = {F__,H__,bou_,O__,B__,J__,n0_,n6_,EOM_};
static const u8 fh_obj_flag_menu7[] = {F__,H__,bou_,O__,B__,J__,n0_,n7_,EOM_};
static const u8 fh_obj_flag_menu8[] = {F__,H__,bou_,O__,B__,J__,n0_,n8_,EOM_};

static const MENU_ITEM	FlagFHObj0MenuList[] =
{
	{ fh_obj_flag_menu0,MenuDummy},
	{ fh_obj_flag_menu1,MenuDummy},
	{ fh_obj_flag_menu2,MenuDummy},
	{ fh_obj_flag_menu3,MenuDummy},
	{ fh_obj_flag_menu4,MenuDummy},
	{ fh_obj_flag_menu5,MenuDummy},
	{ fh_obj_flag_menu6,MenuDummy},
	{ fh_obj_flag_menu7,MenuDummy},
	{ fh_obj_flag_menu8,MenuDummy},
};

static const u8 fh_obj_flag_menu9[] = {F__,H__,bou_,O__,B__,J__,n0_,n9_,EOM_};
static const u8 fh_obj_flag_menu10[] = {F__,H__,bou_,O__,B__,J__,n1_,n0_,EOM_};
static const u8 fh_obj_flag_menu11[] = {F__,H__,bou_,O__,B__,J__,n1_,n1_,EOM_};
static const u8 fh_obj_flag_menu12[] = {F__,H__,bou_,O__,B__,J__,n1_,n2_,EOM_};
static const u8 fh_obj_flag_menu13[] = {F__,H__,bou_,O__,B__,J__,n1_,n3_,EOM_};
static const u8 fh_obj_flag_menu14[] = {F__,H__,bou_,O__,B__,J__,n1_,n4_,EOM_};
static const u8 fh_obj_flag_menu15[] = {F__,H__,bou_,O__,B__,J__,n1_,n5_,EOM_};
static const u8 fh_obj_flag_menu16[] = {EOM_};
static const u8 fh_obj_flag_menu17[] = {EOM_};

static const MENU_ITEM	FlagFHObj1MenuList[] =
{
	{ fh_obj_flag_menu9,MenuDummy},
	{ fh_obj_flag_menu10,MenuDummy},
	{ fh_obj_flag_menu11,MenuDummy},
	{ fh_obj_flag_menu12,MenuDummy},
	{ fh_obj_flag_menu13,MenuDummy},
	{ fh_obj_flag_menu14,MenuDummy},
	{ fh_obj_flag_menu15,MenuDummy},
	{ fh_obj_flag_menu16,MenuDummy},
	{ fh_obj_flag_menu17,MenuDummy},
};

static const u8 FHObjFlagMaxTbl[] = {
	FH_OBJ_FLAG0_MENU_MAX, FH_OBJ_FLAG1_MENU_MAX
};

static const u16 FHObjFlagHeader[FH_OBJ_FLAG_MENU_MAX][9] = {
 {
	 FH_OBJ00, FH_OBJ01, FH_OBJ02, FH_OBJ03, FH_OBJ04,
	 FH_OBJ05, FH_OBJ06, FH_OBJ07, FH_OBJ08
 },
 {
	 FH_OBJ09, FH_OBJ10, FH_OBJ11, FH_OBJ12, FH_OBJ13,
	 FH_OBJ14, FH_OBJ15, 0, 0
 }
};

/*----------------------------------------------------------------------------------*/
static const u8 fh_menu0[] = {F__,H__,bou_,n0_,n0_,bou_,n0_,n8_,EOM_};
static const u8 fh_menu1[] = {F__,H__,bou_,n0_,n9_,bou_,n1_,n5_,EOM_};

static const MENU_ITEM	FlagFHMenuList[] =
{
	{ fh_menu0,flag_fh_menu_0_blt },
	{ fh_menu1,flag_fh_menu_1_blt }
};

static const u8 fh_flag_menu0[] = {F__,H__,bou_,n0_,n0_,EOM_};
static const u8 fh_flag_menu1[] = {F__,H__,bou_,n0_,n1_,EOM_};
static const u8 fh_flag_menu2[] = {F__,H__,bou_,n0_,n2_,EOM_};
static const u8 fh_flag_menu3[] = {F__,H__,bou_,n0_,n3_,EOM_};
static const u8 fh_flag_menu4[] = {F__,H__,bou_,n0_,n4_,EOM_};
static const u8 fh_flag_menu5[] = {F__,H__,bou_,n0_,n5_,EOM_};
static const u8 fh_flag_menu6[] = {F__,H__,bou_,n0_,n6_,EOM_};
static const u8 fh_flag_menu7[] = {F__,H__,bou_,n0_,n7_,EOM_};
static const u8 fh_flag_menu8[] = {F__,H__,bou_,n0_,n8_,EOM_};

static const MENU_ITEM	FlagFH0MenuList[] =
{
	{ fh_flag_menu0,MenuDummy},
	{ fh_flag_menu1,MenuDummy},
	{ fh_flag_menu2,MenuDummy},
	{ fh_flag_menu3,MenuDummy},
	{ fh_flag_menu4,MenuDummy},
	{ fh_flag_menu5,MenuDummy},
	{ fh_flag_menu6,MenuDummy},
	{ fh_flag_menu7,MenuDummy},
	{ fh_flag_menu8,MenuDummy},
};

static const u8 fh_flag_menu9[] = {F__,H__,bou_,n0_,n9_,EOM_};
static const u8 fh_flag_menu10[] = {F__,H__,bou_,n1_,n0_,EOM_};
static const u8 fh_flag_menu11[] = {F__,H__,bou_,n1_,n1_,EOM_};
static const u8 fh_flag_menu12[] = {F__,H__,bou_,n1_,n2_,EOM_};
static const u8 fh_flag_menu13[] = {F__,H__,bou_,n1_,n3_,EOM_};
static const u8 fh_flag_menu14[] = {F__,H__,bou_,n1_,n4_,EOM_};
static const u8 fh_flag_menu15[] = {F__,H__,bou_,n1_,n5_,EOM_};
static const u8 fh_flag_menu16[] = {EOM_};
static const u8 fh_flag_menu17[] = {EOM_};

static const MENU_ITEM	FlagFH1MenuList[] =
{
	{ fh_flag_menu9,MenuDummy},
	{ fh_flag_menu10,MenuDummy},
	{ fh_flag_menu11,MenuDummy},
	{ fh_flag_menu12,MenuDummy},
	{ fh_flag_menu13,MenuDummy},
	{ fh_flag_menu14,MenuDummy},
	{ fh_flag_menu15,MenuDummy},
	{ fh_flag_menu16,MenuDummy},
	{ fh_flag_menu17,MenuDummy},
};

static const u8 FHFlagMaxTbl[] = {
	FH_FLAG0_MENU_MAX, FH_FLAG1_MENU_MAX
};

static const u16 FHFlagHeader[FH_FLAG_MENU_MAX][9] = {
 {
	 FH_00, FH_01, FH_02, FH_03, FH_04,
	 FH_05, FH_06, FH_07, FH_08
 },
 {
	 FH_09, FH_10, FH_11, FH_12, FH_13,
	 FH_14, FH_15, 0, 0
 }
};

/*----------------------------------------------------------------------------------*/
static const u8 sysf_menu0[] = {B__,A__,T__,C__,H__,EOM_};
static const u8 sysf_menu1[] = {TA_,U_,N_,to_,u_,ti_,yya_,ku_,EOM_};
static const u8 sysf_menu2[] = {SI_,TE_,II_,to_,u_,ti_,yya_,ku_,EOM_};
static const u8 sysf_menu3[] = {G__,E__,T__,EOM_};
static const u8 sysf_menu4[] = {so_,no_,ta_,n1_,EOM_};
static const u8 sysf_menu5[] = {so_,no_,ta_,n2_,EOM_};
static const u8 sysf_menu6[] = {so_,no_,ta_,n3_,EOM_};
static const u8 sysf_menu7[] = {so_,no_,ta_,n4_,EOM_};
static const u8 sysf_menu8[] = {so_,no_,ta_,spc_,to_,u_,ti_,yya_,ku_,EOM_};

static const MENU_ITEM	SysFlagMenuList[] =
{
	{ sysf_menu0,sys_flag_menu_0_blt },
	{ sysf_menu1,sys_flag_menu_1_blt },
	{ sysf_menu2,sys_flag_menu_2_blt },
	{ sysf_menu3,sys_flag_menu_3_blt },
	{ sysf_menu4,sys_flag_menu_4_blt },
	{ sysf_menu5,sys_flag_menu_5_blt },
	{ sysf_menu6,sys_flag_menu_6_blt },
	{ sysf_menu7,sys_flag_menu_7_blt },
	{ sysf_menu8,sys_flag_menu_8_blt },
};
static const u8 sys_flag_menu0[] = {B__,A__,T__,C__,H__,n0_,n1_,bou_,G__,E__,T__,EOM_};
static const u8 sys_flag_menu1[] = {B__,A__,T__,C__,H__,n0_,n2_,bou_,G__,E__,T__,EOM_};
static const u8 sys_flag_menu2[] = {B__,A__,T__,C__,H__,n0_,n3_,bou_,G__,E__,T__,EOM_};
static const u8 sys_flag_menu3[] = {B__,A__,T__,C__,H__,n0_,n4_,bou_,G__,E__,T__,EOM_};
static const u8 sys_flag_menu4[] = {B__,A__,T__,C__,H__,n0_,n5_,bou_,G__,E__,T__,EOM_};
static const u8 sys_flag_menu5[] = {B__,A__,T__,C__,H__,n0_,n6_,bou_,G__,E__,T__,EOM_};
static const u8 sys_flag_menu6[] = {B__,A__,T__,C__,H__,n0_,n7_,bou_,G__,E__,T__,EOM_};
static const u8 sys_flag_menu7[] = {B__,A__,T__,C__,H__,n0_,n8_,bou_,G__,E__,T__,EOM_};

static const MENU_ITEM	SysFlag0MenuList[] =
{
	{ sys_flag_menu0,MenuDummy},
	{ sys_flag_menu1,MenuDummy},
	{ sys_flag_menu2,MenuDummy},
	{ sys_flag_menu3,MenuDummy},
	{ sys_flag_menu4,MenuDummy},
	{ sys_flag_menu5,MenuDummy},
	{ sys_flag_menu6,MenuDummy},
	{ sys_flag_menu7,MenuDummy},
};

static const u8 sys_flag_menu9[] = {T__,n1_,n0_,n1_,A__,R__,R__,I__,V__,E__,EOM_};
static const u8 sys_flag_menu10[] = {T__,n1_,n0_,n2_,A__,R__,R__,I__,V__,E__,EOM_};
static const u8 sys_flag_menu11[] = {T__,n1_,n0_,n3_,A__,R__,R__,I__,V__,E__,EOM_};
static const u8 sys_flag_menu12[] = {T__,n1_,n0_,n4_,A__,R__,R__,I__,V__,E__,EOM_};
static const u8 sys_flag_menu13[] = {T__,n1_,n0_,n5_,A__,R__,R__,I__,V__,E__,EOM_};
static const u8 sys_flag_menu14[] = {T__,n1_,n0_,n6_,A__,R__,R__,I__,V__,E__,EOM_};
static const u8 sys_flag_menu15[] = {T__,n1_,n0_,n7_,A__,R__,R__,I__,V__,E__,EOM_};

static const MENU_ITEM	SysFlag1MenuList[] =
{
	{ sys_flag_menu9,MenuDummy},
	{ sys_flag_menu10,MenuDummy},
	{ sys_flag_menu11,MenuDummy},
	{ sys_flag_menu12,MenuDummy},
	{ sys_flag_menu13,MenuDummy},
	{ sys_flag_menu14,MenuDummy},
	{ sys_flag_menu15,MenuDummy},
};

static const u8 sys_flag_menu18[] = {C__,n1_,n0_,n1_,A__,R__,R__,I__,V__,E__,EOM_};
static const u8 sys_flag_menu19[] = {C__,n1_,n0_,n2_,A__,R__,R__,I__,V__,E__,EOM_};
static const u8 sys_flag_menu20[] = {C__,n1_,n0_,n3_,A__,R__,R__,I__,V__,E__,EOM_};
static const u8 sys_flag_menu21[] = {C__,n1_,n0_,n4_,A__,R__,R__,I__,V__,E__,EOM_};
static const u8 sys_flag_menu22[] = {C__,n1_,n0_,n5_,A__,R__,R__,I__,V__,E__,EOM_};
static const u8 sys_flag_menu23[] = {C__,n1_,n0_,n6_,A__,R__,R__,I__,V__,E__,EOM_};
static const u8 sys_flag_menu24[] = {C__,n1_,n0_,n7_,A__,R__,R__,I__,V__,E__,EOM_};
static const u8 sys_flag_menu25[] = {C__,n1_,n0_,n8_,A__,R__,R__,I__,V__,E__,EOM_};
static const u8 sys_flag_menu26[] = {C__,n1_,n0_,n9_,A__,R__,R__,I__,V__,E__,EOM_};

static const MENU_ITEM	SysFlag2MenuList[] =
{
	{ sys_flag_menu18,MenuDummy},
	{ sys_flag_menu19,MenuDummy},
	{ sys_flag_menu20,MenuDummy},
	{ sys_flag_menu21,MenuDummy},
	{ sys_flag_menu22,MenuDummy},
	{ sys_flag_menu23,MenuDummy},
	{ sys_flag_menu24,MenuDummy},
	{ sys_flag_menu25,MenuDummy},
	{ sys_flag_menu26,MenuDummy},
};

static const u8 sys_flag_menu27[] = {S__,Y__,S__,bou_,P__,O__,K__,E__,M__,O__,N__,bou_,G__,E__,T__,EOM_};
static const u8 sys_flag_menu28[] = {S__,Y__,S__,bou_,Z__,U__,K__,A__,N__,bou_,G__,E__,T__,EOM_};
static const u8 sys_flag_menu29[] = {S__,Y__,S__,bou_,P__,O__,K__,E__,G__,E__,A__,R__,bou_,G__,E__,T__,EOM_};
static const u8 sys_flag_menu30[] = {S__,Y__,S__,bou_,R__,I__,B__,B__,O__,N__,bou_,G__,E__,T__,EOM_};

static const MENU_ITEM	SysFlag3MenuList[] =
{
	{ sys_flag_menu27,MenuDummy},
	{ sys_flag_menu28,MenuDummy},
	{ sys_flag_menu29,MenuDummy},
	{ sys_flag_menu30,MenuDummy},
};

static const u8 sys_flag_menu36[] = {S__,Y__,S__,bou_,G__,A__,M__,E__,bou_,C__,L__,E__,A__,R__,EOM_};
static const u8 sys_flag_menu37[] = {S__,Y__,S__,bou_,K__,A__,I__,W__,A__,bou_,U__,S__,E__,D__,EOM_};
static const u8 sys_flag_menu38[] = {S__,Y__,S__,bou_,N__,O__,W__,bou_,O__,Y__,A__,J__,I__,bou_,M__,E__,E__,T__,EOM_};
static const u8 sys_flag_menu39[] = {S__,Y__,S__,bou_,U__,S__,E__,bou_,W__,A__,Z__,A__,bou_,F__,L__,A__,S__,H__,EOM_};
static const u8 sys_flag_menu40[] = {S__,Y__,S__,bou_,U__,S__,E__,bou_,W__,A__,Z__,A__,bou_,K__,A__,I__,R__,I__,K__,I__,EOM_};
static const u8 sys_flag_menu41[] = {S__,Y__,S__,bou_,W__,E__,A__,T__,H__,E__,R__,bou_,C__,T__,R__,L__,EOM_};
static const u8 sys_flag_menu42[] = {S__,Y__,S__,bou_,C__,Y__,C__,L__,I__,N__,G__,bou_,R__,O__,A__,D__,EOM_};
static const u8 sys_flag_menu43[] = {S__,Y__,S__,bou_,S__,A__,F__,A__,R__,I__,bou_,M__,O__,D__,E__,EOM_};
static const u8 sys_flag_menu44[] = {S__,Y__,S__,bou_,C__,R__,U__,I__,S__,E__,bou_,M__,O__,D__,E__,EOM_};

static const MENU_ITEM	SysFlag4MenuList[] =
{
	{ sys_flag_menu36,MenuDummy},
	{ sys_flag_menu37,MenuDummy},
	{ sys_flag_menu38,MenuDummy},
	{ sys_flag_menu39,MenuDummy},
	{ sys_flag_menu40,MenuDummy},
	{ sys_flag_menu41,MenuDummy},
	{ sys_flag_menu42,MenuDummy},
	{ sys_flag_menu43,MenuDummy},
	{ sys_flag_menu44,MenuDummy},
};

static const u8 sys_flag_menu45[] = {S__,Y__,S__,bou_,T__,V__,bou_,H__,O__,M__,E__,EOM_};
static const u8 sys_flag_menu46[] = {S__,Y__,S__,bou_,T__,V__,bou_,W__,A__,T__,C__,H__,EOM_};
static const u8 sys_flag_menu47[] = {S__,Y__,S__,bou_,T__,V__,S__,T__,A__,R__,T__,EOM_};
static const u8 sys_flag_menu48[] = {S__,Y__,S__,bou_,P__,O__,P__,W__,O__,R__,D__,bou_,I__,N__,P__,U__,T__,EOM_};
static const u8 sys_flag_menu49[] = {S__,Y__,S__,bou_,M__,I__,X__,bou_,R__,E__,C__,O__,R__,D__,EOM_};
static const u8 sys_flag_menu50[] = {S__,Y__,S__,bou_,C__,L__,O__,C__,K__,bou_,S__,E__,T__,EOM_};
static const u8 sys_flag_menu51[] = {S__,Y__,S__,bou_,C__,A__,V__,E__,bou_,S__,H__,I__,P__,EOM_};
static const u8 sys_flag_menu52[] = {S__,Y__,S__,bou_,C__,A__,V__,E__,bou_,W__,O__,N__,D__,E__,R__,EOM_};
static const u8 sys_flag_menu53[] = {S__,Y__,S__,bou_,C__,A__,V__,E__,bou_,B__,A__,T__,T__,L__,E__,EOM_};

static const MENU_ITEM	SysFlag5MenuList[] =
{
	{ sys_flag_menu45,MenuDummy},
	{ sys_flag_menu46,MenuDummy},
	{ sys_flag_menu47,MenuDummy},
	{ sys_flag_menu48,MenuDummy},
	{ sys_flag_menu49,MenuDummy},
	{ sys_flag_menu50,MenuDummy},
	{ sys_flag_menu51,MenuDummy},
	{ sys_flag_menu52,MenuDummy},
	{ sys_flag_menu53,MenuDummy},
};

static const u8 sys_flag_menu54[] = {S__,Y__,S__,bou_,S__,P__,E__,C__,I__,A__,L__,bou_,Z__,U__,K__,A__,N__,EOM_};
static const u8 sys_flag_menu55[] = {S__,Y__,S__,bou_,A__,S__,A__,S__,E__,bou_,T__,I__,D__,E__,EOM_};
static const u8 sys_flag_menu56[] = {S__,Y__,S__,bou_,R__,I__,B__,B__,O__,N__,bou_,G__,E__,T__,EOM_};
static const u8 sys_flag_menu57[] = {S__,Y__,S__,bou_,P__,A__,S__,O__,bou_,M__,A__,Y__,U__,M__,I__,EOM_};
static const u8 sys_flag_menu58[] = {S__,Y__,S__,bou_,E__,X__,D__,A__,T__,A__,bou_,E__,N__,A__,B__,L__,E__,EOM_};
static const u8 sys_flag_menu59[] = {S__,Y__,S__,bou_,T__,E__,N__,J__,I__,bou_,A__,N__,A__,W__,O__,H__,O__,R__,U__,EOM_};
static const u8 sys_flag_menu60[] = {S__,Y__,S__,bou_,T__,E__,N__,J__,I__,bou_,K__,A__,I__,R__,I__,K__,I__,EOM_};
static const u8 sys_flag_menu61[] = {S__,Y__,S__,bou_,T__,E__,N__,J__,I__,bou_,W__,A__,I__,T__,EOM_};
static const u8 sys_flag_menu62[] = {S__,Y__,S__,bou_,T__,E__,N__,J__,I__,bou_,S__,O__,R__,A__,W__,O__,T__,O__,B__,U__,EOM_};

static const MENU_ITEM	SysFlag6MenuList[] =
{
	{ sys_flag_menu54,MenuDummy},
	{ sys_flag_menu55,MenuDummy},
	{ sys_flag_menu56,MenuDummy},
	{ sys_flag_menu57,MenuDummy},
	{ sys_flag_menu58,MenuDummy},
	{ sys_flag_menu59,MenuDummy},
	{ sys_flag_menu60,MenuDummy},
	{ sys_flag_menu61,MenuDummy},
	{ sys_flag_menu62,MenuDummy},
};

static const u8 sys_flag_menu63[] = {S__,Y__,S__,bou_,E__,N__,C__,bou_,U__,P__,bou_,I__,T__,E__,M__,EOM_};
static const u8 sys_flag_menu64[] = {S__,Y__,S__,bou_,E__,N__,E__,bou_,D__,O__,W__,N__,bou_,I__,T__,E__,M__,EOM_};
static const u8 sys_flag_menu65[] = {S__,Y__,S__,bou_,K__,O__,K__,O__,R__,O__,bou_,E__,V__,E__,N__,T__,EOM_};
static const u8 sys_flag_menu66[] = {S__,Y__,S__,bou_,M__,O__,V__,E__,bou_,P__,O__,K__,E__,bou_,N__,E__,W__,S__,EOM_};
static const u8 sys_flag_menu67[] = {S__,Y__,S__,bou_,A__,S__,A__,S__,E__,bou_,I__,T__,E__,M__,EOM_};
static const u8 sys_flag_menu68[] = {S__,Y__,S__,bou_,B__,bou_,D__,A__,S__,H__,EOM_};
static const u8 sys_flag_menu69[] = {S__,Y__,S__,bou_,C__,T__,R__,L__,bou_,O__,B__,J__,bou_,D__,E__,L__,E__,T__,E__,EOM_};
static const u8 sys_flag_menu70[] = {EOM_};
static const u8 sys_flag_menu71[] = {EOM_};

static const MENU_ITEM	SysFlag7MenuList[] =
{
	{ sys_flag_menu63,MenuDummy},
	{ sys_flag_menu64,MenuDummy},
	{ sys_flag_menu65,MenuDummy},
	{ sys_flag_menu66,MenuDummy},
	{ sys_flag_menu67,MenuDummy},
	{ sys_flag_menu68,MenuDummy},
	{ sys_flag_menu69,MenuDummy},
	{ sys_flag_menu70,MenuDummy},
	{ sys_flag_menu71,MenuDummy},
};

static const u8 sys_flag_menu72[] ={S__,Y__,S__,bou_,A__,R__,R__,I__,V__,E__,bou_,S__,U__,B__,M__,A__,R__,I__,N__,E__,C__,A__,V__,E__,EOM_};
static const u8 sys_flag_menu73[] = {S__,Y__,S__,bou_,A__,R__,R__,I__,V__,E__,bou_,B__,A__,T__,T__,L__,E__,T__,O__,W__,E__,R__,EOM_};
static const u8 sys_flag_menu74[] = {S__,Y__,S__,bou_,A__,R__,R__,I__,V__,E__,bou_,I__,S__,L__,A__,N__,D__,EOM_};
static const u8 sys_flag_menu75[] = {S__,Y__,S__,bou_,A__,R__,R__,I__,V__,E__,bou_,L__,E__,A__,G__,U__,E__,EOM_};
static const u8 sys_flag_menu76[] ={S__,Y__,S__,bou_,A__,R__,R__,I__,V__,E__,bou_,S__,O__,R__,A__,N__,O__,H__,A__,S__,H__,I__,R__,A__,EOM_};
static const u8 sys_flag_menu77[] = {EOM_};
static const u8 sys_flag_menu78[] = {EOM_};
static const u8 sys_flag_menu79[] = {EOM_};
static const u8 sys_flag_menu80[] = {EOM_};

static const MENU_ITEM	SysFlag8MenuList[] =
{
	{ sys_flag_menu72,MenuDummy},
	{ sys_flag_menu73,MenuDummy},
	{ sys_flag_menu74,MenuDummy},
	{ sys_flag_menu75,MenuDummy},
	{ sys_flag_menu76,MenuDummy},
	{ sys_flag_menu77,MenuDummy},
	{ sys_flag_menu78,MenuDummy},
	{ sys_flag_menu79,MenuDummy},
	{ sys_flag_menu80,MenuDummy},
};


static const u8 SysFlagMaxTbl[SYS_FLAG_MENU_MAX] = {
	SYS_FLAG0_MENU_MAX, SYS_FLAG1_MENU_MAX, SYS_FLAG2_MENU_MAX, SYS_FLAG3_MENU_MAX, SYS_FLAG4_MENU_MAX, SYS_FLAG5_MENU_MAX,
	SYS_FLAG6_MENU_MAX, SYS_FLAG7_MENU_MAX, SYS_FLAG8_MENU_MAX
};

static const u16 SysFlagHeader[SYS_FLAG_MENU_MAX][9] = {
 {
	SYS_BATCH01_GET, SYS_BATCH02_GET, SYS_BATCH03_GET, SYS_BATCH04_GET, SYS_BATCH05_GET,
	SYS_BATCH06_GET, SYS_BATCH07_GET, SYS_BATCH08_GET,0
 },
 {
	SYS_T101_ARRIVE, SYS_T102_ARRIVE, SYS_T103_ARRIVE, SYS_T104_ARRIVE, SYS_T105_ARRIVE,
	SYS_T106_ARRIVE, SYS_T107_ARRIVE,0,0
 },
 {
	SYS_C101_ARRIVE, SYS_C102_ARRIVE, SYS_C103_ARRIVE, SYS_C104_ARRIVE, SYS_C105_ARRIVE,
	SYS_C106_ARRIVE, SYS_C107_ARRIVE, SYS_C108_ARRIVE, SYS_C109_ARRIVE
 },
 {
	SYS_POKEMON_GET, SYS_ZUKAN_GET, SYS_POKEGEAR_GET, SYS_RIBBON_GET,0,
	0,0,0,0
 },
 {
	SYS_GAME_CLEAR, SYS_KAIWA_USED, SYS_NOW_OYAJI_MEET, SYS_USE_WAZA_FLASH, SYS_USE_WAZA_KAIRIKI,
	SYS_WEATHER_CTRL, SYS_CYCLING_ROAD, SYS_SAFARI_MODE, SYS_CRUISE_MODE
 },
 {
	SYS_TV_HOME, SYS_TV_WATCH, SYS_TV_START, SYS_POPWORD_INPUT, SYS_MIX_RECORD,
	SYS_CLOCK_SET, SYS_CAVE_SHIP, SYS_CAVE_WONDER, SYS_CAVE_BATTLE
 },
 {
	SYS_SPECIAL_ZUKAN, SYS_ASASE_TIDE, SYS_RIBBON_GET, SYS_PASO_MAYUMI, SYS_EXDATA_ENABLE,
	SYS_TENJI_ANAWOHORU, SYS_TENJI_KAIRIKI, SYS_TENJI_WAIT, SYS_TENJI_SORAWOTOBU
 },
 {
	SYS_ENC_UP_ITEM, SYS_ENC_DOWN_ITEM, SYS_KOKORO_EVENT, SYS_MOVE_POKE_NEWS, SYS_ASASE_ITEM,
	SYS_B_DASH,SYS_CTRL_OBJ_DELETE, 0, 0
 },
 {
	SYS_ARRIVE_SUBMARINECAVE, SYS_ARRIVE_BATTLETOWER, SYS_ARRIVE_ISLAND, SYS_ARRIVE_LEAGUE, SYS_ARRIVE_SORANOHASHIRA,
	0, 0, 0, 0
 },
};

/*----------------------------------------------------------------------------------*/
/*----------------------------------------------------------------------------------*/
static const u8 ball_vanish_menu0[] = {F__,V__,bou_,B__,A__,L__,L__,spc_,PA_,bou_,TO_,n1_,EOM_};

static const MENU_ITEM	FlagBallVanishMenuList[] =
{
	{ ball_vanish_menu0,flag_ball_vanish_menu_0_blt },
};

static const u8 ball_vanish_flag_menu0[] = {F__,V__,bou_,B__,A__,L__,L__,n1_,bou_,n7_,n8_,EOM_};		//FV_BALL1_78
static const u8 ball_vanish_flag_menu1[] = {F__,V__,bou_,B__,A__,L__,L__,n1_,bou_,n1_,n3_,n3_,EOM_};	//FV_BALL1_133

static const MENU_ITEM	FlagBallVanish0MenuList[] =
{
	{ ball_vanish_flag_menu0,MenuDummy},
	{ ball_vanish_flag_menu1,MenuDummy},
};

static const u8 FlagBallVanishMaxTbl[BALL_VANISH_FLAG_MENU_MAX] = {
	BALL_VANISH_FLAG0_MENU_MAX,
};

static const u16 FlagBallVanishHeader[BALL_VANISH_FLAG_MENU_MAX][9] = {
 {
	FV_BALL1_78, FV_BALL1_133, 0, 0, 0,
	0,0,0,0
 }
};

/*----------------------------------------------------------------------------------*/
/*----------------------------------------------------------------------------------*/

static const u8 trainer_menu0[] = {ZI_,MU_,RI_,bou_,DA_,bou_,EOM_};
static const u8 trainer_menu1[] = {si_,te_,n_,no_,u_,EOM_};
static const u8 trainer_menu2[] = {mi_,tu_,ru_,sura_,C__,h__,a__,m__,p__,RO_,bou_,DO_,EOM_};

static const MENU_ITEM	FlagTrainerMenuList[] =
{
	{ trainer_menu0,flag_trainer_menu_0_blt },
	{ trainer_menu1,flag_trainer_menu_1_blt },
	{ trainer_menu2,flag_trainer_menu_2_blt }
};

static const u8 trainer_f_menu0[] = {F__,T__,bou_,G__,Y__,M__,bou_,n0_,n1_,bou_,L__,E__,A__,D__,E__,R__,EOM_};
static const u8 trainer_f_menu1[] = {F__,T__,bou_,G__,Y__,M__,bou_,n0_,n2_,bou_,L__,E__,A__,D__,E__,R__,EOM_};
static const u8 trainer_f_menu2[] = {F__,T__,bou_,G__,Y__,M__,bou_,n0_,n3_,bou_,L__,E__,A__,D__,E__,R__,EOM_};
static const u8 trainer_f_menu3[] = {F__,T__,bou_,G__,Y__,M__,bou_,n0_,n4_,bou_,L__,E__,A__,D__,E__,R__,EOM_};
static const u8 trainer_f_menu4[] = {F__,T__,bou_,G__,Y__,M__,bou_,n0_,n5_,bou_,L__,E__,A__,D__,E__,R__,EOM_};
static const u8 trainer_f_menu5[] = {F__,T__,bou_,G__,Y__,M__,bou_,n0_,n6_,bou_,L__,E__,A__,D__,E__,R__,EOM_};
static const u8 trainer_f_menu6[] = {F__,T__,bou_,G__,Y__,M__,bou_,n0_,n7_,bou_,L__,E__,A__,D__,E__,R__,EOM_};
static const u8 trainer_f_menu7[] = {F__,T__,bou_,G__,Y__,M__,bou_,n0_,n8_,bou_,L__,E__,A__,D__,E__,R__,EOM_};

static const MENU_ITEM	FlagTrainer0MenuList[] =
{
	{ trainer_f_menu0,MenuDummy},
	{ trainer_f_menu1,MenuDummy},
	{ trainer_f_menu2,MenuDummy},
	{ trainer_f_menu3,MenuDummy},
	{ trainer_f_menu4,MenuDummy},
	{ trainer_f_menu5,MenuDummy},
	{ trainer_f_menu6,MenuDummy},
	{ trainer_f_menu7,MenuDummy},
};

static const u8 trainer_f_menu9[] = {F__,T__,bou_,S__,H__,I__,T__,E__,N__,bou_,n0_,n1_,EOM_};
static const u8 trainer_f_menu10[] = {F__,T__,bou_,S__,H__,I__,T__,E__,N__,bou_,n0_,n2_,EOM_};
static const u8 trainer_f_menu11[] = {F__,T__,bou_,S__,H__,I__,T__,E__,N__,bou_,n0_,n3_,EOM_};
static const u8 trainer_f_menu12[] = {F__,T__,bou_,S__,H__,I__,T__,E__,N__,bou_,n0_,n4_,EOM_};

static const MENU_ITEM	FlagTrainer1MenuList[] =
{
	{ trainer_f_menu9,MenuDummy},
	{ trainer_f_menu10,MenuDummy},
	{ trainer_f_menu11,MenuDummy},
	{ trainer_f_menu12,MenuDummy},
};

static const u8 trainer_f_menu18[] = 
				{F__,T__,bou_,M__,I__,T__,S__,U__,R__,U__,bou_,n0_,n1_,bou_,C__,A__,V__,E__,bou_,D__,n1_,n3_,n0_,n1_,EOM_};

static const MENU_ITEM	FlagTrainer2MenuList[] =
{
	{ trainer_f_menu18,MenuDummy},
};

static const u8 FlagTrainerMaxTbl[TRAINER_FLAG_MENU_MAX] = {
	TRAINER_FLAG0_MENU_MAX, TRAINER_FLAG1_MENU_MAX, TRAINER_FLAG2_MENU_MAX
};

static const u16 FlagTrainerHeader[TRAINER_FLAG_MENU_MAX][9] = {
 {
	FT_GYM_01_LEADER, FT_GYM_02_LEADER, FT_GYM_03_LEADER, FT_GYM_04_LEADER, FT_GYM_05_LEADER,
	FT_GYM_06_LEADER, FT_GYM_07_LEADER, FT_GYM_08_LEADER,0,
 },
 {
	FT_SHITEN_01, FT_SHITEN_02, FT_SHITEN_03, FT_SHITEN_04,0,
	0,0,0,0,
 },
 {
	FT_MITSURU_01_CAVE_D1301,0,0,0,0,
	0,0,0,0,
 }
};

/*----------------------------------------------------------------------------------*/
/*----------------------------------------------------------------------------------*/
static const u8 vanish_menu0[] = {n1_,n2_,n0_,sura_,n1_,n1_,n9_,ba_,n_,do_,u_,ro_,KA_,KU_,RE_,O_,N_,EOM_};
static const u8 vanish_menu1[] = {so_,no_,ta_,n1_,spc_,sura_,spc_,S__,U__,P__,P__,O__,R__,T__,M__,sura_,W__,EOM_};
static const u8 vanish_menu2[] = {O__,D__,A__,M__,A__,K__,I__,sura_,F__,I__,G__,H__,T__,E__,R__,n1_,EOM_};
static const u8 vanish_menu3[] = {M__,I__,T__,S__,U__,R__,U__,sura_,T__,E__,N__,K__,I__,EOM_};
static const u8 vanish_menu4[] = {so_,no_,ta_,n2_,spc_,sura_,D__,A__,I__,G__,O__,EOM_};
static const u8 vanish_menu5[] = {P__,O__,K__,E__,sura_,P__,O__,K__,E__,M__,O__,N__,EOM_};
static const u8 vanish_menu6[] = {M__,A__,M__,A__,sura_,S__,U__,P__,P__,O__,R__,T__,n0_,n2_,EOM_};
static const u8 vanish_menu7[] = {H__,A__,G__,I__,EOM_};
static const u8 vanish_menu8[] = {S__,U__,P__,P__,O__,R__,T__,n0_,n1_,EOM_};

static const MENU_ITEM	FlagVanishMenuList[] =
{
	{ vanish_menu0,flag_vanish_menu_0_blt },
	{ vanish_menu1,flag_vanish_menu_1_blt },
	{ vanish_menu2,flag_vanish_menu_2_blt },
	{ vanish_menu3,flag_vanish_menu_3_blt },
	{ vanish_menu4,flag_vanish_menu_4_blt },
	{ vanish_menu5,flag_vanish_menu_5_blt },
	{ vanish_menu6,flag_vanish_menu_6_blt },
	{ vanish_menu7,flag_vanish_menu_7_blt },
	{ vanish_menu8,flag_vanish_menu_8_blt },
};

static const u8 vanish_f_menu0[] = {F__,V__,bou_,K__,A__,K__,U__,R__,E__,O__,N__,B__,bou_,
										n0_,n1_,bou_,F__,I__,E__,L__,D__,bou_,R__,n1_,n2_,n0_,EOM_};
static const u8 vanish_f_menu1[] = {F__,V__,bou_,K__,A__,K__,U__,R__,E__,bou_,n0_,n1_,bou_,F__,I__,E__,L__,D__,bou_,R__,n1_,n2_,n0_,EOM_};
static const u8 vanish_f_menu2[] = {F__,V__,bou_,K__,A__,K__,U__,R__,E__,bou_,n0_,n2_,bou_,F__,I__,E__,L__,D__,bou_,R__,n1_,n2_,n0_,EOM_};
static const u8 vanish_f_menu3[] = {F__,V__,bou_,K__,A__,K__,U__,R__,E__,bou_,n0_,n3_,bou_,F__,I__,E__,L__,D__,bou_,R__,n1_,n2_,n0_,EOM_};
static const u8 vanish_f_menu4[] = {F__,V__,bou_,K__,A__,K__,U__,R__,E__,bou_,n0_,n4_,bou_,F__,I__,E__,L__,D__,bou_,R__,n1_,n2_,n0_,EOM_};
static const u8 vanish_f_menu5[] = {F__,V__,bou_,K__,A__,K__,U__,R__,E__,bou_,n0_,n5_,bou_,F__,I__,E__,L__,D__,bou_,R__,n1_,n2_,n0_,EOM_};
static const u8 vanish_f_menu6[] = {F__,V__,bou_,K__,A__,K__,U__,R__,E__,bou_,n0_,n6_,bou_,F__,I__,E__,L__,D__,bou_,R__,n1_,n2_,n0_,EOM_};
static const u8 vanish_f_menu7[] = {F__,V__,bou_,K__,A__,K__,U__,R__,E__,bou_,n0_,n1_,bou_,F__,I__,E__,L__,D__,bou_,R__,n1_,n1_,n9_,EOM_};
static const u8 vanish_f_menu8[] = {F__,V__,bou_,K__,A__,K__,U__,R__,E__,bou_,n0_,n2_,bou_,F__,I__,E__,L__,D__,bou_,R__,n1_,n1_,n9_,EOM_};

static const MENU_ITEM	FlagVanish0MenuList[] =
{
	{ vanish_f_menu0,MenuDummy},
	{ vanish_f_menu1,MenuDummy},
	{ vanish_f_menu2,MenuDummy},
	{ vanish_f_menu3,MenuDummy},
	{ vanish_f_menu4,MenuDummy},
	{ vanish_f_menu5,MenuDummy},
	{ vanish_f_menu6,MenuDummy},
	{ vanish_f_menu7,MenuDummy},
	{ vanish_f_menu8,MenuDummy},
};

static const u8 vanish_f_menu9[] = {F__,V__,bou_,B__,A__,L__,L__,bou_,n0_,n1_,bou_,C__,n1_,n0_,n7_,bou_,R__,n0_,n5_,n0_,n1_,EOM_};
static const u8 vanish_f_menu10[] = {F__,V__,bou_,W__,O__,R__,K__,E__,R__,M__,n1_,bou_,n0_,n4_,bou_,F__,I__,E__,L__,D__,bou_,C__,n1_,n0_,n4_,EOM_};
static const u8 vanish_f_menu11[] = {F__,V__,bou_,S__,U__,B__,M__,A__,R__,I__,N__,E__,bou_,n0_,n6_,bou_,C__,A__,V__,E__,bou_,D__,n1_,n1_,n0_,n1_,EOM_};
static const u8 vanish_f_menu12[] = {F__,V__,bou_,G__,U__,E__,S__,T__,bou_,A__,L__,L__,bou_,C__,n1_,n0_,n6_,bou_,R__,n0_,n1_,n0_,n2_,EOM_};
static const u8 vanish_f_menu13[] = {F__,V__,bou_,H__,O__,R__,I__,D__,A__,S__,I__,bou_,n0_,n1_,bou_,C__,n1_,n0_,n6_,bou_,R__,n1_,n1_,n0_,n6_,EOM_};
static const u8 vanish_f_menu14[] = {F__,V__,bou_,M__,I__,D__,D__,L__,E__,M__,n1_,bou_,n0_,n1_,bou_,R__,n1_,n1_,n0_,bou_,R__,n0_,n1_,n0_,n1_,EOM_};

static const u8 vanish_f_menu15[] = {F__,V__,bou_,F__,U__,N__,E__,bou_,n0_,n1_,bou_,C__,n1_,n0_,n2_,bou_,R__,n0_,n6_,n0_,n1_,EOM_};

static const u8 vanish_f_menu16[] = {F__,V__,bou_,S__,U__,P__,P__,O__,R__,T__,W__,bou_,n0_,n1_,bou_,T__,n1_,n0_,n1_,bou_,R__,n0_,n2_,n0_,n2_,EOM_};
static const u8 vanish_f_menu17[] = {F__,V__,bou_,S__,U__,P__,P__,O__,R__,T__,M__,bou_,n0_,n1_,bou_,T__,n1_,n0_,n1_,bou_,R__,n0_,n1_,n0_,n2_,EOM_};

static const MENU_ITEM	FlagVanish1MenuList[] =
{
	{ vanish_f_menu9,MenuDummy},
	{ vanish_f_menu10,MenuDummy},
	{ vanish_f_menu11,MenuDummy},
	{ vanish_f_menu12,MenuDummy},
	{ vanish_f_menu13,MenuDummy},
	{ vanish_f_menu14,MenuDummy},
	{ vanish_f_menu15,MenuDummy},
	{ vanish_f_menu16,MenuDummy},
	{ vanish_f_menu17,MenuDummy}
};

static const u8 vanish_f_menu18[] = {F__,V__,bou_,O__,D__,A__,M__,A__,K__,I__,bou_,n0_,n1_,bou_,F__,I__,E__,L__,D__,bou_,R__,n1_,n0_,n1_,EOM_};
static const u8 vanish_f_menu19[] = {F__,V__,bou_,O__,D__,A__,M__,A__,K__,I__,bou_,n0_,n1_,bou_,T__,n1_,n0_,n1_,bou_,R__,n0_,n3_,n0_,n1_,EOM_};
static const u8 vanish_f_menu20[] = {F__,V__,bou_,O__,D__,A__,M__,A__,K__,I__,bou_,H__,Y__,O__,K__,A__,bou_,T__,n1_,n0_,n1_,bou_,R__,n0_,n3_,n0_,n1_,EOM_};
static const u8 vanish_f_menu21[] = {F__,V__,bou_,O__,D__,A__,M__,A__,K__,I__,bou_,H__,Y__,O__,K__,A__,bou_,F__,I__,E__,L__,D__,bou_,R__,n1_,n0_,n1_,EOM_};
static const u8 vanish_f_menu22[] = {F__,V__,bou_,O__,D__,A__,M__,A__,K__,I__,bou_,H__,Y__,O__,K__,A__,bou_,F__,I__,E__,L__,D__,bou_,R__,n1_,n0_,n3_,EOM_};
static const u8 vanish_f_menu23[] = {F__,V__,bou_,O__,D__,A__,M__,A__,K__,I__,bou_,n0_,n1_,bou_,C__,n1_,n0_,n9_,bou_,R__,n0_,n1_,n0_,n5_,EOM_};

static const u8 vanish_f_menu24[] = {F__,V__,bou_,F__,I__,G__,H__,T__,E__,R__,bou_,n0_,n1_,bou_,C__,A__,V__,E__,bou_,D__,n0_,n2_,n0_,n1_,EOM_};
static const u8 vanish_f_menu25[] = {F__,V__,bou_,F__,I__,G__,H__,T__,E__,R__,bou_,n0_,n1_,bou_,T__,n1_,n0_,n6_,bou_,R__,n0_,n2_,n0_,n1_,EOM_};
static const u8 vanish_f_menu26[] = {F__,V__,bou_,F__,I__,G__,H__,T__,E__,R__,bou_,n0_,n1_,bou_,F__,I__,E__,L__,D__,bou_,R__,n1_,n1_,n6_,EOM_};


static const MENU_ITEM	FlagVanish2MenuList[] =
{
	{ vanish_f_menu18,MenuDummy},
	{ vanish_f_menu19,MenuDummy},
	{ vanish_f_menu20,MenuDummy},
	{ vanish_f_menu21,MenuDummy},
	{ vanish_f_menu22,MenuDummy},
	{ vanish_f_menu23,MenuDummy},
	{ vanish_f_menu24,MenuDummy},
	{ vanish_f_menu25,MenuDummy},
	{ vanish_f_menu26,MenuDummy},
};

static const u8 vanish_f_menu27[] = {F__,V__,bou_,M__,I__,T__,S__,U__,R__,U__,bou_,n0_,n1_,bou_,F__,I__,E__,L__,D__,bou_,C__,n1_,n0_,n1_,EOM_};
static const u8 vanish_f_menu28[] = {F__,V__,bou_,M__,I__,T__,S__,U__,R__,U__,bou_,n0_,n2_,bou_,C__,A__,V__,E__,bou_,D__,n1_,n3_,n0_,n1_,EOM_};
static const u8 vanish_f_menu29[] = {F__,V__,bou_,M__,I__,T__,S__,U__,R__,U__,bou_,n0_,n1_,bou_,F__,I__,E__,L__,D__,bou_,C__,n1_,n0_,n3_,EOM_};
static const u8 vanish_f_menu30[] = {F__,V__,bou_,M__,I__,T__,S__,U__,R__,U__,bou_,n0_,n1_,bou_,T__,n1_,n0_,n6_,bou_,R__,n0_,n2_,n0_,n1_,EOM_};
static const u8 vanish_f_menu31[] = {F__,V__,bou_,M__,I__,T__,S__,U__,R__,U__,bou_,n0_,n1_,bou_,C__,A__,V__,E__,bou_,D__,n1_,n3_,n0_,n1_,EOM_};
static const u8 vanish_f_menu32[] = {F__,V__,bou_,M__,I__,T__,S__,U__,R__,U__,bou_,n0_,n1_,bou_,C__,n1_,n0_,n1_,bou_,R__,n0_,n2_,n0_,n1_,EOM_};
static const u8 vanish_f_menu33[] = {F__,V__,bou_,M__,I__,T__,S__,U__,R__,U__,bou_,n0_,n1_,bou_,F__,I__,E__,L__,D__,bou_,R__,n1_,n0_,n2_,EOM_};
static const u8 vanish_f_menu34[] = {F__,V__,bou_,T__,E__,N__,K__,I__,bou_,n0_,n1_,bou_,R__,n1_,n1_,n9_,bou_,R__,n1_,n0_,n1_,EOM_};
static const u8 vanish_f_menu35[] = {F__,V__,bou_,T__,E__,N__,K__,I__,bou_,n0_,n1_,bou_,R__,n1_,n1_,n9_,bou_,R__,n1_,n0_,n2_,EOM_};

static const MENU_ITEM	FlagVanish3MenuList[] =
{
	{ vanish_f_menu27,MenuDummy},
	{ vanish_f_menu28,MenuDummy},
	{ vanish_f_menu29,MenuDummy},
	{ vanish_f_menu30,MenuDummy},
	{ vanish_f_menu31,MenuDummy},
	{ vanish_f_menu32,MenuDummy},
	{ vanish_f_menu33,MenuDummy},
	{ vanish_f_menu34,MenuDummy},
	{ vanish_f_menu35,MenuDummy}
};

static const u8 vanish_f_menu36[] = {F__,V__,bou_,D__,A__,I__,G__,O__,bou_,n0_,n1_,bou_,C__,A__,V__,E__,bou_,D__,n0_,n5_,n0_,n4_,EOM_};
static const u8 vanish_f_menu37[] = {F__,V__,bou_,D__,A__,I__,G__,O__,bou_,n0_,n1_,bou_,F__,I__,E__,L__,D__,bou_,R__,n1_,n2_,n8_,EOM_};
static const u8 vanish_f_menu38[] = {F__,V__,bou_,D__,A__,I__,G__,O__,bou_,n0_,n1_,bou_,F__,I__,E__,L__,D__,bou_,R__,n1_,n1_,n8_,EOM_};
static const u8 vanish_f_menu39[] = {F__,V__,bou_,D__,A__,I__,G__,O__,bou_,n0_,n1_,bou_,C__,n1_,n0_,n7_,bou_,R__,n0_,n5_,n0_,n1_,EOM_};
static const u8 vanish_f_menu40[] = {F__,V__,bou_,D__,A__,I__,G__,O__,bou_,n0_,n1_,bou_,F__,I__,E__,L__,D__,bou_,R__,n1_,n2_,n0_,EOM_};
static const u8 vanish_f_menu41[] = {F__,V__,bou_,D__,A__,I__,G__,O__,bou_,n0_,n1_,bou_,F__,I__,E__,L__,D__,bou_,R__,n1_,n0_,n8_,EOM_};

static const MENU_ITEM	FlagVanish4MenuList[] =
{
	{ vanish_f_menu36,MenuDummy},
	{ vanish_f_menu37,MenuDummy},
	{ vanish_f_menu38,MenuDummy},
	{ vanish_f_menu39,MenuDummy},
	{ vanish_f_menu40,MenuDummy},
	{ vanish_f_menu41,MenuDummy},
};

static const u8 vanish_f_menu45[] = {F__,V__,bou_,P__,O__,K__,E__,n1_,bou_,n0_,n2_,bou_,C__,A__,V__,E__,bou_,D__,n1_,n1_,n1_,n1_,EOM_};
static const u8 vanish_f_menu46[] = {F__,V__,bou_,P__,O__,K__,E__,n1_,bou_,n0_,n1_,bou_,C__,A__,V__,E__,bou_,D__,n0_,n6_,n0_,n1_,EOM_};
static const u8 vanish_f_menu47[] = {F__,V__,bou_,P__,O__,K__,E__,n1_,bou_,n0_,n2_,bou_,C__,A__,V__,E__,bou_,D__,n0_,n6_,n0_,n1_,EOM_};
static const u8 vanish_f_menu48[] = {F__,V__,bou_,P__,O__,K__,E__,n1_,bou_,n0_,n1_,bou_,F__,I__,E__,L__,D__,bou_,R__,n1_,n0_,n1_,EOM_};
static const u8 vanish_f_menu49[] = {F__,V__,bou_,P__,O__,K__,E__,n1_,bou_,n0_,n1_,bou_,O__,P__,E__,N__,I__,N__,G__,bou_,R__,O__,O__,M__,n0_,n1_,EOM_};
static const u8 vanish_f_menu50[] = {F__,V__,bou_,P__,O__,K__,E__,n1_,bou_,n0_,n2_,bou_,O__,P__,E__,N__,I__,N__,G__,bou_,R__,O__,O__,M__,n0_,n1_,EOM_};
static const u8 vanish_f_menu51[] = {F__,V__,bou_,P__,O__,K__,E__,n1_,bou_,n0_,n1_,bou_,C__,A__,V__,E__,bou_,D__,n2_,n3_,n0_,n8_,EOM_};

static const u8 vanish_f_menu52[] = {F__,V__,bou_,P__,O__,K__,E__,M__,O__,N__,bou_,n0_,n1_,bou_,C__,A__,V__,E__,bou_,D__,n0_,n2_,n0_,n1_,EOM_};
static const u8 vanish_f_menu53[] = {F__,V__,bou_,P__,O__,K__,E__,M__,O__,N__,bou_,n0_,n1_,bou_,R__,n1_,n0_,n4_,bou_,R__,n0_,n1_,n0_,n1_,EOM_};


static const MENU_ITEM	FlagVanish5MenuList[] =
{
	{ vanish_f_menu45,MenuDummy},
	{ vanish_f_menu46,MenuDummy},
	{ vanish_f_menu47,MenuDummy},
	{ vanish_f_menu48,MenuDummy},
	{ vanish_f_menu49,MenuDummy},
	{ vanish_f_menu50,MenuDummy},
	{ vanish_f_menu51,MenuDummy},
	{ vanish_f_menu52,MenuDummy},
	{ vanish_f_menu53,MenuDummy},
};

static const u8 vanish_f_menu54[] = {F__,V__,bou_,M__,A__,M__,A__,bou_,n0_,n1_,bou_,F__,I__,E__,L__,D__,bou_,T__,n1_,n0_,n1_,EOM_};
static const u8 vanish_f_menu55[] = {F__,V__,bou_,M__,A__,M__,A__,bou_,n0_,n1_,bou_,O__,P__,E__,N__,I__,N__,G__,bou_,R__,O__,O__,M__,n0_,n2_,EOM_};
static const u8 vanish_f_menu56[] = {F__,V__,bou_,M__,A__,M__,A__,bou_,n0_,n1_,bou_,T__,n1_,n0_,n1_,bou_,R__,n0_,n1_,n0_,n1_,EOM_};
static const u8 vanish_f_menu57[] = {F__,V__,bou_,M__,A__,M__,A__,bou_,n0_,n1_,bou_,T__,n1_,n0_,n1_,bou_,R__,n0_,n2_,n0_,n1_,EOM_};
static const u8 vanish_f_menu58[] = {F__,V__,bou_,M__,A__,M__,A__,bou_,n0_,n2_,bou_,T__,n1_,n0_,n1_,bou_,R__,n0_,n1_,n0_,n1_,EOM_};
static const u8 vanish_f_menu59[] = {F__,V__,bou_,M__,A__,M__,A__,bou_,n0_,n2_,bou_,T__,n1_,n0_,n1_,bou_,R__,n0_,n2_,n0_,n1_,EOM_};
static const u8 vanish_f_menu60[] = {F__,V__,bou_,S__,U__,P__,P__,O__,R__,T__,bou_,n0_,n2_,bou_,F__,I__,E__,L__,D__,bou_,R__,n1_,n1_,n0_,EOM_};
static const u8 vanish_f_menu61[] = {F__,V__,bou_,S__,U__,P__,P__,O__,R__,T__,bou_,n0_,n2_,bou_,F__,I__,E__,L__,D__,bou_,R__,n1_,n1_,n9_,EOM_};
static const u8 vanish_f_menu62[] = {F__,V__,bou_,S__,U__,P__,P__,O__,R__,T__,bou_,n0_,n2_,bou_,F__,I__,E__,L__,D__,bou_,T__,n1_,n0_,n4_,EOM_};

static const MENU_ITEM	FlagVanish6MenuList[] =
{
	{ vanish_f_menu54,MenuDummy},
	{ vanish_f_menu55,MenuDummy},
	{ vanish_f_menu56,MenuDummy},
	{ vanish_f_menu57,MenuDummy},
	{ vanish_f_menu58,MenuDummy},
	{ vanish_f_menu59,MenuDummy},
	{ vanish_f_menu60,MenuDummy},
	{ vanish_f_menu61,MenuDummy},
	{ vanish_f_menu62,MenuDummy}
};

static const u8 vanish_f_menu63[] = {F__,V__,bou_,H__,A__,G__,I__,bou_,n0_,n1_,bou_,F__,I__,E__,L__,D__,bou_,R__,n1_,n0_,n4_,EOM_};
static const u8 vanish_f_menu64[] = {F__,V__,bou_,H__,A__,G__,I__,bou_,n0_,n1_,bou_,R__,n1_,n0_,n4_,bou_,R__,n0_,n1_,n0_,n1_,EOM_};
static const u8 vanish_f_menu65[] = {F__,V__,bou_,H__,A__,G__,I__,bou_,n0_,n1_,bou_,F__,I__,E__,L__,D__,bou_,T__,n1_,n0_,n3_,EOM_};
static const u8 vanish_f_menu66[] = {F__,V__,bou_,H__,A__,G__,I__,bou_,n0_,n1_,bou_,F__,I__,E__,L__,D__,bou_,R__,n1_,n0_,n9_,EOM_};
static const u8 vanish_f_menu67[] = {F__,V__,bou_,H__,A__,G__,I__,bou_,n0_,n1_,bou_,C__,n1_,n0_,n2_,bou_,R__,n0_,n6_,n0_,n1_,EOM_};
static const u8 vanish_f_menu68[] = {F__,V__,bou_,H__,A__,G__,I__,bou_,n0_,n1_,bou_,C__,n1_,n0_,n2_,bou_,R__,n0_,n1_,n0_,n1_,EOM_};
static const u8 vanish_f_menu69[] = {F__,V__,bou_,H__,A__,G__,I__,bou_,n0_,n1_,bou_,C__,A__,V__,E__,bou_,D__,n0_,n2_,n0_,n1_,EOM_};
static const u8 vanish_f_menu70[] = {F__,V__,bou_,H__,A__,G__,I__,bou_,n0_,n1_,bou_,F__,I__,E__,L__,D__,bou_,R__,n1_,n1_,n6_,EOM_};
static const u8 vanish_f_menu71[] = {F__,V__,bou_,H__,A__,G__,I__,bou_,n0_,n1_,bou_,S__,P__,bou_,S__,H__,I__,P__,n0_,n1_,EOM_};

static const MENU_ITEM	FlagVanish7MenuList[] =
{
	{ vanish_f_menu63,MenuDummy},
	{ vanish_f_menu64,MenuDummy},
	{ vanish_f_menu65,MenuDummy},
	{ vanish_f_menu66,MenuDummy},
	{ vanish_f_menu67,MenuDummy},
	{ vanish_f_menu68,MenuDummy},
	{ vanish_f_menu69,MenuDummy},
	{ vanish_f_menu70,MenuDummy},
	{ vanish_f_menu71,MenuDummy}
};

static const u8 vanish_f_menu72[] = {F__,V__,bou_,S__,U__,P__,P__,O__,R__,T__,bou_,n0_,n1_,bou_,T__,n1_,n0_,n1_,bou_,R__,n0_,n3_,n0_,n1_,EOM_};
static const u8 vanish_f_menu73[] = {F__,V__,bou_,S__,U__,P__,P__,O__,R__,T__,bou_,n0_,n1_,bou_,C__,n1_,n0_,n9_,bou_,R__,n0_,n1_,n0_,n5_,EOM_};
static const u8 vanish_f_menu74[] = {F__,V__,bou_,S__,U__,P__,P__,O__,R__,T__,bou_,n0_,n1_,bou_,F__,I__,E__,L__,D__,bou_,C__,n1_,n0_,n4_,EOM_};
static const u8 vanish_f_menu75[] = {F__,V__,bou_,S__,U__,P__,P__,O__,R__,T__,bou_,n0_,n1_,bou_,F__,I__,E__,L__,D__,bou_,C__,n1_,n0_,n6_,EOM_};
static const u8 vanish_f_menu76[] = {F__,V__,bou_,S__,U__,P__,P__,O__,R__,T__,bou_,n0_,n1_,bou_,F__,I__,E__,L__,D__,bou_,R__,n1_,n0_,n3_,EOM_};
static const u8 vanish_f_menu77[] = {F__,V__,bou_,S__,U__,P__,P__,O__,R__,T__,bou_,n0_,n1_,bou_,F__,I__,E__,L__,D__,bou_,R__,n1_,n1_,n0_,EOM_};
static const u8 vanish_f_menu78[] = {F__,V__,bou_,S__,U__,P__,P__,O__,R__,T__,bou_,n0_,n1_,bou_,F__,I__,E__,L__,D__,bou_,R__,n1_,n1_,n9_,EOM_};
static const u8 vanish_f_menu79[] = {F__,V__,bou_,S__,U__,P__,P__,O__,R__,T__,bou_,n0_,n1_,bou_,F__,I__,E__,L__,D__,bou_,T__,n1_,n0_,n4_,EOM_};
static const u8 vanish_f_menu80[] = {F__,V__,bou_,S__,U__,P__,P__,O__,R__,T__,bou_,n0_,n1_,bou_,F__,I__,E__,L__,D__,bou_,T__,n1_,n0_,n2_,EOM_};

static const MENU_ITEM	FlagVanish8MenuList[] =
{
	{ vanish_f_menu72,MenuDummy},
	{ vanish_f_menu73,MenuDummy},
	{ vanish_f_menu74,MenuDummy},
	{ vanish_f_menu75,MenuDummy},
	{ vanish_f_menu76,MenuDummy},
	{ vanish_f_menu77,MenuDummy},
	{ vanish_f_menu78,MenuDummy},
	{ vanish_f_menu79,MenuDummy},
	{ vanish_f_menu80,MenuDummy}
};

static const u8 FlagVanishMaxTbl[VANISH_FLAG_MENU_MAX] = {
	VANISH_FLAG0_MENU_MAX, VANISH_FLAG1_MENU_MAX, VANISH_FLAG2_MENU_MAX, VANISH_FLAG3_MENU_MAX, VANISH_FLAG4_MENU_MAX,
	VANISH_FLAG5_MENU_MAX, VANISH_FLAG6_MENU_MAX, VANISH_FLAG7_MENU_MAX, VANISH_FLAG8_MENU_MAX
};

static const u16 FlagVanishHeader[VANISH_FLAG_MENU_MAX][9] = {
 {
	FV_KAKUREONB_01_FIELD_R120, FV_KAKURE_01_FIELD_R120, FV_KAKURE_02_FIELD_R120, FV_KAKURE_03_FIELD_R120, FV_KAKURE_04_FIELD_R120,
	FV_KAKURE_05_FIELD_R120, FV_KAKURE_06_FIELD_R120, FV_KAKURE_01_FIELD_R119, FV_KAKURE_02_FIELD_R119
 },
 {
	FV_BALL_01_C107_R0501, FV_WORKERM1_04_FIELD_C104, FV_SUBMARINE_06_CAVE_D1101, FV_GUEST_ALL_C106_R0102, FV_HORIDASI_01_C106_R1106,
	FV_MIDDLEM1_01_R110_R0101, FV_FUNE_01_C102_R0601, FV_SUPPORTW_01_T101_R0202, FV_SUPPORTM_01_T101_R0102
 },
 {
	FV_ODAMAKI_01_FIELD_R101, FV_ODAMAKI_01_T101_R0301, FV_ODAMAKI_HYOUKA_T101_R0301, FV_ODAMAKI_HYOUKA_FIELD_R101,
	FV_ODAMAKI_HYOUKA_FIELD_R103, FV_ODAMAKI_01_C109_R0105, FV_FIGHTER1_01_CAVE_D0201, FV_FIGHTER1_01_T106_R0201, FV_FIGHTER1_01_FIELD_R116
 },
 {
	FV_MITSURU_01_FIELD_C101, FV_MITSURU_02_CAVE_D1301, FV_MITSURU_01_FIELD_C103, FV_MITSURU_01_T106_R0201, FV_MITSURU_01_CAVE_D1301,
	FV_MITSURU_01_C101_R0201, FV_MITSURU_01_FIELD_R102, FV_TENKI_01_R119_R0101 ,FV_TENKI_01_R119_R0102
 },
 {
	FV_DAIGO_01_CAVE_D0504, FV_DAIGO_01_FIELD_R128, FV_DAIGO_01_FIELD_R118, FV_DAIGO_01_C107_R0501, FV_DAIGO_01_FIELD_R120,
	FV_DAIGO_01_FIELD_C108, 0, 0, 0
 },
 {
	FV_POKE1_02_CAVE_D1111, FV_POKE1_01_CAVE_D0601, FV_POKE1_02_CAVE_D0601, FV_POKE1_01_FIELD_R101, FV_POKE1_01_OPENING_ROOM01,
	FV_POKE1_02_OPENING_ROOM01, FV_POKE1_01_CAVE_D2308, FV_POKEMON_01_CAVE_D0201, FV_POKEMON_01_R104_R0101
 },
 {
	FV_MAMA_01_FIELD_T101, FV_MAMA_01_OPENING_ROOM02, FV_MAMA_01_T101_R0101, FV_MAMA_01_T101_R0201, FV_MAMA_02_T101_R0101,
	FV_MAMA_02_T101_R0201, FV_SUPPORT_02_FIELD_R110, FV_SUPPORT_02_FIELD_R119, FV_SUPPORT_02_FIELD_T104
 },
 {
	FV_HAGI_01_FIELD_R104, FV_HAGI_01_R104_R0101, FV_HAGI_01_FIELD_T103, FV_HAGI_01_FIELD_R109, FV_HAGI_01_C102_R0601,
	FV_HAGI_01_C102_R0101, FV_HAGI_01_CAVE_D0201, FV_HAGI_01_FIELD_R116, FV_HAGI_01_SP_SHIP01

 },
 {
	FV_SUPPORT_01_T101_R0301, FV_SUPPORT_01_C109_R0105, FV_SUPPORT_01_FIELD_C104, FV_SUPPORT_01_FIELD_C106, FV_SUPPORT_01_FIELD_R103,
	FV_SUPPORT_01_FIELD_R110, FV_SUPPORT_01_FIELD_R119, FV_SUPPORT_01_FIELD_T104, FV_SUPPORT_01_FIELD_T102
 }
};


/*----------------------------------------------------------------------------------*/
/*----------------------------------------------------------------------------------*/

static const u8 event_menu0[] = {F__,E__,hi_,de_,n_,wa_,za_,sura_,DE_,BO_,N_,ka_,n_,re_,n_,EOM_};
static const u8 event_menu1[] = {F__,E__,da_,i_,zi_,na_,A_,I_,TE_,MU_,P__,A__,R__,T__,n1_,EOM_};
static const u8 event_menu2[] = {so_,no_,ta_,n1_,EOM_};
static const u8 event_menu3[] = {M__,I__,T__,S__,U__,R__,U__,sura_,D__,O__,O__,R__,EOM_};
static const u8 event_menu4[] = {KA_,RA_,KU_,RI_,ya_,si_,ki_,n1_,n0_,no_,ya_,zi_,ru_,si_,sura_,G__,Y__,M__,n0_,n7_,EOM_};
static const u8 event_menu5[] = {S__,U__,P__,P__,O__,R__,T__,sura_,so_,no_,ta_,n4_,EOM_};
static const u8 event_menu6[] = {D__,A__,I__,S__,U__,K__,I__,sura_,so_,no_,ta_,n5_,EOM_};
static const u8 event_menu7[] = {so_,no_,ta_,n2_,EOM_};
static const u8 event_menu8[] = {so_,no_,ta_,n6_,EOM_};

static const MENU_ITEM	EventFlagMenuList[] =
{
	{ event_menu0,event_flag_menu_0_blt },
	{ event_menu1,event_flag_menu_1_blt },
	{ event_menu2,event_flag_menu_2_blt },
	{ event_menu3,event_flag_menu_3_blt },
	{ event_menu4,event_flag_menu_4_blt },
	{ event_menu5,event_flag_menu_5_blt },
	{ event_menu6,event_flag_menu_6_blt },
	{ event_menu7,event_flag_menu_7_blt },
	{ event_menu8,event_flag_menu_8_blt }
};

static const u8 event_flag_menu0[] = {F__,E__,bou_,H__,W__,A__,Z__,A__,n0_,n1_,bou_,G__,E__,T__,EOM_};
static const u8 event_flag_menu1[] = {F__,E__,bou_,H__,W__,A__,Z__,A__,n0_,n2_,bou_,n0_,n1_,bou_,F__,I__,E__,L__,D__,R__,n1_,n1_,n9_,EOM_};
static const u8 event_flag_menu2[] = {F__,E__,bou_,H__,W__,A__,Z__,A__,n0_,n3_,bou_,G__,E__,T__,EOM_};
static const u8 event_flag_menu3[] = {F__,E__,bou_,H__,W__,A__,Z__,A__,n0_,n4_,bou_,n0_,n1_,bou_,T__,n1_,n0_,n6_,bou_,R__,n0_,n2_,n0_,n1_,EOM_};
static const u8 event_flag_menu4[] = {F__,E__,bou_,H__,W__,A__,Z__,A__,n0_,n5_,bou_,n0_,n1_,bou_,C__,A__,V__,E__,bou_,D__,n0_,n5_,n0_,n2_,EOM_};
static const u8 event_flag_menu5[] = {F__,E__,bou_,H__,W__,A__,Z__,A__,n0_,n4_,bou_,n0_,n1_,bou_,C__,n1_,n0_,n3_,bou_,R__,n0_,n3_,n0_,n1_,EOM_};
static const u8 event_flag_menu6[] = {F__,E__,bou_,D__,E__,B__,O__,N__,bou_,N__,I__,M__,O__,T__,S__,U__,bou_,R__,E__,T__,U__,R__,N__,EOM_};
static const u8 event_flag_menu7[] = {F__,E__,bou_,D__,E__,B__,O__,N__,bou_,n0_,n1_,bou_,F__,I__,E__,L__,D__,bou_,C__,n1_,n0_,n4_,EOM_};
static const u8 event_flag_menu8[] = {F__,E__,bou_,D__,E__,B__,O__,N__,bou_,n0_,n2_,bou_,F__,I__,E__,L__,D__,bou_,C__,n1_,n0_,n4_,EOM_};

static const MENU_ITEM	EventFlag0MenuList[] =
{
	{ event_flag_menu0,MenuDummy},
	{ event_flag_menu1,MenuDummy},
	{ event_flag_menu2,MenuDummy},
	{ event_flag_menu3,MenuDummy},
	{ event_flag_menu4,MenuDummy},
	{ event_flag_menu5,MenuDummy},
	{ event_flag_menu6,MenuDummy},
	{ event_flag_menu7,MenuDummy},
	{ event_flag_menu8,MenuDummy},
};

static const u8 event_flag_menu9[] = {F__,E__,bou_,C__,Y__,C__,L__,E__,bou_,n0_,n1_,bou_,P__,n0_,n1_,bou_,P__,n0_,n1_,bou_,C__,n1_,n0_,n3_,bou_,R__,n0_,n2_,n0_,n1_,EOM_};
static const u8 event_flag_menu10[] = {F__,E__,bou_,S__,C__,O__,O__,P__,bou_,n0_,n1_,bou_,P__,n0_,n1_,bou_,F__,I__,E__,L__,D__,bou_,R__,n1_,n1_,n5_,EOM_};
static const u8 event_flag_menu11[] = {F__,E__,bou_,R__,O__,P__,E__,bou_,n0_,n1_,bou_,P__,n0_,n1_,bou_,F__,I__,E__,L__,D__,bou_,R__,n1_,n1_,n4_,EOM_};
static const u8 event_flag_menu12[] = {F__,E__,bou_,K__,A__,M__,A__,bou_,n0_,n1_,bou_,P__,n0_,n1_,bou_,F__,I__,E__,L__,D__,bou_,R__,n1_,n1_,n9_,EOM_};
static const u8 event_flag_menu13[] = {F__,E__,bou_,Z__,Y__,O__,U__,R__,O__,bou_,G__,E__,T__,EOM_};
static const u8 event_flag_menu14[] = {F__,E__,bou_,C__,U__,B__,E__,C__,A__,S__,E__,bou_,G__,E__,T__,EOM_};
static const u8 event_flag_menu15[] = {F__,E__,bou_,B__,O__,R__,O__,N__,O__,T__,U__,R__,I__,Z__,A__,O__,bou_,G__,E__,T__,EOM_};
static const u8 event_flag_menu16[] = {F__,E__,bou_,I__,I__,T__,U__,R__,I__,Z__,A__,O__,bou_,G__,E__,T__,EOM_};
static const u8 event_flag_menu17[] = {F__,E__,bou_,S__,U__,G__,O__,I__,T__,U__,R__,I__,Z__,A__,O__,bou_,G__,E__,T__,EOM_};

static const MENU_ITEM	EventFlag1MenuList[] =
{
	{ event_flag_menu9,MenuDummy},
	{ event_flag_menu10,MenuDummy},
	{ event_flag_menu11,MenuDummy},
	{ event_flag_menu12,MenuDummy},
	{ event_flag_menu13,MenuDummy},
	{ event_flag_menu14,MenuDummy},
	{ event_flag_menu15,MenuDummy},
	{ event_flag_menu16,MenuDummy},
	{ event_flag_menu17,MenuDummy},
};

static const u8 event_flag_menu18[] = {F__,E__,bou_,B__,O__,S__,S__,bou_,n0_,n1_,bou_,C__,A__,V__,E__,bou_,D__,n0_,n7_,n0_,n1_,EOM_};
static const u8 event_flag_menu19[] = {F__,E__,bou_,T__,A__,N__,T__,I__,K__,I__,bou_,R__,E__,T__,U__,R__,N__,EOM_};
static const u8 event_flag_menu20[] = {F__,E__,bou_,P__,O__,K__,E__,n1_,bou_,n0_,n1_,bou_,C__,A__,V__,E__,bou_,D__,n1_,n1_,n1_,n1_,EOM_};
static const u8 event_flag_menu21[] = {F__,E__,bou_,P__,O__,K__,E__,n1_,bou_,n0_,n1_,bou_,C__,A__,V__,E__,bou_,D__,n1_,n2_,n0_,n6_,EOM_};
static const u8 event_flag_menu22[] = {F__,E__,bou_,S__,H__,O__,P__,bou_,n0_,n1_,bou_,C__,n1_,n0_,n4_,bou_,F__,S__,n0_,n1_,EOM_};
static const u8 event_flag_menu23[] = {F__,E__,bou_,H__,U__,N__,E__,N__,O__,T__,I__,K__,E__,T__,T__,bou_,G__,E__,T__,EOM_};
static const u8 event_flag_menu24[] = {F__,E__,bou_,K__,A__,K__,U__,R__,E__,bou_,n0_,n1_,bou_,F__,I__,E__,L__,D__,bou_,C__,n1_,n0_,n5_,EOM_};
static const u8 event_flag_menu25[] = {F__,E__,bou_,K__,A__,S__,E__,K__,I__,bou_,R__,E__,T__,U__,R__,N__,EOM_};
static const u8 event_flag_menu26[] = {F__,E__,bou_,W__,I__,N__,bou_,n0_,n1_,bou_,S__,P__,bou_,S__,H__,I__,P__,n0_,n1_,EOM_};

static const MENU_ITEM	EventFlag2MenuList[] =
{
	{ event_flag_menu18,MenuDummy},
	{ event_flag_menu19,MenuDummy},
	{ event_flag_menu20,MenuDummy},
	{ event_flag_menu21,MenuDummy},
	{ event_flag_menu22,MenuDummy},
	{ event_flag_menu23,MenuDummy},
	{ event_flag_menu24,MenuDummy},
	{ event_flag_menu25,MenuDummy},
	{ event_flag_menu26,MenuDummy},
};

static const u8 event_flag_menu27[] = {F__,E__,bou_,M__,I__,T__,S__,U__,R__,U__,bou_,n0_,n1_,bou_,T__,n1_,n0_,n6_,bou_,R__,n0_,n2_,n0_,n1_,EOM_};
static const u8 event_flag_menu28[] = {F__,E__,bou_,M__,I__,T__,S__,U__,R__,U__,bou_,n0_,n1_,bou_,C__,A__,V__,E__,bou_,D__,n1_,n3_,n0_,n1_,EOM_};
static const u8 event_flag_menu29[] = {F__,E__,bou_,M__,I__,T__,S__,U__,R__,U__,bou_,n0_,n2_,bou_,F__,I__,E__,L__,D__,bou_,C__,n1_,n0_,n3_,EOM_};
static const u8 event_flag_menu30[] = {F__,E__,bou_,M__,I__,T__,S__,U__,R__,U__,bou_,n0_,n2_,bou_,T__,n1_,n0_,n6_,bou_,R__,n0_,n2_,n0_,n1_,EOM_};
static const u8 event_flag_menu31[] = {F__,E__,bou_,M__,I__,T__,S__,U__,R__,U__,bou_,n0_,n1_,bou_,F__,I__,E__,L__,D__,bou_,C__,n1_,n0_,n3_,EOM_};
static const u8 event_flag_menu32[] = {F__,E__,bou_,D__,O__,O__,R__,bou_,O__,P__,E__,N__,bou_,n0_,n1_,bou_,C__,A__,V__,E__,bou_,D__,n1_,n7_,n1_,n2_,EOM_};
static const u8 event_flag_menu33[] = {F__,E__,bou_,D__,O__,O__,R__,bou_,O__,P__,E__,N__,bou_,n0_,n2_,bou_,C__,A__,V__,E__,bou_,D__,n1_,n7_,n1_,n2_,EOM_};
static const u8 event_flag_menu34[] = {F__,E__,bou_,D__,O__,O__,R__,bou_,O__,P__,E__,N__,bou_,n0_,n4_,bou_,C__,A__,V__,E__,bou_,D__,n1_,n7_,n1_,n2_,EOM_};
static const u8 event_flag_menu35[] = {F__,E__,bou_,D__,O__,O__,R__,bou_,O__,P__,E__,N__,bou_,n0_,n6_,bou_,C__,A__,V__,E__,bou_,D__,n1_,n7_,n1_,n2_,EOM_};

static const MENU_ITEM	EventFlag3MenuList[] =
{
	{ event_flag_menu27,MenuDummy},
	{ event_flag_menu28,MenuDummy},
	{ event_flag_menu29,MenuDummy},
	{ event_flag_menu30,MenuDummy},
	{ event_flag_menu31,MenuDummy},
	{ event_flag_menu32,MenuDummy},
	{ event_flag_menu33,MenuDummy},
	{ event_flag_menu34,MenuDummy},
	{ event_flag_menu35,MenuDummy}
};

static const u8 event_flag_menu36[] = {F__,E__,bou_,K__,A__,R__,A__,K__,U__,R__,I__,n1_,n0_,bou_,S__,W__,I__,T__,C__,H__,bou_,n0_,n1_,EOM_};
static const u8 event_flag_menu37[] = {F__,E__,bou_,K__,A__,R__,A__,K__,U__,R__,I__,n1_,n0_,bou_,S__,W__,I__,T__,C__,H__,bou_,n0_,n2_,EOM_};
static const u8 event_flag_menu38[] = {F__,E__,bou_,K__,A__,R__,A__,K__,U__,R__,I__,n1_,n0_,bou_,S__,W__,I__,T__,C__,H__,bou_,n0_,n3_,EOM_};
static const u8 event_flag_menu39[] = {F__,E__,bou_,K__,A__,R__,A__,K__,U__,R__,I__,n1_,n0_,bou_,S__,W__,I__,T__,C__,H__,bou_,n0_,n4_,EOM_};
static const u8 event_flag_menu40[] = {F__,E__,bou_,K__,A__,R__,A__,K__,U__,R__,I__,n1_,n0_,bou_,S__,W__,I__,T__,C__,H__,bou_,n0_,n5_,EOM_};
static const u8 event_flag_menu41[] = {F__,E__,bou_,G__,Y__,M__,n0_,n7_,bou_,S__,W__,I__,T__,C__,H__,bou_,n0_,n1_,EOM_};
static const u8 event_flag_menu42[] = {F__,E__,bou_,G__,Y__,M__,n0_,n7_,bou_,S__,W__,I__,T__,C__,H__,bou_,n0_,n2_,EOM_};
static const u8 event_flag_menu43[] = {F__,E__,bou_,G__,Y__,M__,n0_,n7_,bou_,S__,W__,I__,T__,C__,H__,bou_,n0_,n3_,EOM_};
static const u8 event_flag_menu44[] = {F__,E__,bou_,G__,Y__,M__,n0_,n7_,bou_,S__,W__,I__,T__,C__,H__,bou_,n0_,n4_,EOM_};

static const MENU_ITEM	EventFlag4MenuList[] =
{
	{ event_flag_menu36,MenuDummy},
	{ event_flag_menu37,MenuDummy},
	{ event_flag_menu38,MenuDummy},
	{ event_flag_menu39,MenuDummy},
	{ event_flag_menu40,MenuDummy},
	{ event_flag_menu41,MenuDummy},
	{ event_flag_menu42,MenuDummy},
	{ event_flag_menu43,MenuDummy},
	{ event_flag_menu44,MenuDummy}
};

static const u8 event_flag_menu45[] = {F__,E__,bou_,S__,U__,P__,P__,O__,R__,T__,bou_,n0_,n1_,bou_,F__,I__,E__,L__,D__,bou_,R__,n1_,n0_,n3_,EOM_};
static const u8 event_flag_menu46[] = {F__,E__,bou_,S__,U__,P__,P__,O__,R__,T__,bou_,n0_,n1_,bou_,F__,I__,E__,L__,D__,bou_,C__,n1_,n0_,n6_,EOM_};
static const u8 event_flag_menu47[] = {F__,E__,bou_,S__,U__,P__,P__,O__,R__,T__,bou_,n0_,n1_,bou_,F__,I__,E__,L__,D__,bou_,R__,n1_,n0_,n4_,EOM_};
static const u8 event_flag_menu48[] = {F__,E__,bou_,S__,U__,P__,P__,O__,R__,T__,bou_,n0_,n2_,bou_,F__,I__,E__,L__,D__,bou_,C__,n1_,n0_,n6_,EOM_};
static const u8 event_flag_menu49[] = {F__,E__,bou_,S__,U__,P__,P__,O__,R__,T__,bou_,n0_,n1_,bou_,T__,n1_,n0_,n1_,bou_,R__,n0_,n2_,n0_,n2_,EOM_};

static const u8 event_flag_menu50[] = {F__,E__,bou_,M__,A__,M__,A__,bou_,n0_,n1_,bou_,P__,n0_,n1_,bou_,T__,n1_,n0_,n1_,bou_,R__,n0_,n1_,n0_,n1_,EOM_};
static const u8 event_flag_menu51[] = {F__,E__,bou_,C__,L__,O__,C__,K__,bou_,S__,E__,T__,EOM_};
static const u8 event_flag_menu52[] = {F__,E__,bou_,O__,D__,A__,M__,A__,K__,I__,bou_,n0_,n1_,bou_,P__,n0_,n1_,bou_,T__,n1_,n0_,n1_,bou_,R__,n0_,n3_,EOM_};
static const u8 event_flag_menu53[] = {F__,E__,bou_,P__,A__,P__,A__,bou_,n0_,n1_,bou_,P__,n0_,n1_,bou_,C__,n1_,n0_,n1_,bou_,R__,n0_,n2_,n0_,n1_,EOM_};

static const MENU_ITEM	EventFlag5MenuList[] =
{
	{ event_flag_menu45,MenuDummy},
	{ event_flag_menu46,MenuDummy},
	{ event_flag_menu47,MenuDummy},
	{ event_flag_menu48,MenuDummy},
	{ event_flag_menu49,MenuDummy},
	{ event_flag_menu50,MenuDummy},
	{ event_flag_menu51,MenuDummy},
	{ event_flag_menu52,MenuDummy},
	{ event_flag_menu53,MenuDummy},
};

static const u8 event_flag_menu54[] = {F__,E__,bou_,D__,A__,I__,S__,U__,K__,I__,bou_,G__,O__,O__,D__,S__,bou_,F__,L__,A__,G__,n0_,n1_,EOM_};
static const u8 event_flag_menu55[] = {F__,E__,bou_,D__,A__,I__,S__,U__,K__,I__,bou_,G__,O__,O__,D__,S__,bou_,F__,L__,A__,G__,n0_,n2_,EOM_};
static const u8 event_flag_menu56[] = {F__,E__,bou_,D__,A__,I__,S__,U__,K__,I__,bou_,G__,O__,O__,D__,S__,bou_,F__,L__,A__,G__,n0_,n3_,EOM_};
static const u8 event_flag_menu57[] = {F__,E__,bou_,D__,A__,I__,S__,U__,K__,I__,bou_,G__,O__,O__,D__,S__,bou_,F__,L__,A__,G__,n0_,n4_,EOM_};
static const u8 event_flag_menu58[] = {F__,E__,bou_,D__,A__,I__,S__,U__,K__,I__,bou_,G__,O__,O__,D__,S__,bou_,F__,L__,A__,G__,n0_,n5_,EOM_};
static const u8 event_flag_menu59[] = {F__,E__,bou_,B__,A__,S__,H__,A__,bou_,n0_,n1_,bou_,P__,n0_,n1_,bou_,F__,I__,E__,L__,D__,bou_,C__,n1_,n0_,n1_,bou_,EOM_};
static const u8 event_flag_menu60[] = {F__,E__,bou_,B__,A__,S__,H__,A__,bou_,n0_,n1_,bou_,P__,n0_,n2_,bou_,F__,I__,E__,L__,D__,bou_,C__,n1_,n0_,n1_,bou_,EOM_};
static const u8 event_flag_menu61[] = {F__,E__,bou_,B__,A__,L__,L__,bou_,n0_,n1_,bou_,P__,n0_,n1_,bou_,S__,P__,bou_,C__,O__,N__,T__,E__,S__,T__,EOM_};
static const u8 event_flag_menu62[] = {F__,E__,bou_,W__,O__,M__,A__,N__,n2_,bou_,n0_,n1_,bou_,P__,n0_,n1_,bou_,T__,n1_,n0_,n1_,bou_,R__,n0_,n2_,n0_,n1_,EOM_};

static const MENU_ITEM	EventFlag6MenuList[] =
{
	{ event_flag_menu54,MenuDummy},
	{ event_flag_menu55,MenuDummy},
	{ event_flag_menu56,MenuDummy},
	{ event_flag_menu57,MenuDummy},
	{ event_flag_menu58,MenuDummy},
	{ event_flag_menu59,MenuDummy},
	{ event_flag_menu60,MenuDummy},
	{ event_flag_menu61,MenuDummy},
	{ event_flag_menu62,MenuDummy},
};

static const u8 event_flag_menu63[] = {F__,E__,bou_,S__,O__,U__,K__,O__,bou_,O__,P__,E__,N__,bou_,C__,A__,V__,E__,bou_,D__,n1_,n7_,n0_,n4_,EOM_};
static const u8 event_flag_menu64[] = {F__,E__,bou_,S__,O__,R__,A__,I__,S__,I__,bou_,n0_,n1_,bou_,C__,A__,V__,E__,bou_,D__,n0_,n1_,n0_,n1_,EOM_};
static const u8 event_flag_menu65[] = {F__,E__,bou_,M__,A__,Y__,U__,M__,I__,bou_,n0_,n1_,bou_,bou_,R__,n1_,n1_,n4_,bou_,R__,n0_,n2_,n0_,n1_,EOM_};
static const u8 event_flag_menu66[] = {F__,E__,bou_,K__,U__,S__,U__,N__,O__,K__,I__,bou_,n0_,n1_,bou_,C__,n1_,n0_,n2_,bou_,R__,n0_,n6_,n0_,n1_,EOM_};
static const u8 event_flag_menu67[] = {F__,E__,bou_,O__,L__,D__,W__,O__,M__,A__,N__,n1_,bou_,n0_,n1_,bou_,C__,A__,V__,E__,bou_,D__,n0_,n8_,n0_,n8_,EOM_};
static const u8 event_flag_menu68[] = {F__,E__,bou_,T__,R__,A__,I__,N__,E__,R__,M__,n1_,bou_,n0_,n1_,bou_,C__,n1_,n0_,n9_,bou_,R__,n0_,n2_,n0_,n6_,EOM_};
static const u8 event_flag_menu69[] = {F__,E__,bou_,S__,O__,O__,N__,A__,N__,O__,bou_,T__,A__,M__,A__,G__,O__,bou_,G__,E__,T__,EOM_};
static const u8 event_flag_menu70[] = {F__,E__,bou_,D__,A__,S__,H__,bou_,S__,H__,O__,E__,S__,bou_,G__,E__,T__,EOM_};
static const u8 event_flag_menu71[] = {F__,E__,bou_,D__,E__,B__,O__,N__,S__,U__,K__,O__,O__,P__,U__,bou_,G__,E__,T__,EOM_};

static const MENU_ITEM	EventFlag7MenuList[] =
{
	{ event_flag_menu63,MenuDummy},
	{ event_flag_menu64,MenuDummy},
	{ event_flag_menu65,MenuDummy},
	{ event_flag_menu66,MenuDummy},
	{ event_flag_menu67,MenuDummy},
	{ event_flag_menu68,MenuDummy},
	{ event_flag_menu69,MenuDummy},
	{ event_flag_menu70,MenuDummy},
	{ event_flag_menu71,MenuDummy},
};

static const u8 event_flag_menu72[] = {F__,E__,bou_,S__,T__,U__,D__,Y__,M__,n1_,bou_,n0_,n1_,bou_,P__,n0_,n1_,bou_,T__,n1_,n0_,n1_,R__,n0_,n3_,n0_,n1_,EOM_};
static const u8 event_flag_menu73[] = {F__,E__,bou_,W__,O__,R__,K__,E__,R__,M__,n1_,bou_,n0_,n1_,bou_,C__,n1_,n0_,n3_,bou_,R__,n0_,n2_,n0_,n1_,EOM_};
static const u8 event_flag_menu74[] = {F__,E__,bou_,H__,I__,M__,I__,T__,S__,U__,bou_,G__,E__,T__,EOM_};
static const u8 event_flag_menu75[] = {EOM_};
static const u8 event_flag_menu76[] = {EOM_};
static const u8 event_flag_menu77[] = {EOM_};
static const u8 event_flag_menu78[] = {EOM_};
static const u8 event_flag_menu79[] = {EOM_};
static const u8 event_flag_menu80[] = {EOM_};

static const MENU_ITEM	EventFlag8MenuList[] =
{
	{ event_flag_menu72,MenuDummy},
	{ event_flag_menu73,MenuDummy},
	{ event_flag_menu74,MenuDummy},
	{ event_flag_menu75,MenuDummy},
	{ event_flag_menu76,MenuDummy},
	{ event_flag_menu77,MenuDummy},
	{ event_flag_menu78,MenuDummy},
	{ event_flag_menu79,MenuDummy},
	{ event_flag_menu80,MenuDummy},
};

static const u8 EventFlagMaxTbl[EVENT_FLAG_MENU_MAX] = {
	EVENT_FLAG0_MENU_MAX, EVENT_FLAG1_MENU_MAX, EVENT_FLAG2_MENU_MAX, EVENT_FLAG3_MENU_MAX, EVENT_FLAG4_MENU_MAX,
	EVENT_FLAG5_MENU_MAX, EVENT_FLAG6_MENU_MAX, EVENT_FLAG7_MENU_MAX, EVENT_FLAG8_MENU_MAX
};

static const u16 EventFlagHeader[EVENT_FLAG_MENU_MAX][9] = {
 {
	FE_HWAZA01_GET, FE_HWAZA02_01_FIELD_R119, FE_HWAZA03_GET, FE_HWAZA04_01_T106_R0201, FE_HWAZA05_01_CAVE_D0502,
	FE_HWAZA06_01_C103_R0301, FE_DEBON_NIMOTSU_RETURN, FE_DEBON_01_FIELD_C104, FE_DEBON_02_FIELD_C104
 },
 {
	FE_CYCLE_01_P01_C103_R0201, FE_SCOOP_01_P01_FIELD_R115, FE_ROPE_01_P01_FIELD_R114, FE_KAMA_01_P01_FIELD_R119, FE_ZYOURO_GET,
	FE_CUBECASE_GET, FE_BORONOTURIZAO_GET, FE_IITURIZAO_GET, FE_SUGOITURIZAO_GET
 },
 {
	FE_BOSS_01_CAVE_D0701, FE_TANTIKI_RETURN, FE_POKE1_01_CAVE_D1111, FE_POKE1_01_CAVE_D1206, FE_SHOP_01_C104_FS01,
	FE_HUNENOTIKETTO_GET, FE_KAKURE_01_FIELD_C105, FE_KASEKI_RETURN, FE_WIN_01_SP_SHIP01
 },
 {
	FE_MITSURU_01_T106_R0201, FE_MITSURU_01_CAVE_D1301, FE_MITSURU_02_FIELD_C103, FE_MITSURU_02_T106_R0201, FE_MITSURU_01_FIELD_C103,
	FE_DOOR_OPEN_01_CAVE_D1712, FE_DOOR_OPEN_02_CAVE_D1712, FE_DOOR_OPEN_04_CAVE_D1712, FE_DOOR_OPEN_06_CAVE_D1712
 },
 {
	FE_KARAKURI10_SWITCH_01, FE_KARAKURI10_SWITCH_02, FE_KARAKURI10_SWITCH_03, FE_KARAKURI10_SWITCH_04, FE_KARAKURI10_SWITCH_05,
	FE_GYM07_SWITCH_01, FE_GYM07_SWITCH_02, FE_GYM07_SWITCH_03, FE_GYM07_SWITCH_04
 },
 {
	FE_SUPPORT_01_FIELD_R103, FE_SUPPORT_01_FIELD_C106, FE_SUPPORT_01_FIELD_C104, FE_SUPPORT_02_FIELD_C106, FE_SUPPORT_01_T101_R0202,
	FE_MAMA_01_P01_T101_R0101, FE_CLOCK_SET, FE_ODAMAKI_01_P01_T101_R0301, FE_PAPA_01_P01_C101_R0201
 },
 {
	FE_DAISUKI_GOODS_FLAG01, FE_DAISUKI_GOODS_FLAG02, FE_DAISUKI_GOODS_FLAG03, FE_DAISUKI_GOODS_FLAG04, FE_DAISUKI_GOODS_FLAG05,
	FE_BASHA_01_P01_FIELD_C101, FE_BASHA_01_P02_FIELD_C101, FE_BALL_01_P01_SP_CONTEST, FE_WOMAN2_01_P01_T101_R0201
 },
 {
	FE_SOUKO_OPEN_CAVE_D1704, FE_SORAISI_01_CAVE_D0101, FE_MAYUMI_01_R114_R0201, FE_KUSUNOKI_01_C102_R0601, FE_OLDWOMAN1_01_CAVE_D0808,
	FE_TRAINERM1_01_C109_R0206, FE_SOONANO_TAMAGO_GET, FE_DASH_SHOES_GET, FE_DEBONSUKOOPU_GET
 },
 {
	FE_STUDYM1_01_P01_T101_R0301, FE_WORKERM1_01_C103_R0201,FE_HIMITSU_GET,0,0,
	0,0,0,0
 }
};

/*----------------------------------------------------------------------------------*/
/*----------------------------------------------------------------------------------*/
static const u8 sysw_menu0[] = {C__,Y__,C__,L__,E__,ka_,n_,re_,n_,EOM_};
static const u8 sysw_menu1[] = {o_,o_,ki_,sa_,ku_,ra_,be_,EOM_};
static const u8 sysw_menu2[] = {KA_,U_,N_,TA_,EOM_};
static const u8 sysw_menu3[] = {so_,no_,ta_,n1_,EOM_};
static const u8 sysw_menu4[] = {so_,no_,ta_,n2_,EOM_};

static const MENU_ITEM	SysWorkMenuList[] =
{
	{ sysw_menu0,sys_work_menu_0_blt },
	{ sysw_menu1,sys_work_menu_1_blt },
	{ sysw_menu2,sys_work_menu_2_blt },
	{ sysw_menu3,sys_work_menu_3_blt },
	{ sysw_menu4,sys_work_menu_4_blt },
};

static const u8 sys_work_menu0[] = {W__,K__,bou_,C__,Y__,C__,L__,E__,bou_,R__,O__,A__,D__,bou_,H__,I__,T__,EOM_};
static const u8 sys_work_menu1[] = {W__,K__,bou_,C__,Y__,C__,L__,E__,bou_,R__,O__,A__,D__,bou_,T__,I__,M__,E_,n1_,EOM_};
static const u8 sys_work_menu2[] = {W__,K__,bou_,C__,Y__,C__,L__,E__,bou_,R__,O__,A__,D__,bou_,T__,I__,M__,E_,n2_,EOM_};

static const u8 sys_work_menu9[] = {W__,K__,bou_,S__,I__,Z__,E__,bou_,K__,I__,N__,O__,K__,O__,K__,O__,bou_,O__,Y__,A__,J__,I__,EOM_};
static const u8 sys_work_menu10[]= {W__,K__,bou_,S__,I__,Z__,E__,bou_,N__,A__,M__,A__,Z__,O__,bou_,O__,Y__,A__,J__,I__,EOM_};

static const u8 sys_work_menu18[]= {W__,K__,bou_,S__,P__,R__,A__,Y__,bou_,C__,O__,U__,N__,T__,EOM_};
static const u8 sys_work_menu19[]= {W__,K__,bou_,I__,C__,E__,bou_,C__,O__,U__,N__,T__,EOM_};
static const u8 sys_work_menu20[]= {W__,K__,bou_,A__,S__,H__,bou_,G__,A__,T__,H__,E__,R__,bou_,C__,O__,U__,N__,T__,EOM_};
static const u8 sys_work_menu21[]= {W__,K__,bou_,C__,R__,U__,I__,S__,E__,bou_,C__,O__,U__,N__,T__,EOM_};
static const u8 sys_work_menu22[]= {W__,K__,bou_,F__,R__,I__,E__,N__,D__,L__,Y__,bou_,S__,T__,E__,P__,bou_,C__,O__,U__,N__,T__,EOM_};
static const u8 sys_work_menu23[]= {W__,K__,bou_,P__,O__,I__,S__,O__,N__,bou_,S__,T__,E__,P__,bou_,C__,O__,U__,N__,T__,EOM_};

static const u8 sys_work_menu27[]= {W__,K__,R__,E__,C__,Y__,C__,L__,E__,bou_,G__,O__,O__,D__,S__,EOM_};
static const u8 sys_work_menu28[]= {W__,K__,bou_,F__,I__,R__,S__,T__,bou_,P__,O__,K__,E__,EOM_};
static const u8 sys_work_menu29[]= {W__,K__,bou_,M__,A__,B__,O__,R__,O__,S__,I__,R__,N__,D__,bou_,H__,EOM_};
static const u8 sys_work_menu30[]= {W__,K__,bou_,M__,A__,B__,O__,R__,O__,S__,I__,R__,N__,D__,bou_,L__,EOM_};
static const u8 sys_work_menu31[]= {E__,V__,bou_,O__,N__,E__,bou_,D__,A__,Y__,bou_,W__,O__,R__,K__,EOM_};
static const u8 sys_work_menu32[]= {E__,V__,bou_,F__,A__,N__,W__,O__,R__,K__,EOM_};
static const u8 sys_work_menu33[]= {E__,V__,bou_,F__,A__,N__,T__,I__,M__,E__,EOM_};
static const u8 sys_work_menu34[]= {W__,K__,bou_,K__,A__,R__,A__,K__,U__,R__,I__,bou_,L__,E__,V__,E__,L__,EOM_};
static const u8 sys_work_menu35[]= {W__,K__,bou_,P__,O__,K__,E__,L__,O__,T__,bou_,P__,R__,I__,Z__,E__,EOM_};

static const u8 sys_work_menu36[]= {W__,K__,bou_,S__,P__,E__,C__,I__,A__,L__,bou_,Z__,U__,K__,N__,EOM_};
static const u8 sys_work_menu37[]= {W__,K__,bou_,H__,Y__,O__,U__,K__,A__,bou_,D__,A__,Y__,S__,EOM_};
static const u8 sys_work_menu38[]= {W__,K__,bou_,P__,O__,K__,E__,L__,O__,T__,bou_,R__,N__,D__,n1_,EOM_};
static const u8 sys_work_menu39[]= {W__,K__,bou_,P__,O__,K__,E__,L__,O__,T__,bou_,R__,N__,D__,n2_,EOM_};
static const u8 sys_work_menu40[]= {W__,K__,bou_,B__,A__,S__,E__,bou_,M__,A__,P__,N__,O__,EOM_};


static const MENU_ITEM	SysWork0MenuList[] =
{
	{ sys_work_menu0,MenuDummy},
	{ sys_work_menu1,MenuDummy},
	{ sys_work_menu2,MenuDummy}
};

static const MENU_ITEM SysWork1MenuList[] =
{
	{ sys_work_menu9,MenuDummy},
	{ sys_work_menu10,MenuDummy}
};

static const MENU_ITEM	SysWork2MenuList[] =
{
	{ sys_work_menu18,MenuDummy},
	{ sys_work_menu19,MenuDummy},
	{ sys_work_menu20,MenuDummy},
	{ sys_work_menu21,MenuDummy},
	{ sys_work_menu22,MenuDummy},
	{ sys_work_menu23,MenuDummy},
};

static const MENU_ITEM	SysWork3MenuList[] =
{
	{ sys_work_menu27,MenuDummy},
	{ sys_work_menu28,MenuDummy},
	{ sys_work_menu29,MenuDummy},
	{ sys_work_menu30,MenuDummy},
	{ sys_work_menu31,MenuDummy},
	{ sys_work_menu32,MenuDummy},
	{ sys_work_menu33,MenuDummy},
	{ sys_work_menu34,MenuDummy},
	{ sys_work_menu35,MenuDummy},
};

static const MENU_ITEM	SysWork4MenuList[] =
{
	{ sys_work_menu36,MenuDummy},
	{ sys_work_menu37,MenuDummy},
	{ sys_work_menu38,MenuDummy},
	{ sys_work_menu39,MenuDummy},
	{ sys_work_menu40,MenuDummy},
};

static const u8 SysWorkMaxTbl[SYS_WORK_MENU_MAX] = {
	SYS_WORK0_MENU_MAX, SYS_WORK1_MENU_MAX, SYS_WORK2_MENU_MAX, SYS_WORK3_MENU_MAX, SYS_WORK4_MENU_MAX
};

static const u16 SysWorkHeader[SYS_WORK_MENU_MAX][9] = {
 {
	WK_CYCLE_ROAD_HIT, WK_CYCLE_ROAD_TIME1, WK_CYCLE_ROAD_TIME2, 0,0,
	0,0,0,0
 },
 {
	WK_SIZE_KINOKOKO_OYAJI_RECORD, WK_SIZE_NAMAZO_OYAJI_RECORD, 0,0,0,
	0,0,0,0
 },
 {
	WK_SPRAY_COUNT, WK_ICE_COUNT, WK_ASH_GATHER_COUNT, WK_CRUISE_COUNT,WK_FRIENDLY_STEP_COUNT,
	WK_POISON_STEP_COUNT,0,0,0
 },
 {
	WK_RECYCLE_GOODS, WK_FIRST_POKE, WK_MABOROSI_RND_H, WK_MABOROSI_RND_L, EV_ONE_DAY_WORK,
	EV_FAN_WORK, EV_FAN_TIME, WK_KARAKURI_LEVEL, WK_POKELOT_PRIZE
 },
 {
	WK_SPECIAL_ZUKAN, WK_HYOUKA_DAYS, WK_POKELOT_RND1, WK_POKELOT_RND2, WK_BASE_MAPNO,
	0,0,0,0
 }
};

/*----------------------------------------------------------------------------------*/
/*----------------------------------------------------------------------------------*/
static const u8 obj_menu0[] = {O__,B__,J__,C__,H__,R__,W__,O__,R__,K__,n0_,bou_,n8_,EOM_};
static const u8 obj_menu1[] = {O__,B__,J__,C__,H__,R__,W__,O__,R__,K__,n9_,bou_,n1_,n5_,EOM_};

static const MENU_ITEM	ObjWorkMenuList[] =
{
	{ obj_menu0,obj_work_menu_0_blt },
	{ obj_menu1,obj_work_menu_1_blt },
};

static const u8 obj_work_menu0[] = {O__,B__,J__,C__,H__,R__,W__,O__,R__,K__,n1_,EOM_};
static const u8 obj_work_menu1[] = {O__,B__,J__,C__,H__,R__,W__,O__,R__,K__,n2_,EOM_};
static const u8 obj_work_menu2[] = {O__,B__,J__,C__,H__,R__,W__,O__,R__,K__,n3_,EOM_};
static const u8 obj_work_menu3[] = {O__,B__,J__,C__,H__,R__,W__,O__,R__,K__,n4_,EOM_};
static const u8 obj_work_menu4[] = {O__,B__,J__,C__,H__,R__,W__,O__,R__,K__,n5_,EOM_};
static const u8 obj_work_menu5[] = {O__,B__,J__,C__,H__,R__,W__,O__,R__,K__,n6_,EOM_};
static const u8 obj_work_menu6[] = {O__,B__,J__,C__,H__,R__,W__,O__,R__,K__,n7_,EOM_};
static const u8 obj_work_menu7[] = {O__,B__,J__,C__,H__,R__,W__,O__,R__,K__,n8_,EOM_};
static const u8 obj_work_menu8[] = {O__,B__,J__,C__,H__,R__,W__,O__,R__,K__,n9_,EOM_};
static const u8 obj_work_menu9[] = {O__,B__,J__,C__,H__,R__,W__,O__,R__,K__,n1_,n0_,EOM_};
static const u8 obj_work_menu10[] = {O__,B__,J__,C__,H__,R__,W__,O__,R__,K__,n1_,n1_,EOM_};
static const u8 obj_work_menu11[] = {O__,B__,J__,C__,H__,R__,W__,O__,R__,K__,n1_,n2_,EOM_};
static const u8 obj_work_menu12[] = {O__,B__,J__,C__,H__,R__,W__,O__,R__,K__,n1_,n3_,EOM_};
static const u8 obj_work_menu13[] = {O__,B__,J__,C__,H__,R__,W__,O__,R__,K__,n1_,n4_,EOM_};
static const u8 obj_work_menu14[] = {O__,B__,J__,C__,H__,R__,W__,O__,R__,K__,n1_,n5_,EOM_};
static const u8 obj_work_menu15[] = {O__,B__,J__,C__,H__,R__,W__,O__,R__,K__,n1_,n6_,EOM_};

static const MENU_ITEM	ObjWork0MenuList[] =
{
	{ obj_work_menu0,MenuDummy},
	{ obj_work_menu1,MenuDummy},
	{ obj_work_menu2,MenuDummy},
	{ obj_work_menu3,MenuDummy},
	{ obj_work_menu4,MenuDummy},
	{ obj_work_menu5,MenuDummy},
	{ obj_work_menu6,MenuDummy},
	{ obj_work_menu7,MenuDummy},
	{ obj_work_menu8,MenuDummy},
};

static const MENU_ITEM	ObjWork1MenuList[] =
{
	{ obj_work_menu9,MenuDummy},
	{ obj_work_menu10,MenuDummy},
	{ obj_work_menu11,MenuDummy},
	{ obj_work_menu12,MenuDummy},
	{ obj_work_menu13,MenuDummy},
	{ obj_work_menu14,MenuDummy},
	{ obj_work_menu15,MenuDummy},
};

static const u8 ObjWorkMaxTbl[OBJ_WORK_MENU_MAX] = {
	OBJ_WORK0_MENU_MAX, OBJ_WORK1_MENU_MAX
};

static const u16 ObjWorkHeader[OBJ_WORK_MENU_MAX][9] = {
 {
	OBJCHRWORK1 , OBJCHRWORK2 , OBJCHRWORK3 , OBJCHRWORK4 , OBJCHRWORK5 ,
	OBJCHRWORK6 , OBJCHRWORK7 , OBJCHRWORK8 , OBJCHRWORK9
 },
 {
	OBJCHRWORK10, OBJCHRWORK11, OBJCHRWORK12, OBJCHRWORK13, OBJCHRWORK14 ,
	OBJCHRWORK15, OBJCHRWORK16 ,0,0
 }
};

/*----------------------------------------------------------------------------------*/
/*----------------------------------------------------------------------------------*/
static const u8 save2w_menu0[] = {S__,P__,EOM_};
static const u8 save2w_menu1[] = {RU_,bou_,MU_,spc_,R__,n1_,n1_,n0_,spc_,P__,A__,R__,T__,n1_,sura_,KA_,RA_,KU_,RI_,EOM_};
static const u8 save2w_menu2[] = {RU_,bou_,MU_,spc_,R__,n1_,n1_,n0_,spc_,P__,A__,R__,T__,n2_,EOM_};
static const u8 save2w_menu3[] = {RU_,bou_,MU_,spc_,RO_,bou_,DO_,EOM_};
static const u8 save2w_menu4[] = {SO_,NO_,TA_,n1_,EOM_};
static const u8 save2w_menu5[] = {SO_,NO_,TA_,n2_,EOM_};

static const MENU_ITEM	Save2WorkMenuList[] =
{
	{ save2w_menu0,save2_work_menu_0_blt },
	{ save2w_menu1,save2_work_menu_1_blt },
	{ save2w_menu2,save2_work_menu_2_blt },
	{ save2w_menu3,save2_work_menu_3_blt },
	{ save2w_menu4,save2_work_menu_4_blt },
	{ save2w_menu5,save2_work_menu_5_blt },
};

static const u8 save2_work_menu0[] = {W__,K__,bou_,S__,C__,E__,N__,E__,bou_,S__,P__,bou_,C__,O__,N__,T__,E__,S__,T__,EOM_};
static const u8 save2_work_menu1[] = {W__,K__,bou_,S__,C__,E__,N__,E__,bou_,S__,P__,bou_,P__,C__,EOM_};
static const u8 save2_work_menu2[] = {W__,K__,bou_,S__,C__,E__,N__,E__,bou_,S__,P__,bou_,C__,O__,N__,T__,E__,S__,T__,n0_,n3_,EOM_};
static const u8 save2_work_menu3[] = {W__,K__,bou_,S__,C__,E__,N__,E__,bou_,S__,P__,bou_,C__,O__,N__,T__,E__,S__,T__,I__,T__,E__,M__,EOM_};
static const u8 save2_work_menu4[] = {W__,K__,bou_,S__,C__,E__,N__,E__,bou_,S__,P__,bou_,O__,P__,E__,N__,I__,N__,G__,EOM_};
static const u8 save2_work_menu5[] = {W__,K__,bou_,S__,C__,E__,N__,E__,bou_,S__,P__,bou_,S__,H__,I__,P__,n0_,n1_,EOM_};
static const u8 save2_work_menu6[] = {EOM_};
static const u8 save2_work_menu7[] = {EOM_};
static const u8 save2_work_menu8[] = {EOM_};


static const u8 save2_work_menu9[] = {W__,K__,bou_,S__,C__,E__,N__,E__,bou_,R__,n1_,n1_,n0_,bou_,R__,n0_,n1_,n0_,n1_,EOM_};
static const u8 save2_work_menu10[] = {W__,K__,bou_,S__,C__,E__,N__,E__,bou_,R__,n1_,n1_,n0_,bou_,R__,n0_,n1_,n0_,n2_,EOM_};
static const u8 save2_work_menu11[] = {W__,K__,bou_,S__,C__,E__,N__,E__,bou_,R__,n1_,n1_,n0_,bou_,R__,n0_,n1_,n0_,n3_,EOM_};
static const u8 save2_work_menu12[] = {W__,K__,bou_,K__,A__,R__,A__,K__,U__,R__,I__,bou_,D__,A__,I__,O__,U__,EOM_};
static const u8 save2_work_menu13[] = {W__,K__,bou_,S__,C__,E__,N__,E__,bou_,S__,H__,I__,S__,E__,N__,EOM_};
static const u8 save2_work_menu14[] = {EOM_};
static const u8 save2_work_menu15[] = {EOM_};
static const u8 save2_work_menu16[] = {EOM_};
static const u8 save2_work_menu17[] = {EOM_};

static const u8 save2_work_menu18[] = {W__,K__,bou_,S__,C__,E__,N__,E__,bou_,R__,n1_,n1_,n0_,bou_,R__,n0_,n1_,n0_,n4_,EOM_};
static const u8 save2_work_menu19[] = {W__,K__,bou_,S__,C__,E__,N__,E__,bou_,R__,n1_,n1_,n0_,bou_,R__,n0_,n1_,n0_,n5_,EOM_};
static const u8 save2_work_menu20[] = {W__,K__,bou_,S__,C__,E__,N__,E__,bou_,R__,n1_,n1_,n0_,bou_,R__,n0_,n1_,n0_,n6_,EOM_};
static const u8 save2_work_menu21[] = {W__,K__,bou_,S__,C__,E__,N__,E__,bou_,R__,n1_,n1_,n0_,bou_,R__,n0_,n1_,n0_,n7_,EOM_};
static const u8 save2_work_menu22[] = {W__,K__,bou_,S__,C__,E__,N__,E__,bou_,R__,n1_,n1_,n0_,bou_,R__,n0_,n1_,n0_,n8_,EOM_};
static const u8 save2_work_menu23[] = {W__,K__,bou_,S__,C__,E__,N__,E__,bou_,R__,n1_,n1_,n0_,bou_,R__,n0_,n1_,n0_,n9_,EOM_};
static const u8 save2_work_menu24[] = {W__,K__,bou_,S__,C__,E__,N__,E__,bou_,R__,n1_,n1_,n0_,bou_,R__,n0_,n1_,n1_,n0_,EOM_};
static const u8 save2_work_menu25[] = {W__,K__,bou_,S__,C__,E__,N__,E__,bou_,R__,n1_,n1_,n0_,bou_,R__,n0_,n1_,n1_,n1_,EOM_};
static const u8 save2_work_menu26[] = {W__,K__,bou_,S__,C__,E__,N__,E__,bou_,n0_,n2_,bou_,R__,n1_,n1_,n0_,bou_,R__,n0_,n1_,n1_,n0_,EOM_};

static const u8 save2_work_menu27[] = {W__,K__,bou_,S__,C__,E__,N__,E__,bou_,R__,n1_,n0_,n4_,bou_,R__,n0_,n1_,n0_,n1_,EOM_};
static const u8 save2_work_menu28[] = {W__,K__,bou_,S__,C__,E__,N__,E__,bou_,R__,n1_,n1_,n3_,bou_,R__,n0_,n1_,n0_,n1_,EOM_};
static const u8 save2_work_menu29[] = {EOM_};
static const u8 save2_work_menu30[] = {EOM_};
static const u8 save2_work_menu31[] = {EOM_};
static const u8 save2_work_menu32[] = {EOM_};
static const u8 save2_work_menu33[] = {EOM_};
static const u8 save2_work_menu34[] = {EOM_};
static const u8 save2_work_menu35[] = {EOM_};

static const u8 save2_work_menu36[] = {W__,K__,bou_,S__,C__,E__,N__,E__,bou_,B__,A__,S__,E__,bou_,G__,D__,O__,O__,D__,S__,EOM_};
static const u8 save2_work_menu37[] = {W__,K__,bou_,S__,C__,E__,N__,E__,bou_,H__,A__,G__,I__,bou_,F__,U__,N__,E__,EOM_};
static const u8 save2_work_menu38[] = {W__,K__,bou_,S__,C__,E__,N__,E__,bou_,F__,U__,N__,E__,bou_,P__,O__,S__,EOM_};
static const u8 save2_work_menu39[] = {W__,K__,bou_,S__,C__,E__,N__,E__,bou_,B__,A__,S__,E__,bou_,M__,A__,K__,E__,EOM_};
static const u8 save2_work_menu40[] = {W__,K__,bou_,S__,C__,E__,N__,E__,bou_,A__,R__,T__,I__,S__,T__,bou_,C__,n1_,n0_,n6_,bou_,R__,EOM_};
static const u8 save2_work_menu41[] = {W__,K__,bou_,S__,C__,E__,N__,E__,bou_,P__,O__,K__,E__,bou_,L__,E__,A__,G__,U__,E__,EOM_};
static const u8 save2_work_menu42[] = {W__,K__,bou_,S__,C__,E__,N__,E__,bou_,R__,O__,P__,E__,W__,A__,Y__,EOM_};
static const u8 save2_work_menu43[] = {W__,K__,bou_,S__,C__,E__,N__,E__,bou_,S__,A__,F__,A__,R__,I__,bou_,Z__,O__,N__,E__,EOM_};
static const u8 save2_work_menu44[] = {W__,K__,bou_,S__,C__,E__,N__,E__,bou_,C__,Y__,C__,L__,E__,bou_,R__,O__,A__,D__,EOM_};

static const u8 save2_work_menu45[] = {W__,K__,bou_,S__,C__,E__,N__,E__,bou_,R__,n1_,n1_,n9_,bou_,T__,E__,N__,K__,I__,EOM_};
static const u8 save2_work_menu46[] = {W__,K__,bou_,S__,C__,E__,N__,E__,bou_,n0_,n1_,bou_,C__,n1_,n0_,n2_,bou_,R__,n0_,n4_,n0_,n1_,EOM_};
static const u8 save2_work_menu47[] = {W__,K__,bou_,F__,U__,T__,A__,G__,O__,bou_,n0_,n1_,bou_,F__,I__,E__,L__,D__,bou_,R__,n1_,n0_,n4_,EOM_};
static const u8 save2_work_menu48[] = {W__,K__,bou_,S__,C__,E__,N__,E__,bou_,B__,A__,T__,T__,L__,E__,bou_,T__,O__,W__,E__,R__,EOM_};
static const u8 save2_work_menu49[] = {W__,K__,bou_,S__,C__,E__,N__,E__,bou_,T__,R__,bou_,H__,O__,U__,S__,E__,EOM_};
static const u8 save2_work_menu50[] = {W__,K__,bou_,K__,A__,S__,E__,K__,I__,bou_,T__,Y__,P__,E__,EOM_};
static const u8 save2_work_menu51[] = {EOM_};
static const u8 save2_work_menu52[] = {EOM_};
static const u8 save2_work_menu53[] = {EOM_};


static const MENU_ITEM	Save2Work0MenuList[] =
{
	{ save2_work_menu0,MenuDummy},
	{ save2_work_menu1,MenuDummy},
	{ save2_work_menu2,MenuDummy},
	{ save2_work_menu3,MenuDummy},
	{ save2_work_menu4,MenuDummy},
	{ save2_work_menu5,MenuDummy},
	{ save2_work_menu6,MenuDummy},
	{ save2_work_menu7,MenuDummy},
};

static const MENU_ITEM	Save2Work1MenuList[] =
{
	{ save2_work_menu9,MenuDummy},
	{ save2_work_menu10,MenuDummy},
	{ save2_work_menu11,MenuDummy},
	{ save2_work_menu12,MenuDummy},
	{ save2_work_menu13,MenuDummy},
	{ save2_work_menu14,MenuDummy},
	{ save2_work_menu15,MenuDummy},
	{ save2_work_menu16,MenuDummy},
	{ save2_work_menu17,MenuDummy},
};

static const MENU_ITEM	Save2Work2MenuList[] =
{
	{ save2_work_menu18,MenuDummy},
	{ save2_work_menu19,MenuDummy},
	{ save2_work_menu20,MenuDummy},
	{ save2_work_menu21,MenuDummy},
	{ save2_work_menu22,MenuDummy},
	{ save2_work_menu23,MenuDummy},
	{ save2_work_menu24,MenuDummy},
	{ save2_work_menu25,MenuDummy},
	{ save2_work_menu26,MenuDummy},
};

static const MENU_ITEM	Save2Work3MenuList[] =
{
	{ save2_work_menu27,MenuDummy},
	{ save2_work_menu28,MenuDummy},
	{ save2_work_menu29,MenuDummy},
	{ save2_work_menu30,MenuDummy},
	{ save2_work_menu31,MenuDummy},
	{ save2_work_menu32,MenuDummy},
	{ save2_work_menu33,MenuDummy},
	{ save2_work_menu34,MenuDummy},
	{ save2_work_menu35,MenuDummy},
};

static const MENU_ITEM	Save2Work4MenuList[] =
{
	{ save2_work_menu36,MenuDummy},
	{ save2_work_menu37,MenuDummy},
	{ save2_work_menu38,MenuDummy},
	{ save2_work_menu39,MenuDummy},
	{ save2_work_menu40,MenuDummy},
	{ save2_work_menu41,MenuDummy},
	{ save2_work_menu42,MenuDummy},
	{ save2_work_menu43,MenuDummy},
	{ save2_work_menu44,MenuDummy},
};

static const MENU_ITEM	Save2Work5MenuList[] =
{
	{ save2_work_menu45,MenuDummy},
	{ save2_work_menu46,MenuDummy},
	{ save2_work_menu47,MenuDummy},
	{ save2_work_menu48,MenuDummy},
	{ save2_work_menu49,MenuDummy},
	{ save2_work_menu50,MenuDummy},
	{ save2_work_menu51,MenuDummy},
	{ save2_work_menu52,MenuDummy},
	{ save2_work_menu53,MenuDummy},
};

static const u8 Save2WorkMaxTbl[SAVE2_WORK_MENU_MAX] = {
	SAVE2_WORK0_MENU_MAX, SAVE2_WORK1_MENU_MAX, SAVE2_WORK2_MENU_MAX, SAVE2_WORK3_MENU_MAX, SAVE2_WORK4_MENU_MAX, SAVE2_WORK5_MENU_MAX
};

static const u16 Save2WorkHeader[SAVE2_WORK_MENU_MAX][9] = {
 {
	WK_SCENE_SP_CONTEST, WK_SCENE_SP_PC02, WK_SCENE_SP_CONTEST03, WK_SCENE_SP_CONTESTITEM, WK_SCENE_SP_OPENING,
	WK_SCENE_SP_SHIP01,0,0,0
 },
 {
	WK_SCENE_R110_R0101, WK_SCENE_R110_R0102, WK_SCENE_R110_R0103, WK_KARAKURI_DAIOU, WK_SCENE_SHISEN,
	0,0,0,0
 },
 {
	WK_SCENE_R110_R0104, WK_SCENE_R110_R0105, WK_SCENE_R110_R0106, WK_SCENE_R110_R0107, WK_SCENE_R110_R0108,
	WK_SCENE_R110_R0109, WK_SCENE_R110_R0110, WK_SCENE_R110_R0111, WK_SCENE_02_R110_R0110
 },
 {
	WK_SCENE_R104_R0101, WK_SCENE_R113_R0101, 0, 0, 0,
	0, 0, 0, 0
 },
 {
	WK_SCENE_BASE_GOODS, WK_SCENE_HAGI_FUNE, WK_SCENE_FUNE_POS, WK_SCENE_BASE_MAKE, WK_SCENE_ARTIST_C106_R0301,
	WK_SCENE_POKE_LEAGUE, WK_SCENE_ROPEWAY, WK_SCENE_SAFARI_ZONE, WK_SCENE_CYCLE_ROAD
 },
 {
	WK_SCENE_R119_TENKI, WK_SCENE_01_C102_R0401, WK_FUTAGO_01_FIELD_R104, WK_SCENE_BATTLE_TOWER, WK_SCENE_TR_HOUSE,
	WK_KASEKI_TYPE,0,0,0					
 },
};

/*----------------------------------------------------------------------------------*/
/*----------------------------------------------------------------------------------*/

static const u8 savew_menu0[] = {TA_,U_,N_,EOM_};
static const u8 savew_menu1[] = {SI_,TE_,II_,EOM_};
static const u8 savew_menu2[] = {RO_,bou_,DO_,n1_,n0_,n1_,bou_,n1_,n0_,n9_,EOM_};
static const u8 savew_menu3[] = {RO_,bou_,DO_,n1_,n1_,n0_,bou_,n1_,n1_,n8_,EOM_};
static const u8 savew_menu4[] = {RO_,bou_,DO_,n1_,n1_,n9_,bou_,n1_,n2_,n7_,EOM_};
static const u8 savew_menu5[] = {RO_,bou_,DO_,n1_,n2_,n8_,bou_,n1_,n3_,n4_,EOM_};
static const u8 savew_menu6[] = {RU_,bou_,MU_,spc_,TA_,U_,N_,EOM_};
static const u8 savew_menu7[] = {RU_,bou_,MU_,spc_,SI_,TE_,II_,EOM_};
static const u8 savew_menu8[] = {DA_,N_,ZI_,YYO_,N_,na_,i_,EOM_};

static const MENU_ITEM	SaveWorkMenuList[] =
{
	{ savew_menu0,save_work_menu_0_blt },
	{ savew_menu1,save_work_menu_1_blt },
	{ savew_menu2,save_work_menu_2_blt },
	{ savew_menu3,save_work_menu_3_blt },
	{ savew_menu4,save_work_menu_4_blt },
	{ savew_menu5,save_work_menu_5_blt },
	{ savew_menu6,save_work_menu_6_blt },
	{ savew_menu7,save_work_menu_7_blt },
	{ savew_menu8,save_work_menu_8_blt },
};

static const u8 save_work_menu0[] = {W__,K__,bou_,S__,C__,E__,N__,E__,bou_,F__,I__,E__,L__,D__,bou_,T__,n1_,n0_,n1_,EOM_};
static const u8 save_work_menu1[] = {W__,K__,bou_,S__,C__,E__,N__,E__,bou_,F__,I__,E__,L__,D__,bou_,T__,n1_,n0_,n2_,EOM_};
static const u8 save_work_menu2[] = {W__,K__,bou_,S__,C__,E__,N__,E__,bou_,F__,I__,E__,L__,D__,bou_,T__,n1_,n0_,n3_,EOM_};
static const u8 save_work_menu3[] = {W__,K__,bou_,S__,C__,E__,N__,E__,bou_,F__,I__,E__,L__,D__,bou_,T__,n1_,n0_,n4_,EOM_};
static const u8 save_work_menu4[] = {W__,K__,bou_,B__,A__,S__,E__,bou_,P__,O__,S__,N__,O__,EOM_};
static const u8 save_work_menu5[] = {W__,K__,bou_,S__,C__,E__,N__,E__,bou_,F__,I__,E__,L__,D__,bou_,T__,n1_,n0_,n6_,EOM_};
static const u8 save_work_menu6[] = {W__,K__,bou_,S__,C__,E__,N__,E__,bou_,F__,I__,E__,L__,D__,bou_,T__,n1_,n0_,n7_,EOM_};
static const u8 save_work_menu7[] = {W__,K__,bou_,S__,C__,E__,N__,E__,bou_,n0_,n2_,bou_,F__,I__,E__,L__,D__,bou_,T__,n1_,n0_,n2_,EOM_};

static const u8 save_work_menu9[] = {W__,K__,bou_,S__,C__,E__,N__,E__,bou_,F__,I__,E__,L__,D__,bou_,C__,n1_,n0_,n1_,EOM_};
static const u8 save_work_menu10[] = {W__,K__,bou_,S__,C__,E__,N__,E__,bou_,F__,I__,E__,L__,D__,bou_,C__,n1_,n0_,n2_,EOM_};
static const u8 save_work_menu11[] = {W__,K__,bou_,S__,C__,E__,N__,E__,bou_,F__,I__,E__,L__,D__,bou_,C__,n1_,n0_,n3_,EOM_};
static const u8 save_work_menu12[] = {W__,K__,bou_,S__,C__,E__,N__,E__,bou_,F__,I__,E__,L__,D__,bou_,C__,n1_,n0_,n4_,EOM_};
static const u8 save_work_menu13[] = {W__,K__,bou_,S__,C__,E__,N__,E__,bou_,F__,I__,E__,L__,D__,bou_,C__,n1_,n0_,n5_,EOM_};
static const u8 save_work_menu14[] = {W__,K__,bou_,S__,C__,E__,N__,E__,bou_,F__,I__,E__,L__,D__,bou_,C__,n1_,n0_,n6_,EOM_};
static const u8 save_work_menu15[] = {W__,K__,bou_,S__,C__,E__,N__,E__,bou_,F__,I__,E__,L__,D__,bou_,C__,n1_,n0_,n7_,EOM_};
static const u8 save_work_menu16[] = {W__,K__,bou_,S__,C__,E__,N__,E__,bou_,F__,I__,E__,L__,D__,bou_,C__,n1_,n0_,n8_,EOM_};
static const u8 save_work_menu17[] = {W__,K__,bou_,S__,C__,E__,N__,E__,bou_,F__,I__,E__,L__,D__,bou_,C__,n1_,n0_,n9_,EOM_};

static const u8 save_work_menu18[] = {W__,K__,bou_,S__,C__,E__,N__,E__,bou_,F__,I__,E__,L__,D__,bou_,R__,n1_,n0_,n1_,EOM_};
static const u8 save_work_menu19[] = {W__,K__,bou_,S__,C__,E__,N__,E__,bou_,F__,I__,E__,L__,D__,bou_,R__,n1_,n0_,n2_,EOM_};
static const u8 save_work_menu20[] = {W__,K__,bou_,S__,C__,E__,N__,E__,bou_,F__,I__,E__,L__,D__,bou_,R__,n1_,n0_,n3_,EOM_};
static const u8 save_work_menu21[] = {W__,K__,bou_,S__,C__,E__,N__,E__,bou_,F__,I__,E__,L__,D__,bou_,R__,n1_,n0_,n4_,EOM_};
static const u8 save_work_menu22[] = {W__,K__,bou_,S__,C__,E__,N__,E__,bou_,F__,I__,E__,L__,D__,bou_,R__,n1_,n0_,n5_,EOM_};
static const u8 save_work_menu23[] = {W__,K__,bou_,S__,C__,E__,N__,E__,bou_,F__,I__,E__,L__,D__,bou_,R__,n1_,n0_,n6_,EOM_};
static const u8 save_work_menu24[] = {W__,K__,bou_,S__,C__,E__,N__,E__,bou_,F__,I__,E__,L__,D__,bou_,R__,n1_,n0_,n7_,EOM_};
static const u8 save_work_menu25[] = {W__,K__,bou_,S__,C__,E__,N__,E__,bou_,F__,I__,E__,L__,D__,bou_,R__,n1_,n0_,n8_,EOM_};
static const u8 save_work_menu26[] = {W__,K__,bou_,S__,C__,E__,N__,E__,bou_,F__,I__,E__,L__,D__,bou_,R__,n1_,n0_,n9_,EOM_};

static const u8 save_work_menu27[] = {W__,K__,bou_,S__,C__,E__,N__,E__,bou_,F__,I__,E__,L__,D__,bou_,R__,n1_,n1_,n0_,EOM_};
static const u8 save_work_menu28[] = {W__,K__,bou_,S__,C__,E__,N__,E__,bou_,F__,I__,E__,L__,D__,bou_,R__,n1_,n1_,n1_,EOM_};
static const u8 save_work_menu29[] = {W__,K__,bou_,S__,C__,E__,N__,E__,bou_,F__,I__,E__,L__,D__,bou_,R__,n1_,n1_,n2_,EOM_};
static const u8 save_work_menu30[] = {W__,K__,bou_,S__,C__,E__,N__,E__,bou_,F__,I__,E__,L__,D__,bou_,R__,n1_,n1_,n3_,EOM_};
static const u8 save_work_menu31[] = {W__,K__,bou_,S__,C__,E__,N__,E__,bou_,F__,I__,E__,L__,D__,bou_,R__,n1_,n1_,n4_,EOM_};
static const u8 save_work_menu32[] = {W__,K__,bou_,S__,C__,E__,N__,E__,bou_,F__,I__,E__,L__,D__,bou_,R__,n1_,n1_,n5_,EOM_};
static const u8 save_work_menu33[] = {W__,K__,bou_,S__,C__,E__,N__,E__,bou_,F__,I__,E__,L__,D__,bou_,R__,n1_,n1_,n6_,EOM_};
static const u8 save_work_menu34[] = {W__,K__,bou_,S__,C__,E__,N__,E__,bou_,F__,I__,E__,L__,D__,bou_,R__,n1_,n1_,n7_,EOM_};
static const u8 save_work_menu35[] = {W__,K__,bou_,S__,C__,E__,N__,E__,bou_,F__,I__,E__,L__,D__,bou_,R__,n1_,n1_,n8_,EOM_};

static const u8 save_work_menu36[] = {W__,K__,bou_,S__,C__,E__,N__,E__,bou_,F__,I__,E__,L__,D__,bou_,R__,n1_,n1_,n9_,EOM_};
static const u8 save_work_menu37[] = {W__,K__,bou_,S__,C__,E__,N__,E__,bou_,F__,I__,E__,L__,D__,bou_,R__,n1_,n2_,n0_,EOM_};
static const u8 save_work_menu38[] = {W__,K__,bou_,S__,C__,E__,N__,E__,bou_,F__,I__,E__,L__,D__,bou_,R__,n1_,n2_,n1_,EOM_};
static const u8 save_work_menu39[] = {W__,K__,bou_,S__,C__,E__,N__,E__,bou_,F__,I__,E__,L__,D__,bou_,R__,n1_,n2_,n2_,EOM_};
static const u8 save_work_menu40[] = {W__,K__,bou_,S__,C__,E__,N__,E__,bou_,F__,I__,E__,L__,D__,bou_,R__,n1_,n2_,n3_,EOM_};
static const u8 save_work_menu41[] = {W__,K__,bou_,S__,C__,E__,N__,E__,bou_,F__,I__,E__,L__,D__,bou_,R__,n1_,n2_,n4_,EOM_};
static const u8 save_work_menu42[] = {W__,K__,bou_,S__,C__,E__,N__,E__,bou_,F__,I__,E__,L__,D__,bou_,R__,n1_,n2_,n5_,EOM_};
static const u8 save_work_menu43[] = {W__,K__,bou_,S__,C__,E__,N__,E__,bou_,F__,I__,E__,L__,D__,bou_,R__,n1_,n2_,n6_,EOM_};
static const u8 save_work_menu44[] = {W__,K__,bou_,S__,C__,E__,N__,E__,bou_,F__,I__,E__,L__,D__,bou_,R__,n1_,n2_,n7_,EOM_};

static const u8 save_work_menu45[] = {W__,K__,bou_,S__,C__,E__,N__,E__,bou_,F__,I__,E__,L__,D__,bou_,R__,n1_,n2_,n8_,EOM_};
static const u8 save_work_menu46[] = {W__,K__,bou_,S__,C__,E__,N__,E__,bou_,F__,I__,E__,L__,D__,bou_,R__,n1_,n2_,n9_,EOM_};
static const u8 save_work_menu47[] = {W__,K__,bou_,S__,C__,E__,N__,E__,bou_,F__,I__,E__,L__,D__,bou_,R__,n1_,n3_,n0_,EOM_};
static const u8 save_work_menu48[] = {W__,K__,bou_,S__,C__,E__,N__,E__,bou_,F__,I__,E__,L__,D__,bou_,R__,n1_,n3_,n1_,EOM_};
static const u8 save_work_menu49[] = {W__,K__,bou_,S__,C__,E__,N__,E__,bou_,F__,I__,E__,L__,D__,bou_,R__,n1_,n3_,n2_,EOM_};
static const u8 save_work_menu50[] = {W__,K__,bou_,S__,C__,E__,N__,E__,bou_,F__,I__,E__,L__,D__,bou_,R__,n1_,n3_,n3_,EOM_};
static const u8 save_work_menu51[] = {W__,K__,bou_,S__,C__,E__,N__,E__,bou_,F__,I__,E__,L__,D__,bou_,R__,n1_,n3_,n4_,EOM_};

static const u8 save_work_menu54[] = {W__,K__,bou_,S__,C__,E__,N__,E__,bou_,T__,n1_,n0_,n1_,bou_,R__,n0_,n1_,n0_,n1_,EOM_};
static const u8 save_work_menu55[] = {W__,K__,bou_,S__,C__,E__,N__,E__,bou_,T__,n1_,n0_,n1_,bou_,R__,n0_,n1_,n0_,n2_,EOM_};
static const u8 save_work_menu56[] = {W__,K__,bou_,S__,C__,E__,N__,E__,bou_,T__,n1_,n0_,n1_,bou_,R__,n0_,n3_,n0_,n1_,EOM_};
static const u8 save_work_menu57[] = {W__,K__,bou_,S__,C__,E__,N__,E__,bou_,T__,n1_,n0_,n1_,bou_,R__,n0_,n2_,n0_,n1_,EOM_};
static const u8 save_work_menu58[] = {W__,K__,bou_,S__,C__,E__,N__,E__,bou_,T__,n1_,n0_,n1_,bou_,R__,n0_,n2_,n0_,n2_,EOM_};
static const u8 save_work_menu59[] = {W__,K__,bou_,S__,C__,E__,N__,E__,bou_,T__,n1_,n0_,n7_,bou_,R__,n0_,n2_,n0_,n1_,EOM_};

static const u8 save_work_menu63[] = {W__,K__,bou_,S__,C__,E__,N__,E__,bou_,C__,n1_,n0_,n1_,bou_,R__,n0_,n2_,n0_,n1_,EOM_};
static const u8 save_work_menu64[] = {W__,K__,bou_,S__,C__,E__,N__,E__,bou_,C__,n1_,n0_,n4_,bou_,R__,n0_,n1_,n0_,n3_,EOM_};
static const u8 save_work_menu65[] = {W__,K__,bou_,S__,C__,E__,N__,E__,bou_,C__,n1_,n0_,n3_,bou_,R__,n0_,n1_,n0_,n1_,EOM_};
static const u8 save_work_menu66[] = {W__,K__,bou_,S__,C__,E__,N__,E__,bou_,C__,n1_,n0_,n6_,bou_,R__,n0_,n2_,n0_,n2_,EOM_};
static const u8 save_work_menu67[] = {W__,K__,bou_,S__,C__,E__,N__,E__,bou_,C__,n1_,n0_,n6_,bou_,R__,n0_,n4_,n0_,n1_,EOM_};
static const u8 save_work_menu68[] = {W__,K__,bou_,S__,C__,E__,N__,E__,bou_,C__,n1_,n0_,n2_,bou_,R__,n0_,n6_,n0_,n1_,EOM_};
static const u8 save_work_menu69[] = {W__,K__,bou_,S__,C__,E__,N__,E__,bou_,C__,n1_,n0_,n2_,bou_,R__,n0_,n5_,n0_,n1_,EOM_};
static const u8 save_work_menu70[] = {W__,K__,bou_,S__,C__,E__,N__,E__,bou_,C__,n1_,n0_,n4_,bou_,R__,n0_,n1_,n0_,n2_,EOM_};
static const u8 save_work_menu71[] = {W__,K__,bou_,S__,C__,E__,N__,E__,bou_,C__,n1_,n0_,n7_,bou_,R__,n0_,n5_,n0_,n1_,EOM_};

static const u8 save_work_menu72[] = {W__,K__,bou_,S__,C__,E__,N__,E__,bou_,C__,A__,V__,E__,bou_,D__,n0_,n6_,n0_,n1_,EOM_};
static const u8 save_work_menu73[] = {W__,K__,bou_,S__,C__,E__,N__,E__,bou_,C__,A__,V__,E__,bou_,D__,n0_,n2_,n0_,n1_,EOM_};
static const u8 save_work_menu74[] = {W__,K__,bou_,S__,C__,E__,N__,E__,bou_,C__,A__,V__,E__,bou_,D__,n1_,n2_,n0_,n6_,EOM_};
static const u8 save_work_menu75[] = {W__,K__,bou_,S__,C__,E__,N__,E__,bou_,C__,A__,V__,E__,bou_,D__,n1_,n1_,n1_,n1_,EOM_};
static const u8 save_work_menu76[] = {W__,K__,bou_,S__,C__,E__,N__,E__,bou_,C__,A__,V__,E__,bou_,D__,n0_,n7_,n0_,n1_,EOM_};
static const u8 save_work_menu77[] = {W__,K__,bou_,S__,C__,E__,N__,E__,bou_,C__,A__,V__,E__,bou_,D__,n0_,n8_,n0_,n8_,EOM_};
static const u8 save_work_menu78[] = {W__,K__,bou_,S__,C__,E__,N__,E__,bou_,C__,A__,V__,E__,bou_,D__,n1_,n6_,n0_,n2_,EOM_};
static const u8 save_work_menu79[] = {W__,K__,bou_,S__,C__,E__,N__,E__,bou_,C__,A__,V__,E__,bou_,D__,n0_,n1_,n0_,n1_,EOM_};
static const u8 save_work_menu80[] = {W__,K__,bou_,S__,C__,E__,N__,E__,bou_,C__,A__,V__,E__,bou_,D__,n1_,n3_,n0_,n1_,EOM_};

static const MENU_ITEM	SaveWork0MenuList[] =
{
	{ save_work_menu0,MenuDummy},
	{ save_work_menu1,MenuDummy},
	{ save_work_menu2,MenuDummy},
	{ save_work_menu3,MenuDummy},
	{ save_work_menu4,MenuDummy},
	{ save_work_menu5,MenuDummy},
	{ save_work_menu6,MenuDummy},
	{ save_work_menu7,MenuDummy},
};

static const MENU_ITEM	SaveWork1MenuList[] =
{
	{ save_work_menu9,MenuDummy},
	{ save_work_menu10,MenuDummy},
	{ save_work_menu11,MenuDummy},
	{ save_work_menu12,MenuDummy},
	{ save_work_menu13,MenuDummy},
	{ save_work_menu14,MenuDummy},
	{ save_work_menu15,MenuDummy},
	{ save_work_menu16,MenuDummy},
	{ save_work_menu17,MenuDummy},
};

static const MENU_ITEM	SaveWork2MenuList[] =
{
	{ save_work_menu18,MenuDummy},
	{ save_work_menu19,MenuDummy},
	{ save_work_menu20,MenuDummy},
	{ save_work_menu21,MenuDummy},
	{ save_work_menu22,MenuDummy},
	{ save_work_menu23,MenuDummy},
	{ save_work_menu24,MenuDummy},
	{ save_work_menu25,MenuDummy},
	{ save_work_menu26,MenuDummy},
};

static const MENU_ITEM	SaveWork3MenuList[] =
{
	{ save_work_menu27,MenuDummy},
	{ save_work_menu28,MenuDummy},
	{ save_work_menu29,MenuDummy},
	{ save_work_menu30,MenuDummy},
	{ save_work_menu31,MenuDummy},
	{ save_work_menu32,MenuDummy},
	{ save_work_menu33,MenuDummy},
	{ save_work_menu34,MenuDummy},
	{ save_work_menu35,MenuDummy},
};

static const MENU_ITEM	SaveWork4MenuList[] =
{
	{ save_work_menu36,MenuDummy},
	{ save_work_menu37,MenuDummy},
	{ save_work_menu38,MenuDummy},
	{ save_work_menu39,MenuDummy},
	{ save_work_menu40,MenuDummy},
	{ save_work_menu41,MenuDummy},
	{ save_work_menu42,MenuDummy},
	{ save_work_menu43,MenuDummy},
	{ save_work_menu44,MenuDummy},
};

static const MENU_ITEM	SaveWork5MenuList[] =
{
	{ save_work_menu45,MenuDummy},
	{ save_work_menu46,MenuDummy},
	{ save_work_menu47,MenuDummy},
	{ save_work_menu48,MenuDummy},
	{ save_work_menu49,MenuDummy},
	{ save_work_menu50,MenuDummy},
	{ save_work_menu51,MenuDummy},
};

static const MENU_ITEM	SaveWork6MenuList[] =
{
	{ save_work_menu54,MenuDummy},
	{ save_work_menu55,MenuDummy},
	{ save_work_menu56,MenuDummy},
	{ save_work_menu57,MenuDummy},
	{ save_work_menu58,MenuDummy},
};

static const MENU_ITEM	SaveWork7MenuList[] =
{
	{ save_work_menu63,MenuDummy},
	{ save_work_menu64,MenuDummy},
	{ save_work_menu65,MenuDummy},
	{ save_work_menu66,MenuDummy},
	{ save_work_menu67,MenuDummy},
	{ save_work_menu68,MenuDummy},
	{ save_work_menu69,MenuDummy},
	{ save_work_menu70,MenuDummy},
	{ save_work_menu71,MenuDummy},
};

static const MENU_ITEM	SaveWork8MenuList[] =
{
	{ save_work_menu72,MenuDummy},
	{ save_work_menu73,MenuDummy},
	{ save_work_menu74,MenuDummy},
	{ save_work_menu75,MenuDummy},
	{ save_work_menu76,MenuDummy},
	{ save_work_menu77,MenuDummy},
	{ save_work_menu78,MenuDummy},
	{ save_work_menu79,MenuDummy},
	{ save_work_menu80,MenuDummy},
};

static const u8 SaveWorkMaxTbl[SAVE_WORK_MENU_MAX] = {
	SAVE_WORK0_MENU_MAX,SAVE_WORK1_MENU_MAX,SAVE_WORK2_MENU_MAX,SAVE_WORK3_MENU_MAX,
	SAVE_WORK4_MENU_MAX,SAVE_WORK5_MENU_MAX,SAVE_WORK6_MENU_MAX,SAVE_WORK7_MENU_MAX,SAVE_WORK8_MENU_MAX
};

static const u16 SaveWorkHeader[SAVE_WORK_MENU_MAX][9] = {
 {
	WK_SCENE_FIELD_T101,WK_SCENE_FIELD_T102,WK_SCENE_FIELD_T103,WK_SCENE_FIELD_T104,WK_BASE_POSNO,
	WK_SCENE_FIELD_T106,WK_SCENE_FIELD_T107,WK_SCENE_02_FIELD_T102,0
 },
 {
	WK_SCENE_FIELD_C101,WK_SCENE_FIELD_C102,WK_SCENE_FIELD_C103,WK_SCENE_FIELD_C104,WK_SCENE_FIELD_C105,
	WK_SCENE_FIELD_C106,WK_SCENE_FIELD_C107,WK_SCENE_FIELD_C108,WK_SCENE_FIELD_C109
 },
 {
	WK_SCENE_FIELD_R101,WK_SCENE_FIELD_R102,WK_SCENE_FIELD_R103,WK_SCENE_FIELD_R104,WK_SCENE_FIELD_R105,
	WK_SCENE_FIELD_R106,WK_SCENE_FIELD_R107,WK_SCENE_FIELD_R108,WK_SCENE_FIELD_R109
 },
 {
	WK_SCENE_FIELD_R110,WK_SCENE_FIELD_R111,WK_SCENE_FIELD_R112,WK_SCENE_FIELD_R113,WK_SCENE_FIELD_R114,
	WK_SCENE_FIELD_R115,WK_SCENE_FIELD_R116,WK_SCENE_FIELD_R117,WK_SCENE_FIELD_R118
 },
 {
	WK_SCENE_FIELD_R119,WK_SCENE_FIELD_R120,WK_SCENE_FIELD_R121,WK_SCENE_FIELD_R122,WK_SCENE_FIELD_R123,
	WK_SCENE_FIELD_R124,WK_SCENE_FIELD_R125,WK_SCENE_FIELD_R126,WK_SCENE_FIELD_R127
 },
 {
	WK_SCENE_FIELD_R128,WK_SCENE_FIELD_R129,WK_SCENE_FIELD_R130,WK_SCENE_FIELD_R131,WK_SCENE_FIELD_R132,
	WK_SCENE_FIELD_R133,WK_SCENE_FIELD_R134,0,0
 },
 {
	WK_SCENE_T101_R0101,WK_SCENE_T101_R0102,WK_SCENE_T101_R0301,WK_SCENE_T101_R0201,WK_SCENE_T101_R0202,
	WK_SCENE_T107_R0201,0,0,0
 },
 {
	WK_SCENE_C101_R0201,WK_SCENE_C104_R0103,WK_SCENE_C103_R0101,WK_SCENE_C106_R0202,WK_SCENE_C106_R0401,
	WK_SCENE_C102_R0601,WK_SCENE_C102_R0501,WK_SCENE_C104_R0102,WK_SCENE_C107_R0501
 },
 {
	WK_SCENE_CAVE_D0601,WK_SCENE_CAVE_D0201,WK_SCENE_CAVE_D1206,WK_SCENE_CAVE_D1111,WK_SCENE_CAVE_D0701,
	WK_SCENE_CAVE_D0808,WK_SCENE_CAVE_D1602,WK_SCENE_CAVE_D0101,WK_SCENE_CAVE_D1301
 }
};

/*----------------------------------------------------------------------------------*/
/*----------------------------------------------------------------------------------*/
static const u8 local_menu0[] = {L__,O__,C__,A__,L__,W__,O__,R__,K__,n0_,bou_,n8_,EOM_};
static const u8 local_menu1[] = {L__,O__,C__,A__,L__,W__,O__,R__,K__,n9_,bou_,n1_,n5_,EOM_};

static const MENU_ITEM	LocalWorkMenuList[] =
{
	{ local_menu0,local_work_menu_0_blt },
	{ local_menu1,local_work_menu_1_blt },
};

static const u8 local_work_menu0[] = {L__,O__,C__,A__,L__,W__,O__,R__,K__,n0_,EOM_};
static const u8 local_work_menu1[] = {L__,O__,C__,A__,L__,W__,O__,R__,K__,n1_,EOM_};
static const u8 local_work_menu2[] = {L__,O__,C__,A__,L__,W__,O__,R__,K__,n2_,EOM_};
static const u8 local_work_menu3[] = {L__,O__,C__,A__,L__,W__,O__,R__,K__,n3_,EOM_};
static const u8 local_work_menu4[] = {L__,O__,C__,A__,L__,W__,O__,R__,K__,n4_,EOM_};
static const u8 local_work_menu5[] = {L__,O__,C__,A__,L__,W__,O__,R__,K__,n5_,EOM_};
static const u8 local_work_menu6[] = {L__,O__,C__,A__,L__,W__,O__,R__,K__,n6_,EOM_};
static const u8 local_work_menu7[] = {L__,O__,C__,A__,L__,W__,O__,R__,K__,n7_,EOM_};
static const u8 local_work_menu8[] = {L__,O__,C__,A__,L__,W__,O__,R__,K__,n8_,EOM_};
static const u8 local_work_menu9[] = {L__,O__,C__,A__,L__,W__,O__,R__,K__,n9_,EOM_};
static const u8 local_work_menu10[] = {L__,O__,C__,A__,L__,W__,O__,R__,K__,n1_,n0_,EOM_};
static const u8 local_work_menu11[] = {L__,O__,C__,A__,L__,W__,O__,R__,K__,n1_,n1_,EOM_};
static const u8 local_work_menu12[] = {L__,O__,C__,A__,L__,W__,O__,R__,K__,n1_,n2_,EOM_};
static const u8 local_work_menu13[] = {L__,O__,C__,A__,L__,W__,O__,R__,K__,n1_,n3_,EOM_};
static const u8 local_work_menu14[] = {L__,O__,C__,A__,L__,W__,O__,R__,K__,n1_,n4_,EOM_};
static const u8 local_work_menu15[] = {L__,O__,C__,A__,L__,W__,O__,R__,K__,n1_,n5_,EOM_};

static const MENU_ITEM	LocalWork0MenuList[] =
{
	{ local_work_menu0,MenuDummy},
	{ local_work_menu1,MenuDummy},
	{ local_work_menu2,MenuDummy},
	{ local_work_menu3,MenuDummy},
	{ local_work_menu4,MenuDummy},
	{ local_work_menu5,MenuDummy},
	{ local_work_menu6,MenuDummy},
	{ local_work_menu7,MenuDummy},
	{ local_work_menu8,MenuDummy},
};

static const MENU_ITEM	LocalWork1MenuList[] =
{
	{ local_work_menu9,MenuDummy},
	{ local_work_menu10,MenuDummy},
	{ local_work_menu11,MenuDummy},
	{ local_work_menu12,MenuDummy},
	{ local_work_menu13,MenuDummy},
	{ local_work_menu14,MenuDummy},
	{ local_work_menu15,MenuDummy},
};

static const u8 LocalWorkMaxTbl[LOCAL_WORK_MENU_MAX] = {
	LOCAL_WORK0_MENU_MAX, LOCAL_WORK1_MENU_MAX
};

static const u16 LocalWorkHeader[LOCAL_WORK_MENU_MAX][9] = {
 {
	LOCALWORK0 , LOCALWORK1 , LOCALWORK2 , LOCALWORK3 , LOCALWORK4 ,
	LOCALWORK5 , LOCALWORK6 , LOCALWORK7 , LOCALWORK8
 },
 {
	LOCALWORK9 , LOCALWORK10, LOCALWORK11, LOCALWORK12, LOCALWORK13,
	LOCALWORK14, LOCALWORK15, 0          , 0
 }
};

/*----------------------------------------------------------------------------------*/



/*----------------------------------------------------------------------------------*/

static const u8 reberu_title[] = {RE_,BE_,RU_,EOM_};
static const u8 reberu_menu0[] = {SI_,bou_,N_,n1_,EOM_};
static const u8 reberu_menu1[] = {SI_,bou_,N_,n2_,EOM_};
static const u8 reberu_menu2[] = {SI_,bou_,N_,n3_,EOM_};
static const u8 reberu_menu3[] = {SI_,bou_,N_,n4_,EOM_};
static const u8 reberu_menu4[] = {SI_,bou_,N_,n5_,EOM_};
static const u8 reberu_menu5[] = {SI_,bou_,N_,n6_,EOM_};
static const u8 reberu_menu6[] = {SI_,bou_,N_,n7_,EOM_};
static const u8 reberu_menu7[] = {SI_,bou_,N_,n8_,EOM_};

static const MENU_ITEM	ReberuMenuList[] =
{
	{ reberu_menu0,MenuDummy },
	{ reberu_menu1,MenuDummy },
	{ reberu_menu2,MenuDummy },
	{ reberu_menu3,MenuDummy },
	{ reberu_menu4,MenuDummy },
	{ reberu_menu5,MenuDummy },
	{ reberu_menu6,MenuDummy },
	{ reberu_menu7,MenuDummy },
};


static const u8 daiou_title[] = {KA_,RA_,KU_,RI_,da_,i_,o_,u_,EOM_};
static const u8 daiou_menu0[] = {ka_,ku_,re_,te_,i_,ru_,EOM_};
static const u8 daiou_menu1[] = {ya_,si_,ki_,no_,na_,ka_,EOM_};
static const u8 daiou_menu2[] = {ho_,u_,bi_,wa_,ta_,si_,EOM_};
static const u8 daiou_menu3[] = {si_,ka_,ke_,ti_,yu_,u_,EOM_};
static const u8 daiou_menu4[] = {ta_,bi_,da_,ttu_,ta_,EOM_};

static const MENU_ITEM	DaiouMenuList[] =
{
	{ daiou_menu0,MenuDummy },
	{ daiou_menu1,MenuDummy },
	{ daiou_menu2,MenuDummy },
	{ daiou_menu3,MenuDummy },
	{ daiou_menu4,MenuDummy },
};

/*----------------------------------------------------------------------------------*/

static const u8 nick_mes[]={ PO_,KE_,MO_,N_,me_,i_,EOM_,};
static const u8 buri_mes[]={ BU_,RI_,bou_,DA_,bou_,me_,i_,EOM_,};
/*==================================================================*/
/*                      ROUTIN                                      */
/*==================================================================*/
//フィールドからのデバッグメニュー用
u8 DebugTomoTest(void)
{
	MainMenuBlt();
	return( 0 );
}

/*==================================================================*/
/*==================================================================*/
//フィールドへの復帰設定(..ReturnProcからの復帰)
void FieldBgEffectTestEnd( void )
{
	FieldScriptRecover();
}

/*==================================================================*/
/*               STATIC ROUTIN                                      */
/*==================================================================*/
//メインメニュー作成
static u8 MainMenuBlt(void)
{
	NMenuScreenClear();
	NMenuWinBoxWrite( 0, 0, MAIN_MENU_X, MAIN_MENU_Y );
	NMenuFixListWrite( 2, 1,MAIN_MENU_MAX, MainMenuList );
	NMenuVCursorInit( 1, 1,MAIN_MENU_MAX, debugMainPick );
	MenuFunc = MainMenu;

	return 0;
}

/*==================================================================*/
/*==================================================================*/
//メインメニュー内の動作
static u8 MainMenu(void)
{
	MENUFUNC func;

	if( sys.Trg & U_KEY )
	{
		SePlay(SE_SELECT);
		debugMainPick = NMenuVCursorSet(-1);
	}
	if( sys.Trg & D_KEY ){
		SePlay(SE_SELECT);
		debugMainPick = NMenuVCursorSet(1);
	}

	if( sys.Trg & A_BUTTON )
	{
		SePlay(SE_SELECT);
		func = MainMenuList[debugMainPick].ptr;
		return	func();
	}

	if( sys.Trg & B_BUTTON || sys.Trg & START_BUTTON )
	{
		MenuEnd();
		return( 1 );
	}

	return( 0 );
}

/*==================================================================*/
/*==================================================================*/
//サブメニュー作成(コンテスト)
static u8 MainContestBlt(void)
{
	NMenuScreenClear();
	NMenuWinBoxWrite( 0, 0, MAIN_CONTEST_X, MAIN_CONTEST_Y );
	NMenuMsgWrite(contest_title,1, 1);
	NMenuFixListWrite( 2, 3,MAIN_CONTEST_MAX, MainContestList );
	NMenuVCursorInit( 1, 3,MAIN_CONTEST_MAX, 0 );
	MenuFunc = MainContest;

	mons_no = POKE_NO_MIN;
	id_no = 28467;					//ダミー
	rand_no = 0;
	contest_no = 1;

	return 0;
}

/*==================================================================*/
/*==================================================================*/
//サブメニュー作成(美術館)
static u8 MainMuseumBlt(void)
{
	NMenuScreenClear();
	NMenuWinBoxWrite( 0, 0, MAIN_MUSEUM_X, MAIN_MUSEUM_Y );
	NMenuMsgWrite(museum_title,1, 1);
	NMenuFixListWrite( 2, 3,MAIN_MUSEUM_MAX, MainMuseumList );
	NMenuVCursorInit( 1, 3,MAIN_MUSEUM_MAX, 0 );
	MenuFunc = MainMuseum;

	mons_no = POKE_NO_MIN;
	id_no = 28467;					//ダミー
	rand_no = 0;
	title_no = 1;

	return 0;
}

/*==================================================================*/
/*==================================================================*/
//サブメニュー作成(プレビュー)
static u8 SubMenu2Blt(void)
{
	NMenuScreenClear();
	NMenuWinBoxWrite( 0, 0, SUB_MENU2_X, SUB_MENU2_Y );
	NMenuMsgWrite(preview_title,1, 1);
	NMenuFixListWrite( 2, 3,SUB_MENU2_MAX, SubMenu2List );
	NMenuVCursorInit( 1, 3,SUB_MENU2_MAX, 0 );
	MenuFunc = SubMenu2;

	mons_no = POKE_NO_MIN;
	id_no = 28467;					//ダミー
	rand_no = 0;
	pre_no = 1;

	return 0;
}

/*==================================================================*/
/*==================================================================*/
//サブメニュー作成(カラクリ関連)
static u8 MainKarakuriBlt(void)
{
	NMenuScreenClear();
	NMenuWinBoxWrite( 0, 0, KARAKURI_MAIN_MENU_X, KARAKURI_MAIN_MENU_Y );
	NMenuMsgWrite(main_karakuri_title,1, 1);
	NMenuFixListWrite( 2, 3,KARAKURI_MAIN_MENU_MAX, MainKarakuriList );
	NMenuVCursorInit( 1, 3,KARAKURI_MAIN_MENU_MAX, debugKarakuriPick );
	MenuFunc = MainKarakuri;
	return 0;
}
/*==================================================================*/
/*==================================================================*/
//サブメニュー作成(イベント操作)
static u8 MainEventBlt(void)
{
	NMenuScreenClear();
	NMenuWinBoxWrite( 0, 0, EVENT_CTRL_MENU_X, EVENT_CTRL_MENU_Y );
	NMenuFixListWrite( 2, 1,EVENT_CTRL_MENU_MAX, MainEventList );
	NMenuVCursorInit( 1, 1,EVENT_CTRL_MENU_MAX, debugEventPick );
	MenuFunc = MainEvent;
	return 0;
}

/*==================================================================*/
/*==================================================================*/
//サブメニュー作成(フラグ操作)
static u8 MainFlagBlt(void)
{
	NMenuScreenClear();
	NMenuWinBoxWrite( 0, 0, FLAG_CTRL_X, FLAG_CTRL_Y );
	NMenuFixListWrite( 2, 1,FLAG_CTRL_MAX, MainFlagList );
	NMenuVCursorInit( 1, 1,FLAG_CTRL_MAX, debugFlagPick );
	MenuFunc = MainFlag;
	return 0;
}

/*==================================================================*/
/*==================================================================*/
//サブメニュー作成(ワーク操作)
static u8 MainWorkBlt(void)
{
	NMenuScreenClear();
	NMenuWinBoxWrite( 0, 0, WORK_CTRL_MENU_X, WORK_CTRL_MENU_Y );
	NMenuFixListWrite( 2, 1,WORK_CTRL_MENU_MAX, MainWorkList );
	NMenuVCursorInit( 1, 1,WORK_CTRL_MENU_MAX, debugWorkPick );
	MenuFunc = MainWork;
	return 0;
}

/*==================================================================*/
/*==================================================================*/
//サブメニュー(コンテスト)
static u8 MainContest(void)
{
	s8	flag,pos;

	flag = NMenuVCursorControl();
	pos = NMenuVCursorPosGet() ;
	
	switch(pos){
	case 0:
		mons_no_check();
		break;
	case 1:
		rand_no_check();
		break;
	case 2:
		contest_no_check();
		break;
	}

	no_str_print(0);

	if( flag == CURSOR_DEFAULT_VALUE )
	{
		return( 0 );
	}

	if( flag == CURSOR_CANCEL_VALUE )
	{
		MenuEnd();
		return( 1 );
	}

	if(flag==3){
		MenuFunc = MainContestList[flag].ptr;
	}

	return( 0 );
}

/*==================================================================*/
/*==================================================================*/
//サブメニュー(美術館)
static u8 MainMuseum(void)
{
	s8	flag,pos;

	flag = NMenuVCursorControl();
	pos = NMenuVCursorPosGet() ;

	switch(pos){
	case 0:
		mons_no_check();
		break;
	case 1:
		rand_no_check();
		break;
	case 2:
		title_no_check();
		break;
	}

	no_str_print(1);
	
	if( flag == CURSOR_DEFAULT_VALUE ) {
		return( 0 );
	}

	if( flag == CURSOR_CANCEL_VALUE ) {
		MenuEnd();
		return( 1 );
	}

	if(flag==3){
		MenuFunc = MainMuseumList[flag].ptr;
	}

	return( 0 );
}

/*==================================================================*/
/*==================================================================*/
//サブメニュー(プレビュー)
static u8 SubMenu2(void)
{
	s8	flag,pos;

	flag = NMenuVCursorControl();
	pos = NMenuVCursorPosGet() ;

	switch(pos){
	case 0:
		mons_no_check();
		break;
	case 1:
		rand_no_check();
		break;
	case 2:
		pre_no_check();
		break;
	}

	no_str_print(2);
	
	if( flag == CURSOR_DEFAULT_VALUE ) {
		return( 0 );
	}

	if( flag == CURSOR_CANCEL_VALUE ) {
		MenuEnd();
		return( 1 );
	}

	if(flag==3){
		MenuFunc = SubMenu2List[flag].ptr;
	}

	return( 0 );
}

/*==================================================================*/
/*==================================================================*/
//サブメニュー(カラクリ関連)
static u8 MainKarakuri(void)
{
	MENUFUNC func;

	if( sys.Trg & U_KEY )
	{
		SePlay(SE_SELECT);
		debugKarakuriPick = NMenuVCursorSet(-1);
	}
	if( sys.Trg & D_KEY ){
		SePlay(SE_SELECT);
		debugKarakuriPick = NMenuVCursorSet(1);
	}

	if( sys.Trg & A_BUTTON )
	{
		SePlay(SE_SELECT);
		func = MainKarakuriList[debugKarakuriPick].ptr;
		return	func();
	}

	if( sys.Trg & B_BUTTON || sys.Trg & START_BUTTON )
	{
		MenuEnd();
		return( 1 );
	}

	return( 0 );
}

/*==================================================================*/
/*==================================================================*/
//サブメニュー(イベント操作)
static u8 MainEvent(void)
{
	MENUFUNC func;

	if( sys.Trg & U_KEY )
	{
		SePlay(SE_SELECT);
		debugEventPick = NMenuVCursorSet(-1);
	}
	if( sys.Trg & D_KEY ){
		SePlay(SE_SELECT);
		debugEventPick = NMenuVCursorSet(1);
	}

	if( sys.Trg & A_BUTTON )
	{
		SePlay(SE_SELECT);
		func = MainEventList[debugEventPick].ptr;
		return	func();
	}

	if( sys.Trg & B_BUTTON || sys.Trg & START_BUTTON )
	{
		MenuEnd();
		return( 1 );
	}

	return( 0 );
}

/*==================================================================*/
/*==================================================================*/
//サブメニュー(フラグ操作)
static u8 MainFlag(void)
{
	MENUFUNC func;

	if( sys.Trg & U_KEY )
	{
		SePlay(SE_SELECT);
		debugFlagPick = NMenuVCursorSet(-1);
	}
	if( sys.Trg & D_KEY ){
		SePlay(SE_SELECT);
		debugFlagPick = NMenuVCursorSet(1);
	}

	if( sys.Trg & A_BUTTON )
	{
		SePlay(SE_SELECT);
		func = MainFlagList[debugFlagPick].ptr;
		return	func();
	}

	if( sys.Trg & B_BUTTON || sys.Trg & START_BUTTON )
	{
		MenuEnd();
		return( 1 );
	}

	return( 0 );
}

/*==================================================================*/
//サブメニュー(ワーク操作)
static u8 MainWork(void)
{
	MENUFUNC func;

	if( sys.Trg & U_KEY )
	{
		SePlay(SE_SELECT);
		debugWorkPick = NMenuVCursorSet(-1);
	}
	if( sys.Trg & D_KEY ){
		SePlay(SE_SELECT);
		debugWorkPick = NMenuVCursorSet(1);
	}

	if( sys.Trg & A_BUTTON )
	{
		SePlay(SE_SELECT);
		func = MainWorkList[debugWorkPick].ptr;
		return	func();
	}

	if( sys.Trg & B_BUTTON || sys.Trg & START_BUTTON )
	{
		MenuEnd();
		return( 1 );
	}

	return( 0 );
}

/*==================================================================*/
/*==================================================================*/
//イベントpart1
static u8 event_part1_menu_blt(void)
{
	NMenuScreenClear();
	NMenuWinBoxWrite( 0, 0, EVENT_PART1_MENU_X, EVENT_PART1_MENU_Y );
	NMenuFixListWrite( 2, 1,EVENT_PART1_MENU_MAX, EventCtrl0MenuList );
	NMenuVCursorInit( 1, 1,EVENT_PART1_MENU_MAX, 0 );
	MenuFunc = EventCtrl0Menu;
	return 0;
}

/*==================================================================*/
//イベントpart2
static u8 event_part2_menu_blt(void)
{
	NMenuScreenClear();
	NMenuWinBoxWrite( 0, 0, EVENT_PART2_MENU_X, EVENT_PART2_MENU_Y );
	NMenuFixListWrite( 2, 1,EVENT_PART2_MENU_MAX, EventCtrl1MenuList );
	NMenuVCursorInit( 1, 1,EVENT_PART2_MENU_MAX, 0 );
	MenuFunc = EventCtrl1Menu;
	return 0;
}

/*==================================================================*/
//
static u8 EventCtrl0Menu(void)
{
	s8	flag;

	flag = NMenuVCursorControl();

	if( flag == CURSOR_DEFAULT_VALUE ) {
		return( 0 );
	}

	if( flag == CURSOR_CANCEL_VALUE ) {
		MenuEnd();
		return( 1 );
	}

	MenuFunc = EventCtrl0MenuList[flag].ptr;
	return( 0 );
}

/*==================================================================*/
//
static u8 EventCtrl1Menu(void)
{
	s8	flag;

	flag = NMenuVCursorControl();

	if( flag == CURSOR_DEFAULT_VALUE ) {
		return( 0 );
	}

	if( flag == CURSOR_CANCEL_VALUE ) {
		MenuEnd();
		return( 1 );
	}

	MenuFunc = EventCtrl1MenuList[flag].ptr;
	return( 0 );
}


/*==================================================================*/
//クリア後へ
static u8 event_kuriago_set(void)
{
	StartFieldScript(ev_debug_game_clar);
	MenuEnd();
	return( 1 );
}

/*==================================================================*/
//コイン購入可能状態へ
static u8 event_koin_set(void)
{
	StartFieldScript(ev_koin_buy_ok);
	MenuEnd();
	return( 1 );
}

/*==================================================================*/
//コトキサポーターセット
static u8 event_kotoki_support_set(void)
{
	StartFieldScript(ev_kotoki_support_set);
	MenuEnd();
	return( 1 );
}

/*==================================================================*/
//ニューキンセツ解放(入れる)状態
static u8 event_new_kinsetu_open_set(void)
{
	StartFieldScript(ev_new_kinsetu_open_set);
	MenuEnd();
	return( 1 );
}

/*==================================================================*/
//船に乗れる状態（＋ゲームクリア）
static u8 event_fune_go_ok_set(void)
{
	StartFieldScript(ev_fune_go_ok_set);
	MenuEnd();
	return( 1 );
}

/*==================================================================*/
//タマゴを追加
static u8 event_add_tamago(void)
{
	StartFieldScript(ev_add_tamago);
	MenuEnd();
	return( 1 );
}

/*==================================================================*/
//アイテムを満タンへ
static u8 event_item_over_set(void)
{
	StartFieldScript(ev_item_over_set);
	MenuEnd();
	return( 1 );
}

/*==================================================================*/
//グッズを満タンへ
static u8 event_goods_over_set(void)
{
	StartFieldScript(ev_goods_over_set);
	MenuEnd();
	return( 1 );
}

/*==================================================================*/
//コインを満タンへ
static u8 event_coin_over_set(void)
{
	StartFieldScript(ev_coin_over_set);
	MenuEnd();
	return( 1 );
}

/*==================================================================*/
//ムロジムの扉が開いている状態へ
static u8 event_muro_gym_open_set(void)
{
	StartFieldScript(ev_muro_gym_open_set);
	MenuEnd();
	return( 1 );
}

/*==================================================================*/
//お金を０へ
static u8 event_my_gold_zero_set(void)
{
	StartFieldScript(ev_my_gold_zero_set);
	MenuEnd();
	return( 1 );
}

/*==================================================================*/
//キノココをフル
static u8 event_kinokoko_full(void)
{
	StartFieldScript(ev_kinokoko_full);
	MenuEnd();
	return( 1 );
}

/*==================================================================*/
//ドジョッチをフル
static u8 event_dozyotti_full(void)
{
	StartFieldScript(ev_dozyotti_full);
	MenuEnd();
	return( 1 );
}

/*==================================================================*/
//キノココタマゴ
static u8 event_kinokoko_tamago(void)
{
	StartFieldScript(ev_kinokoko_tamago);
	MenuEnd();
	return( 1 );
}

/*==================================================================*/
//ドジョッチタマゴ
static u8 event_dozyotti_tamago(void)
{
	StartFieldScript(ev_dozyotti_tamago);
	MenuEnd();
	return( 1 );
}


/*==================================================================*/
/*==================================================================*/
//コンテストへ
static u8 go_con(void)
{
	PaletteFadeReq( 0xffffffff, 0, 0, 16, 0 );
	MenuFunc = go_con2;
	return( 0 );
}

/*==================================================================*/
/*==================================================================*/
static u8 go_con2(void)
{
	if( !(PaletteAnime()) ) {
		MenuEnd();

		portraite_work_set(0);

		MainProcChange(contest_picture_init);
		sys.pReturnProc = FieldBgEffectTestEnd;
		return( 1 );
	}

	return 0;
}

/*==================================================================*/
/*==================================================================*/
//美術館へ
static u8 go_mus(void)
{
	PaletteFadeReq( 0xffffffff, 0, 0, 16, 0 );
	MenuFunc = go_mus2;
	return( 0 );
}

/*==================================================================*/
/*==================================================================*/
static u8 go_mus2(void)
{
	if( !(PaletteAnime()) ) {
		MenuEnd();

		portraite_work_set(1);

		MainProcChange(contest_picture_init);
		sys.pReturnProc = FieldBgEffectTestEnd;
		return( 1 );
	}

	return 0;
}

/*==================================================================*/
/*==================================================================*/
//イベントフラグメニュー
static u8 flag_event_menu_blt(void)
{
	NMenuScreenClear();
	NMenuWinBoxWrite( 0, 0, EVENT_FLAG_MENU_X, EVENT_FLAG_MENU_Y );
	NMenuFixListWrite( 2, 1,EVENT_FLAG_MENU_MAX, EventFlagMenuList );
	NMenuVCursorInit( 1, 1,EVENT_FLAG_MENU_MAX, 0 );
	MenuFunc = EventFlagMenu;
	return 0;
}

/*==================================================================*/
//
static u8 EventFlagMenu(void)
{
	s8	flag;

	flag = NMenuVCursorControl();

	if( flag == CURSOR_DEFAULT_VALUE ) {
		return( 0 );
	}

	if( flag == CURSOR_CANCEL_VALUE ) {
		MenuEnd();
		return( 1 );
	}

	MenuFunc = EventFlagMenuList[flag].ptr;

	return( 0 );
}

/*==================================================================*/

static u8 event_flag_menu_0_blt(void)
{
	NMenuScreenClear();
	NMenuWinBoxWrite( 0, 0, EVENT_FLAG0_MENU_X, EVENT_FLAG0_MENU_Y );
	NMenuFixListWrite( 2, 1,EVENT_FLAG0_MENU_MAX, EventFlag0MenuList );
	NMenuVCursorInit( 1, 1,EVENT_FLAG0_MENU_MAX, 0 );
	MenuModeFlag = 0;
	MenuFunc = EventFlagSubMenu;
	return 0;
}

/*==================================================================*/

static u8 event_flag_menu_1_blt(void)
{
	NMenuScreenClear();
	NMenuWinBoxWrite( 0, 0, EVENT_FLAG1_MENU_X, EVENT_FLAG1_MENU_Y );
	NMenuFixListWrite( 2, 1,EVENT_FLAG1_MENU_MAX, EventFlag1MenuList );
	NMenuVCursorInit( 1, 1,EVENT_FLAG1_MENU_MAX, 0 );
	MenuModeFlag = 1;
	MenuFunc = EventFlagSubMenu;
	return 0;
}

/*==================================================================*/

static u8 event_flag_menu_2_blt(void)
{
	NMenuScreenClear();
	NMenuWinBoxWrite( 0, 0, EVENT_FLAG2_MENU_X, EVENT_FLAG2_MENU_Y );
	NMenuFixListWrite( 2, 1,EVENT_FLAG2_MENU_MAX, EventFlag2MenuList );
	NMenuVCursorInit( 1, 1,EVENT_FLAG2_MENU_MAX, 0 );
	MenuModeFlag = 2;
	MenuFunc = EventFlagSubMenu;
	return 0;
}

/*==================================================================*/

static u8 event_flag_menu_3_blt(void)
{
	NMenuScreenClear();
	NMenuWinBoxWrite( 0, 0, EVENT_FLAG3_MENU_X, EVENT_FLAG3_MENU_Y );
	NMenuFixListWrite( 2, 1,EVENT_FLAG3_MENU_MAX, EventFlag3MenuList );
	NMenuVCursorInit( 1, 1,EVENT_FLAG3_MENU_MAX, 0 );
	MenuModeFlag = 3;
	MenuFunc = EventFlagSubMenu;
	return 0;
}

/*==================================================================*/

static u8 event_flag_menu_4_blt(void)
{
	NMenuScreenClear();
	NMenuWinBoxWrite( 0, 0, EVENT_FLAG4_MENU_X, EVENT_FLAG4_MENU_Y );
	NMenuFixListWrite( 2, 1,EVENT_FLAG4_MENU_MAX, EventFlag4MenuList );
	NMenuVCursorInit( 1, 1,EVENT_FLAG4_MENU_MAX, 0 );
	MenuModeFlag = 4;
	MenuFunc = EventFlagSubMenu;
	return 0;
}

/*==================================================================*/

static u8 event_flag_menu_5_blt(void)
{
	NMenuScreenClear();
	NMenuWinBoxWrite( 0, 0, EVENT_FLAG5_MENU_X, EVENT_FLAG5_MENU_Y );
	NMenuFixListWrite( 2, 1,EVENT_FLAG5_MENU_MAX, EventFlag5MenuList );
	NMenuVCursorInit( 1, 1,EVENT_FLAG5_MENU_MAX, 0 );
	MenuModeFlag = 5;
	MenuFunc = EventFlagSubMenu;
	return 0;
}

/*==================================================================*/

static u8 event_flag_menu_6_blt(void)
{
	NMenuScreenClear();
	NMenuWinBoxWrite( 0, 0, EVENT_FLAG6_MENU_X, EVENT_FLAG6_MENU_Y );
	NMenuFixListWrite( 2, 1,EVENT_FLAG6_MENU_MAX, EventFlag6MenuList );
	NMenuVCursorInit( 1, 1,EVENT_FLAG6_MENU_MAX, 0 );
	MenuModeFlag = 6;
	MenuFunc = EventFlagSubMenu;
	return 0;
}

/*==================================================================*/

static u8 event_flag_menu_7_blt(void)
{
	NMenuScreenClear();
	NMenuWinBoxWrite( 0, 0, EVENT_FLAG7_MENU_X, EVENT_FLAG7_MENU_Y );
	NMenuFixListWrite( 2, 1,EVENT_FLAG7_MENU_MAX, EventFlag7MenuList );
	NMenuVCursorInit( 1, 1,EVENT_FLAG7_MENU_MAX, 0 );
	MenuModeFlag = 7;
	MenuFunc = EventFlagSubMenu;
	return 0;
}

/*==================================================================*/

static u8 event_flag_menu_8_blt(void)
{
	NMenuScreenClear();
	NMenuWinBoxWrite( 0, 0, EVENT_FLAG8_MENU_X, EVENT_FLAG8_MENU_Y );
	NMenuFixListWrite( 2, 1,EVENT_FLAG8_MENU_MAX, EventFlag8MenuList );
	NMenuVCursorInit( 1, 1,EVENT_FLAG8_MENU_MAX, 0 );
	MenuModeFlag = 8;
	MenuFunc = EventFlagSubMenu;
	return 0;
}

/*==================================================================*/

static u8 EventFlagSubMenu(void)
{
	s8	flag,pos;

	flag = NMenuVCursorControl();
	pos = NMenuVCursorPosGet() ;

	ef_no_check(MenuModeFlag,pos);
	event_flag_str_print(MenuModeFlag);

	if( flag == CURSOR_DEFAULT_VALUE ) {
		return( 0 );
	}

	if( flag == CURSOR_CANCEL_VALUE ) {
		MenuEnd();
		return( 1 );
	}

	return( 0 );
}

/*==================================================================*/

static void	ef_no_check(u8 mode,u8 no)
{
	if((sys.Trg & R_BUTTON)||(sys.Trg & R_BUTTON)){
		if( EventFlagCheck(EventFlagHeader[mode][no]) == 0 ){
			EventFlagSet(EventFlagHeader[mode][no]);
		}else{
			EventFlagReset(EventFlagHeader[mode][no]);
		}
	}
}

/*==================================================================*/
static void	event_flag_str_print(u8 mode)
{
	u8 i;

	for(i=0;i<EventFlagMaxTbl[mode];i++){
		flag_msg_write(EVENT_FLAG_STR_X_LEN,1+i*2 ,(EventFlagCheck(EventFlagHeader[mode][i]) != 0));
	}
}

/*==================================================================*/
/*==================================================================*/
static u8 flag_vanish_menu_blt(void)
{
	NMenuScreenClear();
	NMenuWinBoxWrite( 0, 0, VANISH_FLAG_MENU_X, VANISH_FLAG_MENU_Y );
	NMenuFixListWrite( 2, 1,VANISH_FLAG_MENU_MAX, FlagVanishMenuList );
	NMenuVCursorInit( 1, 1,VANISH_FLAG_MENU_MAX, 0 );
	MenuFunc = FlagVanishMenu;
	return 0;
}

/*==================================================================*/
//
static u8 FlagVanishMenu(void)
{
	s8	flag;

	flag = NMenuVCursorControl();

	if( flag == CURSOR_DEFAULT_VALUE ) {
		return( 0 );
	}

	if( flag == CURSOR_CANCEL_VALUE ) {
		MenuEnd();
		return( 1 );
	}

	MenuFunc = FlagVanishMenuList[flag].ptr;

	return( 0 );
}

/*==================================================================*/
static u8 flag_vanish_menu_0_blt(void)
{
	NMenuScreenClear();
	NMenuWinBoxWrite( 0, 0, VANISH_FLAG0_MENU_X, VANISH_FLAG0_MENU_Y );
	NMenuFixListWrite( 2, 1,VANISH_FLAG0_MENU_MAX, FlagVanish0MenuList );
	NMenuVCursorInit( 1, 1,VANISH_FLAG0_MENU_MAX, 0 );
	MenuModeFlag = 0;
	MenuFunc = FlagVanishSubMenu;
	return 0;
}

/*==================================================================*/
static u8 flag_vanish_menu_1_blt(void)
{
	NMenuScreenClear();
	NMenuWinBoxWrite( 0, 0, VANISH_FLAG1_MENU_X, VANISH_FLAG1_MENU_Y );
	NMenuFixListWrite( 2, 1,VANISH_FLAG1_MENU_MAX, FlagVanish1MenuList );
	NMenuVCursorInit( 1, 1,VANISH_FLAG1_MENU_MAX, 0 );
	MenuModeFlag = 1;
	MenuFunc = FlagVanishSubMenu;
	return 0;
}

/*==================================================================*/
static u8 flag_vanish_menu_2_blt(void)
{
	NMenuScreenClear();
	NMenuWinBoxWrite( 0, 0, VANISH_FLAG2_MENU_X, VANISH_FLAG2_MENU_Y );
	NMenuFixListWrite( 2, 1,VANISH_FLAG2_MENU_MAX, FlagVanish2MenuList );
	NMenuVCursorInit( 1, 1,VANISH_FLAG2_MENU_MAX, 0 );
	MenuModeFlag = 2;
	MenuFunc = FlagVanishSubMenu;
	return 0;
}

/*==================================================================*/
static u8 flag_vanish_menu_3_blt(void)
{
	NMenuScreenClear();
	NMenuWinBoxWrite( 0, 0, VANISH_FLAG3_MENU_X, VANISH_FLAG3_MENU_Y );
	NMenuFixListWrite( 2, 1,VANISH_FLAG3_MENU_MAX, FlagVanish3MenuList );
	NMenuVCursorInit( 1, 1,VANISH_FLAG3_MENU_MAX, 0 );
	MenuModeFlag = 3;
	MenuFunc = FlagVanishSubMenu;
	return 0;
}

/*==================================================================*/
static u8 flag_vanish_menu_4_blt(void)
{
	NMenuScreenClear();
	NMenuWinBoxWrite( 0, 0, VANISH_FLAG4_MENU_X, VANISH_FLAG4_MENU_Y );
	NMenuFixListWrite( 2, 1,VANISH_FLAG4_MENU_MAX, FlagVanish4MenuList );
	NMenuVCursorInit( 1, 1,VANISH_FLAG4_MENU_MAX, 0 );
	MenuModeFlag = 4;
	MenuFunc = FlagVanishSubMenu;
	return 0;
}

/*==================================================================*/
static u8 flag_vanish_menu_5_blt(void)
{
	NMenuScreenClear();
	NMenuWinBoxWrite( 0, 0, VANISH_FLAG5_MENU_X, VANISH_FLAG5_MENU_Y );
	NMenuFixListWrite( 2, 1,VANISH_FLAG5_MENU_MAX, FlagVanish5MenuList );
	NMenuVCursorInit( 1, 1,VANISH_FLAG5_MENU_MAX, 0 );
	MenuModeFlag = 5;
	MenuFunc = FlagVanishSubMenu;
	return 0;
}

/*==================================================================*/
static u8 flag_vanish_menu_6_blt(void)
{
	NMenuScreenClear();
	NMenuWinBoxWrite( 0, 0, VANISH_FLAG6_MENU_X, VANISH_FLAG6_MENU_Y );
	NMenuFixListWrite( 2, 1,VANISH_FLAG6_MENU_MAX, FlagVanish6MenuList );
	NMenuVCursorInit( 1, 1,VANISH_FLAG6_MENU_MAX, 0 );
	MenuModeFlag = 6;
	MenuFunc = FlagVanishSubMenu;
	return 0;
}

/*==================================================================*/
static u8 flag_vanish_menu_7_blt(void)
{
	NMenuScreenClear();
	NMenuWinBoxWrite( 0, 0, VANISH_FLAG7_MENU_X, VANISH_FLAG7_MENU_Y );
	NMenuFixListWrite( 2, 1,VANISH_FLAG7_MENU_MAX, FlagVanish7MenuList );
	NMenuVCursorInit( 1, 1,VANISH_FLAG7_MENU_MAX, 0 );
	MenuModeFlag = 7;
	MenuFunc = FlagVanishSubMenu;
	return 0;
}

/*==================================================================*/
static u8 flag_vanish_menu_8_blt(void)
{
	NMenuScreenClear();
	NMenuWinBoxWrite( 0, 0, VANISH_FLAG8_MENU_X, VANISH_FLAG8_MENU_Y );
	NMenuFixListWrite( 2, 1,VANISH_FLAG8_MENU_MAX, FlagVanish8MenuList );
	NMenuVCursorInit( 1, 1,VANISH_FLAG8_MENU_MAX, 0 );
	MenuModeFlag = 8;
	MenuFunc = FlagVanishSubMenu;
	return 0;
}

/*==================================================================*/
static u8 FlagVanishSubMenu(void)
{
	s8	flag,pos;

	flag = NMenuVCursorControl();
	pos = NMenuVCursorPosGet() ;

	vf_no_check(MenuModeFlag,pos);
	vanish_flag_str_print(MenuModeFlag);

	if( flag == CURSOR_DEFAULT_VALUE ) {
		return( 0 );
	}

	if( flag == CURSOR_CANCEL_VALUE ) {
		MenuEnd();
		return( 1 );
	}

	return( 0 );
}

/*==================================================================*/
static void	vf_no_check(u8 mode,u8 no)
{
	if((sys.Trg & R_BUTTON)||(sys.Trg & R_BUTTON)){
		if( EventFlagCheck(FlagVanishHeader[mode][no]) == 0 ){
			EventFlagSet(FlagVanishHeader[mode][no]);
		}else{
			EventFlagReset(FlagVanishHeader[mode][no]);
		}
	}
}

/*==================================================================*/
static void	vanish_flag_str_print(u8 mode)
{
	u8 i;

	for(i=0;i<FlagVanishMaxTbl[mode];i++){
		flag_msg_write(VANISH_FLAG_STR_X_LEN,1+i*2 ,(EventFlagCheck(FlagVanishHeader[mode][i]) != 0));
	}
}

/*==================================================================*/
/*==================================================================*/

static u8 flag_trainer_menu_blt(void)
{
	NMenuScreenClear();
	NMenuWinBoxWrite( 0, 0, TRAINER_FLAG_MENU_X, TRAINER_FLAG_MENU_Y );
	NMenuFixListWrite( 2, 1,TRAINER_FLAG_MENU_MAX, FlagTrainerMenuList );
	NMenuVCursorInit( 1, 1,TRAINER_FLAG_MENU_MAX, 0 );
	MenuFunc = FlagTrainerMenu;
	return 0;
}

/*==================================================================*/
//
static u8 FlagTrainerMenu(void)
{
	s8	flag;

	flag = NMenuVCursorControl();

	if( flag == CURSOR_DEFAULT_VALUE ) {
		return( 0 );
	}

	if( flag == CURSOR_CANCEL_VALUE ) {
		MenuEnd();
		return( 1 );
	}

	MenuFunc = FlagTrainerMenuList[flag].ptr;

	return( 0 );
}

/*==================================================================*/
static u8 flag_trainer_menu_0_blt(void)
{
	NMenuScreenClear();
	NMenuWinBoxWrite( 0, 0, TRAINER_FLAG0_MENU_X, TRAINER_FLAG0_MENU_Y );
	NMenuFixListWrite( 2, 1,TRAINER_FLAG0_MENU_MAX, FlagTrainer0MenuList );
	NMenuVCursorInit( 1, 1,TRAINER_FLAG0_MENU_MAX, 0 );
	MenuModeFlag = 0;
	MenuFunc = FlagTrainerSubMenu;
	return 0;
}

/*==================================================================*/
static u8 flag_trainer_menu_1_blt(void)
{
	NMenuScreenClear();
	NMenuWinBoxWrite( 0, 0, TRAINER_FLAG1_MENU_X, TRAINER_FLAG1_MENU_Y );
	NMenuFixListWrite( 2, 1,TRAINER_FLAG1_MENU_MAX, FlagTrainer1MenuList );
	NMenuVCursorInit( 1, 1,TRAINER_FLAG1_MENU_MAX, 0 );
	MenuModeFlag = 1;
	MenuFunc = FlagTrainerSubMenu;
	return 0;
}

/*==================================================================*/
static u8 flag_trainer_menu_2_blt(void)
{
	NMenuScreenClear();
	NMenuWinBoxWrite( 0, 0, TRAINER_FLAG2_MENU_X, TRAINER_FLAG2_MENU_Y );
	NMenuFixListWrite( 2, 1,TRAINER_FLAG2_MENU_MAX, FlagTrainer2MenuList );
	NMenuVCursorInit( 1, 1,TRAINER_FLAG2_MENU_MAX, 0 );
	MenuModeFlag = 2;
	MenuFunc = FlagTrainerSubMenu;
	return 0;
}

/*==================================================================*/
static u8 FlagTrainerSubMenu(void)
{
	s8	flag,pos;

	flag = NMenuVCursorControl();
	pos = NMenuVCursorPosGet() ;

	tf_no_check(MenuModeFlag,pos);
	trainer_flag_str_print(MenuModeFlag);

	if( flag == CURSOR_DEFAULT_VALUE ) {
		return( 0 );
	}

	if( flag == CURSOR_CANCEL_VALUE ) {
		MenuEnd();
		return( 1 );
	}

	return( 0 );
}

/*==================================================================*/
static void	tf_no_check(u8 mode,u8 no)
{
	if((sys.Trg & R_BUTTON)||(sys.Trg & R_BUTTON)){
		if( EventFlagCheck(FlagTrainerHeader[mode][no]) == 0 ){
			EventFlagSet(FlagTrainerHeader[mode][no]);
		}else{
			EventFlagReset(FlagTrainerHeader[mode][no]);
		}
	}
}

/*==================================================================*/
static void	trainer_flag_str_print(u8 mode)
{
	u8 i;

	for(i=0;i<FlagTrainerMaxTbl[mode];i++){
		flag_msg_write(TRAINER_FLAG_STR_X_LEN,1+i*2 ,(EventFlagCheck(FlagTrainerHeader[mode][i]) != 0));
	}
}

/*==================================================================*/
/*==================================================================*/

static u8 flag_sys_menu_blt(void)
{
	NMenuScreenClear();
	NMenuWinBoxWrite( 0, 0, SYS_FLAG_MENU_X, SYS_FLAG_MENU_Y );
	NMenuFixListWrite( 2, 1,SYS_FLAG_MENU_MAX, SysFlagMenuList );
	NMenuVCursorInit( 1, 1,SYS_FLAG_MENU_MAX, 0 );
	MenuFunc = SysFlagMenu;
	return 0;
}

/*==================================================================*/
//
static u8 SysFlagMenu(void)
{
	s8	flag;

	flag = NMenuVCursorControl();

	if( flag == CURSOR_DEFAULT_VALUE ) {
		return( 0 );
	}

	if( flag == CURSOR_CANCEL_VALUE ) {
		MenuEnd();
		return( 1 );
	}

	MenuFunc = SysFlagMenuList[flag].ptr;

	return( 0 );
}

/*==================================================================*/

static u8 sys_flag_menu_0_blt(void)
{
	NMenuScreenClear();
	NMenuWinBoxWrite( 0, 0, SYS_FLAG0_MENU_X, SYS_FLAG0_MENU_Y );
	NMenuFixListWrite( 2, 1,SYS_FLAG0_MENU_MAX, SysFlag0MenuList );
	NMenuVCursorInit( 1, 1,SYS_FLAG0_MENU_MAX, 0 );
	MenuModeFlag = 0;
	MenuFunc = SysFlagSubMenu;
	return 0;
}

/*==================================================================*/

static u8 sys_flag_menu_1_blt(void)
{
	NMenuScreenClear();
	NMenuWinBoxWrite( 0, 0, SYS_FLAG1_MENU_X, SYS_FLAG1_MENU_Y );
	NMenuFixListWrite( 2, 1,SYS_FLAG1_MENU_MAX, SysFlag1MenuList );
	NMenuVCursorInit( 1, 1,SYS_FLAG1_MENU_MAX, 0 );
	MenuModeFlag = 1;
	MenuFunc = SysFlagSubMenu;
	return 0;
}

/*==================================================================*/

static u8 sys_flag_menu_2_blt(void)
{
	NMenuScreenClear();
	NMenuWinBoxWrite( 0, 0, SYS_FLAG2_MENU_X, SYS_FLAG2_MENU_Y );
	NMenuFixListWrite( 2, 1,SYS_FLAG2_MENU_MAX, SysFlag2MenuList );
	NMenuVCursorInit( 1, 1,SYS_FLAG2_MENU_MAX, 0 );
	MenuModeFlag = 2;
	MenuFunc = SysFlagSubMenu;
	return 0;
}

/*==================================================================*/

static u8 sys_flag_menu_3_blt(void)
{
	NMenuScreenClear();
	NMenuWinBoxWrite( 0, 0, SYS_FLAG3_MENU_X, SYS_FLAG3_MENU_Y );
	NMenuFixListWrite( 2, 1,SYS_FLAG3_MENU_MAX, SysFlag3MenuList );
	NMenuVCursorInit( 1, 1,SYS_FLAG3_MENU_MAX, 0 );
	MenuModeFlag = 3;
	MenuFunc = SysFlagSubMenu;
	return 0;
}

/*==================================================================*/

static u8 sys_flag_menu_4_blt(void)
{
	NMenuScreenClear();
	NMenuWinBoxWrite( 0, 0, SYS_FLAG4_MENU_X, SYS_FLAG4_MENU_Y );
	NMenuFixListWrite( 2, 1,SYS_FLAG4_MENU_MAX, SysFlag4MenuList );
	NMenuVCursorInit( 1, 1,SYS_FLAG4_MENU_MAX, 0 );
	MenuModeFlag = 4;
	MenuFunc = SysFlagSubMenu;
	return 0;
}

/*==================================================================*/

static u8 sys_flag_menu_5_blt(void)
{
	NMenuScreenClear();
	NMenuWinBoxWrite( 0, 0, SYS_FLAG5_MENU_X, SYS_FLAG5_MENU_Y );
	NMenuFixListWrite( 2, 1,SYS_FLAG5_MENU_MAX, SysFlag5MenuList );
	NMenuVCursorInit( 1, 1,SYS_FLAG5_MENU_MAX, 0 );
	MenuModeFlag = 5;
	MenuFunc = SysFlagSubMenu;
	return 0;
}

/*==================================================================*/

static u8 sys_flag_menu_6_blt(void)
{
	NMenuScreenClear();
	NMenuWinBoxWrite( 0, 0, SYS_FLAG6_MENU_X, SYS_FLAG6_MENU_Y );
	NMenuFixListWrite( 2, 1,SYS_FLAG6_MENU_MAX, SysFlag6MenuList );
	NMenuVCursorInit( 1, 1,SYS_FLAG6_MENU_MAX, 0 );
	MenuModeFlag = 6;
	MenuFunc = SysFlagSubMenu;
	return 0;
}

/*==================================================================*/

static u8 sys_flag_menu_7_blt(void)
{
	NMenuScreenClear();
	NMenuWinBoxWrite( 0, 0, SYS_FLAG7_MENU_X, SYS_FLAG7_MENU_Y );
	NMenuFixListWrite( 2, 1,SYS_FLAG7_MENU_MAX, SysFlag7MenuList );
	NMenuVCursorInit( 1, 1,SYS_FLAG7_MENU_MAX, 0 );
	MenuModeFlag = 7;
	MenuFunc = SysFlagSubMenu;
	return 0;
}

/*==================================================================*/

static u8 sys_flag_menu_8_blt(void)
{
	NMenuScreenClear();
	NMenuWinBoxWrite( 0, 0, SYS_FLAG8_MENU_X, SYS_FLAG8_MENU_Y );
	NMenuFixListWrite( 2, 1,SYS_FLAG8_MENU_MAX, SysFlag8MenuList );
	NMenuVCursorInit( 1, 1,SYS_FLAG8_MENU_MAX, 0 );
	MenuModeFlag = 8;
	MenuFunc = SysFlagSubMenu;
	return 0;
}

/*==================================================================*/

static u8 SysFlagSubMenu(void)
{
	s8	flag,pos;

	flag = NMenuVCursorControl();
	pos = NMenuVCursorPosGet() ;

	sysf_no_check(MenuModeFlag,pos);
	sys_flag_str_print(MenuModeFlag);

	if( flag == CURSOR_DEFAULT_VALUE ) {
		return( 0 );
	}

	if( flag == CURSOR_CANCEL_VALUE ) {
		MenuEnd();
		return( 1 );
	}

	return( 0 );
}

/*==================================================================*/

static void	sysf_no_check(u8 mode,u8 no)
{
	if((sys.Trg & R_BUTTON)||(sys.Trg & R_BUTTON)){
		if( EventFlagCheck(SysFlagHeader[mode][no]) == 0 ){
			EventFlagSet(SysFlagHeader[mode][no]);
		}else{
			EventFlagReset(SysFlagHeader[mode][no]);
		}
	}
}

/*==================================================================*/

static void	sys_flag_str_print(u8 mode)
{
	u8 i;

	for(i=0;i<SysFlagMaxTbl[mode];i++){
		flag_msg_write(SYS_FLAG_STR_X_LEN,1+i*2 ,(EventFlagCheck(SysFlagHeader[mode][i]) != 0));
	}
}

/*==================================================================*/
/*==================================================================*/
static u8 flag_fh_obj_menu_blt(void)
{
	NMenuScreenClear();
	NMenuWinBoxWrite( 0, 0, FH_OBJ_FLAG_MENU_X, FH_OBJ_FLAG_MENU_Y );
	NMenuFixListWrite( 2, 1,FH_OBJ_FLAG_MENU_MAX, FlagFHObjMenuList );
	NMenuVCursorInit( 1, 1,FH_OBJ_FLAG_MENU_MAX, 0 );
	MenuFunc = FlagFHObjMenu;
	return 0;
}

/*==================================================================*/
//
static u8 FlagFHObjMenu(void)
{
	s8	flag;

	flag = NMenuVCursorControl();

	if( flag == CURSOR_DEFAULT_VALUE ) {
		return( 0 );
	}

	if( flag == CURSOR_CANCEL_VALUE ) {
		MenuEnd();
		return( 1 );
	}

	MenuFunc = FlagFHObjMenuList[flag].ptr;

	return( 0 );
}

/*==================================================================*/
static u8 flag_fh_obj_menu_0_blt(void)
{
	NMenuScreenClear();
	NMenuWinBoxWrite( 0, 0, FH_OBJ_FLAG0_MENU_X, FH_OBJ_FLAG0_MENU_Y );
	NMenuFixListWrite( 2, 1,FH_OBJ_FLAG0_MENU_MAX, FlagFHObj0MenuList );
	NMenuVCursorInit( 1, 1,FH_OBJ_FLAG0_MENU_MAX, 0 );
	MenuModeFlag = 0;
	MenuFunc = FlagFHObjSubMenu;
	return 0;
}

/*==================================================================*/
static u8 flag_fh_obj_menu_1_blt(void)
{
	NMenuScreenClear();
	NMenuWinBoxWrite( 0, 0, FH_OBJ_FLAG1_MENU_X, FH_OBJ_FLAG1_MENU_Y );
	NMenuFixListWrite( 2, 1,FH_OBJ_FLAG1_MENU_MAX, FlagFHObj1MenuList );
	NMenuVCursorInit( 1, 1,FH_OBJ_FLAG1_MENU_MAX, 0 );
	MenuModeFlag = 1;
	MenuFunc = FlagFHObjSubMenu;
	return 0;
}

/*==================================================================*/
static u8 FlagFHObjSubMenu(void)
{
	s8	flag,pos;

	flag = NMenuVCursorControl();
	pos = NMenuVCursorPosGet() ;

	fhobjf_no_check(MenuModeFlag,pos);
	fh_obj_flag_str_print(MenuModeFlag);

	if( flag == CURSOR_DEFAULT_VALUE ) {
		return( 0 );
	}

	if( flag == CURSOR_CANCEL_VALUE ) {
		MenuEnd();
		return( 1 );
	}

	return( 0 );
}

/*==================================================================*/
static void	fhobjf_no_check(u8 mode,u8 no)
{
	if((sys.Trg & R_BUTTON)||(sys.Trg & R_BUTTON)){
		if( EventFlagCheck(FHObjFlagHeader[mode][no]) == 0 ){
			EventFlagSet(FHObjFlagHeader[mode][no]);
		}else{
			EventFlagReset(FHObjFlagHeader[mode][no]);
		}
	}
}

/*==================================================================*/
static void	fh_obj_flag_str_print(u8 mode)
{
	u8 i;

	for(i=0;i<FHObjFlagMaxTbl[mode];i++){
		flag_msg_write(FH_OBJ_FLAG_STR_X_LEN,1+i*2 ,(EventFlagCheck(FHObjFlagHeader[mode][i]) != 0));
	}
}

/*==================================================================*/
/*==================================================================*/
static u8 flag_fh_menu_blt(void)
{
	NMenuScreenClear();
	NMenuWinBoxWrite( 0, 0, FH_FLAG_MENU_X, FH_FLAG_MENU_Y );
	NMenuFixListWrite( 2, 1,FH_FLAG_MENU_MAX, FlagFHMenuList );
	NMenuVCursorInit( 1, 1,FH_FLAG_MENU_MAX, 0 );
	MenuFunc = FlagFHMenu;
	return 0;
}

/*==================================================================*/
//
static u8 FlagFHMenu(void)
{
	s8	flag;

	flag = NMenuVCursorControl();

	if( flag == CURSOR_DEFAULT_VALUE ) {
		return( 0 );
	}

	if( flag == CURSOR_CANCEL_VALUE ) {
		MenuEnd();
		return( 1 );
	}

	MenuFunc = FlagFHMenuList[flag].ptr;

	return( 0 );
}

/*==================================================================*/
static u8 flag_fh_menu_0_blt(void)
{
	NMenuScreenClear();
	NMenuWinBoxWrite( 0, 0, FH_FLAG0_MENU_X, FH_FLAG0_MENU_Y );
	NMenuFixListWrite( 2, 1,FH_FLAG0_MENU_MAX, FlagFH0MenuList );
	NMenuVCursorInit( 1, 1,FH_FLAG0_MENU_MAX, 0 );
	MenuModeFlag = 0;
	MenuFunc = FlagFHSubMenu;
	return 0;
}

/*==================================================================*/
static u8 flag_fh_menu_1_blt(void)
{
	NMenuScreenClear();
	NMenuWinBoxWrite( 0, 0, FH_FLAG1_MENU_X, FH_FLAG1_MENU_Y );
	NMenuFixListWrite( 2, 1,FH_FLAG1_MENU_MAX, FlagFH1MenuList );
	NMenuVCursorInit( 1, 1,FH_FLAG1_MENU_MAX, 0 );
	MenuModeFlag = 1;
	MenuFunc = FlagFHSubMenu;
	return 0;
}

/*----------------------------------------------------------------------------------*/
static u8 FlagFHSubMenu(void)
{
	s8	flag,pos;

	flag = NMenuVCursorControl();
	pos = NMenuVCursorPosGet() ;

	fhf_no_check(MenuModeFlag,pos);
	fh_flag_str_print(MenuModeFlag);

	if( flag == CURSOR_DEFAULT_VALUE ) {
		return( 0 );
	}

	if( flag == CURSOR_CANCEL_VALUE ) {
		MenuEnd();
		return( 1 );
	}

	return( 0 );
}

/*==================================================================*/
static void	fhf_no_check(u8 mode,u8 no)
{
	if((sys.Trg & R_BUTTON)||(sys.Trg & R_BUTTON)){
		if( EventFlagCheck(FHFlagHeader[mode][no]) == 0 ){
			EventFlagSet(FHFlagHeader[mode][no]);
		}else{
			EventFlagReset(FHFlagHeader[mode][no]);
		}
	}
}

/*==================================================================*/
static void	fh_flag_str_print(u8 mode)
{
	u8 i;

	for(i=0;i<FHFlagMaxTbl[mode];i++){
		flag_msg_write(FH_FLAG_STR_X_LEN,1+i*2 ,(EventFlagCheck(FHFlagHeader[mode][i]) != 0));
	}
}

/*==================================================================*/
/*==================================================================*/
static u8 flag_ball_vanish_menu_blt(void)
{
	NMenuScreenClear();
	NMenuWinBoxWrite( 0, 0, BALL_VANISH_FLAG_MENU_X, BALL_VANISH_FLAG_MENU_Y );
	NMenuFixListWrite( 2, 1,BALL_VANISH_FLAG_MENU_MAX, FlagBallVanishMenuList );
	NMenuVCursorInit( 1, 1,BALL_VANISH_FLAG_MENU_MAX, 0 );
	MenuFunc = FlagBallVanishMenu;
	return 0;
}

/*==================================================================*/
//
static u8 FlagBallVanishMenu(void)
{
	s8	flag;

	flag = NMenuVCursorControl();

	if( flag == CURSOR_DEFAULT_VALUE ) {
		return( 0 );
	}

	if( flag == CURSOR_CANCEL_VALUE ) {
		MenuEnd();
		return( 1 );
	}

	MenuFunc = FlagBallVanishMenuList[flag].ptr;

	return( 0 );
}

/*==================================================================*/
static u8 flag_ball_vanish_menu_0_blt(void)
{
	NMenuScreenClear();
	NMenuWinBoxWrite( 0, 0, BALL_VANISH_FLAG0_MENU_X, BALL_VANISH_FLAG0_MENU_Y );
	NMenuFixListWrite( 2, 1,BALL_VANISH_FLAG0_MENU_MAX, FlagBallVanish0MenuList );
	NMenuVCursorInit( 1, 1,BALL_VANISH_FLAG0_MENU_MAX, 0 );
	MenuModeFlag = 0;
	MenuFunc = FlagBallVanishSubMenu;
	return 0;
}

/*==================================================================*/
static u8 FlagBallVanishSubMenu(void)
{
	s8	flag,pos;

	flag = NMenuVCursorControl();
	pos = NMenuVCursorPosGet() ;

	bvf_no_check(MenuModeFlag,pos);
	ball_vanish_flag_str_print(MenuModeFlag);

	if( flag == CURSOR_DEFAULT_VALUE ) {
		return( 0 );
	}

	if( flag == CURSOR_CANCEL_VALUE ) {
		MenuEnd();
		return( 1 );
	}

	return( 0 );
}

/*==================================================================*/
static void	bvf_no_check(u8 mode,u8 no)
{
	if((sys.Trg & R_BUTTON)||(sys.Trg & R_BUTTON)){
		if( EventFlagCheck(FlagBallVanishHeader[mode][no]) == 0 ){
			EventFlagSet(FlagBallVanishHeader[mode][no]);
		}else{
			EventFlagReset(FlagBallVanishHeader[mode][no]);
		}
	}
}

/*==================================================================*/
static void	ball_vanish_flag_str_print(u8 mode)
{
	u8 i;

	for(i=0;i<FlagBallVanishMaxTbl[mode];i++){
		flag_msg_write(BALL_VANISH_FLAG_STR_X_LEN,1+i*2 ,(EventFlagCheck(FlagBallVanishHeader[mode][i]) != 0));
	}
}

/*==================================================================*/
/*==================================================================*/

static u8 work_ans_menu_blt(void)
{
	NMenuScreenClear();
	NMenuWinBoxWrite( 0, 0, ANS_WORK_MENU_X, ANS_WORK_MENU_Y );
	NMenuFixListWrite( 2, 1,ANS_WORK_MENU_MAX, AnsWorkMenuList );
	NMenuVCursorInit( 1, 1,ANS_WORK_MENU_MAX, 0 );
	MenuFunc = AnsWorkMenu;
	return 0;
}

/*==================================================================*/

static u8 AnsWorkMenu(void)
{
	s8	flag,pos;

	flag = NMenuVCursorControl();
	pos = NMenuVCursorPosGet() ;

	ans_no_check();
	ans_no_str_print();

	if( flag == CURSOR_DEFAULT_VALUE ) {
		return( 0 );
	}

	if( flag == CURSOR_CANCEL_VALUE ) {
		MenuEnd();
		return( 1 );
	}

	return( 0 );
}

/*==================================================================*/
//Ansワークナンバー部分の表示
static void	ans_no_str_print(void)
{
	work_msg_write(ANS_WORK_STR_X_LEN,1,AnswerWork);
}

/*==================================================================*/

static void	ans_no_check(void)
{
	u16	kg;

	kg=0;

	if(sys.Trg & R_BUTTON) {
		kg++;
	}else{
		if(sys.Trg & L_BUTTON) {
			kg--;
		}else{
			return;
		}
	}

	AnswerWork += kg;
}

/*==================================================================*/
/*==================================================================*/
//
static u8 work_save_menu_blt(void)
{
	NMenuScreenClear();
	NMenuWinBoxWrite( 0, 0, SAVE_WORK_MENU_X, SAVE_WORK_MENU_Y );
	NMenuFixListWrite( 2, 1,SAVE_WORK_MENU_MAX, SaveWorkMenuList );
	NMenuVCursorInit( 1, 1,SAVE_WORK_MENU_MAX, 0 );
	MenuFunc = SaveWorkMenu;
	return 0;
}

/*==================================================================*/

//SAVEワーク操作
static u8 SaveWorkMenu(void)
{
	s8	flag;

	flag = NMenuVCursorControl();

	if( flag == CURSOR_DEFAULT_VALUE ) {
		return( 0 );
	}

	if( flag == CURSOR_CANCEL_VALUE ) {
		MenuEnd();
		return( 1 );
	}

	MenuFunc = SaveWorkMenuList[flag].ptr;

	return( 0 );
}

/*==================================================================*/

static u8 save_work_menu_0_blt(void)
{
	NMenuScreenClear();
	NMenuWinBoxWrite( 0, 0, SAVE_WORK0_MENU_X, SAVE_WORK0_MENU_Y );
	NMenuFixListWrite( 2, 1,SAVE_WORK0_MENU_MAX, SaveWork0MenuList );
	NMenuVCursorInit( 1, 1,SAVE_WORK0_MENU_MAX, 0 );
	MenuModeFlag = 0;
	MenuFunc = SaveWorkSubMenu;
	return 0;
}

/*==================================================================*/

static u8 save_work_menu_1_blt(void)
{
	NMenuScreenClear();
	NMenuWinBoxWrite( 0, 0, SAVE_WORK1_MENU_X, SAVE_WORK1_MENU_Y );
	NMenuFixListWrite( 2, 1,SAVE_WORK1_MENU_MAX, SaveWork1MenuList );
	NMenuVCursorInit( 1, 1,SAVE_WORK1_MENU_MAX, 0 );
	MenuModeFlag = 1;
	MenuFunc = SaveWorkSubMenu;
	return 0;
}

/*==================================================================*/

static u8 save_work_menu_2_blt(void)
{
	NMenuScreenClear();
	NMenuWinBoxWrite( 0, 0, SAVE_WORK2_MENU_X, SAVE_WORK2_MENU_Y );
	NMenuFixListWrite( 2, 1,SAVE_WORK2_MENU_MAX, SaveWork2MenuList );
	NMenuVCursorInit( 1, 1,SAVE_WORK2_MENU_MAX, 0 );
	MenuModeFlag = 2;
	MenuFunc = SaveWorkSubMenu;
	return 0;
}

/*==================================================================*/

static u8 save_work_menu_3_blt(void)
{
	NMenuScreenClear();
	NMenuWinBoxWrite( 0, 0, SAVE_WORK3_MENU_X, SAVE_WORK3_MENU_Y );
	NMenuFixListWrite( 2, 1,SAVE_WORK3_MENU_MAX, SaveWork3MenuList );
	NMenuVCursorInit( 1, 1,SAVE_WORK3_MENU_MAX, 0 );
	MenuModeFlag = 3;
	MenuFunc = SaveWorkSubMenu;
	return 0;
}

/*==================================================================*/

static u8 save_work_menu_4_blt(void)
{
	NMenuScreenClear();
	NMenuWinBoxWrite( 0, 0, SAVE_WORK4_MENU_X, SAVE_WORK4_MENU_Y );
	NMenuFixListWrite( 2, 1,SAVE_WORK4_MENU_MAX, SaveWork4MenuList );
	NMenuVCursorInit( 1, 1,SAVE_WORK4_MENU_MAX, 0 );
	MenuModeFlag = 4;
	MenuFunc = SaveWorkSubMenu;
	return 0;
}

/*==================================================================*/

static u8 save_work_menu_5_blt(void)
{
	NMenuScreenClear();
	NMenuWinBoxWrite( 0, 0, SAVE_WORK5_MENU_X, SAVE_WORK5_MENU_Y );
	NMenuFixListWrite( 2, 1,SAVE_WORK5_MENU_MAX, SaveWork5MenuList );
	NMenuVCursorInit( 1, 1,SAVE_WORK5_MENU_MAX, 0 );
	MenuModeFlag = 5;
	MenuFunc = SaveWorkSubMenu;
	return 0;
}

/*==================================================================*/

static u8 save_work_menu_6_blt(void)
{
	NMenuScreenClear();
	NMenuWinBoxWrite( 0, 0, SAVE_WORK6_MENU_X, SAVE_WORK6_MENU_Y );
	NMenuFixListWrite( 2, 1,SAVE_WORK6_MENU_MAX, SaveWork6MenuList );
	NMenuVCursorInit( 1, 1,SAVE_WORK6_MENU_MAX, 0 );
	MenuModeFlag = 6;
	MenuFunc = SaveWorkSubMenu;
	return 0;
}

/*==================================================================*/

static u8 save_work_menu_7_blt(void)
{
	NMenuScreenClear();
	NMenuWinBoxWrite( 0, 0, SAVE_WORK7_MENU_X, SAVE_WORK7_MENU_Y );
	NMenuFixListWrite( 2, 1,SAVE_WORK7_MENU_MAX, SaveWork7MenuList );
	NMenuVCursorInit( 1, 1,SAVE_WORK7_MENU_MAX, 0 );
	MenuModeFlag = 7;
	MenuFunc = SaveWorkSubMenu;
	return 0;
}

/*==================================================================*/

static u8 save_work_menu_8_blt(void)
{
	NMenuScreenClear();
	NMenuWinBoxWrite( 0, 0, SAVE_WORK8_MENU_X, SAVE_WORK8_MENU_Y );
	NMenuFixListWrite( 2, 1,SAVE_WORK8_MENU_MAX, SaveWork8MenuList );
	NMenuVCursorInit( 1, 1,SAVE_WORK8_MENU_MAX, 0 );
	MenuModeFlag = 8;
	MenuFunc = SaveWorkSubMenu;
	return 0;
}


/*==================================================================*/

static u8 SaveWorkSubMenu(void)
{
	s8	flag,pos;

	flag = NMenuVCursorControl();
	pos = NMenuVCursorPosGet() ;

	savew_no_check(MenuModeFlag,pos);
	save_no_str_print(MenuModeFlag);

	if( flag == CURSOR_DEFAULT_VALUE ) {
		return( 0 );
	}

	if( flag == CURSOR_CANCEL_VALUE ) {
		MenuEnd();
		return( 1 );
	}

	return( 0 );
}

/*==================================================================*/
//SAVEワークナンバー部分の表示
static void	save_no_str_print(u8 mode)
{
	u8 i;

	for(i=0;i<SaveWorkMaxTbl[mode];i++){
		work_msg_write(SAVE_WORK_STR_X_LEN,1+i*2,GetEventWorkValue(SaveWorkHeader[mode][i]));
	}
}

/*==================================================================*/

static void	savew_no_check(u8 mode,u8 no)
{
	u16	kg;

	kg=0;

	if(sys.Trg & R_BUTTON) {
		kg++;
	}else{
		if(sys.Trg & L_BUTTON) {
			kg--;
		}else{
			return;
		}
	}

	SetEventWorkValue(SaveWorkHeader[mode][no] , (GetEventWorkValue(SaveWorkHeader[mode][no]) + kg) );
}

/*==================================================================*/
/*==================================================================*/
//
static u8 work_save2_menu_blt(void)
{
	NMenuScreenClear();
	NMenuWinBoxWrite( 0, 0, SAVE2_WORK_MENU_X, SAVE2_WORK_MENU_Y );
	NMenuFixListWrite( 2, 1,SAVE2_WORK_MENU_MAX, Save2WorkMenuList );
	NMenuVCursorInit( 1, 1,SAVE2_WORK_MENU_MAX, 0 );
	MenuFunc = Save2WorkMenu;
	return 0;
}

/*==================================================================*/

//SAVEワーク操作
static u8 Save2WorkMenu(void)
{
	s8	flag;

	flag = NMenuVCursorControl();

	if( flag == CURSOR_DEFAULT_VALUE ) {
		return( 0 );
	}

	if( flag == CURSOR_CANCEL_VALUE ) {
		MenuEnd();
		return( 1 );
	}

	MenuFunc = Save2WorkMenuList[flag].ptr;

	return( 0 );
}

/*==================================================================*/

static u8 save2_work_menu_0_blt(void)
{
	NMenuScreenClear();
	NMenuWinBoxWrite( 0, 0, SAVE2_WORK0_MENU_X, SAVE2_WORK0_MENU_Y );
	NMenuFixListWrite( 2, 1,SAVE2_WORK0_MENU_MAX, Save2Work0MenuList );
	NMenuVCursorInit( 1, 1,SAVE2_WORK0_MENU_MAX, 0 );
	MenuModeFlag = 0;
	MenuFunc = Save2WorkSubMenu;
	return 0;
}

/*==================================================================*/

static u8 save2_work_menu_1_blt(void)
{
	NMenuScreenClear();
	NMenuWinBoxWrite( 0, 0, SAVE2_WORK1_MENU_X, SAVE2_WORK1_MENU_Y );
	NMenuFixListWrite( 2, 1,SAVE2_WORK1_MENU_MAX, Save2Work1MenuList );
	NMenuVCursorInit( 1, 1,SAVE2_WORK1_MENU_MAX, 0 );
	MenuModeFlag = 1;
	MenuFunc = Save2WorkSubMenu;
	return 0;
}

/*==================================================================*/

static u8 save2_work_menu_2_blt(void)
{
	NMenuScreenClear();
	NMenuWinBoxWrite( 0, 0, SAVE2_WORK2_MENU_X, SAVE2_WORK2_MENU_Y );
	NMenuFixListWrite( 2, 1,SAVE2_WORK2_MENU_MAX, Save2Work2MenuList );
	NMenuVCursorInit( 1, 1,SAVE2_WORK2_MENU_MAX, 0 );
	MenuModeFlag = 2;
	MenuFunc = Save2WorkSubMenu;
	return 0;
}

/*==================================================================*/

static u8 save2_work_menu_3_blt(void)
{
	NMenuScreenClear();
	NMenuWinBoxWrite( 0, 0, SAVE2_WORK3_MENU_X, SAVE2_WORK3_MENU_Y );
	NMenuFixListWrite( 2, 1,SAVE2_WORK3_MENU_MAX, Save2Work3MenuList );
	NMenuVCursorInit( 1, 1,SAVE2_WORK3_MENU_MAX, 0 );
	MenuModeFlag = 3;
	MenuFunc = Save2WorkSubMenu;
	return 0;
}

/*==================================================================*/

static u8 save2_work_menu_4_blt(void)
{
	NMenuScreenClear();
	NMenuWinBoxWrite( 0, 0, SAVE2_WORK4_MENU_X, SAVE2_WORK4_MENU_Y );
	NMenuFixListWrite( 2, 1,SAVE2_WORK4_MENU_MAX, Save2Work4MenuList );
	NMenuVCursorInit( 1, 1,SAVE2_WORK4_MENU_MAX, 0 );
	MenuModeFlag = 4;
	MenuFunc = Save2WorkSubMenu;
	return 0;
}

/*==================================================================*/

static u8 save2_work_menu_5_blt(void)
{
	NMenuScreenClear();
	NMenuWinBoxWrite( 0, 0, SAVE2_WORK5_MENU_X, SAVE2_WORK5_MENU_Y );
	NMenuFixListWrite( 2, 1,SAVE2_WORK5_MENU_MAX, Save2Work5MenuList );
	NMenuVCursorInit( 1, 1,SAVE2_WORK5_MENU_MAX, 0 );
	MenuModeFlag = 5;
	MenuFunc = Save2WorkSubMenu;
	return 0;
}


/*==================================================================*/

static u8 Save2WorkSubMenu(void)
{
	s8	flag,pos;

	flag = NMenuVCursorControl();
	pos = NMenuVCursorPosGet() ;

	save2w_no_check(MenuModeFlag,pos);
	save2_no_str_print(MenuModeFlag);

	if( flag == CURSOR_DEFAULT_VALUE ) {
		return( 0 );
	}

	if( flag == CURSOR_CANCEL_VALUE ) {
		MenuEnd();
		return( 1 );
	}

	return( 0 );
}

/*==================================================================*/
//SAVEワークナンバー部分の表示
static void	save2_no_str_print(u8 mode)
{
	u8 i;

	for(i=0;i<Save2WorkMaxTbl[mode];i++){
		work_msg_write(SAVE2_WORK_STR_X_LEN,1+i*2,GetEventWorkValue(Save2WorkHeader[mode][i]));
	}
}

/*==================================================================*/

static void	save2w_no_check(u8 mode,u8 no)
{
	u16	kg;

	kg=0;

	if(sys.Trg & R_BUTTON) {
		kg++;
	}else{
		if(sys.Trg & L_BUTTON) {
			kg--;
		}else{
			return;
		}
	}

	SetEventWorkValue(Save2WorkHeader[mode][no] , (GetEventWorkValue(Save2WorkHeader[mode][no]) + kg) );
}

/*==================================================================*/
/*==================================================================*/

static u8 work_sys_menu_blt(void)
{
	NMenuScreenClear();
	NMenuWinBoxWrite( 0, 0, SYS_WORK_MENU_X, SYS_WORK_MENU_Y );
	NMenuFixListWrite( 2, 1,SYS_WORK_MENU_MAX, SysWorkMenuList );
	NMenuVCursorInit( 1, 1,SYS_WORK_MENU_MAX, 0 );
	MenuFunc = SysWorkMenu;
	return 0;
}

/*==================================================================*/
//ローカルワーク操作
static u8 SysWorkMenu(void)
{
	s8	flag;

	flag = NMenuVCursorControl();

	if( flag == CURSOR_DEFAULT_VALUE ) {
		return( 0 );
	}

	if( flag == CURSOR_CANCEL_VALUE ) {
		MenuEnd();
		return( 1 );
	}

	MenuFunc = SysWorkMenuList[flag].ptr;

	return( 0 );
}

/*==================================================================*/
static u8 sys_work_menu_0_blt(void)
{
	NMenuScreenClear();
	NMenuWinBoxWrite( 0, 0, SYS_WORK0_MENU_X, SYS_WORK0_MENU_Y );
	NMenuFixListWrite( 2, 1,SYS_WORK0_MENU_MAX, SysWork0MenuList );
	NMenuVCursorInit( 1, 1,SYS_WORK0_MENU_MAX, 0 );
	MenuModeFlag = 0;
	MenuFunc = SysWorkSubMenu;
	return 0;
}

/*==================================================================*/
static u8 sys_work_menu_1_blt(void)
{
	NMenuScreenClear();
	NMenuWinBoxWrite( 0, 0, SYS_WORK1_MENU_X, SYS_WORK1_MENU_Y );
	NMenuFixListWrite( 2, 1,SYS_WORK1_MENU_MAX, SysWork1MenuList );
	NMenuVCursorInit( 1, 1,SYS_WORK1_MENU_MAX, 0 );
	MenuModeFlag = 1;
	MenuFunc = SysWorkSubMenu;
	return 0;
}

/*==================================================================*/
static u8 sys_work_menu_2_blt(void)
{
	NMenuScreenClear();
	NMenuWinBoxWrite( 0, 0, SYS_WORK2_MENU_X, SYS_WORK2_MENU_Y );
	NMenuFixListWrite( 2, 1,SYS_WORK2_MENU_MAX, SysWork2MenuList );
	NMenuVCursorInit( 1, 1,SYS_WORK2_MENU_MAX, 0 );
	MenuModeFlag = 2;
	MenuFunc = SysWorkSubMenu;
	return 0;
}

/*==================================================================*/
static u8 sys_work_menu_3_blt(void)
{
	NMenuScreenClear();
	NMenuWinBoxWrite( 0, 0, SYS_WORK3_MENU_X, SYS_WORK3_MENU_Y );
	NMenuFixListWrite( 2, 1,SYS_WORK3_MENU_MAX, SysWork3MenuList );
	NMenuVCursorInit( 1, 1,SYS_WORK3_MENU_MAX, 0 );
	MenuModeFlag = 3;
	MenuFunc = SysWorkSubMenu;
	return 0;
}

/*==================================================================*/
static u8 sys_work_menu_4_blt(void)
{
	NMenuScreenClear();
	NMenuWinBoxWrite( 0, 0, SYS_WORK4_MENU_X, SYS_WORK4_MENU_Y );
	NMenuFixListWrite( 2, 1,SYS_WORK4_MENU_MAX, SysWork4MenuList );
	NMenuVCursorInit( 1, 1,SYS_WORK4_MENU_MAX, 0 );
	MenuModeFlag = 4;
	MenuFunc = SysWorkSubMenu;
	return 0;
}

/*==================================================================*/
static u8 SysWorkSubMenu(void)
{
	s8	flag,pos;

	flag = NMenuVCursorControl();
	pos = NMenuVCursorPosGet() ;

	sys_no_check(MenuModeFlag,pos);
	sys_no_str_print(MenuModeFlag);

	if( flag == CURSOR_DEFAULT_VALUE ) {
		return( 0 );
	}

	if( flag == CURSOR_CANCEL_VALUE ) {
		MenuEnd();
		return( 1 );
	}

	return( 0 );
}

/*==================================================================*/

static void	sys_no_check(u8 mode,u8 no)
{
	u16	kg;

	kg=0;

	if(sys.Repeat & R_BUTTON) {
		kg++;
	}else{
		if(sys.Repeat & L_BUTTON) {
			kg--;
		}else{
			return;
		}
	}

	SetEventWorkValue(SysWorkHeader[mode][no] , (GetEventWorkValue(SysWorkHeader[mode][no]) + kg) );
}

/*==================================================================*/
//Sysワークナンバー部分の表示
static void	sys_no_str_print(u8 mode)
{
	u8 i;

	for(i=0;i<SysWorkMaxTbl[mode];i++){
		work_msg_write(SYS_WORK_STR_X_LEN,1+i*2,GetEventWorkValue(SysWorkHeader[mode][i]));
	}
}

/*==================================================================*/
/*==================================================================*/
static u8 work_local_menu_blt(void)
{
	NMenuScreenClear();
	NMenuWinBoxWrite( 0, 0, LOCAL_WORK_MENU_X, LOCAL_WORK_MENU_Y );
	NMenuFixListWrite( 2, 1,LOCAL_WORK_MENU_MAX, LocalWorkMenuList );
	NMenuVCursorInit( 1, 1,LOCAL_WORK_MENU_MAX, 0 );
	MenuFunc = LocalWorkMenu;
	return 0;
}

/*==================================================================*/
//ローカルワーク操作
static u8 LocalWorkMenu(void)
{
	s8	flag;

	flag = NMenuVCursorControl();

	if( flag == CURSOR_DEFAULT_VALUE ) {
		return( 0 );
	}

	if( flag == CURSOR_CANCEL_VALUE ) {
		MenuEnd();
		return( 1 );
	}

	MenuFunc = LocalWorkMenuList[flag].ptr;

	return( 0 );
}

/*==================================================================*/
static u8 local_work_menu_0_blt(void)
{
	NMenuScreenClear();
	NMenuWinBoxWrite( 0, 0, LOCAL_WORK0_MENU_X, LOCAL_WORK0_MENU_Y );
	NMenuFixListWrite( 2, 1,LOCAL_WORK0_MENU_MAX, LocalWork0MenuList );
	NMenuVCursorInit( 1, 1,LOCAL_WORK0_MENU_MAX, 0 );
	MenuModeFlag = 0;
	MenuFunc = LocalWorkSubMenu;
	return 0;
}

/*==================================================================*/
static u8 local_work_menu_1_blt(void)
{
	NMenuScreenClear();
	NMenuWinBoxWrite( 0, 0, LOCAL_WORK1_MENU_X, LOCAL_WORK1_MENU_Y );
	NMenuFixListWrite( 2, 1,LOCAL_WORK1_MENU_MAX, LocalWork1MenuList );
	NMenuVCursorInit( 1, 1,LOCAL_WORK1_MENU_MAX, 0 );
	MenuModeFlag = 1;
	MenuFunc = LocalWorkSubMenu;
	return 0;
}

/*==================================================================*/
static u8 LocalWorkSubMenu(void)
{
	s8	flag,pos;

	flag = NMenuVCursorControl();
	pos = NMenuVCursorPosGet() ;

	lw_no_check(MenuModeFlag,pos);
	local_no_str_print(MenuModeFlag);

	if( flag == CURSOR_DEFAULT_VALUE ) {
		return( 0 );
	}

	if( flag == CURSOR_CANCEL_VALUE ) {
		MenuEnd();
		return( 1 );
	}

	return( 0 );
}

/*==================================================================*/

static void	lw_no_check(u8 mode,u8 no)
{
	u16	kg;

	kg=0;

	if(sys.Trg & R_BUTTON) {
		kg++;
	}else{
		if(sys.Trg & L_BUTTON) {
			kg--;
		}else{
			return;
		}
	}

	SetEventWorkValue(LocalWorkHeader[mode][no] , (GetEventWorkValue(LocalWorkHeader[mode][no]) + kg) );
}

/*==================================================================*/
//LOCALワークナンバー部分の表示
static void	local_no_str_print(u8 mode)
{
	u8 i;

	for(i=0;i<LocalWorkMaxTbl[mode];i++){
		work_msg_write(LOCAL_WORK_STR_X_LEN,1+i*2,GetEventWorkValue(LocalWorkHeader[mode][i]));
	}
}

/*==================================================================*/
/*==================================================================*/
static u8 work_obj_menu_blt(void)
{
	NMenuScreenClear();
	NMenuWinBoxWrite( 0, 0, OBJ_WORK_MENU_X, OBJ_WORK_MENU_Y );
	NMenuFixListWrite( 2, 1,OBJ_WORK_MENU_MAX, ObjWorkMenuList );
	NMenuVCursorInit( 1, 1,OBJ_WORK_MENU_MAX, 0 );
	MenuFunc = ObjWorkMenu;
	return 0;
}
/*==================================================================*/
//OBJワーク操作
static u8 ObjWorkMenu(void)
{
	s8	flag;

	flag = NMenuVCursorControl();

	if( flag == CURSOR_DEFAULT_VALUE ) {
		return( 0 );
	}

	if( flag == CURSOR_CANCEL_VALUE ) {
		MenuEnd();
		return( 1 );
	}

	MenuFunc = ObjWorkMenuList[flag].ptr;

	return( 0 );
}

/*==================================================================*/
static u8 obj_work_menu_0_blt(void)
{
	NMenuScreenClear();
	NMenuWinBoxWrite( 0, 0, OBJ_WORK0_MENU_X, OBJ_WORK0_MENU_Y );
	NMenuFixListWrite( 2, 1,OBJ_WORK0_MENU_MAX, ObjWork0MenuList );
	NMenuVCursorInit( 1, 1,OBJ_WORK0_MENU_MAX, 0 );
	MenuModeFlag = 0;
	MenuFunc = ObjWorkSubMenu;
	return 0;
}

/*==================================================================*/
static u8 obj_work_menu_1_blt(void)
{
	NMenuScreenClear();
	NMenuWinBoxWrite( 0, 0, OBJ_WORK1_MENU_X, OBJ_WORK1_MENU_Y );
	NMenuFixListWrite( 2, 1,OBJ_WORK1_MENU_MAX, ObjWork1MenuList );
	NMenuVCursorInit( 1, 1,OBJ_WORK1_MENU_MAX, 0 );
	MenuModeFlag = 1;
	MenuFunc = ObjWorkSubMenu;
	return 0;
}

/*==================================================================*/
static u8 ObjWorkSubMenu(void)
{
	s8	flag,pos;

	flag = NMenuVCursorControl();
	pos = NMenuVCursorPosGet() ;

	ow_no_check(MenuModeFlag,pos);
	obj_no_str_print(MenuModeFlag);

	if( flag == CURSOR_DEFAULT_VALUE ) {
		return( 0 );
	}

	if( flag == CURSOR_CANCEL_VALUE ) {
		MenuEnd();
		return( 1 );
	}

	return( 0 );
}

/*==================================================================*/
//OBJワークナンバー部分の表示
static void	obj_no_str_print(u8 mode)
{
	u8 i;

	for(i=0;i<ObjWorkMaxTbl[mode];i++){
		work_msg_write(OBJ_WORK_STR_X_LEN,1+i*2,GetEventWorkValue(ObjWorkHeader[mode][i]));
	}
}

/*==================================================================*/

static void	ow_no_check(u8 mode,u8 no)
{
	u16	kg;

	kg=0;

	if(sys.Trg & R_BUTTON) {
		kg++;
	}else{
		if(sys.Trg & L_BUTTON) {
			kg--;
		}else{
			return;
		}
	}

	SetEventWorkValue(ObjWorkHeader[mode][no] , (GetEventWorkValue(ObjWorkHeader[mode][no]) + kg) );
}

/*==================================================================*/
/*==================================================================*/
//レベルメニュー作成
static u8 reberu_menu_blt(void)
{
	NMenuScreenClear();
	NMenuWinBoxWrite( 0, 0, REBERU_MENU_X, REBERU_MENU_Y );
	NMenuMsgWrite(reberu_title,1, 1);
	NMenuFixListWrite( 2, 3,REBERU_MENU_MAX, ReberuMenuList );
	NMenuVCursorInit( 1, 3,REBERU_MENU_MAX, 0 );
	MenuFunc = reberu_menu;

	return 0;
}

/*==================================================================*/
/*==================================================================*/
//大王メニュー作成
static u8 daiou_menu_blt(void)
{
	NMenuScreenClear();
	NMenuWinBoxWrite( 0, 0, DAIOU_MENU_X, DAIOU_MENU_Y );
	NMenuMsgWrite(daiou_title,1, 1);
	NMenuFixListWrite( 2, 3,DAIOU_MENU_MAX, DaiouMenuList );
	NMenuVCursorInit( 1, 3,DAIOU_MENU_MAX, 0 );
	MenuFunc = daiou_menu;

	return 0;
}

/*==================================================================*/
/*==================================================================*/
//レベルメニュー
static u8 reberu_menu(void)
{
	s8	flag,pos;

	flag = NMenuVCursorControl();
	pos = NMenuVCursorPosGet() ;


	if( flag == CURSOR_DEFAULT_VALUE ) {
		return( 0 );
	}

	if( flag == CURSOR_CANCEL_VALUE ) {
		return( 0 );
	}

	Fld.EventWork[WK_KARAKURI_LEVEL-SVWK_START] = pos;
	MenuEnd();
	return( 1 );
}

/*==================================================================*/
/*==================================================================*/
//大王メニュー
static u8 daiou_menu(void)
{
	s8	flag,pos;

	flag = NMenuVCursorControl();
	pos = NMenuVCursorPosGet() ;

	if( flag == CURSOR_DEFAULT_VALUE ) {
		return( 0 );
	}

	if( flag == CURSOR_CANCEL_VALUE ) {
		return( 0 );
	}

	SetEventWorkValue( WK_KARAKURI_DAIOU, pos );
	MenuEnd();
	return( 1 );
}

/*==================================================================*/
/*==================================================================*/
//プレビューへ
static u8 go_pre(void)
{
	PaletteFadeReq( 0xffffffff, 0, 0, 16, 0 );
	MenuFunc = go_pre2;
	return( 0 );
}

/*==================================================================*/
/*==================================================================*/
static u8 go_pre2(void)
{
	if( !(PaletteAnime()) ) {
		MenuEnd();

		portraite_work_set(2);

		MainProcChange(contest_picture_init);
		sys.pReturnProc = FieldBgEffectTestEnd;
		return( 1 );
	}

	return 0;
}

/*==================================================================*/
/*==================================================================*/
//メニューを押しても動作しないようにする為のダミー
static u8 MenuDummy(void)
{
	return(0) ;
}

/*==================================================================*/
/*==================================================================*/
//ポケモンＮＯ加減算チェック
static void mons_no_check(void)
{
	if(sys.Repeat & L_KEY) {
		if(mons_no != POKE_NO_MIN) {
			mons_no--;
		}
	}

	if(sys.Repeat & R_KEY) {
		if(mons_no != KAIHATSU_NUM_MAX) {
			mons_no++;
		}
	}

	if(sys.Repeat & L_BUTTON) {
		if(mons_no >= (POKE_NO_MIN+10)) {
			mons_no-=10;
		}else{
			mons_no=POKE_NO_MIN;
		}
	}

	if(sys.Repeat & R_BUTTON) {
		if(mons_no <= (KAIHATSU_NUM_MAX-10)) {
			mons_no+=10;
		}else{
			mons_no=KAIHATSU_NUM_MAX;
		}
	}
}

/*==================================================================*/
/*==================================================================*/
//個性乱数ＮＯ加減算チェック
static void rand_no_check(void)
{
	if(sys.Repeat & L_KEY) {
		if(rand_no != 0) {
			rand_no--;
		}
	}

	if(sys.Repeat & R_KEY) {
		if(rand_no != RAND_NO_MAX) {
			rand_no++;
		}
	}

	if(sys.Repeat & L_BUTTON) {
		if(rand_no >= 16) {
			rand_no-=16;
		}else{
			rand_no=0;
		}
	}

	if(sys.Repeat & R_BUTTON) {
		if(rand_no <= (RAND_NO_MAX-16)) {
			rand_no+=16;
		}else{
			rand_no=RAND_NO_MAX;
		}
	}

	if((sys.Trg & L_BUTTON)&&(sys.Trg & R_BUTTON)){
		rand_no=RAND_NO_MAX;
	}
}

/*==================================================================*/
/*==================================================================*/
//コンテストＮＯ加減算チェック
static void contest_no_check(void)
{
	if(sys.Repeat & L_KEY) {
		if(contest_no != 1) {
			contest_no--;
		}
	}

	if(sys.Repeat & R_KEY) {
		if(contest_no != CONTEST_TYPE_NO_MAX) {
			contest_no++;
		}
	}

	if(sys.Repeat & L_BUTTON) {
		contest_no=1;
	}

	if(sys.Repeat & R_BUTTON) {
		contest_no=CONTEST_TYPE_NO_MAX;
	}
}

/*==================================================================*/
/*==================================================================*/
//タイトルＮＯ加減算チェック
static void title_no_check(void)
{
	if(sys.Repeat & L_KEY) {
		if(title_no != 1) {
			title_no--;
		}
	}

	if(sys.Repeat & R_KEY) {
		if(title_no != TITLE_TYPE_NO_MAX) {
			title_no++;
		}
	}

	if(sys.Repeat & L_BUTTON) {
		if(title_no >= (10+1)) {
			title_no-=10;
		}else{
			title_no=0;
		}
	}

	if(sys.Repeat & R_BUTTON) {
		if(title_no <= (TITLE_TYPE_NO_MAX-10)) {
			title_no+=10;
		}else{
			title_no=TITLE_TYPE_NO_MAX;
		}
	}
}

/*==================================================================*/
/*==================================================================*/
//プレビューＮＯ加減算チェック
static void pre_no_check(void)
{
	if(sys.Repeat & L_KEY) {
		if(pre_no != 1) {
			pre_no--;
		}
	}

	if(sys.Repeat & R_KEY) {
		if(pre_no != PRE_TYPE_NO_MAX) {
			pre_no++;
		}
	}

	if(sys.Repeat & L_BUTTON) {
		if(pre_no >= (10+1)) {
			pre_no-=10;
		}else{
			pre_no=0;
		}
	}

	if(sys.Repeat & R_BUTTON) {
		if(pre_no <= (PRE_TYPE_NO_MAX-10)) {
			pre_no+=10;
		}else{
			pre_no=PRE_TYPE_NO_MAX;
		}
	}
}

/*==================================================================*/
/*==================================================================*/
//各ナンバー部分の表示
static void	no_str_print(u8 mode)
{
	u8 i;
	u16 k;

	switch(mode){		//Rand表示
	case 0:
	case 1:
	case 2:
		for(i=0;i<8;i++){			//Hexでu32分表示
			k = (rand_no >> ((7-i)*4)) & 0x0000000f;

			if(k < 10){
				no_str[i] = n0_ + k;
			}else{
				no_str[i] = A__ + k - 10;
			}
		}
		no_str[8]=EOM_;

		NMenuMsgWrite(no_str,12, 5);
		break;
	}

	for(i=0;i<MONS_NAME_SIZE;i++) no_str[i+1] = spc_;
	i = 0;
	k = mons_no;
	while((PokeNameData[k][i]!=EOM_)&&(i<MONS_NAME_SIZE)){
		no_str[i+1] = PokeNameData[k][i];
		i++;
	}
	no_str[0] = kako2_;
	no_str[MONS_NAME_SIZE+1] = kakot2_;
	no_str[MONS_NAME_SIZE+2] = EOM_;
	switch(mode){
	case 0:
	case 1:
	case 2:
		NMenuMsgWrite(no_str,8, 1);
		break;
	default:
		NMenuMsgWrite(no_str,12, 1);
		break;
	}

	no_str[3]=EOM_;
	no_str[0] = n0_ + (mons_no / 100);
	no_str[1] = n0_ + ((mons_no % 100) / 10);
	no_str[2] = n0_ + (mons_no % 10);
	NMenuMsgWrite(no_str,12, 3);

	switch(mode){
	case 0:			//contest
		no_str[0] = n0_ + (contest_no / 100);
		no_str[1] = n0_ + ((contest_no % 100) / 10);
		no_str[2] = n0_ + (contest_no % 10);
		NMenuMsgWrite(no_str,12, 7);
		break;
	case 1:			//museum
		no_str[0] = n0_ + (title_no / 100);
		no_str[1] = n0_ + ((title_no % 100) / 10);
		no_str[2] = n0_ + (title_no % 10);
		NMenuMsgWrite(no_str,12, 7);
		break;
	case 2:			//preview
		no_str[0] = n0_ + (pre_no / 100);
		no_str[1] = n0_ + ((pre_no % 100) / 10);
		no_str[2] = n0_ + (pre_no % 10);
		NMenuMsgWrite(no_str,12, 7);
		break;
	}
}
/*==================================================================*/
/*==================================================================*/
//肖像画を呼びだす為のワークセット
static void	portraite_work_set(u8 mode)
{
	PORTRAIT_DATA *pd;


	//各エフェクト共通引数部分
	pd = (PORTRAIT_DATA *)(&(UserWork[TEMP_PORTRAIT_ADRS]));
	pd->monsno=mons_no;								//ポケモン番号セット
	pd->idno=id_no;									//ポケモンIDセット
	pd->personal_rnd = rand_no;						//個性乱数セット

	//描くエフェクト別部分
	switch(mode){
	case 0:			//contest
		UserWork[TEMP_PORTRAIT_MSGFLG] = 0;		//通常表示
		UserWork[TEMP_PORTRAIT_PLACE] = 0;		//仮で"ハジツゲ"
		pd->pict_type=(contest_no-1);			//コンテスト種類セット
		PM_strcpy(pd->oyaname,buri_mes);		//ブリーダー名(仮)セット
		PM_strcpy(pd->nickname,nick_mes);		//ポケモン名(仮)セット
		break;
	case 1:			//museum
		UserWork[TEMP_PORTRAIT_MSGFLG] = 0;		//通常表示
		UserWork[TEMP_PORTRAIT_PLACE] = 8;		//仮で"美術館1"
		pd->pict_type=(title_no-1);				//タイトル種類セット
		PM_strcpy(pd->nickname,nick_mes);		//ポケモン名(仮)セット
		break;
	case 2:			//preview
		UserWork[TEMP_PORTRAIT_MSGFLG] = 1;		//プレビュー表示
		UserWork[TEMP_PORTRAIT_PLACE] = 8;		//プレビュー時は8固定
		pd->pict_type=(pre_no-1);				//絵の種類セット(コンテストと同じ)
		break;
	case 3:			//effect tune(輪郭)
		UserWork[TEMP_PORTRAIT_MSGFLG] = 0;		//通常表示
		UserWork[TEMP_PORTRAIT_PLACE] = 8;		//仮で"美術館1"
		pd->pict_type= 0;				//タイトル種類セット
		PM_strcpy(pd->nickname,nick_mes);		//ポケモン名(仮)セット
		break;
	case 4:			//effect tune(淡いカラー)
		UserWork[TEMP_PORTRAIT_MSGFLG] = 0;		//通常表示
		UserWork[TEMP_PORTRAIT_PLACE] = 8;		//仮で"美術館1"
		pd->pict_type= 3;				//タイトル種類セット
		PM_strcpy(pd->nickname,nick_mes);		//ポケモン名(仮)セット
		break;
	case 5:			//effect tune(墨絵)
		UserWork[TEMP_PORTRAIT_MSGFLG] = 0;		//通常表示
		UserWork[TEMP_PORTRAIT_PLACE] = 8;		//仮で"美術館1"
		pd->pict_type= 9;				//タイトル種類セット
		PM_strcpy(pd->nickname,nick_mes);		//ポケモン名(仮)セット
		break;
	}
}

/*==================================================================*/
/*==================================================================*/
//フラグメッセージ書き込み
//x,y = 書き込み座標(キャラ単位）
//flag = 0 or 1
static void flag_msg_write(u8 x,u8 y,u8 flag)
{
	if(flag==0){
		no_str[0] = n0_;
	}else{
		no_str[0] = n1_;
	}
	no_str[1]=EOM_;

	NMenuMsgWrite(no_str,x,y);
}

/*==================================================================*/
/*==================================================================*/
//フラグメッセージ書き込み
//x,y = 書き込み座標(キャラ単位）
//work = u16
static void work_msg_write(u8 x,u8 y,u16 work)
{
	no_str[0] = n0_ + (work / 10000);
	no_str[1] = n0_ + ((work % 10000) / 1000);
	no_str[2] = n0_ + ((work % 1000) / 100);
	no_str[3] = n0_ + ((work % 100) / 10);
	no_str[4] = n0_ + (work % 10);
	no_str[5]=EOM_;
	NMenuMsgWrite(no_str,x,y);
}

/*==================================================================*/
/*==================================================================*/
#endif	PM_DEBUG

