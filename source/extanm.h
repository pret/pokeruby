
#ifndef __EXTANM_H__
#define __EXTANM_H__


//----------------------------------------------------------
//	\‘¢‘ÌéŒ¾
//----------------------------------------------------------
typedef struct{
	ActOamData *oamData;			//Add‚·‚é±¸À°‚ÌOamÃŞ°À
	u8 *DataAdrs;					//“]‘—‚·‚éÃŞ°À‚Ìæ“ª±ÄŞÚ½
	const actAnm * const *anm_tbl;	// ±ÆÒÃ°ÌŞÙ
	const actAffAnm * const *aff_tbl;	// ŠgkÊß¯Ä
	void (*move)(struct actWork_tag *);
	u16 pal_id;
}ExtActHeader;


//----------------------------------------------------------
//	ŠO•”ŠÖ”éŒ¾
//----------------------------------------------------------
extern u8 ExtAnm(actWork *Xreg);
extern u8 ExtAddActor(ExtActHeader *eah, s16 x, s16 y, u8 pri);
extern void ExtDelActor(actWork *Xreg);
extern void ExtAnmChg(actWork *xreg, u8 anmNo);


#endif
