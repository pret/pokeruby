#include	"agbmons.h"
#include	"server.def"
#include	"print.h"
#include	"fight.def"

#ifndef __PARAM_H__
#include	"param.h"
#endif

typedef struct{
	u8 *ch_data1;					// ·¬×ÃÞ°À±ÄÞÚ½
	u8 *sc_data1;					// ·¬×ÃÞ°À±ÄÞÚ½
	u8 *ch_data2;					// ·¬×ÃÞ°À±ÄÞÚ½
	u8 *sc_data2;					// ·¬×ÃÞ°À±ÄÞÚ½
	u8 *cl_data;					// ·¬×ÃÞ°À±ÄÞÚ½
}BGChrTable;

#ifndef	__FIGHT_H_
#define	__FIGHT_H_

extern	int	FightEffectCount;
extern	const	PokePersonalData PPD[];
extern	void	fight_h_blank_intr(void);
extern	void	fight_v_blank_intr(void);
extern	u8		TrainerDataSet(PokemonParam *,u16);
extern	void	FightREGSet(void);
extern	void	FightBG3Set(void);
extern	void	FightBGSetAll(void);
extern	u8		FightBGSet(u8);
extern	void	FightWindowChrSet(void);

extern	void	FightEndWindowInit(void);

extern	void	InitFight(void);
extern	void	MainFight(void);

extern	u16		ScrX0;
extern	u16		ScrY0;
extern	u16		ScrX1;
extern	u16		ScrY1;
extern	u16		ScrX2;
extern	u16		ScrY2;
extern	u16		ScrX3;
extern	u16		ScrY3;

extern	u16		Win0H;
extern	u16		Win0V;
extern	u16		Win1H;
extern	u16		Win1V;


extern	u16		FightType;

extern	u8		GroundNo;

extern	u8	FightMsgBuf[300];

extern	u8	EvStrBuf0[16];
extern	u8	EvStrBuf1[16];

extern	u32	TuushinWaitWork;

extern	const	BGChrTable BGCT[];
extern	TALK_WIN	FightMsg;

extern	const u8 PokeNameData[][6];
extern	const u8 WazaNameData[][8];

extern	MultiPokeListData MPLD[3];

#endif

#ifdef	PM_DEBUG
extern	u8	DebugFightFlag;
#endif

#define	TUUSHIN_DEBUG		0
