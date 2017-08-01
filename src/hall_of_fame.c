#include "global.h"
#include "main.h"
#include "task.h"
#include "palette.h"
#include "sound.h"
#include "pokemon.h"
#include "text.h"
#include "strings.h"
#include "menu.h"
#include "save.h"

extern u32 gUnknown_0203931C;
extern bool8 gUnknown_02039324; // has hall of fame records
extern void (*gGameContinueCallback)(void);

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

extern u8 ewram[];

void sub_81433E0(void);
void sub_8143570(void);
void sub_81435B8(void);
void sub_8141FF8(u8 taskID);
void sub_81422E8(u8 taskID);
void sub_814217C(u8 taskID);
void sub_8142274(u8 taskID);
void sub_81422B8(u8 taskID);

#define tDisplayedPoke      data[1]
#define tPokesNumber        data[2]
#define tFrameCount         data[3]
#define tMonSpriteID(i)     data[i + 5]

void VBlankCB_HallOfFame(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

void sub_8141E4C(void)
{
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

bool8 sub_8141E64(void)
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

            BeginNormalPaletteFade(-1, 0, 0x10, 0, 0);
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
            SetMainCallback2(sub_8141E4C);
            PlayBGM(436);
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

void sub_8141FC4(void)
{
    if (sub_8141E64() == 0)
    {
        u8 taskID = CreateTask(sub_8141FF8, 0);
        gTasks[taskID].data[0] = 1;
    }
}

void sub_8141FF8(u8 taskID)
{
    u16 i, j;
    struct HallofFameMons* fameMons = (struct HallofFameMons*)(&ewram[0x1C000]);

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
    gUnknown_0203931C = 0;
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

void sub_814217C(u8 taskID)
{
    u16 i;
    struct HallofFameMons* fameMons = (struct HallofFameMons*)(&ewram[0x1C000]);
    struct HallofFameMons* lastSavedTeam = (struct HallofFameMons*)(&ewram[0x1E000]);

    if (gUnknown_02039324 == FALSE)
    {
        for (i = 0; i < 0x2000; i++)
            ewram[i + 0x1E000] = 0;
    }
    else
        sub_8125EC8(3);

    for (i = 0; i < 50; i++, lastSavedTeam++)
    {
        if (lastSavedTeam->mons[0].species == 0)
            break;
    }
    if (i >= 50)
    {
        struct HallofFameMons* r5 = (struct HallofFameMons*)(&ewram[0x1E000]);
        struct HallofFameMons* r6 = (struct HallofFameMons*)(&ewram[0x1E000]);
        r5++;
        for (i = 0; i < 49; i++, r6++, r5++)
        {
            *r6 = *r5;
        }
        lastSavedTeam--;
    }
    *lastSavedTeam = *fameMons;
    MenuDrawTextWindow(2, 14, 27, 19);
    MenuPrint(gMenuText_HOFSaving, 3, 15);
    gTasks[taskID].func = sub_8142274;
}

void sub_8142274(u8 taskID)
{
    gGameContinueCallback = sub_8141FC4;
    TrySavingData(3);
    PlaySE(55);
    gTasks[taskID].func = sub_81422B8;
    gTasks[taskID].tFrameCount = 32;
}

void sub_81422B8(u8 taskID)
{
    if (gTasks[taskID].tFrameCount)
        gTasks[taskID].tFrameCount--;
    else
        gTasks[taskID].func = sub_81422E8;
}

/*
#undef tDisplayedPoke
#undef tPokesNumber
#undef tFrameCount
#undef tMonSpriteID
*/
