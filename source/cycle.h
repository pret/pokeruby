//**********************************************************************
//		cycle.h
//**********************************************************************
#ifndef	CYCLE_H
#define CYCLE_H

#undef	EXT
#ifdef	CYCLE_H_PROTO
#define	EXT	/**/
#else
#define	EXT	extern
#endif

enum
{
	CYCLE_S_NORMAL = 0,											// ’Êí
	CYCLE_S_TURN,												// U‚èŒü‚«
	CYCLE_S_FTUP,												// ÌÛİÄ
	CYCLE_S_DANIEL,												// ÀŞÆ´Ù
	CYCLE_S_WHEELIE,											// ³²Ø°
	CYCLE_S_KANI,												// ¶Æ
	CYCLE_S_JUMP_TURN,											// ¼Ş¬İÌßÀ°İ
};

#define HERO_MOVE_SPEED_1	(0x01)								// ©‹@‘¬“x
#define HERO_MOVE_SPEED_2	(0x02)
#define HERO_MOVE_SPEED_3	(0x03)
#define HERO_MOVE_SPEED_4	(0x04)
#define HERO_MOVE_SPEED_MAX HERO_MOVE_SPEED_4

EXT void HeroMoveCycle(u8,u16,u16);								// ©“]Ô“®ì§Œä
EXT void CycleCommandSet(u16,u16);								// ©“]ÔºÏİÄŞ¾¯Ä

EXT void MyCycleWorkInit(u32,u32);								// ©“]ÔÜ°¸‰Šú‰»
EXT void MyCycleRequest(u8);									// ©“]ÔØ¸´½Ä
EXT u8 CheckRideCycle(void);									// ©“]ÔæÔÁª¯¸
EXT u8 CheckFtDownEnableCycle(void);							// ©“]ÔÌÛİÄÀŞ³İ‰Â”\Áª¯¸
EXT u8 CycleBatMoveAttrCheck(u8);								// ©“]ÔˆÚ“®‰Â”\Áª¯¸
EXT s16 GetHeroMoveSpeed(void);									// ©‹@ˆÚ“®‘¬“xæ“¾
EXT void CycleSpeedBrakeSet(u8);								// ©“]Ô‘¬“x¾¯Ä
EXT void SetHeroCycleStatus(void);								// ©“]Ô½Ã°À½¾¯Ä

#endif	// CYCLE_H
