#include "global.h"
#include "asm.h"
#include "data2.h"
#include "script.h"
#include "trig.h"
#include "main.h"
#include "field_weather.h"
#include "decompress.h"
#include "sprite.h"
#include "palette.h"
#include "text.h"
#include "rom4.h"
#include "task.h"
#include "sound.h"
#include "songs.h"
#include "decoration.h"
#include "field_player_avatar.h"
#include "field_map_obj_helpers.h"
#include "field_map_obj.h"
#include "metatile_behavior.h"
#include "field_camera.h"
#include "field_effect.h"

typedef bool8 (*FldEffCmd)(u8 **, u32 *);

static u8 sActiveList[32];

extern u8 *gFieldEffectScriptPointers[];

extern FldEffCmd gFieldEffectScriptFuncs[];

u32 FieldEffectStart(u8 id)
{
    u8 *script;
    u32 val;

    FieldEffectActiveListAdd(id);

    script = gFieldEffectScriptPointers[id];

    while (gFieldEffectScriptFuncs[*script](&script, &val))
        ;

    return val;
}

bool8 FieldEffectCmd_loadtiles(u8 **script, u32 *val)
{
    (*script)++;
    FieldEffectScript_LoadTiles(script);
    return TRUE;
}

bool8 FieldEffectCmd_loadfadedpal(u8 **script, u32 *val)
{
    (*script)++;
    FieldEffectScript_LoadFadedPalette(script);
    return TRUE;
}

bool8 FieldEffectCmd_loadpal(u8 **script, u32 *val)
{
    (*script)++;
    FieldEffectScript_LoadPalette(script);
    return TRUE;
}

bool8 FieldEffectCmd_callnative(u8 **script, u32 *val)
{
    (*script)++;
    FieldEffectScript_CallNative(script, val);
    return TRUE;
}

bool8 FieldEffectCmd_end(u8 **script, u32 *val)
{
    return FALSE;
}

bool8 FieldEffectCmd_loadgfx_callnative(u8 **script, u32 *val)
{
    (*script)++;
    FieldEffectScript_LoadTiles(script);
    FieldEffectScript_LoadFadedPalette(script);
    FieldEffectScript_CallNative(script, val);
    return TRUE;
}

bool8 FieldEffectCmd_loadtiles_callnative(u8 **script, u32 *val)
{
    (*script)++;
    FieldEffectScript_LoadTiles(script);
    FieldEffectScript_CallNative(script, val);
    return TRUE;
}

bool8 FieldEffectCmd_loadfadedpal_callnative(u8 **script, u32 *val)
{
    (*script)++;
    FieldEffectScript_LoadFadedPalette(script);
    FieldEffectScript_CallNative(script, val);
    return TRUE;
}

u32 FieldEffectScript_ReadWord(u8 **script)
{
    return (*script)[0]
         + ((*script)[1] << 8)
         + ((*script)[2] << 16)
         + ((*script)[3] << 24);
}

void FieldEffectScript_LoadTiles(u8 **script)
{
    struct SpriteSheet *sheet = (struct SpriteSheet *)FieldEffectScript_ReadWord(script);
    if (GetSpriteTileStartByTag(sheet->tag) == 0xFFFF)
        LoadSpriteSheet(sheet);
    (*script) += 4;
}

void FieldEffectScript_LoadFadedPalette(u8 **script)
{
    struct SpritePalette *palette = (struct SpritePalette *)FieldEffectScript_ReadWord(script);
    LoadSpritePalette(palette);
    sub_807D78C(IndexOfSpritePaletteTag(palette->tag));
    (*script) += 4;
}

void FieldEffectScript_LoadPalette(u8 **script)
{
    struct SpritePalette *palette = (struct SpritePalette *)FieldEffectScript_ReadWord(script);
    LoadSpritePalette(palette);
    (*script) += 4;
}

void FieldEffectScript_CallNative(u8 **script, u32 *val)
{
    u32 (*func)(void) = (u32 (*)(void))FieldEffectScript_ReadWord(script);
    *val = func();
    (*script) += 4;
}

void FieldEffectFreeGraphicsResources(struct Sprite *sprite)
{
    u16 sheetTileStart = sprite->sheetTileStart;
    u32 paletteNum = sprite->oam.paletteNum;
    DestroySprite(sprite);
    FieldEffectFreeTilesIfUnused(sheetTileStart);
    FieldEffectFreePaletteIfUnused(paletteNum);
}

void FieldEffectStop(struct Sprite *sprite, u8 id)
{
    FieldEffectFreeGraphicsResources(sprite);
    FieldEffectActiveListRemove(id);
}

void FieldEffectFreeTilesIfUnused(u16 tileStart)
{
    u8 i;
    u16 tag = GetSpriteTileTagByTileStart(tileStart);

    if (tag != 0xFFFF)
    {
        for (i = 0; i < MAX_SPRITES; i++)
            if (gSprites[i].inUse && gSprites[i].usingSheet && tileStart == gSprites[i].sheetTileStart)
                return;
        FreeSpriteTilesByTag(tag);
    }
}

void FieldEffectFreePaletteIfUnused(u8 paletteNum)
{
    u8 i;
    u16 tag = GetSpritePaletteTagByPaletteNum(paletteNum);

    if (tag != 0xFFFF)
    {
        for (i = 0; i < MAX_SPRITES; i++)
            if (gSprites[i].inUse && gSprites[i].oam.paletteNum == paletteNum)
                return;
        FreeSpritePaletteByTag(tag);
    }
}

void FieldEffectActiveListClear(void)
{
    u8 i;
    for (i = 0; i < ARRAY_COUNT(sActiveList); i++)
        sActiveList[i] = 0xFF;
}

void FieldEffectActiveListAdd(u8 id)
{
    u8 i;
    for (i = 0; i < ARRAY_COUNT(sActiveList); i++)
    {
        if (sActiveList[i] == 0xFF)
        {
            sActiveList[i] = id;
            return;
        }
    }
}

void FieldEffectActiveListRemove(u8 id)
{
    u8 i;
    for (i = 0; i < ARRAY_COUNT(sActiveList); i++)
    {
        if (sActiveList[i] == id)
        {
            sActiveList[i] = 0xFF;
            return;
        }
    }
}

bool8 FieldEffectActiveListContains(u8 id)
{
    u8 i;
    for (i = 0; i < ARRAY_COUNT(sActiveList); i++)
        if (sActiveList[i] == id)
            return TRUE;
    return FALSE;
}

