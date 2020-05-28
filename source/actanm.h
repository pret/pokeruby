//**********************************************************************
//		act_anm.h
//**********************************************************************
#ifndef	ACTANM_H
#define	ACTANM_H

#include "actanm.def"

extern u8 ObjPalManStart;										// ÊßÚ¯ÄÏÈ°¼Ş¬NoŠJn
extern u32 AffineWorkUse;							// ±Ì¨İÏÈ°¼Ş¬

extern void	ActAnm( actWork * );								// ±¸À°±ÆÒÒ²İ
extern void	ActAnmChg( actWork *, u8 );							// ±ÆÒ°¼®İNoÁªİ¼Ş
extern void	ActAnmChkChg( actWork *, u8 );						// Áª¯¸—L‚è
extern void ActAnmOffsChg( actWork *, u8 );						// ±ÆÒµÌ¾¯ÄNoÁªİ¼Ş
extern void	ActAffAnmChg( actWork *, u8 );						// Šgk±ÆÒNoÁªİ¼Ş
extern void	ActAffAnmChkChg( actWork *, u8 );					// Áª¯¸—L‚è
extern void	ActAffAnmHoldChg( actWork *, u8 );					// Šgk±ÆÒNoÁªİ¼ŞŠgk—¦•Û
extern void	ActAffAnmHoldChkChg( actWork *, u8 );				// Áª¯¸—L‚è
extern void ActCharNumSet( actWork * );							// ·¬×ÅİÊŞ¾¯Ä(”ñ“]‘—)

extern void	AffineWorkManInit( void );							// ±Ì¨İÏÈ°¼Ş¬ Ü°¸‰Šú‰»
extern void	AffineNumSet( actWork * );							// ±Ì¨İNo ¾¯Ä
extern u8	AffineWorkNumGet( void );							// ±Ì¨İÏÈ°¼Ş¬ g—p‰Â”\ŒÂŠæ“¾
extern void	AffineWorkNumDel( u8 );								// ±Ì¨İÏÈ°¼Ş¬ g—pNoíœ
extern void OBJ_AffineWorkCalc(u8,s16,s16,s16);					// ±Ì¨İÜ°¸Êß×ÒÀ¾¯Ä

extern u16	CellSet( const CellData * );						// ¾Ù“o˜^’P”­
extern void	CellSets( const CellData * );						// ¾Ù“o˜^•¡”
extern void	CellDel( u16 );										// ¾Ù“o˜^”Ô†íœ
extern void	CellManAllInit( void );								// ¾ÙÏÈ°¼Ş¬‰Šú‰»
extern u16	CellCharNumGet( u16 );								// “o˜^”Ô† -> ·¬×ÅİÊŞ
extern u16	CellCharNumIdGet( u16 );							// ·¬×ÅİÊŞ -> “o˜^”Ô†

extern void	ObjPalManInit( void );								// µÌŞ¼ŞªÊßÚ¯ÄÏÈ°¼Ş¬‰Šú‰»
extern u8	ObjPalSet( const PalData * );								// µÌŞ¼ŞªÊßÚ¯Ä¾¯Ä’P”­
extern void	ObjPalSets( const PalData * );							// ÊßÚ¯Ä¾¯Ä•¡”
extern u8	ObjPalNumSet( u16 );								// ÊßÚ¯ÄID“o˜^
extern u8	ObjPalNumGet( u16 );								// “o˜^ÅİÊŞ -> ÊßÚ¯ÄÅİÊŞ
extern u16	ObjPalNumIdGet( u8 );								// ÊßÚ¯ÄNo -> ID
extern void	ObjPalRegNumDel( u16 );								// “o˜^”Ô†íœ

extern void SetActOamPat( actWork *, const OAMPatSt * );		// OAM Êß¯Ä¾¯Ä
extern u8	ActOamSet( actWork *, u8 * );						// OAM ¾¯Ä
extern u8	OamPatDevelop( actWork *, ActOamData *, u8 * );		// OAM Êß¯Ä“WŠJ

#endif															// ACTANM_H
