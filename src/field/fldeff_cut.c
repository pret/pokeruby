#include "global.h"
#include "fldeff_cut.h"
#include "field_camera.h"
#include "field_effect.h"
#include "event_object_movement.h"
#include "field_player_avatar.h"
#include "fieldmap.h"
#include "map_obj_lock.h"
#include "metatile_behavior.h"
#include "metatile_behaviors.h"
#include "pokemon_menu.h"
#include "overworld.h"
#include "rom6.h"
#include "script.h"
#include "constants/songs.h"
#include "sound.h"
#include "sprite.h"
#include "task.h"
#include "trig.h"
#include "ewram.h"

extern void (*gFieldCallback)(void);
extern void (*gUnknown_03005CE4)(void);
extern u8 gLastFieldPokeMenuOpened;

extern const u8 S_UseCut[];

const struct OamData gOamData_CutGrass =
{
    .y = 0,
    .affineMode = 0,
    .objMode = 0,
    .mosaic = 0,
    .bpp = 0,
    .shape = 0,
    .x = 0,
    .matrixNum = 0,
    .size = 0,
    .tileNum = 1,
    .priority = 1,
    .paletteNum = 1,
    .affineParam = 0,
};

const union AnimCmd gSpriteAnim_CutGrass[] =
{
    ANIMCMD_FRAME(0, 30),
    ANIMCMD_JUMP(0),
};

const union AnimCmd *const gSpriteAnimTable_CutGrass[] =
{
    gSpriteAnim_CutGrass,
};

const struct SpriteFrameImage gSpriteImageTable_CutGrass[] =
{
    {gFieldEffectPic_CutGrass, 0x20},
};

const struct SpritePalette gFieldEffectObjectPaletteInfo6 = {gFieldEffectObjectPalette6, 0x1000};

static void sub_80A2A48(struct Sprite *);
static const struct SpriteTemplate gSpriteTemplate_CutGrass =
{
    .tileTag = 0xFFFF,
    .paletteTag = 0x1000,
    .oam = &gOamData_CutGrass,
    .anims = gSpriteAnimTable_CutGrass,
    .images = gSpriteImageTable_CutGrass,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80A2A48,
};

