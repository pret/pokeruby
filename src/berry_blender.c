#include "global.h"
#include "decompress.h"
#include "palette.h"
#include "event_data.h"
#include "main.h"
#include "text_window.h"
#include "menu.h"
#include "strings2.h"
#include "sound.h"
#include "songs.h"
#include "berry.h"
#include "string_util.h"
#include "link.h"
#include "task.h"
#include "rom4.h"
#include "item.h"
#include "items.h"
#include "rng.h"
#include "save.h"
#include "menu_cursor.h"
#include "trig.h"
#include "pokeblock.h"

//needed to match Blender_ControlHitPitch
struct MusicPlayerInfo
{
    struct SongHeader *songHeader;
    u32 status;
    u8 trackCount;
    u8 priority;
    u8 cmd;
    u8 unk_B;
    u32 clock;
    u8 gap[8];
    u8 *memAccArea;
    u16 tempoD;
    u16 tempoU;
    u16 tempoI;
    u16 tempoC;
    u16 fadeOI;
    u16 fadeOC;
    u16 fadeOV;
    struct MusicPlayerTrack *tracks;
    struct ToneData *tone;
    u32 ident;
    u32 func;
    u32 intp;
};

// other files functions
void m4aMPlayPitchControl(struct MusicPlayerInfo *mplayInfo, u16 trackBits, s16 pitch);
void m4aMPlayTempoControl(struct MusicPlayerInfo *mplayInfo, u16 tempo);
void m4aMPlayStop(struct MusicPlayerInfo *mplayInfo);
void sub_80A6978(void);
u8 sub_80A7DEC(u8 berryId, u8 x, u8 y, bool8 animate);
void sub_814A880(u8 a1, u8 a2);
u8 sub_814A5C0(u8 a1, u16 a2, u8 a3, u16 a4, u8 a5);
s8 sub_810CA00(void);
bool8 sub_810CA34(struct Pokeblock *pokeblock);

#define BLENDER_SCORE_BEST      0
#define BLENDER_SCORE_GOOD      1
#define BLENDER_SCORE_MISS      2

#define BLENDER_MAX_PLAYERS 4
#define BLENDER_SCORES_NO   3

#define FLAVOUR_SPICY       0
#define FLAVOUR_DRY         1
#define FLAVOUR_SWEET       2
#define FLAVOUR_BITTER      3
#define FLAVOUR_SOUR        4

struct BlenderBerry
{
    u16 itemID;
    u8 name[7];
    u8 flavours[5];
    u8 smoothness;
};

struct BerryBlenderData
{
    u8 field_0;
    u8 field_1;
    u8 field_2;
    u8 field_3;
    struct Window field_4;
    u8 field_35;
    u8 field_36;
    u8 field_37;
    u8 field_38;
    u8 field_39;
    u8 field_3A;
    u8 field_3B;
    u8 field_3C;
    u8 field_3D;
    u8 field_3E;
    u8 field_3F;
    u8 field_40;
    u8 field_41;
    u8 field_42;
    u8 field_43;
    u8 field_44;
    u8 field_45;
    u8 field_46;
    u8 field_47;
    u8 field_48;
    u8 field_49;
    u8 field_4A;
    u8 field_4B;
    u8 field_4C;
    u8 field_4D;
    u16 field_4E;
    u8 scoreIconIDs[3];
    u16 arrowPos;
    s16 field_56;
    s16 field_58;
    u16 max_RPM;
    u8 SyncArrowSpriteID[BLENDER_MAX_PLAYERS];
    u8 SyncArrowSprite2ID[BLENDER_MAX_PLAYERS];
    u8 field_64;
    u8 field_65;
    u8 field_66;
    u8 field_67;
    u8 field_68;
    u8 field_69;
    u8 field_6A;
    u8 field_6B;
    u8 field_6C;
    u8 field_6D;
    u8 field_6E;
    u8 field_6F;
    u16 field_70[BLENDER_MAX_PLAYERS];
    u16 field_78;
    u16 field_7A;
    u16 field_7C;
    u8 field_7E;
    u8 field_7F;
    u16 chosenItemID[BLENDER_MAX_PLAYERS];
    u8 playersNo;
    u8 field_89;
    u8 field_8A;
    u8 field_8B;
    u8 field_8C;
    u8 field_8D;
    u8 field_8E;
    u8 field_8F;
    u8 field_90;
    u8 field_91;
    u8 field_92;
    u8 field_93;
    u16 field_94;
    u8 field_96;
    u8 field_97;
    u8 field_98;
    u8 field_99;
    u16 field_9A[BLENDER_MAX_PLAYERS];
    u16 field_A2[BLENDER_MAX_PLAYERS];
    u8 field_AA;
    u8 stringVar[61];
    u8 field_E8;
    u8 field_E9;
    u8 field_EA;
    u8 field_EB;
    u8 field_EC;
    u8 field_ED;
    u8 field_EE;
    u8 field_EF;
    u8 field_F0;
    u8 field_F1;
    u8 field_F2;
    u8 field_F3;
    u8 field_F4;
    u8 field_F5;
    u8 field_F6;
    u8 field_F7;
    u8 field_F8;
    u8 field_F9;
    u8 field_FA;
    u8 field_FB;
    u8 field_FC;
    u8 field_FD;
    u8 field_FE;
    u8 field_FF;
    u8 field_100;
    u8 field_101;
    u8 field_102;
    u8 field_103;
    u8 field_104;
    u8 field_105;
    u8 field_106;
    u8 field_107;
    u8 field_108;
    u8 field_109;
    u8 field_10A;
    u8 field_10B;
    u8 field_10C;
    u8 field_10D;
    u8 field_10E;
    u8 field_10F;
    u8 field_110;
    u8 field_111;
    u8 field_112;
    u8 field_113;
    u8 field_114;
    u8 field_115;
    u8 field_116;
    u8 field_117;
    u8 field_118;
    u8 field_119;
    u8 field_11A;
    u8 field_11B;
    u8 field_11C;
    u8 field_11D;
    u8 field_11E;
    u8 field_11F;
    u8 field_120;
    u8 field_121;
    u8 field_122;
    u8 field_123;
    u8 field_124;
    u8 field_125;
    u8 field_126;
    u8 field_127;
    u8 field_128;
    u8 field_129;
    u8 field_12A;
    u8 field_12B;
    u32 gameFrameTime;
    s32 framesToWait;
    u32 field_134;
    u8 field_138;
    u8 field_139;
    u8 field_13A;
    u8 field_13B;
    u8 field_13C;
    u8 field_13D;
    u16 field_13E;
    u16 field_140;
    u16 field_142;
    s16 field_144;
    s16 field_146;
    u8 field_148[3];
    u8 field_14B;
    u16 scores[BLENDER_MAX_PLAYERS][3];
    u8 playerPlaces[BLENDER_MAX_PLAYERS];
    struct BgAffineDstData field_168;
    u16 field_178;
    u8 field_17A;
    u8 field_17B;
    struct BlenderBerry blendedBerries[BLENDER_MAX_PLAYERS];
    u32 field_1BC;
    u16 field_1C0;
    u16 field_1C2;
    u32 field_1C4;
};

extern struct BerryBlenderData* sBerryBlenderData;

extern struct MusicPlayerInfo gMPlay_SE2;
extern struct MusicPlayerInfo gMPlay_BGM;
extern u8 ewram[];
extern s16 gUnknown_03000520[];

// this file's functions:
void sub_80514A4(void);
void sub_80514F0(void);
void sub_804E56C(void);
void sub_804E884(u8 a0);
void sub_8051474(void);
void sub_804E9F8(void);
void sub_804F378(void);
void sub_8051414(struct BgAffineDstData *dest);
void sub_804F238(void);
void sub_80501FC(void);
bool8 sub_8051B8C(void);
void Blender_SetBankBerryData(u8 bank, u16 itemID);
void sub_804F2A8(void);
void sub_804F81C(void);
void sub_805156C(void);
void sub_8051684(struct Sprite* sprite);
void sub_8051AC8(s16* a0, u16 a1);
void sub_805194C(u16 a0, u16 a1);
void sub_8051A3C(u16 a0);
void sub_8051B18(void);
void sub_805123C(void);
void sub_8050954(void);
bool8 Blender_PrintBlendingRanking(void);
bool8 Blender_PrintBlendingResults(void);
void sub_80510E8(void);
void sub_8050E30(void);
void sub_805197C(u16 a0, u16 a1);
void Blender_PrintMadePokeblockString(struct Pokeblock* pokeblock, u8* dst);
void sub_8052BD0(u8 taskID);
void sub_8052AF8(void);

void Blender_ControlHitPitch(void)
{
    m4aMPlayPitchControl(&gMPlay_SE2, 0xFFFF, (sBerryBlenderData->field_56 - 128) * 2);
}

