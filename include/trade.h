
#ifndef GUARD_TRADE_H
#define GUARD_TRADE_H

struct TradeEwramSubstruct2 {
    /*0x0000*/ u8 filler_0000;
    /*0x0004*/ struct Window window;
    /*0x0034*/ u8 textWindowBaseTileNum;
    /*0x0038*/ struct Pokemon pokemon;
    /*0x009c*/ u8 unk_009c;
    /*0x009d*/ u8 unk_009d;
    /*0x009e*/ u16 linkData[10];
    /*0x00b2*/ u8 unk_00b2;
    /*0x00b3*/ u8 unk_00b3;
    /*0x00b4*/ u16 unk_00b4;
    /*0x00b6*/ u16 unk_00b6;
    // Sprite indices
    /*0x00b8*/ u8 pokePicSpriteIdxs[2];
    /*0x00ba*/ u8 unk_00ba;
    /*0x00bb*/ u8 unk_00bb;
    /*0x00bc*/ u8 unk_00bc;
    /*0x00bd*/ u8 unk_00bd;
    // Timer
    /*0x00c0*/ u32 unk_00c0;
    // Scene index
    /*0x00c4*/ u16 unk_00c4;
    /*0x00c6*/ u8 filler_00c6[0x3c];
    /*0x0102*/ u8 unk_0102;
    /*0x0103*/ u8 unk_0103;
    /*0x0104*/ u16 unk_0104;
    /*0x0106*/ u16 unk_0106;
    /*0x0108*/ u16 unk_0108;
    /*0x010a*/ u16 unk_010a;
    /*0x010c*/ u16 unk_010c;
    /*0x010e*/ s16 unk_010e;
    /*0x0110*/ s16 bg1vofs;
    /*0x0112*/ s16 bg1hofs;
    /*0x0114*/ s16 bg2vofs;
    /*0x0116*/ s16 bg2hofs;
    /*0x0118*/ u16 unk_0118;
    /*0x011a*/ u16 unk_011a;
    /*0x011c*/ u16 unk_011c;
    /*0x011e*/ u8 isLinkTrade;
    /*0x0120*/ u16 tradeSpecies[2];
    /*0x0124*/ u16 unk_0124;
};

extern struct TradeEwramSubstruct2 *gUnknown_03004828;
extern const u16 gUnknown_0820C9F8[][16];
extern const u32 gUnknown_0820CA98[];
extern const u16 gUnknown_0820F798[];

void sub_8047CD8(void);
void sub_804B790(void);
void sub_804E174(void);
extern const u8 gOtherText_MaleSymbol3[2];
extern const u8 gOtherText_FemaleSymbol3[2];
extern const u8 gOtherText_GenderlessSymbol[2];

void sub_804E22C(void);

#endif //POKERUBY_TRADE_H