#if DEBUG
__attribute__((naked))
void debug_sub_80AFEE4()
{
    asm(
        "	push	{r4, r5, r6, r7, lr}\n"
        "	mov	r7, r8\n"
        "	push	{r7}\n"
        "	mov	r0, #0x52\n"
        "	bl	npc_before_player_of_type\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r0, r0, #0x18\n"
        "	cmp	r0, #0x1\n"
        "	bne	._1	@cond_branch\n"
        "	ldr	r1, ._3         @ gLastFieldPokeMenuOpened\n"
        "	mov	r0, #0x0\n"
        "	strb	r0, [r1]\n"
        "	bl	sub_80A2634\n"
        "	b	._8\n"
        "._4:\n"
        "	.align	2, 0\n"
        "._3:\n"
        "	.word	gLastFieldPokeMenuOpened\n"
        "._1:\n"
        "	ldr	r4, ._9         @ gUnknown_0203923C\n"
        "	add	r1, r4, #2\n"
        "	add	r0, r4, #0\n"
        "	bl	PlayerGetDestCoords\n"
        "	mov	r7, #0x0\n"
        "	mov	r8, r4\n"
        "._12:\n"
        "	ldr	r1, ._9 + 4     @ 0xffff\n"
        "	add	r0, r7, r1\n"
        "	mov	r2, r8\n"
        "	ldrh	r2, [r2, #0x2]\n"
        "	add	r0, r0, r2\n"
        "	mov	r6, #0x0\n"
        "	lsl	r0, r0, #0x10\n"
        "	asr	r5, r0, #0x10\n"
        "._11:\n"
        "	ldr	r1, ._9 + 4     @ 0xffff\n"
        "	add	r0, r6, r1\n"
        "	mov	r2, r8\n"
        "	ldrh	r2, [r2]\n"
        "	add	r0, r0, r2\n"
        "	lsl	r0, r0, #0x10\n"
        "	asr	r4, r0, #0x10\n"
        "	add	r0, r4, #0\n"
        "	add	r1, r5, #0\n"
        "	bl	MapGridGetZCoordAt\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r0, r0, #0x18\n"
        "	mov	r2, r8\n"
        "	mov	r1, #0x4\n"
        "	ldsb	r1, [r2, r1]\n"
        "	cmp	r0, r1\n"
        "	bne	._7	@cond_branch\n"
        "	add	r0, r4, #0\n"
        "	add	r1, r5, #0\n"
        "	bl	MapGridGetMetatileBehaviorAt\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r4, r0, #0x18\n"
        "	add	r0, r4, #0\n"
        "	bl	MetatileBehavior_IsPokeGrass\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r0, r0, #0x18\n"
        "	cmp	r0, #0x1\n"
        "	beq	._6	@cond_branch\n"
        "	add	r0, r4, #0\n"
        "	bl	MetatileBehavior_IsAshGrass\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r0, r0, #0x18\n"
        "	cmp	r0, #0x1\n"
        "	bne	._7	@cond_branch\n"
        "._6:\n"
        "	ldr	r1, ._9 + 8     @ gLastFieldPokeMenuOpened\n"
        "	mov	r0, #0x0\n"
        "	strb	r0, [r1]\n"
        "	bl	sub_80A25E8\n"
        "	b	._8\n"
        "._10:\n"
        "	.align	2, 0\n"
        "._9:\n"
        "	.word	gUnknown_0203923C\n"
        "	.word	0xffff\n"
        "	.word	gLastFieldPokeMenuOpened\n"
        "._7:\n"
        "	add	r0, r6, #1\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r6, r0, #0x18\n"
        "	cmp	r6, #0x2\n"
        "	bls	._11	@cond_branch\n"
        "	add	r0, r7, #1\n"
        "	lsl	r0, r0, #0x18\n"
        "	lsr	r7, r0, #0x18\n"
        "	cmp	r7, #0x2\n"
        "	bls	._12	@cond_branch\n"
        "	bl	ScriptContext2_Disable\n"
        "._8:\n"
        "	pop	{r3}\n"
        "	mov	r8, r3\n"
        "	pop	{r4, r5, r6, r7}\n"
        "	pop	{r0}\n"
        "	bx	r0\n"
        "\n"
    );
}
#endif

bool8 SetUpFieldMove_Cut(void)
{
    s16 x, y;
    u8 i, j;
    u8 tileBehavior;

    if(npc_before_player_of_type(0x52) == TRUE) // is in front of tree?
    {
        gFieldCallback = FieldCallback_Teleport;
        gUnknown_03005CE4 = sub_80A2634;
        return TRUE;
    }
    else // is in ash or grass to cut?
    {
        PlayerGetDestCoords(&gUnknown_0203923C.x, &gUnknown_0203923C.y);
        for(i = 0; i < 3; i++)
        {
            y = i - 1 + gUnknown_0203923C.y;
            for(j = 0; j < 3; j++)
            {
                x = j - 1 + gUnknown_0203923C.x;
                if(MapGridGetZCoordAt(x, y) == (s8)gUnknown_0203923C.height)
                {
                    tileBehavior = MapGridGetMetatileBehaviorAt(x, y);
                    if(MetatileBehavior_IsPokeGrass(tileBehavior) == TRUE
                    || MetatileBehavior_IsAshGrass(tileBehavior) == TRUE)
                    {
                        gFieldCallback = FieldCallback_Teleport;
                        gUnknown_03005CE4 = sub_80A25E8;
                        return TRUE;
                    }
                }
            }
        }
        return FALSE; // do not use cut
    }
}