u8 CreateTrainerSprite_BirchSpeech(u8 gender, s16 x, s16 y, u8 subpriority, u8 *buffer)
{
    struct SpriteTemplate spriteTemplate;
    LoadCompressedObjectPaletteOverrideBuffer(&gTrainerFrontPicPaletteTable[gender], buffer);
    LoadCompressedObjectPicOverrideBuffer(&gTrainerFrontPicTable[gender], buffer);
    spriteTemplate.tileTag = gTrainerFrontPicTable[gender].tag;
    spriteTemplate.paletteTag = gTrainerFrontPicPaletteTable[gender].tag;
    spriteTemplate.oam = &gOamData_839F0F4;
    spriteTemplate.anims = gDummySpriteAnimTable;
    spriteTemplate.images = NULL;
    spriteTemplate.affineAnims = gDummySpriteAffineAnimTable;
    spriteTemplate.callback = SpriteCallbackDummy;
    return CreateSprite(&spriteTemplate, x, y, subpriority);
}

void LoadTrainerGfx_TrainerCard(u8 gender, u16 palOffset, u8 *dest)
{
    LZDecompressVram(gTrainerFrontPicTable[gender].data, dest);
    LoadCompressedPalette(gTrainerFrontPicPaletteTable[gender].data, palOffset, 0x20);
}

u8 CreateBirchSprite(s16 x, s16 y, u8 subpriority)
{
    LoadSpritePalette(&gUnknown_0839F114);
    return CreateSprite(&gSpriteTemplate_839F128, x, y, subpriority);
}

u8 CreateMonSprite_PicBox(u16 species, s16 x, s16 y, u8 subpriority)
{
    DecompressPicFromTable_2(&gMonFrontPicTable[species], gMonFrontPicCoords[species].coords, gMonFrontPicCoords[species].y_offset, gUnknown_081FAF4C[3], gUnknown_081FAF4C[3], species);
    LoadCompressedObjectPalette(&gMonPaletteTable[species]);
    GetMonSpriteTemplate_803C56C(species, 3);
    gUnknown_02024E8C.paletteTag = gMonPaletteTable[0].tag;
    sub_807DE38(IndexOfSpritePaletteTag(gMonPaletteTable[0].tag) + 0x10);
    return CreateSprite(&gUnknown_02024E8C, x, y, subpriority);
}

u8 CreateMonSprite_FieldMove(u16 species, u32 d, u32 g, s16 x, s16 y, u8 subpriority)
{
    const struct SpritePalette *spritePalette;
    HandleLoadSpecialPokePic(&gMonFrontPicTable[species], gMonFrontPicCoords[species].coords, gMonFrontPicCoords[species].y_offset, (u32)gUnknown_081FAF4C[3] /* this is actually u8* or something, pointing to ewram */, gUnknown_081FAF4C[3], species, g);
    spritePalette = sub_80409C8(species, d, g);
    LoadCompressedObjectPalette(spritePalette);
    GetMonSpriteTemplate_803C56C(species, 3);
    gUnknown_02024E8C.paletteTag = spritePalette->tag;
    sub_807DE38(IndexOfSpritePaletteTag(spritePalette->tag) + 0x10);
    return CreateSprite(&gUnknown_02024E8C, x, y, subpriority);
}

void FreeResourcesAndDestroySprite(struct Sprite *sprite)
{
    sub_807DE68();
    FreeSpritePaletteByTag(GetSpritePaletteTagByPaletteNum(sprite->oam.paletteNum));
    if (sprite->oam.affineMode != 0)
    {
        FreeOamMatrix(sprite->oam.matrixNum);
    }
    DestroySprite(sprite);
}

#undef NONMATCHING
#ifdef NONMATCHING
void MultiplyInvertedPaletteRGBComponents(u16 i, u8 r, u8 g, u8 b)
{
    int curRed;
    int curGreen;
    int curBlue;

    curRed = gPlttBufferUnfaded[i] & 0x1f;
    curGreen = (gPlttBufferUnfaded[i] & (0x1f << 5)) >> 5;
    curBlue = (gPlttBufferUnfaded[i] & (0x1f << 10)) >> 10;
    curRed += (((0x1f - curRed) * r) >> 4);
    curGreen += (((0x1f - curGreen) * g) >> 4);
    curBlue += (((0x1f - curBlue) * b) >> 4);
    gPlttBufferFaded[i] = RGB(curRed, curGreen, curBlue);
}

void MultiplyPaletteRGBComponents(u16 i, u8 r, u8 g, u8 b)
{
    int curRed;
    int curGreen;
    int curBlue;

    curRed = gPlttBufferUnfaded[i] & 0x1f;
    curGreen = (gPlttBufferUnfaded[i] & (0x1f << 5)) >> 5;
    curBlue = (gPlttBufferUnfaded[i] & (0x1f << 10)) >> 10;
    curRed -= ((curRed * r) >> 4);
    curGreen -= ((curGreen * g) >> 4);
    curBlue -= ((curBlue * b) >> 4);
    gPlttBufferFaded[i] = RGB(curRed, curGreen, curBlue);
}
#else
__attribute__((naked))
void MultiplyInvertedPaletteRGBComponents(u16 i, u8 r, u8 g, u8 b)
{
    asm(".syntax unified\n"
    "\tpush {r4-r7,lr}\n"
    "\tmov r7, r9\n"
    "\tmov r6, r8\n"
    "\tpush {r6,r7}\n"
    "\tlsls r0, 16\n"
    "\tlsls r1, 24\n"
    "\tlsrs r1, 24\n"
    "\tlsls r2, 24\n"
    "\tlsrs r2, 24\n"
    "\tlsls r3, 24\n"
    "\tlsrs r3, 24\n"
    "\tldr r4, _08085D00 @ =gPlttBufferUnfaded\n"
    "\tlsrs r0, 15\n"
    "\tadds r4, r0, r4\n"
    "\tldrh r4, [r4]\n"
    "\tmovs r5, 0x1F\n"
    "\tmov r9, r5\n"
    "\tmov r8, r4\n"
    "\tmov r6, r8\n"
    "\tands r6, r5\n"
    "\tmov r8, r6\n"
    "\tmovs r6, 0xF8\n"
    "\tlsls r6, 2\n"
    "\tands r6, r4\n"
    "\tlsrs r6, 5\n"
    "\tmovs r5, 0xF8\n"
    "\tlsls r5, 7\n"
    "\tands r4, r5\n"
    "\tlsrs r4, 10\n"
    "\tmov r7, r9\n"
    "\tmov r5, r8\n"
    "\tsubs r7, r5\n"
    "\tmov r12, r7\n"
    "\tmov r7, r12\n"
    "\tmuls r7, r1\n"
    "\tadds r1, r7, 0\n"
    "\tasrs r1, 4\n"
    "\tadd r8, r1\n"
    "\tmov r5, r9\n"
    "\tsubs r1, r5, r6\n"
    "\tmuls r1, r2\n"
    "\tasrs r1, 4\n"
    "\tadds r6, r1\n"
    "\tsubs r5, r4\n"
    "\tmov r9, r5\n"
    "\tmov r1, r9\n"
    "\tmuls r1, r3\n"
    "\tasrs r1, 4\n"
    "\tadds r4, r1\n"
    "\tmov r7, r8\n"
    "\tlsls r7, 16\n"
    "\tlsls r6, 21\n"
    "\torrs r6, r7\n"
    "\tlsls r4, 26\n"
    "\torrs r4, r6\n"
    "\tlsrs r4, 16\n"
    "\tldr r1, _08085D04 @ =gPlttBufferFaded\n"
    "\tadds r0, r1\n"
    "\tstrh r4, [r0]\n"
    "\tpop {r3,r4}\n"
    "\tmov r8, r3\n"
    "\tmov r9, r4\n"
    "\tpop {r4-r7}\n"
    "\tpop {r0}\n"
    "\tbx r0\n"
    "\t.align 2, 0\n"
    "_08085D00: .4byte gPlttBufferUnfaded\n"
    "_08085D04: .4byte gPlttBufferFaded\n"
    ".syntax divided");
}

