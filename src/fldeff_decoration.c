#include "global.h"
#include "event_data.h"
#include "field_camera.h"
#include "field_effect.h"
#include "event_object_movement.h"
#include "field_player_avatar.h"
#include "fieldmap.h"
#include "script.h"
#include "sound.h"
#include "string_util.h"
#include "strings.h"
#include "task.h"
#include "text.h"
#include "constants/field_effects.h"
#include "constants/songs.h"

extern const u8 gSpriteImage_83D21EC[];
extern const u8 gSpriteImage_83D22EC[];
extern const u8 gSpriteImage_83D23EC[];
extern const u16 gTilesetPalettes_SecretBase[][16];

const struct OamData gOamData_83D266C =
{
    .y = 0,
    .affineMode = 0,
    .objMode = 0,
    .mosaic = 0,
    .bpp = 0,
    .shape = 2,
    .x = 0,
    .matrixNum = 0,
    .size = 2,
    .tileNum = 0,
    .priority = 2,
    .paletteNum = 0,
    .affineParam = 0,
};

const union AnimCmd gSpriteAnim_83D2674[] =
{
    ANIMCMD_FRAME(0, 6),
    ANIMCMD_FRAME(1, 6),
    ANIMCMD_FRAME(2, 6),
    ANIMCMD_END,
};

const union AnimCmd *const gSpriteAnimTable_83D2684[] =
{
    gSpriteAnim_83D2674,
};

const struct SpriteFrameImage gSpriteImageTable_83D2688[] =
{
    {gSpriteImage_83D21EC, 0x100},
    {gSpriteImage_83D22EC, 0x100},
    {gSpriteImage_83D23EC, 0x100},
};

void SpriteCB_SandPillar_0(struct Sprite *);
void SpriteCB_SandPillar_1(struct Sprite *);
void SpriteCB_SandPillar_2(struct Sprite *);
const struct SpriteTemplate gSpriteTemplate_83D26A0 =
{
    .tileTag = 0xFFFF,
    .paletteTag = 4110,
    .oam = &gOamData_83D266C,
    .anims = gSpriteAnimTable_83D2684,
    .images = gSpriteImageTable_83D2688,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCB_SandPillar_0,
};

// This uses one of the secret base palettes, so there is no "09.pal" file.
const struct SpritePalette gFieldEffectObjectPaletteInfo9 = {gTilesetPalettes_SecretBase[5], 0x100E};

extern const struct SpriteTemplate *const gFieldEffectObjectTemplatePointers[36];

static void sub_80C68EC(u8);
static void DoBalloonSoundEffect(s16);

void PopSecretBaseBalloon(s16 metatileId, s16 x, s16 y)
{
    u8 taskId = CreateTask(sub_80C68EC, 0);

    gTasks[taskId].data[0] = metatileId;
    gTasks[taskId].data[1] = x;
    gTasks[taskId].data[2] = y;
    gTasks[taskId].data[3] = 0;
    gTasks[taskId].data[4] = 1;
}

static void sub_80C68EC(u8 taskId)
{
    s16 *data = gTasks[taskId].data;

    if (data[3]  == 6)
        data[3] = 0;
    else
        data[3]++;

    if (data[3] == 0)
    {
        if (data[4] == 2)
            DoBalloonSoundEffect(data[0]);
        MapGridSetMetatileIdAt(data[1], data[2], data[0] + data[4]);
        CurrentMapDrawMetatileAt(data[1], data[2]);
        if (data[4] == 3)
            DestroyTask(taskId);
        else
            data[4]++;
    }
}

static void DoBalloonSoundEffect(s16 metatileId)
{
    switch (metatileId)
    {
    case 824:
        PlaySE(SE_FUUSEN1);
        break;
    case 828:
        PlaySE(SE_FUUSEN2);
        break;
    case 832:
        PlaySE(SE_FUUSEN3);
        break;
    case 552:
        PlaySE(SE_TOY_DANGO);
        break;
    }
}