void sub_80A25E8(void)
{
    FieldEffectStart(FLDEFF_USE_CUT_ON_GRASS);
    gFieldEffectArguments[0] = gLastFieldPokeMenuOpened;
}

bool8 FldEff_UseCutOnGrass(void)
{
    u8 taskId = oei_task_add();

    gTasks[taskId].data[8] = (u32)sub_80A2684 >> 16;
    gTasks[taskId].data[9] = (u32)sub_80A2684;
    IncrementGameStat(GAME_STAT_USED_CUT);
    return FALSE;
}

void sub_80A2634(void)
{
    gFieldEffectArguments[0] = gLastFieldPokeMenuOpened;
    ScriptContext1_SetupScript(S_UseCut);
}

bool8 FldEff_UseCutOnTree(void)
{
    u8 taskId = oei_task_add();

    gTasks[taskId].data[8] = (u32)sub_80A2B00 >> 16;
    gTasks[taskId].data[9] = (u32)sub_80A2B00;
    IncrementGameStat(GAME_STAT_USED_CUT);
    return FALSE;
}

void sub_80A2684(void)
{
    FieldEffectActiveListRemove(FLDEFF_USE_CUT_ON_GRASS);
    FieldEffectStart(FLDEFF_CUT_GRASS);
}

bool8 FldEff_CutGrass(void)
{
    s16 x, y;
    u8 tileBehavior;
    u8 i, j; // not in for loop?

    for(i = 0, PlaySE(SE_W015), PlayerGetDestCoords(&gUnknown_0203923C.x, &gUnknown_0203923C.y); i < 3; i++)
    {
        y = i - 1 + gUnknown_0203923C.y;
        for(j = 0; j < 3; j++)
        {
            x = j - 1 + gUnknown_0203923C.x;
            if(MapGridGetZCoordAt(x, y) == (s8)gUnknown_0203923C.height)
            {
                tileBehavior = MapGridGetMetatileBehaviorAt(x, y);
                if(MetatileBehavior_IsCuttableGrass(tileBehavior) == TRUE)
                {
                    sub_80A27A8(x, y);
                    sub_805BCC0(x, y);
                }
            }
        }
    }
    sub_80A28F4(gUnknown_0203923C.x - 1, gUnknown_0203923C.y - 2);
    DrawWholeMapView();

    // populate sprite ID array
    for(i = 0; i < 8; i++)
    {
        eCutGrassSpriteArray[i] = CreateSprite((struct SpriteTemplate *)&gSpriteTemplate_CutGrass,
        gSprites[gPlayerAvatar.spriteId].oam.x + 8, gSprites[gPlayerAvatar.spriteId].oam.y + 20, 0);
        gSprites[eCutGrassSpriteArray[i]].data[2] = 32 * i;
    }
    return 0;
}

// set map grid metatile depending on x, y
// TODO: enum for metatile IDs
void sub_80A27A8(s16 x, s16 y)
{
    int metatileId = MapGridGetMetatileIdAt(x, y);

    switch(metatileId)
    {
    case 0x208:
    case 0x15:
    case 0xD:
        MapGridSetMetatileIdAt(x, y, 0x1);
        break;
    case 0x1C6:
        MapGridSetMetatileIdAt(x, y, 0x1CE);
        break;
    case 0x1C7:
        MapGridSetMetatileIdAt(x, y, 0x1CF);
        break;
    case 0x281:
        MapGridSetMetatileIdAt(x, y, 0x279);
        break;
    case 0x282:
        MapGridSetMetatileIdAt(x, y, 0x27A);
        break;
    case 0x283:
        MapGridSetMetatileIdAt(x, y, 0x27B);
        break;
    case 0x206:
    case 0x207:
        MapGridSetMetatileIdAt(x, y, 0x271);
        break;
    case 0x212:
    case 0x20A:
        MapGridSetMetatileIdAt(x, y, 0x218);
        break;
    case 0x25:
        MapGridSetMetatileIdAt(x, y, 0xE);
        break;
    }
}