__attribute__((naked))
void MultiplyPaletteRGBComponents(u16 i, u8 r, u8 g, u8 b)
{
    asm(".syntax unified\n"
    "\tpush {r4-r6,lr}\n"
    "\tmov r6, r8\n"
    "\tpush {r6}\n"
    "\tlsls r0, 16\n"
    "\tlsls r1, 24\n"
    "\tlsrs r1, 24\n"
    "\tlsls r2, 24\n"
    "\tlsrs r2, 24\n"
    "\tlsls r3, 24\n"
    "\tlsrs r3, 24\n"
    "\tldr r4, _08085D78 @ =gPlttBufferUnfaded\n"
    "\tlsrs r0, 15\n"
    "\tadds r4, r0, r4\n"
    "\tldrh r4, [r4]\n"
    "\tmovs r5, 0x1F\n"
    "\tmov r8, r5\n"
    "\tmov r6, r8\n"
    "\tands r6, r4\n"
    "\tmov r8, r6\n"
    "\tmovs r5, 0xF8\n"
    "\tlsls r5, 2\n"
    "\tands r5, r4\n"
    "\tlsrs r5, 5\n"
    "\tmovs r6, 0xF8\n"
    "\tlsls r6, 7\n"
    "\tands r4, r6\n"
    "\tlsrs r4, 10\n"
    "\tmov r6, r8\n"
    "\tmuls r6, r1\n"
    "\tadds r1, r6, 0\n"
    "\tasrs r1, 4\n"
    "\tmov r6, r8\n"
    "\tsubs r6, r1\n"
    "\tadds r1, r5, 0\n"
    "\tmuls r1, r2\n"
    "\tasrs r1, 4\n"
    "\tsubs r5, r1\n"
    "\tadds r1, r4, 0\n"
    "\tmuls r1, r3\n"
    "\tasrs r1, 4\n"
    "\tsubs r4, r1\n"
    "\tlsls r6, 16\n"
    "\tlsls r5, 21\n"
    "\torrs r5, r6\n"
    "\tlsls r4, 26\n"
    "\torrs r4, r5\n"
    "\tlsrs r4, 16\n"
    "\tldr r1, _08085D7C @ =gPlttBufferFaded\n"
    "\tadds r0, r1\n"
    "\tstrh r4, [r0]\n"
    "\tpop {r3}\n"
    "\tmov r8, r3\n"
    "\tpop {r4-r6}\n"
    "\tpop {r0}\n"
    "\tbx r0\n"
    "\t.align 2, 0\n"
    "_08085D78: .4byte gPlttBufferUnfaded\n"
    "_08085D7C: .4byte gPlttBufferFaded\n"
    ".syntax divided");
}
#endif

void Task_PokecenterHeal(u8 taskId);
extern const void (*gUnknown_0839F268[4])(struct Task *);
u8 CreatePokeballGlowSprite(s16, s16, s16, u16);
u8 PokecenterHealEffectHelper(s16, s16);

bool8 FldEff_PokecenterHeal(void)
{
    u8 nPokemon;
    struct Task *task;

    nPokemon = CalculatePlayerPartyCount();
    task = &gTasks[CreateTask(Task_PokecenterHeal, 0xff)];
    task->data[1] = nPokemon;
    task->data[2] = 0x5d;
    task->data[3] = 0x24;
    task->data[4] = 0x7c;
    task->data[5] = 0x18;
    return FALSE;
}

void Task_PokecenterHeal(u8 taskId)
{
    struct Task *task;
    task = &gTasks[taskId];
    gUnknown_0839F268[task->data[0]](task);
}

void PokecenterHealEffect_0(struct Task *task)
{
    task->data[0]++;
    task->data[6] = CreatePokeballGlowSprite(task->data[1], task->data[2], task->data[3], 1);
    task->data[7] = PokecenterHealEffectHelper(task->data[4], task->data[5]);
}

void PokecenterHealEffect_1(struct Task *task)
{
    if (gSprites[task->data[6]].data0 > 1)
    {
        gSprites[task->data[7]].data0++;
        task->data[0]++;
    }
}

void PokecenterHealEffect_2(struct Task *task)
{
    if (gSprites[task->data[6]].data0 > 4)
    {
        task->data[0]++;
    }
}

void PokecenterHealEffect_3(struct Task *task)
{
    if (gSprites[task->data[6]].data0 > 6)
    {
        DestroySprite(&gSprites[task->data[6]]);
        FieldEffectActiveListRemove(FLDEFF_POKECENTER_HEAL);
        DestroyTask(FindTaskIdByFunc(Task_PokecenterHeal));
    }
}

void Task_HallOfFameRecord(u8 taskId);
extern const void (*gUnknown_0839F278[4])(struct Task *);
void HallOfFameRecordEffectHelper(s16, s16, s16, u8);

bool8 FldEff_HallOfFameRecord(void)
{
    u8 nPokemon;
    struct Task *task;

    nPokemon = CalculatePlayerPartyCount();
    task = &gTasks[CreateTask(Task_HallOfFameRecord, 0xff)];
    task->data[1] = nPokemon;
    task->data[2] = 0x75;
    task->data[3] = 0x34;
    return FALSE;
}

void Task_HallOfFameRecord(u8 taskId)
{
    struct Task *task;
    task = &gTasks[taskId];
    gUnknown_0839F278[task->data[0]](task);
}

void HallOfFameRecordEffect_0(struct Task *task)
{
    u8 taskId;
    task->data[0]++;
    task->data[6] = CreatePokeballGlowSprite(task->data[1], task->data[2], task->data[3], 0);
    taskId = FindTaskIdByFunc(Task_HallOfFameRecord);
    HallOfFameRecordEffectHelper(taskId, 0x78, 0x18, 0);
    HallOfFameRecordEffectHelper(taskId, 0x28, 0x08, 1);
    HallOfFameRecordEffectHelper(taskId, 0x48, 0x08, 1);
    HallOfFameRecordEffectHelper(taskId, 0xa8, 0x08, 1);
    HallOfFameRecordEffectHelper(taskId, 0xc8, 0x08, 1);
}

