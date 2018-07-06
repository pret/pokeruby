#include "global.h"
#include "main.h"
#include "task.h"
#include "palette.h"
#include "sound.h"
#include "constants/songs.h"
#include "pokemon.h"
#include "text.h"
#include "strings.h"
#include "string_util.h"
#include "menu.h"
#include "save.h"
#include "constants/species.h"
#include "overworld.h"
#include "m4a.h"
#include "data2.h"
#include "decompress.h"
#include "random.h"
#include "scanline_effect.h"
#include "trig.h"
#include "hof_pc.h"
#include "credits.h"
#include "pc_screen_effect.h"
#include "ewram.h"

static EWRAM_DATA u32 sUnknown_0203931C = 0;

extern bool8 gUnknown_02039324; // has hall of fame records
extern void (*gGameContinueCallback)(void);
extern struct MusicPlayerInfo gMPlay_BGM;
extern u8 gReservedSpritePaletteCount;
extern struct SpriteTemplate gUnknown_02024E8C;

extern const u8 gContestConfetti_Gfx[];
extern const u8 gContestConfetti_Pal[];
extern const u8 gHallOfFame_Gfx[];
extern const u16 gHallOfFame_Pal[];

struct HallofFameMon
{
    u32 tid;
    u32 personality;
    u16 species : 9;
    u16 lvl : 7;
    u8 nick[10];
};

struct HallofFameMons
{
    struct HallofFameMon mons[6];
};

#define HALL_OF_FAME_MAX_TEAMS 50

static void sub_8141FF8(u8 taskID);
static void sub_81422E8(u8 taskID);
static void sub_814217C(u8 taskID);
static void sub_8142274(u8 taskID);
static void sub_81422B8(u8 taskID);
static void sub_8142320(u8 taskID);
static void sub_8142404(u8 taskID);
static void sub_8142484(u8 taskID);
static void sub_8142570(u8 taskID);
static void sub_8142618(u8 taskID);
static void sub_81426F8(u8 taskID);
static void sub_8142738(u8 taskID);
static void sub_8142794(u8 taskID);
static void sub_8142818(u8 taskID);
static void sub_8142850(u8 taskID);
static void sub_81428A0(u8 taskID);
static void sub_8142A28(u8 taskID);
static void sub_8142FEC(u8 taskID);
static void sub_8142B04(u8 taskID);
static void sub_8142CC8(u8 taskID);
static void sub_8142DF4(u8 taskID);
static void sub_8142F78(u8 taskID);
static void sub_8142FCC(u8 taskID);
static void sub_814302C(u8 taskID);

static void sub_81435DC(struct Sprite* sprite);
static void sub_814386C(struct Sprite* sprite);
static void SpriteCB_HallOfFame_Dummy(struct Sprite* sprite);

static void sub_8143068(u8 a0, u8 a1);
static void HallOfFame_PrintMonInfo(struct HallofFameMon* currMon, u8 a1, u8 a2);
static void HallOfFame_PrintPlayerInfo(u8 a0, u8 a1);
static void sub_81433E0(void);
static void sub_8143570(void);
static void sub_81435B8(void);
static u32 HallOfFame_LoadPokemonPic(u16 species, s16 posX, s16 posY, u16 pokeID, u32 tid, u32 pid);
static u32 HallOfFame_LoadTrainerPic(u16 trainerPicID, s16 posX, s16 posY, u16 a3);
static bool8 sub_81438C4(void);

// data and gfx

static const struct CompressedSpriteSheet sHallOfFame_ConfettiSpriteSheet =
{
      gContestConfetti_Gfx, 0x220, 1001
};

static const u8 sUnused0[8] = {};

static const struct CompressedSpritePalette sHallOfFame_ConfettiSpritePalette =
{
      gContestConfetti_Pal, 1001
};

static const u8 sUnused1[8] = {};

static const s16 sHallOfFame_MonsFullTeamPositions[6][4] =
{
    {120,   210,    120,    40},
    {326,   220,    56,     40},
    {-86,   220,    184,    40},
    {120,   -62,    120,    88},
    {-25,   -62,    200,    88},
    {265,   -62,    40,     88}
};

static const s16 sHallOfFame_MonsHalfTeamPositions[3][4] =
{
    {120,   214,    120,    64},
    {281,   214,    56,     64},
    {-41,   214,    184,    64}
};

static const struct PCScreenEffectStruct sPCScreenEffectTemplate = {
    .tileTag = 0x3ea,
    .paletteTag = 0x3ea
};

static const u8 sUnused2[6] = {2, 1, 3, 6, 4, 5};

static const struct OamData sOamData_840B598 =
{
    .y = 0,
    .affineMode = 0,
    .objMode = 0,
    .mosaic = 0,
    .bpp = 0,
    .shape = 0,
    .x = 0,
    .matrixNum = 0,
    .size = 3,
    .tileNum = 0,
    .priority = 0,
    .paletteNum = 0,
    .affineParam = 0,
};

void* const gUnknown_0840B5A0[] =
{
    ewram8000,
    ewramA000,
    ewramC000,
    ewramE000,
    ewram10000,
    ewram14000,
    ewram18000_2
};

static const struct SpriteFrameImage sSpriteImageTable_840B5BC[] =
{
    {ewram8000, 0x800},
    {ewram8800, 0x800},
    {ewram9000, 0x800},
    {ewram9800, 0x800}
};

static const struct SpriteFrameImage sSpriteImageTable_840B5DC[] =
{
    {ewramA000, 0x800},
    {ewramA800, 0x800},
    {ewramB000, 0x800},
    {ewramB800, 0x800}
};

