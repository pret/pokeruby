
#ifndef __POKEICON_H__
#define __POKEICON_H__


//----------------------------------------------------------
//	定数
//----------------------------------------------------------
enum{
	PALID_POKEICON_0 = 56000,
	PALID_POKEICON_1,
	PALID_POKEICON_2,
	PALID_POKEICON_3,
	PALID_POKEICON_4,
	PALID_POKEICON_5,
};

#define ANNOON_IDMAX	28	//ｱﾝﾉｰﾝの種類Max

//----------------------------------------------------------
//	外部関数宣言
//----------------------------------------------------------
extern void PokeIconPaletteAllDel(void);
extern void PokeIconPaletteAllSet(void);
extern u8 PokeIconSet(u16 pokeno, pActFunc move, s16 x, s16 y, u8 pri);
extern void PokeIconDmmyMove(actWork *Xreg);
extern void PokeIconDel(actWork *Xreg);
extern void PokeIconPaletteSet(u16 pokeno);
extern void PokeIconPaletteDel(u16 pokeno);
extern u32 GetPokeIconCharAdrs(u16 pokeno, u32 rnd);
extern u8 PokeIconSet2(u16 pokeno, pActFunc move, s16 x, s16 y, u8 pri, u32 rnd);
extern u16 GetPokeIconCharID(u16 pokeno, u32 rnd);
extern u16 GetAnnoonNo(u32 personal_rnd);
extern void PokeIconPaletteSetCharID(u16 chrid);
extern u8 PokeIconSetCharID(u16 chrid, pActFunc move, s16 x, s16 y, u8 pri);
extern u16 MailHoldMonsNo_IconCharIDConv(u16 hold_monsno);
extern void PokeIconPaletteDelCharID(u16 chrid);


//----------------------------------------------------------
//	データ
//----------------------------------------------------------
extern const u32 IconCharAdrs[];
extern const u8 IconPalAtr[];


#endif