void HallOfFameRecordEffect_1(struct Task *task)
{
    if (gSprites[task->data[6]].data0 > 1)
    {
        task->data[15]++; // was this ever initialized? is this ever used?
        task->data[0]++;
    }
}

void HallOfFameRecordEffect_2(struct Task *task)
{
    if (gSprites[task->data[6]].data0 > 4)
    {
        task->data[0]++;
    }
}

void HallOfFameRecordEffect_3(struct Task *task)
{
    if (gSprites[task->data[6]].data0 > 6)
    {
        DestroySprite(&gSprites[task->data[6]]);
        FieldEffectActiveListRemove(FLDEFF_HALL_OF_FAME_RECORD);
        DestroyTask(FindTaskIdByFunc(Task_HallOfFameRecord));
    }
}

void SpriteCB_PokeballGlowEffect(struct Sprite *);
extern const void (*gUnknown_0839F288[8])(struct Sprite *);
extern const struct SpriteTemplate gSpriteTemplate_839F208;
extern const struct SpriteTemplate gSpriteTemplate_839F220;
extern const struct SpriteTemplate gSpriteTemplate_839F238;
extern const struct SpriteTemplate gSpriteTemplate_839F250;
extern const struct SubspriteTable gUnknown_0839F1A0;
extern const struct SubspriteTable gUnknown_0839F1C8;
extern const struct Coords16 gUnknown_0839F2A8[6];

u8 CreatePokeballGlowSprite(s16 data6, s16 x, s16 y, u16 data5)
{
    u8 spriteId;
    struct Sprite *sprite;
    spriteId = CreateInvisibleSprite(SpriteCB_PokeballGlowEffect);
    sprite = &gSprites[spriteId];
    sprite->pos2.x = x;
    sprite->pos2.y = y;
    sprite->data5 = data5;
    sprite->data6 = data6;
    sprite->data7 = spriteId;
    return spriteId;
}

void SpriteCB_PokeballGlowEffect(struct Sprite *sprite)
{
    gUnknown_0839F288[sprite->data0](sprite);
}

void PokeballGlowEffect_0(struct Sprite *sprite)
{
    u8 endSpriteId;
    if (sprite->data1 == 0 || (--sprite->data1) == 0)
    {
        sprite->data1 = 25;
        endSpriteId = CreateSpriteAtEnd(&gSpriteTemplate_839F208, gUnknown_0839F2A8[sprite->data2].x + sprite->pos2.x, gUnknown_0839F2A8[sprite->data2].y + sprite->pos2.y, 0);
        gSprites[endSpriteId].oam.priority = 2;
        gSprites[endSpriteId].data0 = sprite->data7;
        sprite->data2++;
        sprite->data6--;
        PlaySE(SE_BOWA);
    }
    if (sprite->data6 == 0)
    {
        sprite->data1 = 32;
        sprite->data0++;
    }
}

extern const u8 gUnknown_0839F2C0[4]; // red
extern const u8 gUnknown_0839F2C4[4]; // green
extern const u8 gUnknown_0839F2C8[4]; // blue

void PokeballGlowEffect_1(struct Sprite *sprite)
{
    if ((--sprite->data1) == 0)
    {
        sprite->data0++;
        sprite->data1 = 8;
        sprite->data2 = 0;
        sprite->data3 = 0;
        if (sprite->data5)
        {
            PlayFanfare(BGM_ME_ASA);
        }
    }
}

void PokeballGlowEffect_2(struct Sprite *sprite)
{
    u8 phase;
    if ((--sprite->data1) == 0)
    {
        sprite->data1 = 8;
        sprite->data2++;
        sprite->data2 &= 3;
        if (sprite->data2 == 0)
        {
            sprite->data3++;
        }
    }
    phase = (sprite->data2 + 3) & 3;
    MultiplyInvertedPaletteRGBComponents((IndexOfSpritePaletteTag(0x1007) << 4) + 0x108, gUnknown_0839F2C0[phase], gUnknown_0839F2C4[phase], gUnknown_0839F2C8[phase]);
    phase = (sprite->data2 + 2) & 3;
    MultiplyInvertedPaletteRGBComponents((IndexOfSpritePaletteTag(0x1007) << 4) + 0x106, gUnknown_0839F2C0[phase], gUnknown_0839F2C4[phase], gUnknown_0839F2C8[phase]);
    phase = (sprite->data2 + 1) & 3;
    MultiplyInvertedPaletteRGBComponents((IndexOfSpritePaletteTag(0x1007) << 4) + 0x102, gUnknown_0839F2C0[phase], gUnknown_0839F2C4[phase], gUnknown_0839F2C8[phase]);
    phase = sprite->data2;
    MultiplyInvertedPaletteRGBComponents((IndexOfSpritePaletteTag(0x1007) << 4) + 0x105, gUnknown_0839F2C0[phase], gUnknown_0839F2C4[phase], gUnknown_0839F2C8[phase]);
    MultiplyInvertedPaletteRGBComponents((IndexOfSpritePaletteTag(0x1007) << 4) + 0x103, gUnknown_0839F2C0[phase], gUnknown_0839F2C4[phase], gUnknown_0839F2C8[phase]);
    if (sprite->data3 > 2)
    {
        sprite->data0++;
        sprite->data1 = 8;
        sprite->data2 = 0;
    }
}

void PokeballGlowEffect_3(struct Sprite *sprite)
{
    u8 phase;
    if ((--sprite->data1) == 0)
    {
        sprite->data1 = 8;
        sprite->data2++;
        sprite->data2 &= 3;
        if (sprite->data2 == 3)
        {
            sprite->data0++;
            sprite->data1 = 30;
        }
    }
    phase = sprite->data2;
    MultiplyInvertedPaletteRGBComponents((IndexOfSpritePaletteTag(0x1007) << 4) + 0x108, gUnknown_0839F2C0[phase], gUnknown_0839F2C4[phase], gUnknown_0839F2C8[phase]);
    MultiplyInvertedPaletteRGBComponents((IndexOfSpritePaletteTag(0x1007) << 4) + 0x106, gUnknown_0839F2C0[phase], gUnknown_0839F2C4[phase], gUnknown_0839F2C8[phase]);
    MultiplyInvertedPaletteRGBComponents((IndexOfSpritePaletteTag(0x1007) << 4) + 0x102, gUnknown_0839F2C0[phase], gUnknown_0839F2C4[phase], gUnknown_0839F2C8[phase]);
    MultiplyInvertedPaletteRGBComponents((IndexOfSpritePaletteTag(0x1007) << 4) + 0x105, gUnknown_0839F2C0[phase], gUnknown_0839F2C4[phase], gUnknown_0839F2C8[phase]);
    MultiplyInvertedPaletteRGBComponents((IndexOfSpritePaletteTag(0x1007) << 4) + 0x103, gUnknown_0839F2C0[phase], gUnknown_0839F2C4[phase], gUnknown_0839F2C8[phase]);
}