bool8 FldEff_Nop47(void)
{
    return FALSE;
}

bool8 FldEff_Nop48(void)
{
    return FALSE;
}

static void sub_80C69C4(s16 x, s16 y)
{
    PlaySE(SE_TOY_KABE);
    MapGridSetMetatileIdAt(x, y, 630);
    MapGridSetMetatileIdAt(x, y - 1, 622);
    CurrentMapDrawMetatileAt(x, y);
    CurrentMapDrawMetatileAt(x, y - 1);
}

static void sub_80C6A14(u8 taskId)
{
    if (gTasks[taskId].data[0] == 7)
    {
        sub_80C69C4(gTasks[taskId].data[1], gTasks[taskId].data[2]);
        DestroyTask(taskId);
    }
    else
    {
        gTasks[taskId].data[0]++;
    }
}

void ShatterSecretBaseBreakableDoor(s16 x, s16 y)
{
    u8 dir = GetPlayerFacingDirection();
    if (dir == DIR_SOUTH)
    {
        sub_80C69C4(x, y);
    }
    else if (dir == DIR_NORTH)
    {
        u8 taskId = CreateTask(sub_80C6A14, 5);
        gTasks[taskId].data[0] = 0;
        gTasks[taskId].data[1] = x;
        gTasks[taskId].data[2] = y;
    }
}

static void Task_SecretBaseMusicNoteMatSound(u8 taskId)
{
    if (gTasks[taskId].data[1] == 7)
    {
        switch (gTasks[taskId].data[0]) // metatileId
        {
        case 632:
            PlaySE(SE_TOY_C);
            break;
        case 633:
            PlaySE(SE_TOY_D);
            break;
        case 634:
            PlaySE(SE_TOY_E);
            break;
        case 635:
            PlaySE(SE_TOY_F);
            break;
        case 636:
            PlaySE(SE_TOY_G);
            break;
        case 637:
            PlaySE(SE_TOY_A);
            break;
        case 638:
            PlaySE(SE_TOY_B);
            break;
        case 691:
            PlaySE(SE_TOY_C1);
            break;
        }

        DestroyTask(taskId);
    }
    else
    {
        gTasks[taskId].data[1]++;
    }
}

void PlaySecretBaseMusicNoteMatSound(s16 metatileId)
{
    u8 taskId = CreateTask(Task_SecretBaseMusicNoteMatSound, 5);
    gTasks[taskId].data[0] = metatileId;
    gTasks[taskId].data[1] = 0;
}

void SpriteCB_GlitterMatSparkle(struct Sprite *sprite)
{
    sprite->data[0]++;
    if (sprite->data[0] == 8)
        PlaySE(SE_W215);
    if (sprite->data[0] >= 32)
        DestroySprite(sprite);
}

void DoSecretBaseGlitterMatSparkle(void)
{
    s16 x = gEventObjects[gPlayerAvatar.eventObjectId].currentCoords.x;
    s16 y = gEventObjects[gPlayerAvatar.eventObjectId].currentCoords.y;
    u8 spriteId;

    sub_8060470(&x, &y, 8, 4);
    spriteId = CreateSpriteAtEnd(gFieldEffectObjectTemplatePointers[22], x, y, 0);
    if (spriteId != MAX_SPRITES)
    {
        gSprites[spriteId].coordOffsetEnabled = TRUE;
        gSprites[spriteId].oam.priority = 1;
        gSprites[spriteId].oam.paletteNum = 5;
        gSprites[spriteId].callback = SpriteCB_GlitterMatSparkle;
        gSprites[spriteId].data[0] = 0;
    }
}