s32 sub_80A28A0(s16 x, s16 y)
{
    u16 metatileId = MapGridGetMetatileIdAt(x, y);

    if(metatileId == 1)
        return 1;
    else if(metatileId == 633)
        return 2;
    else if(metatileId == 634)
        return 3;
    else if(metatileId == 635)
        return 4;
    else
        return 0;
}

void sub_80A28F4(s16 x, s16 y)
{
    s16 i;
    u16 lowerY = y + 3;

    for(i = 0; i < 3; i++)
    {
        u16 currentX = x + i;
        s16 currentXsigned = x + i;
        if(MapGridGetMetatileIdAt(currentXsigned, y) == 21)
        {
            switch((u8)sub_80A28A0(currentXsigned, y + 1))
            {
            case 1:
                MapGridSetMetatileIdAt(currentXsigned, y + 1, 0x208);
                break;
            case 2:
                MapGridSetMetatileIdAt(currentXsigned, y + 1, 0x281);
                break;
            case 3:
                MapGridSetMetatileIdAt(currentXsigned, y + 1, 0x282);
                break;
            case 4:
                MapGridSetMetatileIdAt(currentXsigned, y + 1, 0x283);
                break;
            }
        }
        if(MapGridGetMetatileIdAt((s16)currentX, (s16)lowerY) == 1)
        {
            if(MapGridGetMetatileIdAt((s16)currentX, (s16)lowerY + 1) == 0x208)
                MapGridSetMetatileIdAt((s16)currentX, (s16)lowerY + 1, 0x1);
            if(MapGridGetMetatileIdAt((s16)currentX, (s16)lowerY + 1) == 0x281)
                MapGridSetMetatileIdAt((s16)currentX, (s16)lowerY + 1, 0x279);
            if(MapGridGetMetatileIdAt((s16)currentX, (s16)lowerY + 1) == 0x282)
                MapGridSetMetatileIdAt((s16)currentX, (s16)lowerY + 1, 0x27A);
            if(MapGridGetMetatileIdAt((s16)currentX, (s16)lowerY + 1) == 0x283)
                MapGridSetMetatileIdAt((s16)currentX, (s16)lowerY + 1, 0x27B);
        }
    }
}

static void sub_80A2A48(struct Sprite *sprite)
{
    sprite->data[0] = 8;
    sprite->data[1] = 0;
    sprite->data[3] = 0;
    sprite->callback = (void *)objc_8097BBC;
}

void objc_8097BBC(struct Sprite *sprite)
{
    u16 tempdata;
    u16 tempdata2;

    sprite->pos2.x = Sin(sprite->data[2], sprite->data[0]);
    sprite->pos2.y = Cos(sprite->data[2], sprite->data[0]);

    sprite->data[2] = (sprite->data[2] + 8) & 0xFF;
    sprite->data[0] += ((tempdata2 = sprite->data[3]) << 16 >> 18) + 1; // what?
    sprite->data[3] = tempdata2 + 1;

    tempdata = sprite->data[1];
    if((s16)tempdata != 28) // done rotating the grass, execute clean up function
        sprite->data[1]++;
    else
        sprite->callback = (void *)sub_80A2AB8;
}

void sub_80A2AB8(void)
{
    u8 i;

    for (i = 1; i < 8; i++)
        DestroySprite(&gSprites[eCutGrassSpriteArray[i]]);
    FieldEffectStop(&gSprites[eCutGrassSpriteArray[0]], FLDEFF_CUT_GRASS);
    sub_8064E2C();
    ScriptContext2_Disable();
}

void sub_80A2B00(void)
{
    PlaySE(SE_W015);
    FieldEffectActiveListRemove(FLDEFF_USE_CUT_ON_TREE);
    EnableBothScriptContexts();
}