void PokeballGlowEffect_4(struct Sprite *sprite)
{
    if ((--sprite->data1) == 0)
    {
        sprite->data0++;
    }
}

void PokeballGlowEffect_5(struct Sprite *sprite)
{
    sprite->data0++;
}

void PokeballGlowEffect_6(struct Sprite *sprite)
{
    if (sprite->data5 == 0 || IsFanfareTaskInactive())
    {
        sprite->data0++;
    }
}

void PokeballGlowEffect_7(struct Sprite *sprite)
{
}

void SpriteCB_PokeballGlow(struct Sprite *sprite)
{
    if (gSprites[sprite->data0].data0 > 4)
    {
        FieldEffectFreeGraphicsResources(sprite);
    }
}

u8 PokecenterHealEffectHelper(s16 x, s16 y)
{
    u8 spriteIdAtEnd;
    struct Sprite *sprite;
    spriteIdAtEnd = CreateSpriteAtEnd(&gSpriteTemplate_839F220, x, y, 0);
    sprite = &gSprites[spriteIdAtEnd];
    sprite->oam.priority = 2;
    sprite->invisible = 1;
    SetSubspriteTables(sprite, &gUnknown_0839F1A0);
    return spriteIdAtEnd;
}

void SpriteCB_PokecenterMonitor(struct Sprite *sprite)
{
    if (sprite->data0 != 0)
    {
        sprite->data0 = 0;
        sprite->invisible = 0;
        StartSpriteAnim(sprite, 1);
    }
    if (sprite->animEnded)
    {
        FieldEffectFreeGraphicsResources(sprite);
    }
}

void HallOfFameRecordEffectHelper(s16 a0, s16 a1, s16 a2, u8 a3)
{
    u8 spriteIdAtEnd;
    if (!a3)
    {
        spriteIdAtEnd = CreateSpriteAtEnd(&gSpriteTemplate_839F238, a1, a2, 0);
        SetSubspriteTables(&gSprites[spriteIdAtEnd], &gUnknown_0839F1C8);
    } else
    {
        spriteIdAtEnd = CreateSpriteAtEnd(&gSpriteTemplate_839F250, a1, a2, 0);
    }
    gSprites[spriteIdAtEnd].invisible = 1;
    gSprites[spriteIdAtEnd].data0 = a0;
}

void SpriteCB_HallOfFameMonitor(struct Sprite *sprite)
{
    if (gTasks[sprite->data0].data[15])
    {
        if (sprite->data1 == 0 || (--sprite->data1) == 0)
        {
            sprite->data1 = 16;
            sprite->invisible ^= 1;
        }
        sprite->data2++;
    }
    if (sprite->data2 > 127)
    {
        FieldEffectFreeGraphicsResources(sprite);
    }
}

void mapldr_080842E8(void);
void mapldr_08084390(void);
void task00_8084310(u8);
void c3_080843F8(u8);

void sub_80865BC(void)
{
    SetMainCallback2(c2_exit_to_overworld_2_switch);
    gUnknown_0300485C = mapldr_080842E8;
}

void mapldr_080842E8(void)
{
    pal_fill_black();
    CreateTask(task00_8084310, 0);
    ScriptContext2_Enable();
    FreezeMapObjects();
    gUnknown_0300485C = NULL;
}

void task00_8084310(u8 taskId)
{
    struct Task *task;
    task = &gTasks[taskId];
    if (!task->data[0])
    {
        if (!sub_807D770())
        {
            return;
        }
        gUnknown_0202FF84[0] = gLastFieldPokeMenuOpened;
        if ((int)gUnknown_0202FF84[0] > 5)
        {
            gUnknown_0202FF84[0] = 0;
        }
        FieldEffectStart(FLDEFF_USE_FLY);
        task->data[0]++;
    }
    if (!FieldEffectActiveListContains(FLDEFF_USE_FLY))
    {
        flag_var_implications_of_teleport_();
        warp_in();
        SetMainCallback2(CB2_LoadMap);
        gUnknown_0300485C = mapldr_08084390;
        DestroyTask(taskId);
    }
}

void mapldr_08084390(void)
{
    sub_8053E90();
    pal_fill_black();
    CreateTask(c3_080843F8, 0);
    gMapObjects[gPlayerAvatar.mapObjectId].mapobj_bit_13 = 1;
    if (gPlayerAvatar.flags & 0x08)
    {
        FieldObjectTurn(&gMapObjects[gPlayerAvatar.mapObjectId], DIR_WEST);
    }
    ScriptContext2_Enable();
    FreezeMapObjects();
    gUnknown_0300485C = NULL;
}

void c3_080843F8(u8 taskId)
{
    struct Task *task;
    task = &gTasks[taskId];
    if (task->data[0] == 0)
    {
        if (gPaletteFade.active)
        {
            return;
        }
        FieldEffectStart(FLDEFF_FLY_IN);
        task->data[0]++;
    }
    if (!FieldEffectActiveListContains(FLDEFF_FLY_IN))
    {
        ScriptContext2_Disable();
        UnfreezeMapObjects();
        DestroyTask(taskId);
    }
}

extern void pal_fill_for_map_transition(void);
void sub_8086774(u8);
extern const bool8 (*gUnknown_0839F2CC[7])(struct Task *);
extern void CameraObjectReset2(void);
extern void CameraObjectReset1(void);

void sub_8086748(void)
{
    sub_8053E90();
    pal_fill_for_map_transition();
    ScriptContext2_Enable();
    FreezeMapObjects();
    CreateTask(sub_8086774, 0);
    gUnknown_0300485C = NULL;
}

void sub_8086774(u8 taskId)
{
    struct Task *task;
    task = &gTasks[taskId];
    while (gUnknown_0839F2CC[task->data[0]](task)); // return code signifies whether to continue blocking here
}

bool8 sub_80867AC(struct Task *task) // gUnknown_0839F2CC[0]
{
    struct MapObject *playerObject;
    struct Sprite *playerSprite;
    playerObject = &gMapObjects[gPlayerAvatar.mapObjectId];
    playerSprite = &gSprites[gPlayerAvatar.spriteId];
    CameraObjectReset2();
    gMapObjects[gPlayerAvatar.mapObjectId].mapobj_bit_13 = 1;
    gPlayerAvatar.unk6 = 1;
    FieldObjectSetSpecialAnim(playerObject, GetFaceDirectionAnimId(player_get_direction_lower_nybble()));
    task->data[4] = playerSprite->subspriteMode;
    playerObject->mapobj_bit_26 = 1;
    playerSprite->oam.priority = 1;
    playerSprite->subspriteMode = 2;
    task->data[0]++;
    return TRUE;
}

bool8 sub_8086854(struct Task *task) // gUnknown_0839F2CC[1]
{
    if (sub_807D770())
    {
        task->data[0]++;
    }
    return FALSE;
}

