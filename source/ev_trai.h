//**********************************************************************
//		ev_trai.h
//**********************************************************************
#ifndef	EV_TRAI_H
#define EV_TRAI_H

#undef	EXT
#ifdef	EV_TRAI_H_PROTO
#define	EXT	/**/
#else
#define	EXT	extern
#endif

EXT u8 EvTrainerSightCheck( void );
EXT void SetHideSandTrainerPulloffTask( EventOBJ * );
 
#undef	EXT
#endif	// EV_TRAI_H

