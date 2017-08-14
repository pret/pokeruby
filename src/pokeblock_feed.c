#include "global.h"
#include "task.h"
#include "palette.h"
#include "main.h"
#include "menu_helpers.h"
#include "text.h"
#include "text_window.h"
#include "menu.h"
#include "rom4.h"
#include "decompress.h"
#include "data2.h"
#include "sprite.h"
#include "item_use.h"
#include "pokeblock.h"
#include "party_menu.h"
#include "strings.h"
#include "string_util.h"
#include "m4a.h"
#include "field_effect.h"
#include "sound.h"
#include "trig.h"

extern u8 ewram[];
extern struct MusicPlayerInfo gMPlay_BGM;
extern u8 gPokeblockMonID;
extern s16 gPokeblockGain;
extern struct CompressedSpritePalette sPokeblockFeedSpritePal;

void sub_8147F4C(u8 taskID);
bool8 sub_8040A3C(u16 species);

// IWRAM common

extern const struct CompressedSpriteSheet gUnknown_083F7F74;
extern const struct CompressedSpriteSheet gUnknown_084121DC;
extern const struct CompressedSpritePalette gUnknown_083F7F7C;
extern const u8 gBattleTerrainTiles_Building[];
extern const u8 gUnknown_08E782FC[];
extern const u8 gBattleTerrainPalette_BattleTower[];
extern const u8* const gUnknown_084120A4[];
extern const union AffineAnimCmd* const gSpriteAffineAnimTable_84120EC[];
extern const union AffineAnimCmd* const gSpriteAffineAnimTable_84121A0[];
extern const union AffineAnimCmd* const gSpriteAffineAnimTable_84121A4[];
extern const union AffineAnimCmd* const gSpriteAffineAnimTable_84121A8[];
extern const union AffineAnimCmd* const gSpriteAffineAnimTable_8412050[];
extern const struct SpriteTemplate gSpriteTemplate_84121E4;
extern const u8 gNatureToMonPokeblockAnim[][2];
extern const s16 gMonPokeblockAnims[][10];

// this file's functions
void sub_8147B04(void);
void sub_81481DC(void);
void sub_814825C(void);
u8 sub_81480B4(void);
u8 sub_814817C(void);
u8 sub_8147F84(struct Pokemon* mon);
bool8 sub_8147B20(struct Pokemon* mon);
void sub_8147DDC(u8);
void sub_8148044(u8);
void sub_8148078(struct Sprite* sprite);
void Task_PrintAtePokeblockText(u8 taskID);
void SetPokeblockFeedSpritePal(u8);
void sub_8148108(u8, bool8);
bool8 sub_8148540(void);
bool8 sub_81485CC(void);
static bool8 FreePokeSpriteMatrix(void);
void sub_8148710(void);
void sub_814862C(void);

void sub_8147890(void)
{
    AnimateSprites();
    BuildOamBuffer();
    RunTasks();
    UpdatePaletteFade();
}

