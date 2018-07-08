#include "global.h"
#include "battle.h"
#include "battle_anim.h"
#include "battle_anim_813F0F4.h"
#include "battle_interface.h"
#include "blend_palette.h"
#include "contest.h"
#include "data2.h"
#include "decompress.h"
#include "main.h"
#include "m4a.h"
#include "palette.h"
#include "pokemon.h"
#include "rom_8077ABC.h"
#include "rom_8094928.h"
#include "constants/songs.h"
#include "sound.h"
#include "constants/species.h"
#include "sprite.h"
#include "task.h"
#include "text.h"
#include "gba/m4a_internal.h"
#include "ewram.h"
#include "graphics.h"

extern u8 gBattleBufferA[][0x200];
extern u8 gActiveBattler;
extern u8 gBattlersCount;
extern u16 gBattlerPartyIndexes[];
extern u8 gBanksBySide[];
extern u8 gBankSpriteIds[];
extern u16 gUnknown_02024DE8;
extern u8 gDoingBattleAnim;
extern u32 gTransformedPersonalities[];
extern struct Window gUnknown_03004210;
extern void (*gBattleBankFunc[])(void);
extern u8 gHealthboxIDs[];
extern u8 gUnknown_0300434C[];
extern struct MusicPlayerInfo gMPlay_SE1;
extern struct MusicPlayerInfo gMPlay_SE2;
extern struct MusicPlayerInfo gMPlay_BGM;
extern u32 gBitTable[];
extern u16 gBattleTypeFlags;
extern u8 gBattleMonForms[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;
extern void (*gAnimScriptCallback)(void);
extern u8 gAnimScriptActive;
extern const u8 *const gBattleAnims_General[];
extern const u8 *const gBattleAnims_Special[];
extern const struct CompressedSpriteSheet gTrainerFrontPicTable[];
extern const struct MonCoords gTrainerFrontPicCoords[];
extern const struct CompressedSpritePalette gTrainerFrontPicPaletteTable[];
extern const struct CompressedSpriteSheet gUnknown_081FAF24;
extern const struct SpriteTemplate gSpriteTemplate_81FAF34;
extern const u8 gSubstituteDollTilemap[]; // graphics.s
extern const u8 gSubstituteDollGfx[]; // graphics.s
extern const u8 gSubstituteDollPal[]; // graphics.s
extern const u8 gUnknown_08D09C48[]; // graphics.s

const struct CompressedSpriteSheet gUnknown_0820A47C =
{ gBattleWindowLargeGfx, 4096, 0xd6ff };

const struct CompressedSpriteSheet gUnknown_0820A484 =
{ gBattleWindowSmallGfx, 4096, 0xd701 };

const struct CompressedSpriteSheet gUnknown_0820A48C[] =
{
    { gBattleWindowSmall2Gfx, 2048, 0xd6ff },
    { gBattleWindowSmall2Gfx, 2048, 0xd700 },
};

const struct CompressedSpriteSheet gUnknown_0820A49C[] =
{
    { gBattleWindowSmall3Gfx, 2048, 0xd701 },
    { gBattleWindowSmall3Gfx, 2048, 0xd702 },
};

const struct CompressedSpriteSheet gUnknown_0820A4AC =
{ gBattleWindowLarge2Gfx, 4096, 0xd70b };

const struct CompressedSpriteSheet gUnknown_0820A4B4[] =
{
    { gBlankGfxCompressed, 256, 0xd704 },
    { gBlankGfxCompressed, 288, 0xd705 },
    { gBlankGfxCompressed, 256, 0xd706 },
    { gBlankGfxCompressed, 288, 0xd707 },
};

const struct SpritePalette gUnknown_0820A4D4[] =
{
    { gUnknown_08D1212C, 0xD6FF },
    { gUnknown_08D1214C, 0xD704 },
};

extern void c3_0802FDF4(u8);
extern void sub_80440EC();
extern void sub_804777C();
extern u8 GetBattlerSpriteCoord();
extern u8 IsBankSpritePresent(u8);
extern u8 sub_8077F68(u8);
extern u8 sub_8077F7C(u8);
extern void sub_8094958(void);
extern void sub_80105DC(struct Sprite *);
extern void move_anim_start_t2();

void sub_80315E8(u8);
u8 sub_803163C(u8);
void sub_80316CC(u8);
void sub_8031F0C(void);
void refresh_graphics_maybe(u8, u8, u8);
void sub_80324E0(u8 a);
void sub_80327CC(void);
void sub_8032978(struct Sprite *);
void sub_80328A4(struct Sprite *);

void sub_80312F0(struct Sprite *sprite)
{
    u8 spriteId = sprite->data[1];

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
        sprite->pos2.x += sprite->data[0];
        if (sprite->pos2.x == 0)
            sprite->callback = SpriteCallbackDummy;
    }
}

