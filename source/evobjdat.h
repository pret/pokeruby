//**********************************************************************
//	evobjdat.h
//**********************************************************************
#ifndef	EVOBJDAT_H
#define	EVOBJDAT_H

#include	"evobj.def"
#include	"evobjdat.def"

#undef	EXT
#ifdef	EVOBJDAT_H_PROTO
#define	EXT	/**/
#else
#define	EXT	extern
#endif

EXT	void (* const EvObjMoveTbl[])(actWork*);					// “®ìÃ°ÌŞÙ
EXT const u8 EvObjMoveLimitFlagTbl[];							// ˆÚ“®§ŒÀÃ°ÌŞÙ
EXT const u8 EvObjDefaultSiteTbl[];								// Šî–{•ûŒüÃ°ÌŞÙ
EXT	const SXYObjHead * const SxyObjHeadTbl[];					// OBJ Í¯ÀŞÃ°ÌŞÙ
EXT const actHeader * const EvActHeadTbl[];						// ±¸ÀÍ¯ÀŞ
EXT	const PalData EvObjPalTbl[];								// ÊßÚ¯ÄÃ°ÌŞÙ
EXT const STDATA EvObjHeroPalStTbl[];							// ålŒöÊßÚ¯ÄÃŞ°ÀÃ°ÌŞÙ
EXT const STDATA EvObjSpPalStTbl[];								// “ÁêÊßÚ¯Ä½Ã°À½Ã°ÌŞÙ
EXT const u16 * const EvObjStayPalTbl[];						// í’“ÊßÚ¯ÄÃ°ÌŞÙ
EXT const actAnmData * const SeedCellTransTbl[];				// í¾Ù
EXT const u8 * const SeedPalNoTbl[];							// íÊßÚ¯Ä
EXT const u8 * const SeedObjCodeTbl[];							// íOBJº°ÄŞ

#define EvObjDefaultSite(code)	(EvObjDefaultSiteTbl[code])		// Šî–{•ûŒü
#define	SxyObjHeadAdrs(c) ((SXYObjHead*)SxyObjHeadTbl[c])		// SXY OBJ ½Ã°À½±ÄŞÚ½
#define	EvActHeadGet(c) ((actHeader*)EvActHeadTbl[c])			// ±¸ÀÍ¯ÀŞÃ°ÌŞÙ±ÄŞÚ½æ“¾
#define SeedCellTransGet(s) (SeedCellTransTbl[s])				// í·¬×¾Ùæ“¾
#define SeedPalNoGet(s,g) (SeedPalNoTbl[s][g])					// íÊßÚ¯Äæ“¾
#define SeedObjCodeGet(s,g) (SeedObjCodeTbl[s][g])				// íOBJº°ÄŞ

#undef	EXT
#endif	// EVOBJDAT_H
