
// Includes
#include "global.h"
#include "constants/species.h"
#include "sprite.h"
#include "pokemon_icon.h"
#include "pokemon_storage_system.h"

// Static type declarations

// Static RAM declarations

// Static ROM declarations

void sub_8098E68(struct Sprite *sprite);
void sub_8099388(struct Sprite *sprite, u16 a0);
void sub_80999C4(struct Sprite *sprite);
struct Sprite *PSS_SpawnMonIconSprite(u16 species, u32 personality, s16 a2, s16 a3, u8 a4, u8 a5);
void sub_8099BE0(struct Sprite *sprite);

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

void ResetPSSMonIconSprites(void)
{
    u16 i;

    sub_809D51C();
    for (i = 0; i < 40; i++)
        gPokemonStorageSystemPtr->unk_10d0[i] = 0;
    for (i = 0; i < 40; i++)
        gPokemonStorageSystemPtr->unk_1120[i] = 0;
    for (i = 0; i < 6; i++)
        gPokemonStorageSystemPtr->unk_1038[i] = NULL;
    for (i = 0; i < 30; i++)
        gPokemonStorageSystemPtr->unk_1050[i] = NULL;
    gPokemonStorageSystemPtr->unk_1034 = NULL;
    gPokemonStorageSystemPtr->unk_0d5c = 0;
}

void sub_8098BF0(void)
{
    u32 personality = GetMonData(&gPokemonStorageSystemPtr->unk_25b4, MON_DATA_PERSONALITY);
    gPokemonStorageSystemPtr->unk_1034 = PSS_SpawnMonIconSprite(GetMonData(&gPokemonStorageSystemPtr->unk_25b4, MON_DATA_SPECIES2), personality, 0, 0, 1, 7);
    gPokemonStorageSystemPtr->unk_1034->callback = sub_80999C4;
}

void SpawnBoxIconSprites(u8 boxId)
{
    struct BoxPokemon *box = gPokemonStorage.boxes[boxId];
    u16 i;
    u16 k = 0;
    for (i = 0; i < 5; i++)
    {
        u16 j;
        for (j = 0; j < 6; j++)
        {
            u16 species = GetBoxMonData(box, MON_DATA_SPECIES2);
            if (species != SPECIES_NONE)
                gPokemonStorageSystemPtr->unk_1050[k] = PSS_SpawnMonIconSprite(species, GetBoxMonData(box, MON_DATA_PERSONALITY), 24 * j + 0x64, 24 * i + 0x2c, 2, 18 - j);
            else
                gPokemonStorageSystemPtr->unk_1050[k] = NULL;
            box++;
            k++;
        }
    }
}

void sub_8098D20(u8 monId)
{
    struct BoxPokemon *mon = gPokemonStorage.boxes[get_preferred_box()] + monId;
    u16 species = GetBoxMonData(mon, MON_DATA_SPECIES2);
    if (species != SPECIES_NONE)
    {
        s16 x = 24 * (monId % 6) + 0x64;
        s16 y = 24 * (monId / 6) + 0x2c;
        gPokemonStorageSystemPtr->unk_1050[monId] = PSS_SpawnMonIconSprite(species, GetBoxMonData(mon, MON_DATA_PERSONALITY), x, y, 2, 18 - (monId % 6));
    }
}

void sub_8098DE0(s16 a0)
{
    u16 monId;
    for (monId = 0; monId < 30; monId++)
    {
        if (gPokemonStorageSystemPtr->unk_1050[monId])
        {
            gPokemonStorageSystemPtr->unk_1050[monId]->data[2] = a0;
            gPokemonStorageSystemPtr->unk_1050[monId]->data[4] = 1;
            gPokemonStorageSystemPtr->unk_1050[monId]->callback = sub_8098E68;
        }
    }
}

void sub_8098E24(struct Sprite *sprite)
{
    if (sprite->data[1] != 0)
    {
        sprite->data[1]--;
        sprite->pos1.x += sprite->data[2];
    }
    else
    {
        gPokemonStorageSystemPtr->unk_1178--;
        sprite->pos1.x = sprite->data[3];
        sprite->callback = SpriteCallbackDummy;
    }
}

void sub_8098E68(struct Sprite *sprite)
{
    if (sprite->data[4] != 0)
    {
        sprite->data[4]--;
    }
    else
    {
        sprite->pos1.x += sprite->data[2];
        sprite->data[5] = sprite->pos1.x + sprite->pos2.x;
        if (sprite->data[5] < 0x45 || sprite->data[5] > 0xfb)
            sprite->callback = SpriteCallbackDummy;
    }
}

void sub_8098EA0(u8 col)
{
    u16 i;

    for (i = 0; i < 5; i++)
    {
        if (gPokemonStorageSystemPtr->unk_1050[col])
        {
            sub_8099BE0(gPokemonStorageSystemPtr->unk_1050[col]);
            gPokemonStorageSystemPtr->unk_1050[col] = NULL;
        }
        col += 6;
    }
}

