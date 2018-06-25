
#include "global.h"
#include "event_data.h"
#include "fieldmap.h"
#include "field_effect.h"
#include "field_player_avatar.h"
#include "metatile_behavior.h"
#include "overworld.h"
#include "pokemon_menu.h"
#include "rom6.h"
#include "script.h"
#include "secret_base.h"
#include "sound.h"
#include "constants/field_effects.h"
#include "constants/metatile_behaviors.h"
#include "constants/songs.h"

extern u8 DoSecretBaseCaveFieldEffectScript[];
extern u8 DoSecretBaseTreeFieldEffectScript[];
extern u8 DoSecretBaseShrubFieldEffectScript[];

const u8 gSpriteImage_83D198C[] = INCBIN_U8("graphics/unknown_sprites/83D259C/0.4bpp");
const u8 gSpriteImage_83D1A0C[] = INCBIN_U8("graphics/unknown_sprites/83D259C/1.4bpp");
const u8 gSpriteImage_83D1A8C[] = INCBIN_U8("graphics/unknown_sprites/83D259C/2.4bpp");
const u8 gSpriteImage_83D1B0C[] = INCBIN_U8("graphics/unknown_sprites/83D259C/3.4bpp");
const u8 gSpriteImage_83D1B8C[] = INCBIN_U8("graphics/unknown_sprites/83D259C/4.4bpp");
const u8 gUnusedEmptySpace_83D1C0C[32] = {0};
const u16 gFieldEffectObjectPalette7[] = INCBIN_U16("graphics/field_effect_objects/palettes/07.gbapal");
const u8 gSpriteImage_83D1C4C[] = INCBIN_U8("graphics/unknown_sprites/83D25EC/0.4bpp");
const u8 gSpriteImage_83D1CCC[] = INCBIN_U8("graphics/unknown_sprites/83D25EC/1.4bpp");
const u8 gSpriteImage_83D1D4C[] = INCBIN_U8("graphics/unknown_sprites/83D25EC/2.4bpp");
const u8 gSpriteImage_83D1DCC[] = INCBIN_U8("graphics/unknown_sprites/83D25EC/3.4bpp");
const u8 gSpriteImage_83D1E4C[] = INCBIN_U8("graphics/unknown_sprites/83D25EC/4.4bpp");
const u8 gSpriteImage_83D1ECC[] = INCBIN_U8("graphics/unknown_sprites/83D25C4/0.4bpp");
const u8 gSpriteImage_83D1F4C[] = INCBIN_U8("graphics/unknown_sprites/83D25C4/1.4bpp");
const u8 gSpriteImage_83D1FCC[] = INCBIN_U8("graphics/unknown_sprites/83D25C4/2.4bpp");
const u8 gSpriteImage_83D204C[] = INCBIN_U8("graphics/unknown_sprites/83D25C4/3.4bpp");
const u8 gSpriteImage_83D20CC[] = INCBIN_U8("graphics/unknown_sprites/83D25C4/4.4bpp");
const u8 gSpriteImage_83D214C[] = INCBIN_U8("graphics/unknown_sprites/83D25C4/5.4bpp");  // unused
const u16 gFieldEffectObjectPalette8[] = INCBIN_U16("graphics/field_effect_objects/palettes/08.gbapal");
const u8 gSpriteImage_83D21EC[] = INCBIN_U8("graphics/unknown_sprites/83D2688/0.4bpp");
const u8 gSpriteImage_83D22EC[] = INCBIN_U8("graphics/unknown_sprites/83D2688/1.4bpp");
const u8 gSpriteImage_83D23EC[] = INCBIN_U8("graphics/unknown_sprites/83D2688/2.4bpp");

const struct OamData gOamData_83D24EC =
{
    .y = 0,
    .affineMode = 0,
    .objMode = 0,
    .mosaic = 0,
    .bpp = 0,
    .shape = 0,
    .x = 0,
    .matrixNum = 0,
    .size = 1,
    .tileNum = 0,
    .priority = 2,
    .paletteNum = 0,
    .affineParam = 0,
};

