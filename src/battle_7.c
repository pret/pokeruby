#include "global.h"
#include "asm.h"
// Include this when my other PR gets merged
//#include "battle.h"
#include "battle_anim.h"
#include "blend_palette.h"
#include "data2.h"
#include "decompress.h"
#include "palette.h"
#include "pokemon.h"
#include "sound.h"
#include "species.h"
#include "sprite.h"
#include "task.h"
#include "gba/m4a_internal.h"

// Probably the same one from battle_811DA74.c
struct UnknownStruct2_
{
    u8 unk0_0:1;
    u8 unk0_1:2;
    u8 unk0_3:1;
    u8 unk0_4:1;
    u8 unk0_5:1;
    u8 unk0_6:1;
    u8 unk0_7:1;
    u8 unk1_0:1;
    u8 filler2[2];
    u8 unk4;
    u8 unk5;
    u8 filler6[2];
    u8 unk8;
    u8 unk9;
    u8 fillerA[2];
};

struct UnknownStruct4
{
    u8 unk0_0:2;
    u8 unk0_2:1;
    u8 unk0_3:1;
    u16 unk2;
};

struct UnknownStruct6
{
    u16 unk0;
    u8 filler2[7];
    u8 unk9;
};

extern u8 ewram[];

#define ewram17800 ((struct UnknownStruct4 *)(ewram + 0x17800))
#define ewram17810 ((struct UnknownStruct2_ *)(ewram + 0x17810))
#define ewram17840 (*(struct UnknownStruct6 *)(ewram + 0x17840))

extern struct MusicPlayerInfo gMPlay_SE1;
extern struct MusicPlayerInfo gMPlay_SE2;
extern u8 gUnknown_02024A60;
extern u8 gUnknown_02024BE0[];
extern u16 gUnknown_02024DE8;
extern u32 gUnknown_02024E70[];
extern u8 gBattleMonForms[];
extern u8 gBattleAnimPlayerMonIndex;
extern u8 gBattleAnimEnemyMonIndex;
extern void (*gAnimScriptCallback)(void);
extern u8 gAnimScriptActive;
extern const u8 *const gBattleAnims_Unknown1[];
extern const u8 *const gBattleAnims_Unknown2[];

extern const u16 *pokemon_get_pal(struct Pokemon *);
extern void sub_80105DC(struct Sprite *);
extern void move_anim_start_t2();
extern void refresh_graphics_maybe();
extern void sub_80324E0();
extern const u16 *species_and_otid_get_pal();

void sub_80315E8(u8);
u8 sub_803163C(u8);
void sub_80316CC(u8);

void sub_80312F0(struct Sprite *sprite)
{
    u8 spriteId = sprite->data1;

    if (gSprites[spriteId].affineAnimEnded && !gSprites[spriteId].invisible)
    {
        if (gSprites[spriteId].animPaused)
            gSprites[spriteId].animPaused = FALSE;
        else if (gSprites[spriteId].animEnded)
        {
            gSprites[spriteId].callback = sub_80105DC;
            StartSpriteAffineAnim(&gSprites[spriteId], 0);
            sprite->callback = SpriteCallbackDummy;
        }
    }
}

void unref_sub_8031364(struct Sprite *sprite, bool8 stupid)
{
    sprite->animPaused = TRUE;
    sprite->callback = SpriteCallbackDummy;
    if (!stupid)
        StartSpriteAffineAnim(sprite, 1);
    else
        StartSpriteAffineAnim(sprite, 1);
    AnimateSprite(sprite);
}

void sub_80313A0(struct Sprite *sprite)
{
    if (!(gUnknown_02024DE8 & 1))
    {
        sprite->pos2.x += sprite->data0;
        if (sprite->pos2.x == 0)
            sprite->callback = SpriteCallbackDummy;
    }
}

void move_anim_start_t2_for_situation(u8 a, u32 b)
{
    ewram17810[gUnknown_02024A60].unk0_4 = 1;
    if (a == 0)
    {
        if (b == 0x20)
            move_anim_start_t2(gUnknown_02024A60, 6);
        else if (b == 8 || (b & 0x80))
            move_anim_start_t2(gUnknown_02024A60, 0);
        else if (b == 0x10)
            move_anim_start_t2(gUnknown_02024A60, 2);
        else if (b & 7)
            move_anim_start_t2(gUnknown_02024A60, 4);
        else if (b == 0x40)
            move_anim_start_t2(gUnknown_02024A60, 5);
        else
            ewram17810[gUnknown_02024A60].unk0_4 = 0;
    }
    else
    {
        if (b & 0x000F0000)
            move_anim_start_t2(gUnknown_02024A60, 3);
        else if (b & 7)
            move_anim_start_t2(gUnknown_02024A60, 1);
        else if (b & 0x10000000)
            move_anim_start_t2(gUnknown_02024A60, 7);
        else if (b & 0x08000000)
            move_anim_start_t2(gUnknown_02024A60, 8);
        else if (b & 0x0000E000)
            move_anim_start_t2(gUnknown_02024A60, 9);
        else
            ewram17810[gUnknown_02024A60].unk0_4 = 0;
    }
}

