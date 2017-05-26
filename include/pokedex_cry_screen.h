#ifndef GUARD_POKEDEX_CRY_SCREEN_H
#define GUARD_POKEDEX_CRY_SCREEN_H

struct CryRelatedStruct
{
    u16 unk0;
    u8 unk2;
    u8 paletteNo;
    u8 xPos;
    u8 yPos;
};

u8 ShowPokedexCryScreen(struct CryRelatedStruct *, u8);
u8 sub_8119E3C(struct CryRelatedStruct *, u8);
void sub_8119F88(u8 a);
void sub_811A050(u16 species);
void DestroyCryMeterNeedleSprite();

#endif // GUARD_POKEDEX_CRY_SCREEN_H
