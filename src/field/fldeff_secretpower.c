#include "global.h"
#include "event_data.h"
#include "fieldmap.h"
#include "field_effect.h"
#include "field_player_avatar.h"
#include "metatile_behavior.h"
#include "metatile_behaviors.h"
#include "overworld.h"
#include "pokemon_menu.h"
#include "rom6.h"
#include "script.h"
#include "secret_base.h"
#include "constants/songs.h"
#include "sound.h"

extern u8 gUnknown_081A2CE6[];
extern u8 gUnknown_081A2D3E[];
extern u8 gUnknown_081A2D96[];

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

void sub_80C644C(struct Sprite *);
const struct SpriteTemplate gSpriteTemplate_83D2614 =
{
    .tileTag = 0xFFFF,
    .paletteTag = 4099,
    .oam = &gOamData_83D24EC,
    .anims = gSpriteAnimTable_83D2584,
    .images = gSpriteImageTable_83D259C,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80C644C,
};

void sub_80C6598(struct Sprite *);
const struct SpriteTemplate gSpriteTemplate_83D262C =
{
    .tileTag = 0xFFFF,
    .paletteTag = 4104,
    .oam = &gOamData_83D24EC,
    .anims = gSpriteAnimTable_83D2588,
    .images = gSpriteImageTable_83D25C4,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80C6598,
};

void sub_80C66BC(struct Sprite *);
const struct SpriteTemplate gSpriteTemplate_83D2644 =
{
    .tileTag = 0xFFFF,
    .paletteTag = 4104,
    .oam = &gOamData_83D24EC,
    .anims = gSpriteAnimTable_83D2598,
    .images = gSpriteImageTable_83D25EC,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80C66BC,
};

const struct SpritePalette gFieldEffectObjectPaletteInfo7 = {gFieldEffectObjectPalette7, 0x1003};
const struct SpritePalette gFieldEffectObjectPaletteInfo8 = {gFieldEffectObjectPalette8, 0x1008};

void sub_80C639C(void);
void sub_80C63E8(void);
void sub_80C6468(struct Sprite *);
void sub_80C6498(struct Sprite *);
void sub_80C64A8(void);
void sub_80C64F4(void);
void sub_80C65C4(struct Sprite *);
void sub_80C65FC(struct Sprite *);
void sub_80C660C(void);
void sub_80C6658(void);
void sub_80C66D8(struct Sprite *sprite);
void sub_80C6708(struct Sprite *sprite);

void sub_80C6264(void)
{
    sub_80BBFD8(&gUnknown_0203923C, gMapHeader.events);
    sub_80BB5E4();
}

void sub_80C6280(void)
{
    switch (gFieldEffectArguments[1])
    {
    case 1:
        gFieldEffectArguments[5] = 8;
        gFieldEffectArguments[6] = 40;
        break;
    case 2:
        gFieldEffectArguments[5] = 8;
        gFieldEffectArguments[6] = 8;
        break;
    case 3:
        gFieldEffectArguments[5] = -8;
        gFieldEffectArguments[6] = 24;
        break;
    case 4:
        gFieldEffectArguments[5] = 24;
        gFieldEffectArguments[6] = 24;
        break;
    }
}

#if DEBUG

