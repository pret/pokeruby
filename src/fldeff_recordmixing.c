#include "global.h"
#include "event_object_movement.h"
#include "fldeff_recordmixing.h"
#include "sprite.h"

extern const struct OamData gFieldOamData_32x8;

static const u8 sSpriteImage_83D26C0[] = INCBIN_U8("graphics/unknown_sprites/83D2860/0.4bpp");
static const u8 sSpriteImage_83D2740[] = INCBIN_U8("graphics/unknown_sprites/83D2860/1.4bpp");
static const u8 sSpriteImage_83D27C0[] = INCBIN_U8("graphics/unknown_sprites/83D2860/2.4bpp");
static const u16 sPalette_3D2840[] = INCBIN_U16("graphics/unknown/unknown_3D2840.gbapal");


static const struct SpriteFrameImage sSpriteImageTable_83FD950[] =
{
    { sSpriteImage_83D26C0, sizeof(sSpriteImage_83D26C0) },
    { sSpriteImage_83D2740, sizeof(sSpriteImage_83D2740) },
    { sSpriteImage_83D27C0, sizeof(sSpriteImage_83D27C0) },
};

static const struct SpritePalette sUnknown_083D2878 = { sPalette_3D2840, 0x1000 };

static const union AnimCmd sSpriteAnim_83D2880[] =
{
    ANIMCMD_FRAME(0, 30),
    ANIMCMD_FRAME(1, 30),
    ANIMCMD_FRAME(2, 30),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd *const sSpriteAnimTable_83D2890[] =
{
    sSpriteAnim_83D2880,
};

static const struct SpriteTemplate sSpriteTemplate_83D2894 =
{
    .tileTag = 0xFFFF,
    .paletteTag = 0x1000,
    .oam = &gFieldOamData_32x8,
    .anims = sSpriteAnimTable_83D2890,
    .images = sSpriteImageTable_83FD950,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy,
};

u8 CreateRecordMixingSprite(void)
{
    u8 spriteId;

    LoadSpritePalette(&sUnknown_083D2878);

    spriteId = CreateSprite(&sSpriteTemplate_83D2894, 0, 0, 82);

    if (spriteId == MAX_SPRITES)
    {
        return MAX_SPRITES;
    }
    else
    {
        struct Sprite *sprite = &gSprites[spriteId];
        sub_8060388(16, 13, &sprite->pos1.x, &sprite->pos1.y);
        sprite->coordOffsetEnabled = TRUE;
        sprite->pos1.x += 16;
        sprite->pos1.y += 2;
    }

    return spriteId;
}

void DestroyRecordMixingSprite(void)
{
    int i;

    for (i = 0; i < MAX_SPRITES; i++)
    {
        if (gSprites[i].template == &sSpriteTemplate_83D2894)
        {
            FreeSpritePalette(&gSprites[i]);
            DestroySprite(&gSprites[i]);
        }
    }
}