bool8 sub_8086870(struct Task *task) // gUnknown_0839F2CC[2]
{
    struct Sprite *sprite;
    s16 centerToCornerVecY;
    sprite = &gSprites[gPlayerAvatar.spriteId];
    centerToCornerVecY = -(sprite->centerToCornerVecY << 1);
    sprite->pos2.y = -(sprite->pos1.y + sprite->centerToCornerVecY + gSpriteCoordOffsetY + centerToCornerVecY);
    task->data[1] = 1;
    task->data[2] = 0;
    gMapObjects[gPlayerAvatar.mapObjectId].mapobj_bit_13 = 0;
    PlaySE(SE_RU_HYUU);
    task->data[0]++;
    return FALSE;
}

bool8 sub_80868E4(struct Task *task)
{
    struct MapObject *mapObject;
    struct Sprite *sprite;

    mapObject = &gMapObjects[gPlayerAvatar.mapObjectId];
    sprite = &gSprites[gPlayerAvatar.spriteId];
    sprite->pos2.y += task->data[1];
    if (task->data[1] < 8)
    {
        task->data[2] += task->data[1];
        if (task->data[2] & 0xf)
        {
            task->data[1] <<= 1;
        }
    }
    if (task->data[3] == 0 && sprite->pos2.y >= -16)
    {
        task->data[3]++;
        mapObject->mapobj_bit_26 = 0;
        sprite->subspriteMode = task->data[4];
        mapObject->mapobj_bit_2 = 1;
    }
    if (sprite->pos2.y >= 0)
    {
        PlaySE(SE_W070);
        mapObject->mapobj_bit_3 = 1;
        mapObject->mapobj_bit_5 = 1;
        sprite->pos2.y = 0;
        task->data[0]++;
    }
    return FALSE;
}

bool8 sub_808699C(struct Task *task)
{
    task->data[0]++;
    task->data[1] = 4;
    task->data[2] = 0;
    SetCameraPanningCallback(NULL);
    return TRUE;
}

bool8 sub_80869B8(struct Task *task)
{
    SetCameraPanning(0, task->data[1]);
    task->data[1] = -task->data[1];
    task->data[2]++;
    if ((task->data[2] & 3) == 0)
    {
        task->data[1] >>= 1;
    }
    if (task->data[1] == 0)
    {
        task->data[0]++;
    }
    return FALSE;
}

bool8 sub_80869F8(struct Task *task)
{
    gPlayerAvatar.unk6 = 0;
    ScriptContext2_Disable();
    CameraObjectReset1();
    UnfreezeMapObjects();
    InstallCameraPanAheadCallback();
    DestroyTask(FindTaskIdByFunc(sub_8086774));
    return FALSE;
}

void sub_8086A68(u8);
extern const bool8 (*gUnknown_0839F2E8[6])(struct Task *);
extern const bool8 (*gUnknown_0839F300[7])(struct Task *);
extern void sub_80B4824(u8);
extern void sub_8053FF8(void);
extern void fade_8080918(void);

void sub_8086B98(struct Task *);
void sub_8086BE4(struct Task *);
void sub_8086C30(void);
void sub_8086C40(void);
bool8 sub_8054034(void);
void sub_8086C94(void);
void sub_80B483C(void);
void sub_8086CBC(u8);

void sub_8086A2C(u8 a0, u8 priority)
{
    u8 taskId;
    taskId = CreateTask(sub_8086A68, priority);
    gTasks[taskId].data[1] = 0;
    if (a0 == 0x6a)
    {
        gTasks[taskId].data[1] = 1;
    }
}

void sub_8086A68(u8 taskId)
{
    struct Task *task;
    task = &gTasks[taskId];
    while (gUnknown_0839F2E8[task->data[0]](task));
}

bool8 sub_8086AA0(struct Task *task)
{
    FreezeMapObjects();
    CameraObjectReset2();
    sub_80B4824(task->data[1]);
    task->data[0]++;
    return FALSE;
}

bool8 sub_8086AC0(struct Task *task)
{
    struct MapObject *mapObject;
    mapObject = &gMapObjects[gPlayerAvatar.mapObjectId];
    if (!FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive(mapObject) || FieldObjectClearAnimIfSpecialAnimFinished(mapObject))
    {
        FieldObjectSetSpecialAnim(mapObject, GetFaceDirectionAnimId(player_get_direction_lower_nybble()));
        task->data[0]++;
        task->data[2] = 0;
        task->data[3] = 0;
        if ((u8)task->data[1] == 0)
        {
            task->data[0] = 4;
        }
        PlaySE(SE_ESUKA);
    }
    return FALSE;
}

bool8 sub_8086B30(struct Task *task)
{
    sub_8086B98(task);
    if (task->data[2] > 3)
    {
        sub_8086C30();
        task->data[0]++;
    }
    return FALSE;
}

bool8 sub_8086B54(struct Task *task)
{
    sub_8086B98(task);
    sub_8086C40();
    return FALSE;
}

bool8 sub_8086B64(struct Task *task)
{
    sub_8086BE4(task);
    if (task->data[2] > 3)
    {
        sub_8086C30();
        task->data[0]++;
    }
    return FALSE;
}

bool8 sub_8086B88(struct Task *task)
{
    sub_8086BE4(task);
    sub_8086C40();
    return FALSE;
}

void sub_8086B98(struct Task *task)
{
    struct Sprite *sprite;
    sprite = &gSprites[gPlayerAvatar.spriteId];
    sprite->pos2.x = Cos(0x84, task->data[2]);
    sprite->pos2.y = Sin(0x94, task->data[2]);
    task->data[3]++;
    if (task->data[3] & 1)
    {
        task->data[2]++;
    }
}

void sub_8086BE4(struct Task *task)
{
    struct Sprite *sprite;
    sprite = &gSprites[gPlayerAvatar.spriteId];
    sprite->pos2.x = Cos(0x7c, task->data[2]);
    sprite->pos2.y = Sin(0x76, task->data[2]);
    task->data[3]++;
    if (task->data[3] & 1)
    {
        task->data[2]++;
    }
}

void sub_8086C30(void)
{
    sub_8053FF8();
    fade_8080918();
}

void sub_8086C40(void)
{
    if (!gPaletteFade.active && sub_8054034() == TRUE)
    {
        sub_80B483C();
        warp_in();
        gUnknown_0300485C = sub_8086C94;
        SetMainCallback2(CB2_LoadMap);
        DestroyTask(FindTaskIdByFunc(sub_8086A68));
    }
}

void sub_8086C94(void)
{
    sub_8053E90();
    pal_fill_for_map_transition();
    ScriptContext2_Enable();
    CreateTask(sub_8086CBC, 0);
    gUnknown_0300485C = NULL;
}

void sub_8086CBC(u8 taskId)
{
    struct Task *task;
    task = &gTasks[taskId];
    while (gUnknown_0839F300[task->data[0]](task));
}