static const struct SpriteFrameImage sSpriteImageTable_840B5FC[] =
{
    {ewramC000, 0x800},
    {ewramC800, 0x800},
    {ewramD000, 0x800},
    {ewramD800, 0x800}
};

static const struct SpriteFrameImage sSpriteImageTable_840B61C[] =
{
    {ewramE000, 0x800},
    {ewramE800, 0x800},
    {ewramF000, 0x800},
    {ewramF800, 0x800}
};

static const struct SpriteFrameImage sSpriteImageTable_840B63C[] =
{
    {ewram10000, 0x800},
    {ewram10800, 0x800},
    {ewram11000, 0x800},
    {ewram11800, 0x800}
};

static const struct SpriteFrameImage sSpriteImageTable_840B65C[] =
{
    {ewram14000, 0x800},
    {ewram14800, 0x800},
    {ewram15000, 0x800},
    {ewram15800, 0x800}
};

static const struct SpriteFrameImage sSpriteImageTable_840B67C[] =
{
    {ewram18000_2, 0x800},
    {ewram18800, 0x800},
    {ewram19000, 0x800},
    {ewram19800, 0x800}
};

static const struct SpriteFrameImage* const sUnknown_0840B69C[7] =
{
    sSpriteImageTable_840B5BC,
    sSpriteImageTable_840B5DC,
    sSpriteImageTable_840B5FC,
    sSpriteImageTable_840B61C,
    sSpriteImageTable_840B63C,
    sSpriteImageTable_840B65C,
    sSpriteImageTable_840B67C
};

static const struct SpriteTemplate sUnknown_0840B6B8 =
{
    .tileTag = -1,
    .paletteTag = -1,
    .oam = &sOamData_840B598,
    .anims = NULL,
    .images = sSpriteImageTable_840B5BC,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCB_HallOfFame_Dummy
};

static const struct OamData sOamData_840B6D0 =
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
    .tileNum = 0,
    .priority = 0,
    .paletteNum = 0,
    .affineParam = 0,
};

static const union AnimCmd sSpriteAnim_840B6D8[] =
{
    ANIMCMD_FRAME(0, 30),
    ANIMCMD_END
};

static const union AnimCmd sSpriteAnim_840B6E0[] =
{
    ANIMCMD_FRAME(1, 30),
    ANIMCMD_END
};

static const union AnimCmd sSpriteAnim_840B6E8[] =
{
    ANIMCMD_FRAME(2, 30),
    ANIMCMD_END
};

static const union AnimCmd sSpriteAnim_840B6F0[] =
{
    ANIMCMD_FRAME(3, 30),
    ANIMCMD_END
};

static const union AnimCmd sSpriteAnim_840B6F8[] =
{
    ANIMCMD_FRAME(4, 30),
    ANIMCMD_END
};

static const union AnimCmd sSpriteAnim_840B700[] =
{
    ANIMCMD_FRAME(5, 30),
    ANIMCMD_END
};

static const union AnimCmd sSpriteAnim_840B708[] =
{
    ANIMCMD_FRAME(6, 30),
    ANIMCMD_END
};

static const union AnimCmd sSpriteAnim_840B710[] =
{
    ANIMCMD_FRAME(7, 30),
    ANIMCMD_END
};

static const union AnimCmd sSpriteAnim_840B718[] =
{
    ANIMCMD_FRAME(8, 30),
    ANIMCMD_END
};

static const union AnimCmd sSpriteAnim_840B720[] =
{
    ANIMCMD_FRAME(9, 30),
    ANIMCMD_END
};

static const union AnimCmd sSpriteAnim_840B728[] =
{
    ANIMCMD_FRAME(10, 30),
    ANIMCMD_END
};

static const union AnimCmd sSpriteAnim_840B730[] =
{
    ANIMCMD_FRAME(11, 30),
    ANIMCMD_END
};

static const union AnimCmd sSpriteAnim_840B738[] =
{
    ANIMCMD_FRAME(12, 30),
    ANIMCMD_END
};

static const union AnimCmd sSpriteAnim_840B740[] =
{
    ANIMCMD_FRAME(13, 30),
    ANIMCMD_END
};

static const union AnimCmd sSpriteAnim_840B748[] =
{
    ANIMCMD_FRAME(14, 30),
    ANIMCMD_END
};

static const union AnimCmd sSpriteAnim_840B750[] =
{
    ANIMCMD_FRAME(15, 30),
    ANIMCMD_END
};

static const union AnimCmd sSpriteAnim_840B758[] =
{
    ANIMCMD_FRAME(16, 30),
    ANIMCMD_END
};

static const union AnimCmd* const sSpriteAnimTable_840B760[] =
{
    sSpriteAnim_840B6D8,
    sSpriteAnim_840B6E0,
    sSpriteAnim_840B6E8,
    sSpriteAnim_840B6F0,
    sSpriteAnim_840B6F8,
    sSpriteAnim_840B700,
    sSpriteAnim_840B708,
    sSpriteAnim_840B710,
    sSpriteAnim_840B718,
    sSpriteAnim_840B720,
    sSpriteAnim_840B728,
    sSpriteAnim_840B730,
    sSpriteAnim_840B738,
    sSpriteAnim_840B740,
    sSpriteAnim_840B748,
    sSpriteAnim_840B750,
    sSpriteAnim_840B758
};

static const struct SpriteTemplate sSpriteTemplate_840B7A4 =
{
    .tileTag = 1001,
    .paletteTag = 1001,
    .oam = &sOamData_840B6D0,
    .anims = sSpriteAnimTable_840B760,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_814386C
};

// code

#define tDisplayedPoke      data[1]
#define tPokesNumber        data[2]
#define tFrameCount         data[3]
#define tPlayerSpriteID     data[4]
#define tMonSpriteID(i)     data[i + 5]