bool8 move_anim_start_t3(u8 a, u8 b, u8 c, u8 d, u16 e)
{
    u8 taskId;

    if (d == 0 && (e & 0x80))
    {
        gBattleMonForms[a] = e & 0x7F;
        return TRUE;
    }
    if (ewram17800[a].unk0_2 && sub_803163C(d) == 0)
        return TRUE;
    if (ewram17800[a].unk0_2 && d == 2 && gSprites[gUnknown_02024BE0[a]].invisible)
    {
        refresh_graphics_maybe(a, 1, gUnknown_02024BE0[a]);
        sub_80324E0(a);
        return TRUE;
    }
    gBattleAnimPlayerMonIndex = b;
    gBattleAnimEnemyMonIndex = c;
    ewram17840.unk0 = e;
    DoMoveAnim(gBattleAnims_Unknown1, d, 0);
    taskId = CreateTask(sub_80315E8, 10);
    gTasks[taskId].data[0] = a;
    ewram17810[gTasks[taskId].data[0]].unk0_5 = 1;
    return FALSE;
}

void sub_80315E8(u8 taskId)
{
    gAnimScriptCallback();
    if (!gAnimScriptActive)
    {
        ewram17810[gTasks[taskId].data[0]].unk0_5 = 0;
        DestroyTask(taskId);
    }
}

u8 sub_803163C(u8 a)
{
    switch (a)
    {
    case 2:
    case 10:
    case 11:
    case 12:
    case 13:
    case 17:
        return 1;
    default:
        return 0;
    }
}

void move_anim_start_t4(u8 a, u8 b, u8 c, u8 d)
{
    u8 taskId;

    gBattleAnimPlayerMonIndex = b;
    gBattleAnimEnemyMonIndex = c;
    DoMoveAnim(gBattleAnims_Unknown2, d, 0);
    taskId = CreateTask(sub_80316CC, 10);
    gTasks[taskId].data[0] = a;
    ewram17810[gTasks[taskId].data[0]].unk0_6 = 1;
}

void sub_80316CC(u8 taskId)
{
    gAnimScriptCallback();
    if (!gAnimScriptActive)
    {
        ewram17810[gTasks[taskId].data[0]].unk0_6 = 0;
        DestroyTask(taskId);
    }
}

u8 sub_8031720(int unused1, int unused2)
{
    return 0;
}

bool8 mplay_80342A4(u8 a)
{
    u8 zero = 0;

    if (IsSEPlaying())
    {
        ewram17810[a].unk8++;
        if (ewram17810[gUnknown_02024A60].unk8 < 30)
            return TRUE;
        m4aMPlayStop(&gMPlay_SE1);
        m4aMPlayStop(&gMPlay_SE2);
    }
    if (zero == 0)
    {
        ewram17810[a].unk8 = 0;
        return FALSE;
    }
    return TRUE;
}

void sub_8031794(struct Pokemon *pkmn, u8 b)
{
    u32 personalityValue;
    u16 species;
    u32 r7;
    u32 otId;
    u8 var;
    u16 paletteOffset;
    const u16 *palette;

    personalityValue = GetMonData(pkmn, MON_DATA_PERSONALITY);
    if (ewram17800[b].unk2 == 0)
    {
        species = GetMonData(pkmn, MON_DATA_SPECIES);
        r7 = personalityValue;
    }
    else
    {
        species = ewram17800[b].unk2;
        r7 = gUnknown_02024E70[b];
    }
    otId = GetMonData(pkmn, MON_DATA_OT_ID);
    var = battle_get_per_side_status(b);
    HandleLoadSpecialPokePic(
      &gMonFrontPicTable[species],
      gMonFrontPicCoords[species].coords,
      gMonFrontPicCoords[species].y_offset,
      0x02000000,
      gUnknown_081FAF4C[var],
      species,
      r7);
    paletteOffset = 0x100 + b * 16;
    if (ewram17800[b].unk2 == 0)
        palette = pokemon_get_pal(pkmn);
    else
        palette = species_and_otid_get_pal(species, otId, personalityValue);
    sub_800D238(palette, ewram);
    LoadPalette(ewram, paletteOffset, 0x20);
    LoadPalette(ewram, 0x80 + b * 16, 0x20);
    if (species == SPECIES_CASTFORM)
    {
        paletteOffset = 0x100 + b * 16;
        sub_800D238(palette, ewram + 0x16400);
        LoadPalette(ewram + 0x16400 + gBattleMonForms[b] * 32, paletteOffset, 0x20);
    }
    if (ewram17800[b].unk2 != 0)
    {
        BlendPalette(paletteOffset, 16, 6, 0x7FFF);
        CpuCopy32(gPlttBufferFaded + paletteOffset, gPlttBufferUnfaded + paletteOffset, 32);
    }
}
