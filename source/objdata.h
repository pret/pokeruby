
typedef struct{
	u8	size;
	u8	patcnt;
}pmPara;

#ifndef __OBJDATA_H_
#define __OBJDATA_H_

extern	CellData	ObjDataCell[];
extern	CellData	PM2FObjDataCell[];
extern	CellData	PM2BObjDataCell[];
extern	CellData	TRFObjDataCell[];
extern	CellData	TRBObjDataCell[];
extern	PalData		ObjDataPal[];
extern	PalData		PM2NObjDataPal[];
extern	PalData		PM2RObjDataPal[];
extern	PalData		TRFObjDataPal[];
extern	PalData		TRBObjDataPal[];
extern	actHeader	PM2FTbl[];
extern	actHeader	PM2BTbl[];
extern	actHeader	TRFTbl[];
extern	actHeader	TRBTbl[];
extern	pmPara		pm2fpara[];
extern	pmPara		pm2bpara[];
extern	pmPara		trfpara[];
extern	pmPara		trbpara[];
extern	const u8 PokeYOfsTbl[];

#endif