__attribute__((naked))
void debug_sub_80D93F4()
{
    asm("\
	push	{r4, lr}\n\
	bl	sub_80BB63C\n\
	ldr	r0, ._98\n\
	ldrh	r0, [r0]\n\
	cmp	r0, #0x1\n\
	beq	._95	@cond_branch\n\
	bl	player_get_direction_lower_nybble\n\
	lsl	r0, r0, #0x18\n\
	lsr	r0, r0, #0x18\n\
	cmp	r0, #0x2\n\
	beq	._96	@cond_branch\n\
._95:\n\
	bl	ScriptContext2_Disable\n\
	b	._109\n\
._99:\n\
	.align	2, 0\n\
._98:\n\
	.word	gSpecialVar_Result\n\
._96:\n\
	ldr	r4, ._102\n\
	add	r1, r4, #2\n\
	add	r0, r4, #0\n\
	bl	GetXYCoordsOneStepInFrontOfPlayer\n\
	mov	r1, #0x0\n\
	ldsh	r0, [r4, r1]\n\
	mov	r2, #0x2\n\
	ldsh	r1, [r4, r2]\n\
	bl	MapGridGetMetatileBehaviorAt\n\
	lsl	r0, r0, #0x18\n\
	lsr	r4, r0, #0x18\n\
	add	r0, r4, #0\n\
	bl	MetatileBehavior_IsSecretBaseCave\n\
	lsl	r0, r0, #0x18\n\
	lsr	r0, r0, #0x18\n\
	cmp	r0, #0x1\n\
	bne	._100	@cond_branch\n\
	bl	sub_80C6264\n\
	ldr	r1, ._102 + 4\n\
	mov	r0, #0x0\n\
	strb	r0, [r1]\n\
	bl	sub_80C639C\n\
	b	._109\n\
._103:\n\
	.align	2, 0\n\
._102:\n\
	.word	gUnknown_0203923C\n\
	.word	gLastFieldPokeMenuOpened\n\
._100:\n\
	add	r0, r4, #0\n\
	bl	MetatileBehavior_IsSecretBaseTree\n\
	lsl	r0, r0, #0x18\n\
	lsr	r0, r0, #0x18\n\
	cmp	r0, #0x1\n\
	bne	._104	@cond_branch\n\
	bl	sub_80C6264\n\
	ldr	r1, ._106\n\
	mov	r0, #0x0\n\
	strb	r0, [r1]\n\
	bl	sub_80C64A8\n\
	b	._109\n\
._107:\n\
	.align	2, 0\n\
._106:\n\
	.word	gLastFieldPokeMenuOpened\n\
._104:\n\
	add	r0, r4, #0\n\
	bl	MetatileBehavior_IsSecretBaseShrub\n\
	lsl	r0, r0, #0x18\n\
	lsr	r0, r0, #0x18\n\
	cmp	r0, #0x1\n\
	bne	._108	@cond_branch\n\
	bl	sub_80C6264\n\
	ldr	r1, ._110\n\
	mov	r0, #0x0\n\
	strb	r0, [r1]\n\
	bl	sub_80C660C\n\
	b	._109\n\
._111:\n\
	.align	2, 0\n\
._110:\n\
	.word	gLastFieldPokeMenuOpened\n\
._108:\n\
	bl	ScriptContext2_Disable\n\
._109:\n\
	pop	{r4}\n\
	pop	{r0}\n\
	bx	r0");
}
#endif

bool8 SetUpFieldMove_SecretPower(void)
{
    u8 behavior;

    sub_80BB63C();

    if (gSpecialVar_Result == 1 || player_get_direction_lower_nybble() != DIR_NORTH)
        return FALSE;

    GetXYCoordsOneStepInFrontOfPlayer(&gUnknown_0203923C.x, &gUnknown_0203923C.y);
    behavior = MapGridGetMetatileBehaviorAt(gUnknown_0203923C.x, gUnknown_0203923C.y);

    if (MetatileBehavior_IsSecretBaseCave(behavior) == TRUE)
    {
        sub_80C6264();
        gFieldCallback = FieldCallback_Teleport;
        gUnknown_03005CE4 = sub_80C639C;
        return TRUE;
    }

    if (MetatileBehavior_IsSecretBaseTree(behavior) == TRUE)
    {
        sub_80C6264();
        gFieldCallback = FieldCallback_Teleport;
        gUnknown_03005CE4 = sub_80C64A8;
        return TRUE;
    }

    if (MetatileBehavior_IsSecretBaseShrub(behavior) == TRUE)
    {
        sub_80C6264();
        gFieldCallback = FieldCallback_Teleport;
        gUnknown_03005CE4 = sub_80C660C;
        return TRUE;
    }

    return FALSE;
}

void sub_80C639C(void)
{
    gFieldEffectArguments[0] = gLastFieldPokeMenuOpened;
    ScriptContext1_SetupScript(gUnknown_081A2CE6);
}

bool8 FldEff_UseSecretPowerCave(void)
{
    u8 taskId = oei_task_add();

    gTasks[taskId].data[8] = (uintptr_t)sub_80C63E8 >> 16;
    gTasks[taskId].data[9] = (uintptr_t)sub_80C63E8;

    return FALSE;
}

void sub_80C63E8(void)
{
    FieldEffectActiveListRemove(FLDEFF_USE_SECRET_POWER_CAVE);
    FieldEffectStart(FLDEFF_SECRET_POWER_CAVE);
}

bool8 FldEff_SecretPowerCave(void)
{
    sub_80C6280();
    CreateSprite(
        &gSpriteTemplate_83D2614,
        gSprites[gPlayerAvatar.spriteId].oam.x + gFieldEffectArguments[5],
        gSprites[gPlayerAvatar.spriteId].oam.y + gFieldEffectArguments[6],
        148);
    return FALSE;
}

void sub_80C644C(struct Sprite *sprite)
{
    PlaySE(SE_W088);
    sprite->data[0] = 0;
    sprite->callback = sub_80C6468;
}