static void VBlankCB_HallOfFame(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

static void CB2_HallOfFame(void)
{
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

static bool8 sub_8141E64(void)
{
    switch (gMain.state)
    {
    case 0:
    default:
        SetVBlankCallback(NULL);
        sub_81433E0();
        gMain.state = 1;
        break;
    case 1:
        sub_8143570();
        gMain.state++;
        break;
    case 2:
        {
            u16 saved_IME;

            BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, RGB(0, 0, 0));
            SetVBlankCallback(VBlankCB_HallOfFame);
            saved_IME = REG_IME;
            REG_IME = 0;
            REG_IE |= 1;
            REG_IME = saved_IME;
            REG_DISPSTAT |= 8;
            gMain.state++;
        }
        break;
    case 3:
        REG_BLDCNT = 0x3F42;
        REG_BLDALPHA = 0x710;
        REG_BLDY = 0;
        sub_81435B8();
        gMain.state++;
        break;
    case 4:
        UpdatePaletteFade();
        if (!gPaletteFade.active)
        {
            SetMainCallback2(CB2_HallOfFame);
            PlayBGM(MUS_DENDOU);
            return 0;
        }
        break;
    }
    return 1;
}

void sub_8141F90(void)
{
    if (sub_8141E64() == 0)
    {
        u8 taskID = CreateTask(sub_8141FF8, 0);
        gTasks[taskID].data[0] = 0;
    }
}

static void sub_8141FC4(void)
{
    if (sub_8141E64() == 0)
    {
        u8 taskID = CreateTask(sub_8141FF8, 0);
        gTasks[taskID].data[0] = 1;
    }
}

static void sub_8141FF8(u8 taskID)
{
    u16 i, j;
    struct HallofFameMons* fameMons = eHallOfFameMons1;

    gTasks[taskID].tPokesNumber = 0; // valid pokes
    for (i = 0; i < 6; i++)
    {
        u8 nick[12];
        if (GetMonData(&gPlayerParty[i], MON_DATA_SPECIES))
        {
            fameMons->mons[i].species = GetMonData(&gPlayerParty[i], MON_DATA_SPECIES2);
            fameMons->mons[i].tid = GetMonData(&gPlayerParty[i], MON_DATA_OT_ID);
            fameMons->mons[i].personality = GetMonData(&gPlayerParty[i], MON_DATA_PERSONALITY);
            fameMons->mons[i].lvl = GetMonData(&gPlayerParty[i], MON_DATA_LEVEL);
            GetMonData(&gPlayerParty[i], MON_DATA_NICKNAME, nick);
            for (j = 0; j < 10; j++)
            {
                fameMons->mons[i].nick[j] = nick[j];
            }
            gTasks[taskID].tPokesNumber++;
        }
        else
        {
            fameMons->mons[i].species = 0;
            fameMons->mons[i].tid = 0;
            fameMons->mons[i].personality = 0;
            fameMons->mons[i].lvl = 0;
            fameMons->mons[i].nick[0] = EOS;
        }
    }
    sUnknown_0203931C = 0;
    gTasks[taskID].tDisplayedPoke = 0;
    gTasks[taskID].data[4] = 0xFF;
    for (i = 0; i < 6; i++)
    {
        gTasks[taskID].tMonSpriteID(i) = 0xFF;
    }
    if (gTasks[taskID].data[0])
        gTasks[taskID].func = sub_81422E8;
    else
        gTasks[taskID].func = sub_814217C;
}

static void sub_814217C(u8 taskID)
{
    u16 i;
    struct HallofFameMons* fameMons = eHallOfFameMons1;
    struct HallofFameMons* lastSavedTeam = eHallOfFameMons2;

    if (gUnknown_02039324 == FALSE)
    {
        for (i = 0; i < 0x2000; i++)
            ewram1E000(i) = 0;
    }
    else
        Save_LoadGameData(SAVE_HALL_OF_FAME);

    for (i = 0; i < HALL_OF_FAME_MAX_TEAMS; i++, lastSavedTeam++)
    {
        if (lastSavedTeam->mons[0].species == 0)
            break;
    }
    if (i >= HALL_OF_FAME_MAX_TEAMS)
    {
        struct HallofFameMons* r5 = eHallOfFameMons2;
        struct HallofFameMons* r6 = eHallOfFameMons2;
        r5++;
        for (i = 0; i < HALL_OF_FAME_MAX_TEAMS - 1; i++, r6++, r5++)
        {
            *r6 = *r5;
        }
        lastSavedTeam--;
    }
    *lastSavedTeam = *fameMons;
    Menu_DrawStdWindowFrame(2, 14, 27, 19);
    Menu_PrintText(gMenuText_HOFSaving, 3, 15);
    gTasks[taskID].func = sub_8142274;
}

static void sub_8142274(u8 taskID)
{
    gGameContinueCallback = sub_8141FC4;
    Save_WriteData(3);
    PlaySE(SE_SAVE);
    gTasks[taskID].func = sub_81422B8;
    gTasks[taskID].tFrameCount = 32;
}

static void sub_81422B8(u8 taskID)
{
    if (gTasks[taskID].tFrameCount)
        gTasks[taskID].tFrameCount--;
    else
        gTasks[taskID].func = sub_81422E8;
}

static void sub_81422E8(u8 taskID)
{
    Text_LoadWindowTemplate(&gWindowTemplate_81E7198);
    InitMenuWindow(&gWindowTemplate_81E7198);
    gTasks[taskID].func = sub_8142320;
}

static void sub_8142320(u8 taskID)
{
    u8 spriteID;
    s16 xPos, yPos, field4, field6;

    struct HallofFameMons* fameMons = eHallOfFameMons1;
    u16 currPokeID = gTasks[taskID].tDisplayedPoke;
    struct HallofFameMon* currMon = &fameMons->mons[currPokeID];

    if (gTasks[taskID].tPokesNumber > 3)
    {
        xPos = sHallOfFame_MonsFullTeamPositions[currPokeID][0];
        yPos = sHallOfFame_MonsFullTeamPositions[currPokeID][1];
        field4 = sHallOfFame_MonsFullTeamPositions[currPokeID][2];
        field6 = sHallOfFame_MonsFullTeamPositions[currPokeID][3];
    }
    else
    {
        xPos = sHallOfFame_MonsHalfTeamPositions[currPokeID][0];
        yPos = sHallOfFame_MonsHalfTeamPositions[currPokeID][1];
        field4 = sHallOfFame_MonsHalfTeamPositions[currPokeID][2];
        field6 = sHallOfFame_MonsHalfTeamPositions[currPokeID][3];
    }

    spriteID = HallOfFame_LoadPokemonPic(currMon->species, xPos, yPos, currPokeID, currMon->tid, currMon->personality);
    gSprites[spriteID].data[1] = field4;
    gSprites[spriteID].data[2] = field6;
    gSprites[spriteID].data[0] = 0;
    gSprites[spriteID].callback = sub_81435DC;
    gTasks[taskID].tMonSpriteID(currPokeID) = spriteID;
    Menu_EraseWindowRect(0, 14, 29, 19);
    gTasks[taskID].func = sub_8142404;
}

static void sub_8142404(u8 taskID)
{
    struct HallofFameMons* fameMons = eHallOfFameMons1;
    u16 currPokeID = gTasks[taskID].tDisplayedPoke;
    struct HallofFameMon* currMon = &fameMons->mons[currPokeID];

    if (gSprites[gTasks[taskID].tMonSpriteID(currPokeID)].data[0] != 0)
    {
        if (currMon->species != SPECIES_EGG)
            PlayCry1(currMon->species, 0);
        HallOfFame_PrintMonInfo(currMon, 0, 14);
        gTasks[taskID].tFrameCount = 120;
        gTasks[taskID].func = sub_8142484;
    }
}

static void sub_8142484(u8 taskID)
{
    struct HallofFameMons* fameMons = eHallOfFameMons1;
    u16 currPokeID = gTasks[taskID].tDisplayedPoke;
    struct HallofFameMon* currMon = &fameMons->mons[currPokeID];

    if (gTasks[taskID].tFrameCount != 0)
        gTasks[taskID].tFrameCount--;
    else
    {
        sUnknown_0203931C |= (0x10000 << gSprites[gTasks[taskID].tMonSpriteID(currPokeID)].oam.paletteNum);
        if (gTasks[taskID].tDisplayedPoke <= 4 && currMon[1].species != 0) // there is another pokemon to display
        {
            gTasks[taskID].tDisplayedPoke++;
            BeginNormalPaletteFade(sUnknown_0203931C, 0, 12, 12, RGB(31, 26, 28));
            gSprites[gTasks[taskID].tMonSpriteID(currPokeID)].oam.priority = 1;
            gTasks[taskID].func = sub_8142320;
        }
        else
            gTasks[taskID].func = sub_8142570;
    }
}

static void sub_8142570(u8 taskID)
{
    u16 i;

    BeginNormalPaletteFade(0xFFFF0000, 0, 0, 0, RGB(0, 0, 0));
    for (i = 0; i < 6; i++)
    {
        if (gTasks[taskID].tMonSpriteID(i) != 0xFF)
            gSprites[gTasks[taskID].tMonSpriteID(i)].oam.priority = 0;
    }
    Menu_EraseWindowRect(0, 14, 29, 19);
    sub_8143068(0, 15);
    PlaySE(SE_DENDOU);
    gTasks[taskID].tFrameCount = 400;
    gTasks[taskID].func = sub_8142618;
}

static void sub_8142618(u8 taskID)
{
    if (gTasks[taskID].tFrameCount != 0)
    {
        gTasks[taskID].tFrameCount--;
        if ((gTasks[taskID].tFrameCount & 3) == 0 && gTasks[taskID].tFrameCount > 110)
            sub_81438C4();
    }
    else
    {
        u16 i;
        for (i = 0; i < 6; i++)
        {
            if (gTasks[taskID].tMonSpriteID(i) != 0xFF)
                gSprites[gTasks[taskID].tMonSpriteID(i)].oam.priority = 1;
        }
        BeginNormalPaletteFade(sUnknown_0203931C, 0, 12, 12, RGB(31, 26, 28));
        Menu_EraseWindowRect(0, 14, 29, 19);
        gTasks[taskID].tFrameCount = 7;
        gTasks[taskID].func = sub_81426F8;
    }
}

static void sub_81426F8(u8 taskID)
{
    if (gTasks[taskID].tFrameCount >= 16)
        gTasks[taskID].func = sub_8142738;
    else
    {
        gTasks[taskID].tFrameCount++;
        REG_BLDALPHA = gTasks[taskID].tFrameCount * 256;
    }
}

static void sub_8142738(u8 taskID)
{
    REG_DISPCNT = 0x1940;
    Text_LoadWindowTemplate(&gWindowTemplate_81E71B4);
    InitMenuWindow(&gWindowTemplate_81E71B4);

    gTasks[taskID].tPlayerSpriteID = HallOfFame_LoadTrainerPic(gSaveBlock2.playerGender, 120, 72, 6);
    gTasks[taskID].tFrameCount = 120;
    gTasks[taskID].func = sub_8142794;
}

static void sub_8142794(u8 taskID)
{
    if (gTasks[taskID].tFrameCount != 0)
        gTasks[taskID].tFrameCount--;
    else
    {
        if (gSprites[gTasks[taskID].tPlayerSpriteID].pos1.x != 160)
            gSprites[gTasks[taskID].tPlayerSpriteID].pos1.x++;
        else
        {
            Menu_DrawStdWindowFrame(1, 2, 15, 9);
            HallOfFame_PrintPlayerInfo(1, 2);
            Menu_DrawStdWindowFrame(2, 14, 27, 19);
            Menu_PrintText(gMenuText_HOFCongratulations, 4, 15);
            gTasks[taskID].func = sub_8142818;
        }
    }
}

static void sub_8142818(u8 taskID)
{
    if (gMain.newKeys & A_BUTTON)
    {
        FadeOutBGM(4);
        gTasks[taskID].func = sub_8142850;
    }
}

static void sub_8142850(u8 taskID)
{
    CpuSet(gPlttBufferFaded, gPlttBufferUnfaded, 0x200);
    BeginNormalPaletteFade(0xFFFFFFFF, 8, 0, 16, RGB(0, 0, 0));
    gTasks[taskID].func = sub_81428A0;
}

static void sub_81428A0(u8 taskID)
{
    if (!gPaletteFade.active)
    {
        DestroyTask(taskID);
        SetMainCallback2(sub_81439D0);
    }
}

#undef tDisplayedPoke
#undef tPokesNumber
#undef tFrameCount
#undef tPlayerSpriteID
#undef tMonSpriteID

void sub_81428CC(void)
{
    switch (gMain.state)
    {
    case 0:
    default:
        SetVBlankCallback(NULL);
        sub_81433E0();
        gMain.state = 1;
        break;
    case 1:
        sub_8143570();
        gMain.state++;
        break;
    case 2:
        {
            u16 savedIme;

            SetVBlankCallback(VBlankCB_HallOfFame);
            savedIme = REG_IME;
            REG_IME = 0;
            REG_IE |= 1;
            REG_IME = savedIme;
            REG_DISPSTAT |= 8;
            gMain.state++;
        }
        break;
    case 3:
        REG_BLDCNT = 0;
        REG_BLDALPHA = 0;
        REG_BLDY = 0;
        sub_81435B8();

        eHOFPCScreenEffect = sPCScreenEffectTemplate;

        sub_80C5CD4(&eHOFPCScreenEffect);
        gMain.state++;
        break;
    case 4:
        AnimateSprites();
        BuildOamBuffer();
        UpdatePaletteFade();
        if (sub_80C5DCC())
            gMain.state++;
        break;
    case 5:
        REG_BLDCNT = 0x3F42;
        REG_BLDALPHA = 0x710;
        REG_BLDY = 0;
        CreateTask(sub_8142A28, 0);
        SetMainCallback2(CB2_HallOfFame);
        break;
    }
}

#define tCurrTeamNo     data[0]
#define tCurrPageNo     data[1]
#define tCurrPokeID     data[2]
#define tPokesNo        data[4]
#define tMonSpriteID(i) data[i + 5]

static void sub_8142A28(u8 taskID)
{
    if (Save_LoadGameData(SAVE_HALL_OF_FAME) != SAVE_STATUS_OK)
        gTasks[taskID].func = sub_8142FEC;
    else
    {
        u16 *vram1, *vram2;

        u16 i;
        struct HallofFameMons* savedTeams = eHallOfFameMons2;
        for (i = 0; i < HALL_OF_FAME_MAX_TEAMS; i++, savedTeams++)
        {
            if (savedTeams->mons[0].species == 0)
                break;
        }
        if (i < HALL_OF_FAME_MAX_TEAMS)
            gTasks[taskID].tCurrTeamNo = i - 1;
        else
            gTasks[taskID].tCurrTeamNo = HALL_OF_FAME_MAX_TEAMS - 1;
        gTasks[taskID].tCurrPageNo = GetGameStat(10);

        for (i = 0, vram1 = (u16*)(VRAM + 0x381A), vram2 = (u16*)(VRAM + 0x385A); i <= 16; i++)
        {
            *(vram1 + i) = i + 3;
            *(vram2 + i) = i + 20;
        }
        Text_LoadWindowTemplate(&gWindowTemplate_81E7198);
        InitMenuWindow(&gWindowTemplate_81E7198);
        gTasks[taskID].func = sub_8142B04;
    }
}

static void sub_8142B04(u8 taskID)
{
    struct HallofFameMons* savedTeams = eHallOfFameMons2;
    struct HallofFameMon* currMon;
    u16 i;
    u8* stringPtr;

    for (i = 0; i < gTasks[taskID].tCurrTeamNo; i++)
        savedTeams++;

    currMon = &savedTeams->mons[0];
    sUnknown_0203931C = 0;
    gTasks[taskID].tCurrPokeID = 0;
    gTasks[taskID].tPokesNo = 0;

    for (i = 0; i < 6; i++, currMon++)
    {
        if (currMon->species != 0)
            gTasks[taskID].tPokesNo++;
    }

    currMon = &savedTeams->mons[0];

    for (i = 0; i < 6; i++, currMon++)
    {
        if (currMon->species != 0)
        {
            u16 spriteID;
            s16 posX, posY;
            if (gTasks[taskID].tPokesNo > 3)
            {
                posX = sHallOfFame_MonsFullTeamPositions[i][2];
                posY = sHallOfFame_MonsFullTeamPositions[i][3];
            }
            else
            {
                posX = sHallOfFame_MonsHalfTeamPositions[i][2];
                posY = sHallOfFame_MonsHalfTeamPositions[i][3];
            }
            spriteID = HallOfFame_LoadPokemonPic(currMon->species, posX, posY, i, currMon->tid, currMon->personality);
            gSprites[spriteID].oam.priority = 1;
            gTasks[taskID].tMonSpriteID(i) = spriteID;
        }
        else
            gTasks[taskID].tMonSpriteID(i) = 0xFF;
    }

    BlendPalettes(0xFFFF0000, 12, RGB(31, 26, 28));

    stringPtr = gStringVar1;
    stringPtr = StringCopy(stringPtr, gMenuText_HOFNumber);
    stringPtr[0] = 0xFC;
    stringPtr[1] = 0x14;
    stringPtr[2] = 0x6;
    stringPtr += 3;
    stringPtr = ConvertIntToDecimalString(stringPtr, gTasks[taskID].tCurrPageNo);
    stringPtr[0] = 0xFC;
    stringPtr[1] = 0x13;
    stringPtr[2] = 0xF0;
    stringPtr[3] = EOS;
    Menu_PrintText(gStringVar1, 0, 0);

    gTasks[taskID].func = sub_8142CC8;
}

static void sub_8142CC8(u8 taskID)
{
    struct HallofFameMons* savedTeams = eHallOfFameMons2;
    struct HallofFameMon* currMon;
    u16 i;
    u16 currMonID;

    for (i = 0; i < gTasks[taskID].tCurrTeamNo; i++)
        savedTeams++;

    for (i = 0; i < 6; i++)
    {
        u16 spriteID = gTasks[taskID].tMonSpriteID(i);
        if (spriteID != 0xFF)
            gSprites[spriteID].oam.priority = 1;
    }

    currMonID = gTasks[taskID].tMonSpriteID(gTasks[taskID].tCurrPokeID);
    gSprites[currMonID].oam.priority = 0;
    sUnknown_0203931C = (0x10000 << gSprites[currMonID].oam.paletteNum) ^ 0xFFFF0000;
    BlendPalettesUnfaded(sUnknown_0203931C, 12, RGB(31, 26, 28));

    currMon = &savedTeams->mons[gTasks[taskID].tCurrPokeID];
    if (currMon->species != SPECIES_EGG)
    {
        StopCryAndClearCrySongs();
        PlayCry1(currMon->species, 0);
    }
    HallOfFame_PrintMonInfo(currMon, 0, 14);

    gTasks[taskID].func = sub_8142DF4;
}

static void sub_8142DF4(u8 taskID)
{
    u16 i;
    if (gMain.newKeys & A_BUTTON)
    {
        if (gTasks[taskID].tCurrTeamNo != 0) // prepare another team to view
        {
            gTasks[taskID].tCurrTeamNo--;
            for (i = 0; i < 6; i++)
            {
                u8 spriteID = gTasks[taskID].tMonSpriteID(i);
                if (spriteID != 0xFF)
                {
                    FreeSpritePaletteByTag(GetSpritePaletteTagByPaletteNum(gSprites[spriteID].oam.paletteNum));
                    DestroySprite(&gSprites[spriteID]);
                }
            }
            if (gTasks[taskID].tCurrPageNo != 0)
                gTasks[taskID].tCurrPageNo--;
            gTasks[taskID].func = sub_8142B04;
        }
        else // no more teams to view, turn off hall of fame PC
        {
            if (IsCryPlayingOrClearCrySongs())
            {
                StopCryAndClearCrySongs();
                m4aMPlayVolumeControl(&gMPlay_BGM, 0xFFFF, 0x100);
            }
            gTasks[taskID].func = sub_8142F78;
        }
    }
    else if (gMain.newKeys & B_BUTTON) // turn off hall of fame PC
    {
        if (IsCryPlayingOrClearCrySongs())
        {
            StopCryAndClearCrySongs();
            m4aMPlayVolumeControl(&gMPlay_BGM, 0xFFFF, 0x100);
        }
        gTasks[taskID].func = sub_8142F78;
    }
    else if (gMain.newKeys & DPAD_UP && gTasks[taskID].tCurrPokeID != 0) // change poke -1
    {
        gTasks[taskID].tCurrPokeID--;
        gTasks[taskID].func = sub_8142CC8;
    }
    else if (gMain.newKeys & DPAD_DOWN && gTasks[taskID].tCurrPokeID < gTasks[taskID].tPokesNo - 1) // change poke +1
    {
        gTasks[taskID].tCurrPokeID++;
        gTasks[taskID].func = sub_8142CC8;
    }
}

static void sub_8142F78(u8 taskID)
{
    CpuSet(gPlttBufferFaded, gPlttBufferUnfaded, 0x200);
    eHOFPCScreenEffect = sPCScreenEffectTemplate;
    sub_80C5E38(&eHOFPCScreenEffect);
    gTasks[taskID].func = sub_8142FCC;
}

static void sub_8142FCC(u8 taskID)
{
    if (sub_80C5F98())
    {
        DestroyTask(taskID);
        ReturnFromHallOfFamePC();
    }
}

static void sub_8142FEC(u8 taskID)
{
    Menu_DrawStdWindowFrame(2, 14, 27, 19);
    MenuPrintMessage(gMenuText_HOFCorrupt, 3, 15);
    gTasks[taskID].func = sub_814302C;
}

static void sub_814302C(u8 taskID)
{
    if (Menu_UpdateWindowText() && gMain.newKeys & A_BUTTON)
        gTasks[taskID].func = sub_8142F78;
}

#undef tCurrTeamNo
#undef tCurrPageNo
#undef tCurrPokeID
#undef tPokesNo
#undef tMonSpriteID

static void sub_8143068(u8 a0, u8 a1)
{
    MenuPrint_Centered(gMenuText_WelcomeToHOFAndDexRating, 0, a1 + 1, 0xF0);
}

static void HallOfFame_PrintMonInfo(struct HallofFameMon* currMon, u8 a1, u8 a2)
{
    u8* stringPtr;
    u16 monData;
    u16 i;

    stringPtr = gStringVar1;
    stringPtr[0] = EXT_CTRL_CODE_BEGIN;
    stringPtr[1] = 0x13;
    stringPtr[2] = 0x28;
    stringPtr[3] = EOS;

    if (currMon->species != SPECIES_EGG)
    {
        monData = SpeciesToPokedexNum(currMon->species);
        if (monData != 0xFFFF)
        {
            stringPtr = StringCopy(stringPtr, gOtherText_Number2);
            ConvertIntToDecimalStringN(stringPtr, monData, 2, 3);
        }
    }

    Menu_PrintText(gStringVar1, a1 + 4, a2 + 1);
    stringPtr = gStringVar1;

    for (i = 0; i < 10 && currMon->nick[i] != EOS; stringPtr[i] = currMon->nick[i], i++) {}
    stringPtr += i;
    stringPtr[0] = EOS;

    if (currMon->species == SPECIES_EGG)
    {
        stringPtr[0] = EXT_CTRL_CODE_BEGIN;
        stringPtr[1] = 0x13;
        stringPtr[2] = 0xA0;
        stringPtr[3] = EOS;
        Menu_PrintText(gStringVar1, a1 + 9, a2 + 1);
        Menu_EraseWindowRect(0, a2 + 3, 29, a2 + 4);
    }
    else
    {

        stringPtr[0] = EXT_CTRL_CODE_BEGIN;
        stringPtr[1] = 0x13;
        stringPtr[2] = 0x3E;
        stringPtr += 3;

        stringPtr[0] = CHAR_SLASH;
        stringPtr++;

        for (i = 0; i < 10 && gSpeciesNames[currMon->species][i] != EOS; stringPtr[i] = gSpeciesNames[currMon->species][i], i++) {}

        stringPtr += i;
        stringPtr[0] = CHAR_SPACE;
        stringPtr++;

        if (currMon->species != SPECIES_NIDORAN_M && currMon->species != SPECIES_NIDORAN_F)
        {
            switch (GetGenderFromSpeciesAndPersonality(currMon->species, currMon->personality))
            {
            case MON_MALE:
                stringPtr[0] = CHAR_MALE;
                stringPtr++;
                break;
            case MON_FEMALE:
                stringPtr[0] = CHAR_FEMALE;
                stringPtr++;
                break;
            }
        }

        stringPtr[0] = EXT_CTRL_CODE_BEGIN;
        stringPtr[1] = 0x13;
        stringPtr[2] = 0xA0;
        stringPtr[3] = EOS;

        Menu_PrintText(gStringVar1, a1 + 9, a2 + 1);

        monData = currMon->lvl;

        stringPtr = StringCopy(gStringVar1, gOtherText_Level3);

        stringPtr[0] = EXT_CTRL_CODE_BEGIN;
        stringPtr[1] = 0x14;
        stringPtr[2] = 6;
        stringPtr += 3;

        stringPtr = ConvertIntToDecimalStringN(stringPtr, monData, 0, 3);

        stringPtr[0] = EXT_CTRL_CODE_BEGIN;
        stringPtr[1] = 0x13;
        stringPtr[2] = 0x30;
        stringPtr[3] = EOS;

        Menu_PrintText(gStringVar1, a1 + 7, a2 + 3);

        monData = currMon->tid;

        stringPtr = StringCopy(gStringVar1, gOtherText_IDNumber);
        ConvertIntToDecimalStringN(stringPtr, monData, 2, 5);

        Menu_PrintText(gStringVar1, a1 + 13, a2 + 3);
    }
}

#define ByteRead16(ptr) ((ptr)[0] | ((ptr)[1] << 8))

static void HallOfFame_PrintPlayerInfo(u8 a0, u8 a1)
{
    u8* stringPtr;
    u16 visibleTid;

    Menu_PrintText(gOtherText_Name, a0 + 1, a1 + 1);
    MenuPrint_RightAligned(gSaveBlock2.playerName, a0 + 14, a1 + 1);

    Menu_PrintText(gOtherText_IDNumber2, a0 + 1, a1 + 3);
    visibleTid = ByteRead16(gSaveBlock2.playerTrainerId);
    ConvertIntToDecimalStringN(gStringVar1, visibleTid, 2, 5);

    MenuPrint_RightAligned(gStringVar1, a0 + 14, a1 + 3);
    Menu_PrintText(gMainMenuString_Time, a0 + 1, a1 + 5);

    stringPtr = ConvertIntToDecimalString(gStringVar1, gSaveBlock2.playTimeHours);
    stringPtr[0] = CHAR_SPACE;
    stringPtr[1] = CHAR_COLON;
    stringPtr[2] = CHAR_SPACE;
    stringPtr += 3;

    stringPtr = ConvertIntToDecimalStringN(stringPtr, gSaveBlock2.playTimeMinutes, 2, 2);
    stringPtr[0] = EOS;

    MenuPrint_RightAligned(gStringVar1, a0 + 14, a1 + 5);
}

static void sub_81433E0(void)
{
    u16 i;

    REG_DISPCNT = 0;

    REG_BG0CNT = 0;
    REG_BG0HOFS = 0;
    REG_BG0VOFS = 0;

    REG_BG1CNT = 0;
    REG_BG1HOFS = 0;
    REG_BG1VOFS = 0;

    REG_BG2CNT = 0;
    REG_BG2HOFS = 0;
    REG_BG2VOFS = 0;

    REG_BG3CNT = 0;
    REG_BG3HOFS = 0;
    REG_BG3VOFS = 0;

    DmaFill16Large(3, 0, VRAM, 0x18000, 0x1000);
    DmaFill32Defvars(3, 0, OAM, OAM_SIZE);
    DmaFill16Defvars(3, 0, PLTT, PLTT_SIZE);

    LZ77UnCompVram(gHallOfFame_Gfx, (void*)(VRAM));

    for (i = 0; i < 64; i++)
    {
        *((u16*)(VRAM + 0x3800) + i) = 1;
    }
    for (i = 0; i < 192; i++)
    {
        *((u16*)(VRAM + 0x3B80) + i) = 1;
    }
    for (i = 0; i < 1024; i++)
    {
        *((u16*)(VRAM + 0x3000) + i) = 2;
    }

    DmaFill16Large(3, 0, ewram0_6, 0x4000, 0x1000);
    ResetPaletteFade();
    LoadPalette(gHallOfFame_Pal, 0, 0x20);
}

static void sub_8143570(void)
{
    ScanlineEffect_Stop();
    ResetTasks();
    ResetSpriteData();
    FreeAllSpritePalettes();
    gReservedSpritePaletteCount = 8;
    LoadCompressedObjectPic(&sHallOfFame_ConfettiSpriteSheet);
    LoadCompressedObjectPalette(&sHallOfFame_ConfettiSpritePalette);
    Text_LoadWindowTemplate(&gWindowTemplate_81E71B4);
    InitMenuWindow(&gWindowTemplate_81E71B4);
}

static void sub_81435B8(void)
{
    REG_BG1CNT = 0x700;
    REG_BG3CNT = 0x603;
    REG_DISPCNT = 0x1B40;
}

static void sub_81435DC(struct Sprite* sprite)
{
    u32 spritePos = *(u32*)(&sprite->pos1);
    u32 dataPos = *(u32*)(&sprite->data[1]);
    if (spritePos != dataPos)
    {
        if (sprite->pos1.x < sprite->data[1])
            sprite->pos1.x += 15;
        if (sprite->pos1.x > sprite->data[1])
            sprite->pos1.x -= 15;

        if (sprite->pos1.y < sprite->data[2])
            sprite->pos1.y += 10;
        if (sprite->pos1.y > sprite->data[2])
            sprite->pos1.y -= 10;
    }
    else
    {
        sprite->data[0] = 1;
        sprite->callback = SpriteCB_HallOfFame_Dummy;
    }
}

static void SpriteCB_HallOfFame_Dummy(struct Sprite* sprite)
{

}

void sub_8143648(u16 paletteTag, u8 animID)
{
    gUnknown_02024E8C = sUnknown_0840B6B8;
    gUnknown_02024E8C.paletteTag = paletteTag;
    gUnknown_02024E8C.images = sUnknown_0840B69C[animID];
    gUnknown_02024E8C.anims = gSpriteAnimTable_81E7C64;
}

void sub_8143680(u16 paletteTag, u8 animID)
{
    gUnknown_02024E8C = sUnknown_0840B6B8;
    gUnknown_02024E8C.paletteTag = paletteTag;
    gUnknown_02024E8C.images = sUnknown_0840B69C[animID];
    gUnknown_02024E8C.anims = gUnknown_081EC2A4[0];
}

static u32 HallOfFame_LoadPokemonPic(u16 species, s16 posX, s16 posY, u16 pokeID, u32 tid, u32 pid)
{
    u8 spriteID;
    const u8* pokePal;

    LoadSpecialPokePic(&gMonFrontPicTable[species], gMonFrontPicCoords[species].coords, gMonFrontPicCoords[species].y_offset, 0x2000000, gUnknown_0840B5A0[pokeID], species, pid, 1);

    pokePal = GetMonSpritePalFromOtIdPersonality(species, tid, pid);
    LoadCompressedPalette(pokePal, 16 * pokeID + 256, 0x20);

    sub_8143648(pokeID, pokeID);
    spriteID = CreateSprite(&gUnknown_02024E8C, posX, posY, 10 - pokeID);
    gSprites[spriteID].oam.paletteNum = pokeID;
    return spriteID;
}

static u32 HallOfFame_LoadTrainerPic(u16 trainerPicID, s16 posX, s16 posY, u16 a3)
{
    u8 spriteID;

    DecompressPicFromTable_2(&gTrainerFrontPicTable[trainerPicID], gTrainerFrontPicCoords[trainerPicID].coords, gTrainerFrontPicCoords[trainerPicID].y_offset, (void*) 0x2000000, gUnknown_0840B5A0[a3], trainerPicID);

    LoadCompressedPalette(gTrainerFrontPicPaletteTable[trainerPicID].data, 16 * a3 + 256, 0x20);
    sub_8143680(a3, a3);

    spriteID = CreateSprite(&gUnknown_02024E8C, posX, posY, 1);
    gSprites[spriteID].oam.paletteNum = a3;

    return spriteID;
}

static void sub_814386C(struct Sprite* sprite)
{
    if (sprite->pos2.y > 120)
        DestroySprite(sprite);
    else
    {
        u16 rand;
        u8 tableID;

        sprite->pos2.y++;
        sprite->pos2.y += sprite->data[1];

        tableID = sprite->data[0];
        rand = (Random() % 4) + 8;
        sprite->pos2.x = rand * gSineTable[tableID] / 256;

        sprite->data[0] += 4;
    }
}

static bool8 sub_81438C4(void)
{
    u8 spriteID;
    struct Sprite* sprite;

    s16 posX = Random() % 240;
    s16 posY = -(Random() % 8);

    spriteID = CreateSprite(&sSpriteTemplate_840B7A4, posX, posY, 0);
    sprite = &gSprites[spriteID];

    StartSpriteAnim(sprite, Random() % 17);

    if (Random() & 3)
        sprite->data[1] = 0;
    else
        sprite->data[1] = 1;

    return 0;
}