u8 sub_8098EE0(u8 a0, u16 a1, s16 a2)
{
    u16 i;
    u16 x;
    u16 y;
    u8 count;
    u8 x1;
    u16 sp1c;

    y = 0x2c;
    x = 24 * a0 + 0x64;
    sp1c = x - (a1 + 1) * a2;
    x1 = 18 - a0;
    count = 0;

    for (i = 0; i < 5; i++)
    {
        u16 species = GetBoxMonData(gPokemonStorage.boxes[gPokemonStorageSystemPtr->unk_117d] + a0, MON_DATA_SPECIES2);
        if (species != SPECIES_NONE)
        {
            gPokemonStorageSystemPtr->unk_1050[a0] = PSS_SpawnMonIconSprite(species, GetBoxMonData(gPokemonStorage.boxes[gPokemonStorageSystemPtr->unk_117d] + a0, MON_DATA_PERSONALITY), sp1c, y, 2, x1);
            if (gPokemonStorageSystemPtr->unk_1050[a0])
            {
                gPokemonStorageSystemPtr->unk_1050[a0]->data[1] = a1;
                gPokemonStorageSystemPtr->unk_1050[a0]->data[2] = a2;
                gPokemonStorageSystemPtr->unk_1050[a0]->data[3] = x;
                gPokemonStorageSystemPtr->unk_1050[a0]->callback = sub_8098E24;
                count++;
            }
        }
        a0 += 6;
        y += 24;
    }
    return count;
}

void sub_809900C(u8 a0, s8 a1)
{
    gPokemonStorageSystemPtr->unk_117c = 0;
    gPokemonStorageSystemPtr->unk_117d = a0;
    gPokemonStorageSystemPtr->unk_117b = a1;
    gPokemonStorageSystemPtr->unk_1172 = 32;
    gPokemonStorageSystemPtr->unk_1176 = -6 * a1;
    gPokemonStorageSystemPtr->unk_1178 = 0;
    if (a1 > 0)
        gPokemonStorageSystemPtr->unk_117a = 0;
    else
        gPokemonStorageSystemPtr->unk_117a = 5;
    gPokemonStorageSystemPtr->unk_1174 = 24 * gPokemonStorageSystemPtr->unk_117a + 0x64;
    sub_8098DE0(gPokemonStorageSystemPtr->unk_1176);
}

bool8 sub_80990AC(void)
{
    if (gPokemonStorageSystemPtr->unk_1172)
        gPokemonStorageSystemPtr->unk_1172--;
    switch (gPokemonStorageSystemPtr->unk_117c)
    {
        case 0:
            gPokemonStorageSystemPtr->unk_1174 += gPokemonStorageSystemPtr->unk_1176;
            if (gPokemonStorageSystemPtr->unk_1174 < 0x41 || gPokemonStorageSystemPtr->unk_1174 > 0xfb)
            {
                sub_8098EA0(gPokemonStorageSystemPtr->unk_117a);
                gPokemonStorageSystemPtr->unk_1174 += 24 * gPokemonStorageSystemPtr->unk_117b;
                gPokemonStorageSystemPtr->unk_117c++;
            }
            break;
        case 1:
            gPokemonStorageSystemPtr->unk_1174 += gPokemonStorageSystemPtr->unk_1176;
            gPokemonStorageSystemPtr->unk_1178 += sub_8098EE0(gPokemonStorageSystemPtr->unk_117a, gPokemonStorageSystemPtr->unk_1172, gPokemonStorageSystemPtr->unk_1176);
            if ((gPokemonStorageSystemPtr->unk_117b > 0 && gPokemonStorageSystemPtr->unk_117a == 5) || (gPokemonStorageSystemPtr->unk_117b < 0 && gPokemonStorageSystemPtr->unk_117a == 0))
            {
                gPokemonStorageSystemPtr->unk_117c++;
            }
            else
            {
                gPokemonStorageSystemPtr->unk_117a += gPokemonStorageSystemPtr->unk_117b;
                gPokemonStorageSystemPtr->unk_117c = 0;
            }
            break;
        case 2:
            if (gPokemonStorageSystemPtr->unk_1178 == 0)
            {
                gPokemonStorageSystemPtr->unk_1172++;
                return FALSE;
            }
            break;
        default:
            return FALSE;
    }
    return TRUE;
}

void sub_8099200(bool8 a0)
{
    u16 count;
    u16 i;
    u16 species = GetMonData(gPlayerParty + 0, MON_DATA_SPECIES2);
    u32 personality = GetMonData(gPlayerParty + 0, MON_DATA_PERSONALITY);
    gPokemonStorageSystemPtr->unk_1038[0] = PSS_SpawnMonIconSprite(species, personality, 0x68, 0x40, 1, 11);
    count = 1;
    for (i = 1; i < PARTY_SIZE; i++)
    {
        species = GetMonData(gPlayerParty + i, MON_DATA_SPECIES2);
        if (species != SPECIES_NONE)
        {
            personality = GetMonData(gPlayerParty + i, MON_DATA_PERSONALITY);
            gPokemonStorageSystemPtr->unk_1038[i] = PSS_SpawnMonIconSprite(species, personality, 0x98, (i - 1) * 24 + 0x10, 1, 11);
            count++;
        }
        else
        {
            gPokemonStorageSystemPtr->unk_1038[i] = NULL;
        }
    }
    if (!a0)
    {
        for (i = 0; i < count; i++)
        {
            // this routine assumes party_compaction has been called
            gPokemonStorageSystemPtr->unk_1038[i]->pos1.y -= 0xa0;
            gPokemonStorageSystemPtr->unk_1038[i]->invisible = TRUE;
        }
    }
}

void sub_8099310(void)
{
    u16 i;
    u16 count;

    gPokemonStorageSystemPtr->unk_1171 = 0;
    for (i = 0, count = 0; i < PARTY_SIZE; i++)
    {
        if (gPokemonStorageSystemPtr->unk_1038[i])
        {
            if (i != count)
            {
                sub_8099388(gPokemonStorageSystemPtr->unk_1038[i], count);
                gPokemonStorageSystemPtr->unk_1038[i] = NULL;
                gPokemonStorageSystemPtr->unk_1171++;
            }
            count++;
        }
    }
}

u8 sub_8099374(void)
{
    return gPokemonStorageSystemPtr->unk_1171;
}