void sub_80C6468(struct Sprite *sprite)
{
    if (sprite->data[0] < 40)
    {
        sprite->data[0]++;
        if (sprite->data[0] == 20 )
            sub_80BB800();
    }
    else
    {
        sprite->data[0] = 0;
        sprite->callback = sub_80C6498;
    }
}

void sub_80C6498(struct Sprite *sprite)
{
    FieldEffectStop(sprite, FLDEFF_SECRET_POWER_CAVE);
    EnableBothScriptContexts();
}

void sub_80C64A8(void)
{
    gFieldEffectArguments[0] = gLastFieldPokeMenuOpened;
    ScriptContext1_SetupScript(gUnknown_081A2D3E);
}

bool8 FldEff_UseSecretPowerTree(void)
{
    u8 taskId = oei_task_add();

    gTasks[taskId].data[8] = (uintptr_t)sub_80C64F4 >> 16;
    gTasks[taskId].data[9] = (uintptr_t)sub_80C64F4;

    return FALSE;
}

void sub_80C64F4(void)
{
    FieldEffectActiveListRemove(FLDEFF_USE_SECRET_POWER_TREE);
    FieldEffectStart(FLDEFF_SECRET_POWER_TREE);
}

bool8 FldEff_SecretPowerTree(void)
{
    s16 behavior = MapGridGetMetatileBehaviorAt(gUnknown_0203923C.x, gUnknown_0203923C.y) & 0xFFF;

    if (behavior == MB_SECRET_BASE_SPOT_TREE_1)
    {
        gFieldEffectArguments[7] = 0;
    }

    if (behavior == MB_SECRET_BASE_SPOT_TREE_2)
    {
        gFieldEffectArguments[7] = 2;
    }

    sub_80C6280();

    CreateSprite(
        &gSpriteTemplate_83D262C,
        gSprites[gPlayerAvatar.spriteId].oam.x + gFieldEffectArguments[5],
        gSprites[gPlayerAvatar.spriteId].oam.y + gFieldEffectArguments[6],
        148);

    if (gFieldEffectArguments[7] == 1 || gFieldEffectArguments[7] == 3)
        sub_80BB800();

    return FALSE;
}

void sub_80C6598(struct Sprite *sprite)
{
    PlaySE(SE_W010);
    sprite->animNum = gFieldEffectArguments[7];
    sprite->data[0] = 0;
    sprite->callback = sub_80C65C4;
}

void sub_80C65C4(struct Sprite *sprite)
{
    sprite->data[0]++;

    if (sprite->data[0] >= 40)
    {
        if (gFieldEffectArguments[7] == 0 || gFieldEffectArguments[7] == 2)
            sub_80BB800();
        sprite->data[0] = 0;
        sprite->callback = sub_80C65FC;
    }
}


void sub_80C65FC(struct Sprite *sprite)
{
    FieldEffectStop(sprite, FLDEFF_SECRET_POWER_TREE);
    EnableBothScriptContexts();
}

void sub_80C660C(void)
{
    gFieldEffectArguments[0] = gLastFieldPokeMenuOpened;
    ScriptContext1_SetupScript(gUnknown_081A2D96);
}

bool8 FldEff_UseSecretPowerShrub(void)
{
    u8 taskId = oei_task_add();

    gTasks[taskId].data[8] = (uintptr_t)sub_80C6658 >> 16;
    gTasks[taskId].data[9] = (uintptr_t)sub_80C6658;

    return FALSE;
}

void sub_80C6658(void)
{
    FieldEffectActiveListRemove(FLDEFF_USE_SECRET_POWER_SHRUB);
    FieldEffectStart(FLDEFF_SECRET_POWER_SHRUB);
}

bool8 FldEff_SecretPowerShrub(void)
{
    sub_80C6280();
    CreateSprite(
        &gSpriteTemplate_83D2644,
        gSprites[gPlayerAvatar.spriteId].oam.x + gFieldEffectArguments[5],
        gSprites[gPlayerAvatar.spriteId].oam.y + gFieldEffectArguments[6],
        148);
    return FALSE;
}

void sub_80C66BC(struct Sprite *sprite)
{
    PlaySE(SE_W077);
    sprite->data[0] = 0;
    sprite->callback = sub_80C66D8;
}

void sub_80C66D8(struct Sprite *sprite)
{
    if (sprite->data[0] < 40)
    {
        sprite->data[0]++;
        if (sprite->data[0] == 20 )
            sub_80BB800();
    }
    else
    {
        sprite->data[0] = 0;
        sprite->callback = sub_80C6708;
    }
}


void sub_80C6708(struct Sprite *sprite)
{
    FieldEffectStop(sprite, FLDEFF_SECRET_POWER_SHRUB);
    EnableBothScriptContexts();
}