const union AnimCmd gSpriteAnim_83D24F4[] =
{
    ANIMCMD_FRAME(0, 8),
    ANIMCMD_FRAME(1, 8),
    ANIMCMD_FRAME(2, 8),
    ANIMCMD_FRAME(3, 8),
    ANIMCMD_FRAME(4, 8),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83D250C[] =
{
    ANIMCMD_FRAME(0, 8),
    ANIMCMD_FRAME(1, 8),
    ANIMCMD_FRAME(2, 8),
    ANIMCMD_FRAME(3, 8),
    ANIMCMD_FRAME(4, 8),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83D2524[] =
{
    ANIMCMD_FRAME(4, 8),
    ANIMCMD_FRAME(3, 8),
    ANIMCMD_FRAME(2, 8),
    ANIMCMD_FRAME(1, 8),
    ANIMCMD_FRAME(0, 8),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83D253C[] =
{
    ANIMCMD_FRAME(0, 8, .hFlip = TRUE),
    ANIMCMD_FRAME(1, 8, .hFlip = TRUE),
    ANIMCMD_FRAME(2, 8, .hFlip = TRUE),
    ANIMCMD_FRAME(3, 8, .hFlip = TRUE),
    ANIMCMD_FRAME(4, 8, .hFlip = TRUE),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83D2554[] =
{
    ANIMCMD_FRAME(4, 8, .hFlip = TRUE),
    ANIMCMD_FRAME(3, 8, .hFlip = TRUE),
    ANIMCMD_FRAME(2, 8, .hFlip = TRUE),
    ANIMCMD_FRAME(1, 8, .hFlip = TRUE),
    ANIMCMD_FRAME(0, 8, .hFlip = TRUE),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83D256C[] =
{
    ANIMCMD_FRAME(0, 8),
    ANIMCMD_FRAME(1, 8),
    ANIMCMD_FRAME(2, 8),
    ANIMCMD_FRAME(3, 8),
    ANIMCMD_FRAME(4, 8),
    ANIMCMD_END,
};

const union AnimCmd *const gSpriteAnimTable_83D2584[] =
{
    gSpriteAnim_83D24F4,
};

const union AnimCmd *const gSpriteAnimTable_83D2588[] =
{
    gSpriteAnim_83D250C,
    gSpriteAnim_83D2524,
    gSpriteAnim_83D253C,
    gSpriteAnim_83D2554,
};

const union AnimCmd *const gSpriteAnimTable_83D2598[] =
{
    gSpriteAnim_83D256C,
};

const struct SpriteFrameImage gSpriteImageTable_83D259C[] = 
{
    {gSpriteImage_83D198C, 0x80},
    {gSpriteImage_83D1A0C, 0x80},
    {gSpriteImage_83D1A8C, 0x80},
    {gSpriteImage_83D1B0C, 0x80},
    {gSpriteImage_83D1B8C, 0x80},
};

const struct SpriteFrameImage gSpriteImageTable_83D25C4[] = 
{
    {gSpriteImage_83D1ECC, 0x80},
    {gSpriteImage_83D1F4C, 0x80},
    {gSpriteImage_83D1FCC, 0x80},
    {gSpriteImage_83D204C, 0x80},
    {gSpriteImage_83D20CC, 0x80},
};

const struct SpriteFrameImage gSpriteImageTable_83D25EC[] = 
{
    {gSpriteImage_83D1C4C, 0x80},
    {gSpriteImage_83D1CCC, 0x80},
    {gSpriteImage_83D1D4C, 0x80},
    {gSpriteImage_83D1DCC, 0x80},
    {gSpriteImage_83D1E4C, 0x80},
};

static void CaveEntranceSpriteCallback1(struct Sprite *);
static const struct SpriteTemplate sSpriteTemplate_CaveEntrance =
{
    .tileTag = 0xFFFF,
    .paletteTag = 4099,
    .oam = &gOamData_83D24EC,
    .anims = gSpriteAnimTable_83D2584,
    .images = gSpriteImageTable_83D259C,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = CaveEntranceSpriteCallback1,
};

static void TreeEntranceSpriteCallback1(struct Sprite *);
const struct SpriteTemplate sSpriteTemplate_TreeEntrance =
{
    .tileTag = 0xFFFF,
    .paletteTag = 4104,
    .oam = &gOamData_83D24EC,
    .anims = gSpriteAnimTable_83D2588,
    .images = gSpriteImageTable_83D25C4,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = TreeEntranceSpriteCallback1,
};

static void ShrubEntranceSpriteCallback1(struct Sprite *);
const struct SpriteTemplate sSpriteTemplate_ShrubEntrance =
{
    .tileTag = 0xFFFF,
    .paletteTag = 4104,
    .oam = &gOamData_83D24EC,
    .anims = gSpriteAnimTable_83D2598,
    .images = gSpriteImageTable_83D25EC,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = ShrubEntranceSpriteCallback1,
};

const struct SpritePalette gFieldEffectObjectPaletteInfo7 = {gFieldEffectObjectPalette7, 0x1003};
const struct SpritePalette gFieldEffectObjectPaletteInfo8 = {gFieldEffectObjectPalette8, 0x1008};

static void FieldCallback_SecretBaseCave(void);
static void StartSecretBaseCaveFieldEffect(void);
static void CaveEntranceSpriteCallback2(struct Sprite *);
static void CaveEntranceSpriteCallbackEnd(struct Sprite *);
static void FieldCallback_SecretBaseTree(void);
static void StartSecretBaseTreeFieldEffect(void);
static void TreeEntranceSpriteCallback2(struct Sprite *);
static void TreeEntranceSpriteCallbackEnd(struct Sprite *);
static void FieldCallback_SecretBaseShrub(void);
static void StartSecretBaseShrubFieldEffect(void);
static void ShrubEntranceSpriteCallback2(struct Sprite *sprite);
static void ShrubEntranceSpriteCallbackEnd(struct Sprite *sprite);

static void SetCurrentSecretBase(void)
{
    SetCurrentSecretBaseFromPosition(&gPlayerFacingPosition, gMapHeader.events);
    SetCurrentSecretBaseVar();
}

static void AdjustSecretPowerSpritePixelOffsets(void)
{
    switch (gFieldEffectArguments[1])
    {
    case DIR_SOUTH:
        gFieldEffectArguments[5] = 8;
        gFieldEffectArguments[6] = 40;
        break;
    case DIR_NORTH:
        gFieldEffectArguments[5] = 8;
        gFieldEffectArguments[6] = 8;
        break;
    case DIR_WEST:
        gFieldEffectArguments[5] = -8;
        gFieldEffectArguments[6] = 24;
        break;
    case DIR_EAST:
        gFieldEffectArguments[5] = 24;
        gFieldEffectArguments[6] = 24;
        break;
    }
}

#if DEBUG

void Debug_SetUpFieldMove_SecretPower(void)
{
    u8 metatile;

    CheckPlayerHasSecretBase();

    if (gSpecialVar_Result == 1 || GetPlayerFacingDirection() != DIR_NORTH)
    {
        ScriptContext2_Disable();
        return;
    }
    
    GetXYCoordsOneStepInFrontOfPlayer(&gPlayerFacingPosition.x, &gPlayerFacingPosition.y);
    metatile = MapGridGetMetatileBehaviorAt(gPlayerFacingPosition.x, gPlayerFacingPosition.y);
    if (MetatileBehavior_IsSecretBaseCave(metatile) == TRUE)
    {
        SetCurrentSecretBase();
        gLastFieldPokeMenuOpened = 0;
        FieldCallback_SecretBaseCave();
    }
    else if (MetatileBehavior_IsSecretBaseTree(metatile) == TRUE)
    {
        SetCurrentSecretBase();
        gLastFieldPokeMenuOpened = 0;
        FieldCallback_SecretBaseTree();
    }
    else if (MetatileBehavior_IsSecretBaseShrub(metatile) == TRUE)
    {
        SetCurrentSecretBase();
        gLastFieldPokeMenuOpened = 0;
        FieldCallback_SecretBaseShrub();
    }
    else
    {
        ScriptContext2_Disable();
    }
}

#endif

bool8 SetUpFieldMove_SecretPower(void)
{
    u8 behavior;

    CheckPlayerHasSecretBase();
    if (gSpecialVar_Result == 1 || GetPlayerFacingDirection() != DIR_NORTH)
        return FALSE;

    GetXYCoordsOneStepInFrontOfPlayer(&gPlayerFacingPosition.x, &gPlayerFacingPosition.y);
    behavior = MapGridGetMetatileBehaviorAt(gPlayerFacingPosition.x, gPlayerFacingPosition.y);

    if (MetatileBehavior_IsSecretBaseCave(behavior) == TRUE)
    {
        SetCurrentSecretBase();
        gFieldCallback = FieldCallback_PrepareFadeInFromMenu;
        gPostMenuFieldCallback = FieldCallback_SecretBaseCave;
        return TRUE;
    }

    if (MetatileBehavior_IsSecretBaseTree(behavior) == TRUE)
    {
        SetCurrentSecretBase();
        gFieldCallback = FieldCallback_PrepareFadeInFromMenu;
        gPostMenuFieldCallback = FieldCallback_SecretBaseTree;
        return TRUE;
    }

    if (MetatileBehavior_IsSecretBaseShrub(behavior) == TRUE)
    {
        SetCurrentSecretBase();
        gFieldCallback = FieldCallback_PrepareFadeInFromMenu;
        gPostMenuFieldCallback = FieldCallback_SecretBaseShrub;
        return TRUE;
    }

    return FALSE;
}

static void FieldCallback_SecretBaseCave(void)
{
    gFieldEffectArguments[0] = gLastFieldPokeMenuOpened;
    ScriptContext1_SetupScript(DoSecretBaseCaveFieldEffectScript);
}

bool8 FldEff_UseSecretPowerCave(void)
{
    u8 taskId = oei_task_add();

    gTasks[taskId].data[8] = (uintptr_t)StartSecretBaseCaveFieldEffect >> 16;
    gTasks[taskId].data[9] = (uintptr_t)StartSecretBaseCaveFieldEffect;

    return FALSE;
}

static void StartSecretBaseCaveFieldEffect(void)
{
    FieldEffectActiveListRemove(FLDEFF_USE_SECRET_POWER_CAVE);
    FieldEffectStart(FLDEFF_SECRET_POWER_CAVE);
}

bool8 FldEff_SecretPowerCave(void)
{
    AdjustSecretPowerSpritePixelOffsets();
    CreateSprite(
        &sSpriteTemplate_CaveEntrance,
        gSprites[gPlayerAvatar.spriteId].oam.x + gFieldEffectArguments[5],
        gSprites[gPlayerAvatar.spriteId].oam.y + gFieldEffectArguments[6],
        148);
    return FALSE;
}

static void CaveEntranceSpriteCallback1(struct Sprite *sprite)
{
    PlaySE(SE_W088);
    sprite->data[0] = 0;
    sprite->callback = CaveEntranceSpriteCallback2;
}

static void CaveEntranceSpriteCallback2(struct Sprite *sprite)
{
    if (sprite->data[0] < 40)
    {
        sprite->data[0]++;
        if (sprite->data[0] == 20)
            SetOpenedSecretBaseMetatile();
    }
    else
    {
        sprite->data[0] = 0;
        sprite->callback = CaveEntranceSpriteCallbackEnd;
    }
}

static void CaveEntranceSpriteCallbackEnd(struct Sprite *sprite)
{
    FieldEffectStop(sprite, FLDEFF_SECRET_POWER_CAVE);
    EnableBothScriptContexts();
}

static void FieldCallback_SecretBaseTree(void)
{
    gFieldEffectArguments[0] = gLastFieldPokeMenuOpened;
    ScriptContext1_SetupScript(DoSecretBaseTreeFieldEffectScript);
}

bool8 FldEff_UseSecretPowerTree(void)
{
    u8 taskId = oei_task_add();

    gTasks[taskId].data[8] = (uintptr_t)StartSecretBaseTreeFieldEffect >> 16;
    gTasks[taskId].data[9] = (uintptr_t)StartSecretBaseTreeFieldEffect;

    return FALSE;
}

static void StartSecretBaseTreeFieldEffect(void)
{
    FieldEffectActiveListRemove(FLDEFF_USE_SECRET_POWER_TREE);
    FieldEffectStart(FLDEFF_SECRET_POWER_TREE);
}

bool8 FldEff_SecretPowerTree(void)
{
    s16 behavior = MapGridGetMetatileBehaviorAt(gPlayerFacingPosition.x, gPlayerFacingPosition.y) & 0xFFF;

    if (behavior == MB_SECRET_BASE_SPOT_TREE_1)
        gFieldEffectArguments[7] = 0;

    if (behavior == MB_SECRET_BASE_SPOT_TREE_2)
        gFieldEffectArguments[7] = 2;

    AdjustSecretPowerSpritePixelOffsets();
    CreateSprite(
        &sSpriteTemplate_TreeEntrance,
        gSprites[gPlayerAvatar.spriteId].oam.x + gFieldEffectArguments[5],
        gSprites[gPlayerAvatar.spriteId].oam.y + gFieldEffectArguments[6],
        148);

    if (gFieldEffectArguments[7] == 1 || gFieldEffectArguments[7] == 3)
        SetOpenedSecretBaseMetatile();

    return FALSE;
}

static void TreeEntranceSpriteCallback1(struct Sprite *sprite)
{
    PlaySE(SE_W010);
    sprite->animNum = gFieldEffectArguments[7];
    sprite->data[0] = 0;
    sprite->callback = TreeEntranceSpriteCallback2;
}

static void TreeEntranceSpriteCallback2(struct Sprite *sprite)
{
    sprite->data[0]++;

    if (sprite->data[0] >= 40)
    {
        if (gFieldEffectArguments[7] == 0 || gFieldEffectArguments[7] == 2)
            SetOpenedSecretBaseMetatile();

        sprite->data[0] = 0;
        sprite->callback = TreeEntranceSpriteCallbackEnd;
    }
}

static void TreeEntranceSpriteCallbackEnd(struct Sprite *sprite)
{
    FieldEffectStop(sprite, FLDEFF_SECRET_POWER_TREE);
    EnableBothScriptContexts();
}

static void FieldCallback_SecretBaseShrub(void)
{
    gFieldEffectArguments[0] = gLastFieldPokeMenuOpened;
    ScriptContext1_SetupScript(DoSecretBaseShrubFieldEffectScript);
}

bool8 FldEff_UseSecretPowerShrub(void)
{
    u8 taskId = oei_task_add();

    gTasks[taskId].data[8] = (uintptr_t)StartSecretBaseShrubFieldEffect >> 16;
    gTasks[taskId].data[9] = (uintptr_t)StartSecretBaseShrubFieldEffect;

    return FALSE;
}

static void StartSecretBaseShrubFieldEffect(void)
{
    FieldEffectActiveListRemove(FLDEFF_USE_SECRET_POWER_SHRUB);
    FieldEffectStart(FLDEFF_SECRET_POWER_SHRUB);
}

bool8 FldEff_SecretPowerShrub(void)
{
    AdjustSecretPowerSpritePixelOffsets();
    CreateSprite(
        &sSpriteTemplate_ShrubEntrance,
        gSprites[gPlayerAvatar.spriteId].oam.x + gFieldEffectArguments[5],
        gSprites[gPlayerAvatar.spriteId].oam.y + gFieldEffectArguments[6],
        148);
    return FALSE;
}

static void ShrubEntranceSpriteCallback1(struct Sprite *sprite)
{
    PlaySE(SE_W077);
    sprite->data[0] = 0;
    sprite->callback = ShrubEntranceSpriteCallback2;
}

static void ShrubEntranceSpriteCallback2(struct Sprite *sprite)
{
    if (sprite->data[0] < 40)
    {
        sprite->data[0]++;
        if (sprite->data[0] == 20)
            SetOpenedSecretBaseMetatile();
    }
    else
    {
        sprite->data[0] = 0;
        sprite->callback = ShrubEntranceSpriteCallbackEnd;
    }
}

static void ShrubEntranceSpriteCallbackEnd(struct Sprite *sprite)
{
    FieldEffectStop(sprite, FLDEFF_SECRET_POWER_SHRUB);
    EnableBothScriptContexts();
}