bool8 sub_8086CF4(struct Task *task)
{
    struct MapObject *mapObject;
    s16 x;
    s16 y;
    u8 behavior;
    CameraObjectReset2();
    mapObject = &gMapObjects[gPlayerAvatar.mapObjectId];
    FieldObjectSetSpecialAnim(mapObject, GetFaceDirectionAnimId(DIR_EAST));
    PlayerGetDestCoords(&x, &y);
    behavior = MapGridGetMetatileBehaviorAt(x, y);
    task->data[0]++;
    task->data[1] = 16;
    if (behavior == 0x6b)
    {
        behavior = 1;
        task->data[0] = 3;
    } else
    {
        behavior = 0;
    }
    sub_80B4824(behavior);
    return TRUE;
}

bool8 sub_8086D70(struct Task *task)
{
    struct Sprite *sprite;
    sprite = &gSprites[gPlayerAvatar.spriteId];
    sprite->pos2.x = Cos(0x84, task->data[1]);
    sprite->pos2.y = Sin(0x94, task->data[1]);
    task->data[0]++;
    return FALSE;
}

bool8 sub_8086DB0(struct Task *task)
{
    struct Sprite *sprite;
    sprite = &gSprites[gPlayerAvatar.spriteId];
    sprite->pos2.x = Cos(0x84, task->data[1]);
    sprite->pos2.y = Sin(0x94, task->data[1]);
    task->data[2]++;
    if (task->data[2] & 1)
    {
        task->data[1]--;
    }
    if (task->data[1] == 0)
    {
        sprite->pos2.x = 0;
        sprite->pos2.y = 0;
        task->data[0] = 5;
    }
    return FALSE;
}

bool8 sub_8086E10(struct Task *task)
{
    struct Sprite *sprite;
    sprite = &gSprites[gPlayerAvatar.spriteId];
    sprite->pos2.x = Cos(0x7c, task->data[1]);
    sprite->pos2.y = Sin(0x76, task->data[1]);
    task->data[0]++;
    return FALSE;
}

bool8 sub_8086E50(struct Task *task)
{
    struct Sprite *sprite;
    sprite = &gSprites[gPlayerAvatar.spriteId];
    sprite->pos2.x = Cos(0x7c, task->data[1]);
    sprite->pos2.y = Sin(0x76, task->data[1]);
    task->data[2]++;
    if (task->data[2] & 1)
    {
        task->data[1]--;
    }
    if (task->data[1] == 0)
    {
        sprite->pos2.x = 0;
        sprite->pos2.y = 0;
        task->data[0]++;
    }
    return FALSE;
}

extern bool8 sub_80B4850(void);

bool8 sub_8086EB0(struct Task *task)
{
    if (sub_80B4850())
    {
        return FALSE;
    }
    sub_80B483C();
    task->data[0]++;
    return TRUE;
}

bool8 sub_8086ED4(struct Task *task)
{
    struct MapObject *mapObject;
    mapObject = &gMapObjects[gPlayerAvatar.mapObjectId];
    if (FieldObjectClearAnimIfSpecialAnimFinished(mapObject))
    {
        CameraObjectReset1();
        ScriptContext2_Disable();
        FieldObjectSetSpecialAnim(mapObject, GetGoSpeed0AnimId(DIR_EAST));
        DestroyTask(FindTaskIdByFunc(sub_8086CBC));
    }
    return FALSE;
}

void sub_8086F64(u8);
extern const bool8 (*gUnknown_0839F31C[5])(struct Task *, struct MapObject *);

bool8 FldEff_UseWaterfall(void)
{
    u8 taskId;
    taskId = CreateTask(sub_8086F64, 0xff);
    gTasks[taskId].data[1] = gUnknown_0202FF84[0];
    sub_8086F64(taskId);
    return FALSE;
}

void sub_8086F64(u8 taskId)
{
    while (gUnknown_0839F31C[gTasks[taskId].data[0]](&gTasks[taskId], &gMapObjects[gPlayerAvatar.mapObjectId]));
}

bool8 sub_8086FB0(struct Task *task, struct MapObject *mapObject)
{
    ScriptContext2_Enable();
    gPlayerAvatar.unk6 = 1;
    task->data[0]++;
    return FALSE;
}

bool8 waterfall_1_do_anim_probably(struct Task *task, struct MapObject *mapObject)
{
    ScriptContext2_Enable();
    if (!FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive(mapObject))
    {
        FieldObjectClearAnimIfSpecialAnimFinished(mapObject);
        gUnknown_0202FF84[0] = task->data[1];
        FieldEffectStart(FLDEFF_FIELD_MOVE_SHOW_MON_INIT);
        task->data[0]++;
    }
    return FALSE;
}

bool8 waterfall_2_wait_anim_finish_probably(struct Task *task, struct MapObject *mapObject)
{
    if (FieldEffectActiveListContains(FLDEFF_FIELD_MOVE_SHOW_MON))
    {
        return FALSE;
    }
    task->data[0]++;
    return TRUE;
}

bool8 sub_8087030(struct Task *task, struct MapObject *mapObject)
{
    FieldObjectSetSpecialAnim(mapObject, GetSimpleGoAnimId(DIR_NORTH));
    task->data[0]++;
    return FALSE;
}

bool8 sub_8087058(struct Task *task, struct MapObject *mapObject)
{
    if (!FieldObjectClearAnimIfSpecialAnimFinished(mapObject))
    {
        return FALSE;
    }
    if (MetatileBehavior_IsWaterfall(mapObject->mapobj_unk_1E))
    {
        task->data[0] = 3;
        return TRUE;
    }
    ScriptContext2_Disable();
    gPlayerAvatar.unk6 = 0;
    DestroyTask(FindTaskIdByFunc(sub_8086F64));
    FieldEffectActiveListRemove(FLDEFF_USE_WATERFALL);
    return FALSE;
}

void Task_Dive(u8);
extern const bool8 (*gUnknown_0839F330[3])(struct Task *);
extern int dive_warp(struct MapPosition *, u16);

bool8 FldEff_UseDive(void)
{
    u8 taskId;
    taskId = CreateTask(Task_Dive, 0xff);
    gTasks[taskId].data[15] = gUnknown_0202FF84[0];
    gTasks[taskId].data[14] = gUnknown_0202FF84[1];
    Task_Dive(taskId);
    return FALSE;
}

void Task_Dive(u8 taskId)
{
    while (gUnknown_0839F330[gTasks[taskId].data[0]](&gTasks[taskId]));
}

bool8 sub_8087124(struct Task *task)
{
    gPlayerAvatar.unk6 = 1;
    task->data[0]++;
    return FALSE;
}

bool8 dive_2_unknown(struct Task *task)
{
    ScriptContext2_Enable();
    gUnknown_0202FF84[0] = task->data[15];
    FieldEffectStart(FLDEFF_FIELD_MOVE_SHOW_MON_INIT);
    task->data[0]++;
    return FALSE;
}