void move_anim_start_t2_for_situation(u8 a, u32 b)
{
    ewram17810[gActiveBattler].unk0_4 = 1;
    if (a == 0)
    {
        if (b == 0x20)
            move_anim_start_t2(gActiveBattler, 6);
        else if (b == 8 || (b & 0x80))
            move_anim_start_t2(gActiveBattler, 0);
        else if (b == 0x10)
            move_anim_start_t2(gActiveBattler, 2);
        else if (b & 7)
            move_anim_start_t2(gActiveBattler, 4);
        else if (b == 0x40)
            move_anim_start_t2(gActiveBattler, 5);
        else
            ewram17810[gActiveBattler].unk0_4 = 0;
    }
    else
    {
        if (b & 0x000F0000)
            move_anim_start_t2(gActiveBattler, 3);
        else if (b & 7)
            move_anim_start_t2(gActiveBattler, 1);
        else if (b & 0x10000000)
            move_anim_start_t2(gActiveBattler, 7);
        else if (b & 0x08000000)
            move_anim_start_t2(gActiveBattler, 8);
        else if (b & 0x0000E000)
            move_anim_start_t2(gActiveBattler, 9);
        else
            ewram17810[gActiveBattler].unk0_4 = 0;
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
    if (ewram17800[a].substituteSprite && sub_803163C(d) == 0)
        return TRUE;
    if (ewram17800[a].substituteSprite && d == 2 && gSprites[gBankSpriteIds[a]].invisible)
    {
        refresh_graphics_maybe(a, 1, gBankSpriteIds[a]);
        sub_80324E0(a);
        return TRUE;
    }
    gAnimBankAttacker = b;
    gAnimBankTarget = c;
    ewram17840.unk0 = e;
    LaunchBattleAnimation(gBattleAnims_General, d, 0);
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

    gAnimBankAttacker = b;
    gAnimBankTarget = c;
    LaunchBattleAnimation(gBattleAnims_Special, d, 0);
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
        if (ewram17810[gActiveBattler].unk8 < 30)
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

void BattleLoadOpponentMonSprite(struct Pokemon *pkmn, u8 b)
{
    u32 personalityValue;
    u16 species;
    u32 r7;
    u32 otId;
    u8 var;
    u16 paletteOffset;
    const u8 *lzPaletteData;

    personalityValue = GetMonData(pkmn, MON_DATA_PERSONALITY);
    if (ewram17800[b].transformedSpecies == 0)
    {
        species = GetMonData(pkmn, MON_DATA_SPECIES);
        r7 = personalityValue;
    }
    else
    {
        species = ewram17800[b].transformedSpecies;
        r7 = gTransformedPersonalities[b];
    }
    otId = GetMonData(pkmn, MON_DATA_OT_ID);
    var = GetBattlerPosition(b);
    HandleLoadSpecialPokePic(
      &gMonFrontPicTable[species],
      gMonFrontPicCoords[species].coords,
      gMonFrontPicCoords[species].y_offset,
      eVoidSharedArr2,
      gUnknown_081FAF4C[var],
      species,
      r7);
    paletteOffset = 0x100 + b * 16;
    if (ewram17800[b].transformedSpecies == 0)
        lzPaletteData = GetMonSpritePal(pkmn);
    else
        lzPaletteData = GetMonSpritePalFromOtIdPersonality(species, otId, personalityValue);
    LZDecompressWram(lzPaletteData, gSharedMem);
    LoadPalette(gSharedMem, paletteOffset, 0x20);
    LoadPalette(gSharedMem, 0x80 + b * 16, 0x20);
    if (species == SPECIES_CASTFORM)
    {
        paletteOffset = 0x100 + b * 16;
        LZDecompressWram(lzPaletteData, ewram16400);
        LoadPalette(ewram16400 + gBattleMonForms[b] * 32, paletteOffset, 0x20);
    }
    if (ewram17800[b].transformedSpecies != 0)
    {
        BlendPalette(paletteOffset, 16, 6, RGB(31, 31, 31));
        CpuCopy32(gPlttBufferFaded + paletteOffset, gPlttBufferUnfaded + paletteOffset, 32);
    }
}

void BattleLoadPlayerMonSprite(struct Pokemon *pkmn, u8 b)
{
    u32 personalityValue;
    u16 species;
    u32 r7;
    u32 otId;
    u8 var;
    u16 paletteOffset;
    const u8 *lzPaletteData;

    personalityValue = GetMonData(pkmn, MON_DATA_PERSONALITY);
    if (ewram17800[b].transformedSpecies == 0)
    {
        species = GetMonData(pkmn, MON_DATA_SPECIES);
        r7 = personalityValue;
    }
    else
    {
        species = ewram17800[b].transformedSpecies;
        r7 = gTransformedPersonalities[b];
    }
    otId = GetMonData(pkmn, MON_DATA_OT_ID);
    var = GetBattlerPosition(b);
    HandleLoadSpecialPokePic(
      &gMonBackPicTable[species],
      gMonBackPicCoords[species].coords,
      gMonBackPicCoords[species].y_offset,
      eVoidSharedArr2,
      gUnknown_081FAF4C[var],
      species,
      r7);
    paletteOffset = 0x100 + b * 16;
    if (ewram17800[b].transformedSpecies == 0)
        lzPaletteData = GetMonSpritePal(pkmn);
    else
        lzPaletteData = GetMonSpritePalFromOtIdPersonality(species, otId, personalityValue);
    LZDecompressWram(lzPaletteData, gSharedMem);
    LoadPalette(gSharedMem, paletteOffset, 0x20);
    LoadPalette(gSharedMem, 0x80 + b * 16, 0x20);
    if (species == SPECIES_CASTFORM)
    {
        paletteOffset = 0x100 + b * 16;
        LZDecompressWram(lzPaletteData, ewram16400);
        LoadPalette(ewram16400 + gBattleMonForms[b] * 32, paletteOffset, 0x20);
    }
    if (ewram17800[b].transformedSpecies != 0)
    {
        BlendPalette(paletteOffset, 16, 6, RGB(31, 31, 31));
        CpuCopy32(gPlttBufferFaded + paletteOffset, gPlttBufferUnfaded + paletteOffset, 32);
    }
}

void unref_sub_8031A64(void)
{
}

void nullsub_9(u16 unused)
{
}

void sub_8031A6C(u16 a, u8 b)
{
    u8 status;
    struct CompressedSpriteSheet spriteSheet;

    status = GetBattlerPosition(b);
    DecompressPicFromTable_2(
      &gTrainerFrontPicTable[a],
      gTrainerFrontPicCoords[a].coords,
      gTrainerFrontPicCoords[a].y_offset,
      eVoidSharedArr,
      gUnknown_081FAF4C[status],
      0);
    spriteSheet.data = gUnknown_081FAF4C[status];
    spriteSheet.size = gTrainerFrontPicTable[a].size;
    spriteSheet.tag = gTrainerFrontPicTable[a].tag;
    LoadCompressedObjectPic(&spriteSheet);
    LoadCompressedObjectPalette(&gTrainerFrontPicPaletteTable[a]);
}

void LoadPlayerTrainerBankSprite(u16 a, u8 b)
{
    u8 status;

    status = GetBattlerPosition(b);
    DecompressPicFromTable_2(
      &gTrainerBackPicTable[a],
      gTrainerBackPicCoords[a].coords,
      gTrainerBackPicCoords[a].y_offset,
      eVoidSharedArr,
      gUnknown_081FAF4C[status],
      0);
    LoadCompressedPalette(gTrainerBackPicPaletteTable[a].data, 0x100 + b * 16, 32);
}

void nullsub_10(int unused)
{
}

void sub_8031B74(u16 a)
{
    FreeSpritePaletteByTag(gTrainerFrontPicPaletteTable[a].tag);
    FreeSpriteTilesByTag(gTrainerFrontPicTable[a].tag);
}

void unref_sub_8031BA0(void)
{
    u8 count;
    u8 i;

    LoadSpritePalette(&gUnknown_0820A4D4[0]);
    LoadSpritePalette(&gUnknown_0820A4D4[1]);
    if (!IsDoubleBattle())
    {
        LoadCompressedObjectPic(&gUnknown_0820A47C);
        LoadCompressedObjectPic(&gUnknown_0820A484);
        count = 2;
    }
    else
    {
        LoadCompressedObjectPic(&gUnknown_0820A48C[0]);
        LoadCompressedObjectPic(&gUnknown_0820A48C[1]);
        LoadCompressedObjectPic(&gUnknown_0820A49C[0]);
        LoadCompressedObjectPic(&gUnknown_0820A49C[1]);
        count = 4;
    }
    for (i = 0; i < count; i++)
        LoadCompressedObjectPic(&gUnknown_0820A4B4[gBanksBySide[i]]);
}

bool8 sub_8031C30(u8 a)
{
    bool8 retVal = FALSE;

    if (a != 0)
    {
        if (a == 1)
        {
            LoadSpritePalette(&gUnknown_0820A4D4[0]);
            LoadSpritePalette(&gUnknown_0820A4D4[1]);
        }
        else if (!IsDoubleBattle())
        {
            if (a == 2)
            {
                if (gBattleTypeFlags & 0x80)
                    LoadCompressedObjectPic(&gUnknown_0820A4AC);
                else
                    LoadCompressedObjectPic(&gUnknown_0820A47C);
            }
            else if (a == 3)
                LoadCompressedObjectPic(&gUnknown_0820A484);
            else if (a == 4)
                LoadCompressedObjectPic(&gUnknown_0820A4B4[gBanksBySide[0]]);
            else if (a == 5)
                LoadCompressedObjectPic(&gUnknown_0820A4B4[gBanksBySide[1]]);
            else
                retVal = TRUE;
        }
        else
        {
            if (a == 2)
                LoadCompressedObjectPic(&gUnknown_0820A48C[0]);
            else if (a == 3)
                LoadCompressedObjectPic(&gUnknown_0820A48C[1]);
            else if (a == 4)
                LoadCompressedObjectPic(&gUnknown_0820A49C[0]);
            else if (a == 5)
                LoadCompressedObjectPic(&gUnknown_0820A49C[1]);
            else if (a == 6)
                LoadCompressedObjectPic(&gUnknown_0820A4B4[gBanksBySide[0]]);
            else if (a == 7)
                LoadCompressedObjectPic(&gUnknown_0820A4B4[gBanksBySide[1]]);
            else if (a == 8)
                LoadCompressedObjectPic(&gUnknown_0820A4B4[gBanksBySide[2]]);
            else if (a == 9)
                LoadCompressedObjectPic(&gUnknown_0820A4B4[gBanksBySide[3]]);
            else
                retVal = TRUE;
        }
    }
    return retVal;
}

void load_gfxc_health_bar(u8 a)
{
    LZDecompressWram(gUnknown_08D09C48, eVoidSharedArr);
}

u8 battle_load_something(u8 *pState, u8 *b)
{
    bool8 retVal = FALSE;

    switch (*pState)
    {
    case 0:
        sub_8031F0C();
        (*pState)++;
        break;
    case 1:
        if (sub_8031C30(*b) == 0)
        {
            (*b)++;
        }
        else
        {
            *b = 0;
            (*pState)++;
        }
        break;
    case 2:
        (*pState)++;
        break;
    case 3:
        if ((gBattleTypeFlags & 0x80) && *b == 0)
            gHealthboxIDs[*b] = battle_make_oam_safari_battle();
        else
            gHealthboxIDs[*b] = battle_make_oam_normal_battle(*b);
        (*b)++;
        if (*b == gBattlersCount)
        {
            *b = 0;
            (*pState)++;
        }
        break;
    case 4:
        sub_8043F44(*b);
        if (gBanksBySide[*b] <= 1)
            nullsub_11(gHealthboxIDs[*b], 0);
        else
            nullsub_11(gHealthboxIDs[*b], 1);
        (*b)++;
        if (*b == gBattlersCount)
        {
            *b = 0;
            (*pState)++;
        }
        break;
    case 5:
        if (GetBattlerSide(*b) == 0)
        {
            if (!(gBattleTypeFlags & 0x80))
                sub_8045A5C(gHealthboxIDs[*b], &gPlayerParty[gBattlerPartyIndexes[*b]], 0);
        }
        else
        {
            sub_8045A5C(gHealthboxIDs[*b], &gEnemyParty[gBattlerPartyIndexes[*b]], 0);
        }
        sub_8043DB0(gHealthboxIDs[*b]);
        (*b)++;
        if (*b == gBattlersCount)
        {
            *b = 0;
            (*pState)++;
        }
        break;
    case 6:
        sub_80327CC();
        sub_8094958();
        retVal = TRUE;
        break;
    }
    return retVal;
}

void sub_8031EE8(void)
{
    memset(ewram17810, 0, 0x30);
    memset(&ewram17840, 0, 0x10);
}

void sub_8031F0C(void)
{
    sub_8031EE8();
    memset(ewram17800, 0, 0x10);
}

void sub_8031F24(void)
{
    s32 i;

    for (i = 0; i < gBattlersCount; i++)
        ewram17800[i].invisible = gSprites[gBankSpriteIds[i]].invisible;
}

void sub_8031F88(u8 a)
{
    ewram17800[a].invisible = gSprites[gBankSpriteIds[a]].invisible;
}

void sub_8031FC4(u8 a, u8 b, bool8 c)
{
    u16 paletteOffset;
    u16 species;
    u32 personalityValue;
    u32 otId;
    u8 r10;
    const u8 *lzPaletteData;

    if (c)
    {
        StartSpriteAnim(&gSprites[gBankSpriteIds[a]], ewram17840.unk0);
        paletteOffset = 0x100 + a * 16;
        LoadPalette(ewram16400 + ewram17840.unk0 * 32, paletteOffset, 32);
        gBattleMonForms[a] = ewram17840.unk0;
        if (ewram17800[a].transformedSpecies != 0)
        {
            BlendPalette(paletteOffset, 16, 6, RGB(31, 31, 31));
            CpuCopy32(gPlttBufferFaded + paletteOffset, gPlttBufferUnfaded + paletteOffset, 32);
        }
        gSprites[gBankSpriteIds[a]].pos1.y = sub_8077F68(a);
    }
    else
    {
        if (IsContest())
        {
            r10 = 0;
            species = shared19348.unk2;
            personalityValue = shared19348.unk8;
            otId = shared19348.unkC;
            HandleLoadSpecialPokePic(
              &gMonBackPicTable[species],
              gMonBackPicCoords[species].coords,
              gMonBackPicCoords[species].y_offset,
              eVoidSharedArr2,
              gUnknown_081FAF4C[0],
              species,
              shared19348.unk10);
        }
        else
        {
            r10 = GetBattlerPosition(a);
            if (GetBattlerSide(b) == 1)
                species = GetMonData(&gEnemyParty[gBattlerPartyIndexes[b]], MON_DATA_SPECIES);
            else
                species = GetMonData(&gPlayerParty[gBattlerPartyIndexes[b]], MON_DATA_SPECIES);
            if (GetBattlerSide(a) == 0)
            {
                personalityValue = GetMonData(&gPlayerParty[gBattlerPartyIndexes[a]], MON_DATA_PERSONALITY);
                otId = GetMonData(&gPlayerParty[gBattlerPartyIndexes[a]], MON_DATA_OT_ID);
                HandleLoadSpecialPokePic(
                  &gMonBackPicTable[species],
                  gMonBackPicCoords[species].coords,
                  gMonBackPicCoords[species].y_offset,
                  eVoidSharedArr2,
                  gUnknown_081FAF4C[r10],
                  species,
                  gTransformedPersonalities[a]);
            }
            else
            {
                personalityValue = GetMonData(&gEnemyParty[gBattlerPartyIndexes[a]], MON_DATA_PERSONALITY);
                otId = GetMonData(&gEnemyParty[gBattlerPartyIndexes[a]], MON_DATA_OT_ID);
                HandleLoadSpecialPokePic(
                  &gMonFrontPicTable[species],
                  gMonFrontPicCoords[species].coords,
                  gMonFrontPicCoords[species].y_offset,
                  eVoidSharedArr2,
                  gUnknown_081FAF4C[r10],
                  species,
                  gTransformedPersonalities[a]);
            }
        }
        DmaCopy32Defvars(3, gUnknown_081FAF4C[r10], (void *)(VRAM + 0x10000 + gSprites[gBankSpriteIds[a]].oam.tileNum * 32), 0x800);
        paletteOffset = 0x100 + a * 16;
        lzPaletteData = GetMonSpritePalFromOtIdPersonality(species, otId, personalityValue);
        LZDecompressWram(lzPaletteData, gSharedMem);
        LoadPalette(gSharedMem, paletteOffset, 32);
        if (species == SPECIES_CASTFORM)
        {
            u16 *paletteSrc = (u16 *)ewram16400; // TODO: avoid casting?

            LZDecompressWram(lzPaletteData, paletteSrc);
            LoadPalette(paletteSrc + gBattleMonForms[b] * 16, paletteOffset, 32);
        }
        BlendPalette(paletteOffset, 16, 6, RGB(31, 31, 31));
        CpuCopy32(gPlttBufferFaded + paletteOffset, gPlttBufferUnfaded + paletteOffset, 32);
        if (!IsContest())
        {
            ewram17800[a].transformedSpecies = species;
            gBattleMonForms[a] = gBattleMonForms[b];
        }
        gSprites[gBankSpriteIds[a]].pos1.y = sub_8077F68(a);
        StartSpriteAnim(&gSprites[gBankSpriteIds[a]], gBattleMonForms[a]);
    }
}

void BattleLoadSubstituteSprite(u8 a, u8 b)
{
    u8 r4;
    u16 foo;
    const u8 *gSubstituteDollPal_;
    void *src;
    s32 i;

    if (b == 0)
    {
        if (IsContest())
            r4 = 0;
        else
            r4 = GetBattlerPosition(a);
        if (IsContest())
            LZDecompressVram(gSubstituteDollTilemap, gUnknown_081FAF4C[r4]);
        else if (GetBattlerSide(a) != 0)
            LZDecompressVram(gSubstituteDollGfx, gUnknown_081FAF4C[r4]);
        else
            LZDecompressVram(gSubstituteDollTilemap, gUnknown_081FAF4C[r4]);
        // There is probably a way to do this without all the temp variables, but I couldn't figure it out.
        foo = a * 16;
        gSubstituteDollPal_ = gSubstituteDollPal;
        src = gUnknown_081FAF4C[r4];
        for (i = 0; i < 3; i++)
            DmaCopy32(3, src, src + i * 0x800 + 0x800, 0x800);
        LoadCompressedPalette(gSubstituteDollPal_, 0x100 + foo, 32);
    }
    else
    {
        if (!IsContest())
        {
            if (GetBattlerSide(a) != 0)
                BattleLoadOpponentMonSprite(&gEnemyParty[gBattlerPartyIndexes[a]], a);
            else
                BattleLoadPlayerMonSprite(&gPlayerParty[gBattlerPartyIndexes[a]], a);
        }
    }
}

void refresh_graphics_maybe(u8 a, u8 b, u8 spriteId)
{
    BattleLoadSubstituteSprite(a, b);
    StartSpriteAnim(&gSprites[spriteId], gBattleMonForms[a]);
    if (b == 0)
        gSprites[spriteId].pos1.y = sub_8077F7C(a);
    else
        gSprites[spriteId].pos1.y = sub_8077F68(a);
}

void sub_80324BC(u8 a, u16 b)
{
    if (b == 0xA4)
        ewram17800[a].substituteSprite = 1;
}

void sub_80324E0(u8 a)
{
    ewram17800[a].substituteSprite = 0;
}

void HandleLowHpMusicChange(struct Pokemon *pkmn, u8 b)
{
    u16 hp = GetMonData(pkmn, MON_DATA_HP);
    u16 maxHP = GetMonData(pkmn, MON_DATA_MAX_HP);

    if (GetHPBarLevel(hp, maxHP) == 1)
    {
        if (!ewram17800[b].unk0_1)
        {
            if (!ewram17800[b ^ 2].unk0_1)
                PlaySE(SE_HINSI);
            ewram17800[b].unk0_1 = 1;
        }
    }
    else
    {
        ewram17800[b].unk0_1 = 0;
        if (!IsDoubleBattle())
        {
            m4aSongNumStop(SE_HINSI);
            return;
        }
        if (IsDoubleBattle() && !ewram17800[b ^ 2].unk0_1)
        {
            m4aSongNumStop(SE_HINSI);
            return;
        }
    }
}

void BattleStopLowHpSound(void)
{
    u8 r4 = GetBattlerAtPosition(0);

    ewram17800[r4].unk0_1 = 0;
    if (IsDoubleBattle())
        ewram17800[r4 ^ 2].unk0_1 = 0;
    m4aSongNumStop(SE_HINSI);
}

u8 unref_sub_8032604(struct Pokemon *pkmn)
{
    u16 hp = GetMonData(pkmn, MON_DATA_HP);
    u16 maxHP = GetMonData(pkmn, MON_DATA_MAX_HP);

    return GetHPBarLevel(hp, maxHP);
}

void sub_8032638(void)
{
    if (gMain.inBattle)
    {
        u8 r8 = GetBattlerAtPosition(0);
        u8 r9 = GetBattlerAtPosition(2);
        u8 r4 = pokemon_order_func(gBattlerPartyIndexes[r8]);
        u8 r5 = pokemon_order_func(gBattlerPartyIndexes[r9]);

        if (GetMonData(&gPlayerParty[r4], MON_DATA_HP) != 0)
            HandleLowHpMusicChange(&gPlayerParty[r4], r8);
        if (IsDoubleBattle())
        {
            if (GetMonData(&gPlayerParty[r5], MON_DATA_HP) != 0)
                HandleLowHpMusicChange(&gPlayerParty[r5], r9);
        }
    }
}

void sub_80326EC(u8 a)
{
    s32 i;

    for (i = 0; i < gBattlersCount; i++)
    {
        if (IsBankSpritePresent(i) != 0)
        {
            gSprites[gBankSpriteIds[i]].oam.affineMode = a;
            if (a == 0)
            {
                ewram17810[i].unk6 = gSprites[gBankSpriteIds[i]].oam.matrixNum;
                gSprites[gBankSpriteIds[i]].oam.matrixNum = 0;
            }
            else
            {
                gSprites[gBankSpriteIds[i]].oam.matrixNum = ewram17810[i].unk6;
            }
        }
    }
}

void sub_80327CC(void)
{
    u8 r5;

    LoadCompressedObjectPic(&gUnknown_081FAF24);
    r5 = GetBattlerAtPosition(1);
    ewram17810[r5].unk7 = CreateSprite(&gSpriteTemplate_81FAF34, GetBattlerSpriteCoord(r5, 0), GetBattlerSpriteCoord(r5, 1) + 32, 0xC8);
    gSprites[ewram17810[r5].unk7].data[0] = r5;
    if (IsDoubleBattle())
    {
        r5 = GetBattlerAtPosition(3);
        ewram17810[r5].unk7 = CreateSprite(&gSpriteTemplate_81FAF34, GetBattlerSpriteCoord(r5, 0), GetBattlerSpriteCoord(r5, 1) + 32, 0xC8);
        gSprites[ewram17810[r5].unk7].data[0] = r5;
    }
}

void sub_80328A4(struct Sprite *sprite)
{
    bool8 invisible = FALSE;
    u8 r4 = sprite->data[0];
    struct Sprite *r7 = &gSprites[gBankSpriteIds[r4]];

    if (!r7->inUse || IsBankSpritePresent(r4) == 0)
    {
        sprite->callback = sub_8032978;
        return;
    }
    if (gAnimScriptActive || r7->invisible)
        invisible = TRUE;
    else if (ewram17800[r4].transformedSpecies != 0 && gEnemyMonElevation[ewram17800[r4].transformedSpecies] == 0)
        invisible = TRUE;
    if (ewram17800[r4].substituteSprite)
        invisible = TRUE;
    sprite->pos1.x = r7->pos1.x;
    sprite->pos2.x = r7->pos2.x;
    sprite->invisible = invisible;
}

void sub_8032978(struct Sprite *sprite)
{
    sprite->invisible = TRUE;
}

void sub_8032984(u8 a, u16 b)
{
    if (GetBattlerSide(a) != 0)
    {
        if (ewram17800[a].transformedSpecies != 0)
            b = ewram17800[a].transformedSpecies;
        if (gEnemyMonElevation[b] != 0)
            gSprites[ewram17810[a].unk7].callback = sub_80328A4;
        else
            gSprites[ewram17810[a].unk7].callback = sub_8032978;
    }
}

void sub_8032A08(u8 a)
{
    gSprites[ewram17810[a].unk7].callback = sub_8032978;
}

void sub_8032A38(void)
{
    u16 *ptr = (u16 *)(VRAM + 0x240);
    s32 i;
    s32 j;

    for (i = 0; i < 9; i++)
    {
        for (j = 0; j < 16; j++)
        {
            if (!(*ptr & 0xF000))
                *ptr |= 0xF000;
            if (!(*ptr & 0x0F00))
                *ptr |= 0x0F00;
            if (!(*ptr & 0x00F0))
                *ptr |= 0x00F0;
            if (!(*ptr & 0x000F))
                *ptr |= 0x000F;
            ptr++;
        }
    }
}

void sub_8032AA8(u8 a, u8 b)
{
    ewram17800[a].transformedSpecies = 0;
    gBattleMonForms[a] = 0;
    if (b == 0)
        sub_80324E0(a);
}
