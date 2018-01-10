
// Includes
#include "global.h"
#include "sprite.h"
#include "pokemon_icon.h"
#include "pokemon_storage_system.h"

// Static type declarations

// Static RAM declarations

// Static ROM declarations

void sub_80999C4(struct Sprite *sprite);
struct Sprite *sub_8099AFC(u16 species, u32 personality, u16 a2, u16 a3, u8 a4, u8 a5);

// .rodata

const struct OamData gOamData_83B6F2C;

const struct SpriteTemplate gSpriteTemplate_83B6F14 = {
    0x000f,
    0xdac0,
    &gOamData_83B6F2C,
    gDummySpriteAnimTable,
    NULL,
    gDummySpriteAffineAnimTable,
    SpriteCallbackDummy
};

const struct OamData gOamData_83B6F2C = {
    .size = 2
};

// .text

u8 get_preferred_box(void)
{
    return gPokemonStorage.currentBox;
}

void sub_8098B48(void)
{
    u16 i;

    sub_809D51C();
    for (i = 0; i < 40; i++)
        gPokemonStorageSystemPtr->unk_10d0[i] = 0;
    for (i = 0; i < 40; i++)
        gPokemonStorageSystemPtr->unk_1120[i] = 0;
    for (i = 0; i < 6; i++)
        gPokemonStorageSystemPtr->unk_1038[i] = 0;
    for (i = 0; i < 30; i++)
        gPokemonStorageSystemPtr->unk_1050[i] = 0;
    gPokemonStorageSystemPtr->unk_1034 = NULL;
    gPokemonStorageSystemPtr->unk_0d5c = 0;
}

void sub_8098BF0(void)
{
    u32 personality = GetMonData(&gPokemonStorageSystemPtr->unk_25b4, MON_DATA_PERSONALITY);
    gPokemonStorageSystemPtr->unk_1034 = sub_8099AFC(GetMonData(&gPokemonStorageSystemPtr->unk_25b4, MON_DATA_SPECIES2), personality, 0, 0, 1, 7);
    gPokemonStorageSystemPtr->unk_1034->callback = sub_80999C4;
}