void sub_81478A8(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

bool8 sub_81478BC(void)
{
    switch (gMain.state)
    {
    case 0:
        sub_80F9438();
        sub_80F9368();
        sub_8147B04();
        gMain.state++;
        break;
    case 1:
        ResetPaletteFade();
        gPaletteFade.bufferTransferDisabled = 1;
        gMain.state++;
        break;
    case 2:
        ResetSpriteData();
        gMain.state++;
        break;
    case 3:
        FreeAllSpritePalettes();
        gMain.state++;
        break;
    case 4:
        SetUpWindowConfig(&gWindowConfig_81E6E50);
        gMain.state++;
        break;
    case 5:
        MultistepInitMenuWindowBegin(&gWindowConfig_81E6E50);
        gMain.state++;
        break;
    case 6:
        if (MultistepInitMenuWindowContinue())
        {
            ewram[0x1FFFF] = 0;
            gMain.state++;
        }
        break;
    case 7:
        if (sub_8147B20(&gPlayerParty[gPokeblockMonID]))
        {
            gMain.state++;
        }
        break;
    case 8:
        ewram[0x1FFFD] = sub_81480B4();
        gMain.state++;
        break;
    case 9:
        ewram[0x1FFFE] = sub_8147F84(&gPlayerParty[gPokeblockMonID]);
        gMain.state++;
        break;
    case 10:
        MenuDrawTextWindow(0, 14, 29, 19);
        gMain.state++;
        break;
    case 11:
        if (sub_8055870() != 1)
        {
            gMain.state++;
        }
        break;
    case 12:
        {
            u16 savedIME = REG_IME;
            REG_IME = 0;
            REG_IE |= 1;
            REG_IME = savedIME;
            REG_DISPSTAT |= 8;
            SetVBlankCallback(sub_81478A8);
            gMain.state++;
        }
    case 13:
        BeginNormalPaletteFade(-1, 0, 0x10, 0, 0);
        gPaletteFade.bufferTransferDisabled = 0;
        SetMainCallback2(sub_8147890);
        return 1;
    }
    return 0;
}

void sub_8147ADC(void)
{
    while (1)
    {
        if (sub_81478BC() == 1)
        {
            sub_8147DDC(1);
            break;
        }
        if (sub_80F9344() == 1)
            break;
    }
}

void sub_8147B04(void)
{
    REG_BG1CNT = 0x1D02l;
    REG_DISPCNT = 0x1340;
}

bool8 sub_8147B20(struct Pokemon* mon)
{
    u16 species;
    u32 PiD, TiD;
    switch (ewram[0x1FFFF])
    {
    case 0:
        species = GetMonData(mon, MON_DATA_SPECIES2);
        PiD = GetMonData(mon, MON_DATA_PERSONALITY);
        HandleLoadSpecialPokePic(&gMonFrontPicTable[species], gMonFrontPicCoords[species].coords, gMonFrontPicCoords[species].y_offset, 0x2000000, gUnknown_081FAF4C[1], species, PiD);
        ewram[0x1FFFF]++;
        break;
    case 1:
        {
            const struct CompressedSpritePalette* palette;

            species = GetMonData(mon, MON_DATA_SPECIES2);
            PiD = GetMonData(mon, MON_DATA_PERSONALITY);
            TiD = GetMonData(mon, MON_DATA_OT_ID);
            palette = sub_80409C8(species, TiD, PiD);
            LoadCompressedObjectPalette(palette);
            GetMonSpriteTemplate_803C56C(palette->tag, 1);
            ewram[0x1FFFF]++;
        }
        break;
    case 2:
        LoadCompressedObjectPic(&gUnknown_083F7F74);
        ewram[0x1FFFF]++;
        break;
    case 3:
        LoadCompressedObjectPalette(&gUnknown_083F7F7C);
        ewram[0x1FFFF]++;
        break;
    case 4:
        LoadCompressedObjectPic(&gUnknown_084121DC);
        ewram[0x1FFFF]++;
        break;
    case 5:
        SetPokeblockFeedSpritePal(gScriptItemId);
        LoadCompressedObjectPalette(&sPokeblockFeedSpritePal);
        ewram[0x1FFFF]++;
        break;
    case 6:
        LZDecompressVram(gBattleTerrainTiles_Building, (void*)(VRAM));
        ewram[0x1FFFF]++;
        break;
    case 7:
        LZDecompressVram(gUnknown_08E782FC, (void*)(VRAM + 0xE800));
        ewram[0x1FFFF]++;
        break;
    case 8:
        LoadCompressedPalette(gBattleTerrainPalette_BattleTower, 0x20, 0x60);
        ewram[0x1FFFF] = 0;
        return 1;
    }
    return 0;
}

void SetPokeblockFeedSpritePal(u8 pkbID)
{
    u8 color = GetPokeblockData(&gSaveBlock1.pokeblocks[pkbID], PBLOCK_COLOR);
    sPokeblockFeedSpritePal.data = gUnknown_084120A4[color - 1];
    sPokeblockFeedSpritePal.tag = 0x39E2;
}

extern u16 gUnknown_03005F94;
extern u16 gUnknown_03005F34;
extern u8 gUnknown_03005F3C;

void sub_8147CC8(u8 taskID)
{
    if (!gPaletteFade.active)
    {
        switch (gTasks[taskID].data[0])
        {
        case 0:
            gUnknown_03005F3C = 0;
            gUnknown_03005F94 = 0;
            sub_81481DC();
            break;
        case 255:
            sub_8148108(ewram[0x1FFFD], gTasks[taskID].data[1]);
            break;
        case 269:
            ewram[0x1FFFC] = sub_814817C();
            break;
        case 281:
            sub_8148044(ewram[0x1FFFE]);
            break;
        case 297:
            gTasks[taskID].func = Task_PrintAtePokeblockText;
            return;
        }
        if (gUnknown_03005F94 < gUnknown_03005F34)
            sub_814825C();
        else if (gUnknown_03005F94 == gUnknown_03005F34)
            gTasks[taskID].data[0] = 254;

        gUnknown_03005F94++;
        gTasks[taskID].data[0]++;
    }
}

void sub_8147DDC(u8 a0)
{
    u8 taskID = CreateTask(sub_8147CC8, 0);
    gTasks[taskID].data[0] = 0;
    gTasks[taskID].data[1] = a0;
}

void sub_8147E10(u8 taskID)
{
    if (MenuUpdateWindowText() == 1)
        gTasks[taskID].func = sub_8147F4C;
}

void Task_PrintAtePokeblockText(u8 taskID)
{
    struct Pokemon* mon = &gPlayerParty[gPokeblockMonID];
    struct Pokeblock* pokeblock = &gSaveBlock1.pokeblocks[gScriptItemId];

    gPokeblockGain = PokeblockGetGain(GetNature(mon), pokeblock);
    GetMonNickname(mon, gStringVar1);
    PokeblockCopyName(pokeblock, gStringVar2);

    if (gPokeblockGain == 0)
        StringExpandPlaceholders(gStringVar4, gContestStatsText_NormallyAte);
    else if (gPokeblockGain > 0)
        StringExpandPlaceholders(gStringVar4, gContestStatsText_HappilyAte);
    else
        StringExpandPlaceholders(gStringVar4, gContestStatsText_DisdainfullyAte);

    MenuPrintMessage(gStringVar4, 1, 15);
    gTasks[taskID].func = sub_8147E10;
}

void sub_8147F08(u8 taskID)
{
    if (!gPaletteFade.active)
    {
        m4aMPlayVolumeControl(&gMPlay_BGM, -1, 256);
        SetMainCallback2(gMain.savedCallback);
        DestroyTask(taskID);
    }
}

void sub_8147F4C(u8 taskID)
{
    BeginNormalPaletteFade(-1, 0, 0, 0x10, 0);
    gTasks[taskID].func = sub_8147F08;
}

extern u16 gPokeblockFeedMonSpecies;
extern u8 gPokeblockFeedMonSpriteID;
extern u8 gPokeblockFeedMonNature;
extern bool8 gPokeblockMonNotFlipped;

u8 sub_8147F84(struct Pokemon* mon)
{
    u16 species = GetMonData(mon, MON_DATA_SPECIES2);
    u8 spriteID = CreateSprite(&gUnknown_02024E8C, 48, 80, 2);

    gPokeblockFeedMonSpecies = species;
    gPokeblockFeedMonSpriteID = spriteID;
    gPokeblockFeedMonNature = GetNature(mon);
    gSprites[spriteID].data2 = species;
    gSprites[spriteID].callback = SpriteCallbackDummy;
    gPokeblockMonNotFlipped = 1;
    if (!sub_8040A3C(species))
    {
        gSprites[spriteID].affineAnims = gSpriteAffineAnimTable_84120EC;
        gSprites[spriteID].oam.affineMode = 3;
        CalcCenterToCornerVec(&gSprites[spriteID], gSprites[spriteID].oam.shape, gSprites[spriteID].oam.size, gSprites[spriteID].oam.affineMode);
        gPokeblockMonNotFlipped = 0;
    }
    return spriteID;
}

void sub_8148044(u8 spriteID)
{
    gSprites[spriteID].pos1.x = 48;
    gSprites[spriteID].pos1.y = 80;
    gSprites[spriteID].data0 = -8;
    gSprites[spriteID].data1 = 1;
    gSprites[spriteID].callback = sub_8148078;
}

void sub_8148078(struct Sprite* sprite)
{
    sprite->pos1.x += 4;
    sprite->pos1.y += sprite->data0;
    sprite->data0 += sprite->data1;
    if (sprite->data0 == 0)
        PlayCry1(sprite->data2, 0);
    if (sprite->data0 == 9)
        sprite->callback = SpriteCallbackDummy;
}

u8 sub_81480B4(void)
{
    u8 spriteID = sub_810BA50(188, 100, 2);
    gSprites[spriteID].oam.affineMode = 1;
    gSprites[spriteID].affineAnims = gSpriteAffineAnimTable_84121A0;
    gSprites[spriteID].callback = SpriteCallbackDummy;
    InitSpriteAffineAnim(&gSprites[spriteID]);
    return spriteID;
}

void sub_8148108(u8 spriteID, bool8 a1)
{
    FreeOamMatrix(gSprites[spriteID].oam.matrixNum);
    gSprites[spriteID].oam.affineMode = 3;
    if (!a1)
        gSprites[spriteID].affineAnims = gSpriteAffineAnimTable_84121A4;
    else
        gSprites[spriteID].affineAnims = gSpriteAffineAnimTable_84121A8;
    InitSpriteAffineAnim(&gSprites[spriteID]);
}

u8 sub_814817C(void)
{
    u8 spriteID = CreateSprite(&gSpriteTemplate_84121E4, 174, 84, 1);
    gSprites[spriteID].data0 = -12;
    gSprites[spriteID].data1 = 1;
    return spriteID;
}

void sub_81481B0(struct Sprite* sprite)
{
    sprite->pos1.x -= 4;
    sprite->pos1.y += sprite->data0;
    sprite->data0 += sprite->data1;
    if (sprite->data0 == 10)
        DestroySprite(sprite);
}

void sub_81481DC(void)
{
    u8 animID, i;

    gUnknown_03005F34 = 1;
    animID = gNatureToMonPokeblockAnim[gPokeblockFeedMonNature][0];
    for (i = 0; i < 8; i++, animID++)
    {
        gUnknown_03005F34 += gMonPokeblockAnims[animID][4];
        if (gMonPokeblockAnims[animID][9] == 1)
            break;
    }
}

extern struct Sprite gPokeblockFeedPokeSpriteCopy;
extern struct Sprite* gPokeblockFeedPokeSprite;
extern u8 gUnknown_03005F40;
extern s16 gUnknown_03005FA0[];

void sub_814825C(void)
{
    switch (gUnknown_03005F3C)
    {
    case 0:
        gUnknown_03005F40 = gNatureToMonPokeblockAnim[gPokeblockFeedMonNature][0];
        gPokeblockFeedPokeSprite = &gSprites[gPokeblockFeedMonSpriteID];
        gPokeblockFeedPokeSpriteCopy = *gPokeblockFeedPokeSprite;
        gUnknown_03005F3C = 10;
        break;
    case 1 ... 9:
        break;
    case 10:
        sub_8148540();
        if (gNatureToMonPokeblockAnim[gPokeblockFeedMonNature][1] != 0)
        {
            gPokeblockFeedPokeSprite->oam.affineMode = 3;
            gPokeblockFeedPokeSprite->oam.matrixNum = 0;
            gPokeblockFeedPokeSprite->affineAnims = gSpriteAffineAnimTable_8412050;
            InitSpriteAffineAnim(gPokeblockFeedPokeSprite);
        }
        gUnknown_03005F3C = 50;
    case 50:
        if (gNatureToMonPokeblockAnim[gPokeblockFeedMonNature][1] != 0)
        {
            if (gPokeblockMonNotFlipped == 0)
                StartSpriteAffineAnim(gPokeblockFeedPokeSprite, gNatureToMonPokeblockAnim[gPokeblockFeedMonNature][1] + 10);
            else
                StartSpriteAffineAnim(gPokeblockFeedPokeSprite, gNatureToMonPokeblockAnim[gPokeblockFeedMonNature][1]);
        }
        gUnknown_03005F3C = 60;
        break;
    case 60:
        if (sub_81485CC() == 1)
        {
            if (gUnknown_03005FA0[9] == 0)
            {
                gUnknown_03005F40++;
                sub_8148540();
                gUnknown_03005F3C = 60;
            }
            else
            {
                FreeOamMatrix(gPokeblockFeedPokeSprite->oam.matrixNum);
                gUnknown_03005F3C = 70;
            }
        }
        break;
    case 70:
        FreePokeSpriteMatrix();
        gUnknown_03005F40 = 0;
        gUnknown_03005F3C = 0;
        break;
    case 71 ... 90:
        break;
    }
}

bool8 sub_8148540(void)
{
    u8 i;
    for (i = 0; i < 10; i++)
        gUnknown_03005FA0[i] = gMonPokeblockAnims[gUnknown_03005F40][i];
    if (gUnknown_03005FA0[4] == 0)
        return 1;
    else
    {
        gUnknown_03005FA0[10] = Sin(gUnknown_03005FA0[0], gUnknown_03005FA0[2]);
        gUnknown_03005FA0[11] = Cos(gUnknown_03005FA0[0], gUnknown_03005FA0[3]);
        gUnknown_03005FA0[12] = gUnknown_03005FA0[4];
        gUnknown_03005FA0[13] = gPokeblockFeedPokeSprite->pos2.x;
        gUnknown_03005FA0[14] = gPokeblockFeedPokeSprite->pos2.y;
        sub_8148710();
        gUnknown_03005FA0[4] = gUnknown_03005FA0[12];
        sub_814862C();
        gUnknown_03005FA0[4] = gUnknown_03005FA0[12];
        return 0;
    }
}

bool8 sub_81485CC(void)
{
    u16 var = gUnknown_03005FA0[12] - gUnknown_03005FA0[4];

    gPokeblockFeedPokeSprite->pos2.x = (u16)(*((u16*)(&ewram[0x1D000]) + var));
    gPokeblockFeedPokeSprite->pos2.y = (u16)(*((u16*)(&ewram[0x1D400]) + var));

    if (--gUnknown_03005FA0[4] == 0)
        return 1;
    else
        return 0;
}

static bool8 FreePokeSpriteMatrix(void)
{
    FreeSpriteOamMatrix(gPokeblockFeedPokeSprite);
    return 0;
}

void sub_814862C(void)
{
    u16 i;
    u16 r8 = gUnknown_03005FA0[8];
    u16 r7 = gUnknown_03005FA0[12] - r8;
    s16 var3 = gUnknown_03005FA0[13] + gUnknown_03005FA0[6];
    s16 r9 = gUnknown_03005FA0[14] + gUnknown_03005FA0[7];

    for (i = 0; i < r7 - 1; i++)
    {
        s16* r3 = (((u16*)(&ewram[0x1D000]) + (r8 + i)));
        s16 r1 = *r3 - (var3);

        s16* r5 = (((u16*)(&ewram[0x1D400]) + (r8 + i)));
        s16 r4 = *r5 - r9;

        *r3 -= r1 * (i + 1) / r7;
        *r5 -= r4 * (i + 1) / r7;
    }

    *((u16*)(&ewram[0x1CFFE]) + (r8 + r7)) = var3;
    *((u16*)(&ewram[0x1D3FE]) + (r8 + r7)) = r9;
}

/*
void sub_8148710(void)
{
    bool8 var_24 = 0;
    s16 r8 = gUnknown_03005FA0[13] - gUnknown_03005FA0[10];
    s16 r7 = gUnknown_03005FA0[14] - gUnknown_03005FA0[11];
    s16 r5;
    if (gUnknown_03005FA0[10] < 0)
        r5 = -(gUnknown_03005FA0[10]) - gUnknown_03005FA0[3];
    else
        r5 = (gUnknown_03005FA0[10]) - gUnknown_03005FA0[3];
    if (gUnknown_03005FA0)
}
*/
