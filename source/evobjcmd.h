//**********************************************************************
//		evobjcmd.c
//**********************************************************************
#ifndef EVOBJCMD_H
#define	EVOBJCMD_H

#undef	EXT
#ifdef 	EVOBJCMD_H_PROTO
#define	EXT	/**/
#else
#define	EXT extern
#endif

EXT u8 AnmCmdSet(u8,u8,u8,ACMD_CODE*);						// ±ÆÒ°¼®İºÏİÄŞ¾¯Ä
EXT u8 AnmCmdEnd(u8,u8,u8);									// ±ÆÒ°¼®İºÏİÄŞI—¹Áª¯¸
EXT void AnmCmdFree(void);									// ±ÆÒ°¼®İºÏİÄŞŠJ•ú

#undef EXT
#endif // EVOBJCMD_H
