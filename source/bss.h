
#include	"bss2.h"

#ifndef	__BSS_H_
#define	__BSS_H_

#include	"param.h"

extern	void	BSSInit(void);
extern	void	BSSBoot(void);
extern	void	BSSTuushinStart(void);

extern	WazaEffectWork	WEW;

extern	u8		TuushinReqTaskNo;
extern	u8		TuushinRecvTaskNo;
extern	u8		RecvTuushinFlag;
extern	void	TuushinReqSet(u8,u16,u8 *);
extern	void	TuushinRecvSet(void);

extern	void	TuushinAddTask(void);

extern void BSS_POKEPARA_GET_SET(u8,u8,u8);
extern void	BSS_POKEPARA_GET2_SET(u8,u8,u8);
extern void BSS_POKEPARA_PUT_SET(u8,u8,u8,u8,u8 *);
extern void BSS_POKEPARA_PUT2_SET(u8,u8,u8,u8 *);
extern void BSS_POKE_ENCOUNT_SET(u8);
extern void BSS_POKE_APPEAR_SET(u8,u8,u8);
extern void BSS_POKE_RETURN_SET(u8,u8);
extern void BSS_TRAINER_ENCOUNT_SET(u8);
extern void BSS_TRAINER_APPEAR_SET(u8);
extern void BSS_TRAINER_RETURN_SET(u8);
extern void BSS_POKE_KIZETSU_SET(u8);
extern void BSS_POKE_ZENMETU_SET(u8);
extern void BSS_GET_SUCCESS_SET(u8);
extern void BSS_GET_FAIL_SET(u8,u8);
extern void BSS_POKE_LEVELUP_SET(u8,u8,u8 *);
extern void BSS_WAZA_EFFECT_SET(u8,u16,u8,u16,s32,u8,u8 *);
//extern void BSS_MESSAGE_SET(u8,u8,u8 *);
extern void BSS_MESSAGE_SET(u8,u16);
extern void BSS_ALERT_MESSAGE_SET(u8,u16);
extern void BSS_COMMAND_SELECT_SET(u8,u8,u16);
extern void BSS_WAZA_SELECT_SET(u8,u8,u8,u8 *);
extern void BSS_ITEM_SELECT_SET(u8,u8 *);
extern void BSS_POKE_SELECT_SET(u8,u8,u8,u8,u8 *);
extern void BSS_ESCAPE_SET(u8);
extern void BSS_HP_GAUGE_SET(u8,u16);
extern void BSS_EXP_GAUGE_SET(u8,u8,u16);
extern void BSS_STATUS_SET_SET(u8,u32,u32);
extern void BSS_STATUS_EFFECT_SET(u8,u8,u32);
extern void BSS_STATUS_CLEAR_SET(u8,u8);
extern void BSS_DATA_TRANS_SET(u8,u16,u8 *);
extern void BSS_DATA_RAM_TRANS_SET(u8,u32,u16,u8 *);
extern void BSS_BGM_TRANS_SET(u8,u16,u8 *);
extern void BSS_VOICE_TRANS_SET(u8,u16,u8 *);
extern void BSS_SELECT_RETURN_SET(u8,u8,u16);
extern void BSS_POKE_RESHUFFLE_SET(u8,u8,u8 *);
extern void BSS_USE_ITEM_SET(u8,u16);
extern void BSS_USE_BALL_SET(u8,u16);
extern void BSS_LOOPCOUNT_CLEAR_SET(u8);
extern void BSS_LOOPCOUNT_SET_SET(u8,u8);
extern void BSS_SWITCHFLAG_CLEAR_SET(u8);
extern void BSS_SWITCHFLAG_SET_SET(u8);
extern void BSS_POKEDAMAGE_BLINK_SET(u8);
extern void BSS_GAUGE_OFF_SET(u8);
extern void BSS_SE_PLAY_SET(u8,u16);
extern void BSS_ME_PLAY_SET(u8,u16);
extern void BSS_VOICE_PLAY_SET(u8);
extern void BSS_ENCOUNT_EFFECT_SET(u8,u8);
extern void BSS_POKE_SENDOUT_SET(u8);
extern void BSS_BALL_GAUGE_SET_SET(u8,u8 *,u8);
extern void BSS_BALL_GAUGE_OFF_SET(u8);
extern void BSS_GAUGE_YURE_STOP_SET(u8);
extern void BSS_VANISH_ON_OFF_SET(u8,u8);
extern void BSS_FIGHT_EFFECT_SET(u8,u8,u16);
extern void BSS_TUUSHIN_WAIT_SET(u8,u8);
extern void BSS_CSRPOS_CLEAR_SET(u8,u8);
extern void BSS_FIGHT_END_SET(u8,u8);

extern	vu32		DebugWork;
extern	vu32		DebugWork2;

#endif

