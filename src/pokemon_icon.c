#include "global.h"
#include "mail_data.h"
#include "species.h"
#include "sprite.h"

#define POKE_ICON_BASE_PAL_TAG 56000

struct MonIconSpriteTemplate
{
    const struct OamData *oam;
    const u8 *image;
    const union AnimCmd *const *anims;
    const union AffineAnimCmd *const *affineAnims;
    void (*callback)(struct Sprite *);
    u16 paletteTag;
};

extern u8 *gMonIconTable[];
extern u8 gMonIconPaletteIndices[];
extern const struct SpritePalette gMonIconPaletteTable[];
extern struct OamData gOamData_83BC5E8;
extern const union AnimCmd *const gSpriteAnimTable_83BC62C[];
extern const union AffineAnimCmd *const gSpriteAffineAnimTable_83BC660[];
extern u16 gSpriteImageSizes[3][4];

u16 GetUnownLetterByPersonality(u32);
u8 *GetMonIconPtr(u16, u32 personality);
u8 UpdateMonIconFrame(struct Sprite *);
u8 CreateMonIconSprite(struct MonIconSpriteTemplate *, s16, s16, u8);
void sub_809D7E8(struct Sprite *);

// duplicate of sub_809D3A4
u8 unref_sub_809D26C(u16 species, void (*callback)(struct Sprite *), s16 x, s16 y, u8 subpriority)
{
    u8 spriteId;
    struct MonIconSpriteTemplate iconTemplate;
    struct MonIconSpriteTemplate *iconTemplatePtr = &iconTemplate; // needed to match

    iconTemplatePtr->oam = &gOamData_83BC5E8;
    iconTemplatePtr->image = gMonIconTable[species];
    iconTemplatePtr->anims = gSpriteAnimTable_83BC62C;
    iconTemplatePtr->affineAnims = gSpriteAffineAnimTable_83BC660;
    iconTemplatePtr->callback = callback;
    iconTemplatePtr->paletteTag = POKE_ICON_BASE_PAL_TAG + gMonIconPaletteIndices[species];

    spriteId = CreateMonIconSprite(iconTemplatePtr, x, y, subpriority);

    UpdateMonIconFrame(&gSprites[spriteId]);

    return spriteId;
}

u8 CreateMonIcon(u16 species, void (*callback)(struct Sprite *), s16 x, s16 y, u8 subpriority, u32 personality)
{
    u8 spriteId;
    struct MonIconSpriteTemplate iconTemplate =
    {
        .oam = &gOamData_83BC5E8,
        .image = GetMonIconPtr(species, personality),
        .anims = gSpriteAnimTable_83BC62C,
        .affineAnims = gSpriteAffineAnimTable_83BC660,
        .callback = callback,
        .paletteTag = POKE_ICON_BASE_PAL_TAG + gMonIconPaletteIndices[species],
    };

    if (species > SPECIES_EGG)
        iconTemplate.paletteTag = POKE_ICON_BASE_PAL_TAG;

    spriteId = CreateMonIconSprite(&iconTemplate, x, y, subpriority);

    UpdateMonIconFrame(&gSprites[spriteId]);

    return spriteId;
}

u8 sub_809D3A4(u16 species, void (*callback)(struct Sprite *), s16 x, s16 y, u8 subpriority)
{
    u8 spriteId;
    struct MonIconSpriteTemplate iconTemplate;
    struct MonIconSpriteTemplate *iconTemplatePtr = &iconTemplate; // needed to match

    iconTemplatePtr->oam = &gOamData_83BC5E8;
    iconTemplatePtr->image = gMonIconTable[species];
    iconTemplatePtr->anims = gSpriteAnimTable_83BC62C;
    iconTemplatePtr->affineAnims = gSpriteAffineAnimTable_83BC660;
    iconTemplatePtr->callback = callback;
    iconTemplatePtr->paletteTag = POKE_ICON_BASE_PAL_TAG + gMonIconPaletteIndices[species];

    spriteId = CreateMonIconSprite(iconTemplatePtr, x, y, subpriority);

    UpdateMonIconFrame(&gSprites[spriteId]);

    return spriteId;
}

u16 mon_icon_convert_unown_species_id(u16 species, u32 personality)
{
    u16 result;

    if (species == SPECIES_UNOWN)
    {
        u16 letter = GetUnownLetterByPersonality(personality);
        if (letter == 0)
            letter = SPECIES_UNOWN;
        else
            letter += (SPECIES_UNOWN_B - 1);
        result = letter;
    }
    else
    {
        if (species > SPECIES_EGG)
            result = 260;
        else
            result = species;
    }

    return result;
}

u16 GetUnownLetterByPersonality(u32 personality)
{
    return (((personality & 0x3000000) >> 18) | ((personality & 0x30000) >> 12) | ((personality & 0x300) >> 6) | (personality & 0x3)) % 0x1C;
}

