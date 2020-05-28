//**********************************************************************
//		slot.h
//**********************************************************************
#ifndef SLOT_H
#define	SLOT_H

#undef	EXT
#ifdef 	EVOBJMV_H_PROTO
#define	EXT	/**/
#else
#define	EXT extern
#endif

EXT void Slot(u8,pFunc);									// ½Û¯Ä

#ifdef PM_DEBUG
EXT void SlotDebug(u8,pFunc);
#endif

#undef EXT
#endif // SLOT_H