bool8 dive_3_unknown(struct Task *task)
{
    struct MapPosition mapPosition;
    PlayerGetDestCoords(&mapPosition.x, &mapPosition.y);
    if (!FieldEffectActiveListContains(FLDEFF_FIELD_MOVE_SHOW_MON))
    {
        dive_warp(&mapPosition, gMapObjects[gPlayerAvatar.mapObjectId].mapobj_unk_1E);
        DestroyTask(FindTaskIdByFunc(Task_Dive));
        FieldEffectActiveListRemove(FLDEFF_USE_DIVE);
    }
    return FALSE;
}

void sub_80871D0(u8);
extern const bool8 (*gUnknown_0839F33C[6])(struct Task *, struct MapObject *, struct Sprite *);
void mapldr_080851BC(void);

void sub_80871B8(u8 priority)
{
    CreateTask(sub_80871D0, priority);
}

void sub_80871D0(u8 taskId)
{
    while (gUnknown_0839F33C[gTasks[taskId].data[0]](&gTasks[taskId], &gMapObjects[gPlayerAvatar.mapObjectId], &gSprites[gPlayerAvatar.spriteId]));
}

bool8 sub_808722C(struct Task *task, struct MapObject *mapObject, struct Sprite *sprite)
{
    FreezeMapObjects();
    CameraObjectReset2();
    SetCameraPanningCallback(NULL);
    gPlayerAvatar.unk6 = 1;
    mapObject->mapobj_bit_26 = 1;
    task->data[1] = 1;
    task->data[0]++;
    return TRUE;
}

bool8 sub_8087264(struct Task *task, struct MapObject *mapObject, struct Sprite *sprite)
{
    SetCameraPanning(0, task->data[1]);
    task->data[1] = -task->data[1];
    task->data[2]++;
    if (task->data[2] > 7)
    {
        task->data[2] = 0;
        task->data[0]++;
    }
    return FALSE;
}

bool8 sub_8087298(struct Task *task, struct MapObject *mapObject, struct Sprite *sprite)
{
    sprite->pos2.y = 0;
    task->data[3] = 1;
    gUnknown_0202FF84[0] = mapObject->coords2.x;
    gUnknown_0202FF84[1] = mapObject->coords2.y;
    gUnknown_0202FF84[2] = sprite->subpriority - 1;
    gUnknown_0202FF84[3] = sprite->oam.priority;
    FieldEffectStart(FLDEFF_LAVARIDGE_GYM_WARP);
    PlaySE(SE_W153);
    task->data[0]++;
    return TRUE;
}

bool8 sub_80872E4(struct Task *task, struct MapObject *mapObject, struct Sprite *sprite)
{
    s16 centerToCornerVecY;
    SetCameraPanning(0, task->data[1]);
    if (task->data[1] = -task->data[1], ++task->data[2] <= 17)
    {
        if (!(task->data[2] & 1) && (task->data[1] <= 3))
        {
            task->data[1] <<= 1;
        }
    } else if (!(task->data[2] & 4) && (task->data[1] > 0))
    {
        task->data[1] >>= 1;
    }
    if (task->data[2] > 6)
    {
        centerToCornerVecY = -(sprite->centerToCornerVecY << 1);
        if (sprite->pos2.y > -(sprite->pos1.y + sprite->centerToCornerVecY + gSpriteCoordOffsetY + centerToCornerVecY))
        {
            sprite->pos2.y -= task->data[3];
            if (task->data[3] <= 7)
            {
                task->data[3]++;
            }
        } else
        {
            task->data[4] = 1;
        }
    }
    if (task->data[5] == 0 && sprite->pos2.y < -0x10)
    {
        task->data[5]++;
        mapObject->mapobj_bit_26 = 1;
        sprite->oam.priority = 1;
        sprite->subspriteMode = 2;
    }
    if (task->data[1] == 0 && task->data[4] != 0)
    {
        task->data[0]++;
    }
    return FALSE;
}

bool8 sub_80873D8(struct Task *task, struct MapObject *mapObject, struct Sprite *sprite)
{
    sub_8053FF8();
    fade_8080918();
    task->data[0]++;
    return FALSE;
}

bool8 sub_80873F4(struct Task *task, struct MapObject *mapObject, struct Sprite *sprite)
{
    if (!gPaletteFade.active && sub_8054034() == TRUE)
    {
        warp_in();
        gUnknown_0300485C = mapldr_080851BC;
        SetMainCallback2(CB2_LoadMap);
        DestroyTask(FindTaskIdByFunc(sub_80871D0));
    }
    return FALSE;
}

void sub_8087470(u8);
extern const bool8 (*gUnknown_0839F354[4])(struct Task *, struct MapObject *, struct Sprite *);
extern u8 sub_80608A4(u8);

void mapldr_080851BC(void)
{
    sub_8053E90();
    pal_fill_for_map_transition();
    ScriptContext2_Enable();
    gUnknown_0300485C = NULL;
    CreateTask(sub_8087470, 0);
}

void sub_8087470(u8 taskId)
{
    while (gUnknown_0839F354[gTasks[taskId].data[0]](&gTasks[taskId], &gMapObjects[gPlayerAvatar.mapObjectId], &gSprites[gPlayerAvatar.spriteId]));
}

bool8 sub_80874CC(struct Task *task, struct MapObject *mapObject, struct Sprite *sprite)
{
    CameraObjectReset2();
    FreezeMapObjects();
    gPlayerAvatar.unk6 = 1;
    mapObject->mapobj_bit_13 = 1;
    task->data[0]++;
    return FALSE;
}

bool8 sub_80874FC(struct Task *task, struct MapObject *mapObject, struct Sprite *sprite)
{
    if (sub_807D770())
    {
        gUnknown_0202FF84[0] = mapObject->coords2.x;
        gUnknown_0202FF84[1] = mapObject->coords2.y;
        gUnknown_0202FF84[2] = sprite->subpriority - 1;
        gUnknown_0202FF84[3] = sprite->oam.priority;
        task->data[1] = FieldEffectStart(FLDEFF_POP_OUT_OF_ASH);
        task->data[0]++;
    }
    return FALSE;
}

bool8 sub_8087548(struct Task *task, struct MapObject *mapObject, struct Sprite *sprite)
{
    sprite = &gSprites[task->data[1]];
    if (sprite->animCmdIndex > 1)
    {
        task->data[0]++;
        mapObject->mapobj_bit_13 = 0;
        CameraObjectReset1();
        PlaySE(SE_W091);
        FieldObjectSetSpecialAnim(mapObject, sub_80608A4(DIR_EAST));
    }
    return FALSE;
}

bool8 sub_808759C(struct Task *task, struct MapObject *mapObject, struct Sprite *sprite)
{
    if (FieldObjectClearAnimIfSpecialAnimFinished(mapObject))
    {
        gPlayerAvatar.unk6 = 0;
        ScriptContext2_Disable();
        UnfreezeMapObjects();
        DestroyTask(FindTaskIdByFunc(sub_8087470));
    }
    return FALSE;
}