u16 sub_809D4A8(u16 species)
{
    u16 value;

    if (MailSpeciesToSpecies(species, &value) == SPECIES_UNOWN)
    {
        if (value == 0)
            value += SPECIES_UNOWN;
        else
            value += (SPECIES_UNOWN_B - 1);
        return value;
    }
    else
    {
        return mon_icon_convert_unown_species_id(species, 0);
    }
}

u8 *GetMonIconPtr(u16 species, u32 personality)
{
    u16 convertedSpecies = mon_icon_convert_unown_species_id(species, personality);
    return gMonIconTable[convertedSpecies];
}

void sub_809D510(struct Sprite *sprite)
{
    sub_809D7E8(sprite);
}

void sub_809D51C(void)
{
    u8 i;
    for (i = 0; i < 6; i++)
        LoadSpritePalette(&gMonIconPaletteTable[i]);
}

// unused
void SafeLoadMonIconPalette(u16 species)
{
    u8 palIndex;
    if (species > SPECIES_EGG)
        species = 260;
    palIndex = gMonIconPaletteIndices[species];
    if (IndexOfSpritePaletteTag(gMonIconPaletteTable[palIndex].tag) == 0xFF)
        LoadSpritePalette(&gMonIconPaletteTable[palIndex]);
}

void sub_809D580(u16 species)
{
    u8 palIndex = gMonIconPaletteIndices[species];
    if (IndexOfSpritePaletteTag(gMonIconPaletteTable[palIndex].tag) == 0xFF)
        LoadSpritePalette(&gMonIconPaletteTable[palIndex]);
}

// unused
void FreeMonIconPalettes(void)
{
    u8 i;
    for (i = 0; i < 6; i++)
        FreeSpritePaletteByTag(gMonIconPaletteTable[i].tag);
}

// unused
void SafeFreeMonIconPalette(u16 species)
{
    u8 palIndex;
    if (species > SPECIES_EGG)
        species = 260;
    palIndex = gMonIconPaletteIndices[species];
    FreeSpritePaletteByTag(gMonIconPaletteTable[palIndex].tag);
}

void sub_809D608(u16 species)
{
    u8 palIndex;
    palIndex = gMonIconPaletteIndices[species];
    FreeSpritePaletteByTag(gMonIconPaletteTable[palIndex].tag);
}

void sub_809D62C(struct Sprite *sprite)
{
    UpdateMonIconFrame(sprite);
}

// TODO: try to find a way to avoid using goto and asm statement
u8 UpdateMonIconFrame(struct Sprite *sprite)
{
    u8 result = 0;

    if (sprite->animDelayCounter == 0)
    {
        s16 frame = sprite->anims[sprite->animNum][sprite->animCmdIndex].frame.imageValue;

        if (frame != -2)
        {
            if (frame != -1)
                goto copy;
            goto end;
        }

        sprite->animCmdIndex = 0;
        goto end;

    copy:
        RequestSpriteCopy(
            (u8 *)sprite->images + gSpriteImageSizes[sprite->oam.shape][sprite->oam.size] * frame,
            (u8 *)OBJ_VRAM0 + sprite->oam.tileNum * TILE_SIZE_4BPP,
            gSpriteImageSizes[sprite->oam.shape][sprite->oam.size]);
        {
            register u8 duration asm("r0") = sprite->anims[sprite->animNum][sprite->animCmdIndex].frame.duration;
            sprite->animDelayCounter = duration;
        }
        sprite->animCmdIndex++;
        result = sprite->animCmdIndex;
    }
    else
    {
        sprite->animDelayCounter--;
    }

end:
    return result;
}

u8 CreateMonIconSprite(struct MonIconSpriteTemplate *iconTemplate, s16 x, s16 y, u8 subpriority)
{
    u8 spriteId;

    struct SpriteFrameImage image = { 0, gSpriteImageSizes[iconTemplate->oam->shape][iconTemplate->oam->size] };

    struct SpriteTemplate spriteTemplate =
    {
        .tileTag = 0xFFFF,
        .paletteTag = iconTemplate->paletteTag,
        .oam = iconTemplate->oam,
        .anims = iconTemplate->anims,
        .images = &image,
        .affineAnims = iconTemplate->affineAnims,
        .callback = iconTemplate->callback,
    };

    spriteId = CreateSprite(&spriteTemplate, x, y, subpriority);
    gSprites[spriteId].animPaused = TRUE;
    gSprites[spriteId].animBeginning = FALSE;
    gSprites[spriteId].images = (const struct SpriteFrameImage *)iconTemplate->image;
    return spriteId;
}

void sub_809D7E8(struct Sprite *sprite)
{
    struct SpriteFrameImage image = { 0, gSpriteImageSizes[sprite->oam.shape][sprite->oam.size] };
    sprite->images = &image;
    DestroySprite(sprite);
}

void sub_809D824(struct Sprite *sprite, u8 animNum)
{
    sprite->animNum = animNum;
    sprite->animDelayCounter = 0;
    sprite->animCmdIndex = 0;
}