void VBlankCB0_BerryBlender(void)
{
    sub_80514A4();
    sub_80514F0();
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

void VBlankCB1_BerryBlender(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

extern const u8 gUnknown_08E6C100[];
extern const u8 gUnknown_08215C2C[];
extern const u8 gUnknown_08E6C920[];
extern const u8 gUnknown_08E6D354[];
extern const u16 gUnknown_08215C0C[];
extern const u16 gUnknown_0821602C[];
extern const struct SpriteSheet gUnknown_082163DC;
extern const struct SpriteSheet gUnknown_082164F4;
extern const struct SpriteSheet gUnknown_08216454;
extern const struct SpriteSheet gUnknown_08216540;
extern const struct SpriteSheet gUnknown_08216574;
extern const struct SpritePalette gUnknown_082163EC;
extern const struct SpritePalette gUnknown_082163E4;

bool8 sub_804E2EC(void)
{
    switch (sBerryBlenderData->field_1)
    {
    case 0:
        sub_800D238(gUnknown_08E6C100, &ewram[0x10000]);
        sBerryBlenderData->field_1++;
        break;
    case 1:
        {
            const void* offsetRead = gUnknown_08215C2C;
            void* offsetWrite = (void*)(VRAM + 0x4000);

            DmaCopy16(3, offsetRead, offsetWrite, 0x400);
            LoadPalette(gUnknown_08215C0C, 0, 0x100);
            sBerryBlenderData->field_1++;
        }
        break;
    case 2:
        {
            void* offsetRead = &ewram[0x10000];
            void* offsetWrite = (void*)(VRAM);
            u32 size = 0x2000;
            while (TRUE)
            {
                DmaCopy16(3, offsetRead, offsetWrite, 0x1000);
                offsetRead += 0x1000;
                offsetWrite += 0x1000;
                size -= 0x1000;
                if (size <= 0x1000)
                {
                    DmaCopy16(3, offsetRead, offsetWrite, size);
                    break;
                }
            }
            sBerryBlenderData->field_1++;
        }
        break;
    case 3:
        sub_800D238(gUnknown_08E6C920, &ewram[0x10000]);
        sBerryBlenderData->field_1++;
        break;
    case 4:
        sub_800D238(gUnknown_08E6D354, &ewram[0x13000]);
        sBerryBlenderData->field_1++;
        break;
    case 5:
        {
            void* offsetRead = &ewram[0x10000];
            void* offsetWrite = (void*)(VRAM + 0xE000);

            DmaCopy16(3, offsetRead, offsetWrite, 0x1000);
            sBerryBlenderData->field_1++;
        }
        break;
    case 6:
        {
            void* offsetRead = &ewram[0x11000];
            void* offsetWrite = (void*)(VRAM + 0xF000);

            DmaCopy16(3, offsetRead, offsetWrite, 0x1000);
            sBerryBlenderData->field_1++;
        }
        break;
    case 7:
        {
            u16 i;
            u16* palStore = (u16*)(&ewram[0x13000]);
            void* offsetRead;
            void* offsetWrite;

            for (i = 0; i < 640; i++)
            {
                *(palStore + i) |= 0x100;
            }
            offsetRead = &ewram[0x13000];
            offsetWrite = (void*)(VRAM + 0x6000);
            DmaCopy16(3, offsetRead, offsetWrite, 0x500);
            LoadPalette(gUnknown_0821602C, 0x80, 0x20);
            sBerryBlenderData->field_1++;
        }
        break;
    case 8:
        LoadSpriteSheet(&gUnknown_082163DC);
        LoadSpriteSheet(&gUnknown_082164F4);
        LoadSpriteSheet(&gUnknown_08216454);
        sBerryBlenderData->field_1++;
        break;
    case 9:
        LoadSpriteSheet(&gUnknown_08216540);
        LoadSpriteSheet(&gUnknown_08216574);
        LoadSpritePalette(&gUnknown_082163EC);
        LoadSpritePalette(&gUnknown_082163E4);
        sBerryBlenderData->field_1 = 0;
        return 1;
    }
    return 0;
}

void sub_804E4FC(void)
{
    REG_DISPCNT = 0x1341;
    REG_BG2CNT = 0x4880;
    REG_BG1CNT = 0xC0D;
    REG_BG0HOFS = 0;
    REG_BG0VOFS = 0;
    REG_BG1HOFS = 0;
    REG_BG1VOFS = 0;
}

void sub_804E538(void)
{
    u8* field6F; //this temp value is needed to match

    sBerryBlenderData = (struct BerryBlenderData*)(&ewram[0x18000]);

    field6F = &sBerryBlenderData->field_6F;
    sBerryBlenderData->field_0 = 0;
    *field6F = 0;

    sub_804E884(gSpecialVar_0x8004);
    SetMainCallback2(sub_804E56C);
}

extern const struct WindowConfig gWindowConfig_81E6F68;
extern const u8 sBlenderSyncArrowsPos[][2];
extern const struct SpriteTemplate sBlenderSyncArrow_SpriteTemplate;

void sub_804E56C(void)
{
    s32 i;
    switch (sBerryBlenderData->field_0)
    {
    case 0:
        REG_DISPCNT = 0;
        ResetSpriteData();
        FreeAllSpritePalettes();
        SetVBlankCallback(NULL);
        SetUpWindowConfig(&gWindowConfig_81E6F68);
        InitMenuWindow(&gWindowConfig_81E6F68);
        sBerryBlenderData->field_0++;
        sBerryBlenderData->field_140 = 0;
        sBerryBlenderData->field_13E = 0;
        sBerryBlenderData->field_142 = 0x50;
        sBerryBlenderData->field_144 = 0;
        sBerryBlenderData->field_146 = 0;
        sBerryBlenderData->field_1 = 0;
        sub_8051474();
        break;
    case 1:
        if (sub_804E2EC())
        {
            for (i = 0; i < BLENDER_MAX_PLAYERS; i++)
            {
                sBerryBlenderData->SyncArrowSpriteID[i] = CreateSprite(&sBlenderSyncArrow_SpriteTemplate, sBlenderSyncArrowsPos[i][0], sBlenderSyncArrowsPos[i][1], 1);
                StartSpriteAnim(&gSprites[sBerryBlenderData->SyncArrowSpriteID[i]], i + 8);
            }
            SetVBlankCallback(VBlankCB0_BerryBlender);
            sBerryBlenderData->field_0++;
        }
        break;
    case 2:
        BeginNormalPaletteFade(-1, 0, 0x10, 0, 0);
        sub_8051474();
        sBerryBlenderData->field_0++;
        break;
    case 3:
        sub_804E4FC();
        if (!gPaletteFade.active)
        {
            sBerryBlenderData->field_0++;
        }
        break;
    case 4:
        MenuDrawTextWindow(0, 14, 29, 19);
        MenuPrintMessage(gOtherText_BlenderChooseBerry, 1, 15);
        sBerryBlenderData->field_0++;
        break;
    case 5:
        if (MenuUpdateWindowText())
        {
            sBerryBlenderData->field_0++;
            BeginNormalPaletteFade(-1, 0, 0, 0x10, 0);
        }
        break;
    case 6:
        if (!gPaletteFade.active)
        {
            sub_80A6978();
            sBerryBlenderData->field_0 = 0;
        }
        break;
    }
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

void sub_804E738(struct Sprite* sprite)
{
    sprite->data1 += sprite->data6;
    sprite->data2 -= sprite->data4;
    sprite->data2 += sprite->data7;
    sprite->data0 += sprite->data7;
    sprite->data4--;

    if (sprite->data0 < sprite->data2)
    {
        sprite->data3 = sprite->data4 = sprite->data3 - 1;
        if (++sprite->data5 > 3)
            DestroySprite(sprite);
        else
            PlaySE(116);
    }
    sprite->pos1.x = sprite->data1;
    sprite->pos1.y = sprite->data2;
}

void sub_804E794(struct Sprite* sprite, s16 a2, s16 a3, s16 a4, s16 a5, s16 a6)
{
    sprite->data0 = a3;
    sprite->data1 = a2;
    sprite->data2 = a3;
    sprite->data3 = a4;
    sprite->data4 = 10;
    sprite->data5 = 0;
    sprite->data6 = a5;
    sprite->data7 = a6;
    sprite->callback = sub_804E738;
}

extern const s16 gUnknown_08216594[][5];

void sub_804E7C0(u16 a0, u8 a1)
{
    u8 spriteID = sub_80A7DEC(a0 + 123, 0, 80, a1 & 1);
    sub_804E794(&gSprites[spriteID], gUnknown_08216594[a1][0], gUnknown_08216594[a1][1], gUnknown_08216594[a1][2], gUnknown_08216594[a1][3], gUnknown_08216594[a1][4]);
}

void Blender_CopyBerryData(struct BlenderBerry* berry, u16 itemID)
{
    const struct Berry *berryInfo = GetBerryInfo(itemID + 124);
    berry->itemID = itemID;
    StringCopy(berry->name, berryInfo->name);
    berry->flavours[FLAVOUR_SPICY] = berryInfo->spicy;
    berry->flavours[FLAVOUR_DRY] = berryInfo->dry;
    berry->flavours[FLAVOUR_SWEET] = berryInfo->sweet;
    berry->flavours[FLAVOUR_BITTER] = berryInfo->bitter;
    berry->flavours[FLAVOUR_SOUR] = berryInfo->sour;
    berry->smoothness = berryInfo->smoothness;
}

extern u8 gUnknown_03004834;
extern const u8* const gUnknown_082162B8[];

void sub_804E884(u8 a0)
{
    int i;
    if (a0)
    {
        for (i = 0; i < 4; i++)
            gLinkPlayers[i].language = LANGUAGE_ENGLISH;
    }
    switch (a0)
    {
    case 0:
        gUnknown_03004834 = 0;
        break;
    case 1:
        gUnknown_03004834 = 1;
        sBerryBlenderData->playersNo = 2;
        StringCopy(gLinkPlayers[0].name, gSaveBlock2.playerName);
        StringCopy(gLinkPlayers[1].name, gUnknown_082162B8[0]);
        break;
    case 2:
        gUnknown_03004834 = 2;
        sBerryBlenderData->playersNo = 3;
        StringCopy(gLinkPlayers[0].name, gSaveBlock2.playerName);
        StringCopy(gLinkPlayers[1].name, gUnknown_082162B8[0]);
        StringCopy(gLinkPlayers[2].name, gUnknown_082162B8[1]);
        break;
    case 3:
        gUnknown_03004834 = 3;
        sBerryBlenderData->playersNo = 4;
        StringCopy(gLinkPlayers[0].name, gSaveBlock2.playerName);
        StringCopy(gLinkPlayers[1].name, gUnknown_082162B8[0]);
        StringCopy(gLinkPlayers[2].name, gUnknown_082162B8[1]);
        StringCopy(gLinkPlayers[3].name, gUnknown_082162B8[2]);
        break;
    }
}

void sub_804E990(void)
{
    s32 i;

    REG_DISPCNT = 0;
    sBerryBlenderData = (struct BerryBlenderData*)(&ewram[0x18000]);
    sBerryBlenderData->field_0 = 0;
    sBerryBlenderData->field_134 = 0;
    for (i = 0; i < BLENDER_MAX_PLAYERS; i++)
    {
        sBerryBlenderData->chosenItemID[i] = 0;
    }
    sub_804E884(gSpecialVar_0x8004);
    if (gSpecialVar_0x8004 == 0)
        SetMainCallback2(sub_804E9F8);
    else
        SetMainCallback2(sub_804F378);
}

extern u16 gScriptItemId;

extern const u8 gUnknown_082162EC[3][4];
extern const u16 gUnknown_082162F8[];
extern const u8 gUnknown_08216300[];
extern const struct SpriteTemplate gSpriteTemplate_8216548;

void sub_804E9F8(void)
{
    int i, j;
    switch (sBerryBlenderData->field_0)
    {
    case 0:
        ResetSpriteData();
        FreeAllSpritePalettes();
        ResetTasks();
        SetVBlankCallback(VBlankCB0_BerryBlender);
        SetUpWindowConfig(&gWindowConfig_81E6F68);
        InitMenuWindow(&gWindowConfig_81E6F68);
        gLinkType = 0x4422;
        sBerryBlenderData->field_0++;
        sBerryBlenderData->field_4E = 0;
        sBerryBlenderData->field_7E = 0;
        sBerryBlenderData->field_144 = 0;
        sBerryBlenderData->field_146 = 0;
        for (i = 0; i < BLENDER_MAX_PLAYERS; i++)
        {
            sBerryBlenderData->field_70[i] = 0;
            for (j = 0; j < 3; j++)
            {
                sBerryBlenderData->scores[i][j] = 0;
            }
        }
        sBerryBlenderData->field_7C = 0;
        sBerryBlenderData->field_56 = 0;
        sBerryBlenderData->arrowPos = 0;
        sBerryBlenderData->max_RPM = 0;
        sBerryBlenderData->field_1 = 0;
        break;
    case 1:
        if (sub_804E2EC())
        {
            sBerryBlenderData->field_0++;
            sub_8051474();
        }
        break;
    case 2:
        for (i = 0; i < BLENDER_MAX_PLAYERS; i++)
        {
            sBerryBlenderData->SyncArrowSprite2ID[i] = CreateSprite(&sBlenderSyncArrow_SpriteTemplate, sBlenderSyncArrowsPos[i][0], sBlenderSyncArrowsPos[i][1], 1);
            StartSpriteAnim(&gSprites[sBerryBlenderData->SyncArrowSprite2ID[i]], i + 8);
        }
        sBerryBlenderData->field_0++;
        break;
    case 3:
        BeginNormalPaletteFade(-1, 0, 0x10, 0, 0);
        sBerryBlenderData->field_0++;
        break;
    case 4:
        sub_804E4FC();
        if (!gPaletteFade.active)
        {
            sBerryBlenderData->field_0++;
        }
        break;
    case 5:
        MenuDrawTextWindow(0, 13, 29, 19);
        MenuPrint(gOtherText_LinkStandby3, 1, 14);
        sBerryBlenderData->field_0 = 8;
        sBerryBlenderData->framesToWait = 0;
        break;
    case 8:
        sBerryBlenderData->field_0++;
        sBerryBlenderData->field_13C = 0;
        Blender_CopyBerryData(&sBerryBlenderData->blendedBerries[0], gScriptItemId);
        memcpy(gBlockSendBuffer, &sBerryBlenderData->blendedBerries[0], sizeof(struct BlenderBerry));
        sub_80084A4();
        sBerryBlenderData->framesToWait = 0;
        break;
    case 9:
        if (sub_8007ECC())
        {
            ResetBlockReceivedFlags();
            if (GetMultiplayerId() == 0)
                sub_8007E9C(4);
            sBerryBlenderData->field_0++;
        }
        break;
    case 10:
        if (++sBerryBlenderData->framesToWait > 20)
        {
            MenuZeroFillScreen();
            if (GetBlockReceivedStatus() == sub_8008198())
            {
                for (i = 0; i < GetLinkPlayerCount(); i++)
                {
                    memcpy(&sBerryBlenderData->blendedBerries[i], &gBlockRecvBuffer[i][0], sizeof(struct BlenderBerry));
                    sBerryBlenderData->chosenItemID[i] = sBerryBlenderData->blendedBerries[i].itemID;
                }
                ResetBlockReceivedFlags();
                sBerryBlenderData->field_0++;
            }
        }
        break;
    case 11:
        sBerryBlenderData->playersNo = GetLinkPlayerCount();
        for (i = 0; i < BLENDER_MAX_PLAYERS; i++)
        {
            if (sBerryBlenderData->field_13C == gUnknown_082162EC[sBerryBlenderData->playersNo - 2][i])
            {
                sub_804E7C0(sBerryBlenderData->chosenItemID[sBerryBlenderData->field_13C], i);
                break;
            }
        }
        sBerryBlenderData->framesToWait = 0;
        sBerryBlenderData->field_0++;
        sBerryBlenderData->field_13C++;
        break;
    case 12:
        if (++sBerryBlenderData->framesToWait > 60)
        {
            if (sBerryBlenderData->field_13C >= sBerryBlenderData->playersNo)
            {
                sBerryBlenderData->field_0++;
                sBerryBlenderData->arrowPos = gUnknown_082162F8[gUnknown_08216300[sBerryBlenderData->playersNo - 2]] - 22528;
            }
            else
                sBerryBlenderData->field_0--;
            sBerryBlenderData->framesToWait = 0;
        }
        break;
    case 13:
        if (sub_8007ECC())
        {
            sBerryBlenderData->field_0++;
            sub_8051414(&sBerryBlenderData->field_168);
        }
        break;
    case 14:
        REG_DISPCNT |= 0x400;
        sBerryBlenderData->arrowPos += 0x200;
        sBerryBlenderData->field_142 += 4;
        if (sBerryBlenderData->field_142 > 255)
        {
            sBerryBlenderData->field_0++;
            sBerryBlenderData->field_142 = 256;
            sBerryBlenderData->arrowPos = gUnknown_082162F8[gUnknown_08216300[sBerryBlenderData->playersNo - 2]];
            REG_BG2CNT = 0x4882;
            sBerryBlenderData->framesToWait = 0;
            sub_804F238();
            sub_804F2A8();
        }
        sub_8051414(&sBerryBlenderData->field_168);
        break;
    case 15:
        if (sub_8051B8C())
        {
            sBerryBlenderData->framesToWait = 0;
            sBerryBlenderData->field_0++;
        }
        sub_8051414(&sBerryBlenderData->field_168);
        break;
    case 16:
        CreateSprite(&gSpriteTemplate_8216548, 120, -16, 3);
        sBerryBlenderData->field_0++;
        break;
    case 18:
        sBerryBlenderData->field_0++;
        break;
    case 19:
        sub_80084A4();
        sBerryBlenderData->field_0++;
        break;
    case 20:
        if (sub_8007ECC())
        {
            sub_8007E24();
            sBerryBlenderData->field_0++;
        }
        break;
    case 21:
        sBerryBlenderData->field_56 = 128;
        sBerryBlenderData->gameFrameTime = 0;
        SetMainCallback2(sub_80501FC);
        if (GetCurrentMapMusic() != 403)
        {
            sBerryBlenderData->field_178 = GetCurrentMapMusic();
        }
        PlayBGM(403);
        break;
    case 100:
        MenuDrawTextWindow(0, 13, 29, 19);
        MenuPrintMessage(gOtherText_LinkNotFound, 1, 15);
        sBerryBlenderData->field_0++;
        break;
    case 101:
        if (MenuUpdateWindowText())
            sBerryBlenderData->field_0++;
        break;
    case 102:
        if (!gPaletteFade.active)
            SetMainCallback2(c2_exit_to_overworld_1_continue_scripts_restart_music);
        break;
    }
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

void sub_804F0F4(void)
{
    REG_DISPCNT = 0;

    ResetSpriteData();
    FreeAllSpritePalettes();
    ResetTasks();

    SetVBlankCallback(VBlankCB0_BerryBlender);

    SetUpWindowConfig(&gWindowConfig_81E6F68);
    InitMenuWindow(&gWindowConfig_81E6F68);

    gLinkType = 0x4422;

    sBerryBlenderData->field_4E = 0;
    sBerryBlenderData->field_56 = 0;
    sBerryBlenderData->arrowPos = 0;
    sBerryBlenderData->max_RPM = 0;
    sBerryBlenderData->field_144 = 0;
    sBerryBlenderData->field_146 = 0;
    sBerryBlenderData->field_0++;
}

extern const u8 gUnknown_08216303[];

u8 sub_804F16C(u16 arrowPos, u8 a1)
{
    u32 var1 = (arrowPos / 256) + 24;
    u8 arrID = sBerryBlenderData->field_A2[a1];
    u32 var2 = gUnknown_08216303[arrID];

    if (var1 >= var2 && var1 < var2 + 48)
    {
        if (var1 >= var2 + 20 && var1 < var2 + 28)
            return 2;
        else
            return 1;
    }
    else
        return 0;
}

extern const u8 gUnknown_082165BC[][3];

void sub_804F1BC(u16 itemID, u8 a1, struct BlenderBerry* berry)
{
    u16 r4 = 0;
    u16 i;
    if (itemID == ITEM_ENIGMA_BERRY)
    {
        for (i = 0; i < 5; i++)
        {
            if (berry->flavours[r4] > berry->flavours[i])
                r4 = i;
        }
        r4 += 5;
    }
    else
    {
        r4 = itemID - 133;
        if (r4 >= 5)
            r4 = (r4 % 5) + 5;
    }
    for (i = 0; i < a1 - 1; i++)
    {
        Blender_SetBankBerryData(i + 1, gUnknown_082165BC[r4][i] + 133);
    }
}

void sub_804F238(void)
{
    s32 i, j;
    for (i = 0; i < BLENDER_MAX_PLAYERS; i++)
    {
        sBerryBlenderData->field_A2[i] = 0xFF;
        sBerryBlenderData->field_9A[i] = gUnknown_082162EC[sBerryBlenderData->playersNo - 2][i];
    }
    for (j = 0; j < BLENDER_MAX_PLAYERS; j++)
    {
        for (i = 0; i < BLENDER_MAX_PLAYERS; i++)
        {
            if (sBerryBlenderData->field_9A[i] == j)
                sBerryBlenderData->field_A2[j] = i;
        }
    }
}

extern const u8 gUnknown_082162C4[];
extern const u8 gUnknown_082162D4[][2];

void sub_804F2A8(void)
{
    int i;
    for (i = 0; i < BLENDER_MAX_PLAYERS; i++)
    {
        if (sBerryBlenderData->field_9A[i] != 0xFF)
        {
            u8* stringPtr = gStringVar1;

            sBerryBlenderData->SyncArrowSpriteID[sBerryBlenderData->field_9A[i]] = sBerryBlenderData->SyncArrowSprite2ID[i];
            StartSpriteAnim(&gSprites[sBerryBlenderData->SyncArrowSpriteID[sBerryBlenderData->field_9A[i]]], i);
            if (GetMultiplayerId() == sBerryBlenderData->field_9A[i])
                stringPtr = StringCopy(stringPtr, gUnknown_082162C4);
            StringCopy(stringPtr, gLinkPlayers[sBerryBlenderData->field_9A[i]].name);
            MenuPrint_PixelCoords(gStringVar1, gUnknown_082162D4[i][0] * 8 + 1, gUnknown_082162D4[i][1] * 8, 1);
        }
    }
}

extern const TaskFunc gUnknown_08216308[];

void sub_804F378(void)
{
    s32 i, j;
    switch (sBerryBlenderData->field_0)
    {
    case 0:
        sub_804F0F4();
        Blender_SetBankBerryData(0, gScriptItemId);
        Blender_CopyBerryData(&sBerryBlenderData->blendedBerries[0], gScriptItemId);
        sub_804F1BC(gScriptItemId, sBerryBlenderData->playersNo, &sBerryBlenderData->blendedBerries[0]);
        for (i = 0; i < BLENDER_MAX_PLAYERS; i++)
        {
            sBerryBlenderData->field_70[i] = 0;
            for (j = 0; j < 3; j++)
            {
                sBerryBlenderData->scores[i][j] = 0;
            }
        }
        sBerryBlenderData->field_7C = 0;
        sBerryBlenderData->field_1 = 0;
        break;
    case 1:
        if (sub_804E2EC())
        {
            sBerryBlenderData->field_0++;
            sub_8051474();
        }
        break;
    case 2:
        for (i = 0; i < BLENDER_MAX_PLAYERS; i++)
        {
            sBerryBlenderData->SyncArrowSprite2ID[i] = CreateSprite(&sBlenderSyncArrow_SpriteTemplate, sBlenderSyncArrowsPos[i][0], sBlenderSyncArrowsPos[i][1], 1);
            StartSpriteAnim(&gSprites[sBerryBlenderData->SyncArrowSprite2ID[i]], i + 8);
        }
        sBerryBlenderData->field_0++;
        break;
    case 3:
        BeginNormalPaletteFade(-1, 0, 0x10, 0, 0);
        sBerryBlenderData->field_0++;
        sBerryBlenderData->framesToWait = 0;
        break;
    case 4:
        if (++sBerryBlenderData->framesToWait == 2)
            sub_804E4FC();
        if (!gPaletteFade.active)
            sBerryBlenderData->field_0 = 8;
        break;
    case 8:
        sBerryBlenderData->field_0 = 11;
        sBerryBlenderData->field_13C = 0;
        break;
    case 11:
        for (i = 0; i < BLENDER_MAX_PLAYERS; i++)
        {
            u32 var = gUnknown_082162EC[sBerryBlenderData->playersNo - 2][i];
            if (sBerryBlenderData->field_13C == var)
            {
                sub_804E7C0(sBerryBlenderData->chosenItemID[sBerryBlenderData->field_13C], i);
                break;
            }
        }
        sBerryBlenderData->framesToWait = 0;
        sBerryBlenderData->field_0++;
        sBerryBlenderData->field_13C++;
        break;
    case 12:
        if (++sBerryBlenderData->framesToWait > 60)
        {
            if (sBerryBlenderData->field_13C >= sBerryBlenderData->playersNo)
            {
                sBerryBlenderData->arrowPos = gUnknown_082162F8[gUnknown_08216300[sBerryBlenderData->playersNo - 2]] - 22528;
                sBerryBlenderData->field_0++;
            }
            else
                sBerryBlenderData->field_0--;
            sBerryBlenderData->framesToWait = 0;
        }
        break;
    case 13:
        sBerryBlenderData->field_0++;
        sub_804F238();
        PlaySE(43);
        sub_8051414(&sBerryBlenderData->field_168);
        break;
    case 14:
        REG_DISPCNT |= 0x400;
        sBerryBlenderData->arrowPos += 0x200;
        sBerryBlenderData->field_142 += 4;
        if (sBerryBlenderData->field_142 > 255)
        {
            sBerryBlenderData->field_0++;
            sBerryBlenderData->field_142 = 256;
            sBerryBlenderData->arrowPos = gUnknown_082162F8[gUnknown_08216300[sBerryBlenderData->playersNo - 2]];
            REG_BG2CNT = 0x4882;
            sBerryBlenderData->framesToWait = 0;
            PlaySE(52);
            sub_804F2A8();
        }
        sub_8051414(&sBerryBlenderData->field_168);
        break;
    case 15:
        if (sub_8051B8C())
        {
            sBerryBlenderData->field_0++;
        }
        sub_8051414(&sBerryBlenderData->field_168);
        break;
    case 16:
        CreateSprite(&gSpriteTemplate_8216548, 120, -16, 3);
        sBerryBlenderData->field_0++;
        break;
    case 18:
        sBerryBlenderData->field_0++;
        break;
    case 19:
        sBerryBlenderData->field_0++;
        break;
    case 20:
        sBerryBlenderData->field_0++;
        break;
    case 21:
        sub_804F81C();
        sBerryBlenderData->field_56 = 128;
        sBerryBlenderData->gameFrameTime = 0;
        sBerryBlenderData->field_14B = 0;
        sBerryBlenderData->field_7E = 0;
        SetMainCallback2(sub_80501FC);

        for (i = 0; i < gSpecialVar_0x8004; i++)
        {
            sBerryBlenderData->field_148[i] = CreateTask(gUnknown_08216308[i], 10 + i);
        }

        if (GetCurrentMapMusic() != 403)
        {
            sBerryBlenderData->field_178 = GetCurrentMapMusic();
        }
        PlayBGM(403);
        PlaySE(53);
        Blender_ControlHitPitch();
        break;
    }
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

void sub_804F81C(void)
{
    s32 i;
    for (i = 0; i < 4; i++)
    {
        gSendCmd[0] = 0;
        gSendCmd[2] = 0;
        gRecvCmds[0][i] = 0;
        gRecvCmds[2][i] = 0;
    }
}

void sub_804F844(u8 taskID)
{
   if(++gTasks[taskID].data[0] > gTasks[taskID].data[1])
   {
        gRecvCmds[2][gTasks[taskID].data[2]] = 0x2345;
        DestroyTask(taskID);
   }
}

void sub_804F890(u8 a0, u8 a1)
{
    u8 taskID = CreateTask(sub_804F844, 80);
    gTasks[taskID].data[1] = a1;
    gTasks[taskID].data[2] = a0;
}

void sub_804F8C8(u8 taskID)
{
    if (sub_804F16C(sBerryBlenderData->arrowPos, 1) == 2)
    {
        if (gTasks[taskID].data[0] == 0)
        {
            if (sBerryBlenderData->field_14B == 0)
            {
                u8 rand = Random() / 655;
                if (sBerryBlenderData->field_56 < 500)
                {
                    if (rand > 75)
                        gRecvCmds[2][1] = 0x4523;
                    else
                        gRecvCmds[2][1] = 0x5432;
                    gRecvCmds[2][1] = 0x5432; // ???
                }
                else if (sBerryBlenderData->field_56 < 1500)
                {
                    if (rand > 80)
                        gRecvCmds[2][1] = 0x4523;
                    else
                    {
                        u8 value = rand - 21;
                        if (value < 60)
                            gRecvCmds[2][1] = 0x5432;
                        else if (rand < 10)
                            sub_804F890(1, 5);
                    }
                }
                else if (rand <= 90)
                {
                    u8 value = rand - 71;
                    if (value < 20)
                        gRecvCmds[2][1] = 0x5432;
                    else if (rand < 30)
                        sub_804F890(1, 5);
                }
                else
                   gRecvCmds[2][1] = 0x4523;
            }
            else
                gRecvCmds[2][1] = 0x4523;

            gTasks[taskID].data[0] = 1;
        }
    }
    else
        gTasks[taskID].data[0] = 0;
}

void sub_804F9F4(u8 taskID)
{
    u32 var1 = (sBerryBlenderData->arrowPos + 0x1800) & 0xFFFF;
    u32 var2 = sBerryBlenderData->field_A2[2] & 0xFF;
    if ((var1 >> 8) > gUnknown_08216303[var2] + 20 && (var1 >> 8) < gUnknown_08216303[var2] + 40)
    {
        if (gTasks[taskID].data[0] == 0)
        {
            if (sBerryBlenderData->field_14B == 0)
            {
                u8 rand = Random() / 655;
                if (sBerryBlenderData->field_56 < 500)
                {
                    if (rand > 66)
                        gRecvCmds[2][2] = 0x4523;
                    else
                        gRecvCmds[2][2] = 0x5432;
                }
                else
                {
                    u8 value;
                    if (rand > 65)
                        gRecvCmds[2][2] = 0x4523;
                    value = rand - 41;
                    if (value < 25)
                        gRecvCmds[2][2] = 0x5432;
                    if (rand < 10)
                        sub_804F890(2, 5);
                }

                gTasks[taskID].data[0] = 1;
            }
            else
            {
                gRecvCmds[2][2] = 0x4523;
                gTasks[taskID].data[0] = 1;
            }
        }
    }
    else
        gTasks[taskID].data[0] = 0;
}

void sub_804FB1C(u8 taskID)
{
    u32 var1, var2;

    var1 = (sBerryBlenderData->arrowPos + 0x1800) & 0xFFFF;
    var2 = sBerryBlenderData->field_A2[3] & 0xFF;
    if ((var1 >> 8) > gUnknown_08216303[var2] + 20 && (var1 >> 8) < gUnknown_08216303[var2] + 40)
    {
        if (gTasks[taskID].data[0] == 0)
        {
            if (sBerryBlenderData->field_14B == 0)
            {
                u8 rand = (Random() / 655);
                if (sBerryBlenderData->field_56 < 500)
                {
                    if (rand > 88)
                        gRecvCmds[2][3] = 0x4523;
                    else
                        gRecvCmds[2][3] = 0x5432;
                }
                else
                {
                    if (rand > 60)
                        gRecvCmds[2][3] = 0x4523;
                    else
                    {
                        s8 value = rand - 56; // makes me wonder what the original code was
                        u8 value2 = value;
                        if (value2 < 5)
                            gRecvCmds[2][3] = 0x5432;
                    }
                    if (rand < 5)
                        sub_804F890(3, 5);
                }
                gTasks[taskID].data[0] = 1;
            }
            else
            {
                gRecvCmds[2][3] = 0x4523;
                gTasks[taskID].data[0] = 1;
            }
        }
    }
    else
        gTasks[taskID].data[0] = 0;
}

extern const s8 gUnknown_082162CC[][2];
extern const struct SpriteTemplate gSpriteTemplate_821645C;

void sub_804FC48(u16 a0, u8 a1)
{
    u8 spriteID;

    spriteID = CreateSprite(&gSpriteTemplate_821645C,
                            sBlenderSyncArrowsPos[a1][0] - (10 * gUnknown_082162CC[a1][0]),
                            sBlenderSyncArrowsPos[a1][1] - (10 * gUnknown_082162CC[a1][1]),
                            1);
    if (a0 == 0x4523)
    {
        StartSpriteAnim(&gSprites[spriteID], 2);
        gSprites[spriteID].callback = sub_8051684;
        PlaySE(40);
    }
    else if (a0 == 0x5432)
    {
        StartSpriteAnim(&gSprites[spriteID], 0);
        PlaySE(31);
    }
    else if (a0 == 0x2345)
    {
        StartSpriteAnim(&gSprites[spriteID], 1);
        PlaySE(32);
    }
    sub_805156C();
}

extern const u8 gUnknown_082165DA[];

void sub_804FD30(u16 a0)
{
    Blender_ControlHitPitch();
    switch (a0)
    {
    case 0x4523:
        if (sBerryBlenderData->field_56 < 1500)
            sBerryBlenderData->field_56 += (384 / gUnknown_082165DA[sBerryBlenderData->playersNo]);
        else
        {
            sBerryBlenderData->field_56 += (128 / gUnknown_082165DA[sBerryBlenderData->playersNo]);
            sub_8051AC8(&sBerryBlenderData->field_144, (sBerryBlenderData->field_56 / 100) - 10);
            sub_8051AC8(&sBerryBlenderData->field_146, (sBerryBlenderData->field_56 / 100) - 10);
        }
        break;
    case 0x5432:
        if (sBerryBlenderData->field_56 < 1500)
            sBerryBlenderData->field_56 += (256 / gUnknown_082165DA[sBerryBlenderData->playersNo]);
        break;
    case 0x2345:
        sBerryBlenderData->field_56 -= (256 / gUnknown_082165DA[sBerryBlenderData->playersNo]);
        if (sBerryBlenderData->field_56 < 128)
            sBerryBlenderData->field_56 = 128;
        break;
    }
}

void sub_804FE70(void)
{
    s32 i;

    if (gSpecialVar_0x8004 != 0)
    {
        if (gSendCmd[2] != 0)
        {
            gRecvCmds[2][0] = gSendCmd[2];
            gRecvCmds[0][0] = 0x4444;
            gSendCmd[2] = 0;
        }
        for (i = 1; i < 4; i++)
        {
            if (gRecvCmds[2][i] != 0)
                gRecvCmds[0][i] = 0x4444;
        }
    }
    for (i = 0; i < sBerryBlenderData->playersNo; i++)
    {
        if (gRecvCmds[0][i] == 0x4444)
        {
            u32 var = sBerryBlenderData->field_A2[i];
            if (gRecvCmds[2][i] == 0x4523)
            {
                sub_804FD30(0x4523);
                sBerryBlenderData->field_13E += (sBerryBlenderData->field_56 / 55);
                if (sBerryBlenderData->field_13E >= 1000)
                    sBerryBlenderData->field_13E = 1000;
                sub_804FC48(0x4523, var);
                sBerryBlenderData->scores[i][BLENDER_SCORE_BEST]++;
            }
            else if (gRecvCmds[2][i] == 0x5432)
            {
                sub_804FD30(0x5432);
                sBerryBlenderData->field_13E += (sBerryBlenderData->field_56 / 70);
                sub_804FC48(0x5432, var);
                sBerryBlenderData->scores[i][BLENDER_SCORE_GOOD]++;
            }
            else if (gRecvCmds[2][i] == 0x2345)
            {
                sub_804FC48(0x2345, var);
                sub_804FD30(0x2345);
                if (sBerryBlenderData->field_4.win_field_F > 1000)
                    sBerryBlenderData->field_13E = 1000;
                if (sBerryBlenderData->scores[i][BLENDER_SCORE_MISS] < 999)
                    sBerryBlenderData->scores[i][BLENDER_SCORE_MISS]++;
            }
            if (gRecvCmds[2][i] == 0x2345 || gRecvCmds[2][i] == 0x4523 || gRecvCmds[2][i] == 0x5432)
            {
                if (sBerryBlenderData->field_56 > 1500)
                    m4aMPlayTempoControl(&gMPlay_BGM, ((sBerryBlenderData->field_56 - 750) / 20) + 256);
                else
                    m4aMPlayTempoControl(&gMPlay_BGM, 256);
            }
        }
    }
    if (gSpecialVar_0x8004 != 0)
    {
        for (i = 0; i < sBerryBlenderData->playersNo; i++)
        {
            gRecvCmds[0][i] = 0;
            gRecvCmds[2][i] = 0;
        }
    }
}

extern u8 gUnknown_020297ED;

void sub_80500A8(void)
{
    bool8 A_pressed = 0;
    u8 var2 = sBerryBlenderData->field_A2[GetMultiplayerId()];
    if (sBerryBlenderData->field_6F == 0)
    {
        if (gSaveBlock2.optionsButtonMode == OPTIONS_BUTTON_MODE_L_EQUALS_A && gMain.newKeys & A_BUTTON)
            A_pressed = ((gMain.heldKeysRaw & (A_BUTTON | L_BUTTON)) != (A_BUTTON | L_BUTTON));
        else if (gMain.newKeys & A_BUTTON)
            A_pressed = 1;
        if (A_pressed)
        {
            u8 var3;
            StartSpriteAnim(&gSprites[sBerryBlenderData->SyncArrowSpriteID[sBerryBlenderData->field_9A[var2]]], var2 + 4);
            var3 = sub_804F16C(sBerryBlenderData->arrowPos, GetMultiplayerId());
            if (var3 == 2)
                gSendCmd[2] = 0x4523;
            else if (var3 == 1)
                gSendCmd[2] = 0x5432;
            else
                gSendCmd[2] = 0x2345;
        }
    }
    if (++sBerryBlenderData->field_7E > 5)
    {
        if (sBerryBlenderData->field_56 > 128)
            sBerryBlenderData->field_56--;
        sBerryBlenderData->field_7E = 0;
    }
    if (gUnknown_020297ED && gMain.newKeys & L_BUTTON)
        sBerryBlenderData->field_14B ^= 1;
}

void sub_80501FC(void)
{
    sub_8051474();
    if (sBerryBlenderData->gameFrameTime < (99 * 60 * 60) + (59 * 60)) // game time can't be longer than 99 minutes and 59 seconds, can't print 3 digits
        sBerryBlenderData->gameFrameTime++;
    sub_80500A8();
    SetLinkDebugValues((u16)(sBerryBlenderData->field_56), sBerryBlenderData->field_13E);
    sub_804FE70();
    sub_805194C(sBerryBlenderData->field_13E, 1000);
    sub_8051A3C(sBerryBlenderData->field_56);
    sub_8051B18();
    sub_805123C();
    if (sBerryBlenderData->field_6F == 0 && sBerryBlenderData->field_140 >= 1000)
    {
        sBerryBlenderData->field_13E = 1000;
        sBerryBlenderData->field_6F = 1;
        SetMainCallback2(sub_8050954);
    }
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

#define ARE_FLAVOURS_SAME(flavours1, flavours2)(((*(u32*)(&flavours1[-1]) & 0xFFFFFF00) == (*(u32*)(&flavours2[-1]) & 0xFFFFFF00)&& (*(u32*)(&flavours1[3]) & 0xFFFFFF) == (*(u32*)(&flavours2[3]) & 0xFFFFFF)))

bool8 sub_80502A4(struct BlenderBerry* berries, u8 index1, u8 index2)
{
    if (berries[index1].itemID != berries[index2].itemID
        || (StringCompare(berries[index1].name, berries[index2].name) == 0
            && ARE_FLAVOURS_SAME(berries[index1].flavours, berries[index2].flavours)))
        return 1;
    else
        return 0;
}

#undef ARE_FLAVOURS_SAME

u32 sub_80502F8(struct BlenderBerry* berries, s16* a1, u8 a2, u8 a3)
{
    s16 vars[5];
    s32 i;
    s32 r6;
    u8 r2;

    for (i = 0; i <= 5; i++) // bug, writing one index too far
        vars[i] = a1[i];
    r6 = 0;
    for (i = 0; i < 5; i++)
    {
        if (vars[i] == 0)
            r6++;
    }
    if (r6 == 5 || a3 > 3)
        return 12;
    for (i = 0; i < a2; i++)
    {
        for (r6 = 0; r6 < a2; r6++)
        {
            if (berries[i].itemID == berries[r6].itemID && i != r6
                && (berries[i].itemID != ITEM_ENIGMA_BERRY || sub_80502A4(berries, i, r6)))
                    return 12;
        }
    }
    r2 = 0;
    for (r2 = 0, i = 0; i < 5; i++)
    {
        if (vars[i] > 0)
            r2++;
    }
    if (r2 > 3)
        return 13;
    if (r2 == 3)
        return 11;
    for (i = 0; i < 5; i++)
    {
        if (vars[i] > 50)
            return 14;
    }
    if (r2 == 1 && vars[0] > 0)
        return 1;
    if (r2 == 1 && vars[1] > 0)
        return 2;
    if (r2 == 1 && vars[2] > 0)
        return 3;
    if (r2 == 1 && vars[3] > 0)
        return 4;
    if (r2 == 1 && vars[4] > 0)
        return 5;
    if (r2 == 2)
    {
        s32 var = 0;
        for (i = 0; i < 5; i++)
        {
            if (vars[i] > 0)
                gUnknown_03000520[var++] = i;
        }
        if (vars[gUnknown_03000520[0]] >= vars[gUnknown_03000520[1]])
        {
            if (gUnknown_03000520[0] == 0)
                return (gUnknown_03000520[1] << 16) | 6;
            if (gUnknown_03000520[0] == 1)
                return (gUnknown_03000520[1] << 16) | 7;
            if (gUnknown_03000520[0] == 2)
                return (gUnknown_03000520[1] << 16) | 8;
            if (gUnknown_03000520[0] == 3)
                return (gUnknown_03000520[1] << 16) | 9;
            if (gUnknown_03000520[0] == 4)
                return (gUnknown_03000520[1] << 16) | 10;
        }
        else
        {
            if (gUnknown_03000520[1] == 0)
                return (gUnknown_03000520[0] << 16) | 6;
            if (gUnknown_03000520[1] == 1)
                return (gUnknown_03000520[0] << 16) | 7;
            if (gUnknown_03000520[1] == 2)
                return (gUnknown_03000520[0] << 16) | 8;
            if (gUnknown_03000520[1] == 3)
                return (gUnknown_03000520[0] << 16) | 9;
            if (gUnknown_03000520[1] == 4)
                return (gUnknown_03000520[0] << 16) | 10;
        }
    }
    return 0;
}

extern s16 gUnknown_0300052C;
extern s16 gUnknown_0300052E;

void sub_80504F0(s16 value)
{
    gUnknown_0300052C = value;
}

s16 unref_sub_80504FC(void)
{
    return gUnknown_0300052C;
}

void sub_8050508(s16 value)
{
    gUnknown_0300052E = value;
}

s16 unref_sub_8050514(void)
{
    return gUnknown_0300052E;
}

extern s16 gUnknown_03000510[6];
extern s32 gUnknown_03000530[];
extern s32 gUnknown_03000548[];
extern u32 gUnknown_0300055C;

extern const u8 gUnknown_082165DF[];

#ifdef NONMATCHING

void sub_8050520(struct BlenderBerry* berries, struct Pokeblock* pokeblock, u8 a2, u8* a3, u16 a4)
{
    s32 i;
    s32 j;
    s32 savedEntry;
    s32 var3;
    s32 var4;
    s32 var6;
    s32 var11;
    u16 rand;

    for (i = 0; i < 6; i++)
        gUnknown_03000510[i] = 0;
    for (i = 0; i < a2; i++)
    {
        for (j = 0; j < 5; j++)
            gUnknown_03000510[j] += berries[i].flavours[j];
    }

    savedEntry = gUnknown_03000510[0];
    gUnknown_03000510[0] -= gUnknown_03000510[1];
    gUnknown_03000510[1] -= gUnknown_03000510[2];
    gUnknown_03000510[2] -= gUnknown_03000510[3];
    gUnknown_03000510[3] -= gUnknown_03000510[4];
    gUnknown_03000510[4] -= savedEntry;

    var6 = 0;
    for (i = 0; i < 6; i++)
    {
        if (gUnknown_03000510[i] < 0)
        {
            gUnknown_03000510[i] = 0;
            var6++;
        }
    }
    for (i = 0; i < 5; i++)
    {
        if (gUnknown_03000510[i] > 0)
        {
            if (gUnknown_03000510[i] < var6)
                gUnknown_03000510[i] = 0;
            else
                gUnknown_03000510[i] -= var6;
        }
    }
    for (i = 0; i < 5; i++)
    {
        gUnknown_03000530[i] = gUnknown_03000510[i];
    }

    var11 = a4 / 333 + 100;
    gUnknown_0300055C = ((var11));

    for (i = 0; i < 5; i++)
    {
        var3 = gUnknown_03000510[i];
        var3 = ((var11) * var3) / 10;
        var4 = var3 % 10;
        var3 /= 10;
        if (var4 > 4)
            var3++;
        gUnknown_03000510[i] = var3;
    }
    for (i = 0; i < 5; i++)
    {
        gUnknown_03000548[i] = gUnknown_03000510[i];
    }
    *a1 = sub_80502F8(berries, &gUnknown_03000510[0], a2, var6);
    gUnknown_03000510[5] = (gUnknown_03000510[5] / a2) - a2;
    if (gUnknown_03000510[5] < 0)
        gUnknown_03000510[5] = 0;
    if (*a1 == 12)
    {
        rand = Random() % 10;
        for (i = 0; i < 6; i++)
        {
            if ((gUnknown_082165DF[rand] >> i) & 1)
                gUnknown_03000510[i] = 2;
            else
                gUnknown_03000510[i] = 0;
        }
    }
    for (i = 0; i < 6; i++)
    {
        if (gUnknown_03000510[i] > 255)
            gUnknown_03000510[i] = 255;
    }
    a1[1] = gUnknown_03000510[0];
    a1[2] = gUnknown_03000510[1];
    a1[3] = gUnknown_03000510[2];
    a1[4] = gUnknown_03000510[3];
    a1[5] = gUnknown_03000510[4];
    a1[6] = gUnknown_03000510[5];
    for (i = 0; i < 6; i++)
    {
        a3[i] = gUnknown_03000510[i];
    }
}

#else
__attribute__((naked))
void sub_8050520(struct BlenderBerry* berries, struct Pokeblock* pokeblock, u8 a2, u8* a3, u16 a4)
{
    asm(".syntax unified\n\
	push {r4-r7,lr}\n\
	mov r7, r10\n\
	mov r6, r9\n\
	mov r5, r8\n\
	push {r5-r7}\n\
	sub sp, 0x10\n\
	str r0, [sp]\n\
	mov r8, r1\n\
	str r3, [sp, 0x4]\n\
	ldr r0, [sp, 0x30]\n\
	lsls r2, 24\n\
	lsrs r2, 24\n\
	mov r9, r2\n\
	lsls r0, 16\n\
	lsrs r0, 16\n\
	str r0, [sp, 0x8]\n\
	ldr r7, _080505DC @ =gUnknown_03000510\n\
	adds r2, r7, 0\n\
	movs r1, 0\n\
	adds r0, r7, 0\n\
	adds r0, 0xA\n\
_0805054A:\n\
	strh r1, [r0]\n\
	subs r0, 0x2\n\
	cmp r0, r2\n\
	bge _0805054A\n\
	movs r6, 0\n\
	cmp r6, r9\n\
	bge _08050580\n\
	ldr r0, _080505DC @ =gUnknown_03000510\n\
	mov r12, r0\n\
	ldr r5, [sp]\n\
	adds r5, 0x9\n\
_08050560:\n\
	movs r3, 0\n\
	adds r4, r5, 0\n\
	mov r2, r12\n\
_08050566:\n\
	adds r1, r4, r3\n\
	ldrh r0, [r2]\n\
	ldrb r1, [r1]\n\
	adds r0, r1\n\
	strh r0, [r2]\n\
	adds r2, 0x2\n\
	adds r3, 0x1\n\
	cmp r3, 0x5\n\
	ble _08050566\n\
	adds r5, 0x10\n\
	adds r6, 0x1\n\
	cmp r6, r9\n\
	blt _08050560\n\
_08050580:\n\
	movs r1, 0\n\
	ldrsh r3, [r7, r1]\n\
	ldrh r0, [r7]\n\
	ldrh r1, [r7, 0x2]\n\
	subs r0, r1\n\
	strh r0, [r7]\n\
	ldrh r0, [r7, 0x4]\n\
	subs r1, r0\n\
	strh r1, [r7, 0x2]\n\
	ldrh r1, [r7, 0x6]\n\
	subs r0, r1\n\
	strh r0, [r7, 0x4]\n\
	ldrh r0, [r7, 0x8]\n\
	subs r1, r0\n\
	strh r1, [r7, 0x6]\n\
	subs r0, r3\n\
	strh r0, [r7, 0x8]\n\
	movs r3, 0\n\
	movs r2, 0\n\
	adds r1, r7, 0\n\
	movs r6, 0x4\n\
_080505AA:\n\
	movs r4, 0\n\
	ldrsh r0, [r1, r4]\n\
	cmp r0, 0\n\
	bge _080505B6\n\
	strh r2, [r1]\n\
	adds r3, 0x1\n\
_080505B6:\n\
	adds r1, 0x2\n\
	subs r6, 0x1\n\
	cmp r6, 0\n\
	bge _080505AA\n\
	lsls r0, r3, 24\n\
	lsrs r0, 24\n\
	mov r10, r0\n\
	movs r4, 0\n\
	ldr r1, _080505DC @ =gUnknown_03000510\n\
	movs r6, 0x4\n\
_080505CA:\n\
	ldrh r2, [r1]\n\
	movs r5, 0\n\
	ldrsh r0, [r1, r5]\n\
	cmp r0, 0\n\
	ble _080505E4\n\
	cmp r0, r3\n\
	bge _080505E0\n\
	strh r4, [r1]\n\
	b _080505E4\n\
	.align 2, 0\n\
_080505DC: .4byte gUnknown_03000510\n\
_080505E0:\n\
	subs r0, r2, r3\n\
	strh r0, [r1]\n\
_080505E4:\n\
	adds r1, 0x2\n\
	subs r6, 0x1\n\
	cmp r6, 0\n\
	bge _080505CA\n\
	ldr r1, _080506C4 @ =gUnknown_03000510\n\
	ldr r2, _080506C8 @ =gUnknown_03000530\n\
	movs r6, 0x4\n\
_080505F2:\n\
	movs r3, 0\n\
	ldrsh r0, [r1, r3]\n\
	stm r2!, {r0}\n\
	adds r1, 0x2\n\
	subs r6, 0x1\n\
	cmp r6, 0\n\
	bge _080505F2\n\
	ldr r1, _080506CC @ =0x0000014d\n\
	ldr r0, [sp, 0x8]\n\
	bl __udivsi3\n\
	lsls r0, 16\n\
	lsrs r0, 16\n\
	adds r3, r0, 0\n\
	adds r3, 0x64\n\
	ldr r4, _080506D0 @ =gUnknown_0300055C\n\
	str r3, [r4]\n\
	movs r6, 0x4\n\
_08050616:\n\
	movs r0, 0\n\
	ldrsh r5, [r7, r0]\n\
	adds r0, r5, 0\n\
	muls r0, r3\n\
	movs r1, 0xA\n\
	str r3, [sp, 0xC]\n\
	bl __divsi3\n\
	adds r5, r0, 0\n\
	movs r1, 0xA\n\
	bl __modsi3\n\
	adds r4, r0, 0\n\
	adds r0, r5, 0\n\
	movs r1, 0xA\n\
	bl __divsi3\n\
	adds r5, r0, 0\n\
	ldr r3, [sp, 0xC]\n\
	cmp r4, 0x4\n\
	ble _08050642\n\
	adds r5, 0x1\n\
_08050642:\n\
	strh r5, [r7]\n\
	adds r7, 0x2\n\
	subs r6, 0x1\n\
	cmp r6, 0\n\
	bge _08050616\n\
	ldr r1, _080506C4 @ =gUnknown_03000510\n\
	ldr r2, _080506D4 @ =gUnknown_03000548\n\
	movs r6, 0x4\n\
_08050652:\n\
	movs r3, 0\n\
	ldrsh r0, [r1, r3]\n\
	stm r2!, {r0}\n\
	adds r1, 0x2\n\
	subs r6, 0x1\n\
	cmp r6, 0\n\
	bge _08050652\n\
	ldr r4, _080506C4 @ =gUnknown_03000510\n\
	ldr r0, [sp]\n\
	adds r1, r4, 0\n\
	mov r2, r9\n\
	mov r3, r10\n\
	bl sub_80502F8\n\
	mov r5, r8\n\
	strb r0, [r5]\n\
	movs r1, 0xA\n\
	ldrsh r0, [r4, r1]\n\
	mov r1, r9\n\
	bl __divsi3\n\
	mov r3, r9\n\
	subs r0, r3\n\
	strh r0, [r4, 0xA]\n\
	lsls r0, 16\n\
	cmp r0, 0\n\
	bge _0805068C\n\
	movs r0, 0\n\
	strh r0, [r4, 0xA]\n\
_0805068C:\n\
	mov r5, r8\n\
	ldrb r0, [r5]\n\
	cmp r0, 0xC\n\
	bne _080506E6\n\
	bl Random\n\
	lsls r0, 16\n\
	lsrs r0, 16\n\
	movs r1, 0xA\n\
	bl __umodsi3\n\
	lsls r0, 16\n\
	lsrs r3, r0, 16\n\
	movs r6, 0\n\
	ldr r0, _080506D8 @ =gUnknown_082165DF\n\
	adds r0, r3, r0\n\
	ldrb r0, [r0]\n\
	adds r1, r4, 0\n\
	movs r4, 0x1\n\
	movs r3, 0x2\n\
_080506B4:\n\
	adds r2, r0, 0\n\
	asrs r2, r6\n\
	ands r2, r4\n\
	cmp r2, 0\n\
	beq _080506DC\n\
	strh r3, [r1]\n\
	b _080506DE\n\
	.align 2, 0\n\
_080506C4: .4byte gUnknown_03000510\n\
_080506C8: .4byte gUnknown_03000530\n\
_080506CC: .4byte 0x0000014d\n\
_080506D0: .4byte gUnknown_0300055C\n\
_080506D4: .4byte gUnknown_03000548\n\
_080506D8: .4byte gUnknown_082165DF\n\
_080506DC:\n\
	strh r2, [r1]\n\
_080506DE:\n\
	adds r1, 0x2\n\
	adds r6, 0x1\n\
	cmp r6, 0x4\n\
	ble _080506B4\n\
_080506E6:\n\
	ldr r7, _08050740 @ =gUnknown_03000510\n\
	movs r2, 0xFF\n\
	adds r1, r7, 0\n\
	movs r6, 0x5\n\
_080506EE:\n\
	movs r3, 0\n\
	ldrsh r0, [r1, r3]\n\
	cmp r0, 0xFF\n\
	ble _080506F8\n\
	strh r2, [r1]\n\
_080506F8:\n\
	adds r1, 0x2\n\
	subs r6, 0x1\n\
	cmp r6, 0\n\
	bge _080506EE\n\
	ldrh r0, [r7]\n\
	mov r4, r8\n\
	strb r0, [r4, 0x1]\n\
	ldrh r0, [r7, 0x2]\n\
	strb r0, [r4, 0x2]\n\
	ldrh r0, [r7, 0x4]\n\
	strb r0, [r4, 0x3]\n\
	ldrh r0, [r7, 0x6]\n\
	strb r0, [r4, 0x4]\n\
	ldrh r0, [r7, 0x8]\n\
	strb r0, [r4, 0x5]\n\
	ldrh r0, [r7, 0xA]\n\
	strb r0, [r4, 0x6]\n\
	movs r6, 0\n\
	adds r2, r7, 0\n\
_0805071E:\n\
	ldr r5, [sp, 0x4]\n\
	adds r1, r5, r6\n\
	ldrh r0, [r2]\n\
	strb r0, [r1]\n\
	adds r2, 0x2\n\
	adds r6, 0x1\n\
	cmp r6, 0x5\n\
	ble _0805071E\n\
	add sp, 0x10\n\
	pop {r3-r5}\n\
	mov r8, r3\n\
	mov r9, r4\n\
	mov r10, r5\n\
	pop {r4-r7}\n\
	pop {r0}\n\
	bx r0\n\
	.align 2, 0\n\
_08050740: .4byte gUnknown_03000510\n\
        .syntax divided");
}

#endif // NONMATCHING

void sub_8050744(struct BlenderBerry* berries, struct Pokeblock* pokeblock, u8 a2, u8* a3, u16 a4)
{
    sub_8050520(berries, pokeblock, a2, a3, a4); // what is the purpose of this function?
}

void sub_8050760(void)
{
    u32 frames = (u16)(sBerryBlenderData->gameFrameTime);
    u32 max_RPM = (u16)(sBerryBlenderData->max_RPM);
    s16 var = 0;

    if (frames < 900)
        var = 5;
    else if ((u16)(frames - 900) < 600)
        var = 4;
    else if ((u16)(frames - 1500) < 600)
        var = 3;
    else if ((u16)(frames - 2100) < 900)
        var = 2;
    else if ((u16)(frames - 3300) < 300)
        var = 1;
    sub_8050508(var);

    var = 0;
    if (max_RPM <= 64)
    {
        if ((u16)(max_RPM - 50) < 50)
            var = -1;
        else if ((u16)(max_RPM - 100) < 50)
            var = -2;
        else if ((u16)(max_RPM - 150) < 50)
            var = -3;
        else if ((u16)(max_RPM - 200) < 50)
            var = -4;
        else if ((u16)(max_RPM - 250) < 50)
            var = -5;
        else if ((u16)(max_RPM - 350) < 50)
            var = -6;
        else if ((u16)(max_RPM - 400) < 50)
            var = -7;
        else if ((u16)(max_RPM - 500) < 50)
            var = -8;
        else if ((u16)(max_RPM - 550) < 50)
            var = -9;
        else if (max_RPM >= 600)
            var = -10;
    }
    sub_80504F0(var);
}

void sub_80508D4(u8 value)
{
    sBerryBlenderData->field_AA = value;
    sub_814A880(192, (sBerryBlenderData->field_AA * 16) + 72);
}

void sub_80508FC(void)
{
    sBerryBlenderData->field_AA = 0;
    MenuDrawTextWindow(23, 8, 28, 13);
    sub_814A5C0(0, -1, 12, 0x2D9F, 32);
    MenuPrint(gOtherText_YesNoTerminating, 24, 9);
    sub_80508D4(sBerryBlenderData->field_AA);
}

void sub_8050954(void)
{
    u8 i;
    u8 multiplayerID; // unused

    sub_8051474();
    multiplayerID = GetMultiplayerId();
    switch (sBerryBlenderData->field_6F)
    {
    case 1:
        ClearLinkCallback();
        m4aMPlayTempoControl(&gMPlay_BGM, 256);
        for (i = 0; i < gSpecialVar_0x8004; i++)
        {
            DestroyTask(sBerryBlenderData->field_148[i]);
        }
        sBerryBlenderData->field_6F++;
        break;
    case 2:
        sBerryBlenderData->field_56 -= 32;
        if (sBerryBlenderData->field_56 <= 0)
        {
            sBerryBlenderData->field_56 = 0;
            if (gReceivedRemoteLinkPlayers != 0)
                sBerryBlenderData->field_6F++;
            else
                sBerryBlenderData->field_6F = 5;
            sBerryBlenderData->field_0 = 0;
            m4aMPlayStop(&gMPlay_SE2);
        }
        Blender_ControlHitPitch();
        break;
    case 3:
        if (/*multiplayerID != 0*/ GetMultiplayerId() != 0)
            sBerryBlenderData->field_6F++;
        else if (sub_8007ECC())
        {
            sBerryBlenderData->field_1BC = sBerryBlenderData->gameFrameTime;
            sBerryBlenderData->field_1C0 = sBerryBlenderData->max_RPM;
            SendBlock(0, &sBerryBlenderData->field_1BC, 40);
            sBerryBlenderData->field_6F++;
        }
        break;
    case 4:
        if (GetBlockReceivedStatus())
        {
            u32* ptr = ((u32*)(&gBlockRecvBuffer[0][0]));
            sBerryBlenderData->max_RPM = gBlockRecvBuffer[0][2];
            sBerryBlenderData->gameFrameTime = *ptr;
            sBerryBlenderData->field_6F++;
            ResetBlockReceivedFlags();
        }
        break;
    case 5:
        if (Blender_PrintBlendingRanking())
            sBerryBlenderData->field_6F++;
        break;
    case 6:
        if (Blender_PrintBlendingResults())
        {
            if (gUnknown_03004834 == 0)
                IncrementGameStat(34);
            else
                IncrementGameStat(33);
            sBerryBlenderData->field_6F++;
        }
        break;
    case 7:
        sBerryBlenderData->field_6F++;
        MenuDrawTextWindow(0, 14, 29, 19);
        MenuPrintMessage(gOtherText_BlendAnotherBerryPrompt, 1, 15);
        break;
    case 8:
        if (MenuUpdateWindowText())
            sBerryBlenderData->field_6F++;
        break;
    case 9:
        sBerryBlenderData->field_AA = 0;
        sub_80508FC();
        sBerryBlenderData->field_6F++;
        break;
    case 10:
        if (gMain.newKeys & DPAD_UP)
        {
            if (sBerryBlenderData->field_AA != 0)
                PlaySE(SE_SELECT);
            sub_80508D4(0);
        }
        else if (gMain.newKeys & DPAD_DOWN)
        {
            if (sBerryBlenderData->field_AA != 1)
                PlaySE(SE_SELECT);
            sub_80508D4(1);
        }
        else if (gMain.newKeys & A_BUTTON)
        {
            PlaySE(SE_SELECT);
            sBerryBlenderData->field_6F++;
        }
        else if (gMain.newKeys & B_BUTTON)
        {
            PlaySE(SE_SELECT);
            sBerryBlenderData->field_6F++;
            sub_80508D4(1);
        }
        break;
    case 11:
        gSendCmd[0] = 0x2FFF;
        if (sBerryBlenderData->field_AA == 0)
        {
            if (IsBagPocketNonEmpty(BAG_BERRIES) == FALSE) // is empty
            {
                sBerryBlenderData->field_7C = 2;
                gSendCmd[1] = 0x9999;
            }
            else if (sub_810CA00() == -1)
            {
                sBerryBlenderData->field_7C = 3;
                gSendCmd[1] = 0xAAAA;
            }
            else
            {
                sBerryBlenderData->field_7C = 0;
                gSendCmd[1] = 0x7779;
            }
            sBerryBlenderData->field_6F++;
        }
        else
        {
            sBerryBlenderData->field_7C = 1;
            gSendCmd[1] = 0x8888;
            sBerryBlenderData->field_6F++;
        }
        break;
    case 12:
        if (gUnknown_03004834)
        {
            SetMainCallback2(sub_80510E8);
            sBerryBlenderData->field_6F = 0;
            sBerryBlenderData->field_0 = 0;
        }
        else
        {
            MenuPrintMessage(gOtherText_LinkStandby3, 1, 15);
            sBerryBlenderData->field_6F++;
        }
        break;
    case 13:
        if (MenuUpdateWindowText())
        {
            SetMainCallback2(sub_8050E30);
            sBerryBlenderData->field_6F = 0;
            sBerryBlenderData->field_0 = 0;
        }
        break;
    }
    sub_8051B18();
    sub_8051A3C(sBerryBlenderData->field_56);
    sub_805123C();
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

bool8 sub_8050CE8(void)
{
    switch (sBerryBlenderData->field_1C4)
    {
    case 0:
        sub_80084A4();
        sBerryBlenderData->field_1C4 = 1;
        sBerryBlenderData->framesToWait = 0;
        break;
    case 1:
        if (sub_8007ECC())
        {
            sBerryBlenderData->field_1C4++;
            gSoftResetDisabled = TRUE;
        }
        break;
    case 2:
        sub_8125E2C();
        sBerryBlenderData->field_1C4++;
        sBerryBlenderData->framesToWait = 0;
        break;
    case 3:
        if (++sBerryBlenderData->framesToWait == 10)
        {
            sub_80084A4();
            sBerryBlenderData->field_1C4++;
        }
        break;
    case 4:
        if (sub_8007ECC())
        {
            if (sub_8125E6C())
                sBerryBlenderData->field_1C4 = 5;
            else
            {
                sBerryBlenderData->framesToWait = 0;
                sBerryBlenderData->field_1C4 = 3;
            }
        }
        break;
    case 5:
        sBerryBlenderData->field_1C4++;
        sBerryBlenderData->framesToWait = 0;
        break;
    case 6:
        if (++sBerryBlenderData->framesToWait > 5)
        {
            gSoftResetDisabled = FALSE;
            return 1;
        }
        break;
    }
    return 0;
}

void sub_8050E30(void)
{
    switch (sBerryBlenderData->field_6F)
    {
    case 0:
        if (sBerryBlenderData->field_70[0] == 0x2222)
            sBerryBlenderData->field_6F = 5;
        else if (sBerryBlenderData->field_70[0] == 0x1111)
        {
            if (sBerryBlenderData->field_78 == 0x9999)
                sBerryBlenderData->field_6F = 2;
            else if (sBerryBlenderData->field_78 == 0xAAAA)
                sBerryBlenderData->field_6F = 1;
            else
                sBerryBlenderData->field_6F = 5;
        }
        break;
    case 1:
        sBerryBlenderData->field_6F = 3;
        DestroyMenuCursor();
        MenuZeroFillWindowRect(23, 8, 28, 13);
        StringCopy(gStringVar4, gLinkPlayers[sBerryBlenderData->field_7A].name);
        StringAppend(gStringVar4, gOtherText_OtherCaseIsFull);
        MenuPrintMessage(gStringVar4, 1, 15);
        break;
    case 2:
        sBerryBlenderData->field_6F++;
        DestroyMenuCursor();
        MenuZeroFillWindowRect(23, 8, 28, 13);
        StringCopy(gStringVar4, gLinkPlayers[sBerryBlenderData->field_7A].name);
        StringAppend(gStringVar4, gOtherText_NoBerriesForBlend);
        MenuPrintMessage(gStringVar4, 1, 15);
        break;
    case 3:
        if (MenuUpdateWindowText())
        {
            sBerryBlenderData->framesToWait = 0;
            sBerryBlenderData->field_6F++;
        }
        break;
    case 4:
        if (++sBerryBlenderData->framesToWait > 60)
            sBerryBlenderData->field_6F = 5;
        break;
    case 5:
        MenuDrawTextWindow(0, 14, 29, 19);
        MenuPrint(gMultiText_Saving, 2, 15);
        sub_80084A4();
        sBerryBlenderData->field_6F++;
        break;
    case 6:
        if (sub_8007ECC())
        {
            sBerryBlenderData->framesToWait = 0;
            sBerryBlenderData->field_6F++;
            sBerryBlenderData->field_1C4 = 0;
        }
        break;
    case 7:
        if (sub_8050CE8())
        {
            PlaySE(SE_SAVE);
            sBerryBlenderData->field_6F++;
        }
        break;
    case 8:
        sBerryBlenderData->field_6F++;
        sub_80084A4();
        break;
    case 9:
        if (sub_8007ECC())
        {
            BeginNormalPaletteFade(-1, 0, 0, 0x10, 0);
            sBerryBlenderData->field_6F++;
        }
        break;
    case 10:
        if (!gPaletteFade.active)
        {
            if (sBerryBlenderData->field_70[0] == 0x2222)
                SetMainCallback2(sub_804E538);
            else
            {
                sBerryBlenderData->framesToWait = 0;
                sBerryBlenderData->field_6F++;
            }
        }
        break;
    case 11:
        if (++sBerryBlenderData->framesToWait > 30)
        {
            sub_800832C();
            sBerryBlenderData->field_6F++;
        }
        break;
    case 12:
        if (gReceivedRemoteLinkPlayers == 0)
            SetMainCallback2(c2_exit_to_overworld_1_continue_scripts_restart_music);
        break;
    }

    sub_805123C();
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

void sub_80510E8(void)
{
    switch (sBerryBlenderData->field_6F)
    {
    case 0:
        if (sBerryBlenderData->field_7C < 2)
            sBerryBlenderData->field_6F = 9;
        if (sBerryBlenderData->field_7C == 2)
            sBerryBlenderData->field_6F = 2;
        if (sBerryBlenderData->field_7C == 3)
            sBerryBlenderData->field_6F =1;
        break;
    case 1:
        sBerryBlenderData->field_6F = 3;
        DestroyMenuCursor();
        MenuZeroFillWindowRect(23, 8, 28, 13);
        MenuPrintMessage(gOtherText_CaseIsFull, 1, 15);
        break;
    case 2:
        sBerryBlenderData->field_6F++;
        DestroyMenuCursor();
        MenuZeroFillWindowRect(23, 8, 28, 13);
        MenuPrintMessage(gOtherText_OutOfBerries, 1, 15);
        break;
    case 3:
        if (MenuUpdateWindowText())
            sBerryBlenderData->field_6F = 9;
        break;
    case 9:
        BeginFastPaletteFade(3);
        sBerryBlenderData->field_6F++;
        break;
    case 10:
        if (!gPaletteFade.active)
        {
            if (sBerryBlenderData->field_7C == 0)
                SetMainCallback2(sub_804E538);
            else
                SetMainCallback2(c2_exit_to_overworld_1_continue_scripts_restart_music);
        }
        break;
    }

    sub_805123C();
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

void sub_805123C(void)
{
    if (gReceivedRemoteLinkPlayers)
    {
        if (gRecvCmds[0][0] == 0x2FFF)
        {
            if (gRecvCmds[1][0] == 0x1111)
            {
                switch (gRecvCmds[2][0])
                {
                case 0x8888:
                    sBerryBlenderData->field_78 = 0x8888;
                    sBerryBlenderData->field_7A = gRecvCmds[3][0];
                    break;
                case 0x9999:
                    sBerryBlenderData->field_78 = 0x9999;
                    sBerryBlenderData->field_7A = gRecvCmds[3][0];
                    break;
                case 0xAAAA:
                    sBerryBlenderData->field_78 = 0xAAAA;
                    sBerryBlenderData->field_7A = gRecvCmds[3][0];
                    break;
                }
                sBerryBlenderData->field_70[0] = 0x1111;
            }
            else if (gRecvCmds[1][0] == 0x2222)
                sBerryBlenderData->field_70[0] = 0x2222;
        }
        if (GetMultiplayerId() == 0 && sBerryBlenderData->field_70[0] != 0x1111 && sBerryBlenderData->field_70[0] != 0x2222)
        {
            u8 i;
            for (i = 0; i < GetLinkPlayerCount(); i++)
            {
                if (gRecvCmds[0][i] == 0x2FFF)
                {
                    switch (gRecvCmds[1][i])
                    {
                    case 0x8888:
                        sBerryBlenderData->field_70[i] = 0x8888;
                        break;
                    case 0x7779:
                        sBerryBlenderData->field_70[i] = 0x7779;
                        break;
                    case 0x9999:
                        sBerryBlenderData->field_70[i] = 0x9999;
                        break;
                    case 0xAAAA:
                        sBerryBlenderData->field_70[i] = 0xAAAA;
                        break;
                    }
                }
            }
            for (i = 0; i < GetLinkPlayerCount(); i++)
            {
                if (sBerryBlenderData->field_70[i] == 0)
                    break;
            }
            if (i == GetLinkPlayerCount())
            {
                for (i = 0; i < GetLinkPlayerCount(); i++)
                {
                    if (sBerryBlenderData->field_70[i] != 0x7779)
                        break;
                }
                gSendCmd[0] = 0x2FFF;
                if (i == GetLinkPlayerCount())
                    gSendCmd[1] = 0x2222;
                else
                {
                    gSendCmd[1] = 0x1111;
                    gSendCmd[2] = sBerryBlenderData->field_70[i];
                    gSendCmd[3] = i;
                }
            }
        }
    }
}

void sub_8051414(struct BgAffineDstData *dest)
{
    struct BgAffineSrcData affineSrc;
    affineSrc.texX = 30720;
    affineSrc.texY = 20480;
    affineSrc.scrX = 120 - sBerryBlenderData->field_144;
    affineSrc.scrY = 80 - sBerryBlenderData->field_146;
    affineSrc.sx = sBerryBlenderData->field_142;
    affineSrc.sy = sBerryBlenderData->field_142;
    affineSrc.alpha = sBerryBlenderData->arrowPos;
    BgAffineSet(&affineSrc, dest, 1);
}

void sub_8051474(void)
{
    sBerryBlenderData->field_58 = sBerryBlenderData->arrowPos;
    sBerryBlenderData->arrowPos += sBerryBlenderData->field_56;
    sub_8051414(&sBerryBlenderData->field_168);
}

void sub_80514A4(void)
{
    REG_BG2PA = sBerryBlenderData->field_168.pa;
    REG_BG2PB = sBerryBlenderData->field_168.pb;
    REG_BG2PC = sBerryBlenderData->field_168.pc;
    REG_BG2PD = sBerryBlenderData->field_168.pd;
    REG_BG2X = sBerryBlenderData->field_168.dx;
    REG_BG2Y = sBerryBlenderData->field_168.dy;
}

void sub_80514F0(void)
{
    REG_BG1HOFS = sBerryBlenderData->field_144;
    REG_BG1VOFS = sBerryBlenderData->field_146;
    REG_BG0HOFS = sBerryBlenderData->field_144;
    REG_BG0VOFS = sBerryBlenderData->field_146;
}

void sub_8051524(struct Sprite* sprite)
{
    sprite->data2 += sprite->data0;
    sprite->data3 += sprite->data1;
    sprite->pos2.x = sprite->data2 / 8;
    sprite->pos2.y = sprite->data3 / 8;
    if (sprite->animEnded)
        DestroySprite(sprite);
}

extern const struct SpriteTemplate gSpriteTemplate_82164FC;

void sub_805156C(void)
{
    s32 limit = (Random() % 2) + 1;
    s32 i;

    for (i = 0; i < limit; i++)
    {
        u16 rand;
        s32 x, y;
        u8 spriteID;

        rand = sBerryBlenderData->arrowPos + (Random() % 20);

        x = gSineTable[(rand & 0xFF) + 64] / 4;
        y = gSineTable[(rand & 0xFF)] / 4;

        spriteID = CreateSprite(&gSpriteTemplate_82164FC, x + 120, y + 80, 1);
        gSprites[spriteID].data0 = 16 - (Random() % 32);
        gSprites[spriteID].data1 = 16 - (Random() % 32);

        gSprites[spriteID].callback = sub_8051524;
    }
}

void sub_8051650(struct Sprite* sprite)
{
    sprite->data0++;
    sprite->pos2.y = -(sprite->data0 / 3);
    if (sprite->animEnded)
        DestroySprite(sprite);
}

void sub_8051684(struct Sprite* sprite)
{
    sprite->data0++;
    sprite->pos2.y = -(sprite->data0 * 2);
    if (sprite->pos2.y < -12)
        sprite->pos2.y = -12;
    if (sprite->animEnded)
        DestroySprite(sprite);
}

void Blender_SetBankBerryData(u8 bank, u16 itemID)
{
    sBerryBlenderData->chosenItemID[bank] = itemID;
    Blender_CopyBerryData(&sBerryBlenderData->blendedBerries[bank], itemID);
}

extern const u8* const gUnknown_08216284[];
extern u8 byte_3002A68;

void unref_sub_80516F8(u8 taskID)
{
    struct Task* task = &gTasks[taskID];
    if (gReceivedRemoteLinkPlayers)
    {
        s32 i;
        if (GetMultiplayerId() == 0)
        {
            if (++task->data[0] > 120)
                task->data[0] = 0;
            if (task->data[0] == 100)
            {
                ZeroFillWindowRect(&sBerryBlenderData->field_4, 0, 0, 16, 20);
                MenuDrawTextWindow(4, 4, 10, 12);
                for (i = 0; i < 3; i++)
                {
                    if (gLinkPlayers[i + 1].trainerId != 0)
                        MenuPrint(gUnknown_08216284[i], 5, (2 * i) + 5);
                    MenuDrawTextWindow(0, 13, 29, 19);
                    MenuPrint(gOtherText_PressAToStart, 1, 15);
                }
            }
            if (gMain.newKeys & A_BUTTON)
            {
                sub_8007E4C();
                DestroyTask(taskID);
            }
        }
        else
        {
            if (task->data[0] == 10)
                MenuPrint(gOtherText_PleaseWait, 3, 10);
            if (++task->data[0] > 120)
                task->data[0] = 0;
            if (byte_3002A68 > 4 && gReceivedRemoteLinkPlayers == 1)
                DestroyTask(taskID);
        }
    }
}

extern const struct SpriteTemplate gSpriteTemplate_821657C;

void sub_805181C(struct Sprite* sprite)
{
    switch (sprite->data0)
    {
    case 0:
        sprite->data1 += 8;
        if (sprite->data1 > 88)
        {
            sprite->data1 = 88;
            sprite->data0++;
            PlaySE(SE_KON);
        }
        break;
    case 1:
        sprite->data2 += 1;
        if (sprite->data2 > 20)
        {
            sprite->data0++;
            sprite->data2 = 0;
        }
        break;
    case 2:
        sprite->data1 += 4;
        if (sprite->data1 > 176)
        {
            if (++sprite->data3 == 3)
            {
                DestroySprite(sprite);
                CreateSprite(&gSpriteTemplate_821657C, 120, -20, 2);
            }
            else
            {
                sprite->data0 = 0;
                sprite->data1 = -16;
                StartSpriteAnim(sprite, sprite->data3);
            }
        }
        break;
    }
    sprite->pos2.y = sprite->data1;
}

void sub_80518CC(struct Sprite* sprite)
{
    switch (sprite->data0)
    {
    case 0:
        sprite->data1 += 8;
        if (sprite->data1 > 92)
        {
            sprite->data1 = 92;
            sprite->data0++;
            PlaySE(SE_PIN);
        }
        break;
    case 1:
        sprite->data2 += 1;
        if (sprite->data2 > 20)
            sprite->data0++;
        break;
    case 2:
        sprite->data1 += 4;
        if (sprite->data1 > 176)
        {
            sBerryBlenderData->field_0++;
            DestroySprite(sprite);
        }
        break;
    }
    sprite->pos2.y = sprite->data1;
}

void sub_805194C(u16 a0, u16 a1)
{
    if (sBerryBlenderData->field_140 < a0)
    {
        sBerryBlenderData->field_140 += 2;
        sub_805197C(sBerryBlenderData->field_140, a1);
    }
}

void sub_805197C(u16 a0, u16 a1)
{
    s32 var1, var2, var3, var4;
    u16* vram;

    vram = (u16*)(VRAM + 0x6000);
    var1 = (a0 * 64) / a1;
    var2 = var1 / 8;
    for (var4 = 0; var4 < var2; var4++)
    {
        vram[11 + var4] = 0x81E9;
        vram[43 + var4] = 0x81F9;
    }
    var3 = var1 % 8;
    if (var3 != 0)
    {
        vram[11 + var4] = var3 - 32287;
        vram[43 + var4] = var3 - 32271;
        var4++;
    }
    for (; var4 < 8; var4++)
    {
        vram[11 + var4] = 33249;
        vram[43 + var4] = 33249 + 16;
    }
}

u32 sub_8051A1C(u16 a0)
{
    return 360000 * a0 / 0x10000;
}

void sub_8051A3C(u16 a0)
{
    u8 i;
    u8 palAdders[5];

    u32 var = sub_8051A1C(a0);
    if (sBerryBlenderData->max_RPM < var)
        sBerryBlenderData->max_RPM = var;
    for (i = 0; i < 5; i++)
    {
        palAdders[i] = var % 10;
        var /= 10;
    }
    *((u16*)(VRAM + 0x6458)) = palAdders[4] + 0x8172;
    *((u16*)(VRAM + 0x645A)) = palAdders[3] + 0x8172;
    *((u16*)(VRAM + 0x645C)) = palAdders[2] + 0x8172;
    *((u16*)(VRAM + 0x6460)) = palAdders[1] + 0x8172;
    *((u16*)(VRAM + 0x6462)) = palAdders[0] + 0x8172;
}

void sub_8051AC8(s16* a0, u16 a1)
{
    if (*a0 == 0)
        *a0 = (Random() % a1) - (a1 / 2);
}

void sub_8051AF4(s16* a0)
{
    if (*a0 < 0 )
        (*a0)++;
    if (*a0 > 0 )
        (*a0)--;
}

void sub_8051B18(void)
{
    sub_8051AF4(&sBerryBlenderData->field_144);
    sub_8051AF4(&sBerryBlenderData->field_146);
}

void sub_8051B40(s16* a0, u16 a1)
{
    s32 var;
    if (a1 < 10)
        var = 16;
    else
        var = 8;
    if (*a0 == 0)
        *a0 = (Random() % var) - (var / 2);
    else
    {
        if (*a0 < 0)
            (*a0)++;
        if (*a0 > 0)
            (*a0)--;
    }
}

bool8 sub_8051B8C(void)
{
    if (sBerryBlenderData->framesToWait == 0)
    {
        sBerryBlenderData->field_144 = 0;
        sBerryBlenderData->field_146 = 0;
    }
    sBerryBlenderData->framesToWait++;
    sub_8051B40(&sBerryBlenderData->field_144, sBerryBlenderData->framesToWait);
    sub_8051B40(&sBerryBlenderData->field_146, sBerryBlenderData->framesToWait);
    if (sBerryBlenderData->framesToWait == 20)
    {
        sBerryBlenderData->field_144 = 0;
        sBerryBlenderData->field_146 = 0;
        return 1;
    }
    else
        return 0;
}

void sub_8051C04(struct Sprite* sprite)
{
   sprite->pos2.x = -(sBerryBlenderData->field_144);
   sprite->pos2.y = -(sBerryBlenderData->field_146);
}

void Blender_TrySettingRecord(void)
{
    if (gSaveBlock1.berryBlenderRecords[sBerryBlenderData->playersNo - 2] < sBerryBlenderData->max_RPM)
        gSaveBlock1.berryBlenderRecords[sBerryBlenderData->playersNo - 2] = sBerryBlenderData->max_RPM;
}

extern const u8 gUnknown_082165E9[];
extern const u8 gUnknown_082165EE[];

bool8 Blender_PrintBlendingResults(void)
{
    u16 i;

    struct Pokeblock pokeblock;
    u8 vars2[8];
    u8 text[2][10];
    u16 berryIDs[4]; // unused

    switch (sBerryBlenderData->field_0)
    {
    case 0:
        sBerryBlenderData->field_0++;
        sBerryBlenderData->framesToWait = 17;
        break;
    case 1:
        sBerryBlenderData->framesToWait -= 10;
        if (sBerryBlenderData->framesToWait < 0)
        {
            sBerryBlenderData->framesToWait = 0;
            sBerryBlenderData->field_0++;
        }
        break;
    case 2:
        if (++sBerryBlenderData->framesToWait > 20)
        {
            for (i = 0; i < 3; i++)
                DestroySprite(&gSprites[sBerryBlenderData->scoreIconIDs[i]]);
            sBerryBlenderData->framesToWait = 0;
            sBerryBlenderData->field_0++;
        }
        break;
    case 3:
        {
            u8* textPtr;
            u16 secondsPassed, minutes, seconds;

            MenuDrawTextWindow(4, 2, 25, 17);
            sub_8072BD8(gOtherText_ResultsOfBlending, 5, 3, 160);
            for (i = 0; i < sBerryBlenderData->playersNo; i++)
            {
                u8 place = sBerryBlenderData->playerPlaces[i];
                textPtr = text[0];

                StringCopy(textPtr, sBerryBlenderData->blendedBerries[place].name);
                ConvertInternationalString(textPtr, gLinkPlayers[place].language);
                StringAppend(textPtr, gOtherText_Berry);
                textPtr = sBerryBlenderData->stringVar;
                textPtr = ConvertIntToDecimalString(textPtr, i + 1);
                textPtr[0] = CHAR_SPACE;
                textPtr[1] = CHAR_PERIOD;
                textPtr[2] = CHAR_SPACE;
                textPtr += 3;
                textPtr = sub_8072C74(textPtr, gLinkPlayers[place].name, 88, 0);
                sub_8072C74(textPtr, text[0], 157, 0);
                MenuPrint(sBerryBlenderData->stringVar, 5, gUnknown_082165E9[sBerryBlenderData->playersNo] + (i * gUnknown_082165EE[sBerryBlenderData->playersNo]));
            }
            ConvertIntToDecimalStringN(text[0], sBerryBlenderData->max_RPM % 100, 2, 2);
            textPtr = sBerryBlenderData->stringVar;
            textPtr = StringCopy(textPtr, gOtherText_MaxSpeed);
            textPtr = sub_8072C14(textPtr, sBerryBlenderData->max_RPM / 100, 121, 1);

            textPtr[0] = CHAR_SPACE;
            textPtr[1] = CHAR_PERIOD;
            textPtr[2] = CHAR_SPACE;
            textPtr += 3;

            textPtr = sub_8072C74(textPtr, text[0], 142, 1);
            StringCopy(textPtr, gOtherText_RPM);
            MenuPrint(sBerryBlenderData->stringVar, 5, 13);

            secondsPassed = sBerryBlenderData->gameFrameTime / 60;
            seconds = secondsPassed % 60;
            minutes = secondsPassed / 60;
            ConvertIntToDecimalStringN(text[0], minutes, 2, 2);
            ConvertIntToDecimalStringN(text[1], seconds, 2, 2);
            textPtr = sBerryBlenderData->stringVar;
            textPtr = StringCopy(textPtr, gOtherText_RequiredTime);

            textPtr = sub_8072C74(textPtr, text[0], 102, 1);
            textPtr = StringAppend(textPtr, gOtherText_Min);

            textPtr = sub_8072C74(textPtr, text[1], 136, 1);
            StringCopy(textPtr, gOtherText_Sec);

            MenuPrint(sBerryBlenderData->stringVar, 5, 15);

            sBerryBlenderData->framesToWait = 0;
            sBerryBlenderData->field_0++;
        }
        break;
    case 4:
        if (gMain.newKeys & A_BUTTON)
            sBerryBlenderData->field_0++;
        break;
    case 5:
        MenuZeroFillScreen();
        MenuDrawTextWindow(0, 14, 29, 19);
        for (i = 0; i < BLENDER_MAX_PLAYERS; i++)
        {
            if (sBerryBlenderData->chosenItemID[i] != 0)
                berryIDs[i] = sBerryBlenderData->chosenItemID[i] - 133;
        }
        sub_8050760();
        sub_8050520(sBerryBlenderData->blendedBerries, &pokeblock, sBerryBlenderData->playersNo, vars2, sBerryBlenderData->max_RPM);
        Blender_PrintMadePokeblockString(&pokeblock, sBerryBlenderData->stringVar);
        CreateTask(sub_8052BD0, 6);
        MenuPrintMessage(sBerryBlenderData->stringVar, 1, 15);
        RemoveBagItem(gScriptItemId, 1);
        sub_810CA34(&pokeblock);
        sBerryBlenderData->field_0++;
        break;
    case 6:
        if (MenuUpdateWindowText())
        {
            Blender_TrySettingRecord();
            return 1;
        }
        break;
    }
    return 0;
}

extern const u8 gUnknown_08216249[];
extern const u8 gUnknown_082162C8[];
extern const u8 *const gPokeblockNames[];

void Blender_PrintMadePokeblockString(struct Pokeblock* pokeblock, u8* dst)
{
    u8 text[12];
    u8 flavourLvl, feel;

    dst[0] = EOS;
    StringCopy(dst, gPokeblockNames[pokeblock->color]);
    StringAppend(dst, gOtherText_PokeBlockMade);
    StringAppend(dst, gUnknown_082162C8);

    flavourLvl = sub_810C9B0(pokeblock);
    feel = sub_810C9E8(pokeblock);

    StringAppend(dst, gOtherText_BlockLevelIs);
    ConvertIntToDecimalStringN(text, flavourLvl, 0, 3);
    StringAppend(dst, text);

    StringAppend(dst, gOtherText_BlockFeelIs);
    ConvertIntToDecimalStringN(text, feel, 0, 3);
    StringAppend(dst, text);

    StringAppend(dst, gOtherText_Period);
    StringAppend(dst, gUnknown_08216249);
}

void Blender_SortBasedOnPoints(u8* places, u8 playersNum, u32* scores)
{
    s32 i, j;
    for (i = 0; i < playersNum; i++)
    {
        for (j = 0; j < playersNum; j++)
        {
            if (scores[places[i]] > scores[places[j]])
            {
                u8 temp = places[i];
                places[i] = places[j];
                places[j] = temp;
            }
        }
    }
}

void Blender_SortScores(void)
{
    u8 i;
    u8 places[4];
    u32 points[4];

    for (i = 0; i < sBerryBlenderData->playersNo; i++)
        places[i] = i;
    for (i = 0; i < sBerryBlenderData->playersNo; i++)
    {
        points[i] = 1000000 * sBerryBlenderData->scores[i][BLENDER_SCORE_BEST];
        points[i] += 1000 * sBerryBlenderData->scores[i][BLENDER_SCORE_GOOD];
        points[i] += 1000 - sBerryBlenderData->scores[i][BLENDER_SCORE_MISS];
    }
    Blender_SortBasedOnPoints(places, sBerryBlenderData->playersNo, points);
    for (i = 0; i < sBerryBlenderData->playersNo; i++)
        sBerryBlenderData->playerPlaces[i] = places[i];
}

extern const u8 gUnknown_082165F3[];

bool8 Blender_PrintBlendingRanking(void)
{
    u16 i;
    switch (sBerryBlenderData->field_0)
    {
    case 0:
        sBerryBlenderData->field_0++;
        sBerryBlenderData->framesToWait = 255;
        break;
    case 1:
        sBerryBlenderData->framesToWait -= 10;
        if (sBerryBlenderData->framesToWait < 0)
        {
            sBerryBlenderData->framesToWait = 0;
            sBerryBlenderData->field_0++;
        }
        break;
    case 2:
        if (++sBerryBlenderData->framesToWait > 20)
        {
            sBerryBlenderData->framesToWait = 0;
            sBerryBlenderData->field_0++;
        }
        break;
    case 3:
        MenuDrawTextWindow(4, 2, 25, 17);
        sub_8072BD8(gOtherText_Ranking, 5, 3, 160);

        sBerryBlenderData->scoreIconIDs[BLENDER_SCORE_BEST] = CreateSprite(&gSpriteTemplate_821645C, 140, 52, 0);
        gSprites[sBerryBlenderData->scoreIconIDs[BLENDER_SCORE_BEST]].callback = SpriteCallbackDummy;
        StartSpriteAnim(&gSprites[sBerryBlenderData->scoreIconIDs[BLENDER_SCORE_BEST]], 3);

        sBerryBlenderData->scoreIconIDs[BLENDER_SCORE_GOOD] = CreateSprite(&gSpriteTemplate_821645C, 164, 52, 0);
        gSprites[sBerryBlenderData->scoreIconIDs[BLENDER_SCORE_GOOD]].callback = SpriteCallbackDummy;

        sBerryBlenderData->scoreIconIDs[BLENDER_SCORE_MISS] = CreateSprite(&gSpriteTemplate_821645C, 188, 52, 0);
        gSprites[sBerryBlenderData->scoreIconIDs[BLENDER_SCORE_MISS]].callback = SpriteCallbackDummy;
        StartSpriteAnim(&gSprites[sBerryBlenderData->scoreIconIDs[BLENDER_SCORE_MISS]], 1);

        Blender_SortScores();

        for (i = 0; i < sBerryBlenderData->playersNo; i++)
        {
            u8 place = sBerryBlenderData->playerPlaces[i];
            u8* txtPtr = sBerryBlenderData->stringVar;

            txtPtr[0] = EXT_CTRL_CODE_BEGIN;
            txtPtr[1] = 0x13;
            txtPtr[2] = 4;
            txtPtr += 3;

            txtPtr = ConvertIntToDecimalString(txtPtr, i + 1);

            txtPtr[0] = CHAR_SPACE;
            txtPtr[1] = CHAR_PERIOD;
            txtPtr[2] = CHAR_SPACE;
            txtPtr += 3;

            txtPtr = StringCopy(txtPtr, gLinkPlayers[place].name);

            txtPtr = sub_8072C14(txtPtr, sBerryBlenderData->scores[place][BLENDER_SCORE_BEST], 108, 1);
            txtPtr = sub_8072C14(txtPtr, sBerryBlenderData->scores[place][BLENDER_SCORE_GOOD], 132, 1);
            txtPtr = sub_8072C14(txtPtr, sBerryBlenderData->scores[place][BLENDER_SCORE_MISS], 156, 1);

            MenuPrint(sBerryBlenderData->stringVar, 5, i * gUnknown_082165F3[sBerryBlenderData->playersNo] + 8);
        }
        sBerryBlenderData->framesToWait = 0;
        sBerryBlenderData->field_0++;
        break;
    case 4:
        if (++sBerryBlenderData->framesToWait > 20)
            sBerryBlenderData->field_0++;
        break;
    case 5:
        if (gMain.newKeys & A_BUTTON)
        {
            PlaySE(SE_SELECT);
            sBerryBlenderData->field_0++;
        }
        break;
    case 6:
        sBerryBlenderData->field_0 = 0;
        return 1;
    }
    return 0;
}

struct UnknownStruct
{
    s8 bytes[24];
    s16 hword[2];
};

extern struct UnknownStruct gUnknown_03000560;

void unref_sub_80524BC(void)
{
    ResetSpriteData();
    FreeAllSpritePalettes();
    ResetTasks();
    SetVBlankCallback(VBlankCB1_BerryBlender);
    SetUpWindowConfig(&gWindowConfig_81E6CE4);
    InitMenuWindow(&gWindowConfig_81E6CE4);
    SeedRng(gMain.vblankCounter1);
    REG_DISPCNT = 0x1540;
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
    gUnknown_03000560.hword[1] = 0x1F40;
    gUnknown_03000560.bytes[16]++;
    SetMainCallback2(sub_8052AF8);
}
