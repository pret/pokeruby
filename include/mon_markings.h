#ifndef POKERUBY_MON_MARKINGS_H
#define POKERUBY_MON_MARKINGS_H

struct PokemonMarkMenu
{
    /*0x0000*/ u16 baseTileTag;
    /*0x0002*/ u16 basePaletteTag;
    /*0x0004*/ u8 markings; // bit flags
    /*0x0005*/ s8 cursorPos;
    /*0x0006*/ bool8 markingsArray[4];
    /*0x000A*/ u8 cursorBaseY;
    /*0x000B*/ bool8 spriteSheetLoadRequired;
    /*0x000C*/ struct Sprite *menuWindowSprites[2]; // upper and lower halves of menu window
    /*0x0014*/ struct Sprite *menuMarkingSprites[4];
    /*0x0024*/ struct Sprite *menuTextSprite;
    /*0x0028*/ const u8 *frameTiles;
    /*0x002C*/ const u16 *framePalette;
    /*0x0030*/ u8 menuWindowSpriteTiles[0x1000];
    /*0x1030*/ u8 filler1030[0x80];
    /*0x10B0*/ u8 tileLoadState;
};

void sub_80F7404(void);
void sub_80F727C(struct PokemonMarkMenu *ptr);

#endif //POKERUBY_MON_MARKINGS_H
