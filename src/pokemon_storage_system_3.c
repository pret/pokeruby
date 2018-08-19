
// Includes
#include "global.h"
#include "constants/species.h"
#include "sprite.h"
#include "trig.h"
#include "pokemon_icon.h"
#include "pokemon_storage_system.h"

// Static type declarations

// Static RAM declarations

// Static ROM declarations

static void sub_8098E68(struct Sprite *sprite);
static void sub_8099388(struct Sprite *sprite, u16 a1);
static void sub_80993F4(struct Sprite *sprite);
static void sub_80999C4(struct Sprite *sprite);
static struct Sprite *PSS_SpawnMonIconSprite(u16 species, u32 personality, s16 x, s16 y, u8 priority, u8 subpriority);
static void PSS_DestroyMonIconSprite(struct Sprite *sprite);

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

const union AffineAnimCmd gSpriteAffineAnim_83B6F34[] = {
    AFFINEANIMCMD_FRAME(-2, -2, 0, 120),
    AFFINEANIMCMD_END
};

const union AffineAnimCmd gSpriteAffineAnim_83B6F44[] = {
    AFFINEANIMCMD_FRAME(16, 16, 0,  0),
    AFFINEANIMCMD_FRAME(16, 16, 0, 15),
    AFFINEANIMCMD_END
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83B6F5C[] = {
    gSpriteAffineAnim_83B6F34,
    gSpriteAffineAnim_83B6F44
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

static void sub_8098DE0(s16 a0)
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

static void sub_8098E24(struct Sprite *sprite)
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

static void sub_8098E68(struct Sprite *sprite)
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

static void sub_8098EA0(u8 col)
{
    u16 i;

    for (i = 0; i < 5; i++)
    {
        if (gPokemonStorageSystemPtr->unk_1050[col])
        {
            PSS_DestroyMonIconSprite(gPokemonStorageSystemPtr->unk_1050[col]);
            gPokemonStorageSystemPtr->unk_1050[col] = NULL;
        }
        col += 6;
    }
}

static u8 sub_8098EE0(u8 col, u16 a1, s16 a2)
{
    u16 i;
    u16 x;
    u16 y;
    u8 count;
    u8 x1;
    u16 curX;

    y = 0x2c;
    x = 24 * col + 0x64;
    curX = x - (a1 + 1) * a2;
    x1 = 18 - col;
    count = 0;

    for (i = 0; i < 5; i++)
    {
        u16 species = GetBoxMonData(gPokemonStorage.boxes[gPokemonStorageSystemPtr->unk_117d] + col, MON_DATA_SPECIES2);
        if (species != SPECIES_NONE)
        {
            gPokemonStorageSystemPtr->unk_1050[col] = PSS_SpawnMonIconSprite(species, GetBoxMonData(gPokemonStorage.boxes[gPokemonStorageSystemPtr->unk_117d] + col, MON_DATA_PERSONALITY), curX, y, 2, x1);
            if (gPokemonStorageSystemPtr->unk_1050[col])
            {
                gPokemonStorageSystemPtr->unk_1050[col]->data[1] = a1;
                gPokemonStorageSystemPtr->unk_1050[col]->data[2] = a2;
                gPokemonStorageSystemPtr->unk_1050[col]->data[3] = x;
                gPokemonStorageSystemPtr->unk_1050[col]->callback = sub_8098E24;
                count++;
            }
        }
        col += 6;
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

static void sub_8099388(struct Sprite *sprite, u16 a1)
{
    s16 r3;
    s16 r4;

    sprite->data[1] = a1;
    if (a1 == 0)
    {
        r3 = 0x68;
        r4 = 0x40;
    }
    else
    {
        r3 = 0x98;
        r4 = 24 * (a1 - 1) + 0x10;
    }
    sprite->data[2] = sprite->pos1.x << 3;
    sprite->data[3] = sprite->pos1.y << 3;
    sprite->data[4] = (r3 * 8 - sprite->data[2]) / 8;
    sprite->data[5] = (r4 * 8 - sprite->data[3]) / 8;
    sprite->data[6] = 8;
    sprite->callback = sub_80993F4;
}

static void sub_80993F4(struct Sprite *sprite)
{
    if (sprite->data[6])
    {
        sprite->data[2] += sprite->data[4];
        sprite->data[3] += sprite->data[5];
        sprite->pos1.x = sprite->data[2] >> 3;
        sprite->pos1.y = sprite->data[3] >> 3;
        sprite->data[6]--;
    }
    else
    {
        if (sprite->data[1] == 0)
        {
            sprite->pos1.x = 0x68;
            sprite->pos1.y = 0x40;
        }
        else
        {
            sprite->pos1.x = 0x98;
            sprite->pos1.y = (sprite->data[1] - 1) * 24 + 0x10;
        }
        sprite->callback = SpriteCallbackDummy;
        gPokemonStorageSystemPtr->unk_1038[sprite->data[1]] = sprite;
        gPokemonStorageSystemPtr->unk_1171--;
    }
}

void sub_8099480(void)
{
    if (gPokemonStorageSystemPtr->unk_1034)
    {
        PSS_DestroyMonIconSprite(gPokemonStorageSystemPtr->unk_1034);
        gPokemonStorageSystemPtr->unk_1034 = NULL;
    }
}

void sub_80994A8(s16 y)
{
    u16 i;

    for (i = 0; i < PARTY_SIZE; i++)
    {
        if (gPokemonStorageSystemPtr->unk_1038[i])
        {
            s16 yy;
            gPokemonStorageSystemPtr->unk_1038[i]->pos1.y += y;
            yy = gPokemonStorageSystemPtr->unk_1038[i]->pos1.y + gPokemonStorageSystemPtr->unk_1038[i]->pos2.y + gPokemonStorageSystemPtr->unk_1038[i]->centerToCornerVecY;
            if (yy < -0x10 || yy > 0xb0)
                gPokemonStorageSystemPtr->unk_1038[i]->invisible = TRUE;
            else
                gPokemonStorageSystemPtr->unk_1038[i]->invisible = FALSE;
        }
    }
}

void sub_8099520(u8 a0)
{
    if (gPokemonStorageSystemPtr->unk_1038[a0])
    {
        PSS_DestroyMonIconSprite(gPokemonStorageSystemPtr->unk_1038[a0]);
        gPokemonStorageSystemPtr->unk_1038[a0] = NULL;
    }
}

void sub_809954C(void)
{
    u16 i;

    for (i = 0; i < PARTY_SIZE; i++)
    {
        if (gPokemonStorageSystemPtr->unk_1038[i])
        {
            PSS_DestroyMonIconSprite(gPokemonStorageSystemPtr->unk_1038[i]);
            gPokemonStorageSystemPtr->unk_1038[i] = NULL;
        }
    }
}

void sub_8099584(u8 a0, u8 a1)
{
    if (a0 == 0)
    {
        gPokemonStorageSystemPtr->unk_1034 = gPokemonStorageSystemPtr->unk_1038[a1];
        gPokemonStorageSystemPtr->unk_1038[a1] = NULL;
    }
    else if (a0 == 1)
    {
        gPokemonStorageSystemPtr->unk_1034 = gPokemonStorageSystemPtr->unk_1050[a1];
        gPokemonStorageSystemPtr->unk_1050[a1] = NULL;
    }
    else
    {
        return;
    }
    gPokemonStorageSystemPtr->unk_1034->callback = sub_80999C4;
    gPokemonStorageSystemPtr->unk_1034->oam.priority = 1;
    gPokemonStorageSystemPtr->unk_1034->subpriority = 7;
}

void sub_809960C(u8 a0, u8 a1)
{
    if (a0 == 14)
    {
        gPokemonStorageSystemPtr->unk_1038[a1] = gPokemonStorageSystemPtr->unk_1034;
        gPokemonStorageSystemPtr->unk_1038[a1]->oam.priority = 1;
        gPokemonStorageSystemPtr->unk_1038[a1]->subpriority = 11;
    }
    else
    {
        gPokemonStorageSystemPtr->unk_1050[a1] = gPokemonStorageSystemPtr->unk_1034;
        gPokemonStorageSystemPtr->unk_1050[a1]->oam.priority = 2;
        gPokemonStorageSystemPtr->unk_1050[a1]->subpriority = 18 - (a1 % 6);
    }
    gPokemonStorageSystemPtr->unk_1034->callback = SpriteCallbackDummy;
    gPokemonStorageSystemPtr->unk_1034 = NULL;
}

void sub_80996B0(u8 a0, u8 a1)
{
    if (a0 == 14)
        gPokemonStorageSystemPtr->unk_10c8 = gPokemonStorageSystemPtr->unk_1038 + a1;
    else
        gPokemonStorageSystemPtr->unk_10c8 = gPokemonStorageSystemPtr->unk_1050 + a1;
    gPokemonStorageSystemPtr->unk_1034->callback = SpriteCallbackDummy;
    gPokemonStorageSystemPtr->unk_1170 = 0;
}

bool8 sub_809971C(void)
{
    if (gPokemonStorageSystemPtr->unk_1170 == 16)
        return FALSE;
    gPokemonStorageSystemPtr->unk_1170++;
    if (gPokemonStorageSystemPtr->unk_1170 & 1)
    {
        (*gPokemonStorageSystemPtr->unk_10c8)->pos1.y--;
        gPokemonStorageSystemPtr->unk_1034->pos1.y++;
    }
    (*gPokemonStorageSystemPtr->unk_10c8)->pos2.x = gSineTable[gPokemonStorageSystemPtr->unk_1170 * 8] / 16;
    gPokemonStorageSystemPtr->unk_1034->pos2.x = -(gSineTable[gPokemonStorageSystemPtr->unk_1170 * 8] / 16);
    if (gPokemonStorageSystemPtr->unk_1170 == 8)
    {
        gPokemonStorageSystemPtr->unk_1034->oam.priority = (*gPokemonStorageSystemPtr->unk_10c8)->oam.priority;
        gPokemonStorageSystemPtr->unk_1034->subpriority = (*gPokemonStorageSystemPtr->unk_10c8)->subpriority;
        (*gPokemonStorageSystemPtr->unk_10c8)->oam.priority = 1;
        (*gPokemonStorageSystemPtr->unk_10c8)->subpriority = 7;
    }
    if (gPokemonStorageSystemPtr->unk_1170 == 16)
    {
        struct Sprite *sprite = gPokemonStorageSystemPtr->unk_1034;
        gPokemonStorageSystemPtr->unk_1034 = *(gPokemonStorageSystemPtr->unk_10c8);
        (*gPokemonStorageSystemPtr->unk_10c8) = sprite;
        gPokemonStorageSystemPtr->unk_1034->callback = sub_80999C4;
        (*gPokemonStorageSystemPtr->unk_10c8)->callback = SpriteCallbackDummy;
    }
    return TRUE;
}

void sub_809981C(u8 mode, u8 idx)
{
    switch (mode)
    {
        case 0:
            gPokemonStorageSystemPtr->unk_10cc = gPokemonStorageSystemPtr->unk_1038 + idx;
            break;
        case 1:
            gPokemonStorageSystemPtr->unk_10cc = gPokemonStorageSystemPtr->unk_1050 + idx;
            break;
        case 2:
            gPokemonStorageSystemPtr->unk_10cc = &gPokemonStorageSystemPtr->unk_1034;
            break;
        default:
            return;
    }
    if (*gPokemonStorageSystemPtr->unk_10cc)
    {
        InitSpriteAffineAnim(*gPokemonStorageSystemPtr->unk_10cc);
        (*gPokemonStorageSystemPtr->unk_10cc)->oam.affineMode = ST_OAM_AFFINE_NORMAL;
        (*gPokemonStorageSystemPtr->unk_10cc)->affineAnims = gSpriteAffineAnimTable_83B6F5C;
        StartSpriteAffineAnim(*gPokemonStorageSystemPtr->unk_10cc, 0);
    }
}

bool8 sub_80998D8(void)
{
    if (*gPokemonStorageSystemPtr->unk_10cc == NULL || (*gPokemonStorageSystemPtr->unk_10cc)->invisible)
        return FALSE;
    if ((*gPokemonStorageSystemPtr->unk_10cc)->affineAnimEnded)
    {
        (*gPokemonStorageSystemPtr->unk_10cc)->invisible = TRUE;
    }
    return TRUE;
}

void sub_8099920(void)
{
    if (*gPokemonStorageSystemPtr->unk_10cc)
    {
        FreeOamMatrix((*gPokemonStorageSystemPtr->unk_10cc)->oam.matrixNum);
        PSS_DestroyMonIconSprite(*gPokemonStorageSystemPtr->unk_10cc);
        *gPokemonStorageSystemPtr->unk_10cc = NULL;
    }
}

void sub_8099958(void)
{
    if (*gPokemonStorageSystemPtr->unk_10cc)
    {
        (*gPokemonStorageSystemPtr->unk_10cc)->invisible = FALSE;
        StartSpriteAffineAnim(*gPokemonStorageSystemPtr->unk_10cc, 1);
    }
}

bool8 sub_8099990(void)
{
    if (gPokemonStorageSystemPtr->unk_10cc == NULL)
        return FALSE;
    if ((*gPokemonStorageSystemPtr->unk_10cc)->affineAnimEnded)
        gPokemonStorageSystemPtr->unk_10cc = NULL;
    return TRUE;
}

static void sub_80999C4(struct Sprite *sprite)
{
    sprite->pos1.x = gPokemonStorageSystemPtr->unk_11c0->pos1.x;
    sprite->pos1.y = gPokemonStorageSystemPtr->unk_11c0->pos1.y + gPokemonStorageSystemPtr->unk_11c0->pos2.y + 4;
}

static u16 PSS_LoadSpeciesIconGfx(u16 a0)
{
    u16 i;
    u16 retval;

    for (i = 0; i < 40; i++)
    {
        if (gPokemonStorageSystemPtr->unk_1120[i] == a0)
            break;
    }
    if (i == 40)
    {
        for (i = 0; i < 40; i++)
        {
            if (gPokemonStorageSystemPtr->unk_1120[i] == 0)
                break;
        }
    }
    if (i != 40)
    {
        gPokemonStorageSystemPtr->unk_1120[i] = a0;
        gPokemonStorageSystemPtr->unk_10d0[i]++;
        retval = i * 16;
        CpuCopy32(gMonIconTable[a0], BG_CHAR_ADDR(4) + 32 * retval, 0x200);
        return retval;
    }
    return 0xFFFF;
}

static void PSS_ForgetSpeciesIcon(u16 a0)
{
    u16 i;

    for (i = 0; i < 40; i++)
    {
        if (gPokemonStorageSystemPtr->unk_1120[i] == a0)
        {
            if (--gPokemonStorageSystemPtr->unk_10d0[i] == 0)
                gPokemonStorageSystemPtr->unk_1120[i] = 0;
            break;
        }
    }
}

static struct Sprite *PSS_SpawnMonIconSprite(u16 species, u32 personality, s16 x, s16 y, u8 priority, u8 subpriority)
{
    struct SpriteTemplate template = gSpriteTemplate_83B6F14;
    u16 tileNum;
    u8 spriteId;

    species = mon_icon_convert_unown_species_id(species, personality);
    template.paletteTag = 0xdac0 + gMonIconPaletteIndices[species];
    tileNum = PSS_LoadSpeciesIconGfx(species);
    if (tileNum == 0xFFFF)
        return NULL;
    spriteId = CreateSprite(&template, x, y, subpriority);
    if (spriteId == MAX_SPRITES)
    {
        PSS_ForgetSpeciesIcon(species);
        return NULL;
    }
    gSprites[spriteId].oam.tileNum = tileNum;
    gSprites[spriteId].oam.priority = priority;
    gSprites[spriteId].data[0] = species;
    return gSprites + spriteId;
}

static void PSS_DestroyMonIconSprite(struct Sprite *sprite)
{
    PSS_ForgetSpeciesIcon(sprite->data[0]);
    DestroySprite(sprite);
}
