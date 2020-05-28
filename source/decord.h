//#include	"pokegra.h"
#include "..\graphic\pokegra.h"	//change 2001.07.04(êÖ) by matsuda
extern	void	DecordWram(void *,void *);
extern	void	DecordVram(void *,void *);
extern	void	DecordCellSet(CellData *);
extern	void	DecordCellSetAdrs(CellData *,void *);
extern	void	DecordPalSet(PalData *);
extern	void	DecordPalSetAdrs(PalData *,void *);
extern	void	DecordPokeCellMake(CellData *,int,int,void *,void *,int);
extern	void	DecordPokeCellMakeBuchi(CellData *,int,int,void *,void *,int,u32);
extern	void	DecordPokeCellMakeRndFB(CellData *,int,int,void *,void *,int,u32,u8);
//extern	void	DecordPokeCellSet(CellData *,int,int);
extern void	DecordPoke(CellData *cell, void *adr1,void *adr2);
extern void PokeCellMake(int size,int patcnt,void *adr1,void *adr2);

extern	u8	UserWork[0x20000];

#define	DECORD_BUFFER	0x02000000
#define	POKE_BACK		0
#define	POKE_FRONT		1