bool8 FldEff_SandPillar(void)
{
    s16 x, y;

    ScriptContext2_Enable();
    GetXYCoordsOneStepInFrontOfPlayer(&x, &y);
    gFieldEffectArguments[5] = x;
    gFieldEffectArguments[6] = y;

    switch (GetPlayerFacingDirection())
    {
    case DIR_SOUTH:
        CreateSprite(
            &gSpriteTemplate_83D26A0,
            gSprites[gPlayerAvatar.spriteId].oam.x + 8,
            gSprites[gPlayerAvatar.spriteId].oam.y + 32,
            0);
        break;
    case DIR_NORTH:
        CreateSprite(
            &gSpriteTemplate_83D26A0,
            gSprites[gPlayerAvatar.spriteId].oam.x + 8,
            gSprites[gPlayerAvatar.spriteId].oam.y,
            148);
        break;
    case DIR_WEST:
        CreateSprite(
            &gSpriteTemplate_83D26A0,
            gSprites[gPlayerAvatar.spriteId].oam.x - 8,
            gSprites[gPlayerAvatar.spriteId].oam.y + 16,
            148);
        break;
    case DIR_EAST:
        CreateSprite(
            &gSpriteTemplate_83D26A0,
            gSprites[gPlayerAvatar.spriteId].oam.x + 24,
            gSprites[gPlayerAvatar.spriteId].oam.y + 16,
            148);
        break;
    }

    return FALSE;
}

void SpriteCB_SandPillar_0(struct Sprite *sprite)
{
    PlaySE(SE_W088);
    if (MapGridGetMetatileIdAt(gFieldEffectArguments[5], gFieldEffectArguments[6] - 1) == 646)
        MapGridSetMetatileIdAt(gFieldEffectArguments[5], gFieldEffectArguments[6] - 1, 3586);
    else
        MapGridSetMetatileIdAt(gFieldEffectArguments[5], gFieldEffectArguments[6] - 1, 644);
    MapGridSetMetatileIdAt(gFieldEffectArguments[5], gFieldEffectArguments[6], 522);
    CurrentMapDrawMetatileAt(gFieldEffectArguments[5], gFieldEffectArguments[6] - 1);
    CurrentMapDrawMetatileAt(gFieldEffectArguments[5], gFieldEffectArguments[6]);
    sprite->data[0] = 0;
    sprite->callback = SpriteCB_SandPillar_1;
}

void SpriteCB_SandPillar_1(struct Sprite *sprite)
{
    if (sprite->data[0] < 18)
    {
        sprite->data[0]++;
    }
    else
    {
        MapGridSetMetatileIdAt(gFieldEffectArguments[5], gFieldEffectArguments[6], 3724);
        CurrentMapDrawMetatileAt(gFieldEffectArguments[5], gFieldEffectArguments[6]);
        sprite->data[0] = 0;
        sprite->callback = SpriteCB_SandPillar_2;
    }
}

void SpriteCB_SandPillar_2(struct Sprite *sprite)
{
    FieldEffectStop(sprite, FLDEFF_SAND_PILLAR);
    EnableBothScriptContexts();
}

void GetShieldToyTVDecorationInfo(void)
{
    s16 x, y;
    s32 metatileId;

    GetXYCoordsOneStepInFrontOfPlayer(&x, &y);

    metatileId = MapGridGetMetatileIdAt(x, y);

    switch (metatileId)
    {
    case 822:
        ConvertIntToDecimalStringN(gStringVar1, 100, STR_CONV_MODE_LEFT_ALIGN, 3);
        StringCopy(gStringVar2, gSecretBaseText_GoldRank);
        gSpecialVar_Result = 0;
        break;
    case 734:
        ConvertIntToDecimalStringN(gStringVar1, 50, STR_CONV_MODE_LEFT_ALIGN, 2);
        StringCopy(gStringVar2, gSecretBaseText_SilverRank);
        gSpecialVar_Result = 0;
        break;
    case 756:
        gSpecialVar_Result = 1;
        break;
    case 757:
        gSpecialVar_Result = 2;
        break;
    case 758:
        gSpecialVar_Result = 3;
        break;
    }
}
