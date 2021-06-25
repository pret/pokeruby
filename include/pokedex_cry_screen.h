#ifndef GUARD_POKEDEX_CRY_SCREEN_H
#define GUARD_POKEDEX_CRY_SCREEN_H

struct CryScreenWindow
{
    u16 unk0;
    u8 unk2;
    u8 paletteNo;
    u8 xPos;
    u8 yPos;
};

u8 ShowPokedexCryScreen(struct CryScreenWindow *, u8);
u8 LoadCryWaveformWindow(struct CryScreenWindow *, u8);
void UpdateCryWaveformWindow(u8 a);
void CryScreenPlayButton(u16 species);
void DestroyCryMeterNeedleSprite();

#endif // GUARD_POKEDEX_CRY_SCREEN_H
